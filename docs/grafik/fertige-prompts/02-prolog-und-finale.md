# Fertige Konzeptbild-Prompts: Prolog und Finale

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../02-prolog-und-finale.md` (dort ändern, nicht hier).
Je Szene den Block komplett in ChatGPT oder Gemini kopieren und die Layout-Skizze als Bild
anhängen. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene).

## Dachboden

**Zustände:** Ein Grundbild, vier Lichtstimmungen: Nachmittag (Prolog); später Nachmittag, Licht steht noch hoch (Rückkehr 1); früher Abend, Licht flacher und wärmer, Lampe aus (Rückkehr 2); Abendrot, Lampe an (Rückkehr 3). Die Nacht steht in der Zeile Finale. Die drei Rückkehr-Stimmungen entstehen per Umfärben aus dem Grundbild mit `tools/stimmung.py` (erledigt 10. November 2026, im Spiel je Zwischenspiel); nur was neu ins Bild kommt (Mond, Maschine), braucht Gemini Bild-zu-Bild. Kalenderkreis: Der einfache Kreis ist ins Bild gemalt. Ab Rückkehr 2 doppelt, ab Rückkehr 3 mit Ausrufezeichen, beides als Sprite über dem Kalender (Objekt Kalenderkreis unten). Die Lampe ist im Grundbild aus und geht ab Rückkehr 3 als Sprite an (Objekt Dachlampe unten); im freigegebenen Bild leuchtet sie noch und wird beim Einbau des Sprites ausgemalt. Der Sonnenstrahl wird je Stimmung flacher (Prompts unten); die gerechneten Stimmungen aus `tools/stimmung.py` ändern nur die Farbe, nicht den Winkel. Auf der Werkbank wächst die Reihe der Artefakte (Objekt Werkbank-Ablage)

**Layout-Skizze:** [Dachboden](../skizzen/prolog/dachboden.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Attic of an eccentric inventor grandfather on a sunny afternoon, plank gable wall seen straight on, sloping roof sides leaning in from the upper corners to a ridge beam at the top center. Left: stacked cardboard boxes at the edge, a workbench with tools, copper wire and gadgets, a free spot at its right end, an open red metal toolbox on the floor below, a shelf above holding a record player, a toaster and an old cookbook, a small square window high at upper left with a dusty sunbeam falling to the lower right. Center: empty floor space against the back wall for a TV cart, a black extension cord running left across the floor to a wall socket, a bare bulb lamp with an enamel shade hanging from the ridge beam, switched off. Right: a blank paper wall calendar with one day circled in thick red, a worn green wingback armchair against the wall below it, a tall wooden wardrobe with one door ajar at the right edge. Painted into the background: a pinned travel poster, a stuffed fish on a plaque, a homemade vacuum cleaner prototype, a cardboard box of old TV remotes and a second box for found things at the stack of boxes. Wide plank floor receding gently toward the back wall, kept clear, a square floor hatch with an iron ring handle near the front right. warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## Dachboden, Finale

**Zustände:** Nacht, Lampe an, Mond im Dachfenster; zwei Zustände im selben Prompt: Maschine läuft (Luke verriegelt; nach Zeldinas Hebeln ist der Riegel als Sprite-Wechsel zurückgeschoben, die Luke bleibt durch den Teig-Überdruck trotzdem zu, Druckmesser im Roten) und Maschine steht (Ofentür offen, Riegel zurück). Blinken und Dampf als Effekt Maschine läuft

**Layout-Skizze:** [Dachboden](../skizzen/prolog/dachboden.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. The same attic at night, same framing and layout, bulb lamp switched on, a full moon in the small window at upper left. Center, where the TV cart stood: a huge homemade baking machine of copper pipes and riveted metal, about 80 percent of the image height, taller than a standing adult, with two round empty sockets side by side at chest height (left for an egg, right for flour), a small antenna dish on top that receives a remote control, a pressure gauge with the needle in the red, rows of small lamps, and a small oven door with a round window at hip height showing rising chocolate dough. Steam and smoke curl upward. Empty floor space left of the machine beside the workbench. Front right: the floor hatch closed by a heavy iron bolt with a red lamp. Strong orange glow from the machine, cold blue moonlight from the window. Second image, same framing: the machine switched off, lamps dark, gauge needle in the green, oven door swung open showing a lopsided chocolate cake, the bolt pulled back, red lamp off, last wisps of steam. warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## Wohnzimmer

**Zustände:** Nachmittag (Prolog Szene 1; Welt 3 Sofa-Szene mit weichem Filter und Portal-Gag) und Abend (Welt 4 Lichterkette). Das Grundbild ist der Nachmittag, der Abend entsteht per Bild-zu-Bild (unten). Das vorhandene Bild `w0_bg_wohnzimmer_v01.png` zeigt Abend, hat keinen Staubrand, einen schrägen Fernseher und zu große Möbel: mit diesem Motiv neu erzeugen

**Layout-Skizze:** [Wohnzimmer](../skizzen/prolog/wohnzimmer.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Old-fashioned cozy living room on a bright lazy afternoon, back wall seen straight on. Warm daylight falls in from a window outside the frame at the upper left and lies as a soft bright patch on the carpet, the standing lamp is switched off, no dark corners. Left: a dark wooden cupboard at the edge, only about half the image height, beside it a saggy brown corduroy sofa facing right with a knitted orange blanket. Center: a low wooden coffee table with newspapers, a cold cup of tea, and clearly visible on the table top an empty spot with a pale rectangular dust outline the size of a remote control. Right: an old tube television on a low wooden cabinet, screen facing the viewer straight on, dark. Back wall: floral green wallpaper in a light, friendly tone, framed family photos with one empty space for a larger frame, a standing lamp with a yellow fabric shade. Exit: open door to the hallway at the far right. Patterned carpet across the lower third kept clear. Furniture at the same scale as the attic scene: a standing adult would be about 52 percent of the image height. warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## Wohnzimmer, Geburtstag

**Zustände:** Variante

**Layout-Skizze:** [Wohnzimmer](../skizzen/prolog/wohnzimmer.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. The same living room in the evening, same framing, decorated for a birthday party: colorful paper garlands pinned across the back wall, balloons tied to the sofa armrest, a lopsided steaming chocolate birthday cake with lit candles on the coffee table, a small pile of wrapped presents next to it, confetti on the carpet, free floor space beside the television for a second TV on a wheeled cart. Warm golden lamp light. warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## Treppenhaus

**Zustände:** Nachmittag (Prolog) und später Abend (Finale, Abspann-Foto 4); nur Fenster und Licht wechseln. Das Grundbild ist der Nachmittag, der Abend entsteht per Bild-zu-Bild (unten). Das vorhandene Bild `w0_bg_treppenhaus_v01.png` zeigt die Nacht und ist damit die Finale-Fassung: die Nachmittags-Fassung mit diesem Motiv neu erzeugen; im Finale liegt über der Lukenöffnung oben die geschlossene Klappe als Sprite

**Layout-Skizze:** [Treppenhaus](../skizzen/prolog/treppenhaus.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Narrow wooden staircase in an old house on a sunny afternoon, seen strictly from the side like a stage. The stairs rise from a small landing at the lower left to an open attic hatch at the top right, steps drawn as an even sawtooth line. Left edge: a doorway down to the living room, coats and an umbrella on wall hooks with one free hook. Center wall: a small window with bright pale-yellow afternoon light and a soft sunbeam falling onto the steps, ceiling lamp switched off. A few cardboard boxes under the stairs. Creaky dark wooden steps, faded striped wallpaper in a warm light tone, no night sky, no stars. warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## Supermarkt

**Zustände:** Später Abend

**Layout-Skizze:** [Supermarkt](../skizzen/finale/supermarkt.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical. Front of a small neighborhood supermarket late in the evening, shopfront seen straight on and parallel to the picture plane, the sidewalk as open floor with gentle depth in the lower third. Left: a row of red shopping carts. Center: automatic glass sliding doors, behind them a brightly lit aisle leading to a glowing milk fridge at the back. Right: a bicycle rack and a flower stand with buckets of tulips. Free sidewalk space left of the door for a store display. Blank sign above the door. Dark blue night sky with a few stars above the roof, a street lamp, warm light spilling out onto the sidewalk. warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

# Gegenstände

Je Sammelbild den Block komplett in Gemini kopieren, keine Skizze anhängen. Umrechnen mit
`tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.

## Prolog (1×7)

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 1x7 grid: a manual crank can opener with red plastic handles; a plain silver wire coat hanger; the same coat hanger bent into a V-shaped TV antenna like rabbit ears; a vintage brown leather travel bag with three front pockets and brass buckles; a small folded paper note with blank lines; a wide, low white porcelain teacup with a small blue flower pattern on a matching saucer, half full of cold tea; the same teacup on its saucer, empty of tea and filled with pink tuna like a cat bowl.
```

## Gegenwart (2×4)

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 2x4 grid: a plain white hen's egg; a small paper flour sack tied at the top with a blank round seal; a single finger-sized AA battery glowing soft orange; a crumpled handwritten note with blank lines; a small folded note with one long blank line; a glass milk bottle with a red cap; a slice of chocolate birthday cake with a candle; a small brown paper cookie bag, folded over at the top, with bone-shaped dog biscuits peeking out.
```

## Deko Opas Haus (3×4)

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 3x4 grid, scene props at the same scale as a 189-pixel tall adult character, not inventory icons: a stuffed fish wearing round diving goggles; a cardboard box with half-closed flaps and a few broken TV remotes poking out; the same box with flaps wide open and many remotes sticking up like hungry chicks; a pinned travel poster showing a pyramid on the left half and a neon city skyline on the right half, blank caption strip; a chrome toaster with a small propeller on top; a thick old cookbook lying closed with a folded page corner and a blank cover; the same cookbook lying open at the dog-eared page, one blank line underlined in pencil; a small record player with a vinyl record and a blank sleeve; a framed photo of a stern old woman with grey hair in a bun and a purple cardigan; a beanie hat with a tiny propeller hanging on a wall hook; a cardboard store display with a milk bottle picture and a blank price tag; a bulky 1950s vacuum cleaner prototype with a cracked glass dome, a bent nozzle and a tuft of grey cat fur stuck in it.
```

## Zapp-O-Mat 3000

**Hinweis:** GEGENSTÄNDE als Zustandsreihe, 1×7, je 128×128 (Fernseher samt Rolltisch)

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 1x7 grid, same object and position in every cell: an old wooden tube television, screen facing the viewer, a big round channel dial right of the screen, two empty antenna sockets on top, standing on a small wheeled wooden cart, black power cord hanging down to the left. States: screen dark; screen full of grey static snow; grey static with a bent wire coat hanger as antenna on top; the same with colorful static; a swirling colorful vortex on the screen pulling inward; two more frames of grey static with a different noise pattern for a flicker loop.
```

## Einsaug-Effekt

**Hinweis:** EFFEKT, 8 Bilder, je 192×192, mittig über dem Bildschirm

```text
Pixel art visual effect sprite sheet, frames in one horizontal row, frame count and frame size as given in the motif, every frame the same size with the effect centered, transparent background, limited palette, no anti-aliasing, no text. 8 frames of 192x192: swirl of colorful light streaks spiraling into a TV screen at the center, growing stronger frame by frame, the last two frames a white flash filling most of the frame.
```

## Werkbank-Ablage

**Hinweis:** GEGENSTÄNDE, 3 Zustände, je etwa 96×48

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 1x3 grid, the same right end of a wooden workbench top in three states side by side, same scale: a folded grey cloth with a cardboard egg carton holding one white egg, a blank strip on the carton lid; the same with a small paper flour sack tied at the top with a blank round seal next to the carton; the same with egg carton, flour sack and a finger-sized battery cell glowing soft orange.
```

## Kalenderkreis

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 32×32, liegt als Sprite über dem gemalten Kreis im Kalender und deckt ihn ganz ab

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 1x2 grid, the same small square of a paper wall calendar page with blank day cells in two states side by side, same scale: one day circled twice in thick red marker; the same day circled twice with a thick red exclamation mark next to it, pressed so hard that the paper is dented.
```

## Dachlampe

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 48×64, liegt als Sprite über der Lampe am Firstbalken

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 1x2 grid, the same bare light bulb with an enamel shade hanging on a short cord, same scale: switched off, grey glass; switched on, warm yellow bulb with a soft glow around it.
```

## Fundkiste

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 80×64; steht ab Rückkehr 1 auf dem freien Platz am Kistenstapel links, Aufschrift „Fundkiste“ von Hand in Aseprite; im Finale anklickbar (Omas Kekse, falls nicht eingepackt)

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 1x2 grid, the same open cardboard box with flaps folded outward and a blank paper label taped on the front, seen from the front at eye level, same scale: first almost empty with a single odd item at the bottom; second piled high with a jumble of small odd objects, a wooden bucket handle and a rolled paper sticking out over the rim.
```

## Werbeblock

**Hinweis:** EFFEKT, 4 Bilder plus 1 Störbild, 640×360, ohne Farb-Baustein

```text
Pixel art visual effect sprite sheet, frames in one horizontal row, frame count and frame size as given in the motif, every frame the same size with the effect centered, transparent background, limited palette, no anti-aliasing, no text. Full-screen TV commercial frames, 640x360 each, cheap 1990s studio look, flat bright colors, no text: a tall glass of milk with a sparkle on a blue backdrop; a smiling black-and-white cartoon cow (not purple); a big blank price tag; a white flash. Fifth frame: the cow frame torn by horizontal glitch lines.
```
