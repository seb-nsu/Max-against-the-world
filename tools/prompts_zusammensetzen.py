#!/usr/bin/env python3
"""Fertige Konzeptbild-Prompts pro Raum, zum direkten Kopieren in ChatGPT oder Gemini.

Setzt für jede Szene aus den Grafik-Dateien (Tabelle „### Szenen“) zusammen:
Baustein KONZEPT (docs/grafik/00-stil-und-werkzeuge.md) + Motiv + passender Farb-Baustein der
Welt + Satz zur Layout-Skizze. Ergebnis: docs/grafik/fertige-prompts/<datei>.md.
Die Quelle bleiben die Grafik-Dateien; nach Änderungen dort dieses Werkzeug neu laufen lassen.

Außenszenen bekommen den Baustein KONZEPT-AUSSEN. Welche das sind, steht in der Grafik-Datei in
der Zeile „**Außenszenen** (Baustein KONZEPT-AUSSEN): …“ (Szenennamen wie in der Tabelle, mit
Semikolon getrennt). Ein Name, den die Tabelle nicht kennt, ist ein Fehler.

Welt 3 und 4 haben noch keine entworfenen Skizzen, nur automatische Raster (Prüfbericht, G4).
Für sie entfällt der Skizzen-Satz, bis es Handskizzen gibt (Liste OHNE_SKIZZE).

Kein Raten: Passt der Schlüssel einer Szene (Epoche, Ebene, Sender) zu keinem Farb-Baustein,
bricht das Werkzeug mit einer Meldung ab. Zeilen ohne eigenes Konzeptbild werden ausgelassen:
Motive, die mit „Keine eigene Grafik“, „Wiederverwendung“ oder einem Figuren-Baustein
(„FIGUR-…“) beginnen.

Gegenstände: Jede Tabelle „| Sammelbild | Motiv |“ wird zu Baustein GEGENSTÄNDE + Motiv, angehängt
an dieselbe Datei unter „# Gegenstände“; die weltenübergreifenden aus 00-stil-und-werkzeuge.md
landen in fertige-prompts/00-weltenuebergreifend.md. Zeilen der Tabellen „### Große Objekte…“ mit
Baustein GEGENSTÄNDE oder EFFEKT kommen dazu. Deutsche Anmerkungen in Klammern („(Opas Teetasse)“)
fliegen aus dem Prompt; Nahansichten (Motiv beginnt mit HINTERGRUND) bleiben draußen, sie sind
Hintergründe. Hier hängt keine Skizze an, kein Farb-Baustein (feste Palette beim Umrechnen).

Figuren: Jede Tabelle „| Figur | Baustein | Motiv |“ wird zu Baustein FIGURENBLATT + Motiv, unter
„# Figuren“. Pixelangaben („about 101 pixels tall“) werden zu Prozent von Max' Größe (189 Pixel),
weil Gemini Größen nur im Verhältnis zur angehängten Vorlage trifft.

Vertical Slice: fertige-prompts/vertical-slice.md sammelt die Prompts für Prolog-Reste und Welt 1,
Rätsel 1 bis 4, in der Reihenfolge der Arbeit (Liste SLICE unten): erst Räume, dann Figuren, dann
Sammelbilder. Die Blöcke sind dieselben wie in welt-1.md.

Aufruf:  python3 tools/prompts_zusammensetzen.py [--pruefen]
"""
import re
import sys
from pathlib import Path

WURZEL = Path(__file__).resolve().parent.parent
GRAFIK = WURZEL / "docs/grafik"
ZIEL = GRAFIK / "fertige-prompts"
DATEIEN = ["02-prolog-und-finale", "welt-1", "welt-2", "welt-3", "welt-4"]
SKIZZE_SATZ = ("Use the attached sketch only for the position and size of objects and exits, "
               "not for style, colors or text. Leave the orange marked spots empty.")
DUESTER = ("Keller", "Kammer", "Thronsaal", "Turm")
OHNE_SKIZZE = ("welt-3", "welt-4")
AUSSEN_MARKE = "**Außenszenen** (Baustein KONZEPT-AUSSEN):"
OHNE_KONZEPTBILD = ("Keine eigene Grafik", "Wiederverwendung", "FIGUR-")
DEUTSCH = re.compile(r"[äöüßÄÖÜ„“]|\b(der|die|das|und|von|wird|steht|ist|sind|als|für|nur|auf|mit|kein|Zuordnung)\b")
fehler = []
MAX_PIXEL = 189

# Vertical Slice, Welt 1 Rätsel 1 bis 4 (03-produktion.md, Stufe 2), in Arbeitsreihenfolge.
# (Überschrift in welt-1.md, Anmerkung für die Liste)
SLICE = {
    "Räume": [
        ("Dorfplatz", "Ankunft, Dorfbrett und Brunnen; R1 bis R4 laufen hier durch"),
        ("Taverne", "R1 Taverne-Coup: Humbert, Gollo, Minka, Huhn"),
        ("Zauberstab-Laden", "R2 Kochlöffel"),
        ("Schmiede", "R3 erste Ziege"),
        ("Troll-Brücke", "R3 und R4, Waldemar"),
        ("Klassenzimmer", "Hoggelwarz; im Slice nur Kulisse mit Alwin und Toadi"),
        ("Zauberwald", "R3 Rotkäppchens Lieferdienst"),
        ("Wasserschloss (Gag-Szene)", "Gag-Szene mit Schwan und Toadi"),
        ("Goblin-Bergwerk", "im Slice nur Kulisse mit Grimmzahn und zwei Goblins"),
    ],
    "Figuren": [
        ("Wirt Humbert", "R1"), ("Gollo", "R1"), ("Wirtskatze Minka", "R1, Figurenwechsel"),
        ("Zauberstabmacher", "R2"), ("Schmied", "R3"), ("Schmiede-Ziege", "R3"),
        ("Rotkäppchen", "R3"), ("XXL-Ziege", "R3"), ("Pixel als Ziege", "R3 und R4, eigenes Pixel-Blatt anhängen"),
        ("Troll Waldemar", "R4"), ("Toadi", "Ankunft"), ("Taverne-Huhn", "Kulisse"),
        ("Alwin Grauwald", "Kulisse"), ("Schwan", "Kulisse"), ("Grimmzahn", "Kulisse"),
        ("Goblin-Arbeiter 1", "Kulisse"), ("Goblin-Arbeiter 2", "Kulisse"),
    ],
    "Gegenstände": [
        ("Dorf und Taverne (3×3)", "Münze, Fondue, Vorleger, Bestellzettel, Eimer, Steckbrief"),
        ("Zaubertrank (2×4)", "Krug und Leuchtpilz liegen schon in den Räumen, der Rest kommt ab R5"),
        ("Wald und Turm (2×4)", "Ketchup liegt schon im Zauberwald, der Rest kommt ab R10"),
    ],
}


def textblock_nach(text, marke):
    i = text.index(marke)
    m = re.search(r"```text\n(.*?)\n```", text[i:], re.S)
    return m.group(1).strip()


def tabelle(text, kopf_beginn):
    """Zeilen der ersten Tabelle nach der Überschrift, als Listen von Zellen."""
    i = text.index(kopf_beginn)
    zeilen = []
    for z in text[i:].split("\n")[1:]:
        if not z.startswith("|"):
            if zeilen:
                break
            continue
        if z.startswith("| ---"):
            zeilen.clear()   # die Zeile davor war die Kopfzeile
            continue
        zeilen.append([c.strip() for c in z.strip().strip("|").split(" | ")])
    return zeilen


def farb_bausteine(text):
    """Schlüssel (Epoche, Ebene, Sender) → Baustein; '' ist der Standard."""
    if "**Farb-Baustein" in text and "```text" in text[text.index("**Farb-Baustein"):][:400]:
        werte = {"": textblock_nach(text, "**Farb-Baustein")}
        if "Für den Dunklen Turm stattdessen" in text:
            werte["düster"] = textblock_nach(text, "Für den Dunklen Turm stattdessen")
        if "Für das Goblin-Bergwerk stattdessen" in text:
            werte["bergwerk"] = textblock_nach(text, "Für das Goblin-Bergwerk stattdessen")
        return werte
    werte = {}
    for z in tabelle(text, "**Farb-Bausteine"):
        werte[z[0]] = z[1]
    return werte


def farbe_fuer(werte, schluessel, szene, datei):
    if "bergwerk" in werte and "bergwerk" in szene.lower():
        return werte["bergwerk"]
    if "düster" in werte and any(w.lower() in szene.lower() for w in DUESTER):
        return werte["düster"]
    if schluessel in werte:
        return werte[schluessel]
    for k, v in werte.items():
        if k.endswith(" innen"):
            continue   # Innen-Fassungen gelten nur, wenn die Szene sie wörtlich nennt
        if schluessel and schluessel != "–" and (schluessel in k or k.startswith(schluessel)):
            return v
    fehler.append(f"{datei}.md, Szene „{szene}“: kein Farb-Baustein für „{schluessel}“ "
                  f"(vorhanden: {', '.join(k for k in werte if k)})")
    return ""


def skizzen(text):
    m = re.search(r"\*\*Layout-Skizzen\*\*[^:]*: (.*?)\.\n", text)
    if not m:
        return {}
    return dict(re.findall(r"\[([^\]]+)\]\(([^)]+)\)", m.group(1)))


def aussenszenen(text, datei, szenen):
    """Namen der Szenen, die den Baustein KONZEPT-AUSSEN bekommen."""
    if AUSSEN_MARKE not in text:
        return set()
    zeile = text[text.index(AUSSEN_MARKE) + len(AUSSEN_MARKE):].split("\n", 1)[0]
    namen = {n.strip().rstrip(".") for n in zeile.split(";") if n.strip()}
    for n in sorted(namen - set(szenen)):
        fehler.append(f"{datei}.md, Außenszenen: „{n}“ steht nicht in der Tabelle „Szenen“")
    return namen


def skizze_fuer(liste, szene):
    for name, pfad in liste.items():
        n, s = name.lower(), szene.lower()
        if s == n or s.startswith(n) or n.startswith(s):
            return name, pfad
    return None


def ohne_anmerkungen(motiv):
    """Deutsche Anmerkungen in Klammern und Werkzeug-Vorsätze aus einem Motiv entfernen."""
    motiv = re.sub(r"^`[^`]+`:\s*", "", motiv)
    motiv = re.sub(r"\s*\((?=[^)]*(?:[äöüßÄÖÜ„“]|\b[A-Z][a-zäöü]+\b|\d+ Jahre))[^)]*\)", "", motiv)
    # Deutsche Sätze hinter dem englischen Motiv („Zuordnung von links: …“) weglassen
    saetze = re.split(r"(?<=\.)\s+(?=[A-ZÄÖÜ])", motiv.strip())
    motiv = " ".join([saetze[0]] + [x for x in saetze[1:] if not DEUTSCH.search(x)])
    return motiv.strip().rstrip(".")


def gegenstands_tabellen(text):
    """(Name, Zusatz, Motiv, Baustein) für Sammelbilder und große Objekte mit GEGENSTÄNDE/EFFEKT."""
    out = []
    for m in re.finditer(r"\| Sammelbild \| Motiv \|\n\| --- \| --- \|\n((?:\|.*\n?)+)", text):
        for z in m.group(1).splitlines():
            name, motiv = [c.strip() for c in z.strip().strip("|").split(" | ")][:2]
            if motiv.startswith("HINTERGRUND"):
                continue
            out.append((name, "", motiv, "GEGENSTÄNDE"))
    for m in re.finditer(r"### Große Objekte[^\n]*\n\n\| Objekt \| Baustein \| Motiv \|\n\| --- \| --- \| --- \|\n((?:\|.*\n?)+)", text):
        for z in m.group(1).splitlines():
            name, bau, motiv = [c.strip() for c in z.strip().strip("|").split(" | ")][:3]
            art = bau.split()[0].rstrip(",")
            if art in ("GEGENSTÄNDE", "EFFEKT"):
                out.append((name, bau, motiv, art))
    return out


def gegenstaende_bauen(text, bausteine):
    out = []
    for name, bau, motiv, art in gegenstands_tabellen(text):
        out += [f"## {name}", ""]
        if bau:
            out += [f"**Hinweis:** {bau}", ""]
        out += ["```text", f"{bausteine[art]} {ohne_anmerkungen(motiv)}.", "```", ""]
    if not out:
        return []
    return ["# Gegenstände", "",
            "Je Sammelbild den Block komplett in Gemini kopieren, keine Skizze anhängen. Umrechnen mit",
            "`tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.", ""] + out


def relativ(motiv):
    """„about 101 pixels tall“ → „about 53 percent of the boy Max's height“."""
    def ersetze(m):
        n = int(m.group(2))
        if n == MAX_PIXEL:
            return f"{m.group(1)} as tall as the boy Max"
        return f"{m.group(1)} {round(n * 100 / MAX_PIXEL)} percent of the boy Max's height"
    return re.sub(r"\b([Aa]bout) (\d+) pixels tall", ersetze, motiv)


def figuren_bauen(text, bausteine):
    if "| Figur | Baustein | Motiv |" not in text:
        return []
    out = []
    for z in tabelle(text, "| Figur | Baustein | Motiv |"):
        if len(z) < 3 or not z[1].startswith("FIGUR"):
            continue
        name, motiv = z[0], ohne_anmerkungen(relativ(z[2]))
        out += [f"## {name}", "", "```text", f"{bausteine['FIGURENBLATT']} {motiv}.", "```", ""]
    if not out:
        return []
    return ["# Figuren", "",
            "Je Figur den Block in Gemini kopieren und Max' Konzeptblatt als Stilvorlage anhängen. Gebraucht",
            "wird nur die Seitenansicht nach rechts; Gehen und Reden entstehen per Code (`tools/figur.py`).", ""] + out


def abschnitte(text):
    """„## Überschrift“ → Block bis zur nächsten Überschrift (ohne die Überschrift)."""
    teile = re.split(r"^(#{1,2} .*)$", text, flags=re.M)
    out = {}
    for kopf, rumpf in zip(teile[1::2], teile[2::2]):
        if kopf.startswith("## "):
            out.setdefault(kopf[3:].strip(), rumpf.strip())
    return out


def slice_bauen(welt1):
    teile = abschnitte(welt1)
    out = ["# Vertical Slice: Prompts in Arbeitsreihenfolge", "",
           "Erzeugt von `tools/prompts_zusammensetzen.py` (Liste SLICE dort, Blöcke aus `welt-1.md`).",
           "Prolog und Welt 1, Rätsel 1 bis 4 (`../../03-produktion.md`, Stufe 2). Von oben nach unten",
           "abarbeiten: erst Räume (Skizze anhängen), dann Figuren (Max' Blatt anhängen), dann Sammelbilder.",
           "Jeden fertigen Raum mit `python3 tools/stimmigkeit.py --kandidat bild.png` gegen den Prolog prüfen.",
           "", "## Noch offen aus dem Prolog", "",
           "- Pixel: Posenblatt Stehen und Schlafen (Prompt im Gespräch vom 12. November, Pixels Blatt anhängen).",
           "", "## Nahansicht für Rätsel 4", "",
           "- Märchen-Satzung am Brückenschild: Motiv (1) in `../welt-1.md`, Zeile „Nahansichten Welt 1“,",
           "  mit Baustein HINTERGRUND; die Schrift kommt von Hand dazu.", ""]
    nr = 0
    for art, liste in SLICE.items():
        out += [f"# {art}", ""]
        for kopf, notiz in liste:
            if kopf not in teile:
                fehler.append(f"vertical-slice: „{kopf}“ fehlt in fertige-prompts/welt-1.md")
                continue
            nr += 1
            out += [f"## {nr}. {kopf}", "", f"*{notiz}*", "", teile[kopf], ""]
    return "\n".join(out).rstrip() + "\n"


def datei_bauen(name, konzept, konzept_aussen, bausteine):
    text = (GRAFIK / f"{name}.md").read_text(encoding="utf-8")
    werte = farb_bausteine(text)
    liste = {} if name in OHNE_SKIZZE else skizzen(text)
    aussen = aussenszenen(text, name, [z[0] for z in tabelle(text, "### Szenen")])
    titel = text.split("\n", 1)[0].lstrip("# ").replace("Grafik: ", "")
    out = [f"# Fertige Konzeptbild-Prompts: {titel}", "",
           f"Erzeugt von `tools/prompts_zusammensetzen.py` aus `../{name}.md` (dort ändern, nicht hier).",
           "Je Szene den Block komplett in ChatGPT oder Gemini kopieren und die Layout-Skizze als Bild",
           "anhängen. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene).",
           ""]
    if name in OHNE_SKIZZE:
        out[3:5] = ["Je Szene den Block komplett in ChatGPT oder Gemini kopieren. Keine Skizze anhängen: Für diese",
                    "Welt gibt es noch keine entworfenen Skizzen, die automatischen Raster widersprechen dem Motiv.",
                    "Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene)."]
    for z in tabelle(text, "### Szenen"):
        szene, motiv = z[0], z[-1]
        schluessel = z[1] if len(z) == 5 else ""
        if not re.search(r"[a-z]{3} [a-z]{3}", motiv) or motiv.startswith(OHNE_KONZEPTBILD):
            continue
        motiv = re.sub(r"^(HINTERGRUND|Background):\s*", "", motiv)
        farbe = farbe_fuer(werte, schluessel, szene, name)
        out.append(f"## {szene}")
        out.append("")
        if len(z) >= 4 and z[-3] not in ("–", "-", ""):
            out.append(f"**Zustände:** {z[-3]}")
            out.append("")
        sk = skizze_fuer(liste, szene)
        if sk:
            out.append(f"**Layout-Skizze:** [{sk[0]}](../{sk[1]})")
            out.append("")
        satz = f" {SKIZZE_SATZ}" if sk else ""
        baustein = konzept_aussen if szene in aussen else konzept
        out += ["```text", f"{baustein} {motiv.rstrip('.')}. {farbe}.{satz}", "```", ""]
    out += figuren_bauen(text, bausteine)
    out += gegenstaende_bauen(text, bausteine)
    return "\n".join(out)


def main():
    pruefen = "--pruefen" in sys.argv
    stil = (GRAFIK / "00-stil-und-werkzeuge.md").read_text(encoding="utf-8")
    konzept = textblock_nach(stil, "**KONZEPT**")
    konzept_aussen = textblock_nach(stil, "**KONZEPT-AUSSEN**")
    bausteine = {"GEGENSTÄNDE": textblock_nach(stil, "**GEGENSTÄNDE**"),
                 "EFFEKT": textblock_nach(stil, "**EFFEKT**"),
                 "FIGURENBLATT": textblock_nach(stil, "**FIGURENBLATT**")}
    veraltet = []
    ZIEL.mkdir(exist_ok=True)
    gebaut = {name: datei_bauen(name, konzept, konzept_aussen, bausteine) for name in DATEIEN}
    gebaut["00-weltenuebergreifend"] = "\n".join(
        ["# Fertige Prompts: Weltenübergreifende Gegenstände", "",
         "Erzeugt von `tools/prompts_zusammensetzen.py` aus `../00-stil-und-werkzeuge.md` (dort ändern, nicht hier).",
         ""] + gegenstaende_bauen(stil, bausteine)[2:])
    gebaut["vertical-slice"] = slice_bauen(gebaut["welt-1"])
    if fehler:
        for f in fehler:
            print("FEHLER  " + f)
        sys.exit(1)
    for name, neu in gebaut.items():
        pfad = ZIEL / f"{name}.md"
        alt = pfad.read_text(encoding="utf-8") if pfad.exists() else ""
        if neu != alt:
            veraltet.append(pfad.name)
            if not pruefen:
                pfad.write_text(neu, encoding="utf-8")
    if pruefen and veraltet:
        print("Veraltet (python3 tools/prompts_zusammensetzen.py):", ", ".join(veraltet))
        sys.exit(1)
    print(f"{len(gebaut)} Dateien" + (" geprüft" if pruefen else f" → {ZIEL}"))


if __name__ == "__main__":
    main()
