"""Zaehlt je Godot-Test, auf welchem Weg Spielschritte ausgeloest werden.

Review 21.11.2026, Rolle Workflow (wf). Nur lesend. Aufruf:
    py -3 docs/review/2026-11-21/werkzeuge/wf_testwege.py > docs/review/2026-11-21/belege/wf/testwege.tsv

Gezaehlt werden Aufrufe im Testablauf (nicht in den Hilfsfunktionen):
  ereignis   echte Eingabeereignisse (push_input ueber _maus/_code_sicht-Schritte)
  knoten     Klick-Funktion am Knoten (on_click, on_right_click, on_item_used, auch ueber Hilfen)
  menue      Gespraechsoption ueber das Menue der Oberflaeche (_gespraech, _inline = [...])
  direktdlg  Gespraechsoption direkt (dialog.waehlen("id")), ohne Gespraech und Menue
  regel      Regel direkt (S.regel(...)), ohne Objekt im Raum
  vorgabe    Auswahl vorab gesetzt (S.vorgabe_auswahl / vorgabe_tasche), kein Menue
  zustand    Zustand/Inventar direkt (Z.setze*, Z.loese, S.geben, Z.spielzeit +=, _wecker_klingelt)
  raum       Raumwechsel direkt (goto_room, _geh, _faehre, welt_beginnen)
  figur      Figurenwechsel direkt (S.figur_wechseln) bzw. portraet (pixel_portraet_geklickt)
  pfote      Hinweise direkt (H.pfote_geklickt) / schritt_waehlen nur gelesen
  geloest    Pruefungen auf Z.geloest("Rx") (verschiedene Raetselschritte)
"""
import re
import sys
from pathlib import Path

WURZEL = Path(__file__).resolve().parents[4]
TESTS = WURZEL / "game" / "tests"

# (Datei, Name, erste Zeile, letzte Zeile) des Ablaufs
ABSCHNITTE = [
    ("prolog_durchlauf.gd", "Prolog (prolog_durchlauf)", 72, 340),
    ("prolog_durchlauf.gd", "Welt 1 + ZS1 (prolog_durchlauf)", 341, 967),
    ("welt_2_anspiel.gd", "Welt 2 + ZS2 (welt_2_anspiel)", 38, 230),
    ("welt_3_anspiel.gd", "Welt 3 + ZS3 (welt_3_anspiel)", 53, 350),
    ("welt_4_anspiel.gd", "Welt 4 (welt_4_anspiel)", 36, 93),
    ("finale_anspiel.gd", "Finale (finale_anspiel)", None, None),
    ("hinweise_welten.gd", "Pfote (hinweise_welten)", None, None),
    ("ansehen_zustand.gd", "Ansehen (ansehen_zustand)", None, None),
]

MUSTER = {
    "knoten": r"\.on_click\(\)|\.on_right_click\(\)|\.on_item_used\(|\b_klick\(|\b_klick_ohne_warten\(|\b_ansehen\(|\b_ansehen_item\(|\b_geben_an\(|\b_inv_benutzen\(|\b_inv_ansehen\(|\b_ausgang\(|\b_ausgang_gesperrt\(|\b_nehmen\(|\b_nehmen_ohne\(|\b_benutze\(|\b_gehe\(",
    "direktdlg": r"\.waehlen\(",
    "regel": r"\bS\.regel\(|_spiel\(\)\.regel\(",
    "raum": r"goto_room\(|\b_geh\(|\b_faehre\(|welt_beginnen\(|zwischenspiel_beginnen\(|finale_beginnen\(",
    "figur_direkt": r"figur_wechseln\(",
    "figur_portraet": r"pixel_portraet_geklickt\(|\b_wechsel_zu\(",
    "pfote": r"pfote_geklickt\(",
    "zustand": r"Z\.setze\(|Z\.setze_wert\(|Z\.loese\(|_zustand\(\)\.setze|\bS\.geben\(|spielzeit \+=|_wecker_klingelt\(\)|Zustand\.setze|\.loese\(",
    "speichern": r"_rundreise\(|\.speichern\(|\.laden\(",
}


def zaehle_liste(text, name):
    """Summe der Eintraege in Zuweisungen wie  name = [1, 2]  oder Parametern [..]."""
    n = 0
    for m in re.finditer(name + r"\s*=\s*\[([^\]]*)\]", text):
        inhalt = m.group(1).strip()
        n += 0 if not inhalt else len([x for x in inhalt.split(",") if x.strip()])
    return n


def main():
    kopf = ["Test", "Zeilen", "ereignis(Maus/Taste)", "knoten(on_click usw.)", "menue(Gespraech)", "menue(Inline)",
            "direktdlg(waehlen)", "regel(S.regel)", "vorgabe(Auswahl)", "zustand direkt", "raum direkt",
            "figur direkt", "figur Portraet", "pfote", "speichern/laden", "geloest-Pruefungen", "_pruefe gesamt"]
    print("\t".join(kopf))
    for datei, name, a, b in ABSCHNITTE:
        zeilen = (TESTS / datei).read_text(encoding="utf-8").splitlines()
        if a is None:
            # Ablauf = alles bis zur ersten Hilfsregion
            a = 1
            b = len(zeilen)
            for i, z in enumerate(zeilen, 1):
                if z.startswith("#region Hilfen") or z.startswith("#region Klickweg"):
                    b = i - 1
                    break
        text = "\n".join(z for z in zeilen[a - 1:b] if not z.strip().startswith("#"))
        z = {k: len(re.findall(m, text)) for k, m in MUSTER.items()}
        # Code-Sicht: Schritte in der Liste nach _code_sicht(...)
        ereignis = 0
        for m in re.finditer(r"_code_sicht\([^\[]*\[([^\]]*)\]", text, re.S):
            ereignis += len([x for x in m.group(1).split(",") if x.strip()])
        ereignis += len(re.findall(r"\b_maus\(|push_input\(", text))
        # Gespraeche ueber das Menue: Optionen in der ersten Liste, Inline in der zweiten
        menue = 0
        inline = zaehle_liste(text, "_inline")
        for m in re.finditer(r"_gespraech\(\"[^\"]+\",\s*\[([^\]]*)\](?:,\s*\[([^\]]*)\])?", text):
            menue += len([x for x in m.group(1).split(",") if x.strip()])
            if m.group(2):
                inline += len([x for x in m.group(2).split(",") if x.strip()])
        vorgabe = zaehle_liste(text, r"vorgabe_auswahl") + zaehle_liste(text, r"vorgabe_tasche")
        geloest = len(set(re.findall(r"geloest\(\"([A-Za-z0-9]+)\"", text)))
        pruefe = len(re.findall(r"\b_pruefe\(", text))
        print("\t".join(str(x) for x in [name, b - a + 1, ereignis, z["knoten"], menue, inline, z["direktdlg"],
                                          z["regel"], vorgabe, z["zustand"], z["raum"], z["figur_direkt"],
                                          z["figur_portraet"], z["pfote"], z["speichern"], geloest, pruefe]))


if __name__ == "__main__":
    sys.exit(main())
