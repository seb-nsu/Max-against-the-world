# -*- coding: utf-8 -*-
"""nd-c: Auszug der Zeilen W3_/ZS3_ aus texte.csv als lesbare Liste (nur lesen)."""
import csv, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
pfad = "game/lokalisierung/texte.csv"
praefixe = tuple(sys.argv[1].split(",")) if len(sys.argv) > 1 else ("W3_", "ZS3_")
spalte = sys.argv[2] if len(sys.argv) > 2 else "beide"
with open(pfad, encoding="utf-8", newline="") as f:
    r = csv.reader(f)
    kopf = next(r)
    for z in r:
        if not z or not z[0].startswith(praefixe):
            continue
        k, de, en = z[0], z[1], z[2] if len(z) > 2 else ""
        if spalte == "de":
            print(f"{k} | {de}")
        elif spalte == "en":
            print(f"{k} | {en}")
        else:
            print(f"{k}\n  DE: {de}\n  EN: {en}")
