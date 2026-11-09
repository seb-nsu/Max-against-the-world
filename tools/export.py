#!/usr/bin/env python3
"""Fasst die Dokumente pro Bereich zu je einer Markdown-Datei zusammen.

Aufruf aus dem Repo-Wurzelverzeichnis:  python3 tools/export.py [Zielordner]
Standard-Zielordner: export/ (nicht im Repo eingecheckt).

Jede Datei bekommt ein Inhaltsverzeichnis; die Überschriften der Quelldateien
werden eine Ebene tiefer gesetzt, damit jede Quelle ein eigenes Kapitel ist.
Welt-Tabellen (YAML) werden als Codeblock angehängt.
"""
import datetime
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"

BEREICHE = [
    ("01-konzept", "Konzept", ["00-aufbau.md", "01-konzept.md"]),
    ("02-grafik", "Grafik", ["grafik/00-stil-und-werkzeuge.md", "grafik/01-max-und-pixel.md",
                             "grafik/02-prolog-und-finale.md", "grafik/welt-1.md", "grafik/welt-2.md",
                             "grafik/welt-3.md", "grafik/welt-4.md"]),
    ("03-raetsel", "Rätsel und Welt-Tabellen", ["raetsel/prolog-und-welt-1.md", "raetsel/welt-2.md",
                                                "raetsel/welt-3.md", "raetsel/welt-4.md", "raetsel/finale.md",
                                                "welten/README.md", "welten/prolog.yaml", "welten/welt-1.yaml",
                                                "welten/welt-2.yaml", "welten/welt-3.yaml", "welten/welt-4.yaml",
                                                "welten/finale.yaml"]),
    ("04-skript", "Skript", ["skript/prolog.md", "skript/welt-1.md", "skript/welt-2.md", "skript/welt-3.md",
                             "skript/welt-4.md", "skript/zwischenspiele-und-finale.md"]),
    ("05-audio", "Audio", ["04-audio.md"]),
    ("06-produktion", "Produktion, Spielsysteme und Entscheidungen",
     ["03-produktion.md", "05-spielsysteme.md", "entscheidungen.md"]),
    ("07-offene-punkte", "Offene Punkte", ["offene-punkte.md"]),
]


def anker(text):
    t = re.sub(r"[^\w\- ]", "", text.lower(), flags=re.UNICODE)
    return t.strip().replace(" ", "-")


def stand():
    try:
        rev = subprocess.run(["git", "-C", str(ROOT), "rev-parse", "--short", "HEAD"],
                             capture_output=True, text=True, check=True).stdout.strip()
    except Exception:
        rev = "?"
    return f"{datetime.date.today().isoformat()}, Commit {rev}"


def kapitel(rel):
    p = DOCS / rel
    text = p.read_text(encoding="utf-8")
    if rel.endswith(".yaml"):
        return f"Welt-Tabelle {rel}", f"```yaml\n{text.rstrip()}\n```\n"
    zeilen, titel, im_code = [], None, False
    for z in text.splitlines():
        if z.startswith("```"):
            im_code = not im_code
        if not im_code and re.match(r"^#{1,5} ", z):
            if titel is None and z.startswith("# "):
                titel = z[2:].strip()
                continue
            z = "#" + z
        zeilen.append(z)
    return titel or rel, "\n".join(zeilen).strip() + "\n"


def main():
    ziel = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "export"
    ziel.mkdir(parents=True, exist_ok=True)
    s = stand()
    for datei, titel, quellen in BEREICHE:
        teile = []
        for rel in quellen:
            if (DOCS / rel).exists():
                teile.append(kapitel(rel))
            else:
                print(f"fehlt: docs/{rel}", file=sys.stderr)
        kopf = [f"# Couch Quest – Max against the worlds: {titel}", "",
                f"Export vom {s}. Hauptfassung ist das Repo; diese Datei wird mit `tools/export.py` erzeugt und nicht von Hand bearbeitet.", "",
                "## Inhalt", ""]
        kopf += [f"- [{t}](#{anker(t)})" for t, _ in teile]
        body = [f"\n## {t}\n\n{inhalt}" for t, inhalt in teile]
        (ziel / f"{datei}.md").write_text("\n".join(kopf) + "\n" + "\n".join(body), encoding="utf-8")
        print(f"{datei}.md: {len(teile)} Quellen")


if __name__ == "__main__":
    main()
