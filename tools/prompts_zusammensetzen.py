#!/usr/bin/env python3
"""Fertige Konzeptbild-Prompts pro Raum, zum direkten Kopieren in ChatGPT oder Gemini.

Setzt für jede Szene aus den Grafik-Dateien (Tabelle „### Szenen“) zusammen:
Baustein KONZEPT (docs/grafik/00-stil-und-werkzeuge.md) + Motiv + passender Farb-Baustein der
Welt + Satz zur Layout-Skizze. Ergebnis: docs/grafik/fertige-prompts/<datei>.md.
Die Quelle bleiben die Grafik-Dateien; nach Änderungen dort dieses Werkzeug neu laufen lassen.

Kein Raten: Passt der Schlüssel einer Szene (Epoche, Ebene, Sender) zu keinem Farb-Baustein,
bricht das Werkzeug mit einer Meldung ab. Zeilen ohne eigenes Konzeptbild werden ausgelassen:
Motive, die mit „Keine eigene Grafik“, „Wiederverwendung“ oder einem Figuren-Baustein
(„FIGUR-…“) beginnen.

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
OHNE_KONZEPTBILD = ("Keine eigene Grafik", "Wiederverwendung", "FIGUR-")
fehler = []


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
        return werte
    werte = {}
    for z in tabelle(text, "**Farb-Bausteine"):
        werte[z[0]] = z[1]
    return werte


def farbe_fuer(werte, schluessel, szene, datei):
    if "düster" in werte and any(w.lower() in szene.lower() for w in DUESTER):
        return werte["düster"]
    if schluessel in werte:
        return werte[schluessel]
    for k, v in werte.items():
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


def skizze_fuer(liste, szene):
    for name, pfad in liste.items():
        n, s = name.lower(), szene.lower()
        if s == n or s.startswith(n) or n.startswith(s):
            return name, pfad
    return None


def datei_bauen(name, konzept):
    text = (GRAFIK / f"{name}.md").read_text(encoding="utf-8")
    werte = farb_bausteine(text)
    liste = skizzen(text)
    titel = text.split("\n", 1)[0].lstrip("# ").replace("Grafik: ", "")
    out = [f"# Fertige Konzeptbild-Prompts: {titel}", "",
           f"Erzeugt von `tools/prompts_zusammensetzen.py` aus `../{name}.md` (dort ändern, nicht hier).",
           "Je Szene den Block komplett in ChatGPT oder Gemini kopieren und die Layout-Skizze als Bild",
           "anhängen. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene).",
           ""]
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
        out += ["```text", f"{konzept} {motiv.rstrip('.')}. {farbe}.{satz}", "```", ""]
    return "\n".join(out)


def main():
    pruefen = "--pruefen" in sys.argv
    konzept = textblock_nach((GRAFIK / "00-stil-und-werkzeuge.md").read_text(encoding="utf-8"), "**KONZEPT**")
    veraltet = []
    ZIEL.mkdir(exist_ok=True)
    gebaut = {name: datei_bauen(name, konzept) for name in DATEIEN}
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
    print(f"{len(DATEIEN)} Dateien" + (" geprüft" if pruefen else f" → {ZIEL}"))


if __name__ == "__main__":
    main()
