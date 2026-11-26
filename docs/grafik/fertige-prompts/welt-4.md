# Fertige Prompts: Welt 4, Kanal 999

Erzeugt von `tools/prompts_zusammensetzen.py` aus `../welt-4.md` (dort ändern, nicht hier).

# Grundlagenbilder für Welt 4

Diese Bilder entstehen in Gemini, von oben nach unten. Posenbögen (W4-P), Bewegungen und Effekte (W4-B) macht Claude danach über Meshy oder die Gemini-API, mit dem fertigen Konzeptblatt als Vorlage. Der Stand jeder Nummer steht in `../status-alle-shots.md`, Abschnitt Welt 4.

1. **Räume mit Rohbau zuerst, die heiklen vorn:** W4-R04 Sitcom-Küche und W4-R07 Spukhaus, Keller (nebeneinander prüfen: Tür an der Naht), W4-R13 Zappmanns Studio mit allen drei Fassungen, W4-R12 Empfang, W4-R10 Fondue-Fabrik, W4-R05 Savanne. Danach die übrigen Räume.
2. **Tiere mit dem Gepard als Probelauf:** W4-F12 Gepard, dann sofort W4-B04 im Raum prüfen; erst wenn er passt, W4-F10 Löwe, W4-F11 Hyäne, W4-F13 Geier, W4-F14 Nashorn, W4-F15 Flamingo.
3. **Menschen:** W4-F01 bis W4-F09, W4-F16 bis W4-F30 (Zweitposen im selben Chat aus dem Grundbild).
4. **Gegenstände und Nahansichten:** W4-G01 bis W4-G10, W4-N01 bis W4-N03 (nichts anhängen, Schrift setzt Claude).

Als PNG in voller Größe unter `E:\Game Engine\Grafiken\assets` ablegen, Name mit der Nummer vorn (etwa `W4-F01_gerd_glueck.png`).

Räume: je Szene den Block komplett in Gemini kopieren und den Rohbau (graues Blender-Bild) als
Bild anhängen, dazu wie immer das Stil-Referenzbild. Danach Prüfliste und Umwandeln wie in
`../00-stil-und-werkzeuge.md` (Ablauf pro Szene).

**So wird gearbeitet** (Methode in `../00-stil-und-werkzeuge.md`, „Methode seit 14. November 2026“):
erst die Shotliste eines Abschnitts freigeben, dann die Bilder im Stapel erzeugen. Jeder Block ist
ein Raster mit beschrifteten Zeilen; bei einer Korrektur nur den betroffenen Shot mit dem Baustein
MASKE nachbessern (nur die markierte Stelle ändert sich), die anderen bleiben. Bei Max, Pixel und
Opa steht ihre feste Beschreibung wortgleich in der Zeile CHARACTER LOCK; den Figurenbogen aus
`01-figurenboegen.md` anhängen, sobald er freigegeben ist.

# Shotliste

138 Shots, davon 138 sicher offen („–“: Stand nicht automatisch prüfbar). Kürzel:
R Raum, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen.

| Shot | Bild | Stand |
| --- | --- | --- |
| W4-R01 | Testbild | offen |
| W4-R02 | Rauschen zwischen den Sendern | offen |
| W4-R03 | Glücksrad-Studio | offen |
| W4-R04 | Sitcom-Küche | offen |
| W4-R05 | Savanne | offen |
| W4-R06 | Musikvideo-Friedhof | offen |
| W4-R07 | Spukhaus, Keller | offen |
| W4-R08 | Spukhaus, Halle | offen |
| W4-R09 | Kapitolis | offen |
| W4-R10 | Fondue-Fabrik | offen |
| W4-R11 | Werbespot-Set | offen |
| W4-R12 | Empfang | offen |
| W4-R13 | Zappmanns Studio | offen |
| W4-R14 | Zappmanns erste Kindersendung | offen |
| W4-R15 | Kellerarchiv | offen |
| W4-F01 | Gerd Glück | offen |
| W4-F02 | Trödel-Experte | offen |
| W4-F03 | Flimmer | offen |
| W4-F04 | Max auf dem Testbild | offen |
| W4-F05 | Sitcom-Vater | offen |
| W4-F06 | Sitcom-Mutter | offen |
| W4-F07 | Sitcom-Sohn | offen |
| W4-F08 | Kommissar | offen |
| W4-F09 | Erzähler | offen |
| W4-F10 | Löwe | offen |
| W4-F11 | Hyäne | offen |
| W4-F12 | Gepard | offen |
| W4-F13 | Geier | offen |
| W4-F14 | Nashorn | offen |
| W4-F15 | Flamingo | offen |
| W4-F16 | Zombie | offen |
| W4-F17 | Zombie im Grab | offen |
| W4-F18 | Geist | offen |
| W4-F19 | FBI-Agent | offen |
| W4-F20 | Super-Siegfried | offen |
| W4-F21 | Fledermann | offen |
| W4-F22 | Wonder-Wilma | offen |
| W4-F23 | Dr. Werbepause | offen |
| W4-F24 | Fabrikarbeiter | offen |
| W4-F25 | Empfangsdame | offen |
| W4-F26 | Sicherheitsmann | offen |
| W4-F27 | Zappmann | offen |
| W4-F28 | Junger Zappmann | offen |
| W4-F29 | Wettkandidat | offen |
| W4-F30 | Max als Käsemann | offen |
| W4-P01 | Max Fernbedienung | offen |
| W4-P02 | Max Lichtröhre | offen |
| W4-P03 | Max Fabrik | offen |
| W4-P04 | Käsemann | offen |
| W4-P05 | Pixel Welt 4 | offen |
| W4-P06 | Gerd Glück | offen |
| W4-P07 | Gerd Glück 2 | offen |
| W4-P08 | Trödel-Experte | offen |
| W4-P09 | Sitcom-Vater | offen |
| W4-P10 | Sitcom-Vater 2 | offen |
| W4-P11 | Sitcom-Mutter | offen |
| W4-P12 | Sitcom-Sohn | offen |
| W4-P13 | Kommissar | offen |
| W4-P14 | Kommissar 2 | offen |
| W4-P15 | Erzähler | offen |
| W4-P16 | FBI-Agent | offen |
| W4-P17 | Super-Siegfried | offen |
| W4-P18 | Fledermann | offen |
| W4-P19 | Wonder-Wilma | offen |
| W4-P20 | Dr. Werbepause | offen |
| W4-P21 | Dr. Werbepause 2 | offen |
| W4-P22 | Fabrikarbeiter | offen |
| W4-P23 | Empfangsdame | offen |
| W4-P24 | Sicherheitsmann | offen |
| W4-P25 | Zappmann | offen |
| W4-P26 | Zappmann 2 | offen |
| W4-P27 | Zappmann 3 | offen |
| W4-P28 | Junger Zappmann | offen |
| W4-P29 | Wettkandidat | offen |
| W4-B01 | Flimmer: Flackern | offen |
| W4-B02 | Flimmer: Aus dem Rauschen ploppen | offen |
| W4-B03 | Flimmer: Kichern | offen |
| W4-B04 | Gepard: Sprinten und umfallen | offen |
| W4-B05 | Hyäne: Lachen, Krone fällt | offen |
| W4-B06 | Hyäne: Lachend abgeführt | offen |
| W4-B07 | Löwe: Schmollen | offen |
| W4-B08 | Löwe: Sprung und Krone | offen |
| W4-B09 | Geier: Eincremen | offen |
| W4-B10 | Nashorn: Schnarchen | offen |
| W4-B11 | Flamingo: Tuscheln | offen |
| W4-B12 | Zombies: Aufstehen aus dem Grab | offen |
| W4-B13 | Geister: Vorbeischweben | offen |
| W4-B14 | Geister: Erschrecken und fliehen | offen |
| W4-B15 | Pixel: Sternchen nach dem Amboss | offen |
| W4-B16 | Glücksrad: Rad dreht | offen |
| W4-B17 | Glücksrad-Studio: Preis-Podest dreht | offen |
| W4-B18 | Sitcom-Küche: Fondue-Topf blubbert | offen |
| W4-B19 | Sitcom-Küche: Lachkonserve wackelt | offen |
| W4-B20 | Sitcom-Küche: Keksdose zerspringt | offen |
| W4-B21 | Savanne: Regenwolke über dem Schlagzeug | offen |
| W4-B22 | Savanne: Krabbelkiste | offen |
| W4-B23 | Musikvideo-Friedhof: Leuchtfliesen | offen |
| W4-B24 | Musikvideo-Friedhof: Discokugel | offen |
| W4-B25 | Musikvideo-Friedhof: Hände winken | offen |
| W4-B26 | Musikvideo-Friedhof: Tor schwingt auf | offen |
| W4-B27 | Spukhaus, Keller: Röhrenfernseher | offen |
| W4-B28 | Spukhaus, Keller: Ketten fallen | offen |
| W4-B29 | Kapitolis: Amboss fällt | offen |
| W4-B30 | Fondue-Fabrik: Käse blubbert | offen |
| W4-B31 | Fondue-Fabrik: Laufband | offen |
| W4-B32 | Fondue-Fabrik: Deckel springt auf | offen |
| W4-B33 | Fondue-Fabrik: Käse-Platsch | offen |
| W4-B34 | Werbespot-Set: Couch-Magnet brummt | offen |
| W4-B35 | Werbespot-Set: Stinkwolke | offen |
| W4-B36 | Empfang: Monitor am Tresen | offen |
| W4-B37 | Zappmanns Studio: Monitorwand | offen |
| W4-B38 | Zappmanns Studio: Band klatscht | offen |
| W4-B39 | Zappmanns Studio: Quote fällt | offen |
| W4-B40 | Max: Comic-Look-Wechsel | offen |
| W4-B41 | Umschalten: Effekt | offen |
| W4-B42 | Pause: Effekt | offen |
| W4-B43 | Rückspulen: Effekt | offen |
| W4-B44 | Stumm: Effekt | offen |
| W4-B45 | Sendersuchlauf: Effekt | offen |
| W4-B46 | Kanal 999: Senderanzeige | offen |
| W4-B47 | Lampenflackern: Effekt | offen |
| W4-B48 | WRRUMM-Blase: Effekt | offen |
| W4-B49 | Testbild: Balken rasten ein | offen |
| W4-B50 | Rauschen: Geisterbilder | offen |
| W4-B51 | Müllpresse: Wände rücken, Auge blinzelt | offen |
| W4-G01 | Tasten-Symbole (2×3, 32×32) | offen |
| W4-G02 | Splitscreen-Adapter (1×1) | offen |
| W4-G03 | Genre-Ketten (2×3) | offen |
| W4-G04 | Sender (2×2) | offen |
| W4-G05 | Comic-Panels (1×4, Sortier-Bildschirm, kein Inventar) | offen |
| W4-G06 | Drehbuch (1×1) | offen |
| W4-G07 | Lichtröhre Deluxe (1×1) | offen |
| W4-G08 | Archivband (1×1) | offen |
| W4-G09 | Szenen-Requisiten (2×3, kein Inventar) | offen |
| W4-G10 | Deko Welt 4 (3×3) | offen |
| W4-N01 | Programmzeitschrift (Rätsel 4, 5, 9, 11) | offen |
| W4-N02 | Messingschild am Porträt (Rätsel 12) | offen |
| W4-N03 | Pausentafel Mitternachts-TV (Rätsel 5) | offen |

# Räume

## Testbild

**Shot W4-R01**

**Zustände:** Balken durcheinander; Balken geordnet; Graustufen (Pixels Sicht für Rätsel 1). Die Balken selbst setzt man im Minispiel von Hand, siehe Minispiele

**Rohbau:** [Testbild](../skizzen/welt-4/rohbau/testbild_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: An empty space inside a giant old television test pattern, front view with gentle depth. Seven huge vertical color bars stand like walls across the whole scene, from left to right in shuffled order: magenta, white, blue, yellow, red, cyan, green, some shifted up or down out of line. Behind them, centered, a big round test circle with a crosshair. Flickering grey static along the left and right edges. Floor: a flat dark grey band in the lower third, clear for walking.
PALETTE: old television test pattern look: flat saturated color bars, grey static noise and flickering white snow, no shading, no texture. Color anchors, approximate: bar yellow #fee761, bar cyan #2ce8f5, bar magenta #b55088, bar red #e43b44, bar blue #124e89, static grey #8b9bb4.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The bars in correct order white, yellow, cyan, green, magenta, red, blue, standing in one even line, a few glitter sparkles where they snapped in.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The shuffled scene in shades of grey only.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Rauschen zwischen den Sendern

**Shot W4-R02**

**Zustände:** Empfehlung Übergangsbild (R5-W4-16)

**Rohbau:** [Rauschen zwischen den Sendern](../skizzen/welt-4/rohbau/rauschen_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A low tunnel of grey television static and drifting white snow, front view with gentle depth. A faint lighter path runs along the bottom from the left edge to the right edge as a crawl way for a cat. In the static walls, spaced evenly from left to right: faint ghost images of other shows flickering, a prize wheel, a lion, a gravestone, a skyscraper. Exits: a bright rectangular screen glow at each edge. No characters.
PALETTE: old television test pattern look: flat saturated color bars, grey static noise and flickering white snow, no shading, no texture. Color anchors, approximate: bar yellow #fee761, bar cyan #2ce8f5, bar magenta #b55088, bar red #e43b44, bar blue #124e89, static grey #8b9bb4.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Glücksrad-Studio

**Shot W4-R03**

**Rohbau:** [Glücksrad-Studio](../skizzen/welt-4/rohbau/gluecksrad_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A flashy game show studio, front view with gentle depth. Left: a huge prize wheel with twelve colored segments standing upright, a pointer on top, with free floor at the left edge. Center-left: a small contestant podium. Center: a glittering host podium with a big button and coffee stains. Right: a rotating prize platform stacked with two toasters, a model cruise ship and a fluorescent tube in a blister pack. Back wall: rows of light bulbs and a blank glowing sign shaped like a phone number board. Bottom edge, below the floor: dark silhouettes of audience seats. Hard spotlights.
PALETTE: flashy 1990s game show look: gold, hot pink and spotlight white, rows of light bulbs, glitter sparkles, hard spotlights from above. Color anchors, approximate: gold #feae34, hot pink #b55088, spotlight white #ffffff, deep stage purple #68386c.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Sitcom-Küche

**Shot W4-R04**

**Zustände:** Keksdose ganz (der Vater trägt sie); Scherben und Kekse am Boden (nach Rätsel 3); Küchentür weg (nach Rätsel 6). 1280×360 als ein Panorama in einem Bild (Seitenverhältnis 32:9)

**Rohbau:** [Sitcom-Küche](../skizzen/welt-4/rohbau/sitcom_kueche_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Wide panoramic 1280x360 scene in one continuous image of a bright 1990s sitcom kitchen set, front view with gentle depth as seen from the audience. Left part: a pass-through window to an empty living room, a tall pastel fridge beside it, a skateboard leaning against the end of the counter. Center: a long kitchen counter with a bubbling fondue pot on a burner, a laugh track machine with a big red button standing at its right end. Right part: a small dining table with two chairs, and at the right edge a wooden kitchen door with a round window, standing flat against the side wall. Top edge: studio lights on a rig, the set walls visibly ending against black studio darkness, a blank light box above the set. Bottom edge, below the floor: a row of cardboard audience cutouts in the dark.
PALETTE: bright 1990s studio sitcom look: pastel yellow, mint and peach, flat even studio lighting, set walls visibly ending at the top. Color anchors, approximate: pastel yellow #fee761, mint #63c74d, peach #e8b796, warm white #ead4aa.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Shards of a white chicken-shaped cookie jar and scattered cookies on the floor in front of the fridge.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der zweiten Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The door frame at the right edge empty.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Savanne

**Shot W4-R05**

**Zustände:** 1280×360 als ein Panorama in einem Bild (Seitenverhältnis 32:9). Flamingos, Löwe und alle übrigen Tiere sind eigene Sprites

**Rohbau:** [Savanne](../skizzen/welt-4/rohbau/savanne_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: Wide panoramic 1280x360 scene in one continuous image of an African savanna at golden hour, front view with gentle depth, a nature documentary set. Left part: flat-topped acacia trees around a small watering hole, a warm patch of sunlight on the ground beside a rock. Center: a large rocky outcrop shaped like a throne with an empty hollow on top where something golden used to sit, a boom microphone on a pole reaching in from the top edge above it. Right of center: a thick bush wrapped in yellow crime scene tape, a dense second bush beside it as a hiding spot. Right part: open grass with a lone dead branch for a bird to perch on, a small grey rain cloud hanging low over a drum kit standing in the grass with rain falling only on the drums, a wooden crate full of creepy crawlies with a small blank star-shaped sign, tall grass at the right edge. Orange evening sky, long shadows to the lower right. Open floor kept free for large animals, no animals in the picture.
PALETTE: nature documentary look at golden hour: ochre grass, acacia green, orange evening sky, warm soft light, long shadows to the lower right. Color anchors, approximate: ochre grass #e4a672, acacia green #3e8948, evening orange #f77622, dusk red #be4a2f.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Musikvideo-Friedhof

**Shot W4-R06**

**Zustände:** Gräber zu mit Händen; Gräber offen; Tor zu und offen (nach dem Minispiel)

**Rohbau:** [Musikvideo-Friedhof](../skizzen/welt-4/rohbau/friedhof_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: A foggy graveyard turned into a dance floor at midnight, front view with gentle depth. Center: a square of glowing colored floor tiles, four by three, set among crooked gravestones. Left and right: six graves with low mounds of earth, three on each side, a pale green hand sticking out of each mound. Center back, straight behind the tiles: a rusty iron gate, closed, with a path leading down toward a dark mansion far away. Left: a dead tree with a disco ball hanging from a branch. Full moon above the mansion, purple spotlights, knee-high fog over the floor.
PALETTE: 1980s horror music video look: deep purple and toxic green, knee-high fog, colored disco spotlights, full moon. Color anchors, approximate: deep purple #68386c, night violet #262b44, toxic green #63c74d, moon white #c0cbdc.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The six graves open, the earth thrown aside like blankets, empty.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The iron gate swung open.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Spukhaus, Keller

**Shot W4-R07**

**Zustände:** Tür in Ketten; Sitcom-Tür eingesetzt (nach Rätsel 6)

**Rohbau:** [Spukhaus, Keller](../skizzen/welt-4/rohbau/spukhaus_keller_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A dusty mansion basement, front view with gentle depth. Left edge: a few stone steps up to a heavy wooden door wrapped in chains, set into the side wall. Center: an old tube TV on a crate showing grey static, beside it a shoebox of cassette tapes with blank handwritten labels; boxes and furniture covered with white sheets behind. Right: a broken grave slab in the floor where the tunnel from the graveyard comes up. A single bare bulb hanging from the ceiling in the middle, a tiny cobwebbed window high up on the right.
PALETTE: 1980s horror music video look indoors: deep purple and toxic green, thin floor mist, colored spotlights through cracks, cobwebs, no moon. Color anchors, approximate: deep purple #68386c, night violet #262b44, toxic green #63c74d, cobweb grey #8b9bb4.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The chained door replaced by a bright cheerful wooden kitchen door with a round window, warm light spilling down the steps, the chains lying on the steps.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Spukhaus, Halle

**Shot W4-R08**

**Zustände:** Lichterkette aus; Lichterkette blinkt (Rätsel 7). Die Buchstaben unter den Birnen von Hand

**Rohbau:** [Spukhaus, Halle](../skizzen/welt-4/rohbau/spukhaus_halle_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A creepy old mansion hall, front view with gentle depth. Left: the cellar doorway, a cheerful wooden kitchen door with a round window standing open, warm light rising from stone steps below. Center: a string of 26 large light bulbs running across faded flower-pattern wallpaper at head height in one even row, a blank space below each bulb. Right: a grand staircase with cobwebs like railings, leading up out of frame. Green fog on the floor.
PALETTE: 1980s horror music video look indoors: deep purple and toxic green, thin floor mist, colored spotlights through cracks, cobwebs, no moon. Color anchors, approximate: deep purple #68386c, night violet #262b44, toxic green #63c74d, cobweb grey #8b9bb4.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: Several bulbs lit warm yellow. The wallpaper stays completely blank in both versions, no letters, no writing anywhere.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Kapitolis

**Shot W4-R09**

**Zustände:** Amboss auf der Straße und weg

**Rohbau:** [Kapitolis](../skizzen/welt-4/rohbau/kapitolis_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
SCENE: A comic book city street, front view with gentle depth, everything with thick black outlines and halftone dots. Left: a newspaper kiosk with a blank front page on display. Center: an old iron street lamp at the back edge of the floor with a sturdy arm, strong enough to hang from; a heavy black anvil lying on the sidewalk to its right in a small crater. Right: the street leading on toward a distant factory chimney. Background: tall skyscrapers far behind with blank speech-bubble-shaped signs, a water tower on a roof covered in a big spider web.
PALETTE: bold comic book look: primary red, blue and yellow, thick black outlines on everything, halftone dot shading. Color anchors, approximate: primary red #e43b44, primary blue #0099db, primary yellow #fee761, outline black #181425.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The same street without the anvil, the crater remains.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Fondue-Fabrik

**Shot W4-R10**

**Zustände:** Bottich zu und offen; Suchscheinwerfer aus und an

**Rohbau:** [Fondue-Fabrik](../skizzen/welt-4/rohbau/fondue_fabrik_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A comic book cheese factory hall, front view with gentle depth, thick black outlines and halftone dots. Left: two huge vats of bubbling yellow melted cheese against the back wall and a third vat in front of them with a hinged lid, a narrow catwalk without railing running above all three, a ladder leading up to it. Center: a conveyor belt carrying cheese blocks in a loop. Right: a big red lever on a control post and three warning signs with icons only, no text: exclamation mark, lightning bolt, and a cartoon cheese with a simple face (this one face is intended, it is the only face on any object in the scene); an open doorway at the right edge. A high window shows the night sky and a dark cheese-shaped searchlight on the roof.
PALETTE: bold comic book look: primary red, blue and yellow, thick black outlines on everything, halftone dot shading. Color anchors, approximate: primary red #e43b44, primary blue #0099db, primary yellow #fee761, outline black #181425.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The front vat lid flipped open, cheese splashing, the searchlight beam lit in the sky.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Werbespot-Set

**Shot W4-R11**

**Zustände:** Couch-Magnet auf dem Podest und weg. 1280×360 als ein Panorama in einem Bild (Seitenverhältnis 32:9). Das Gerät auf dem Podest ist der Couch-Magnet 3000. Aufschrift „DR. W.“ auf der Stuhllehne und „Szene 1, Take 400“ auf der Klappe von Hand

**Rohbau:** [Werbespot-Set](../skizzen/welt-4/rohbau/werbespot_set_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Wide panoramic 1280x360 scene in one continuous image of a garish TV commercial set, front view with gentle depth, thick black outlines and halftone dots. Left part: a film camera on a tripod with a red recording light, a director's chair with a blank backrest, a blank clapperboard on the floor. Center: a glowing round product podium under a spotlight, on it a fat purple armchair-shaped gadget with a big red horseshoe magnet on its back. Right part: a second spotlight on a stand, a plastic palm tree in a pot, open floor in front of it. Backdrop across the whole width: loud rainbow stripes.
PALETTE: bold comic book look: primary red, blue and yellow, thick black outlines on everything, halftone dot shading. Color anchors, approximate: primary red #e43b44, primary blue #0099db, primary yellow #fee761, outline black #181425.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The podium empty. Chair backrest and clapperboard stay blank, no letters.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Empfang

**Shot W4-R12**

**Zustände:** 1280×360 als ein Panorama in einem Bild (Seitenverhältnis 32:9). Text auf dem Messingschild von Hand

**Rohbau:** [Empfang](../skizzen/welt-4/rohbau/empfang_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: Wide panoramic 1280x360 scene in one continuous image of a sleek TV network lobby, front view with gentle depth. Left part: a black marble reception desk with a monitor and a small broken old radio covered in scratches on top, behind it a row of framed gold records on the wall. Center: polished black floor with two velvet ropes on golden posts; behind them on the wall a large gold-framed portrait of a man with slicked-back silver hair, tinted gold sunglasses and a glittering golden jacket, a small blank brass plate below it, a blank golden logo above. Right part: a blank ON-AIR lamp above a golden elevator door with a number pad beside it, then a plain grey service door leading down. Glossy floor reflections, brass plate, logo and lamp blank, no letters.
PALETTE: glossy corporate TV network look: black marble, gold trim and glowing monitor blue, polished floor reflections. Color anchors, approximate: black marble #181425, gold trim #feae34, monitor blue #2ce8f5, steel grey #5a6988.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Zappmanns Studio

**Shot W4-R13**

**Zustände:** Zustand 1: Show läuft, Applaus-Schild leuchtet, Quote fast voll. Zustand 2: Applaus-Schild aus (Stumm). Zustand 3: Quote eingebrochen, rot blinkend. Die Monitorinhalte (Max auf jedem Bildschirm, alle Sender gleichzeitig) kommen in Godot darüber

**Rohbau:** [Zappmanns Studio](../skizzen/welt-4/rohbau/zappmanns_studio_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A talk show stage high up in a TV tower, front view with gentle depth. Center: a shiny golden sofa. Left: the open elevator door and a host desk with a coffee mug. Right: a lit blank applause sign on a stand and a tall ratings meter with a glowing bar filled almost to the top; a small band riser in the dark at the back right with only silhouettes of musicians; a studio camera on a pedestal cut off by the right edge in front. Background: a wall of many small monitors, each showing a different show in its own colors: color bars, a prize wheel, a pastel kitchen, a savanna, a purple graveyard, a comic city.
PALETTE: glossy corporate TV network look: black marble, gold trim and glowing monitor blue, polished floor reflections. Color anchors, approximate: black marble #181425, gold trim #feae34, monitor blue #2ce8f5, steel grey #5a6988.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**Zweite Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The applause sign switched off and dark.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

**Dritte Fassung mit Maske (Bild der vorigen Fassung anhängen oder im selben Chat bleiben):**

```text
Edit the attached image. Change only the area that this change touches; if your tool can select or mask an area, mark exactly that area.
CHANGE: The ratings bar dropped to the bottom and flashing red.
KEEP: everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
NEGATIVE: no new objects, no changed camera or framing, no style change, no text
```

## Zappmanns erste Kindersendung

**Shot W4-R14**

**Zustände:** Nur im Bild-in-Bild des Finales (Skizze oben)

**Rohbau:** [Zappmanns erste Kindersendung](../skizzen/welt-4/rohbau/kindersendung_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A shabby 1970s children's TV set, front view with gentle depth, faded washed-out film look with grain. Center: a small wooden puppet theater with a red curtain. Left: a cardboard sun on a stick and a felt rainbow pinned to the back wall. Right: a wooden stool. Worn studio floor in the lower third, kept clear. No text.
PALETTE: faded 1970s children's TV look: washed-out orange, brown and mustard yellow, flat studio light, slightly blurry like an old videotape. Color anchors, approximate: washed-out orange #d77643, brown #733e39, mustard #feae34, faded cream #ead4aa.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

## Kellerarchiv

**Shot W4-R15**

**Rohbau:** [Kellerarchiv](../skizzen/welt-4/rohbau/kellerarchiv_rohbau.png)

```text
STYLE: Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
SCENE: A dim basement corridor below a TV network building, front view with gentle depth. Center: a huge rusty trash compactor pit with heavy steel walls, filled with tangled video tapes and film reels, one black VHS tape with a pale label strip sticking out at the front, a small eye on a stalk peeking out from the tapes. Left: shelves of dusty tape boxes with blank labels. Right: a plain grey service door at the top of a few concrete steps, leading back up to the lobby. Flickering neon tube on the ceiling, black marble and gold trim fading into bare concrete.
PALETTE: glossy corporate TV network look: black marble, gold trim and glowing monitor blue, polished floor reflections. Color anchors, approximate: black marble #181425, gold trim #feae34, monitor blue #2ce8f5, steel grey #5a6988.
LAYOUT: Use the attached grey blockout only for layout, perspective, horizon height and the size of every object relative to the 1.75 m person; paint in the style of the reference image, do not copy the grey colours, do not paint any people or animals.
NEGATIVE: no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

# Figuren

Je Figur den Block in Gemini kopieren und anhängen, was beim Block steht. Gebraucht wird nur die
Seitenansicht nach rechts. Läufe entstehen aus einem Meshy-Clip mit Teile-Rig aus diesem Bild, Reden
über Mund und Kopf (`tools/figur.py`), Gesten über Posenbögen. Zweite Fassungen entstehen mit Maske
aus dem fertigen Bild.

## Gerd Glück

**Shot W4-F01**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Gerd Glück, a slick game show host about 106 percent of the boy Max's height, glossy black pompadour, huge white teeth in a frozen beaming smile. Shiny sequined purple jacket, black trousers, white shoes, a blank price tag dangling from his own left sleeve. A handheld microphone in his right hand. Neutral standing pose, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Trödel-Experte

**Shot W4-F02**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: An antiques appraiser about 104 percent of the boy Max's height, thin and clean-shaven, neat grey side parting, brown tweed jacket, red bow tie, holding a big magnifying glass up to one eye, appraising look, facing right. No large handlebar moustache, not a likeness of any real TV appraiser.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Flimmer

**Shot W4-F03**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Flimmer, a small round blob creature about 29 percent of the boy Max's height made of flickering grey TV static, two big bright white eyes, a small dark mouth line, a wobbly fuzzy outline, floating a little above the ground, friendly curious look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max auf dem Testbild

**Shot W4-F04**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: lying flat on his back on a dark floor, arms spread, dazed, looking up, side view, head to the left.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Sitcom-Vater

**Shot W4-F05**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A chubby sitcom dad about 104 percent of the boy Max's height, balding with a dark comb-over. Brown sweater vest over a white shirt, beige slacks, brown corduroy slippers. Hugging a white chicken-shaped ceramic cookie jar with a red comb like a baby. Suspicious look, facing right. Second pose: the same dad empty-handed, sitting slumped on a wooden crate, waiting. Not a likeness of any real sitcom actor.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Sitcom-Mutter

**Shot W4-F06**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A sitcom mom about 104 percent of the boy Max's height, big curly red hair, mint dress under a flowery peach apron, hands on her hips, knowing look, facing right. Not a likeness of any real sitcom actress.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Sitcom-Sohn

**Shot W4-F07**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A cheeky teenage sitcom son about as tall as the boy Max, blue baseball cap worn backwards, oversized yellow T-shirt, very baggy light jeans, smirking, hands in his pockets, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Kommissar

**Shot W4-F08**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: An old police inspector about 104 percent of the boy Max's height, bald head with a grey fringe, thick grey walrus moustache, squinting eyes. Crumpled beige raincoat over a brown suit with a narrow dark tie, an unlit chewed cigar in the corner of his mouth, a small notebook in his left hand, one finger of the right hand raised as if asking one more question, facing right. Not a likeness of any real actor.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Erzähler

**Shot W4-F09**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: An elderly gentle nature documentary narrator about 104 percent of the boy Max's height (standing size), white hair, round glasses, floppy khaki bush hat, safari shirt with many pockets, khaki shorts, knee socks. Crouching, a handheld microphone in one hand and a thick script with a coffee stain under his arm, whispering, facing right. Fictional, not a likeness of any real presenter. Second pose: the same narrator crouching with empty arms, looking for his script.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Löwe

**Shot W4-F10**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A dramatic male lion about 106 percent as long as the boy Max is tall, lying down, huge fluffy dark orange mane, no crown, chin on his crossed front paws, sulking eyes, facing right. Second pose: the same lion standing proudly on all fours, chest out, a small golden crown on his mane. Simple pixel cartoon style, not like any animated film lion.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Hyäne

**Shot W4-F11**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A shifty spotted hyena about 61 percent of the boy Max's height sitting bolt upright, perfectly straight serious face like a passport photo, lips pressed hard together to hold back a laugh, stiff ears, facing right. No crown visible.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Gepard

**Shot W4-F12**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A thin cheetah about 53 percent of the boy Max's height, a red sweatband on its head and a stopwatch on a cord around its neck, sitting and panting, facing right. Second pose: lying flat on its belly, tongue out, exhausted.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Geier

**Shot W4-F13**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A vain vulture about 53 percent of the boy Max's height perched on a branch, bald pink head shining with lotion, a small gold-colored lotion tube in one claw and a hand mirror in the other, admiring itself, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Nashorn

**Shot W4-F14**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A big grey rhinoceros about 106 percent as long as the boy Max is tall, asleep standing up, eyes closed, head drooping, a small brown bird sitting on its horn, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Flamingo

**Shot W4-F15**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A pink flamingo about 43 percent of the boy Max's height standing on one leg, head tilted, gossiping look, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zombie

**Shot W4-F16**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A dancing 1980s zombie about 104 percent of the boy Max's height, pale green skin, messy black hair, torn mustard-yellow suit with big shoulder pads, skinny brown tie, one arm raised in a disco pose, facing right. No red leather jacket.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zombie im Grab

**Shot W4-F17**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: The same zombie rising from a mound of earth, about 53 percent of the boy Max's height: only head with messy black hair, mustard-yellow shoulders and one raised pale green hand visible, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Geist

**Shot W4-F18**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A round white bedsheet ghost about 43 percent of the boy Max's height with two black eye holes, a frightened expression and a ragged hem, floating, facing right (dreimal verwenden).
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## FBI-Agent

**Shot W4-F19**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A paranoid government agent about 106 percent of the boy Max's height, ginger buzz cut, freckles, dark circles under his eyes. Long grey trench coat over a tan suit, loose tie. A flashlight in his right hand and a small beeping gadget with a green light in his left. Nervous sideways glance, facing right. Not a likeness of any real actor.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Super-Siegfried

**Shot W4-F20**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Super-Siegfried, a muscular sleepy hero about 114 percent of the boy Max's height, messy blond hair, half-closed eyes. A green onesie with an orange round pretzel emblem on the chest, an orange bath towel tied as a cape, fluffy socks. Floating a little above the ground, yawning, facing right. No diamond shield, no S shape, no red and blue.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Fledermann

**Shot W4-F21**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Fledermann, a rich old man about 104 percent of the boy Max's height, grey moustache, a monocle, a black top hat instead of a mask. A homemade costume of black umbrellas sewn together into a suit and cape, a blank cardboard sign hanging on a string around his neck. Standing upright, proud, facing right. Second pose: hanging upside down by his knees from a lamp post arm, cape and sign dangling, top hat held on with one hand. No pointed ears, no bat emblem, no mask.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Wonder-Wilma

**Shot W4-F22**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Wonder-Wilma, a middle-aged woman about 104 percent of the boy Max's height, big curly brown hair under a pink headband, pink gym leotard, purple leg warmers, white sneakers, swinging a glowing golden jump rope like a lasso, confident smile, facing right. No tiara, no star emblem, no eagle.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Dr. Werbepause

**Shot W4-F23**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Dr. Werbepause, a grinning villain about 106 percent of the boy Max's height, slicked-back black hair, thin moustache, a suit completely covered in colorful blank product stickers, a megaphone in his right hand and a blank cardboard sign in his left, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Fabrikarbeiter

**Shot W4-F24**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A comic book factory worker about 104 percent of the boy Max's height, round face, yellow hard hat, blue overalls, big yellow rubber gloves, waving cheerfully with his left hand, thick black outline and halftone dots, facing right. Second pose: both hands pulling a big red lever downward.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Empfangsdame

**Shot W4-F25**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A bored receptionist about 104 percent of the boy Max's height (standing size), high blond ponytail, headset, dark blazer, long pink fake nails, chewing gum with her mouth closed, sitting on an office chair, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Sicherheitsmann

**Shot W4-F26**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A large broad security guard about 114 percent of the boy Max's height, shaved head, black suit, earpiece with a curly wire, small round sunglasses, arms crossed, stone face, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Zappmann

**Shot W4-F27**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Intendant Zappmann, a flamboyant TV executive about 111 percent of the boy Max's height, slicked-back silver hair, tinted gold sunglasses, a big white smile. Glittering golden jacket over a black shirt, black trousers, gold shoes, a gleaming golden TV remote with jewel buttons in a hip holster. Arms spread like a showman, facing right. Second pose: sitting relaxed on a golden sofa, one arm along the backrest, legs crossed.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Junger Zappmann

**Shot W4-F28**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: Young Zappmann in 1977, a shy young man about as tall as the boy Max, brown bowl haircut, knitted orange sweater, brown flared trousers, a felt hand puppet of a smiling sun on his right arm, nervous smile, faded washed-out colors, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Wettkandidat

**Shot W4-F29**

**Anhängen:** Max' Konzeptblatt als Stil- und Größenvorlage

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
SUBJECT: A nervous game show contestant about as tall as the boy Max, neat side parting, green sweater vest, blindfolded with a white cloth, holding a red crayon to the tip of his tongue and a box of crayons in the other hand, concentrating, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

## Max als Käsemann

**Shot W4-F30**

**Anhängen:** Max' Figurenbogen (sonst sein Konzeptblatt)

```text
STYLE: Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. This is the boy Max himself: keep him exactly as on the attached sheet.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
SUBJECT: a white bedsheet tied as a cape around his neck, a yellow cheese-colored eye mask with round holes, both fists on his hips, chest out, about as tall as the boy Max, facing right.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

# Posenbögen

Je Bogen das angegebene Blatt anhängen (das fertige Konzeptbild der Figur aus Gemini, bei Max sein
Figurenbogen) und den Block kopieren. Einzelne misslungene Posen mit Maske nachbessern, nicht neu
erzeugen. Zwischenbilder baut Claude in Aseprite; Timing und Beine kommen aus dem 3D-Clip.

## Max Fernbedienung

**Shot W4-P01**

**Anhängen:** Max' Figurenblatt · **Posen:** 4 · **Wofür:** Umschalten, Suchlauf, Autoplay

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
POSES (left to right): Four poses of the boy Max, feet planted: (1) holding a cheap white TV remote out in front of him at arm's length, thumb pressing a button, one eye squinted; (2) shaking the remote next to his ear, annoyed; (3) frozen stiff mid-step, arms slightly out, eyes glazed and staring straight ahead; (4) holding the remote up high above his head, sweeping it slowly sideways, searching.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max Lichtröhre

**Shot W4-P02**

**Anhängen:** Max' Figurenblatt · **Posen:** 3 · **Wofür:** Röhre schwingen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
POSES (left to right): Three poses of the boy Max: (1) holding a long pale blue glowing fluorescent tube with both hands like a sword, raised over his shoulder; (2) mid-swing, the tube sweeping low in front of him, leaning into it; (3) the tube nearly slipping out of his hands, wobbling, alarmed face.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Max Fabrik

**Shot W4-P03**

**Anhängen:** Max' Figurenblatt · **Posen:** 4 · **Wofür:** Drei falsche Bilder, Herausklettern

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: Max exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
POSES (left to right): Four poses of the boy Max with a white bedsheet tied as a cape: (1) bouncing off a vat lid, airborne, arms and legs splayed; (2) hanging upside down by one ankle from a catwalk, cape dangling, arms crossed in annoyance; (3) standing stiff, wrapped tightly in clear plastic foil with a blank price label on his chest; (4) climbing out over the rim of a vat, dripping with yellow cheese, a yellow eye mask on his face.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Käsemann

**Shot W4-P04**

**Anhängen:** Konzeptblatt Max als Käsemann · **Posen:** 4 · **Wofür:** Pose, voran, Umhang ab

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): a white bedsheet tied as a cape around his neck, a yellow cheese-colored eye mask with round holes, both fists on his hips, chest out, about as tall as the boy Max, facing right.
POSES (left to right): Four poses of the boy in the bedsheet cape and cheese-colored eye mask: (1) both fists on his hips, chest out, cape fluttering; (2) one arm stretched forward pointing, heroic stride; (3) untying the cape at his neck with both hands, sheepish; (4) pulling the eye mask up onto his forehead, normal face again.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel Welt 4

**Shot W4-P05**

**Anhängen:** Pixels Figurenblatt · **Posen:** 4 · **Wofür:** Kerzengerade, Drehbuch, Hoodie, Schulter

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
POSES (left to right): Four poses of the tomcat: (1) sitting bolt upright, perfectly straight, eyes wide, tail wrapped around his paws; (2) holding a thick stapled script in his teeth, sneaking away low; (3) biting into the hem of a slate blue hoodie and pulling backwards with all four paws braced; (4) sitting on a shoulder-high perch, copying a hero pose with his chest puffed out.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gerd Glück

**Shot W4-P06**

**Anhängen:** Konzeptblatt Gerd Glück · **Posen:** 4 · **Wofür:** Reden, Rad, Blisterpackung

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gerd Glück, a slick game show host about 106 percent of the boy Max's height, glossy black pompadour, huge white teeth in a frozen beaming smile. Shiny sequined purple jacket, black trousers, white shoes, a blank price tag dangling from his own left sleeve. A handheld microphone in his right hand. Neutral standing pose, facing right.
POSES (left to right): Four poses of the game show host: (1) talking into the microphone, other arm spread wide; (2) gripping the edge of a big wheel at shoulder height, about to spin it with a flourish; (3) holding a blister pack up into the light with both hands, beaming; (4) idle: tugging at the price tag on his sleeve, frozen grin.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gerd Glück 2

**Shot W4-P07**

**Anhängen:** Konzeptblatt Gerd Glück · **Posen:** 4 · **Wofür:** Winken, eingefrorenes Lächeln, Eigenwerbung

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Gerd Glück, a slick game show host about 106 percent of the boy Max's height, glossy black pompadour, huge white teeth in a frozen beaming smile. Shiny sequined purple jacket, black trousers, white shoes, a blank price tag dangling from his own left sleeve. A handheld microphone in his right hand. Neutral standing pose, facing right.
POSES (left to right): Four poses of the game show host: (1) waving goodbye with the microphone hand; (2) frozen stiff, smile fixed, one eye twitching; (3) pointing at himself with his thumb, winking; (4) presenting the prize platform with an open palm, bowing slightly.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Trödel-Experte

**Shot W4-P08**

**Anhängen:** Konzeptblatt Trödel-Experte · **Posen:** 2 · **Wofür:** Schätzen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An antiques appraiser about 104 percent of the boy Max's height, thin and clean-shaven, neat grey side parting, brown tweed jacket, red bow tie, holding a big magnifying glass up to one eye, appraising look, facing right. No large handlebar moustache, not a likeness of any real TV appraiser.
POSES (left to right): Two poses of the antiques appraiser: (1) bending forward, magnifying glass close to something at knee height; (2) straightening up, shaking his head with a pitying smile.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Sitcom-Vater

**Shot W4-P09**

**Anhängen:** Konzeptblatt Sitcom-Vater · **Posen:** 4 · **Wofür:** Reden, Dose, Aufspringen, Wurf

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A chubby sitcom dad about 104 percent of the boy Max's height, balding with a dark comb-over. Brown sweater vest over a white shirt, beige slacks, brown corduroy slippers. Hugging a white chicken-shaped ceramic cookie jar with a red comb like a baby. Suspicious look, facing right. Second pose: the same dad empty-handed, sitting slumped on a wooden crate, waiting. Not a likeness of any real sitcom actor.
POSES (left to right): Four poses of the sitcom dad: (1) talking, clutching the chicken cookie jar tighter, suspicious; (2) jumping up in shock, knees bent, jar held high; (3) both arms thrown up in the air, hands open, the jar gone; (4) idle: patting the cookie jar like a baby.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Sitcom-Vater 2

**Shot W4-P10**

**Anhängen:** Konzeptblatt Sitcom-Vater · **Posen:** 3 · **Wofür:** Durch die Tür, Umsehen, Hinsetzen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A chubby sitcom dad about 104 percent of the boy Max's height, balding with a dark comb-over. Brown sweater vest over a white shirt, beige slacks, brown corduroy slippers. Hugging a white chicken-shaped ceramic cookie jar with a red comb like a baby. Suspicious look, facing right. Second pose: the same dad empty-handed, sitting slumped on a wooden crate, waiting. Not a likeness of any real sitcom actor.
POSES (left to right): Three poses of the sitcom dad without the jar: (1) bursting forward through a doorway, arms spread, beaming; (2) looking around, confused, one hand scratching his comb-over; (3) lowering himself onto a wooden crate with a sigh.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Sitcom-Mutter

**Shot W4-P11**

**Anhängen:** Konzeptblatt Sitcom-Mutter · **Posen:** 3 · **Wofür:** Reden, Augen verdrehen, Lachen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A sitcom mom about 104 percent of the boy Max's height, big curly red hair, mint dress under a flowery peach apron, hands on her hips, knowing look, facing right. Not a likeness of any real sitcom actress.
POSES (left to right): Three poses of the sitcom mom: (1) talking, hands on her hips, one eyebrow raised; (2) rolling her eyes, one hand flicked out; (3) laughing with her head back, one hand on her chest.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Sitcom-Sohn

**Shot W4-P12**

**Anhängen:** Konzeptblatt Sitcom-Sohn · **Posen:** 3 · **Wofür:** Zeigen, Grinsen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A cheeky teenage sitcom son about as tall as the boy Max, blue baseball cap worn backwards, oversized yellow T-shirt, very baggy light jeans, smirking, hands in his pockets, facing right.
POSES (left to right): Three poses of the sitcom son: (1) pointing straight at the viewer, grinning; (2) arms crossed, smug smirk; (3) shrugging, palms up.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Kommissar

**Shot W4-P13**

**Anhängen:** Konzeptblatt Kommissar · **Posen:** 4 · **Wofür:** Reden, Seufzen, Umsehen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An old police inspector about 104 percent of the boy Max's height, bald head with a grey fringe, thick grey walrus moustache, squinting eyes. Crumpled beige raincoat over a brown suit with a narrow dark tie, an unlit chewed cigar in the corner of his mouth, a small notebook in his left hand, one finger of the right hand raised as if asking one more question, facing right. Not a likeness of any real actor.
POSES (left to right): Four poses of the old inspector: (1) talking, one finger raised, notebook in the other hand; (2) sighing, shoulders dropped, chewing the cigar; (3) looking around over his shoulder, puzzled, cigar in his fingers; (4) idle: writing in the small notebook.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Kommissar 2

**Shot W4-P14**

**Anhängen:** Konzeptblatt Kommissar · **Posen:** 3 · **Wofür:** Notizbuch zu, Taste geben, Abführen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An old police inspector about 104 percent of the boy Max's height, bald head with a grey fringe, thick grey walrus moustache, squinting eyes. Crumpled beige raincoat over a brown suit with a narrow dark tie, an unlit chewed cigar in the corner of his mouth, a small notebook in his left hand, one finger of the right hand raised as if asking one more question, facing right. Not a likeness of any real actor.
POSES (left to right): Three poses of the old inspector: (1) snapping the notebook shut with one hand; (2) holding out a small round button between two fingers; (3) one hand reaching down low as if holding an animal by the scruff, walking.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; poses that use the other leg are never copies.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Erzähler

**Shot W4-P15**

**Anhängen:** Konzeptblatt Erzähler · **Posen:** 3 · **Wofür:** Flüstern, Drehbuch suchen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): An elderly gentle nature documentary narrator about 104 percent of the boy Max's height (standing size), white hair, round glasses, floppy khaki bush hat, safari shirt with many pockets, khaki shorts, knee socks. Crouching, a handheld microphone in one hand and a thick script with a coffee stain under his arm, whispering, facing right. Fictional, not a likeness of any real presenter. Second pose: the same narrator crouching with empty arms, looking for his script.
POSES (left to right): Three poses of the crouching narrator: (1) whispering into the microphone, one hand cupped beside his mouth; (2) patting his empty armpit, alarmed, looking down; (3) hugging the script again, relieved.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## FBI-Agent

**Shot W4-P16**

**Anhängen:** Konzeptblatt FBI-Agent · **Posen:** 4 · **Wofür:** Gerät, Lesen, Taste, Brille

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A paranoid government agent about 106 percent of the boy Max's height, ginger buzz cut, freckles, dark circles under his eyes. Long grey trench coat over a tan suit, loose tie. A flashlight in his right hand and a small beeping gadget with a green light in his left. Nervous sideways glance, facing right. Not a likeness of any real actor.
POSES (left to right): Four poses of the paranoid agent: (1) pointing the beeping gadget straight at the viewer, arm stretched; (2) reading a notebook held close, the flashlight in his trembling hand; (3) holding out a small round button, looking away; (4) putting on dark sunglasses with both hands, suddenly calm.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Super-Siegfried

**Shot W4-P17**

**Anhängen:** Konzeptblatt Super-Siegfried · **Posen:** 3 · **Wofür:** Gähnen, Salutieren

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Super-Siegfried, a muscular sleepy hero about 114 percent of the boy Max's height, messy blond hair, half-closed eyes. A green onesie with an orange round pretzel emblem on the chest, an orange bath towel tied as a cape, fluffy socks. Floating a little above the ground, yawning, facing right. No diamond shield, no S shape, no red and blue.
POSES (left to right): Three poses of the floating sleepy hero: (1) yawning wide, both arms stretched up; (2) saluting lazily, eyes half shut; (3) drifting backwards, arms crossed, nodding off.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Fledermann

**Shot W4-P18**

**Anhängen:** Konzeptblatt Fledermann · **Posen:** 3 · **Wofür:** Reden, Laken werfen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Fledermann, a rich old man about 104 percent of the boy Max's height, grey moustache, a monocle, a black top hat instead of a mask. A homemade costume of black umbrellas sewn together into a suit and cape, a blank cardboard sign hanging on a string around his neck. Standing upright, proud, facing right. Second pose: hanging upside down by his knees from a lamp post arm, cape and sign dangling, top hat held on with one hand. No pointed ears, no bat emblem, no mask.
POSES (left to right): Three poses of the old man in the umbrella costume, hanging upside down by his knees: (1) talking, one finger raised, monocle glinting; (2) throwing a folded white bedsheet downward with one hand; (3) idle: arms crossed, swaying.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wonder-Wilma

**Shot W4-P19**

**Anhängen:** Konzeptblatt Wonder-Wilma · **Posen:** 4 · **Wofür:** Seil schwingen, werfen, zeigen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Wonder-Wilma, a middle-aged woman about 104 percent of the boy Max's height, big curly brown hair under a pink headband, pink gym leotard, purple leg warmers, white sneakers, swinging a glowing golden jump rope like a lasso, confident smile, facing right. No tiara, no star emblem, no eagle.
POSES (left to right): Four poses of the woman in the gym leotard: (1) swinging the glowing golden jump rope in a loop above her head; (2) throwing the rope forward like a lasso, arm fully extended; (3) pointing up and to the side at something above a person's head; (4) idle: jogging on the spot.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; poses that use the other leg are never copies.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Dr. Werbepause

**Shot W4-P20**

**Anhängen:** Konzeptblatt Dr. Werbepause · **Posen:** 4 · **Wofür:** Reden, Handy, Sprung

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Dr. Werbepause, a grinning villain about 106 percent of the boy Max's height, slicked-back black hair, thin moustache, a suit completely covered in colorful blank product stickers, a megaphone in his right hand and a blank cardboard sign in his left, facing right.
POSES (left to right): Four poses of the sticker-suited villain: (1) talking into the megaphone, sign raised; (2) snatching a phone with one hand, grinning; (3) leaping forward off a podium, arms spread; (4) idle: polishing a sticker on his sleeve.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Dr. Werbepause 2

**Shot W4-P21**

**Anhängen:** Konzeptblatt Dr. Werbepause · **Posen:** 4 · **Wofür:** Ausrutschen, Gestank, Amboss

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Dr. Werbepause, a grinning villain about 106 percent of the boy Max's height, slicked-back black hair, thin moustache, a suit completely covered in colorful blank product stickers, a megaphone in his right hand and a blank cardboard sign in his left, facing right.
POSES (left to right): Four poses of the sticker-suited villain: (1) both legs shooting forward on a banana peel, arms flung up; (2) lying flat on his back, dazed, stickers fluttering; (3) holding his nose with one hand, running, knees high; (4) squashed flat and dizzy, stars over his head.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Fabrikarbeiter

**Shot W4-P22**

**Anhängen:** Konzeptblatt Fabrikarbeiter · **Posen:** 2 · **Wofür:** Zwischenbilder Hebel

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A comic book factory worker about 104 percent of the boy Max's height, round face, yellow hard hat, blue overalls, big yellow rubber gloves, waving cheerfully with his left hand, thick black outline and halftone dots, facing right. Second pose: both hands pulling a big red lever downward.
POSES (left to right): Two poses of the factory worker: (1) both hands on a red lever at chest height, starting to pull; (2) the lever halfway down, leaning back, cheeks puffed.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Empfangsdame

**Shot W4-P23**

**Anhängen:** Konzeptblatt Empfangsdame · **Posen:** 3 · **Wofür:** Kaugummi, Nägel

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A bored receptionist about 104 percent of the boy Max's height (standing size), high blond ponytail, headset, dark blazer, long pink fake nails, chewing gum with her mouth closed, sitting on an office chair, facing right.
POSES (left to right): Three poses of the seated receptionist: (1) blowing a big pink gum bubble; (2) the bubble burst over her nose, unimpressed; (3) tapping long pink nails on a desk, looking at the nails.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Sicherheitsmann

**Shot W4-P24**

**Anhängen:** Konzeptblatt Sicherheitsmann · **Posen:** 2 · **Wofür:** Schritt vor den Aufzug

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A large broad security guard about 114 percent of the boy Max's height, shaved head, black suit, earpiece with a curly wire, small round sunglasses, arms crossed, stone face, facing right.
POSES (left to right): Two poses of the security guard: (1) mid-step to the side, arms still crossed; (2) planted wide, one hand raised flat in a stop gesture.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zappmann

**Shot W4-P25**

**Anhängen:** Konzeptblatt Zappmann · **Posen:** 4 · **Wofür:** Reden, Sofa, Publikum, Monitorwand

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Intendant Zappmann, a flamboyant TV executive about 111 percent of the boy Max's height, slicked-back silver hair, tinted gold sunglasses, a big white smile. Glittering golden jacket over a black shirt, black trousers, gold shoes, a gleaming golden TV remote with jewel buttons in a hip holster. Arms spread like a showman, facing right. Second pose: sitting relaxed on a golden sofa, one arm along the backrest, legs crossed.
POSES (left to right): Four poses of the TV executive: (1) talking, arms spread like a showman; (2) patting the seat of a sofa beside him with one hand, inviting smile; (3) turned half to the audience, one hand raised, talking; (4) pointing proudly over his shoulder at a wall behind him.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zappmann 2

**Shot W4-P26**

**Anhängen:** Konzeptblatt Zappmann · **Posen:** 4 · **Wofür:** Starren, halb aufstehen, Gesicht in den Händen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Intendant Zappmann, a flamboyant TV executive about 111 percent of the boy Max's height, slicked-back silver hair, tinted gold sunglasses, a big white smile. Glittering golden jacket over a black shirt, black trousers, gold shoes, a gleaming golden TV remote with jewel buttons in a hip holster. Arms spread like a showman, facing right. Second pose: sitting relaxed on a golden sofa, one arm along the backrest, legs crossed.
POSES (left to right): Four poses of the TV executive on a sofa: (1) sitting, staring forward, mouth open, sunglasses slipped down; (2) half standing up from the sofa, hands on the armrests, angry; (3) sitting slumped, face buried in both hands; (4) idle: sitting relaxed, one arm along the backrest.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zappmann 3

**Shot W4-P27**

**Anhängen:** Konzeptblatt Zappmann · **Posen:** 2 · **Wofür:** Fernbedienung übergeben, aufstehen

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Intendant Zappmann, a flamboyant TV executive about 111 percent of the boy Max's height, slicked-back silver hair, tinted gold sunglasses, a big white smile. Glittering golden jacket over a black shirt, black trousers, gold shoes, a gleaming golden TV remote with jewel buttons in a hip holster. Arms spread like a showman, facing right. Second pose: sitting relaxed on a golden sofa, one arm along the backrest, legs crossed.
POSES (left to right): Two poses of the TV executive: (1) sitting, drawing the golden remote from his hip holster and holding it out with a defeated look; (2) standing up slowly, shoulders down, hands empty.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Junger Zappmann

**Shot W4-P28**

**Anhängen:** Konzeptblatt Junger Zappmann · **Posen:** 2 · **Wofür:** Puppenspiel

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Young Zappmann in 1977, a shy young man about as tall as the boy Max, brown bowl haircut, knitted orange sweater, brown flared trousers, a felt hand puppet of a smiling sun on his right arm, nervous smile, faded washed-out colors, facing right.
POSES (left to right): Two poses of the shy young man with the sun hand puppet: (1) the puppet raised, mouth open, he smiles shyly behind it; (2) the puppet bowing, he looks at it lovingly.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Wettkandidat

**Shot W4-P29**

**Anhängen:** Konzeptblatt Wettkandidat · **Posen:** 2 · **Wofür:** Buntstift raten

```text
STYLE: Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A nervous game show contestant about as tall as the boy Max, neat side parting, green sweater vest, blindfolded with a white cloth, holding a red crayon to the tip of his tongue and a box of crayons in the other hand, concentrating, facing right.
POSES (left to right): Two poses of the blindfolded contestant: (1) licking the tip of a red crayon, concentrating; (2) raising the crayon triumphantly, mouth open as if naming the color.
END POSE: the motion starts and ends in the neutral pose of the attached sheet; do not draw that pose again, but every pose must be able to return to it with the feet in the same place unless a pose says the feet move.
CAMERA: static, strict side view as on the attached sheet, same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

# Bewegungen

Schlüsselposen für Animationen, die im Spiel noch fehlen. Das Blatt anhängen, das beim Block steht.
Die Zeitmarken gelten für etwa 10 Bilder pro Sekunde; Zwischenbilder, Timing und Schleife baut Claude
in Aseprite oder aus dem 3D-Clip. Eine misslungene Pose wird mit Maske nachgebessert.

## Flimmer: Flackern

**Shot W4-B01**

**Anhängen:** das fertige Konzeptblatt von Flimmer · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Flimmer, a small round blob creature about 29 percent of the boy Max's height made of flickering grey TV static, two big bright white eyes, a small dark mouth line, a wobbly fuzzy outline, floating a little above the ground, friendly curious look, facing right.
START: From the neutral pose on the attached concept sheet of Flimmer. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the static blob flickers, its static texture shifting and its fuzzy outline wobbling; (2) 0.2 s: eyes blinking once.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: stays in place.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Flimmer: Aus dem Rauschen ploppen

**Shot W4-B02**

**Anhängen:** das fertige Konzeptblatt von Flimmer · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Flimmer, a small round blob creature about 29 percent of the boy Max's height made of flickering grey TV static, two big bright white eyes, a small dark mouth line, a wobbly fuzzy outline, floating a little above the ground, friendly curious look, facing right.
START: From the neutral pose on the attached concept sheet of Flimmer. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: a small grey static smudge swells out of nowhere; (2) 0.3 s: pops into the round blob shape with a little bounce; (3) 0.6 s: the white eyes open last.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Flimmer: Kichern

**Shot W4-B03**

**Anhängen:** das fertige Konzeptblatt von Flimmer · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Flimmer, a small round blob creature about 29 percent of the boy Max's height made of flickering grey TV static, two big bright white eyes, a small dark mouth line, a wobbly fuzzy outline, floating a little above the ground, friendly curious look, facing right.
START: From the neutral pose on the attached concept sheet of Flimmer. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the static blob squashes and stretches as if giggling, eyes squeezed into happy arcs; (2) 0.2 s: a few white static sparks jump off.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Gepard: Sprinten und umfallen

**Shot W4-B04**

**Anhängen:** das fertige Konzeptblatt von Gepard · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A thin cheetah about 53 percent of the boy Max's height, a red sweatband on its head and a stopwatch on a cord around its neck, sitting and panting, facing right. Second pose: lying flat on its belly, tongue out, exhausted.
START: From the neutral pose on the attached concept sheet of Gepard. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the cheetah crouches; (2) 0.4 s: dashes to the right in a blur with speed lines; (3) 0.8 s: flops onto its belly, tongue out, exhausted.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 8 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Hyäne: Lachen, Krone fällt

**Shot W4-B05**

**Anhängen:** das fertige Konzeptblatt von Hyäne · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A shifty spotted hyena about 61 percent of the boy Max's height sitting bolt upright, perfectly straight serious face like a passport photo, lips pressed hard together to hold back a laugh, stiff ears, facing right. No crown visible.
START: From the neutral pose on the attached concept sheet of Hyäne. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the serious hyena's lips tremble; (2) 0.3 s: it presses both front paws over its muzzle; (3) 0.5 s: bursts out laughing, rolls onto its back kicking its legs; (4) 0.8 s: and a small golden crown falls out of its fur and rolls forward.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 8 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Hyäne: Lachend abgeführt

**Shot W4-B06**

**Anhängen:** das fertige Konzeptblatt von Hyäne · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A shifty spotted hyena about 61 percent of the boy Max's height sitting bolt upright, perfectly straight serious face like a passport photo, lips pressed hard together to hold back a laugh, stiff ears, facing right. No crown visible.
START: From the neutral pose on the attached concept sheet of Hyäne. Keep the clean concept-art style of that sheet, not pixel art.
MANNER (applies to every frame): the hyena walks on all fours, shoulders shaking with laughter, mouth wide open, tears in its eyes.
FRAMES: exactly 8 frames side by side, left to right, one complete cycle of about 0.8 s at 10 frames per second: (1) near front leg and far hind leg reaching forward and just touching the ground; near hind leg and far front leg stretched back on their toes; body level; (2) near front and far hind legs carrying the weight, body at its lowest; near hind and far front paws lifted just off the ground; (3) near front and far hind legs straight under the body; near hind and far front legs bent and swinging forward past them; body high; (4) near front and far hind legs pushing off behind; near hind and far front legs reaching forward; body at its highest; (5) far front leg and near hind leg reaching forward and just touching the ground; far hind leg and near front leg stretched back on their toes; body level; (6) far front and near hind legs carrying the weight, body at its lowest; the other two paws lifted; (7) far front and near hind legs straight under the body; near front and far hind legs swinging forward past them; body high; (8) far front and near hind legs pushing off behind; near front and far hind legs reaching forward; leads back into frame 1.
LEGS: 'near' means the leg or arm closer to the viewer, 'far' the one on the other side of the body. Draw the far legs and the far arm one shade darker and partly behind the body, so the two sides can never be confused. Every frame must differ visibly from its neighbours; frames 5 to 8 repeat frames 1 to 4 with the sides swapped, they are never copies of them.
SPACING: divide the image into 8 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: frame 8 leads straight back into frame 1, so the loop closes seamlessly; do not draw frame 1 twice.
HOLD STILL: in place.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

**Zweiter Durchgang**, wenn die Bilder 5 bis 8 nur Kopien von 1 bis 4 sind (Toadi, Minka, 15. November 2026): das erzeugte Bild anhängen und nur die hintere Hälfte neu zeichnen lassen.

```text
FIX: The attached sheet shows one walking cycle in 8 frames, but frames 5 to 8 are copies of frames 1 to 4 with the same legs in front. Keep frames 1 to 4 exactly as they are, pixel for pixel. Redraw only frames 5 to 8: each one is the frame four places earlier with the legs on the two sides swapped. Wherever a near leg (lighter, in front of the body) was reaching forward in frame 1, the far leg (one shade darker, partly behind the body) reaches forward in frame 5, and the near leg is the one stretched back; the same for frames 6, 7 and 8. Arms or front legs swap the same way. Body, head, tail, clothes and props stay exactly as in frames 1 to 4.
CHECK: compare frame 1 and frame 5: the darker leg must be in front in one and behind in the other. If they look the same, the frame is wrong.
SPACING: the same 8 equal columns with clear magenta gaps as in the attached sheet, nothing overlaps the next frame.
NEGATIVE: no new poses for frames 1 to 4, no change of style, size, colors or baseline, no pixel art, no checkerboard, no text
```

## Löwe: Schmollen

**Shot W4-B07**

**Anhängen:** das fertige Konzeptblatt von Löwe · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A dramatic male lion about 106 percent as long as the boy Max is tall, lying down, huge fluffy dark orange mane, no crown, chin on his crossed front paws, sulking eyes, facing right. Second pose: the same lion standing proudly on all fours, chest out, a small golden crown on his mane. Simple pixel cartoon style, not like any animated film lion.
START: From the neutral pose on the attached concept sheet of Löwe. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the lying lion huffs through his nose; (2) 0.2 s: his tail tip flicks up and down, one ear twitches.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Löwe: Sprung und Krone

**Shot W4-B08**

**Anhängen:** das fertige Konzeptblatt von Löwe · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A dramatic male lion about 106 percent as long as the boy Max is tall, lying down, huge fluffy dark orange mane, no crown, chin on his crossed front paws, sulking eyes, facing right. Second pose: the same lion standing proudly on all fours, chest out, a small golden crown on his mane. Simple pixel cartoon style, not like any animated film lion.
START: From the neutral pose on the attached concept sheet of Löwe. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (4 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the lion leaps down from a rock; (2) 0.3 s: lands; (3) 0.5 s: picks up a small golden crown with his mouth; (4) 0.8 s: tosses it onto his mane and stands proudly, ending in the standing pose with crown.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 8 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: pose 4 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Geier: Eincremen

**Shot W4-B09**

**Anhängen:** das fertige Konzeptblatt von Geier · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A vain vulture about 53 percent of the boy Max's height perched on a branch, bald pink head shining with lotion, a small gold-colored lotion tube in one claw and a hand mirror in the other, admiring itself, facing right.
START: From the neutral pose on the attached concept sheet of Geier. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the vulture rubs lotion on its bald head with one wing tip, looks into the hand mirror; (2) 0.2 s: the head shines brighter.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: stays on the branch.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Nashorn: Schnarchen

**Shot W4-B10**

**Anhängen:** das fertige Konzeptblatt von Nashorn · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A big grey rhinoceros about 106 percent as long as the boy Max is tall, asleep standing up, eyes closed, head drooping, a small brown bird sitting on its horn, facing right.
START: From the neutral pose on the attached concept sheet of Nashorn. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the sleeping rhino breathes slowly, its belly rising and falling; (2) 0.2 s: the small bird on its horn turns its head toward the viewer and back.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Flamingo: Tuscheln

**Shot W4-B11**

**Anhängen:** das fertige Konzeptblatt von Flamingo · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): A pink flamingo about 43 percent of the boy Max's height standing on one leg, head tilted, gossiping look, facing right.
START: From the neutral pose on the attached concept sheet of Flamingo. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the flamingo bends its neck toward its neighbor as if whispering; (2) 0.2 s: straightens up again.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Zombies: Aufstehen aus dem Grab

**Shot W4-B12**

**Anhängen:** das fertige Konzeptblatt von Zombies · **Bilder:** 8 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
START: From the neutral pose on the attached concept sheet of Zombie im Grab. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (3 key poses of a 8-frame animation of about 0.8 s): (1) 0.0 s: the zombie pushes up out of its grave mound; (2) 0.4 s: climbs out; (3) 0.8 s: stands and brushes dirt off its shoulder pads, ending in the standing zombie sprite.
FRAMES: draw all 8 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 8 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: pose 3 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Geister: Vorbeischweben

**Shot W4-B13**

**Anhängen:** das fertige Konzeptblatt von Geister · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
START: From the neutral pose on the attached concept sheet of Geist. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: the bedsheet ghost floats, its ragged hem rippling; (2) 0.2 s: the sheet bulging gently.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
HOLD STILL: in place.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Geister: Erschrecken und fliehen

**Shot W4-B14**

**Anhängen:** das fertige Konzeptblatt von Geister · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the character exactly as on the attached character sheet: same face, head size, proportions, costume and colors, nothing redesigned.
START: From the neutral pose on the attached concept sheet of Geist. Keep the clean concept-art style of that sheet, not pixel art.
ACTION (2 key poses of a 6-frame animation of about 0.6 s): (1) 0.0 s: the bedsheet ghost startles with its sheet puffing up; (2) 0.6 s: turns and flees in panic, sheet flapping, getting faster.
FRAMES: draw all 6 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: pose 2 is the final frame and is held; it must read as a calm, complete pose.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Pixel: Sternchen nach dem Amboss

**Shot W4-B15**

**Anhängen:** Pixels Figurenbogen (bis dahin sein Konzeptblatt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
SUBJECT: the tomcat exactly as on the attached character sheet, unchanged.
CHARACTER LOCK (word for word; where SUBJECT or POSES say otherwise, they win): The tomcat, a chubby round cat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
ACTION (2 key poses of a 4-frame animation of about 0.4 s): (1) 0.0 s: From the tomcat's reference sheet: the tomcat sits dazed and wobbles in a small circle, eyes spinning; (2) 0.2 s: three small yellow comic stars circling above his head.
FRAMES: draw all 4 frames side by side, left to right, in the order they play: the key poses above at their times and evenly spaced in-between frames, so the motion reads smoothly; every frame differs visibly from its neighbours, no two frames identical.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END POSE: the same as pose 1, so the loop closes seamlessly; do not draw it twice.
CAMERA: static, strict side view, facing right. Same scale and the same flat baseline in every pose, no zoom, no pan.
NEGATIVE: no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark, no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

## Glücksrad: Rad dreht

**Shot W4-B16**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Glücksrad); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 8 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the upright prize wheel with twelve colored segments, matching the attached background crop: the wheel turns one segment per frame, the pointer on top flicks at each peg.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 8 frames side by side, about 0.8 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 140x170 pixels in the game.
SPACING: divide the image into 8 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Glücksrad-Studio: Preis-Podest dreht

**Shot W4-B17**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Glücksrad-Studio); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the prize platform with two toasters, a model cruise ship and a tube in a blister pack, matching the attached background crop: the round platform turns, the prizes slide past and glint.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 100x110 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Sitcom-Küche: Fondue-Topf blubbert

**Shot W4-B18**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Sitcom-Küche); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the fondue pot on its burner, matching the attached background crop: yellow cheese bubbles rise and pop, a thin wisp of steam.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 40x36 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Sitcom-Küche: Lachkonserve wackelt

**Shot W4-B19**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Sitcom-Küche); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the laugh track machine, matching the attached background crop: the big red button presses down, the machine shakes, two small speaker grilles bulge.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, plays once, each frame 48x40 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Sitcom-Küche: Keksdose zerspringt

**Shot W4-B20**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A white chicken-shaped ceramic cookie jar falls from above, hits the floor and shatters, round cookies scatter and one round grey rubber remote button rolls out to the front and stops.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 120x90 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: ends on the shards image.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Savanne: Regenwolke über dem Schlagzeug

**Shot W4-B21**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Savanne); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the small grey rain cloud and the drum kit below it, matching the attached background crop: rain streaks fall only on the drums, tiny splashes jump off the cymbals.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 70x90 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Savanne: Krabbelkiste

**Shot W4-B22**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Savanne); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the wooden crate of creepy crawlies, matching the attached background crop: small beetles and worms wriggle over the rim and back in.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 60x40 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Musikvideo-Friedhof: Leuchtfliesen

**Shot W4-B23**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Musikvideo-Friedhof); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the four by three square of glowing dance-floor tiles, matching the attached background crop: the tile colors change in a checker pattern on every beat, pink, green, purple, yellow.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 200x60 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Musikvideo-Friedhof: Discokugel

**Shot W4-B24**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Musikvideo-Friedhof); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the mirrored disco ball on its branch, matching the attached background crop: it turns, white light specks wander across its facets.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 30x30 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Musikvideo-Friedhof: Hände winken

**Shot W4-B25**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Musikvideo-Friedhof); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only one pale green zombie hand sticking out of a mound of earth, matching the attached background crop: the hand waves to the beat, fingers wiggling.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 24x30 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Musikvideo-Friedhof: Tor schwingt auf

**Shot W4-B26**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Musikvideo-Friedhof); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the rusty iron gate at the center back, matching the attached background crop: both wings swing open toward the viewer, a little rust dust falls.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 80x80 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: ends on the open gate.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Spukhaus, Keller: Röhrenfernseher

**Shot W4-B27**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Spukhaus, Keller); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the old tube TV on its crate, matching the attached background crop: grey static rolls on the screen, a faint bright line runs down.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 40x34 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Spukhaus, Keller: Ketten fallen

**Shot W4-B28**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Spukhaus, Keller); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the door in the left side wall at the top of the steps, matching the attached background crop: the iron chains loosen, slide down and fall onto the steps in a heap.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 60x110 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Kapitolis: Amboss fällt

**Shot W4-B29**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A heavy black anvil falls straight down from above the top edge, lands with a crater crack and a jagged empty comic impact burst, dust puffs out to both sides.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x200 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Fondue-Fabrik: Käse blubbert

**Shot W4-B30**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Fondue-Fabrik); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the three vats of melted cheese, matching the attached background crop: thick yellow bubbles rise and pop, the surface slowly swirls.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 200x80 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Fondue-Fabrik: Laufband

**Shot W4-B31**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Fondue-Fabrik); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the conveyor belt with cheese blocks, matching the attached background crop: the belt moves one block-step to the right, the rollers turn.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 140x50 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Fondue-Fabrik: Deckel springt auf

**Shot W4-B32**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Fondue-Fabrik); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the front vat with its hinged lid, matching the attached background crop: the lid flips open, a splash of glowing cheese shoots up and falls back.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 90x90 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: ends on the open vat.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Fondue-Fabrik: Käse-Platsch

**Shot W4-B33**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A figure-sized splash of glowing green-yellow cheese rises out of a vat, a crown of drops and a jagged empty comic burst, then sinks back in rings.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 100x140 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Werbespot-Set: Couch-Magnet brummt

**Shot W4-B34**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Werbespot-Set); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the purple armchair gadget with the red horseshoe magnet on the podium, matching the attached background crop: the magnet vibrates, small curved magnetic lines pulse outward, a tiny screw and a coin hop toward it.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 90x80 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Werbespot-Set: Stinkwolke

**Shot W4-B35**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Puffs of green stink cloud with little wavy smell lines and a few flies, swelling and drifting.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 96x96 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Empfang: Monitor am Tresen

**Shot W4-B36**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Empfang); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the reception monitor, matching the attached background crop: the blue screen flickers and a small bar scrolls.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 34x26 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Zappmanns Studio: Monitorwand

**Shot W4-B37**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Zappmanns Studio); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the wall of small monitors, matching the attached background crop: each monitor flickers and changes its picture slightly, color bars, prize wheel, kitchen, savanna, graveyard, comic city.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 380x110 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Zappmanns Studio: Band klatscht

**Shot W4-B38**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Zappmanns Studio); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the dark band riser with musician silhouettes, matching the attached background crop: the silhouettes clap and sway in rhythm.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 110x70 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Zappmanns Studio: Quote fällt

**Shot W4-B39**

**Anhängen:** den passenden Ausschnitt aus dem fertigen Hintergrund (Zappmanns Studio); das Ergebnis danach mit `tools/pixelieren.py` auf die Farben des Raums bringen · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Only the tall ratings meter, matching the attached background crop: the glowing bar drops step by step from almost full to the bottom, the color turns from green to red and starts flashing.
OVERLAY: the crop only shows where the effect sits, its size, light and colors; draw only the moving part named above on the magenta background, not the walls, furniture or anything else from the crop, so it can be laid exactly over the painted spot.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 40x140 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Max: Comic-Look-Wechsel

**Shot W4-B40**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A wave of halftone dots and thick black ink lines sweeps across the full screen from left to right and settles.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 640x360 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Umschalten: Effekt

**Shot W4-B41**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A burst of grey TV static sweeping across the full screen from left to right and clearing, 640x360, 6 frames, plays once, over every channel change.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 640x360 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Pause: Effekt

**Shot W4-B42**

**Anhängen:** nichts (Effekt) · **Bilder:** 2 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Two white pause bars with a dark outline blinking on and off in the upper right corner, 64x64, 2 frames, loops, over the frozen scene.
FRAMES: 2 frames side by side, about 0.2 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 64x64 pixels in the game.
SPACING: divide the image into 2 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Rückspulen: Effekt

**Shot W4-B43**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: Horizontal VHS tracking lines and a slight color shift rolling down the screen, 640x360, 4 frames, loops, over the scene while rewinding.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 640x360 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Stumm: Effekt

**Shot W4-B44**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A white speaker symbol with a red cross pops up in the upper right corner, wobbles once and settles, 64x64, 4 frames, plays once.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, plays once, each frame 64x64 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Sendersuchlauf: Effekt

**Shot W4-B45**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: The full screen splits into flickering horizontal strips, each strip a different channel in its own colors, sliding sideways at different speeds, 640x360, 6 frames, loops.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 640x360 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Kanal 999: Senderanzeige

**Shot W4-B46**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A glossy gold channel number display in the upper left corner flickers through blurred digits and snaps to a fixed glowing state with a gold flash, 96x40, 4 frames, plays once.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, plays once, each frame 96x40 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Lampenflackern: Effekt

**Shot W4-B47**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A light bulb flickering on and off with a warm yellow glow halo, 32x64, 4 frames, plays once, over the lamps in Grandpa's living room.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, plays once, each frame 32x64 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## WRRUMM-Blase: Effekt

**Shot W4-B48**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A jagged comic sound effect burst with thick outline and halftone dots pops up and shakes, empty inside, 128x96.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, plays once, each frame 128x96 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Testbild: Balken rasten ein

**Shot W4-B49**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** einmalig

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: One color bar slides into line with a small bounce, glitter sparkles flash along its edges.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, plays once, each frame 64x240 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: the last frame is the calm end state of the effect.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Rauschen: Geisterbilder

**Shot W4-B50**

**Anhängen:** nichts (Effekt) · **Bilder:** 4 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: A faint ghost image of a show inside grey static fades in and out with interference lines.
FRAMES: 4 frames side by side, about 0.4 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 90x70 pixels in the game.
SPACING: divide the image into 4 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

## Müllpresse: Wände rücken, Auge blinzelt

**Shot W4-B51**

**Anhängen:** nichts (Effekt) · **Bilder:** 6 · **Ablauf:** Schleife

```text
STYLE: Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
EFFECT: The steel walls of a trash compactor creep inward a few pixels and back, a small eye on a stalk blinks among video tapes, 192x128, 6 frames, loops, over the Kellerarchiv.
FRAMES: 6 frames side by side, about 0.6 s at 10 frames per second, loops seamlessly: the last frame leads back into the first, each frame 192x128 pixels in the game.
SPACING: divide the image into 6 equal columns, one frame per column, with a clear strip of empty magenta between neighbouring frames, at least as wide as the character's head; every part of a frame, including raised arms, tools, tongs, tails, capes and effects, stays completely inside its own column and never reaches into or overlaps the next frame. Draw the character smaller if needed to keep the gaps, the same size in every frame.
END: no separate end frame, the loop closes.
CAMERA: static, no zoom, no pan, the effect stays centered in every frame.
NEGATIVE: no characters unless named, no background scene, no text, no frames or panels, no checkerboard, no motion blur, no speed lines
```

# Gegenstände

Je Sammelbild den Block komplett in Gemini kopieren und Max' Konzeptblatt als Stilvorlage
anhängen, keine Skizze. Umrechnen mit `tools/figur.py` (Endesga-Palette), Ausschneiden je Zelle.

## Tasten-Symbole (2×3, 32×32)

**Shot W4-G01**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x3 grid of round grey rubber remote buttons, each about 32x32 with one white symbol, same scale: double arrow channel switch; two pause bars; double left arrows; crossed-out speaker; speech bubble with three lines; magnifier with radio waves.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Splitscreen-Adapter (1×1)

**Shot W4-G02**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: A small grey plastic TV adapter box with two short cables ending in plugs, a white symbol of two side-by-side rectangles on top and a small gold glitter sticker from the game show.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Genre-Ketten (2×3)

**Shot W4-G03**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x3 grid, chain states left to right, same scale: a fresh bright yellow banana peel; the same peel black, soft and rotten; a green banana-shaped stink bomb with a lit fuse; a pale yellow wedge of fondue cheese; the same wedge glowing soft yellow; the same wedge glowing radioactive green with a sparkle.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Sender (2×2)

**Shot W4-G04**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x2 grid, same scale: a folded TV guide magazine with a blank cover and a dog-eared corner; a folded white bedsheet; the same white bedsheet knotted into a superhero cape; a heavy black anvil.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Comic-Panels (1×4, Sortier-Bildschirm, kein Inventar)

**Shot W4-G05**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 1x4 single comic panels with thick black borders and halftone dots, each with a small wall clock in the top corner, the same sticker-suited villain in all four: the clean villain laughing, clock at 12:00, an empty cloud-shaped thought bubble with small trailing circles; a hero in a bedsheet cape leaping, a banana peel already on the floor, the villain slipping, clock at 12:01, an empty jagged shout bubble; a big empty explosion burst over a cheese vat, clock at 12:02, no speech bubble; the villain's legs sticking out of a vat of cheese, the hero wearing a crown made of cheese, clock at 12:03, a small empty round bubble.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Drehbuch (1×1)

**Shot W4-G06**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: A thick stapled script with a blank cover, a brown coffee ring stain and a pencil clipped to it.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Lichtröhre Deluxe (1×1)

**Shot W4-G07**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: A long fluorescent tube glowing pale blue, still in a flashy blister pack with a gold sticker.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Archivband (1×1)

**Shot W4-G08**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: A battered black VHS tape with a faded blank handwritten label strip and a bent corner.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Szenen-Requisiten (2×3, kein Inventar)

**Shot W4-G09**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 2x3 grid, same scale: a white chicken-shaped ceramic cookie jar with a red comb, whole; a small heap of white ceramic shards with scattered round cookies and one round grey rubber remote button lying among them; a small golden crown with three points; a heavy iron chain lying in loose loops; a small beeping alien-detector gadget with a green light; a pink chewing gum bubble.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

## Deko Welt 4 (3×3)

**Shot W4-G10**

```text
STYLE: Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
SUBJECT: 3x3 grid, same scale: a broken old radio with scratches and a bent antenna; a golden vinyl record in a black frame; a stack of cassette tapes with blank labels; a small grey rain cloud above a drum kit; a laugh track machine with a big red button; a cardboard audience cutout of a smiling person; a toaster on a small podium; a mirrored disco ball; a blank cardboard sign hanging on a string.
NEGATIVE: no characters, no boy Max, no boxes, tiles, frames or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item, no extra items, no photorealism
```

# Nahansichten und Tafeln

Nichts anhängen. Die Schrift setzt Claude danach als Pixelschrift ein.

## Programmzeitschrift (Rätsel 4, 5, 9, 11)

**Shot W4-N01**

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: Close-up of an open TV guide magazine lying flat and filling the whole frame as one double page, no page turning. Left page: a narrow time column on the far left and five equal channel columns forming a grid of blank programme cells, each column topped by a small blank tab in its own channel color. Right page: six equal blank boxes in a 2x3 grid, each with a small thumbnail picture and blank lines. Slightly crumpled paper, one dog-eared corner, a faint coffee ring.
PALETTE: printed 1990s TV guide look: off-white newsprint paper, bold flat channel color tabs, thin black print lines, soft even light, no gloss. Color anchors, approximate: newsprint cream #ead4aa, ink black #181425, channel red #e43b44, channel blue #0099db, channel yellow #fee761, soft grey #c0cbdc.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

## Messingschild am Porträt (Rätsel 12)

**Shot W4-N02**

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: Close-up of a small polished brass plate screwed to black marble below the lower edge of a heavy gold picture frame, filling the frame; the plate has a thin engraved border and three wide empty engraving lines, the middle line longest; soft reflections of a spotlight on the brass, a fingerprint smudge in one corner.
PALETTE: glossy corporate TV network look: black marble, gold trim and glowing monitor blue, polished floor reflections. Color anchors, approximate: black marble #181425, gold trim #feae34, monitor blue #2ce8f5, steel grey #5a6988.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```

## Pausentafel Mitternachts-TV (Rätsel 5)

**Shot W4-N03**

```text
STYLE: Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
SUBJECT: Full-screen TV break card: a small round bedsheet ghost asleep on a crescent moon in the center, a tiny nightcap on its head, three floating Z shapes above it, a few stars and a thin wavy frame around the picture, a blank banner across the bottom.
PALETTE: 1980s horror music video look: deep purple and toxic green, knee-high fog, colored disco spotlights, full moon. Color anchors, approximate: deep purple #68386c, night violet #262b44, toxic green #63c74d, moon white #c0cbdc.
NEGATIVE: no text, letters, numbers or symbols that could be read, no characters, no hands unless described, no floor, no frame, no photorealism, no watermark
```
