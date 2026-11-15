# Fertige Prompts: Welt 1, Schwurbelstein

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../welt-1.md` (dort ändern, nicht hier).

**Stand:** Welt 1 ist komplett erzeugt (Räume, Figuren, Gegenstände, Nahansichten). Offen sind nur Bewegungen, für die gemalte Schlüsselposen fehlen, etwa Hämmern (Schmied) und Rühren (Alwin). Alle anderen Blöcke dienen nur noch zum Nachbessern, dann mit dem Baustein MASKE.

Räume: je Szene den Block komplett in ChatGPT oder Gemini kopieren und die Layout-Skizze als
Bild anhängen. Danach Prüfliste und Umwandeln wie in `../00-stil-und-werkzeuge.md` (Ablauf pro Szene).

**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):
erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist
ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein
MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und
Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus
`01-figurenboegen.md` anhängen, sobald er freigegeben ist.

# Shotliste

137 Shots, davon 96 sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:
R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.

| Shot | Bild | Stand |
| --- | --- | --- |
| W1-R01 | Dorfplatz | im Spiel |
| W1-R02 | Taverne | im Spiel |
| W1-R03 | Schmiede | im Spiel |
| W1-R04 | Zauberstab-Laden | im Spiel |
| W1-R05 | Klassenzimmer | offen |
| W1-R06 | Troll-Brücke | im Spiel |
| W1-R07 | Zauberwald | im Spiel |
| W1-R08 | Luftschloss | im Spiel |
| W1-R09 | Goblin-Bergwerk | im Spiel |
| W1-R10 | Turmkeller (Turmhalle) | offen |
| W1-R11 | Abstellkammer 1 | im Spiel |
| W1-R12 | Smaugis Abstellkammern | im Spiel |
| W1-R13 | Wasserschloss (Gag-Szene) | im Spiel |
| W1-R14 | Thronsaal | im Spiel |
| W1-F01 | Toadi | im Spiel |
| W1-F02 | Alwin Grauwald | im Spiel |
| W1-F03 | Zeldina | im Spiel |
| W1-F04 | Gollo | im Spiel |
| W1-F05 | Wirt Humbert | im Spiel |
| W1-F06 | Schmied | im Spiel |
| W1-F07 | Troll Waldemar | im Spiel |
| W1-F08 | Zauberstabmacher | offen |
| W1-F09 | Rotkäppchen | im Spiel |
| W1-F10 | Maklerin | im Spiel |
| W1-F11 | Grimmzahn | im Spiel |
| W1-F12 | Goblin-Arbeiter 1 | offen |
| W1-F13 | Goblin-Arbeiter 2 | offen |
| W1-F14 | Streik-Goblin 1 | offen |
| W1-F15 | Streik-Goblin 2 | offen |
| W1-F16 | Streik-Goblin 3 | offen |
| W1-F17 | Lord Moderwort | im Spiel |
| W1-F18 | Smaugi | im Spiel |
| W1-F19 | Wirtskatze Minka | im Spiel |
| W1-F20 | Taverne-Huhn | im Spiel |
| W1-F21 | Schmiede-Ziege | im Spiel |
| W1-F22 | XXL-Ziege | im Spiel |
| W1-F23 | Pixel als Ziege | im Spiel |
| W1-F24 | Max als Pilz | im Spiel |
| W1-F25 | Zauberbesen | im Spiel |
| W1-F26 | Übungsbesen | im Spiel |
| W1-F27 | Schwan | im Spiel |
| W1-B01 | Toadi: Rennen | offen |
| W1-B02 | Toadi: Keuchen | offen |
| W1-B03 | Toadi: Auf Max zeigen | offen |
| W1-B04 | Pixel: Minka umgarnen | offen |
| W1-B05 | Wirt Humbert: In den Keller gehen | offen |
| W1-B06 | Gollo: Ring werfen | offen |
| W1-B07 | Max: Kochlöffel schwingen | offen |
| W1-B08 | Max: Ziege melken | offen |
| W1-B09 | Max: Bohne pflanzen und gießen | offen |
| W1-B10 | Bohnenranke: Wachsen | offen |
| W1-B11 | Niesrosen: Aufgehen | offen |
| W1-B12 | Troll Waldemar: Musical-Nummer | offen |
| W1-B13 | Troll Waldemar: Fußbad | offen |
| W1-B14 | Zeldina: Gehen und Kiste tragen | offen |
| W1-B15 | Pixel als Ziege: Brücke überqueren | offen |
| W1-B16 | Ziegen: Gehen | offen |
| W1-B17 | Zauberbesen: Fegen | offen |
| W1-B18 | Zauberbesen: Haarspur jagen | offen |
| W1-B19 | Pixel: Haare verlieren | offen |
| W1-B20 | Lord Moderwort: Zaubern | offen |
| W1-B21 | Lord Moderwort: Niesen | offen |
| W1-B22 | Fluch wird Käse: Effekt | offen |
| W1-B23 | Pilz-Verwandlung: Effekt | offen |
| W1-B24 | Smaugi: Kram hergeben | offen |
| W1-B25 | Smaugi: Gerührt schniefen | offen |
| W1-B26 | Alwin Grauwald: Rühren | offen |
| W1-B27 | Schmied: Hämmern | offen |
| W1-B28 | Übungsbesen: Pixel jagen | offen |
| W1-B29 | Zauberbesen: Max wegfegen | offen |
| W1-B30 | Wirt Humbert: Krug polieren | offen |
| W1-B31 | Zauberstabmacher: Mustern | offen |
| W1-B32 | Rotkäppchen: Pakete balancieren | offen |
| W1-B33 | Maklerin: Notieren | offen |
| W1-B34 | Grimmzahn: Protestieren | offen |
| W1-B35 | Goblin-Arbeiter 1: Pickel schwingen | offen |
| W1-B36 | Goblin-Arbeiter 2: Gähnen und strecken | offen |
| W1-B37 | Wirtskatze Minka: Putzen | offen |
| W1-B38 | Taverne-Huhn: Aufplustern | offen |
| W1-B39 | Schmiede-Ziege: Im Kreis drehen | offen |
| W1-B40 | XXL-Ziege: Wiederkäuen | offen |
| W1-B41 | Schwan: Fauchen | offen |
| W1-B42 | Wirtskatze Minka: Gehen | offen |
| W1-B43 | Schmied: Hufeisen ins Feuer legen | offen |
| W1-B44 | Schmied: Blasebalg treten | offen |
| W1-B45 | Schmied: Glühendes Eisen zum Amboss | offen |
| W1-B46 | Schmied: Abschrecken | offen |
| W1-B47 | Schmied: Reden | offen |
| W1-B48 | Alwin Grauwald: Reden mit der Kelle | offen |
| W1-B49 | Toadi: Reden | offen |
| W1-B50 | Wirt Humbert: Reden | offen |
| W1-B51 | Gollo: Reden | offen |
| W1-B52 | Zauberstabmacher: Reden | offen |
| W1-B53 | Rotkäppchen: Reden | offen |
| W1-B54 | Maklerin: Reden | offen |
| W1-B55 | Grimmzahn: Reden | offen |
| W1-B56 | Troll Waldemar: Reden | offen |
| W1-B57 | Zeldina: Reden | offen |
| W1-B58 | Lord Moderwort: Reden | offen |
| W1-B59 | Smaugi: Reden | offen |
| W1-B60 | Goblin-Arbeiter 1: Reden | offen |
| W1-B61 | Taverne: Kaminfeuer | offen |
| W1-B62 | Taverne: Fondue blubbert | offen |
| W1-B63 | Schmiede: Esse glüht | offen |
| W1-B64 | Schmiede: Funken beim Schlag | offen |
| W1-B65 | Klassenzimmer: Kessel blubbert | offen |
| W1-B66 | Zauberstab-Laden: Schachtel ruckelt | offen |
| W1-B67 | Troll-Brücke: Fisch springt | offen |
| W1-B68 | Troll-Brücke: Schmetterling | offen |
| W1-B69 | Zauberwald: Eule im hohlen Baum | offen |
| W1-B70 | Fackel: Brennen | offen |
| W1-B71 | Luftschloss: Wimpel flattern | offen |
| W1-B72 | Luftschloss: Brunnen plätschert | offen |
| W1-B73 | Goblin-Bergwerk: Steinchen rieseln | offen |
| W1-B74 | Glitzern: Funkeln | offen |
| W1-B75 | Wasserschloss: Ente schwimmt | offen |
| W1-B76 | Dorfplatz: Huhn pickt | offen |
| W1-B77 | Toadi: Hände ringen | offen |
| W1-B78 | Gollo: Ringschachtel streicheln | offen |
| W1-B79 | Zeldina: Kiste absetzen und Schwert prüfen | offen |
| W1-B80 | Troll Waldemar: Im Regelbuch blättern | offen |
| W1-B81 | Lord Moderwort: Nase putzen | offen |
| W1-B82 | Smaugi: Staubwedel | offen |
| W1-B83 | Alwin Grauwald: Lesebrille und Kochbuch | offen |
| W1-B84 | Schmied: Schweiß abwischen | offen |
| W1-B85 | Goblin-Arbeiter 2: Reden | offen |
| W1-B86 | Zauberwald: Eichhörnchen | offen |
| W1-B87 | Goblin-Bergwerk: Lore rollt | offen |
| W1-B88 | Kerze: Brennen | offen |
| W1-G01 | Dorf und Taverne (3×3) | – |
| W1-G02 | Zaubertrank (2×4) | – |
| W1-G03 | Flaschen (1×6) | – |
| W1-G04 | Wald und Turm (2×4) | – |
| W1-G05 | Bohnenranke (1×1) | – |
| W1-G06 | Niesrosen (1×2) | – |
| W1-G07 | Smaugis Kram (3×3, Rätsel 12) | – |
| W1-G08 | Deko Welt 1 (3×3) | – |

# Räume

## Dorfplatz

**Shot W1-R01**

**Zustände:** Vorher und nachher Rätsel 8 (Bohnenranke als eigenes Sprite)

**Layout-Skizze:** [Dorfplatz Unterbrösel](../skizzen/welt-1/dorfplatz.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Fairy tale village square at midday, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: a crooked half-timbered tavern with an open door and a blank hanging sign; a small stable with an open door and an empty straw bale; a tiny ring shop with a blank sale board in its window; a narrow wand shop with a round window and an open door. RIGHT HALF, left to right: a bare patch of dark soil; a round stone wishing well with a wooden roof and a wooden bucket on its rim, on the roof a stone statue of a donkey, a dog, a cat and a rooster stacked on each other; a wooden notice board with a few blank pinned notes and one large wanted poster with a blank face; the open front of a blacksmith shed with a glowing forge; a dirt path leaving at the right edge toward a forest. Background: round houses with crooked roofs, a winding path up a green hill to a crooked school, and high in the blue sky a small pastel castle floating on a cloud. Cobblestone floor with gentle depth in the lower third kept clear for walking.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

## Taverne

**Shot W1-R02**

**Layout-Skizze:** [Taverne](../skizzen/welt-1/taverne.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Interior of a cozy fantasy tavern in the evening, 640x360. Left: a long wooden bar with mugs, a bowl of grey fish soup, a green bottle with a blank label and a small blank menu board; a large bubbling yellow cheese fondue pot on an iron stand at the bar's right end; a small cellar door in the back wall behind the bar. Center: a bare wooden wall panel, below it an empty straw-filled basket on a crate. Right: a stone fireplace, above it a rack of four rusty swords, each with a small blank name tag, and a row of empty name tags; a fluffy white goat skin rug on the floor in front; the entrance door at the right edge. Low dark ceiling beams across the top, wide enough for a cat to walk along. Plank floor with gentle depth in the lower third kept clear. Warm firelight, light from upper left.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Schmiede

**Shot W1-R03**

**Layout-Skizze:** [Schmiede](../skizzen/welt-1/schmiede.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Village blacksmith workshop open to the street, midday, 640x360. Left: a glowing stone forge with leather bellows. Center: a heavy black anvil on a tree stump, a few chewed sword stumps on the ground. Right: a wall rack of shiny new pots, pans and ladles, each with a small blank name tag on a string, and an empty clay jug with its own blank tag hanging among them; the open street at the right edge as exit. Packed earth floor with gentle depth in the lower third kept clear for walking and for the goat. Orange forge glow and sparks, daylight from upper left.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Zauberstab-Laden

**Shot W1-R04**

**Layout-Skizze:** [Zauberstab-Laden](../skizzen/welt-1/zauberstabladen.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Tiny cramped wand shop, 640x360. Left: a small round window high in the wall, below it floor-to-ceiling shelves of narrow wooden boxes with a rolling ladder leaning on them. Center: a wooden counter with a purple velvet cushion on top, holding a toothpick, a folding ruler and a plain wooden cooking spoon side by side, clearly separated. Right: more box shelves and the shop door at the right edge. Worn plank floor with gentle depth in the lower third kept clear. Dusty light from upper left, floating dust specks.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Klassenzimmer

**Shot W1-R05**

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Crooked magic school classroom by day with green walls and dark ceiling beams, 640x360. Left: the classroom door at the left edge, two tall arched windows (a narrow one beside the door), directly below the larger one on the floor a big black cauldron bubbling green over a small fire. Center: a blank chalkboard on the back wall, directly in front of it two wobbly wooden desks with benches facing the chalkboard, next to them an empty small wooden stool. Right: a wooden wall shelf with six potion bottles in one row, all of identical opaque dark brown glass with cork stoppers, the second and fifth twice as tall as the others, no labels, nothing visible inside; next to it a tall cupboard with its doors open. Stone floor with gentle depth in the lower third kept clear. Cool daylight from upper left.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Troll-Brücke

**Shot W1-R06**

**Layout-Skizze:** [Troll-Brücke](../skizzen/welt-1/trollbruecke.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Old arched stone bridge over a babbling brook in a sunny meadow, afternoon, 640x360, seen straight from the front, the bridge deck a horizontal band in the middle of the image. Left: the dirt path from the village entering at the left edge and rising up a short ramp onto the bridge, a medium wooden sign with blank carved paragraphs standing at the left end of the bridge. Center: the bridge spanning the brook, which flows through under the arch and straight toward the viewer to the bottom edge; inside the arch on a dry stone ledge above the water an old brass horn gramophone and loose blank music sheets. Right: the path coming down a ramp from the bridge and continuing into a dark forest at the right edge, open grass beside the bridge, and a narrow side path branching into the background toward a small pink castle on a lake. Wildflowers, grass floor with gentle depth in the lower third kept clear. Bright sun from upper left.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Zauberwald

**Shot W1-R07**

**Zustände:** Niesrosen geschlossen und offen als eigenes Sprite

**Layout-Skizze:** [Zauberwald](../skizzen/welt-1/zauberwald.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Enchanted forest at dusk, 640x360. Left: the path back to the bridge at the left edge, giant colorful mushrooms with a cluster of small glowing blue mushrooms at their base. Center: a small mossy clearing with free space for a rose bush, behind it three pumpkins stacked into a wobbly tower. Right: a small red delivery handcart on the path, loaded with cardboard boxes, a red squeeze bottle hanging on its side; behind it a dark mine entrance with wooden beams in a rocky slope at the right edge. Twisted trees, fireflies, forest floor with gentle depth in the lower third kept clear. Golden light beam from upper left through the canopy.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Luftschloss

**Shot W1-R08**

**Layout-Skizze:** [Luftschloss](../skizzen/welt-1/luftschloss.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Dainty pastel castle courtyard on top of fluffy clouds, morning, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: the top of a giant green beanstalk curling over the cloud edge at the left edge; an open stretch of pale flagstones with low pastel hedges and a small dry fountain. RIGHT HALF, left to right: a high arched doorway, on the pale wall right next to it a small childish chalk scribble with a tiny heart, no letters; a tiny balcony with a railing and an ornate gold-framed wall mirror at the right edge. Background: slim turrets with pointed pink roofs, open sky. Floor with gentle depth, made of pale flagstones and cloud in the lower third kept clear. Soft pink and blue light from upper left.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

## Goblin-Bergwerk

**Shot W1-R09**

**Zustände:** Rune-Tür zu und offen

**Layout-Skizze:** [Goblin-Bergwerk](../skizzen/welt-1/bergwerk.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Mine tunnel with wooden support beams, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: the bright tunnel mouth to the forest at the left edge, rails leading in, two mine carts on the rails, piles of rubble and a pickaxe rack on the wall. RIGHT HALF, left to right: protest signs with blank boards leaning on the wall, a picket line painted as a dashed stripe across the floor, an empty wooden crate by the wall; then the tunnel narrows and ends in a smooth stone wall with a closed secret door outlined by one faint glowing rune at the right edge. Rocky floor with gentle depth in the lower third kept clear. Very dim flickering torches on the beams, light from upper left.
PALETTE: dim torch-lit mine palette of earthy browns and mossy greens with small warm gold highlights, friendly rather than scary. Color anchors, approximate: earthy brown #733e39, dark brown #3e2731, mossy green #265c42, warm gold #feae34, torch orange #f77622.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The rune door stands open on stone steps lit in violet.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Turmkeller (Turmhalle)

**Shot W1-R10**

**Zustände:** Vor und nach Rätsel 11 Teil 2 (Kammertür einen Spalt offen und Besen auf den Routen; danach Tür zu, keine Besen)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Cellar hall at the bottom of a dark wizard tower, 640x360. Left: a heavy stone door with a faint rune standing open at the left edge, a few steps leading down into a mine tunnel. Center: a wide stone floor with three tile paths in clearly different colors, a straight red line, a yellow zigzag and a blue loop, crossing each other at exactly three points. Right: a wooden storeroom door, slightly ajar. Background: a narrow spiral staircase winding up into darkness. Floor with gentle depth in the lower third kept free of objects, only the tile paths. Torch light from upper left, violet shadows.
PALETTE: dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Color anchors, approximate: violet #68386c, slate grey #5a6988, pale green #63c74d, torch orange #f77622, deep shadow #262b44.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Abstellkammer 1

**Shot W1-R11**

**Layout-Skizze:** [Abstellkammer 1](../skizzen/welt-1/abstellkammer_1.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Cramped storeroom on the first floor of a wizard tower, 640x360. Left: the wooden door at the left edge. Center left: buckets, folded violet banners and a heap of rags along the back wall, half of the junk already swept into two neat square stacks, a small blank wooden sign nailed to the wall above the junk, cobwebs in the corners. Center right: an open stretch of bare stone floor. Right: a single torch on the wall above shelves of dusty junk. Floor with gentle depth in the lower third kept clear. Torch light from upper left, violet shadows.
PALETTE: dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Color anchors, approximate: violet #68386c, slate grey #5a6988, pale green #63c74d, torch orange #f77622, deep shadow #262b44.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Smaugis Abstellkammern

**Shot W1-R12**

**Zustände:** Voll (vor Rätsel 12, die Besen fegen gerade) und aufgeräumt (nach Rätsel 12); Geheimtür zu und offen (Rätsel 11 Teil 1) als Sprite-Wechsel

**Layout-Skizze:** [Smaugis Abstellkammern](../skizzen/welt-1/abstellkammern.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Top storeroom floor of a wizard tower, 640x360, crammed to the ceiling with hoarded junk: rusty helmets, dented teapots, a cracked mirror, heaps of gold coins. Left: the top of a stone staircase coming up from below at the left edge, then three separate small junk piles: a bundle of rusty swords tied with rope, a bundle of burnt-out torches, and a dusty golden chandelier hanging crooked from the ceiling. Center: a big gold coin pile with a sword stuck in a rock on top, beside it an empty nest of old blankets. Right: a narrow stone staircase leading up, at its foot a heavy wooden door with a carved grinning face. Floor with gentle depth in the lower third kept clear. Warm torch light from upper left, dust in the air.
PALETTE: dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Color anchors, approximate: violet #68386c, slate grey #5a6988, pale green #63c74d, torch orange #f77622, deep shadow #262b44.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: All junk swept into neat square stacks along the walls, bare floor visible.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Wasserschloss (Gag-Szene)

**Shot W1-R13**

**Layout-Skizze:** [Wasserschloss](../skizzen/welt-1/wasserschloss.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Small pastel pink fairy tale castle on a lake, morning, 640x360. Left: the path from the bridge at the left edge, reeds and a small rowing boat at the shore. Center: a wooden footbridge across the water to an open castle gate with a blank wooden sign hanging on it; through the gate a courtyard with stacked moving boxes and a rolled-up carpet. Right: open calm water with free space for a swan, the castle's round tower behind. Shore and footbridge form the floor with gentle depth in the lower third, kept clear. Calm blue water, light from upper left.
PALETTE: storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Color anchors, approximate: lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Thronsaal

**Shot W1-R14**

**Layout-Skizze:** [Thronsaal](../skizzen/welt-1/thronsaal.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Oversized dark throne room at the very top of a wizard tower, night, 640x360, looking slightly ridiculous. Left: a narrow secret door standing open at the left edge, tall vases overflowing with bright flowers. Center: a giant spiky black throne on two steps with a tiny embroidered pink cushion. Right: a small table with stacks of tissue boxes, a tall stained glass window with moonlight and clouds far below. Long violet carpet along the floor in the lower third, kept clear. Torch light from upper left.
PALETTE: dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Color anchors, approximate: violet #68386c, slate grey #5a6988, pale green #63c74d, torch orange #f77622, deep shadow #262b44.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

# Figuren

Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Gebraucht wird nur die
Seitenansicht nach rechts; Gehen und Reden entstehen per Code (`tools/figur.py`). Zweite Fassungen
entstehen mit Maske aus dem fertigen Bild.

## Toadi

**Shot W1-F01**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Alwin Grauwald

**Shot W1-F02**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Absent-minded old wizard, tall and thin, about 111 percent of the boy Max's height. Long grey beard tied with a red ribbon, round reading glasses on the tip of his nose, a floppy brown knitted cap. Faded mustard-yellow robe with small blue stars and brown patches, a white cooking apron over it, a soup ladle in his right hand. Standing upright, facing right, puzzled smile. No pointed hat, no purple or grey robe, no half-moon glasses, no staff.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zeldina

**Shot W1-F03**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Young athletic princess, about 104 percent of the boy Max's height, clearly a princess at first glance but dressed for moving house. Short brown bob with freckles, a polished small golden tiara with a tiny red gem, tied on under her chin with a piece of string. A deep teal princess gown with puffed sleeves, a fitted bodice with gold trim and small pearl buttons, the long skirt hitched up and knotted at one side above the knee, showing sturdy brown lace-up boots. Pearl earrings, white gloves. A cardboard moving box under her left arm, a plain short sword lying across the top of the box. Standing upright and proud, facing right, determined grin. No long blond hair, no pink dress, no green tunic, no pointed ears.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Gollo

**Shot W1-F04**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Small nervous man, deliberately short at about 147 pixels. Round worried eyes, thinning brown hair, pink skin, a stubbly chin. Lost in a far too large brown traveling cloak that drags on the floor, grey trousers peeking out. A tiny dark red ring box clutched to his chest with both hands. Hunched, facing right. No grey skin, no loincloth, no bald head, no huge pale eyes.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Wirt Humbert

**Shot W1-F05**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Schmied

**Shot W1-F06**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Troll Waldemar

**Shot W1-F07**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zauberstabmacher

**Shot W1-F08**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Thin elderly wand maker, about 104 percent of the boy Max's height, with a long neck. Bald head with two tufts of white hair, an enormous brass magnifying monocle over his right eye. Bottle-green waistcoat over a white shirt, a yellow tape measure around his neck, grey trousers. Leaning forward curiously, hands clasped, facing right. No long grey hair, no wand in hand.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Rotkäppchen

**Shot W1-F09**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Cheerful delivery girl, about 86 percent of the boy Max's height. Blond braids, freckles. Red hooded jacket with the hood down, red delivery cap, dark blue knee-length trousers, white sneakers. A small stack of two cardboard boxes held in both arms. Standing upright, facing right, big friendly smile.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Maklerin

**Shot W1-F10**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Sharp real estate agent, about 106 percent of the boy Max's height, slim. Tight grey hair bun, thin glasses on a chain, a pen behind her ear. Pointy black business suit with sharp shoulders, white blouse, black high heels. A clipboard held in her left hand. Standing upright, facing right, fake toothy smile.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Grimmzahn

**Shot W1-F11**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Stocky green goblin union boss, about 71 percent of the boy Max's height. Big underbite with two jutting teeth, bushy eyebrows. Yellow hard hat, brown work vest over a grey shirt, patched trousers, a silver whistle on a string. A blank protest sign on a stick held upright in his right hand, left fist on his hip. Facing right, stubborn look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Goblin-Arbeiter 1

**Shot W1-F12**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Small skinny green goblin miner, about 61 percent of the boy Max's height. Pointy ears, long nose. Blue miner overalls, a dented grey helmet with a tiny lamp, small brown boots. A pickaxe resting on his shoulder. Standing upright, facing right, grumpy look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Goblin-Arbeiter 2

**Shot W1-F13**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Small round green goblin miner, about 61 percent of the boy Max's height. Pointy ears, droopy eyelids. Orange miner overalls, no helmet, small brown boots. A big steaming mug held in both hands. Standing upright, facing right, sleepy look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Streik-Goblin 1

**Shot W1-F14**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Small stocky green goblin miner, about 58 percent of the boy Max's height. Pointy ears, bushy eyebrows. Brown miner overalls, a red bandana, small brown boots. Holding a blank wooden protest sign on a stick high above his head with both hands. Standing upright, facing right, determined look, mouth open as if chanting.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Streik-Goblin 2

**Shot W1-F15**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Small thin green goblin miner, about 56 percent of the boy Max's height. Very long pointy ears, crooked nose. Grey miner overalls with patches, a too-big helmet tilted over one eye, small brown boots. Arms crossed, a blank cardboard sign hanging on a string around his neck. Standing upright, facing right, stubborn look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Streik-Goblin 3

**Shot W1-F16**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Small old green goblin miner, about 50 percent of the boy Max's height, slightly hunched. Grey beard, pointy ears. Faded green overalls, a knitted cap, small brown boots. Sitting on an upturned bucket, knitting a long scarf, a blank tiny protest sign stuck into the bucket beside him. Facing right, relaxed look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Lord Moderwort

**Shot W1-F17**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Smaugi

**Shot W1-F18**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Wirtskatze Minka

**Shot W1-F19**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A slender elegant long-haired white cat, about 32 percent of the boy Max's height sitting, fluffy plume tail, blue eyes, pink nose. A pink ribbon bow around her neck, no collar. Sitting very upright, tail wrapped around her paws, facing right, proud look. No grey fur, no stripes.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Taverne-Huhn

**Shot W1-F20**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A plump brown hen, about 25 percent of the boy Max's height, small red comb, sitting in a small straw basket, one eye half closed, facing right, suspicious look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Schmiede-Ziege

**Shot W1-F21**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A small white goat, about 49 percent of the boy Max's height, short horns, a small brass bell on a red string, a sword blade sticking out of its chewing mouth. Standing on all fours, facing right, calm chewing look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## XXL-Ziege

**Shot W1-F22**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A huge shaggy brown goat, about 125 percent of the boy Max's height, as tall as a man, big curled horns. A blank brown paper delivery label tied around its neck with string. Standing on all fours, facing right, bored expression.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Pixel als Ziege

**Shot W1-F23**

**Anhängen:** Pixels Figurenbogen (sonst sein Konzeptblatt) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
SUBJECT: the tomcat, a chubby round cat about 32 percent of the boy Max's height when sitting, short legs, light silver-grey fur (#c0cbdc) with three darker blue-grey stripes on his back (#5a6988), white chest and white paws, a very fluffy tail, a notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose, a red collar (#e43b44) with a small round silver speaker and a clearly visible two-pixel turquoise light (#2ce8f5), not orange, no tabby markings on the face. About 37 percent of the boy Max's height in costume: a fluffy white goat skin rug draped over his back, two small fake horns tied on his head, red collar still visible. Standing on all fours, facing right, deeply offended look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max als Pilz

**Shot W1-F24**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Max, a lanky 16-year-old boy with a slight slouch, messy shaggy dark brown hair (#733e39) with strands falling over his forehead and eyes, sleepy half-closed eyes, lopsided smirk, a few freckles, oversized dark slate blue-grey hoodie (#3a4466) with sleeves over his hands, uneven drawstrings and a tiny retro TV with a turquoise screen (#2ce8f5) on the chest, dark blue jeans (#124e89) slightly too long, worn red sneakers (#e43b44) with white soles, one lace untied, hands in his hoodie pocket. About as tall as the boy Max, his hair replaced by a big round plain brown mushroom cap, confused eyes peeking out under its rim. Standing upright, facing right. No spots on the cap.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zauberbesen

**Shot W1-F25**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Übungsbesen

**Shot W1-F26**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A small enchanted practice broom, about 39 percent of the boy Max's height, short birch handle, pale straw bristles tied with a red cord, two thin stick arms and a small wide-eyed face on the binding. Standing upright on its bristles, facing right, twitching eagerly.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Schwan

**Shot W1-F27**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A white swan floating on the water, about 43 percent of the boy Max's height, orange beak with a black knob, long neck in an S-curve, one eye narrowed. Facing right, suspicious look, a small ripple line at the waterline.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

# Bewegungen

Schlüsselposen für Animationen, die im Spiel noch fehlen. Das Blatt anhängen, das beim Block steht.
Die Zeitmarken gelten für etwa 10 Bilder pro Sekunde; Zwischenbilder, Timing und Schleife baut Claude
in Aseprite oder aus dem 3D-Clip. Eine misslungene Pose wird mit Maske nachgebessert.

## Toadi: Rennen

**Shot W1-B01**

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the neutral pose on the attached concept sheet of Toadi. Keep the clean concept-art style of that sheet, not pixel art.
MANNER (applies to every frame): panicked run with tiny fast steps, arms flapping, mushroom hat bouncing up and down.
FRAMES: exactly 8 frames side by side, left to right, one complete cycle of about 0.8 s at 10 frames per second: (1) contact: near foot landing in front of the body, near knee slightly bent; far leg trailing behind, knee bent; far arm forward, near arm back, elbows bent; (2) down: near leg deeply bent under the body carrying the weight, body at its lowest, leaning forward; far knee driving forward; (3) push-off: near leg stretched straight back, pushing off on its toes; far knee raised high in front; (4) flight: both feet off the ground, legs split wide, far leg reaching forward, near leg trailing; body at its highest; (5) contact: far foot landing in front of the body; near leg trailing behind; near arm forward, far arm back; (6) down: far leg deeply bent carrying the weight, body at its lowest; near knee driving forward; (7) push-off: far leg stretched straight back on its toes; near knee raised high in front; (8) flight: both feet off the ground, near leg reaching forward, far leg trailing; leads back into frame 1.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of them.
END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not draw frame 1 twice.
HOLD STILL: the hat brim keeps its shape.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Toadi: Keuchen

**Shot W1-B02**

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the neutral pose on the attached concept sheet of Toadi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: bent forward with both hands on his knees, chest heaving; (2) 0.2 s: a sweat drop falls from his forehead.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Toadi: Auf Max zeigen

**Shot W1-B03**

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the neutral pose on the attached concept sheet of Toadi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he stops; (2) 0.4 s: points his arm straight forward with an excited jab, hat brim bouncing, mouth open as if shouting.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Minka umgarnen

**Shot W1-B04**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: From the neutral pose on the attached concept sheet of the tomcat and Minka. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the tomcat struts past the white cat; (2) 0.3 s: winks; (3) 0.5 s: rubs his head against her cheek; (4) 0.8 s: walks off to the right and she follows him.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, both facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wirt Humbert: In den Keller gehen

**Shot W1-B05**

**Anhängen:** das fertige Konzeptblatt von Wirt Humbert · **Bilder:** 10 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
START: From the neutral pose on the attached concept sheet of Humbert. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 10-frame animation of about 1.0 s): (1) 0.0 s: he sets the pewter mug down on the bar top in front of him (the mug stays standing on the bar in every later frame), wipes his hands on the green apron; (2) 0.3 s: turns around to the cellar door behind the bar; (3) 0.7 s: pulls it open; (4) 1.0 s: steps down the first stair and sinks out of view step by step until only the top of his bald head shows, disappears.
FRAMES: draw all 10 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the bar and the mug on it stay still.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gollo: Ring werfen

**Shot W1-B06**

**Anhängen:** das fertige Konzeptblatt von Gollo · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small nervous man, deliberately short at about 147 pixels. Round worried eyes, thinning brown hair, pink skin, a stubbly chin. Lost in a far too large brown traveling cloak that drags on the floor, grey trousers peeking out. A tiny dark red ring box clutched to his chest with both hands. Hunched, facing right. No grey skin, no loincloth, no bald head, no huge pale eyes.
START: From the neutral pose on the attached concept sheet of Gollo. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he hesitates; (2) 0.3 s: squeezes his eyes shut, throws a tiny ring in a high arc to the right; (3) 0.6 s: covers his face with both hands.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: cloak hem stays on the floor.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Kochlöffel schwingen

**Shot W1-B07**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
START: From the neutral pose on the attached concept sheet of Max. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: Max raises a wooden spoon like a wand; (2) 0.3 s: swings it forward in a dramatic arc, small yellow cheese drips fly off; (3) 0.6 s: he lowers it again.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: legs stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Ziege melken

**Shot W1-B08**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
START: From the neutral pose on the attached concept sheet of Max. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: Max crouches beside a white goat with a clay jug under it, squeezing rhythmically, leaning away with a disgusted face, at one end of the movement; (2) 0.3 s: the same action at the opposite end of the movement.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: goat and jug stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max: Bohne pflanzen und gießen

**Shot W1-B09**

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 10 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
START: From the neutral pose on the attached concept sheet of Max. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 10-frame animation of about 1.0 s): (1) 0.0 s: Max kneels; (2) 0.3 s: presses a bean into the soil; (3) 0.7 s: stands up, lifts a wooden bucket and tips water over the spot; (4) 1.0 s: lowers the empty bucket.
FRAMES: draw all 10 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Bohnenranke: Wachsen

**Shot W1-B10**

**Anhängen:** nichts (Effekt) · **Bilder:** 10 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A green sprout bursts from a patch of soil, thickens and shoots up into a huge twisting beanstalk with broad leaves that leaves the frame at the top.
FRAMES: 10 frames side by side, about 1.0 s at 10 frames per second, plays once, each frame 128x360 pixels in the game.
END: the last frame matches the static beanstalk sprite.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Niesrosen: Aufgehen

**Shot W1-B11**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: The closed pink rose buds of the bush open one by one, then a cloud of pink pollen puffs upward and drifts.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Troll Waldemar: Musical-Nummer

**Shot W1-B12**

**Anhängen:** das fertige Konzeptblatt von Troll Waldemar · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
START: From the neutral pose on the attached concept sheet of Waldemar. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: he spreads his arms wide; (2) 0.3 s: sways from side to side and sings with his mouth wide open; (3) 0.5 s: eyes closed, bow tie bouncing.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Troll Waldemar: Fußbad

**Shot W1-B13**

**Anhängen:** das fertige Konzeptblatt von Troll Waldemar · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
START: From the neutral pose on the attached concept sheet of Waldemar, now sitting on the bridge. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: both bare feet in a wooden bucket of water; (2) 0.2 s: toes wiggling, small splashes, content smile.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: upper body stays still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zeldina: Gehen und Kiste tragen

**Shot W1-B14**

**Anhängen:** das fertige Konzeptblatt von Zeldina · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Young athletic princess, about 104 percent of the boy Max's height, clearly a princess at first glance but dressed for moving house. Short brown bob with freckles, a polished small golden tiara with a tiny red gem, tied on under her chin with a piece of string. A deep teal princess gown with puffed sleeves, a fitted bodice with gold trim and small pearl buttons, the long skirt hitched up and knotted at one side above the knee, showing sturdy brown lace-up boots. Pearl earrings, white gloves. A cardboard moving box under her left arm, a plain short sword lying across the top of the box. Standing upright and proud, facing right, determined grin. No long blond hair, no pink dress, no green tunic, no pointed ears.
START: From the neutral pose on the attached concept sheet of Zeldina. Keep the clean concept-art style of that sheet, not pixel art.
MANNER (applies to every frame): walk cycle with the moving box under her left arm, rust-orange cape swinging behind her, crown string bobbing.
FRAMES: exactly 8 frames side by side, left to right, one complete cycle of about 0.8 s at 10 frames per second: (1) contact: near leg forward and straight, only its heel touching the ground, toes up; far leg stretched back, only its toes touching; far arm swung forward, near arm swung back; body at middle height; (2) down: near foot flat on the ground, near knee bent and carrying the weight, body at its lowest; far foot lifted just off the ground behind, far knee bent; (3) passing: near leg straight and vertical under the hips; far leg bent, its foot lifted to ankle height and swinging forward right beside the near leg; both arms close to the body; body high; (4) up: near foot pushing off on its toes behind the body; far leg swinging forward, almost straight, its foot just above the ground; body at its highest; (5) contact: far leg forward and straight, only its heel touching the ground; near leg stretched back, only its toes touching; near arm swung forward, far arm swung back; body at middle height; (6) down: far foot flat, far knee bent and carrying the weight, body at its lowest; near foot lifted just off the ground behind; (7) passing: far leg straight under the hips; near leg bent, its foot lifted to ankle height and swinging forward beside the far leg; body high; (8) up: far foot pushing off on its toes; near leg swinging forward, foot just above the ground; body at its highest, leading back into frame 1.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of them.
END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not draw frame 1 twice.
HOLD STILL: the box stays level.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel als Ziege: Brücke überqueren

**Shot W1-B15**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: From the neutral pose on the attached concept sheet of tomcat-as-goat. Keep the clean concept-art style of that sheet, not pixel art.
MANNER (applies to every frame): stiff, offended walk on all four legs, goat skin rug flapping, fake horns wobbling on his head.
FRAMES: exactly 8 frames side by side, left to right, one complete cycle of about 0.8 s at 10 frames per second: (1) near front leg and far hind leg reaching forward and just touching the ground; near hind leg and far front leg stretched back on their toes; body level; (2) near front and far hind legs carrying the weight, body at its lowest; near hind and far front paws lifted just off the ground; (3) near front and far hind legs straight under the body; near hind and far front legs bent and swinging forward past them; body high; (4) near front and far hind legs pushing off behind; near hind and far front legs reaching forward; body at its highest; (5) far front leg and near hind leg reaching forward and just touching the ground; far hind leg and near front leg stretched back on their toes; body level; (6) far front and near hind legs carrying the weight, body at its lowest; the other two paws lifted; (7) far front and near hind legs straight under the body; near front and far hind legs swinging forward past them; body high; (8) far front and near hind legs pushing off behind; near front and far hind legs reaching forward; leads back into frame 1.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of them.
END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not draw frame 1 twice.
HOLD STILL: tail hidden under the rug.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Ziegen: Gehen

**Shot W1-B16**

**Anhängen:** das fertige Konzeptblatt von Ziegen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
MANNER (applies to every frame): steady goat trot on four legs, head bobbing, the small goat's bell swinging.
FRAMES: exactly 8 frames side by side, left to right, one complete cycle of about 0.8 s at 10 frames per second: (1) near front leg and far hind leg reaching forward and just touching the ground; near hind leg and far front leg stretched back on their toes; body level; (2) near front and far hind legs carrying the weight, body at its lowest; near hind and far front paws lifted just off the ground; (3) near front and far hind legs straight under the body; near hind and far front legs bent and swinging forward past them; body high; (4) near front and far hind legs pushing off behind; near hind and far front legs reaching forward; body at its highest; (5) far front leg and near hind leg reaching forward and just touching the ground; far hind leg and near front leg stretched back on their toes; body level; (6) far front and near hind legs carrying the weight, body at its lowest; the other two paws lifted; (7) far front and near hind legs straight under the body; near front and far hind legs swinging forward past them; body high; (8) far front and near hind legs pushing off behind; near front and far hind legs reaching forward; leads back into frame 1.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of them.
END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not draw frame 1 twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zauberbesen: Fegen

**Shot W1-B17**

**Anhängen:** das fertige Konzeptblatt von Zauberbesen · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
START: From the neutral pose on the attached concept sheet of Zauberbesen. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: the broom sweeps left and right along the floor with its little arms; (2) 0.3 s: bristles fanning out, angry face.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the handle stays upright.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zauberbesen: Haarspur jagen

**Shot W1-B18**

**Anhängen:** das fertige Konzeptblatt von Zauberbesen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
START: From the neutral pose on the attached concept sheet of Zauberbesen. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the broom leans forward and rushes ahead, sweeping frantically along a trail of grey cat hair, straw bristles flying, at one end of the movement; (2) 0.4 s: the same action at the opposite end of the movement.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Haare verlieren

**Shot W1-B19**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: From the neutral pose on the attached concept sheet of the tomcat. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: the tomcat shakes himself vigorously from head to tail; (2) 0.6 s: a cloud of grey hair flies off and settles on the floor in a small heap.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: paws stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Lord Moderwort: Zaubern

**Shot W1-B20**

**Anhängen:** das fertige Konzeptblatt von Lord Moderwort · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
START: From the neutral pose on the attached concept sheet of Moderwort. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he raises his crooked wand; (2) 0.3 s: draws back, thrusts it forward; (3) 0.6 s: a violet spark shoots from the tip.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the handkerchief hand stays down.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Lord Moderwort: Niesen

**Shot W1-B21**

**Anhängen:** das fertige Konzeptblatt von Lord Moderwort · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
START: From the neutral pose on the attached concept sheet of Moderwort. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: his eyes water; (2) 0.3 s: he leans back with a deep breath; (3) 0.5 s: sneezes violently forward; (4) 0.8 s: the wand flies out of his hand to the right.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Fluch wird Käse: Effekt

**Shot W1-B22**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A violet magic bolt fizzles mid-air and turns into a slice of yellow cheese that drops out of the frame.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 48x48 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Pilz-Verwandlung: Effekt

**Shot W1-B23**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A green puff of smoke at head height, out of which a round plain brown mushroom cap pops up.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Smaugi: Kram hergeben

**Shot W1-B24**

**Anhängen:** das fertige Konzeptblatt von Smaugi · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
START: From the neutral pose on the attached concept sheet of Smaugi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he picks up a piece of junk with one claw; (2) 0.2 s: holds it up and looks at it thoughtfully; (3) 0.4 s: hands it forward to the right.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: body and tail stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Smaugi: Gerührt schniefen

**Shot W1-B25**

**Anhängen:** das fertige Konzeptblatt von Smaugi · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
START: From the neutral pose on the attached concept sheet of Smaugi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he sniffles, wipes a tear with the corner of his headscarf; (2) 0.2 s: a small puff of smoke rises from his nose.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Alwin Grauwald: Rühren

**Shot W1-B26**

**Anhängen:** das fertige Konzeptblatt von Alwin Grauwald · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Absent-minded old wizard, tall and thin, about 111 percent of the boy Max's height. Long grey beard tied with a red ribbon, round reading glasses on the tip of his nose, a floppy brown knitted cap. Faded mustard-yellow robe with small blue stars and brown patches, a white cooking apron over it, a soup ladle in his right hand. Standing upright, facing right, puzzled smile. No pointed hat, no purple or grey robe, no half-moon glasses, no staff.
START: From the neutral pose on the attached concept sheet of Alwin, standing at a big cauldron in front of him. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: he stirs with the soup ladle held in both hands in a slow full circle inside the cauldron, leaning forward a little: the ladle at the near rim of the pot; (2) 0.2 s: the ladle at the far right of the pot; (3) 0.4 s: the ladle at the back rim, handle tilted away, ladle half hidden behind the rim; (4) 0.6 s: the ladle at the far left of the pot.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: shoulders and beard follow the circle, puzzled smile, feet stay planted, the cauldron itself is not drawn.
CAMERA: static, strict side view; the game shows it facing left toward the cauldron, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Hämmern

**Shot W1-B27**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
START: From the neutral pose on the attached concept sheet of Schmied, standing behind the anvil, tongs in his left hand holding a glowing orange horseshoe flat on the anvil. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: he lifts the hammer back over his shoulder, raises it high above his head; (2) 0.2 s: swings it down; (3) 0.4 s: strikes the horseshoe with a burst of orange sparks; (4) 0.6 s: the hammer bounces back up a little, he lowers it to waist height and turns the horseshoe with the tongs, weary sigh.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted, the anvil itself is not drawn.
CAMERA: static, strict side view; the game shows it facing left toward the anvil, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Übungsbesen: Pixel jagen

**Shot W1-B28**

**Anhängen:** das fertige Konzeptblatt von Übungsbesen · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A small enchanted practice broom, about 39 percent of the boy Max's height, short birch handle, pale straw bristles tied with a red cord, two thin stick arms and a small wide-eyed face on the binding. Standing upright on its bristles, facing right, twitching eagerly.
START: From the neutral pose on the attached concept sheet of Übungsbesen. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the small broom twitches awake; (2) 0.4 s: shoots across the floor chasing a few grey cat hairs; (3) 0.8 s: crashes into a cupboard door and drops.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zauberbesen: Max wegfegen

**Shot W1-B29**

**Anhängen:** das fertige Konzeptblatt von Zauberbesen · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
START: From the neutral pose on the attached concept sheet of Zauberbesen and Max. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the broom rushes at Max and sweeps him off his feet in one big swing; (2) 0.8 s: Max tumbles away to the left like a heap of dust.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view; the game shows it broom facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wirt Humbert: Krug polieren

**Shot W1-B30**

**Anhängen:** das fertige Konzeptblatt von Wirt Humbert · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
START: From the neutral pose on the attached concept sheet of Humbert. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he polishes the pewter mug with the white cloth in small circles; (2) 0.2 s: holds it up to the light and nods, satisfied.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zauberstabmacher: Mustern

**Shot W1-B31**

**Anhängen:** das fertige Konzeptblatt von Zauberstabmacher · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Thin elderly wand maker, about 104 percent of the boy Max's height, with a long neck. Bald head with two tufts of white hair, an enormous brass magnifying monocle over his right eye. Bottle-green waistcoat over a white shirt, a yellow tape measure around his neck, grey trousers. Leaning forward curiously, hands clasped, facing right. No long grey hair, no wand in hand.
START: From the neutral pose on the attached concept sheet of Zauberstabmacher. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he leans forward and adjusts the brass monocle with one finger, his eye looks huge behind the lens; (2) 0.2 s: he stretches the yellow tape measure between both hands.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Rotkäppchen: Pakete balancieren

**Shot W1-B32**

**Anhängen:** das fertige Konzeptblatt von Rotkäppchen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Cheerful delivery girl, about 86 percent of the boy Max's height. Blond braids, freckles. Red hooded jacket with the hood down, red delivery cap, dark blue knee-length trousers, white sneakers. A small stack of two cardboard boxes held in both arms. Standing upright, facing right, big friendly smile.
START: From the neutral pose on the attached concept sheet of Rotkäppchen. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: she bounces on her toes, the two boxes in her arms wobble; (2) 0.2 s: she steadies them with her chin and smiles.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Maklerin: Notieren

**Shot W1-B33**

**Anhängen:** das fertige Konzeptblatt von Maklerin · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Sharp real estate agent, about 106 percent of the boy Max's height, slim. Tight grey hair bun, thin glasses on a chain, a pen behind her ear. Pointy black business suit with sharp shoulders, white blouse, black high heels. A clipboard held in her left hand. Standing upright, facing right, fake toothy smile.
START: From the neutral pose on the attached concept sheet of Maklerin. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: she takes the pen from behind her ear, ticks something on the clipboard; (2) 0.2 s: looks up with a fake toothy smile and pushes her glasses up.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Grimmzahn: Protestieren

**Shot W1-B34**

**Anhängen:** das fertige Konzeptblatt von Grimmzahn · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Stocky green goblin union boss, about 71 percent of the boy Max's height. Big underbite with two jutting teeth, bushy eyebrows. Yellow hard hat, brown work vest over a grey shirt, patched trousers, a silver whistle on a string. A blank protest sign on a stick held upright in his right hand, left fist on his hip. Facing right, stubborn look.
START: From the neutral pose on the attached concept sheet of Grimmzahn. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he pumps the blank protest sign up and down; (2) 0.2 s: blows the silver whistle with puffed cheeks.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Goblin-Arbeiter 1: Pickel schwingen

**Shot W1-B35**

**Anhängen:** das fertige Konzeptblatt von Goblin-Arbeiter 1 · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small skinny green goblin miner, about 61 percent of the boy Max's height. Pointy ears, long nose. Blue miner overalls, a dented grey helmet with a tiny lamp, small brown boots. A pickaxe resting on his shoulder. Standing upright, facing right, grumpy look.
START: From the neutral pose on the attached concept sheet of Goblin-Arbeiter 1. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he swings the pickaxe from his shoulder down in front of him and lifts it back, grumpy face, at one end of the movement; (2) 0.3 s: the same action at the opposite end of the movement.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Goblin-Arbeiter 2: Gähnen und strecken

**Shot W1-B36**

**Anhängen:** das fertige Konzeptblatt von Goblin-Arbeiter 2 · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small round green goblin miner, about 61 percent of the boy Max's height. Pointy ears, droopy eyelids. Orange miner overalls, no helmet, small brown boots. A big steaming mug held in both hands. Standing upright, facing right, sleepy look.
START: From the neutral pose on the attached concept sheet of Goblin-Arbeiter 2. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he leans on his tool, stretches both arms up with a huge yawn; (2) 0.2 s: slumps back.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wirtskatze Minka: Putzen

**Shot W1-B37**

**Anhängen:** das fertige Konzeptblatt von Wirtskatze Minka · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A slender elegant long-haired white cat, about 32 percent of the boy Max's height sitting, fluffy plume tail, blue eyes, pink nose. A pink ribbon bow around her neck, no collar. Sitting very upright, tail wrapped around her paws, facing right, proud look. No grey fur, no stripes.
START: From the neutral pose on the attached concept sheet of Minka. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: she licks one front paw and wipes it over her ear; (2) 0.2 s: sits proudly upright again.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: tail stays wrapped around her paws.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Taverne-Huhn: Aufplustern

**Shot W1-B38**

**Anhängen:** das fertige Konzeptblatt von Taverne-Huhn · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A plump brown hen, about 25 percent of the boy Max's height, small red comb, sitting in a small straw basket, one eye half closed, facing right, suspicious look.
START: From the neutral pose on the attached concept sheet of Taverne-Huhn. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the hen puffs up her feathers, turns her head to eye the viewer suspiciously; (2) 0.2 s: settles down again.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the straw basket stays still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmiede-Ziege: Im Kreis drehen

**Shot W1-B39**

**Anhängen:** das fertige Konzeptblatt von Schmiede-Ziege · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A small white goat, about 49 percent of the boy Max's height, short horns, a small brass bell on a red string, a sword blade sticking out of its chewing mouth. Standing on all fours, facing right, calm chewing look.
START: From the neutral pose on the attached concept sheet of Schmiede-Ziege. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: just starting: the goat turns once around on the spot in a small circle, still chewing the sword blade, and ends facing right again; (2) 0.8 s: the same action completed.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the bell keeps swinging.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## XXL-Ziege: Wiederkäuen

**Shot W1-B40**

**Anhängen:** das fertige Konzeptblatt von XXL-Ziege · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A huge shaggy brown goat, about 125 percent of the boy Max's height, as tall as a man, big curled horns. A blank brown paper delivery label tied around its neck with string. Standing on all fours, facing right, bored expression.
START: From the neutral pose on the attached concept sheet of XXL-Ziege. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the huge goat chews slowly with a sideways jaw; (2) 0.2 s: ears flick, bored half-closed eyes.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: legs stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schwan: Fauchen

**Shot W1-B41**

**Anhängen:** das fertige Konzeptblatt von Schwan · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A white swan floating on the water, about 43 percent of the boy Max's height, orange beak with a black knob, long neck in an S-curve, one eye narrowed. Facing right, suspicious look, a small ripple line at the waterline.
START: From the neutral pose on the attached concept sheet of Schwan. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the swan stretches its neck low over the water, opens its beak hissing and half-raises its wings; (2) 0.4 s: settles back.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: waterline stays the same.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wirtskatze Minka: Gehen

**Shot W1-B42**

**Anhängen:** das fertige Konzeptblatt von Wirtskatze Minka · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A slender elegant long-haired white cat, about 32 percent of the boy Max's height sitting, fluffy plume tail, blue eyes, pink nose. A pink ribbon bow around her neck, no collar. Sitting very upright, tail wrapped around her paws, facing right, proud look. No grey fur, no stripes.
START: From the neutral pose on the attached concept sheet of Minka. Keep the clean concept-art style of that sheet, not pixel art.
MANNER (applies to every frame): elegant slow cat walk, head held high, fluffy plume tail raised in a soft curve, pink bow stays on her neck.
FRAMES: exactly 8 frames side by side, left to right, one complete cycle of about 0.8 s at 10 frames per second: (1) near front leg and far hind leg reaching forward and just touching the ground; near hind leg and far front leg stretched back on their toes; body level; (2) near front and far hind legs carrying the weight, body at its lowest; near hind and far front paws lifted just off the ground; (3) near front and far hind legs straight under the body; near hind and far front legs bent and swinging forward past them; body high; (4) near front and far hind legs pushing off behind; near hind and far front legs reaching forward; body at its highest; (5) far front leg and near hind leg reaching forward and just touching the ground; far hind leg and near front leg stretched back on their toes; body level; (6) far front and near hind legs carrying the weight, body at its lowest; the other two paws lifted; (7) far front and near hind legs straight under the body; near front and far hind legs swinging forward past them; body high; (8) far front and near hind legs pushing off behind; near front and far hind legs reaching forward; leads back into frame 1.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of them.
END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not draw frame 1 twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Hufeisen ins Feuer legen

**Shot W1-B43**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
START: From the neutral pose on the attached concept sheet of Schmied, the hammer hanging from his belt. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: he takes the horseshoe with the long tongs; (2) 0.3 s: turns; (3) 0.5 s: walks two steps to the forge on his left, pushes the horseshoe deep into the glowing coals; (4) 0.8 s: holds it there and looks into the fire.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Blasebalg treten

**Shot W1-B44**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: From the Schmied reference sprite at the forge: he pushes the long wooden bellows handle down with his right hand and lets it rise again; (2) 0.2 s: the coals flare up brighter at each push, sweat on his forehead; (3) 0.4 s: tongs held steady in the fire with his left hand.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Glühendes Eisen zum Amboss

**Shot W1-B45**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: From the Schmied reference sprite at the forge: he pulls the glowing orange horseshoe out of the coals with the tongs; (2) 0.3 s: turns; (3) 0.5 s: walks two steps back to the anvil; (4) 0.8 s: lays the horseshoe flat on it and takes the hammer from his belt.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the horseshoe glows in every frame.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Abschrecken

**Shot W1-B46**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
START: From the neutral pose on the attached concept sheet of Schmied. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he dips the glowing horseshoe with the tongs into a wooden water bucket beside the anvil; (2) 0.3 s: a big white cloud of steam hisses up around his arm; (3) 0.6 s: he leans back from the steam and squints.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Reden

**Shot W1-B47**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
START: From the neutral pose on the attached concept sheet of Schmied. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks while resting the hammer on his shoulder; (2) 0.3 s: points with the hammer handle for emphasis, mouth opening and closing, weary eyebrows.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Alwin Grauwald: Reden mit der Kelle

**Shot W1-B48**

**Anhängen:** das fertige Konzeptblatt von Alwin Grauwald · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Absent-minded old wizard, tall and thin, about 111 percent of the boy Max's height. Long grey beard tied with a red ribbon, round reading glasses on the tip of his nose, a floppy brown knitted cap. Faded mustard-yellow robe with small blue stars and brown patches, a white cooking apron over it, a soup ladle in his right hand. Standing upright, facing right, puzzled smile. No pointed hat, no purple or grey robe, no half-moon glasses, no staff.
START: From the neutral pose on the attached concept sheet of Alwin. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks and gestures with the soup ladle in his right hand, lifts it like a pointer; (2) 0.2 s: waves it in small circles; (3) 0.4 s: a drop of soup drips from it, the other hand pushes his glasses up, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Toadi: Reden

**Shot W1-B49**

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the neutral pose on the attached concept sheet of Toadi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks nervously, wringing his hands in front of his chest; (2) 0.2 s: throws both small hands up; (3) 0.4 s: the mushroom hat brim wobbling, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wirt Humbert: Reden

**Shot W1-B50**

**Anhängen:** das fertige Konzeptblatt von Wirt Humbert · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
START: From the neutral pose on the attached concept sheet of Humbert. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks cheerfully; (2) 0.2 s: raises the pewter mug like a toast; (3) 0.4 s: points at the listener with the mug hand, mustache twitching, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gollo: Reden

**Shot W1-B51**

**Anhängen:** das fertige Konzeptblatt von Gollo · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small nervous man, deliberately short at about 147 pixels. Round worried eyes, thinning brown hair, pink skin, a stubbly chin. Lost in a far too large brown traveling cloak that drags on the floor, grey trousers peeking out. A tiny dark red ring box clutched to his chest with both hands. Hunched, facing right. No grey skin, no loincloth, no bald head, no huge pale eyes.
START: From the neutral pose on the attached concept sheet of Gollo. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks in a whisper, clutching the tiny ring box to his chest, glancing left and right, hunching lower, mouth opening and closing, at one end of the movement; (2) 0.3 s: the same action at the opposite end of the movement.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the cloak hem stays on the floor.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zauberstabmacher: Reden

**Shot W1-B52**

**Anhängen:** das fertige Konzeptblatt von Zauberstabmacher · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Thin elderly wand maker, about 104 percent of the boy Max's height, with a long neck. Bald head with two tufts of white hair, an enormous brass magnifying monocle over his right eye. Bottle-green waistcoat over a white shirt, a yellow tape measure around his neck, grey trousers. Leaning forward curiously, hands clasped, facing right. No long grey hair, no wand in hand.
START: From the neutral pose on the attached concept sheet of Zauberstabmacher. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks with one finger raised like a teacher; (2) 0.3 s: leans forward and taps his monocle, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Rotkäppchen: Reden

**Shot W1-B53**

**Anhängen:** das fertige Konzeptblatt von Rotkäppchen · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Cheerful delivery girl, about 86 percent of the boy Max's height. Blond braids, freckles. Red hooded jacket with the hood down, red delivery cap, dark blue knee-length trousers, white sneakers. A small stack of two cardboard boxes held in both arms. Standing upright, facing right, big friendly smile.
START: From the neutral pose on the attached concept sheet of Rotkäppchen. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: she talks brightly; (2) 0.2 s: shifts the two boxes onto one hip and gestures with the free hand; (3) 0.4 s: braids bouncing, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Maklerin: Reden

**Shot W1-B54**

**Anhängen:** das fertige Konzeptblatt von Maklerin · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Sharp real estate agent, about 106 percent of the boy Max's height, slim. Tight grey hair bun, thin glasses on a chain, a pen behind her ear. Pointy black business suit with sharp shoulders, white blouse, black high heels. A clipboard held in her left hand. Standing upright, facing right, fake toothy smile.
START: From the neutral pose on the attached concept sheet of Maklerin. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: she talks fast; (2) 0.2 s: taps the clipboard with her pen; (3) 0.4 s: points the pen at the listener, fake toothy smile, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Grimmzahn: Reden

**Shot W1-B55**

**Anhängen:** das fertige Konzeptblatt von Grimmzahn · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Stocky green goblin union boss, about 71 percent of the boy Max's height. Big underbite with two jutting teeth, bushy eyebrows. Yellow hard hat, brown work vest over a grey shirt, patched trousers, a silver whistle on a string. A blank protest sign on a stick held upright in his right hand, left fist on his hip. Facing right, stubborn look.
START: From the neutral pose on the attached concept sheet of Grimmzahn. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks stubbornly; (2) 0.2 s: shakes his left fist; (3) 0.4 s: thumps the protest sign stick on the ground, underbite jutting, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Troll Waldemar: Reden

**Shot W1-B56**

**Anhängen:** das fertige Konzeptblatt von Troll Waldemar · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
START: From the neutral pose on the attached concept sheet of Waldemar. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks like a strict official; (2) 0.2 s: taps the rule book with one big finger; (3) 0.4 s: raises his nose higher, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zeldina: Reden

**Shot W1-B57**

**Anhängen:** das fertige Konzeptblatt von Zeldina · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Young athletic princess, about 104 percent of the boy Max's height, clearly a princess at first glance but dressed for moving house. Short brown bob with freckles, a polished small golden tiara with a tiny red gem, tied on under her chin with a piece of string. A deep teal princess gown with puffed sleeves, a fitted bodice with gold trim and small pearl buttons, the long skirt hitched up and knotted at one side above the knee, showing sturdy brown lace-up boots. Pearl earrings, white gloves. A cardboard moving box under her left arm, a plain short sword lying across the top of the box. Standing upright and proud, facing right, determined grin. No long blond hair, no pink dress, no green tunic, no pointed ears.
START: From the neutral pose on the attached concept sheet of Zeldina. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: she talks energetically; (2) 0.3 s: shifts the moving box on her hip and gestures with the free gloved hand, tiara string bobbing, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Lord Moderwort: Reden

**Shot W1-B58**

**Anhängen:** das fertige Konzeptblatt von Lord Moderwort · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
START: From the neutral pose on the attached concept sheet of Moderwort. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks sulkily; (2) 0.2 s: dabs his nostril slits with the handkerchief, waves the crooked wand weakly; (3) 0.4 s: sleeves flopping, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Smaugi: Reden

**Shot W1-B59**

**Anhängen:** das fertige Konzeptblatt von Smaugi · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
START: From the neutral pose on the attached concept sheet of Smaugi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he talks with a tired sigh; (2) 0.2 s: waves the feather duster a little, droopy eyes blinking; (3) 0.4 s: a tiny puff of smoke from his nose, mouth opening and closing.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: body and tail stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Goblin-Arbeiter 1: Reden

**Shot W1-B60**

**Anhängen:** das fertige Konzeptblatt von Goblin-Arbeiter 1 · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small skinny green goblin miner, about 61 percent of the boy Max's height. Pointy ears, long nose. Blue miner overalls, a dented grey helmet with a tiny lamp, small brown boots. A pickaxe resting on his shoulder. Standing upright, facing right, grumpy look.
START: From the neutral pose on the attached concept sheet of Goblin-Arbeiter 1. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he grumbles, the pickaxe resting on his shoulder; (2) 0.2 s: jabs a thumb backward, mouth opening and closing.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Taverne: Kaminfeuer

**Shot W1-B61**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Taverne); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the fire of the stone fireplace, matching the attached background crop in shape, colors and light: tall orange and yellow flames lick upward and flicker, tongues split and merge again, the glowing logs pulse from red to orange, two or three sparks rise and fade.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 70x50 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Taverne: Fondue blubbert

**Shot W1-B62**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Taverne); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the surface of the yellow cheese fondue in the small copper pot, matching the attached background crop: a bubble swells, pops with a small splash, the next one rises elsewhere, a thin wisp of steam curls up and fades.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 40x40 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Schmiede: Esse glüht

**Shot W1-B63**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Schmiede); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the glowing coals and flames inside the stone forge, matching the attached background crop: the coals pulse from deep red to bright orange in slow waves, small yellow flames with blue roots dance above them, a few sparks drift up into the chimney.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 80x60 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Schmiede: Funken beim Schlag

**Shot W1-B64**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A burst of bright yellow and orange sparks from a hammer strike on an anvil, flying out in a low fan to both sides, arcing down and fading to dark red dots.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, plays once, each frame 48x32 pixels in the game.
END: the last frame almost empty.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Klassenzimmer: Kessel blubbert

**Shot W1-B65**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Klassenzimmer); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the bright green potion surface of the black cauldron and the steam above it, matching the attached background crop: round bubbles swell and pop, green steam rises in soft curls and drifts apart, the small fire under the cauldron flickers.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 60x60 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Zauberstab-Laden: Schachtel ruckelt

**Shot W1-B66**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Zauberstab-Laden); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A narrow wooden wand box in its shelf slot, matching the attached background crop: it jiggles, slides halfway out with a jolt, a tiny puff of golden sparkles escapes from the lid, then it slides back into place.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 24x16 pixels in the game.
END: the last frame equals the first.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Troll-Brücke: Fisch springt

**Shot W1-B67**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small silver trout leaps out of a clear brook in a short arc, shining in the sun, and dives back in; a ring of ripples and a few drops remain and fade.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 32x32 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Troll-Brücke: Schmetterling

**Shot W1-B68**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small lemon-yellow butterfly seen from the side, wings fully open, half closed, closed upright, half open again.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 12x12 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Zauberwald: Eule im hohlen Baum

**Shot W1-B69**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Zauberwald); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small round brown owl peeks out of a dark tree hollow, matching the attached background crop: it blinks its big yellow eyes slowly, turns its head far to one side, back again, and sinks back into the dark.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 32x32 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Fackel: Brennen

**Shot W1-B70**

**Anhängen:** nichts (Effekt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: The flame of an iron wall torch, for every torch in the tower, the mine and the throne rooms: a warm orange flame with a yellow core flickers, leans a little left and right, its tip splits and closes again, one tiny spark rises.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 16x32 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Luftschloss: Wimpel flattern

**Shot W1-B71**

**Anhängen:** nichts (Effekt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A long pale pink triangular pennant on the tip of a thin golden pole, waving in a soft wind in a wave that runs from the pole to the tip.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 24x12 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Luftschloss: Brunnen plätschert

**Shot W1-B72**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Luftschloss); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the water of the small stone fountain, matching the attached background crop: a thin jet rises from the center, falls back in a soft umbrella, splashes into the basin with glittering drops.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 40x30 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Goblin-Bergwerk: Steinchen rieseln

**Shot W1-B73**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A thin trickle of grey dust and small pebbles falls from a crack in a wooden ceiling beam, lands at the bottom in a little puff of dust that spreads and settles.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 16x48 pixels in the game.
END: the last frame almost empty.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Glitzern: Funkeln

**Shot W1-B74**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A tiny four-pointed white and pale yellow star twinkle as on gold coins, water or glass: a dot grows into a cross-shaped sparkle, turns slightly, shrinks back to a dot and vanishes.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 12x12 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Wasserschloss: Ente schwimmt

**Shot W1-B75**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small brown mallard duck swimming to the right on calm water, seen from the side, head bobbing, a small V-shaped wake behind it, the waterline across its body stays level.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 24x16 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Dorfplatz: Huhn pickt

**Shot W1-B76**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small brown hen on cobblestones seen from the side facing right, takes a step, bends down and pecks twice at the ground, lifts the head and looks around with a jerk.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 20x20 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Toadi: Hände ringen

**Shot W1-B77**

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the neutral pose on the attached concept sheet of Toadi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he wrings his small hands nervously in front of his belly; (2) 0.2 s: glances left and right; (3) 0.4 s: pulls the brim of his mushroom hat straight with both hands and lets go.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gollo: Ringschachtel streicheln

**Shot W1-B78**

**Anhängen:** das fertige Konzeptblatt von Gollo · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small nervous man, deliberately short at about 147 pixels. Round worried eyes, thinning brown hair, pink skin, a stubbly chin. Lost in a far too large brown traveling cloak that drags on the floor, grey trousers peeking out. A tiny dark red ring box clutched to his chest with both hands. Hunched, facing right. No grey skin, no loincloth, no bald head, no huge pale eyes.
START: From the neutral pose on the attached concept sheet of Gollo. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he strokes the tiny ring box in his hands with one finger; (2) 0.2 s: hugs it to his chest; (3) 0.4 s: looks around suspiciously over his shoulder and hunches lower.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the cloak hem stays on the floor.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zeldina: Kiste absetzen und Schwert prüfen

**Shot W1-B79**

**Anhängen:** das fertige Konzeptblatt von Zeldina · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Young athletic princess, about 104 percent of the boy Max's height, clearly a princess at first glance but dressed for moving house. Short brown bob with freckles, a polished small golden tiara with a tiny red gem, tied on under her chin with a piece of string. A deep teal princess gown with puffed sleeves, a fitted bodice with gold trim and small pearl buttons, the long skirt hitched up and knotted at one side above the knee, showing sturdy brown lace-up boots. Pearl earrings, white gloves. A cardboard moving box under her left arm, a plain short sword lying across the top of the box. Standing upright and proud, facing right, determined grin. No long blond hair, no pink dress, no green tunic, no pointed ears.
START: From the neutral pose on the attached concept sheet of Zeldina. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: she sets the moving box down at her feet; (2) 0.3 s: takes the sword lying on top of it; (3) 0.5 s: holds it up and squints along the blade, nods; (4) 0.8 s: lays it back on the box and lifts the box onto her hip again.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Troll Waldemar: Im Regelbuch blättern

**Shot W1-B80**

**Anhängen:** das fertige Konzeptblatt von Troll Waldemar · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
START: From the neutral pose on the attached concept sheet of Waldemar. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he licks one big finger; (2) 0.2 s: turns a page of the thick rule book, runs the finger down the page; (3) 0.4 s: raises his nose high and gives a satisfied sniff.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Lord Moderwort: Nase putzen

**Shot W1-B81**

**Anhängen:** das fertige Konzeptblatt von Lord Moderwort · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
START: From the neutral pose on the attached concept sheet of Moderwort. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he lifts the handkerchief, blows his nostril slits into it with a shudder; (2) 0.2 s: wipes them; (3) 0.4 s: sniffs pitifully and lets the hand sink, the wand hanging limp in the other hand.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Smaugi: Staubwedel

**Shot W1-B82**

**Anhängen:** das fertige Konzeptblatt von Smaugi · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
START: From the neutral pose on the attached concept sheet of Smaugi. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he dusts the air in front of him with the feather duster in quick little flicks; (2) 0.2 s: a few grey dust specks fly; (3) 0.4 s: he sneezes a tiny puff of smoke and keeps dusting.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: body and tail stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Alwin Grauwald: Lesebrille und Kochbuch

**Shot W1-B83**

**Anhängen:** das fertige Konzeptblatt von Alwin Grauwald · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Absent-minded old wizard, tall and thin, about 111 percent of the boy Max's height. Long grey beard tied with a red ribbon, round reading glasses on the tip of his nose, a floppy brown knitted cap. Faded mustard-yellow robe with small blue stars and brown patches, a white cooking apron over it, a soup ladle in his right hand. Standing upright, facing right, puzzled smile. No pointed hat, no purple or grey robe, no half-moon glasses, no staff.
START: From the neutral pose on the attached concept sheet of Alwin. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he pushes his reading glasses up his nose with one finger; (2) 0.2 s: holds a small open cookbook close to his face, frowns; (3) 0.4 s: turns a page and nods.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Schmied: Schweiß abwischen

**Shot W1-B84**

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
START: From the neutral pose on the attached concept sheet of Schmied. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: he lowers the hammer; (2) 0.3 s: wipes the sweat off his forehead with the back of his forearm, blows out his cheeks wearily; (3) 0.6 s: shakes his head and grips the hammer again.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Goblin-Arbeiter 2: Reden

**Shot W1-B85**

**Anhängen:** das fertige Konzeptblatt von Goblin-Arbeiter 2 · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small round green goblin miner, about 61 percent of the boy Max's height. Pointy ears, droopy eyelids. Orange miner overalls, no helmet, small brown boots. A big steaming mug held in both hands. Standing upright, facing right, sleepy look.
START: From the neutral pose on the attached concept sheet of Goblin-Arbeiter 2. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: he talks lazily, leaning on his tool, raises his coffee mug in a little toast; (2) 0.2 s: takes a sip and mutters, mouth opening and closing.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zauberwald: Eichhörnchen

**Shot W1-B86**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small red squirrel with a bushy tail on a tree trunk, seen from the side: it peeks out head first, freezes, twitches its tail twice, nibbles a nut held in both paws and scurries up out of the frame.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 24x32 pixels in the game.
END: the last frame is empty.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Goblin-Bergwerk: Lore rollt

**Shot W1-B87**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small rusty iron mine cart full of grey rocks rolling to the right on a rail, seen from the side, the spoked wheels turning, the cart rattling slightly so a pebble jumps on top.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 48x32 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Kerze: Brennen

**Shot W1-B88**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A small candle flame for the candles in the tavern and the tower rooms: a yellow teardrop flame with an orange edge and a pale core sways gently, stretches up and shrinks a little.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 8x16 pixels in the game.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

# Gegenstände

Je Sammelbild den Block komplett in Gemini kopieren und Max' Konzeptblatt als Stilvorlage
anhängen, keine Skizze. Umrechnen mit `tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.

## Dorf und Taverne (3×3)

**Shot W1-G01**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x3 grid, same scale, left to right: a single shiny gold coin; a small clay bowl of melted yellow cheese fondue; a fluffy white goat skin rug, folded; a paper order slip with blank lines; an empty wooden bucket with a rope handle; the same bucket full of water; a plain wooden cooking spoon without cheese; a rolled-up wanted poster showing a blank face; a small folded paper note with a pencil smudge.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Zaubertrank (2×4)

**Shot W1-G02**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x4 grid, same scale, left to right, last cell empty: an empty clay jug with a blank name tag on a string; the same jug full of white goat milk; a small glowing blue mushroom; a crumpled paper note with short blank rhyme lines; a round bottle of glowing yellow potion with a cork; a magic bean with a tiny sparkle; the red-and-white striped sock bulging with pink pollen.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Flaschen (1×6)

**Shot W1-G03**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x6 row, left to right, standing on one baseline: six small potion bottles of identical opaque dark brown glass with cork stoppers, bottles two and five twice as tall as the others, no labels, nothing visible inside, otherwise no differences in color or shape.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Wald und Turm (2×4)

**Shot W1-G04**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x4 grid, same scale, left to right, last cell empty: a red plastic squeeze bottle with a blank label; a rolled parchment contract with an empty signature line; the same contract unrolled with a red ketchup smear on the signature line; an old school report card with blank grade lines and a small heart doodle in the corner; a large golden dragon egg with fine overlapping scales; a rusty sword with a small blank name tag on a string; a fizzing green potion bottle with a blank label.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Bohnenranke (1×1)

**Shot W1-G05**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: Single world sprite, about 128x360, not an inventory icon: a giant green beanstalk growing out of a small patch of dark soil, twisting upward with broad heart-shaped leaves and curly tendrils, thick at the bottom, leaving the frame at the top edge. Same green as the beanstalk top in the Luftschloss scene.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Niesrosen (1×2)

**Shot W1-G06**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2, world sprite about 100 pixels wide, not an inventory icon, same bush in both cells: left a round green bush with large closed pink rose buds; right the same bush with fully opened pink roses releasing a cloud of pink pollen.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Smaugis Kram (3×3, Rätsel 12)

**Shot W1-G07**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x3 grid of dragon hoard junk at world-sprite scale, about 32 to 64 pixels each, left to right: a bundle of rusty swords without name tags tied with rope; a bundle of old burnt-out torches tied with string; a dusty golden chandelier; a pile of gold coins; a rusty helmet; a cracked hand mirror; a single striped sock; a dented teapot; a small treasure chest.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Deko Welt 1 (3×3)

**Shot W1-G08**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x3 grid of look-only props at world-sprite scale, about 32 to 64 pixels each, left to right: two coconut halves; a holey red-and-white striped sock lying flat; a single glass slipper; a small grumpy coffee machine with a blank crossed-out sticker; a thin black diary with a skull on the cover; a small clay ocarina; a heavy smithing hammer with a wooden handle, lying on its side; a red-hot glowing horseshoe held in black iron tongs; a tiny student in a dark school robe sitting backwards on a flying broom, waving.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```
