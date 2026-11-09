# Grafik: Stil und Werkzeuge

Alle Welten teilen einen Pixel-Art-Stil in 320×180 Pixeln mit einer gemeinsamen Palette; jede Welt bekommt nur ihre eigene Farbstimmung. Die Prompts in den Unter-Tabs sind auf Englisch, weil die Generatoren damit zuverlässiger arbeiten.

## Technischer Stil

| Eigenschaft | Festlegung | Warum |
| --- | --- | --- |
| Auflösung | 320×180 Pixel, im Spiel 6-fach auf 1920×1080 skaliert | Wenig Zeichenarbeit, passt in die Bildgrößen von Retro Diffusion (bis 384 Pixel) |
| Hintergründe | 320×180; größere Räume bis 640×180, aus zwei Hälften zusammengesetzt | Breite Räume scrollen seitlich |
| Figuren | Max etwa 56 Pixel hoch, Erwachsene 56 bis 64, Pixel etwa 18 | Gut lesbare Mimik, genug Platz im Raum |
| Inventar-Icons | 24×24 Pixel | Einheitliche Inventarleiste |
| Mauszeiger | 16×16 Pixel |  |
| Palette | Eine gemeinsame Palette mit 32 Farben, zum Beispiel „Endesga 32“ von Lospec | Alle Assets werden darauf umgefärbt; so passen auch fremde Pakete |
| Perspektive | Streng seitlich wie eine Bühne, Rückwand parallel zur Bildebene; begehbarer Boden als flaches Band im unteren Drittel | Klassische Adventure-Ansicht; Figuren werden nach hinten nur leicht kleiner, Laufwege bleiben lesbar |
| Licht | Von oben links, weiche Schatten nach rechts unten | Einheitlich über alle Szenen |
| Konturen | Figuren und Gegenstände mit dunkler, farbiger Kontur (nicht reines Schwarz); Hintergründe ohne Kontur | Figuren heben sich vom Hintergrund ab |
| Kantenglättung | Keine; saubere Pixelgruppen ohne Farbverläufe | Echte Pixel-Art |

**Farbstimmung pro Welt** (alle aus derselben Palette):

| Bereich | Hauptfarben | Stimmung |
| --- | --- | --- |
| Prolog und Finale | Warmes Braun, Orange, staubiges Gelb | Gemütlicher Dachboden im Abendlicht |
| Welt 1 | Saftiges Grün, Gold, Himmelblau | Bilderbuch-Märchen |
| Welt 2 | Sand, Ocker, Türkis; Marmorweiß; Rot und Purpur nur für die Togen der römischen Touristen | Gleißende Hitze |
| Welt 3 | Nachtblau, Neon-Magenta, Cyan; Grün für die Code-Sicht; Weiß für das Labor | Regen und Neon |
| Welt 4 | Je Sender anders | Siehe Tab Welt 4 |

**Zusatzfarben pro Welt:** Endesga 32 hat kein Neon. Welt 3 bekommt zwei Magenta- und zwei Cyan-Töne dazu, Welt 4 je Sender bis zu zwei eigene Töne. Palettize läuft pro Welt mit der erweiterten Welt-Palette, nicht mit der Basis. Max, Pixel und die weltenübergreifenden Gegenstände bleiben in den 32 Grundfarben, damit sie überall gleich aussehen.

## Werkzeuge und Ablauf

| Asset | Werkzeug | Modell oder Stil | Ablauf |
| --- | --- | --- | --- |
| Konzeptbilder | ChatGPT oder Gemini | – | Baustein „KONZEPT“ voranstellen, 16:9 erzeugen. Nur als Vorlage, nicht ins Spiel |
| Hintergründe | Retro Diffusion Cloud oder lokal | `rd_plus__environment`, 320×180 | Variante A: direkt erzeugen. Variante B: Konzeptbild lokal mit „Neural Pixelate“ auf 320×180 umwandeln. Danach in Aseprite Perspektive und Laufbereich korrigieren |
| Figuren | Retro Diffusion Cloud | `rd_pro__default` mit Referenzbildern, `rd_plus__character_turnaround` | Erst eine Ansicht von der Seite festlegen, dann als Referenz für alle weiteren Bilder nutzen |
| Animationen | Retro Diffusion Cloud | `rd_advanced_animation__walking`, `__idle`, `__custom_action` | Aus einem fertigen Standbild der Figur erzeugen, danach in Aseprite nacharbeiten |
| Gegenstände | Retro Diffusion Cloud oder lokal | `rd_plus__item_sheet` oder `rd_pro__inventory_items` | Mehrere Gegenstände pro Bild, dann ausschneiden und auf 24×24 bringen |
| Benutzeroberfläche | Retro Diffusion Cloud | `rd_pro__ui_panel` | Rahmen und Knöpfe; Schrift immer von Hand |
| Umfärben, Freistellen | Retro Diffusion lokal | Palettize, Background Removal | Jedes fertige Asset einmal auf die gemeinsame Palette bringen |

**Modellnamen prüfen:** Die Namen `rd_plus__environment`, `rd_pro__default` und die Animationsmodelle entsprechen dem Stand vom 8. November 2026. Vor dem ersten Auftrag auf der Retro-Diffusion-Website prüfen, ob sie noch so heißen, und das Datum der Prüfung im KI-Protokoll notieren.

**Ablauf pro Szene:**

1. Konzeptbild mit ChatGPT oder Gemini, bis Aufbau und Stimmung passen.
2. Hintergrund in 320×180 erzeugen oder umwandeln.
3. In Aseprite: Palette anwenden, Perspektive prüfen, Laufbereich frei lassen, störende Details entfernen.
4. Gegenstände der Szene als Sammelbild erzeugen und ausschneiden.
5. In Godot einsetzen und mit Max als Platzhalter testen, ob Größen und Laufwege stimmen.

**Text in Bildern:** Generatoren schreiben fast immer fehlerhaft. Schilder, Logo, Programmzeitschrift und Kalenderzahlen deshalb ohne Text erzeugen und die Schrift später von Hand in Aseprite setzen. Alles, was der Spieler lesen muss (Kalender, Zettel, Satzung, Kritzeleien, Steckbrief), bekommt zusätzlich eine Nahansicht in 320×180; die Liste der Nahansichten steht im Tab Spielsysteme.

## Prompt-Bausteine

Ein vollständiger Prompt besteht aus drei Teilen: **Baustein** (Technik, von hier) + **Motiv** (aus dem Welt-Tab) + **Farb-Baustein** der Welt. Die Motive in den Welt-Tabs folgen diesen Aufbau-Regeln, damit Retro Diffusion Bildaufbau, Größen und Laufwege trifft.

### Aufbau-Regeln

| Asset | Länge des Motivs | Reihenfolge im Motiv |
| --- | --- | --- |
| Hintergrund | 50 bis 90 Wörter | Ort und Tageszeit → links, Mitte, rechts → Vorder- und Hintergrund → Laufbereich und Ausgänge → Hotspots mit Material und Farbe → Licht und Stimmung |
| Figur | 35 bis 55 Wörter, genau eine Figur | Rolle, Statur, Größe → Kopf und Gesicht → Kleidung mit Farbe pro Teil → Requisit und Hand → Pose, Blickrichtung, Ausdruck → Abgrenzung „no …“ |
| Sammelbild | 8 bis 15 Wörter pro Gegenstand | Raster nennen, Reihenfolge links nach rechts, gleicher Maßstab, Zustandspaare nebeneinander, Form, Material, Farbe |
| Animation | 20 bis 40 Wörter | Ausgangsbild → Aktion in Phasen → Bildzahl → Schleife oder einmalig → Blickrichtung → was sich nicht bewegt |
| Effekt | 15 bis 25 Wörter | Form, Farbe, Größe, Bildzahl, über welcher Szene |

**Zustände:** Gegenstände und Orte, die sich im Spiel verändern (vorher und nachher, Tag und Nacht), werden immer als Paar im selben Prompt erzeugt, damit sie zusammenpassen.

**Hinweise sichtbar machen:** Alles, was ein Rätsel als Hinweis braucht (Kalenderkreis, Kritzeleien, Kochbuch), steht ausdrücklich im Prompt. Alles, was eine Lösung verraten würde, wird bewusst neutral beschrieben (zum Beispiel gleich aussehende Flaschen).

### Bausteine

**KONZEPT** (ChatGPT oder Gemini, nur als Vorlage):

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, strictly side view like a flat theater stage, camera at chest height looking straight at the back wall, back wall parallel to the picture plane, no vanishing-point perspective, no top-down or three-quarter view, floor as a flat walkable band across the lower third kept free of objects except at the left and right edges, light from the upper left with soft shadows to the lower right, humorous and whimsical, warm hand-painted look, 16:9, no text, no letters, no logos.
```

**HINTERGRUND** (`rd_plus__environment`, 320×180):

```text
Pixel art background, 320x180, strictly side view like a flat stage, camera at eye level, back wall parallel to the picture plane, no vanishing-point perspective, walkable floor as a flat band about 60 pixels high kept clear in the lower third, large objects only against the back wall or at the left and right edges, exits clearly readable, light from upper left with soft shadows to the lower right, clean pixel clusters, no anti-aliasing, no outlines, no characters, all signs, labels and book covers blank.
```

**FIGUR** (`rd_pro__default`, Menschen etwa 56 Pixel):

```text
Pixel art character sprite, exactly one character, full body, strict side view facing right unless the motif says left, about 56 pixels tall on a 64x64 canvas unless the motif gives another height, feet on the bottom edge, dark colored outline (not pure black), light from upper left, expressive cartoon face, flat colors without gradients, plain transparent background, no ground shadow.
```

**FIGUR-KLEIN** (Tiere und kleine Wesen, 12 bis 30 Pixel; Zahl im Motiv angeben):

```text
Pixel art small creature sprite, exactly one creature, full body, strict side view facing right unless the motif says left, height in pixels as given in the motif on a 32x32 canvas, dark colored outline (not pure black), light from upper left, very readable silhouette, flat colors, plain transparent background, no ground shadow.
```

**FIGUR-GROSS** (große Wesen und Maschinen über 64 Pixel; Zahl im Motiv angeben):

```text
Pixel art large character sprite, exactly one character, full body, strict side view facing right unless the motif says left, height in pixels as given in the motif on a canvas up to 128x128, fills most of the frame, dark colored outline (not pure black), light from upper left, flat colors, plain transparent background, no ground shadow.
```

**PORTRÄT** (Dialog und Figurenwechsel, 64×64):

```text
Pixel art character portrait, head and shoulders, 64x64, three-quarter view facing right, expressive face, same colors as the character's sprite, dark colored outline, light from upper left, plain transparent background, no hands, no text.
```

**KARTE** (`rd_plus__topdown_map`, 320×180):

```text
Pixel art top-down illustrated travel map, 320x180, seen straight from above, simple readable shapes, clearly separated clickable locations with at least 16 pixels of space between them, light from upper left, no text, no letters, no labels.
```

**GEGENSTÄNDE** (`rd_plus__item_sheet`; Raster im Motiv angeben):

```text
Pixel art item sheet, grid exactly as given in the motif, items in reading order left to right and top to bottom, each item centered in its own cell at the same scale, about 24x24 pixels each, slight front-side view, no overlap between cells, dark colored outline (not pure black), light from upper left, plain transparent background, no text, letters or numbers on any item.
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
text, letters, numbers, watermark, logo, signature, blur, gradients, anti-aliasing, photorealism, 3D render, isometric view, top-down view, vanishing-point perspective, tilted floor, pure black outlines, drop shadow, cropped feet, more than one character
```

### Steckbriefe der Hauptfiguren

Bei jedem Bild von Max oder Pixel wortgleich verwenden.

**Max** (Baustein FIGUR):

```text
Max, a lanky 16-year-old boy with a slight slouch, messy dark brown hair (#733e39) with shaggy strands falling over his forehead and eyes, sleepy half-closed eyes, lopsided smirk, a few freckles, oversized dark slate blue-grey hoodie (#3a4466) with sleeves over his hands, uneven drawstrings and a tiny retro TV with a turquoise screen (#2ce8f5) on the chest, dark blue jeans (#124e89) slightly too long, worn red sneakers (#e43b44) with white soles, one lace untied, hands in his hoodie pocket.
```

**Pixel** (Baustein FIGUR-KLEIN, etwa 18 Pixel hoch):

```text
Pixel, a chubby round tomcat about 18 pixels tall when sitting, short legs, light silver-grey fur (#c0cbdc) with three darker blue-grey stripes on his back (#5a6988), white chest and white paws, a very fluffy tail, a notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose, a red collar (#e43b44) with a small round silver speaker and a clearly visible two-pixel turquoise light (#2ce8f5), not orange, no tabby markings on the face.
```

Als Grundlage für Pixel eignet sich das kostenlose Pet Cat Pack von Luiz Melo (CC0): umfärben, Ohr, Halsband und die zwei Pixel große Leuchte ergänzen.

### Weltenübergreifende Gegenstände

Diese Gegenstände kommen in mehreren Welten vor. Einmal erzeugen und überall wiederverwenden.

| Sammelbild | Motiv |
| --- | --- |
| Reisegepäck (2×5) | 2x5 grid: a closed tin of tuna with a blue fish drawing on a blank label; the same tin opened, lid bent up, pink tuna in brine inside; the same tin empty and shiny inside; a wooden cooking spoon with a crust of dried yellow cheese on its bowl; a red-and-white striped woolen sock; a full-size round clay jug of olive oil with a handle and a cork, oil up to the neck; the same jug less full, a drip running down its side (Welt 2 nach dem Schluck für die Sandalen, so reist er nach Welt 3); a single golden sandal with two small white wings at the heel; rectangular black sunglasses; a small brown notebook with a pencil tucked in the spine |
| Fernbedienungen (1×5) | 1x5 grid: a cheap white plastic TV remote with a single red button; the same white remote with six round colored buttons; a gleaming golden luxury remote with jewel buttons; a worn grey 1990s TV remote with faded rubber buttons for volume, channel and mute and one red button at the top; the same grey remote seen from the back with the battery lid open and the compartment empty (Finale, Zündkapsel ohne Zelle) |

### Animationen von Max und Pixel

Diese Grundanimationen gelten für alle Welten. Weltspezifische Aktionen stehen in den Welt-Tabs.

| Figur | Aktion | Bilder | Ablauf | Motiv |
| --- | --- | --- | --- | --- |
| Max | Gehen | 8 | Schleife | `walking`: standing sprite of Max as input, slouching relaxed walk, hands stay in the hoodie pocket, head bobbing slightly, sneakers on one baseline, facing right |
| Max | Stehen | 4 | Schleife | `idle`: standing sprite of Max as input, slow breathing, one blink, weight shifts from one leg to the other, hands stay in the hoodie pocket, facing right |
| Max | Sprechen | 4 | Schleife | Max talking: mouth opens and closes, small open-hand gesture with the right hand, legs and torso stay still, facing right |
| Max | Aufheben | 6 | einmalig | Max bends down, reaches forward with the right hand, grabs something at floor level, straightens up again, facing right |
| Max | Benutzen | 6 | einmalig | Max reaches forward at chest height with the right hand, fiddles briefly, pulls the hand back, facing right |
| Max | Schulterzucken | 4 | einmalig | Max lifts both shoulders and palms, raises eyebrows, lowers them again, facing right |
| Max | Gähnen | 6 | einmalig | Max stretches arms up, mouth opens wide, eyes close, arms drop back into the hoodie pocket, facing right |
| Max | Auf dem Sofa | 4 | Schleife | Standbild A (Prolog, Welt 3): Max lying flat on a sofa in side view, head on the left armrest, holding his phone above his face with both hands, sneakers on the right armrest; Standbild B (Welt 4): Max slumped half lying on a sofa, remote in hand, feet up, facing right; Animation: slow blinking, thumb tapping the phone or clicking the remote |
| Max | Vom Sofa aufstehen | 8 | einmalig | Max swings his legs off the sofa, pushes himself up with both hands, stands, stretches, facing right (Prolog: danach Handy in die Bauchtasche; Finale: endet in der aufrechten Pose) |
| Pixel | Gehen | 8 | Schleife | `walking`: standing sprite of Pixel as input, about 26 pixels long, smug strut with tail held high, collar light stays visible, facing right |
| Pixel | Stehen | 4 | Schleife | `idle`: sitting sprite of Pixel as input, tail tip twitching, one slow blink, body stays still, facing right |
| Pixel | Schlafen | 4 | Schleife | Pixel curled up asleep, about 10 pixels high and 24 long, belly rising and falling, torn ear twitching once, facing right |
| Pixel | Putzen | 6 | Schleife | Pixel sitting, licks his front paw and wipes it over his ear, tail still, facing right |
| Pixel | Springen und Klettern | 6 | einmalig | Pixel crouches, wiggles his rear, leaps up about 30 pixels and lands on a ledge above, facing right (Prolog und Zwischenspiele auf die Werkbank, Welt 1 bis 3) |
| Pixel | Schnuppern | 4 | einmalig | Pixel stretches his neck forward, nose twitching, sniffs twice, pulls back, facing right (Welt 1 bis 3) |
| Pixel | Tragen | 8 | Schleife | Pixel walking sprite as input, smug strut with tail held high, a small object held in his mouth, head slightly raised, the object stays fixed in the mouth, facing right (Welt 1 bis 3, Rückkehr 3 und Finale mit der Zelle; nicht in Welt 4) |
| Pixel | Fauchen | 4 | einmalig | Pixel arches his back, fur bristles, mouth wide open hissing, then settles, facing right |
| Pixel | Ohrfeige | 4 | einmalig | Pixel jumps up and slaps with one front paw, lands again, smug face, facing right (Welt 3, blaue Pastille aus der Apothekendose mit grünem Kreuz) |
| Pixel | Vom Schrank fallen | 8 | einmalig | Pixel loses balance on top of a tall cupboard, flails all four legs, falls about 60 pixels, lands flat on the floor, dazed, facing right (Finale, Wohnzimmer) |

## Regeln

**Parodien:** Keine Namen aus Filmen, Spielen oder Serien in Prompts verwenden. Die Anspielung steckt im Verhalten, im Dialog und in einzelnen Ideen, nicht im Aussehen. Jede Parodiefigur bekommt ein eigenes Design, das sich in mindestens zwei sichtbaren Merkmalen vom Vorbild unterscheidet (Kleidung, Farbe, Frisur, Requisit). Welche Merkmale das sind, steht im Rechtscheck im Tab Konzept. Die Prompts in den Welt-Tabs sind so formuliert. Wenn ein Ergebnis einer bekannten Figur trotzdem zu ähnlich sieht, verwerfen oder deutlich umzeichnen.

**Dateinamen:** `welt_art_name_version.png`, zum Beispiel `w1_bg_taverne_v03.png`, `w0_chr_max_walk_v01.png`, `w2_itm_feigen_frisch_v01.png`. W0 steht für Prolog und Finale.

**Objekte nur zum Ansehen:** Jede Szene bekommt zwei bis vier Objekte ohne Rätselfunktion, die nur einen Kommentar von Max oder Pixel auslösen. Sie tragen viele Anspielungen und machen die Welt lebendig. Manche bereiten unauffällig das Finale vor (Fernbedienungen, Kochbuch). Sie gehören in den Hintergrund oder als einzelne Grafik darüber, nicht ins Inventar.

**KI-Protokoll:** Eine einfache Tabelle führen mit Dateiname, Werkzeug, Modell, Prompt und Grad der Nachbearbeitung (keine, wenig, stark). Damit lässt sich die KI-Angabe für Steam später ehrlich ausfüllen, und gute Prompts lassen sich wiederverwenden.

**Lizenzen:** Fremde Asset-Pakete in derselben Tabelle mit Quelle und Lizenz eintragen, damit die Credits vollständig sind.
