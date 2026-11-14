# Fertige Prompts: Weltenübergreifende Gegenstände und Bewegungen von Max und Pixel

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../00-stil-und-werkzeuge.md` (dort ändern, nicht hier).

Gegenstände und Grundbewegungen, die in allen Welten gelten. Laut `../../offene-punkte.md` fehlen
im Spiel noch: Max bücken, zeigen, Achselzucken, gähnen, Kopf kratzen; Pixel putzen, ducken,
springen, fauchen, aufgeschreckt. Gehen, Stehen und Reden sind schon im Spiel.

**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):
erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist
ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein
MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und
Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus
`01-figurenboegen.md` anhängen, sobald er freigegeben ist.

# Shotliste

23 Shots, davon 14 sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:
R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.

| Shot | Bild | Stand |
| --- | --- | --- |
| WU-B01 | Max: Gehen | im Spiel |
| WU-B02 | Max: Gehen nach vorn und nach hinten | offen |
| WU-B03 | Max: Stehen | im Spiel |
| WU-B04 | Max: Sprechen | im Spiel |
| WU-B05 | Max: Aufheben | offen |
| WU-B06 | Max: Benutzen | offen |
| WU-B07 | Max: Schulterzucken | offen |
| WU-B08 | Max: Gähnen | offen |
| WU-B09 | Max: Auf dem Sofa | im Spiel |
| WU-B10 | Max: Vom Sofa aufstehen | offen |
| WU-B11 | Pixel: Gehen | im Spiel |
| WU-B12 | Pixel: Gehen nach vorn und nach hinten | offen |
| WU-B13 | Pixel: Stehen | im Spiel |
| WU-B14 | Pixel: Schlafen | im Spiel |
| WU-B15 | Pixel: Putzen | offen |
| WU-B16 | Pixel: Springen und Klettern | offen |
| WU-B17 | Pixel: Schnuppern | offen |
| WU-B18 | Pixel: Tragen | offen |
| WU-B19 | Pixel: Fauchen | offen |
| WU-B20 | Pixel: Ohrfeige | offen |
| WU-B21 | Pixel: Vom Schrank fallen | offen |
| WU-G01 | Reisegepäck (2×5) | – |
| WU-G02 | Fernbedienungen (1×5) | – |

# Bewegungen

Schlüsselposen für Animationen, die im Spiel noch fehlen. Das Blatt anhängen, das beim Block steht.
Die Zeitmarken gelten für etwa 10 Bilder pro Sekunde; Zwischenbilder, Timing und Schleife baut Claude
in Aseprite oder aus dem 3D-Clip. Eine misslungene Pose wird mit Maske nachgebessert.

## Max: Gehen

**Shot WU-B01**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
MANNER (applies to every pose): slouching relaxed walk, hands stay in the hoodie pocket, head bobbing slightly, sneakers on one baseline.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Gehen nach vorn und nach hinten

**Shot WU-B02**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** je 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
MANNER (applies to every pose): front view of Max walking toward the viewer, slouching relaxed walk, hands in the hoodie pocket, head bobbing slightly; second animation, same settings: back view of Max walking away from the viewer.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, front and back view exactly as described, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Stehen

**Shot WU-B03**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: slow breathing, one blink, weight shifts from one leg to the other; (2) 0.2 s: hands stay in the hoodie pocket.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Sprechen

**Shot WU-B04**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Max talking: mouth opens and closes, small open-hand gesture with the right hand; (2) 0.2 s: legs and torso stay still.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Aufheben

**Shot WU-B05**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Max bends down; (2) 0.3 s: reaches forward with the right hand, grabs something at floor level; (3) 0.6 s: straightens up again.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Benutzen

**Shot WU-B06**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Max reaches forward at chest height with the right hand; (2) 0.3 s: fiddles briefly; (3) 0.6 s: pulls the hand back.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Schulterzucken

**Shot WU-B07**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Max lifts both shoulders and palms, raises eyebrows; (2) 0.4 s: lowers them again.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Gähnen

**Shot WU-B08**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Max stretches arms up, mouth opens wide; (2) 0.3 s: eyes close; (3) 0.6 s: arms drop back into the hoodie pocket.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Auf dem Sofa

**Shot WU-B09**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Standbild A: Max lying flat on a sofa in side view, head on the left armrest, holding his phone above his face with both hands, sneakers on the right armrest; (2) 0.2 s: Standbild B: Max slumped half lying on a sofa, remote in hand, feet up, Animation: slow blinking, thumb tapping the phone or clicking the remote.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Vom Sofa aufstehen

**Shot WU-B10**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: Max swings his legs off the sofa; (2) 0.3 s: pushes himself up with both hands; (3) 0.5 s: stands; (4) 0.8 s: stretches.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Gehen

**Shot WU-B11**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
MANNER (applies to every pose): about 65 pixels long, smug strut with tail held high, collar light stays visible.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Gehen nach vorn und nach hinten

**Shot WU-B12**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** je 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
MANNER (applies to every pose): front view of Pixel trotting toward the viewer, round face and white chest, collar light visible; second animation: back view trotting away, fluffy tail held high.
ACTION (4 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.1 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.3 s: contact pose with the other foot in front, legs widest apart; (4) 0.4 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, front and back view exactly as described, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Stehen

**Shot WU-B13**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: tail tip twitching, one slow blink, body stays still, at one end of the movement; (2) 0.2 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Schlafen

**Shot WU-B14**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Pixel curled up asleep; (2) 0.2 s: about 25 pixels high and 48 long, belly rising and falling, torn ear twitching once.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Putzen

**Shot WU-B15**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Pixel sitting; (2) 0.3 s: licks his front paw and wipes it over his ear, tail still.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Springen und Klettern

**Shot WU-B16**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Pixel crouches; (2) 0.3 s: wiggles his rear; (3) 0.6 s: leaps up about 75 pixels and lands on a ledge above.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Schnuppern

**Shot WU-B17**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Pixel stretches his neck forward, nose twitching, sniffs twice; (2) 0.4 s: pulls back.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Tragen

**Shot WU-B18**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
MANNER (applies to every pose): smug strut with tail held high, a small object held in his mouth, head slightly raised, the object stays fixed in the mouth.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Fauchen

**Shot WU-B19**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Pixel arches his back, fur bristles, mouth wide open hissing; (2) 0.4 s: settles.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Ohrfeige

**Shot WU-B20**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Pixel jumps up and slaps with one front paw; (2) 0.4 s: lands again, smug face.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Vom Schrank fallen

**Shot WU-B21**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: Pixel loses balance on top of a tall cupboard; (2) 0.3 s: flails all four legs; (3) 0.5 s: falls about 149 pixels; (4) 0.8 s: lands flat on the floor, dazed.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

# Gegenstände

Je Sammelbild den Block komplett in Gemini kopieren und Max' Konzeptblatt als Stilvorlage
anhängen, keine Skizze. Umrechnen mit `tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.

## Reisegepäck (2×5)

**Shot WU-G01**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x5 grid: a closed tin of tuna with a blue fish drawing on a blank label; the same tin opened, lid bent up, pink tuna in brine inside; the same tin empty and shiny inside; a wooden cooking spoon with a crust of dried yellow cheese on its bowl; a red-and-white striped woolen sock; a full-size round clay jug of olive oil with a handle and a cork, oil up to the neck; the same jug less full, a drip running down its side; a single golden sandal with two small white wings at the heel; rectangular black sunglasses; a small brown notebook with a pencil tucked in the spine.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Fernbedienungen (1×5)

**Shot WU-G02**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x5 grid: a cheap white plastic TV remote with a single red button; the same white remote with six round colored buttons; a gleaming golden luxury remote with jewel buttons; a worn grey 1990s TV remote with faded rubber buttons for volume, channel and mute and one red button at the top; the same grey remote seen from the back with the battery lid open and the compartment empty.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```
