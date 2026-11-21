#!/usr/bin/env python3
"""Review 21.11.2026, Rolle an-a (Animationen Prolog, Welt 1, Zwischenspiel 1).

Bestand aller Animationen der Figuren im Umfang, Abgleich mit Aufrufen (Tabellen ZEILE/RUHE/WARTEN,
Raum- und Figurenskripte), Gesten-Regie und Skript. Dazu Messwerte je Einzelbild (Bounding-Box,
Fusslinie, Mitte, Hoehe gegen Stand, Schleifennaht, doppelte Bilder) und Kontaktboegen je Sheet.

Aufruf (im Pruef-Checkout):  py -3 docs/review/2026-11-21/werkzeuge/an-a_inventar.py
Schreibt nach docs/review/2026-11-21/belege/an-a/: inventar.csv, messwerte_bilder.csv,
messwerte_animationen.csv, ambiente.csv, kontaktboegen/<figur>.png
Nur lesend auf dem Spiel.
"""
import csv
import glob
import hashlib
import json
import os
import re
import sys

from PIL import Image, ImageDraw

WURZEL = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
ZIEL = os.path.join(WURZEL, "docs", "review", "2026-11-21", "belege", "an-a")
FIG = ["max", "max_pilz", "pixel", "pixel_ziege", "opa", "toadi", "alwin", "zeldina", "gollo", "humbert",
       "schmied", "waldemar", "stabmacher", "rotkaeppchen", "maklerin", "grimmzahn", "goblin_1", "goblin_2",
       "moderwort", "smaugi", "minka", "huhn", "schmiede_ziege", "xxl_ziege", "schwan", "zauberbesen",
       "uebungsbesen"]
KUERZEL = {}
GENERISCH = {"idle", "walk", "talk", "gehen_vorn", "gehen_hinten", "treppe_walk"}


def lies(p):
    with open(os.path.join(WURZEL, p), encoding="utf-8") as f:
        return f.read()


def kuerzel_laden():
    for ab in ("prolog", "welt-1", "welt-2", "welt-3"):
        d = json.loads(lies(f"game/daten/welten/{ab}.json"))
        figs = d["figuren"]
        for x in (figs.values() if isinstance(figs, dict) else figs):
            if x.get("kuerzel"):
                KUERZEL.setdefault(x["kuerzel"], x["id"])


def tabellen():
    """ZEILE-, RUHE-, WARTEN-Eintraege aus gesten_einsatz.gd und gesten_welt_1.gd."""
    zeile = {}   # (figur, anim) -> [(id, art)]
    ruhe = {}
    warten = {}
    for datei in ("game/skripte/gesten_einsatz.gd", "game/skripte/gesten_welt_1.gd"):
        text = lies(datei)
        for m in re.finditer(r'"([A-Z0-9_]+)":\s*\["([A-Z0-9]+)",\s*"([a-z_0-9]+)",\s*"([a-z_]+)"', text):
            zid, kue, anim, art = m.groups()
            fig = KUERZEL.get(kue, kue.lower())
            zeile.setdefault((fig, anim), []).append((zid, art))
        for name, ziel in (("RUHE", ruhe), ("WARTEN", warten)):
            m = re.search(r"const %s := \{(.*?)\n\}" % name, text, re.S)
            if not m:
                continue
            block = m.group(1)
            # Eintraege "figur": [ ... ] bis zum naechsten "figur": am Zeilenanfang
            for fm in re.finditer(r'^\t"([a-z_0-9]+)":\s*\[(.*?)(?=^\t"[a-z_0-9]+":|\Z)', block, re.S | re.M):
                fig, inhalt = fm.groups()
                for g in re.finditer(r'geste = "([a-z_0-9]+)"', inhalt):
                    ziel.setdefault((fig, g.group(1)), []).append(os.path.basename(datei))
                for g in re.finditer(r'gesten = \[([^\]]*)\]', inhalt):
                    for a in re.findall(r'"([a-z_0-9]+)"', g.group(1)):
                        ziel.setdefault((fig, a), []).append(os.path.basename(datei))
    return zeile, ruhe, warten


def code_stellen(namen):
    """Alle Zeilen in Spielskripten (ohne Tabellen, Tests, Addons), die einen Animationsnamen in
    Anfuehrungszeichen enthalten."""
    treffer = {}   # anim -> [(datei, zeile, text)]
    muster = re.compile(r'"(%s)"' % "|".join(sorted(map(re.escape, namen), key=len, reverse=True)))
    for wurzel in ("game/skripte", "game/game", "game/oberflaeche"):
        for pfad in glob.glob(os.path.join(WURZEL, wurzel, "**", "*.gd"), recursive=True):
            rel = os.path.relpath(pfad, WURZEL).replace("\\", "/")
            if re.search(r"gesten_(einsatz|welt_\d)\.gd$|/tests/", rel):
                continue
            with open(pfad, encoding="utf-8") as f:
                for nr, zeile in enumerate(f, 1):
                    code = zeile.split("#")[0] if not zeile.lstrip().startswith("#") else ""
                    for m in muster.finditer(code):
                        treffer.setdefault(m.group(1), []).append((rel, nr, zeile.strip()[:150]))
    return treffer


def pascal(fig):
    return "".join(t.capitalize() for t in fig.split("_"))


def stelle_passt(fig, anim, rel, text):
    """Grobe Zuordnung einer Codestelle zu einer Figur."""
    p = pascal(fig)
    basis = {"max_pilz": "max", "pixel_ziege": "pixel"}.get(fig, fig)
    if "C.%s." % pascal(basis) in text or "/characters/%s/" % basis in rel:
        return True
    if basis == "max" and re.search(r"max_geste\(|\bm\.geste\(|C\.player|\bc\.geste\(", text):
        return True
    if basis in ("zauberbesen", "uebungsbesen") and ("besen" in text.lower() or "turmkeller" in rel or "klassenzimmer" in rel):
        return True
    return False


def regie():
    """(figur, anim) aus den Tabellen der Gesten-Regie."""
    out = set()
    for z in lies("docs/grafik/gesten-regie.md").splitlines():
        m = re.match(r"\|\s*([a-z_0-9]+)\s*\|\s*([a-z_0-9]+)\s*\|", z)
        if m:
            out.add(m.groups())
    return out


def bilder_laden(fig):
    d = json.loads(lies(f"game/daten/figuren/{fig}.json"))
    img = Image.open(os.path.join(WURZEL, f"game/grafik/figuren/{fig}.png")).convert("RGBA")
    w, h = d["bild"]
    gesamt = max(a["von"] + a["bilder"] for a in d["animationen"].values())
    spalten = int(d.get("spalten", gesamt))
    frames = []
    for i in range(gesamt):
        x0, y0 = (i % spalten) * w, (i // spalten) * h
        frames.append(img.crop((x0, y0, x0 + w, y0 + h)))
    return d, frames


def mass(fr):
    bb = fr.getchannel("A").point(lambda a: 255 if a > 16 else 0).getbbox()
    if not bb:
        return None
    w, h = fr.size
    return {"x0": bb[0], "y0": bb[1], "x1": bb[2], "y1": bb[3], "hoehe": bb[3] - bb[1], "breite": bb[2] - bb[0],
            "fuss": h - bb[3], "cx": (bb[0] + bb[2]) / 2.0 - w / 2.0}


def unterschied(a, b):
    """Anteil veraenderter Pixel zwischen zwei Bildern."""
    pa, pb = a.tobytes(), b.tobytes()
    n = len(pa) // 4
    d = 0
    for i in range(0, len(pa), 4):
        if pa[i:i + 4] != pb[i:i + 4] and (pa[i + 3] > 16 or pb[i + 3] > 16):
            d += 1
    return d / n


def magenta(fr):
    px = fr.tobytes()
    z = 0
    for i in range(0, len(px), 4):
        if px[i + 3] > 16 and px[i] > 170 and px[i + 2] > 150 and px[i + 1] < 110:
            z += 1
    return z


def kontaktbogen(fig, d, frames, ziel):
    w, h = d["bild"]
    skala = 2 if h <= 130 else 1
    rand, kopf = 4, 14
    zeilen = list(d["animationen"].items())
    breite = max(a["bilder"] for _, a in zeilen) * (w * skala + rand) + rand + 150
    hoehe = len(zeilen) * (h * skala + kopf + rand) + rand
    bogen = Image.new("RGB", (breite, hoehe), (70, 70, 78))
    z = ImageDraw.Draw(bogen)
    y = rand
    idle_m = mass(frames[d["animationen"]["idle"]["von"]]) if "idle" in d["animationen"] else None
    for name, a in zeilen:
        folge = a.get("folge", list(range(a["bilder"])))
        z.text((rand, y), "%s  %d Bilder, %d Schritte x %d ms = %.2f s, %s" % (
            name, a["bilder"], len(folge), a["ms"], len(folge) * a["ms"] / 1000.0,
            "Schleife" if a.get("schleife", True) else "einmalig"), fill=(255, 255, 255))
        for i in range(a["bilder"]):
            fr = frames[a["von"] + i]
            x = rand + i * (w * skala + rand)
            feld = Image.new("RGBA", (w * skala, h * skala), (112, 112, 124, 255))
            gross = fr.resize((w * skala, h * skala), Image.NEAREST)
            feld.alpha_composite(gross)
            bogen.paste(feld.convert("RGB"), (x, y + kopf))
            if idle_m:
                # rote Linie = Fusslinie des Stands, gruen = Kopfhoehe des Stands
                fy = y + kopf + (h - idle_m["fuss"]) * skala
                z.line((x, fy, x + w * skala, fy), fill=(255, 60, 60))
                ky = y + kopf + idle_m["y0"] * skala
                z.line((x, ky, x + w * skala, ky), fill=(60, 220, 90))
            z.text((x + 2, y + kopf + 1), str(i), fill=(255, 255, 0))
        y += h * skala + kopf + rand
    os.makedirs(os.path.dirname(ziel), exist_ok=True)
    bogen.save(ziel)


def main():
    os.makedirs(ZIEL, exist_ok=True)
    kuerzel_laden()
    zeile, ruhe, warten = tabellen()
    daten = {f: bilder_laden(f) for f in FIG}
    namen = set()
    for d, _ in daten.values():
        namen |= set(d["animationen"].keys())
    stellen = code_stellen(namen)
    reg = regie()
    skript = lies("docs/skript/prolog.md") + lies("docs/skript/welt-1.md") + lies("docs/skript/zwischenspiele-und-finale.md")

    inv = []
    mess_b = []
    mess_a = []
    for fig in FIG:
        d, frames = daten[fig]
        w, h = d["bild"]
        anims = d["animationen"]
        idle_m = mass(frames[anims["idle"]["von"]]) if "idle" in anims else None
        hashes = {}
        for name, a in anims.items():
            hashes[name] = [hashlib.md5(frames[a["von"] + i].tobytes()).hexdigest() for i in range(a["bilder"])]
        for name, a in anims.items():
            folge = a.get("folge", list(range(a["bilder"])))
            schleife = a.get("schleife", True)
            dauer = len(folge) * a["ms"] / 1000.0
            # Aufrufe
            auf = []
            for zid, art in zeile.get((fig, name), []):
                auf.append("ZEILE %s (%s)" % (zid, art))
            if len(auf) > 6:
                auf = auf[:3] + ["… insgesamt %d ZEILE-Eintraege" % len(zeile[(fig, name)])]
            for dt in ruhe.get((fig, name), []):
                auf.append("RUHE " + dt)
            for dt in warten.get((fig, name), []):
                auf.append("WARTEN " + dt)
            sicher, unklar = [], []
            for rel, nr, text in stellen.get(name, []):
                (sicher if stelle_passt(fig, name, rel, text) else unklar).append("%s:%d" % (rel.replace("game/", "", 1), nr))
            auf += sicher[:6]
            if len(sicher) > 6:
                auf.append("… %d Stellen" % len(sicher))
            # doppelt: gleiche Bildfolge wie eine andere Animation
            doppelt = [o for o in anims if o != name and hashes[o] == hashes[name]]
            teil_idle = ""
            if name != "idle" and "idle" in anims:
                gl = sum(1 for x in hashes[name] if x in hashes["idle"])
                teil_idle = "%d/%d" % (gl, a["bilder"])
            if name.endswith("_alt"):
                status = "Altfassung"
            elif name in GENERISCH:
                status = "generisch"
            elif auf:
                status = "aufgerufen"
            elif unklar:
                status = "pruefen (Name im Code, Figur unklar)"
            else:
                status = "UNGENUTZT"
            inv.append({
                "figur": fig, "animation": name, "von": a["von"], "bilder": a["bilder"], "schritte": len(folge),
                "ms": a["ms"], "dauer_s": "%.2f" % dauer, "schleife": "ja" if schleife else "nein",
                "status": status, "regie": "ja" if (fig, name) in reg else "", "aufrufe": "; ".join(auf),
                "name_im_code_unklar": "; ".join(unklar[:6]), "gleich_wie": ",".join(doppelt),
                "bilder_gleich_idle": teil_idle,
            })
            # Messwerte
            ms = []
            for i in range(a["bilder"]):
                m = mass(frames[a["von"] + i])
                mg = magenta(frames[a["von"] + i])
                if m is None:
                    mess_b.append({"figur": fig, "animation": name, "bild": i, "leer": "ja"})
                    continue
                ms.append(m)
                mess_b.append({"figur": fig, "animation": name, "bild": i, "leer": "", "x0": m["x0"], "y0": m["y0"],
                               "x1": m["x1"], "y1": m["y1"], "breite": m["breite"], "hoehe": m["hoehe"],
                               "fuss_ueber_boden": m["fuss"], "cx_zur_mitte": m["cx"], "magenta_px": mg})
            if not ms:
                continue
            diffs = []
            for k in range(len(folge) - 1):
                diffs.append(unterschied(frames[a["von"] + folge[k]], frames[a["von"] + folge[k + 1]]))
            naht = unterschied(frames[a["von"] + folge[-1]], frames[a["von"] + folge[0]]) if len(folge) > 1 else 0.0
            mittel = sum(x for x in diffs if x > 0) / max(1, len([x for x in diffs if x > 0])) if diffs else 0.0
            zeile_a = {"figur": fig, "animation": name, "schleife": "ja" if schleife else "nein",
                       "hoehe_min": min(m["hoehe"] for m in ms), "hoehe_max": max(m["hoehe"] for m in ms),
                       "fuss_min": min(m["fuss"] for m in ms), "fuss_max": max(m["fuss"] for m in ms),
                       "cx_min": min(m["cx"] for m in ms), "cx_max": max(m["cx"] for m in ms),
                       "wechsel_mittel": "%.4f" % mittel, "naht": "%.4f" % naht,
                       "naht_faktor": "%.1f" % (naht / mittel) if mittel > 0 and schleife else ""}
            if idle_m:
                zeile_a["stand_hoehe"] = idle_m["hoehe"]
                zeile_a["stand_fuss"] = idle_m["fuss"]
                zeile_a["h_abw_max_proz"] = "%.1f" % max(abs(m["hoehe"] - idle_m["hoehe"]) * 100.0 / idle_m["hoehe"] for m in ms)
                zeile_a["fuss_abw_max"] = max(abs(m["fuss"] - idle_m["fuss"]) for m in ms)
                zeile_a["cx_abw_max"] = "%.1f" % max(abs(m["cx"] - idle_m["cx"]) for m in ms)
                # erstes und letztes Bild gegen den Stand (Uebergang)
                zeile_a["erstes_gegen_stand"] = "%.4f" % unterschied(frames[anims["idle"]["von"]], frames[a["von"] + folge[0]])
                zeile_a["letztes_gegen_stand"] = "%.4f" % unterschied(frames[anims["idle"]["von"]], frames[a["von"] + folge[-1]])
            mess_a.append(zeile_a)
        kontaktbogen(fig, d, frames, os.path.join(ZIEL, "kontaktboegen", fig + ".png"))

    def schreiben(name, zeilen):
        felder = []
        for z in zeilen:
            for k in z:
                if k not in felder:
                    felder.append(k)
        with open(os.path.join(ZIEL, name), "w", newline="", encoding="utf-8-sig") as f:
            w = csv.DictWriter(f, fieldnames=felder, delimiter=";")
            w.writeheader()
            w.writerows(zeilen)

    schreiben("inventar.csv", inv)
    schreiben("messwerte_bilder.csv", mess_b)
    schreiben("messwerte_animationen.csv", mess_a)

    # Ambiente und Effekte: Dateien, Bilder, Fundstellen
    amb = []
    layout = lies("tools/layout/prolog.yaml") + lies("tools/layout/welt-1.yaml")
    code = ""
    for pfad in glob.glob(os.path.join(WURZEL, "game", "**", "*.gd"), recursive=True):
        if "/tests/" in pfad.replace("\\", "/") or "addons" in pfad:
            continue
        with open(pfad, encoding="utf-8") as f:
            code += "\n#DATEI " + os.path.relpath(pfad, WURZEL).replace("\\", "/") + "\n" + f.read()
    for pfad in sorted(glob.glob(os.path.join(WURZEL, "game/grafik/ambiente/*.png"))):
        name = os.path.basename(pfad)
        im = Image.open(pfad)
        n_layout = len(re.findall(r"ambiente/%s\b" % re.escape(name), layout))
        n_code = len(re.findall(r"ambiente/%s\b" % re.escape(name), code))
        m = re.search(r"ambiente/%s, bilder: (\d+)" % re.escape(name), layout)
        amb.append({"datei": name, "groesse": "%dx%d" % im.size, "bilder_layout": m.group(1) if m else "",
                    "im_layout_p_w1": n_layout, "im_code": n_code})
    schreiben("ambiente.csv", amb)

    # Kurzbericht
    print("Animationen:", len(inv))
    for st in sorted(set(z["status"] for z in inv)):
        print(" ", st, sum(1 for z in inv if z["status"] == st))
    print("UNGENUTZT / pruefen:")
    for z in inv:
        if z["status"].startswith(("UNGENUTZT", "pruefen")):
            print("  ", z["figur"], z["animation"], z["status"], "|", z["name_im_code_unklar"])
    print("gleich wie andere:")
    for z in inv:
        if z["gleich_wie"]:
            print("  ", z["figur"], z["animation"], "=", z["gleich_wie"])
    print("Tabelleneintraege ohne Animation:")
    for (fig, anim), v in list(zeile.items()) + list(ruhe.items()) + list(warten.items()):
        if fig in daten and anim not in daten[fig][0]["animationen"]:
            print("  ", fig, anim, v[:2])
    print("leere Bilder:", [(z["figur"], z["animation"], z["bild"]) for z in mess_b if z.get("leer")])
    print("Magenta:", [(z["figur"], z["animation"], z["bild"], z["magenta_px"]) for z in mess_b if z.get("magenta_px")])


if __name__ == "__main__":
    main()
