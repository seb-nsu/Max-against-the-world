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
