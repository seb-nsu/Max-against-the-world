#!/usr/bin/env python3
"""Prüft die Couch-Quest-Dokumente auf Widersprüche.

Aufruf aus dem Repo-Wurzelverzeichnis:  python3 tools/pruefen.py [--nur-fehler]

Geprüft wird:
  1. Welt-Tabellen (docs/welten/*.yaml): Pflichtfelder, ID-Format, eindeutige IDs,
     alle Verweise (Ausgänge, Räume, Gegenstände, Rätsel, Figuren) lösen auf,
     Gegenstand und Rätsel verweisen gegenseitig gleich (verwendet_in ↔ benoetigt,
     herkunft ↔ ergibt).
  2. Lösbarkeit: Jedes Rätsel ist vom Start aus erreichbar (keine Sackgasse, kein
     Kreis); Gegenstände aus früheren Abschnitten nur, wenn reist_mit: true.
  3. Skript (docs/skript/*.md): Zeilen-ID-Format, eindeutige IDs, Präfix und
     Szenen-Code passen zur Welt-Tabelle, Sprecherkürzel und Sprechername passen
     zu den Figuren, aufsteigende Nummern, einzelne Sätze über 120 Zeichen (Warnung).
  4. Namen aus der Tabelle kommen in Rätsel- und Grafik-Datei vor (Warnung).
  5. Audio (docs/04-audio.md): jedes Sprecherkürzel steht mit dem Namen aus der
     Welt-Tabelle in einer Kürzel-Spalte (Warnung), jedes musik eines Raums steht
     in der Musik-Tabelle (Fehler; Raum ohne musik: Warnung; „stille“ = kein Stück),
     jedes atmo und tupfer eines Raums in einer Geräusch-Tabelle, die Rätsel-IDs der
     Lieder-Tabelle gibt es (Fehler).
  6. Nahansichten: Summe aller nahansicht: true und aller Einträge unter
     nahansichten: über alle Welt-Tabellen ist NAHANSICHTEN_GESAMT (Fehler).
  7. Raumszenen: Szenenbreite = Breite des Hintergrunds, und in Räumen mit fertigem
     Hintergrund zeigt kein Prop auf einen Platzhalter oder die Platzhalterfarbe (Fehler);
     Ausgänge unter 50 px, Klickflächen unter der Leiste oben oder über den Rand (Warnung).

Fehler (exit 1) müssen behoben werden, Warnungen werden geprüft.
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from aufloesung import BREITE, HOEHE  # noqa: E402

try:
    import yaml
except ImportError:  # pragma: no cover
    sys.exit("PyYAML fehlt: pip install pyyaml")

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"

# Reihenfolge der Abschnitte (für Gegenstände, die mitreisen)
ABSCHNITTE = ["prolog", "welt-1", "welt-2", "welt-3", "welt-4", "finale"]
SKRIPT = {
    "prolog": "skript/prolog.md",
    "welt-1": "skript/welt-1.md",
    "welt-2": "skript/welt-2.md",
    "welt-3": "skript/welt-3.md",
    "welt-4": "skript/welt-4.md",
    "finale": "skript/zwischenspiele-und-finale.md",
}
RAETSEL = {
    "prolog": "raetsel/prolog-und-welt-1.md",
    "welt-1": "raetsel/prolog-und-welt-1.md",
    "welt-2": "raetsel/welt-2.md",
    "welt-3": "raetsel/welt-3.md",
    "welt-4": "raetsel/welt-4.md",
    "finale": "raetsel/finale.md",
}
GRAFIK = {
    "prolog": ["grafik/02-prolog-und-finale.md", "grafik/01-max-und-pixel.md"],
    "welt-1": ["grafik/welt-1.md", "grafik/01-max-und-pixel.md", "grafik/02-prolog-und-finale.md"],
    "welt-2": ["grafik/welt-2.md", "grafik/01-max-und-pixel.md", "grafik/02-prolog-und-finale.md"],
    "welt-3": ["grafik/welt-3.md", "grafik/01-max-und-pixel.md", "grafik/02-prolog-und-finale.md"],
    "welt-4": ["grafik/welt-4.md", "grafik/01-max-und-pixel.md", "grafik/02-prolog-und-finale.md"],
    "finale": ["grafik/02-prolog-und-finale.md", "grafik/01-max-und-pixel.md"],
}

ID_RE = re.compile(r"^[a-z0-9_]+$")
RAETSEL_RE = re.compile(r"^(R|P|F|ZS)\d+[a-z]?$")
SCHALTER_RE = re.compile(r"^[A-Z0-9_]+$")
ZEILE_RE = re.compile(r"^([A-Z]+[0-9]?)_([A-Z0-9]+)_([A-Z0-9]+)_(\d{4})$")
OHNE_ZEHNER = {"HINT", "ERS", "WDH", "PLA"}  # Szenen-Codes mit eigenem Nummernschema
MAX_ZEICHEN = 120
MAX_BLASE = 140
# Festgelegte Zahl der Nahansichten im ganzen Spiel (entscheidungen.md)
NAHANSICHTEN_GESAMT = 15

fehler, warnungen, hinweise = [], [], []


def F(ort, text):
    fehler.append(f"FEHLER   {ort}: {text}")


def W(ort, text):
    warnungen.append(f"WARNUNG  {ort}: {text}")


def H(ort, text):
    """Hinweis: harmlos, zählt nicht als Warnung und wird nur mit --hinweise gezeigt."""
    hinweise.append(f"HINWEIS  {ort}: {text}")


def als_liste(x):
    if x is None:
        return []
    return x if isinstance(x, list) else [x]


def norm(s):
    s = s.replace("\\", "")
    s = re.sub(r"[„“”\"‚‘’'*_`]", "", s)
    return re.sub(r"\s+", " ", s).strip().lower()


# --------------------------------------------------------------------------
# 1. Welt-Tabellen laden und prüfen
# --------------------------------------------------------------------------

def lade_tabellen():
    tab = {}
    for ab in ABSCHNITTE:
        p = DOCS / "welten" / f"{ab}.yaml"
        if not p.exists():
            F(f"welten/{ab}.yaml", "Datei fehlt")
            continue
        try:
            d = yaml.safe_load(p.read_text(encoding="utf-8")) or {}
        except yaml.YAMLError as e:
            F(f"welten/{ab}.yaml", f"YAML nicht lesbar: {e}")
            continue
        if d.get("abschnitt") != ab:
            F(f"welten/{ab}.yaml", f"abschnitt ist {d.get('abschnitt')!r}, erwartet {ab!r}")
        for k in ("raeume", "figuren", "gegenstaende", "raetsel"):
            d[k] = d.get(k) or []
        tab[ab] = d
    return tab


def pruefe_tabelle(ab, d, alle):
    ort = f"welten/{ab}.yaml"
    raeume = {r.get("id"): r for r in d["raeume"]}
    figuren = {f.get("id"): f for f in d["figuren"]}
    gegen = {g.get("id"): g for g in d["gegenstaende"]}
    raetsel = {r.get("id"): r for r in d["raetsel"]}

    # Pflichtfelder, ID-Format, Eindeutigkeit
    gesehen = {}
    for art, liste, pflicht, muster in (
        ("Raum", d["raeume"], ["id", "name", "skript_code", "groesse", "ausgaenge", "erreichbar_ab"], ID_RE),
        ("Figur", d["figuren"], ["id", "name", "kuerzel", "raum", "groesse_px", "spielbar"], ID_RE),
        ("Gegenstand", d["gegenstaende"], ["id", "name", "herkunft", "zustaende", "verwendet_in", "reist_mit", "nahansicht"], ID_RE),
        ("Rätsel", d["raetsel"], ["id", "name", "raum", "benoetigt", "ergibt", "schalter", "optional"], RAETSEL_RE),
    ):
        for e in liste:
            i = e.get("id")
            for k in pflicht:
                if k not in e:
                    F(ort, f"{art} {i}: Feld {k} fehlt")
            if i is None:
                continue
            if not muster.match(str(i)):
                F(ort, f"{art} {i}: ID-Format ungültig")
            if i in gesehen:
                F(ort, f"ID {i} doppelt ({gesehen[i]} und {art})")
            gesehen[i] = art

    kuerzel = {}
    for f in d["figuren"]:
        k = f.get("kuerzel")
        if k is None:
            continue
        if k in kuerzel:
            F(ort, f"Sprecherkürzel {k} doppelt ({kuerzel[k]}, {f.get('id')})")
        kuerzel[k] = f.get("id")
    for k in als_liste(d.get("sonder_sprecher")):
        kuerzel.setdefault(k, None)
    for pflicht_k in ("MAX", "PIX"):
        if pflicht_k not in kuerzel and ab != "finale":
            W(ort, f"Kürzel {pflicht_k} fehlt in den Figuren")

    codes = {}
    for r in d["raeume"]:
        for c in als_liste(r.get("skript_code")):
            if c in codes:
                F(ort, f"Szenen-Code {c} doppelt ({codes[c]}, {r.get('id')})")
            codes[c] = r.get("id")
        g = str(r.get("groesse", ""))
        if not re.match(rf"^\d+x{HOEHE}$", g):
            F(ort, f"Raum {r.get('id')}: groesse {g!r} ungültig (erwartet z. B. {BREITE}x{HOEHE}, tools/aufloesung.py)")
        for a in als_liste(r.get("ausgaenge")):
            if a not in raeume:
                F(ort, f"Raum {r.get('id')}: Ausgang {a} ist kein Raum")
        e = r.get("erreichbar_ab")
        if e != "start" and e not in raetsel:
            F(ort, f"Raum {r.get('id')}: erreichbar_ab {e} ist weder start noch ein Rätsel")

    for f in d["figuren"]:
        for r in als_liste(f.get("raum")):
            if r not in raeume:
                F(ort, f"Figur {f.get('id')}: Raum {r} unbekannt")

    # Gegenstände aus früheren Abschnitten (für Verweise)
    frueher = {}
    for vor in ABSCHNITTE[: ABSCHNITTE.index(ab)]:
        for g in (alle.get(vor) or {}).get("gegenstaende", []):
            frueher[g.get("id")] = (vor, g)

    for g in d["gegenstaende"]:
        h = g.get("herkunft")
        if h in ABSCHNITTE[: ABSCHNITTE.index(ab)]:
            continue  # bringt Max aus einem früheren Abschnitt mit
        if h not in raeume and h not in raetsel and h not in figuren and h not in frueher:
            F(ort, f"Gegenstand {g.get('id')}: herkunft {h} ist weder Raum, Rätsel, Figur noch früherer Gegenstand")
        if h in raetsel and g.get("id") not in als_liste(raetsel[h].get("ergibt")):
            F(ort, f"Gegenstand {g.get('id')}: herkunft {h}, aber {h} hat ihn nicht unter ergibt")
        if not als_liste(g.get("zustaende")):
            F(ort, f"Gegenstand {g.get('id')}: keine zustaende")
        for r in als_liste(g.get("verwendet_in")):
            if r not in raetsel:
                F(ort, f"Gegenstand {g.get('id')}: verwendet_in {r} ist kein Rätsel dieses Abschnitts")
            elif g.get("id") not in als_liste(raetsel[r].get("benoetigt")) + als_liste(raetsel[r].get("benoetigt_eins_von")):
                F(ort, f"Gegenstand {g.get('id')}: verwendet_in {r}, aber {r} hat ihn nicht unter benoetigt")

    for r in d["raetsel"]:
        rid = r.get("id")
        if r.get("raum") not in raeume:
            F(ort, f"Rätsel {rid}: Raum {r.get('raum')} unbekannt")
        for b in als_liste(r.get("benoetigt")):
            if b in raetsel:
                continue
            if b in gegen:
                if rid not in als_liste(gegen[b].get("verwendet_in")):
                    F(ort, f"Rätsel {rid}: benötigt {b}, aber {b} hat {rid} nicht unter verwendet_in")
                continue
            if b in frueher:
                vor, g = frueher[b]
                if not g.get("reist_mit"):
                    F(ort, f"Rätsel {rid}: benötigt {b} aus {vor}, der aber nicht mitreist")
                continue
            F(ort, f"Rätsel {rid}: benötigt {b} ist weder Gegenstand noch Rätsel")
        for b in als_liste(r.get("benoetigt_eins_von")):
            if b not in raetsel and b not in gegen and b not in frueher:
                F(ort, f"Rätsel {rid}: benoetigt_eins_von {b} ist weder Gegenstand noch Rätsel")
            elif b in gegen and rid not in als_liste(gegen[b].get("verwendet_in")):
                F(ort, f"Rätsel {rid}: benoetigt_eins_von {b}, aber {b} hat {rid} nicht unter verwendet_in")
        for e in als_liste(r.get("ergibt")):
            if e not in gegen:
                F(ort, f"Rätsel {rid}: ergibt {e} ist kein Gegenstand")
            elif gegen[e].get("herkunft") != rid:
                W(ort, f"Rätsel {rid}: ergibt {e}, dessen herkunft aber {gegen[e].get('herkunft')} ist")
        for s in als_liste(r.get("schalter")):
            if not SCHALTER_RE.match(str(s)):
                F(ort, f"Rätsel {rid}: Schalter {s} nicht in GROSSBUCHSTABEN")

    return codes, kuerzel


# --------------------------------------------------------------------------
# 2. Lösbarkeit
# --------------------------------------------------------------------------

def pruefe_loesbarkeit(ab, d, mitgebracht):
    ort = f"welten/{ab}.yaml"
    raeume = {r["id"]: r for r in d["raeume"] if "id" in r}
    figuren = {f["id"]: f for f in d["figuren"] if "id" in f}
    gegen = {g["id"]: g for g in d["gegenstaende"] if "id" in g}
    raetsel = {r["id"]: r for r in d["raetsel"] if "id" in r}

    nachbarn = {i: set() for i in raeume}
    for i, r in raeume.items():
        for a in als_liste(r.get("ausgaenge")):
            if a in nachbarn:
                nachbarn[i].add(a)
                nachbarn[a].add(i)

    geloest, besitz, offen_raum = set(), set(mitgebracht), set()
    starts = [i for i, r in raeume.items() if r.get("erreichbar_ab") == "start"]
    if not starts:
        F(ort, "kein Raum mit erreichbar_ab: start")
        return set()

    def erreichbar():
        frei = {i for i, r in raeume.items() if r.get("erreichbar_ab") == "start" or r.get("erreichbar_ab") in geloest}
        # Räume ohne Verbindung (Szenenräume, Wechsel per Rätsel) gelten als
        # erreichbar, sobald sie frei sind; sonst über Ausgänge vom Start.
        sicht, stapel = set(), [starts[0]]
        while stapel:
            x = stapel.pop()
            if x in sicht or x not in frei:
                continue
            sicht.add(x)
            stapel.extend(nachbarn[x])
        for i in frei:
            if not nachbarn[i]:
                sicht.add(i)
        return sicht

    while True:
        offen_raum = erreichbar()
        neu = False
        for gid, g in gegen.items():
            h = g.get("herkunft")
            if gid in besitz:
                continue
            if (h in ABSCHNITTE) or (h in offen_raum) or (h in figuren and any(r in offen_raum for r in als_liste(figuren[h].get("raum")))):
                besitz.add(gid)
                neu = True
        for rid, r in raetsel.items():
            if rid in geloest or r.get("raum") not in offen_raum:
                continue
            eins = als_liste(r.get("benoetigt_eins_von"))
            if all((b in geloest) or (b in besitz) for b in als_liste(r.get("benoetigt"))) and (
                not eins or any((b in geloest) or (b in besitz) for b in eins)
            ):
                geloest.add(rid)
                besitz.update(als_liste(r.get("ergibt")))
                neu = True
        if not neu:
            break

    for rid, r in raetsel.items():
        if rid not in geloest:
            fehlt = [b for b in als_liste(r.get("benoetigt")) if b not in geloest and b not in besitz]
            text = f"Rätsel {rid} nicht lösbar (fehlt: {', '.join(fehlt) or 'Raum ' + str(r.get('raum'))})"
            (W if r.get("optional") else F)(ort, text)
    for i in raeume:
        if i not in offen_raum:
            F(ort, f"Raum {i} wird nie erreichbar")
    for gid, g in gegen.items():
        if gid not in besitz:
            F(ort, f"Gegenstand {gid} wird nie erhalten")
        elif not als_liste(g.get("verwendet_in")) and not g.get("reist_mit") and not g.get("ohne_verwendung"):
            W(ort, f"Gegenstand {gid} wird nirgends verwendet und reist nicht mit")
    return {gid for gid, g in gegen.items() if g.get("reist_mit") and gid in besitz}


# --------------------------------------------------------------------------
# 3. Skript
# --------------------------------------------------------------------------

def pruefe_skript(ab, d, codes, kuerzel, alle_ids):
    rel = SKRIPT[ab]
    p = DOCS / rel
    if not p.exists():
        F(rel, "Datei fehlt")
        return
    praefixe = set(als_liste(d.get("skript_praefix")))
    sonder = set(als_liste(d.get("sonder_codes")))
    namen = {f.get("kuerzel"): norm(str(f.get("name", ""))) for f in d["figuren"]}
    letzte = {}
    for nr, zeile in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
        if not zeile.startswith("| ") or zeile.startswith("| ID") or zeile.startswith("| ---"):
            if not zeile.startswith("|"):
                letzte = {}  # neuer Tabellenblock
            continue
        zellen = [z.strip() for z in zeile.strip().strip("|").split(" | ")]
        roh = zellen[0].replace("\\_", "_")
        m = ZEILE_RE.match(roh)
        if not m:
            if re.match(r"^[A-Z0-9]+_", roh):
                F(f"{rel}:{nr}", f"Zeilen-ID {roh} hat ein ungültiges Format")
            continue
        praef, code, kz, num = m.groups()
        ort = f"{rel}:{nr}"
        if roh in alle_ids:
            F(ort, f"Zeilen-ID {roh} doppelt (auch {alle_ids[roh]})")
        alle_ids[roh] = ort
        if praef not in praefixe and code not in sonder:
            F(ort, f"Präfix {praef} passt nicht zu skript_praefix {sorted(praefixe)}")
        if code not in codes and code not in sonder:
            F(ort, f"Szenen-Code {code} steht in keinem Raum (skript_code) und nicht unter sonder_codes")
        if kz not in kuerzel:
            F(ort, f"Sprecherkürzel {kz} steht nicht bei den Figuren")
        elif len(zellen) > 1:
            sprecher = norm(zellen[1])
            if namen.get(kz) and not sprecher.startswith(namen[kz]) and namen[kz] not in sprecher:
                F(ort, f"Sprecher „{zellen[1]}“ passt nicht zu {kz} = {namen[kz]}")
        if code not in OHNE_ZEHNER:
            n = int(num)
            # Neue Zeilen in Zehnerschritten; eingeschobene Zeilen nehmen eine
            # freie Nummer zwischen den Nachbarn (05-spielsysteme.md), daher
            # wird nur die aufsteigende Reihenfolge geprüft.
            if n <= letzte.get(code, -1):
                H(ort, f"{roh}: Nummer nicht aufsteigend im Block")
            letzte[code] = n
        if len(zellen) > 2:
            # Längerer Text wird an Satzgrenzen auf Folgeblasen verteilt
            # (05-spielsysteme.md); nur ein einzelner Satz über 120 Zeichen passt nie.
            for teil in zellen[2].split("//"):
                # Blasen über 140 Zeichen werden fünfzeilig und wachsen hinter die Porträts
                # (Review Prolog und Welt 1, Fund 10): mit „//“ teilen
                if len(teil.strip()) > MAX_BLASE:
                    (W if any(a in ort for a in ("prolog", "welt-1", "welt-2")) else H)(ort, f"{roh}: Blase mit {len(teil.strip())} Zeichen (über {MAX_BLASE}), mit „//“ teilen")
                for satz in re.split(r"(?<=[.!?…“])\s+", teil.strip()):
                    if len(satz) > MAX_ZEICHEN:
                        W(ort, f"{roh}: Satz mit {len(satz)} Zeichen passt in keine Blase (über {MAX_ZEICHEN}, teilen)")


# --------------------------------------------------------------------------
# 4. Namen in Rätsel- und Grafik-Dateien
# --------------------------------------------------------------------------

def pruefe_namen(ab, d):
    r_rel = RAETSEL[ab]
    r_text = norm((DOCS / r_rel).read_text(encoding="utf-8")) if (DOCS / r_rel).exists() else None
    if r_text is None:
        F(r_rel, "Rätsel-Datei fehlt")
    g_text = ""
    for g in GRAFIK[ab]:
        if (DOCS / g).exists():
            g_text += norm((DOCS / g).read_text(encoding="utf-8"))
        else:
            F(g, "Grafik-Datei fehlt")
    for r in d["raeume"]:
        if norm(str(r.get("name", ""))) not in g_text:
            W(f"welten/{ab}.yaml", f"Raum „{r.get('name')}“ kommt in der Grafik-Datei nicht wörtlich vor")
    for g in d["gegenstaende"]:
        n = norm(str(g.get("name", "")))
        if n not in g_text:
            W(f"welten/{ab}.yaml", f"Gegenstand „{g.get('name')}“ kommt in der Grafik-Datei nicht wörtlich vor")
        if r_text is not None and n not in r_text:
            W(f"welten/{ab}.yaml", f"Gegenstand „{g.get('name')}“ kommt in {r_rel} nicht wörtlich vor")
    for f in d["figuren"]:
        if f.get("groesse_px") and norm(str(f.get("name", ""))) not in g_text:
            W(f"welten/{ab}.yaml", f"Figur „{f.get('name')}“ kommt in der Grafik-Datei nicht wörtlich vor")
    if r_text is not None:
        for r in d["raetsel"]:
            rid = str(r.get("id"))
            num = re.sub(r"^[A-Z]+", "", rid)
            kandidaten = {norm(rid), norm(f"Rätsel {num}"), norm(str(r.get("name", "")))}
            if re.match(r"^\d+[a-z]$", num):  # Teilschritt: es genügt das Rätsel selbst
                kandidaten |= {norm(f"Rätsel {num[:-1]}"), f"| {num[:-1]} |"}
            if not any(k and k in r_text for k in kandidaten):
                W(f"welten/{ab}.yaml", f"Rätsel {rid} „{r.get('name')}“ kommt in {r_rel} weder als ID noch mit Namen vor")


# --------------------------------------------------------------------------
# 5. Audio: Stimmen, Musik und Lieder gegen die Welt-Tabellen
# --------------------------------------------------------------------------

def lies_tabellen(text):
    """Liefert alle Markdown-Tabellen als Liste von (Kopf, Zeilen, Zeilennummer)."""
    tabellen, zeilen = [], text.splitlines()
    i = 0
    while i < len(zeilen) - 1:
        if zeilen[i].startswith("|") and zeilen[i + 1].startswith("| ---"):
            kopf = [z.strip() for z in zeilen[i].strip().strip("|").split("|")]
            inhalt, j = [], i + 2
            while j < len(zeilen) and zeilen[j].startswith("|"):
                zellen = [z.strip() for z in zeilen[j].strip().strip("|").split(" | ")]
                inhalt.append((j + 1, dict(zip(kopf, zellen))))
                j += 1
            tabellen.append((kopf, inhalt))
            i = j
        else:
            i += 1
    return tabellen


def pruefe_audio(alle):
    rel = "04-audio.md"
    p = DOCS / rel
    if not p.exists():
        F(rel, "Datei fehlt")
        return
    tabellen = lies_tabellen(p.read_text(encoding="utf-8"))

    def ohne_klammer(s):
        return norm(re.sub(r"\s*\(.*?\)", "", s))

    # (a) Sprecherkürzel
    sonder = set()
    for d in alle.values():
        sonder |= set(als_liste(d.get("sonder_sprecher")))
    figuren = []  # (Abschnitt, Kürzel, Name normiert)
    anzeige = {}  # (Abschnitt, Kürzel) -> Name wie in der Tabelle
    for ab, d in alle.items():
        for f in d["figuren"]:
            k = f.get("kuerzel")
            if k and k not in sonder:
                figuren.append((ab, k, ohne_klammer(str(f.get("name", "")))))
                anzeige[(ab, k)] = f.get("name")
    stimmen = []  # (Zeile, Kürzel, Name, Abschnitte oder None)
    for kopf, inhalt in tabellen:
        if "Kürzel" not in kopf or "Figur" not in kopf:
            continue
        for nr, z in inhalt:
            abschnitte = None
            if "Abschnitt" in z:
                abschnitte = set(re.findall(r"prolog|welt-\d|finale", z["Abschnitt"]))
            for k in re.split(r"[,\s]+", z.get("Kürzel", "").replace("`", "")):
                if k:
                    stimmen.append((nr, k, ohne_klammer(z.get("Figur", "")), abschnitte))
    for ab, k, name in figuren:
        mit_k = [s for s in stimmen if s[1] == k]
        if not mit_k:
            W(f"welten/{ab}.yaml", f"Sprecherkürzel {k} ({anzeige[(ab, k)]}) steht in {rel} in keiner Kürzel-Spalte")
        elif not any(s[2] == name and (s[3] is None or ab in s[3]) for s in mit_k):
            W(f"welten/{ab}.yaml", f"Sprecherkürzel {k}: in {rel} keine Zeile mit dem Namen „{anzeige[(ab, k)]}“ für {ab}")
    bekannt = {(k, n) for _, k, n in figuren}
    for nr, k, name, abschnitte in stimmen:
        if k in sonder:
            continue
        if k not in {fk for _, fk, _ in figuren}:
            W(f"{rel}:{nr}", f"Kürzel {k} gehört zu keiner Figur einer Welt-Tabelle")
        elif (k, name) not in bekannt:
            W(f"{rel}:{nr}", f"Figur „{name}“ mit Kürzel {k} steht so in keiner Welt-Tabelle")
        elif abschnitte is not None:
            for ab in abschnitte:
                if not any(a == ab and fk == k and n == name for a, fk, n in figuren):
                    W(f"{rel}:{nr}", f"Figur „{name}“ ({k}) steht nicht in welten/{ab}.yaml")

    # (b) Musik-IDs der Räume
    musik_ids = set()
    for kopf, inhalt in tabellen:
        if "ID" in kopf and ("Einsatz" in kopf or "Rätsel" in kopf):
            for nr, z in inhalt:
                i = z.get("ID", "").strip("`")
                if i in musik_ids:
                    F(f"{rel}:{nr}", f"Musik-ID {i} doppelt")
                musik_ids.add(i)
    if not musik_ids:
        F(rel, "keine Musik-Tabelle mit Spalte ID gefunden")
    # Kennungen der Geräusche (Tabellen mit Spalte Kennung): auch die Schleifen der Atmosphäre
    kennungen = set()
    for kopf, inhalt in tabellen:
        if "Kennung" in kopf:
            for nr, z in inhalt:
                k = z.get("Kennung", "").strip("`")
                if k in kennungen:
                    F(f"{rel}:{nr}", f"Geräusch-Kennung {k} doppelt")
                kennungen.add(k)
    for ab, d in alle.items():
        for r in d["raeume"]:
            m = r.get("musik")
            if m is None:
                W(f"welten/{ab}.yaml", f"Raum {r.get('id')}: kein musik-Eintrag")
            elif m != "stille" and m not in musik_ids:   # stille: kein Stück (game/skripte/klang.gd)
                F(f"welten/{ab}.yaml", f"Raum {r.get('id')}: musik {m} steht nicht in der Musik-Tabelle von {rel}")
            a = r.get("atmo")
            if a is None:
                W(f"welten/{ab}.yaml", f"Raum {r.get('id')}: kein atmo-Eintrag (Schleife oder „keine“)")
            elif a != "keine" and a not in kennungen:
                F(f"welten/{ab}.yaml", f"Raum {r.get('id')}: atmo {a} steht in keiner Geräusch-Tabelle von {rel}")
            t = r.get("tupfer")
            if t is not None and t not in kennungen:
                F(f"welten/{ab}.yaml", f"Raum {r.get('id')}: tupfer {t} steht in keiner Geräusch-Tabelle von {rel}")

    # (c) Rätsel-IDs der Lieder
    for kopf, inhalt in tabellen:
        if "Rätsel" not in kopf or "ID" not in kopf:
            continue
        for nr, z in inhalt:
            for teil in z.get("Rätsel", "").split(";"):
                m = re.match(r"\s*(prolog|welt-\d|finale)\b(.*)", teil)
                ids = re.findall(r"\b(?:R|P|F|ZS)\d+[a-z]?\b", m.group(2) if m else teil)
                if ids and not m:
                    F(f"{rel}:{nr}", f"Rätsel {', '.join(ids)} ohne Abschnitt (z. B. „welt-1 R10“)")
                    continue
                if not m:
                    continue
                ab = m.group(1)
                vorhanden = {r.get("id") for r in (alle.get(ab) or {}).get("raetsel", [])}
                for rid in ids:
                    if rid not in vorhanden:
                        F(f"{rel}:{nr}", f"Rätsel {rid} gibt es in welten/{ab}.yaml nicht")


def pruefe_nahansichten(alle):
    summe = 0
    for ab, d in alle.items():
        ort = f"welten/{ab}.yaml"
        raeume = {r.get("id") for r in d["raeume"]}
        summe += sum(1 for g in d["gegenstaende"] if g.get("nahansicht") is True)
        for n in als_liste(d.get("nahansichten")):
            summe += 1
            for k in ("id", "name", "raum"):
                if k not in n:
                    F(ort, f"Nahansicht {n.get('id')}: Feld {k} fehlt")
            if not ID_RE.match(str(n.get("id"))):
                F(ort, f"Nahansicht {n.get('id')}: ID-Format ungültig")
            if n.get("raum") not in raeume:
                F(ort, f"Nahansicht {n.get('id')}: Raum {n.get('raum')} unbekannt")
    if summe != NAHANSICHTEN_GESAMT:
        F("welten/*.yaml", f"{summe} Nahansichten (nahansicht: true plus nahansichten:), festgelegt sind {NAHANSICHTEN_GESAMT}")


# Werte, die über die Abschnitte hinweg gelten (Zwischenspiele, Reisetasche, Finale) und deshalb
# kein Präfix tragen. Neue Namen gehören nicht hierher, sondern bekommen ein Präfix.
SCHALTER_OHNE_PRAEFIX = {"ZWISCHENSPIEL", "TASCHE", "FUNDKISTE", "EINKAUFSLISTE", "FINALE"}


def pruefe_code_schalter(alle):
    """Schalter und Werte, die der Godot-Code setzt oder liest, stehen in einer Welt-Tabelle
    (Rätsel-„schalter“ oder „weitere_schalter“, 05-spielsysteme.md, Regeln für den Code)."""
    bekannt = set()
    for abschnitt, d in alle.items():
        eigene = {str(x) for x in als_liste(d.get("weitere_schalter"))}
        eigene |= {str(x) for x in (d.get("werte") or {})}   # gespeicherte Werte der Welt (W2_FAEHRE_STEG)
        for r in d.get("raetsel") or []:
            eigene |= {str(x) for x in als_liste(r.get("schalter"))}
        # Jeder Name trägt das Präfix seines Abschnitts. Ein Umbenennen später kostet eine
        # Umwandlung alter Spielstände (game/skripte/cq_save_load.gd), deshalb gleich richtig.
        praefixe = [str(x) for x in als_liste(d.get("skript_praefix"))]
        for name in sorted(eigene - SCHALTER_OHNE_PRAEFIX):
            if not any(name.startswith(x + "_") for x in praefixe):
                F(f"welten/{abschnitt}.yaml", f"Schalter {name} trägt kein Präfix des Abschnitts ({', '.join(praefixe)})")
        bekannt |= eigene
    muster = re.compile(r'Zustand\.(?:ist|setze|wert|setze_wert)\(\s*"([A-Z][A-Z0-9_]*)"')
    for datei in sorted((ROOT / "game").rglob("*.gd")):
        if "addons" in datei.parts:
            continue
        for nr, zeile in enumerate(datei.read_text(encoding="utf-8").splitlines(), 1):
            for name in muster.findall(zeile):
                if name not in bekannt:
                    W(f"{datei.relative_to(ROOT)}:{nr}", f"Schalter {name} steht in keiner Welt-Tabelle (weitere_schalter)")


def pruefe_englisch(alle_ids):
    """Englische Fassung: je deutscher Sprechblase ein Eintrag, nie „//“ im Text.

    Steht eine Kaskade als ein Stück unter dem ersten Schlüssel, zeigt das Spiel „//“ in der
    Blase und die Folgeblasen bleiben leer. Geprüft werden nur Zeilen, die schon übersetzt sind.
    """
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    import skript_export
    en = skript_export.lade_en()
    rel = "uebersetzung/en.csv"
    gueltig = set()
    for z in skript_export.zeilen_lesen():
        n = len(skript_export.blasen(z["de"]))
        schluessel = [skript_export.schluessel(z["id"], i) for i in range(n)]
        gueltig.update(schluessel)
        da = [k for k in schluessel if en.get(k)]
        if da and len(da) != n:
            F(rel, f"{z['id']}: {n} Sprechblasen auf Deutsch, {len(da)} auf Englisch "
                   f"(neu eintragen mit tools/en_eintragen.py)")
    for k, text in en.items():
        if "//" in text:
            F(rel, f"{k}: „//“ im englischen Text (Kaskade über tools/en_eintragen.py eintragen)")
        if k not in gueltig:
            F(rel, f"{k}: Schlüssel gibt es im Skript nicht (mehr)")


# Gespräche, die ohne „beendet das Gespräch“ auskommen, weil die Figur nach jeder Option selbst
# geht (`_nach_option` liefert true). Alle übrigen brauchen eine beendende Option, sonst hing das
# Spiel nach der letzten Wahl in einem leeren Menü (Review 17.11., Fund W2-29, Hermes).
GESPRAECHE_OHNE_ABSCHIED = {"maklerin", "sitcom_vater", "sitcom_sohn", "fbi_agent",
                            "fledermann", "wonder_wilma"}


def pruefe_gespraeche():
    for datei in sorted((ROOT / "game" / "daten" / "raeume").glob("*.json")):
        try:
            d = json.loads(datei.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            continue
        for g in d.get("dialoge", []):
            if g["id"] in GESPRAECHE_OHNE_ABSCHIED:
                continue
            if not any(o.get("beendet") for o in g.get("optionen", [])):
                F(f"daten/raeume/{datei.name}", f"Gespräch {g['id']} hat keine Option, die das Gespräch beendet")


# --------------------------------------------------------------------------
# 7. Raumszenen gegen Bauplan und Bilder (Review 20.11., W3-R02-01 und W3-12)
# --------------------------------------------------------------------------

PLATZHALTER_FARBE = (228, 166, 114)
KLICKFLAECHEN_GEPRUEFT = {"welt-3"}      # Abschnitte, deren Klickflächen schon nach W3-19 gesetzt sind   # orange Prop-Platzhalter aus tools/godot_raeume.py (#e4a672)


def png_lesen(pfad):
    """(breite, hoehe, zeilen) einer 8-Bit-PNG ohne Pillow (die CI hat nur PyYAML); zeilen ist eine
    Liste von Pixel-Tupeln (RGB oder RGBA). Nur für kleine Bilder (Props) gedacht."""
    import struct
    import zlib
    daten = Path(pfad).read_bytes()
    pos, idat, palette, trns = 8, b"", None, None
    breite = hoehe = tiefe = art = 0
    while pos < len(daten):
        laenge, typ = struct.unpack(">I4s", daten[pos:pos + 8])
        inhalt = daten[pos + 8:pos + 8 + laenge]
        if typ == b"IHDR":
            breite, hoehe, tiefe, art = struct.unpack(">IIBB", inhalt[:10])
        elif typ == b"PLTE":
            palette = [tuple(inhalt[i:i + 3]) for i in range(0, len(inhalt), 3)]
        elif typ == b"tRNS":
            trns = inhalt
        elif typ == b"IDAT":
            idat += inhalt
        pos += 12 + laenge
    if tiefe != 8 or art not in (2, 3, 6):
        return breite, hoehe, None   # selten (16 Bit, Graustufen): nicht prüfen
    bpp = {2: 3, 3: 1, 6: 4}[art]
    roh = zlib.decompress(idat)
    zeile_len = breite * bpp
    vorige = bytearray(zeile_len)
    zeilen = []
    for y in range(hoehe):
        start = y * (zeile_len + 1)
        f, z = roh[start], bytearray(roh[start + 1:start + 1 + zeile_len])
        for i in range(zeile_len):
            a = z[i - bpp] if i >= bpp else 0
            b = vorige[i]
            c = vorige[i - bpp] if i >= bpp else 0
            if f == 1:
                z[i] = (z[i] + a) & 255
            elif f == 2:
                z[i] = (z[i] + b) & 255
            elif f == 3:
                z[i] = (z[i] + (a + b) // 2) & 255
            elif f == 4:
                pa, pb, pc = abs(b - c), abs(a - c), abs(a + b - 2 * c)
                z[i] = (z[i] + (a if pa <= pb and pa <= pc else b if pb <= pc else c)) & 255
        vorige = z
        if art == 3:
            zeilen.append([palette[v] + ((trns[v],) if trns and v < len(trns) else (255,)) for v in z])
        else:
            zeilen.append([tuple(z[i:i + bpp]) for i in range(0, zeile_len, bpp)])
    return breite, hoehe, zeilen


def png_groesse(pfad):
    import struct
    kopf = Path(pfad).read_bytes()[:24]
    return struct.unpack(">II", kopf[16:24])


def pruefe_raumszenen():
    """Szenenbreite = Breite des Hintergrunds (Apothekengasse war 640 statt 1280 breit und
    scrollte nicht) und kein oranger Prop-Platzhalter in einem Raum mit fertigem Hintergrund
    (fünf orange Kästen in Welt 3: Die Szenen zeigten noch auf grafik/platzhalter/prop_*.png)."""
    game = ROOT / "game"
    for bauplan in sorted((game / "daten" / "raeume").glob("*.json")):
        plan = json.loads(bauplan.read_text(encoding="utf-8"))
        for r in plan.get("raeume", []):
            szene = game / "game" / "rooms" / r["id"] / f"room_{r['id']}.tscn"
            if not szene.exists():
                continue
            ort = f"game/game/rooms/{r['id']}/{szene.name}"
            text = szene.read_text(encoding="utf-8")
            pfade = dict((m.group(2), m.group(1)) for m in re.finditer(
                r'^\[ext_resource type="Texture2D"[^\]]*path="res://([^"]+)" id="([^"]+)"\]', text, re.M))
            m = re.search(r"^width = (\d+)", text, re.M)
            breite = int(m.group(1)) if m else None
            bg = re.search(r'^\[node name="Background" parent="Props"[^\]]*\]\n(?:[^\[\n].*\n)*?'
                           r'texture = ExtResource\("([^"]+)"\)', text, re.M)
            bg_pfad = pfade.get(bg.group(1)) if bg else None
            fertig = bool(bg_pfad) and "/platzhalter/" not in bg_pfad
            if fertig and (game / bg_pfad).exists():
                bild_breite = png_groesse(game / bg_pfad)[0]
                if breite != bild_breite:
                    F(ort, f"Szenenbreite {breite} passt nicht zur Breite des Hintergrunds "
                           f"{bild_breite} ({bg_pfad}); Bau mit --cq-layout={r['id']} wiederholen")
                if r["groesse"][0] != bild_breite:
                    F(ort, f"Welt-Tabelle groesse {r['groesse'][0]} passt nicht zur Breite des "
                           f"Hintergrunds {bild_breite} ({bg_pfad})")
            if not fertig:
                continue
            # Klickflächen am fertigen Bild: Ausgänge mindestens 50 px breit, nichts unter der Leiste oben
            # (y < 24) und nichts über den Bildrand hinaus (Review 20.11., W3-19); gilt ab Welt 3, die
            # älteren Abschnitte haben noch Flächen bis an den Rand (Review 17.11., X-06/X-07)
            klickflaechen = r.get("hotspots", []) + r.get("ausgaenge", []) + r.get("props", [])
            if bauplan.stem not in KLICKFLAECHEN_GEPRUEFT:
                klickflaechen = []
            for h in klickflaechen:
                x, y, w, hh = h["rect"]
                art = "Ausgang" if h in r.get("ausgaenge", []) else "Klickfläche"
                if art == "Ausgang" and w < 50 and not h.get("versteckt"):
                    W(ort, f"{art} {h['id']} ist nur {w} px breit (mindestens 50)")
                if y < 24:
                    W(ort, f"{art} {h['id']} beginnt bei y {y}, unter der Leiste oben (ab y 24)")
                if x < 0 or x + w > r["groesse"][0] or y + hh > r["groesse"][1]:
                    W(ort, f"{art} {h['id']} ragt über den Bildrand ({h['rect']})")
            for knoten in re.finditer(r'^\[node name="([^"]+)" parent="Props"[^\]]*\]\n((?:[^\[\n].*\n)*)',
                                      text, re.M):
                if knoten.group(1) == "Background":
                    continue
                tm = re.search(r'^texture = ExtResource\("([^"]+)"\)', knoten.group(2), re.M)
                pfad = pfade.get(tm.group(1)) if tm else None
                if not pfad or not (game / pfad).exists():
                    continue
                if "/platzhalter/" in pfad:
                    F(ort, f"Prop {knoten.group(1)} zeigt auf den Platzhalter {pfad}, obwohl der Raum "
                           f"fertig ist (echte Grafik nach grafik/props/, dann --cq-layout={r['id']})")
                    continue
                _, _, zeilen = png_lesen(game / pfad)
                if not zeilen:
                    continue
                # Der Platzhalter ist eine volle Fläche in dieser Farbe mit Rand (über 60 %); echte
                # Bilder enthalten sie höchstens stellenweise (Ei in der Taverne 29 %)
                sichtbar = [px for zeile in zeilen for px in zeile if len(px) < 4 or px[3] > 0]
                orange = sum(1 for px in sichtbar if px[:3] == PLATZHALTER_FARBE)
                if sichtbar and orange / len(sichtbar) > 0.5:
                    F(ort, f"Prop {knoten.group(1)}: {pfad} ist ein Platzhalter (Fläche in der "
                           f"Platzhalterfarbe {PLATZHALTER_FARBE})")


def main():
    nur_fehler = "--nur-fehler" in sys.argv
    alle = lade_tabellen()
    alle_ids = {}
    mitgebracht = set()
    for ab in ABSCHNITTE:
        d = alle.get(ab)
        if d is None:
            continue
        codes, kuerzel = pruefe_tabelle(ab, d, alle)
        mitgebracht |= pruefe_loesbarkeit(ab, d, mitgebracht)
        pruefe_skript(ab, d, codes, kuerzel, alle_ids)
        pruefe_namen(ab, d)
    pruefe_audio(alle)
    pruefe_nahansichten(alle)
    pruefe_code_schalter(alle)
    pruefe_englisch(alle_ids)
    pruefe_gespraeche()
    pruefe_raumszenen()
    import importlib.util
    spec = importlib.util.spec_from_file_location("diagramme", Path(__file__).with_name("diagramme.py"))
    dia = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(dia)
    if not dia.ZIEL.exists() or dia.ZIEL.read_text(encoding="utf-8") != dia.erzeugen():
        W("raetsel/abhaengigkeiten.md", "veraltet, python3 tools/diagramme.py ausführen")
    for z in fehler:
        print(z)
    if not nur_fehler:
        for z in warnungen:
            print(z)
    if "--hinweise" in sys.argv:
        for z in hinweise:
            print(z)
    print(f"\n{len(fehler)} Fehler, {len(warnungen)} Warnungen, {len(hinweise)} Hinweise "
          f"(anzeigen mit --hinweise), {len(alle_ids)} Skriptzeilen geprüft.")
    # Warnungen brechen ab wie Fehler: Zwischen 102 harmlosen Meldungen standen früher sechs
    # falsche Sprecher, und keiner hat sie gesehen.
    sys.exit(1 if fehler or warnungen else 0)


if __name__ == "__main__":
    main()
