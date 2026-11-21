#!/usr/bin/env python3
"""Review 21.11.2026, Rolle an-c (Animationen Welt 3 und Zwischenspiel 3): Bestand aller Bewegungen und
Effekt-Bildfolgen mit Aufrufstellen. Nur lesend.

Ausgabe (nach belege/an-c/):
  bestand_figuren.csv   je Figur und Bewegung: Bilder, Schritte, ms, Dauer, Schleife, Aufrufe, Status
  bestand_effekte.csv   je Datei unter grafik/ambiente/w3_* und grafik/props/w3_*: Größe, Aufrufe, Status
  regie_ohne_geste.csv  Skriptzeilen Welt 3 / ZS3 mit Regieangabe, aber ohne Eintrag in ZEILE
Aufruf: py -3 docs/review/2026-11-21/werkzeuge/an-c_bestand.py
"""
import csv
import json
import re
import sys
from pathlib import Path

from PIL import Image

W = Path(__file__).resolve().parents[4]
SPIEL = W / "game"
ZIEL = W / "docs/review/2026-11-21/belege/an-c"
ZIEL.mkdir(parents=True, exist_ok=True)

welt = json.loads((SPIEL / "daten/welten/welt-3.json").read_text(encoding="utf-8"))
KUERZEL = {f["kuerzel"]: f["id"] for f in welt["figuren"] if f.get("kuerzel")}
FIGUREN = [f["id"] for f in welt["figuren"]]
VARIANTEN = {"kalle_ohne_laptop": "kalle", "max_ente": "max", "mutti_aus": "mutti", "opa_hologramm": "opa",
             "schmidt_ohne_brille": "schmidt"}
W3_MAX = ["code_sicht", "gedankentrick", "handy", "hexenschuss", "hexenschuss_gehen", "hochhalten",
          "kapsel_aufstehen", "kapsel_aussteigen", "kapsel_einsteigen", "kapsel_hinlegen", "nudeln", "pastille",
          "portalgeraet", "regen_wischen", "ruecken_halten", "schlucken", "stempel_ansehen", "tasche", "tippen",
          "zeitlupe"]
W3_PIXEL = ["kabel", "morse", "ohrfeige", "schieben", "tasse", "tragen", "vom_schrank_fallen"]

# zurückgestellt laut tools/grafik_fundstellen.py
sys.path.insert(0, str(W / "tools"))
import grafik_fundstellen as gf  # noqa: E402

gd_dateien = [p for muster in ("game/skripte/**/*.gd", "game/game/**/*.gd", "game/oberflaeche/**/*.gd")
              for p in W.glob(muster) if "/tests/" not in p.as_posix() and not p.name.startswith("_")]
gd = {p: p.read_text(encoding="utf-8", errors="replace").splitlines() for p in gd_dateien}
layout_zeilen = (W / "tools/layout/welt-3.yaml").read_text(encoding="utf-8").splitlines()

# --- Gesten-Tabellen ---------------------------------------------------------------------------------
zeile = {}      # (figur, anim) -> [(id, art)]
zeilen_ids = {}
for p in (SPIEL / "skripte/gesten_einsatz.gd", SPIEL / "skripte/gesten_welt_3.gd"):
    for z in p.read_text(encoding="utf-8").splitlines():
        m = re.match(r'\s*"((?:W3|ZS3)_[A-Z0-9_]+)":\s*\["([A-Z]+)",\s*"([a-z0-9_]+)",\s*"([a-z_]+)"', z)
        if m:
            fid = KUERZEL.get(m.group(2), m.group(2).lower())
            zeile.setdefault((fid, m.group(3)), []).append((m.group(1), m.group(4)))
            zeilen_ids[m.group(1)] = (fid, m.group(3), m.group(4))

ruhe, warten = {}, {}
for p in (SPIEL / "skripte/gesten_einsatz.gd", SPIEL / "skripte/gesten_welt_3.gd"):
    t = p.read_text(encoding="utf-8")
    for tab, ziel in (("RUHE", ruhe), ("WARTEN", warten)):
        m = re.search(r"const %s := \{(.*?)\n\}" % tab, t, re.S)
        if not m:
            continue
        aktuell = None
        for z in m.group(1).splitlines():
            k = re.match(r'\s*"([a-z0-9_]+)":', z)
            if k:
                aktuell = k.group(1)
            if aktuell is None or z.strip().startswith("#"):
                continue
            for e in re.finditer(r"\{(geste|gesten) = (\"[a-z_]+\"|\[[^\]]*\])([^}]*)\}", z):
                namen = re.findall(r'"([a-z0-9_]+)"', e.group(2))
                bed = e.group(3).strip(" ,")
                if "abschnitt" in bed and "welt-3" not in bed:
                    continue
                for n in namen:
                    ziel.setdefault((aktuell, n), []).append(bed)


def code_stellen(name, figur):
    """Zeilen in Skripten, die "name" als Zeichenkette nennen (ohne die Gesten-Tabellen)."""
    out = []
    for p, zeilen in gd.items():
        if p.name.startswith("gesten_"):
            continue
        nah = p.name in ("welt_3.gd",) or figur in p.as_posix() or "dachboden" in p.as_posix()
        if not nah:
            continue
        for i, z in enumerate(zeilen, 1):
            if z.strip().startswith("#"):
                continue
            if re.search(r'"%s"' % re.escape(name), z):
                out.append(f"{p.name}:{i}")
    return out


GANG = re.search(r"const GANG_TEMPO := \{([^}]*)\}", "\n".join(gd[SPIEL / "skripte/welt_3.gd"]))
GEHER = {re.sub(r"(?<!^)(?=[A-Z])", "_", k).lower(): float(v) for k, v in
         re.findall(r'"([A-Za-z]+)":\s*([0-9.]+)', GANG.group(1))}

zeilen_out = []
blaetter = FIGUREN + list(VARIANTEN)
gesehen = set()
for fid in blaetter:
    pfad = SPIEL / f"daten/figuren/{fid}.json"
    if not pfad.exists() or fid in gesehen:
        if not pfad.exists():
            zeilen_out.append([fid, "", "(kein Blatt)", "", "", "", "", "", "", "", "", "kein Figurenblatt", ""])
        continue
    gesehen.add(fid)
    d = json.loads(pfad.read_text(encoding="utf-8"))
    basis = VARIANTEN.get(fid, fid)
    variante_geladen = fid not in VARIANTEN or any(f'"{fid}"' in "\n".join(z) for z in gd.values())
    for name, a in d["animationen"].items():
        if fid == "max" and name not in W3_MAX and name not in ("idle", "talk", "walk", "talk_hand", "kopf_kratzen", "gaehnen", "zeigen", "benutzen"):
            continue
        if fid == "pixel" and name not in W3_PIXEL and name not in ("idle", "talk", "walk", "putzen", "schwanz_zucken", "sitzen", "springen"):
            continue
        if fid == "opa" and name not in ("idle", "talk", "walk", "panik", "erklaeren", "kopf_kratzen"):
            continue
        folge = a.get("folge", list(range(int(a["bilder"]))))
        dauer = len(folge) * a["ms"] / 1000.0
        aufrufe, arten = [], []
        for (zid, art) in zeile.get((basis, name), []) + (zeile.get((fid, name), []) if fid != basis else []):
            aufrufe.append(f"{zid}({art})")
            arten.append("ZEILE")
        for bed in ruhe.get((basis, name), []):
            aufrufe.append(f"RUHE[{bed}]")
            arten.append("RUHE")
        for bed in warten.get((basis, name), []):
            aufrufe.append(f"WARTEN[{bed}]")
            arten.append("WARTEN")
        if name in ("idle", "talk"):
            arten.append("immer")
        elif name == "walk":
            if basis in ("max", "pixel"):
                arten.append("Spielfigur")
            elif basis == "schwarze_katze":
                arten.append("Code")
                aufrufe.append("welt_3.gd _katze_schleife")
            elif basis in GEHER:
                arten.append("Code")
                aufrufe.append(f"laufen_zu, GANG_TEMPO {GEHER[basis]}")
        else:
            cs = code_stellen(name, basis)
            if cs:
                arten.append("Code")
                aufrufe += cs
        schl = f"{fid}/{name}"
        if schl in gf.ZURUECKGESTELLT:
            status = "zurückgestellt (Werkzeug)"
        elif not variante_geladen:
            status = "ungenutzt (Variante wird nie geladen)"
        elif arten:
            status = "genutzt"
        else:
            status = "ungenutzt"
        zeilen_out.append([fid, basis if fid in VARIANTEN else "", name, a["von"], a["bilder"], len(folge), a["ms"],
                           f"{dauer:.2f}", "ja" if a.get("schleife", True) else "nein",
                           "+".join(sorted(set(arten))), "; ".join(aufrufe[:14]) + (" …" if len(aufrufe) > 14 else ""),
                           status, len(aufrufe)])

with open(ZIEL / "bestand_figuren.csv", "w", newline="", encoding="utf-8-sig") as f:
    w = csv.writer(f, delimiter=";")
    w.writerow(["figur", "variante_von", "bewegung", "von", "bilder_im_blatt", "schritte", "ms", "dauer_s", "schleife",
                "aufruf_art", "aufrufe", "status", "zahl_aufrufe"])
    w.writerows(zeilen_out)

# --- Effekte -----------------------------------------------------------------------------------------
eff = []
raum = ""
layout_treffer = {}
for i, z in enumerate(layout_zeilen, 1):
    m = re.match(r"^([a-z0-9_]+):\s*$", z)
    if m:
        raum = m.group(1)
    for b in re.finditer(r"res://grafik/(ambiente|props)/(w3_[a-z0-9_]+)\.png", z):
        if z.strip().startswith("#"):
            continue
        cfg = {k: v.strip() for k, v in re.findall(r"(\w+):\s*(\[[^\]]*\]\]?|[^,}]+)", z)}
        layout_treffer.setdefault(b.group(2), []).append((raum, i, cfg))

for ordner in ("ambiente", "props"):
    for png in sorted((SPIEL / "grafik" / ordner).glob("w3_*.png")):
        stamm = png.stem
        bild = Image.open(png)
        muster = re.compile(re.escape(stamm) + r"(?![a-z0-9_])")
        code = [f"{p.name}:{i}" for p, zeilen in gd.items() for i, z in enumerate(zeilen, 1)
                if muster.search(z) and not z.strip().startswith("#")]
        lt = layout_treffer.get(stamm, [])
        v02 = (png.parent / f"{stamm}_v02.png").exists()
        if lt or code:
            status = "genutzt"
        elif v02:
            status = "abgelöst (_v02 vorhanden, W3-8)"
        elif stamm in gf.ZURUECKGESTELLT:
            status = "zurückgestellt (Werkzeug)"
        else:
            status = "ungenutzt"
        if not lt:
            eff.append([ordner, stamm, bild.width, bild.height, "", "", "", "", "", "", "; ".join(code), status])
        for (r, zl, cfg) in lt:
            n = int(cfg.get("bilder", 1) or 1)
            fps = float(cfg.get("fps", 0) or 0)
            eff.append([ordner, stamm, bild.width, bild.height, n, bild.width // max(1, n), fps,
                        f"{n / fps:.2f}" if fps else "", r,
                        " ".join(f"{k}={cfg[k]}" for k in ("wenn", "sonst", "spricht", "pause", "ablauf", "weg", "tempo", "start", "baseline", "z", "skala") if k in cfg),
                        f"welt-3.yaml:{zl}" + ("; " + "; ".join(code) if code else ""), status])

with open(ZIEL / "bestand_effekte.csv", "w", newline="", encoding="utf-8-sig") as f:
    w = csv.writer(f, delimiter=";")
    w.writerow(["ordner", "datei", "breite", "hoehe", "bilder", "bildbreite", "fps", "umlauf_s", "raum", "bedingung_und_weg",
                "aufrufstelle", "status"])
    w.writerows(eff)

# Code-Effekte im Layout (flackern, dampf)
code_eff = [(i, z.strip()) for i, z in enumerate(layout_zeilen, 1) if re.search(r"art: (flackern|dampf)", z)]

# --- Regie ohne Geste --------------------------------------------------------------------------------
w3 = "\n".join(gd[SPIEL / "skripte/welt_3.gd"])
regie = []
for datei, praefix in (("docs/skript/welt-3.md", "W3_"), ("docs/skript/zwischenspiele-und-finale.md", "ZS3_")):
    for z in (W / datei).read_text(encoding="utf-8").splitlines():
        if not z.startswith("| " + praefix[:2]):
            continue
        sp = [s.strip().replace("\\_", "_") for s in z.strip().strip("|").split("|")]
        if len(sp) < 4 or not sp[0].startswith(praefix):
            continue
        zid, sprecher, text, reg = sp[0], sp[1], sp[2], sp[3]
        ist_nar = "_NAR_" in zid
        if not reg and not ist_nar:
            continue
        g = zeilen_ids.get(zid)
        regie.append([zid, sprecher, reg, text[:110] if ist_nar else "", f"{g[0]}/{g[1]} ({g[2]})" if g else "",
                      "ja" if zid in w3 or zid in "\n".join("\n".join(v) for v in gd.values()) else "nein"])
with open(ZIEL / "regie_ohne_geste.csv", "w", newline="", encoding="utf-8-sig") as f:
    w = csv.writer(f, delimiter=";")
    w.writerow(["zeile", "sprecher", "regie", "erzaehltext", "geste_in_ZEILE", "zeile_im_code"])
    w.writerows(regie)

# --- Zusammenfassung ---------------------------------------------------------------------------------
from collections import Counter
c = Counter(z[11] for z in zeilen_out)
print("Figuren-Bewegungen:", len(zeilen_out), dict(c))
for z in zeilen_out:
    if z[11] != "genutzt":
        print("  ", z[0], z[2], "->", z[11])
c = Counter(e[11] for e in {(e[1]): e for e in eff}.values())
print("Effektdateien:", len({e[1] for e in eff}), dict(c))
for name in sorted({e[1] for e in eff if e[11] not in ("genutzt",)}):
    print("  ", name, "->", [e[11] for e in eff if e[1] == name][0])
print("Layout-Einträge mit Bildfolge:", sum(len(v) for v in layout_treffer.values()), "Code-Effekte (flackern/dampf):", len(code_eff))
arten = Counter(v[2] for v in zeilen_ids.values() if v[1] != "talk_hand")
print("ZEILE Welt 3 ohne talk_hand:", sum(arten.values()), dict(arten), "talk_hand:", sum(1 for v in zeilen_ids.values() if v[1] == "talk_hand"))
print("ZS3-Einträge:", [k for k in zeilen_ids if k.startswith("ZS3")])
# doppelte Bewegungen: gleiche Bildbereiche je Blatt
print("Regie-Zeilen:", len(regie), "davon ohne ZEILE:", sum(1 for r in regie if not r[4]))
