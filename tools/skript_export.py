#!/usr/bin/env python3
"""Skript-Pipeline (A1): Skript-Tabellen → Godot-Übersetzungs-CSV, volle Skript-CSV, Audio-Zeilenliste.

Aufruf aus dem Repo-Wurzelverzeichnis:
  python3 tools/skript_export.py            # schreibt alle Ausgaben
  python3 tools/skript_export.py --pruefen  # exit 1, wenn game/lokalisierung/texte.csv veraltet ist

Quellen (Besitzer, siehe docs/00-aufbau.md):
  docs/skript/*.md            deutscher Wortlaut, Zeilen-IDs, Regie/Auslöser
  docs/uebersetzung/en.csv    englischer Wortlaut je Schlüssel (keys,en)
  docs/uebersetzung/ui.csv    Menü- und Systemtexte (keys,de,en)

Ausgaben:
  game/lokalisierung/texte.csv   Godot-Übersetzungsdatei (keys,de,en), wird eingecheckt
  export/skript-voll.csv         alle zehn Spalten aus 05-spielsysteme.md (für Übersetzung und Prüfung)
  export/audio-zeilen.csv        eine Zeile je Sprechblase und Datei (ohne NAR), für Vertonung/A6

Kaskaden: Eine Skriptzeile mit „//“ wird in Sprechblasen geteilt. Die erste Blase
behält die Zeilen-ID, jede weitere bekommt _2, _3 … angehängt (P0_DACH_PIX_0020_2).
"""
import csv
import io
import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
SKRIPTE = [
    ("prolog", "skript/prolog.md"),
    ("welt-1", "skript/welt-1.md"),
    ("welt-2", "skript/welt-2.md"),
    ("welt-3", "skript/welt-3.md"),
    ("welt-4", "skript/welt-4.md"),
    ("finale", "skript/zwischenspiele-und-finale.md"),
]
GODOT_CSV = ROOT / "game" / "lokalisierung" / "texte.csv"
EN_CSV = DOCS / "uebersetzung" / "en.csv"
UI_CSV = DOCS / "uebersetzung" / "ui.csv"
EXPORT = ROOT / "export"
ZEILE_RE = re.compile(r"^([A-Z]+[0-9]?)_([A-Z0-9]+)_([A-Z0-9]+)_(\d{4})$")


def entmaskieren(text):
    """Markdown-Maskierungen der Tabellen entfernen (\\_ \\* \\|)."""
    return re.sub(r"\\([_*|\[\]#`])", r"\1", text).strip()


def zeilen_lesen():
    """Liefert alle Skriptzeilen als Dicts in Dateireihenfolge."""
    alle = []
    for ab, rel in SKRIPTE:
        d = yaml.safe_load((DOCS / "welten" / f"{ab}.yaml").read_text(encoding="utf-8"))
        namen = {f.get("kuerzel"): f.get("name") for f in d.get("figuren") or [] if f.get("kuerzel")}
        spalte4, abschnitt_titel = "Auslöser", ""
        for nr, z in enumerate((DOCS / rel).read_text(encoding="utf-8").splitlines(), 1):
            if z.startswith("#"):
                abschnitt_titel = z.lstrip("#").strip()
                continue
            if z.startswith("| ID |"):
                kopf = [c.strip() for c in z.strip().strip("|").split("|")]
                spalte4 = kopf[3] if len(kopf) > 3 else ""
                continue
            if not z.startswith("| ") or z.startswith("| ---"):
                continue
            zellen = [c.strip() for c in re.split(r"(?<!\\)\|", z.strip().strip("|"))]
            zid = entmaskieren(zellen[0])
            m = ZEILE_RE.match(zid)
            if not m:
                continue
            praef, szene, kz, _ = m.groups()
            text = entmaskieren(zellen[2]) if len(zellen) > 2 else ""
            letzte = entmaskieren(zellen[3]) if len(zellen) > 3 else ""
            regie = ausloeser = bedingung = ""
            if spalte4.startswith("Regie") and not spalte4.startswith("Regie oder"):
                regie = letzte
            else:
                ausloeser = letzte
                if ";" in letzte:
                    ausloeser, bedingung = (t.strip() for t in letzte.split(";", 1))
            if szene == "HINT":
                art = "Hinweis"
            elif szene == "ERS":
                art = "Ersatz"
            elif ausloeser and ":" in ausloeser:
                art = ausloeser.split(":", 1)[0].strip()
            elif regie or spalte4.startswith("Regie"):
                art = "Szene"
            else:
                art = "Dialog"
            alle.append({
                "id": zid, "abschnitt": praef, "szene": szene, "art": art,
                "ausloeser": ausloeser, "bedingung": bedingung, "sprecher": kz,
                "sprecher_name": namen.get(kz, "Erzähler" if kz == "NAR" else ""),
                "de": text, "regie": regie, "quelle": f"docs/{rel}:{nr}",
                "kapitel": abschnitt_titel,
            })
    return alle


def blasen(text):
    return [t.strip() for t in text.split("//") if t.strip()] or [""]


def schluessel(zid, i):
    return zid if i == 0 else f"{zid}_{i + 1}"


def csv_text(kopf, zeilen):
    buf = io.StringIO()
    w = csv.writer(buf, lineterminator="\n")
    w.writerow(kopf)
    w.writerows(zeilen)
    return buf.getvalue()


def lade_en():
    en = {}
    if EN_CSV.exists():
        for r in csv.DictReader(EN_CSV.open(encoding="utf-8")):
            if r.get("keys"):
                en[r["keys"]] = r.get("en", "")
    return en


def godot_csv(alle):
    en = lade_en()
    zeilen = []
    if UI_CSV.exists():
        for r in csv.DictReader(UI_CSV.open(encoding="utf-8")):
            if r.get("keys"):
                zeilen.append([r["keys"], r.get("de", ""), r.get("en", "")])
    for z in alle:
        for i, b in enumerate(blasen(z["de"])):
            k = schluessel(z["id"], i)
            zeilen.append([k, b, en.get(k, "")])
    return csv_text(["keys", "de", "en"], zeilen)


def main():
    alle = zeilen_lesen()
    neu = godot_csv(alle)
    if "--pruefen" in sys.argv:
        alt = GODOT_CSV.read_text(encoding="utf-8") if GODOT_CSV.exists() else ""
        if alt != neu:
            print("game/lokalisierung/texte.csv ist veraltet: python3 tools/skript_export.py ausführen")
            sys.exit(1)
        return
    GODOT_CSV.parent.mkdir(parents=True, exist_ok=True)
    GODOT_CSV.write_text(neu, encoding="utf-8")

    EXPORT.mkdir(exist_ok=True)
    en = lade_en()
    voll = [[z["id"], z["art"], z["ausloeser"], z["bedingung"], z["sprecher"], z["de"],
             " // ".join(en.get(schluessel(z["id"], i), "") for i in range(len(blasen(z["de"])))).strip(" /"),
             z["regie"], "Entwurf", z["quelle"]] for z in alle]
    (EXPORT / "skript-voll.csv").write_text(csv_text(
        ["ID", "Art", "Auslöser", "Bedingung", "Sprecher", "Text DE", "Text EN", "Regie", "Status", "Quelle"], voll),
        encoding="utf-8")

    audio = []
    for z in alle:
        if z["sprecher"] == "NAR":
            continue
        for i, b in enumerate(blasen(z["de"])):
            k = schluessel(z["id"], i)
            audio.append([f"{k}.ogg", z["abschnitt"], z["sprecher"], z["sprecher_name"], b, z["regie"]])
    (EXPORT / "audio-zeilen.csv").write_text(csv_text(
        ["Datei", "Abschnitt", "Kürzel", "Sprecher", "Text", "Regie"], audio), encoding="utf-8")

    n_blasen = sum(len(blasen(z["de"])) for z in alle)
    print(f"{len(alle)} Skriptzeilen, {n_blasen} Sprechblasen, {len(audio)} Audiodateien")
    print(f"geschrieben: {GODOT_CSV.relative_to(ROOT)}, export/skript-voll.csv, export/audio-zeilen.csv")


if __name__ == "__main__":
    main()
