#!/usr/bin/env python3
"""Englische Fassung (A12): Zeilen zum Übersetzen ausgeben und Übersetzungen eintragen.

    python3 tools/en_eintragen.py --offen P0 [W1 …]   offene Zeilen mit Kontext ausgeben
    python3 tools/en_eintragen.py DATEI                Übersetzungen nach docs/uebersetzung/en.csv

Eingabe: je Zeile „ID | englischer Text“. Kaskaden behalten ihre Trennung „//“; die Zahl der
Blasen muss zum Deutschen passen, sonst wird die Zeile abgelehnt. Gespeichert wird je Blase
(Schlüssel wie in game/lokalisierung/texte.csv: ID, ID_2, ID_3 …). Vorhandene Einträge werden
überschrieben. Danach: python3 tools/skript_export.py.
"""
import csv
import io
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import skript_export  # noqa: E402

EN_CSV = skript_export.EN_CSV


def lade():
    return skript_export.lade_en()


def speichern(en):
    buf = io.StringIO()
    w = csv.writer(buf, lineterminator="\n")
    w.writerow(["keys", "en"])
    for k in sorted(en):
        w.writerow([k, en[k]])
    EN_CSV.write_text(buf.getvalue(), encoding="utf-8")


def offen(abschnitte):
    en = lade()
    for z in skript_export.zeilen_lesen():
        if z["abschnitt"] not in abschnitte:
            continue
        if all(en.get(skript_export.schluessel(z["id"], i)) for i in range(len(skript_export.blasen(z["de"])))):
            continue
        kontext = "; ".join(t for t in (z["ausloeser"], z["regie"]) if t)
        print(f"{z['id']} | {z['sprecher']} | {kontext} | {z['de']}")


def eintragen(datei):
    zeilen = {z["id"]: z for z in skript_export.zeilen_lesen()}
    en = lade()
    neu, fehler = 0, []
    for nr, roh in enumerate(Path(datei).read_text(encoding="utf-8").splitlines(), 1):
        if not roh.strip() or roh.startswith("#"):
            continue
        zid, _, text = roh.partition("|")
        zid, text = zid.strip(), text.strip()
        z = zeilen.get(zid)
        if not z:
            fehler.append(f"{nr}: {zid} gibt es nicht")
            continue
        de, en_blasen = skript_export.blasen(z["de"]), skript_export.blasen(text)
        if len(de) != len(en_blasen):
            fehler.append(f"{nr}: {zid} hat {len(de)} Blasen, Übersetzung {len(en_blasen)}")
            continue
        for i, b in enumerate(en_blasen):
            en[skript_export.schluessel(zid, i)] = b
        neu += 1
    speichern(en)
    for f in fehler:
        print("FEHLER  " + f)
    print(f"{neu} Zeilen eingetragen, {len(fehler)} abgelehnt → {EN_CSV.relative_to(skript_export.ROOT)}")
    if fehler:
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "--offen":
        offen(set(sys.argv[2:]))
    elif len(sys.argv) == 2:
        eintragen(sys.argv[1])
    else:
        print(__doc__)
        sys.exit(2)
