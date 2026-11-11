#!/usr/bin/env python3
"""Neue Skriptzeilen hinter bestehende Zeilen setzen (docs/skript/*.md).

Eingabe (Datei oder stdin), Blöcke getrennt durch Leerzeilen:

    nach W2_NIL_FAE_0300
    MAX | Jahre? Ich wollte nur bis zum Abendessen zurück sein.
    FAE | Dann fahr nicht flussabwärts.

Jede neue Zeile bekommt die nächste freie Nummer der Szene (Zehnerschritte über der
höchsten vergebenen Nummer); bestehende IDs werden nie umnummeriert. Der Sprechername
kommt aus den vorhandenen Zeilen desselben Kürzels in derselben Skriptdatei, denn Kürzel wie
SCH, GRI, MUT und MUS gehören je Welt einer anderen Figur. Kennt die Datei das Kürzel noch
nicht, bricht das Werkzeug ab. Die vierte Spalte bleibt leer, die Zeile gehört damit zur
Antwort bzw. Szene davor.
"""
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKRIPT = ROOT / "docs" / "skript"
ZEILE_RE = re.compile(r"^\| ((?:[A-Z0-9]+\\_)+[A-Z0-9]+\\_\d{4}) \| ([^|]*) \|")


def esc(i):
    return i.replace("_", "\\_")


def main():
    text = (open(sys.argv[1], encoding="utf-8") if len(sys.argv) > 1 else sys.stdin).read()
    bloecke = [b.strip().splitlines() for b in re.split(r"\n\s*\n", text) if b.strip()]
    dateien = {p: p.read_text(encoding="utf-8").split("\n") for p in sorted(SKRIPT.glob("*.md"))}
    namen = {p: Counter() for p in dateien}
    for p, zeilen in dateien.items():
        for z in zeilen:
            m = ZEILE_RE.match(z)
            if m:
                kz = m.group(1).replace("\\_", "_").split("_")[-2]
                namen[p][(kz, m.group(2).strip())] += 1

    def name(p, kz):
        """Häufigster Name des Kürzels in der Zieldatei (ohne Zusätze in Klammern)."""
        k = [(n, c) for (k2, n), c in namen[p].items() if k2 == kz and "(" not in n]
        if not k:
            k = [(n, c) for (k2, n), c in namen[p].items() if k2 == kz]
        if not k:
            sys.exit(f"Kürzel {kz} kommt in {p.name} noch nicht vor: erste Zeile der Figur von Hand anlegen")
        return max(k, key=lambda x: x[1])[0]
    neu = 0
    for b in bloecke:
        ziel = b[0].split()[1]
        praefix_szene = "_".join(ziel.split("_")[:-2])
        for p, zeilen in dateien.items():
            idx = next((i for i, z in enumerate(zeilen) if z.startswith("| " + esc(ziel) + " |")), None)
            if idx is None:
                continue
            nummern = [int(m.group(1).replace("\\_", "_").rsplit("_", 1)[1]) for z in zeilen
                       if (m := ZEILE_RE.match(z)) and m.group(1).replace("\\_", "_").startswith(praefix_szene + "_")
                       and len(m.group(1).replace("\\_", "_").split("_")) == len(ziel.split("_"))]
            nr = (max(nummern) // 10 + 1) * 10
            einfuegen = []
            for zeile in b[1:]:
                kz, txt = (t.strip() for t in zeile.split("|", 1))
                zid = f"{praefix_szene}_{kz}_{nr:04d}"
                einfuegen.append(f"| {esc(zid)} | {name(p, kz)} | {txt} |  |")
                nr += 10
                neu += 1
            zeilen[idx + 1:idx + 1] = einfuegen
            break
        else:
            sys.exit(f"Zeile {ziel} nicht gefunden")
    for p, zeilen in dateien.items():
        p.write_text("\n".join(zeilen), encoding="utf-8")
    print(f"{neu} neue Zeilen")


if __name__ == "__main__":
    main()
