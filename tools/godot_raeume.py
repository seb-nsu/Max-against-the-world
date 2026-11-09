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
from aufloesung import BREITE, HOEHE, UI_ICON  # noqa: E402

S = HOEHE / 180          # Maße unten sind für 320×180 gedacht und werden mitskaliert


def s_(v):
    return round(v * S)

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


# Zusätze im Auslöser oder in der Bedingung, die nur erklären (Hinweis, Folge, Animation) und
# nichts bedingen. Alles andere, was keine Rätsel-, Gegenstand- oder Zeilenbedingung ist, bleibt
# als „bedingung_text“ stehen: Ansehen-Zeilen zeigt das Spiel trotzdem, Gesprächsoptionen und
# Zurufe nur, wenn Spiel._bedingung_text_ok() den Text kennt (sonst entscheidet der Rätselcode).
ANMERKUNG_RE = re.compile(
    r"^(Hinweis|auch |löst |schaltet |führt |Notizbuch|Lösung|Pixels Wunsch|Szene|weiter |"
    r"Radio|Schwing|öffnet |Weg [AB]$|Max kennt|Rezept bekannt|die Nase lügt|Besen zuckt|"
    r"Flasche steht|grüner Rauch|Textvariante)")
# Auslöser im Abschnitt „Figurenwechsel“ (Szenen-Code WECH) → Schlüssel im Bauplan
WECHSEL_REGELN = [
    (r"^Wechsel zu Pixel", "zu_pixel"),
    (r"^Wechsel zu Max", "zu_max"),
    (r"^Pixel versucht, einen großen Gegenstand zu nehmen", "pixel_nehmen"),
    (r"^Pixel benutzt eine Tür", "pixel_tuer"),
    (r"^Max benutzt Dachbalken", "max_pixel_revier"),
    (r"^Max redet mit einem Tier", "max_tier"),
    (r"^Pixel redet mit einer Figur ohne", "pixel_figur"),
]
GEGENSTAND_BED_RE = re.compile(r"^(mit|ohne)\s+(.+)$")
ZEILE_BED_RE = re.compile(r"^nach\s+(\d{4})$")


def bedingungen(text, gegenstand_id=None, zeile_id=None):
    """„nach P1, vor P3“ → [{"art": "nach", "raetsel": "P1"}, …]; Rest bleibt als Text.

    gegenstand_id(name) → ID oder None: „mit Goldmünze“ → {"art": "hat", "gegenstand": …}
    zeile_id(nr) → Zeilen-ID oder None: „nach 0580“ → {"art": "nach_zeile", "zeile": …}
    """
    if not text:
        return [], ""
    liste = [{"art": a, "raetsel": r} for a, r in BEDINGUNG_RE.findall(text)]
    rest = []
    for teil in re.split(r"[,;]", BEDINGUNG_RE.sub("", text)):
        teil = teil.strip()
        if not teil or ANMERKUNG_RE.match(teil) or teil in ("und", "oder"):
            continue
        m = GEGENSTAND_BED_RE.match(teil)
        if m and gegenstand_id and gegenstand_id(m.group(2)):
            liste.append({"art": "hat" if m.group(1) == "mit" else "hat_nicht",
                          "gegenstand": gegenstand_id(m.group(2))})
            continue
        m = ZEILE_BED_RE.match(teil)
        if m and zeile_id and zeile_id(m.group(1)):
            liste.append({"art": "nach_zeile", "zeile": zeile_id(m.group(1))})
            continue
        rest.append(teil)
    return liste, ", ".join(rest)


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


def baue(abschnitt):
    welt = json.loads((WELTEN / f"{abschnitt}.json").read_text(encoding="utf-8"))
    layout = yaml.safe_load((LAYOUT / f"{abschnitt}.yaml").read_text(encoding="utf-8")) or {}
    texte = texte_schluessel()
    praefixe = welt["skript_praefix"] if isinstance(welt["skript_praefix"], list) else [welt["skript_praefix"]]
    alle = [z for z in skript_export.zeilen_lesen() if z["abschnitt"] in praefixe]
    nach_id = {z["id"]: z for z in alle}
    code_zu_raum = {c: r["id"] for r in welt["raeume"] for c in r["skript_code"]}
    fehler, warnungen = [], []
    # Ausbaustand der Graubox (tools/layout, Schlüssel „_ausbau“): nur diese Rätselschritte sind
    # gebaut; alle anderen bleiben gesperrt (Hilfe-Pfote, Notizbuch, Ausgänge). Ohne Angabe: alle.
    ausbau = layout.get("_ausbau") or [r["id"] for r in welt.get("raetsel", [])]
    gebaute_raeume = [r for r in welt["raeume"] if r["id"] in layout] or welt["raeume"]
    gebaut = {r["id"] for r in gebaute_raeume}

    def name_key(ident, de_name):
        key = f"UI_OBJ_{ident.upper()}"
        if key not in texte:
            fehler.append(f"{key} fehlt in docs/uebersetzung/ui.csv (Vorschlag: {key},{de_name},)")
        return key

    gegenstaende = {g["id"]: g for g in welt.get("gegenstaende", [])}
    figuren = {f["id"]: f for f in welt.get("figuren", [])}
    # Namen aus dem Skript → Gegenstand-ID („Käsefondue“, „Kochlöffel-Zauberstab“ → kochloeffel@zauberstab)
    gegenstand_namen = {slug(g["name"]): gid for gid, g in gegenstaende.items()}
    gegenstand_namen.update({gid: gid for gid in gegenstaende})
    gegenstand_namen.update(layout.get("_alias") or {})
    figur_namen = {slug(f["name"]): fid for fid, f in figuren.items()}
    figur_namen.update({fid: fid for fid in figuren})

    def gegenstand_id(name):
        g = gegenstand_namen.get(slug(re.sub(r"\s+im Inventar$", "", name.strip())))
        return g.split("@")[0] if g else None

    # ---- Räume -------------------------------------------------------------------------------
    raeume = []
    for r in gebaute_raeume:
        lay = layout.get(r["id"], {})
        breite, hoehe = (int(x) for x in r["groesse"].split("x"))
        raum = {
            "id": r["id"],
            "script_name": pascal(r["id"]),
            "name_key": f"UI_RAUM_{r['id'].upper()}",
            "groesse": [breite, hoehe],
            "hintergrund": f"{RES_PLATZHALTER}raum_{r['id']}.png",
            "farbe": lay.get("farbe", "#5a4a3a"),
            "laufbereich": lay.get("laufbereich", [[0, hoehe - s_(40)], [breite, hoehe - s_(40)], [breite, hoehe], [0, hoehe]]),
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
            ziel_raum = next((x for x in welt["raeume"] if x["id"] == ziel), {})
            ausgang = {
                "id": aid, "script_name": pascal(aid), "ziel": ziel,
                "name_key": name_key(aid, anzeige or f"Zum {ziel}") if anzeige else f"UI_RAUM_{ziel.upper()}",
                "rect": a.get("rect", [0, 0, UI_ICON, UI_ICON]), "gehe": a.get("gehe", [0, 0]),
                "erreichbar_ab": str(ziel_raum.get("erreichbar_ab", "start")),
                "ansehen": [],
            }
            # Gesperrt (Ziel erst nach einem Rätsel erreichbar): Zeile beim Klick, oder unsichtbar
            if a.get("gesperrt"):
                ausgang["gesperrt"] = a["gesperrt"]
            if a.get("versteckt"):
                ausgang["versteckt"] = True
            if ziel not in gebaut and not a.get("versteckt") and ausgang["erreichbar_ab"] in ausbau:
                fehler.append(f"{r['id']}: Ausgang {ziel} führt in einen Raum ohne Layout")
            raum["ausgaenge"].append(ausgang)
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
        lay = (layout.get(raum["id"], {}).get("hotspots") or {}).get(oid)
        if not lay:
            warnungen.append(f"{raum['id']}: Hotspot {oid} ohne Layout, Platzhalter-Rechteck oben links")
            n = len(raum["hotspots"])
            lay = {"rect": [s_(4 + (n % 8) * 38), s_(4 + (n // 8) * 20), s_(34), s_(16)], "gehe": [BREITE // 2, s_(160)]}
        o = {"id": oid, "script_name": pascal(oid), "name_key": name_key(oid, anzeige),
             "rect": lay["rect"], "gehe": lay.get("gehe", [0, 0]), "ansehen": []}
        raum["hotspots"].append(o)
        return o

    def zeile_id(z):
        """„nach 0580“ in Zeile z → Zeilen-ID derselben Szene."""
        def finde(nr):
            for k in nach_id:
                if k.startswith(f"{z['abschnitt']}_{z['szene']}_") and k.endswith("_" + nr):
                    return k
            return None
        return finde

    def zeile(z, mal=1, pixel=False):
        bed, rest = bedingungen(z["bedingung"], gegenstand_id, zeile_id(z))
        d = {"zeile": z["id"], "sprecher": z["sprecher"], "blasen": blasen(z["id"], texte)}
        if bed:
            d["bedingung"] = bed
        if rest:
            d["bedingung_text"] = rest      # nur in Worten: Rätselcode entscheidet
        if mal > 1:
            d["mal"] = mal
        if pixel:
            d["figur"] = "PIX"              # gilt, wenn Pixel die aktive Figur ist
        return d

    def aufloesen(raum, name):
        """Name aus dem Skript → ("figur"|"gegenstand"|"objekt", id, anzeige)."""
        name = re.sub(r"\s*\([^)]*\)", "", name).strip()
        name = re.sub(r"\s+(nach|vor|bevor|ohne)\s.*$", "", name)   # „Drehknopf nach P2“
        im_inventar = name.endswith(" im Inventar")
        name = re.sub(r"\s+im Inventar$", "", name)
        sl = slug(name)
        sl = (layout.get(raum["id"], {}).get("alias") or {}).get(sl, sl)
        lay = layout.get(raum["id"], {})
        if not im_inventar and (any(o["id"] == sl for li in ("props", "hotspots", "ausgaenge") for o in raum[li])
                                or sl in (lay.get("hotspots") or {})):
            return "objekt", sl, name
        if not im_inventar and sl in figur_namen:
            return "figur", figur_namen[sl], name
        if sl in gegenstand_namen and (im_inventar or not (layout.get(raum["id"], {}).get("hotspots") or {}).get(sl)):
            return "gegenstand", gegenstand_namen[sl], name
        return "objekt", sl, name

    # ---- Zeilen zuordnen ---------------------------------------------------------------------
    # Ansehen, Nehmen und Benutzen hängen am Objekt, an der Figur oder am Gegenstand;
    # „X auf Y“ mit einem Gegenstand X ist eine Kombination; „nach 0360“ ist eine Folgezeile.
    figur_daten = {}      # Figur-ID → {"ansehen": [...], "pixel_auf": [...], "pixel_redet": [...]}
    gegenstand_daten = {}  # Gegenstand-ID → {"ansehen": [...], "benutzen": [...], "kombinieren": [...]}
    wurzel = {}            # Zeilen-ID → Eintrag, an den Folgezeilen gehängt werden
    wechsel = {}           # Figurenwechsel: zu_pixel/zu_max (Pools) und feste Fälle
    vorige = None

    def ablegen(art, ziel, eintrag, raum, zustand=None):
        typ, oid, anzeige = ziel
        if raum and oid in (layout.get(raum["id"], {}).get("ohne") or []):
            return  # gehört zu einem Rätsel, das noch nicht gebaut ist (Layout „ohne“)
        if zustand:
            eintrag["zustand"] = zustand
        if typ == "figur":
            liste = figur_daten.setdefault(oid, {}).setdefault(art, [])
            if raum:
                eintrag["raum"] = raum["id"]
        elif typ == "gegenstand":
            gid, _, zst = oid.partition("@")
            if zst:
                eintrag["zustand"] = zst
            liste = gegenstand_daten.setdefault(gid, {}).setdefault(art, [])
        else:
            liste = objekt(raum, oid, anzeige).setdefault(art, [])
        liste.append(eintrag)
        wurzel[eintrag["zeile"]] = eintrag

    for z in alle:
        raum = raum_nach_id.get(code_zu_raum.get(z["szene"]))
        a = z["ausloeser"]
        letzte, vorige = vorige, z
        if not raum and z["szene"] not in code_zu_raum.keys():
            raum = None
        if (z["kapitel"].lower().endswith("zurufe") or a.startswith("Zuruf")
                or z["block"].startswith("Zurufe")):
            if raum:
                raum["zurufe"].append(zeile(z))
            continue
        if z["szene"] in code_zu_raum and not raum:
            continue  # Raum noch nicht gebaut
        m = re.match(r"^nach (\d{4})$", a)
        if m:
            ziel = zeile_id(z)(m.group(1))
            if ziel in wurzel:
                d = zeile(z)
                wurzel[ziel].setdefault("folge", []).append(d)
                wurzel[z["id"]] = wurzel[ziel]
            continue
        if z["szene"] == "INV" and a.startswith("Ansehen:"):
            # Inventar ansehen: „Ansehen: Thunfischdose, leer“ (Zustand nach dem Komma)
            # „Ansehen: Eimer, mit_wasser, zweites Mal“, „…, Pixel“: Zustand, zweites Mal, Pixel
            teile_inv = [t.strip() for t in a.split(":", 1)[1].split(";")[0].split(",")]
            gid = gegenstand_id(teil0 := teile_inv[0])
            if gid:
                zusatz = [t.lower() for t in teile_inv[1:]]
                eintrag = zeile(z, 2 if "zweites mal" in zusatz else 1, "pixel" in zusatz)
                for zst in teile_inv[1:]:
                    if zst in gegenstaende.get(gid, {}).get("zustaende", []):
                        eintrag["zustand"] = zst
                gegenstand_daten.setdefault(gid, {}).setdefault("ansehen", []).append(eintrag)
                wurzel[z["id"]] = eintrag
            else:
                warnungen.append(f"{z['id']}: Gegenstand {teil0} unbekannt")
            continue
        if z["szene"] == "WECH":
            # Figurenwechsel (Welt-Skript, Abschnitt „Figurenwechsel“): Pools und feste Fälle
            for muster, schluessel in WECHSEL_REGELN:
                if re.match(muster, a):
                    if schluessel in ("zu_pixel", "zu_max"):
                        wechsel.setdefault(schluessel, []).append(z["id"])
                    else:
                        wechsel[schluessel] = z["id"]
            continue
        if not raum or z["szene"] in ("HINT", "ERS"):
            continue
        if re.match(r"^Pixel redet mit [^,;]+$", z["regie"]) and not a:
            a = z["regie"]
        if z["regie"] == "Übersetzung" and not a:
            a = "Übersetzung"
        if not a:
            continue
        teile = [t.strip() for t in re.sub(r"\s*\([^)]*\)", "", a).split(",")]
        if a.startswith("Pixel auf "):
            name = a[len("Pixel auf "):].split(",")[0]
            typ, fid, _ = aufloesen(raum, name)
            if typ == "figur":
                ablegen("pixel_auf", ("figur", fid, name), zeile(z), raum)
            continue
        if re.match(r"^Pixel redet mit [^,;]+$", a):
            name = a[len("Pixel redet mit "):]
            typ, fid, _ = aufloesen(raum, name)
            if typ == "figur":
                ablegen("pixel_redet", ("figur", fid, name), zeile(z), raum)
            continue
        if a == "Übersetzung" and letzte and letzte["id"] in wurzel:
            wurzel[letzte["id"]].setdefault("folge", []).append(zeile(z))
            wurzel[z["id"]] = wurzel[letzte["id"]]
            continue
        if teile[0].startswith("Ansehen") and teile[1:2] == ["Fortsetzung"] and letzte and letzte["id"] in wurzel:
            wurzel[letzte["id"]].setdefault("folge", []).append(zeile(z))
            wurzel[z["id"]] = wurzel[letzte["id"]]
            continue
        pixel = any(t in ("Pixel", "Pixel schnuppert") for t in teile[1:]) or a.startswith("Pixel schnuppert:")
        if a.startswith("Pixel schnuppert:"):
            name = a.split(":", 1)[1].split(",")[0]
            art = "ansehen"
        elif a.startswith("Ansehen:") or a.startswith("Ansehen "):
            name = re.sub(r"^Ansehen:?\s*", "", teile[0])
            art = "ansehen"
        elif a.startswith("Nehmen:"):
            name, art = teile[0].split(":", 1)[1], "nehmen"
        elif a.startswith("Benutzen:"):
            name, art = teile[0].split(":", 1)[1], "benutzen"
        elif re.match(r"^(.+?) auf (.+)$", teile[0]) and gegenstand_id(re.match(r"^(.+?) auf (.+)$", teile[0]).group(1)):
            m = re.match(r"^(.+?) auf (.+)$", teile[0])
            eintrag = zeile(z)
            eintrag["gegenstand"] = gegenstand_id(m.group(1))
            for teil in m.group(2).split(" oder "):   # „Leuchttrank auf Grimmzahn oder Fackeln“
                ziel = aufloesen(raum, teil)
                ablegen("kombinieren" if ziel[0] == "gegenstand" else "gegenstand_auf", ziel, dict(eintrag), raum)
            continue
        elif ":" not in a and (z["block"].startswith("Ansehen") or pixel):
            name, art = teile[0], "ansehen"
        else:
            continue
        mal = 2 if any(t.lower() == "zweites mal" for t in teile[1:]) else 1
        ziel = aufloesen(raum, name.strip())
        if art == "nehmen" and {ziel[1], slug(name)} & set(layout.get(raum["id"], {}).get("ohne") or []):
            continue
        if art == "nehmen":
            treffer = [p for p in raum["props"] if p["id"] == ziel[1] or p.get("gegenstand") == ziel[1].split("@")[0]]
            if not treffer:
                warnungen.append(f"{z['id']}: Nehmen {name.strip()} ohne Prop im Layout von {raum['id']}")
                continue
            eintrag = zeile(z)
            treffer[0]["nehmen"] = eintrag
            wurzel[z["id"]] = eintrag
            continue
        ablegen(art, ziel, zeile(z, mal, pixel), raum)

    # ---- Figuren und Gegenstände -------------------------------------------------------------
    in_raeumen = {f["id"] for r in raeume for f in r["figuren"]} | set(layout.get("_figuren") or [])
    welt_namen = {f["id"]: f.get("name", "") for f in welt.get("figuren", [])}
    figuren_out = []
    for f in welt.get("figuren", []):
        f_raeume = f["raum"] if isinstance(f["raum"], list) else [f["raum"]]
        if not (f.get("spielbar") or f["id"] in in_raeumen or (set(f_raeume) & gebaut and abschnitt == "prolog")):
            continue
        d = figur_daten.get(f["id"], {})
        figuren_out.append({
            "id": f["id"], "script_name": pascal(f["id"]), "kuerzel": f.get("kuerzel"),
            "name_key": name_key(f["id"], f["name"]), "groesse_px": f.get("groesse_px", 48),
            "spielbar": bool(f.get("spielbar")), "textfarbe": FARBEN.get(f.get("kuerzel"), "#ffffff"),
            "sprite": f"{RES_PLATZHALTER}figur_{f['id']}.png",
            "raeume": f_raeume,
            "tier": f["id"] in (layout.get("_tiere") or []),
            "ansehen": d.get("ansehen", []),
            "pixel_auf": d.get("pixel_auf", []),
            "pixel_redet": d.get("pixel_redet", []),
            "gegenstand_auf": d.get("gegenstand_auf", []),
            "benutzen": d.get("benutzen", []),
        })
    figur_ids = {f["id"] for f in figuren_out}
    gegenstaende_out = []
    for g in welt.get("gegenstaende", []):
        # Nur Gegenstände, die in der Graubox vorkommen: als Prop im Layout, als Belohnung oder
        # Voraussetzung eines gebauten Rätsels, oder aus dem Prolog mitgebracht.
        herkunft = g.get("herkunft", "")
        als_prop = any(p.get("gegenstand") == g["id"] for r in raeume for p in r["props"])
        if not (als_prop or herkunft in ausbau or herkunft == "prolog"
                or set(g.get("verwendet_in", [])) & set(ausbau)):
            continue
        d = gegenstand_daten.get(g["id"], {})
        eintrag = {
            "id": g["id"], "script_name": pascal(g["id"]), "name_key": name_key(g["id"], g["name"]),
            "zustaende": g.get("zustaende", []), "reist_mit": g.get("reist_mit", False),
            "nahansicht": g.get("nahansicht", False),
            "icon": f"{RES_PLATZHALTER}gegenstand_{g['id']}.png",
            "icons": {s: f"{RES_PLATZHALTER}gegenstand_{g['id']}_{slug(s)}.png" for s in g.get("zustaende", [])[1:]},
            "ansehen": d.get("ansehen", []),
            "benutzen": d.get("benutzen", []),
            "kombinieren": d.get("kombinieren", []),
        }
        de = texte.get(eintrag["name_key"])
        if de is not None and de != g["name"]:
            warnungen.append(f"{eintrag['name_key']}: ui.csv „{de}“ weicht von der Welt-Tabelle „{g['name']}“ ab")
        gegenstaende_out.append(eintrag)

    # ---- Gespräche (Regie „Option <Figur>“, Antworten bis zur nächsten Option) --------------
    dialoge = {}
    aktuelle, block = None, None
    for z in alle:
        if z["block"] != block:
            aktuelle, block = None, z["block"]
        raum_id = code_zu_raum.get(z["szene"])
        m = re.match(r"Option ([A-ZÄÖÜ][\wäöüß]*)(.*)", z["regie"])
        if m:
            fig = slug(m.group(1))
            if fig not in figur_ids or (raum_id and raum_id not in gebaut):
                aktuelle = None
                continue
            rest = m.group(2)
            bleibt = "(bleibt)" in rest   # Hinweis- oder Rätseloption: bleibt nach Nutzung (grau)
            rest = rest.replace("(bleibt)", "")
            bed, text = bedingungen(rest.replace("beendet das Gespräch", ""), gegenstand_id, zeile_id(z))
            if "nur vor" in rest:
                bed = [{"art": "vor", "raetsel": r} for r in re.findall(r"nur vor\s+([PRF]\d+)", rest)]
                # übrige Bedingung in Worten behalten („nach der Nahansicht Kalender, nur vor P3“)
                text = ", ".join(t.strip() for t in re.sub(r"\([^)]*\)|nur vor\s+[PRF]\d+", "", text).split(",") if t.strip() not in ("", "nur"))
            aktuelle = {"id": z["id"].rsplit("_", 1)[1], "frage": z["id"], "antworten": [],
                        "beendet": "beendet das Gespräch" in rest, "bleibt": bleibt}
            if bed:
                aktuelle["bedingung"] = bed
            if text:
                aktuelle["bedingung_text"] = text
            d = dialoge.setdefault(fig, {"id": fig, "script_name": pascal(fig), "optionen": []})
            d["optionen"].append(aktuelle)
        elif m_abs := re.match(r"^Reden(?::\s*([^,;]+))?,\s*Gespräch erschöpft", z["ausloeser"] or z["regie"]):
            # Abschiedszeilen, wenn nur noch „Tschüss“ übrig ist („Reden: Opa, Gespräch erschöpft“);
            # ohne Figurennamen gilt der Sprecher der Zeile
            name_abs = slug(m_abs.group(1)) if m_abs.group(1) else None
            fig = next((f["id"] for f in figuren_out if name_abs and (f["id"] == name_abs or slug(welt_namen.get(f["id"], "")) == name_abs)), None) \
                or next((f["id"] for f in figuren_out if f.get("kuerzel") == z["sprecher"]), None)
            if fig:
                d = dialoge.setdefault(fig, {"id": fig, "script_name": pascal(fig), "optionen": []})
                d.setdefault("erschoepft", []).append({"zeile": z["id"], "sprecher": z["sprecher"]})
            aktuelle = None
        elif aktuelle:
            aktuelle["antworten"].append({"zeile": z["id"], "sprecher": z["sprecher"],
                                          "blasen": blasen(z["id"], texte), "regie": z["regie"]})

    # ---- Ersatzpool ---------------------------------------------------------------------------
    ersatz, wiederholung, plauder = {}, {}, {}
    for z in skript_export.zeilen_lesen():
        if z["szene"] == "ERS":
            ersatz.setdefault(z["sprecher"], []).append(z["id"])
        elif z["szene"] == "WDH":   # Wiederholungs-Pool fürs Ansehen ab dem dritten Mal
            wiederholung.setdefault(z["sprecher"], []).append(z["id"])
        elif z["szene"] == "PLA":   # Plauderoptionen einer Figur erschöpft (einmalig, Max)
            plauder.setdefault(z["sprecher"], []).append(z["id"])

    plan = {
        "abschnitt": abschnitt,
        "erzeugt_von": "tools/godot_raeume.py",
        "praefix": praefixe[0],
        "ausbau": ausbau,
        "raeume": raeume,
        "figuren": figuren_out,
        "gegenstaende": gegenstaende_out,
        "nahansichten": [{"id": n["id"], "name_key": name_key(n["id"], n["name"]), "raum": n["raum"],
                          "bild": f"{RES_PLATZHALTER}nah_{n['id']}.png"} for n in welt.get("nahansichten", [])
                         if n["raum"] in gebaut]
                        + [{"id": g["id"], "name_key": f"UI_OBJ_{g['id'].upper()}", "raum": None,
                            "bild": f"{RES_PLATZHALTER}nah_{g['id']}.png"} for g in gegenstaende_out
                           if g.get("nahansicht")],
        "dialoge": list(dialoge.values()),
        "figurenwechsel": wechsel,
        "ersatz": ersatz,
        "wiederholung": wiederholung,
        "plauder": plauder,
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
        d.text((4, h - s_(12)), f"[{texte.get(raum['name_key'], raum['id'])}]", font=font, fill=(255, 255, 255, 255))
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
        breite = s_(24) if f["id"] == "pixel" else max(s_(16), hoehe // 3)
        if f["id"] == "pixel":
            hoehe = s_(12)
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
        p.resize((UI_ICON, UI_ICON), Image.Resampling.NEAREST).save(PLATZHALTER / f"portraet_{f['id']}.png")

    for g in plan["gegenstaende"]:
        for zustand, pfad in [(None, g["icon"])] + list(g["icons"].items()):
            img = Image.new("RGBA", (24, 24), farbe("#3e8948"))
            d = ImageDraw.Draw(img)
            d.rectangle([0, 0, 23, 23], outline=(38, 43, 68, 255))
            kurz = texte.get(g["name_key"], g["id"])[:3]
            d.text((2, 2), kurz, font=font, fill=(255, 255, 255, 255))
            if zustand:
                d.text((2, 12), slug(zustand)[:3], font=font, fill=(254, 231, 97, 255))
            img.resize((UI_ICON, UI_ICON), Image.Resampling.NEAREST).save(PLATZHALTER / pfad.rsplit("/", 1)[1])

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
        img.resize((BREITE, HOEHE), Image.Resampling.NEAREST).save(PLATZHALTER / f"nah_{n['id']}.png")

    # UI-Platzhalter: Hilfe-Pfote (normal, leuchtend, ausgegraut)
    for name, f in (("pfote", "#c28569"), ("pfote_leuchtet", "#feae34"), ("pfote_aus", "#5a6988")):
        img = Image.new("RGBA", (24, 24), (0, 0, 0, 0))
        d = ImageDraw.Draw(img)
        d.ellipse([5, 9, 19, 22], fill=farbe(f))
        for cx in (5, 10, 15, 20):
            d.ellipse([cx - 3, 2 + (2 if cx in (5, 20) else 0), cx + 1, 7 + (2 if cx in (5, 20) else 0)], fill=farbe(f))
        img.resize((UI_ICON, UI_ICON), Image.Resampling.NEAREST).save(PLATZHALTER / f"ui_{name}.png")
    # Pixel-Feld ganz links in der Inventarleiste (05-spielsysteme.md, UI)
    img = Image.new("RGBA", (24, 24), farbe(FARBEN["PIX"], 0.55))
    d = ImageDraw.Draw(img)
    d.rectangle([0, 0, 23, 23], outline=(38, 43, 68, 255))
    d.text((2, 6), "PIX", font=font, fill=(255, 255, 255, 255))
    img.resize((UI_ICON, UI_ICON), Image.Resampling.NEAREST).save(PLATZHALTER / "ui_pixel_feld.png")


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
