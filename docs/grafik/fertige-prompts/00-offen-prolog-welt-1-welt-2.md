# Offene Prompts: Prolog, Welt 1 und Welt 2

Erzeugt von `tools/prompts_zusammensetzen.py` aus den anderen Dateien in diesem Ordner (dort ändern, nicht hier).

**Das ist die Arbeitsliste.** Hier steht alles, was für Prolog, Welt 1 und Welt 2 noch aus Gemini kommen muss, mit dem kompletten Prompt. Welt 1 hat nur noch Posen offen; ihre Räume, Figuren und Gegenstände sind fertig. Die übrigen Dateien braucht es nur noch zum Nachbessern fertiger Bilder (dann mit dem Baustein MASKE) und für Welt 3 und 4. Abgeglichen mit den Bildern in `game/grafik/` am 14. November 2026.

**Reihenfolge:** erst Figuren, dann Posen, dann Gegenstände, zuletzt Hintergründe. Innerhalb eines Abschnitts von oben nach unten. Was beim Anhängen gebraucht wird, steht über jedem Block.

**Allgemein:** Hintergrund bei Figuren, Posen und Gegenständen einfarbig Magenta; malt Gemini ein Schachbrett oder Kästchen, im selben Chat „solid flat magenta background, no checkerboard, no boxes“ nachschieben. Breite Räume (1280×360): erst die linke Hälfte, dann im selben Chat die rechte. Zweite Fassungen im selben Chat aus dem fertigen Bild ableiten. Der Kater heißt in den Prompts „the tomcat“, weil Gemini den Namen „Pixel“ als Google-Marke blockt.

# Übersicht

**1. Figuren und Varianten**

- Figurenbögen (zuerst, sie sind danach die Anlage für Max, den Kater und Opa): FB-K01 Max; FB-K02 Pixel; FB-K03 Opa Konrad
- Dachboden-Szenen nach Welt 1 und Welt 2: PF-F08 Max mit Drachenei; PF-F09 Max mit Pharaonenkorn
- Welt 2: W2-F23 Ägypter aus dem Volk; W2-F24 Schildkröte; W2-F25 Straßenmusiker

**2. Posen und Bewegungen**

- Als Nächstes (Test für flüssigere Animationen): W1-B27 Schmied: Hämmern; W1-B26 Alwin Grauwald: Rühren
- Max und der Kater, in allen Welten: WU-B02 Max: Gehen nach vorn und nach hinten; WU-B05 Max: Aufheben; WU-B06 Max: Benutzen; WU-B07 Max: Schulterzucken; WU-B08 Max: Gähnen; WU-B10 Max: Vom Sofa aufstehen; WU-B12 Pixel: Gehen nach vorn und nach hinten; WU-B15 Pixel: Putzen; WU-B16 Pixel: Springen und Klettern; WU-B17 Pixel: Schnuppern; WU-B18 Pixel: Tragen; WU-B19 Pixel: Fauchen; WU-B20 Pixel: Ohrfeige; WU-B21 Pixel: Vom Schrank fallen
- Prolog und Dachboden-Szenen: PF-B01 Pixel: Aufwachen vom Thunfisch; PF-B02 Opa: Erklären; PF-B03 Opa: Panik; PF-B08 Gegenwart-Effekt: Verwandlung; PF-B11 Effekt: Staubwolke
- Welt 1: W1-B01 Toadi: Rennen; W1-B02 Toadi: Keuchen; W1-B03 Toadi: Auf Max zeigen; W1-B04 Pixel: Minka umgarnen; W1-B05 Wirt Humbert: In den Keller gehen; W1-B06 Gollo: Ring werfen; W1-B07 Max: Kochlöffel schwingen; W1-B08 Max: Ziege melken; W1-B09 Max: Bohne pflanzen und gießen; W1-B10 Bohnenranke: Wachsen; W1-B11 Niesrosen: Aufgehen; W1-B12 Troll Waldemar: Musical-Nummer; W1-B13 Troll Waldemar: Fußbad; W1-B14 Zeldina: Gehen und Kiste tragen; W1-B15 Pixel als Ziege: Brücke überqueren; W1-B16 Ziegen: Gehen; W1-B17 Zauberbesen: Fegen; W1-B18 Zauberbesen: Haarspur jagen; W1-B19 Pixel: Haare verlieren; W1-B20 Lord Moderwort: Zaubern; W1-B21 Lord Moderwort: Niesen; W1-B22 Fluch wird Käse: Effekt; W1-B23 Pilz-Verwandlung: Effekt; W1-B24 Smaugi: Kram hergeben; W1-B25 Smaugi: Gerührt schniefen; W1-B28 Übungsbesen: Pixel jagen; W1-B29 Zauberbesen: Max wegfegen; W1-B30 Wirt Humbert: Krug polieren; W1-B31 Zauberstabmacher: Mustern; W1-B32 Rotkäppchen: Pakete balancieren; W1-B33 Maklerin: Notieren; W1-B34 Grimmzahn: Protestieren; W1-B35 Goblin-Arbeiter 1: Pickel schwingen; W1-B36 Goblin-Arbeiter 2: Gähnen und strecken; W1-B37 Wirtskatze Minka: Putzen; W1-B38 Taverne-Huhn: Aufplustern; W1-B39 Schmiede-Ziege: Im Kreis drehen; W1-B40 XXL-Ziege: Wiederkäuen; W1-B41 Schwan: Fauchen
- Welt 2 (Posenbögen; die Bewegung selbst kommt aus dem 3D-Clip): W2-P01 Max Tag 1; W2-P02 Max Finaltag; W2-P03 Ramses; W2-P04 Sobek; W2-P05 Hofkater; W2-P06 Schildkröte; W2-P07 Archimedes; W2-P08 Hermes; W2-P09 Leonidas; W2-P10 Cicero; W2-P11 Philosoph; W2-P12 Fächerwedler; W2-P13 Nebet; W2-P14 Hieron; W2-P15 Tiro; W2-P16 Palastschreiber; W2-P17 Publikum; W2-P18 Fährmann; W2-P19 Steinmetz; W2-P20 Zeremonienmeister; W2-P21 Brian; W2-P22 Beamter 1; W2-P23 Beamter 2; W2-P24 Römische Touristin; W2-P25 Ägypter aus dem Volk; W2-P26 Straßenmusiker; W2-P27 Sobek im Wasser

**3. Gegenstände**

- Prolog und Dachboden-Szenen: PF-G02 Gegenwart (2×4); PF-G03 Deko Opas Haus (3×4); PF-G05 Einsaug-Effekt; PF-G06 Werkbank-Ablage; PF-G07 Kalenderkreis; PF-G08 Dachlampe; PF-G09 Fundkiste; PF-G10 Werbeblock
- Welt 2: W2-G03 Feigen-Zustände (1×4, Baum doppelt so groß); W2-G05 Schriftstücke (1×4); W2-G06 Getränke-Zustände (1×3); W2-G07 Grabstein-Zustände (1×4); W2-G08 Wunderdinge (1×3); W2-G09 Hieroglyphen (4×4, im Spiel 32×32); W2-G10 Deko Welt 2 (3×3); W2-G11 Krokodil-Fähre; W2-G12 Wurfhebel

**4. Hintergründe**

- Welt 2, Ägypten: W2-R01 Nil-Delta mit Fährsteg; W2-R04 Thronsaal; W2-R05 Palastküche; W2-R06 Sphinx
- Welt 2, Griechenland: W2-R02 Fährsteg Olympia; W2-R11 Agora; W2-R10 Startbüro; W2-R09 Stadion; W2-R03 Hafen Syrakus; W2-R07 Archimedes' Werkstatt; W2-R08 Grabhügel Syrakus; W2-R12 Flusskarte
- Welt 2, Nahansichten und Tafeln (füllen das ganze Bild wie ein Hintergrund): W2-N01 Hieroglyphen-Grammatik (Rätsel 2); W2-N02 Fährtafel; W2-N03 Aushang im Startbüro (Rätsel 3); W2-N04 Sandgrube (Rede-Ringen); W2-N05 Konter-Auswahl (Rede-Ringen); W2-N06 Paraden-Plan (Rätsel 6b)

**5. Später: erst für Welt 3, Welt 4 und das Finale**

- Figuren: PF-F05 Opa auf dem Sofa; PF-F06 Oma; PF-F07 Mutter; PF-F10 Max mit Energiezelle; PF-F11 Max mit Goldener Fernbedienung; PF-F12 Opa mit Zündkapsel; PF-F13 Oma mit Gabel; PF-F14 Zeldina, Finale; PF-F15 Pixel auf dem Schrank
- Posen und Effekte: PF-B04 Oma: Treppe steigen; PF-B05 Mutter: Liste lesen; PF-B06 Zeldina: Zauberstab einsetzen; PF-B07 Roboter-Hausmeister: Ofentür halten; PF-B09 Effekt: Maschine läuft; PF-B10 Effekt: Teig-Schwall
- Hintergründe: PF-R02 Dachboden, Finale; PF-R04 Wohnzimmer, Geburtstag; PF-R06 Supermarkt

# 1. Figuren und Varianten

## Figurenbögen (zuerst, sie sind danach die Anlage für Max, den Kater und Opa)

### FB-K01: Max

**Anhängen:** `concepts/w0_concept_max.png` und ein Einzelbild aus `game/grafik/figuren/max.png`

```text
STYLE: Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
NEUTRAL POSE (all four views): standing slouched, both hands in the hoodie pocket.
EXPRESSIONS (bottom row, left to right): (1) tired, half-closed eyes, lopsided smirk; (2) annoyed, one eyebrow raised; (3) surprised, eyes wide open, mouth open; (4) puzzled, head tilted, mouth pulled to one side; (5) rare genuine smile, eyes open; (6) determined, eyes open, jaw set.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no extra characters, no duplicate panels, no extra poses, no fifth view, no seventh portrait
```

### FB-K02: Pixel

**Anhängen:** `concepts/w0_concept_pixel.png` und ein Einzelbild aus `game/grafik/figuren/pixel.png`

```text
STYLE: Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
NEUTRAL POSE (all four views): sitting upright with chin raised, fluffy tail wrapped around his paws (all four views sitting).
EXPRESSIONS (bottom row, left to right): (1) smug, half-lidded eyes, chin raised; (2) horrified, ears flat, eyes wide; (3) greedy, eyes huge, tongue tip out; (4) offended, head turned away, eyes closed; (5) startled, fur standing up, ears back; (6) blissful, eyes closed, small smile.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no extra characters, no duplicate panels, no extra poses, no fifth view, no seventh portrait
```

### FB-K03: Opa Konrad

**Anhängen:** ein Einzelbild aus `game/grafik/figuren/opa.png` (das Sprite gilt, nicht ältere Bögen)

```text
STYLE: Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
NEUTRAL POSE (all four views): standing stooped, arms hanging loosely, slight grin.
EXPRESSIONS (bottom row, left to right): (1) enthusiastic grin, one finger raised as if explaining; (2) panic, eyes wide, hair standing up even more; (3) focused tinkering, squinting, tongue tip out; (4) puzzled frown, one eyebrow down; (5) sheepish guilty smile; (6) touched, eyes glistening, warm smile.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no extra characters, no duplicate panels, no extra poses, no fifth view, no seventh portrait
```

## Dachboden-Szenen nach Welt 1 und Welt 2

### PF-F08: Max mit Drachenei

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing slightly slouched, holding a large golden scaly dragon egg about 29 percent of the boy Max's height in both arms against his chest, tired but a little proud look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F09: Max mit Pharaonenkorn

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing, a bulging golden grain sack with a blank round seal slung over his right shoulder, held with both hands, a little sand trickling from his sneakers, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Welt 2

### W2-F23: Ägypter aus dem Volk

**Nur noch die zweite und dritte Fassung:** die erste ist im Spiel (`aegypter.png`). Beide Fassungen im selben Chat aus dem fertigen Bild ableiten.

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Ordinary Egyptian man, about as tall as the boy Max. Short black hair, tanned skin. Simple white linen kilt, bare feet. Arms crossed, standing upright, facing right, unimpressed face.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: With a short beard and a turquoise sash.
KEEP: everything outside that area stays pixel-identical: same character, pose, proportions, face, colors, line weight and the flat magenta background. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der ersten Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Older, with grey stubble and a pale blue kilt.
KEEP: everything outside that area stays pixel-identical: same character, pose, proportions, face, colors, line weight and the flat magenta background. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

### W2-F24: Schildkröte

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A small Greek tortoise, about 21 percent of the boy Max's height, olive-brown shell, a tiny white headband. Walking on four legs, facing right, determined look.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### W2-F25: Straßenmusiker

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Greek street musician, slim, about as tall as the boy Max. Curly dark hair, a laurel twig behind one ear. Short pale blue tunic, sandals. A wooden lyre held in both hands. Standing upright, singing with eyes closed, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

# 2. Posen und Bewegungen

## Als Nächstes (Test für flüssigere Animationen)

### W1-B27: Schmied: Hämmern

**Anhängen:** das fertige Konzeptblatt von Schmied · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Muscular village blacksmith, about 106 percent of the boy Max's height. Short red beard, soot on his cheeks, thick forearms. Brown leather apron over a grey shirt, dark trousers, heavy boots. A smithing hammer hanging from his right hand. Standing upright, shoulders slightly slumped, facing right, weary sigh.
START: From the Schmied reference sprite.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: he raises the hammer high and brings it down on a glowing horseshoe on the anvil; (2) 0.2 s: a small burst of orange sparks; (3) 0.4 s: weary sigh between blows.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view; the game shows it facing left toward the anvil, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B26: Alwin Grauwald: Rühren

**Anhängen:** das fertige Konzeptblatt von Alwin Grauwald · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Absent-minded old wizard, tall and thin, about 111 percent of the boy Max's height. Long grey beard tied with a red ribbon, round reading glasses on the tip of his nose, a floppy brown knitted cap. Faded mustard-yellow robe with small blue stars and brown patches, a white cooking apron over it, a soup ladle in his right hand. Standing upright, facing right, puzzled smile. No pointed hat, no purple or grey robe, no half-moon glasses, no staff.
START: From the Alwin reference sprite.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: he stirs the cauldron with his soup ladle in slow circles, leaning slightly forward, beard swaying, puzzled smile, at one end of the movement; (2) 0.3 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view; the game shows it facing left toward the cauldron, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max und der Kater, in allen Welten

### WU-B02: Max: Gehen nach vorn und nach hinten

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

### WU-B05: Max: Aufheben

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

### WU-B06: Max: Benutzen

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

### WU-B07: Max: Schulterzucken

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

### WU-B08: Max: Gähnen

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

### WU-B10: Max: Vom Sofa aufstehen

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

### WU-B12: Pixel: Gehen nach vorn und nach hinten

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** je 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
MANNER (applies to every pose): front view of the tomcat trotting toward the viewer, round face and white chest, collar light visible; second animation: back view trotting away, fluffy tail held high.
ACTION (4 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.1 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.3 s: contact pose with the other foot in front, legs widest apart; (4) 0.4 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, front and back view exactly as described, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B15: Pixel: Putzen

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat sitting; (2) 0.3 s: licks his front paw and wipes it over his ear, tail still.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B16: Pixel: Springen und Klettern

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat crouches; (2) 0.3 s: wiggles his rear; (3) 0.6 s: leaps up about 75 pixels and lands on a ledge above.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B17: Pixel: Schnuppern

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat stretches his neck forward, nose twitching, sniffs twice; (2) 0.4 s: pulls back.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B18: Pixel: Tragen

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
MANNER (applies to every pose): smug strut with tail held high, a small object held in his mouth, head slightly raised, the object stays fixed in the mouth.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B19: Pixel: Fauchen

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat arches his back, fur bristles, mouth wide open hissing; (2) 0.4 s: settles.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B20: Pixel: Ohrfeige

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat jumps up and slaps with one front paw; (2) 0.4 s: lands again, smug face.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### WU-B21: Pixel: Vom Schrank fallen

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat loses balance on top of a tall cupboard; (2) 0.3 s: flails all four legs; (3) 0.5 s: falls about 149 pixels; (4) 0.8 s: lands flat on the floor, dazed.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Prolog und Dachboden-Szenen

### PF-B01: Pixel: Aufwachen vom Thunfisch

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: sleeping tomcat sprite as input.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: asleep on the cord, nose twitches; (2) 0.3 s: eyes snap open, he jumps up onto all fours with fur standing up; (3) 0.6 s: collar light still off.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### PF-B02: Opa: Erklären

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

### PF-B03: Opa: Panik

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

### PF-B08: Gegenwart-Effekt: Verwandlung

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A puff of glitter and a soft pop, 64x64, when a legendary artifact turns into an everyday object.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

### PF-B11: Effekt: Staubwolke

**Anhängen:** nichts (Effekt) · **Bilder:** 5 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: 5 frames of 64x64, a small puff of pale flour dust rising from a paper sack and fading.
FRAMES: 5 frames side by side, about 0.5 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Welt 1

### W1-B01: Toadi: Rennen

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the Toadi reference sprite.
MANNER (applies to every pose): panicked run with tiny fast steps, arms flapping, mushroom hat bouncing up and down.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the hat brim keeps its shape.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B02: Toadi: Keuchen

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the Toadi reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: bent forward with both hands on his knees, chest heaving; (2) 0.2 s: a sweat drop falls from his forehead.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B03: Toadi: Auf Max zeigen

**Anhängen:** das fertige Konzeptblatt von Toadi · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A tiny nervous mushroom servant, about 53 percent of the boy Max's height, round pale face with big worried eyes and rosy cheeks. A big soft mushroom-shaped hat with a wide floppy brim, blue with white stripes. A beige knee-length tunic with a brown belt, brown pointed shoes. Hands clasped in front, standing upright, facing right, anxious look. No red, no spots, no vest, no round dome head.
START: From the Toadi reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: he stops; (2) 0.4 s: points his arm straight forward with an excited jab, hat brim bouncing, mouth open as if shouting.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B04: Pixel: Minka umgarnen

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: From the tomcat and Minka sprites.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat struts past the white cat; (2) 0.3 s: winks; (3) 0.5 s: rubs his head against her cheek; (4) 0.8 s: walks off to the right and she follows him.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, both facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B05: Wirt Humbert: In den Keller gehen

**Anhängen:** das fertige Konzeptblatt von Wirt Humbert · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
START: From the Humbert reference sprite.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: he sets down the mug; (2) 0.3 s: turns to the cellar door behind the bar; (3) 0.5 s: opens it; (4) 0.8 s: steps down and sinks out of view.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the bar stays still.
CAMERA: static, strict side view; the game shows it facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B06: Gollo: Ring werfen

**Anhängen:** das fertige Konzeptblatt von Gollo · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small nervous man, deliberately short at about 147 pixels. Round worried eyes, thinning brown hair, pink skin, a stubbly chin. Lost in a far too large brown traveling cloak that drags on the floor, grey trousers peeking out. A tiny dark red ring box clutched to his chest with both hands. Hunched, facing right. No grey skin, no loincloth, no bald head, no huge pale eyes.
START: From the Gollo reference sprite.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: he hesitates; (2) 0.3 s: squeezes his eyes shut, throws a tiny ring in a high arc to the right; (3) 0.6 s: covers his face with both hands.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: cloak hem stays on the floor.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B07: Max: Kochlöffel schwingen

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
START: From the Max reference sprite.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Max raises a wooden spoon like a wand; (2) 0.3 s: swings it forward in a dramatic arc, small yellow cheese drips fly off; (3) 0.6 s: he lowers it again.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: legs stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B08: Max: Ziege melken

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
START: From the Max reference sprite.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: Max crouches beside a white goat with a clay jug under it, squeezing rhythmically, leaning away with a disgusted face, at one end of the movement; (2) 0.3 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: goat and jug stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B09: Max: Bohne pflanzen und gießen

**Anhängen:** Max' Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 10 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
START: From the Max reference sprite.
ACTION (4 key poses for a 10-frame animation of about 1.0 s; Claude draws the in-between frames): (1) 0.0 s: Max kneels; (2) 0.3 s: presses a bean into the soil; (3) 0.7 s: stands up, lifts a wooden bucket and tips water over the spot; (4) 1.0 s: lowers the empty bucket.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B10: Bohnenranke: Wachsen

**Anhängen:** nichts (Effekt) · **Bilder:** 10 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A green sprout bursts from a patch of soil, thickens and shoots up into a huge twisting beanstalk with broad leaves that leaves the frame at the top.
FRAMES: 10 frames side by side, about 1.0 s at 10 frames per second, plays once, each frame 128x360 pixels in the game.
END: the last frame matches the static beanstalk sprite.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

### W1-B11: Niesrosen: Aufgehen

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: The closed pink rose buds of the bush open one by one, then a cloud of pink pollen puffs upward and drifts.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

### W1-B12: Troll Waldemar: Musical-Nummer

**Anhängen:** das fertige Konzeptblatt von Troll Waldemar · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
START: From the Waldemar reference sprite.
ACTION (3 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: he spreads his arms wide; (2) 0.3 s: sways from side to side and sings with his mouth wide open; (3) 0.5 s: eyes closed, bow tie bouncing.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B13: Troll Waldemar: Fußbad

**Anhängen:** das fertige Konzeptblatt von Troll Waldemar · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Big mossy green bridge troll, about 143 percent of the boy Max's height, bulky. Long knobbly nose, small kind eyes, tufts of moss on his head and shoulders. A tiny red bow tie, a brown waistcoat with one button, bare feet. A thick rule book held against his chest in his left hand. Standing very straight like a strict official, nose in the air, facing right.
START: From the Waldemar reference sprite, now sitting on the bridge.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: both bare feet in a wooden bucket of water; (2) 0.2 s: toes wiggling, small splashes, content smile.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: upper body stays still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B14: Zeldina: Gehen und Kiste tragen

**Anhängen:** das fertige Konzeptblatt von Zeldina · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Young athletic princess, about 104 percent of the boy Max's height, clearly a princess at first glance but dressed for moving house. Short brown bob with freckles, a polished small golden tiara with a tiny red gem, tied on under her chin with a piece of string. A deep teal princess gown with puffed sleeves, a fitted bodice with gold trim and small pearl buttons, the long skirt hitched up and knotted at one side above the knee, showing sturdy brown lace-up boots. Pearl earrings, white gloves. A cardboard moving box under her left arm, a plain short sword lying across the top of the box. Standing upright and proud, facing right, determined grin. No long blond hair, no pink dress, no green tunic, no pointed ears.
START: From the Zeldina reference sprite.
MANNER (applies to every pose): walk cycle with the moving box under her left arm, rust-orange cape swinging behind her, crown string bobbing.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the box stays level.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B15: Pixel als Ziege: Brücke überqueren

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: From the tomcat-as-goat sprite.
MANNER (applies to every pose): stiff, offended walk on all four legs, goat skin rug flapping, fake horns wobbling on his head.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: tail hidden under the rug.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B16: Ziegen: Gehen

**Anhängen:** das fertige Konzeptblatt von Ziegen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
MANNER (applies to every pose): steady goat trot on four legs, head bobbing, the small goat's bell swinging.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: contact pose, front foot just touching the ground, legs widest apart; (2) 0.2 s: passing pose, body at its highest, the back leg swinging past the standing leg; (3) 0.4 s: contact pose with the other foot in front, legs widest apart; (4) 0.6 s: passing pose with the other leg swinging past.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B17: Zauberbesen: Fegen

**Anhängen:** das fertige Konzeptblatt von Zauberbesen · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
START: From the Zauberbesen reference sprite.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: the broom sweeps left and right along the floor with its little arms; (2) 0.3 s: bristles fanning out, angry face.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the handle stays upright.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B18: Zauberbesen: Haarspur jagen

**Anhängen:** das fertige Konzeptblatt von Zauberbesen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
START: From the Zauberbesen reference sprite.
ACTION (2 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: the broom leans forward and rushes ahead, sweeping frantically along a trail of grey cat hair, straw bristles flying, at one end of the movement; (2) 0.4 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B19: Pixel: Haare verlieren

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
START: From the tomcat reference sprite.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: the tomcat shakes himself vigorously from head to tail; (2) 0.6 s: a cloud of grey hair flies off and settles on the floor in a small heap.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: paws stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B20: Lord Moderwort: Zaubern

**Anhängen:** das fertige Konzeptblatt von Lord Moderwort · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
START: From the Moderwort reference sprite.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: he raises his crooked wand; (2) 0.3 s: draws back, thrusts it forward; (3) 0.6 s: a violet spark shoots from the tip.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the handkerchief hand stays down.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B21: Lord Moderwort: Niesen

**Anhängen:** das fertige Konzeptblatt von Lord Moderwort · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gloomy wannabe dark lord, a thin young man in his twenties, about 106 percent of the boy Max's height, flat chest, narrow shoulders, slight stubble on his chin and a sharp adam's apple. Pale green skin, short greasy black hair tied into a tiny stubby ponytail at the back of his head. His face has no nose at all, completely flat in the middle of the face like a smooth surface, only two tiny red irritated nostril slits, red-rimmed teary eyes. A dark violet robe far too large for him, sleeves hanging down over his fingers, hem dragging on the floor. A crumpled white handkerchief in his left hand, a crooked black wand in his right. Standing upright and slightly hunched, facing right, sulky look. No crown, no tiara, no jewelry, no makeup, no long hair, no visible nose, no bald head, no black robe.
START: From the Moderwort reference sprite.
ACTION (4 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: his eyes water; (2) 0.3 s: he leans back with a deep breath; (3) 0.5 s: sneezes violently forward; (4) 0.8 s: the wand flies out of his hand to the right.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B22: Fluch wird Käse: Effekt

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A violet magic bolt fizzles mid-air and turns into a slice of yellow cheese that drops out of the frame.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 48x48 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

### W1-B23: Pilz-Verwandlung: Effekt

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A green puff of smoke at head height, out of which a round plain brown mushroom cap pops up.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

### W1-B24: Smaugi: Kram hergeben

**Anhängen:** das fertige Konzeptblatt von Smaugi · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
START: From the Smaugi reference sprite.
ACTION (3 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: he picks up a piece of junk with one claw; (2) 0.2 s: holds it up and looks at it thoughtfully; (3) 0.4 s: hands it forward to the right.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: body and tail stay still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B25: Smaugi: Gerührt schniefen

**Anhängen:** das fertige Konzeptblatt von Smaugi · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Plump friendly red dragon, about 132 percent of the boy Max's height when sitting, round belly, short stubby wings, small horns. Tired droopy eyes. A cleaning headscarf with white dots tied on his head, a feather duster in his right claw. Sitting upright on his haunches, tail curled around his feet, facing right, sighing. No gold armor scales, no fire.
START: From the Smaugi reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: he sniffles, wipes a tear with the corner of his headscarf; (2) 0.2 s: a small puff of smoke rises from his nose.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B28: Übungsbesen: Pixel jagen

**Anhängen:** das fertige Konzeptblatt von Übungsbesen · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A small enchanted practice broom, about 39 percent of the boy Max's height, short birch handle, pale straw bristles tied with a red cord, two thin stick arms and a small wide-eyed face on the binding. Standing upright on its bristles, facing right, twitching eagerly.
START: From the Übungsbesen reference sprite.
ACTION (3 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: the small broom twitches awake; (2) 0.4 s: shoots across the floor chasing a few grey cat hairs; (3) 0.8 s: crashes into a cupboard door and drops.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B29: Zauberbesen: Max wegfegen

**Anhängen:** das fertige Konzeptblatt von Zauberbesen · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An enchanted straw broom, about 53 percent of the boy Max's height, birch handle tied to the bristles with brown cord, two thin stick arms and an angry face on the binding. Standing upright on its bristles, facing right.
START: From the Zauberbesen and Max sprites.
ACTION (2 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: the broom rushes at Max and sweeps him off his feet in one big swing; (2) 0.8 s: Max tumbles away to the left like a heap of dust.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view; the game shows it broom facing left, so draw the character facing right and the game mirrors it. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B30: Wirt Humbert: Krug polieren

**Anhängen:** das fertige Konzeptblatt von Wirt Humbert · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Burly friendly innkeeper, about 106 percent of the boy Max's height. Bald head, huge curled black mustache, rosy cheeks. White shirt with rolled-up sleeves, green apron, brown trousers, a white polishing cloth over his left shoulder. A pewter mug held in both hands at chest height. Standing upright, facing right, cheerful.
START: From the Humbert reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: he polishes the pewter mug with the white cloth in small circles; (2) 0.2 s: holds it up to the light and nods, satisfied.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B31: Zauberstabmacher: Mustern

**Anhängen:** das fertige Konzeptblatt von Zauberstabmacher · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Thin elderly wand maker, about 104 percent of the boy Max's height, with a long neck. Bald head with two tufts of white hair, an enormous brass magnifying monocle over his right eye. Bottle-green waistcoat over a white shirt, a yellow tape measure around his neck, grey trousers. Leaning forward curiously, hands clasped, facing right. No long grey hair, no wand in hand.
START: From the Zauberstabmacher reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: he leans forward and adjusts the brass monocle with one finger, his eye looks huge behind the lens; (2) 0.2 s: he stretches the yellow tape measure between both hands.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B32: Rotkäppchen: Pakete balancieren

**Anhängen:** das fertige Konzeptblatt von Rotkäppchen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Cheerful delivery girl, about 86 percent of the boy Max's height. Blond braids, freckles. Red hooded jacket with the hood down, red delivery cap, dark blue knee-length trousers, white sneakers. A small stack of two cardboard boxes held in both arms. Standing upright, facing right, big friendly smile.
START: From the Rotkäppchen reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: she bounces on her toes, the two boxes in her arms wobble; (2) 0.2 s: she steadies them with her chin and smiles.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B33: Maklerin: Notieren

**Anhängen:** das fertige Konzeptblatt von Maklerin · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Sharp real estate agent, about 106 percent of the boy Max's height, slim. Tight grey hair bun, thin glasses on a chain, a pen behind her ear. Pointy black business suit with sharp shoulders, white blouse, black high heels. A clipboard held in her left hand. Standing upright, facing right, fake toothy smile.
START: From the Maklerin reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: she takes the pen from behind her ear, ticks something on the clipboard; (2) 0.2 s: looks up with a fake toothy smile and pushes her glasses up.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B34: Grimmzahn: Protestieren

**Anhängen:** das fertige Konzeptblatt von Grimmzahn · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Stocky green goblin union boss, about 71 percent of the boy Max's height. Big underbite with two jutting teeth, bushy eyebrows. Yellow hard hat, brown work vest over a grey shirt, patched trousers, a silver whistle on a string. A blank protest sign on a stick held upright in his right hand, left fist on his hip. Facing right, stubborn look.
START: From the Grimmzahn reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: he pumps the blank protest sign up and down; (2) 0.2 s: blows the silver whistle with puffed cheeks.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B35: Goblin-Arbeiter 1: Pickel schwingen

**Anhängen:** das fertige Konzeptblatt von Goblin-Arbeiter 1 · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small skinny green goblin miner, about 61 percent of the boy Max's height. Pointy ears, long nose. Blue miner overalls, a dented grey helmet with a tiny lamp, small brown boots. A pickaxe resting on his shoulder. Standing upright, facing right, grumpy look.
START: From the Goblin-Arbeiter 1 reference sprite.
ACTION (2 key poses for a 6-frame animation of about 0.6 s; Claude draws the in-between frames): (1) 0.0 s: he swings the pickaxe from his shoulder down in front of him and lifts it back, grumpy face, at one end of the movement; (2) 0.3 s: the same action at the opposite end of the movement.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B36: Goblin-Arbeiter 2: Gähnen und strecken

**Anhängen:** das fertige Konzeptblatt von Goblin-Arbeiter 2 · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Small round green goblin miner, about 61 percent of the boy Max's height. Pointy ears, droopy eyelids. Orange miner overalls, no helmet, small brown boots. A big steaming mug held in both hands. Standing upright, facing right, sleepy look.
START: From the Goblin-Arbeiter 2 reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: he leans on his tool, stretches both arms up with a huge yawn; (2) 0.2 s: slumps back.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: feet stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B37: Wirtskatze Minka: Putzen

**Anhängen:** das fertige Konzeptblatt von Wirtskatze Minka · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A slender elegant long-haired white cat, about 32 percent of the boy Max's height sitting, fluffy plume tail, blue eyes, pink nose. A pink ribbon bow around her neck, no collar. Sitting very upright, tail wrapped around her paws, facing right, proud look. No grey fur, no stripes.
START: From the Minka reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: she licks one front paw and wipes it over her ear; (2) 0.2 s: sits proudly upright again.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: tail stays wrapped around her paws.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B38: Taverne-Huhn: Aufplustern

**Anhängen:** das fertige Konzeptblatt von Taverne-Huhn · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A plump brown hen, about 25 percent of the boy Max's height, small red comb, sitting in a small straw basket, one eye half closed, facing right, suspicious look.
START: From the Taverne-Huhn reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: the hen puffs up her feathers, turns her head to eye the viewer suspiciously; (2) 0.2 s: settles down again.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: the straw basket stays still.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B39: Schmiede-Ziege: Im Kreis drehen

**Anhängen:** das fertige Konzeptblatt von Schmiede-Ziege · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A small white goat, about 49 percent of the boy Max's height, short horns, a small brass bell on a red string, a sword blade sticking out of its chewing mouth. Standing on all fours, facing right, calm chewing look.
START: From the Schmiede-Ziege reference sprite.
ACTION (2 key poses for a 8-frame animation of about 0.8 s; Claude draws the in-between frames): (1) 0.0 s: just starting: the goat turns once around on the spot in a small circle, still chewing the sword blade, and ends facing right again; (2) 0.8 s: the same action completed.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: the bell keeps swinging.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B40: XXL-Ziege: Wiederkäuen

**Anhängen:** das fertige Konzeptblatt von XXL-Ziege · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A huge shaggy brown goat, about 125 percent of the boy Max's height, as tall as a man, big curled horns. A blank brown paper delivery label tied around its neck with string. Standing on all fours, facing right, bored expression.
START: From the XXL-Ziege reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: the huge goat chews slowly with a sideways jaw; (2) 0.2 s: ears flick, bored half-closed eyes.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: legs stay planted.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W1-B41: Schwan: Fauchen

**Anhängen:** das fertige Konzeptblatt von Schwan · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A white swan floating on the water, about 43 percent of the boy Max's height, orange beak with a black knob, long neck in an S-curve, one eye narrowed. Facing right, suspicious look, a small ripple line at the waterline.
START: From the Schwan reference sprite.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: the swan stretches its neck low over the water, opens its beak hissing and half-raises its wings; (2) 0.4 s: settles back.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
HOLD STILL: waterline stays the same.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Welt 2 (Posenbögen; die Bewegung selbst kommt aus dem 3D-Clip)

### W2-P01: Max Tag 1

**Anhängen:** Max' Figurenblatt · **Posen:** 3 · **Wofür:** Barfuß-Lauf, Hebel

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
POSES (left to right): Three poses of the boy Max, barefoot, sneakers gone: (1) on tiptoe on hot sand, one knee raised high, arms flung out wide, pained face; (2) sitting on a small wooden seat with both hands gripping the seat edge, legs dangling, nervous face; (3) in the air in a curled position, arms and legs spread out, mouth open in a yell.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P02: Max Finaltag

**Anhängen:** Max' Figurenblatt · **Posen:** 4 · **Wofür:** Speer, Diskus

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
POSES (left to right): Four poses of the boy Max: (1) holding a long thin spear at shoulder height, arm cocked back, one foot forward; (2) right after the throw, throwing arm stretched forward, empty hand, leaning forward on one leg; (3) holding a flat round disc out to the side with a straight arm, body twisted, knees bent; (4) wobbling, arms windmilling, one foot lifted, about to tip over.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P03: Ramses

**Anhängen:** Konzeptblatt Ramses · **Posen:** 3 · **Wofür:** Unentschlossen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Indecisive young pharaoh, slim, about 106 percent of the boy Max's height. Blue-and-gold striped headdress slightly askew, thin false beard, kohl-lined worried eyes. Broad golden collar, white linen kilt with a gold belt, golden sandals. A crook scepter in his left hand and a flail scepter in his right, glancing from one to the other. Standing upright, facing right, confused frown.
POSES (left to right): Three poses of the young pharaoh, feet unchanged: (1) looking down at the crook scepter in his left hand, head tilted; (2) looking at the flail scepter in his right hand, shoulders raised; (3) both scepters held up level, eyes darting sideways, helpless shrug.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P04: Sobek

**Anhängen:** Konzeptblatt Sobek an Land · **Posen:** 3 · **Wofür:** Verbeugen, Kriechen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A lazy teenage crocodile half submerged in turquoise water, about 29 percent of the boy Max's height above the waterline, olive-green scales, a small woven reed hat. Rolling its eyes, bored look, facing right, small ripples around it.
POSES (left to right): Three poses of the lazy crocodile on land: (1) head lowered flat to the ground, reed hat tipped forward over its eyes, bowing; (2) crawling, front left and back right legs forward, tail curved to one side; (3) crawling, the other two legs forward, tail curved to the other side.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P05: Hofkater

**Anhängen:** Konzeptblatt Hofkater · **Posen:** 3 · **Wofür:** Beleidigt abziehen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A sleek arrogant temple cat, about 37 percent of the boy Max's height sitting, slim with long legs, short sandy fur, large dark brown ears, one golden earring. A broad collar of turquoise and gold beads. Sitting very upright, tail wrapped around the paws, chin raised, facing right. No grey fur, no stripes, no red collar.
POSES (left to right): Three poses of the sandy temple cat: (1) standing on all four legs, body turned away, looking back over the shoulder with half-closed offended eyes; (2) walking away, tail held straight up, near legs forward; (3) walking away, tail straight up, far legs forward.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P06: Schildkröte

**Anhängen:** Konzeptblatt Schildkröte · **Posen:** 2 · **Wofür:** Überholen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A small Greek tortoise, about 21 percent of the boy Max's height, olive-brown shell, a tiny white headband. Walking on four legs, facing right, determined look.
POSES (left to right): Two poses of the small tortoise: (1) walking, front left and back right legs forward, neck stretched far forward, smug face; (2) the same, the other two legs forward.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P07: Archimedes

**Anhängen:** Konzeptblatt Archimedes, Handtuch-Fassung · **Posen:** 3 · **Wofür:** Heureka

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Excited old Greek mathematician, short and wiry, about 96 percent of the boy Max's height. Wild white beard and dripping wet white hair. White chiton with ink stains, barefoot. A bronze drawing compass in his right hand. Leaning forward with wide eyes, facing right.
POSES (left to right): Three poses of the old mathematician wrapped in a white towel, dripping wet: (1) both arms raised high, mouth wide open shouting with joy; (2) one bare leg stepping high over a low edge, arms out for balance; (3) leaning forward in a running stride, one hand holding the towel tight.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P08: Hermes

**Anhängen:** Konzeptblatt Hermes · **Posen:** 3 · **Wofür:** Joggen auf der Stelle

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Quick young messenger, slim, about as tall as the boy Max. Curly blond hair, a small cap with two white wings. Short sky-blue tunic, barefoot. A leather satchel full of rolled letters across his chest. Jogging on the spot, facing right, cheerful grin.
POSES (left to right): Three poses of the young messenger jogging on the spot: (1) left knee raised, right arm forward; (2) both feet on the ground, mid-step; (3) right knee raised, left arm forward. Satchel stays on the same side.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P09: Leonidas

**Anhängen:** Konzeptblatt Leonidas · **Posen:** 3 · **Wofür:** Brüllen, Pfeifen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Loud muscular Greek athlete, about 114 percent of the boy Max's height. Bronze helmet with a white horsehair crest and open face, short black beard. Blue-and-white striped tracksuit with the jacket open over a white shirt, sandals, a whistle on a cord around his neck. Fists on his hips, mouth wide open as if shouting, facing right. No red cape, no bare chest, no spear, no round shield, no loincloth.
POSES (left to right): Three poses of the loud athlete, feet planted: (1) leaning back, fists clenched, mouth wide open shouting; (2) whistle in his mouth, cheeks puffed, one hand raised flat; (3) pointing forward with one arm, the other fist on his hip.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P10: Cicero

**Anhängen:** Konzeptblatt Cicero · **Posen:** 3 · **Wofür:** Rede halten

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Pompous Roman orator, stocky, about 104 percent of the boy Max's height. Receding hairline, double chin, raised eyebrows. White toga with a broad purple stripe, sandals. A scroll in his left hand, right arm raised dramatically mid-speech. Standing upright, facing right.
POSES (left to right): Three poses of the pompous orator, legs unchanged, scroll in the left hand: (1) right arm swept high to the side, chin up; (2) right index finger raised, eyebrows lifted; (3) right hand pressed to his chest, eyes half closed.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P11: Philosoph

**Anhängen:** Konzeptblatt Philosoph · **Posen:** 2 · **Wofür:** Schimpfen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Scruffy old Greek philosopher with wild grey hair and beard and a torn grey cloak, sitting inside a large clay barrel lying on its side with its opening to the right, about 71 percent of the boy Max's height including the barrel. A small oil lantern beside him. Pointing and shouting, facing right.
POSES (left to right): Two poses of the old philosopher in his barrel, barrel and lantern unchanged: (1) fist raised high, mouth open shouting; (2) fist lowered, pointing a finger forward, scowling.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P12: Fächerwedler

**Anhängen:** Konzeptblatt Fächerwedler · **Posen:** 3 · **Wofür:** Fächeln

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Sweating Egyptian fan bearer, thin, about as tall as the boy Max. Blue-and-white striped headscarf, white kilt, bare feet. A palm-leaf fan on a long pole, twice his height, held lowered and resting. Facing right, glancing hungrily to the side.
POSES (left to right): Three poses of the fan bearer, feet planted: (1) the long palm-leaf fan raised high above his head; (2) the fan level in front of him; (3) the fan swung low near the ground.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P13: Nebet

**Anhängen:** Konzeptblatt Köchin Nebet · **Posen:** 3 · **Wofür:** Rühren, abschmecken

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Energetic Egyptian palace cook, about 94 percent of the boy Max's height, round face, flour on her cheeks. Blue headscarf, white linen dress, ochre apron, sandals. A wooden ladle in her right hand. Standing upright, facing right, curious raised eyebrow.
POSES (left to right): Three poses of the palace cook, feet unchanged: (1) leaning slightly forward, the wooden ladle held low in front of her in her right hand as if stirring a pot, left hand on her hip; (2) the same, the ladle moved to the other side of the pot; (3) the ladle lifted to her mouth, tasting, eyes closed, eyebrows raised in delight.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P14: Hieron

**Anhängen:** Konzeptblatt König Hieron · **Posen:** 3 · **Wofür:** Ungeduld

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Suspicious Greek king, heavyset, about 111 percent of the boy Max's height. Curly grey beard, bare head without a crown, narrowed eyes. Deep blue cloak with a gold border over a white chiton, sandals. Arms crossed, standing upright, facing right. No purple, no red.
POSES (left to right): Three poses of the suspicious king, feet unchanged: (1) arms crossed, head tilted, one foot lifted to tap; (2) arms crossed, shaking his head, eyes rolled upward; (3) arms uncrossed, right arm stretched forward pointing accusingly, left fist on his hip, narrowed eyes.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P15: Tiro

**Anhängen:** Konzeptblatt Tiro · **Posen:** 3 · **Wofür:** Schreiben

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Thin nervous young Roman scribe, about 94 percent of the boy Max's height. Short dark hair, a stylus behind his ear. Plain off-white tunic with a narrow red border, sandals. A big wax tablet held under his left arm. Standing upright, facing right, glancing sideways guiltily.
POSES (left to right): Three poses of the nervous young scribe, feet unchanged: (1) the wax tablet held against his chest with the left arm, writing on it quickly with a stylus in the right hand, head bent; (2) looking guiltily over his left shoulder, stylus raised; (3) looking guiltily over his right shoulder, tablet pressed tight to his chest.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P16: Palastschreiber

**Anhängen:** Konzeptblatt Palastschreiber · **Posen:** 3 · **Wofür:** Schreiben, gähnen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Thin Egyptian palace scribe sitting cross-legged on the floor, about 65 percent of the boy Max's height seated. Shaved head, a reed pen behind his ear, half-closed eyes. White linen kilt, bare feet. A small writing board on his lap. Facing right, bored expression.
POSES (left to right): Three poses of the thin scribe sitting cross-legged on the floor, legs unchanged: (1) bent over the writing board on his lap, writing slowly with the reed pen; (2) sitting up, both arms stretched high above his head; (3) arms stretched, mouth wide open in a huge yawn, eyes shut.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P17: Publikum

**Anhängen:** Konzeptblatt Römischer Tourist · **Posen:** 2 · **Wofür:** Einschlafen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
POSES (left to right): Three spectators sitting side by side on a stone bench, a plump Roman tourist in a red toga and two Greeks in white tunics, shown twice: (1) sitting upright, listening politely; (2) slumped and asleep, heads drooping, the last one with mouth open snoring.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P18: Fährmann

**Anhängen:** Konzeptblatt Fährmann · **Posen:** 3 · **Wofür:** Staken, Münze prüfen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An old Egyptian ferryman, wiry, about 104 percent of the boy Max's height. Long white beard, deeply tanned skin, a wide flat straw hat. A tattered ochre tunic, bare feet. Leaning on a long punting pole held in his left hand, right palm held out open for a coin. Facing right, expectant look.
POSES (left to right): Three poses of the old ferryman: (1) pushing the long punting pole down diagonally with both hands, leaning forward; (2) the pole held upright in his left hand, right palm held out open for a coin, eyebrows raised; (3) biting a small coin between his teeth to test it, squinting.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P19: Steinmetz

**Anhängen:** Konzeptblatt Steinmetz · **Posen:** 3 · **Wofür:** Meißeln

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Burly Egyptian pyramid worker, about 106 percent of the boy Max's height. Dusty white headscarf, cheerful toothless grin. Dusty white linen wrap around the hips, bare feet. A chisel in his left hand, a wooden mallet in his right. Standing upright, facing right.
POSES (left to right): Three poses of the burly stone worker, feet planted: (1) the chisel held against an invisible stone at chest height, the mallet raised high; (2) the mallet striking the chisel; (3) wiping his forehead with the back of his mallet hand, toothless grin.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P20: Zeremonienmeister

**Anhängen:** Konzeptblatt Zeremonienmeister · **Posen:** 3 · **Wofür:** Ankündigen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Pompous Egyptian master of ceremonies, about 106 percent of the boy Max's height. Tall headpiece of white ostrich feathers, painted eyes. Pleated white robe with a turquoise sash. A long gilded staff in his right hand, a rolled plan in his left. Standing upright, facing right, chin raised.
POSES (left to right): Three poses of the pompous master of ceremonies, feet unchanged: (1) the gilded staff raised high, chin up, mouth open announcing; (2) the staff struck down on the ground, the plan unrolled in his other hand; (3) reading the plan held close to his painted eyes, eyebrows raised.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P21: Brian

**Anhängen:** Konzeptblatt Brian · **Posen:** 3 · **Wofür:** Abwehren

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An ordinary bearded man, about 104 percent of the boy Max's height. Brown hair, short brown beard. Simple brown robe with a rope belt, sandals. A blank wooden sign hanging on a cord around his neck. Both hands raised defensively, facing right, annoyed and confused look.
POSES (left to right): Three poses of the ordinary bearded man, feet unchanged: (1) both hands raised defensively, leaning back; (2) pointing with both hands at the blank sign on his chest, exasperated; (3) face buried in one palm, shoulders slumped.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P22: Beamter 1

**Anhängen:** Konzeptblatt Beamter 1 · **Posen:** 2 · **Wofür:** Eindösen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Bored Greek official sitting on a stool, about 78 percent of the boy Max's height seated. Bald head, droopy eyelids. Plain grey tunic, sandals. A giant unrolled blank scroll held in both hands. Facing right, half asleep.
POSES (left to right): Two poses of the bored official sitting on his stool, stool unchanged: (1) head drooped forward, eyes closed, the scroll sagging in his hands; (2) jerked awake, eyes wide, the scroll held up stiffly in front of him.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P23: Beamter 2

**Anhängen:** Konzeptblatt Beamter 2 · **Posen:** 3 · **Wofür:** Stempeln

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Fussy thin Greek official, about 104 percent of the boy Max's height. Small round spectacles, thin mustache, neatly combed hair. Pale green tunic, sandals. A big wooden stamp raised in his right hand. Standing upright, facing right, pinched expression.
POSES (left to right): Three poses of the fussy official, feet unchanged: (1) the big wooden stamp raised high in his right hand; (2) the stamp pressed down hard at waist height as if onto a desk, lips pursed; (3) pushing his round spectacles up with one finger, pinched look.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P24: Römische Touristin

**Anhängen:** Konzeptblatt Römische Touristin · **Posen:** 3 · **Wofür:** Fächeln, mustern

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Roman tourist woman, about as tall as the boy Max. Dark hair in a bun, big round sunglasses. Purple toga, sandals. A folding fan in her right hand, a small souvenir amphora under her left arm. Standing upright, facing right, unimpressed look.
POSES (left to right): Three poses of the Roman tourist woman, feet unchanged: (1) fanning herself with the folding fan, bored; (2) lowering her round sunglasses with one finger, unimpressed stare; (3) holding up the small souvenir amphora admiringly.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P25: Ägypter aus dem Volk

**Anhängen:** Konzeptblatt Ägypter aus dem Volk · **Posen:** 2 · **Wofür:** Widerwillig klatschen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Ordinary Egyptian man, about as tall as the boy Max. Short black hair, tanned skin. Simple white linen kilt, bare feet. Arms crossed, standing upright, facing right, unimpressed face.
POSES (left to right): Two poses of the ordinary Egyptian man, feet unchanged: (1) arms crossed, unimpressed; (2) hands brought together in front of his chest in a slow reluctant clap, eyes rolled upward.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P26: Straßenmusiker

**Anhängen:** Konzeptblatt Straßenmusiker · **Posen:** 3 · **Wofür:** Lyra spielen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Greek street musician, slim, about as tall as the boy Max. Curly dark hair, a laurel twig behind one ear. Short pale blue tunic, sandals. A wooden lyre held in both hands. Standing upright, singing with eyes closed, facing right.
POSES (left to right): Three poses of the street musician, feet unchanged: (1) plucking the lyre strings, eyes closed, singing softly; (2) head thrown back, mouth wide open on a high note; (3) a small bow, the lyre lowered to his side.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### W2-P27: Sobek im Wasser

**Anhängen:** Konzeptblatt Sobek im Wasser · **Posen:** 2 · **Wofür:** Augen rollen, abtauchen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A lazy teenage crocodile half submerged in turquoise water, about 29 percent of the boy Max's height above the waterline, olive-green scales, a small woven reed hat. Rolling its eyes, bored look, facing right, small ripples around it.
POSES (left to right): Two poses of the lazy teenage crocodile half submerged in the water: (1) rolling its eyes upward, reed hat tilted; (2) sunk lower, only eyes, snout tip and hat above the water, a few bubbles.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

# 3. Gegenstände

## Prolog und Dachboden-Szenen

### PF-G02: Gegenwart (2×4)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x4 grid: a plain white hen's egg; a small paper flour sack tied at the top with a blank round seal; a single finger-sized AA battery glowing soft orange; a crumpled handwritten note with blank lines; a small folded note with one long blank line; a glass milk bottle with a red cap; a slice of chocolate birthday cake with a candle; a small brown paper cookie bag, folded over at the top, with bone-shaped dog biscuits peeking out.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G03: Deko Opas Haus (3×4)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x4 grid, scene props at the same scale as a 189-pixel tall adult character, not inventory icons: a stuffed fish wearing round diving goggles; a cardboard box with half-closed flaps and a few broken TV remotes poking out; the same box with flaps wide open and many remotes sticking up like hungry chicks; a pinned travel poster showing a pyramid on the left half and a neon city skyline on the right half, blank caption strip; a chrome toaster with a small propeller on top; a thick old cookbook lying closed with a folded page corner and a blank cover; the same cookbook lying open at the dog-eared page, one blank line underlined in pencil; a small record player with a vinyl record and a blank sleeve; a framed photo of a stern old woman with grey hair in a bun and a purple cardigan; a beanie hat with a tiny propeller hanging on a wall hook; a cardboard store display with a milk bottle picture and a blank price tag; a bulky 1950s vacuum cleaner prototype with a cracked glass dome, a bent nozzle and a tuft of grey cat fur stuck in it.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G05: Einsaug-Effekt

**Hinweis:** EFFEKT, 8 Bilder, je 192×192, mittig über dem Bildschirm

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
SUBJECT: 8 frames of 192x192: swirl of colorful light streaks spiraling into a TV screen at the center, growing stronger frame by frame, the last two frames a white flash filling most of the frame.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G06: Werkbank-Ablage

**Hinweis:** GEGENSTÄNDE, 3 Zustände, je etwa 96×48

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x3 grid, the same right end of a wooden workbench top in three states side by side, same scale: a folded grey cloth with a cardboard egg carton holding one white egg, a blank strip on the carton lid; the same with a small paper flour sack tied at the top with a blank round seal next to the carton; the same with egg carton, flour sack and a finger-sized battery cell glowing soft orange.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G07: Kalenderkreis

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 32×32, liegt als Sprite über dem gemalten Kreis im Kalender und deckt ihn ganz ab

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, the same small square of a paper wall calendar page with blank day cells in two states side by side, same scale: one day circled twice in thick red marker; the same day circled twice with a thick red exclamation mark next to it, pressed so hard that the paper is dented.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G08: Dachlampe

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 48×64, liegt als Sprite über der Lampe am Firstbalken

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, the same bare light bulb with an enamel shade hanging on a short cord, same scale: switched off, grey glass; switched on, warm yellow bulb with a soft glow around it.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G09: Fundkiste

**Hinweis:** GEGENSTÄNDE, 2 Zustände, je etwa 80×64; steht ab Rückkehr 1 auf dem freien Platz am Kistenstapel links, Aufschrift „Fundkiste“ von Hand in Aseprite; im Finale anklickbar (Omas Kekse, falls nicht eingepackt)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x2 grid, the same open cardboard box with flaps folded outward and a blank paper label taped on the front, seen from the front at eye level, same scale: first almost empty with a single odd item at the bottom; second piled high with a jumble of small odd objects, a wooden bucket handle and a rolled paper sticking out over the rim.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### PF-G10: Werbeblock

**Hinweis:** EFFEKT, 4 Bilder plus 1 Störbild, 640×360, ohne Farb-Baustein

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
SUBJECT: Full-screen TV commercial frames, 640x360 each, cheap 1990s studio look, flat bright colors, no text: a tall glass of milk with a sparkle on a blue backdrop; a smiling black-and-white cartoon cow (not purple); a big blank price tag; a white flash. Fifth frame: the cow frame torn by horizontal glitch lines.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Welt 2

### W2-G03: Feigen-Zustände (1×4, Baum doppelt so groß)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x4, left to right: a single fig seed; a tiny fig sapling in a small clay pot; a small fig tree in a large clay pot, full of plump purple figs, drawn twice as tall as the other items; a handful of three picked purple figs.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G05: Schriftstücke (1×4)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x4, same scale, left to right: a rolled papyrus scroll tied with a red cord; an old official circular, a dusty papyrus sheet with a huge red wax seal; a folded letter sealed with a small sphinx-shaped seal; a rolled papyrus plan tied with a turquoise ribbon, four empty square boxes visible at its open end.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G06: Getränke-Zustände (1×3)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x3, same scale, left to right, three clay amphoras of exactly the same shape and size: grape juice with painted grapes; wine with a painted laurel; vinegar with a painted sour face.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G07: Grabstein-Zustände (1×4)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x4, world sprite about 48x80 pixels, same footprint and position in every cell, left to right: a freshly carved white tombstone with a relief of a sphere inside a cylinder; the same tombstone turned grey, edges worn and a few fine cracks, no moss; the same tombstone weathered, cracked and covered in moss; a crumbled pile of stone chunks spilling from an open burlap bag.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G08: Wunderdinge (1×3)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x3, same scale, left to right: a modern smartphone with a dark screen showing only a tiny red nearly empty battery symbol; a small pack of chewing gum in a plain pink wrapper; a blue click ballpoint pen.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G09: Hieroglyphen (4×4, im Spiel 32×32)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 4x4 grid of simple dark red-brown hieroglyph symbols, each drawn alone as a bold flat silhouette in the same line weight and size, no tiles under them, row by row, left to right: eye, bird, crocodile, bread loaf; cat, sun, water waves, standing man; feather, reed, open hand, ear; house, mouth, scarab, seated pharaoh.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G10: Deko Welt 2 (3×3)

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x3 grid of look-only props at world-sprite scale, about 32 to 96 pixels each, left to right: a large papyrus pyramid blueprint shown upside down; a standing golden sarcophagus with a sleeping mask over its painted eyes; a small mummified cat; a scroll with a steam engine sketch; a tiny model of a leaning marble tower; a row of three empty amphoras; a wooden lyre with an upturned straw hat for coins; a round haystack; a stone tablet with blank engraved lines.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G11: Krokodil-Fähre

**Hinweis:** FIGUR-GROSS, 243 Pixel breit

```text
STYLE: Single prop concept in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one object, complete and not cropped, strict side view, standing on a flat baseline, no people or animals unless the motif names them. Draw only this object: do not draw the boy Max or anything else from the attached sheet.
SUBJECT: A flat wooden ferry raft about 129 percent as wide as the boy Max is tall, side view: a deck of lashed logs with a low railing, a reed canopy on four poles at the back end, two tow ropes running forward from the front edge and ending loose. Facing right, no crocodile, no people on board.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

### W2-G12: Wurfhebel

**Hinweis:** FIGUR-GROSS, 189 Pixel

```text
STYLE: Single prop concept in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one object, complete and not cropped, strict side view, standing on a flat baseline, no people or animals unless the motif names them. Draw only this object: do not draw the boy Max or anything else from the attached sheet.
SUBJECT: A wooden catapult lever about as tall as the boy Max, side view: a long oak beam on a stone pivot block, an empty woven basket hanging from the short left end for counterweights, a small wooden seat with a rope belt on the long right end, a notched wooden angle bracket at the pivot. Facing right, nobody on it.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

# 4. Hintergründe

## Welt 2, Ägypten

### W2-R01: Nil-Delta mit Fährsteg

**Zustände:** 1280×360, linke und rechte Hälfte einzeln erzeugen

**Layout-Skizze:** [Nil-Delta](../skizzen/welt-2/nil_delta.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Sunny Nile riverbank at noon, wide 1280x360 scene built from two 640x360 halves that join seamlessly. LEFT HALF, left to right: a wooden ferry dock at the left edge reaching into turquoise water, with open water at its end; beside the dock a blank wooden sign board with three carved rows and a tall hourglass on a post; tall papyrus reeds with one loose blank sheet caught in them; open sandy ground. RIGHT HALF, left to right: a small field of golden wheat, one row of stalks pressed flat in the shape of a hand; open sandy ground; a narrow trail climbing a dune toward a tiny distant sphinx on the horizon; a sandy path leaving at the right edge toward a palace gate. Background across both halves: the wide river, and across it, behind the wheat field, a stone pyramid standing upside down on its tip with wooden scaffolding and tiny workers scratching their heads. Sandy floor with gentle depth in the lower third kept clear. Harsh sun from upper left.
PALETTE: warm desert palette of sand, ochre and gold, turquoise river water, harsh midday sun. Color anchors, approximate: sand #e4a672, ochre #d77643, gold #feae34, turquoise water #2ce8f5, pale sand #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

### W2-R04: Thronsaal

**Zustände:** 1280×360, linke und rechte Hälfte einzeln erzeugen; die Parade findet im Stadion von Olympia statt

**Layout-Skizze:** [Thronsaal](../skizzen/welt-2/thronsaal_ramses.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Grand Egyptian throne room, wide 1280x360 scene built from two 640x360 halves that join seamlessly, plenty of open floor between the furniture. LEFT HALF, left to right: the palace entrance at the left edge with free floor beside it; a scribe's low desk with a clay tablet and reed pens; a small empty wall niche above head height; a tall painted column; a second column with a sandstone panel set into it showing four empty symbol slots. RIGHT HALF, left to right: an empty silk cushion on the floor with a small bowl of dates beside it; a golden throne on three steps; a golden plate engraved with a sun on a low stand beside the throne; torches on the back wall; tall wooden doors to the palace kitchen at the right edge. Back wall across both halves: painted columns and a long frieze of people dancing sideways with angled arms, one holding a large portable stereo. Polished stone floor with gentle depth in the lower third kept clear. Torchlight and sunbeams from upper left.
PALETTE: warm palette of sandstone, ochre and gold, painted walls, daylight falling in through high openings, cool shade in the corners. Color anchors, approximate: sandstone #e4a672, ochre #d77643, gold #feae34, painted red #be4a2f, cool shade #5a6988.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

### W2-R05: Palastküche

**Layout-Skizze:** [Palastküche](../skizzen/welt-2/palastkueche.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Ancient Egyptian palace kitchen, 640x360. Left: the doorway to the throne room at the left edge, two round clay ovens with open fire. Center: a cutting table with flat breads, onions and a bowl of dates, bundles of garlic and herbs hanging above it. Right: a wooden shelf with tall round clay oil jugs with cork stoppers, on the floor a clay amphora painted with grapes, and a free corner beside it. Packed clay floor with gentle depth in the lower third kept clear. Steam, warm orange light from upper left.
PALETTE: warm palette of sandstone, ochre and gold, painted walls, daylight falling in through high openings, cool shade in the corners. Color anchors, approximate: sandstone #e4a672, ochre #d77643, gold #feae34, painted red #be4a2f, cool shade #5a6988.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### W2-R06: Sphinx

**Zustände:** Mit Nase und ohne Nase

**Layout-Skizze:** [Sphinx](../skizzen/welt-2/sphinx.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: A huge stone sphinx lying in the desert, seen from its side, head on the right, 640x360, its body filling the upper right half, nose intact. Center: in front of its paws a small writing desk with a notepad, crumpled papyrus balls scattered around it; above the desk, on a sloped stone ledge, a giant round stone ball resting in a carved groove. Left: open dunes, footprints in the sand, the path back at the left edge. Sand floor with gentle depth in the lower third kept clear. Blue sky, heat shimmer, harsh sun from upper left.
PALETTE: warm desert palette of sand, ochre and gold, turquoise river water, harsh midday sun. Color anchors, approximate: sand #e4a672, ochre #d77643, gold #feae34, turquoise water #2ce8f5, pale sand #ead4aa.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The nose broken off and lying in the sand below the face.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Welt 2, Griechenland

### W2-R02: Fährsteg Olympia

**Layout-Skizze:** [Fährsteg Olympia](../skizzen/welt-2/faehrsteg_olympia.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Small wooden dock on a calm blue river among olive trees, bright midday, 640x360. Left: the dock at the left edge reaching into the water with open water at its end, beside it a tall hourglass on a post and a blank wooden sign board with three carved rows. Center: open grassy ground, olive trees in the background behind it. Right of center: an empty wooden fishing boat pulled onto the bank, a few reeds. Right: a stone path climbing a hill to white marble columns, leaving at the right edge. Grass and sand floor with gentle depth in the lower third kept clear. Sun from upper left.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### W2-R11: Agora

**Zustände:** Drei Fassungen: vor Tag 1; nach Tag 1 mit Sandale auf der Adler-Säule; nach dem Finaltag ohne Sandale und mit armloser Statue

**Layout-Skizze:** [Agora](../skizzen/welt-2/agora.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Busy ancient Greek marketplace next to a stadium at noon, wide 1280x360 scene built from two 640x360 halves that join seamlessly, with open ground between the landmarks. LEFT HALF, left to right: an arch toward the stadium at the left edge; a marble statue of a woman with both arms intact; open free ground; a shaded marble colonnade with a small wooden office door in its back wall; open ground. RIGHT HALF, left to right: a raised stone speaker's platform; a very tall column with a stone eagle on top and free ground at its foot; market stalls with fruit and pottery under striped awnings; a plaster wall with a few faint blank scratch marks; a path down toward the river leaving at the right edge. Background across both halves: a crowd of Greeks in white and pale blue and tourists in red togas and straw sun hats. Paved floor with gentle depth in the lower third kept clear. Bright noon light from upper left.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: A golden winged sandal caught on top of the eagle column.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der ersten Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The statue has lost both arms.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

### W2-R10: Startbüro

**Layout-Skizze:** [Startbüro](../skizzen/welt-2/startbuero.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Tiny ancient Greek office, 640x360. Left: the entrance door at the left edge, a yellowed notice with blank lines pinned to the wall next to it, below it a long bench with three bored waiting people. Center: a first counter with an empty stool behind it and towering stacks of scrolls; a second counter with wax tablets and a big wooden stamp, an empty stool behind it. Right: a huge heap of blank papyrus forms piled up to the ceiling at the right edge. Dusty stone floor with gentle depth in the lower third kept clear. Dusty shafts of light from upper left.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### W2-R09: Stadion

**Zustände:** 1280×360, linke und rechte Hälfte einzeln erzeugen; Normal und Parade (ab dem Ende des Finaltags)

**Layout-Skizze:** [Stadion](../skizzen/welt-2/stadion.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Ancient Greek stadium in bright sun, wide 1280x360 scene built from two 640x360 halves that join seamlessly, with lots of open ground for many people. LEFT HALF, left to right: open free ground at the left edge; a sand wrestling pit framed by a low stone wall; a small white judges' tent near the right end of the half. RIGHT HALF, left to right: open ground; a white stone start line across the track; far away a tall white marble bell tower standing perfectly straight; the path to the marketplace leaving at the right edge. Across both halves: a long sand running track along the floor, and behind it stone spectator rows with a cheering crowd, with a shaded seating box with an awning in the rows at the left end of the right half. Floor with gentle depth in the lower third kept clear. Sun from upper left.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Breitbild:** erst die linke Hälfte erzeugen (alle Zeilen, aus SCENE nur Anfang, „LEFT HALF“
und Hintergrund), dann im selben Chat die rechte Hälfte, die nahtlos anschließt. Zusammensetzen
macht Claude.

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Garlands, banners and flower petals everywhere, the bell tower now visibly leaning.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

### W2-R03: Hafen Syrakus

**Layout-Skizze:** [Hafen Syrakus](../skizzen/welt-2/hafen_syrakus.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Sunny harbor where the river meets the sea, 640x360, open sea behind on the left. Left: the ferry dock at the left edge with open water at its end, a tall hourglass on a post with all its sand in the lower bulb, a blank wooden sign board. Left of center: fishing nets hung to dry on poles, one net sagging low with a small purple squid in it. Center, in the background: a path climbing a hill to cypress trees. Right of center: a stone quay with amphoras lined up. Right: a narrow street climbing to a workshop with a smoking chimney and a big wooden gear above its door, leaving at the right edge. Seagulls. Stone quay floor with gentle depth in the lower third kept clear. Bright sun from upper left.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### W2-R07: Archimedes' Werkstatt

**Layout-Skizze:** [Archimedes' Werkstatt](../skizzen/welt-2/werkstatt.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Cluttered ancient Greek inventor's workshop, 640x360. Left: a water organ with bronze pipes against the back wall, in front of it a marble bathtub full of water. Left of center: a workbench with a bronze balance scale, a clay measuring cup, scattered gears and scrolls; above it on the back wall pinned sketches, one clearly showing a sphere inside a cylinder, and a small empty shelf. Right of center: a wide window high on the back wall, open free floor below it. Right: a large polished bronze mirror on a stand, a big clay jug with a painted sour face on the floor, the workshop door at the right edge. Floor with gentle depth in the lower third kept clear. Sunlight from upper left through the window.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### W2-R08: Grabhügel Syrakus

**Zustände:** Leer und mit verwittertem Grabstein

**Layout-Skizze:** [Grabhügel Syrakus](../skizzen/welt-2/grabhuegel.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Overgrown hillside outside a Greek city, late afternoon, 640x360. Left: the path down to the harbor at the left edge, brambles and thorn bushes. Center: a small clearing with an empty square stone base. Right: old tombstones half hidden in the green, tall cypress trees, the city walls in the distance. Dry grass floor with gentle depth in the lower third kept clear. Warm light from upper left, cicadas on the branches.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: On the base stands a weathered, moss-covered tombstone with a relief of a sphere inside a cylinder.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

### W2-R12: Flusskarte

```text
STYLE: Illustrated travel map for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, seen straight from above, simple readable shapes, clearly separated clickable locations with generous space between them, light from upper left, no text, no letters, no labels, no compass rose with letters.
SCENE: Illustrated map of one river flowing from the upper left to the lower right. Upper left: yellow desert with a small upside-down pyramid, a sphinx and a wooden dock. Middle: green olive hills with an oval stadium, white columns and a wooden dock. Lower right: a walled seaside city with a harbor where the river meets the sea. A tiny crocodile pulling a raft on the river. The three docks as clearly separated clickable spots, no text, no labels.
PALETTE: warm desert palette of sand, ochre and gold, turquoise river water, harsh midday sun. Color anchors, approximate: sand #e4a672, ochre #d77643, gold #feae34, turquoise water #2ce8f5, pale sand #ead4aa.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no fisheye view, no photorealism, no 3D render, no blur, no watermark
```

## Welt 2, Nahansichten und Tafeln (füllen das ganze Bild wie ein Hintergrund)

### W2-N01: Hieroglyphen-Grammatik (Rätsel 2)

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: A sandstone wall panel filling the frame, a row of four empty square symbol slots at the top, below it a small grid of three empty symbol pairs with a carved arrow between the two symbols of each pair, faint chisel marks, torchlight from upper left.
PALETTE: warm palette of sandstone, ochre and gold, painted walls, daylight falling in through high openings, cool shade in the corners. Color anchors, approximate: sandstone #e4a672, ochre #d77643, gold #feae34, painted red #be4a2f, cool shade #5a6988.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

### W2-N02: Fährtafel

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: A weathered wooden dock sign filling the frame, three blank carved rows, a small hourglass carving at the top, rope wound around the post at the edge, bright sun from upper left.
PALETTE: warm desert palette of sand, ochre and gold, turquoise river water, harsh midday sun. Color anchors, approximate: sand #e4a672, ochre #d77643, gold #feae34, turquoise water #2ce8f5, pale sand #ead4aa.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

### W2-N03: Aushang im Startbüro (Rätsel 3)

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: A yellowed papyrus notice with about eight blank lines and a round official red wax seal at the bottom, pinned with two wooden pegs to a cracked plaster wall, dusty light from upper left.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

### W2-N04: Sandgrube (Rede-Ringen)

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: A sand wrestling pit in strict side view, a flat sand floor across the lower third with exactly five evenly spaced straight step lines drawn across the sand from left to right, the fifth just in front of a low stone wall that closes the pit at the right edge, cheering spectators in stone rows behind, no characters in the pit.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

### W2-N05: Konter-Auswahl (Rede-Ringen)

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: A papyrus dialog panel seen straight on, filling the frame with a thin margin of dark marble around it, seven empty option rows stacked vertically, a thin laurel wreath border, one row lightly highlighted and one row greyed out.
PALETTE: bright Mediterranean palette of white marble, olive green and deep blue sky, sunny and airy. Color anchors, approximate: marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

### W2-N06: Paraden-Plan (Rätsel 6b)

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: A papyrus planning board seen straight on, filling the frame with a thin margin of sandstone around it, four empty square slots in a row connected by painted arrows from left to right, a small painted sun above the second slot, nothing inside the slots.
PALETTE: warm palette of sandstone, ochre and gold, painted walls, daylight falling in through high openings, cool shade in the corners. Color anchors, approximate: sandstone #e4a672, ochre #d77643, gold #feae34, painted red #be4a2f, cool shade #5a6988.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

# 5. Später: erst für Welt 3, Welt 4 und das Finale

## Figuren

### PF-F05: Opa auf dem Sofa

**Anhängen:** Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
SUBJECT: Grandpa Konrad, wild white hair, round brass goggles on his forehead, brown knitted cardigan with tool pockets, beige trousers, red-and-white checkered slippers, slumped on a brown corduroy sofa in side view facing right, watching TV, a cup of tea in his right hand, slippers up on the coffee table, surprised raised eyebrows.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F06: Oma

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Grandma, about as tall as the boy Max, the shortest adult, small and sturdy. Grey hair (#8b9bb4) in a tight bun, round glasses, rosy cheeks. Purple cardigan (#68386c) over a dark green dress (#265c42), black handbag on her left arm, sensible brown shoes (#733e39). Standing straight, eyebrows raised, a stern but loving look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F07: Mutter

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Max's mother, about 104 percent of the boy Max's height, slim, brown ponytail, tired but friendly eyes. Open dark blue jacket (#262b44) over a green sweater (#3e8948), blue jeans (#124e89), white sneakers. Just home from a late shift, house keys in her right hand, neutral standing pose, facing left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F10: Max mit Energiezelle

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Standing more upright, hoodie and hair still wet with a few drips, holding a glowing orange energy cell the size of a thermos flask in both hands at chest height, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F11: Max mit Goldener Fernbedienung

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: Max standing upright, shoulders back, a gleaming golden remote with jewel buttons in his right hand held at hip height, left hand loose, calm look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F12: Opa mit Zündkapsel

**Anhängen:** Opas Figurenbogen (sonst das Opa-Sprite) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
SUBJECT: Grandpa Konrad holding a worn grey TV remote high above his head in his right hand like a sword, left fist clenched, triumphant wide grin, goggles on his forehead, facing left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F13: Oma mit Gabel

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Grandma standing straight, a small cake fork raised in her right hand with a bite of chocolate cake on it, handbag still on her left arm, one eyebrow raised, tasting with a doubtful look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F14: Zeldina, Finale

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Zeldina: young athletic princess, short brown hair, freckles, a small golden crown tied on with string, rust-orange travel cape over a brown leather vest and a cream shirt, dark brown trousers, sturdy boots, no moving box; a black crooked wand in her right hand, standing upright, facing right, determined grin.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### PF-F15: Pixel auf dem Schrank

**Anhängen:** Pixels Figurenbogen (sonst sein Konzeptblatt) und Max' Blatt als Maßstab

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
SUBJECT: Lying stretched out on his belly in side view facing right, chin on his front paws, one front paw and the fluffy tail dangling down over an edge, smug half-lidded eyes, flat underside so he can be placed on top of the living room cupboard.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Posen und Effekte

### PF-B04: Oma: Treppe steigen

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

### PF-B05: Mutter: Liste lesen

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

### PF-B06: Zeldina: Zauberstab einsetzen

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

### PF-B07: Roboter-Hausmeister: Ofentür halten

**Anhängen:** das fertige Konzeptblatt von Roboter-Hausmeister · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
ACTION (2 key poses for a 4-frame animation of about 0.4 s; Claude draws the in-between frames): (1) 0.0 s: The boxy robot presses both hands against an oven door at hip height, leaning in; (2) 0.2 s: small sparks from his joints, steam escaping at the edges, feet stay planted.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

### PF-B09: Effekt: Maschine läuft

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Overlay for the finale machine, 4 frames at the size of the machine: rows of small lamps blinking red, yellow and green in turn, puffs of steam and grey smoke rising from the copper pipes, transparent background.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

### PF-B10: Effekt: Teig-Schwall

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: 6 frames of 96x96, a gush of brown chocolate dough bursting sideways out of a small oven door, splattering and ending in a few drips.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 96x96 pixels in the game.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Hintergründe

### PF-R02: Dachboden, Finale

**Zustände:** Nacht, Lampe an, Mond im Dachfenster; zwei Zustände im selben Prompt: Maschine läuft (Luke verriegelt; nach Zeldinas Hebeln ist der Riegel als Sprite-Wechsel zurückgeschoben, die Luke bleibt durch den Teig-Überdruck trotzdem zu, Druckmesser im Roten) und Maschine steht (Ofentür offen, Riegel zurück). Blinken und Dampf als Effekt Maschine läuft

**Layout-Skizze:** [Dachboden](../skizzen/prolog/dachboden.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: The same attic at night, same framing and layout, bulb lamp switched on, a full moon in the small window at upper left. Center, where the TV cart stood: a huge homemade baking machine of copper pipes and riveted metal, about 80 percent of the image height, taller than a standing adult, with two round empty sockets side by side at chest height (left for an egg, right for flour), a small antenna dish on top that receives a remote control, a pressure gauge with the needle in the red, rows of small lamps, and a small oven door with a round window at hip height showing rising chocolate dough. Steam and smoke curl upward. Empty floor space left of the machine beside the workbench. Front right: the floor hatch closed by a heavy iron bolt with a red lamp. Strong orange glow from the machine, cold blue moonlight from the window. Second image, same framing: the machine switched off, lamps dark, gauge needle in the green, oven door swung open showing a lopsided chocolate cake, the bolt pulled back, red lamp off, last wisps of steam.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### PF-R04: Wohnzimmer, Geburtstag

**Zustände:** Variante

**Layout-Skizze:** [Wohnzimmer](../skizzen/prolog/wohnzimmer.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: The same living room in the evening, same framing, decorated for a birthday party: colorful paper garlands pinned across the back wall, balloons tied to the sofa armrest, a lopsided steaming chocolate birthday cake with lit candles on the coffee table, a small pile of wrapped presents next to it, confetti on the carpet, free floor space beside the television for a second TV on a wheeled cart. Warm golden lamp light.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

### PF-R06: Supermarkt

**Zustände:** Später Abend

**Layout-Skizze:** [Supermarkt](../skizzen/finale/supermarkt.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Front of a small neighborhood supermarket late in the evening, shopfront seen straight on and parallel to the picture plane, the sidewalk as open floor with gentle depth in the lower third. Left: a row of red shopping carts. Center: automatic glass sliding doors, behind them a brightly lit aisle leading to a glowing milk fridge at the back. Right: a bicycle rack and a flower stand with buckets of tulips. Free sidewalk space left of the door for a store display. Blank sign above the door. Dark blue night sky with a few stars above the roof, a street lamp, warm light spilling out onto the sidewalk.
PALETTE: warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered. Color anchors, approximate: dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731.
LAYOUT: Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```
