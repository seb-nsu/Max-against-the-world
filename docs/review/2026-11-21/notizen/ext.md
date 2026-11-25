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
