#!/usr/bin/env python3
"""Raum-Generator (A5): Welt-Tabelle + Skript → Bauplan und Platzhaltergrafik für Godot.

Aufruf aus dem Repo-Wurzelverzeichnis:
  python3 tools/godot_raeume.py prolog            # schreibt Bauplan und Platzhalter
  python3 tools/godot_raeume.py --pruefen prolog  # exit 1, wenn der Bauplan veraltet ist

Danach baut Godot die Popochiu-Objekte (Räume, Figuren, Gegenstände, Hotspots, Props,
Dialoge) mit Popochius eigenen Factories:
  godot --headless --editor --path game -- --cq-bauen

Quellen (Besitzer, siehe docs/00-aufbau.md):
  game/daten/welten/<abschnitt>.json   Welt-Tabelle (erzeugt von tools/spieldaten.py)
  docs/skript/<datei>.md               Zeilen-IDs, Auslöser, Regie (über tools/skript_export.py)
  game/lokalisierung/texte.csv         Schlüssel für Objektnamen (UI_OBJ_*, aus uebersetzung/ui.csv)
  tools/layout/<abschnitt>.yaml        Platzhalter-Layout (nur Startwerte für die Graubox)

Ausgaben (werden eingecheckt, nie von Hand bearbeiten):
  game/daten/raeume/<abschnitt>.json   Bauplan: Räume mit Hotspots, Props, Ausgängen,
                                       Ansehen-Zeilen mit Bedingung, Nehmen-Zeilen,
                                       Gesprächsbäumen, Zurufen und Ersatzzeilen
  game/grafik/platzhalter/*.png        Platzhalter: Hintergründe mit beschrifteten Flächen,
                                       Figuren, Inventar-Symbole, Nahansichten

Trennung generiert/handgeschrieben: Der Bauplan und die Platzhalter werden bei jedem Lauf
neu geschrieben. Die Popochiu-Szenen und -Skripte legt der Godot-Bau nur an, wenn sie fehlen;
danach gehören sie Godot (Umrisse, Positionen) und dem Rätselcode (Skripte). Ansehen-Zeilen,
Nehmen und Gespräche liest das Spiel zur Laufzeit aus dem Bauplan, also wirkt eine
Skriptänderung nach erneutem Lauf dieses Werkzeugs ohne Eingriff in den Rätselcode.
"""
import csv
import json
import re
import sys
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parent))
import skript_export  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
GAME = ROOT / "game"
WELTEN = GAME / "daten" / "welten"
RAEUME = GAME / "daten" / "raeume"
PLATZHALTER = GAME / "grafik" / "platzhalter"
TEXTE = GAME / "lokalisierung" / "texte.csv"
LAYOUT = ROOT / "tools" / "layout"
RES_PLATZHALTER = "res://grafik/platzhalter/"

UMLAUTE = str.maketrans({"ä": "ae", "ö": "oe", "ü": "ue", "Ä": "Ae", "Ö": "Oe", "Ü": "Ue", "ß": "ss"})
BEDINGUNG_RE = re.compile(r"\b(vor|nach)\s+([PRF]\d+[a-d]?)\b")
FARBEN = {"MAX": "#ffffff", "PIX": "#5fd3c8", "OPA": "#f5a04a"}   # 05-spielsysteme.md, Schrift


def slug(text):
    t = text.translate(UMLAUTE).lower()
    t = re.sub(r"[^a-z0-9]+", "_", t).strip("_")
    return t


def pascal(ident):
    return "".join(teil.capitalize() for teil in ident.split("_"))


def bedingungen(text):
    """„nach P1, vor P3“ → [{"art": "nach", "raetsel": "P1"}, …]; Rest bleibt als Text."""
    if not text:
        return [], ""
    liste = [{"art": a, "raetsel": r} for a, r in BEDINGUNG_RE.findall(text)]
    rest = BEDINGUNG_RE.sub("", text).strip(" ,;")
    return liste, rest


def objekt_aus_ausloeser(ausloeser):
    """„Ansehen: Kalender, zweites Mal“ → ("kalender", "Kalender", "zweites Mal")."""
    rest = ausloeser.split(":", 1)[1].strip() if ":" in ausloeser else ausloeser.strip()
    rest = re.sub(r"\s*\([^)]*\)", "", rest)
    name, _, zusatz = rest.partition(",")
    return slug(name), name.strip(), zusatz.strip()


def texte_schluessel():
    with TEXTE.open(encoding="utf-8") as f:
        return {r["keys"]: r["de"] for r in csv.DictReader(f)}


def blasen(zid, texte):
    """Alle Sprechblasen-Schlüssel einer Zeile (Kaskaden _2, _3 …)."""
    out = [zid]
    i = 2
    while f"{zid}_{i}" in texte:
        out.append(f"{zid}_{i}")
        i += 1
    return out


def zeile(z, texte, mal=1):
    bed, rest = bedingungen(z["bedingung"])
    d = {"zeile": z["id"], "sprecher": z["sprecher"], "blasen": blasen(z["id"], texte)}
    if bed:
        d["bedingung"] = bed
    if rest:
        d["bedingung_text"] = rest      # nicht maschinenlesbar: Rätselcode entscheidet
    if mal > 1:
        d["mal"] = mal
    return d


def baue(abschnitt):
    welt = json.loads((WELTEN / f"{abschnitt}.json").read_text(encoding="utf-8"))
    layout = yaml.safe_load((LAYOUT / f"{abschnitt}.yaml").read_text(encoding="utf-8")) or {}
    texte = texte_schluessel()
    praefixe = welt["skript_praefix"] if isinstance(welt["skript_praefix"], list) else [welt["skript_praefix"]]
    alle = [z for z in skript_export.zeilen_lesen() if z["abschnitt"] in praefixe]
    code_zu_raum = {c: r["id"] for r in welt["raeume"] for c in r["skript_code"]}
    fehler, warnungen = [], []

    def name_key(ident, de_name):
        key = f"UI_OBJ_{ident.upper()}"
        if key not in texte:
            fehler.append(f"{key} fehlt in docs/uebersetzung/ui.csv (Vorschlag: {key},{de_name},)")
        return key

    gegenstaende = {g["id"]: g for g in welt.get("gegenstaende", [])}
    figuren = {f["id"]: f for f in welt.get("figuren", [])}

    # ---- Räume -------------------------------------------------------------------------------
    raeume = []
    for r in welt["raeume"]:
        lay = layout.get(r["id"], {})
        breite, hoehe = (int(x) for x in r["groesse"].split("x"))
        raum = {
            "id": r["id"],
            "script_name": pascal(r["id"]),
            "name_key": f"UI_RAUM_{r['id'].upper()}",
            "groesse": [breite, hoehe],
            "hintergrund": f"{RES_PLATZHALTER}raum_{r['id']}.png",
            "farbe": lay.get("farbe", "#5a4a3a"),
            "laufbereich": lay.get("laufbereich", [[0, hoehe - 40], [breite, hoehe - 40], [breite, hoehe], [0, hoehe]]),
            "marker": lay.get("marker", {}),
            "figuren": [],
            "hotspots": [],
            "props": [],
            "ausgaenge": [],
            "zurufe": [],
        }
        if raum["name_key"] not in texte:
            fehler.append(f"{raum['name_key']} fehlt in docs/uebersetzung/ui.csv")
        for fid, pos in (lay.get("figuren") or {}).items():
            raum["figuren"].append({"id": fid, "script_name": pascal(fid), "pos": pos})
        for ziel in r["ausgaenge"]:
            a = (lay.get("ausgaenge") or {}).get(ziel, {})
            aid = a.get("id", f"ausgang_{ziel}")
            anzeige = a.get("name")
            raum["ausgaenge"].append({
                "id": aid, "script_name": pascal(aid), "ziel": ziel,
                "name_key": name_key(aid, anzeige or f"Zum {ziel}") if anzeige else f"UI_RAUM_{ziel.upper()}",
                "rect": a.get("rect", [0, 0, 24, 24]), "gehe": a.get("gehe", [0, 0]),
            })
            if not a:
                warnungen.append(f"{r['id']}: Ausgang {ziel} ohne Layout")
        for pid, p in (lay.get("props") or {}).items():
            item = p.get("item", pid if pid in gegenstaende else None)
            raum["props"].append({
                "id": pid, "script_name": pascal(pid),
                "name_key": name_key(pid, gegenstaende.get(pid, {}).get("name", pid)),
                "rect": p["rect"], "gehe": p.get("gehe", [0, 0]),
                "textur": f"{RES_PLATZHALTER}prop_{pid}.png",
                "gegenstand": item, "ansehen": [], "nehmen": None,
            })
        for hid, h in (lay.get("hotspots") or {}).items():
            if h.get("name"):
                raum["hotspots"].append({
                    "id": hid, "script_name": pascal(hid), "name_key": name_key(hid, h["name"]),
                    "rect": h["rect"], "gehe": h.get("gehe", [0, 0]), "ansehen": [],
                })
        raeume.append(raum)
    raum_nach_id = {r["id"]: r for r in raeume}

    def objekt(raum, oid, anzeige):
        for liste in ("props", "hotspots", "ausgaenge"):
            for o in raum[liste]:
                if o["id"] == oid:
                    return o
        if oid in [f["id"] for f in raum["figuren"]]:
            return None
        lay = (layout.get(raum["id"], {}).get("hotspots") or {}).get(oid)
        if not lay:
            warnungen.append(f"{raum['id']}: Hotspot {oid} ohne Layout, Platzhalter-Rechteck oben links")
            n = len(raum["hotspots"])
            lay = {"rect": [4 + (n % 8) * 38, 4 + (n // 8) * 20, 34, 16], "gehe": [160, 160]}
        o = {"id": oid, "script_name": pascal(oid), "name_key": name_key(oid, anzeige),
             "rect": lay["rect"], "gehe": lay.get("gehe", [0, 0]), "ansehen": []}
        raum["hotspots"].append(o)
        return o

    # ---- Zeilen zuordnen ---------------------------------------------------------------------
    figuren_ansehen = {}
    zaehler = {}
    for z in alle:
        raum = raum_nach_id.get(code_zu_raum.get(z["szene"]))
        if z["kapitel"].lower().endswith("zurufe") and raum:
            bed, rest = bedingungen(z["bedingung"])
            d = {"zeile": z["id"], "sprecher": z["sprecher"], "blasen": blasen(z["id"], texte)}
            if bed:
                d["bedingung"] = bed
            if rest:
                d["bedingung_text"] = rest
            raum["zurufe"].append(d)
            continue
        if not raum or z["art"] not in ("Ansehen", "Nehmen"):
            continue
        oid, anzeige, zusatz = objekt_aus_ausloeser(z["ausloeser"])
        if z["art"] == "Ansehen":
            if oid in figuren:
                figuren_ansehen.setdefault(oid, []).append(zeile(z, texte))
                continue
            o = objekt(raum, oid, anzeige)
            zaehler[(raum["id"], oid)] = zaehler.get((raum["id"], oid), 0) + 1
            mal = 2 if "zweites mal" in zusatz.lower() else 1
            o["ansehen"].append(zeile(z, texte, mal))
        elif z["art"] == "Nehmen":
            treffer = [p for p in raum["props"] if p["id"] == oid]
            if not treffer:
                warnungen.append(f"{z['id']}: Nehmen {anzeige} ohne Prop im Layout von {raum['id']}")
                continue
            treffer[0]["nehmen"] = zeile(z, texte)

    # ---- Figuren und Gegenstände -------------------------------------------------------------
    figuren_out = []
    for f in welt.get("figuren", []):
        figuren_out.append({
            "id": f["id"], "script_name": pascal(f["id"]), "kuerzel": f.get("kuerzel"),
            "name_key": name_key(f["id"], f["name"]), "groesse_px": f.get("groesse_px", 48),
            "spielbar": bool(f.get("spielbar")), "textfarbe": FARBEN.get(f.get("kuerzel"), "#ffffff"),
            "sprite": f"{RES_PLATZHALTER}figur_{f['id']}.png",
            "raeume": f["raum"] if isinstance(f["raum"], list) else [f["raum"]],
            "ansehen": figuren_ansehen.get(f["id"], []),
        })
    gegenstaende_out = []
    for g in welt.get("gegenstaende", []):
        eintrag = {
            "id": g["id"], "script_name": pascal(g["id"]), "name_key": name_key(g["id"], g["name"]),
            "zustaende": g.get("zustaende", []), "reist_mit": g.get("reist_mit", False),
            "nahansicht": g.get("nahansicht", False),
            "icon": f"{RES_PLATZHALTER}gegenstand_{g['id']}.png",
            "icons": {s: f"{RES_PLATZHALTER}gegenstand_{g['id']}_{slug(s)}.png" for s in g.get("zustaende", [])[1:]},
        }
        de = texte.get(eintrag["name_key"])
        if de is not None and de != g["name"]:
            warnungen.append(f"{eintrag['name_key']}: ui.csv „{de}“ weicht von der Welt-Tabelle „{g['name']}“ ab")
        gegenstaende_out.append(eintrag)

    # ---- Gespräche (Abschnitt „Gespräche“: Option + Antworten) -------------------------------
    dialoge = {}
    aktuelle = None
    for z in alle:
        if "gespräche" not in z["kapitel"].lower():
            continue
        m = re.match(r"Option (\w+)(.*)", z["regie"])
        if m:
            fig = slug(m.group(1))
            rest = m.group(2)
            bed, _ = bedingungen(rest)
            if "nur vor" in rest:
                bed = [{"art": "vor", "raetsel": r} for r in re.findall(r"nur vor\s+([PRF]\d+)", rest)]
            aktuelle = {"id": z["id"].rsplit("_", 1)[1], "frage": z["id"], "antworten": [],
                        "beendet": "beendet das Gespräch" in rest}
            if bed:
                aktuelle["bedingung"] = bed
            d = dialoge.setdefault(fig, {"id": fig, "script_name": pascal(fig), "optionen": []})
            d["optionen"].append(aktuelle)
        elif aktuelle:
            aktuelle["antworten"].append({"zeile": z["id"], "sprecher": z["sprecher"],
                                          "blasen": blasen(z["id"], texte), "regie": z["regie"]})

    # ---- Ersatzpool ---------------------------------------------------------------------------
    ersatz = {}
    for z in skript_export.zeilen_lesen():
        if z["szene"] == "ERS":
            ersatz.setdefault(z["sprecher"], []).append(z["id"])

    plan = {
        "abschnitt": abschnitt,
        "erzeugt_von": "tools/godot_raeume.py",
        "praefix": praefixe[0],
        "raeume": raeume,
        "figuren": figuren_out,
        "gegenstaende": gegenstaende_out,
        "nahansichten": [{"id": n["id"], "name_key": name_key(n["id"], n["name"]), "raum": n["raum"],
                          "bild": f"{RES_PLATZHALTER}nah_{n['id']}.png"} for n in welt.get("nahansichten", [])]
                        + [{"id": g["id"], "name_key": f"UI_OBJ_{g['id'].upper()}", "raum": None,
                            "bild": f"{RES_PLATZHALTER}nah_{g['id']}.png"} for g in welt.get("gegenstaende", [])
                           if g.get("nahansicht")],
        "dialoge": list(dialoge.values()),
        "ersatz": ersatz,
    }
    return plan, fehler, warnungen


# ---- Platzhaltergrafik ---------------------------------------------------------------------------
def platzhalter(plan):
    from PIL import Image, ImageDraw, ImageFont

    PLATZHALTER.mkdir(parents=True, exist_ok=True)
    font = ImageFont.load_default_imagefont()
    texte = texte_schluessel()

    def farbe(hexwert, faktor=1.0):
        h = hexwert.lstrip("#")
        r, g, b = (int(h[i:i + 2], 16) for i in (0, 2, 4))
        return tuple(max(0, min(255, int(c * faktor))) for c in (r, g, b)) + (255,)

    def beschriften(d, rect, text, fuell, rand):
        x, y, w, h = rect
        d.rectangle([x, y, x + w - 1, y + h - 1], fill=fuell, outline=rand)
        tw = d.textlength(text, font=font)
        if tw > w - 2 and w < 60:
            text = text[: max(1, int((w - 2) / 6))]
        d.text((x + 2, y + 1), text, font=font, fill=(255, 255, 255, 255))

    for raum in plan["raeume"]:
        w, h = raum["groesse"]
        img = Image.new("RGBA", (w, h), farbe(raum["farbe"]))
        d = ImageDraw.Draw(img)
        poly = [tuple(p) for p in raum["laufbereich"]]
        d.polygon(poly, fill=farbe(raum["farbe"], 0.7))
        d.text((4, h - 12), f"[{texte.get(raum['name_key'], raum['id'])}]", font=font, fill=(255, 255, 255, 255))
        for hs in raum["hotspots"]:
            beschriften(d, hs["rect"], texte.get(hs["name_key"], hs["id"]), farbe(raum["farbe"], 1.35), (38, 43, 68, 255))
        for a in raum["ausgaenge"]:
            beschriften(d, a["rect"], "> " + texte.get(a["name_key"], a["ziel"]), (38, 43, 68, 255), (255, 255, 255, 255))
        img.save(PLATZHALTER / f"raum_{raum['id']}.png")
        for p in raum["props"]:
            pw, ph = p["rect"][2], p["rect"][3]
            name = texte.get(p["name_key"], p["id"])
            if p["id"] == "zapp_o_mat":
                # Zustandsreihe wie in grafik/02: dunkel, Rauschen, Rauschen+Antenne, bunt, Wirbel
                zustaende = [("aus", "#262b44"), ("Schnee", "#8b9bb4"), ("Antenne", "#8b9bb4"),
                             ("bunt", "#b55088"), ("Wirbel", "#68386c")]
                sheet = Image.new("RGBA", (pw * len(zustaende), ph), (0, 0, 0, 0))
                for i, (zname, zfarbe) in enumerate(zustaende):
                    dd = ImageDraw.Draw(sheet)
                    x0 = i * pw
                    dd.rectangle([x0, 8, x0 + pw - 1, ph - 1], fill=farbe("#733e39"), outline=(38, 43, 68, 255))
                    dd.rectangle([x0 + 4, 12, x0 + pw - 10, 40], fill=farbe(zfarbe))
                    if zname in ("Antenne", "bunt", "Wirbel"):
                        dd.line([x0 + 10, 8, x0 + 4, 0], fill=(192, 203, 220, 255))
                        dd.line([x0 + 30, 8, x0 + 36, 0], fill=(192, 203, 220, 255))
                    dd.text((x0 + 3, 42), "ZAPP", font=font, fill=(255, 255, 255, 255))
                    dd.text((x0 + 3, 51), zname[:7], font=font, fill=(255, 255, 255, 255))
                sheet.save(PLATZHALTER / f"prop_{p['id']}.png")
                continue
            img = Image.new("RGBA", (pw, ph), farbe("#e4a672"))
            ImageDraw.Draw(img).rectangle([0, 0, pw - 1, ph - 1], outline=(38, 43, 68, 255))
            img.save(PLATZHALTER / f"prop_{p['id']}.png")

    for f in plan["figuren"]:
        hoehe = f["groesse_px"]
        breite = 24 if f["id"] == "pixel" else max(16, hoehe // 3)
        if f["id"] == "pixel":
            hoehe = 12
        img = Image.new("RGBA", (breite, hoehe), (0, 0, 0, 0))
        d = ImageDraw.Draw(img)
        d.rectangle([0, 0, breite - 1, hoehe - 1], fill=farbe(f["textfarbe"], 0.55), outline=(38, 43, 68, 255))
        d.text((2, 1), (f["kuerzel"] or f["id"])[:3], font=font, fill=(255, 255, 255, 255))
        img.save(PLATZHALTER / f"figur_{f['id']}.png")
        # Porträt 24×24 für die Leiste oben links
        p = Image.new("RGBA", (24, 24), farbe(f["textfarbe"], 0.55))
        dp = ImageDraw.Draw(p)
        dp.rectangle([0, 0, 23, 23], outline=(38, 43, 68, 255))
        dp.text((3, 6), (f["kuerzel"] or "?")[:3], font=font, fill=(255, 255, 255, 255))
        p.save(PLATZHALTER / f"portraet_{f['id']}.png")

    for g in plan["gegenstaende"]:
        for zustand, pfad in [(None, g["icon"])] + list(g["icons"].items()):
            img = Image.new("RGBA", (24, 24), farbe("#3e8948"))
            d = ImageDraw.Draw(img)
            d.rectangle([0, 0, 23, 23], outline=(38, 43, 68, 255))
            kurz = texte.get(g["name_key"], g["id"])[:3]
            d.text((2, 2), kurz, font=font, fill=(255, 255, 255, 255))
            if zustand:
                d.text((2, 12), slug(zustand)[:3], font=font, fill=(254, 231, 97, 255))
            img.save(PLATZHALTER / pfad.rsplit("/", 1)[1])

    for n in plan["nahansichten"]:
        img = Image.new("RGBA", (320, 180), (38, 43, 68, 235))
        d = ImageDraw.Draw(img)
        d.rectangle([20, 14, 299, 165], fill=farbe("#ead4aa"), outline=(255, 255, 255, 255))
        d.text((28, 20), "NAHANSICHT (Platzhalter)", font=font, fill=(38, 43, 68, 255))
        d.text((28, 34), texte.get(n["name_key"], n["id"]), font=font, fill=(38, 43, 68, 255))
        if n["id"] == "kalender":
            # Inhalt laut skript/prolog.md (P0_DACH_MAX_0620, _0630)
            for i in range(28):
                x, y = 40 + (i % 7) * 34, 56 + (i // 7) * 24
                d.rectangle([x, y, x + 30, y + 20], outline=(90, 105, 136, 255))
                d.text((x + 2, y + 2), str(i + 1), font=font, fill=(38, 43, 68, 255))
            d.ellipse([40 + 3 * 34 - 4, 56 + 2 * 24 - 4, 40 + 3 * 34 + 34, 56 + 2 * 24 + 24], outline=(228, 59, 68, 255), width=2)
            d.text((180, 152), "K3 - Schwurbelstein", font=font, fill=(38, 43, 68, 255))
        img.save(PLATZHALTER / f"nah_{n['id']}.png")

    # UI-Platzhalter: Hilfe-Pfote (normal, leuchtend, ausgegraut)
    for name, f in (("pfote", "#c28569"), ("pfote_leuchtet", "#feae34"), ("pfote_aus", "#5a6988")):
        img = Image.new("RGBA", (24, 24), (0, 0, 0, 0))
        d = ImageDraw.Draw(img)
        d.ellipse([5, 9, 19, 22], fill=farbe(f))
        for cx in (5, 10, 15, 20):
            d.ellipse([cx - 3, 2 + (2 if cx in (5, 20) else 0), cx + 1, 7 + (2 if cx in (5, 20) else 0)], fill=farbe(f))
        img.save(PLATZHALTER / f"ui_{name}.png")


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    pruefen = "--pruefen" in sys.argv
    abschnitte = args or sorted(p.stem for p in LAYOUT.glob("*.yaml"))
    rc = 0
    for ab in abschnitte:
        plan, fehler, warnungen = baue(ab)
        for w in warnungen:
            print(f"WARNUNG  {ab}: {w}")
        for f in fehler:
            print(f"FEHLER   {ab}: {f}")
        if fehler:
            rc = 1
            continue
        neu = json.dumps(plan, ensure_ascii=False, indent=1) + "\n"
        ziel = RAEUME / f"{ab}.json"
        if pruefen:
            alt = ziel.read_text(encoding="utf-8") if ziel.exists() else ""
            if alt != neu:
                print(f"game/daten/raeume/{ab}.json ist veraltet: python3 tools/godot_raeume.py {ab}")
                rc = 1
            continue
        RAEUME.mkdir(parents=True, exist_ok=True)
        ziel.write_text(neu, encoding="utf-8")
        platzhalter(plan)
        n_hs = sum(len(r["hotspots"]) for r in plan["raeume"])
        n_props = sum(len(r["props"]) for r in plan["raeume"])
        print(f"{ab}: {len(plan['raeume'])} Räume, {n_hs} Hotspots, {n_props} Props, "
              f"{len(plan['figuren'])} Figuren, {len(plan['gegenstaende'])} Gegenstände, "
              f"{len(plan['dialoge'])} Gespräche → game/daten/raeume/{ab}.json, game/grafik/platzhalter/")
    sys.exit(rc)


if __name__ == "__main__":
    main()
