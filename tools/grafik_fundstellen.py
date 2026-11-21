#!/usr/bin/env python3
"""Grafikdatei ohne Fundstelle (Review 20.11., W3-07, AN-12): Jede Effekt-Bildfolge unter
game/grafik/ambiente/w3_* und jede Bewegung in den Welt-3-Figurenblättern braucht eine Stelle, die sie
aufruft. Sonst ist sie gebaut, aber nie zu sehen (Welt 3: 35 Bewegungen und 14 Effekte ohne Aufruf).

Fundstellen:
- Effekte: der Dateiname (ohne .png) steht im Layout (tools/layout/*.yaml) oder in einem Skript (game/**/*.gd).
- Bewegungen: der Name steht als "name" in einem Skript (Gesten-Tabellen, welt_3.gd), idle und talk gelten immer.
  Eine Bild-Variante (mutti_aus, schmidt_ohne_brille …) zählt, wenn ihr Name in einem Skript steht.
- Eine Datei w3_<x>.png, zu der es w3_<x>_v02.png gibt, ist abgelöst (alte Fassung der Räume) und wird nur
  gezählt; löschen entscheidet Sebastian.
Bewusst zurückgestellte Dateien und Bewegungen stehen mit Grund in ZURUECKGESTELLT. Steht dort etwas, das
inzwischen eine Fundstelle hat, meldet die Prüfung das ebenfalls (Liste aktuell halten).

Aufruf: python3 tools/grafik_fundstellen.py   (Rückgabe 1 bei Fehlern)
"""
import json
import re
import sys
from pathlib import Path

WURZEL = Path(__file__).resolve().parent.parent
SPIEL = WURZEL / "game"

# Welt-3-Figuren mit eigenem Blatt (tools/grafik_w3/figuren_einbau.py, GRUNDBLATT); Max und Pixel haben ein Blatt
# für alle Welten, dort zählen nur die Welt-3-Bewegungen (Bewegungsordner welt3/bewegungen, max_*, pixel_*).
FIGUREN = ["bernd", "deckert", "frau_regenschirm", "hausmeister", "herr_vier", "kalle", "kalle_ohne_laptop", "klon",
           "max_ente", "morphaeus", "mutti", "mutti_aus", "opa_hologramm", "orakel_oma", "piepsi", "rebell",
           "rebellin", "schmidt", "schmidt_ohne_brille", "schwarze_katze", "strassenmusiker_w3", "weinender_mann"]
WELT3_BEWEGUNGEN = {
    "max": ["code_sicht", "gedankentrick", "handy", "hexenschuss", "hexenschuss_gehen", "hochhalten",
            "kapsel_aufstehen", "kapsel_aussteigen", "kapsel_einsteigen", "kapsel_hinlegen", "nudeln", "pastille",
            "portalgeraet", "regen_wischen", "ruecken_halten", "schlucken", "stempel_ansehen", "tasche", "tippen",
            "zeitlupe"],
    "pixel": ["kabel", "morse", "ohrfeige", "schieben", "tasse", "tragen", "vom_schrank_fallen"],
}
IMMER = {"idle", "talk"}
# Bild-Varianten einer Figur (CQFigur.grafik_laden)
VARIANTEN = {"kalle_ohne_laptop", "max_ente", "mutti_aus", "opa_hologramm", "schmidt_ohne_brille"}

ZURUECKGESTELLT = {
    # Effekte
    "w3_lautsprecher": "B36 schmollender Lautsprecher (KAM3_MUT_0130): Ausschnitt der ersten Kammer 3, braucht einen "
                       "Neubau auf w3_bg_testkammer_3_v02 (nicht im Auftrag AP-05)",
    "w3_neonschild": "B18: das Neonschild der Unterstadt flackert seit AP-09 als Code-Effekt (flackern) auf dem "
                     "_v02-Bild; die Bildfolge ist ein Ausschnitt der ersten Fassung",
    "w3_schwarze_katze_gehen": "doppelt zur Figur schwarze_katze, die welt_3.gd über die Straße laufen lässt",
    # Bewegungen
    "max/kapsel_aufstehen": "zeigt die seitliche Kapsel der ersten Fassung; die Kapseln der _v02-Basis sind Kästen "
                            "von vorn, braucht eine neue Bildfolge (Aussteigen läuft schon)",
    "max/kapsel_hinlegen": "wie kapsel_aufstehen (Einsteigen läuft schon)",
    "pixel/tragen": "keine Regie-Stelle in Welt 3",
    "pixel/vom_schrank_fallen": "keine Regie-Stelle in Welt 3",
    "pixel/schieben": "keine Regie-Stelle in Welt 3 (Tasse schieben spielt „tasse“)",
    "morphaeus/kater_halten": "APO_MOR_0610 „fängt Pixel auf“: endet mit dem Kater im Arm, während Pixel als Figur "
                              "daneben steht; braucht Pixel-Ausblenden in der Szene (Entscheidung offen)",
    "deckert/walk": "Deckert geht im Skript nirgends hin",
    "schmidt/walk": "Schmidt geht im Skript nirgends hin",
    "kalle_ohne_laptop/idle": "Stand ohne Laptop ist nur die Quelle der Gesten im Kalle-Blatt",
    "kalle_ohne_laptop/talk": "wie idle",
}


def texte(muster):
    out = []
    for p in muster:
        for d in WURZEL.glob(p):
            if "/tests/" in d.as_posix() or d.name.startswith("_"):
                continue
            out.append(d.read_text(encoding="utf-8", errors="replace"))
    return "\n".join(out)


def main() -> int:
    skripte = texte(["game/skripte/**/*.gd", "game/game/**/*.gd", "game/oberflaeche/**/*.gd"])
    layout = texte(["tools/layout/*.yaml"])
    strings = set(re.findall(r'"([a-z0-9_]+)"', skripte))
    # Gänge der Nebenfiguren: nur wer in welt_3.gd ein Gangtempo hat, läuft auch (laufen_zu)
    gang = re.search(r"const GANG_TEMPO := \{([^}]*)\}", skripte)
    gehen = {re.sub(r"(?<!^)(?=[A-Z])", "_", k).lower() for k in re.findall(r'"([A-Za-z]+)":', gang.group(1))}         if gang else set()
    fehler, abgeloest, offen = [], [], []

    for png in sorted((SPIEL / "grafik/ambiente").glob("w3_*.png")):
        stamm = png.stem
        muster = re.compile(re.escape(stamm) + r"(?![a-z0-9_])")
        da = bool(muster.search(layout) or muster.search(skripte))
        if not da and (png.parent / f"{stamm}_v02.png").exists():
            abgeloest.append(stamm)
            continue
        if stamm in ZURUECKGESTELLT:
            (fehler if da else offen).append(f"{stamm}: zurückgestellt, hat aber eine Fundstelle" if da else stamm)
            continue
        if not da:
            fehler.append(f"Effekt {png.name}: keine Fundstelle in tools/layout oder game/**/*.gd")

    for fig in FIGUREN + list(WELT3_BEWEGUNGEN):
        d = json.loads((SPIEL / f"daten/figuren/{fig}.json").read_text(encoding="utf-8"))
        # eine Bild-Variante ist nur zu sehen, wenn ein Skript sie lädt
        geladen = fig not in VARIANTEN or fig in skripte
        for n in WELT3_BEWEGUNGEN.get(fig, list(d["animationen"])):
            schluessel = f"{fig}/{n}"
            if n == "walk" and fig not in ("max", "pixel", "schwarze_katze"):   # die Katze läuft per _katze_schleife
                da = geladen and fig in gehen
            else:
                da = geladen and (n in IMMER or n in strings)
            if schluessel in ZURUECKGESTELLT:
                (fehler if da else offen).append(f"{schluessel}: zurückgestellt, hat aber eine Fundstelle" if da
                                                 else schluessel)
            elif not da:
                fehler.append(f"Bewegung {schluessel}: kein Aufruf in game/**/*.gd"
                              + ("" if geladen else " (die Variante lädt kein Skript)"))

    print(f"Welt 3: {len(abgeloest)} abgelöste Effektdateien (_v02 vorhanden), {len(offen)} bewusst zurückgestellt")
    for z in offen:
        print(f"  zurückgestellt: {z} ({ZURUECKGESTELLT[z]})")
    for f in fehler:
        print("FEHLER", f)
    return 1 if fehler else 0


if __name__ == "__main__":
    sys.exit(main())
