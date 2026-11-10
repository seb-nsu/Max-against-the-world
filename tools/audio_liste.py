#!/usr/bin/env python3
"""Audio-Liste: Welche Klänge braucht das Spiel, welche Dateien liegen schon da?

Das Audio-Gerüst (game/skripte/klang.gd, Autoload „Klang“) ruft jeden Klang über eine ID auf.
Liegt die Datei im Ordner, spielt sie; fehlt sie, bleibt es still. Diese Liste zeigt den Stand:

  Musik      Feld „musik“ der Räume in docs/welten/*.yaml und Klang.musik("…") im Code
  Jingles    Klang.JINGLES
  Geräusche  Klang.GERAEUSCHE
  Stimmen    eine Datei je Sprechblase (export/audio-zeilen.csv aus tools/skript_export.py),
             Ordner game/audio/stimmen/<sprache>/

Dateinamen: <id>.ogg (auch .wav oder .mp3) in game/audio/{musik,jingles,geraeusche}/.

Aufruf:
  python3 tools/audio_liste.py              schreibt export/audio-stand.csv, Zusammenfassung
  python3 tools/audio_liste.py --pruefen    zusätzlich: Dateien ohne passende ID sind Fehler
                                            (Tippfehler im Namen), Ende mit Code 1
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
KLANG = GAME / "skripte" / "klang.gd"
ENDUNGEN = (".ogg", ".wav", ".mp3")
ORDNER = {"musik": "musik", "jingle": "jingles", "geraeusch": "geraeusche"}
SPRACHEN = ("de", "en")


def _liste(name: str, quelltext: str) -> list[str]:
    m = re.search(name + r"\s*:=\s*\[(.*?)\]", quelltext, re.S)
    return re.findall(r'"([^"]+)"', m.group(1)) if m else []


def gebraucht() -> list[tuple[str, str, str]]:
    """[(art, id, verwendung), …]"""
    eintraege: dict[tuple[str, str], list[str]] = {}

    def merken(art, id_, wo):
        eintraege.setdefault((art, id_), []).append(wo)

    for datei in sorted((ROOT / "docs" / "welten").glob("*.yaml")):
        daten = yaml.safe_load(datei.read_text(encoding="utf-8")) or {}
        for raum in daten.get("raeume", []) or []:
            if raum.get("musik"):
                merken("musik", str(raum["musik"]), f"Raum {raum.get('id')}")
    for gd in sorted(GAME.rglob("*.gd")):
        if "addons" in gd.parts:
            continue
        text = gd.read_text(encoding="utf-8")
        for art in ("musik", "jingle", "geraeusch"):
            for id_ in re.findall(r'Klang\.' + art + r'\("([^"]+)"\)', text):
                merken(art, id_, gd.relative_to(GAME).as_posix())
    quelle = KLANG.read_text(encoding="utf-8")
    for id_ in _liste("JINGLES", quelle):
        merken("jingle", id_, "Klang.JINGLES")
    for id_ in _liste("GERAEUSCHE", quelle):
        merken("geraeusch", id_, "Klang.GERAEUSCHE")
    return [(a, i, ", ".join(sorted(set(w)))) for (a, i), w in sorted(eintraege.items())]


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
        print(f"\n{len(fehler)} Datei(en) ohne passende ID:")
        for f_ in fehler:
            print("  " + f_)
    return 1 if pruefen and fehler else 0


if __name__ == "__main__":
    sys.exit(main())
