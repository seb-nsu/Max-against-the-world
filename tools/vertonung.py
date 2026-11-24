#!/usr/bin/env python3
"""Vertonung: Stimmen, Sprechanweisungen und Geräusche automatisch erzeugen.

Ablauf (Einzelheiten in docs/04-audio.md, Abschnitt „Vertonung mit dem Werkzeug“):

  1. Stimmen vorschlagen   je Figur drei Vorschläge aus dem Voice-Design-Prompt in 04-audio.md
  2. Hörseite              arbeit/vertonung/hoerseite.html im Browser öffnen, je Figur wählen,
                           „Auswahl speichern“ lädt auswahl.json herunter
  3. Übernehmen            speichert die gewählte Stimme in docs/audio/stimmen.yaml
  4. Erzeugen              alle Zeilen eines Abschnitts mit Stimme und Sprechanweisung
                           (docs/audio/betonung/<Abschnitt>.csv), mehrere Versuche je Pointe
  5. Hörseite, Übernehmen  wie oben; die gewählte Fassung kommt nach
                           game/audio/stimmen/de/<ID>.ogg, der Text dazu nach docs/audio/vertont.csv
  6. Geräusche             fehlende Geräusche aus den Prompts in 04-audio.md, gleicher Ablauf

Nebenfiguren, die laut 04-audio.md eine „Variante von …“ sind, sprechen mit der Stimme der
Hauptfigur; Tonhöhe, Tempo und Filter setzt ffmpeg danach (tiefer, schneller, Hall, Funk …).
Alles, was Geld kostet, läuft erst mit --los und bricht über --grenze (Dollar) ab.

Aufruf:
  python3 tools/vertonung.py                         Stand und Prüfung (wie in der CI)
  python3 tools/vertonung.py figuren                 Zuordnung Sprecher → Stimme, Filter, Zeilen
  python3 tools/vertonung.py vorschlagen [--figur Max] [--anbieter elevenlabs] [--los]
  python3 tools/vertonung.py erzeugen --abschnitt P0 [--figur Max] [--versuche 1]
                                      [--anbieter elevenlabs] [--grenze 10] [--los]
  python3 tools/vertonung.py geraeusche [--kennung amboss] [--varianten 3] [--los]
  python3 tools/vertonung.py hoerseite               Hörseite neu schreiben
  python3 tools/vertonung.py uebernehmen [auswahl.json]   ohne Pfad: neueste aus Downloads
  python3 tools/vertonung.py waehlen Max --id <Stimmen-ID> [--anbieter fish]   von Hand

Anbieter: elevenlabs (ELEVENLABS_API_KEY), fish (FISH_API_KEY), gemini (GEMINI_API_KEY) und
test (erzeugt einen Ton ohne Kosten, um den Ablauf zu prüfen). Braucht ffmpeg im PATH.
"""
from __future__ import annotations

import argparse
import base64
import csv
import hashlib
import html
import io
import json
import os
import re
import shutil
import subprocess
import sys
import time
import urllib.error
import urllib.request
import wave
from dataclasses import dataclass, field
from datetime import date
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
DOKU = ROOT / "docs" / "04-audio.md"
AUDIO_DOCS = ROOT / "docs" / "audio"
STIMMEN_YAML = AUDIO_DOCS / "stimmen.yaml"
BETONUNG = AUDIO_DOCS / "betonung"
VERTONT = AUDIO_DOCS / "vertont.csv"
ZEILEN = ROOT / "export" / "audio-zeilen.csv"
GAME_AUDIO = ROOT / "game" / "audio"
ARBEIT = ROOT / "arbeit" / "vertonung"
SPRACHE = "de"

# Abschnitt in 04-audio.md (Nebenstimmen) → Kürzel der Zeilen-IDs
ABSCHNITT = {"prolog": ("P0", "SYS"), "welt-1": ("W1",), "welt-2": ("W2",), "welt-3": ("W3",),
             "welt-4": ("W4",), "finale": ("FI", "ZS1", "ZS2", "ZS3")}

# Grobe Listenpreise in Dollar je 1 Mio. Zeichen (Stand 24.11.2026, vor dem Kauf prüfen).
# Gemini rechnet in Tokens: etwa 14 Zeichen je Sekunde, 25 Audio-Tokens je Sekunde, 9 $ je Mio.
PREIS_JE_MIO = {"elevenlabs": 80.0, "fish": 15.0, "gemini": 17.0, "test": 0.0}
PREIS_STIMMENTWURF = {"elevenlabs": 0.05, "fish": 0.0, "gemini": 0.01, "test": 0.0}
PREIS_GERAEUSCH = 0.10   # ElevenLabs, je Variante, grob

# ---------------------------------------------------------------------------------------------
# Beschreibungen aus der Spalte „Lösung“ (Nebenstimmen) → ffmpeg-Filter oder Sprechanweisung

FILTER_WORTE = {
    "tiefer": ("tonhoehe", 0.90), "höher": ("tonhoehe", 1.10), "etwas tiefer": ("tonhoehe", 0.95),
    "etwas höher": ("tonhoehe", 1.05), "langsamer": ("tempo", 0.90), "schneller": ("tempo", 1.12),
    "noch schneller": ("tempo", 1.25), "heller": ("tonhoehe", 1.06),
    "jünger": ("tonhoehe", 1.06),
}
FILTER_STICHWORTE = {   # Teilwort → Effekt
    "funk": "funk", "radio": "funk", "telefon": "funk", "hall": "hall", "schacht": "schacht",
    "glas": "hall", "blechern": "blech", "metallic": "blech", "elektronik": "blech",
    "trichter": "trichter", "rauschen": "rauschen",
}
TON_WORTE = {   # deutsche Beschreibung → englische Sprechanweisung
    "schläfrig": "sleepy", "flüsternd": "whispering", "schluchzend": "sobbing",
    "monoton": "monotone", "gelangweilt": "bored", "aufgeregt": "excited",
    "paranoid": "paranoid", "vornehm": "posh", "energischer": "energetic",
    "feierlich": "solemn", "königlich": "regal", "freundlicher": "friendly", "ruhiger": "calm",
    "leiser": "quiet", "knapp": "curt", "im verkaufston": "salesy", "eitel": "vain",
    "als tratsch": "gossipy", "grimmiger": "grim", "ohne zischen": "", "frecher": "cheeky",
    "fröhlicher": "cheerful", "lauter": "loud", "weniger zittrig": "steady",
    "ohne schnupfen": "clear-voiced", "lachkonserve": "", "ansagestimme": "announcer",
    "kühler": "cold", "hoch und ängstlich": "",
}
# Regie im Skript → Sprechanweisung, wenn die Betonungs-Datei für die Zeile nichts sagt
REGIE_TON = {
    "flüstert": "whispering", "ruft": "shouting", "schreit": "shouting", "brüllt": "shouting",
    "seufzt": "sighs", "lacht": "laughing", "kichert": "giggles", "gähnt": "yawning",
    "murmelt": "mumbling", "stottert": "stammering", "schluchzt": "sobbing",
    "weint": "crying", "singt": "sing-song", "triumph": "triumphant", "genervt": "annoyed",
    "flehend": "pleading", "erschrocken": "startled", "panisch": "panicked",
    "aus dem off": "narrating, close to the microphone", "gedämpft": "muffled, from far away",
}


@dataclass
class Figur:
    name: str
    kuerzel: str
    art: str                       # stimme, variante, laut, stumm, brabbel
    prompt: str = ""
    eltern: str = ""               # bei Varianten: Name der Hauptfigur
    abschnitt: str = ""            # bei Nebenstimmen: prolog, welt-1 …
    loesung: str = ""
    filter: list = field(default_factory=list)      # [(effekt, wert), …]
    ton: list = field(default_factory=list)         # englische Sprechanweisungen
    unbekannt: list = field(default_factory=list)   # Beschreibungen ohne Zuordnung


# ---------------------------------------------------------------------------------------------
# Lesen

def md_tabellen(pfad: Path) -> list[tuple[list[str], list[list[str]]]]:
    """Alle Markdown-Tabellen: [(Kopf, Zeilen), …]"""
    out, kopf, zeilen = [], None, []
    for z in pfad.read_text(encoding="utf-8").splitlines() + [""]:
        if not z.startswith("|"):
            if kopf:
                out.append((kopf, zeilen))
            kopf, zeilen = None, []
            continue
        zellen = [c.strip() for c in z.strip().strip("|").split("|")]
        if kopf is None:
            kopf = zellen
        elif not set("".join(zellen)) <= set("-: "):
            zellen = [c.replace("\\_", "_").strip("`") for c in zellen]
            zeilen.append(zellen)
    return out


def ohne_klammer(name: str) -> str:
    return re.sub(r"\s*\(.*\)\s*$", "", name).strip()


def beschreibung_zerlegen(fig: Figur, text: str):
    """„tiefer und langsamer, mit Hall“ → Filter, Sprechanweisungen, Rest"""
    for teil in re.split(r",| und |;", text):
        t = teil.strip().lower().removeprefix("mit ").strip()
        if not t:
            continue
        if t in FILTER_WORTE:
            fig.filter.append(FILTER_WORTE[t])
        elif t in TON_WORTE:
            if TON_WORTE[t]:
                fig.ton.append(TON_WORTE[t])
        elif any(s in t for s in FILTER_STICHWORTE):
            fig.filter += [(e, 1.0) for s, e in FILTER_STICHWORTE.items() if s in t][:1]
        else:
            fig.unbekannt.append(teil.strip())


def figuren_lesen() -> tuple[dict, dict, list[str]]:
    """({Name: Figur} Hauptstimmen, {(Name, Abschnitt): Figur} Nebenstimmen, Fehler)"""
    haupt, neben, fehler = {}, {}, []
    for kopf, zeilen in md_tabellen(DOKU):
        if kopf[:3] == ["Figur", "Kürzel", "Prompt"]:
            for name, kz, prompt in (z[:3] for z in zeilen):
                f = Figur(ohne_klammer(name), kz, "stimme", prompt=prompt)
                if prompt.lower().startswith("no words"):
                    f.art = "laut"
                low = prompt.lower()
                if "funk-filter" in low:
                    f.filter.append(("funk", 1.0))
                if "metallic echo" in low:
                    f.filter.append(("blech", 1.0))
                if "glitch" in low:
                    f.unbekannt.append("glitchy stutter (von Hand in Audacity)")
                haupt[f.name] = f
        elif kopf[:4] == ["Kürzel", "Figur", "Abschnitt", "Lösung"]:
            for kz, name, ab, loesung in (z[:4] for z in zeilen):
                f = Figur(name, kz, "variante", abschnitt=ab, loesung=loesung)
                low = loesung.lower()
                m = re.match(r"variante von (.+?) \(", loesung, re.I)
                if "stumm" in low:
                    f.art = "stumm"
                elif low.startswith("brabbel"):
                    f.art = "brabbel"
                elif low.startswith("laute") or low.startswith("keine stimme"):
                    f.art = "laut"
                elif m:
                    f.eltern = m.group(1).strip()
                    rest = loesung[loesung.find(")", m.end()) + 1:].strip(" ,")
                    beschreibung_zerlegen(f, rest)
                else:
                    fehler.append(f"04-audio.md Nebenstimmen: {kz} {name}: Lösung nicht lesbar")
                neben[(name, ab)] = f
    for f in neben.values():
        if f.art == "variante" and f.eltern not in haupt:
            fehler.append(f"04-audio.md Nebenstimmen: {f.name} ist Variante von „{f.eltern}“, "
                          "die es in der Stimmen-Tabelle nicht gibt")
    if not haupt:
        fehler.append("04-audio.md: Stimmen-Tabelle (Figur | Kürzel | Prompt) nicht gefunden")
    return haupt, neben, fehler


def zeilen_lesen() -> list[dict]:
    if not ZEILEN.exists():
        subprocess.run([sys.executable, str(ROOT / "tools" / "skript_export.py")], cwd=ROOT,
                       stdout=subprocess.DEVNULL, check=False)
    with ZEILEN.open(encoding="utf-8") as f:
        zeilen = list(csv.DictReader(f))
    for z in zeilen:
        z["ID"] = Path(z["Datei"]).stem
        z["Basis"] = re.sub(r"_\d+$", "", z["ID"]) if re.search(r"_\d{4}_\d+$", z["ID"]) else z["ID"]
    return zeilen


def abschnitt_name(code: str) -> str:
    for name, codes in ABSCHNITT.items():
        if code in codes:
            return name
    return ""


def figur_fuer(z: dict, haupt: dict, neben: dict) -> Figur | None:
    ab = abschnitt_name(z["Abschnitt"])
    if (z["Sprecher"], ab) in neben:
        return neben[(z["Sprecher"], ab)]
    return haupt.get(z["Sprecher"])


def stimmen_lesen() -> dict:
    if STIMMEN_YAML.exists():
        daten = yaml.safe_load(STIMMEN_YAML.read_text(encoding="utf-8")) or {}
    else:
        daten = {}
    daten.setdefault("anbieter", "elevenlabs")
    daten.setdefault("modelle", {})
    daten.setdefault("stimmen", {})
    daten.setdefault("eigene_stimme", [])
    daten.setdefault("abschnitt_filter", {})
    for k in ("stimmen", "abschnitt_filter"):
        daten[k] = daten[k] or {}
    return daten


def stimmen_schreiben(daten: dict):
    """Schreibt nur den Block „stimmen“ neu und lässt Kommentare und den Rest stehen."""
    text = STIMMEN_YAML.read_text(encoding="utf-8")
    block = yaml.safe_dump({"stimmen": daten["stimmen"]}, allow_unicode=True, sort_keys=True,
                           default_flow_style=False)
    neu = re.sub(r"^stimmen:.*?(?=^\S|\Z)", block, text, count=1, flags=re.S | re.M)
    STIMMEN_YAML.write_text(neu, encoding="utf-8")


def betonung_lesen() -> tuple[dict, list[str]]:
    """{ID oder Datei-Stamm: (Anweisung, Versuche)}"""
    out, fehler = {}, []
    if not BETONUNG.is_dir():
        return out, fehler
    for pfad in sorted(BETONUNG.glob("*.csv")):
        with pfad.open(encoding="utf-8") as f:
            for i, z in enumerate(csv.DictReader(f), start=2):
                id_ = (z.get("ID") or "").strip()
                if not id_:
                    continue
                v = (z.get("Versuche") or "").strip()
                if v and not v.isdigit():
                    fehler.append(f"{pfad.relative_to(ROOT)}:{i}: Versuche „{v}“ ist keine Zahl")
                    v = ""
                if id_ in out:
                    fehler.append(f"{pfad.relative_to(ROOT)}:{i}: {id_} steht doppelt")
                out[id_] = ((z.get("Betonung") or "").strip(), int(v) if v else 0)
    return out, fehler


def vertont_lesen() -> dict:
    if not VERTONT.exists():
        return {}
    with VERTONT.open(encoding="utf-8") as f:
        return {z["ID"]: z for z in csv.DictReader(f)}


def vertont_schreiben(daten: dict):
    AUDIO_DOCS.mkdir(parents=True, exist_ok=True)
    with VERTONT.open("w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, ["ID", "Textprüfsumme", "Anbieter", "Stimme", "Betonung", "Datum"],
                           lineterminator="\n")
        w.writeheader()
        for id_ in sorted(daten):
            w.writerow(daten[id_])


def pruefsumme(text: str) -> str:
    return hashlib.sha1(text.strip().encode("utf-8")).hexdigest()[:12]


# ---------------------------------------------------------------------------------------------
# Auflösen: welche Stimme, welche Anweisung, welche Filter für eine Zeile

def stimm_figur(fig: Figur, daten: dict, haupt: dict) -> Figur:
    """Die Figur, deren gespeicherte Stimme spricht (bei Varianten die Hauptfigur)."""
    if fig.art == "variante" and fig.name not in daten["eigene_stimme"]:
        return haupt[fig.eltern]
    return fig


def anweisung(z: dict, fig: Figur, betonung: dict) -> str:
    teile = list(fig.ton)
    eigen = betonung.get(z["ID"]) or betonung.get(z["Basis"])
    if eigen and eigen[0]:
        teile.append(eigen[0])
    elif not eigen:
        regie = z.get("Regie", "").lower()
        teile += [t for w, t in REGIE_TON.items() if w in regie]
    return ", ".join(dict.fromkeys(t for t in teile if t))


def versuche_fuer(z: dict, betonung: dict, standard: int) -> int:
    eigen = betonung.get(z["ID"]) or betonung.get(z["Basis"])
    return eigen[1] if eigen and eigen[1] else standard


def filter_fuer(z: dict, fig: Figur, daten: dict) -> list:
    extra = (daten["abschnitt_filter"].get(fig.name) or {}).get(z["Abschnitt"]) or []
    return list(fig.filter) + [(e, 1.0) for e in extra]


def ffmpeg_filter(filter_: list) -> str:
    teile, tempo = [], 1.0
    for effekt, wert in filter_:
        if effekt == "tonhoehe":
            teile.append(f"asetrate=44100*{wert},aresample=44100")
            tempo /= wert          # Tonhöhe ändern, Tempo halten
        elif effekt == "tempo":
            tempo *= wert
        elif effekt == "funk":
            teile.append("highpass=f=350,lowpass=f=3200,acrusher=bits=12:mix=0.3")
        elif effekt == "hall":
            teile.append("aecho=0.8:0.6:45|70:0.35|0.2")
        elif effekt == "schacht":
            teile.append("aecho=0.8:0.7:120|240:0.45|0.3")
        elif effekt == "blech":
            teile.append("highpass=f=250,aecho=0.8:0.8:9:0.55")
        elif effekt == "trichter":
            teile.append("highpass=f=500,lowpass=f=2800,aecho=0.8:0.6:14:0.4")
        elif effekt == "rauschen":
            teile.append("highpass=f=300,lowpass=f=3500")
    if abs(tempo - 1.0) > 0.01:
        teile.append(f"atempo={tempo:.3f}")
    # Stille am Anfang und Ende weg, Lautheit angleichen
    teile += ["silenceremove=start_periods=1:start_threshold=-50dB",
              "areverse", "silenceremove=start_periods=1:start_threshold=-50dB", "areverse",
              "loudnorm=I=-18:TP=-1.5:LRA=11"]
    return ",".join(teile)


# ---------------------------------------------------------------------------------------------
# Anbieter

class Anbieter:
    name = ""
    schluessel_env = ""

    def __init__(self, daten: dict):
        self.modelle = daten["modelle"]
        self.schluessel = os.environ.get(self.schluessel_env, "") if self.schluessel_env else ""

    def bereit(self):
        if self.schluessel_env and not self.schluessel:
            raise SystemExit(f"{self.schluessel_env} fehlt (Umgebungsvariable mit dem API-Schlüssel)")

    def anfrage(self, url, daten=None, kopf=None, roh=False):
        kopf = dict(kopf or {})
        body = None
        if daten is not None:
            body = json.dumps(daten).encode("utf-8")
            kopf.setdefault("Content-Type", "application/json")
        for versuch in range(4):
            try:
                with urllib.request.urlopen(urllib.request.Request(url, body, kopf), timeout=180) as r:
                    inhalt = r.read()
                    return inhalt if roh else json.loads(inhalt)
            except urllib.error.HTTPError as e:
                text = e.read().decode("utf-8", "replace")[:500]
                if e.code in (429, 500, 502, 503) and versuch < 3:
                    time.sleep(5 * (versuch + 1))
                    continue
                raise SystemExit(f"{self.name}: HTTP {e.code}: {text}")
            except urllib.error.URLError as e:
                if versuch < 3:
                    time.sleep(5 * (versuch + 1))
                    continue
                raise SystemExit(f"{self.name}: keine Verbindung: {e}")

    # zu überschreiben
    def text_mit_anweisung(self, text, anweisung, fig: Figur) -> str:
        """Was an den Anbieter geht (für info.json und die Hörseite)."""
        return f"[{anweisung}] {text}" if anweisung else text

    def sprechen(self, stimme: str, text: str, anweisung: str, fig: Figur) -> tuple[bytes, str]:
        raise NotImplementedError

    def entwuerfe(self, fig: Figur, probe: str) -> list[tuple[bytes, str, str]]:
        """[(Audio, Endung, Entwurfs-ID), …]"""
        raise SystemExit(f"{self.name}: Stimmen bitte auf der Website anlegen und mit "
                         f"„waehlen {fig.name} --id …“ eintragen")

    def entwurf_speichern(self, fig: Figur, entwurf_id: str) -> str:
        return entwurf_id


class ElevenLabs(Anbieter):
    name, schluessel_env = "elevenlabs", "ELEVENLABS_API_KEY"
    basis = "https://api.elevenlabs.io/v1"

    def kopf(self):
        return {"xi-api-key": self.schluessel}

    def text_mit_anweisung(self, text, anweisung, fig):
        tags = " ".join(f"[{t.strip()}]" for t in anweisung.split(",") if t.strip())
        return f"{tags} {text}".strip()

    def sprechen(self, stimme, text, anweisung, fig):
        modell = self.modelle.get("elevenlabs", "eleven_v3")
        audio = self.anfrage(f"{self.basis}/text-to-speech/{stimme}?output_format=mp3_44100_128",
                             {"text": self.text_mit_anweisung(text, anweisung, fig),
                              "model_id": modell, "language_code": SPRACHE},
                             self.kopf(), roh=True)
        return audio, "mp3"

    def entwuerfe(self, fig, probe):
        modell = self.modelle.get("elevenlabs_entwurf", "eleven_ttv_v3")
        antwort = self.anfrage(f"{self.basis}/text-to-voice/design",
                               {"voice_description": f"{fig.prompt}. Speaks German.",
                                "model_id": modell, "text": probe},
                               self.kopf())
        return [(base64.b64decode(p["audio_base_64"]), "mp3", p["generated_voice_id"])
                for p in antwort.get("previews", [])]

    def entwurf_speichern(self, fig, entwurf_id):
        antwort = self.anfrage(f"{self.basis}/text-to-voice",
                               {"voice_name": f"Couch Quest {fig.name}",
                                "voice_description": fig.prompt[:1000],
                                "generated_voice_id": entwurf_id}, self.kopf())
        return antwort["voice_id"]

    def geraeusch(self, prompt: str, sekunden: float | None, schleife: bool) -> tuple[bytes, str]:
        daten = {"text": prompt, "prompt_influence": 0.5,
                 "model_id": self.modelle.get("elevenlabs_geraeusch", "eleven_text_to_sound_v3")}
        if sekunden:
            daten["duration_seconds"] = min(30.0, max(0.5, sekunden))
        if schleife:
            daten["loop"] = True
        return self.anfrage(f"{self.basis}/sound-generation?output_format=mp3_44100_128", daten,
                            self.kopf(), roh=True), "mp3"


class Fish(Anbieter):
    name, schluessel_env = "fish", "FISH_API_KEY"

    def sprechen(self, stimme, text, anweisung, fig):
        modell = self.modelle.get("fish", "s2.1-pro")
        audio = self.anfrage("https://api.fish.audio/v1/tts",
                             {"text": self.text_mit_anweisung(text, anweisung, fig),
                              "reference_id": stimme, "format": "mp3", "language": "de"},
                             {"Authorization": f"Bearer {self.schluessel}", "model": modell},
                             roh=True)
        return audio, "mp3"


GEMINI_STIMMEN = {
    "m": ["Charon", "Puck", "Fenrir", "Orus", "Enceladus", "Iapetus", "Umbriel", "Algieba",
          "Algenib", "Rasalgethi", "Alnilam", "Schedar", "Achird", "Zubenelgenubi",
          "Sadachbia", "Sadaltager"],
    "w": ["Kore", "Zephyr", "Leda", "Aoede", "Callirrhoe", "Autonoe", "Despina", "Erinome",
          "Laomedeia", "Achernar", "Gacrux", "Pulcherrima", "Vindemiatrix", "Sulafat"],
}


class Gemini(Anbieter):
    """Interactions-API (Stand 24.11.2026). Der Text wird wörtlich gesprochen; Figur und
    Sprechanweisung gehen als „style“ mit, kurze Laute als <sigh>, <laugh> in den Text."""
    name, schluessel_env = "gemini", "GEMINI_API_KEY"

    def text_mit_anweisung(self, text, anweisung, fig):
        return f"{text}   (Stil: {self.stil(anweisung, fig)})"

    @staticmethod
    def stil(anweisung, fig):
        return ". ".join(t for t in (fig.prompt, anweisung) if t) + ". German speaker."

    def sprechen(self, stimme, text, anweisung, fig):
        antwort = self.anfrage(
            "https://generativelanguage.googleapis.com/v1beta/interactions",
            {"model": self.modelle.get("gemini", "gemini-3.8-flash-tts"),
             "input": [{"type": "user_input", "content": [{
                 "type": "text", "text": text,
                 "annotations": [{"type": "speech_metadata", "style": self.stil(anweisung, fig)}]}]}],
             "response_format": {"type": "audio"},
             "generation_config": {"speech_config": [{"voice": stimme}]}},
            {"x-goog-api-key": self.schluessel})
        daten = audio_suchen(antwort)
        if not daten:
            raise SystemExit(f"gemini: keine Audiodaten in der Antwort: {str(antwort)[:300]}")
        audio = base64.b64decode(daten)
        return (audio, "wav") if audio[:4] == b"RIFF" else (pcm_zu_wav(audio, 24000), "wav")

    def entwuerfe(self, fig, probe):
        weiblich = re.search(r"\b(woman|female|girl|lady|mother)\b", fig.prompt, re.I)
        liste = GEMINI_STIMMEN["w" if weiblich else "m"]
        start = int(hashlib.sha1(fig.name.encode()).hexdigest(), 16) % len(liste)
        namen = [liste[(start + i) % len(liste)] for i in range(3)]
        return [(*self.sprechen(n, probe, "", fig), n) for n in namen]


def audio_suchen(obj):
    """Erstes base64-Feld „data“ in einer verschachtelten Antwort."""
    if isinstance(obj, dict):
        if isinstance(obj.get("data"), str) and len(obj["data"]) > 100:
            return obj["data"]
        obj = list(obj.values())
    if isinstance(obj, list):
        for x in obj:
            d = audio_suchen(x)
            if d:
                return d
    return None


class Test(Anbieter):
    """Kein Netz, keine Kosten: ein Ton, dessen Länge zur Textlänge passt."""
    name = "test"

    def sprechen(self, stimme, text, anweisung=None, fig=None):
        import math
        rate, dauer = 24000, min(8.0, 0.5 + len(text) / 14)
        hoehe = 200 + int(hashlib.sha1(stimme.encode()).hexdigest(), 16) % 200
        werte = bytearray()
        for i in range(int(rate * dauer)):
            v = int(6000 * math.sin(2 * math.pi * hoehe * i / rate))
            werte += v.to_bytes(2, "little", signed=True)
        return pcm_zu_wav(bytes(werte), rate), "wav"

    def entwuerfe(self, fig, probe):
        return [(*self.sprechen(f"{fig.name}{i}", probe), f"test-{fig.kuerzel}-{i}")
                for i in range(1, 4)]

    def geraeusch(self, prompt, sekunden, schleife):
        return self.sprechen(prompt, "x" * int((sekunden or 2) * 14))


ANBIETER = {"elevenlabs": ElevenLabs, "fish": Fish, "gemini": Gemini, "test": Test}


def pcm_zu_wav(pcm: bytes, rate: int) -> bytes:
    puffer = io.BytesIO()
    with wave.open(puffer, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(rate)
        w.writeframes(pcm)
    return puffer.getvalue()


def ffmpeg_pruefen():
    if not shutil.which("ffmpeg"):
        raise SystemExit("ffmpeg fehlt. Unter Windows: winget install ffmpeg (danach neues Terminal)")


def nach_ogg(quelle: Path, ziel: Path, filter_: str):
    ziel.parent.mkdir(parents=True, exist_ok=True)
    r = subprocess.run(["ffmpeg", "-y", "-loglevel", "error", "-i", str(quelle), "-af", filter_,
                        "-ar", "44100", "-ac", "1", "-c:a", "libvorbis", "-q:a", "5", str(ziel)],
                       capture_output=True, text=True)
    if r.returncode:
        raise SystemExit(f"ffmpeg: {r.stderr.strip()[:400]}")


# ---------------------------------------------------------------------------------------------
# Kosten

def kosten_merken(anbieter: str, art: str, zeichen: int, dollar: float):
    ARBEIT.mkdir(parents=True, exist_ok=True)
    pfad = ARBEIT / "kosten.csv"
    neu = not pfad.exists()
    with pfad.open("a", encoding="utf-8", newline="") as f:
        w = csv.writer(f, lineterminator="\n")
        if neu:
            w.writerow(["Datum", "Anbieter", "Art", "Zeichen", "Dollar (geschätzt)"])
        w.writerow([date.today().isoformat(), anbieter, art, zeichen, f"{dollar:.2f}"])


def freigabe(beschreibung: str, dollar: float, grenze: float, los: bool) -> bool:
    print(f"\n{beschreibung}\nGeschätzte Kosten: {dollar:.2f} $ (Grenze {grenze:.2f} $)")
    if dollar > grenze:
        print("Über der Grenze. Mit --grenze höher setzen oder weniger auswählen (--figur, --abschnitt).")
        return False
    if not los:
        print("Probelauf. Erst mit --los wird erzeugt und bezahlt.")
        return False
    return True


# ---------------------------------------------------------------------------------------------
# Befehle

def befehl_pruefen(args) -> int:
    haupt, neben, fehler = figuren_lesen()
    daten = stimmen_lesen()
    betonung, f2 = betonung_lesen()
    fehler += f2
    zeilen = zeilen_lesen()
    ids = {z["ID"] for z in zeilen} | {z["Basis"] for z in zeilen}
    hinweise = []

    arten, zeichen, ohne_stimme, mit_betonung = {}, 0, set(), 0
    for z in zeilen:
        fig = figur_fuer(z, haupt, neben)
        if not fig:
            fehler.append(f"{z['ID']}: Sprecher „{z['Sprecher']}“ ({z['Kürzel']}) hat in 04-audio.md "
                          "weder eine Stimme noch eine Nebenstimme")
            continue
        arten[fig.art] = arten.get(fig.art, 0) + 1
        if fig.art not in ("stimme", "variante"):
            continue
        zeichen += len(z["Text"])
        sf = stimm_figur(fig, daten, haupt)
        if not (daten["stimmen"].get(sf.name) or {}).get(daten["anbieter"]):
            ohne_stimme.add(sf.name)
        if z["ID"] in betonung or z["Basis"] in betonung:
            mit_betonung += 1
    for id_ in sorted(set(betonung) - ids):
        fehler.append(f"docs/audio/betonung: {id_} gibt es im Skript nicht (mehr)")
    namen = set(haupt) | {f.name for f in neben.values()}
    for name in sorted(set(daten["stimmen"]) | set(daten["eigene_stimme"]) | set(daten["abschnitt_filter"])):
        if name not in namen:
            fehler.append(f"docs/audio/stimmen.yaml: Figur „{name}“ gibt es in 04-audio.md nicht")
    for f in list(haupt.values()) + list(neben.values()):
        if f.name in daten["eigene_stimme"]:
            continue   # bekommt eine eigene Stimme, die Beschreibung geht in den Entwurf
        for u in f.unbekannt:
            hinweise.append(f"{f.name}: „{u}“ macht das Werkzeug nicht, von Hand nacharbeiten")

    vertont = vertont_lesen()
    text_je_id = {z["ID"]: z["Text"] for z in zeilen}
    veraltet = [i for i, v in vertont.items()
                if i in text_je_id and v["Textprüfsumme"] != pruefsumme(text_je_id[i])]
    verwaist = [i for i in vertont if i not in text_je_id]
    ordner = GAME_AUDIO / "stimmen" / SPRACHE
    ohne_beleg = [p.stem for p in ordner.glob("*.ogg") if p.stem not in vertont] if ordner.is_dir() else []

    print("Vertonung (Stand):")
    print(f"  Sprechblasen          {len(zeilen):6}   davon " +
          ", ".join(f"{k} {v}" for k, v in sorted(arten.items())))
    print(f"  zu sprechen, Zeichen  {zeichen:6}   ({daten['anbieter']}, grob "
          f"{zeichen / 1e6 * PREIS_JE_MIO.get(daten['anbieter'], 0):.0f} $ je Durchgang)")
    print(f"  mit Sprechanweisung   {mit_betonung:6}")
    print(f"  vertont               {len(vertont):6}   veraltet {len(veraltet)}, ohne Zeile {len(verwaist)}")
    if ohne_stimme:
        print(f"  ohne gewählte Stimme  {len(ohne_stimme):6}   " + ", ".join(sorted(ohne_stimme)))
    for i in veraltet[:20]:
        hinweise.append(f"{i}: Text hat sich seit der Aufnahme geändert, neu erzeugen")
    for i in verwaist[:20]:
        hinweise.append(f"{i}: Aufnahme ohne Zeile im Skript (gelöscht oder umbenannt)")
    if ohne_beleg:
        hinweise.append(f"{len(ohne_beleg)} Dateien in game/audio/stimmen/{SPRACHE} ohne Eintrag in "
                        "docs/audio/vertont.csv")
    if hinweise:
        print(f"\n{len(hinweise)} Hinweise:")
        for h in hinweise:
            print("  " + h)
    if fehler:
        print(f"\n{len(fehler)} Fehler:")
        for f_ in fehler:
            print("  " + f_)
    return 1 if fehler else 0


def befehl_figuren(args) -> int:
    haupt, neben, _ = figuren_lesen()
    daten = stimmen_lesen()
    zaehler = {}
    for z in zeilen_lesen():
        fig = figur_fuer(z, haupt, neben)
        if fig:
            zaehler[(fig.name, fig.abschnitt)] = zaehler.get((fig.name, fig.abschnitt), 0) + 1
    for f in list(haupt.values()) + list(neben.values()):
        sf = stimm_figur(f, daten, haupt) if f.art == "variante" else f
        wahl = (daten["stimmen"].get(sf.name) or {}).get(daten["anbieter"], "–")
        extra = []
        if f.filter:
            extra.append("Filter " + " ".join(f"{e}{'' if w == 1.0 else w}" for e, w in f.filter))
        if f.ton:
            extra.append("Ton " + ", ".join(f.ton))
        quelle = f"Stimme von {sf.name}" if sf is not f else f.art
        print(f"{f.kuerzel:4} {f.name:28} {f.abschnitt or 'alle':8} {zaehler.get((f.name, f.abschnitt), 0):5} "
              f"Zeilen  {quelle:24} {wahl:24} {'; '.join(extra)}")
    return 0


def probe_text(fig: Figur, zeilen: list[dict], haupt, neben) -> str:
    eigene = [z["Text"] for z in zeilen if figur_fuer(z, haupt, neben) is fig and len(z["Text"]) > 25]
    eigene.sort(key=len, reverse=True)
    text = ""
    for t in eigene:
        if len(text) + len(t) > 300:
            continue
        text = f"{text} {t}".strip()
    if len(text) < 100:   # ElevenLabs verlangt mindestens 100 Zeichen
        text = (text + " Also gut. Ich sag das jetzt einmal ganz in Ruhe, damit es jeder versteht: "
                "So ist das, und nicht anders.").strip()
    return text[:1000]


def befehl_vorschlagen(args) -> int:
    haupt, neben, _ = figuren_lesen()
    daten = stimmen_lesen()
    anbieter = ANBIETER[args.anbieter or daten["anbieter"]](daten)
    zeilen = zeilen_lesen()
    eigene = [f for f in neben.values() if f.name in daten["eigene_stimme"]]
    kandidaten = [f for f in list(haupt.values()) + eigene if f.art == "stimme" or f in eigene]
    if args.figur:
        kandidaten = [f for f in kandidaten if f.name == args.figur or f.kuerzel == args.figur]
        if not kandidaten:
            raise SystemExit(f"Figur {args.figur} nicht gefunden oder ohne eigene Stimme")
    elif not args.neu:
        kandidaten = [f for f in kandidaten
                      if not (daten["stimmen"].get(f.name) or {}).get(anbieter.name)]
    for f in eigene:
        if not f.prompt:
            f.prompt = f"{haupt[f.eltern].prompt}. Variation: {f.loesung}"
    dollar = len(kandidaten) * PREIS_STIMMENTWURF.get(anbieter.name, 0)
    if not freigabe(f"Stimmen-Vorschläge ({anbieter.name}) für {len(kandidaten)} Figuren: "
                    + ", ".join(f.name for f in kandidaten), dollar, args.grenze, args.los):
        return 0
    anbieter.bereit()
    for f in kandidaten:
        ordner = ARBEIT / "entwuerfe" / anbieter.name / f.name
        if ordner.exists():
            shutil.rmtree(ordner)
        ordner.mkdir(parents=True)
        probe = probe_text(f, zeilen, haupt, neben)
        for i, (audio, endung, eid) in enumerate(anbieter.entwuerfe(f, probe), start=1):
            (ordner / f"{i}.{endung}").write_bytes(audio)
            (ordner / f"{i}.id").write_text(eid, encoding="utf-8")
        (ordner / "probe.txt").write_text(probe, encoding="utf-8")
        print(f"  {f.name}: Vorschläge in {ordner.relative_to(ROOT)}")
    kosten_merken(anbieter.name, "Stimmen-Vorschläge", 0, dollar)
    hoerseite_schreiben()
    return 0


def befehl_erzeugen(args) -> int:
    haupt, neben, _ = figuren_lesen()
    daten = stimmen_lesen()
    anbieter = ANBIETER[args.anbieter or daten["anbieter"]](daten)
    betonung, _ = betonung_lesen()
    vertont = vertont_lesen()
    auftraege, fehlende = [], set()
    for z in zeilen_lesen():
        if args.abschnitt and z["Abschnitt"] not in args.abschnitt.split(","):
            continue
        if args.zeilen and z["ID"] not in args.zeilen.split(",") and z["Basis"] not in args.zeilen.split(","):
            continue
        fig = figur_fuer(z, haupt, neben)
        if not fig or fig.art not in ("stimme", "variante"):
            continue
        if args.figur and args.figur not in (fig.name, fig.kuerzel):
            continue
        v = vertont.get(z["ID"])
        if v and v["Textprüfsumme"] == pruefsumme(z["Text"]) and not args.neu:
            continue
        sf = stimm_figur(fig, daten, haupt)
        stimme = (daten["stimmen"].get(sf.name) or {}).get(anbieter.name)
        if not stimme and anbieter.name != "test":
            fehlende.add(sf.name)
            continue
        auftraege.append((z, fig, sf, stimme or f"test-{sf.kuerzel}"))
    if fehlende:
        print("Ohne gewählte Stimme übersprungen: " + ", ".join(sorted(fehlende)))
    if not auftraege:
        print("Nichts zu erzeugen.")
        return 0
    zeichen = sum(len(z["Text"]) * versuche_fuer(z, betonung, args.versuche) for z, *_ in auftraege)
    dollar = zeichen / 1e6 * PREIS_JE_MIO.get(anbieter.name, 0)
    if not freigabe(f"{len(auftraege)} Sprechblasen, {zeichen} Zeichen mit allen Versuchen "
                    f"({anbieter.name})", dollar, args.grenze, args.los):
        return 0
    anbieter.bereit()
    ffmpeg_pruefen()
    ziel_ordner = GAME_AUDIO / "stimmen" / SPRACHE
    for n, (z, fig, sf, stimme) in enumerate(auftraege, start=1):
        ton = anweisung(z, fig, betonung)
        text = anbieter.text_mit_anweisung(z["Text"], ton, sf)
        ordner = ARBEIT / "zeilen" / z["ID"]
        if ordner.exists():
            shutil.rmtree(ordner)
        ordner.mkdir(parents=True)
        versuche = versuche_fuer(z, betonung, args.versuche)
        for i in range(1, versuche + 1):
            audio, endung = anbieter.sprechen(stimme, z["Text"], ton, sf)
            roh = ordner / f"{i}_roh.{endung}"
            roh.write_bytes(audio)
            nach_ogg(roh, ordner / f"{i}.ogg", ffmpeg_filter(filter_fuer(z, fig, daten)))
        (ordner / "info.json").write_text(json.dumps({
            "ID": z["ID"], "Sprecher": z["Sprecher"], "Text": z["Text"], "Anfrage": text,
            "Anbieter": anbieter.name, "Stimme": stimme,
            "Betonung": ton}, ensure_ascii=False, indent=1), encoding="utf-8")
        if versuche == 1:
            uebernehmen_zeile(z["ID"], 1, ziel_ordner, vertont)
        print(f"  [{n}/{len(auftraege)}] {z['ID']}  {versuche} Versuch(e)")
    vertont_schreiben(vertont)
    kosten_merken(anbieter.name, "Zeilen", zeichen, dollar)
    hoerseite_schreiben()
    return 0


def uebernehmen_zeile(id_: str, wahl: int, ziel_ordner: Path, vertont: dict):
    ordner = ARBEIT / "zeilen" / id_
    info = json.loads((ordner / "info.json").read_text(encoding="utf-8"))
    ziel_ordner.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(ordner / f"{wahl}.ogg", ziel_ordner / f"{id_}.ogg")
    vertont[id_] = {"ID": id_, "Textprüfsumme": pruefsumme(info["Text"]),
                    "Anbieter": info["Anbieter"], "Stimme": info["Stimme"],
                    "Betonung": info["Betonung"], "Datum": date.today().isoformat()}
    (ordner / "gewaehlt").write_text(str(wahl), encoding="utf-8")


def geraeusch_liste() -> list[tuple[str, str]]:
    out = []
    for kopf, zeilen in md_tabellen(DOKU):
        if kopf and kopf[0] == "Kennung":
            out += [(z[0], z[1]) for z in zeilen if len(z) > 1]
    return out


def befehl_geraeusche(args) -> int:
    daten = stimmen_lesen()
    anbieter = ANBIETER[args.anbieter or "elevenlabs"](daten)
    if not hasattr(anbieter, "geraeusch"):
        raise SystemExit(f"{anbieter.name} erzeugt keine Geräusche (elevenlabs oder test)")
    ordner_spiel = GAME_AUDIO / "geraeusche"
    da = {p.stem for p in ordner_spiel.glob("*")} if ordner_spiel.is_dir() else set()
    liste = [(k, p) for k, p in geraeusch_liste()
             if (args.kennung and k in args.kennung.split(",")) or (not args.kennung and k not in da)]
    dollar = len(liste) * args.varianten * PREIS_GERAEUSCH * (anbieter.name != "test")
    if not freigabe(f"{len(liste)} Geräusche mit je {args.varianten} Varianten ({anbieter.name})",
                    dollar, args.grenze, args.los):
        return 0
    anbieter.bereit()
    ffmpeg_pruefen()
    for kennung, prompt in liste:
        m = re.search(r"(\d+(?:\.\d+)?)\s*seconds?", prompt)
        sekunden = float(m.group(1)) if m else None
        schleife = "loop" in prompt.lower()
        ordner = ARBEIT / "geraeusche" / kennung
        if ordner.exists():
            shutil.rmtree(ordner)
        ordner.mkdir(parents=True)
        for i in range(1, args.varianten + 1):
            audio, endung = anbieter.geraeusch(prompt, sekunden, schleife)
            roh = ordner / f"{i}_roh.{endung}"
            roh.write_bytes(audio)
            nach_ogg(roh, ordner / f"{i}.ogg", "loudnorm=I=-20:TP=-1.5:LRA=11")
        (ordner / "info.json").write_text(json.dumps({"Kennung": kennung, "Prompt": prompt},
                                                     ensure_ascii=False), encoding="utf-8")
        print(f"  {kennung}: {args.varianten} Varianten")
    kosten_merken(anbieter.name, "Geräusche", 0, dollar)
    hoerseite_schreiben()
    return 0


def hoerseite_schreiben() -> Path:
    """Eine Seite mit allen offenen Entwürfen, Versuchen und Geräuschen."""
    ARBEIT.mkdir(parents=True, exist_ok=True)
    abschnitte = []

    def gruppe(art, id_, titel, unter, dateien, gewaehlt):
        knoepfe = "".join(
            f'<label><input type="radio" name="{art}|{html.escape(id_)}" value="{i}"'
            f'{" checked" if str(i) == gewaehlt else ""}> {i} '
            f'<audio controls preload="none" src="{html.escape(p)}"></audio></label>'
            for i, p in dateien)
        return (f'<div class="g"><b>{html.escape(titel)}</b><div class="u">{html.escape(unter)}</div>'
                f'{knoepfe}</div>')

    teile = []
    for anb in sorted((ARBEIT / "entwuerfe").glob("*")) if (ARBEIT / "entwuerfe").is_dir() else []:
        for ordner in sorted(anb.iterdir()):
            dateien = [(int(p.stem), p.relative_to(ARBEIT).as_posix())
                       for p in sorted(ordner.glob("[0-9]*.*")) if p.suffix != ".id"]
            probe = (ordner / "probe.txt").read_text(encoding="utf-8") if (ordner / "probe.txt").exists() else ""
            teile.append(gruppe(f"stimme:{anb.name}", ordner.name, f"{ordner.name} ({anb.name})", probe,
                                dateien, ""))
    if teile:
        abschnitte.append(("Stimmen", teile))
    teile = []
    for ordner in sorted((ARBEIT / "zeilen").glob("*")) if (ARBEIT / "zeilen").is_dir() else []:
        if not (ordner / "info.json").exists():
            continue
        info = json.loads((ordner / "info.json").read_text(encoding="utf-8"))
        dateien = [(int(p.stem), p.relative_to(ARBEIT).as_posix()) for p in sorted(ordner.glob("[0-9].ogg"))
                   + sorted(ordner.glob("[0-9][0-9].ogg"))]
        if (ordner / "gewaehlt").exists():
            continue
        gew = (ordner / "gewaehlt").read_text().strip() if (ordner / "gewaehlt").exists() else ""
        teile.append(gruppe("zeile", ordner.name, f"{ordner.name} · {info['Sprecher']}",
                            f"{info['Text']}  [{info['Betonung']}]", dateien, gew))
    if teile:
        abschnitte.append(("Zeilen mit mehreren Versuchen", teile))
    teile = []
    for ordner in sorted((ARBEIT / "geraeusche").glob("*")) if (ARBEIT / "geraeusche").is_dir() else []:
        if not (ordner / "info.json").exists():
            continue
        info = json.loads((ordner / "info.json").read_text(encoding="utf-8"))
        dateien = [(int(p.stem), p.relative_to(ARBEIT).as_posix()) for p in sorted(ordner.glob("*.ogg"))]
        teile.append(gruppe("geraeusch", ordner.name, ordner.name, info["Prompt"], dateien, ""))
    if teile:
        abschnitte.append(("Geräusche", teile))

    inhalt = "".join(f"<h2>{t}</h2>{''.join(g)}" for t, g in abschnitte) or "<p>Nichts offen.</p>"
    seite = f"""<!doctype html><html lang="de"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>Hörseite</title>
<style>
:root{{--bg:#faf8f4;--fg:#222;--mut:#666;--rand:#ddd}}
@media (prefers-color-scheme:dark){{:root{{--bg:#1c1b19;--fg:#eee;--mut:#aaa;--rand:#444}}}}
body{{font:15px system-ui,sans-serif;background:var(--bg);color:var(--fg);margin:0 auto;max-width:980px;padding:16px}}
.g{{border-bottom:1px solid var(--rand);padding:10px 0}} .u{{color:var(--mut);margin:4px 0 6px}}
label{{display:inline-flex;align-items:center;gap:4px;margin:2px 14px 2px 0}} audio{{height:30px}}
button{{position:sticky;top:8px;font-size:16px;padding:8px 14px}}
</style></head><body>
<h1>Hörseite Couch Quest</h1>
<p>Je Eintrag eine Nummer wählen, dann „Auswahl speichern“. Die Datei <code>auswahl.json</code> landet in
Downloads; danach <code>python tools/vertonung.py uebernehmen</code>.</p>
<button onclick="speichern()">Auswahl speichern</button>
{inhalt}
<script>
function speichern(){{
  const wahl=[...document.querySelectorAll('input[type=radio]:checked')].map(e=>{{
    const [art,id]=e.name.split('|');return {{art,id,wahl:+e.value}};}});
  const a=document.createElement('a');
  a.href=URL.createObjectURL(new Blob([JSON.stringify(wahl,null,1)],{{type:'application/json'}}));
  a.download='auswahl.json';a.click();
}}
</script></body></html>"""
    pfad = ARBEIT / "hoerseite.html"
    pfad.write_text(seite, encoding="utf-8")
    print(f"Hörseite: {pfad}")
    return pfad


def befehl_hoerseite(args) -> int:
    hoerseite_schreiben()
    return 0


def befehl_uebernehmen(args) -> int:
    pfad = Path(args.datei) if args.datei else None
    if not pfad:
        kandidaten = sorted((Path.home() / "Downloads").glob("auswahl*.json"),
                            key=lambda p: p.stat().st_mtime)
        if not kandidaten:
            raise SystemExit("Keine auswahl.json in Downloads gefunden; Pfad angeben")
        pfad = kandidaten[-1]
    wahl = json.loads(pfad.read_text(encoding="utf-8"))
    haupt, neben, _ = figuren_lesen()
    figuren = dict(haupt) | {f.name: f for f in neben.values()}
    daten = stimmen_lesen()
    vertont = vertont_lesen()
    stimmen_geaendert = zeilen_geaendert = 0
    for w in wahl:
        art, id_, n = w["art"], w["id"], int(w["wahl"])
        if art.startswith("stimme:"):
            anb_name = art.split(":", 1)[1]
            anbieter = ANBIETER[anb_name](daten)
            anbieter.bereit()
            ordner = ARBEIT / "entwuerfe" / anb_name / id_
            eid = (ordner / f"{n}.id").read_text(encoding="utf-8").strip()
            stimme = anbieter.entwurf_speichern(figuren[id_], eid)
            daten["stimmen"].setdefault(id_, {})[anb_name] = stimme
            shutil.rmtree(ordner)
            stimmen_geaendert += 1
            print(f"  Stimme {id_} ({anb_name}): {stimme}")
        elif art == "zeile":
            uebernehmen_zeile(id_, n, GAME_AUDIO / "stimmen" / SPRACHE, vertont)
            zeilen_geaendert += 1
        elif art == "geraeusch":
            ziel = GAME_AUDIO / "geraeusche" / f"{id_}.ogg"
            ziel.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ARBEIT / "geraeusche" / id_ / f"{n}.ogg", ziel)
            shutil.rmtree(ARBEIT / "geraeusche" / id_)
            print(f"  Geräusch {id_}: Variante {n}")
    if stimmen_geaendert:
        stimmen_schreiben(daten)
    if zeilen_geaendert:
        vertont_schreiben(vertont)
        print(f"  {zeilen_geaendert} Zeilen übernommen")
    hoerseite_schreiben()
    return 0


def befehl_waehlen(args) -> int:
    daten = stimmen_lesen()
    haupt, neben, _ = figuren_lesen()
    if args.figur not in haupt and args.figur not in {f.name for f in neben.values()}:
        raise SystemExit(f"Figur {args.figur} gibt es in 04-audio.md nicht")
    daten["stimmen"].setdefault(args.figur, {})[args.anbieter or daten["anbieter"]] = args.id
    stimmen_schreiben(daten)
    print(f"{args.figur}: {args.id}")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    u = p.add_subparsers(dest="befehl")
    u.add_parser("pruefen")
    u.add_parser("figuren")
    s = u.add_parser("vorschlagen")
    s.add_argument("--figur")
    s.add_argument("--anbieter", choices=ANBIETER)
    s.add_argument("--neu", action="store_true", help="auch Figuren mit gewählter Stimme")
    s.add_argument("--grenze", type=float, default=5.0)
    s.add_argument("--los", action="store_true")
    s = u.add_parser("erzeugen")
    s.add_argument("--abschnitt", help="P0, W1 … (mehrere mit Komma)")
    s.add_argument("--figur")
    s.add_argument("--zeilen", help="einzelne Zeilen-IDs mit Komma")
    s.add_argument("--anbieter", choices=ANBIETER)
    s.add_argument("--versuche", type=int, default=1)
    s.add_argument("--neu", action="store_true", help="auch schon vertonte Zeilen")
    s.add_argument("--grenze", type=float, default=10.0)
    s.add_argument("--los", action="store_true")
    s = u.add_parser("geraeusche")
    s.add_argument("--kennung", help="einzelne Kennungen mit Komma; sonst alle fehlenden")
    s.add_argument("--anbieter", choices=("elevenlabs", "test"))
    s.add_argument("--varianten", type=int, default=3)
    s.add_argument("--grenze", type=float, default=10.0)
    s.add_argument("--los", action="store_true")
    u.add_parser("hoerseite")
    s = u.add_parser("uebernehmen")
    s.add_argument("datei", nargs="?")
    s = u.add_parser("waehlen")
    s.add_argument("figur")
    s.add_argument("--id", required=True)
    s.add_argument("--anbieter", choices=ANBIETER)
    args = p.parse_args()
    befehle = {None: befehl_pruefen, "pruefen": befehl_pruefen, "figuren": befehl_figuren,
               "vorschlagen": befehl_vorschlagen, "erzeugen": befehl_erzeugen,
               "geraeusche": befehl_geraeusche, "hoerseite": befehl_hoerseite,
               "uebernehmen": befehl_uebernehmen, "waehlen": befehl_waehlen}
    return befehle[args.befehl](args)


if __name__ == "__main__":
    sys.exit(main())
