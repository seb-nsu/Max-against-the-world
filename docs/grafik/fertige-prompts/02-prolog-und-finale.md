# Fertige Prompts: Prolog und Finale

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../02-prolog-und-finale.md` (dort ändern, nicht hier).

**Stand:** Der Prolog ist erzeugt. Offen sind die Finale-Räume, die Figuren außer Max, Pixel und Opa, die Bewegungen und ein Teil der Gegenstände.

Räume: je Szene den Block komplett in ChatGPT oder Gemini kopieren und die Layout-Skizze als
Bild anhängen. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene).

**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):
erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist
ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein
MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und
Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus
`01-figurenboegen.md` anhängen, sobald er freigegeben ist.

# Shotliste

42 Shots, davon 15 sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:
R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.

| Shot | Bild | Stand |
| --- | --- | --- |
| PF-R01 | Dachboden | im Spiel |
| PF-R02 | Dachboden, Finale | offen |
| PF-R03 | Wohnzimmer | im Spiel |
| PF-R04 | Wohnzimmer, Geburtstag | offen |
| PF-R05 | Treppenhaus | im Spiel |
| PF-R06 | Supermarkt | offen |
| PF-F01 | Max | im Spiel |
| PF-F02 | Pixel | im Spiel |
| PF-F03 | Pixel, schlafend | offen |
| PF-F04 | Opa Konrad | im Spiel |
| PF-F05 | Opa auf dem Sofa | offen |
| PF-F06 | Oma | offen |
| PF-F07 | Mutter | offen |
| PF-F08 | Max mit Drachenei | offen |
| PF-F09 | Max mit Pharaonenkorn | offen |
| PF-F10 | Max mit Energiezelle | offen |
| PF-F11 | Max mit Goldener Fernbedienung | offen |
| PF-F12 | Opa mit Zündkapsel | offen |
| PF-F13 | Oma mit Gabel | offen |
| PF-F14 | Zeldina, Finale | offen |
| PF-F15 | Pixel auf dem Schrank | offen |
| PF-B01 | Pixel: Aufwachen vom Thunfisch | – |
| PF-B02 | Opa: Erklären | – |
| PF-B03 | Opa: Panik | – |
| PF-B04 | Oma: Treppe steigen | – |
| PF-B05 | Mutter: Liste lesen | – |
| PF-B06 | Zeldina: Zauberstab einsetzen | – |
| PF-B07 | Roboter-Hausmeister: Ofentür halten | – |
| PF-B08 | Gegenwart-Effekt: Verwandlung | – |
| PF-B09 | Effekt: Maschine läuft | – |
| PF-B10 | Effekt: Teig-Schwall | – |
| PF-B11 | Effekt: Staubwolke | – |
| PF-G01 | Prolog (1×7) | – |
| PF-G02 | Gegenwart (2×4) | – |
| PF-G03 | Deko Opas Haus (3×4) | – |
| PF-G04 | Zapp-O-Mat 3000 | – |
| PF-G05 | Einsaug-Effekt | – |
| PF-G06 | Werkbank-Ablage | – |
| PF-G07 | Kalenderkreis | – |
| PF-G08 | Dachlampe | – |
| PF-G09 | Fundkiste | – |
| PF-G10 | Werbeblock | – |

# Räume

## Dachboden

**Shot PF-R01**

**Zustände:** Ein Grundbild, vier Lichtstimmungen: Nachmittag (Prolog); später Nachmittag, Licht steht noch hoch (Rückkehr 1); früher Abend, Licht flacher und wärmer, Lampe aus (Rückkehr 2); Abendrot, Lampe an (Rückkehr 3). Die Nacht steht in der Zeile Finale. Die drei Rückkehr-Stimmungen entstehen per Umfärben aus dem Grundbild mit `tools/stimmung.py` (erledigt 10. November 2026, im Spiel je Zwischenspiel); nur was neu ins Bild kommt (Mond, Maschine), braucht Gemini Bild-zu-Bild. Kalenderkreis: Der einfache Kreis ist ins Bild gemalt. Ab Rückkehr 2 doppelt, ab Rückkehr 3 mit Ausrufezeichen, beides als Sprite über dem Kalender (Objekt Kalenderkreis unten). Die Lampe ist im Grundbild aus und geht ab Rückkehr 3 als Sprite an (Objekt Dachlampe unten); im Grundbild ist sie seit dem 14. November 2026 ausgemalt, Rückkehr 3 rechnet sie mit `tools/stimmung.py --lampe 326,56` wieder an. Der Sonnenstrahl wird je Stimmung flacher (Prompts unten); die gerechneten Stimmungen aus `tools/stimmung.py` ändern nur die Farbe, nicht den Winkel. Auf der Werkbank wächst die Reihe der Artefakte (Objekt Werkbank-Ablage)

**Layout-Skizze:** [Dachboden](../skizzen/prolog/dachboden.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Attic of an eccentric inventor grandfather on a sunny afternoon, plank gable wall seen straight on, sloping roof sides leaning in from the upper corners to a ridge beam at the top center. Left: stacked cardboard boxes at the edge, a workbench with tools, copper wire and gadgets, a free spot at its right end, an open red metal toolbox on the floor below, a shelf above holding a record player, a toaster and an old cookbook, a small square window high at upper left with a dusty sunbeam falling to the lower right. Center: empty floor space against the back wall for a TV cart, a black extension cord running left across the floor to a wall socket, a bare bulb lamp with an enamel shade hanging from the ridge beam, switched off. Right: a blank paper wall calendar with one day circled in thick red, a worn green wingback armchair against the wall below it, a tall wooden wardrobe with one door ajar at the right edge. Painted into the background: a pinned travel poster, a stuffed fish on a plaque, a homemade vacuum cleaner prototype, a cardboard box of old TV remotes and a second box for found things at the stack of boxes. Wide plank floor receding gently toward the back wall, kept clear, a square floor hatch with an iron ring handle near the front right.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Dachboden, Finale

**Shot PF-R02**

**Zustände:** Nacht, Lampe an, Mond im Dachfenster; zwei Zustände im selben Prompt: Maschine läuft (Luke verriegelt; nach Zeldinas Hebeln ist der Riegel als Sprite-Wechsel zurückgeschoben, die Luke bleibt durch den Teig-Überdruck trotzdem zu, Druckmesser im Roten) und Maschine steht (Ofentür offen, Riegel zurück). Blinken und Dampf als Effekt Maschine läuft

**Layout-Skizze:** [Dachboden](../skizzen/prolog/dachboden.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: The same attic at night, same framing and layout, bulb lamp switched on, a full moon in the small window at upper left. Center, where the TV cart stood: a huge homemade baking machine of copper pipes and riveted metal, about 80 percent of the image height, taller than a standing adult, with two round empty sockets side by side at chest height (left for an egg, right for flour), a small antenna dish on top that receives a remote control, a pressure gauge with the needle in the red, rows of small lamps, and a small oven door with a round window at hip height showing rising chocolate dough. Steam and smoke curl upward. Empty floor space left of the machine beside the workbench. Front right: the floor hatch closed by a heavy iron bolt with a red lamp. Strong orange glow from the machine, cold blue moonlight from the window. Second image, same framing: the machine switched off, lamps dark, gauge needle in the green, oven door swung open showing a lopsided chocolate cake, the bolt pulled back, red lamp off, last wisps of steam.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Wohnzimmer

**Shot PF-R03**

**Zustände:** Nachmittag (Prolog Szene 1; Welt 3 Sofa-Szene mit weichem Filter und Portal-Gag) und Abend (Welt 4 Lichterkette). Das Grundbild ist der Nachmittag, der Abend entsteht per Bild-zu-Bild (unten). Das vorhandene Bild `w0_bg_wohnzimmer_v01.png` zeigt Abend, hat keinen Staubrand, einen schrägen Fernseher und zu große Möbel: mit diesem Motiv neu erzeugen

**Layout-Skizze:** [Wohnzimmer](../skizzen/prolog/wohnzimmer.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Old-fashioned cozy living room on a bright lazy afternoon, back wall seen straight on. Warm daylight falls in from a window outside the frame at the upper left and lies as a soft bright patch on the carpet, the standing lamp is switched off, no dark corners. Left: a dark wooden cupboard at the edge, only about half the image height, beside it a saggy brown corduroy sofa facing right with a knitted orange blanket. Center: a low wooden coffee table with newspapers, a cold cup of tea, and clearly visible on the table top an empty spot with a pale rectangular dust outline the size of a remote control. Right: an old tube television on a low wooden cabinet, screen facing the viewer straight on, dark. Back wall: floral green wallpaper in a light, friendly tone, framed family photos with one empty space for a larger frame, a standing lamp with a yellow fabric shade. Exit: open door to the hallway at the far right. Patterned carpet across the lower third kept clear. Furniture at the same scale as the attic scene: a standing adult would be about 52 percent of the image height.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Wohnzimmer, Geburtstag

**Shot PF-R04**

**Zustände:** Variante

**Layout-Skizze:** [Wohnzimmer](../skizzen/prolog/wohnzimmer.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: The same living room in the evening, same framing, decorated for a birthday party: colorful paper garlands pinned across the back wall, balloons tied to the sofa armrest, a lopsided steaming chocolate birthday cake with lit candles on the coffee table, a small pile of wrapped presents next to it, confetti on the carpet, free floor space beside the television for a second TV on a wheeled cart. Warm golden lamp light.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Treppenhaus

**Shot PF-R05**

**Zustände:** Nachmittag (Prolog) und später Abend (Finale, Abspann-Foto 4); nur Fenster und Licht wechseln. Das Grundbild ist der Nachmittag, der Abend entsteht per Bild-zu-Bild (unten). Das vorhandene Bild `w0_bg_treppenhaus_v01.png` zeigt die Nacht und ist damit die Finale-Fassung: die Nachmittags-Fassung mit diesem Motiv neu erzeugen; im Finale liegt über der Lukenöffnung oben die geschlossene Klappe als Sprite

**Layout-Skizze:** [Treppenhaus](../skizzen/prolog/treppenhaus.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Narrow wooden staircase in an old house on a sunny afternoon, seen strictly from the side like a stage. The stairs rise from a small landing at the lower left to an open attic hatch at the top right, steps drawn as an even sawtooth line. Left edge: a doorway down to the living room, coats and an umbrella on wall hooks with one free hook. Center wall: a small window with bright pale-yellow afternoon light and a soft sunbeam falling onto the steps, ceiling lamp switched off. A few cardboard boxes under the stairs. Creaky dark wooden steps, faded striped wallpaper in a warm light tone, no night sky, no stars.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Supermarkt

**Shot PF-R06**

**Zustände:** Später Abend

**Layout-Skizze:** [Supermarkt](../skizzen/finale/supermarkt.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Front of a small neighborhood supermarket late in the evening, shopfront seen straight on and parallel to the picture plane, the sidewalk as open floor with gentle depth in the lower third. Left: a row of red shopping carts. Center: automatic glass sliding doors, behind them a brightly lit aisle leading to a glowing milk fridge at the back. Right: a bicycle rack and a flower stand with buckets of tulips. Free sidewalk space left of the door for a store display. Blank sign above the door. Dark blue night sky with a few stars above the roof, a street lamp, warm light spilling out onto the sidewalk.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

# Figuren

Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Gebraucht wird nur die
Seitenansicht nach rechts; Gehen und Reden entstehen per Code (`tools/figur.py`). Zweite Fassungen
entstehen mit Maske aus dem fertigen Bild.

## Max

**Shot PF-F01**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing relaxed with both hands in his hoodie pocket, weight on one leg, bored half-smile, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Pixel

**Shot PF-F02**

**Anhängen:** Pixels Figurenbogen (sonst sein Konzeptblatt) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
SUBJECT: Sitting upright, chin raised, tail wrapped around his paws, looking bored to the right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Pixel, schlafend

**Shot PF-F03**

**Anhängen:** Pixels Figurenbogen (sonst sein Konzeptblatt) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
SUBJECT: Curled up asleep in side view facing right, about 25 pixels high and 48 long, one paw over his nose, collar light off, flat underside so he can be placed on the extension cord of the background, no cord in the sprite.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Opa Konrad

**Shot PF-F04**

**Anhängen:** Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
SUBJECT: Grandpa Konrad, about 106 percent of the boy Max's height, tall, thin and slightly stooped. Wild white hair (#ffffff) standing up, bushy white eyebrows, round brass goggles (#feae34) pushed up on his forehead, a screwdriver behind his ear. Brown knitted cardigan (#733e39) with many bulging tool pockets, beige trousers (#ead4aa), red-and-white checkered slippers (#e43b44). No lab coat. Standing with one finger raised, enthusiastic grin, facing left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Opa auf dem Sofa

**Shot PF-F05**

**Anhängen:** Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
SUBJECT: Grandpa Konrad, wild white hair, round brass goggles on his forehead, brown knitted cardigan with tool pockets, beige trousers, red-and-white checkered slippers, slumped on a brown corduroy sofa in side view facing right, watching TV, a cup of tea in his right hand, slippers up on the coffee table, surprised raised eyebrows.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Oma

**Shot PF-F06**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Grandma, about as tall as the boy Max, the shortest adult, small and sturdy. Grey hair (#8b9bb4) in a tight bun, round glasses, rosy cheeks. Purple cardigan (#68386c) over a dark green dress (#265c42), black handbag on her left arm, sensible brown shoes (#733e39). Standing straight, eyebrows raised, a stern but loving look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Mutter

**Shot PF-F07**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Max's mother, about 104 percent of the boy Max's height, slim, brown ponytail, tired but friendly eyes. Open dark blue jacket (#262b44) over a green sweater (#3e8948), blue jeans (#124e89), white sneakers. Just home from a late shift, house keys in her right hand, neutral standing pose, facing left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max mit Drachenei

**Shot PF-F08**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing slightly slouched, holding a large golden scaly dragon egg about 29 percent of the boy Max's height in both arms against his chest, tired but a little proud look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max mit Pharaonenkorn

**Shot PF-F09**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing, a bulging golden grain sack with a blank round seal slung over his right shoulder, held with both hands, a little sand trickling from his sneakers, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max mit Energiezelle

**Shot PF-F10**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing more upright, hoodie and hair still wet with a few drips, holding a glowing orange energy cell the size of a thermos flask in both hands at chest height, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max mit Goldener Fernbedienung

**Shot PF-F11**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Max standing upright, shoulders back, a gleaming golden remote with jewel buttons in his right hand held at hip height, left hand loose, calm look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Opa mit Zündkapsel

**Shot PF-F12**

**Anhängen:** Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
SUBJECT: Grandpa Konrad holding a worn grey TV remote high above his head in his right hand like a sword, left fist clenched, triumphant wide grin, goggles on his forehead, facing left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Oma mit Gabel

**Shot PF-F13**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Grandma standing straight, a small cake fork raised in her right hand with a bite of chocolate cake on it, handbag still on her left arm, one eyebrow raised, tasting with a doubtful look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zeldina, Finale

**Shot PF-F14**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Zeldina: young athletic princess, short brown hair, freckles, a small golden crown tied on with string, rust-orange travel cape over a brown leather vest and a cream shirt, dark brown trousers, sturdy boots, no moving box; a black crooked wand in her right hand, standing upright, facing right, determined grin.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Pixel auf dem Schrank

**Shot PF-F15**

**Anhängen:** Pixels Figurenbogen (sonst sein Konzeptblatt) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
SUBJECT: Lying stretched out on his belly in side view facing right, chin on his front paws, one front paw and the fluffy tail dangling down over an edge, smug half-lidded eyes, flat underside so he can be placed on top of the living room cupboard.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

# Bewegungen

Schlüsselposen für Animationen, die im Spiel noch fehlen. Das Blatt anhängen, das beim Block steht.
Die Zeitmarken gelten für etwa 10 Bilder pro Sekunde; Zwischenbilder, Timing und Schleife baut Claude
in Aseprite oder aus dem 3D-Clip. Eine misslungene Pose wird mit Maske nachgebessert.

## Pixel: Aufwachen vom Thunfisch

**Shot PF-B01**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Pixel exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: sleeping Pixel sprite as input.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: asleep on the cord, nose twitches; (2) 0.3 s: eyes snap open, he jumps up onto all fours with fur standing up; (3) 0.6 s: collar light still off.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Opa: Erklären

**Shot PF-B02**

**Anhängen:** Opas Figurenbogen (bis dahin das Opa-Sprite) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Grandpa Konrad exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Grandpa talks excitedly, both hands waving; (2) 0.2 s: goggles bouncing on his forehead, feet stay still.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Opa: Panik

**Shot PF-B03**

**Anhängen:** Opas Figurenbogen (bis dahin das Opa-Sprite) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Grandpa Konrad exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Grandpa flails both arms; (2) 0.2 s: hair stands up even more, sweat drops fly; (3) 0.4 s: he hops from foot to foot.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Oma: Treppe steigen

**Shot PF-B04**

**Anhängen:** das fertige Konzeptblatt von Oma · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Grandma, about as tall as the boy Max, the shortest adult, small and sturdy. Grey hair (#8b9bb4) in a tight bun, round glasses, rosy cheeks. Purple cardigan (#68386c) over a dark green dress (#265c42), black handbag on her left arm, sensible brown shoes (#733e39). Standing straight, eyebrows raised, a stern but loving look, facing right.
ACTION (2 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: Grandma climbs stairs diagonally up to the right in side view; (2) 0.4 s: one hand on her handbag, steady determined steps, same size as her standing sprite.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Mutter: Liste lesen

**Shot PF-B05**

**Anhängen:** das fertige Konzeptblatt von Mutter · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Max's mother, about 104 percent of the boy Max's height, slim, brown ponytail, tired but friendly eyes. Open dark blue jacket (#262b44) over a green sweater (#3e8948), blue jeans (#124e89), white sneakers. Just home from a late shift, house keys in her right hand, neutral standing pose, facing left.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: Max's mother, jacket still on, holds a crumpled small note in both hands and scans it; (2) 0.2 s: eyes moving down, note lowers slightly, rises again, legs stay still.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zeldina: Zauberstab einsetzen

**Shot PF-B06**

**Anhängen:** das fertige Konzeptblatt von Zeldina · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Zeldina: young athletic princess, short brown hair, freckles, a small golden crown tied on with string, rust-orange travel cape over a brown leather vest and a cream shirt, dark brown trousers, sturdy boots, no moving box; a black crooked wand in her right hand, standing upright, facing right, determined grin.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Zeldina jams a black crooked wand into a door bolt and twists it; (2) 0.3 s: sparks fly; (3) 0.6 s: the bolt springs open.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Roboter-Hausmeister: Ofentür halten

**Shot PF-B07**

**Anhängen:** das fertige Konzeptblatt von Roboter-Hausmeister · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: The boxy robot presses both hands against an oven door at hip height, leaning in; (2) 0.2 s: small sparks from his joints, steam escaping at the edges, feet stay planted.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gegenwart-Effekt: Verwandlung

**Shot PF-B08**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A puff of glitter and a soft pop, 64x64, when a legendary artifact turns into an everyday object.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Effekt: Maschine läuft

**Shot PF-B09**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Overlay for the finale machine, 4 frames at the size of the machine: rows of small lamps blinking red, yellow and green in turn, puffs of steam and grey smoke rising from the copper pipes, transparent background.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Effekt: Teig-Schwall

**Shot PF-B10**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: 6 frames of 96x96, a gush of brown chocolate dough bursting sideways out of a small oven door, splattering and ending in a few drips.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 96x96 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Effekt: Staubwolke

**Shot PF-B11**

**Anhängen:** nichts (Effekt) · **Bilder:** 5 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: 5 frames of 64x64, a small puff of pale flour dust rising from a paper sack and fading.
FRAMES: 5 frames side by side, about 0.5 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

# Gegenstände

Je Sammelbild den Block komplett in Gemini kopieren und Max' Konzeptblatt als Stilvorlage
anhängen, keine Skizze. Umrechnen mit `tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.

## Prolog (1×7)

**Shot PF-G01**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x7 grid: a manual crank can opener with red plastic handles; a plain silver wire coat hanger; the same coat hanger bent into a V-shaped TV antenna like rabbit ears; a vintage brown leather travel bag with three front pockets and brass buckles; a small folded paper note with blank lines; a wide, low white porcelain teacup with a small blue flower pattern on a matching saucer, half full of cold tea; the same teacup on its saucer, empty of tea and filled with pink tuna like a cat bowl.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Gegenwart (2×4)

**Shot PF-G02**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x4 grid: a plain white hen's egg; a small paper flour sack tied at the top with a blank round seal; a single finger-sized AA battery glowing soft orange; a crumpled handwritten note with blank lines; a small folded note with one long blank line; a glass milk bottle with a red cap; a slice of chocolate birthday cake with a candle; a small brown paper cookie bag, folded over at the top, with bone-shaped dog biscuits peeking out.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Deko Opas Haus (3×4)

**Shot PF-G03**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x4 grid, scene props at the same scale as a 189-pixel tall adult character, not inventory icons: a stuffed fish wearing round diving goggles; a cardboard box with half-closed flaps and a few broken TV remotes poking out; the same box with flaps wide open and many remotes sticking up like hungry chicks; a pinned travel poster showing a pyramid on the left half and a neon city skyline on the right half, blank caption strip; a chrome toaster with a small propeller on top; a thick old cookbook lying closed with a folded page corner and a blank cover; the same cookbook lying open at the dog-eared page, one blank line underlined in pencil; a small record player with a vinyl record and a blank sleeve; a framed photo of a stern old woman with grey hair in a bun and a purple cardigan; a beanie hat with a tiny propeller hanging on a wall hook; a cardboard store display with a milk bottle picture and a blank price tag; a bulky 1950s vacuum cleaner prototype with a cracked glass dome, a bent nozzle and a tuft of grey cat fur stuck in it.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Zapp-O-Mat 3000

**Shot PF-G04**

**Hinweis:** GEGENSTÄNDE als Zustandsreihe, 1×7, je 128×128 (Fernseher samt Rolltisch)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x7 grid, same object and position in every cell: an old wooden tube television, screen facing the viewer, a big round channel dial right of the screen, two empty antenna sockets on top, standing on a small wheeled wooden cart, black power cord hanging down to the left. States: screen dark; screen full of grey static snow; grey static with a bent wire coat hanger as antenna on top; the same with colorful static; a swirling colorful vortex on the screen pulling inward; two more frames of grey static with a different noise pattern for a flicker loop.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Einsaug-Effekt

**Shot PF-G05**

**Hinweis:** EFFEKT, 8 Bilder, je 192×192, mittig über dem Bildschirm

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
SUBJECT: 8 frames of 192x192: swirl of colorful light streaks spiraling into a TV screen at the center, growing stronger frame by frame, the last two frames a white flash filling most of the frame.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Werkbank-Ablage

**Shot PF-G06**

**Hinweis:** GEGENSTÄNDE, 3 Zustände, je etwa 96×48

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x3 grid, the same right end of a wooden workbench top in three states side by side, same scale: a folded grey cloth with a cardboard egg carton holding one white egg, a blank strip on the carton lid; the same with a small paper flour sack tied at the top with a blank round seal next to the carton; the same with egg carton, flour sack and a finger-sized battery cell glowing soft orange.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Kalenderkreis

**Shot PF-G07**

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 32×32, liegt als Sprite über dem gemalten Kreis im Kalender und deckt ihn ganz ab

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, the same small square of a paper wall calendar page with blank day cells in two states side by side, same scale: one day circled twice in thick red marker; the same day circled twice with a thick red exclamation mark next to it, pressed so hard that the paper is dented.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Dachlampe

**Shot PF-G08**

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 48×64, liegt als Sprite über der Lampe am Firstbalken

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, the same bare light bulb with an enamel shade hanging on a short cord, same scale: switched off, grey glass; switched on, warm yellow bulb with a soft glow around it.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Fundkiste

**Shot PF-G09**

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 80×64; steht ab Rückkehr 1 auf dem freien Platz am Kistenstapel links, Aufschrift „Fundkiste“ von Hand in Aseprite; im Finale anklickbar (Omas Kekse, falls nicht eingepackt)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, the same open cardboard box with flaps folded outward and a blank paper label taped on the front, seen from the front at eye level, same scale: first almost empty with a single odd item at the bottom; second piled high with a jumble of small odd objects, a wooden bucket handle and a rolled paper sticking out over the rim.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Werbeblock

**Shot PF-G10**

**Hinweis:** EFFEKT, 4 Bilder plus 1 Störbild, 640×360, ohne Farb-Baustein

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
SUBJECT: Full-screen TV commercial frames, 640x360 each, cheap 1990s studio look, flat bright colors, no text: a tall glass of milk with a sparkle on a blue backdrop; a smiling black-and-white cartoon cow (not purple); a big blank price tag; a white flash. Fifth frame: the cow frame torn by horizontal glitch lines.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```
