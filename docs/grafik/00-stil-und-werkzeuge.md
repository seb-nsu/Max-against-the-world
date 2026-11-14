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
| Palette | Figuren, Gegenstände, Icons und Oberfläche: gemeinsame Palette „Endesga 32“ von Lospec (Welt-Zusatzfarben siehe unten). Hintergründe: je Raum 32 eigene Farben, beim Umwandeln in Retro Diffusion mit „Reduce colors“, 32 Farben, „Balanced“, Dithering None (Entscheidung 10. November 2026) | Endesga 32 hat zu wenige staubige Mitteltöne für die gemalten Konzeptbilder (Test Dachboden: grüner Sessel wurde braun, alles rotstichig). Einheitlich bleibt das Spiel über den gemeinsamen Konzept-Stil; Figuren in den Grundfarben heben sich ab. Vorbereitet, noch nicht angewendet (Prüfbericht, Fund 29): eine gemeinsame Raumpalette je Abschnitt mit 48 bis 64 Farben, damit die Räume eines Abschnitts Farben teilen. Maßstab ist der Dachboden. `python3 tools/pixelieren.py --palette-bestimmen prolog.hex bild1 bild2 …` bestimmt die Palette, `--palette prolog.hex` rechnet ein Bild darauf. Die sechs vorhandenen Hintergründe haben noch je 32 eigene Farben |
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
| Figuren | Gemini, dann `tools/figur.py sprite` | Baustein FIGURENBLATT, Max' Blatt anhängen | Eine Seitenansicht nach rechts auf Magenta; Claude stellt frei, rechnet auf Spielgröße und Palette um |
| Gehen von Menschen | Claude: 3D-Winkel | Meshy-Bewegung, `skripte/rig_gang2.py` (Grafiken\3d) | Nur für Figuren, die im Spiel sichtbar Strecke gehen. Das gemalte Sprite wird in Teilen nach den Beinwinkeln einer 3D-Bewegung gedreht; Figuren mit Robe per `saum_gang.py` |
| Posen und Szenenmomente | Gemini, dann Aseprite | Baustein POSENBOGEN, Blatt der Figur anhängen | Höchstens vier Schlüsselposen pro Bild auf Magenta; Zwischenbilder, Reden und kleine Bewegungen macht Claude in Aseprite. Tiere bleiben ganz gemalt |
| Gegenstände und Deko | Gemini, dann `tools/figur.py gegenstaende` | Baustein GEGENSTÄNDE oder OBJEKT | Sammelbild auf Magenta ohne Kästchen, Claude schneidet je Zelle aus und bringt auf 48×48 (Inventar) oder Weltgröße |
| Nahansichten und Tafeln | Gemini | Baustein NAHANSICHT | Füllt das ganze Bild, Schrift setzt Claude danach als Pixelschrift |
| Effekte | Claude in Godot oder Aseprite | – | Funken, Strahlen, Leuchten und Überblendungen aus vorhandenen Bildern; der Baustein EFFEKT nur, wenn das nicht reicht |
| Benutzeroberfläche | Claude in Aseprite | – | Rahmen und Knöpfe; Schrift immer von Hand |

**Stand 14. November 2026:** So ist Welt 1 entstanden. Retro Diffusion ist nur noch Ersatzweg, die Modellnamen `rd_…` in älteren Motiven sind Altlast. Vier Lehren aus Welt 1 stecken in den Bausteinen: Hintergrund einfarbig Magenta (#ff00ff), weil Gemini bei „transparent“ ein Schachbrett malt und ein grauer Hintergrund sich mit weißer und grauer Kleidung beißt; Sammelbilder ohne Kästchen um die Gegenstände; höchstens vier Posen pro Bild und „frozen still pose“, weil sonst Schlieren und Geisterfiguren entstehen; Posen immer mit dem Blatt der Figur als Vorlage, weil sie sonst in Haarfarbe und Kopfgröße abweichen (Review Welt 1, Fund 8).

**Zusätzliche Werkzeuge, geprüft am 11. November 2026.** Sebastian hat sechs Werkzeuge für Pixel Art vorgeschlagen. Gelesen sind die Beschreibungen, ausprobiert ist noch keins. Der Ablauf oben gilt weiter. Entschieden wird nach einem Test an Max (`offene-punkte.md`, P12).

| Werkzeug | Was es tut | Einschätzung |
| --- | --- | --- |
| [Pixel Snapper](https://github.com/Hugo-Dz/spritefusion-pixel-snapper) | Rückt erzeugte Pixel Art auf ein sauberes Raster und eine feste Palette; Kommandozeile, MIT-Lizenz | Ergänzt `tools/pixelieren.py`: das eigene Werkzeug für Hintergründe aus großen Bildern, Pixel Snapper für Figuren und Gegenstände mit krummen Pixeln |
| [Codixel](https://github.com/mankidev/codixel) | Anleitung für Claude: Bild in Pixel umrechnen, in Teile zerlegen, per Code bewegen | Für Bewegungen aus vorhandenen Teilen (Atmen, Blinzeln, Sprechen, einfaches Gehen) und für Effekte; neue Posen entstehen so nicht |
| [Agent Sprite Forge](https://github.com/0x0funky/agent-sprite-forge) | Macht aus einem Standbild ganze Bewegungssätze und exportiert für Godot; braucht einen Bild- und Video-Generator mit eigenem Zugang, jeder Clip kostet | Möglicher zweiter Weg neben den Animationsmodellen von Retro Diffusion; erst, wenn der Test an Max zeigt, dass er nötig ist |
| [pxl](https://github.com/crsolver/claude-pxl) | Pixel Art als Code | Nur für Kleines, das Claude selbst zeichnet: Symbole, Mauszeiger, Effekte |
| Hermes pixel-art (NousResearch) | Bild zu Pixel Art mit festen Paletten, dazu Regen oder Schnee als Video | Kein Gewinn gegenüber `tools/pixelieren.py`; das Video hilft nicht, das Spiel braucht Einzelbilder |
| pixel-plugin | Steuert ein Aseprite auf dem eigenen Rechner | Nur an Sebastians Rechner sinnvoll |

Nicht nötig ist das Humble-Bundle „Ultimate AI Image Toolkit“ (Distinct AI, nur Windows): Vektorgrafik und HDR helfen bei Pixel Art nicht, und Bilder erzeugen die Werkzeuge oben schon. Popochiu liest Aseprite-Dateien direkt ein und macht aus den benannten Abschnitten die Animationen einer Figur; Aseprite bleibt deshalb das Werkzeug für alles, was von Hand gezeichnet wird.

**Ablauf pro Szene:**

1. Konzeptbild mit ChatGPT oder Gemini, bis Aufbau und Stimmung passen. Fertig zusammengesetzte Prompts (Baustein, Motiv, Farb-Baustein, Skizzen-Satz) je Raum stehen in `grafik/fertige-prompts/` und werden mit `tools/prompts_zusammensetzen.py` aus den Grafik-Dateien erzeugt. Die Layout-Skizze des Raums (`grafik/skizzen/<abschnitt>/<raum>.png`, verlinkt in jeder Grafik-Datei unter „Szenen“) als Bild mitgeben und hinter den Prompt schreiben: „Use the attached sketch only for the position and size of objects and exits, not for style, colors or text. Leave the orange marked spots empty.“ Blaue Kästen gehören ins Bild, orange gestrichelte sind eigene Sprites, violette gestrichelte sind Figuren in ihrer Größe (auch eigene Sprites), grüne Ausgänge, die grauen Umrisse zeigen Max' Größe vorn und hinten. Die Skizzen erzeugt `tools/layout_skizzen.py` aus den Raum-Layouts neu. Für Welt 3 und 4 gibt es bisher nur automatische Raster und keine entworfenen Räume: Dort keine Skizze anhängen, die fertigen Prompts lassen den Satz weg. Vor dem Erzeugen dieser Hintergründe braucht jeder Raum eine Handskizze wie in Welt 1 und 2.
2. Prüfen und nachbessern statt neu zu erzeugen, je Fehler ein kurzer Satz im Baustein MASKE (nur die betroffene Stelle ändert sich, alles andere bleibt pixelgleich) (etwa „Make the wardrobe about 25 percent smaller.“). Prüfliste: Rückwand frontal, Boden frei und gut lesbar, Möbel klein genug (Max als Maßstab, 189 Pixel: Schrank etwa 180, Sessel etwa 90 Pixel nach dem Umwandeln), alle Hinweis-Motive wie beschrieben (Poster, Kalender), keine Schrift, keine Gegenstände, die eigene Sprites sind, keine Gesichter an Geräten.
3. Umwandeln: `python3 tools/pixelieren.py original.jpg w0_bg_raum_v01.png 640 360` (schneidet auf 16:9 zu, verkleinert kontrastbewusst nach dem k-Centroid-Verfahren, 32 eigene Farben, entfernt Streupixel). Einfacher: das Gemini-Original an Claude schicken. Ergebnis muss genau 640×360 Pixel und höchstens 32 Farben haben. Ersatzweg Retro Diffusion (Neural Pixelate, kostenlos höchstens 512 Pixel): in zwei Hälften zu 320×360 umwandeln, Reduce colors aus, danach gemeinsam auf 32 Farben bringen.
4. In Aseprite: Perspektive prüfen, Laufbereich frei lassen, störende Details und Schrift entfernen, Sprites (Gegenstände, die man nimmt) aus dem Bild malen. Die 32 Farben kommen schon aus dem Umwandeln; neue Pixel nur mit Farben aus dem Bild setzen.
5. Gegenstände der Szene als Sammelbild erzeugen und ausschneiden. Die fertigen Prompts dafür stehen in derselben Datei unter `grafik/fertige-prompts/` im Teil „Gegenstände“ (weltenübergreifende in `00-weltenuebergreifend.md`); keine Skizze anhängen. Die Figuren der Welt stehen dort unter „Figuren“ (Baustein FIGURENBLATT, Max' Blatt anhängen); `vertical-slice.md` reiht alle Prompts für Prolog und Welt 1 bis Rätsel 4 in Arbeitsreihenfolge auf.
6. Stimmigkeit prüfen: `python3 tools/stimmigkeit.py --kandidat neu.png` misst Helligkeit, Kontrast, Wärme und Sättigung gegen den Dachboden und die übrigen Räume; `--bogen bogen.png` legt alle fertigen Räume mit Max und Pixel nebeneinander. Gewollt dunkle oder kalte Räume bekommen im Layout `stimmung: dunkel` (oder `kalt`, `nacht` …).
7. In Godot einsetzen und mit Max als Platzhalter testen, ob Größen und Laufwege stimmen. Bei Boden mit Tiefe im Layout `tiefe: 0.85` eintragen (Ablauf in `game/README.md`, Abschnitt „Grafik ersetzen“).

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

**KONZEPT-AUSSEN** (ChatGPT oder Gemini, für Außenszenen wie Dorfplatz, Savanne, Hafen und Straßen; welche Szenen das sind, steht in jeder Grafik-Datei in der Zeile „Außenszenen“):

```text
Concept art for a 2D point-and-click adventure game in the style of classic 1990s adventure games, outdoor scene seen straight on like a wide stage, camera at the eye level of a standing person, horizon at about 40 percent of the image height, open walkable ground with gentle depth across the lower third kept free of objects except at the left and right edges, wide shot: a standing adult at the front edge would be about 52 percent of the image height, no top-down, bird's-eye or strong three-quarter view, no fisheye, every object drawn exactly as described and nothing added, signs and labels without any letters or numbers, light from the upper left with soft shadows to the lower right, humorous and whimsical.
```

**HINTERGRUND (Ersatzweg)** (`rd_plus__environment`, 640×360). Der Standardweg für Hintergründe ist ein Konzeptbild mit KONZEPT oder KONZEPT-AUSSEN in Gemini und danach `tools/pixelieren.py` (Ablauf pro Szene). Dieser Baustein gilt nur, wenn ein Hintergrund direkt in Retro Diffusion entsteht, und für die Nahansichten:

```text
Pixel art background, 640x360, front view with gentle one-point perspective, camera at eye level, back wall parallel to the picture plane, vanishing point in the center, side walls only as narrow angled strips at the edges, open walkable floor with gentle depth about 120 to 160 pixels high kept clear in the lower part, wide shot with small furniture: doors and tall cupboards about 180 pixels high, chairs about 90, tables about 81, objects exactly as described, no faces on objects, no loose pickable items, no letters or numbers anywhere, large objects only against the back wall or at the left and right edges, exits clearly readable, light from upper left with soft shadows to the lower right, clean pixel clusters, no anti-aliasing, no outlines, no characters, all signs, labels and book covers blank.
```

**FIGUR** (`rd_pro__default`, Menschen etwa 189 Pixel):

```text
Pixel art character sprite, exactly one character, full body, strict side view facing right unless the motif says left, about 189 pixels tall on a 256x256 canvas unless the motif gives another height, feet on the bottom edge, dark colored outline (not pure black), light from upper left, expressive cartoon face, flat colors without gradients, plain transparent background, no ground shadow.
```

**FIGUR-KLEIN** (Tiere und kleine Wesen, 29 bis 110 Pixel; Zahl im Motiv angeben):

```text
Pixel art small creature sprite, exactly one creature, full body, strict side view facing right unless the motif says left, height in pixels as given in the motif on a 128x128 canvas, dark colored outline (not pure black), light from upper left, very readable silhouette, flat colors, plain transparent background, no ground shadow.
```

**FIGUR-GROSS** (große Wesen und Maschinen über 216 Pixel, höchstens 340; Zahl im Motiv angeben):

```text
Pixel art large character sprite, exactly one character, full body, strict side view facing right unless the motif says left, height in pixels as given in the motif on a canvas up to 352x352, fills most of the frame, dark colored outline (not pure black), light from upper left, flat colors, plain transparent background, no ground shadow.
```

**FIGURENBLATT** (Konzeptbild für Gemini, seit 12. November 2026 der Weg für alle Nebenfiguren): Max' Konzeptblatt als Stilvorlage anhängen. Ergebnis ist eine einzige Seitenansicht nach rechts; daraus macht `tools/figur.py sprite` das Sprite, Gehen und Reden entstehen per Code. Die Größe steht im Prompt relativ zu Max (189 Pixel = 100 Prozent), damit alle Figuren zueinander passen. Der letzte Satz des Bausteins kam am 13. November 2026 dazu: Bei Humbert, Gollo, Zauberstabmacher und Minka hatte Gemini Köpfe, Beine und Schuhe aus Max' Blatt mitgemalt:

```text
Character concept sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one character, full body, strict side view facing right, standing on a flat baseline, legs clearly visible. Draw only this new character: do not copy any heads, legs, shoes or other parts of the boy Max from the attached sheet into the image.
```

Seit 14. November 2026 Magenta statt Hellgrau (Begründung oben unter „Stand 14. November 2026“). Zweite Fassungen einer Figur („Second version: …“) im selben Chat aus dem fertigen Bild ableiten; die fertigen Prompts stellen sie als eigenen Block darunter.

**POSENBOGEN** (Gemini, für Schlüsselposen von Figuren und Tieren; das fertige Konzeptblatt der Figur anhängen, bei Max sein Figurenblatt; danach im selben Chat einzelne Posen nachbessern lassen):

```text
Pose sheet in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The poses side by side in one row, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose, no motion blur, no ghosting, no speed lines, no duplicated limbs. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow, no frames or panels.
```

**OBJEKT** (Gemini, einzelne große Objekte und Deko in Weltgröße; Max' Blatt als Maßstab anhängen):

```text
Single prop concept in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, same light from upper left, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no text, no ground shadow. Exactly one object, complete and not cropped, strict side view, standing on a flat baseline, no people or animals unless the motif names them. Draw only this object: do not draw the boy Max or anything else from the attached sheet.
```

**PORTRÄT** (Dialog und Figurenwechsel, 128×128):

```text
Pixel art character portrait, head and shoulders, 128x128, three-quarter view facing right, expressive face, same colors as the character's sprite, dark colored outline, light from upper left, plain transparent background, no hands, no text.
```

**KARTE** (Gemini, 640×360, danach `tools/pixelieren.py` wie ein Hintergrund; nichts anhängen):

```text
Illustrated travel map for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, seen straight from above, simple readable shapes, clearly separated clickable locations with generous space between them, light from upper left, no text, no letters, no labels, no compass rose with letters.
```

**GEGENSTÄNDE** (Gemini; Raster im Motiv angeben; Max' Blatt als Stilvorlage anhängen):

```text
Item sheet in exactly the same style as the attached character sheet of the boy Max: same line weight, same flat cel shading, light from upper left. Grid exactly as given in the motif, items in reading order left to right and top to bottom, each item complete and centered in its own invisible cell at the same scale, generous empty space between items, slight front-side view, items floating freely on a solid flat magenta (#ff00ff) background filling the whole image, no tiles, boxes, frames, panels or cell borders, no checkerboard, no ground shadow, no text, letters or numbers on any item. Do not draw the boy Max.
```

**NAHANSICHT** (Gemini, 640×360; nichts anhängen; die Schrift setzt Claude danach von Hand):

```text
Close-up illustration for a 2D point-and-click adventure game in the style of classic 1990s adventure games, warm hand-painted look, 16:9, 640x360, the object fills the whole frame, no floor, no characters, light from upper left. No text, no letters, no numbers, all lines and fields left blank.
```

**EFFEKT** (nur, wenn Claude den Effekt nicht aus vorhandenen Bildern bauen kann):

```text
Visual effect frames for a 2D game, frames side by side in one row, evenly spaced, frame count as given in the motif, every frame the same size with the effect centered, flat cel shading, solid flat magenta (#ff00ff) background filling the whole image, no checkerboard, no frames or panels, no text.
```

**ANIMATION** (Altlast aus der Zeit mit Retro Diffusion; seit 14. November 2026 ersetzt durch den Baustein BEWEGUNG unten. Die Spalten „Bilder“, „Ablauf“ und „Motiv“ der Animations-Tabellen bleiben die Quelle, das Werkzeug baut daraus das Bewegungsraster):

```text
[Ausgangsbild: Figur und Pose]. [Aktion in Phasen: Ausholen, Höhepunkt, Ende]. [Bildzahl] frames, [loops / plays once], facing [right/left], [was ruhig bleibt], same size, colors and outline as the input sprite, feet stay on the same baseline.
```

**Verbotenes** (Feld für Negativ-Prompt, falls vorhanden; bei Karte und Reisetasche „top-down view“ weglassen, bei Hintergründen „more than one character“ durch „characters, people“ ersetzen. ChatGPT und Gemini haben kein solches Feld; die fertigen Prompts schreiben die Verbote deshalb als eigene Zeile NEGATIVE ans Ende, Bausteine NEGATIV-… unten):

```text
text, letters, numbers, watermark, logo, signature, blur, gradients, anti-aliasing, photorealism, 3D render, isometric view, top-down view, bird's-eye view, strong three-quarter view, fisheye, steep tilted floor, pure black outlines, drop shadow, cropped feet, more than one character
```

### Methode seit 14. November 2026: Raster, feste Beschreibungen, Masken, Shotliste

Sebastian hat am 14. November 2026 ein Prompt-Paket für KI-Animationsfilme geteilt. Übernommen ist die Methode, nicht der flache Storytime-Look; Videogeneratoren bleiben für Sprites außen vor, weil sie keine feste Palette und keine sauberen Schleifen liefern. Fünf Regeln gelten für alle Prompts, die noch nicht erzeugt sind. `tools/prompts_zusammensetzen.py` setzt sie um, die fertigen Prompts in `fertige-prompts/` folgen ihnen:

1. **Raster mit Feldern.** Jeder fertige Prompt ist in beschriftete Zeilen geteilt: STYLE (Baustein), SCENE oder SUBJECT (Motiv), PALETTE (Farb-Baustein mit Hex-Ankern), LAYOUT (Skizzen-Satz), bei Bewegungen ACTION, END POSE und CAMERA, am Ende immer NEGATIVE. Gemini liest die Felder zuverlässiger als einen langen Satz, und eine Korrektur trifft genau ein Feld.
2. **Feste Beschreibung, Wort für Wort.** Max, Pixel und Opa haben je einen Block FEST mit Hex-Farben aus dem fertigen Sprite (unten). Jeder Prompt, in dem eine der drei Figuren vorkommt, enthält diesen Block unverändert als „CHARACTER LOCK“. Was das Motiv abweichend sagt (barfuß, nass, als Ente), gilt vor dem Block. Bei allen anderen Figuren übernimmt jeder Posen- und Bewegungs-Prompt das Motiv aus der Figuren-Tabelle wortgleich, wenn die Figur dort steht.
3. **Figurenbogen als einzige Quelle.** Für Max, Pixel und Opa gibt es je einen Bogen mit vier Ansichten und sechs Ausdrücken (Baustein FIGURENBOGEN, fertige Prompts in `fertige-prompts/01-figurenboegen.md`). Ist er freigegeben, wird er an jeden Prompt dieser Figur angehängt statt der Einzelbilder. Nebenfiguren bleiben beim Figurenblatt mit einer Seitenansicht; mehr braucht das Spiel nicht.
4. **Masken statt neu erzeugen.** Ein Fehler in einem fertigen Bild wird mit dem Baustein MASKE behoben: Nur die markierte Stelle ändert sich, alles außerhalb bleibt gleich. Zweite und dritte Fassungen (Zustände) entstehen genauso aus dem fertigen Bild. ChatGPT hat dafür ein Auswahlwerkzeug; in Gemini die Stelle mit Lage und Gegenstand beschreiben („only the wardrobe door at the right edge“).
5. **Shotliste, Freigabe, Stapel.** Jede Datei in `fertige-prompts/` beginnt mit einer Shotliste mit fester Nummer je Bild (W2-R03 ist der dritte Raum in Welt 2, F Figur, P Posenbogen, B Bewegung, G Gegenstände, N Nahansicht, K Figurenbogen). Ablauf: Sebastian gibt die Liste eines Abschnitts frei, dann werden die Bilder im Stapel erzeugt, und bei einer Korrektur wird nur der betroffene Shot nachgebessert oder neu erzeugt, die anderen bleiben. Die Spalte „Stand“ prüft das Werkzeug selbst: Liegt das Bild schon in `game/grafik/`, steht dort „im Spiel“.

**FIGURENBOGEN** (Gemini; den bisherigen Figurenbogen oder das fertige Sprite der Figur anhängen; die Ansichten und Ausdrücke stehen beim Block FEST der Figur):

```text
Character reference sheet in exactly the same style as the attached image: same line weight, same flat cel shading, same light from upper left. The character must match the attached image exactly: same face, head size, body proportions, hairstyle, clothing, colors and accessories; do not redesign anything. Solid flat magenta (#ff00ff) background filling the whole image, no checkerboard. Two clearly separated rows with generous empty space between all figures. Top row: exactly four full-body views of equal size standing on one flat baseline, in this order from left to right: (1) front view facing the viewer, (2) strict side view facing left, (3) back view facing away from the viewer, (4) strict side view facing right. The same neutral pose in all four views, identical height in all views, feet fully visible. Bottom row: exactly six head-and-shoulders portraits of the same character in three-quarter view facing right, all the same size, in the order given below. Each expression clearly different while face shape, eyes, eyebrows, nose, hair and colors stay identical.
```

**MASKE** (Korrektur oder zweite Fassung aus einem fertigen Bild; das Bild anhängen oder im selben Chat bleiben; in eckigen Klammern die Stelle und die Änderung einsetzen):

```text
Edit the attached image. Change only the marked area: [where, for example "the wardrobe door at the right edge"]. Inside that area: [the change, one short sentence]. Everything outside that area stays pixel-identical: same camera, framing, perspective, composition, colors, light, line weight and style. Do not redraw, recolor, move, crop or add anything else.
```

**BEWEGUNG** (Gemini, Schlüsselposen für eine Animation; das Figurenblatt oder den Figurenbogen anhängen; das Werkzeug füllt die Felder aus der Animations-Tabelle):

```text
Key pose sheet for a 2D game animation in exactly the same style, colors and proportions as the attached character sheet: same character, same head size, same hair and clothing colors, same line weight and flat cel shading, light from upper left. The key poses side by side in one row from left to right in the order of the action, evenly spaced with clear empty space between them, all at the same scale on one flat baseline, each a frozen still pose. Solid flat magenta (#ff00ff) background filling the whole image.
```

**NEGATIV-RAUM** (letzte Zeile jedes Raum-Prompts):

```text
no characters, people or animals in the walkable area, no text, letters, numbers or logos, no faces or robot features on objects, no loose objects that can be picked up, no objects that are not described, no top-down, bird's-eye or fisheye view, no tilted floor, no photorealism, no 3D render, no blur, no watermark
```

**NEGATIV-FIGUR** (letzte Zeile jedes Figuren-, Bogen- und Posen-Prompts):

```text
no second character, no parts of the boy Max from the reference unless this is Max, no props that are not described, no environment, no floor, no ground shadow, no checkerboard, no frames, panels or cell borders, no text, labels or numbers, no motion blur, no ghosting, no duplicated or extra limbs, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

**NEGATIV-BEWEGUNG** (zusätzlich bei Bewegungen und Posenbögen):

```text
no in-between blur, no speed lines, no smear frames, no sliding feet, no change of scale or baseline between poses, no camera movement, no zoom, no perspective change, no morphing, no extra poses beyond the ones listed
```

**Farb-Anker** (Hex-Werte hinter jedem Farb-Baustein, als Orientierung; verbindlich bleibt die Reduktion auf 32 Farben beim Umwandeln. Schlüssel wie in den Farb-Tabellen der Grafik-Dateien, leer heißt der einzige Farb-Baustein der Datei):

| Datei | Schlüssel | Anker |
| --- | --- | --- |
| 02-prolog-und-finale |  | dusty brown #733e39, warm wood #b86f50, lamp orange #f77622, pale yellow #ead4aa, warm shadow #3e2731 |
| welt-1 |  | lush green #63c74d, deep green #3e8948, warm gold #feae34, sky blue #0099db, cream #ead4aa |
| welt-1 | düster | violet #68386c, slate grey #5a6988, pale green #63c74d, torch orange #f77622, deep shadow #262b44 |
| welt-1 | bergwerk | earthy brown #733e39, dark brown #3e2731, mossy green #265c42, warm gold #feae34, torch orange #f77622 |
| welt-2 | Ägypten | sand #e4a672, ochre #d77643, gold #feae34, turquoise water #2ce8f5, pale sand #ead4aa |
| welt-2 | Ägypten innen | sandstone #e4a672, ochre #d77643, gold #feae34, painted red #be4a2f, cool shade #5a6988 |
| welt-2 | Griechenland | marble white #ffffff, light grey #c0cbdc, olive green #3e8948, deep sky blue #0099db, sea blue #124e89 |
| welt-2 | Römische Touristen (nur Figuren) | terracotta red #be4a2f, imperial purple #68386c |
| welt-3 | Realität (Unterstadt) | deep navy #181425, wet asphalt #262b44, concrete grey #3a4466, neon magenta #ff4fd8 and #b0207a, neon cyan #3ff7ff and #0099db |
| welt-3 | Simulation | clean grey #c0cbdc, white #ffffff, flat sky blue #0099db, faint green tint #63c74d, soft green shadow #3e8948 |
| welt-3 | Realität innen | deep navy #181425, concrete grey #3a4466, damp blue-grey #5a6988, neon magenta #ff4fd8, neon cyan #3ff7ff |
| welt-3 | Simulation innen | clean grey #c0cbdc, white #ffffff, faint green tint #63c74d, pale wood #e4a672 |
| welt-3 | Labor | white panels #ffffff, light grey #c0cbdc, cold grey #8b9bb4, warning orange #f77622 |
| welt-4 | Testbild und Rauschen | bar yellow #fee761, bar cyan #2ce8f5, bar magenta #b55088, bar red #e43b44, bar blue #124e89, static grey #8b9bb4 |
| welt-4 | Glücksrad-Shopping | gold #feae34, hot pink #b55088, spotlight white #ffffff, deep stage purple #68386c |
| welt-4 | Küchen-Sitcom | pastel yellow #fee761, mint #63c74d, peach #e8b796, warm white #ead4aa |
| welt-4 | Tiertort Savanne | ochre grass #e4a672, acacia green #3e8948, evening orange #f77622, dusk red #be4a2f |
| welt-4 | Mitternachts-TV | deep purple #68386c, night violet #262b44, toxic green #63c74d, moon white #c0cbdc |
| welt-4 | Mitternachts-TV innen | deep purple #68386c, night violet #262b44, toxic green #63c74d, cobweb grey #8b9bb4 |
| welt-4 | Comic-Kanal | primary red #e43b44, primary blue #0099db, primary yellow #fee761, outline black #181425 |
| welt-4 | Senderzentrale | black marble #181425, gold trim #feae34, monitor blue #2ce8f5, steel grey #5a6988 |
| welt-4 | Kindersendung 1977 | washed-out orange #d77643, brown #733e39, mustard #feae34, faded cream #ead4aa |

Die Neon-Töne in Welt 3 (#ff4fd8, #b0207a, #3ff7ff) sind die Zusatzfarben aus „Zusatzfarben pro Welt“ oben; alle übrigen Werte stammen aus Endesga 32.

### Feste Beschreibungen der Hauptfiguren

Bei jedem Bild von Max, Pixel oder Opa wortgleich verwenden, als Zeile „CHARACTER LOCK“. Die Hex-Werte sind aus den fertigen Sprites im Spiel gemessen (`game/grafik/figuren/`, 14. November 2026), nicht aus den ersten Konzepten; wo beide abweichen, gilt das Sprite. Unter jedem Block stehen die vier Ansichten und sechs Ausdrücke für den Figurenbogen.

**FEST Max** (189 Pixel, Maßstab aller Figuren):

```text
Max, a lanky 16-year-old boy, the reference height for every other character, head about a quarter of his height, slight slouch with hanging shoulders. Messy dark brown hair (#733e39, shadow #3e2731, highlight #b86f50) with shaggy strands falling over his forehead and eyes. Fair skin (#e8b796, shadow #c28569), sleepy half-closed eyes, lopsided smirk, a few freckles. Oversized dark slate blue-grey hoodie (#3a4466, shadow #262b44, highlight #5a6988), hood down, sleeves partly over his hands, uneven drawstrings, a tiny retro TV print with a turquoise screen (#2ce8f5) on the chest. Dark blue jeans (#124e89) slightly too long and rolled up at the hem. Worn red sneakers (#e43b44, shadow #a22633) with white soles (#ffffff), one lace untied. Dark outline #262b44, never pure black.
```

**BOGEN Max:** Neutral pose: standing slouched, both hands in the hoodie pocket. Expressions: (1) tired, half-closed eyes, lopsided smirk; (2) annoyed, one eyebrow raised; (3) surprised, eyes wide open, mouth open; (4) puzzled, head tilted, mouth pulled to one side; (5) rare genuine smile, eyes open; (6) determined, eyes open, jaw set.

**FEST Pixel** (61 Pixel im Sitzen):

```text
Pixel, a chubby round tomcat about a third of Max's height when sitting, short legs, light silver-grey fur (#c0cbdc, shadow #8b9bb4, highlight #ffffff) with three darker blue-grey stripes on his back (#5a6988), white chest and four white paws (#ffffff), a very fluffy tail, a clearly visible notch torn out of his left ear, smug half-closed amber eyes (#feae34), pink nose and inner ears (#f6757a), a red collar (#e43b44, shadow #a22633) with a small round silver speaker on the front and a clearly visible turquoise light (#2ce8f5). Not orange, no tabby markings on the face, plain unmarked forehead, no heavy eyelids. Dark outline #262b44, never pure black.
```

**BOGEN Pixel:** Neutral pose: sitting upright with chin raised, fluffy tail wrapped around his paws (all four views sitting). Expressions: (1) smug, half-lidded eyes, chin raised; (2) horrified, ears flat, eyes wide; (3) greedy, eyes huge, tongue tip out; (4) offended, head turned away, eyes closed; (5) startled, fur standing up, ears back; (6) blissful, eyes closed, small smile.

**FEST Opa** (201 Pixel):

```text
Grandpa Konrad, a tall thin old inventor about 106 percent of Max's height, stooped forward from the shoulders, knees slightly bent, long thin legs. Wild white hair (#ffffff, shadow #8b9bb4) standing up in tufts, bushy white eyebrows, long nose, big enthusiastic grin, fair wrinkled skin (#e8b796, shadow #c28569). Round brass goggles (#feae34) on a dark strap (#3e2731) pushed up on his forehead. A rust-brown knitted cardigan (#b86f50, shadow #8b5f4b) hanging to the hips, with two rows of bulging pockets stuffed with screwdrivers and pliers (#262b44). Loose light beige trousers (#e8b796, shadow #c28569). Dark red slippers (#e43b44, shadow #a22633). No lab coat, no tie, no beard. Dark outline #181425.
```

**BOGEN Opa:** Neutral pose: standing stooped, arms hanging loosely, slight grin. Expressions: (1) enthusiastic grin, one finger raised as if explaining; (2) panic, eyes wide, hair standing up even more; (3) focused tinkering, squinting, tongue tip out; (4) puzzled frown, one eyebrow down; (5) sheepish guilty smile; (6) touched, eyes glistening, warm smile.

Opas Strickjacke ist im Spiel rostbraun und die Hausschuhe einfarbig rot; das ältere Motiv mit „brown knitted cardigan“ und „red-and-white checkered slippers“ in `02-prolog-und-finale.md` ist damit überholt (Sebastian, 12. November 2026: Schuhe ergänzt). Posen und Bewegungen von Opa nehmen immer diesen Block, damit sein Körper nicht mehr zwischen den Bögen wechselt.

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
