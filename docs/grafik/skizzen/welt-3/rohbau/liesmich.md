# Rohbau Welt 3 (Vorlage für den Gemini-Chat)

Je Raum zwei Bilder aus Blender (`tools/grafik_w3/rohbau_raeume.py`, Beschriftung `rohbau_notiz.py`):

- `<raum>_rohbau.png`: sauber, ohne Schrift. Das geht als Bild in den Gemini-Chat, zusammen mit dem Motiv-Prompt aus `docs/grafik/fertige-prompts/welt-3.md`.
- `<raum>_rohbau_notiz.png`: dasselbe mit Beschriftung, Figurenplätzen (lila gestrichelt, Platz frei lassen) und Max als Maßstab (grau, vorn und hinten im Laufband). Zum Nachsehen oder als zweites Bild.

Maßstab und Kamera sind in allen Räumen gleich: Max 1,75 m, Kamera 2,3 m hoch, 8 m vor der Vorderkante, leicht nach unten geneigt. Breite Räume 2560 × 720 (32:9, wird 1280 × 360), die übrigen 1280 × 720 (16:9, wird 640 × 360).

Vorschlag für den Satz im Chat: „Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person. Paint the scene in the style of the reference image; do not copy the grey colours, do not paint any people or animals.“

Was die Rohbauten aus dem Review vom 20.11. (AP-09) festlegen: Fahrbahn für die Autos in der Stadtstraße und Nachttisch als eigenes Vordergrundteil, Omas Haustür in Max-Größe; Küchentisch auf Hüfthöhe; Türreihe und drei getrennte Farbfelder im Büro 50; Laser quer vor der Ausgangstür in Kammer 2; schmaler Spalt direkt vor der Tür in Kammer 3; rundes Fenster direkt über Max' Kapsel; Apothekengasse über die ganze Breite; Origami-Einhorn handgroß.

Neu erzeugen: `blender --background --python tools/grafik_w3/rohbau_raeume.py -- docs/grafik/skizzen/welt-3/rohbau [raum ...]`, danach `py -3 tools/grafik_w3/rohbau_notiz.py docs/grafik/skizzen/welt-3/rohbau`.
