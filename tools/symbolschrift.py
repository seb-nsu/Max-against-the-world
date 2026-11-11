#!/usr/bin/env python3
"""Baut game/schriften/symbole.ttf: die Zeichen, die Nunito und Pixelify Sans fehlen.

Quelle ist DejaVu Sans Bold (Lizenz in licenses/dejavu-LICENSE.txt). Die Teilmenge enthält nur
die Zeichen aus ZEICHEN und heißt „CQ Symbole“, wie es die Lizenz für geänderte Fassungen
verlangt. Das Spiel hängt die Datei als Ersatzschrift an beide Schriften (skripte/effekte.gd,
symbolschrift_anhaengen), damit die Zeichen auch im Browser-Build erscheinen: Dort gibt es keine
Schriften des Systems, die sonst einspringen.

Aufruf: python3 tools/symbolschrift.py [PFAD/ZU/DejaVuSans-Bold.ttf]
Braucht fontTools. Ohne Angabe wird die Schrift an ihrem üblichen Ort unter Linux gesucht.
"""
import sys
from pathlib import Path

from fontTools import subset
from fontTools.ttLib import TTFont

WURZEL = Path(__file__).resolve().parent.parent
ZIEL = WURZEL / "game" / "schriften" / "symbole.ttf"
QUELLE = Path("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf")
## Haken, Kreuz, Note, Kreis, Dreieck, Quadrat, Raute, Tauschpfeil
ZEICHEN = "✓✗♪●▲■◆↔"
NAME = "CQ Symbole"


def main() -> int:
    quelle = Path(sys.argv[1]) if len(sys.argv) > 1 else QUELLE
    if not quelle.exists():
        print(f"Quelle fehlt: {quelle}")
        return 1
    opt = subset.Options()
    opt.layout_features = []
    opt.name_IDs = [0, 1, 2, 3, 4, 6]
    opt.notdef_outline = True
    opt.hinting = False
    opt.glyph_names = False
    schrift = TTFont(quelle)
    teil = subset.Subsetter(opt)
    teil.populate(text=ZEICHEN)
    teil.subset(schrift)
    for eintrag in schrift["name"].names:
        if eintrag.nameID == 1:
            eintrag.string = NAME
        elif eintrag.nameID == 2:
            eintrag.string = "Regular"
        elif eintrag.nameID == 3:
            eintrag.string = NAME + " (Teilmenge für Couch Quest)"
        elif eintrag.nameID == 4:
            eintrag.string = NAME
        elif eintrag.nameID == 6:
            eintrag.string = "CQSymbole"
    fehlt = [z for z in ZEICHEN if ord(z) not in schrift.getBestCmap()]
    if fehlt:
        print("Zeichen fehlen in der Quelle:", " ".join(fehlt))
        return 1
    schrift.save(ZIEL)
    print(f"{ZIEL.relative_to(WURZEL)}: {len(ZEICHEN)} Zeichen, {ZIEL.stat().st_size} Bytes")
    return 0


if __name__ == "__main__":
    sys.exit(main())
