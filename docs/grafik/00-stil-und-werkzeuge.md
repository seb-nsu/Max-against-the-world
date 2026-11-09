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
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, strictly side view like a flat stage, back wall parallel to the picture plane, floor as a flat band in the lower third, humorous and whimsical, warm hand-painted look, 16:9, no text, no logos.
```

**HINTERGRUND** (`rd_plus__environment`, 320×180):

```text
Pixel art background, 320x180, strictly side view like a flat stage, back wall parallel to the picture plane, walkable floor as a flat band kept clear in the lower third, light from upper left, clean pixel clusters, no anti-aliasing, no characters, all signs, labels and book covers blank.
```

**FIGUR** (`rd_pro__default`, Menschen etwa 56 Pixel):

```text
Pixel art character sprite, exactly one character, full body, side view, about 56 pixels tall, dark colored outline, expressive cartoon face, transparent background.
```

**FIGUR-KLEIN** (Tiere und kleine Wesen, 12 bis 30 Pixel; Zahl im Motiv angeben):

```text
Pixel art small creature sprite, exactly one creature, full body, side view, dark colored outline, very readable silhouette, transparent background.
```

**FIGUR-GROSS** (große Wesen und Maschinen über 64 Pixel; Zahl im Motiv angeben):

```text
Pixel art large character sprite, exactly one character, full body, side view, fills most of the frame, dark colored outline, transparent background.
```

**PORTRÄT** (Dialog und Figurenwechsel, 64×64):

```text
Pixel art character portrait, head and shoulders, 64x64, three-quarter view facing right, expressive face, dark colored outline, transparent background.
```

**KARTE** (`rd_plus__topdown_map`, 320×180):

```text
Pixel art top-down illustrated travel map, 320x180, simple readable shapes, clearly separated clickable locations, no text.
```

**GEGENSTÄNDE** (`rd_plus__item_sheet`; Raster im Motiv angeben):

```text
Pixel art item sheet, items in reading order left to right, each item centered in its own cell at the same scale, about 24x24 pixels each, dark colored outline, transparent background, no text on any item.
```

**EFFEKT** (Bildfolge für Godot):

```text
Pixel art visual effect sprite sheet, frames in one horizontal row, transparent background, limited palette, no anti-aliasing.
```

**ANIMATION** (`rd_advanced_animation__custom_action` mit dem fertigen Standbild als Eingabe; Schema für das Motiv):

```text
[Figur] [Aktion in Phasen: Ausholen, Höhepunkt, Ende]. [Bildzahl] frames, [loops / plays once], facing [right/left], [was ruhig bleibt].
```

Für Gehen und Stehen reichen `rd_advanced_animation__walking` und `__idle` mit dem Standbild.

**Verbotenes** (Feld für Negativ-Prompt, falls vorhanden):

```text
text, letters, numbers, watermark, logo, blur, gradients, photorealism, 3D render, more than one character
```

### Steckbriefe der Hauptfiguren

Bei jedem Bild von Max oder Pixel wortgleich verwenden.

**Max** (Baustein FIGUR):

```text
Max, a lanky 16-year-old boy with messy brown hair falling into his eyes, sleepy half-closed eyes and a lopsided smirk, oversized dark charcoal grey hoodie with a tiny retro TV printed on the chest, dark blue jeans, worn red sneakers, hands often in his hoodie pocket.
```

**Pixel** (Baustein FIGUR-KLEIN, etwa 18 Pixel hoch):

```text
Pixel, a chubby light silver-grey tomcat with white chest and paws about 18 pixels tall, smug half-lidded eyes, a torn left ear, a fluffy grey tail, and a red collar with a small round silver speaker and a clearly visible two-pixel turquoise light on it.
```

Als Grundlage für Pixel eignet sich das kostenlose Pet Cat Pack von Luiz Melo (CC0): umfärben, Ohr, Halsband und die zwei Pixel große Leuchte ergänzen.

### Weltenübergreifende Gegenstände

Diese Gegenstände kommen in mehreren Welten vor. Einmal erzeugen und überall wiederverwenden.

| Sammelbild | Motiv |
| --- | --- |
| Reisegepäck (3×3) | 3x3 grid: a closed tin of tuna with a blue fish drawing on the label; the same tin opened with pink tuna inside; the same tin empty and shiny inside; a wooden cooking spoon with a crust of dried yellow cheese; a red-and-white striped woolen sock; a small clay jar of olive oil with a cork; a single golden sandal with two small white wings; rectangular black sunglasses; a small brown notebook with a pencil tucked in the spine |
| Fernbedienungen (1×4) | 1x4 grid: a cheap white plastic TV remote with a single red button; the same remote with six round colored buttons; a gleaming golden luxury remote with jewel buttons; a worn grey 1990s TV remote with faded rubber buttons |

### Animationen von Max und Pixel

Diese Grundanimationen gelten für alle Welten. Weltspezifische Aktionen stehen in den Welt-Tabs.

| Figur | Aktion | Bilder | Ablauf | Motiv |
| --- | --- | --- | --- | --- |
| Max | Gehen | 8 | Schleife | `walking`: slouching relaxed walk, hands in hoodie pocket, head bobbing slightly, facing right |
| Max | Stehen | 4 | Schleife | `idle`: slow breathing, one blink, weight shifts from one leg to the other, facing right |
| Max | Sprechen | 4 | Schleife | Max talking: mouth opens and closes, small open-hand gesture with the right hand, legs and torso stay still, facing right |
| Max | Aufheben | 6 | einmalig | Max bends down, reaches forward with the right hand, grabs something at floor level, straightens up again, facing right |
| Max | Benutzen | 6 | einmalig | Max reaches forward at chest height with the right hand, fiddles briefly, pulls the hand back, facing right |
| Max | Schulterzucken | 4 | einmalig | Max lifts both shoulders and palms, raises eyebrows, lowers them again, facing right |
| Max | Gähnen | 6 | einmalig | Max stretches arms up, mouth opens wide, eyes close, arms drop back into the hoodie pocket, facing right |
| Max | Auf dem Sofa | 4 | Schleife | Standbild: Max slumped half lying on a sofa, remote in hand, feet up; Animation: slow blinking, thumb clicking the remote |
| Max | Vom Sofa aufstehen | 8 | einmalig | Max swings his legs off the sofa, pushes himself up with both hands, stands, stretches, facing right (Finale) |
| Pixel | Gehen | 8 | Schleife | `walking`: smug strut with tail held high, facing right |
| Pixel | Stehen | 4 | Schleife | `idle`: sitting, tail tip twitching, one slow blink |
| Pixel | Schlafen | 4 | Schleife | Pixel curled up asleep, belly rising and falling, ear twitching once |
| Pixel | Putzen | 6 | Schleife | Pixel sitting, licks his front paw and wipes it over his ear, tail still |
| Pixel | Springen und Klettern | 6 | einmalig | Pixel crouches, wiggles his rear, leaps up and lands on a ledge above, facing right (Welt 1 bis 3) |
| Pixel | Schnuppern | 4 | einmalig | Pixel stretches his neck forward, nose twitching, sniffs twice, pulls back (Welt 1 bis 3) |
| Pixel | Tragen | 8 | Schleife | Variante von Gehen mit einem kleinen Gegenstand im Maul (Welt 1 bis 3, nicht in Welt 4) |
| Pixel | Fauchen | 4 | einmalig | Pixel arches his back, fur bristles, mouth wide open hissing, then settles |
| Pixel | Ohrfeige | 4 | einmalig | Pixel jumps up and slaps with one front paw, lands again, smug face (Welt 3, blaue Pille) |
| Pixel | Vom Schrank fallen | 8 | einmalig | Pixel loses balance on a high shelf, flails all four legs, falls, lands flat on the floor, dazed (Finale) |

## Regeln

**Parodien:** Keine Namen aus Filmen, Spielen oder Serien in Prompts verwenden. Die Anspielung steckt im Verhalten, im Dialog und in einzelnen Ideen, nicht im Aussehen. Jede Parodiefigur bekommt ein eigenes Design, das sich in mindestens zwei sichtbaren Merkmalen vom Vorbild unterscheidet (Kleidung, Farbe, Frisur, Requisit). Welche Merkmale das sind, steht im Rechtscheck im Tab Konzept. Die Prompts in den Welt-Tabs sind so formuliert. Wenn ein Ergebnis einer bekannten Figur trotzdem zu ähnlich sieht, verwerfen oder deutlich umzeichnen.

**Dateinamen:** `welt_art_name_version.png`, zum Beispiel `w1_bg_taverne_v03.png`, `w0_chr_max_walk_v01.png`, `w2_itm_feigen_frisch_v01.png`. W0 steht für Prolog und Finale.

**Objekte nur zum Ansehen:** Jede Szene bekommt zwei bis vier Objekte ohne Rätselfunktion, die nur einen Kommentar von Max oder Pixel auslösen. Sie tragen viele Anspielungen und machen die Welt lebendig. Manche bereiten unauffällig das Finale vor (Fernbedienungen, Kochbuch). Sie gehören in den Hintergrund oder als einzelne Grafik darüber, nicht ins Inventar.

**KI-Protokoll:** Eine einfache Tabelle führen mit Dateiname, Werkzeug, Modell, Prompt und Grad der Nachbearbeitung (keine, wenig, stark). Damit lässt sich die KI-Angabe für Steam später ehrlich ausfüllen, und gute Prompts lassen sich wiederverwenden.

**Lizenzen:** Fremde Asset-Pakete in derselben Tabelle mit Quelle und Lizenz eintragen, damit die Credits vollständig sind.
