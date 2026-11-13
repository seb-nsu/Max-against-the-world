# Vertical Slice: Prompts in Arbeitsreihenfolge

Erzeugt von `tools/prompts_zusammensetzen.py` (Liste SLICE dort, Blöcke aus `welt-1.md`).
Prolog und Welt 1, Rätsel 1 bis 4 (`../../03-produktion.md`, Stufe 2). Von oben nach unten
abarbeiten: erst Räume (Skizze anhängen), dann Figuren (Max' Blatt anhängen), dann Sammelbilder.
Jeden fertigen Raum mit `python3 tools/stimmigkeit.py --kandidat bild.png` gegen den Prolog prüfen.

## Noch offen aus dem Prolog

- Pixel: Posenblatt Stehen und Schlafen (Prompt im Gespräch vom 12. November, Pixels Blatt anhängen).

## Nahansicht für Rätsel 4

- Märchen-Satzung am Brückenschild: Motiv (1) in `../welt-1.md`, Zeile „Nahansichten Welt 1“,
  mit Baustein HINTERGRUND; die Schrift kommt von Hand dazu.

# Räume

## 1. Dorfplatz

*Ankunft, Dorfbrett und Brunnen; R1 bis R4 laufen hier durch*

**Zustände:** Vorher und nachher Rätsel 8 (Bohnenranke als eigenes Sprite)

**Layout-Skizze:** [Dorfplatz Unterbrösel](../skizzen/welt-1/dorfplatz.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical. Fairy tale village square at midday, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: a crooked half-timbered tavern with an open door and a blank hanging sign; a small stable with an open door and an empty straw bale; a tiny ring shop with a blank sale board in its window; a narrow wand shop with a round window and an open door. RIGHT HALF, left to right: a bare patch of dark soil; a round stone wishing well with a wooden roof and a wooden bucket on its rim, on the roof a stone statue of a donkey, a dog, a cat and a rooster stacked on each other; a wooden notice board with a few blank pinned notes and one large wanted poster with a blank face; the open front of a blacksmith shed with a glowing forge; a dirt path leaving at the right edge toward a forest. Background: round houses with crooked roofs, a winding path up a green hill to a crooked school, and high in the blue sky a small pastel castle floating on a cloud. Cobblestone floor with gentle depth in the lower third kept clear for walking. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 2. Taverne

*R1 Taverne-Coup: Humbert, Gollo, Minka, Huhn*

**Layout-Skizze:** [Taverne](../skizzen/welt-1/taverne.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Interior of a cozy fantasy tavern in the evening, 640x360. Left: a long wooden bar with mugs, a bowl of grey fish soup, a green bottle with a blank label and a small blank menu board; a large bubbling yellow cheese fondue pot on an iron stand at the bar's right end; a small cellar door in the back wall behind the bar. Center: a bare wooden wall panel, below it an empty straw-filled basket on a crate. Right: a stone fireplace, above it a rack of four rusty swords, each with a small blank name tag, and a row of empty name tags; a fluffy white goat skin rug on the floor in front; the entrance door at the right edge. Low dark ceiling beams across the top, wide enough for a cat to walk along. Plank floor with gentle depth in the lower third kept clear. Warm firelight, light from upper left. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 3. Zauberstab-Laden

*R2 Kochlöffel*

**Layout-Skizze:** [Zauberstab-Laden](../skizzen/welt-1/zauberstabladen.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Tiny cramped wand shop, 640x360. Left: a small round window high in the wall, below it floor-to-ceiling shelves of narrow wooden boxes with a rolling ladder leaning on them. Center: a wooden counter with a purple velvet cushion on top, holding a toothpick, a folding ruler and a plain wooden cooking spoon side by side, clearly separated. Right: more box shelves and the shop door at the right edge. Worn plank floor with gentle depth in the lower third kept clear. Dusty light from upper left, floating dust specks. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 4. Schmiede

*R3 erste Ziege*

**Layout-Skizze:** [Schmiede](../skizzen/welt-1/schmiede.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Village blacksmith workshop open to the street, midday, 640x360. Left: a glowing stone forge with leather bellows. Center: a heavy black anvil on a tree stump, a few chewed sword stumps on the ground. Right: a wall rack of shiny new pots, pans and ladles, each with a small blank name tag on a string, and an empty clay jug with its own blank tag hanging among them; the open street at the right edge as exit. Packed earth floor with gentle depth in the lower third kept clear for walking and for the goat. Orange forge glow and sparks, daylight from upper left. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 5. Troll-Brücke

*R3 und R4, Waldemar*

**Layout-Skizze:** [Troll-Brücke](../skizzen/welt-1/trollbruecke.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical. Old arched stone bridge over a babbling brook in a sunny meadow, afternoon, 640x360, seen straight from the front, the bridge deck a horizontal band in the middle of the image. Left: the dirt path from the village entering at the left edge and rising up a short ramp onto the bridge, a medium wooden sign with blank carved paragraphs standing at the left end of the bridge. Center: the bridge spanning the brook, which flows through under the arch and straight toward the viewer to the bottom edge; inside the arch on a dry stone ledge above the water an old brass horn gramophone and loose blank music sheets. Right: the path coming down a ramp from the bridge and continuing into a dark forest at the right edge, open grass beside the bridge, and a narrow side path branching into the background toward a small pink castle on a lake. Wildflowers, grass floor with gentle depth in the lower third kept clear. Bright sun from upper left. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 6. Klassenzimmer

*Hoggelwarz; im Slice nur Kulisse mit Alwin und Toadi*

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Crooked magic school classroom by day with green walls and dark ceiling beams, 640x360. Left: the classroom door at the left edge, two tall arched windows (a narrow one beside the door), directly below the larger one on the floor a big black cauldron bubbling green over a small fire. Center: a blank chalkboard on the back wall, directly in front of it two wobbly wooden desks with benches facing the chalkboard, next to them an empty small wooden stool. Right: a wooden wall shelf with six potion bottles in one row, all of identical opaque dark brown glass with cork stoppers, the second and fifth twice as tall as the others, no labels, nothing visible inside; next to it a tall cupboard with its doors open. Stone floor with gentle depth in the lower third kept clear. Cool daylight from upper left. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked.
```

## 7. Zauberwald

*R3 Rotkäppchens Lieferdienst*

**Zustände:** Niesrosen geschlossen und offen als eigenes Sprite

**Layout-Skizze:** [Zauberwald](../skizzen/welt-1/zauberwald.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical. Enchanted forest at dusk, 640x360. Left: the path back to the bridge at the left edge, giant colorful mushrooms with a cluster of small glowing blue mushrooms at their base. Center: a small mossy clearing with free space for a rose bush, behind it three pumpkins stacked into a wobbly tower. Right: a small red delivery handcart on the path, loaded with cardboard boxes, a red squeeze bottle hanging on its side; behind it a dark mine entrance with wooden beams in a rocky slope at the right edge. Twisted trees, fireflies, forest floor with gentle depth in the lower third kept clear. Golden light beam from upper left through the canopy. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 8. Wasserschloss (Gag-Szene)

*Gag-Szene mit Schwan und Toadi*

**Layout-Skizze:** [Wasserschloss](../skizzen/welt-1/wasserschloss.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical. Small pastel pink fairy tale castle on a lake, morning, 640x360. Left: the path from the bridge at the left edge, reeds and a small rowing boat at the shore. Center: a wooden footbridge across the water to an open castle gate with a blank wooden sign hanging on it; through the gate a courtyard with stacked moving boxes and a rolled-up carpet. Right: open calm water with free space for a swan, the castle's round tower behind. Shore and footbridge form the floor with gentle depth in the lower third, kept clear. Calm blue water, light from upper left. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## 9. Goblin-Bergwerk

*im Slice nur Kulisse mit Grimmzahn und zwei Goblins*

**Zustände:** Rune-Tür zu und offen

**Layout-Skizze:** [Goblin-Bergwerk](../skizzen/welt-1/bergwerk.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Mine tunnel with wooden support beams, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: the bright tunnel mouth to the forest at the left edge, rails leading in, two mine carts on the rails, piles of rubble and a pickaxe rack on the wall. RIGHT HALF, left to right: protest signs with blank boards leaning on the wall, a picket line painted as a dashed stripe across the floor, an empty wooden crate by the wall; then the tunnel narrows and ends in a smooth stone wall with a closed secret door outlined by one faint glowing rune at the right edge. Rocky floor with gentle depth in the lower third kept clear. Very dim flickering torches on the beams, light from upper left. Second version: identical, but the rune door stands open on stone steps lit in violet. dim torch-lit mine palette of earthy browns and mossy greens with small warm gold highlights, friendly rather than scary. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

# Figuren

## 10. Wirt Humbert

*R1*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
```

## 11. Gollo

*R1*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Small nervous man, deliberately short at about 147 pixels. Round worried eyes, thinning brown hair, pink skin, a stubbly chin. Lost in a far too large brown traveling cloak that drags on the floor, grey trousers peeking out. A tiny dark red ring box clutched to his chest with both hands. Hunched, facing right. No grey skin, no loincloth, no bald head, no huge pale eyes.
```

## 12. Wirtskatze Minka

*R1, Figurenwechsel*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A slender elegant long-haired white cat, about 32 percent of the boy Max's height sitting, fluffy plume tail, blue eyes, pink nose. A pink ribbon bow around her neck, no collar. Sitting very upright, tail wrapped around her paws, facing right, proud look. No grey fur, no stripes.
```

## 13. Zauberstabmacher

*R2*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Thin elderly wand maker, about 104 percent of the boy Max's height, with a long neck. Bald head with two tufts of white hair, an enormous brass magnifying monocle over his right eye. Bottle-green waistcoat over a white shirt, a yellow tape measure around his neck, grey trousers. Leaning forward curiously, hands clasped, facing right. No long grey hair, no wand in hand.
```

## 14. Schmied

*R3*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
```

## 15. Schmiede-Ziege

*R3*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A small white goat, about 49 percent of the boy Max's height, short horns, a small brass bell on a red string, a sword blade sticking out of its chewing mouth. Standing on all fours, facing right, calm chewing look.
```

## 16. Rotkäppchen

*R3*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Cheerful delivery girl, about 86 percent of the boy Max's height. Blond braids, freckles. Red hooded jacket with the hood down, red delivery cap, dark blue knee-length trousers, white sneakers. A small stack of two cardboard boxes held in both arms. Standing upright, facing right, big friendly smile.
```

## 17. XXL-Ziege

*R3*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A huge shaggy brown goat, about 125 percent of the boy Max's height, as tall as a man, big curled horns. A blank brown paper delivery label tied around its neck with string. Standing on all fours, facing right, bored expression.
```

## 18. Pixel als Ziege

*R3 und R4, eigenes Pixel-Blatt anhängen*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Pixel, a chubby round tomcat about 32 percent of the boy Max's height when sitting, short legs, light silver-grey fur (#c0cbdc) with three darker blue-grey stripes on his back (#5a6988), white chest and white paws, a very fluffy tail, a notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose, a red collar (#e43b44) with a small round silver speaker and a clearly visible two-pixel turquoise light (#2ce8f5), not orange, no tabby markings on the face. About 37 percent of the boy Max's height in costume: a fluffy white goat skin rug draped over his back, two small fake horns tied on his head, red collar still visible. Standing on all fours, facing right, deeply offended look.
```

## 19. Troll Waldemar

*R4*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
```

## 20. Toadi

*Ankunft*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
```

## 21. Taverne-Huhn

*Kulisse*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A plump brown hen, about 25 percent of the boy Max's height, small red comb, sitting in a small straw basket, one eye half closed, facing right, suspicious look.
```

## 22. Alwin Grauwald

*Kulisse*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Absent-minded old wizard, tall and thin, about 111 percent of the boy Max's height. Long grey beard tied with a red ribbon, round reading glasses on the tip of his nose, a floppy brown knitted cap. Faded mustard-yellow robe with small blue stars and brown patches, a white cooking apron over it, a soup ladle in his right hand. Standing upright, facing right, puzzled smile. No pointed hat, no purple or grey robe, no half-moon glasses, no staff.
```

## 23. Schwan

*Kulisse*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A white swan floating on the water, about 43 percent of the boy Max's height, orange beak with a black knob, long neck in an S-curve, one eye narrowed. Facing right, suspicious look, a small ripple line at the waterline.
```

## 24. Grimmzahn

*Kulisse*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Stocky green goblin union boss, about 71 percent of the boy Max's height. Big underbite with two jutting teeth, bushy eyebrows. Yellow hard hat, brown work vest over a grey shirt, patched trousers, a silver whistle on a string. A blank protest sign on a stick held upright in his right hand, left fist on his hip. Facing right, stubborn look.
```

## 25. Goblin-Arbeiter 1

*Kulisse*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Small skinny green goblin miner, about 61 percent of the boy Max's height. Pointy ears, long nose. Blue miner overalls, a dented grey helmet with a tiny lamp, small brown boots. A pickaxe resting on his shoulder. Standing upright, facing right, grumpy look.
```

## 26. Goblin-Arbeiter 2

*Kulisse*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Small round green goblin miner, about 61 percent of the boy Max's height. Pointy ears, droopy eyelids. Orange miner overalls, no helmet, small brown boots. A big steaming mug held in both hands. Standing upright, facing right, sleepy look.
```

## 27. Streik-Goblin 1

*Kulisse, stumm*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Small stocky green goblin miner, about 58 percent of the boy Max's height. Pointy ears, bushy eyebrows. Brown miner overalls, a red bandana, small brown boots. Holding a blank wooden protest sign on a stick high above his head with both hands. Standing upright, facing right, determined look, mouth open as if chanting.
```

## 28. Streik-Goblin 2

*Kulisse, stumm*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Small thin green goblin miner, about 56 percent of the boy Max's height. Very long pointy ears, crooked nose. Grey miner overalls with patches, a too-big helmet tilted over one eye, small brown boots. Arms crossed, a blank cardboard sign hanging on a string around his neck. Standing upright, facing right, stubborn look.
```

## 29. Streik-Goblin 3

*Kulisse, stumm*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Small old green goblin miner, about 50 percent of the boy Max's height, slightly hunched. Grey beard, pointy ears. Faded green overalls, a knitted cap, small brown boots. Sitting on an upturned bucket, knitting a long scarf, a blank tiny protest sign stuck into the bucket beside him. Facing right, relaxed look.
```

## 30. Zeldina

*nach dem Slice, ab R9*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Young athletic princess, about 104 percent of the boy Max's height, clearly a princess at first glance but dressed for moving house. Short brown bob with freckles, a polished small golden tiara with a tiny red gem, tied on under her chin with a piece of string. A deep teal princess gown with puffed sleeves, a fitted bodice with gold trim and small pearl buttons, the long skirt hitched up and knotted at one side above the knee, showing sturdy brown lace-up boots. Pearl earrings, white gloves. A cardboard moving box under her left arm, a plain short sword lying across the top of the box. Standing upright and proud, facing right, determined grin. No long blond hair, no pink dress, no green tunic, no pointed ears.
```

## 31. Maklerin

*nach dem Slice, Luftschloss*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Sharp real estate agent, about 106 percent of the boy Max's height, slim. Tight grey hair bun, thin glasses on a chain, a pen behind her ear. Pointy black business suit with sharp shoulders, white blouse, black high heels. A clipboard held in her left hand. Standing upright, facing right, fake toothy smile.
```

## 32. Lord Moderwort

*nach dem Slice, Thronsaal*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Gloomy wannabe dark lord, about 106 percent of the boy Max's height, thin. Pale green skin, a greasy black ponytail, almost no nose, just two tiny red irritated nostrils, teary eyes. A dark violet robe far too large for him, sleeves down to his fingers. A white handkerchief in his left hand, a crooked black wand in his right. Standing upright, facing right. No bald head, no black robe.
```

## 33. Smaugi

*nach dem Slice, FIGUR-GROSS*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Plump friendly red dragon, about 180 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
```

## 34. Übungsbesen

*nach dem Slice, Hinweis in R6*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A small enchanted practice broom, about 39 percent of the boy Max's height, short birch handle, pale straw bristles tied with a red cord, two thin stick arms and a small wide-eyed face on the binding. Standing upright on its bristles, facing right, twitching eagerly.
```

## 35. Zauberbesen

*nach dem Slice, R11*

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
```

# Gegenstände

## 36. Dorf und Taverne (3×3)

*Münze, Fondue, Vorleger, Bestellzettel, Eimer, Steckbrief*

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 3x3 grid, same scale, left to right: a single shiny gold coin; a small clay bowl of melted yellow cheese fondue; a fluffy white goat skin rug, folded; a paper order slip with blank lines; an empty wooden bucket with a rope handle; the same bucket full of water; a plain wooden cooking spoon without cheese; a rolled-up wanted poster showing a blank face; a small folded paper note with a pencil smudge.
```

## 37. Zaubertrank (2×4)

*Krug und Leuchtpilz liegen schon in den Räumen, der Rest kommt ab R5*

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 2x4 grid, same scale, left to right, last cell empty: an empty clay jug with a blank name tag on a string; the same jug full of white goat milk; a small glowing blue mushroom; a crumpled paper note with short blank rhyme lines; a round bottle of glowing yellow potion with a cork; a magic bean with a tiny sparkle; the red-and-white striped sock bulging with pink pollen.
```

## 38. Wald und Turm (2×4)

*Ketchup liegt schon im Zauberwald, der Rest kommt ab R10*

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item. 2x4 grid, same scale, left to right, last cell empty: a red plastic squeeze bottle with a blank label; a rolled parchment contract with an empty signature line; the same contract unrolled with a red ketchup smear on the signature line; an old school report card with blank grade lines and a small heart doodle in the corner; a large golden dragon egg with fine overlapping scales; a rusty sword with a small blank name tag on a string; a fizzing green potion bottle with a blank label.
```
