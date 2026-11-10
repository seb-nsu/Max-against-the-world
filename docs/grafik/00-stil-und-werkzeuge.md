# Grafik: Stil und Werkzeuge

Alle Welten teilen einen Pixel-Art-Stil in 640×360 Pixeln. Figuren und Gegenstände nutzen eine gemeinsame Palette, Hintergründe je 32 eigene Farben; jede Welt bekommt ihre eigene Farbstimmung. Die Prompts in den Grafik-Dateien der Welten sind auf Englisch, weil die Generatoren damit zuverlässiger arbeiten.

## Technischer Stil

| Eigenschaft | Festlegung | Warum |
| --- | --- | --- |
| Auflösung | 640×360 Pixel, im Spiel ganzzahlig skaliert: 3-fach auf 1920×1080 (Full HD), 4-fach auf 2560×1440 (WQHD), 6-fach auf 3840×2160 (4K) (Sebastian, 10. November 2026, nach dem ersten Anspielen; vorher 480×270; die Zahl steht zentral in `tools/aufloesung.py`) | 480×270 geht in WQHD nicht ganzzahlig auf; 640×360 bringt mehr Details (Max 189 statt 105 Pixel) und passt glatt auf alle üblichen Bildschirme |
| Hintergründe | 640×360; größere Räume bis 1280×360. Aus einem Konzeptbild in voller Größe, umgewandelt mit `tools/pixelieren.py` (ohne Größengrenze); Retro Diffusion schafft kostenlos höchstens 512 Pixel Kantenlänge und ist nur noch Ersatzweg in zwei Hälften zu 320×360 | Breite Räume scrollen seitlich; das Konzeptbild dient zugleich zum Gegenprüfen |
| Figuren | Max etwa 189 Pixel hoch, Erwachsene 189 bis 216, Pixel etwa 61 (Entscheidung 10. November 2026: nach dem ersten Anspielen bei 640×360 um 35 Prozent vergrößert, vorher 140; ganz große Wesen höchstens 340, mehr passt nicht ins Bild) | Gut lesbare Mimik, genug Platz im Raum. Die Möbel im Hintergrund richten sich danach: Türen und hohe Schränke an der Rückwand etwa 180 Pixel, Sessel etwa 90, Tische etwa 81 (Test Dachboden 10. November 2026: ohne diese Vorgabe zeichnet die KI den Raum anderthalbmal zu groß, Max wäre kleiner als der Sessel; beim zweiten Versuch wirkten 84 Pixel hohe Figuren (damals bei 480×270) noch zu klein, deshalb wurden die Figuren auf 140 Pixel vergrößert) |
| Inventar-Icons | 48×48 Pixel | Einheitliche Inventarleiste |
| Mauszeiger | 32×32 Pixel |  |
| Palette | Figuren, Gegenstände, Icons und Oberfläche: gemeinsame Palette „Endesga 32“ von Lospec (Welt-Zusatzfarben siehe unten). Hintergründe: je Raum 32 eigene Farben, beim Umwandeln in Retro Diffusion mit „Reduce colors“, 32 Farben, „Balanced“, Dithering None (Entscheidung 10. November 2026) | Endesga 32 hat zu wenige staubige Mitteltöne für die gemalten Konzeptbilder (Test Dachboden: grüner Sessel wurde braun, alles rotstichig). Einheitlich bleibt das Spiel über den gemeinsamen Konzept-Stil; Figuren in den Grundfarben heben sich ab |
| Perspektive | Mittelweg mit leichter Tiefe (Entscheidung 10. November 2026): Rückwand frontal, sanfte Ein-Punkt-Perspektive mit Fluchtpunkt in der Bildmitte auf etwa 40 Prozent der Höhe, Seitenwände höchstens als schmale schräge Streifen am Rand; begehbarer Boden etwa 120 bis 160 Pixel hoch im unteren Drittel bis zur unteren Hälfte. Figuren-Sprites bleiben streng seitlich | Wie die klassischen Adventures der 1990er: Figuren laufen auch nach hinten und werden dort auf etwa 85 Prozent kleiner (Feld `tiefe: 0.85` im Raum-Layout), Laufwege bleiben lesbar |
| Licht | Von oben links, weiche Schatten nach rechts unten | Einheitlich über alle Szenen |
| Konturen | Figuren und Gegenstände mit dunkler, farbiger Kontur (nicht reines Schwarz); Hintergründe ohne Kontur | Figuren heben sich vom Hintergrund ab |
| Kantenglättung | Keine; saubere Pixelgruppen ohne Farbverläufe | Echte Pixel-Art |

**Farbstimmung pro Welt:**

| Bereich | Hauptfarben | Stimmung |
| --- | --- | --- |
| Prolog und Finale | Warmes Braun, Orange, staubiges Gelb | Gemütlicher Dachboden im Abendlicht |
| Welt 1 | Saftiges Grün, Gold, Himmelblau | Bilderbuch-Märchen |
| Welt 2 | Sand, Ocker, Türkis; Marmorweiß; Rot und Purpur nur für die Togen der römischen Touristen | Gleißende Hitze |
| Welt 3 | Nachtblau, Neon-Magenta, Cyan; Grün für die Code-Sicht; Weiß für das Labor | Regen und Neon |
| Welt 4 | Je Sender anders | Siehe `welt-4.md` |

**Zusatzfarben pro Welt:** Endesga 32 hat kein Neon. Welt 3 bekommt zwei Magenta- und zwei Cyan-Töne dazu, Welt 4 je Sender bis zu zwei eigene Töne. Palettize läuft für Figuren und Gegenstände pro Welt mit der erweiterten Welt-Palette, nicht mit der Basis; Hintergründe haben ihre eigenen 32 Farben. Max, Pixel und die weltenübergreifenden Gegenstände bleiben in den 32 Grundfarben, damit sie überall gleich aussehen.

## Werkzeuge und Ablauf

| Asset | Werkzeug | Modell oder Stil | Ablauf |
| --- | --- | --- | --- |
| Konzeptbilder | ChatGPT oder Gemini | – | Baustein „KONZEPT“ voranstellen, 16:9 erzeugen. Nur als Vorlage, nicht ins Spiel |
| Hintergründe | Gemini, dann `tools/pixelieren.py` | 640×360 | Standard (Sebastian, 10. November 2026): erst ein Konzeptbild (Baustein KONZEPT) zum Gegenprüfen, dann mit `tools/pixelieren.py` auf 640×360 und 32 Farben umwandeln (das Gemini-Original reicht, Claude kann das übernehmen). Ersatzweg: Neural Pixelate (Retro Diffusion) in zwei Hälften zu 320×360 und danach gemeinsam auf 32 Farben bringen. Danach in Aseprite Perspektive und Laufbereich korrigieren |
| Figuren | Retro Diffusion Cloud | `rd_pro__default` mit Referenzbildern, `rd_plus__character_turnaround` | Erst eine Ansicht von der Seite festlegen, dann als Referenz für alle weiteren Bilder nutzen |
| Animationen | Retro Diffusion Cloud | `rd_advanced_animation__walking`, `__idle`, `__custom_action` | Aus einem fertigen Standbild der Figur erzeugen, danach in Aseprite nacharbeiten |
| Gegenstände | Retro Diffusion Cloud oder lokal | `rd_plus__item_sheet` oder `rd_pro__inventory_items` | Mehrere Gegenstände pro Bild, dann ausschneiden und auf 48×48 bringen |
| Benutzeroberfläche | Retro Diffusion Cloud | `rd_pro__ui_panel` | Rahmen und Knöpfe; Schrift immer von Hand |
| Umfärben, Freistellen | Retro Diffusion lokal | Palettize, Background Removal | Jedes fertige Asset einmal auf die gemeinsame Palette bringen |

**Modellnamen prüfen:** Die Namen `rd_plus__environment`, `rd_pro__default` und die Animationsmodelle entsprechen dem Stand vom 8. November 2026. Vor dem ersten Auftrag auf der Retro-Diffusion-Website prüfen, ob sie noch so heißen, und das Datum der Prüfung im KI-Protokoll notieren.

**Ablauf pro Szene:**

1. Konzeptbild mit ChatGPT oder Gemini, bis Aufbau und Stimmung passen. Fertig zusammengesetzte Prompts (Baustein, Motiv, Farb-Baustein, Skizzen-Satz) je Raum stehen in `grafik/fertige-prompts/` und werden mit `tools/prompts_zusammensetzen.py` aus den Grafik-Dateien erzeugt. Die Layout-Skizze des Raums (`grafik/skizzen/<abschnitt>/<raum>.png`, verlinkt in jeder Grafik-Datei unter „Szenen“) als Bild mitgeben und hinter den Prompt schreiben: „Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.“ Blaue Kästen gehören ins Bild, orange gestrichelte sind eigene Sprites, grüne Ausgänge, die grauen Umrisse zeigen Max' Größe vorn und hinten. Die Skizzen erzeugt `tools/layout_skizzen.py` aus den Raum-Layouts neu.
2. Prüfen und im selben Gemini-Chat nachbessern lassen statt neu zu erzeugen, je Fehler ein kurzer Satz (etwa „Make the wardrobe about 25 percent smaller.“). Prüfliste: Rückwand frontal, Boden frei und gut lesbar, Möbel klein genug (Max als Maßstab, 189 Pixel: Schrank etwa 180, Sessel etwa 90 Pixel nach dem Umwandeln), alle Hinweis-Motive wie beschrieben (Poster, Kalender), keine Schrift, keine Gegenstände, die eigene Sprites sind, keine Gesichter an Geräten.
3. Umwandeln: `python3 tools/pixelieren.py original.jpg w0_bg_raum_v01.png 640 360` (schneidet auf 16:9 zu, verkleinert kontrastbewusst nach dem k-Centroid-Verfahren, 32 eigene Farben, entfernt Streupixel). Einfacher: das Gemini-Original an Claude schicken. Ergebnis muss genau 640×360 Pixel und höchstens 32 Farben haben. Ersatzweg Retro Diffusion (Neural Pixelate, kostenlos höchstens 512 Pixel): in zwei Hälften zu 320×360 umwandeln, Reduce colors aus, danach gemeinsam auf 32 Farben bringen.
4. In Aseprite: Perspektive prüfen, Laufbereich frei lassen, störende Details und Schrift entfernen, Sprites (Gegenstände, die man nimmt) aus dem Bild malen. Die 32 Farben kommen schon aus dem Umwandeln; neue Pixel nur mit Farben aus dem Bild setzen.
5. Gegenstände der Szene als Sammelbild erzeugen und ausschneiden.
6. In Godot einsetzen und mit Max als Platzhalter testen, ob Größen und Laufwege stimmen. Bei Boden mit Tiefe im Layout `tiefe: 0.85` eintragen (Ablauf in `game/README.md`, Abschnitt „Grafik ersetzen“).

**Text in Bildern:** Generatoren schreiben fast immer fehlerhaft. Schilder, Logo, Programmzeitschrift und Kalenderzahlen deshalb ohne Text erzeugen und die Schrift später von Hand in Aseprite setzen. Was der Spieler für ein Rätsel oder das Notizbuch lesen muss (Kalender, Satzung, Kritzeleien, Hinweiszettel, Tafeln), bekommt zusätzlich eine Nahansicht in 640×360; kurze Texte, die Max beim Ansehen vorliest (etwa Steckbrief, Opas Papyrus), bleiben normales Ansehen. Es sind genau 14 Nahansichten; welche, steht in den Welt-Tabellen (`welten/*.yaml`), die Bilder beschreiben die Grafik-Dateien (Zeile „Nahansichten“), den Bildschirm `05-spielsysteme.md`. Kleine Bildschirme in der Szene (Zapp-O-Mat, Monitorwand, Röhrenfernseher, Empfangsmonitor) bekommen kein eigenes Bild: Beim Ansehen blendet Godot den Ausschnitt doppelt vergrößert und ohne Glättung ein.

## Prompt-Bausteine

Ein vollständiger Prompt besteht aus drei Teilen: **Baustein** (Technik, von hier) + **Motiv** (aus der Grafik-Datei der Welt) + **Farb-Baustein** der Welt. Die Motive in den Grafik-Dateien der Welten folgen diesen Aufbau-Regeln, damit Retro Diffusion Bildaufbau, Größen und Laufwege trifft.

### Aufbau-Regeln

| Asset | Länge des Motivs | Reihenfolge im Motiv |
| --- | --- | --- |
| Hintergrund | 50 bis 90 Wörter | Ort und Tageszeit → links, Mitte, rechts → Vorder- und Hintergrund → Laufbereich und Ausgänge → Hotspots mit Material und Farbe → Licht und Stimmung |
| Figur | 35 bis 55 Wörter, genau eine Figur | Rolle, Statur, Größe → Kopf und Gesicht → Kleidung mit Farbe pro Teil → Requisit und Hand → Pose, Blickrichtung, Ausdruck → Abgrenzung „no …“ |
| Sammelbild | 8 bis 15 Wörter pro Gegenstand | Raster nennen, Reihenfolge links nach rechts, gleicher Maßstab, Zustandspaare nebeneinander, Form, Material, Farbe |
| Animation | 20 bis 40 Wörter | Ausgangsbild → Aktion in Phasen → Bildzahl → Schleife oder einmalig → Blickrichtung → was sich nicht bewegt |
| Effekt | 15 bis 25 Wörter | Form, Farbe, Größe, Bildzahl, über welcher Szene |

**Farbwerte im Prompt:** Hex-Werte (etwa #3a4466) sind nur Orientierung; Retro Diffusion hält sie nicht zuverlässig ein. Verbindlich ist das Umfärben mit Palettize auf die (Welt-)Palette, bei Hintergründen die Reduktion auf 32 eigene Farben. Die 90-Wort-Grenze darf ein Hintergrund mit sehr vielen Hotspots überschreiten (Dachboden); lässt Retro Diffusion dann Details weg, Variante B nehmen (Neural Pixelate aus dem Konzeptbild).

**Zustände:** Gegenstände und Orte, die sich im Spiel verändern (vorher und nachher, Tag und Nacht), werden immer als Paar im selben Prompt erzeugt, damit sie zusammenpassen.

**Hinweise sichtbar machen:** Alles, was ein Rätsel als Hinweis braucht (Kalenderkreis, Kritzeleien, Kochbuch), steht ausdrücklich im Prompt. Alles, was eine Lösung verraten würde, wird bewusst neutral beschrieben (zum Beispiel gleich aussehende Flaschen).

### Bausteine

**KONZEPT** (ChatGPT oder Gemini, nur als Vorlage):

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, front view of the room with gentle one-point perspective, camera at the eye level of a standing person looking straight at the back wall, back wall parallel to the picture plane, vanishing point in the center at about 40 percent of the image height, side walls at most as narrow angled strips at the image edges, open walkable floor with gentle depth across the lower third to half of the image kept free of objects except at the left and right edges, wide shot from further back so the room feels spacious: a standing adult at the front edge would be about 52 percent of the image height, so doors and tall cupboards reach only about 50 percent of the image height, chairs about 25 percent and tables about 22 percent, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, no faces or robot features on objects, small loose objects that can be picked up left out, book spines, calendars, posters and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
```

**HINTERGRUND** (`rd_plus__environment`, 640×360):

```text
Pixel art background, 640x360, front view with gentle one-point perspective, camera at eye level, back wall parallel to the picture plane, vanishing point in the center, side walls only as narrow angled strips at the edges, open walkable floor with gentle depth about 120 to 160 pixels high kept clear in the lower part, wide shot with small furniture: doors and tall cupboards about 180 pixels high, chairs about 90, tables about 81, objects exactly as described, no faces on objects, no loose pickable items, no letters or numbers anywhere, large objects only against the back wall or at the left and right edges, exits clearly readable, light from upper left with soft shadows to the lower right, clean pixel clusters, no anti-aliasing, no outlines, no characters, all signs, labels and book covers blank.
```

**FIGUR** (`rd_pro__default`, Menschen etwa 189 Pixel):

```text
Pixel art character sprite, exactly one character, full body, strict side view facing right unless the motif says left, about 189 pixels tall on a 256x256 canvas unless the motif gives another height, feet on the bottom edge, dark colored outline (not pure black), light from upper left, expressive cartoon face, flat colors without gradients, plain transparent background, no ground shadow.
```

**FIGUR-KLEIN** (Tiere und kleine Wesen, 29 bis 75 Pixel; Zahl im Motiv angeben):

```text
Pixel art small creature sprite, exactly one creature, full body, strict side view facing right unless the motif says left, height in pixels as given in the motif on a 96x96 canvas, dark colored outline (not pure black), light from upper left, very readable silhouette, flat colors, plain transparent background, no ground shadow.
```

**FIGUR-GROSS** (große Wesen und Maschinen über 216 Pixel, höchstens 340; Zahl im Motiv angeben):

```text
Pixel art large character sprite, exactly one character, full body, strict side view facing right unless the motif says left, height in pixels as given in the motif on a canvas up to 352x352, fills most of the frame, dark colored outline (not pure black), light from upper left, flat colors, plain transparent background, no ground shadow.
```

**PORTRÄT** (Dialog und Figurenwechsel, 128×128):

```text
Pixel art character portrait, head and shoulders, 128x128, three-quarter view facing right, expressive face, same colors as the character's sprite, dark colored outline, light from upper left, plain transparent background, no hands, no text.
```

**KARTE** (`rd_plus__topdown_map`, 640×360):

```text
Pixel art top-down illustrated travel map, 640x360, seen straight from above, simple readable shapes, clearly separated clickable locations with at least 32 pixels of space between them, light from upper left, no text, no letters, no labels.
```

**GEGENSTÄNDE** (`rd_plus__item_sheet`; Raster im Motiv angeben):

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 48x48 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item.
```

**EFFEKT** (Bildfolge für Godot):

```text
Pixel art visual effect sprite sheet, frames in one horizontal row, frame count and frame size as given in the motif, every frame the same size with the effect centered, transparent background, limited palette, no anti-aliasing, no text.
```

**ANIMATION** (`rd_advanced_animation__custom_action` mit dem fertigen Standbild als Eingabe; Schema für das Motiv):

```text
[Ausgangsbild: Figur und Pose]. [Aktion in Phasen: Ausholen, Höhepunkt, Ende]. [Bildzahl] frames, [loops / plays once], facing [right/left], [was ruhig bleibt], same size, colors and outline as the input sprite, feet stay on the same baseline.
```

Für Gehen und Stehen reichen `rd_advanced_animation__walking` und `__idle` mit dem Standbild.

**Verbotenes** (Feld für Negativ-Prompt, falls vorhanden; bei Karte und Reisetasche „top-down view“ weglassen, bei Hintergründen „more than one character“ durch „characters, people“ ersetzen. ChatGPT und Gemini haben kein solches Feld, dort stehen die wichtigsten Verbote schon im Baustein):

```text
text, letters, numbers, watermark, logo, signature, blur, gradients, anti-aliasing, photorealism, 3D render, isometric view, top-down view, bird's-eye view, strong three-quarter view, fisheye, steep tilted floor, pure black outlines, drop shadow, cropped feet, more than one character
```

### Steckbriefe der Hauptfiguren

Bei jedem Bild von Max oder Pixel wortgleich verwenden.

**Max** (Baustein FIGUR):

```text
Max, a lanky 16-year-old boy with a slight slouch, messy dark brown hair (#733e39) with shaggy strands falling over his forehead and eyes, sleepy half-closed eyes, lopsided smirk, a few freckles, oversized dark slate blue-grey hoodie (#3a4466) with sleeves over his hands, uneven drawstrings and a tiny retro TV with a turquoise screen (#2ce8f5) on the chest, dark blue jeans (#124e89) slightly too long, worn red sneakers (#e43b44) with white soles, one lace untied, hands in his hoodie pocket.
```

**Pixel** (Baustein FIGUR-KLEIN, etwa 61 Pixel hoch):

```text
Pixel, a chubby round tomcat about 61 pixels tall when sitting, short legs, light silver-grey fur (#c0cbdc) with three darker blue-grey stripes on his back (#5a6988), white chest and white paws, a very fluffy tail, a notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose, a red collar (#e43b44) with a small round silver speaker and a clearly visible two-pixel turquoise light (#2ce8f5), not orange, no tabby markings on the face.
```

Das kostenlose Pet Cat Pack von Luiz Melo (CC0) darf nur als Anschauung für Posen und Laufzyklus neben dem Bild liegen, nicht als Pixelgrundlage: nichts davon übernehmen oder übermalen, sonst bleibt die Silhouette eines weit verbreiteten Asset-Pakets. Max, Pixel und Opa werden nach dem KI-Entwurf in Aseprite Pixel für Pixel von Hand nachgezogen (Produktion, Absprachen).

### Weltenübergreifende Gegenstände

Diese Gegenstände kommen in mehreren Welten vor. Einmal erzeugen und überall wiederverwenden.

| Sammelbild | Motiv |
| --- | --- |
| Reisegepäck (2×5) | 2x5 grid: a closed tin of tuna with a blue fish drawing on a blank label; the same tin opened, lid bent up, pink tuna in brine inside; the same tin empty and shiny inside; a wooden cooking spoon with a crust of dried yellow cheese on its bowl; a red-and-white striped woolen sock; a full-size round clay jug of olive oil with a handle and a cork, oil up to the neck; the same jug less full, a drip running down its side (Welt 2 nach dem Schluck für die Sandalen, so reist er nach Welt 3); a single golden sandal with two small white wings at the heel; rectangular black sunglasses; a small brown notebook with a pencil tucked in the spine |
| Fernbedienungen (1×5) | 1x5 grid: a cheap white plastic TV remote with a single red button; the same white remote with six round colored buttons; a gleaming golden luxury remote with jewel buttons; a worn grey 1990s TV remote with faded rubber buttons for volume, channel and mute and one red button at the top; the same grey remote seen from the back with the battery lid open and the compartment empty (Finale, Zündkapsel ohne Zelle) |

### Animationen von Max und Pixel

Diese Grundanimationen gelten für alle Welten. Weltspezifische Aktionen stehen in den Grafik-Dateien der Welten.

| Figur | Aktion | Bilder | Ablauf | Motiv |
| --- | --- | --- | --- | --- |
| Max | Gehen | 8 | Schleife | `walking`: standing sprite of Max as input, slouching relaxed walk, hands stay in the hoodie pocket, head bobbing slightly, sneakers on one baseline, facing right |
| Max | Gehen nach vorn und nach hinten | je 8 | Schleife | Raumansicht mit leichter Tiefe: Godot nimmt sie als `walk_d` und `walk_u`, ohne sie läuft Max mit dem seitlichen Gang. Zuerst die Vorder- und die Rückansicht aus dem Turnaround als Eingabe. `walking`: front view of Max walking toward the viewer, slouching relaxed walk, hands in the hoodie pocket, head bobbing slightly; second animation, same settings: back view of Max walking away from the viewer |
| Max | Stehen | 4 | Schleife | `idle`: standing sprite of Max as input, slow breathing, one blink, weight shifts from one leg to the other, hands stay in the hoodie pocket, facing right |
| Max | Sprechen | 4 | Schleife | Max talking: mouth opens and closes, small open-hand gesture with the right hand, legs and torso stay still, facing right |
| Max | Aufheben | 6 | einmalig | Max bends down, reaches forward with the right hand, grabs something at floor level, straightens up again, facing right |
| Max | Benutzen | 6 | einmalig | Max reaches forward at chest height with the right hand, fiddles briefly, pulls the hand back, facing right |
| Max | Schulterzucken | 4 | einmalig | Max lifts both shoulders and palms, raises eyebrows, lowers them again, facing right |
| Max | Gähnen | 6 | einmalig | Max stretches arms up, mouth opens wide, eyes close, arms drop back into the hoodie pocket, facing right |
| Max | Auf dem Sofa | 4 | Schleife | Standbild A (Prolog, Welt 3): Max lying flat on a sofa in side view, head on the left armrest, holding his phone above his face with both hands, sneakers on the right armrest; Standbild B (Welt 4): Max slumped half lying on a sofa, remote in hand, feet up, facing right; Animation: slow blinking, thumb tapping the phone or clicking the remote |
| Max | Vom Sofa aufstehen | 8 | einmalig | Max swings his legs off the sofa, pushes himself up with both hands, stands, stretches, facing right (Prolog: danach Handy in die Bauchtasche; Finale: endet in der aufrechten Pose) |
| Pixel | Gehen | 8 | Schleife | `walking`: standing sprite of Pixel as input, about 65 pixels long, smug strut with tail held high, collar light stays visible, facing right |
| Pixel | Gehen nach vorn und nach hinten | je 6 | Schleife | Wie bei Max (`walk_d`, `walk_u`), nachrangig: Pixel ist klein, der seitliche Gang fällt beim Laufen in die Tiefe kaum auf. `walking`: front view of Pixel trotting toward the viewer, round face and white chest, collar light visible; second animation: back view trotting away, fluffy tail held high |
| Pixel | Stehen | 4 | Schleife | `idle`: sitting sprite of Pixel as input, tail tip twitching, one slow blink, body stays still, facing right |
| Pixel | Schlafen | 4 | Schleife | Pixel curled up asleep, about 25 pixels high and 48 long, belly rising and falling, torn ear twitching once, facing right |
| Pixel | Putzen | 6 | Schleife | Pixel sitting, licks his front paw and wipes it over his ear, tail still, facing right |
| Pixel | Springen und Klettern | 6 | einmalig | Pixel crouches, wiggles his rear, leaps up about 75 pixels and lands on a ledge above, facing right (Prolog und Zwischenspiele auf die Werkbank, Welt 1 bis 3) |
| Pixel | Schnuppern | 4 | einmalig | Pixel stretches his neck forward, nose twitching, sniffs twice, pulls back, facing right (Welt 1 bis 3) |
| Pixel | Tragen | 8 | Schleife | Pixel walking sprite as input, smug strut with tail held high, a small object held in his mouth, head slightly raised, the object stays fixed in the mouth, facing right (Welt 1 bis 3, Rückkehr 3 und Finale mit der Zelle; nicht in Welt 4) |
| Pixel | Fauchen | 4 | einmalig | Pixel arches his back, fur bristles, mouth wide open hissing, then settles, facing right |
| Pixel | Ohrfeige | 4 | einmalig | Pixel jumps up and slaps with one front paw, lands again, smug face, facing right (Welt 3, blaue Pastille aus der Apothekendose mit grünem Kreuz). Nur Vorlage: erzeugt wird allein die Fassung mit 6 Bildern in Grafik Welt 3 |
| Pixel | Vom Schrank fallen | 8 | einmalig | Pixel loses balance on top of a tall cupboard, flails all four legs, falls about 149 pixels, lands flat on the floor, dazed, facing right (Finale, Wohnzimmer) |

## Regeln

**Parodien:** Keine Namen aus Filmen, Spielen oder Serien in Prompts verwenden. Die Anspielung steckt im Verhalten, im Dialog und in einzelnen Ideen, nicht im Aussehen. Jede Parodiefigur bekommt ein eigenes Design, das sich in mindestens zwei sichtbaren Merkmalen vom Vorbild unterscheidet (Kleidung, Farbe, Frisur, Requisit). Welche Merkmale das sind, steht im Rechtscheck in `01-konzept.md`. Die Prompts in den Grafik-Dateien der Welten sind so formuliert. Wenn ein Ergebnis einer bekannten Figur trotzdem zu ähnlich sieht, verwerfen oder deutlich umzeichnen. Die Prüfung wird bei jeder Parodiefigur im KI-Protokoll in der Spalte „Ähnlichkeitsprüfung ok“ vermerkt.

**Dateinamen:** `welt_art_name_version.png`, zum Beispiel `w1_bg_taverne_v03.png`, `w0_chr_max_walk_v01.png`, `w2_itm_feigen_frisch_v01.png`. W0 steht für Prolog und Finale.

**Objekte nur zum Ansehen:** Jede Szene bekommt zwei bis vier Objekte ohne Rätselfunktion, die nur einen Kommentar von Max oder Pixel auslösen. Sie tragen viele Anspielungen und machen die Welt lebendig. Manche bereiten unauffällig das Finale vor (Fernbedienungen, Kochbuch). Sie gehören in den Hintergrund oder als einzelne Grafik darüber, nicht ins Inventar.

**KI-Protokoll:** Eine Tabelle mit Datum, Werkzeug und Modell, Prompt, Seed, Datei, Nacharbeit (keine, wenig, stark) und „Ähnlichkeitsprüfung ok“; die Spalten legt `03-produktion.md` (System 2) fest. Damit lässt sich die KI-Angabe für Steam später ehrlich ausfüllen, und gute Prompts lassen sich wiederverwenden.

**Lizenzen:** Fremde Asset-Pakete in derselben Tabelle mit Quelle und Lizenz eintragen, damit die Credits vollständig sind.
