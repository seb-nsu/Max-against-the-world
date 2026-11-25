#!/bin/bash
# Kompakter Aufruf pr-w3: pr-w3_k.sh [-l LAUF] befehle...  (SAGT gekürzt, Klickzeilen weg; CUT=Zeichen je Zeile)
# Vorlage: k.sh von pr-w2. Läufe liegen unter /home/user/lauf/pr-w3-LAUF.
LAUF=haupt
if [ "$1" = "-l" ]; then LAUF="$2"; shift 2; fi
cd /home/user/Max-against-the-world
docs/review/2026-11-21/werkzeuge/cloud/fs /home/user/lauf/pr-w3-$LAUF "$@" 2>&1 | python3 -c '
import sys,re,os
cut=int(os.environ.get("CUT","120"))
for z in sys.stdin:
    z=z.rstrip("\n")
    if not z.strip(): continue
    if re.match(r"^(KLICK|RKLICK|GEGENSTAND|Gesetzte Schalter|Werte:|Raumbreite|Wechsel m|Abschnitt)",z) and not os.environ.get("ALLES"): continue
    if re.search(r"\] (OPTION|GESPEICHERT|LÄUFT)",z) and not os.environ.get("ALLES"): continue
    if z.startswith("ZIEL "):
        m=re.search(r"gewinnt an (\d+) von (\d+) Probestellen(.*)",z)
        if m and int(m.group(1))>=24: continue
        if m: z="ZIEL "+z.split(" ")[1]+" gewinnt "+m.group(1)+"/"+m.group(2)+m.group(3)
    z=re.sub(r"^LAGE (\S+) \| Raum (\S+) \| (.*?) \| Kamera x=(-?\d+) \| Hand: (\S+)( \| Dauer [\d.]+ s)?",r"LAGE \1 | \2 | \3 | K\4 | H:\5",z)
    z=re.sub(r"^\[\s*([\d.]+)\] SAGT (\S+) \| (\w+): ",r"[\1] \2 ",z)
    z=re.sub(r" Skala [\d.]+","",z)
    print(z[:cut])
'
