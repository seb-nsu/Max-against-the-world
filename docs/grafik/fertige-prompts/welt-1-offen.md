# Offene Prompts Welt 1

Stand 13. November 2026. Alles, was für Welt 1 noch aus Gemini kommen muss, an einem Ort und in der Reihenfolge, in der es sich anbietet. Die Prompts sind dieselben wie in `welt-1.md` (aus `../welt-1.md` erzeugt), hier nur gesammelt; die Nahansichten stehen nur hier.

Abhaken, was erledigt ist:

- [ ] Lord Moderwort neu (junger Mann, keine Nase, keine Krone)
- [ ] Übungsbesen
- [ ] Luftschloss (breit: linke und rechte Hälfte einzeln)
- [ ] Turmkeller (zwei Fassungen: Kammertür einen Spalt offen, dann zu)
- [ ] Abstellkammer 1
- [ ] Smaugis Abstellkammern (zwei Fassungen: voll, dann aufgeräumt)
- [ ] Thronsaal (nachts; Mondlicht-Strahl baut Claude in Godot dazu)
- [ ] Nahansicht Alwins Hinweiszettel
- [ ] Nahansicht Kritzelei am Luftschloss
- [ ] Nahansicht Moderworts Zeugnis

**Allgemein:** Bei Figuren Max' Figurenblatt anhängen. Bei Räumen die Layout-Skizze anhängen (Link steht beim Raum). Bei Nahansichten nichts anhängen; Schrift setzt Claude später als Pixelschrift ein. Zweite Fassungen immer im selben Chat aus dem fertigen Bild ableiten („same image, only …“), dann bleibt alles andere gleich.

# Figuren

## Lord Moderwort

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
```

## Übungsbesen

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, plain light grey background, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image. A small enchanted practice broom, about 39 percent of the boy Max's height, short birch handle, pale straw bristles tied with a red cord, two thin stick arms and a small wide-eyed face on the binding. Standing upright on its bristles, facing right, twitching eagerly.
```


# Räume

Die dunklen Turmräume (Turmkeller, Abstellkammer 1, Smaugis Abstellkammern, Thronsaal) haben den düsteren Farbbaustein schon im Prompt.

## Luftschloss

**Layout-Skizze:** [Luftschloss](../skizzen/welt-1/luftschloss.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical. Dainty pastel castle courtyard on top of fluffy clouds, morning, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: the top of a giant green beanstalk curling over the cloud edge at the left edge; an open stretch of pale flagstones with low pastel hedges and a small dry fountain. RIGHT HALF, left to right: a high arched doorway, on the pale wall right next to it a small childish chalk scribble with a tiny heart, no letters; a tiny balcony with a railing and an ornate gold-framed wall mirror at the right edge. Background: slim turrets with pointed pink roofs, open sky. Floor with gentle depth, made of pale flagstones and cloud in the lower third kept clear. Soft pink and blue light from upper left. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

**Breitbild:** erst die linke Hälfte erzeugen (nur der Teil „LEFT HALF“ plus Anfang und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen macht Claude.

## Turmkeller (Turmhalle)

**Zustände:** Vor und nach Rätsel 11 Teil 2 (Kammertür einen Spalt offen und Besen auf den Routen; danach Tür zu, keine Besen)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Cellar hall at the bottom of a dark wizard tower, 640x360. Left: a heavy stone door with a faint rune standing open at the left edge, a few steps leading down into a mine tunnel. Center: a wide stone floor with three tile paths in clearly different colors, a straight red line, a yellow zigzag and a blue loop, crossing each other at exactly three points. Right: a wooden storeroom door, slightly ajar. Background: a narrow spiral staircase winding up into darkness. Floor with gentle depth in the lower third kept free of objects, only the tile paths. Torch light from upper left, violet shadows. dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy.
```

**Zweite Fassung** (im selben Chat): `Same image, only change: the wooden storeroom door on the right is now fully closed. Everything else exactly the same.`

## Abstellkammer 1

**Layout-Skizze:** [Abstellkammer 1](../skizzen/welt-1/abstellkammer_1.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Cramped storeroom on the first floor of a wizard tower, 640x360. Left: the wooden door at the left edge. Center left: buckets, folded violet banners and a heap of rags along the back wall, half of the junk already swept into two neat square stacks, a small blank wooden sign nailed to the wall above the junk, cobwebs in the corners. Center right: an open stretch of bare stone floor. Right: a single torch on the wall above shelves of dusty junk. Floor with gentle depth in the lower third kept clear. Torch light from upper left, violet shadows. dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

## Smaugis Abstellkammern

**Zustände:** Voll (vor Rätsel 12, die Besen fegen gerade) und aufgeräumt (nach Rätsel 12); Geheimtür zu und offen (Rätsel 11 Teil 1) als Sprite-Wechsel

**Layout-Skizze:** [Smaugis Abstellkammern](../skizzen/welt-1/abstellkammern.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Top storeroom floor of a wizard tower, 640x360, crammed to the ceiling with hoarded junk: rusty helmets, dented teapots, a cracked mirror, heaps of gold coins. Left: the top of a stone staircase coming up from below at the left edge, then three separate small junk piles: a bundle of rusty swords tied with rope, a bundle of burnt-out torches, and a dusty golden chandelier hanging crooked from the ceiling. Center: a big gold coin pile with a sword stuck in a rock on top, beside it an empty nest of old blankets. Right: a narrow stone staircase leading up, at its foot a heavy wooden door with a carved grinning face. Floor with gentle depth in the lower third kept clear. Warm torch light from upper left, dust in the air. Second version: identical layout, all junk swept into neat square stacks along the walls, bare floor visible. dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

**Zweite Fassung** (im selben Chat, aus der vollen Fassung): `Same image, same camera and layout, but all the junk is now swept into neat square stacks along the walls, the floor is bare and clean, the three junk piles on the left (swords, torches, chandelier) are gone. Everything else exactly the same.`

## Thronsaal

**Layout-Skizze:** [Thronsaal](../skizzen/welt-1/thronsaal.png)

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos. Oversized dark throne room at the very top of a wizard tower, night, 640x360, looking slightly ridiculous. Left: a narrow secret door standing open at the left edge, tall vases overflowing with bright flowers. Center: a giant spiky black throne on two steps with a tiny embroidered pink cushion. Right: a small table with stacks of tissue boxes, a tall stained glass window with moonlight and clouds far below. Long violet carpet along the floor in the lower third, kept clear. Torch light from upper left. dusky fairy tale palette of violet, slate grey and pale green, flickering torch light, comically gloomy. Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
```

**Licht:** bitte wirklich nachts, mit kühlem Mondlicht durchs Buntglasfenster. Den sich bewegenden Lichtstrahl mit Staub und ziehenden Wolken legt Claude in Godot darüber, das muss nicht ins Bild.


# Nahansichten (je 640×360, ohne Anhang)

## Alwins Hinweiszettel

```text
Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters. A crumpled sheet of slightly yellowed paper held up by a wrinkled old wizard's hand with a mustard-yellow star-patterned sleeve at the lower left edge, a pancake batter stain in one corner, about six short empty lines with generous space for handwritten rhyme verses, a tiny doodle of a smiling cauldron in the bottom right corner. Soft light from upper left. No text, no letters, no numbers, completely blank lines. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked.
```

## Kritzelei am Luftschloss

```text
Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters. A section of a pale pastel pink castle wall made of smooth stone blocks, at the edge of an ornate arched doorway on the right, in the middle of the wall a small childish chalk drawing of a lopsided heart and a tiny crown, with a wide empty area next to it for one handwritten line, small chalk smudges, a bit of cloud mist at the bottom edge. Soft pink and blue morning light from upper left. No text, no letters, no numbers. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked.
```

## Moderworts Zeugnis

```text
Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters. An old school report card on thick cream parchment lying on a dark wooden desk, a crooked wax seal of a wizard school at the top, a blank title area, about five empty rows with blank subject and grade fields, dog-eared corners, a coffee ring stain, and in the bottom right corner a small empty space with a hand-drawn heart for a handwritten note. Warm candle light from upper left. No text, no letters, no numbers, all fields empty. storybook fairy tale palette of lush greens, warm gold and sky blue, soft magical glow, cheerful and slightly crooked.
```
