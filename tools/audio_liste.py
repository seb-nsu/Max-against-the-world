#!/usr/bin/env python3
"""Audio-Liste: Welche Klänge braucht das Spiel, welche Dateien liegen schon da?

Das Audio-Gerüst (game/skripte/klang.gd, Autoload „Klang“) ruft jeden Klang über eine ID auf.
Liegt die Datei im Ordner, spielt sie; fehlt sie, bleibt es still. Diese Liste zeigt den Stand.
Gezählt wird nur, was das Spiel wirklich aufruft:

  Musik      Feld „musik“ der Räume in docs/welten/*.yaml, Klang.musik("…") im Code und die
             Tabelle MUSIK in game/skripte/klang_einsatz.gd
  Jingles    Klang.jingle("…") im Code und Einträge „jingle/<id>“ in klang_einsatz.gd
  Geräusche  Klang.geraeusch("…") und Klang.atmo("…") im Code, die Felder „atmo“ und „tupfer“
             der Räume und die Tabellen in klang_einsatz.gd (Zeilen, Laute, Objekte,
             Gegenstände, Schritte)
  Stimmen    eine Datei je Sprechblase (export/audio-zeilen.csv aus tools/skript_export.py),
             Ordner game/audio/stimmen/<sprache>/

Dateinamen: <id>.ogg (auch .wav oder .mp3) in game/audio/{musik,jingles,geraeusche}/.

Aufruf:
  python3 tools/audio_liste.py              schreibt export/audio-stand.csv, Zusammenfassung
  python3 tools/audio_liste.py --pruefen    zusätzlich Fehler (Ende mit Code 1):
                                            - Dateien ohne passende ID (Tippfehler im Namen)
                                            - Kennung aus docs/04-audio.md (Geräusche, Musik,
                                              Jingles), die das Spiel nirgends aufruft
                                            - ID im Spiel, die in 04-audio.md fehlt
                                            - Zeilen-ID in klang_einsatz.gd, die es im Skript
                                              nicht gibt
"""
import csv
import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
GAME = ROOT / "game"
AUDIO = GAME / "audio"
EXPORT = ROOT / "export"
ENDUNGEN = (".ogg", ".wav", ".mp3")
ORDNER = {"musik": "musik", "jingle": "jingles", "geraeusch": "geraeusche"}
SPRACHEN = ("de", "en")


EINSATZ = GAME / "skripte" / "klang_einsatz.gd"
EFFEKTE = GAME / "skripte" / "effekte.gd"
AUDIO_DOKU = ROOT / "docs" / "04-audio.md"
TEXTE = GAME / "lokalisierung" / "texte.csv"
# Kennungen ohne Datei: kein Stück, keine Atmosphäre, zurück zum Raum-Stück
OHNE_DATEI = {"stille", "keine", "raum"}
# Tabellen in klang_einsatz.gd: Name → Art der Werte
TABELLEN = {"ZEILE": "geraeusch", "LAUT": "geraeusch", "LAUT_DAZU": "geraeusch",
            "OBJEKT": "geraeusch", "GEGENSTAND": "geraeusch", "SCHRITT_MAX": "geraeusch",
            "SCHRITT_PIXEL": "geraeusch", "MUSIK": "musik"}
# Tabellen, deren Schlüssel Zeilen-IDs des Skripts sind
ZEILEN_TABELLEN = ("ZEILE", "MUSIK")


def einsatz_tabellen() -> dict[str, list[tuple[str, str]]]:
    """{Tabelle: [(Schlüssel, Wert), …]} aus game/skripte/klang_einsatz.gd"""
    text = EINSATZ.read_text(encoding="utf-8")
    out = {}
    for name in TABELLEN:
        m = re.search(r"^const " + name + r" := \{(.*?)^\}", text, re.S | re.M)
        if not m:
            raise SystemExit(f"klang_einsatz.gd: Tabelle {name} nicht gefunden")
        out[name] = re.findall(r'"([^"]+)":\s*"([^"]+)"', m.group(1))
    return out


def zeilen_liste(datei: Path, name: str) -> list[str]:
    """Zeilen-IDs einer Liste oder Tabelle, die keine Klänge nennt: LIED (gesungene Zeilen,
    klang_einsatz.gd) und WACKELN (Bildschirmwackeln je Zeile, effekte.gd)."""
    text = datei.read_text(encoding="utf-8")
    m = re.search(r"^const " + name + r" := [\[{](.*?)^[\]}]", text, re.S | re.M)
    if not m:
        raise SystemExit(f"{datei.name}: {name} nicht gefunden")
    return re.findall(r'"([A-Z0-9]+_[A-Z0-9]+_[A-Z0-9]+_\d+)"', m.group(1))


def gebraucht() -> list[tuple[str, str, str]]:
    """[(art, id, verwendung), …]"""
    eintraege: dict[tuple[str, str], list[str]] = {}

    def merken(art, id_, wo):
        if id_.startswith("jingle/"):
            art, id_ = "jingle", id_.removeprefix("jingle/")
        if id_ not in OHNE_DATEI:
            eintraege.setdefault((art, id_), []).append(wo)

    for datei in sorted((ROOT / "docs" / "welten").glob("*.yaml")):
        daten = yaml.safe_load(datei.read_text(encoding="utf-8")) or {}
        for raum in daten.get("raeume", []) or []:
            if raum.get("musik"):
                merken("musik", str(raum["musik"]), f"Raum {raum.get('id')}")
            for feld in ("atmo", "tupfer"):
                if raum.get(feld):
                    merken("geraeusch", str(raum[feld]), f"Raum {raum.get('id')} ({feld})")
    for gd in sorted(GAME.rglob("*.gd")):
        if "addons" in gd.parts or "tests" in gd.parts:
            continue
        text = gd.read_text(encoding="utf-8")
        for aufruf, art in (("musik", "musik"), ("jingle", "jingle"), ("geraeusch", "geraeusch"),
                            ("atmo", "geraeusch")):
            for id_ in re.findall(r'Klang\.' + aufruf + r'\("([^"]+)"', text):
                merken(art, id_, gd.relative_to(GAME).as_posix())
    for name, paare in einsatz_tabellen().items():
        for _schluessel, wert in paare:
            merken(TABELLEN[name], wert, f"klang_einsatz.gd {name}")
    return [(a, i, ", ".join(sorted(set(w)))) for (a, i), w in sorted(eintraege.items())]


def doku_ids() -> dict[str, set[str]]:
    """IDs aus docs/04-audio.md: Musik (Tabellen mit Spalte ID), Geräusche (Spalte Kennung),
    Jingles (Zeile „Jingles“ der Tabelle „Im Spiel: Dateien und IDs“)."""
    out = {"musik": set(), "geraeusch": set(), "jingle": set()}
    kopf = []
    for zeile in AUDIO_DOKU.read_text(encoding="utf-8").splitlines():
        if not zeile.startswith("|"):
            kopf = []
            continue
        zellen = [z.strip() for z in zeile.strip().strip("|").split("|")]
        if not kopf:
            kopf = zellen
            continue
        if set(zellen[0]) <= set("-: "):
            continue
        erste = zellen[0].strip("`")
        if kopf[0] == "ID":
            out["musik"].add(erste)
        elif kopf[0] == "Kennung":
            out["geraeusch"].add(erste)
        elif kopf[0] == "Art" and erste == "Jingles" and len(zellen) > 2:
            out["jingle"] |= set(re.findall(r"`([a-z0-9_]+)`", zellen[2]))
    return out


def skript_zeilen() -> set[str]:
    with TEXTE.open(encoding="utf-8") as f:
        return {z["keys"] for z in csv.DictReader(f)}


def abgleich(zeilen: list) -> list[str]:
    """Fehler zwischen 04-audio.md, dem Spiel und dem Skript."""
    fehler = []
    doku = doku_ids()
    im_spiel = {art: {z[1] for z in zeilen if z[0] == art} for art in ORDNER}
    worte = {"musik": "Musik-ID", "geraeusch": "Geräusch-Kennung", "jingle": "Jingle"}
    for art in ORDNER:
        for id_ in sorted(doku[art] - im_spiel[art]):
            if art == "geraeusch" and id_ in doku["jingle"]:
                continue  # die Lachkonserve steht als Geräusch in der Welt-Tabelle und ist ein Jingle
            fehler.append(f"docs/04-audio.md: {worte[art]} {id_} ruft das Spiel nirgends auf")
        for id_ in sorted(im_spiel[art] - doku[art]):
            fehler.append(f"{worte[art]} {id_} wird im Spiel gebraucht und fehlt in docs/04-audio.md")
    skript = skript_zeilen()
    for name in ZEILEN_TABELLEN:
        for schluessel, _wert in einsatz_tabellen()[name]:
            if schluessel not in skript:
                fehler.append(f"klang_einsatz.gd {name}: Zeile {schluessel} gibt es im Skript nicht")
    for datei, name in ((EINSATZ, "LIED"), (EFFEKTE, "WACKELN")):
        for schluessel in zeilen_liste(datei, name):
            if schluessel not in skript:
                fehler.append(f"{datei.name} {name}: Zeile {schluessel} gibt es im Skript nicht")
    return fehler


def stimmen() -> list[tuple[str, str]]:
    """[(id, sprecher), …] aus export/audio-zeilen.csv"""
    pfad = EXPORT / "audio-zeilen.csv"
    if not pfad.exists():
        print("Hinweis: export/audio-zeilen.csv fehlt, erst tools/skript_export.py laufen lassen.")
        return []
    with pfad.open(encoding="utf-8") as f:
        return [(Path(z["Datei"]).stem, z["Sprecher"]) for z in csv.DictReader(f)]


def vorhanden(ordner: Path) -> dict[str, Path]:
    if not ordner.is_dir():
        return {}
    return {p.stem: p for p in ordner.iterdir() if p.suffix.lower() in ENDUNGEN}


def main() -> int:
    pruefen = "--pruefen" in sys.argv
    zeilen = []
    zahlen = {}
    fehler = []
    for art, id_, wo in gebraucht():
        da = vorhanden(AUDIO / ORDNER[art])
        zeilen.append([art, id_, wo, "ja" if id_ in da else "nein"])
        z = zahlen.setdefault(art, [0, 0])
        z[0] += 1
        z[1] += id_ in da
    ids = {art: {z[1] for z in zeilen if z[0] == art} for art in ORDNER}
    for art, unter in ORDNER.items():
        for stem, p in vorhanden(AUDIO / unter).items():
            if stem not in ids[art]:
                fehler.append(f"{p.relative_to(ROOT)}: keine {art}-ID dieses Namens")
    fehler.extend(abgleich(zeilen))

    sz = stimmen()
    stimm_ids = {i for i, _ in sz}
    for sprache in SPRACHEN:
        da = vorhanden(AUDIO / "stimmen" / sprache)
        zahlen[f"stimme ({sprache})"] = [len(sz), len(stimm_ids & set(da))]
        for stem, p in da.items():
            if sz and stem not in stimm_ids:
                fehler.append(f"{p.relative_to(ROOT)}: keine Sprechblase dieses Namens")

    EXPORT.mkdir(exist_ok=True)
    with (EXPORT / "audio-stand.csv").open("w", encoding="utf-8", newline="") as f:
        w = csv.writer(f, lineterminator="\n")
        w.writerow(["Art", "ID", "Verwendung", "Datei da"])
        w.writerows(zeilen)
    print("Audio-Stand (gebraucht / vorhanden):")
    for art, (n, da) in zahlen.items():
        print(f"  {art:14} {n:5} / {da}")
    print("geschrieben: export/audio-stand.csv (Stimmen: export/audio-zeilen.csv)")
    if fehler:
        print(f"\n{len(fehler)} Fehler:")
        for f_ in fehler:
            print("  " + f_)
    return 1 if pruefen and fehler else 0


if __name__ == "__main__":
    sys.exit(main())
