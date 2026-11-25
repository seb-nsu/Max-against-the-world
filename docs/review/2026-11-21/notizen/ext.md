# Notiz `ext`: Externe Quellen und Werkzeuge (Animationen, Synfig, Lippensync, Musik)

- **Rolle:** Prüfer `ext` im Komplett-Review vom 21.11.2026 (Fortsetzung in der Cloud, 25.11.2026).
- **Umfang:** vier Fragen von Sebastian: (1) Animationen gegen externe Quellen (Aseprite-Community, itch.io kostenlos und kostenpflichtig, OpenGameArt, Meshy-Bibliothek), (2) Synfig Studio, (3) Lippensynchronisierung (reicht der Bestand, Rhubarb o. Ä., Audio2Face?), (4) Musik mit ACE-Step 1.5.
- **Geprüfter Stand:** Branch `claude/project-thread-me923s` (= `main` auf `04c5a79f` plus Review-Dateien); Audio-Plan zusätzlich lesend von `origin/claude/project-thread-hfwol7`.
- **Wie geprüft:** Repo gelesen (Doku, Sprite-Bestand, `cq_figur.gd`, Gesten-Skripte, Kandidatenlisten der Welt-Prüfer), danach Netzrecherche. Jede Angabe zu Preis, Lizenz, Version, Hardware stammt von einer am 25.11.2026 abgerufenen Seite (URL im Quellenverzeichnis). Was sich nicht auf einer Seite bestätigen ließ, ist als „nicht bestätigt“ markiert.
- **Nicht getan (Auftrag):** nichts gekauft, nirgends angemeldet, keine Assets geladen, nichts außerhalb von `docs/review/2026-11-21/` geändert.

Stand der Notiz: in Arbeit (Kapitel folgen blockweise).

## 0. Ausgangslage aus dem Repo

### 0.1 Wie die Animationen heute aussehen (gemessen am 25.11.)

- **81 Figuren-Sheets** unter `game/grafik/figuren/` mit Daten in `game/daten/figuren/<id>.json` (Bildgröße, je Bewegung `von`, `bilder`, `ms`, wahlweise `folge`). Geladen in `game/skripte/objekte/cq_figur.gd` Z. 240–310: ein `Sprite2D` mit `hframes`/`vframes`, je Bewegung eine `Animation` mit einer diskreten Spur auf `Sprite2D:frame`. Es gibt keine Knochen, keine Teile, keine Zwischenwerte zur Laufzeit.
- **Größe und Stil:** gemalte, danach pixelierte Figuren in Seitenansicht, **nicht** klassische kleine Pixel-Art. Menschen sind im Sheet etwa 180 bis 220 px hoch (Max 193, Opa 209, Deckert 217, Waldemar 288, M.U.T.T.I. 344), Pixel 103, Minka 63, Huhn 48. Zellbreite bis 346 px (XXL-Ziege). Das Max-Sheet ist 16.240 px breit.
- **Stand, Gang, Reden** (aus den JSON-Dateien): `idle` meist 4 Bilder × 320 ms (Welt 3: 2 Bilder), `walk` 8 Bilder × 35–100 ms bei 22 Figuren (Opa, Waldemar, Ziegen 12; Minka 16), `talk` 2 bis 9 Bilder × 110–160 ms.
- **Effekte:** 125 Bögen unter `game/grafik/ambiente/` als waagrechte Streifen, klein: Fackel 8 Bilder zu 10 × 26 px, kleine Fackel 5 × 12, Funken 192 × 20 gesamt, Esse 8 Bilder zu 64 × 81, Staubwolke 115 × 48 gesamt. Abgespielt über `cq_ambiente.gd` (`bilder`, `fps` in `tools/layout/*.yaml`).

Das ist für Kapitel 1 entscheidend: Fertige Pixel-Art-Pakete aus dem Netz sind fast alle für Figuren von 16 bis 64 px gebaut, mit harter Kontur und wenigen Farben. Sie sind um den Faktor 3 bis 10 kleiner und anders gezeichnet als die Figuren des Spiels.

### 0.2 Bedarfsliste (aus `pr-p.md`, `pr-w1.md`, den Animations-Notizen vom 17.11. und 20.11.; `pr-w2`/`pr-w3` liefen noch)

| Nr. | Figur oder Objekt | Bewegung | Stand heute | Was fehlt | Art des Mangels |
| --- | --- | --- | --- | --- | --- |
| B1 | Pixel (Kater), Minka, Hofkater, schwarze Katze | Gehen von der Seite | Pixel `walk` 8 Bilder × 30 ms, gemalt; Beine nur wenige Pixel lang, Bewegung kaum lesbar; Pixel im Ziegenfell: `walk` = Standbilder, `gehen` schwankt in der Höhe | Schrittfolge eines Vierbeiners (welches Bein wann), Wippen von Rücken und Kopf, Schwanz als Nachlauf | Vorlage für Posen und Timing |
| B2 | Schmiede-Ziege, XXL-Ziege | Gehen von der Seite | 12 Bilder; XXL-Ziege schwankt 223–244 px (9 %) | saubere Fußlinie, Schrittfolge | Vorlage plus Nacharbeit im eigenen Werkzeug |
| B3 | Menschen (22 mit `walk`) | Gehen | Meshy-Clip plus Teile-Rig, 8 Bilder; funktioniert | nur Sondergänge: Hinken (Tempo passt nicht, AN-08 vom 20.11.), Hermes-Joggen rutscht (AN-10 vom 17.11.) | Abstimmung Tempo, kein Asset |
| B4 | alle redenden Figuren | Reden, Mund | `talk`-Schleife mit 2–9 Bildern, läuft unabhängig vom Ton (Kapitel 3) | lautabhängiger Mund; bei vier Welt-3-Figuren fehlt der Mund ganz (AN-05 vom 20.11.) | Verfahren, kein Asset |
| B5 | Fackeln, Esse, Kessel-Feuer | Feuer-Schleife | 8 Bilder, 5 bis 64 px breit; laut `offene-punkte.md` nach dem Umrechnen blass | kräftigere Flamme, Glut, Rauchfahne | Asset denkbar (klein, stilneutral) |
| B6 | Smaugi | Rauch aus den Nüstern, Atmen | 4 Bilder Stand | Rauch-Schleife, Atem 8 Bilder | Effekt als Asset denkbar, Atem per Code |
| B7 | Schwan, Brunnen, Fußbad, Melken | Wasserring, Spritzer, Milchstrahl | Schwan steht, Fußbad 2 Bilder | Wasser-Schleifen 4–6 Bilder | Asset denkbar |
| B8 | Schmied, Zapp-O-Mat, Zauber (Moderwort, Verwandlung), Niesrosen-Pollen | Funken, Blitz, Magie, Staub-/Pollenwolke | `funken`, `effekt_verwandlung`, `effekt_staubwolke` vorhanden, klein | größere, weichere Schleifen; Einsaug-Effekt der Abreise | Asset denkbar, Einsaugen per Code (Verformung) |
| B9 | Max | Greifen/Aufheben, Hinknien, Laute spielen, Treppe | `aufheben` 7, `benutzen` 7, `treppe_walk` 17 vorhanden; Hinknien und Laute fehlen | 4–6 Bilder je Geste in Seitenansicht, 190 px | Meshy-Clip als Vorlage |
| B10 | Pixel | Aufwachen, Springen, Fressen | `aufwachen` 3, `springen` 7 mit springender Flugbahn | Zwischenposen, Flugkurve im Code | Vorlage (Katzensprung), Malen |
| B11 | Huhn Berta, Besen | Flattern, Fege-Lauf | `walk` = Standbilder | 4–6 Bilder | Vorlage oder Malen |
| B12 | Waldemar | Musical, Fußbad | 3 bzw. 2 Bilder | Tanzschleife 8–12 Bilder, Notenblasen | Meshy-Tanzclip als Vorlage, Noten als Effekt |

**Wichtige Einordnung:** Der größere Teil der Animationsfunde der drei Reviews ist kein Mangel an Bildern, sondern am Einbau: gebaute, aber nie aufgerufene Bewegungen (z. B. 14 Effektfolgen und die Kapsel-Bewegungen in Welt 3, Pixels `ohrfeige`, Schmied `abschrecken`), Größen- und Fußliniensprünge zwischen Stand und Geste (2 bis 6 px, bis 22 % Größe), Standpunkte der Figuren ineinander. Dagegen hilft kein Kauf. Fremde Quellen können nur bei B1/B2 (Vorlage), B5–B8 (Effekte) und B9–B12 (Bewegungsvorlagen) etwas beitragen.

## Recherchestand (Rohfassung, 25.11., 14:45 UTC; wird unten in die Kapitel eingearbeitet)

Alles hier ist am 25.11.2026 von der genannten Seite abgerufen.

**Meshy (für Kapitel 1):**
- Die Bibliothek hat laut https://www.meshy.ai/animation-library **779 Animationen in 6 Kategorien**: Walk & Run 160, Daily Actions 155, Fighting 149, Body Movements 155, Dancing 33, **Quadruped 127**. Tiere: Dog, **Cat**, Horse, Wolf, Fox, Rabbit, Deer, Fawn, Leopard, **Cow**, Sea Turtle. 149 Animationen frei, der Rest „Pro“. Kommerzielle Nutzung ab Meshy Pro („free-tier output is for personal and evaluation use“). Export FBX und GLB.
- Die Rigging-API kennt `animation_type: quadruped` („a four-legged animal“), ein Vierbeiner-Rig „costs the same as a biped rig“ (https://docs.meshy.ai/api/rigging.md). Vierbeiner-Clips laufen auf jedem Vierbeiner-Rig; Bewegung nach Text (`motion_task_id`) geht nur mit Zweibeinern (https://docs.meshy.ai/en/api/animation).
- **Das widerspricht dem Stand im Repo** (`docs/quellen.md`: „Keine Vierbeiner“; `docs/lessons-learned.md` Abschnitt 1: „Meshy riggt keine Vierbeiner“). Der Weg „Meshy-Clip plus Teile-Rig“ steht damit auch für Pixel, Minka, Hofkater, Ziegen (Cow/Deer als nächster Verwandter), Schildkröte offen.
- Zweibeiner-Clips, die zur Bedarfsliste passen (Namen aus https://docs.meshy.ai/api/animation-library): `Injured_Walk`, `Unsteady_Walk`, `Climb_Stairs`, `Fast_Stair_Climb`, `Kneel_on_One_Knee_and_Stand`, `Male_Bend_Over_Pick_Up`, `Female_Crouch_Pick_Up_Place_Side`, `Sit_to_Stand_Transition_M/F`, `Stand_Up1`–`10`, `Talk_Passionately`, `Talk_with_Hands_Open`, `Talk_with_Left_Hand_Raised`, `Stand_Talking_Angry`, 15 Tänze (u. a. `FunnyDancing_01`–`03`). Nicht gefunden: Gitarre/Laute, Singen, Zeigen, Überreichen.
- Hinweis: Modell `meshy-7` wird für 3D-Erzeugung am 31.12.2026 abgeschaltet, `lowpoly` am 30.10.2026 (https://docs.meshy.ai/en/api/animation).

**Synfig (für Kapitel 2):**
- Lizenz GPL-3.0, 12.549 Commits, 566 offene Issues, Finanzierung über Open Collective (https://github.com/synfig/synfig).
- Letzte **stabile** Version 1.4.5 vom 19.05.2024 (https://www.synfig.org/category/releases/stable-releases/); letzte **Entwicklungs**-Version 1.5.4 vom 18.01.2026 (https://www.synfig.org/2026/01/18/synfig-studio-1-5-4-released/).
- Kommandozeile `synfig` mit `-t` (Ziel), `-w`, `-h`, `-a` (Antialias 1–30), `-Q`, `--begin-time`, `--end-time`, `--fps`, `-o`, `-c` (https://wiki.synfig.org/Synfig_CLI_syntax).
- Knochen für Rasterbilder: „Skeleton Deformation Layer“ verzerrt das gerenderte Bild darunter über ein Gitter (https://synfig.readthedocs.io/en/latest/layers/skeleton_deformation.html).
- Kantenglättung lässt sich nicht global abschalten, nur je Ebene (Vektor: Haken „Antialiasing“ aus; importierte Bilder: Interpolation „Nearest Neighbor“): „You have to do it for all the layers manually, there's no global option to disable anti aliasing unfortunately.“ (Forum, 10.04.2024, https://forums.synfig.org/t/how-do-i-disable-anti-aliasing/14970).

**Lippensync (für Kapitel 3):**
- Rhubarb Lip Sync: neueste Version 1.14.0; zwei Erkenner, `pocketSphinx` (nur Englisch) und `phonetic` (sprachunabhängig, „Use it if your recordings are not in English“); Mundformen A–F plus wahlweise G, H, X; Ausgabe tsv, xml, json, dat; Eingabe WAV und Ogg Vorbis; `--dialogFile` mit dem Text verbessert die Erkennung (https://github.com/DanielSWolf/rhubarb-lip-sync, …/releases).
- Godot: „Baked Lipsync 1.0“ von fbcosentino, Godot 4.3, MIT, nutzt Rhubarb, backt Mundformen in Ressourcen, zur Laufzeit ein Knoten mit Signalen (https://godotengine.org/asset-library/asset/3629, https://github.com/fbcosentino/godot-baked-lipsync). Dazu ein älteres Addon von AniMesuro (https://animesuro.itch.io/rhubarb-lip-sync-godot, „Name your own price“, Godot-Version nicht genannt).
- Audio2Face: am 24.09.2025 von NVIDIA offengelegt (SDK, Modelle v2.2/v3.0, Trainings-Framework, Plugins für Maya und Unreal Engine 5) (https://developer.nvidia.com/blog/nvidia-open-sources-audio2face-animation-model). SDK unter MIT; Voraussetzung „NVIDIA GPU with CUDA 12.8.0+ support“, TensorRT 10.13+, 4 GB+ Grafikspeicher; Ausgabe sind 3D-Gesichtsdaten (Vertex-Positionen) (https://github.com/NVIDIA/Audio2Face-3D-SDK). **Sebastians PC hat eine Radeon 7900 XT** (`docs/offene-punkte.md` P7): Audio2Face läuft dort nicht.

**ACE-Step 1.5 (für Kapitel 4):**
- Herausgeber ACE Studio und StepFun; Bericht arXiv 2602.00744 (31.01.2026); XL-Fassung (4 Mrd. Parameter) am 02.04.2026 (https://github.com/ACE-Step/ACE-Step-1.5).
- Lizenz Code: MIT. Lizenz Gewichte: MIT laut Modellkarte; dort auch: Trainingsdaten „Licensed Data: Professionally licensed music tracks“, lizenzfreie und gemeinfreie Musik, synthetische MIDI-Aufnahmen; „You can strictly use the generated music for commercial purposes.“ (https://huggingface.co/ACE-Step/Ace-Step1.5). **`docs/04-audio.md` nennt Apache-2.0: das stimmt für 1.5 nicht, es ist MIT.**
- Modelle: DiT 2B (`base`, `sft`, `turbo`), XL 4B (`xl-base`, `xl-sft`, `xl-turbo`), Sprachmodell 0,6B/1,7B/4B. Bedarf: ≤ 6 GB nur 2B-Turbo ohne LM; 16–20 GB 2B-sft oder XL-Turbo mit LM 1,7B; 20–24 GB XL; XL ab 12 GB mit Auslagerung, 20 GB ohne. Länge 10 s bis 10 min. Unter 10 s je Stück auf einer RTX 3090. Funktionen: Cover, Repaint/Edit, Stems (Track-Trennung), Mehrspur („Lego“), Referenz-Audio, LoRA-Training (8 Stücke in etwa 1 h auf einer 3090), BPM/Tonart/Takt als Vorgabe. AMD über ROCm (unter Windows Python 3.12), Intel, Mac, CPU.
- AMD-Blog vom 04.02.2026: ComfyUI Desktop, Vorlage „ACE Step 1.5 Turbo AIO“, Radeon AI PRO R9700 etwa 4-fache Echtzeit (https://www.amd.com/en/blogs/2026/commercial-grade-ai-music-generation-on-amd-ryzen-ai-and-radeon-ace-step-1-5.html).
- Steam: Inhaltsumfrage verlangt Angabe von „Pre-Generated“ KI-Inhalten, die mit dem Spiel ausgeliefert werden („artwork, sound, narrative, localization, etc.“), und die Zusage, dass das Spiel keine „illegal or infringing content“ enthält (https://partner.steamgames.com/doc/gettingstarted/contentsurvey).

## 1. Animationen gegen externe Quellen

**Kurzantwort:** Fertige Figuren-Animationen aus dem Netz passen nicht ins Spiel. Die Pakete sind für 20 bis 64 px hohe Figuren mit harter Pixel-Kontur gebaut; die Figuren des Spiels sind gemalt, pixeliert und 100 bis 290 px hoch. Brauchbar sind drei Dinge: (a) die **Vierbeiner-Bibliothek von Meshy** (neu, 127 Clips, auch Katze und Kuh) als Bewegungsvorlage für genau den Weg, der bei den Menschen schon funktioniert, (b) **Effekt-Schleifen** (Feuer, Rauch, Wasser, Funken), weil sie klein und stilneutral sind, am sichersten aus CC0-Quellen, (c) **Lernquellen** für Schrittfolge und Timing. Kaufen muss man dafür fast nichts.

Nachtrag zur Bedarfsliste aus `pr-w2.md` (Stand 25.11., 18 Uhr; `pr-w3.md` hatte noch keine Kandidaten-Tabelle): B13 Pixel Klettern und Sprung an der Säule (Agora, fehlt), B14 Max `katapult` (2 Bilder, braucht 5–6 mit Flugbogen), B15 Staubwolke, Glitzer am Sack und Nies-Geste (Zwischenspiel 2), B16 Fähre gleitet aus dem Bild (Prop-Bewegung im Code), B17 Rücklauf Leonidas/Archimedes (vorhandene Zyklen gespiegelt, keine neuen Bilder). Das meiste davon ist wieder Einbau, nicht Bildmangel.

### 1.1 Meshy-Animationsbibliothek (wichtigster Fund)

| Punkt | Befund (Seite, abgerufen 25.11.2026) |
| --- | --- |
| Umfang | 779 Animationen: Walk & Run 160, Daily Actions 155, Fighting 149, Body Movements 155, Dancing 33, **Quadruped 127** (https://www.meshy.ai/animation-library) |
| Vierbeiner | Dog, **Cat**, Horse, Wolf, Fox, Rabbit, Deer, Fawn, Leopard, **Cow**, **Sea Turtle**. Rig über `animation_type: quadruped`, kostet so viel wie ein Zweibeiner-Rig; jeder Vierbeiner-Clip läuft auf jedem Vierbeiner-Rig; Bewegung nach Text nur für Zweibeiner (https://docs.meshy.ai/api/rigging.md, https://docs.meshy.ai/en/api/animation) |
| Preis | Seite nennt keine Dollarpreise; 149 Clips frei, Rest „Pro“. Im Projekt bisher gemessen: Clip 3 Credits, Rig etwa 20 (`docs/quellen.md`). Die API-Beispiele zeigen 3 (Animation) und 5 (Rig) Credits; verbindlich ist die Preisseite (**nicht bestätigt**, nicht abgerufen) |
| Lizenz | „Animated characters rigged and animated on Meshy Pro and above include commercial-use rights“; Gratis-Stufe nur „personal and evaluation use“ |
| Format | FBX, GLB; Bildrate 24/25/30/60 |
| Passt es? | **Als Vorlage ja, als fertiges Bild nein** (wie bei den Menschen: Bewegung aus dem Clip, Aussehen aus dem gemalten Sprite) |

**Was sich damit ändert:** `docs/quellen.md` („Keine Vierbeiner“) und `docs/lessons-learned.md` Abschnitt 1 („Meshy riggt keine Vierbeiner“) sind überholt. Für B1/B2 (Kater, Minka, Hofkater, Ziegen, Schildkröte) gibt es jetzt denselben Weg wie für Menschen: Winkel je Knochen aus einem Katzen- oder Kuh-Clip in Blender auslesen, Sprite in Teile zerlegen (Rumpf, Kopf, vier Beine in je zwei Gliedern, Schwanz in zwei bis drei Gliedern), 8 Bilder, automatische Prüfung (hier: genau vier Beine, eine Fußlinie, keine Löcher).

Grenzen, ehrlich: (1) Pixels Beine sind im Sheet nur etwa 15 px lang; ein Teile-Rig mit zwei Gliedern je Bein dreht dort sehr wenige Pixel. Wahrscheinlich reicht es, aus dem Clip nur die **Schrittfolge, die Hoch-Tief-Bewegung von Schulter und Becken und den Schwanz** abzulesen und die acht Posen danach zu malen oder die vorhandenen acht Bilder umzusortieren und zu korrigieren. (2) Ein früherer Versuch mit eigenem Blender-Rig „sah nach anderer Katze aus“ (Lessons, Abschnitt 1); das lag am gerenderten 3D-Körper, nicht an der Bewegung. Nur die Winkel übernehmen. (3) Ob das automatische Vierbeiner-Rig aus einem gemalten Seitenbild einer dicken Katze ein brauchbares Skelett macht, ist **nicht geprüft**; man braucht es aber nicht zwingend, denn die Winkel lassen sich am Bibliotheks-Clip auf einem beliebigen Vierbeiner-Modell ablesen.

Passende Zweibeiner-Clips für die Bedarfsliste (Namen laut https://docs.meshy.ai/api/animation-library):

| Bedarf | Clip(s) | Bemerkung |
| --- | --- | --- |
| B3 Hinken (Hexenschuss, Welt 3) | `Injured_Walk`, `Unsteady_Walk` | Tempo im Spiel an die Schrittlänge anpassen (AN-08 vom 20.11.) |
| B9 Treppe | `Climb_Stairs`, `Fast_Stair_Climb` | Gegenprobe zu `treppe_walk` (17 Bilder) |
| B9 Hinknien, Aufheben | `Kneel_on_One_Knee_and_Stand`, `Male_Bend_Over_Pick_Up`, `Female_Crouch_Pick_Up_Place_Side` | für „Dose unter die Nase halten“, Servieren |
| Aufstehen, Hinsetzen | `Stand_Up1`–`10`, `Sit_to_Stand_Transition_M`, `Stand_to_Sit_Transition_M`, `Sit_Lie_Bed` | Kapsel-Bewegungen Welt 3 sind schon gebaut, aber nicht eingebaut |
| B4 Redegesten | `Talk_Passionately`, `Talk_with_Hands_Open`, `Talk_with_Left_Hand_Raised`, `Stand_Talking_Angry` | für Rede-Gesten in Standhöhe (Gollo, Grimmzahn) |
| B12 Waldemar-Musical | 15 Tänze, u. a. `FunnyDancing_01`–`03` | als Timing-Vorlage für 8–12 Bilder |
| nicht vorhanden | Gitarre/Laute, Singen, Zeigen, Überreichen | Laute über „Bewegung nach Text“ (im Projekt 13 Credits) oder malen |

### 1.2 itch.io, kostenlos und kostenpflichtig

Preise in US-Dollar wie auf der Seite; „ab“ heißt Mindestpreis bei „Name your own price“. Alle Seiten am 25.11.2026 abgerufen. Bildzahlen stehen nur dort, wo die Seite sie nennt.

**Katzen (Bedarf B1, B10):**

| Name, Urheber | URL | Preis | Lizenz im Wortlaut | Format, Größe, Sicht | Animationen | Bewertung für Couch Quest |
| --- | --- | --- | --- | --- | --- | --- |
| Catset, SeethingSwarm | https://seethingswarm.itch.io/catset | ab 19,99 $ | „Feel free to use for commercial projects and modify the character if needed.“ „Do not resell or give away the assets individually.“ „These assets are not to be openly distributed.“ Verbot von NFT/Blockchain. „No generative AI was used“ | PNG-Streifen und GIF je Animation, Zelle 40 × 40, Katze etwa 19 × 17 px, Seitenansicht, 5 Katzen | 23: Sit, Idle, Walk, Run, Jump, Fall, Land, Crouch, Sneak, Fright, Liedown, Sleep, Wallclimb, Ledgegrab u. a. | Als Asset **nein** (5-mal kleiner als Pixel, anderer Stil). Als **Vorlage gut**: vollständigster Satz an Katzenbewegungen in Seitenansicht (Sprung, Landen, Klettern, Hinlegen), genau die Lücken B10 und B13. Nachteil: 20 $ nur zum Ansehen; die GIFs auf der Seite zeigen das Timing schon |
| Pet Cats Pack, LuizMelo | https://luizmelo.itch.io/pet-cat-pack | frei wählbar | „This package can be used freely and commercially - CC0 (Creative Commons Zero).“ „Credit is not required, but I would appreciate it.“ | ZIP, Katzen 20 × 14 bis 22 × 15 px, Seitenansicht (Tag „Side Scroller“), 6 Katzen | Idle 10, **Walk 8**, Run 8, Meow 4, Lying Down 8, Itch 2, Licking 5, **Stretching 13**, Sitting, Sleeping | Als Asset nein (winzig). **Beste Vorlage ohne Lizenzrisiko:** 8-Bilder-Gang und 13 Bilder Strecken (Aufwachen, B10) als Posenfolge zum Nachbauen; CC0 darf auch ins Repo |
| 2D Pixel Art Cat Sprites, Elthen | https://elthen.itch.io/2d-pixel-art-cat-sprites | frei wählbar | „Feel free to use the sprites in commercial/non-commercial projects!“ (Verweis auf eigene Lizenzseite, **nicht gelesen**) | ein PNG-Bogen, laut Kommentar 32 × 32 | Idle ×2, Clean ×2, Movement ×2, Sleep, Paw, Jump, Scared | nur Vorlage; Erschrecken und Pfotenhieb passen zu `fauchen`/`ohrfeige` |
| Cat Pixel Animations Pack, pixelbean | https://pixelbean.itch.io/cat-pixel-animations-pack | ab 1,60 $ (Teil frei) | „Use the assets on personal or commercial projects.“ „Edit or modify the assets to fit your game.“ „Credits to pixelbean.“ Kein Weiterverkauf | ZIP, 32 × 32, links und rechts | 11: Idle, Lick, Sleep, Jump, Run, Walk, Hurt u. a. | nur Vorlage, Namensnennung Pflicht; kein Mehrwert gegenüber LuizMelo |
| Cat Pack, ToffeeCraft | https://toffeecraft.itch.io/cat-pack | frei / ab 1,80 $ | frei: „For personal use.“; bezahlt: „For commercial or personal use.“ „Not redistribute or resell this assets.“ | 32 × 32 | Idle, Fressen mit Napf, Lecken, Wanne; **kein Gehen** („Walking cat animation unfortunately not in this pack“) | nur für „Fressen“ (B10) als Vorlage |

**Menschen (Bedarf B3, B9):**

| Name, Urheber | URL | Preis | Lizenz im Wortlaut | Format, Größe, Sicht | Animationen | Bewertung |
| --- | --- | --- | --- | --- | --- | --- |
| Animated Point&Click Adventure Character, Magory | https://magory.itch.io/animated-pointclick-character | ab 3 $ | **keine Lizenzangabe auf der Seite** | PNG, 54 × 80, Vektor-Original (Inkscape), Palette Endesga 32, Gehen in 4 Richtungen | Walk 4 × 8, Aufheben ×3, Greifen, Idle ×2, Reden, Telefonieren ×2, dazu eine weiße Katze (Gehen, Putzen) | Als Asset nein (80 statt 190 px). Als Vorlage für **Greifen/Aufheben und Gehen nach vorn/hinten** brauchbar. Ohne Lizenztext nicht einbauen |
| Point and Click Adventure Game Sprite Template, Danger Goose | https://danger-goose.itch.io/point-and-click-adventure-game-sprite-template | frei wählbar | **keine Lizenzangabe** | PNG und Aseprite, Proportionen nach King's Quest 5/6, Seite, vorn, hinten, 3/4 | Idle, Walk, Run, Push, Knopf drücken, Sitzen, Schulterzucken; Aufheben und Reden erst geplant | Aseprite-Datei als Anschauung, wie Tags und Richtungen angelegt sind; sonst nein |
| Helix, Crosswired Studios | https://crosswiredstudios.itch.io/helix-8-directional-point-and-click-character | ab 20 $ | **keine Lizenzangabe**; „No generative AI was used“ | 64 px, 8 und 4 Richtungen | Idle, Walk, Run, **Talk** (je 8 Bilder), Kick, Pick Up, Porträts mit Reden 2–4 Bilder | nein: 64 px, für 8 Richtungen gebaut, die das Spiel nicht hat |

Für den Menschen-Gang gibt es damit nichts Besseres als den vorhandenen Weg (Meshy-Clip plus Teile-Rig). Die itch-Pakete haben 8 Bilder je Zyklus wie das Spiel, aber ein Viertel bis ein Drittel der Höhe.

**Reden, Mund (Bedarf B4):**

| Name, Urheber | URL | Preis | Lizenz | Inhalt | Bewertung |
| --- | --- | --- | --- | --- | --- |
| Lip Sync Viseme Asset pack, Xanthius | https://xanthius.itch.io/lip-sync-asset-pack | frei wählbar | **keine Angabe**; als „AI Assisted“ gekennzeichnet | zwei Sätze Cartoon-Lippen mit je 15 Mundformen | Nur als Anschauung der Mundformen. Frontale Cartoon-Lippen passen nicht auf Profilköpfe mit 6 bis 10 px Mund |
| Helix (oben) | – | – | – | `Talk` 8 Bilder, Porträt-Reden 2–4 Bilder | bestätigt den Befund: Adventure-Sprites reden mit einer Schleife, nicht mit Visemen |

Mundbilder kauft man nicht; sie entstehen aus dem eigenen Kopf-Sprite (Kapitel 3).

**Effekte (Bedarf B5–B8, B15):**

| Name, Urheber | URL | Preis | Lizenz im Wortlaut | Format, Größe | Inhalt | Bewertung |
| --- | --- | --- | --- | --- | --- | --- |
| Elemental Bundle, Fellor | https://fellor.itch.io/elemental-bundle | ab 8,50 $ | „Use these assets in personal and commercial projects.“ Verboten: „Resell, redistribute, or reupload these assets in their original or modified form.“ „No AI Generated Content“ | PNG-Einzelbilder und Bögen, 64 × 64 | Feuer, Eis, Blitz, Erde; Wasser und Wind angekündigt | Größe passt zu Esse und Kessel (64 px). Stil: harte Pixel, kräftige Farben; nach Umfärben auf die Raum-Palette brauchbar. **Lizenzfalle Repo** (siehe 1.6) |
| VFX Collection Vol. 1, kiddolink | https://kiddolink.itch.io/vfx-fx-collection-vol-1-pixel-art | ab 7,99 $ | „You CAN use this asset pack for commercial and/or personal projects;“ „You CAN edit and modify all content“; „You CANNOT resell and/or redistribute this asset pack;“ | **Aseprite-Dateien**, 4 PNG-Bögen, 80 GIF, Raster 96 × 96 | 40 Animationen: Rauch, Elektrizität, Feuer, Funken; Nachtrag 10 Rauch (10.12.2023) | Bester Kauf-Kandidat für Rauch (Smaugi), Funken (Schmied) und Blitz (Zapp-O-Mat), weil Aseprite-Quellen dabei sind und sich umfärben lassen. Repo-Falle wie oben |
| +50 Pixel Art Effects Pack 1, pixel-zowie | https://pixel-zowie.itch.io/50-pixel-art-effects-pack-1 | **Preis auf der Seite nicht gefunden** | „Edit and use the asset in any commercial or non commercial project“; verboten „Resell or distribute the asset to others.“ | PNG, GIF, 8 bis 1024 px in acht Größen, 10 Farben | 50 Effekte: Explosion, Magie, Rauch, Wasser, Feuer, Blitz, Verwandlung | Verwandlungs- und Magie-Effekte (Moderwort, Sack). Hochskalierte Fassungen sind vergrößerte Pixel, kein Gewinn |
| Fire VFX Spritesheets v2.0.0, Cartoon Coffee | https://cartooncoffee.itch.io/fire-spritesheets | ab 24,99 $ | „You are free to use these assets for any personal or commercial project.“ „Modifications are allowed to be made for the sole purpose of use in your projects only.“ „You may not redistribute, sell, or share these VFX even if modified without written permission by Cartoon Coffee.“ | „HD Sprite Sheets“, Größe nicht genannt | Feuer in vielen Formen | Gezeichnetes HD-Feuer läge dem **gemalten** Stil näher als Pixel-Feuer und ließe sich mit `pixelieren.py` in denselben Weg schicken wie die Figuren. Teuer für acht Fackeln; nur, wenn Feuer zum Blickfang werden soll |
| Epic Hand-Drawn VFX Sprite Pack, sinbadstudios | https://sinbadstudios.itch.io/ultimate-vfx-pack-fire-lightning-water-smoke-animations | ab 0,50 $ | **keine Lizenzangabe**, keine Angabe zu KI | „over 600 unique sprites“: Blitz, Explosion, Feuer, Rauch, Wasser | – | Ohne Lizenztext und bei 0,50 $ für 600 Bilder nicht verwenden (Herkunft unklar) |

### 1.3 OpenGameArt

| Name, Urheber | URL | Lizenz | Inhalt | Bewertung |
| --- | --- | --- | --- | --- |
| Fire Smoke Animations, Reactorcore | https://opengameart.org/content/fire-smoke-animations | **CC0** | Pixel-Art-Feuer und -Rauch, „multiple variants, styles and sizes“, PNG transparent, Bögen und Einzelbilder (28.07.2025) | **Erste Wahl für B5/B6:** kostenlos, darf ins öffentliche Repo, darf umgefärbt werden. Größen vor dem Einsatz ansehen (nicht geladen) |
| Cat sprites, Shepardskin | https://opengameart.org/content/cat-sprites | CC0 („No attribution necessary, unless you want to.“) | Gehen und Rennen als GIF, 2- und 4-fach (2014) | Vorlage für Schrittfolge und Rennen, sonst zu klein |
| 2D cat sprite, Noob | https://opengameart.org/content/2d-cat-sprite | CC0 | Gang mit 4 Bildern (2017) | zu wenig Bilder; nein |
| Animated particle effects 1 | https://opengameart.org/content/animated-particle-effects-1 | **nicht bestätigt** (Seite ließ sich nicht abrufen) | – | – |

OpenGameArt hat für dieses Spiel denselben Größen- und Stilabstand wie itch.io. Der Vorteil sind die klaren Lizenzen (CC0, CC-BY) und dass CC0-Dateien im Repo liegen dürfen. Bei CC-BY-SA und GPL-Grafik aufpassen: Die Pflicht, Abwandlungen unter derselben Lizenz zu veröffentlichen, will man nicht im Spiel haben.

### 1.4 Aseprite-Community: Lernquellen und Erweiterungen

| Quelle | URL | Was man daraus nimmt |
| --- | --- | --- |
| Slynyrd, Pixelblog 25 „Motion Cycles“ (28.01.2020) | https://slynyrd.com/blog/2020/1/23/pixelblog-25-motion-cycles | **Vierbeiner-Gang (Hund) in 8 Bildern:** je Seite ein Beinpaar wie ein Zweibeiner behandeln; das Hinterbein folgt dem Vorderbein der Gegenseite einen Schritt später; Vorder- und Hinterbeine legen dieselbe Strecke zurück, sonst zieht sich der Körper wie eine Ziehharmonika; Reihenfolge Beine, Körper, Kopf, Schwanz; Becken und Schultern wippen gegenläufig. Dazu Flügelschlag in 8 Bildern (für Berta, B11) |
| Game Developer, „Animating Four-Legged Beasts“, Cathy Feraday Miller (02.05.2012) | https://gamedeveloper.com/art/animating-four-legged-beasts | Fußfolge im Schritt: hinten links, vorn links, hinten rechts, vorn rechts; „two offset human walk cycles“; Hüfte, Brust und Kopf als drei versetzte hüpfende Bälle; vier Hauptposen (zwei Schritt-, zwei Durchschwungposen), symmetrisch, sonst hinkt das Tier |
| Slynyrd, Pixelblog 50 „Human Walk Cycle“ (24.05.2024) | https://slynyrd.com/blog/2024/5/24/pixelblog-50-human-walk-cycle | neuere Fassung des schon genutzten Pixelblog 8 (**Inhalt nicht gelesen**, nur gefunden) |
| Aseprite-Forum, „Aseprite Scripts Collection“ | https://community.aseprite.org/t/aseprite-scripts-collection/3599 | Sammelstelle der Skripte (**Inhalt nicht gelesen**) |
| The Tween Machine, CarbsCode (v1.3.0) | https://carbscode.itch.io/the-tween-machine | Aseprite-Erweiterung, ab 5 $: Zwischenbilder für Position, Skalierung (auch ungleichmäßig: Squash und Stretch), Drehung, dazu Farbton/Alpha; Easing linear, In, Out, InOut. Lizenz: private und berufliche Nutzung erlaubt, kein Weitergeben, kein KI-Training. Braucht Aseprite ab 1.2.40 |
| Tweencel, Devkidd (v2.2.2, 08.12.2025) | https://devkidd.itch.io/tweencel | Aseprite-Erweiterung, 5 $ (zurzeit 3,75 $): Zwischenbilder zwischen zwei Cels für Position, Größe, Drehung, Farbe; Bahnen (Bogen, Welle, Schütteln), Squash und Stretch. Grenze: noch nicht über mehrere Ebenen zugleich |
| Powerhoof, Gang eines Vogelwesens für „The Drifter“ (2013) | https://www.powerhoof.com/?p=975 | Arbeitsweise eines Adventure-Studios: Becken, Brust, Schädel auf eigenen Ebenen, Glieder zuerst als Striche; erst 5 Bilder, am Ende 7 mit zwei Zwischenbildern an den langsamen Stellen |

Zu den Erweiterungen: Sie tun dasselbe wie die Zwischenbild-Funktionen in den eigenen Python-Werkzeugen, aber von Hand in der Oberfläche. Für die Pipeline (Claude steuert Aseprite über Lua im Batch) bringen sie nichts; für Sebastian selbst wären 5 $ für Tweencel sinnvoll, wenn er Effekte (Sprungbogen, Einsaugen, Wackeln) in Aseprite ausprobieren will.

### 1.5 Verfahren statt Assets

| Verfahren | Was andere damit erreichen | Lässt es sich hier anschließen? | Aufwand | Nutzen |
| --- | --- | --- | --- | --- |
| **Vierbeiner-Clip aus Meshy als Winkelquelle** | echte Schrittfolge statt geratener Posen | ja, selber Weg wie bei den Menschen (Blender-MCP liest Winkel) | Versuch mit Pixel: 3–4 h, etwa 10–25 Credits | hoch: Pixel ist in jeder Szene zu sehen |
| Schrittfolge nach Regel (Slynyrd 25, Feraday Miller) prüfen | Gang ohne „Ziehharmonika“ und ohne Hinken | ja, als automatische Prüfung: Fußkontakte je Bild zählen (unterste Pixel je Bein), Folge HL-VL-HR-VR, Fußlinie konstant, Rumpflänge ±2 px | 2–3 h für das Prüfskript | mittel: findet auch die 9 % Höhenschwankung der XXL-Ziege |
| Zwischenbilder nur an den langsamen Stellen („auf Zweien“ mit Halten) | weniger Bilder, klareres Timing (Powerhoof: 5 → 7 Bilder) | ja, über das vorhandene `folge` in den JSON-Daten, ohne neue Bilder | 1 h je Geste | mittel: gegen „springt von Pose zu Pose“ |
| Squash und Stretch per Code | Sprünge, Landen, Einsaugen wirken ohne neue Bilder | ja: `scale` und `skew` des `Sprite2D` in Godot über einen Tween (Sprung Pixel, Katapult Max, Abreise in den Zapp-O-Mat) | 2–4 h für eine wiederverwendbare Funktion | hoch bei B8/B10/B14, kostet keine Grafik |
| Flugbahn als Kurve im Code | Sprung als ein Bogen statt zwei | ja (`cq_figur.gd` hat `springen` schon mit Tween) | 1–2 h | hoch für Pixels Sprung auf die Werkbank |
| Sub-Pixel-Animation (Bewegung durch Farbwechsel statt Versatz) | Atmen und Blinzeln bei sehr kleinen Sprites | kaum nötig: Bei 100–290 px Höhe ist ein Versatz von 1 px schon fein genug. Sinnvoll höchstens für Fackeln mit 5 × 12 px | – | gering |
| Smear-Frames (verwischtes Zwischenbild bei schnellen Bewegungen) | Ohrfeige, Wurf, Hammerschlag wirken schneller | ja, je Geste ein Bild von Hand in Aseprite; nicht aus Gemini („Bewegungswörter erzeugen Geisterfiguren“, Lessons) | 0,5 h je Geste | mittel für `ohrfeige`, `haemmern`, `werfen` |
| Aseprite-Tags je Bewegung, Export mit `--list-tags` | eine Quelle je Figur, Timing je Bild in der Datei | teilweise: Das Projekt hält Timing schon in JSON; ein Umbau lohnt nicht | – | gering |
| Skelett-Animation zur Laufzeit (Skeleton2D, Spine) | weiche Bewegungen aus wenigen Teilen | **nein** für dieses Spiel: gedrehte Teile zur Laufzeit erzeugen schräge Pixelkanten und passen nicht zur Bild-für-Bild-Optik; das Teile-Rig rechnet vorab und prüft die Bilder (Kapitel 2) | – | – |
| Rotoskopie aus 3D (Dead-Cells-Weg, PixelOver) | komplette Figur aus dem 3D-Modell gerendert | schon verworfen („wirkt technisch“, Lessons Abschnitt 1) | – | – |
| KI-Sprite-Dienste mit Animation (PixelLab, Retro Diffusion) | Gang und Gesten direkt als Pixel-Sprites | **nicht geprüft**; steht schon als offener Punkt P7. Stilbruch zu den gemalten Figuren wahrscheinlich | – | – |

### 1.6 Lizenzfallen

1. **Öffentliches GitHub-Repo.** Praktisch jedes itch.io-Paket verbietet die Weitergabe („You CANNOT resell and/or redistribute“, „not to be openly distributed“, „may not redistribute … even if modified“). Eine gekaufte PNG-Datei im öffentlichen Repo ist eine Weitergabe, auch umgefärbt. Folge: Gekaufte Bilder dürfen nur ins Spiel (gepackt in der exportierten `.pck`), nicht als lose Dateien ins Repo. Das Projekt baut aber aus dem Repo (CI, Web-Export über GitHub Pages). Entweder das Repo wird privat, oder die gekauften Dateien liegen außerhalb und werden beim Bauen dazugeholt, oder man nimmt nur **CC0**. Für ein paar Fackeln lohnt nur der dritte Weg.
2. **Fehlender Lizenztext** (Magory, Danger Goose, Helix, Xanthius, sinbadstudios): Ohne Text gilt nicht „alles erlaubt“, sondern nur das, was der Kauf stillschweigend einräumt. Vor Einbau schriftlich nachfragen oder weglassen.
3. **KI-Klauseln:** The Tween Machine verbietet KI-Training mit dem Skript; die Sprite-Pakete oben haben keine Klausel gegen KI-Nachbearbeitung, einige werben mit „No generative AI was used“. Wer fremde Sprites als Referenzbild in Gemini gibt, bewegt sich bei „modify“ in einer Grauzone; als reine Anschauung (ansehen, Schrittfolge abzählen, selbst malen) ist es unbedenklich.
4. **Steam-Offenlegung** betrifft die eigenen KI-Grafiken ohnehin (Kapitel 4.5); zugekaufte handgemachte Effekte ändern daran nichts.
5. **Stilmischung:** Harte Pixel-Effekte mit 2–4 Farben neben gemalten Figuren mit weichen Verläufen fallen auf. Jeder fremde Effekt muss durch dieselbe Umrechnung (Palette des Raums, `ambiente.py`) wie die eigenen.
6. **Meshy:** kommerzielle Rechte nur für Ausgaben aus einem bezahlten Tarif; Abo-Zeitraum der Erzeugung belegen (Rechnung aufheben).

### 1.7 Empfehlung zu Frage 1

| Maßnahme | Kosten | Aufwand | Nutzen |
| --- | --- | --- | --- |
| **Tun:** Versuch „Pixel-Gang aus Meshy-Katzenclip“ (Clip ansehen, Winkel und Fußfolge auslesen, 8 Posen neu ordnen oder im Teile-Rig bauen, GIF alt/neu an Sebastian). Bei Erfolg Minka, Hofkater, Ziegen (Kuh- oder Hirsch-Clip), Schildkröte (Sea Turtle ist ein Schwimmclip, eher nicht) | 10–25 Credits aus dem Bestand (0 €) | 3–4 h Versuch, danach 1–2 h je Tier | hoch |
| **Tun:** Prüfskript für Vierbeiner-Gänge (Fußfolge, Fußlinie, Rumpflänge) neben die Zwei-Beine-Prüfung | 0 € | 2–3 h | mittel |
| **Tun:** Squash/Stretch und Flugkurve als Funktion in `cq_figur.gd` (Sprung, Katapult, Einsaugen) | 0 € | 2–4 h | hoch |
| **Tun:** CC0-Feuer und -Rauch von OpenGameArt (Reactorcore) ansehen; passende Schleifen durch `ambiente.py` auf die Raum-Palette bringen | 0 € | 1–2 h | mittel (Fackeln „blass“) |
| **Als Vorlage nutzen, nicht einbauen:** LuizMelo Pet Cats (CC0) für Strecken/Aufwachen, Catset-GIFs auf der Seite für Sprung/Klettern, Slynyrd 25 und Feraday Miller für die Schrittfolge | 0 € | – | mittel |
| **Kann man kaufen, muss man nicht:** kiddolink VFX Vol. 1 (7,99 $, mit Aseprite-Quellen) für Rauch/Funken/Blitz, nur wenn die CC0-Schleifen nicht reichen und die Repo-Frage geklärt ist; Tweencel (3,75–5 $) für Sebastians eigenes Probieren in Aseprite | 0 bis etwa 13 $ (rund 12 €) | 1 h | gering bis mittel |
| **Lassen:** fertige Figuren- und Katzen-Sprites (zu klein, anderer Stil), Mund-Pakete, Pakete ohne Lizenztext, Cartoon Coffee (25 $ für Fackeln), 3D-Rendern statt Malen | – | – | – |

**Gesamtkosten der Empfehlung: 0 €** (plus Meshy-Credits aus dem Bestand), höchstens etwa 12 € für die beiden Kann-Käufe. Der größte Hebel für bessere Animationen liegt nicht in fremden Quellen, sondern im Einbau der schon gebauten Bewegungen und in den Fußlinien- und Größensprüngen (Funde der Welt-Prüfer).

## 2. Synfig Studio

**Kurzantwort:** Synfig ist ein freies Vektor-Animationsprogramm mit Knochen und automatischen Zwischenbildern. Für die Figuren dieses Spiels bringt es gegenüber dem vorhandenen Python-Teile-Rig nichts und kostet Qualität (Zwischenfarben, Einstellungen je Ebene). Sinnvoll wäre es höchstens für **weiche, nicht gepixelte Bewegtbilder**: Werbeblock, Abspann, Trailer, Vektor-Effekte, die danach durch die Pixelierung laufen. Empfehlung: nicht in die Pipeline aufnehmen.

### 2.1 Was es ist und kann (abgerufen 25.11.2026)

| Punkt | Befund | Quelle |
| --- | --- | --- |
| Zweck | „free and open-source 2D animation software“, Vektor- und Bitmap-Grafik; Windows, Linux, macOS | https://github.com/synfig/synfig |
| Funktionen | Vektor-Tweening (Schlüsselstellungen, Zwischenbilder werden berechnet), über 50 Ebenen- und Filtertypen, Verknüpfen von Parametern auch über Ausdrücke; Knochen: „Full-featured bone system allows to create cutout animation using bitmap images or control your vector artwork.“ | https://www.synfig.org/ |
| Knochen für Rasterbilder | „Skeleton Deformation Layer“: verzerrt das gerenderte Bild der Ebenen darunter über ein Gitter; Einflussbereich je Knochen muss von Hand gesetzt werden, sonst verschwinden Bildteile; Unterteilung des Gitters bestimmt die Qualität. Die einfache „Skeleton“-Ebene bewegt verknüpfte Teile starr (Cutout) | https://synfig.readthedocs.io/en/latest/layers/skeleton_deformation.html |
| Lizenz | GPL-3.0 (betrifft das Programm, nicht die damit erzeugten Bilder) | https://github.com/synfig/synfig |
| Stand | letzte **stabile** Version 1.4.5 vom 19.05.2024; **Entwicklungs**-Versionen 1.5.4 (18.01.2026) und 1.5.5 (22.03.2026); kein 1.6 angekündigt. 12.549 Commits, 566 offene Issues, 171 Pull Requests. Meldungen stammen von einem Autor (Konstantin Dmitriev); Finanzierung über Spenden (Open Collective), Google Summer of Code 2022–2024 | https://www.synfig.org/news/, https://www.synfig.org/category/releases/stable-releases/, https://github.com/synfig/synfig |
| Kommandozeile | `synfig` rendert `.sif`-Dateien ohne Oberfläche: `-t` Ziel, `-w`/`-h` Größe, `-a` Antialias 1–30, `-Q` Qualität, `--begin-time`, `--end-time`, `--fps`, `-o` Ausgabe, `-c` Canvas, `-T` Threads; `--targets` listet die Ziele | https://wiki.synfig.org/Synfig_CLI_syntax |
| Sprite-Bogen | Ziel `png-spritesheet` (Richtung, Bilder je Zeile); im Forum Probleme mit Bogengröße, Ausweg dort: Einzelbilder und ImageMagick | https://forums.synfig.org/t/png-spritesheet-size/4325 |
| Pixel-Art | Kantenglättung lässt sich nicht global abschalten: je Vektorebene Haken „Antialiasing“ aus, je Bild-Ebene Interpolation „Nearest Neighbor“. „You have to do it for all the layers manually, there's no global option to disable anti aliasing unfortunately.“ (10.04.2024) | https://forums.synfig.org/t/how-do-i-disable-anti-aliasing/14970 |

Einordnung der Pflege: Das Projekt lebt (zwei Entwicklungsversionen 2026), aber langsam; die stabile Fassung ist anderthalb Jahre alt, die Entwicklerbasis klein. Ob 1.5.5 unter Windows stabil läuft, ist **nicht geprüft** (nichts installiert).

### 2.2 Passt es in die Pipeline?

Technisch ja: `.sif` ist XML, lässt sich aus Python schreiben, und `synfig -t png` rendert Bildfolgen im Batch. Praktisch spricht fast alles dagegen:

1. **Es löst ein Problem, das schon gelöst ist.** `tools/figur.py animieren` hat Knochen mit Gelenk, Spitze, Eltern, Z-Ordnung und Posen je Bild (`tools/figuren/*_rig.json`, 70 Rigs im Repo). Es schneidet Teile aus dem Sprite, dreht und versetzt sie und schreibt Bilder; dazu kommen die Prüfungen (zwei Beine, keine Löcher, 5 % Größe). Synfig brächte dasselbe mit einem zweiten Dateiformat und ohne diese Prüfungen.
2. **Zwischenfarben.** Synfig rechnet in Fließkomma mit Kantenglättung. Gedrehte Rasterteile bekommen ohne „Nearest Neighbor“ je Ebene weiche Ränder und neue Farben außerhalb der Palette; mit „Nearest Neighbor“ entstehen dieselben Treppenkanten wie im eigenen Rig, nur ohne dessen Nacharbeit (Kontur schließen, Einzelpixel entfernen). Die Deformations-Ebene verzerrt über ein Gitter, also immer mit Neuabtastung. Danach müsste jedes Bild erneut durch Palette und Säuberung.
3. **Automatische Zwischenbilder sind hier kein Gewinn.** Die Lessons sagen ausdrücklich: 8 starke Schlüsselbilder, 16 machten Läufe zäh. Synfigs Stärke (beliebig viele weiche Zwischenbilder) ist für Bild-für-Bild-Sprites bei 60–160 ms je Bild die falsche Richtung.
4. **Winkelquelle bleibt Blender.** Die Bewegung kommt aus Meshy-Clips (FBX/GLB). Synfig liest keine 3D-Clips; man müsste die Winkel weiterhin in Blender auslesen und dann in `.sif` übersetzen statt in das eigene JSON.
5. **Bedienung:** Claude steuert Aseprite und Blender über MCP. Für Synfig gäbe es nur den Weg über erzeugte XML-Dateien; ein Blick auf das Ergebnis braucht ohnehin den Render-Lauf.

### 2.3 Vergleich für genau diesen Zweck (Teile einer gemalten Figur bewegen, 8 saubere Bilder ausgeben)

| Werkzeug | Stand, Preis, Lizenz | Stärke | Schwäche für Couch Quest | Urteil |
| --- | --- | --- | --- | --- |
| **Python-Teile-Rig** (`tools/figur.py`, Skripte auf dem PC) | vorhanden, 0 € | kennt Stil, Palette, Prüfungen; läuft im Batch; Winkel aus Meshy/Blender | Teile der Skripte liegen nur auf dem PC (wf.md Block C); Gesten mit neuen Armhaltungen gehen nicht | **behalten**, Skripte ins Repo holen |
| **Aseprite** (vorhanden, über MCP/Lua) | vorhanden | Nacharbeit je Bild, Tags, RotSprite-Drehung für Pixel-Art, Erweiterungen wie Tweencel (ab 3,75 $) | kein Knochen-System | **behalten** für Nacharbeit und Smear-Bilder |
| **Blender** (vorhanden, über MCP) | vorhanden, GPL | Clips abspielen, Winkel auslesen; Grease Pencil und 2D-Rig möglich | ein 2D-Rig in Blender wäre der dritte Ort für dieselbe Figur | **behalten** als Winkelquelle, kein 2D-Rig |
| **Synfig Studio** | 1.4.5 stabil (2024), 1.5.5 Entwicklung (2026), GPL-3.0, 0 € | Vektor-Tweening, Knochen, CLI | siehe 2.2 | **nein** für Sprites; allenfalls für Vektor-Bewegtbild |
| **Spine** | Essential 69 $ (statt 99 $), Professional 379 $ (statt 449 $), je Nutzer; Enterprise ab 500.000 $ Umsatz (https://esotericsoftware.com/spine-purchase) | Industriestandard für Skelett-Animation zur Laufzeit, Mesh-Verformung (erst ab Professional: **nicht bestätigt**) | Laufzeit-Skelett passt nicht zur Bild-für-Bild-Optik; Godot braucht ein eigenes Modul bzw. einen angepassten Build (Forum, 2024/2025) | **nein** |
| **DragonBones** | MIT, bei AlternativeTo als eingestellt geführt: „The developer disappeared, hasn't responded to anyone for a few years“, Download lädt nicht (https://alternativeto.net/software/dragonbones/about) | – | tot | **nein** |
| **Godot Skeleton2D/Bone2D** | in Godot enthalten | keine Zusatz-Software | Nutzer nennen es „pretty cumbersome“ und „very frustrating in practice“ (Forum, 2024–2026); dreht Texturen zur Laufzeit (schräge Pixel) | **nein** für Figuren; Verformung ganzer Sprites per `scale`/`skew` reicht (1.5) |
| **PixelOver** | Steam, 19,99 $ (bis 30.11. 12,99 $), Early Access seit 13.10.2021, Windows/macOS/Linux (https://store.steampowered.com/app/1762550/PixelOver/) | genau für diesen Zweck gebaut: Knochen und IK auf Bildern, „pixel-accurate transforms“, Neuabtastung für Pixel-Art, Indexieren auf Palette, Export als Bogen und GIF, 3D-Import | Bedienung von Hand, keine Kommandozeile genannt; seit fünf Jahren Early Access | **einziger Kandidat für einen Versuch**, wenn Sebastian selbst Gesten bauen möchte |
| **Smack Studio** | Steam, 14,99 $, Early Access; eigentlich ein Kampfspiel mit Editor (https://www.dekudeals.com/items/smack-studio) | legt 2D-Pixelbilder auf ein 3D-Skelett, Drehung in die Tiefe | für kleine Kampfspiel-Figuren gedacht; Export in eigene Pipeline unklar | **nein** |

### 2.4 Empfehlung zu Frage 2

- **Nein** für Figuren, Gänge, Gesten, Effekt-Schleifen im Spiel. Das vorhandene Teile-Rig ist für diese Aufgabe das bessere Werkzeug; die wirksamste „Optimierung“ ist, die Rig- und Prüfskripte vom PC ins Repo zu holen (schon als WF-Fund geführt) und um die Vierbeiner-Prüfung zu ergänzen (Kapitel 1).
- **Vielleicht** für Bewegtbild außerhalb der Sprites: Werbeblock-Spot (5 s), Abspann-Tafeln, Titel-Animation, Trailer. Dort stören weiche Kanten nicht, wenn das Ergebnis als Ganzes durch `pixelieren.py` läuft. Dafür täte es aber auch Godots `AnimationPlayer` mit Tweens auf vorhandenen Bildern, ohne neues Programm.
- **Aufwand eines Versuchs,** falls gewünscht: Installation und Einarbeitung 2–3 h, ein Testfall (Max' Arm als Cutout mit „Nearest Neighbor“, 8 Bilder über `synfig -t png` rendern, gegen das Ergebnis von `figur.py animieren` legen) weitere 2–3 h. Kosten 0 €. Erwartetes Ergebnis: gleichwertig oder schlechter. Ich würde die 5 h lieber in den Vierbeiner-Versuch stecken.
- Wenn ein zusätzliches Programm, dann **PixelOver** (13–20 $) als Handwerkzeug für Sebastian: Es ist das einzige der geprüften, das Knochen-Animation mit pixelgenauer Neuabtastung und Palettenbindung verbindet. Versuch 2 h mit der kostenlosen Demo (Demo auf Steam vorhanden, Umfang **nicht geprüft**).

## 3. Lippensynchronisierung

**Kurzantwort:** Audio2Face ist nicht nötig und auf Sebastians PC nicht einmal lauffähig (verlangt eine NVIDIA-Grafikkarte, der PC hat eine Radeon 7900 XT) und liefert 3D-Gesichtsdaten, die ein 2D-Sprite nicht brauchen kann. Der Mund der Figuren ist im Profil 2 bis 3 Pixel groß und hat zwei Zustände. Dafür reicht eine **Lautstärke-Steuerung** (Mund auf, wenn die Aufnahme laut ist), die sich beim Vertonen vorab berechnen lässt. Rhubarb Lip Sync ist die richtige nächste Stufe, falls später größere Köpfe (Porträts, Nahaufnahmen) reden sollen. Vorher sind zwei Fehler im Bestand zu beheben, sonst läuft der Mund an der Aufnahme vorbei.

### 3.1 Wie der Mund heute bewegt wird (aus dem Code)

- Jede Figur hat eine Bildfolge `talk` im Sheet (73 von 81 Sheets mit 2 bis 9 Bildern zu 110–160 ms; 5 Objekte mit einem Bild; 3 ohne). Sie läuft als Schleife, solange Popochiu `is_talking` meldet (`cq_figur.gd` Z. 622–626 `_play_talk()`), unabhängig vom Ton.
- Dauer: `say()` ruft `_mund_schliessen()` (Z. 38–43, 65–72). Ohne Aufnahme gilt die Schätzung `redezeit()`: Zeichenzahl / 14 je Sekunde, mindestens 0,6 s (Z. 18–19, 60–62). Danach `_play_idle()`, auch wenn der Text noch steht.
- Statt `talk` kann je Satz eine Geste laufen (`rede_geste()`, Z. 522–524) oder eine Zeilen-Geste aus `gesten_*.gd`.
- Sprechende Gegenstände (Lautsprecher, Radio, Tür) haben eigene Folgen über `spricht:` im Layout.
- Belegbild: `belege/ext/max_talk_kopf_6fach.png` zeigt die vier `talk`-Bilder von Max sechsfach vergrößert: Mund offen (ein roter Fleck von 2 × 2 px), zu, offen, zu; dazu bewegt sich das Kinn um 1 px. Mehr Mund gibt es bei dieser Größe nicht.

**Zwei Funde am Bestand (aus dem Code; im Spiel nicht nachstellbar, weil noch keine Stimmdateien im Repo liegen):**

| ID | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- |
| R5-EXT-01 | wichtig (sobald vertont wird) | Animation, Technik | Die Mundbewegung richtet sich **nie nach der Aufnahme**. `_mund_schliessen()` fragt die Länge über Popochius Sprach-Cues ab (`_get_vo_cue(emotion)`, `PopochiuUtils.a.get(vo)`), die Stimmen des Spiels laufen aber über das eigene System `Klang.zeile()` aus `res://audio/stimmen/<sprache>/<ZEILEN_ID>` (`klang.gd` Z. 317–328, Aufruf `spiel.gd` Z. 244). Popochius `voices` werden nirgends befüllt. Es gilt also immer die Schätzung 14 Zeichen/s: Bei langsam gesprochenen Zeilen steht der Mund still, während die Stimme weiterredet; bei schnellen klappt er nach. Der Kommentar in Z. 16–17 („Mit Aufnahme bestimmt deren Länge“) stimmt nicht. | `game/skripte/objekte/cq_figur.gd` Z. 65–72; `game/skripte/klang.gd` Z. 317–336; `game/skripte/spiel.gd` Z. 244 | In `_mund_schliessen()` zuerst `Klang.stimme_zu(<Blasen-Schlüssel>)` fragen und dessen `get_length()` nehmen; besser gleich Stufe 1 unten (Mund folgt der Hüllkurve). |
| R5-EXT-02 | wichtig (sobald vertont wird) | Animation | Bei „Untertitel aus“ und vorhandener Aufnahme bewegt die Figur den Mund **gar nicht**: `spiel.gd` Z. 245–248 wartet nur die Aufnahme ab (`Klang.stimme_abwarten()`) und überspringt mit `continue` den Aufruf von `say()`, der `talk` erst startet. | `game/skripte/spiel.gd` Z. 244–248, `blase_zeigen()` Z. 313–317 | Auch ohne Text die Redebewegung starten (eigene Funktion `reden_ohne_text(dauer)` in `cq_figur.gd`, die `_play_talk()` und danach `_play_idle()` ruft). |

### 3.2 Was ein 2D-Pixel-Adventure tatsächlich braucht

| Stufe der Genauigkeit | Mundbilder | Wo üblich | Für Couch Quest |
| --- | --- | --- | --- |
| Schleife während des Satzes | 2–8 Bilder `talk` | klassische Adventures ohne Sprachausgabe; itch-Paket „Helix“: `Talk` 8 Bilder | Stand heute; reicht ohne Ton |
| Lautstärke: zu, halb, weit | 2–3 | viele vertonte 2D-Spiele | **reicht**: Der Mund hat 2 × 2 px |
| Mundformen nach Lauten (Rhubarb A–F, dazu X) | 6–7, mit G/H 9 | PowerQuest (Powerhoof): „frames for A, B, C, D, E, F, and X, in that order“; Mund als eigene Animation über dem Körper möglich | erst bei großen Köpfen sinnvoll (Porträt in der Leiste, Nahaufnahme) |
| 3D-Gesichtsanimation (Audio2Face) | Blendshapes eines 3D-Kopfes | 3D-Spiele, Avatare | fehl am Platz |

Rhubarbs Mundformen (https://github.com/DanielSWolf/rhubarb-lip-sync): A geschlossen (P, B, M), B leicht offen mit Zähnen (die meisten Konsonanten, „EE“), C offen („EH“, „AE“), D weit offen („AA“), E leicht gerundet („AO“, „ER“), F gespitzt („UW“, „OW“, „W“), wahlweise G (F, V), H (langes L), X (Ruhe). Auf einen 2-Pixel-Mund abgebildet bleiben davon: A/X → zu, B/G/H → zu oder halb, C/E/F → halb, D → weit.

### 3.3 Werkzeuge im Vergleich (abgerufen 25.11.2026)

| Werkzeug | Wofür gebaut | Lizenz, Preis | Hardware | Deutsch? | Ausgabe, Anbindung | Urteil |
| --- | --- | --- | --- | --- | --- | --- |
| **Audio2Face** (NVIDIA) | Gesichtsanimation für **3D**-Figuren aus Ton; am 24.09.2025 offengelegt: SDK, Modelle (Regression v2.2, Diffusion v3.0), Audio2Emotion, Trainings-Framework, Plugins für Maya und Unreal Engine 5 (https://developer.nvidia.com/blog/nvidia-open-sources-audio2face-animation-model) | SDK: MIT (https://github.com/NVIDIA/Audio2Face-3D-SDK); Modelle auf Hugging Face teils mit eigener Lizenz und Freischaltung (Lizenztext der Modelle **nicht bestätigt**); 0 € | „NVIDIA GPU with CUDA 12.8.0+ support“, TensorRT 10.13+, 4 GB+ Grafikspeicher, Windows 10/11 oder Linux. Kein AMD, keine CPU genannt | Blog nennt „multilingual“ ohne Sprachliste | Vertex-Positionen bzw. Animationsdaten eines 3D-Gesichts; kein 2D, kein Godot-Plugin | **nein**: läuft nicht auf der Radeon, liefert das falsche Format, löst kein Problem dieses Spiels |
| **Rhubarb Lip Sync** 1.14.0 | Mundformen für 2D-Animation aus Tonaufnahmen, Kommandozeile | MIT („Copyright (c) 2015-2016 Daniel Wolf“), Abhängigkeiten MIT/BSD; 0 € (https://raw.githubusercontent.com/DanielSWolf/rhubarb-lip-sync/master/LICENSE.md) | CPU | Erkenner `pocketSphinx` nur Englisch; Erkenner `phonetic` sprachunabhängig: „Use it if your recordings are not in English.“ Für **deutsche** Aufnahmen also `--recognizer phonetic`; für englische `pocketSphinx` mit `--dialogFile` (Text der Zeile) | tsv, xml, json, dat; Eingabe WAV und Ogg Vorbis; fertige Anbindungen für After Effects, Moho, OpenToonz, Spine, Vegas, Visionaire; für Godot: „Baked Lipsync“ (unten) | **ja, als Stufe 2**: passt in `tools/vertonung.py` (ein Aufruf je Datei, JSON daneben). Bei 2-px-Mündern kaum besser als Lautstärke |
| **Baked Lipsync 1.0** (fbcosentino) | Godot-Addon: backt Rhubarb-Daten im Editor in Ressourcen; Knoten `AudioStreamPlayerLipsync`, `…2D`, `…3D` senden ein Signal je Mundwechsel; lädt Rhubarb beim ersten Start nach `addons/` (mit `.gdignore`) | MIT, 0 € (https://godotengine.org/asset-library/asset/3629, https://github.com/fbcosentino/godot-baked-lipsync) | – | hängt am Rhubarb-Erkenner; welche Option das Addon setzt, steht nicht auf der Seite (**nicht bestätigt**) | für Godot 4.3 eingetragen; 2D-Beispiel tauscht Texturen | als **Vorlage** für die Datenform brauchbar; das Spiel spielt Stimmen aber über `Klang`, nicht über einen eigenen Player-Knoten je Zeile, und backt besser im eigenen Werkzeug als von Hand im Editor |
| Rhubarb Lip Sync Third Party Integration (AniMesuro) | Godot-Addon mit Fenster um die Rhubarb-Kommandozeile | „Name your own price“; Lizenz und Godot-Version auf der Seite nicht genannt (https://animesuro.itch.io/rhubarb-lip-sync-godot) | – | – | – | nein (Stand unklar) |
| **Lautstärke live in Godot** | `AudioEffectSpectrumAnalyzer` auf dem Bus „Stimmen“, Abfrage über `AudioEffectSpectrumAnalyzerInstance` (Klasse in Godot 4.7 vorhanden: https://docs.godotengine.org/en/4.7/classes/class_audioeffectspectrumanalyzerinstance.html) oder Pegel des Busses | in Godot enthalten | – | sprachunabhängig | Wert je Frame → Mundstufe | **ja, einfachster Weg**; Nachteil: Der Bus „Stimmen“ ist einer für alle, bei Brabbel und überlappenden Stimmen ungenau; im Web-Export ohne Threads **nicht geprüft** |
| **Hüllkurve vorab beim Vertonen** | `tools/vertonung.py` nutzt schon ffmpeg; je Aufnahme Lautstärke in 50-ms-Schritten messen und als kurze Zahlenreihe ablegen | eigenes Werkzeug, 0 € | – | sprachunabhängig | eine Datei je Abschnitt in `game/daten/` (erzeugt), Wiedergabe in `cq_figur.gd` | **Empfehlung (Stufe 1)**: deterministisch, testbar, gleich in Web und Desktop, je Figur einstellbar |
| **Zeitmarken des TTS-Anbieters** | ElevenLabs „convert with timestamps“ liefert `alignment` mit `characters`, `character_start_times_seconds`, `character_end_times_seconds` (https://elevenlabs.io/docs/api-reference/text-to-speech/convert-with-timestamps.md) | im API-Preis enthalten (Aufpreis auf der Seite nicht genannt) | – | folgt dem Text, also auch Deutsch | Buchstabe → Mundstufe (Vokal offen, m/b/p zu, Pause zu) ohne jede Spracherkennung | **gute Ergänzung für Max, Pixel, Opa** (79 % der Zeichen laufen über ElevenLabs). Ob das eingestellte Modell `eleven_v4` den Endpunkt bedient, ist **nicht bestätigt**; Fish Audio und VoxCPM2: Zeitmarken **nicht geprüft** |
| Papagayo-NG | Lippensync von Hand mit Text-Zerlegung, für Moho | GPL (Datei `gpl.txt`); Hauptprojekt morevnaproject-org; „Papagayo-NG now only works with Moho“ laut Fork-Seite (https://github.com/ogallagher/papagayo-ng) | – | deutsche Zerlegung **nicht bestätigt** | Moho-Datei | nein: Handarbeit je Zeile bei 516.000 Zeichen Sprache |
| Montreal Forced Aligner | richtet Text und Aufnahme lautgenau aus; deutsches Akustikmodell v3.3.0 unter **CC-BY-4.0**, trainiert auf Common Voice (1.296 h) und GlobalPhone (https://huggingface.co/MontrealCorpusTools/german_mfa) | frei; Namensnennung für das Modell | CPU, Conda-Umgebung | **ja**, eigenes deutsches Modell und Wörterbuch (462.000 Wörter) | TextGrid mit Lauten und Zeiten → Mundformen | genauer als Rhubarb `phonetic`, aber deutlich mehr Einrichtung; erst sinnvoll, wenn es Großaufnahmen mit vielen Mundformen gibt. Gentle (englisch): **nicht geprüft** |

### 3.4 Empfehlung in Stufen

| Stufe | Was | Aufwand | Kosten, Lizenz | Zusätzliche Sprites | Nutzen |
| --- | --- | --- | --- | --- | --- |
| **0 (Pflicht vor der Vertonung)** | R5-EXT-01 und R5-EXT-02 beheben: Mund läuft so lange wie die Aufnahme, auch bei „Untertitel aus“ | 1–2 h, mit Test (`probe_stimmen` in `klang.gd` gibt es schon) | 0 € | 0 | verhindert den auffälligsten Fehler: Stimme redet, Figur steht still |
| **1 (empfohlen)** | Mund nach Lautstärke. `tools/vertonung.py` schreibt je Aufnahme eine Hüllkurve (20 Werte je Sekunde, drei Stufen 0/1/2); `cq_figur.gd` zeigt je Stufe ein Bild der vorhandenen `talk`-Folge. In den Figurendaten ein Feld `mund: {zu: <Bild>, halb: <Bild>, weit: <Bild>}`, erzeugt von `tools/figur.py` (Bild mit kleinster, mittlerer, größter Mundöffnung; bei Folgen mit Armgeste bleibt die Geste eine eigene Bewegung). Ohne Aufnahme bleibt die Schleife wie heute; Brabbel kann dieselbe Funktion mit seinen Silben füttern | 6–10 h (Werkzeug 2–3 h, Spiel 2–3 h, Zuordnung der Bilder für 73 Figuren halbautomatisch 2–4 h) | 0 €, keine fremde Software | **0 für die meisten.** 7 Figuren haben nur 2 Rede-Bilder (Archimedes, Beamter 2, Cicero, Goblin 1, Leonidas, M.U.T.T.I., Ramses): dort gibt es nur zu/offen, ein drittes Bild wäre je 1 Sprite, also höchstens 7. Vier Welt-3-Figuren ohne Mundbewegung in `talk` (Deckert, Schmidt, Orakel-Oma, Hausmeister; AN-05 vom 20.11.) brauchen ihre Mund-Schleife aus `talk_alt` zurück | hoch: Pausen, Betonungen und Satzenden stimmen sichtbar, bei 2-px-Mündern ist das von echter Lautsynchronität nicht zu unterscheiden |
| **1b (wahlweise statt Hüllkurve für ElevenLabs-Figuren)** | Zeitmarken je Buchstabe mitspeichern und daraus die Mundstufe ableiten | 2–3 h zusätzlich | 0 € (falls der Endpunkt mit dem Modell geht: **nicht bestätigt**) | 0 | etwas genauer bei m/b/p (Mund zu); nur für drei Figuren |
| **2 (nur bei Bedarf)** | Rhubarb im Batch: `rhubarb -f json --recognizer phonetic` für Deutsch, `pocketSphinx` mit `--dialogFile` für Englisch, je Zeile eine Liste Mundformen; Abbildung A–F/X auf die Mundbilder | 1–2 Tage (Einbau, Rechenlauf über alle Zeilen, Kontrolle); Rechenzeit für etwa 10 Stunden Sprache **nicht gemessen** | 0 €, MIT; `rhubarb.exe` nicht ins Spiel packen, nur ins Werkzeug | sinnvoll erst mit 4–6 Mundbildern je Figur: bei 73 redenden Sheets wären das 150–300 neue Einzelbilder, bei nur Max, Pixel, Opa etwa 6–12 | gering bei den heutigen Sprites; lohnt nur, wenn ein großes Porträt oder Nahaufnahmen reden |
| **3 (nein)** | Audio2Face, Montreal Forced Aligner, Papagayo-NG | – | – | – | kein Nutzen für 2D-Profil-Sprites; Audio2Face läuft auf der Radeon nicht |

Reihenfolge: Stufe 0 sofort (ist ein Fehler), Stufe 1 zusammen mit dem Blindtest der Stimmen (20 Zeilen von Max, Pixel, Opa), Stufe 2 erst entscheiden, wenn Stufe 1 im Spiel zu sehen ist.
