# -*- coding: utf-8 -*-
"""Review 21.11.2026, Rolle an-b: Bestand aller Animationen der Figuren von Welt 2 und
Zwischenspiel 2 (nur lesen). Schreibt belege/an-b/animations_inventar.csv,
ambiente_inventar.csv, regie_abgleich.csv und nar_zeilen.csv.

Aufruf (im Prüf-Checkout): py -3 docs/review/2026-11-21/werkzeuge/an-b_inventar.py
"""
import csv
import glob
import json
import os
import re
import sys

W = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
ZIEL = os.path.join(W, "docs", "review", "2026-11-21", "belege", "an-b")
os.makedirs(ZIEL, exist_ok=True)

FIGUREN = ["max", "pixel", "opa", "faehrmann", "sobek", "sobek_land", "steinmetz", "hermes", "ramses",
           "hofkater", "schreiber", "faecherwedler", "faecherwedler_gelb", "nebet", "sphinx_figur",
           "archimedes", "archimedes_handtuch", "hieron", "cicero", "tiro", "tourist", "touristin",
           "philosoph", "brian", "strassenmusiker", "beamter_1", "beamter_2", "leonidas",
           "schildkroete", "zeremonienmeister", "aegypter"]
KUERZEL = {"MAX": "max", "PIX": "pixel", "OPA": "opa", "FAE": "faehrmann", "SOB": "sobek", "STM": "steinmetz",
           "HER": "hermes", "RAM": "ramses", "HOF": "hofkater", "SCH": "schreiber", "FAW": "faecherwedler",
           "NEB": "nebet", "SPH": "sphinx_figur", "ARC": "archimedes", "HIE": "hieron", "CIC": "cicero",
           "TIR": "tiro", "TOU": "tourist", "TOI": "touristin", "PHI": "philosoph", "BRI": "brian",
           "MUS": "strassenmusiker", "BE1": "beamter_1", "BE2": "beamter_2", "LEO": "leonidas",
           "SKR": "schildkroete", "ZER": "zeremonienmeister", "VOL": "aegypter"}
VARIANTEN = {"sobek_land": "sobek", "archimedes_handtuch": "archimedes", "faecherwedler_gelb": "faecherwedler"}
ERSATZ_GAENGE = ["joggen", "kriechen", "laufen", "weggehen", "losrennen", "heureka"]


def lies(p):
    with open(os.path.join(W, p), encoding="utf-8") as f:
        return f.read()


# --- Tabellen der Gesten -----------------------------------------------------------------------
def tabellen():
    zeile, ruhe, warten = {}, {}, {}
    for datei in ["game/skripte/gesten_einsatz.gd", "game/skripte/gesten_welt_2.gd"]:
        t = lies(datei)
        for m in re.finditer(r'"((?:W2|ZS2)_[A-Z0-9_]+)":\s*\["([A-Z0-9]+)",\s*"([a-z_0-9]+)",\s*"([a-z_]+)"', t):
            zeile.setdefault((KUERZEL.get(m.group(2), m.group(2)), m.group(3)), []).append((m.group(1), m.group(4)))
        for abschnitt, ziel in (("RUHE", ruhe), ("WARTEN", warten)):
            m = re.search(r"const %s := \{(.*?)\n\}" % abschnitt, t, re.S)
            if not m:
                continue
            for fm in re.finditer(r'"([a-z_0-9]+)":\s*\[(.*?)\](?=,\s*\n\t"|,?\s*\n?$|,\s*#|,\s*\n\t#)', m.group(1), re.S):
                fig, rest = fm.group(1), fm.group(2)
                for e in re.finditer(r"\{(.*?)\}", rest, re.S):
                    inh = e.group(1)
                    raum = re.search(r'raum = (\[.*?\]|"[a-z_]+")', inh)
                    bed = " ".join(x.group(0) for x in re.finditer(r'(vor|nach|abschnitt|schalter|spieler_ruhe) = [^,}]+', inh))
                    ab = re.search(r"abstand = \[([0-9. ,]+)\]", inh)
                    if abschnitt == "RUHE":
                        g = re.search(r'geste = "([a-z_0-9]+)"', inh)
                        if g:
                            ziel.setdefault((fig, g.group(1)), []).append((raum.group(1) if raum else "überall") + (" " + bed if bed else ""))
                    else:
                        g = re.search(r"gesten = \[(.*?)\]", inh)
                        if g:
                            for n in sorted(set(re.findall(r'"([a-z_0-9]+)"', g.group(1)))):
                                ziel.setdefault((fig, n), []).append(
                                    (raum.group(1) if raum else "überall") + (" alle %s s" % ab.group(1) if ab else "") + (" " + bed if bed else ""))
    return zeile, ruhe, warten


# --- Aufrufe im Code ---------------------------------------------------------------------------
def code_dateien():
    out = []
    for muster in ["game/skripte/*.gd", "game/skripte/objekte/*.gd", "game/oberflaeche/*.gd",
                   "game/game/rooms/**/*.gd", "game/game/characters/**/*.gd", "game/game/gui/**/*.gd",
                   "game/game/inventory_items/**/*.gd", "game/game/dialogs/**/*.gd"]:
        out += glob.glob(os.path.join(W, muster), recursive=True)
    out = [p for p in out if not os.path.basename(p).startswith("gesten_")]
    return sorted(set(out))


CODE = {p: open(p, encoding="utf-8").read().split("\n") for p in code_dateien()}
W2_DATEIEN = ("welt_2.gd", "minispiel", "spiel.gd", "cq_", "character_", "zwischenspiel", "effekte.gd")
W2_RAEUME = ["nil_delta", "thronsaal_ramses", "palastkueche", "sphinx", "faehrsteg_olympia", "agora", "startbuero",
             "stadion", "hafen_syrakus", "werkstatt", "grabhuegel", "dachboden"]


def code_aufrufe(figur, anim):
    """Stellen, an denen der Name als Zeichenkette steht (ohne die Gesten-Tabellen)."""
    treffer = []
    basis = VARIANTEN.get(figur, figur)
    for p, zeilen in CODE.items():
        rel = os.path.relpath(p, W).replace("\\", "/")
        nah = ("welt_2.gd" in rel or "/oberflaeche/" in rel or "/skripte/spiel.gd" in rel or "/skripte/objekte/" in rel
               or "character_%s" % basis in rel or any("/rooms/%s/" % r in rel for r in W2_RAEUME)
               or "zwischenspiel" in rel or "/skripte/effekte.gd" in rel or "/skripte/welt.gd" in rel)
        if not nah:
            continue
        for i, z in enumerate(zeilen):
            if '"%s"' % anim in z and not z.strip().startswith("#"):
                treffer.append("%s:%d" % (rel.replace("game/", "", 1), i + 1))
    return treffer


# --- Regie-Tabelle -----------------------------------------------------------------------------
def regie():
    t = lies("docs/grafik/gesten-regie.md").split("\n")
    out = {}
    sec = ""
    for z in t:
        if z.startswith("## "):
            sec = z[3:].strip()
        if not z.startswith("| ") or z.startswith("| ---") or z.startswith("| Figur"):
            continue
        if not (sec.startswith("Welt 2") or sec.startswith("Welten") or sec.startswith("Prolog")):
            continue
        sp = [s.strip() for s in z.strip().strip("|").split("|")]
        if len(sp) < 6:
            continue
        out[(sp[0], sp[1])] = {"abschnitt": sec, "dauer": sp[2], "wann": sp[3], "art": sp[5],
                               "bemerkung": sp[6] if len(sp) > 6 else "", "stand": sp[7] if len(sp) > 7 else ""}
    return out


def main():
    zeile, ruhe, warten = tabellen()
    reg = regie()
    zeilen = []
    for fig in FIGUREN:
        pfad = os.path.join(W, "game", "daten", "figuren", fig + ".json")
        if not os.path.exists(pfad):
            zeilen.append({"figur": fig, "animation": "(keine JSON)", "status": "Platzhalter"})
            continue
        d = json.load(open(pfad, encoding="utf-8"))
        anims = d["animationen"]
        hat_walk = "walk" in anims
        ersatz = next((e for e in ERSATZ_GAENGE if e in anims), None) if not hat_walk else None
        for name, a in anims.items():
            folge = a.get("folge", list(range(int(a["bilder"]))))
            dauer = len(folge) * a["ms"] / 1000.0
            basis = VARIANTEN.get(fig, fig)
            z = zeile.get((basis, name), [])
            r = ruhe.get((basis, name), [])
            w = warten.get((basis, name), [])
            c = code_aufrufe(fig, name)
            implizit = ""
            if name in ("idle", "talk"):
                implizit = "Popochiu (Stand/Reden)"
            if name == "walk":
                implizit = "Popochiu (Gang)"
            if name == ersatz:
                implizit = "Ersatzgang (ERSATZ_GAENGE → walk)"
            if name in ("gehen_vorn", "gehen_hinten") and hat_walk:
                implizit = "walk_d/walk_u (grafik_laden)"
            if name == "treppe_walk":
                implizit = "animation_prefix treppe_ (cq_raum)"
            if name == "springen":
                implizit = "springen_zu()"
            rg = reg.get((fig, name)) or {}
            if name.endswith("_alt"):
                status = "Altfassung"
            elif z or r or w or c or implizit:
                status = "genutzt"
            else:
                status = "UNGENUTZT"
            zeilen.append({
                "figur": fig, "animation": name, "von": a["von"], "bilder": a["bilder"], "schritte": len(folge),
                "ms": a["ms"], "dauer_s": ("%.2f" % dauer).replace(".", ","), "schleife": "ja" if a.get("schleife", True) else "nein",
                "zeile": "; ".join("%s (%s)" % x for x in z), "ruhe": "; ".join(r), "warten": "; ".join(w),
                "code": "; ".join(c[:12]) + (" …(%d)" % len(c) if len(c) > 12 else ""), "implizit": implizit,
                "regie": (rg.get("art", "") + (" / " + rg["stand"] if rg.get("stand") else "")) if rg else "",
                "status": status})
    felder = ["figur", "animation", "von", "bilder", "schritte", "ms", "dauer_s", "schleife", "zeile", "ruhe", "warten",
              "code", "implizit", "regie", "status"]
    with open(os.path.join(ZIEL, "animations_inventar.csv"), "w", encoding="utf-8-sig", newline="") as f:
        wr = csv.DictWriter(f, felder, delimiter=";")
        wr.writeheader()
        for z in zeilen:
            wr.writerow({k: z.get(k, "") for k in felder})

    # Abgleich: Regie verlangt → vorhanden? aufgerufen?
    vorhanden = {(z["figur"], z["animation"]): z for z in zeilen}
    with open(os.path.join(ZIEL, "regie_abgleich.csv"), "w", encoding="utf-8-sig", newline="") as f:
        wr = csv.writer(f, delimiter=";")
        wr.writerow(["abschnitt", "figur", "animation", "wann_laut_regie", "art_laut_regie", "im_sheet", "status_im_spiel", "aufruf"])
        for (fig, name), rg in reg.items():
            if fig not in FIGUREN:
                continue
            v = vorhanden.get((fig, name))
            wr.writerow([rg["abschnitt"], fig, name, rg["wann"][:160], rg["art"][:80], "ja" if v else "NEIN",
                         v["status"] if v else "FEHLT",
                         " | ".join(x for x in [v["zeile"], v["ruhe"], v["warten"], v["code"], v["implizit"]] if x)[:300] if v else ""])
    # Tabellen-Einträge, deren Bewegung es nicht gibt
    fehl = []
    for (fig, name), ein in list(zeile.items()) + list(ruhe.items()) + list(warten.items()):
        kandidaten = [fig] + [k for k, b in VARIANTEN.items() if b == fig]
        if not any((k, name) in vorhanden for k in kandidaten):
            fehl.append((fig, name, ein))
    # NAR-Zeilen und Regiespalte des Skripts
    nar = []
    for datei, praefix in (("docs/skript/welt-2.md", "W2"), ("docs/skript/zwischenspiele-und-finale.md", "ZS2")):
        for z in lies(datei).split("\n"):
            if not z.startswith("| " + praefix):
                continue
            sp = [s.strip() for s in z.strip().strip("|").split("|")]
            if len(sp) < 4:
                continue
            zid = sp[0].replace("\\_", "_")
            regie_txt = sp[3]
            if "_NAR_" in zid or re.search(r"[Aa]nimation|Geste|Pose", regie_txt):
                g = [(k, v) for k, v in zeile.items() if any(e[0] == zid for e in v)]
                stellen = []
                for p, zl in CODE.items():
                    for i, c in enumerate(zl):
                        if zid in c:
                            stellen.append("%s:%d" % (os.path.relpath(p, W).replace("\\", "/").replace("game/", "", 1), i + 1))
                nar.append([zid, sp[1], sp[2][:140], regie_txt[:140], "; ".join("%s %s" % k for k, _ in g), "; ".join(stellen[:4])])
    with open(os.path.join(ZIEL, "nar_zeilen.csv"), "w", encoding="utf-8-sig", newline="") as f:
        wr = csv.writer(f, delimiter=";")
        wr.writerow(["zeile", "sprecher", "text", "regie_im_skript", "geste_in_tabelle", "stelle_im_code"])
        wr.writerows(nar)

    # Ambiente und Effekte aus den erzeugten Raumdaten
    amb = []
    for datei in ["game/daten/raeume/welt-2.json", "game/daten/raeume/prolog.json"]:
        d = json.load(open(os.path.join(W, datei), encoding="utf-8"))
        for r in d["raeume"]:
            if datei.endswith("prolog.json") and r["id"] != "dachboden":
                continue
            for e in r.get("effekte", []):
                amb.append([r["id"], e.get("art", ""), os.path.basename(str(e.get("bild", ""))), e.get("bilder", ""), e.get("fps", ""),
                            ("%.2f" % (e["bilder"] / e["fps"])).replace(".", ",") if e.get("bilder") and e.get("fps") else "",
                            e.get("ablauf", "schleife"), json.dumps(e.get("pos", e.get("weg", e.get("kreis", ""))), ensure_ascii=False),
                            e.get("tempo", ""), json.dumps(e.get("pause", "")), e.get("an", ""),
                            json.dumps({k: v for k, v in e.items() if k not in ("art", "bild", "bilder", "fps", "ablauf", "pos", "weg", "kreis", "tempo", "pause", "an")}, ensure_ascii=False)])
    with open(os.path.join(ZIEL, "ambiente_inventar.csv"), "w", encoding="utf-8-sig", newline="") as f:
        wr = csv.writer(f, delimiter=";")
        wr.writerow(["raum", "art", "bild", "bilder", "fps", "dauer_s", "ablauf", "ort", "tempo", "pause", "an", "sonst"])
        wr.writerows(amb)

    # Kurzbericht
    print("Animationen:", len(zeilen))
    for st in ("genutzt", "UNGENUTZT", "Altfassung"):
        print(" ", st, sum(1 for z in zeilen if z.get("status") == st))
    print("UNGENUTZT:")
    for z in zeilen:
        if z.get("status") == "UNGENUTZT":
            print("   %s %s (%s Bilder, %s s) regie: %s" % (z["figur"], z["animation"], z["bilder"], z["dauer_s"], z["regie"][:80]))
    print("Tabellen-Einträge ohne Bewegung im Sheet:", fehl)
    print("Regie-Zeilen ohne Sheet oder ohne Aufruf:")
    for (fig, name), rg in reg.items():
        if fig in FIGUREN:
            v = vorhanden.get((fig, name))
            if not v or v["status"] != "genutzt":
                print("   ", rg["abschnitt"][:10], fig, name, "->", v["status"] if v else "FEHLT")
    print("NAR-/Regie-Zeilen:", len(nar), "davon ohne Geste und ohne Stelle im Code:",
          sum(1 for n in nar if not n[4] and not n[5]))
    print("Ambiente:", len(amb))


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    main()
