# Fertige Prompts: Figurenbögen von Max, Pixel und Opa

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../00-stil-und-werkzeuge.md` (dort ändern, nicht hier).

Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Ergebnis: oben vier
Ansichten (vorne, links, hinten, rechts), unten sechs Ausdrücke, alles auf Magenta ohne Schrift.
Ist ein Bogen freigegeben, ersetzt er bei allen späteren Prompts dieser Figur die Einzelbilder als
Anhang. Fehler im Bogen nur mit Maske beheben, nicht neu erzeugen, sonst wandert die Figur.

**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):
erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist
ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein
MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und
Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus
`01-figurenboegen.md` anhängen, sobald er freigegeben ist.

# Shotliste

3 Shots, davon 3 sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:
R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.

| Shot | Bild | Stand |
| --- | --- | --- |
| FB-K01 | Max | offen |
| FB-K02 | Pixel | offen |
| FB-K03 | Opa Konrad | offen |

# Figurenbögen

## Max

**Shot FB-K01**

**Anhängen:** `concepts/w0_concept_max.png` und ein Einzelbild aus `game/grafik/figuren/max.png`

```text
STYLE: Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
NEUTRAL POSE (all four views): standing slouched, both hands in the hoodie pocket.
EXPRESSIONS (bottom row, left to right): (1) tired, half-closed eyes, lopsided smirk; (2) annoyed, one eyebrow raised; (3) surprised, eyes wide open, mouth open; (4) puzzled, head tilted, mouth pulled to one side; (5) rare genuine smile, eyes open; (6) determined, eyes open, jaw set.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no extra characters, no duplicate panels, no extra poses, no fifth view, no seventh portrait
```

## Pixel

**Shot FB-K02**

**Anhängen:** `concepts/w0_concept_pixel.png` und ein Einzelbild aus `game/grafik/figuren/pixel.png`

```text
STYLE: Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
NEUTRAL POSE (all four views): sitting upright with chin raised, fluffy tail wrapped around his paws (all four views sitting).
EXPRESSIONS (bottom row, left to right): (1) smug, half-lidded eyes, chin raised; (2) horrified, ears flat, eyes wide; (3) greedy, eyes huge, tongue tip out; (4) offended, head turned away, eyes closed; (5) startled, fur standing up, ears back; (6) blissful, eyes closed, small smile.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no extra characters, no duplicate panels, no extra poses, no fifth view, no seventh portrait
```

## Opa Konrad

**Shot FB-K03**

**Anhängen:** ein Einzelbild aus `game/grafik/figuren/opa.png` (das Sprite gilt, nicht ältere Bögen)

```text
STYLE: Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
NEUTRAL POSE (all four views): standing stooped, arms hanging loosely, slight grin.
EXPRESSIONS (bottom row, left to right): (1) enthusiastic grin, one finger raised as if explaining; (2) panic, eyes wide, hair standing up even more; (3) focused tinkering, squinting, tongue tip out; (4) puzzled frown, one eyebrow down; (5) sheepish guilty smile; (6) touched, eyes glistening, warm smile.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no extra characters, no duplicate panels, no extra poses, no fifth view, no seventh portrait
```


# Feste Beschreibungen zum Kopieren

Dieselben Blöcke, die die fertigen Prompts als CHARACTER LOCK einsetzen. Für eigene Prompts
wortgleich übernehmen, nichts kürzen.

## FEST Max

```text
Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
```

## FEST Pixel

```text
Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
```

## FEST Opa

```text
Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
```

# Korrektur mit Maske

Für jedes fertige Bild: Bild anhängen (oder im selben Chat bleiben), in ChatGPT die Stelle mit dem
Auswahlwerkzeug markieren, in Gemini die Stelle mit Lage und Gegenstand beschreiben. In die eckigen
Klammern Ort und Änderung einsetzen, je Korrektur ein kurzer Satz.

```text
Edit the attached image. Change only the marked area: [where, for example "the wardrobe door at the right edge"]. Inside that area: [the change, one short sentence]. Everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
```

Beispiel Kleiderbügel im Dachboden:

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Make the wire coat hanger on the wardrobe door about 30 percent larger and dark grey, hanging from the slanted top edge of the door.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```
