# Fertige Prompts: Welt 3, Neo-Neustadt 2099

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../welt-3.md` (dort ändern, nicht hier).

Räume: je Szene den Block komplett in ChatGPT oder Gemini kopieren. Keine Skizze anhängen: Für
diese Welt gibt es noch keine entworfenen Skizzen, die automatischen Raster widersprechen dem
Motiv. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene).

**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):
erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist
ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein
MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und
Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus
`01-figurenboegen.md` anhängen, sobald er freigegeben ist.

# Shotliste

64 Shots, davon 64 sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:
R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.

| Shot | Bild | Stand |
| --- | --- | --- |
| W3-R01 | Unterstadt, Straße | offen |
| W3-R02 | Apothekengasse mit Pastillenautomat | offen |
| W3-R03 | Widerstandsbasis | offen |
| W3-R04 | Kühlung (Ende des Lüftungsschachts) | offen |
| W3-R05 | Laboreingang | offen |
| W3-R06 | Stadtstraße | offen |
| W3-R07 | Küche der Orakel-Oma | offen |
| W3-R08 | Büroturm, 50. Stock | offen |
| W3-R09 | Testkammer 1 | offen |
| W3-R10 | Testkammer 2 | offen |
| W3-R11 | Testkammer 3 | offen |
| W3-R12 | Kern von M.U.T.T.I. | offen |
| W3-R13 | Code-Sicht | offen |
| W3-F01 | M.U.T.T.I. | offen |
| W3-F02 | Morphäus | offen |
| W3-F03 | Orakel-Oma | offen |
| W3-F04 | Agent Schmidt | offen |
| W3-F05 | Schmidt-Klon | offen |
| W3-F06 | Roboter-Hausmeister | offen |
| W3-F07 | Detektiv Deckert | offen |
| W3-F08 | Herr Vier | offen |
| W3-F09 | Kabel-Kalle | offen |
| W3-F10 | Bernd | offen |
| W3-F11 | Rebellin | offen |
| W3-F12 | Rebell | offen |
| W3-F13 | Piepsi | offen |
| W3-F14 | Opa als Hologramm | offen |
| W3-F15 | Weinender Mann | offen |
| W3-F16 | Frau mit Regenschirm | offen |
| W3-F17 | Straßenmusiker | offen |
| W3-F18 | Schwarze Katze | offen |
| W3-F19 | Max als Ente | offen |
| W3-F20 | Max in der Kapsel | offen |
| W3-B01 | M.U.T.T.I.: Sprechen | offen |
| W3-B02 | M.U.T.T.I.: Herunterfahren | offen |
| W3-B03 | Agent Schmidt: Kopieren | offen |
| W3-B04 | Max: Zeitlupen-Ausweichen | offen |
| W3-B05 | Max: Pastille schlucken | offen |
| W3-B06 | Max: Code-Sicht einschalten | offen |
| W3-B07 | Pixel: Kabel umstecken | offen |
| W3-B08 | Pixel: Miau-Morse | offen |
| W3-B09 | Pixel: Schacht kriechen | offen |
| W3-B10 | Pixel: Ohrfeige | offen |
| W3-B11 | Roboter-Hausmeister: Wischen | offen |
| W3-B12 | Herr Vier: Weinend kochen | offen |
| W3-B13 | Bernd: Beleidigt davonschweben | offen |
| W3-B14 | Schwarze Katze: Zweimal vorbeilaufen | offen |
| W3-B15 | Verwandlung: Effekt | offen |
| W3-B16 | Portal: Effekt | offen |
| W3-B17 | Max als Ente: Watscheln | offen |
| W3-B18 | Regen: Effekt | offen |
| W3-B19 | Schnee: Effekt | offen |
| W3-B20 | Pixel: Tasse vom Tisch werfen | offen |
| W3-B21 | Piepsi: Hochfahren | offen |
| W3-B22 | Piepsi: Piepen | offen |
| W3-B23 | Hologramm: Effekt | offen |
| W3-B24 | Max: Gedankentrick | offen |
| W3-G01 | Verwandlung (2×4) | offen |
| W3-G02 | Kekse-Zustände (1×2) | offen |
| W3-G03 | Unterstadt (2×3) | offen |
| W3-G04 | Labor (1×5) | offen |
| W3-G05 | Omas Sparschwein (1×3, Szenen-Sprites für Rätsel 4, kein Inventar) | offen |
| W3-G06 | Locher (1×2, Szenen-Sprites für das Zeitlupen-Ausweichen im Büroturm, kein Inventar) | offen |
| W3-G07 | Deko Welt 3 (3×3) | offen |

# Räume

## Unterstadt, Straße

**Shot W3-R01**

**Zustände:** 1280×360, linke und rechte Hälfte einzeln erzeugen (je Hälfte den Satzteil LEFT HALF oder RIGHT HALF mit dem Anfang des Motivs)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF: Narrow rainy street of a future megacity at night, front view with gentle depth. Left edge: a tiny noodle stall with a counter, four round stools, a big steaming pot and a red paper lantern, a concrete pillar beside it. Center: an old-fashioned glass phone booth glowing pale cyan, a corded phone and a thick phone book on a small shelf inside. Right: an empty patch of wet sidewalk for a street musician; behind it in the back wall a low riveted steel hatch standing half open, the rusty tail fin of a crashed hovercraft wedged between the buildings above it. Small white paper origami unicorn lying in a puddle at the front edge. Background: stacked skyscrapers with blank neon signs, flying cars as tiny lights. RIGHT HALF: The same street continuing. Left: a dripping shop awning over a dry strip of sidewalk, a giant blank neon billboard shaped like a pizza slice above it. Center: a narrow dark alley entrance between two buildings with a faint green pharmacy glow at its far end. Right edge: the street sloping down into a low concrete underpass toward a round steel door far in the back. A steaming street grate in the floor, puddles reflecting magenta and cyan neon.
PALETTE: rainy night cyberpunk palette of deep navy and wet asphalt grey, bright accents only in two neon magenta and two neon cyan tones, wet reflective streets, neon reflections in puddles, rising steam. Color anchors, approximate: deep navy #181425, wet asphalt #262b44, concrete grey #3a4466, neon magenta #ff4fd8 and #b0207a, neon cyan #3ff7ff and #0099db.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

## Apothekengasse mit Pastillenautomat

**Shot W3-R02**

**Zustände:** Fächer zu und offen (je eine Dose rot und blau)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Dark narrow alley behind a pharmacy at night, front view with gentle depth. Center: a tall glowing pharmacy vending machine with a big round scanner lens at head height, a glowing green pharmacy cross on top and two small output trays side by side at waist height, one framed in red light, one in blue, both closed. Left: stacked wooden crates and a dripping pipe on the wall; exit back to the street at the left edge. Right: a flickering wall lamp over a wet brick wall, dead end. Walkway: a clear strip of wet cobblestones in front of the machine. Rain, puddles reflecting the machine's light.
PALETTE: rainy night cyberpunk palette of deep navy and wet asphalt grey, bright accents only in two neon magenta and two neon cyan tones, wet reflective streets, neon reflections in puddles, rising steam. Color anchors, approximate: deep navy #181425, wet asphalt #262b44, concrete grey #3a4466, neon magenta #ff4fd8 and #b0207a, neon cyan #3ff7ff and #0099db.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Both trays open, in each a small flat round tin with a green cross on the lid, one red, one blue.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Widerstandsbasis

**Shot W3-R03**

**Zustände:** Fenster zu und offen; Tasse auf dem Tisch und Kaffee am Boden. 1280×360, linke und rechte Hälfte einzeln erzeugen (je Hälfte den Satzteil LEFT HALF oder RIGHT HALF mit dem Anfang des Motivs)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF: Inside the rusty hull of a crashed hovercraft turned into a hideout, front view with gentle depth, curved riveted hull plates as back wall. Far left edge: an open riveted hull hatch with neon light outside, the exit to the street. Left: a row of four sleeping pods with glass lids, a round hatch window in the ceiling directly above the first pod; beside them a patch panel with three sockets, red with a circle, green with a triangle, yellow with a square, three loose cable plugs hanging below with small tags showing a circle, a triangle and a square, cables running to the pods. Center: an old bulky computer terminal with a green screen and a tiny keyboard on a metal desk. Right: a fuse box with three big switches and blank sticker labels; above it a faded advertising poster of a white stand mixer wearing a floral apron, blank text area. RIGHT HALF: The same hideout continuing. Left: the ship's old cockpit console with a hundred small switches and no screen, next to a tall mainframe cabinet with two tape reels and a round yellow lamp. Center: a small metal table with a dirty white coffee mug standing right at its edge, a stack of greasy pizza boxes up to the ceiling, a towel on a wall hook. Right: an open square ventilation shaft at floor height, cat-sized, and an empty cluttered corner with oil stains on the floor. Dim blue light, neon leaking through cracks.
PALETTE: dim cyberpunk interior palette of deep navy and concrete grey, bright accents only in neon magenta and neon cyan from screens and tubes, damp walls, a few drips, no street, no sky. Color anchors, approximate: deep navy #181425, concrete grey #3a4466, damp blue-grey #5a6988, neon magenta #ff4fd8, neon cyan #3ff7ff.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The ceiling window open, snow drifting onto the first pod.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: No mug on the table, a trail of thick black coffee on the floor running into the corner.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Kühlung (Ende des Lüftungsschachts)

**Shot W3-R04**

**Zustände:** Eimer voll und ausgekippt

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A cramped cooling room behind the hideout's ventilation shaft, front view with gentle depth, low ceiling. Left: the square vent opening at floor height where the shaft ends. Center: a large humming cooling unit with frosted pipes, valves and a blinking status light. Right: a metal bucket full of water next to the unit and a forgotten mop leaning on the wall. Floor clear for a cat. Dim blue light, condensation dripping from the pipes.
PALETTE: dim cyberpunk interior palette of deep navy and concrete grey, bright accents only in neon magenta and neon cyan from screens and tubes, damp walls, a few drips, no street, no sky. Color anchors, approximate: deep navy #181425, concrete grey #3a4466, damp blue-grey #5a6988, neon magenta #ff4fd8, neon cyan #3ff7ff.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The bucket tipped over, water running down the cooling unit, small clouds of steam rising.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Laboreingang

**Shot W3-R05**

**Zustände:** Tür zu und offen

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Underground concrete passage below the city, front view with gentle depth. Center: a heavy round steel blast door set into the back wall, closed. Right of the door: a wall-mounted card reader with a small red light. Left: a mop bucket full of clean water and a corkboard covered in pinned charts and blank result sheets; exit back up to the street at the left edge. Yellow-black warning stripes along the back of the floor, the front kept clear and wet. A single ceiling lamp, water dripping beside it.
PALETTE: dim cyberpunk interior palette of deep navy and concrete grey, bright accents only in neon magenta and neon cyan from screens and tubes, damp walls, a few drips, no street, no sky. Color anchors, approximate: deep navy #181425, concrete grey #3a4466, damp blue-grey #5a6988, neon magenta #ff4fd8, neon cyan #3ff7ff.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The blast door rolled aside, revealing a small room with a wall of glowing cyan data ports and one thick cable plugged in.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Stadtstraße

**Shot W3-R06**

**Zustände:** Tag und Nacht (Strom der Kapsel aus). 1280×360, linke und rechte Hälfte einzeln erzeugen (je Hälfte den Satzteil LEFT HALF oder RIGHT HALF mit dem Anfang des Motivs)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF: A suspiciously perfect city street on a sunny day, front view with gentle depth. Left: a small wooden bedside table standing alone on the sidewalk with a 1980s clock radio on it, red digits on its display, in front of a narrow, too-clean alley entrance. Center: identical white houses with identical red cars parked in front; the middle house has lace curtains, a front door and a small blank sign beside it. Right: identical round trees and identical street lamps in a perfect row. A long clean sidewalk across the whole floor, no cracks, no gum. Perfect blue sky with one cloud. RIGHT HALF: The same street continuing: more identical trees and red cars on the left; center and right the ground floor of a tall glass office tower with a closed glass entrance door and a small grey plate beside it. Clean sidewalk continues for the black cat's walk. The same cloud repeated twice more.
PALETTE: overly clean daytime city palette with a faint green tint, flat perfect blue sky, even shadowless-looking light, no dirt anywhere, slightly too symmetrical. Color anchors, approximate: clean grey #c0cbdc, white #ffffff, flat sky blue #0099db, faint green tint #63c74d, soft green shadow #3e8948.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The same street at night, dark blue sky, street lamps on, windows dark.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Küche der Orakel-Oma

**Shot W3-R07**

**Zustände:** Sparschwein auf dem Regal; Sparschwein weg, Scherben am Boden

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A homely retro kitchen, front view with gentle depth. Left: an old cream enamel oven with a window, a tray of round golden cookies inside, warm glow; a dustpan and broom leaning beside it, the broom turned toward the room. Center: a wooden table with an empty plate, a teapot, a single straight silver fork and a thick open appliance manual showing a drawing of a stand mixer. Right: a high wall shelf with a blue ceramic piggy bank, a small radio and three jars with blank labels; below it a small side shelf with a wind-up kitchen timer shaped like a white hen, next to the front door at the right edge. Back wall: floral wallpaper, a window with lace curtains, a cuckoo clock. Warm light.
PALETTE: overly clean interior palette with a faint green tint, even shadowless-looking light, no dirt anywhere, slightly too symmetrical, no sky. Color anchors, approximate: clean grey #c0cbdc, white #ffffff, faint green tint #63c74d, pale wood #e4a672.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The shelf without the piggy bank, blue shards on the floor below it.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Büroturm, 50. Stock

**Shot W3-R08**

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: An endless office corridor on the 50th floor, front view with gentle depth, the back wall lined with identical grey doors, identical potted plants between them. Left: a closed elevator door and a window that shows only more of the same corridor outside. Center: three wide stripes painted on the wall at eye height, red, green and yellow, each with one large black symbol: circle on red, triangle on green, square on yellow; below them a small old computer terminal with a green screen on a side table. Right: a large grey office photocopier with an open output tray, a water cooler with a big bubble bottle and a staircase that ends in the ceiling. Floor clear and long for a crowd of clones. Cold flat fluorescent light.
PALETTE: overly clean interior palette with a faint green tint, even shadowless-looking light, no dirt anywhere, slightly too symmetrical, no sky. Color anchors, approximate: clean grey #c0cbdc, white #ffffff, faint green tint #63c74d, pale wood #e4a672.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Testkammer 1

**Shot W3-R09**

**Zustände:** Ausgangstür zu und offen (das Portalgerät hängt als eigenes Sprite aus dem Labor-Sammelbild in der Halterung)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A bright white test chamber built from identical square wall panels, front view with gentle depth. Left: the entrance and an empty white wall mount for a handheld device. Center: a large round red floor button set flush into the floor. Right: a closed sliding exit door. A small round speaker in the ceiling. Right corner: a cardboard cake with a painted candle.
PALETTE: sterile palette of white panels, light grey and soft orange warning stripes, cold even light, only short soft shadows to the lower right. Color anchors, approximate: white panels #ffffff, light grey #c0cbdc, cold grey #8b9bb4, warning orange #f77622.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The exit door slid open.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Testkammer 2

**Shot W3-R10**

**Zustände:** Laser tödlich (rot) und harmlos (blassrosa); das Gummihuhn steht als eigenes Sprite aus dem Labor-Sammelbild auf dem Sockel

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: The same white test chamber, same framing and panels. Center: a horizontal red laser beam across the room at chest height between two wall emitters. Left: a small empty white pedestal. Lower right: hasty black marker scribbles on one panel near the floor, unreadable, with one small neat block of print beside them. Right: closed exit door.
PALETTE: sterile palette of white panels, light grey and soft orange warning stripes, cold even light, only short soft shadows to the lower right. Color anchors, approximate: white panels #ffffff, light grey #c0cbdc, cold grey #8b9bb4, warning orange #f77622.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The laser beam pale pink and wobbly.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Testkammer 3

**Shot W3-R11**

**Zustände:** Tür zu und offen

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: The same white test chamber, same framing. Right: a large exit door with a big padlock symbol, in front of it a narrow floor gap just wide enough for one cube. Next to the door: a big round wall speaker. Left: entrance and an empty spot on the floor for the rubber chicken.
PALETTE: sterile palette of white panels, light grey and soft orange warning stripes, cold even light, only short soft shadows to the lower right. Color anchors, approximate: white panels #ffffff, light grey #c0cbdc, cold grey #8b9bb4, warning orange #f77622.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The exit door wide open.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Kern von M.U.T.T.I.

**Shot W3-R12**

**Zustände:** Zelle glühend; Zelle vereist (bei Lösung B dazu der Effekt Schnee); Sockel leer

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A round white server hall, front view with gentle depth, curved wall with soft orange warning stripes. Center: a white pedestal with an elongated orange energy cell glowing in a socket, heat shimmer above it. Thick cables run along the back of the floor to the pedestal. Upper half of the image kept empty for a huge machine hanging from the ceiling. Left: the entrance door.
PALETTE: sterile palette of white panels, light grey and soft orange warning stripes, cold even light, only short soft shadows to the lower right. Color anchors, approximate: white panels #ffffff, light grey #c0cbdc, cold grey #8b9bb4, warning orange #f77622.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The cell dark grey and frosted, no heat shimmer.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The pedestal empty, cables ending at an empty socket.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Code-Sicht

**Shot W3-R13**

**Zustände:** Als Überlagerung je Szene; die Wörter auf den Etiketten von Hand

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Effect overlay: the same scene redrawn only as glowing green wireframe outlines on pure black, same framing, every hotspot outlined and tagged with a small blank rectangular label, faint scanlines, the labels stay blank, no letters.
PALETTE: overly clean daytime city palette with a faint green tint, flat perfect blue sky, even shadowless-looking light, no dirt anywhere, slightly too symmetrical. Color anchors, approximate: clean grey #c0cbdc, white #ffffff, flat sky blue #0099db, faint green tint #63c74d, soft green shadow #3e8948.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

# Figuren

Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Gebraucht wird nur die
Seitenansicht nach rechts; Gehen und Reden entstehen per Code (`tools/figur.py`). Zweite Fassungen
entstehen mit Maske aus dem fertigen Bild.

## M.U.T.T.I.

**Shot W3-F01**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: M.U.T.T.I., a huge AI machine about 180 percent of the boy Max's height hanging from the ceiling: a giant white kitchen stand mixer mounted upside down on a thick ceiling arm. One round lens eye glowing soft orange in the mixer head, two pink hair-curler-shaped antennas on top, a floral apron pattern painted on the white casing, a steel whisk attachment as a chin. Strict but caring look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Eye dark, antennas drooping, sunk a little lower. No robotic arm body, no yellow eye, no human face.
KEEP: everything outside that area stays pixel-identical: same character, pose, proportions, face, colors, line weight and the flat magenta background. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Morphäus

**Shot W3-F02**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Morphäus, a calm tall man about 106 percent of the boy Max's height, short red hair, neat red beard, reading glasses pushed up on his forehead. Chunky oatmeal knitted cardigan over a dark green turtleneck, brown corduroy trousers, brown shoes. A small cardboard sign with blank lines in his right hand. Calm neutral standing pose, wise slight smile, facing right. Second pose: shrugging apologetically. No leather coat, no small dark sunglasses, not bald.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Orakel-Oma

**Shot W3-F03**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Orakel-Oma, a cheerful plump short old lady about as tall as the boy Max, grey curls, rosy cheeks, knowing smile. Flowery light blue dress, white apron, fluffy pink slippers, red checkered oven mitts on both hands. Holding a baking tray of round golden cookies in front of her. Neutral standing pose, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Agent Schmidt

**Shot W3-F04**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Agent Schmidt, a stiff upright man about 106 percent of the boy Max's height, neat blond flat-top haircut, rectangular black sunglasses, thin pressed lips. Brown corduroy suit, white shirt, red bow tie, fuzzy pink slippers instead of shoes, the left slipper slightly askew. A softly glowing green translucent file folder under his left arm. Neutral standing pose, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The same man without sunglasses and without the folder, small uncertain eyes, shoulders sunk. No black suit, no earpiece, no necktie.
KEEP: everything outside that area stays pixel-identical: same character, pose, proportions, face, colors, line weight and the flat magenta background. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Schmidt-Klon

**Shot W3-F05**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: The same stiff man about 106 percent of the boy Max's height, blond flat-top, rectangular black sunglasses, brown corduroy suit, red bow tie and fuzzy pink slippers, both slippers straight, holding a plain white coffee mug instead of a folder, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Roboter-Hausmeister

**Shot W3-F06**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Hausmeister Modell 08/15, a bulky boxy retro robot about 104 percent of the boy Max's height, dented light grey metal body, square head with one round yellow eye light and a small speaker grille mouth. Faded blue janitor overalls over the metal body, a small empty oil can in the chest pocket, a blank name plate on the chest. A mop in its right hand. Polite slight bow, facing right. No red eye, no metal skull face, no leather jacket, no sunglasses.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Detektiv Deckert

**Shot W3-F07**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Detektiv Deckert, a weary middle-aged detective about 106 percent of the boy Max's height, stubbly chin, tired droopy eyes. Long beige trench coat, grey wide-brimmed hat with rain dripping from the brim, dark trousers. A small notepad in his left hand, a pencil-sized flashlight in his right. Neutral standing pose, testing stare, facing right. No gun, no dark long coat with high collar, not a likeness of any actor.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Herr Vier

**Shot W3-F08**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Herr Vier, a short stocky serious noodle cook about as tall as the boy Max, black hair under a white cook's cap, small black moustache. White cook's jacket, white apron, white gloves with exactly four fingers each, clearly visible. A big ladle in his right hand. Standing upright, serious face, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Kabel-Kalle

**Shot W3-F09**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Kabel-Kalle, a skinny cheerful tech nerd about 104 percent of the boy Max's height, thick round glasses, messy black hair, a headset with a microphone. Mustard-yellow work vest over a striped shirt, several colorful cables wrapped around his neck like scarves, grey cargo trousers, sneakers. A screwdriver clamped in his mouth, a battered laptop under his left arm. Grinning, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Bernd

**Shot W3-F10**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Bernd, a grey metal cube about 29 percent of the boy Max's height with simple panel seams, a pair of big googly eyes and a yellow smiley face sticker on the front, floating two pixels above the ground with a small shadow below, slightly sulky look, facing right. No hearts, no pink, no round panels.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Rebellin

**Shot W3-F11**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A scruffy resistance woman about 104 percent of the boy Max's height, short spiky purple hair, black sunglasses. Black leather jacket with colorful square patches, grey cargo trousers, heavy boots. Eating noodles from a paper carton with chopsticks. Neutral standing pose, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Rebell

**Shot W3-F12**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A scruffy resistance man about 106 percent of the boy Max's height, red knitted beanie, black sunglasses, short brown beard. Black leather jacket with colorful square patches, a toolbelt with wrenches, dark jeans, boots. Holding a noodle carton. Neutral standing pose, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Piepsi

**Shot W3-F13**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Piepsi, a small round cleaning robot about 32 percent of the boy Max's height shaped like a dented white bucket on three little wheels, one big round blue lens eye, a tiny antenna with a red tip, a crumpled black bowler hat on top, cheeky look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Rusty brown all over, eye dark, hat squashed, slumped to one side.
KEEP: everything outside that area stays pixel-identical: same character, pose, proportions, face, colors, line weight and the flat magenta background. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Opa als Hologramm

**Shot W3-F14**

**Anhängen:** Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
SUBJECT: A tiny translucent blue hologram about 43 percent of the boy Max's height of Grandpa Konrad: tall thin old man, wild white hair standing up, round goggles pushed up on his forehead, knitted cardigan with bulging pockets, slippers. Kneeling and pleading with raised hands, horizontal scanlines, slight flicker, on top of a cone of light, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Weinender Mann

**Shot W3-F15**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A middle-aged man about 104 percent of the boy Max's height (standing size), thinning hair, rumpled grey raincoat, sitting on a round stool, holding a bowl of noodles and crying loudly into it, tears streaming, mouth wide open, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Frau mit Regenschirm

**Shot W3-F16**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A woman about as tall as the boy Max, black bob haircut, bright yellow raincoat, red rubber boots, holding an inside-out umbrella up and shouting at it angrily, rain dripping, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Straßenmusiker

**Shot W3-F17**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A lonely street musician about 104 percent of the boy Max's height, long grey ponytail, eyes closed, a transparent plastic rain poncho over a dark blue jacket, playing a small synthesizer keyboard on a folding stand in front of him, rain dripping from the poncho, calm devoted face, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Schwarze Katze

**Shot W3-F18**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A sleek pure black cat about 25 percent of the boy Max's height, slim body, yellow-green eyes, no collar, walking calmly in profile with its tail straight up, facing right. Clearly different from Pixel: smaller, slim, all black, no stripes, no collar (bleibt schwarz).
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max als Ente

**Shot W3-F19**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Max as a duck: a yellow duck about 53 percent of the boy Max's height wearing a tiny oversized slate blue-grey hoodie (#3a4466) with a turquoise TV print, a tuft of messy dark brown hair over one eye, tiny red sneakers on its webbed feet, confused look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max in der Kapsel

**Shot W3-F20**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Max lying asleep on his back inside a sleeping pod with a glass lid, about 125 percent as wide as the boy Max is tall, hoodie and sneakers exactly as in the CHARACTER LOCK, slightly drooling smile, three colored cables plugged into the side of the pod, side view, head to the left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The glass lid lifted, Max sitting up and blinking.
KEEP: everything outside that area stays pixel-identical: same character, pose, proportions, face, colors, line weight and the flat magenta background. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

# Bewegungen

Schlüsselposen für Animationen, die im Spiel noch fehlen. Das Blatt anhängen, das beim Block steht.
Die Zeitmarken gelten für etwa 10 Bilder pro Sekunde; Zwischenbilder, Timing und Schleife baut Claude
in Aseprite oder aus dem 3D-Clip. Eine misslungene Pose wird mit Maske nachgebessert.

## M.U.T.T.I.: Sprechen

**Shot W3-B01**

**Anhängen:** das fertige Konzeptblatt von M.U.T.T.I. · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): M.U.T.T.I., a huge AI machine about 180 percent of the boy Max's height hanging from the ceiling: a giant white kitchen stand mixer mounted upside down on a thick ceiling arm. One round lens eye glowing soft orange in the mixer head, two pink hair-curler-shaped antennas on top, a floral apron pattern painted on the white casing, a steel whisk attachment as a chin. Strict but caring look, facing right.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: M.U.T.T.I. talking: the orange lens eye pulses brighter and dimmer; (2) 0.2 s: the whisk chin wobbles up and down.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: casing and antennas stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## M.U.T.T.I.: Herunterfahren

**Shot W3-B02**

**Anhängen:** das fertige Konzeptblatt von M.U.T.T.I. · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): M.U.T.T.I., a huge AI machine about 180 percent of the boy Max's height hanging from the ceiling: a giant white kitchen stand mixer mounted upside down on a thick ceiling arm. One round lens eye glowing soft orange in the mixer head, two pink hair-curler-shaped antennas on top, a floral apron pattern painted on the white casing, a steel whisk attachment as a chin. Strict but caring look, facing right.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: M.U.T.T.I. shutting down: the orange eye flickers and dims to dark; (2) 0.3 s: the curler antennas droop; (3) 0.5 s: the machine sinks a few pixels on its ceiling arm; (4) 0.8 s: a small puff of steam escapes.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose (ends on the dark version).
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Agent Schmidt: Kopieren

**Shot W3-B03**

**Anhängen:** nichts (Effekt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Agent Schmidt in brown corduroy suit, red bow tie and pink slippers lays one hand on a grey office photocopier, a white flash runs under the lid, an identical copy of him slides out of the output tray and stands up, 192x128, 8 frames, plays once, over the office corridor.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, plays once, each frame 192x128 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Max: Zeitlupen-Ausweichen

**Shot W3-B04**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 10 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (4 key poses for a 10-frame animation of about 1.0 s; Claude draws the in-between frames): (1) 0.0 s: Max dodges in slow motion: leans far backwards; (2) 0.3 s: arms circling; (3) 0.7 s: hangs at the lowest point; (4) 1.0 s: straightens halfway and freezes holding his lower back with a pained face.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Pastille schlucken

**Shot W3-B05**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Max takes a shiny red lozenge from a small red tin with a green cross, holds it up; (2) 0.3 s: pops it into his mouth; (3) 0.6 s: swallows, eyes go wide.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: legs stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Code-Sicht einschalten

**Shot W3-B06**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: just starting: Max squints hard with two fingers pressed to his temple while thin green code lines flicker over his body and fade; (2) 0.4 s: the same action completed.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: legs stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Kabel umstecken

**Shot W3-B07**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Pixel grabs a cable at a patch panel with his teeth; (2) 0.3 s: pulls it out; (3) 0.6 s: carries it one step and pushes it into another socket.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: hind legs stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Miau-Morse

**Shot W3-B08**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Pixel sits on a desk and taps a keyboard with one front paw, mouth opening for a meow on each tap, turquoise collar light blinking, at one end of the movement; (2) 0.2 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: body and tail stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Schacht kriechen

**Shot W3-B09**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
MANNER (applies to every pose): Pixel crawls flat on his belly through a narrow metal vent, front paws pulling, hind legs pushing, ears flat.
ACTION (4 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.1 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.3 s: contact pose with the other foot in front, legs widest apart; (4) 0.4 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Ohrfeige

**Shot W3-B10**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Pixel leaps up at Max lying on the sofa; (2) 0.3 s: slaps him across the face with one front paw; (3) 0.6 s: lands again with a smug face.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Roboter-Hausmeister: Wischen

**Shot W3-B11**

**Anhängen:** das fertige Konzeptblatt von Roboter-Hausmeister · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Hausmeister Modell 08/15, a bulky boxy retro robot about 104 percent of the boy Max's height, dented light grey metal body, square head with one round yellow eye light and a small speaker grille mouth. Faded blue janitor overalls over the metal body, a small empty oil can in the chest pocket, a blank name plate on the chest. A mop in its right hand. Polite slight bow, facing right. No red eye, no metal skull face, no leather jacket, no sunglasses.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Hausmeister Modell 08/15 mops the floor in slow circles; (2) 0.3 s: the mop head moving in a round path in front of him, upper body swaying slightly, yellow eye blinking once.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Herr Vier: Weinend kochen

**Shot W3-B12**

**Anhängen:** das fertige Konzeptblatt von Herr Vier · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Herr Vier, a short stocky serious noodle cook about as tall as the boy Max, black hair under a white cook's cap, small black moustache. White cook's jacket, white apron, white gloves with exactly four fingers each, clearly visible. A big ladle in his right hand. Standing upright, serious face, facing right.
MANNER (applies to every pose): Herr Vier stirs a big steaming pot with his ladle while streams of tears run from his eyes into the pot.
ACTION (4 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.1 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.3 s: contact pose with the other foot in front, legs widest apart; (4) 0.4 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: legs stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Bernd: Beleidigt davonschweben

**Shot W3-B13**

**Anhängen:** das fertige Konzeptblatt von Bernd · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Bernd, a grey metal cube about 29 percent of the boy Max's height with simple panel seams, a pair of big googly eyes and a yellow smiley face sticker on the front, floating two pixels above the ground with a small shadow below, slightly sulky look, facing right. No hearts, no pink, no round panels.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Bernd rolls his googly eyes upward; (2) 0.6 s: turns his face away and floats slowly up and off to the right.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, starts facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schwarze Katze: Zweimal vorbeilaufen

**Shot W3-B14**

**Anhängen:** das fertige Konzeptblatt von Schwarze Katze · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A sleek pure black cat about 25 percent of the boy Max's height, slim body, yellow-green eyes, no collar, walking calmly in profile with its tail straight up, facing right. Clearly different from Pixel: smaller, slim, all black, no stripes, no collar (bleibt schwarz).
MANNER (applies to every pose): The black cat walks calmly with its tail straight up, same paw first in every cycle.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Verwandlung: Effekt

**Shot W3-B15**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A short green digital glitch of square pixels flickering around an inventory item and dissolving, 64x64, 6 frames, plays once, over the inventory slot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Portal: Effekt

**Shot W3-B16**

**Anhängen:** nichts (Effekt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A round shimmering white-green hole opens in a white wall, shows a cozy living room with an old man on a brown sofa holding a teacup, then shrinks shut, 96x128, 8 frames, plays once, over Testkammer 1.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, plays once, each frame 96x128 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Max als Ente: Watscheln

**Shot W3-B17**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
MANNER (applies to every pose): Max as a duck in his slate blue-grey hoodie waddles in place, rocking from side to side, beak opening for a quack.
ACTION (4 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.1 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.3 s: contact pose with the other foot in front, legs widest apart; (4) 0.4 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Regen: Effekt

**Shot W3-B18**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Thin pale cyan rain streaks falling diagonally from upper left to lower right, small splashes on the floor, 640x360 tileable, 4 frames, loops, over the Unterstadt and over simulation rooms when Pixel floods the cooling.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 640x360 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Schnee: Effekt

**Shot W3-B19**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Soft white snowflakes of one or two pixels drifting slowly down, 640x360 tileable, 4 frames, loops, over the Kern and simulation rooms while the window is open, and below the open window in the base.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 640x360 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Pixel: Tasse vom Tisch werfen

**Shot W3-B20**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Pixel sits on a table; (2) 0.3 s: stares straight at the viewer and slowly pushes a white coffee mug over the edge with one paw; (3) 0.6 s: the mug tips and drops out of frame.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: head turned to the viewer.
CAMERA: static, strict side view, body facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Piepsi: Hochfahren

**Shot W3-B21**

**Anhängen:** das fertige Konzeptblatt von Piepsi · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Piepsi, a small round cleaning robot about 32 percent of the boy Max's height shaped like a dented white bucket on three little wheels, one big round blue lens eye, a tiny antenna with a red tip, a crumpled black bowler hat on top, cheeky look, facing right.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: Piepsi, starting from the rusty version; (2) 0.3 s: shakes off rust flakes; (3) 0.5 s: straightens up on his three wheels; (4) 0.8 s: his blue eye lights up and his bowler hat pops up.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Piepsi: Piepen

**Shot W3-B22**

**Anhängen:** das fertige Konzeptblatt von Piepsi · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Piepsi, a small round cleaning robot about 32 percent of the boy Max's height shaped like a dented white bucket on three little wheels, one big round blue lens eye, a tiny antenna with a red tip, a crumpled black bowler hat on top, cheeky look, facing right.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Piepsi wobbles from side to side on his wheels, antenna tip blinking red, blue eye flashing angrily, at one end of the movement; (2) 0.2 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Hologramm: Effekt

**Shot W3-B23**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A cone of flickering blue light with horizontal scanlines projected upward from a small lens on top of Piepsi, 64x96, 6 frames, loops, in the base below Grandpa's hologram.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 64x96 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Max: Gedankentrick

**Shot W3-B24**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Max slowly waves one open hand sideways in front of him at chest height with a serious, mystical face; (2) 0.4 s: lowers it.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: legs stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

# Gegenstände

Je Sammelbild den Block komplett in Gemini kopieren und Max' Konzeptblatt als Stilvorlage
anhängen, keine Skizze. Umrechnen mit `tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.

## Verwandlung (2×4)

**Shot W3-G01**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x4 grid, each simulation item directly left of its reality form, same scale: a cream recipe card with neat blank handwriting lines \| a golden fortune cookie with a white paper slip sticking out; a glowing green digital file icon \| a thick brown paper folder with a metal clip and a blank red round stamp mark; a glowing green key built from code symbols \| a white plastic key card with a magnetic stripe; a small brown paper cookie bag, open at the top, full of round pale cinnamon cookies \| the same paper bag full of bone-shaped dog biscuits.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Kekse-Zustände (1×2)

**Shot W3-G02**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, same small brown paper cookie bag both times: the bag with round cookies, pale, dull and dry; the same bag with golden oven-warm cookies and a little steam.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Unterstadt (2×3)

**Shot W3-G03**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x3 grid, same scale: a small flat round red pharmacy tin with a green cross on the lid, open, one shiny red lozenge inside; the same tin in blue with one blue lozenge; a plain white office coffee mug; a torn phone book page with blank columns; a small paper slip with three stripes, red with circle, green with triangle, yellow with square; a laminated sheet with a table of cat paw symbols.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Labor (1×5)

**Shot W3-G04**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x5 grid, same scale: a white handheld science gadget with an orange tip and a small red empty-battery light; a yellow rubber chicken; the same yellow rubber chicken with a faint red glow around it; an elongated orange energy cell shaped like an oversized battery, glowing; the same cell dark grey and covered in frost.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Omas Sparschwein (1×3, Szenen-Sprites für Rätsel 4, kein Inventar)

**Shot W3-G05**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x3 grid: a blue ceramic piggy bank with a white flower pattern and a coin slot; a small rolled recipe slip tied with string; a small heap of blue ceramic shards.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Locher (1×2, Szenen-Sprites für das Zeitlupen-Ausweichen im Büroturm, kein Inventar)

**Shot W3-G06**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid: a grey metal office hole punch, side view; a small puff of round white paper confetti dots.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Deko Welt 3 (3×3)

**Shot W3-G07**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x3 grid, same scale: a perfectly straight silver fork; a stack of greasy pizza boxes; a cardboard cake with a painted candle; a corkboard with pinned charts; a white paper origami unicorn; a towel on a wall hook; a small synthesizer keyboard on a folding stand; a bulky old mainframe cabinet with two tape reels and a round yellow lamp; a wooden cuckoo clock with its little door open and a small bird.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```
