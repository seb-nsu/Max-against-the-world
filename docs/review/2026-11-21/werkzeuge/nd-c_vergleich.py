# -*- coding: utf-8 -*-
"""nd-c: Vergleicht zwei Fassungen von texte.csv für Präfixe (Standard W3_,ZS3_):
welche Zeilen kamen dazu/weg, wo wurde DE geändert, wo EN, wo nur eins von beiden."""
import csv, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
def lade(p):
    d = {}
    with open(p, encoding="utf-8", newline="") as f:
        r = csv.reader(f); next(r)
        for z in r:
            if z: d[z[0]] = (z[1], z[2] if len(z) > 2 else "")
    return d
alt, neu = lade(sys.argv[1]), lade(sys.argv[2])
pre = tuple((sys.argv[3] if len(sys.argv) > 3 else "W3_,ZS3_").split(","))
modus = sys.argv[4] if len(sys.argv) > 4 else "zahlen"
ka = {k for k in alt if k.startswith(pre)}; kn = {k for k in neu if k.startswith(pre)}
neu_k = sorted(kn - ka); weg_k = sorted(ka - kn)
de_only, en_only, beide = [], [], []
for k in sorted(ka & kn):
    a, n = alt[k], neu[k]
    d, e = a[0] != n[0], a[1] != n[1]
    if d and e: beide.append(k)
    elif d: de_only.append(k)
    elif e: en_only.append(k)
print(f"alt {len(ka)}, neu {len(kn)}; neu dazu {len(neu_k)}, entfallen {len(weg_k)}; DE+EN geändert {len(beide)}, nur DE {len(de_only)}, nur EN {len(en_only)}")
def zeig(ks, titel):
    print(f"\n## {titel} ({len(ks)})")
    for k in ks:
        if k in alt: print(f"{k}\n  ALT DE: {alt[k][0]}\n  ALT EN: {alt[k][1]}")
        if k in neu: print(f"{k if k not in alt else ''}  NEU DE: {neu[k][0]}\n  NEU EN: {neu[k][1]}")
if modus == "nurde": zeig(de_only, "nur DE geändert")
elif modus == "nuren": zeig(en_only, "nur EN geändert")
elif modus == "weg": zeig(weg_k, "entfallen")
elif modus == "neu": zeig(neu_k, "neu")
elif modus == "beide": zeig(beide, "DE und EN geändert")
