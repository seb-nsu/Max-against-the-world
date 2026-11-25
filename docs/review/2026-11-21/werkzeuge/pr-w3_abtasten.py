#!/usr/bin/env python3
"""Raum abtasten über die Fernsteuerung (pr-w3): jedes Objekt ansehen (rklick) und, bei Hotspots, benutzen (klick).
Aufruf: pr-w3_abtasten.py LAUFORDNER STAND [lauf_y] [figur]
Lädt den Kontrollpunkt STAND, geht den Raum in bis zu vier Kamerastellungen durch und schreibt je Objekt die
gesagten Zeilen-IDs; Ersatzzeilen (SYS_ERS_) werden gezählt. Überlagerungen schließt Esc, Menüs die letzte Option.
Nur echte Klicks; nichts wird im Code ausgelöst."""
import subprocess, sys, re
FS = "/home/user/Max-against-the-world/docs/review/2026-11-21/werkzeuge/cloud/fs"
lauf, stand = sys.argv[1], sys.argv[2]
lauf_y = sys.argv[3] if len(sys.argv) > 3 else "335"
figur = sys.argv[4] if len(sys.argv) > 4 else "max"

def fs(*bef):
    return subprocess.run([FS, lauf, *bef], capture_output=True, text=True).stdout

def lage():
    m = re.findall(r"^LAGE (\S+)", fs("status"), re.M)
    return m[-1] if m else "?"

def raum():
    m = re.findall(r"^LAGE \S+ \| Raum (\S+)", fs("status"), re.M)
    return m[-1] if m else "?"

def aufraeumen():
    for _ in range(4):
        l = lage()
        if l == "frei":
            return True
        if l.startswith("ueberlagerung") or l == "pause":
            fs("taste esc")
        elif l == "menue":
            o = fs("optionen")
            n = len(re.findall(r"^\s+\d+\s+\[", o, re.M))
            fs("option %d" % n, "warte")
        else:
            fs("warte")
    return lage() == "frei"

print("#####", stand, figur)
fs("stand holen " + stand, "warte")
if figur == "pixel":
    fs("portraet pixel", "warte")
erledigt, ersatz = set(), []
start_raum = raum()
print("Raum:", start_raum)
for stellung in range(4):
    o = fs("objekte")
    for z in o.splitlines():
        m = re.match(r"\s+@(\S+)\s+(\S+)\s+„(.*?)“\s+x (-?\d+)–(-?\d+), y (-?\d+)–(-?\d+)(.*)", z)
        if not m:
            continue
        oid, art, name, x1, x2, y1, y2, rest = m.groups()
        if oid in erledigt or "außerhalb" in rest or "nicht anklickbar" in rest or "unsichtbar" in rest or "Spielfigur" in rest:
            continue
        if int(x1) < 0 or int(x2) > 640:
            continue
        erledigt.add(oid)
        arten = ["rklick"] + (["klick"] if art == "Hotspot" else [])
        for a in arten:
            aus = fs("%s @%s" % (a, oid), "warte")
            ids = re.findall(r"SAGT (\S+)", aus)
            ziel = re.search(r"gewinnt an (\d+) von (\d+) Probestellen( \(sonst: [^)]*\))?", aus)
            lag = re.findall(r"^LAGE (\S+) \| Raum (\S+) \| (\S+ \(\d+,\d+\))", aus, re.M)
            fehler = re.findall(r"^FEHLER.*", aus, re.M)
            zus = re.findall(r"\] (ZUSTAND \S+ = \S+|INVENTAR [+-] \S+|RAUM \S+)", aus)
            print("%-6s %-34s %-8s %s | %s | %s%s%s" % (a, oid, art, " ".join(ids) or "-", lag[-1][2] if lag else "?",
                  ("%s/%s%s" % (ziel.group(1), ziel.group(2), ziel.group(3) or "")) if ziel else "",
                  (" | " + "; ".join(zus)) if zus else "", (" | " + fehler[0][:110]) if fehler else ""))
            ersatz += [(oid, a, i) for i in ids if i.startswith("SYS_ERS")]
            if not aufraeumen():
                print("ABBRUCH: Lage nicht frei nach", a, oid, lage()); sys.exit(1)
            if raum() != start_raum:
                print("ABBRUCH: Raum gewechselt nach", a, oid, "->", raum()); sys.exit(1)
    # weiter nach rechts laufen
    vor = re.search(r"Kamera x=(-?\d+)", o)
    fs("klick 630 " + lauf_y, "warte", "klick 630 " + lauf_y, "warte")
    nach = re.search(r"Kamera x=(-?\d+)", fs("objekte"))
    if not vor or not nach or vor.group(1) == nach.group(1):
        break
print("Objekte:", len(erledigt), "| Ersatzzeilen:", len(ersatz))
for e in ersatz:
    print("  ERSATZ", *e)
