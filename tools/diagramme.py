#!/usr/bin/env python3
"""Erzeugt docs/raetsel/abhaengigkeiten.md aus den Welt-Tabellen.

Aufruf aus dem Repo-Wurzelverzeichnis:  python3 tools/diagramme.py [--pruefen]

Für jeden Abschnitt ein Mermaid-Diagramm (GitHub zeigt es direkt an):
  - Kästen sind Rätsel, gestrichelte Kästen freiwillige Rätsel.
  - Pfeil A --> B: B braucht A (Rätsel) oder einen Gegenstand, den A ergibt.
  - Gestrichelter Pfeil: einer von mehreren möglichen Wegen (benoetigt_eins_von).
  - Runde Kästen sind Räume, die ein Rätsel freischaltet.
Die Datei wird nicht von Hand bearbeitet. Mit --pruefen gibt das Skript
exit 1 zurück, wenn die Datei nicht zum Stand der Tabellen passt.
"""
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
ZIEL = DOCS / "raetsel" / "abhaengigkeiten.md"
ABSCHNITTE = ["prolog", "welt-1", "welt-2", "welt-3", "welt-4", "finale"]


def liste(x):
    if x is None:
        return []
    return x if isinstance(x, list) else [x]


def text(s):
    return str(s).replace('"', "'")


def diagramm(d):
    raetsel = {r["id"]: r for r in d.get("raetsel") or []}
    gegen = {g["id"]: g for g in d.get("gegenstaende") or []}
    z = ["```mermaid", "flowchart TD"]
    for rid, r in raetsel.items():
        if r.get("optional"):
            z.append(f'  {rid}["{rid} {text(r.get("name", ""))}<br/>(freiwillig)"]:::frei')
        else:
            z.append(f'  {rid}["{rid} {text(r.get("name", ""))}"]')
    kanten = set()

    def quelle(b):
        if b in raetsel:
            return b, None
        g = gegen.get(b)
        if g and g.get("herkunft") in raetsel:
            return g["herkunft"], g.get("name", b)
        return None, None

    for rid, r in raetsel.items():
        for art, pfeil in (("benoetigt", "-->"), ("benoetigt_eins_von", "-.->")):
            for b in liste(r.get(art)):
                q, beschr = quelle(b)
                if q is None or q == rid:
                    continue
                k = (q, rid, pfeil, beschr)
                if k in kanten:
                    continue
                kanten.add(k)
                if beschr:
                    z.append(f'  {q} {pfeil}|"{text(beschr)}"| {rid}')
                else:
                    z.append(f"  {q} {pfeil} {rid}")
    for raum in d.get("raeume") or []:
        e = raum.get("erreichbar_ab")
        if e in raetsel:
            nid = "raum_" + raum["id"]
            z.append(f'  {nid}(["{text(raum.get("name", raum["id"]))}"])')
            z.append(f"  {e} ==> {nid}")
    z.append("  classDef frei stroke-dasharray: 5 5")
    z.append("```")
    return "\n".join(z)


def erzeugen():
    teile = [
        "# Rätsel-Abhängigkeiten",
        "",
        "Automatisch erzeugt aus den Welt-Tabellen (`docs/welten/*.yaml`) mit `python3 tools/diagramme.py`; nicht von Hand bearbeiten. "
        "Pfeil A → B: B braucht A oder einen Gegenstand, den A ergibt (beschriftet). Gestrichelter Pfeil: einer von mehreren Wegen. "
        "Gestrichelter Kasten: freiwilliges Rätsel. Doppelpfeil zu einem runden Kasten: das Rätsel öffnet diesen Raum. "
        "Gegenstände, die frei in Räumen liegen, sind nicht eingezeichnet; sie stehen in der Welt-Tabelle.",
    ]
    for ab in ABSCHNITTE:
        p = DOCS / "welten" / f"{ab}.yaml"
        if not p.exists():
            continue
        d = yaml.safe_load(p.read_text(encoding="utf-8")) or {}
        teile += ["", f"## {d.get('name', ab)} ({ab})", "", diagramm(d)]
    return "\n".join(teile) + "\n"


def main():
    neu = erzeugen()
    if "--pruefen" in sys.argv:
        alt = ZIEL.read_text(encoding="utf-8") if ZIEL.exists() else ""
        if alt != neu:
            print("docs/raetsel/abhaengigkeiten.md ist veraltet: python3 tools/diagramme.py ausführen")
            sys.exit(1)
        return
    ZIEL.write_text(neu, encoding="utf-8")
    print(f"geschrieben: {ZIEL.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
