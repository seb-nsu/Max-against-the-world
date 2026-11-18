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

Zweite und dritte Fassungen („Second version: identical, but …“) werden aus dem Motiv gelöst und
als eigener Block „im selben Chat“ darunter gestellt, so wie sie in Gemini auch entstehen. Motive mit
„LEFT HALF“ bekommen den Hinweis zum Breitbild.

Große Objekte mit einem Figuren-Baustein (FIGUR-GROSS …) werden zu Baustein OBJEKT + Motiv.
Posenbögen: Jede Tabelle „| Bogen | Vorlage | Posen | Wofür | Motiv |“ wird zu Baustein POSENBOGEN +
Motiv, unter „# Posenbögen“. Nahansichten: „| Nahansicht | Epoche | Motiv |“ wird zu Baustein
NAHANSICHT + Motiv + Farb-Baustein, unter „# Nahansichten und Tafeln“.

Vertical Slice: fertige-prompts/vertical-slice.md sammelt die Prompts für Prolog-Reste und Welt 1,
Rätsel 1 bis 4, in der Reihenfolge der Arbeit (Liste SLICE unten): erst Räume, dann Figuren, dann
Sammelbilder. Die Blöcke sind dieselben wie in welt-1.md.

Methode seit 14. November 2026 (00-stil-und-werkzeuge.md, „Methode seit 14. November 2026“):
- Jeder Prompt ist ein Raster mit beschrifteten Zeilen (STYLE, SCENE/SUBJECT, PALETTE, LAYOUT, ACTION,
  END POSE, CAMERA, NEGATIVE). PALETTE bekommt die Hex-Anker aus der Tabelle „Farb-Anker“.
- Max, Pixel und Opa bekommen ihren Block FEST wortgleich als Zeile CHARACTER LOCK (Erkennung am
  Namen der Figur, der Bewegung oder des Posenbogens). Posen und Bewegungen anderer Figuren übernehmen
  das Motiv aus der Figuren-Tabelle derselben Datei wortgleich.
- Zweite und dritte Fassungen werden zu Masken-Prompts (Baustein MASKE): nur die betroffene Stelle
  ändert sich, alles andere bleibt gleich.
- Animations-Tabellen („| Figur | Aktion | … | Bilder | Ablauf | Motiv |“) werden zu Bewegungsrastern
  (Baustein BEWEGUNG): höchstens vier Schlüsselposen mit Zeitmarke, Endpose, statische Kamera.
- Jede Datei beginnt mit einer Shotliste mit fester Nummer je Bild (W2-R03 …) und dem Stand (Bild
  schon unter game/grafik/ oder offen). fertige-prompts/01-figurenboegen.md enthält die Figurenbögen
  von Max, Pixel und Opa mit vier Ansichten und sechs Ausdrücken.

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
DEUTSCH_WORT = re.compile(r"\b(der|die|das|und|wird|steht|ist|sind|für|nur|auf|mit|kein|ohne|zweite|Fassung|"
                          r"Zuerst|nimmt|sie|läuft)\b")
fehler = []
FEST, BOGEN, ANKER = {}, {}, {}
MAX_PIXEL = 189
SPIEL = WURZEL / "game/grafik"
BILDER_PRO_SEKUNDE = 10   # Richtwert für die Zeitmarken der Schlüsselposen
KUERZEL = {"02-prolog-und-finale": "PF", "welt-1": "W1", "welt-2": "W2", "welt-3": "W3", "welt-4": "W4",
           "00-weltenuebergreifend": "WU", "01-figurenboegen": "FB"}
ARTEN = {"Räume": "R", "Figuren": "F", "Posenbögen": "P", "Bewegungen": "B", "Gegenstände": "G",
         "Nahansichten und Tafeln": "N", "Figurenbögen": "K"}
FEST_NAMEN = {"Max": "Max", "Pixel": "Pixel", "Opa": "Opa"}
# Bewegungen, die schon im Spiel sind (per Code oder 3D-Winkel, offene-punkte.md, 14. November 2026)
IM_SPIEL = {"00-weltenuebergreifend": {"Max: Gehen", "Max: Stehen", "Max: Sprechen", "Max: Auf dem Sofa",
                                       "Pixel: Gehen", "Pixel: Stehen", "Pixel: Schlafen"}}
# Figuren, deren Sprite anders heißt als die Zeile der Figuren-Tabelle
SPRITE_NAME = {"Sobek, im Wasser": "sobek", "Sobek, an Land": "sobek_land", "Palastschreiber": "schreiber"}
NOCH_NICHTS = ("welt-3", "welt-4")   # noch kein Bild dieser Welten im Spiel
WELT_PRAEFIX = {"02-prolog-und-finale": "w0", "welt-1": "w1", "welt-2": "w2", "welt-3": "w3", "welt-4": "w4"}
STAND = {
    "welt-1": "Welt 1 ist komplett erzeugt (Räume, Figuren, Gegenstände, Nahansichten). Offen sind nur "
              "Bewegungen, für die gemalte Schlüsselposen fehlen, etwa Hämmern (Schmied) und Rühren (Alwin). "
              "Alle anderen Blöcke dienen nur noch zum Nachbessern, dann mit dem Baustein MASKE.",
    "02-prolog-und-finale": "Der Prolog ist erzeugt. Offen sind die Finale-Räume, die Figuren außer Max, "
              "Pixel und Opa, die Bewegungen und ein Teil der Gegenstände.",
    "welt-2": "Offene Arbeit und Reihenfolge stehen in `welt-2-offen.md`; die Shotliste unten zeigt, was "
              "schon im Spiel ist.",
}

# Welt 3 (Sebastian, 18. November 2026): Sebastian erzeugt die Grundlagenbilder in Gemini, Claude macht
# danach Posenbögen und Bildfolgen selbst über Meshy oder die Gemini-API mit dem Konzeptblatt als Vorlage.
REIHENFOLGE = {
    "welt-3": [
        "# Grundlagenbilder für Welt 3", "",
        "Diese Bilder entstehen in Gemini, von oben nach unten. Alles andere (Posenbögen W3-P, Bewegungen und "
        "Effekte W3-B, die Code-Sicht W3-R13) macht Claude danach über Meshy oder die Gemini-API, mit dem "
        "fertigen Konzeptblatt als Vorlage. Eigene 3D-Vorlagen in T-Pose sind nicht nötig: Die Läufe und "
        "Clips kommen von den vorhandenen Meshy-Rigs (alle haben dasselbe Skelett), Aussehen und Gesicht aus "
        "dem Konzeptblatt. Braucht eine Figur doch ein eigenes Modell, macht Claude die stehende Vorlage selbst. "
        "Der Stand jeder Nummer steht in `../status-alle-shots.md`, Abschnitt Welt 3.", "",
        "1. **Figuren der Unterstadt** (Max' Konzeptblatt anhängen): W3-F02 Morphäus, W3-F07 Detektiv Deckert, "
        "W3-F08 Herr Vier, W3-F17 Straßenmusiker im Regen, W3-F15 Weinender Mann, W3-F16 Frau mit Regenschirm, "
        "W3-F21 Max in der Pfütze.",
        "2. **Figuren der Widerstandsbasis und des Labors:** W3-F09 Kabel-Kalle, W3-F11 Rebellin, W3-F12 Rebell, "
        "W3-F13 Piepsi (mit zweiter Fassung), W3-F14 Opa als Hologramm, W3-F20 Max in der Kapsel (mit zweiter "
        "Fassung), W3-F19 Max als Ente, W3-F06 Roboter-Hausmeister.",
        "3. **Figuren der Simulation:** W3-F03 Orakel-Oma, W3-F04 Agent Schmidt (mit zweiter Fassung), W3-F05 "
        "Schmidt-Klon (im selben Chat aus Schmidt), W3-F18 Schwarze Katze, W3-F10 Bernd, W3-F01 M.U.T.T.I. (mit "
        "zweiter Fassung).",
        "4. **Gegenstände:** W3-G01 bis W3-G07.",
        "5. **Räume:** W3-R01 Unterstadt-Straße, W3-R02 Apothekengasse, W3-R03 Widerstandsbasis, W3-R04 Kühlung, "
        "W3-R05 Laboreingang, W3-R06 Stadtstraße, W3-R07 Küche der Orakel-Oma, W3-R08 Büroturm, W3-R09 bis "
        "W3-R11 Testkammern, W3-R12 Kern. Zweite Fassungen jeweils im selben Chat aus dem fertigen Bild.",
        "6. **Nahansichten:** W3-N01 bis W3-N05 (nichts anhängen, Schrift setzt Claude).", "",
        "Als PNG in voller Größe unter `E:\\Game Engine\\Grafiken\\assets` ablegen, Name mit der Nummer vorn "
        "(etwa `W3-F02_morphaeus.png`).", ""],
}

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
        ("Streik-Goblin 1", "Kulisse, stumm"), ("Streik-Goblin 2", "Kulisse, stumm"), ("Streik-Goblin 3", "Kulisse, stumm"),
        # Erst ab Rätsel 5, also nicht im Slice, sondern für die Demo mit ganz Welt 1 (Stufe 3);
        # hier schon dabei, damit die Prompts bereitliegen (13. November 2026)
        ("Zeldina", "nach dem Slice, ab R9"), ("Maklerin", "nach dem Slice, Luftschloss"),
        ("Lord Moderwort", "nach dem Slice, Thronsaal"), ("Smaugi", "nach dem Slice, FIGUR-GROSS"),
        ("Übungsbesen", "nach dem Slice, Hinweis in R6"), ("Zauberbesen", "nach dem Slice, R11"),
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


def farbe_eintrag(werte, schluessel, szene, datei):
    """(Schlüssel, Farb-Baustein) für eine Szene; der Schlüssel führt zu den Hex-Ankern."""
    if "bergwerk" in werte and "bergwerk" in szene.lower():
        return "bergwerk", werte["bergwerk"]
    if "düster" in werte and any(w.lower() in szene.lower() for w in DUESTER):
        return "düster", werte["düster"]
    if schluessel in werte:
        return schluessel, werte[schluessel]
    for k, v in werte.items():
        if k.endswith(" innen"):
            continue   # Innen-Fassungen gelten nur, wenn die Szene sie wörtlich nennt
        if schluessel and schluessel != "–" and (schluessel in k or k.startswith(schluessel)):
            return k, v
    fehler.append(f"{datei}.md, Szene „{szene}“: kein Farb-Baustein für „{schluessel}“ "
                  f"(vorhanden: {', '.join(k for k in werte if k)})")
    return "", ""


def farbe_fuer(werte, schluessel, szene, datei):
    return farbe_eintrag(werte, schluessel, szene, datei)[1]


def farb_anker(stil):
    """Tabelle „Farb-Anker“ aus 00-stil-und-werkzeuge.md: (Datei, Schlüssel) → Hex-Anker."""
    out = {}
    for z in tabelle(stil, "**Farb-Anker**"):
        while len(z) < 3:
            z.insert(1, "")
        out[(z[0], z[1])] = z[2]
    return out


def palette(datei, werte, schluessel, szene):
    """Zeile PALETTE: Farb-Baustein der Welt plus Hex-Anker."""
    k, farbe = farbe_eintrag(werte, schluessel, szene, datei)
    anker = ANKER.get((datei, k))
    if anker is None:
        fehler.append(f"Farb-Anker fehlt für {datei}, Schlüssel „{k}“ (Tabelle in 00-stil-und-werkzeuge.md)")
        anker = ""
    return f"PALETTE: {farbe.rstrip('.')}. Color anchors, approximate: {anker}."


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
            elif art.startswith("FIGUR"):
                out.append((name, bau, relativ(motiv), "OBJEKT"))
    return out


def gegenstaende_bauen(text, bausteine):
    out = []
    for name, bau, motiv, art in gegenstands_tabellen(text):
        out += [f"## {name}", ""]
        if bau:
            out += [f"**Hinweis:** {bau}", ""]
        haupt, folge = fassungen(motiv, "figur")
        zeilen = [f"STYLE: {bausteine[art]}", f"SUBJECT: {ohne_anmerkungen(haupt)}.",
                  "NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, "
                  "no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism"]
        out += ["```text", "\n".join(zeilen), "```", ""]
        out += folgebloecke(folge)
    if not out:
        return []
    return ["# Gegenstände", "",
            "Je Sammelbild den Block komplett in Gemini kopieren und Max' Konzeptblatt als Stilvorlage",
            "anhängen, keine Skizze. Umrechnen mit `tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.",
            ""] + out


def relativ(motiv):
    """„about 101 pixels tall“ → „about 53 percent of the boy Max's height“."""
    def ersetze(m):
        n = int(m.group(2))
        if n == MAX_PIXEL:
            return f"{m.group(1)} as tall as the boy Max"
        return f"{m.group(1)} {round(n * 100 / MAX_PIXEL)} percent of the boy Max's height"
    motiv = re.sub(r"\b([Aa]bout) (\d+) pixels tall", ersetze, motiv)

    def laenge(m):
        n = round(int(m.group(2)) * 100 / MAX_PIXEL)
        return f"{m.group(1)} {n} percent as {m.group(3)} as the boy Max is tall"
    return re.sub(r"\b([Aa]bout) (\d+) pixels (wide|long)", laenge, motiv)


FASSUNG = re.compile(r"\s*\b(Second|Third|Fourth) (?:version|variant)[^:]*:\s*")
NAMEN = {"Second": "Zweite Fassung", "Third": "Dritte Fassung", "Fourth": "Vierte Fassung"}


def fassungen(motiv, art="raum"):
    """Motiv ohne „Second version: …“ und die Folge-Blöcke dazu als Masken-Prompts: [(Titel, Prompt)]."""
    teile = FASSUNG.split(motiv)
    haupt, folge = teile[0].strip().rstrip("."), []
    for wort, rest in zip(teile[1::2], teile[2::2]):
        rest = rest.strip().rstrip(".")
        quelle = "vorigen Fassung"
        if rest.startswith("identical to the first"):
            quelle = "ersten Fassung"
        elif rest.startswith("as the second"):
            quelle = "zweiten Fassung"
        rest = re.sub(r"^(?:identical(?: to the first| layout)?|as the second),?\s*(?:but\s+|with\s+)?",
                      "", rest)
        rest = ohne_anmerkungen(rest)
        folge.append((f"{NAMEN[wort]} mit Maske (Bild der {quelle} anhängen oder im selben Chat bleiben)",
                      maske(rest, art)))
    return haupt, folge


def maske(aenderung, art="raum"):
    """Masken-Prompt nach Baustein MASKE: nur die betroffene Stelle ändert sich."""
    gleich = {"raum": "same camera, framing, perspective, composition, colors, light, line weight and style",
              "figur": "same character, pose, proportions, face, colors, line weight and the flat magenta background"}[art]
    return "\n".join([
        "Edit the attached image. Change only the area that this change touches; if your tool can select or "
        "mask an area, mark exactly that area.",
        f"CHANGE: {aenderung[:1].upper() + aenderung[1:]}.",
        f"KEEP: everything outside that area stays pixel-identical: {gleich}. Do not redraw, recolor, move, "
        "crop or add anything else.",
        "NEGATIVE: no new objects, no changed camera or framing, no style change, no text"])


def folgebloecke(folge):
    out = []
    for titel, text in folge:
        out += [f"**{titel}:**", "", "```text", text, "```", ""]
    return out


def fest_fuer(name):
    """Max, Pixel oder Opa, wenn der Name damit beginnt (auch „Max als Ente“, „Opa mit Zündkapsel“)."""
    erstes = re.split(r"[\s,]", name.strip(), maxsplit=1)[0]
    return FEST_NAMEN.get(erstes)


def lock_zeile(wer):
    return (f"CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): {FEST[wer]}")


def motiv_bereinigen(motiv):
    """Platzhalter für Steckbriefe und deutsche Vorsätze vor dem englischen Motiv entfernen."""
    motiv = re.sub(r"\\?\[[^\]]*\\?\]\s*", "", motiv)
    motiv = re.sub(r"^.{0,90}?\bals Referenz:\s*", "", motiv)
    motiv = motiv.replace("as in the Steckbrief", "as in the CHARACTER LOCK")
    motiv = re.sub(r"^Steckbrief (?:Max|Pixel)\s*\([^)]*\),?\s*(?:plus:\s*)?", "", motiv)
    return motiv.strip()


def figur_motive(text):
    """Name → Motiv (nur die erste Fassung) aus der Figuren-Tabelle einer Grafik-Datei."""
    out = {}
    if "| Figur | Baustein | Motiv |" in text:
        for z in tabelle(text, "| Figur | Baustein | Motiv |"):
            if len(z) >= 3 and z[1].startswith("FIGUR"):
                out[z[0]] = ohne_anmerkungen(fassungen(relativ(motiv_bereinigen(z[2])))[0])
    return out


def figur_suchen(name, motive):
    """Passende Zeile der Figuren-Tabelle zu einem Bewegungs- oder Posen-Namen, sonst None."""
    if name in motive:
        return motive[name]
    woerter = [w for w in re.split(r"[\s,()-]+", name.lower()) if len(w) > 3]
    for kandidat, motiv in motive.items():
        k = kandidat.lower()
        if any(w in re.split(r"[\s,()-]+", k) for w in woerter):
            return motiv
    return None


def subjekt_zeilen(name, motive, vorlage="the attached character sheet"):
    """SUBJECT und gegebenenfalls CHARACTER LOCK für Posen und Bewegungen."""
    wer = fest_fuer(name)
    if wer:
        return [f"SUBJECT: {wer if wer != 'Opa' else 'Grandpa Konrad'} exactly as on {vorlage}, unchanged.",
                lock_zeile(wer)]
    motiv = figur_suchen(name, motive)
    zeilen = [f"SUBJECT: the character exactly as on {vorlage}: same face, head size, proportions, costume "
              "and colors, nothing redesigned."]
    if motiv:
        zeilen.append(f"CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): {motiv}.")
    return zeilen


def figuren_bauen(text, bausteine):
    if "| Figur | Baustein | Motiv |" not in text:
        return []
    out = []
    for z in tabelle(text, "| Figur | Baustein | Motiv |"):
        if len(z) < 3 or not z[1].startswith("FIGUR"):
            continue
        name = z[0]
        haupt, folge = fassungen(relativ(motiv_bereinigen(z[2])), "figur")
        wer = fest_fuer(name)
        stil = bausteine["FIGURENBLATT"]
        zeilen = []
        if wer == "Max":
            stil = re.sub(r"Draw only this new character:.*$", "This is the boy Max himself: keep him exactly "
                          "as on the attached sheet.", stil)
        if wer:
            zeilen.append(lock_zeile(wer))
        zeilen = [f"STYLE: {stil}"] + zeilen + [f"SUBJECT: {ohne_anmerkungen(haupt)}.",
                                                f"NEGATIVE: {bausteine['NEG-FIGUR']}"]
        anhang = {"Max": "Max' Figurenbogen (sonst sein Konzeptblatt)",
                  "Pixel": "Pixels Figurenbogen (sonst sein Konzeptblatt) und Max' Blatt als Maßstab",
                  "Opa": "Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab"}.get(wer, "Max' Konzeptblatt als Stil- und Größenvorlage")
        out += [f"## {name}", "", f"**Anhängen:** {anhang}", "", "```text", "\n".join(zeilen), "```", ""]
        out += folgebloecke(folge)
    if not out:
        return []
    return ["# Figuren", "",
            "Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Gebraucht wird nur die",
            "Seitenansicht nach rechts. Läufe entstehen aus einem Meshy-Clip mit Teile-Rig aus diesem Bild, Reden",
            "über Mund und Kopf (`tools/figur.py`), Gesten über Posenbögen. Zweite Fassungen entstehen mit Maske",
            "aus dem fertigen Bild.", ""] + out


def posen_bauen(text, bausteine):
    kopf = "| Bogen | Vorlage | Posen | Wofür | Motiv |"
    if kopf not in text:
        return []
    motive = figur_motive(text)
    out = ["# Posenbögen", "",
           "Je Bogen das angegebene Blatt anhängen (das fertige Konzeptbild der Figur aus Gemini, bei Max sein",
           "Figurenbogen) und den Block kopieren. Einzelne misslungene Posen mit Maske nachbessern, nicht neu",
           "erzeugen. Zwischenbilder baut Claude in Aseprite; Timing und Beine kommen aus dem 3D-Clip.", ""]
    for z in tabelle(text, kopf):
        name, vorlage, posen, wofuer, motiv = z[:5]
        zeilen = [f"STYLE: {bausteine['POSENBOGEN']}"]
        zeilen += subjekt_zeilen(name, motive)
        zeilen += [f"POSES (left to right): {ohne_anmerkungen(motiv)}."] + (
            [BEINE.replace(" frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of "
                           "them.", " poses that use the other leg are never copies.")]
            if GANG.search(motiv) or re.search(r"\bknee raised\b", motiv) else []) + [
                   "END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw "
                   "that pose again, but every pose must be able to return to it with the feet in the same place "
                   "unless a pose says the feet move.",
                   "CAMERA: static, strict side view as on the attached sheet, same scale and the same flat "
                   "baseline in every pose, no zoom, no pan.",
                   f"NEGATIVE: {bausteine['NEG-FIGUR']}, {bausteine['NEG-BEWEGUNG']}"]
        out += [f"## {name}", "", f"**Anhängen:** {vorlage} · **Posen:** {posen} · **Wofür:** {wofuer}", "",
                "```text", "\n".join(zeilen), "```", ""]
    return out


AUSGANG = re.compile(r"^(?:From the (?P<von>.+?) (?:reference )?sprites?(?P<zusatz>,[^:]*)?|(?P<eingabe>[^:]{3,60}"
                     r"(?:sprite|picture|Standbild)[^:]{0,20}as input)):\s*", re.I)
SCHLUSS = re.compile(r"(?:^|\.\s+)(\d+) frames?(?: of \d+x\d+)?(?:,|\.|$)(.*)$", re.S)


GANG = re.compile(r"\b(?:walk(?:s|ing)?|trot(?:s|ting)?|strut(?:s|ting)?|waddles?|crawls?|run|jogging)\b", re.I)


# Gangzyklen (Sebastian, 15. November 2026: Toadi lief mit immer demselben Fuß vorn, Zeldina, Ziegen und
# Hermes stimmten an den Füßen nicht). Darum jedes der acht Bilder einzeln: welches Bein vorn ist, welches
# trägt, wo die Arme sind; das ferne Bein einen Ton dunkler, damit Gemini die Beine nicht verwechselt.
VIERBEINER = re.compile(r"\b(?:goat|cat|tomcat|crocodile|tortoise|four legs|all fours|trot\w*|crawl\w*)\b", re.I)
VIERBEINER_NAMEN = ("Pixel", "Ziege", "Minka", "Hofkater", "Sobek", "Schildkröte")
BEINE = ("LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. "
         "Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can "
         "never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 "
         "to 4 with the sides swapped, they are never copies of them.")
GANG_BILDER = {
    "walk": [
        "contact: near leg forward and straight, only its heel touching the ground, toes up; far leg stretched back, "
        "only its toes touching; far arm swung forward, near arm swung back; body at middle height",
        "down: near foot flat on the ground, near knee bent and carrying the weight, body at its lowest; far foot "
        "lifted just off the ground behind, far knee bent",
        "passing: near leg straight and vertical under the hips; far leg bent, its foot lifted to ankle height and "
        "swinging forward right beside the near leg; both arms close to the body; body high",
        "up: near foot pushing off on its toes behind the body; far leg swinging forward, almost straight, its foot "
        "just above the ground; body at its highest",
        "contact: far leg forward and straight, only its heel touching the ground; near leg stretched back, only its "
        "toes touching; near arm swung forward, far arm swung back; body at middle height",
        "down: far foot flat, far knee bent and carrying the weight, body at its lowest; near foot lifted just off "
        "the ground behind",
        "passing: far leg straight under the hips; near leg bent, its foot lifted to ankle height and swinging "
        "forward beside the far leg; body high",
        "up: far foot pushing off on its toes; near leg swinging forward, foot just above the ground; body at its "
        "highest, leading back into frame 1"],
    "run": [
        "contact: near foot landing in front of the body, near knee slightly bent; far leg trailing behind, knee "
        "bent; far arm forward, near arm back, elbows bent",
        "down: near leg deeply bent under the body carrying the weight, body at its lowest, leaning forward; far "
        "knee driving forward",
        "push-off: near leg stretched straight back, pushing off on its toes; far knee raised high in front",
        "flight: both feet off the ground, legs split wide, far leg reaching forward, near leg trailing; body at "
        "its highest",
        "contact: far foot landing in front of the body; near leg trailing behind; near arm forward, far arm back",
        "down: far leg deeply bent carrying the weight, body at its lowest; near knee driving forward",
        "push-off: far leg stretched straight back on its toes; near knee raised high in front",
        "flight: both feet off the ground, near leg reaching forward, far leg trailing; leads back into frame 1"],
    "quad": [
        "near front leg and far hind leg reaching forward and just touching the ground; near hind leg and far front "
        "leg stretched back on their toes; body level",
        "near front and far hind legs carrying the weight, body at its lowest; near hind and far front paws lifted "
        "just off the ground",
        "near front and far hind legs straight under the body; near hind and far front legs bent and swinging "
        "forward past them; body high",
        "near front and far hind legs pushing off behind; near hind and far front legs reaching forward; body at "
        "its highest",
        "far front leg and near hind leg reaching forward and just touching the ground; far hind leg and near front "
        "leg stretched back on their toes; body level",
        "far front and near hind legs carrying the weight, body at its lowest; the other two paws lifted",
        "far front and near hind legs straight under the body; near front and far hind legs swinging forward past "
        "them; body high",
        "far front and near hind legs pushing off behind; near front and far hind legs reaching forward; leads back "
        "into frame 1"],
    "front": [
        "the viewer's left foot stepping forward, lower in the picture and slightly larger; right foot behind, "
        "heel lifted; right arm forward, left arm back",
        "weight on the left foot, body at its lowest",
        "passing: right foot lifted and swinging forward next to the left leg, body high",
        "right foot reaching forward, body at its highest",
        "the viewer's right foot stepping forward, lower in the picture; left foot behind, heel lifted; left arm "
        "forward, right arm back",
        "weight on the right foot, body at its lowest",
        "passing: left foot lifted and swinging forward next to the right leg, body high",
        "left foot reaching forward, body at its highest, leading back into frame 1"],
}


def gangart(name, handlung):
    if re.search(r"\b(?:front|back) view\b", handlung):
        return "front"
    if any(x in name for x in VIERBEINER_NAMEN) or VIERBEINER.search(handlung):
        return "quad"
    if re.search(r"\b(?:run\w*|jog\w*|rush\w*|sprint\w*)\b", handlung, re.I) and "on the spot" not in handlung:
        return "run"
    return "walk"


SUBJEKTE = ("he", "she", "it", "his", "her", "its", "the", "a", "an", "both", "they")


def nebensatz(teil):
    """Begleitende Beschreibung („beard swaying“, „eyes closed“) statt eigener Bewegungsphase."""
    w = teil.split()
    erstes = w[0].lower()
    verb = (erstes.endswith("s") and not erstes.endswith("ss")) or erstes in SUBJEKTE or w[0][:1].isupper()
    if erstes.endswith("ing"):
        return True
    if verb:
        return False
    return len(w) <= 3 or any(x.endswith("ing") for x in w)


def beats(handlung, anzahl):
    """Handlung in höchstens `anzahl` zusammenhängende Phasen teilen; Beschreibungen hängen an der Phase davor."""
    vorspann = ""
    if ": " in handlung:
        vorspann, handlung = handlung.split(": ", 1)
        vorspann += ": "
    trenner = r";\s*" if ";" in handlung else r",\s*(?:then\s+|and then\s+)?|\s+then\s+"
    roh = [t.strip() for t in re.split(trenner, handlung) if t.strip()]
    teile = []
    for t in roh:
        if teile and not vorspann and nebensatz(t):
            teile[-1] += f", {t}"
        else:
            teile.append(t)
    if teile:
        teile[0] = vorspann + teile[0]
    if len(teile) <= anzahl:
        return teile
    gruppen, start = [], 0
    for i in range(anzahl):
        ende = round((i + 1) * len(teile) / anzahl)
        gruppen.append(", ".join(teile[start:ende]))
        start = ende
    return gruppen


def bewegung_zerlegen(motiv, bilder, ablauf):
    """Motiv einer Animations-Zeile → Felder für das Bewegungsraster."""
    motiv = motiv_bereinigen(motiv)
    saetze = re.split(r"(?<=\.)\s+(?=[A-Z`])", motiv)
    motiv = ohne_anmerkungen(" ".join(x for x in saetze if not DEUTSCH_WORT.search(x)) or motiv)
    motiv = "; ".join(x for x in motiv.split("; ") if not DEUTSCH_WORT.search(x)) or motiv
    motiv = re.sub(r"^`\w+`(?: je einmal mit [^:]*)?:\s*", "", motiv)
    motiv = re.sub(r"^(?:standing |sitting |sleeping )?(?:sprite|picture) of \w+ as input,\s*|^[^,:]{3,60}"
                   r"(?:sprite|Standbild)[^,:]{0,20} as input,\s*", "", motiv)
    start = ""
    m = AUSGANG.match(motiv)
    if m:
        start = m.group(0).rstrip(": ").strip()
        motiv = motiv[m.end():]
    schleife = "Schleife" in ablauf or "loop" in motiv
    blickrichtung, halten, ende = "facing right", [], ""
    m = SCHLUSS.search(motiv)
    if m:
        rest = m.group(2)
        motiv = motiv[:m.start()].strip()
        for teil in [t.strip() for t in rest.split(",") if t.strip()]:
            if teil.startswith(("loops", "plays once")):
                continue
            if teil.startswith(("starts facing", "facing", "both facing", "broom facing", "body facing")):
                blickrichtung = teil
            elif teil.startswith(("ends", "the last frame")):
                ende = teil
            else:
                halten.append(teil)
    else:
        f = re.search(r",?\s*facing (right|left)(?: \(mirrored\))?", motiv)
        if f:
            blickrichtung = f.group(0).strip(", ")
            motiv = (motiv[:f.start()] + motiv[f.end():]).strip()
    try:
        n = int(re.search(r"\d+", bilder).group(0))
    except (AttributeError, ValueError):
        n = 6
    return start, motiv.strip().rstrip("."), n, schleife, blickrichtung, halten, ende


def kamera(blickrichtung):
    gespiegelt = "mirrored" in blickrichtung or "left" in blickrichtung
    richtung = re.sub(r"\s*\(mirrored\)", "", blickrichtung)
    if gespiegelt:
        return (f"CAMERA: static, strict side view; the game shows it {richtung}, so draw the character facing "
                "right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.")
    return (f"CAMERA: static, strict side view, {richtung}. Same scale and the same flat baseline in every pose, "
            "no zoom, no pan.")


ZWEITER_DURCHGANG = (
    "FIX: The attached sheet shows one walking cycle in 8 frames, but frames 5 to 8 are copies of frames 1 to 4 "
    "with the same legs in front. Keep frames 1 to 4 exactly as they are, pixel for pixel. Redraw only frames 5 "
    "to 8: each one is the frame four places earlier with the legs on the two sides swapped. Wherever a near leg "
    "(lighter, in front of the body) was reaching forward in frame 1, the far leg (one shade darker, partly "
    "behind the body) reaches forward in frame 5, and the near leg is the one stretched back; the same for "
    "frames 6, 7 and 8. Arms or front legs swap the same way. Body, head, tail, clothes and props stay exactly as "
    "in frames 1 to 4.\n"
    "CHECK: compare frame 1 and frame 5: the darker leg must be in front in one and behind in the other. If they "
    "look the same, the frame is wrong.\n"
    "SPACING: the same 8 equal columns with clear magenta gaps as in the attached sheet, nothing overlaps the "
    "next frame.\n"
    "NEGATIVE: no new poses for frames 1 to 4, no change of style, size, colors or baseline, no pixel art, no "
    "checkerboard, no text")


def abstand(n):
    """Jedes Bild in einer eigenen Spalte, damit Claude die Bilder sauber schneiden kann (Sebastian,
    15. November 2026: beim Schmied ragten Hammer und Zange ins Nachbarbild)."""
    return (f"SPACING: divide the image into {n} equal columns, one frame per column, with a clear strip of "
            "empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, "
            "tongs, tails, capes and effects, stays completely inside its own column and never reaches into or "
            "overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in "
            "every frame.")


def bewegung_prompt(name, aktion, bilder, ablauf, motiv, motive, bausteine):
    start, handlung, n, schleife, blick, halten, ende = bewegung_zerlegen(motiv, bilder, ablauf)
    dauer = n / BILDER_PRO_SEKUNDE
    if motiv.startswith("EFFEKT") or handlung.startswith("EFFEKT"):
        handlung = re.sub(r"^EFFEKT[^:]*:\s*", "", handlung)
        groesse = re.search(r"\b\d+x\d+\b", motiv)
        zeilen = [f"STYLE: {bausteine['EFFEKT']}",
                  f"EFFECT: {handlung[:1].upper() + handlung[1:]}.",
                  f"FRAMES: {n} frames side by side, about {dauer:.1f} s at {BILDER_PRO_SEKUNDE} frames per "
                  f"second, {'loops seamlessly: the last frame leads back into the first' if schleife else 'plays once'}"
                  + (f", each frame {groesse.group(0)} pixels in the game" if groesse else "") + ".",
                  abstand(n),
                  f"END: {ende}." if ende else ("END: no separate end frame, the loop closes." if schleife
                                                 else "END: the last frame is the calm end state of the effect."),
                  "CAMERA: static, no zoom, no pan, the effect stays centered in every frame.",
                  "NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no "
                  "checkerboard, no motion blur, no speed lines"]
        if "attached background crop" in handlung:
            zeilen.insert(2, "OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw "
                             "only the moving part named above on the magenta background, not the walls, furniture "
                             "or anything else from the crop, so it can be laid exactly over the painted spot.")
            return zeilen, (f"den passenden Ausschnitt aus dem fertigen Hintergrund ({name}); das Ergebnis danach "
                            "mit `tools/pixelieren.py` auf die Farben des Raums bringen")
        return zeilen, "nichts (Effekt)"
    k = 2 if n <= 4 else 3 if n <= 6 else 4
    gruppen = beats(handlung, k)
    gang = schleife and GANG.search(handlung) and "on the spot" not in handlung
    if gang:
        n = 8
        dauer = n / BILDER_PRO_SEKUNDE
        art = gangart(name, handlung)
        gruppen = GANG_BILDER[art]
        zeilen_manier = f"MANNER (applies to every frame): {handlung}."
    else:
        zeilen_manier = ""
    if len(gruppen) == 1:
        g = gruppen[0]
        gruppen = ([f"{g}, at one end of the movement", "the same action at the opposite end of the movement"]
                   if schleife else [f"just starting: {g}", "the same action completed"])
    k = len(gruppen)
    schritt = dauer / k if schleife else (dauer / (k - 1) if k > 1 else dauer)
    action = "; ".join(f"({i + 1}) {i * schritt:.1f} s: {g}" for i, g in enumerate(gruppen))
    zeilen = [f"STYLE: {bausteine['BEWEGUNG']}"]
    zeilen += subjekt_zeilen(name, motive)
    if start:
        start = re.sub(r"^From (?:the )?(.+?) (?:reference |walking |standing )?sprites?\b",
                       r"from the neutral pose on the attached concept sheet of \1", start)
        start = re.sub(r"^(\w+) (.+?) sprite as input$", r"From \2, \1, as on the attached concept sheet", start)
        start = start[:1].upper() + start[1:]
        zeilen.append(f"START: {start}. Keep the clean concept-art style of that sheet, not pixel art.")
    if zeilen_manier:
        zeilen.append(zeilen_manier)
    if gang:
        zeilen.append(f"FRAMES: exactly {n} frames side by side, left to right, one complete cycle of about "
                      f"{dauer:.1f} s at {BILDER_PRO_SEKUNDE} frames per second: " + "; ".join(
                          f"({i + 1}) {g}" for i, g in enumerate(gruppen)) + ".")
        zeilen.append(BEINE)
    else:
        zeilen.append(f"ACTION ({k} key poses of a {n}-frame animation of about {dauer:.1f} s): {action}.")
        zeilen.append(f"FRAMES: draw all {n} frames side by side, left to right, in the order they play: the key "
                      "poses above at their times and evenly spaced in-between frames, so the motion reads "
                      "smoothly; every frame differs visibly from its neighbours, no two frames identical.")
    zeilen.append(abstand(n))
    if gang:
        zeilen.append("END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not "
                      "draw frame 1 twice.")
    elif schleife:
        zeilen.append("END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.")
    else:
        zeilen.append(f"END POSE: pose {k} is the final frame and is held; it must read as a calm, complete pose"
                      + (f" ({ende})" if ende else "") + ".")
    if halten:
        zeilen.append(f"HOLD STILL: {', '.join(halten)}.")
    if re.search(r"\b(?:front|back) view\b", handlung):
        zeilen.append("CAMERA: static, front and back view exactly as described, same scale and the same flat "
                      "baseline in every pose, no zoom, no pan.")
    else:
        zeilen.append(kamera(blick))
    zeilen.append(f"NEGATIVE: {bausteine['NEG-FIGUR']}, {bausteine['NEG-BEWEGUNG']}")
    wer = fest_fuer(name)
    anhang = {"Max": "Max' Figurenbogen (bis dahin sein Konzeptblatt)", "Pixel": "Pixels Figurenbogen (bis dahin sein Konzeptblatt)",
              "Opa": "Opas Figurenbogen (bis dahin das Opa-Sprite)"}.get(wer, f"das fertige Konzeptblatt von {name}")
    return zeilen, anhang


def bewegungen_bauen(text, bausteine, kopf_marke="| Figur | Aktion |"):
    """Animations-Tabellen → Bewegungsraster (Baustein BEWEGUNG oder EFFEKT)."""
    if kopf_marke not in text:
        return []
    motive = figur_motive(text)
    out = ["# Bewegungen", "",
           "Schlüsselposen für Animationen, die im Spiel noch fehlen. Das Blatt anhängen, das beim Block steht.",
           "Die Zeitmarken gelten für etwa 10 Bilder pro Sekunde; Zwischenbilder, Timing und Schleife baut Claude",
           "in Aseprite oder aus dem 3D-Clip. Eine misslungene Pose wird mit Maske nachgebessert.", ""]
    for z in tabelle(text, kopf_marke):
        if len(z) == 6:
            figur, aktion, _raetsel, bilder, ablauf, motiv = z
        elif len(z) == 5:
            figur, aktion, bilder, ablauf, motiv = z
        else:
            continue
        zeilen, anhang = bewegung_prompt(figur, aktion, bilder, ablauf, motiv, motive, bausteine)
        out += [f"## {figur}: {aktion}", "", f"**Anhängen:** {anhang} · **Bilder:** {bilder} · **Ablauf:** {ablauf}",
                "", "```text", "\n".join(zeilen), "```", ""]
        if any(z.startswith("LEGS:") for z in zeilen) and any("frames 5 to 8 repeat" in z for z in zeilen):
            out += ["**Zweiter Durchgang**, wenn die Bilder 5 bis 8 nur Kopien von 1 bis 4 sind (Toadi, Minka, "
                    "15. November 2026): das erzeugte Bild anhängen und nur die hintere Hälfte neu zeichnen lassen.",
                    "", "```text", ZWEITER_DURCHGANG, "```", ""]
    return out


def nahansichten_bauen(text, bausteine, werte, datei):
    kopf = "| Nahansicht | Epoche | Motiv |"
    if kopf not in text:
        return []
    out = ["# Nahansichten und Tafeln", "",
           "Nichts anhängen. Die Schrift setzt Claude danach als Pixelschrift ein.", ""]
    for z in tabelle(text, kopf):
        name, epoche, motiv = z[:3]
        zeilen = [f"STYLE: {bausteine['NAHANSICHT']}", f"SUBJECT: {ohne_anmerkungen(motiv)}.",
                  palette(datei, werte, epoche, name),
                  "NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands "
                  "unless described, no floor, no frame, no photorealism, no watermark"]
        out += [f"## {name}", "", "```text", "\n".join(zeilen), "```", ""]
    return out


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


def raum_prompt(baustein, motiv, pal, skizze, bausteine, karte=False):
    neg = bausteine["NEG-RAUM"]
    if karte:
        neg = neg.replace("no top-down, bird's-eye or fisheye view, ", "no fisheye view, ").replace("no tilted floor, ", "")
    zeilen = [f"STYLE: {baustein}", f"SCENE: {motiv.rstrip('.')}.", pal]
    if skizze:
        zeilen.append(f"LAYOUT: {SKIZZE_SATZ}")
    zeilen.append(f"NEGATIVE: {neg}")
    return "\n".join(zeilen)


def kopf(name, titel, quelle, anleitung):
    out = [f"# Fertige Prompts: {titel}", "",
           f"Erzeugt von `tools/prompts_zusammensetzen.py` aus `{quelle}` (dort ändern, nicht hier).", ""]
    if name in STAND:
        out += [f"**Stand:** {STAND[name]}", ""]
    out += REIHENFOLGE.get(name, [])
    out += anleitung + [""]
    out += ["**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):",
            "erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist",
            "ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein",
            "MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und",
            "Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus",
            "`01-figurenboegen.md` anhängen, sobald er freigegeben ist.", ""]
    return out


def datei_bauen(name, konzept, konzept_aussen, bausteine):
    text = (GRAFIK / f"{name}.md").read_text(encoding="utf-8")
    werte = farb_bausteine(text)
    liste = {} if name in OHNE_SKIZZE else skizzen(text)
    aussen = aussenszenen(text, name, [z[0] for z in tabelle(text, "### Szenen")])
    titel = text.split("\n", 1)[0].lstrip("# ").replace("Grafik: ", "")
    anleitung = ["Räume: je Szene den Block komplett in ChatGPT oder Gemini kopieren und die Layout-Skizze als",
                 "Bild anhängen. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene)."]
    if name in OHNE_SKIZZE:
        anleitung = ["Räume: je Szene den Block komplett in ChatGPT oder Gemini kopieren. Keine Skizze anhängen: Für",
                     "diese Welt gibt es noch keine entworfenen Skizzen, die automatischen Raster widersprechen dem",
                     "Motiv. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene)."]
    out = kopf(name, titel, f"../{name}.md", anleitung)
    out += ["# Räume", ""]
    for z in tabelle(text, "### Szenen"):
        szene, motiv = z[0], z[-1]
        schluessel = z[1] if len(z) == 5 else ""
        if not re.search(r"[a-z]{3} [a-z]{3}", motiv) or motiv.startswith(OHNE_KONZEPTBILD):
            continue
        motiv = re.sub(r"^(HINTERGRUND|Background):\s*", "", motiv)
        pal = palette(name, werte, schluessel, szene)
        out.append(f"## {szene}")
        out.append("")
        if len(z) >= 4 and z[-3] not in ("–", "-", ""):
            out.append(f"**Zustände:** {z[-3]}")
            out.append("")
        sk = skizze_fuer(liste, szene)
        if sk:
            out.append(f"**Layout-Skizze:** [{sk[0]}](../{sk[1]})")
            out.append("")
        baustein = konzept_aussen if szene in aussen else konzept
        motiv, folge = fassungen(motiv)
        karte = motiv.startswith("KARTE:")
        if karte:
            motiv = motiv[6:].strip()
            baustein, motiv, sk = bausteine["KARTE"], motiv[:1].upper() + motiv[1:], None
        out += ["```text", raum_prompt(baustein, motiv, pal, sk, bausteine, karte), "```", ""]
        if "LEFT HALF" in motiv:
            out += ["**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“",
                    "und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen",
                    "macht Claude.", ""]
        out += folgebloecke(folge)
    out += figuren_bauen(text, bausteine)
    out += posen_bauen(text, bausteine)
    out += bewegungen_bauen(text, bausteine)
    out += gegenstaende_bauen(text, bausteine)
    out += nahansichten_bauen(text, bausteine, werte, name)
    return shotliste("\n".join(out), name, text)


def slug(name):
    t = name.lower()
    for a, b in (("ä", "ae"), ("ö", "oe"), ("ü", "ue"), ("ß", "ss")):
        t = t.replace(a, b)
    return [w for w in re.split(r"[^a-z0-9]+", t) if w]


def stand(art, name, datei, quelltext):
    """„im Spiel“, wenn das Bild schon unter game/grafik/ liegt, sonst „offen“; „–“ wo das nicht prüfbar ist."""
    if name in IM_SPIEL.get(datei, ()):
        return "im Spiel"
    if art == "K" or (art == "B" and datei in ("welt-1", "00-weltenuebergreifend")):
        return "offen"
    if datei in NOCH_NICHTS and art != "F":
        return "offen"
    if art == "F":
        w = slug(name)
        ohne = [x for x in w if x not in ("mit", "als", "auf", "im", "in", "dem", "der", "die", "das", "am")]
        kandidaten = {"_".join(w), "_".join(ohne), SPRITE_NAME.get(name, "_".join(w))}
        if len(w) == 2 and "," not in name and w == ohne:
            kandidaten |= {w[0], w[1]}
        return "im Spiel" if any((SPIEL / "figuren" / f"{k}.png").exists() for k in kandidaten) else "offen"
    if art == "R":
        if any(x in name for x in ("Finale", "Geburtstag")):
            return "offen"
        sk = skizze_fuer(skizzen(quelltext), name) if quelltext else None
        if not sk:
            return "offen"
        stamm = Path(sk[1]).stem
        praefix = WELT_PRAEFIX.get(datei, "")
        return "im Spiel" if list((SPIEL / "hintergruende").glob(f"{praefix}_bg_{stamm}_v*.png")) else "offen"
    if art == "N":
        return "im Spiel" if (SPIEL / "nahansichten" / f"{'_'.join(slug(name))}.png").exists() else "offen"
    return "–"


def shotliste(md, datei, quelltext=""):
    """Feste Shot-Nummer unter jede Überschrift setzen und die Shotliste hinter den Kopf stellen."""
    zeilen, zeilen_neu, tabelle_ = md.split("\n"), [], []
    art, zaehler = None, {}
    for z in zeilen:
        zeilen_neu.append(z)
        if z.startswith("# ") and z[2:].strip() in ARTEN:
            art = ARTEN[z[2:].strip()]
            continue
        if z.startswith("## ") and art:
            zaehler[art] = zaehler.get(art, 0) + 1
            nr = f"{KUERZEL[datei]}-{art}{zaehler[art]:02d}"
            name = z[3:].strip()
            zeilen_neu += ["", f"**Shot {nr}**"]
            tabelle_.append(f"| {nr} | {name} | {stand(art, name, datei, quelltext)} |")
    if not tabelle_:
        return md
    i = next(k for k, z in enumerate(zeilen_neu) if z.startswith("# ") and z[2:].strip() in ARTEN)
    offen = sum(1 for t in tabelle_ if t.endswith("| offen |"))
    liste = ["# Shotliste", "",
             f"{len(tabelle_)} Shots, davon {offen} sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:",
             "R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.", "",
             "| Shot | Bild | Stand |", "| --- | --- | --- |"] + tabelle_ + [""]
    return "\n".join(zeilen_neu[:i] + liste + zeilen_neu[i:])


def figurenboegen_bauen(bausteine):
    anhang = {"Max": "`concepts/w0_concept_max.png` und ein Einzelbild aus `game/grafik/figuren/max.png`",
              "Pixel": "`concepts/w0_concept_pixel.png` und ein Einzelbild aus `game/grafik/figuren/pixel.png`",
              "Opa": "ein Einzelbild aus `game/grafik/figuren/opa.png` (das Sprite gilt, nicht ältere Bögen)"}
    titel = {"Max": "Max", "Pixel": "Pixel", "Opa": "Opa Konrad"}
    out = kopf("01-figurenboegen", "Figurenbögen von Max, Pixel und Opa", "../00-stil-und-werkzeuge.md",
               ["Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Ergebnis: oben vier",
                "Ansichten (vorne, links, hinten, rechts), unten sechs Ausdrücke, alles auf Magenta ohne Schrift.",
                "Ist ein Bogen freigegeben, ersetzt er bei allen späteren Prompts dieser Figur die Einzelbilder als",
                "Anhang. Fehler im Bogen nur mit Maske beheben, nicht neu erzeugen, sonst wandert die Figur."])
    out += ["# Figurenbögen", ""]
    for wer in ("Max", "Pixel", "Opa"):
        b = BOGEN[wer]
        neutral = re.search(r"Neutral pose: (.*?)\. Expressions", b).group(1)
        ausdruecke = re.search(r"Expressions: (.*)$", b).group(1).rstrip(".")
        zeilen = [f"STYLE: {bausteine['FIGURENBOGEN']}",
                  lock_zeile(wer),
                  f"NEUTRAL POSE (all four views): {neutral}.",
                  f"EXPRESSIONS (bottom row, left to right): {ausdruecke}.",
                  f"NEGATIVE: {bausteine['NEG-FIGUR']}, no extra characters, no duplicate panels, no extra "
                  "poses, no fifth view, no seventh portrait"]
        out += [f"## {titel[wer]}", "", f"**Anhängen:** {anhang[wer]}", "", "```text", "\n".join(zeilen), "```", ""]
    out += ["# Feste Beschreibungen zum Kopieren", "",
            "Dieselben Blöcke, die die fertigen Prompts als CHARACTER LOCK einsetzen. Für eigene Prompts",
            "wortgleich übernehmen, nichts kürzen.", ""]
    for wer in ("Max", "Pixel", "Opa"):
        out += [f"## FEST {wer}", "", "```text", FEST[wer], "```", ""]
    out += ["# Korrektur mit Maske", "",
            "Für jedes fertige Bild: Bild anhängen (oder im selben Chat bleiben), in ChatGPT die Stelle mit dem",
            "Auswahlwerkzeug markieren, in Gemini die Stelle mit Lage und Gegenstand beschreiben. In die eckigen",
            "Klammern Ort und Änderung einsetzen, je Korrektur ein kurzer Satz.", "",
            "```text", bausteine["MASKE"], "```", "",
            "Beispiel Kleiderbügel im Dachboden:", "",
            "```text", maske("make the wire coat hanger on the wardrobe door about 30 percent larger and dark "
                             "grey, hanging from the slanted top edge of the door"), "```", ""]
    md = "\n".join(out)
    i = md.index("# Feste Beschreibungen")
    return shotliste(md[:i], "01-figurenboegen") + "\n" + md[i:]


def ohne_stand(md):
    """Für --pruefen: Die Spalte „Stand“ hängt an game/grafik/ und darf veralten, ohne dass die Prüfung scheitert."""
    md = re.sub(r"\| (?:im Spiel|offen|–) \|$", "| · |", md, flags=re.M)
    return re.sub(r"^\d+ Shots, davon \d+ sicher offen", "· Shots", md, flags=re.M)


# Arbeitsliste (Sebastian, 14. November 2026): alle offenen Prompts für Prolog, Welt 1 und Welt 2 in einer
# Datei, sortiert nach Figuren, Posen, Gegenständen und Hintergründen. Abgeglichen mit game/grafik/ und
# welt-2-offen.md; wer etwas erledigt, streicht die Nummer hier.
OFFEN_DATEI = "00-offen-prolog-welt-1-welt-2"
OFFEN_LISTE = [
    ("1. Figuren und Varianten", [
        ("Figurenbögen (zuerst, sie sind danach die Anlage für Max, den Kater und Opa)",
         ["FB-K01", "FB-K02", "FB-K03"]),
        ("Dachboden-Szenen nach Welt 1 und Welt 2", ["PF-F08", "PF-F09"]),
        ("Welt 2", ["W2-F23", "W2-F24", "W2-F25"]),
    ]),
    ("2. Posen und Bewegungen", [
        ("Läufe und Gänge, Bild für Bild (zuerst; je zwei Fassungen erzeugen und die bessere nehmen)",
         ["W1-B01", "W1-B14", "W1-B15", "W1-B16", "W1-B42", "WU-B02", "WU-B12", "PF-B12", "W2-B01", "W2-B02",
          "W2-B03", "W2-P08"]),
        ("Als Nächstes: Schmiede und Alwin (Test für flüssigere Animationen)",
         ["W1-B27", "W1-B43", "W1-B44", "W1-B45", "W1-B46", "W1-B47", "W1-B26", "W1-B48", "W1-B05"]),
        ("Reden mit Gesten (statt nur Kopfnicken)", ["W1-B49", "W1-B50", "W1-B51", "W1-B52", "W1-B53", "W1-B54",
                                                     "W1-B55", "W1-B56", "W1-B57", "W1-B58", "W1-B59", "W1-B60",
                                                     "PF-B13"]),
        ("Max und der Kater, in allen Welten", ["WU-B05", "WU-B06", "WU-B07", "WU-B08", "WU-B10", "WU-B22",
                                               "WU-B23", "WU-B24", "WU-B15", "WU-B16", "WU-B17", "WU-B18",
                                               "WU-B19", "WU-B20", "WU-B21", "WU-B25", "WU-B26"]),
        ("Prolog und Dachboden-Szenen", ["PF-B01", "PF-B02", "PF-B03", "PF-B08", "PF-B11"]),
        ("Welt 1", ["W1-B02", "W1-B03", "W1-B04", "W1-B06", "W1-B07", "W1-B08", "W1-B09",
                    "W1-B10", "W1-B11", "W1-B12", "W1-B13", "W1-B17", "W1-B18",
                    "W1-B19", "W1-B20", "W1-B21", "W1-B22", "W1-B23", "W1-B24", "W1-B25", "W1-B28", "W1-B29",
                    "W1-B30", "W1-B31", "W1-B32", "W1-B33", "W1-B34", "W1-B35", "W1-B36", "W1-B37", "W1-B38",
                    "W1-B39", "W1-B40", "W1-B41"]),
        ("Welt 2, Tiere (ohne 3D-Clip, jedes Bild gemalt)", ["W2-B04", "W2-B05", "W2-B06", "W2-B07", "W2-B08",
                                                             "W2-B09", "W2-B10", "W2-P48", "W2-P49"]),
        ("Nachtrag 15. November: je Figur eine Eigenheit im Stand",
         [f"W1-B{i}" for i in range(77, 86)] + [f"WU-B{i}" for i in range(27, 33)] + ["PF-B14", "PF-B15"]
         + ["W2-B32", "W2-B33", "W2-B34"] + [f"W2-P{i}" for i in range(50, 62)]),
        ("Nachtrag 15. November: mehr Leben im Hintergrund", ["W1-B86", "W1-B87", "W1-B88", "W2-B35", "W2-B36"]),
        ("Nachtrag 15. November: Leonidas rennt los (Lauf Bild für Bild, wie die Läufe oben)", ["W2-B37"]),
        ("Welt 2, Reden und Eigenheiten (Arme und Kopf; Beine und Timing aus dem 3D-Clip)",
         ["W2-P28", "W2-P29", "W2-P30", "W2-P31", "W2-P32", "W2-P33", "W2-P34", "W2-P35", "W2-P36", "W2-P37",
          "W2-P38", "W2-P39", "W2-P40", "W2-P41", "W2-P42", "W2-P43", "W2-P44", "W2-P45", "W2-P46", "W2-P47"]),
        ("Lebendige Hintergründe, Welt 1 (Ausschnitt aus dem fertigen Hintergrund anhängen, wo es dabei steht)",
         [f"W1-B{i}" for i in range(61, 77)]),
        ("Lebendige Hintergründe, Welt 2 (Boote, Vögel und Tiere; gehen schon ohne Hintergrund)",
         ["W2-B11", "W2-B12", "W2-B13", "W2-B14", "W2-B15", "W2-B16", "W2-B17", "W2-B18", "W2-B20", "W2-B23",
          "W2-B24", "W2-B27", "W2-B28", "W2-B29"]),
        ("Welt 2 (Posenbögen; die Bewegung selbst kommt aus dem 3D-Clip)",
         ["W2-P01", "W2-P02", "W2-P03", "W2-P04", "W2-P05", "W2-P06", "W2-P07", "W2-P09", "W2-P10",
          "W2-P11", "W2-P12", "W2-P13", "W2-P14", "W2-P15", "W2-P16", "W2-P17", "W2-P18", "W2-P19",
          "W2-P20", "W2-P21", "W2-P22", "W2-P23", "W2-P24", "W2-P25", "W2-P26", "W2-P27"]),
    ]),
    ("3. Gegenstände", [
        ("Prolog und Dachboden-Szenen", ["PF-G02", "PF-G03", "PF-G05", "PF-G06", "PF-G07", "PF-G08", "PF-G09", "PF-G10"]),
        ("Welt 2", ["W2-G03", "W2-G05", "W2-G06", "W2-G07", "W2-G08", "W2-G09", "W2-G10", "W2-G11", "W2-G12"]),
    ]),
    ("4. Hintergründe", [
        ("Welt 2, Ägypten", ["W2-R01", "W2-R04", "W2-R05", "W2-R06"]),
        ("Welt 2, Griechenland", ["W2-R02", "W2-R11", "W2-R10", "W2-R09", "W2-R03", "W2-R07", "W2-R08", "W2-R12"]),
        ("Welt 2, Nahansichten und Tafeln (füllen das ganze Bild wie ein Hintergrund)",
         ["W2-N01", "W2-N02", "W2-N03", "W2-N04", "W2-N05", "W2-N06"]),
        ("Welt 2, lebendige Hintergründe auf gemalten Stellen (erst wenn der Raum fertig ist, Ausschnitt anhängen)",
         ["W2-B19", "W2-B21", "W2-B22", "W2-B25", "W2-B26", "W2-B30", "W2-B31"]),
    ]),
    ("5. Später: erst für Welt 3, Welt 4 und das Finale", [
        ("Figuren", ["PF-F05", "PF-F06", "PF-F07", "PF-F10", "PF-F11", "PF-F12", "PF-F13", "PF-F14", "PF-F15"]),
        ("Posen und Effekte", ["PF-B04", "PF-B05", "PF-B06", "PF-B07", "PF-B09", "PF-B10"]),
        ("Hintergründe", ["PF-R02", "PF-R04", "PF-R06"]),
    ]),
]
OFFEN_HINWEIS = {"W2-F23": "**Nur noch die zweite und dritte Fassung:** die erste ist im Spiel (`aegypter.png`). "
                           "Beide Fassungen im selben Chat aus dem fertigen Bild ableiten."}
OFFEN_QUELLE = {"FB": "01-figurenboegen", "PF": "02-prolog-und-finale", "WU": "00-weltenuebergreifend",
                "W1": "welt-1", "W2": "welt-2"}


def shot_abschnitt(md, shot):
    """Überschrift und Inhalt des Abschnitts mit **Shot <shot>** (ohne die Shot-Zeile)."""
    zeilen = md.split("\n")
    i = zeilen.index(f"**Shot {shot}**")
    k = i
    while not zeilen[k].startswith("## "):
        k -= 1
    ende = i + 1
    while ende < len(zeilen) and not zeilen[ende].startswith(("## ", "# ")):
        ende += 1
    return zeilen[k][3:].strip(), "\n".join(zeilen[k + 1:i] + zeilen[i + 1:ende]).strip()


def vorlage_3d(titel):
    """Block einer 3D-Vorlage aus der handgepflegten welt-2-offen.md."""
    md = (ZIEL / "welt-2-offen.md").read_text(encoding="utf-8")
    m = re.search(r"^### " + re.escape(titel) + r"\n(.*?)(?=^#|\Z)", md, re.S | re.M)
    if not m:
        fehler.append(f"{OFFEN_DATEI}: 3D-Vorlage „{titel}“ fehlt in welt-2-offen.md")
        return ""
    return ("**Anhängen:** das fertige Konzeptblatt der Figur. Nur Vorlage für das 3D-Modell, kommt nicht ins Spiel; "
            "Hintergrund diesmal weiß.\n\n" + m.group(1).strip())


def offen_bauen(gebaut):
    out = ["# Offene Prompts: Prolog, Welt 1 und Welt 2", "",
           "Erzeugt von `tools/prompts_zusammensetzen.py` aus den anderen Dateien in diesem Ordner (dort ändern, nicht hier).", "",
           "**Das ist die Arbeitsliste.** Hier steht alles, was für Prolog, Welt 1 und Welt 2 noch aus Gemini kommen muss, "
           "mit dem kompletten Prompt. Welt 1 hat nur noch Posen offen; ihre Räume, Figuren und Gegenstände sind fertig. "
           "Die übrigen Dateien braucht es nur noch zum Nachbessern fertiger Bilder (dann mit dem Baustein MASKE) "
           "und für Welt 3 und 4. Abgeglichen mit den Bildern in `game/grafik/` am 14. November 2026.", "",
           "**Reihenfolge:** erst Figuren, dann Posen, dann Gegenstände, zuletzt Hintergründe. Innerhalb eines "
           "Abschnitts von oben nach unten. Was beim Anhängen gebraucht wird, steht über jedem Block.", "",
           "**Allgemein:** Hintergrund bei Figuren, Posen und Gegenständen einfarbig Magenta; malt Gemini ein "
           "Schachbrett oder Kästchen, im selben Chat „solid flat magenta background, no checkerboard, no boxes“ "
           "nachschieben. Breite Räume (1280×360): erst die linke Hälfte, dann im selben Chat die rechte. Zweite "
           "Fassungen im selben Chat aus dem fertigen Bild ableiten. Der Kater heißt in den Prompts „the tomcat“, "
           "weil Gemini den Namen „Pixel“ als Google-Marke blockt.", "",
           "# Übersicht", ""]
    teile = []
    for abschnitt, gruppen in OFFEN_LISTE:
        out.append(f"**{abschnitt}**")
        out.append("")
        teile += [f"# {abschnitt}", ""]
        for gruppe, shots in gruppen:
            namen = []
            teile += [f"## {gruppe}", ""]
            for shot in shots:
                if shot.startswith("3D:"):
                    titel, inhalt, nummer = shot[3:], vorlage_3d(shot[3:]), "W2-3D"
                else:
                    try:
                        titel, inhalt = shot_abschnitt(gebaut[OFFEN_QUELLE[shot[:2]]], shot)
                    except ValueError:
                        fehler.append(f"{OFFEN_DATEI}: Shot {shot} nicht gefunden")
                        continue
                    nummer = shot
                if nummer in OFFEN_HINWEIS:
                    inhalt = OFFEN_HINWEIS[nummer] + "\n\n" + inhalt
                namen.append(f"{nummer} {titel}")
                teile += [f"### {nummer}: {titel}", "", inhalt, ""]
            out.append(f"- {gruppe}: " + "; ".join(namen))
        out.append("")
    return "\n".join(out + teile).rstrip() + "\n"


# Gemini blockt Prompts mit dem Namen „Pixel“ („third-party content providers“, liest sich wie die
# Google-Marke). Im Bildtext heißt der Kater deshalb „the tomcat“; Nummern und deutsche Hinweise
# außerhalb der Prompt-Blöcke bleiben, wie sie sind.
KATER = [
    (r"\bPixel-as-", "tomcat-as-"),
    (r"\bPixel's\b", "the tomcat's"),
    (r"\b(the|a|sleeping|standing|sitting) Pixel\b", r"\1 tomcat"),
    (r"(^|[.!?] )Pixel\b", r"\1The tomcat"),
    (r"\bPixel\b", "the tomcat"),
    (r"\b([Tt])he tomcat, a chubby round tomcat\b", r"\1he tomcat, a chubby round cat"),
]


def ohne_marke(text):
    """Ersetzt „Pixel“ in allen ```-Prompt-Blöcken durch „the tomcat“."""
    def block(m):
        inhalt = m.group(2)
        for muster, ersatz in KATER:
            inhalt = re.sub(muster, ersatz, inhalt, flags=re.M)
        return m.group(1) + inhalt + m.group(3)
    return re.sub(r"(^```[^\n]*\n)(.*?)(^```)", block, text, flags=re.S | re.M)


def main():
    pruefen = "--pruefen" in sys.argv
    stil = (GRAFIK / "00-stil-und-werkzeuge.md").read_text(encoding="utf-8")
    konzept = textblock_nach(stil, "**KONZEPT**")
    konzept_aussen = textblock_nach(stil, "**KONZEPT-AUSSEN**")
    bausteine = {"GEGENSTÄNDE": textblock_nach(stil, "**GEGENSTÄNDE**"),
                 "EFFEKT": textblock_nach(stil, "**EFFEKT**"),
                 "FIGURENBLATT": textblock_nach(stil, "**FIGURENBLATT**"),
                 "POSENBOGEN": textblock_nach(stil, "**POSENBOGEN**"),
                 "OBJEKT": textblock_nach(stil, "**OBJEKT**"),
                 "NAHANSICHT": textblock_nach(stil, "**NAHANSICHT**"),
                 "KARTE": textblock_nach(stil, "**KARTE**"),
                 "FIGURENBOGEN": textblock_nach(stil, "**FIGURENBOGEN**"),
                 "MASKE": textblock_nach(stil, "**MASKE**"),
                 "BEWEGUNG": textblock_nach(stil, "**BEWEGUNG**"),
                 "NEG-RAUM": textblock_nach(stil, "**NEGATIV-RAUM**"),
                 "NEG-FIGUR": textblock_nach(stil, "**NEGATIV-FIGUR**"),
                 "NEG-BEWEGUNG": textblock_nach(stil, "**NEGATIV-BEWEGUNG**")}
    FEST.update({n: textblock_nach(stil, f"**FEST {n}**") for n in FEST_NAMEN.values()})
    BOGEN.update({n: re.search(rf"\*\*BOGEN {n}:\*\* (.*)", stil).group(1).strip() for n in FEST_NAMEN.values()})
    ANKER.update(farb_anker(stil))
    veraltet = []
    ZIEL.mkdir(exist_ok=True)
    gebaut = {name: datei_bauen(name, konzept, konzept_aussen, bausteine) for name in DATEIEN}
    wu = kopf("00-weltenuebergreifend", "Weltenübergreifende Gegenstände und Bewegungen von Max und Pixel",
              "../00-stil-und-werkzeuge.md",
              ["Gegenstände und Grundbewegungen, die in allen Welten gelten. Laut `../../offene-punkte.md` fehlen",
               "im Spiel noch: Max bücken, zeigen, Achselzucken, gähnen, Kopf kratzen; Pixel putzen, ducken,",
               "springen, fauchen, aufgeschreckt. Gehen, Stehen und Reden sind schon im Spiel."])
    wu += bewegungen_bauen(stil, bausteine) + gegenstaende_bauen(stil, bausteine)
    gebaut["00-weltenuebergreifend"] = shotliste("\n".join(wu), "00-weltenuebergreifend")
    gebaut["01-figurenboegen"] = figurenboegen_bauen(bausteine)
    gebaut["vertical-slice"] = slice_bauen(gebaut["welt-1"])
    gebaut[OFFEN_DATEI] = offen_bauen(gebaut)
    if fehler:
        for f in fehler:
            print("FEHLER  " + f)
        sys.exit(1)
    for name, neu in gebaut.items():
        neu = ohne_marke(neu)
        pfad = ZIEL / f"{name}.md"
        alt = pfad.read_text(encoding="utf-8") if pfad.exists() else ""
        if (ohne_stand(neu) if pruefen else neu) != (ohne_stand(alt) if pruefen else alt):
            veraltet.append(pfad.name)
            if not pruefen:
                pfad.write_text(neu, encoding="utf-8")
    if pruefen and veraltet:
        print("Veraltet (python3 tools/prompts_zusammensetzen.py):", ", ".join(veraltet))
        sys.exit(1)
    print(f"{len(gebaut)} Dateien" + (" geprüft" if pruefen else f" → {ZIEL}"))


if __name__ == "__main__":
    main()
