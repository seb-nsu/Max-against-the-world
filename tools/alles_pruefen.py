#!/usr/bin/env python3
"""Führt lokal genau die Dokument-Prüfungen aus, die GitHub Actions im Job „dokumente“ fährt
(.github/workflows/pruefen.yml). Vor jedem Commit statt nur tools/pruefen.py.

Aufruf aus dem Repo-Wurzelverzeichnis:
  python3 tools/alles_pruefen.py            # nur prüfen, Rückgabe 1 bei einem Fehler
  python3 tools/alles_pruefen.py --erzeugen # erzeugte Dateien vorher neu schreiben

Hintergrund (Review 17.11., WF-08): Dreimal war die CI rot, nur weil erzeugte Dateien (Prompts,
Bauplan) veraltet waren; lokal lief bis dahin nur pruefen.py.
"""
import os
import subprocess
import sys
from pathlib import Path

WURZEL = Path(__file__).resolve().parent.parent
PY = sys.executable

# (Werkzeug, erzeugt Dateien und kennt --pruefen)
SCHRITTE = [
    ("pruefen.py", False),
    ("diagramme.py", True),
    ("skript_export.py", True),
    ("spieldaten.py", True),
    ("godot_raeume.py", True),
    ("audio_liste.py", True),
    ("abdeckung.py", True),
    ("prompts_zusammensetzen.py", True),
    ("gesten_pruefen.py", False),
    ("grafik_fundstellen.py", False),   # Review 20.11., AP-05: Welt-3-Grafik ohne Aufruf
]


def main() -> int:
    erzeugen = "--erzeugen" in sys.argv
    umgebung = dict(os.environ, PYTHONIOENCODING="utf-8")
    fehler = []
    for werkzeug, erzeugt in SCHRITTE:
        if erzeugen and erzeugt:
            subprocess.run([PY, f"tools/{werkzeug}"], cwd=WURZEL, env=umgebung,
                           stdout=subprocess.DEVNULL)
        befehl = [PY, f"tools/{werkzeug}"] + (["--pruefen"] if erzeugt else [])
        r = subprocess.run(befehl, cwd=WURZEL, env=umgebung, capture_output=True, text=True,
                           encoding="utf-8", errors="replace")
        status = "ok" if r.returncode == 0 else "FEHLER"
        print(f"{status:7} {werkzeug}")
        if r.returncode != 0:
            fehler.append(werkzeug)
            print("\n".join((r.stdout + r.stderr).strip().splitlines()[-15:]))
    if erzeugen:
        print("Hinweis: godot_raeume.py schreibt unter Windows alle Platzhalter neu; nur die "
              "betroffenen behalten (git checkout -- game/grafik/platzhalter).")
    print(f"\n{len(fehler)} von {len(SCHRITTE)} Prüfungen fehlgeschlagen" if fehler else "\nAlle Prüfungen bestanden")
    return 1 if fehler else 0


if __name__ == "__main__":
    sys.exit(main())
