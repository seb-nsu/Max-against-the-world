"""Kleiner MCP-Server fuer Couch Quest: Bilder mit Googles Gemini-Bildmodellen erzeugen.

Benoetigt:  python -m pip install mcp google-genai pillow
Umgebung:   GEMINI_API_KEY      = Schluessel aus Google AI Studio
            COUCHQUEST_ASSETS   = Zielordner fuer Bilder (optional, Standard: Ordner dieses Skripts\\bilder)
"""

import io
import os
import sys
from datetime import datetime
from pathlib import Path

from google import genai
from google.genai import types
from mcp.server.fastmcp import FastMCP, Image
from PIL import Image as PILImage

STANDARD_MODELL = "gemini-3-pro-image"  # Nano Banana Pro
BASIS = Path(os.environ.get("COUCHQUEST_ASSETS", Path(__file__).parent / "bilder"))
PROTOKOLL = BASIS / "ki_protokoll.csv"

mcp = FastMCP("gemini-bild")
_client = None


def client():
    global _client
    if _client is None:
        if not os.environ.get("GEMINI_API_KEY"):
            raise RuntimeError("GEMINI_API_KEY ist nicht gesetzt.")
        _client = genai.Client()
    return _client


def _mime(pfad: Path) -> str:
    return {".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".webp": "image/webp"}.get(
        pfad.suffix.lower(), "image/png"
    )


def _vorschau(daten: bytes, max_kante: int = 768) -> Image:
    bild = PILImage.open(io.BytesIO(daten))
    bild.thumbnail((max_kante, max_kante), PILImage.NEAREST)
    puffer = io.BytesIO()
    bild.save(puffer, format="PNG")
    return Image(data=puffer.getvalue(), format="png")


def _protokoll(datei: Path, modell: str, prompt: str, referenzen: list[str]):
    BASIS.mkdir(parents=True, exist_ok=True)
    neu = not PROTOKOLL.exists()
    with PROTOKOLL.open("a", encoding="utf-8") as f:
        if neu:
            f.write("Datum;Werkzeug und Modell;Prompt;Referenzen;Datei\n")
        sauber = prompt.replace(";", ",").replace("\n", " ")
        f.write(
            f"{datetime.now():%Y-%m-%d %H:%M};Gemini {modell};{sauber};"
            f"{', '.join(referenzen)};{datei}\n"
        )


@mcp.tool()
def bild_erzeugen(
    prompt: str,
    dateiname: str,
    referenzbilder: list[str] | None = None,
    seitenverhaeltnis: str = "1:1",
    aufloesung: str = "1K",
    modell: str = STANDARD_MODELL,
) -> list:
    """Erzeugt ein Bild mit Gemini und speichert es als PNG.

    prompt: Bildbeschreibung.
    dateiname: Name oder relativer Pfad unter dem Asset-Ordner, z. B. "figuren/max_modelsheet.png".
    referenzbilder: absolute Pfade zu Bildern, die als Vorlage mitgehen (Model Sheet, Palette, Stil).
                    Mit Referenz und passendem Prompt laesst sich ein Bild auch bearbeiten.
    seitenverhaeltnis: z. B. "1:1", "16:9", "3:4".
    aufloesung: "1K", "2K" oder "4K" (4K nur bei Nano Banana Pro, teurer).
    modell: Standard gemini-3-pro-image-preview (Nano Banana Pro); alternativ z. B. gemini-nano-banana-2.1.
    """
    referenzen = referenzbilder or []
    teile: list = [prompt]
    for pfad_text in referenzen:
        pfad = Path(pfad_text)
        teile.append(types.Part.from_bytes(data=pfad.read_bytes(), mime_type=_mime(pfad)))

    konfig = types.GenerateContentConfig(
        response_modalities=["TEXT", "IMAGE"],
        image_config=types.ImageConfig(aspect_ratio=seitenverhaeltnis, image_size=aufloesung),
    )
    antwort = client().models.generate_content(model=modell, contents=teile, config=konfig)

    bilddaten = None
    texte = []
    for kandidat in antwort.candidates or []:
        for teil in (kandidat.content.parts if kandidat.content else []) or []:
            if teil.inline_data and teil.inline_data.data and bilddaten is None:
                bilddaten = teil.inline_data.data
            elif teil.text:
                texte.append(teil.text)
    if bilddaten is None:
        return [f"Kein Bild erhalten. Antwort des Modells: {' '.join(texte) or 'leer'}"]

    ziel = BASIS / dateiname
    if ziel.suffix.lower() != ".png":
        ziel = ziel.with_suffix(".png")
    ziel.parent.mkdir(parents=True, exist_ok=True)
    if ziel.exists():
        ziel = ziel.with_name(f"{ziel.stem}_{datetime.now():%H%M%S}.png")
    PILImage.open(io.BytesIO(bilddaten)).save(ziel, format="PNG")
    _protokoll(ziel, modell, prompt, referenzen)

    info = f"Gespeichert: {ziel}"
    if texte:
        info += f"\nHinweis des Modells: {' '.join(texte)}"
    return [info, _vorschau(bilddaten)]


@mcp.tool()
def asset_ordner() -> str:
    """Zeigt den Ordner, in dem Bilder und das KI-Protokoll landen."""
    return str(BASIS.resolve())


if __name__ == "__main__":
    print(f"gemini-bild startet, Asset-Ordner: {BASIS}", file=sys.stderr)
    mcp.run()
