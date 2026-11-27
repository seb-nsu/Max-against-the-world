# Rohbau Welt 4 (Vorlage für den Gemini-Chat)

Je Raum zwei Bilder aus Blender (`tools/grafik_w4/rohbau_raeume.py`, Beschriftung `tools/grafik_w3/rohbau_notiz.py`):

- `<raum>_rohbau.png`: sauber, ohne Schrift. Das geht als Bild in den Gemini-Chat, zusammen mit dem Motiv-Prompt aus `docs/grafik/fertige-prompts/welt-4.md`.
- `<raum>_rohbau_notiz.png`: dasselbe mit Beschriftung, Figurenplätzen (lila gestrichelt, Platz frei lassen) und Max als Maßstab (grau, vorn und hinten im Laufband). Zum Nachsehen oder als zweites Bild.
- `<raum>_rohbau.json`: Lage der Beschriftungen und Figurenplätze in Pixeln des Renders.

Maßstab und Kamera wie in Welt 3: Max 1,75 m, Kamera 2,3 m hoch, 8 m vor der Vorderkante, leicht nach unten geneigt. Breite Räume (Sitcom-Küche, Savanne, Werbespot-Set, Empfang) 2560 × 720 (32:9, wird 1280 × 360), die übrigen 1280 × 720 (16:9, wird 640 × 360).

Zusätzlich zwei zusammengesetzte Skizzen für das Bild-in-Bild (`tools/grafik_w4/bild_in_bild_skizze.py`):

- `bild_in_bild_r6_skizze.png`: rechte Hälfte der Küche neben der linken Hälfte des Kellers. Die Küchentür steht am rechten Rand, die verkettete Kellertür am linken Rand; in Rätsel 6 wird die Tür über die Naht geschoben.
- `bild_in_bild_r13_skizze.png`: Zappmanns Studio neben der Kindersendung von 1977 (Archivband im Endkampf).

Vorschlag für den Satz im Chat (steht schon in jedem Raum-Prompt): „Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person. Paint the scene in the style of the reference image; do not copy the grey colours, do not paint any people or animals.“

Was die Rohbauten aus dem Review vom 21.11. (R5-W4-15, D5) festlegen: Küche, Werbespot-Set und Empfang als Breitbild, damit die großen Figuren Platz haben; Tür an der Naht zwischen Küche und Keller; Gittertor des Friedhofs hinten in der Mitte hinter dem Zombie-Block; vorderer Bottich mit Deckel unter dem Laufsteg; Laterne in Kapitolis mit kräftigem Arm für den Fledermann; Quotenanzeige und Applaus-Schild rechts im Studio gut sichtbar; im Rauschen nur ein niedriger Kriechweg für Pixel.

Neu erzeugen (Windows): `blender --background --python tools/grafik_w4/rohbau_raeume.py -- docs/grafik/skizzen/welt-4/rohbau [raum ...]`, danach `py -3 tools/grafik_w3/rohbau_notiz.py docs/grafik/skizzen/welt-4/rohbau` und `py -3 tools/grafik_w4/bild_in_bild_skizze.py docs/grafik/skizzen/welt-4/rohbau`. Unter Linux mit `pip install bpy` statt Blender: `python tools/grafik_w4/rohbau_raeume.py -- …` (Pakete siehe `lessons-learned.md`, Abschnitt 14).
