# Lessons Learned

Gesammelt aus der Arbeit an Prolog, Welt 1 und Welt 2 (6. bis 17. November 2026, Abschnitt 11 aus dem Review vom 17. November), ergänzt um Welt 3 und die Umsetzung des Reviews vom 20. November (bis 21. November 2026). Das Dokument soll Welt 3, Welt 4 und das Finale schneller machen: Was hat funktioniert, wo hat es mehrere Runden gebraucht, und wie sparen wir uns die beim nächsten Mal.

Die verbindlichen Regeln für Stil, Bausteine und Prompts stehen weiterhin in `grafik/00-stil-und-werkzeuge.md`, Entscheidungen in `entscheidungen.md`. Hier steht das Warum und die Arbeitsweise. Schalter und Aufrufe einzelner Werkzeuge gehören in deren `liesmich.md` (zum Beispiel `tools/grafik_w3/liesmich.md`, `game/tests/werkzeuge/liesmich.md`), nicht hierher.

## Die zehn wichtigsten Regeln

1. **Erst eine vollständige Liste, dann arbeiten.** Für jede Welt zuerst eine ID-genaue Statusliste aller Shots anlegen (Figuren, Posen, Bewegungen, Gegenstände, Räume, Effekte) und nach jeder Runde nachführen. Sonst fällt erst auf Nachfrage auf, dass „doch noch 27 fehlen“.
2. **Eine Stelle für jede Wahrheit.** Eine Gesamtliste statt mehrerer Offen-Listen, Prompts nur in `grafik/fertige-prompts/` auf main, alles Fertige schnell nach main.
3. **Ein Thread je Zuständigkeit.** Ein Thread für Prompts, Posen und Animationen, einer für den Welt-Einbau. Wer was macht, steht am Anfang fest.
4. **Läufe nie direkt von Gemini.** Bewegung aus dem Meshy-Clip, Aussehen aus dem gemalten Sprite (Teile-Rig), 8 Bilder nach Slynyrd-Schema, automatische Prüfung auf genau zwei Beine und keine Löcher.
5. **Posenbögen mit festen Spalten.** Höchstens vier Posen, jede in eigener Spalte, mindestens eine Kopfbreite Magenta dazwischen, Vorlage ist immer das saubere Konzeptblatt.
6. **Varianten im selben Chat aus dem Grundbild.** Zweite Fassungen (Tür offen, Nase ab) und Korrekturen per Maske, und beim Einbau nur die geänderte Stelle ins Grundbild setzen. **Vor jedem Einbau in einen bestehenden Raum dessen aktuellen Zustand und die Perspektive des Gegenstands prüfen** (feste Regel, Sebastian 21.11., Abschnitt 4).
7. **Breite Räume als ein Panorama.** Ein fertiges Bild im selben Chat auf 32:9 verbreitern lassen statt zwei Hälften einzeln zu erzeugen.
8. **Vor der Abgabe selbst so schauen wie Sebastian.** Figuren über den Hintergrund legen, Einzelbilder vergrößert prüfen, GIF in Spieltempo ansehen.
9. **Kosten vorher nennen und ehrlich zählen.** Budgetgrenze vor jedem Stapel, echte Kosten inklusive Wiederholungen und Vorlagen.
10. **Screenshot-Referenzen nur unter Linux aufnehmen**, vor jedem Push pullen, große Quellbögen nie nach main.

---

## 1. Wie werden Animationen gemacht?

### Was sich durchgesetzt hat

Wir haben fünf Wege ausprobiert. Geblieben ist eine Aufteilung nach Art der Bewegung:

| Bewegung | Weg | Warum |
| --- | --- | --- |
| Gehen und Rennen von Menschen | **Teile-Rig:** gemaltes Sprite in Teile zerlegt (Kopf, Rumpf, Arme, Ober-/Unterschenkel, Füße), Winkel aus einem Meshy-Clip, 8 Bilder | Figur sieht in jedem Bild aus wie im Stand, Bewegung ist echt und flüssig |
| Ganzkörper-Bewegungen von Menschen (Aufstehen, Fallen, Hinsetzen, Würfe) | Meshy-Clip als Vorlage, Teile-Rig oder gemalte Schlüsselposen | Bibliothek hat fertige Bewegungen, Timing stimmt |
| Gesten mit Gegenstand (Hämmern, Rühren, Stempeln, Reden mit Kelle) | **Posenbogen** aus Gemini/Meshy mit 2 bis 4 Schlüsselposen, Timing aus 3D-Clip, Zwischenbilder | Armhaltungen, die im Sprite nicht vorkommen, lassen sich nicht aus einem Bild herausdrehen |
| Tiere (Pixel, Minka, Ziegen, Sobek, Hofkater, Schildkröte) | Gemalte Posen Bild für Bild, Zwischenbilder gemalt oder per Code | Meshy riggt keine Vierbeiner, ein eigenes Blender-Rig für Pixel sah nach „anderer Katze“ aus |
| Atmen, Blinzeln, Mund, Schwanz, Ohren | Per Code aus dem vorhandenen Sprite | Kostet nichts, reicht bei 60 bis 190 Pixeln völlig |
| Effekte und lebendige Hintergründe (Wasser, Feuer, Wind, Wolken) | Godot-Ambiente-Ebene (`cq_ambiente.gd`, `ambiente:` in `tools/layout/*.yaml`), gemalte Einzelanimationen nur wo nötig | Ohne neue Bilder, wirkt sofort lebendiger |

### Was nicht funktioniert hat

- **Gemini malt Läufe in Seitenansicht schlecht.** „Vorderer Fuß“ und „anderer Fuß“ kann es nicht unterscheiden. Ergebnis: viermal dasselbe Bild (Toadi, Zeldina, Ziegen, Hermes), oder die untere Reihe ist eine Kopie der oberen (Minka). Auch mit acht einzeln beschriebenen Bildern, dunklerem fernen Bein und Spiegel-Prüfpunkt wurde es nicht zuverlässig. Den Durchschwung (Beine dicht beieinander) hat Gemini bei keinem Versuch übernommen.
- **Direkt gerendertes 3D-Modell** (Variante „b“ bei Toadi): Bewegung top, aber es wirkt technisch, Konturen und Farben passen nicht, Gesicht geht verloren. Mit viel Nachputzen besser, aber nicht für alle Figuren machbar.
- **3D-Körper mit aufgesetztem gemaltem Kopf** (erster „Mischweg“ bei Max und Opa): Körper und Kopf haben andere Linien, Opa wirkt kerzengerade statt gebückt. Verworfen.
- **Meshy-Modell aus drei Ansichten** statt einer: nicht näher am gemalten Max, eher erwachsener. 3D-Modelle sehen nie ganz aus wie die gezeichnete Figur.
- **Zu viele Zwischenbilder** (16 statt 8) machen Läufe zäh. Slynyrd: lieber starke Schlüsselbilder.
- **Arm aus dem Sprite herausdrehen** für Gesten (erster Alwin, erster Schmied): Vorbeugen und Hand an der Zange gehen so nicht. Sebastian hat beide sofort abgelehnt.

### Der Weg für einen Lauf, Schritt für Schritt

1. Meshy-Rig der Figur (oder ein vorhandenes Rig mit passender Gangart wiederverwenden; die Beinbewegung hängt nur am Clip, nicht am Körper).
2. Passenden Bibliotheks-Clip wählen: normales Gehen, schweres Gehen, Frauengang, Kiste tragen, Joggen. Ein Clip kostet 3 Credits und lässt sich auf jedes Rig legen.
3. Winkel je Knochen in Blender auslesen.
4. Sprite in Teile zerlegen, **Original-Beine aus dem Rumpf entfernen** und die Kleidung darunter schließen. Jedes Bein ein eigenes, geschlossenes Teil mit Kontur. Röcke und Roben: Saum schwingt, Füße laufen gegenläufig darunter.
5. 8 Bilder nach dem Schema Aufsetzen, Abfedern, Durchschwung, Hochpunkt und dasselbe mit der anderen Seite, etwa 60 bis 100 ms je Bild. Körper wippt mit.
6. Automatische Prüfung jedes Bildes: genau zwei Beine, lückenloser Umriss, keine Einzelpixel.
7. Lauftempo an die Schrittlänge anpassen, sonst rutschen die Füße (Max: 150 px/s war der Kompromiss).
8. Kontaktbogen mit allen Einzelbildern plus GIF alt/neu an Sebastian, erst nach OK einbauen.

### Posenbögen richtig bestellen

- **Vorlage ist immer das saubere Konzeptblatt**, nie das Spiel-Sprite. Mit Sprite-Vorlage malt Gemini Pixel-Art nach, die beim Verkleinern verschwimmt.
- Höchstens vier Posen. Jede Pose in einer eigenen, gleich breiten Spalte mit mindestens einer Kopfbreite freiem Magenta dazwischen, nichts ragt in die Nachbarspalte. Lieber kleiner zeichnen lassen.
- „Frozen still pose“ statt Bewegungswörtern („mid-leap“, „getting up“ erzeugen Bewegungsunschärfe und Geisterfiguren).
- Hintergrund `solid flat magenta (#ff00ff)`, nie „transparent“ (Gemini malt ein Schachbrett und löscht dann weißes Haar mit).
- Gegenstände, mit denen die Figur arbeitet, **im Bild mitzeichnen** und festlegen, wo sie bleiben: Ohne Kessel sah Alwins Rühren wie Zeigen aus, Humberts Krug „verschwand“, das Hufeisen muss in jedem Bild auf Amboss-Höhe liegen.
- Wortgleiche Figurbeschreibung mit Hex-Farben (CHARACTER LOCK) und das Raster STYLE, SUBJECT, PALETTE, ACTION, END POSE, CAMERA, NEGATIVE.
- Endpose und Anzahl Bilder ausdrücklich nennen, Gemini liefert sonst eine mehr oder weniger.
- Nur eine Reihe. Bei zwei Reihen kopiert Gemini die obere nach unten.
- Den Kater in Prompts „the tomcat“ nennen. „Pixel“ blockiert Gemini als Google-Marke.

### Nach dem Bauen prüfen (sonst findet Sebastian es)

Diese Fehler hat Sebastian gefunden, nicht wir. Sie gehören in die automatische und visuelle Prüfung vor jeder Abgabe:

- halbe Hände, fehlende Pfoten, ein Bein zu viel, „vier Beine“ durch Reste im Rumpf
- abgeschnittener Po hinter Schürze (Humbert, Schmied), Lücke zwischen den Beinen mit Hintergrundfarbe gefüllt (Zauberstabmacher)
- Lücke zwischen Arm und Kiste fälschlich geschlossen (Rotkäppchen, Zeldina)
- Farbsprünge (Stempel grün statt braun, Hammerkopf rot), Eimer wechselt die Seite
- Figur in Gesten kräftiger als im Stand: alle Bilder automatisch auf höchstens 5 % Größenabweichung zum Stand prüfen
- Gesten springen von Pose zu Pose: Zwischenbilder und weicheres Timing gleich mitbauen

---

## 2. Wie wird eine saubere Struktur gehalten?

- **Besitzerregel aus `00-aufbau.md` gilt auch für Grafik-Listen.** Es gab zeitweise `welt-2-offen.md`, `welt-1-offen.md`, `00-offen-prolog-welt-1-welt-2.md`, eine ältere Kopie auf Sebastians Rechner und ein Artifact mit „benötigten Bildern“. Sebastian: „ein reines Chaos, wo welche Prompts stehen.“ Künftig: **eine** Gesamtliste je Abschnitt (Vorbild `grafik/status-alle-shots.md`), andere Listen verweisen nur darauf.
- **Statusliste mit IDs von Anfang an.** Jede Zeile: ID, Titel, Art, Quelldatei oder „fehlt“, gebaut ja/nein, im Spiel (main / Branch / nein), Grund und Zuständigkeit, wenn offen. Effekte und lebendige Hintergründe gehören mit hinein. Nach jeder Runde aktualisieren und die Zahlen je Status melden.
- **Den Status setzt der Einbau-PR** (20.11.): „wartet auf Abnahme“ und „im Spiel“ nicht im selben PR mischen. In Welt 3 standen 113 von 133 Zeilen auf „nein“, obwohl sie eingebaut waren; nachgeführt am 21.11., mit `tools/grafik_fundstellen.py` als Gegenprobe.
- **Übergabe PC → Cloud-Thread über einen Übergabezweig** `claude/<welt>-transfer` (20.11.): nie mergen, nach dem Einbau löschen.
- **Erzeugte Dateien nie von Hand mergen.** Alles in `grafik/fertige-prompts/` erzeugt `tools/prompts_zusammensetzen.py` aus den Grafik-Dateien. Bei Konflikten die Quellen mergen und das Werkzeug neu laufen lassen. Gleiches gilt für `game/daten/` und `texte.csv`.
- **Abweichungen dokumentieren.** Wenn das fertige Bild von Skizze oder Motiv abweicht (Klassenzimmer neu aufgeteilt, Brücke mit Rampen), steht das je Raum in „Umgesetzt und Abweichungen“ der Grafik-Datei. Ab dem fertigen Bild gilt das Bild, nicht mehr die Skizze. Motive vor dem Malen mit dem Spiel abgleichen (Welt 2: fünf Motive beschrieben die Dinge in anderer Reihenfolge als das Spiel).
- **Nacharbeiten als Liste führen.** Jede Nachfärbung, jedes eingesetzte Objekt, jede übermalte Stelle in `offene-punkte.md` (P15) mit Raum, Stelle und Grund. Das hat das spätere Review und den Aseprite-Durchgang stark vereinfacht.
- **Originale aufheben.** Gemini-Bilder in voller Größe unter `E:\Game Engine\Grafiken\assets\…`, 3D-Modelle und Rigs unter `…\Grafiken\3d\<figur>`, Aufgaben-IDs in einer Textdatei. Nie aus Screenshots arbeiten.
- **Große Quellbögen bleiben außerhalb von main.** PRs mit Quellmaterial (Nacht-Einbau: 330 MB) per Squash mergen.
- **Fertiges schnell nach main.** Lange liegende Branches haben mehrfach zu Doppelarbeit und „welche Prompts gelten?“ geführt. Sobald etwas geprüft ist: PR, CI grün, merge, lokalen Ordner nachziehen.

---

## 3. Wie viele Threads gleichzeitig?

**Empfehlung: zwei Arbeits-Threads plus die Sitzung auf dem PC, höchstens drei.**

Am 14. und 15. November liefen meist zwei Threads parallel („Offene Grafik-Prompts optimieren“ und „Welt 2 grafisch ins Spiel bringen“), dazu die Remote-Control-Sitzung auf dem Rechner und zeitweise ein Review- oder Fix-Thread. Das hat gut funktioniert, wenn die Zuständigkeit klar war, und schlecht, wenn nicht:

- **Gut:** Welt 2 baut Räume ein, der andere Thread macht Posen, Animationen und Merges. Ein Review-Thread, der nur prüft und nichts ändert, parallel zu einem Fix-Thread.
- **Schlecht:** Beide Threads führten Posenbögen für Welt 2, bis Sebastian klarstellte, wer zuständig ist. Prolog- und Welt-1-Thread arbeiteten im selben lokalen Ordner, deshalb konnte einer die neuen Gänge nicht im Spiel prüfen. Screenshot-Referenzen wurden von zwei Threads auf unterschiedlichen Rechnern aufgenommen und fielen wechselseitig durch.

Regeln für parallele Threads:

1. **Zuständigkeit beim Start festlegen** und in den Thread-Auftrag schreiben: welche Dateien, welche IDs, wer merged. Grafik-Notiz und Prompts einer Welt haben genau einen Besitzer-Thread, und jeder PR bekommt einen neuen Zweig (20.11.: Stadtstraßen-Prompt lief in zwei PRs).
2. **Ein Thread übernimmt die Merges nach main** (bisher der Prompt-/Animations-Thread, weil dort `gh` verfügbar war). Andere Threads melden „Branch X ist fertig, main schon eingemischt, Test grün“.
3. **Gemeinsamer Code wird angekündigt** (Beispiel: `CQFigur.laufen_zu` bekam einen dritten Parameter). Dateien, die beide anfassen (Figuren-JSON, `cq_raum.gd`, Screenshot-Referenzen), haben einen Besitzer.
4. **Jeder Thread arbeitet in eigenem Checkout oder Worktree**, nie im gemeinsamen Ordner `E:\Claude\Couch Quest`, in dem Sebastians Godot-Änderungen liegen.
5. **Vor jedem Push pullen** und main einmischen.
6. Ein dritter Thread lohnt sich nur für klar abgegrenzte Arbeit (Review, Audio, ein Fehler). Mehr als drei bringt nichts, weil Sebastian die Bilder liefert und abnimmt und damit der Engpass ist.
7. **Arbeitspakete parallel im selben Checkout** (Welt-3-Review, 21.11.): Jedes Paket ändert nur seine eigenen Dateien und committet nicht selbst; was eine Datei eines anderen Pakets bräuchte, wird gemeldet statt geändert.

---

## 4. Wie läuft der Einbau?

### Hintergrund

1. Sebastian (oder Claude) erzeugt das Bild mit Prompt plus Layout-Skizze. Bei schwierigen Räumen Positionsangaben in Prozent dazuschreiben.
2. Claude prüft gegen Skizze, Motiv und Rätsel **bevor** gemalt wird, was danach kommt (Varianten). Typische Funde: doppelte Pyramide an der Naht, orange Fläche, Ausgänge zu nah beieinander, Turm zu klein für den späteren Gag.
3. Original in voller Größe ablegen (PNG, „Bild speichern unter“), nicht als Screenshot und nicht als ZIP über den Chat (kam einmal leer an).
4. `tools/pixelieren.py` auf 640×360 (Breitbild 1280×360), 32 Farben; Räume mit kleinen, kräftigen Farben (Sparschwein, Laser) brauchen 40 Farben oder Nachfärben (21.11.). Kleine Dinge, die dabei untergehen (Grammophon, rosa Schloss, Kesselfeuer, Pilzhüte), gezielt nachfärben und in P15 eintragen.
5. Gegenstände, die Max mitnimmt, als eigene Sprites ausschneiden und die Stelle übermalen (Aseprite-Skript im Batch-Modus).
6. Laufbereich, Klickflächen, Ausgänge und Figurenplätze **am fertigen Bild** vermessen, nicht an der Skizze. Klickflächen, die einen Zustand zeigen (Pfütze, Scherben, Datenanschluss, Brille), bekommen dieselbe Bedingung wie das Bild (20.11.). Größen auch gegen Möbel messen: Max ist etwa 1,75 m, Tischplatte etwa Hüfthöhe, Tür etwa 1,2 × Max; `skala` 1,0 vorn und die Tiefe aus dem Rohbau (Welt 3, 21.11.).
7. Figuren über das Bild legen und je Raum prüfen: Steht jemand vor dem Pult oder im Weg? Stimmt die Blickrichtung? Verdeckt eine Figur einen Gegenstand? Passt die Größe zum gemalten Publikum?
8. Bildschirmfoto des Raums, Test der Welt (zum Beispiel `welt_2_anspiel`), pushen. Den vollen Durchspieltest und `pruefen.py` lässt die CI beim PR laufen; lokal reichen Bildschirmfoto und Welt-Test, solange keine Spiellogik geändert wird (Sebastians Entscheidung vom 13. November).

### Bild in einen bestehenden Raum einsetzen (feste Regel, Sebastian 21. November 2026)

**Vor jedem Einbau eines Bildes in einen bestehenden Raum zuerst den aktuellen Zustand des Raums (welcher Hintergrund, welche Variante gilt gerade) und die Perspektive des Gegenstands prüfen.** Anlass: Gemini malte den Kapsel-Kasten gerade von vorn, Sebastians Kasten ist schräg von oben gemalt (Hinterkante 35 px nach rechts versetzt), der Deckel saß daneben.

1. Aktuellen Hintergrund und Variante aus dem Layout nehmen, nicht aus Erinnerung oder der ersten Fassung.
2. Fluchtkanten und Ecken des Gegenstands im Hintergrund vermessen (Raster-Zoom).
3. Die Vorlage für Gemini aus dem aktuellen Hintergrund ausschneiden und die Schrägsicht im Prompt nennen.
4. Beim Einsetzen nur die geänderten Teile übernehmen (bei der Kapsel Deckel, Öffnung und Max; die Vorderseite bleibt aus dem Hintergrund) und auf die gemessenen Kanten umrechnen (`tools/grafik_w3/kapsel_v02.py`). Ein Gemini-Bild (0,07 $) reichte.
5. Erst dann vergrößert im Raum ansehen und zeigen.

Dasselbe gilt für Effekte, die eine Figur zeigen: immer aus Bild 0 des aktuellen Spiel-Blatts bauen. Der Hausmeister rollte zuerst aus dem alten Stand, mit dem Mopp oben und in falscher Größe (`tools/grafik_w3/hausmeister_rollen.py`). Bildfolgen mit Möbel (Kapsel) hängen am Hintergrund: Wird der Raum neu gemalt, müssen sie mit.

### Figuren und Animationen

1. Bogen freistellen (Magenta), auf Spielgröße und Palette der Figur bringen.
2. Bewegung bauen (siehe Abschnitt 1), Kontaktbogen und GIF zeigen.
3. Nach Freigabe auf eigenem Branch einbauen, Figuren-JSON (`von`, Anzahl, `ms`) und Szene anpassen.
4. Godot importiert geänderte Bilder neu. Werden Sprite-Blätter breiter, schneidet ein alter Import-Cache die Figuren halb ab: neu importieren und den Editor neu starten.

### Zustände und Varianten

Varianten entstehen im selben Chat aus dem Grundbild. Gemini verändert dabei trotzdem Kleinigkeiten (Menge, Pflaster, Verschiebung). Deshalb **nur die geänderte Stelle nach ihrem Umriss** ins Grundbild setzen, nie als Rechteck (sonst Kante an der Agora-Statue). Dann springt beim Wechsel nichts.

Welt 3 (20. November 2026): Die Farbdifferenz allein findet auch Geminis Verschiebungen im ganzen Bild. **Die Suche auf grobe Rechtecke beschränken** (`BEREICHE` in `tools/grafik_w3/raeume_pixelieren.py`) und innerhalb davon nach Umriss übernehmen; wo der Umriss zerfällt (gekippter Eimer), das ganze Rechteck nehmen. **Eine gemeinsame Palette für Grundbild und Varianten**, sonst verfärbt sich beim Wechsel der ganze Raum. Zustände, die unabhängig voneinander kommen (Schnee, Kaffee), als eigene Varianten plus Kombination; `hintergrund_nach` nimmt dafür auch Schalter und „A+B“.

Effekte und Varianten (21. November 2026):

- **Ausschnitt-Effekte gegen jede Hintergrund-Variante bauen** (die Küche hat ab R4 andere Farbwerte) und im Layout mit `wenn`/`sonst` trennen.
- **Effektstreifen gegen den Hintergrund vergleichen**, nicht nur zwischen den Bildern; sonst verschwinden feste Teile wie die Weckerziffern.
- **Einmalige Effekte, die einen neuen Hintergrund vorwegnehmen** (Fächer des Automaten): letztes Bild halten und erst ein paar Frames nach dem Hintergrundwechsel entfernen.
- **Effekt-Sheets auf leere Zeilen prüfen**: Das „Federn“ der Autos ließ eine Zeile durchsichtig, im Spiel ein waagrechter Strich.

### Tests und CI

- Screenshot-Referenzen weichen zwischen Windows und dem Mesa-Renderer der CI um mehr als 0,5 % ab. **Referenzen nur unter Linux oder aus dem CI-Render aufnehmen.** Der Welt-Einbau pusht nur die Raumgrafik, die Referenzen nimmt ein Thread unter Linux auf.
- Wer Raumgehalt verschiebt (Minka auf den Tresen), muss die Referenz dieses Raums mit erneuern, sonst ist main rot.
- Eine rote CI auf main zuerst auf fremde Änderungen prüfen: Die Taverne-Abweichung in PR #21 kam aus main, nicht aus Welt 2.
- `.import`-Dateien und `game/project.godot` aus Sebastians Arbeitskopie nie mitcommitten.
- **Referenzen im selben Grafik-PR erneuern** (Workflow auf dem PR-Zweig, Übersicht alt/neu ansehen, gewollt geänderte Räume im PR nennen). Ein über einen Tag roter main ist ein Stopp-Signal (Welt 3: 66 Stunden rot, 20.11.).
- **Eine Warnung in `pruefen.py` bricht `alles_pruefen.py` ab.** Neue strenge Prüfungen deshalb erst für den bearbeiteten Abschnitt einschalten und den Rest als Hinweis melden (Längen: `LAENGE_STRENG_PRAEFIX`, 21.11.).
- **Nach `--erzeugen` Godot neu starten**: Ein laufendes Godot liest erzeugte Daten nur beim Start. Neue Effekt-PNGs vorher headless importieren (`--headless --path game --import`), sonst lädt es die alte Fassung.
- **Python `write_text` schreibt unter Windows CRLF**; für erzeugte Dateien `newline="\n"` setzen.
- **Eigene Prüfskripte, die im Wohnzimmer starten:** Die Prolog-Szene bricht beim `welt_beginnen` ab und lässt `Spiel.in_szene` hochgezählt, und Max' Sofa-Pose bleibt hängen (Hauptbild aus). `Spiel.in_szene` auf 0 setzen, Kinder „Pose*“ entfernen, Sprite sichtbar und Alpha 1 (in `raumaufnahme.gd` seit 21.11.).
- **Das Zeigerraster kommt in Welt 3 nicht über das Wohnzimmer hinaus** (mit unbegrenzten FPS hängt es). Ersatz bis zur Reparatur: Abdeckung aus den Aufnahme-JSONs rechnen (`docs/review/2026-11-20/belege/umsetzung/ap04_abdeckung.tsv`).

### Sebastians lokaler Ordner

Nach jedem Merge den lokalen Ordner per `git pull --ff-only` nachziehen. Nie resetten, stashen-und-verwerfen oder löschen: Dort liegen ungesicherte Änderungen (Hauptmenü, Dachboden-Szenen, `tools/gemini_bild_mcp.py`, Import-Dateien). Blockiert eine lokale Änderung den Pull, melden und stoppen.

---

## 5. Zusammenspiel Gemini, Meshy, Aseprite, Blender und Claude

| Werkzeug | Aufgabe | Wer bedient |
| --- | --- | --- |
| **Gemini-Chat** | Hintergründe, Konzeptblätter, Panoramen, Varianten. Viele Runden und Korrekturen im selben Chat | Sebastian, Prompts von Claude |
| **Gemini-API** (`gemini-bild`-MCP auf dem PC) | Stapel ohne Tageslimit, Nano Banana 2.1, etwa 0,05 $ je Bild in 2K, real eher 0,07 $ mit Vorlagen und Wiederholungen | Claude, nur mit Budget |
| **Meshy** (MCP) | 3D-Modell und Rig für Menschen (etwa 20 Credits), Bibliotheks-Clips (3 Credits), Bewegung nach Text (13 Credits), **Bilder mit Nano Banana 2.1 für 4 Credits** | Claude, Freigabe per Text |
| **Blender** (MCP) | Clips abspielen, Knochenwinkel auslesen, Seitenansicht rendern. Muss auf dem PC laufen | Claude |
| **Aseprite** (MCP, Lua im Batch) | Ausschneiden, Übermalen, Nachfärben, Paletten, Nachpixeln einzelner Bilder | Claude, Sebastian bei Bedarf |
| **Python-Werkzeuge** (`tools/figur.py`, `pixelieren.py`, `prompts_zusammensetzen.py`) | Freistellen, Umrechnen, Teile-Rig, Prompt-Dateien erzeugen | Claude |
| **Godot** | Einbau, Ambiente-Ebene, Tests, Bildschirmfotos | Claude, Feinjustage (z. B. Kleiderbügel) auch Sebastian |
| **Claude** | Prompts, Prüfung gegen Skizze und Rätsel, Umrechnen, Einbau, Animation, Tests, PRs | – |

### Was wir gelernt haben

- **Seit 15. November laufen Posenbögen und Bilder über Meshy statt über das Gemini-Konto.** Gleiches Modell, 4 Credits je Bild, Credits waren reichlich da (Stand am 15.11.: etwa 1.700 nach allen Läufen und Gesten).
- **Hintergründe malt Sebastian im Gemini-Chat besser selbst.** Bei der Trollbrücke war seine Fassung nach 4 Runden besser als Claudes nach 6. Der Chat ist flexibler und ohne Kosten pro Bild, hat aber ein Tageskontingent. Das Kontingent ist der Engpass des Projekts, nicht der Einbau.
- **Nahansichten malt Sebastian im Chat, Claude setzt nur die Schrift** (Welt 3, 20.11.).
- **Meshy ersetzt kein Malen.** Es liefert Bewegung, Timing und Beinwinkel. Aussehen und Gesicht kommen immer aus dem gemalten Sprite.
- **Rigs wiederverwenden.** Alle Meshy-Rigs haben dasselbe Skelett. Ein Clip lässt sich auf jedes Rig legen, das spart neue Figuren-Rigs (Läufe aller Welt-1-Leute für 15 statt etwa 350 Credits).
- **Für Figuren, die nur sitzen oder in etwas stecken** (Beamter 1 auf dem Hocker, Philosoph in der Tonne), braucht Meshy eine stehende Vorlage in T-Pose auf Weiß (Baustein 3D-VORLAGE).
- **Higgsfield** lohnt sich erst für Intro, Outro oder Trailer (Video). Für Sprites bringt es nichts gegenüber Meshy. PixelLab wäre für direkte Sprites einen Test wert (nicht geprüft).
- **Neue MCP-Server** lädt Claude Code erst nach einem Neustart.

### Freigaben

- **Die Sitzung auf dem PC akzeptiert keine Auswahl auf einer Entscheidungskarte.** Sie braucht Sebastians Freigabe als eigenen, wörtlichen Text im Thread, zum Beispiel „ja, alle 27 bis 480 Credits“. Deshalb Kosten-Freigaben gleich als Satz zum Abtippen anbieten statt als Karte, sonst gibt es eine Runde mehr.
- Direkte Pushes nach main blockt die Rechte-Prüfung. Der Weg ist ein PR von dem Thread, der `gh` hat.
- Ohne GitHub-Anmeldung im Browser kann die PC-Sitzung keine CI-Artefakte laden.

---

## 6. Wo es mehrere Runden gebraucht hat und wie wir sie künftig sparen

| Thema | Was passiert ist | Runden | Künftig |
| --- | --- | --- | --- |
| Läufe aus Gemini | Gleiches Bein vorn, Kopie der oberen Reihe, kein Durchschwung | 6 bis 8 Fassungen je Lauf (Minka a bis g, Toadi a bis b6), etwa 20 € | Läufe gleich über Meshy-Clip und Teile-Rig. Gemini nur für Tiere, und dort Bild für Bild |
| Toadi-Lauf | a, b, c verglichen, b poliert, dann doch a „richtig“ (a3 bis a5) | etwa 8 | Teile-Rig ist der Standard, nicht erneut vergleichen. Bei kleinen Figuren (Beine unter 15 px) Beine im Teile-Rig verlängern |
| Teile-Rig aufräumen | Vier Beine, Löcher, fehlender Po, gefüllte Lücken | 3 | Prüfskript (zwei Beine, keine Löcher, Silhouette gegen Stand) läuft vor dem ersten Zeigen, Kontaktbogen statt nur GIF |
| Posenbögen | Posen ineinander, Kelle im Nachbarbild, Kessel fehlte, Sprite statt Konzeptblatt als Vorlage | 3 | Spaltenregel, Konzeptblatt, Gegenstände mitzeichnen von Anfang an (steht jetzt in den Bausteinen) |
| Alwin und Schmied | Erst Arm gedreht, dann Posen, dann mehr Bilder, dann mit Kessel und Amboss | 5 | Gesten mit Gegenstand nie per Teile-Drehung. Sofort Posenbogen mit Gegenstand, 8 Bilder |
| Vollständigkeit | „Sind das wirklich alle?“, dann 22, dann 27, dann 69 fehlende | 4 Nachfragen | Statusliste aller IDs zuerst, Lücken selbst melden, bevor Sebastian fragt |
| Breite Räume | Zwei Hälften mit anderer Perspektive und Maßstab, Naht durch eine Fries-Figur | 2 bis 3 je Raum | Ein Bild erzeugen, dann im selben Chat auf 32:9 verbreitern. Nähte und Fries prüfen |
| Varianten | Gemini verschiebt das Bild leicht | 1 Nacharbeit je Raum | Nur geänderte Stelle nach Umriss einsetzen |
| Figurenpositionen | Cicero vor dem Pult, Beamte vor dem Schalter, Nebet verdeckt Brot, Hermes im Schilf | 2 Runden durch Sebastian | Vor Abgabe jeden Raum mit allen Figuren aufnehmen und auf Pult, Weg, Verdeckung, Blickrichtung prüfen |
| Grammophon | Neu gezeichnet, Sebastian wollte das Original | 2 | Gelungenes Gemini-Original nicht „verbessern“ ohne Rückfrage. Vorher-nachher zeigen, bevor es ersetzt wird |
| Kleiderbügel, Zapp-O-Mat, Kabel | Größe, Farbe, Perspektive, Rollen im Boden, Kabel doppelt | 4 bis 5 | Props an der Perspektive des Möbels messen (Winkel der Schranktür, Dielen), Kontaktpunkte am Boden prüfen. Sebastian kann im Editor selbst justieren |
| Max' Gang | Schnell und rutschend, dann stapfend, dann C mit 150 px/s | 3 | Tempo immer aus Schrittlänge und Bildrate rechnen und mit Dielen-GIF zeigen, mehrere Fassungen auf einmal anbieten |
| Gemini-Eigenheiten | „Pixel“ blockiert, Korrekturen ignoriert (Flaschen), Regal verdoppelt statt verschoben | 2 bis 4 | „the tomcat“, Gleiches (Flaschen) selbst als exakte Kopien einsetzen, Leerräumen statt Verschieben verlangen |
| Bildübergabe | Screenshots (1024 px), JPEG, leere ZIP | 1 Runde je Fall | Immer Original als PNG in den Grafikordner, Claude prüft Größe vor dem Einbau |
| Budget | Eigene Zählung zu niedrig (20 von 31 € statt erwartet weniger) | – | Realen Stückpreis mit Vorlagen und Wiederholungen ansetzen, Kontostand regelmäßig abfragen, bei 70 % melden |
| Freigaben | Karte gewählt, PC-Sitzung erkennt sie nicht | 1 je Freigabe | Satz zum Abtippen anbieten |
| Screenshot-CI | Windows-Referenzen fallen auf Linux durch | mehrere Pushes | Nur Linux-Referenzen, ein zuständiger Thread |
| Doppelte Arbeit | Zwei Threads führten Welt-2-Posen und Offen-Listen | – | Zuständigkeit beim Start festlegen |
| Kapsel-Deckel (Welt 3, 21.11.) | Gemini malte den Kasten gerade von vorn, der Hintergrund zeigt ihn schräg von oben; Deckel 35 px daneben | 2 | Feste Regel aus Abschnitt 4: Zustand und Perspektive vor dem Einbau prüfen |
| Hausmeister rollt (Welt 3, 21.11.) | Streifen aus dem alten Stand: Mopp oben, falsche Größe | 2 | Effekte mit Figur aus Bild 0 des aktuellen Spiel-Blatts |
| Code-Sicht (Welt 3, 20./21.11.) | Liste fertiger Tauschsätze verriet die Lösung, Tutorial und Hinweise sagten „anklicken“ | Review plus Umbau | Bedienung und Texte zusammen entwerfen; Lösungen nie als Auswahl anbieten, freie Versuche kosten etwas |
| Pixels Trab (alle Welten, 21.11.) | Pfoten wanderten 11 px je Zyklus bei 160 px/s, 86 % Rutschen, seit Welt 1 unbemerkt | 1 | Schrittweite und Tempo zusammen rechnen; jede neue Gangart bekommt ihr eigenes Tempo (Hinken 85 ms, 90 px/s) |

---

## 7. Nachbesserungen: wo Sebastian mehrmals nachhaken musste

Viele Ergebnisse waren beim ersten Zeigen nicht fertig. Die folgenden Stellen hat Sebastian beim Ansehen gefunden, oft mehrmals hintereinander. Jede Runde kostet ihn eine Prüfung und uns einen Durchlauf.

| Stelle | Runden | Was jedes Mal noch nicht stimmte | Was vorher hätte geprüft werden müssen |
| --- | --- | --- | --- |
| Kleiderbügel (Prolog) | 5 | zu klein, zu hell, falsche Lage, keine Perspektive zur schrägen Schranktür; einmal sollte Sebastian ihn selbst stellen, dann doch wieder Claude | Größe an Möbeln messen, Winkel der Fläche übernehmen, auf der der Gegenstand hängt, Ausschnitt vergrößert zeigen |
| Zapp-O-Mat und Kabel | 4 | schwebt an der Wand, Rolle im Boden, nur eine Rolle sichtbar, Kabel doppelt | Kontaktpunkte am Boden und Übergänge zwischen Sprite und Hintergrund vergrößert prüfen |
| Max auf dem Sofa | 3 | Liegen aus gedrehtem Steh-Sprite „amateurhaft“, dann in der Armlehne, dann richtig | Keine Pose aus einem gedrehten Sprite bauen, gleich eine gemalte Pose bestellen |
| Max auf der Treppe | 3 | sinkt ein, kein echtes Steigen, erste Stufen übersprungen | Trittflächen pixelgenau messen, Laufband ab der ersten Stufe, von beiden Seiten testen |
| Max' Gang und Tempo | 3 | rutscht, dann stapft, dann zu langsam auf dem Dachboden | Tempo aus Schrittlänge rechnen und in allen Räumen mit Tiefenskalierung ansehen |
| Grammophon | 2 | „verbessert“, Sebastian wollte das Original | Gelungenes nicht ungefragt ersetzen |
| Opa | 3 | wechselt beim Reden den Körper, Posen in anderer Jacke, 3D-Körper zu gerade | Eine Quelle für das Aussehen (Figurenbogen), jede neue Fassung neben das Stand-Sprite legen |
| Pixel | 4 | landet sitzend, erscheint plötzlich auf Werkbank und Balken, Trab mit zu dünnen Beinen, wirkt hell und fremd | Übergänge statt Erscheinen, neue Bilder immer neben den Stand und neben Max legen |
| Minka (Platz in der Taverne) | 3 | auf dem Tresen, dann am Bildrand im Tresen, dann vor dem Tresen | Platz mit allen Figuren und Requisiten im Raum prüfen, nicht nur die Figur |
| Minka (Lauf) | 7 | Fassungen a bis g | siehe Abschnitt 6: Lauf-Weg festlegen statt Fassungen zu sammeln |
| Toadi (Lauf und Aussehen) | 8 | a, b, b2, b5, b6, a3, a4, a5: Gesicht, Farbe, Hände, Beinposition, Unterschenkel, Hutstreifen | Vor dem Zeigen gegen das Stand-Sprite prüfen: Hände da, Farben gleich, Beine unter der Kleidung |
| Alwin und Schmied | 5 | Arm gedreht, Hand nicht an der Zange, Hufeisen liegt herum, Kessel fehlt, zu wenig Platz zwischen Posen | Gesten mit Gegenstand immer als Posenbogen mit Gegenstand |
| Teile-Rig aller Menschen | 3 | vier Beine, fehlende Teile, Po fehlt, Waldemars hinteres Bein schwingt nicht | Automatische Prüfung vor dem ersten Zeigen, Kontaktbogen aller Einzelbilder |
| Sobek und Papyrus | 2 | Sobek schlechter als vorher, gezeichnete Linie statt echter Halme | Mit Material aus dem Bild selbst arbeiten, nicht übermalen |
| Thronsaal, Agora, Startbüro, Küche | 2 | Figuren vor Pult und Schalter, falsche Blickrichtung, halbierte Fries-Figur, Kante neben der Statue | Jeden Raum mit allen Figuren aus dem Spiel aufnehmen und Punkt für Punkt prüfen |
| Taverne | 2 | Max versinkt hinter dem Fell, Boden darunter falsch | Flache Objekte als flach markieren, übermalte Stellen an die Umgebung angleichen |

**Was daraus folgt**

- **Vor jedem Zeigen eine feste Prüfliste abarbeiten:** gegen Stand-Sprite (Größe, Farben, Hände, Füße), im Raum mit allen Figuren (Verdeckung, Pult, Weg, Blickrichtung), Kontaktpunkte am Boden, Perspektive, Einzelbilder vergrößert, GIF in Spieltempo.
- **Lieber zwei bis vier Fassungen auf einmal zeigen** (wie beim Gang A bis D) als eine nach der anderen. Sebastian wählt dann einmal.
- **Wenn ein Weg zweimal scheitert, den Weg wechseln** statt eine dritte Fassung zu bauen (Liegen aus gedrehtem Sprite, Läufe aus Gemini, Arm-Drehung für Gesten).
- **Was Sebastian selbst schnell im Editor stellen kann** (Position, Skalierung eines Props), ihm mit Szene und Knoten nennen, statt mehrere Runden zu raten. Danach aber die Zuständigkeit klar halten.

---

## 8. Kostenschätzungen: wo wir danebenlagen

Mehrere Schätzungen waren zu niedrig oder zu hoch. Beides schadet: Zu niedrig verbraucht unbemerkt das Budget, zu hoch führt zu unnötigen Freigaben und Rückfragen.

| Schätzung | Gesagt | Tatsächlich | Ursache |
| --- | --- | --- | --- |
| Nachtlauf Gemini-API (112 Bilder ohne Hintergründe) | 5 bis 10 $, Grenze 25 $ | danach „6 bis 8 $“ gemeldet, am Morgen waren laut Sebastian 20 von 31 € weg | Eigene Zählung ohne Wiederholungen, verworfene Fassungen, Einzelbild-Aufrufe und Vorlagen |
| Preis je Gemini-Bild (Nano Banana 2.1, 2K) | 0,05 $ | real etwa 0,07 $ | Angehängte Vorlagen und Masken-Runden nicht eingerechnet |
| Erste Schätzung für die ganze Liste | 23 bis 31 $ mit Nano Banana Pro | Modell war falsch angenommen, mit 2.1 rund 9 bis 13 $ | Werkzeug-Einstellung statt Sebastians tatsächliches Modell, Googles Preisseite veraltet |
| Läufe aus Gemini Bild für Bild | „etwa 0,40 $“ bzw. 0,55 € je Lauf | Minka allein 0,60 €, ein voller Lauf etwa 1,10 € | Zwischenbilder und Nachbesserungen nicht mitgerechnet |
| Toadi-Test über Meshy | 25 bis 30 Credits | 20 Credits plus 0,85 € bei Gemini | Gemini-Anteil vorher nicht genannt |
| Meshy für alle Menschen-Animationen | etwa 550 Credits (240 für Rigs, 300 für Bewegungen) | Läufe aller Welt-1-Menschen 15 Credits, weil Clips auf vorhandene Rigs passen | Wiederverwendung der Rigs erst später erkannt |
| Welt-1-Menschen | erst 135, dann 350 Credits | 15 Credits | wie oben |
| Welt-2-Menschen in 3D | etwa 450 Credits | 357 Credits | Bibliotheks-Clips statt Text-Bewegungen |
| Meshy-Bild | „3 bis 9“ bzw. „6 Credits pro Bild“ | 4 Credits | Preis nicht nachgeschaut |
| Gesten-Runde | Grenze 120, dann 250, 350, 480 Credits | 139 bei 114 Bewegungen, 243 nach Nachhol-Runde | Umfang war unbekannt, weil die vollständige Liste fehlte |
| Gemini-Bilder bis Spielende | etwa 290 Bilder | noch offen | Schätzung ohne ID-Liste je Welt |
| Welt 3 Meshy (Stand 20.11.) | 150 bis 200 Credits | 54 Credits | Gänge aus Bibliotheks-Clips, Swift-Clips (3 Credits) als Haltungsvorlage, Max' Winkel wiederverwendet |
| Welt 3 Gemini (Stand 20.11.) | 15 bis 20 € | nach KI-Protokoll etwa 8 bis 9 $, Kontostand nicht abgefragt | geschätzt aus dem Protokoll; Chat-Bilder fehlen darin |
| Nacharbeit AP-06 (21.11.) | grob unter 1 $ | 3 Bilder, etwa 0,21 $ | gezielte Varianten aus dem Grundbild statt neuer Bögen |
| Kapsel zweite Fassung (21.11.) | – | 1 Bild, 0,07 $ | nur die geänderten Teile aus Gemini |

Dauer: Der Einbau der 24 neuen Welt-3-Hintergründe (AP-09) brauchte rund 2,6 Stunden, davon viel Prüfen und das hängende Zeigerraster.

**Regeln für künftige Schätzungen**

1. **Erst die vollständige Liste, dann die Zahl.** Ohne ID-Liste wird jede Schätzung mehrfach nach oben korrigiert.
2. **Realen Stückpreis ansetzen:** Bildpreis plus Vorlagen plus durchschnittlich 1,5 Wiederholungen. Für Läufe und Gesten eher Faktor 2.
3. **Preise vor der Schätzung nachsehen** (Meshy-Preisliste, AI Studio) und das Modell prüfen, das wirklich läuft.
4. **Kontostand vorher und nachher abfragen** und die echte Differenz melden, nicht die eigene Zählung; die Ist-Kosten je Welt unter der Schätzung festhalten. Bei Gemini zeigt nur AI Studio den echten Betrag, deshalb Sebastian früh um einen Blick bitten.
5. **Bei 70 % der Grenze anhalten und melden**, nicht erst am Ende.
6. **Wiederverwendung zuerst prüfen** (vorhandene Rigs, Clips, Modelle). Das hat bei Meshy mehrere hundert Credits gespart und hätte die hohen Schätzungen erspart.
7. **Jede Schätzung mit Bandbreite und Annahmen nennen** („bei zwei Versuchen je Bild“), damit Sebastian sieht, woran sie hängt.
8. **Das KI-Protokoll erfasst jede Erzeugung** (Chat, API, Meshy, leere Antworten) mit Status und Kosten (20.11.).
9. **Werkzeuge, die Geld kosten, nehmen ohne Angabe das günstige Modell** (Gemini-MCP seit 20.11. `gemini-nano-banana-2.1`).

---

## 9. Ablauf mit Prüftoren

Angelehnt an die Arbeitsstruktur aus der Agenten-Sammlung agency-agents (NEXUS, siehe `docs/quellen.md`), auf unser Projekt heruntergebrochen. Drei Ideen daraus passen genau zu unseren Problemen: feste Phasen mit einem Prüftor dazwischen, eine Bauen-Prüfen-Schleife mit Obergrenze und eine feste Übergabe-Vorlage zwischen Threads.

### Phasen je Welt, mit Prüftor

| Phase | Was passiert | Prüftor: erst weiter, wenn … |
| --- | --- | --- |
| 0. Bestand | Statusliste aller IDs, Skizzen, Motive mit Spiel abgeglichen, Zuständigkeit je Zeile | jede ID hat eine Zeile, Breitbild-Räume sind entschieden, Kosten sind geschätzt und freigegeben |
| 1. Vorlagen | Konzeptblätter aller Figuren, 3D-Vorlagen, Meshy-Rigs | jede Figur hat ein freigegebenes Konzeptblatt und, wenn Mensch, ein Rig |
| 2. Bilder | Hintergründe (Sebastian), Gegenstände, Posenbögen | Bilder als PNG in voller Größe abgelegt, gegen Skizze und Rätsel geprüft |
| 3. Bauen | Einbau, Läufe, Gesten, Ambiente | jede Lieferung hat die Bauen-Prüfen-Schleife bestanden |
| 4. Härten | Detailprüfung aller Einzelbilder, Review mit frischem Blick, Fix-Runde | Review-Funde der Stufe A erledigt, CI grün, Statusliste ohne offene Zeilen |
| 5. Abnahme | Sebastian spielt, Playtest | Sebastian gibt frei |

Das Prüftor 0 (Handskizze) gilt auch unter Zeitdruck: Welt 3 entstand ohne Skizze, und vier Räume passten nicht zu ihrem Rätsel (Laser, Spalt, Farbcode, Straße); die zweite Fassung entstand mit Blender-Rohbau als Vorlage und brauchte nur noch kleine Nacharbeit (20./21.11.). Die Häkchenliste steht in `.github/pull_request_template.md`.

### Bauen-Prüfen-Schleife

1. Bauen.
2. Selbst prüfen mit der Prüfliste aus Abschnitt 7, mit **Nachweis** (Kontaktbogen, Raumaufnahme mit allen Figuren, GIF, Testergebnis). Ohne Nachweis gilt etwas nicht als fertig.
3. Bestanden: Sebastian zeigen. Nicht bestanden: nachbessern.
4. **Höchstens drei Versuche auf demselben Weg.** Danach nicht weiterprobieren, sondern den Weg wechseln oder Sebastian mit zwei bis drei Optionen fragen. Das hätte bei Minkas Lauf (7 Fassungen) und Toadi (8) mehrere Runden gespart.

### Übergabe zwischen Threads

Wenn ein Thread Arbeit an einen anderen gibt (zum Beispiel Posenbögen an den Animations-Thread oder einen Branch zum Mergen), immer mit diesen Angaben:

- **Stand:** was fertig ist, Branch und Commit, main eingemischt ja/nein, Testergebnis
- **Dateien:** welche Dateien betroffen sind und welche gemeinsam genutzt werden
- **Auftrag:** was der andere tun soll, mit IDs
- **Abnahme:** woran man erkennt, dass es fertig ist
- **Achtung:** Besonderheiten (Screenshot-Referenzen neu nötig, gemeinsamer Code geändert, Dateien nicht anfassen)

So mussten Übergaben bisher oft nachgefragt oder korrigiert werden (Posen-Zuständigkeit Welt 2, Taverne-Referenz, „keep main's versions“).

---

## 10. Weitere Punkte

### Godot-Fallen, die schon einmal Zeit gekostet haben

- Breitere Sprite-Blätter brauchen einen neuen Import, sonst sind Figuren „halb“.
- Flache Objekte am Boden (Ziegenfell) als flach markieren, sonst behandelt Godot sie wie aufrechte Objekte und Max versinkt dahinter.
- Doppelklick auf einen Ausgang wechselt sofort den Raum; das alte Laufziel muss beim Raumwechsel verworfen werden.
- Treppen: Laufband muss an der ersten Stufe beginnen, Trittflächen pixelgenau messen.
- Figuren hinter Fenstern brauchen Rahmen und Sprossen als Ebene davor.
- Pixel folgt Max ab Welt 1 (ab 110 px Abstand), sitzt erst nach etwa 12 Sekunden Leerlauf, und auf erhöhten Plätzen bleibt er oben. Neue Räume mit erhöhten Plätzen dort eintragen.
- Gegenstände nie einfach erscheinen lassen: Pixel springt sichtbar auf Werkbank und Dachbalken. Die Sprungfunktion wiederverwenden.
- Überlagerungen am Sprite des Hintergrunds ausrichten, nicht am Prop-Knoten: Popochiu setzt den Knoten auf y 0 und das Sprite auf y 180 (Code-Sicht lag 180 px zu hoch, 20.11.).
- Nach dem Versetzen einer Figur `sync_buffered_position()` aufrufen, sonst springt sie ans Ende des vorigen Laufs zurück (Lauftests, Kapsel).
- Figur in ein Überlagerungsbild übernehmen (Pixel im Traumbild der blauen Pastille): `scaling_region` leeren, `default_scale` setzen, nach jeder Position `sync_buffered_position()`, danach alles zurücksetzen (21.11.).
- Figuren, die in mehreren Welten vorkommen (Opa als Hologramm): Varianten und Endlos-Tweens selbst beenden (21.11.).
- `HBoxContainer` ordnet Knöpfe erst ein Bild später; Lage danach lesen. Etiketten, die kurz verschwinden sollen (Pfeile der Code-Sicht), per Alpha ausblenden statt `visible`, sonst springt die Anordnung.
- Gesten, die einen Zustand ändern (Brille ab, Herunterfahren), laden danach eine Folgevariante (`schmidt_ohne_brille`, `mutti_aus`), sonst springt die Figur zurück.

### Was Sebastian sich wünscht (wiederkehrend)

- Vorher-nachher-Bilder und GIFs in Spieltempo, bevor etwas eingebaut wird.
- Lieber mehr Animationen als zu wenig: jede Figur mindestens Reden mit Gesten und eine Eigenheit im Stand, Tiere eigene Bewegungen, Hintergründe lebendig (Wasser, Wind, Segel, Rauch).
- Alles auf main und lokal verfügbar, damit er selbst testen kann.
- Klare Aussage, was noch offen ist, ohne Nachfragen.
- Kurze Antworten mit dem Ergebnis zuerst.

### Checkliste für Welt 3, Welt 4 und das Finale

1. Handskizze je Raum (für Welt 3 und 4 gibt es bisher nur automatische Raster), Motive mit dem Spiel abgleichen, Räume mit vielen Figuren gleich als Breitbild planen.
2. Statusliste aller IDs der Welt anlegen, mit Zuständigkeit je Zeile.
3. Konzeptblätter aller Figuren (Gemini), für sitzende Figuren zusätzlich eine 3D-Vorlage.
4. Meshy-Rigs für alle Menschen in einem Stapel, Läufe sofort per Teile-Rig.
5. Posenbögen für Gesten mit Gegenstand und alle Tiere, über Meshy, mit Budgetgrenze.
6. Hintergründe malt Sebastian im Chat, Varianten im selben Chat, breite Räume als Panorama.
7. Einbau mit Figuren-Prüfung je Raum, Ambiente-Ebene gleich mitplanen.
8. Detailprüfung aller Einzelbilder, dann ein Review mit frischem Blick (wie das Fable-Review für Prolog und Welt 1 mit 36 Funden), dann Fix-Runde.

## 11. Aus dem Review vom 17. November 2026

Komplett-Review von Prolog, Welt 1 und Welt 2 mit sieben Prüfrollen (Bericht: `review/2026-11-17/bericht.md`, Arbeitspakete: `review/2026-11-17/arbeitspakete.md`). Welt 2 war grafisch fertig gemeldet und wurde dabei zum ersten Mal im Spiel durchgeklickt; dort lagen die meisten Funde.

**Prüfen, bevor eine Welt als fertig gilt**

- Jede Welt bekommt einen Klick-Durchlauf im echten Spiel: jedes Gespräch bis zum Ende, jeden Hotspot links und rechts, jede Ankunftsstelle ansehen. Der Regeltest (`welt_2_anspiel`) umgeht Räume und Klickflächen; der einzige Hänger des Spiels (Hermes-Gespräch ohne Abschied) fiel nur beim Klicken auf. **Nachtrag 20.11.:** Auch der automatische Anspieltest löst die Schritte über den echten Weg aus (`on_click()` mit der richtigen Spielfigur, `d.waehlen()`), nicht über `S.regel(...)`; beide Sackgassen von Welt 3 waren im grünen Regeltest unsichtbar. Jeden Stufe-3-Hinweis wörtlich als Schritt nachspielen. `welt_3_anspiel` ist umgestellt, Welt 1 und 2 stehen in `offene-punkte.md`.
- Jedes Gespräch braucht eine Option, die es beendet. `pruefen.py` prüft das jetzt; `CQDialog` beendet ein Gespräch zusätzlich selbst, wenn keine Option mehr sichtbar ist.
- Optionen, die ein Rätsel starten, das man nicht beim ersten Mal lösen muss, brauchen „(bleibt)“; eine Sichtbarkeitsregel reicht nicht, weil `option_sichtbar()` zuerst `used` prüft (Mensch-Test, 20.11.).
- Pflichträtsel gegen allgemeine Rückwege prüfen: Ein Rückweg wie „Kapsel schütteln“ machte Rätsel 7 und 13 still freiwillig (20.11., jetzt gesperrt).
- Nach dem Grafikeinbau jede Ansehen-Zeile gegen das fertige Bild lesen (Anzahl, Material, wer hält was). Die Texte entstehen vor den Bildern; in Welt 2 passten Säulen, Thron, Wedler, Pult, Bart, Bauplan und Wurfhebel nicht. Tutorial- und Hinweistexte zusätzlich gegen die gebaute Bedienung lesen (Code-Sicht, 20.11.).
- Figuren im Raum vergrößert ansehen, nicht nur im Sheet: Fußlinie gegen die gemalte Kante (Waldemar stand auf der Brüstung), Mund beim Reden auch in Posen, jede Figur redend und stehend.
- Startstellen und Figurenplätze prüfen: kein Ankunftsmarker näher als eine Figurbreite an einer Figur, keine zwei Figuren am selben Platz, keine Figur außerhalb des Bildes. Achtung: Das Aufnahmeskript betritt Räume über `start`, das Spiel über `von_<raum>`; beide Marker setzen.
- Überdeckung von Klickflächen messen statt schätzen (Zeigerraster aus beiden Mausrichtungen). Seit dem Review entscheidet `Spiel.zeiger_betritt` nach Fläche und Rang; Figuren unter 70 % ihrer Fläche gelten trotzdem als Fehler.
- Prüfregeln gelten für alle Abschnitte, die schon gebaut sind, nicht nur für die gerade bearbeiteten (die 140-Zeichen-Regel galt nur für Prolog und Welt 1).
- Gebaute Animationen gelten erst als fertig, wenn ein Skript oder eine Tabelle sie aufruft (Melken, Pixels Haare und das Rennen an Tag 1 waren gebaut und nie zu sehen). In Welt 3 waren es trotzdem 35 Bewegungen und 14 Effekte; seit 21.11. prüft `tools/grafik_fundstellen.py` das in der CI, bewusst Zurückgestelltes steht dort mit Grund.
- Reden und Ruhe aus der Standpose bauen; die 5-%-Regel gilt auch für `talk` und Ruhe-Schleifen (Opa, Gollo, Grimmzahn, XXL-Ziege). Wird „reden“ aus dem Posenbogen zu `talk`, die Mund-Schleife behalten und die Armgeste als `rede_geste` führen (vier Welt-3-Figuren redeten ohne Mund).

**Code und Daten**

- Fixes an Klickflächen gehören ins Layout (`tools/layout/*.yaml`), nicht nur in die `.tscn`; der nächste `--cq-layout`-Bau setzt sie sonst zurück.
- Neue Welt, neue Sonderzeilen im Hinweissystem: eigene „nichts offen“-Zeile, freiwillige Rätsel nachrangig und nach ihrer Gelegenheit geschlossen.
- Hinweise ortsbezogen wählen, wenn Räume Einbahnstraßen sind: erst Schritte im Raum der aktiven Figur, bei unbesuchten Räumen den Ort nennen (Pfote schickte aus dem Büroturm zur Oma, 20.11.).
- Abläufe mit Läufen gehören in eine Szene oder sperren die Oberfläche; sonst nimmt das Spiel Klicks an und Esc überspringt nur Teile.
- Lauftempo und Tiefe getrennt sehen: Popochiu multipliziert das Tempo mit der Größe; die Raum-„skala“ wird seit dem Review ausgeglichen.
- Bei Effekten im Testmodus daran denken: Ambiente-Bildfolgen laufen dort nicht. Wer ein Ambiente prüft, schaltet den Testmodus vor dem Betreten des Raums aus und sieht die Effekt-Bahnen gegen die gemalten Gegenstände an (Autos fuhren durch geparkte Autos und den Nachttisch, 20.11.).

**Werkzeuge, Tests und Abläufe (aus Git-Historie und PRs)**

- Lokal dieselben Prüfungen wie die CI: `python3 tools/alles_pruefen.py` (drei rote Läufe kamen nur von veralteten erzeugten Dateien).
- main bleibt grün; nie direkt auf main. Die Webseite wird seit dem Review erst nach grünem „Prüfen“ gebaut. Erst mergen, wenn der Lauf auf dem Endstand fertig und grün ist (#42 bis #44 wurden vorher gemergt, 20.11.); dafür Branch-Schutz.
- Der Web-Export ist eine eigene Plattform: grüne Desktop-Tests heißen nicht, dass die Seite läuft (PR #38). Popochiu ist für den Web-Export an fünf Stellen gepatcht (Kommentar „Couch Quest:“); vor einem Popochiu-Update diese Stellen sichern.
- Screenshot-Referenzen: Der Workflow „Screenshot-Referenzen erneuern“ nimmt sie unter Linux neu auf und committet sie auf den PR-Zweig. Der Test sieht bei breiten Räumen nur den Kameraausschnitt.
- Werkzeuge gehören ins Repo, nicht nur die Ergebnisse: eine gültige Fassung statt `_2`, `_3`, Pfade über eine Umgebungsvariable. Die Teile-Rig-Skripte und die Prüfung „zwei Beine, keine Löcher“ liegen bisher nur unter `E:\Game Engine\Grafiken`. Prüfskripte brauchen Grenzwerte und einen Rückgabewert, sonst melden sie nur (20.11.).
- Originale nur als PNG mit festem Namensschema; 3 GB Originale brauchen eine Sicherung.
- Statuslisten und Regie-Dauern aus den Daten erzeugen statt von Hand führen; nur „in main“ zählt als eingebaut.
- Schrift und Ziffern in Nahansichten per Werkzeug setzen und in Spielgröße auf Verwechslung prüfen (Fährtafel: 112 sah aus wie 118).
- Fertige PRs nicht stapeln, gemergte Zweige löschen, festhalten, welche Sitzung `gh` und welche Werkzeuge hat (die PC-Sitzung hat kein `gh`).
- `.import`-Dateien: Eingecheckt werden sie mit dem Asset; was ein lokaler Import an bestehenden `.import`-Dateien ändert, wird nicht mitcommittet.

## 12. Externe Skript-Reviews (19. November 2026)

- Ein prüfendes Modell ohne `01-konzept.md` hält etwa die Hälfte der Absichten für Fehler (Running Gags, Milch-Spots, Verwandlungen zwischen den Ebenen). Jeden Befund deshalb erst gegen den echten Skripttext und das Konzept prüfen, dann sortieren: übernehmen, anders lösen, verwerfen. Die IDs im Review stimmen nicht immer (BRUE statt WALD).
- Die Ersatzzeilen des Modells sind oft schwächer und streichen eine Pointe, einen Rückruf oder die Regel, die ein Rätsel braucht. Eigene Zeilen schreiben und jede Änderung im Zusammenhang gegenlesen.
- Ein zweites Review mit anderem Blickwinkel lohnt sich: Es fand die harten Zustandsfehler (Zeile gilt immer, obwohl es zwei Lösungswege gibt; Gegenstand kann verbraucht sein).
- Zählen statt schätzen: `grep` über die Pixel-Zeilen zeigte „junger Mann“ 76-mal. Wiederkehrende Formeln gehören ins Konzept mit einer Obergrenze.
- Bei jeder Zeile, die einen Zustand behauptet („ich habe das Fenster“, „nimmt Max' Handy“), prüfen, ob der Zustand auf allen Wegen gilt; sonst eine zweite Fassung mit Bedingung und einen Test dazu.

## 13. Welt 3, Phase 1 (20. November 2026)

- **Konzeptblätter mit breiten Figuren** (Schild, Mantel, Schirm über die halbe Bildbreite) schneidet `tools/figur.py sprite` falsch zu: Die Bodenlinien-Erkennung hält den Oberkörper für eine Linie. Vorher mit `tools/grafik_w3/magenta_frei.py` freistellen und seitlich polstern.
- **Endesga-Zwang macht dunkelgraue Hosen grün.** Für Welt-3-Figuren `--palette keine`; die Farben bleiben nah am Konzept.
- **Durchscheinendes auf Magenta** (Poncho, Tropfen, Dampf, Hologramm) hat einen Rosastich; vor dem Umrechnen entfärben, aber nur bei solchen Figuren: Die Entfärbung trifft auch echtes Rosa und Lila (Lockenwickler, Plüschpantoffeln, lila Haare). `magenta_frei.py … ohne` schaltet sie ab.
- **Posen und Stand gleich umrechnen.** Das Stand-Sprite entsteht mit Linienverstärkung 0,4; `bew.py` braucht dann `--linien 0.4 --dick 0`, sonst zerfallen Innenlinien in Striche (mit `--dick=-1` werden sie zu dick).
- **Max-Posenbögen nicht mit dem alten Max-Konzept (`concepts/w0_concept_max.png`) bestellen**: dunkle Haare, anderer Strich. Besser das saubere Welt-2-Blatt `3d\max\bewegungen\_kopf_kratzen_bogen_sauber.png` anhängen und „never black hair“ dazuschreiben.
- **Gemini malt bei kleinen Figuren gern mehr Posen als bestellt** (sechs statt vier, Zwischenpose doppelt). Mit `--posen 6 --nehmen 1,3,4,6` die richtigen auswählen statt neu zu bestellen.
- **Läufe brauchen keine neuen Meshy-Credits**: Max' Gang-Winkel (`gang2_arme.json`) passten für Morphäus und Deckert besser als `walking_2_inplace` (dort schwingt das hintere Bein weit, das vordere kaum nach vorn).
- **Gerenderte Tiere wirken steif** (Sebastian zur schwarzen Katze). Besser: Blender liefert nur die Beinstellung je Bild, Gemini malt jedes Bild einzeln im Stil des Konzeptblatts nach („redraw the cat from the first image in exactly the pose of the second“). Nur Konzeptblatt und Posenvorlage anhängen: Mit einem fertigen Laufbild als dritter Vorlage kopiert Gemini dieses fünfmal. Danach alle Bilder an der Rumpflänge auf einen Maßstab bringen (`tools/grafik_w3/katze_gemalt.py`).
- **Gesten brauchen Halbposen.** Stand direkt neben Zielpose springt. Je Posenbogen ein Zwischenbogen „halfway between the neutral pose and the target pose, clearly less extreme“ mit Konzeptblatt und Posenbogen als Vorlage; etwa drei von vier Halbposen taugen, die übrigen liegen nahe an der Zielpose. Folge Stand, Halbpose ×2, Pose, Halbpose ×2, Stand (`tools/grafik_w3/folgen_mit_zwischenbildern.py`).
- **Blender im Hintergrundmodus**: beim Umhängen an Gelenk-Empties vorher `view_layer.update()`, sonst geht die Skalierung verloren. Workbench mit flachem Licht und ohne Kantenglättung gibt saubere Farbflächen zum Pixelieren.
- **Größenprüfung**: Rumpfbreite taugt nicht, wenn Arme vor dem Körper sind. Kopf- und Beinbreite sind die besseren Messstellen (`tools/grafik_w3/groesse_pruefen.py`).

### Phase 2 (20. November 2026)

- **12 Farben sind zu wenig** für Figuren mit kleinen bunten Details (M.U.T.T.I.s Auge und Blumen, Pixels Augen, rosa Pantoffeln): Sie gehen in Weiß und Grau auf. Für Welt 3 `--farben 24`.
- **Helligkeitsangleich bei Max (`--hist`) färbt die roten Schuhe braun.** `bew_w3.py --farbtausch 733e39:e43b44:-14,e8b796:ffffff:-14` tauscht nur in den untersten 14 Zeilen zurück.
- **Halbposen-Bögen lohnen sich nur bei großen Bewegungen.** Bei Gesten nahe am Stand (Kalle 1, Hausmeister, Max Basis) hat Gemini meist die Zielposen kopiert. Max-Bögen liefern oft von selbst Zwischenposen (5 bis 6 Figuren statt 4), die man direkt nutzen kann.
- **Gemini verweigert manche harmlosen Bögen** (Hausmeister-Arm im Kreis: zweimal leere Antwort). Dasselbe Modell über Meshy (4 Credits) hat es sofort gemalt.
- **Pixel-Posen am Spiel-Sprite ausrichten**: Mit der Median-Höhe wurden die Posen 25 % zu groß. `--ref-pose` auf eine Sitzpose setzen; rot gewordene Augen mit `--kragen e43b44:e43b44` auf Bernstein.
- **Parallele Gemini-Aufrufe** brachen bei Netzschwankungen ab (Zeitüberschreitung, DNS). Eine Zeitüberschreitung kann trotzdem ein Bild speichern: vor dem Wiederholen Datei und `ki_protokoll.csv` prüfen.
- **Raumabhängige Effekte erst nach dem Hintergrund**: 13 Bewegungen (Nudeltopf, Kopierer, Automat …) brauchen den fertigen Raumausschnitt und bleiben bis dahin offen.
- **Gegenstände ausschneiden:** `figur.py gegenstaende` setzt ein gleichmäßiges Raster voraus. Gemini verteilt die Dinge aber frei, und lose Teile (Dampf, Scherben, Konfetti, Uhrgewichte) zerfallen. `tools/grafik_w3/gegenstaende_schneiden.py` trennt Zeilen und Spalten über Lücken in der Projektion; dicht stehende Dinge brauchen eine kleinere Spaltenlücke (Labor: 4).
- **Schrift auf Nahansichten:** Überschriften nicht in Pixelify 16 setzen (2 sieht aus wie 8). (Pixelify 12 mit Doppeldruck ist seit 21.11. überholt, siehe „Umsetzung nach dem Review“.) Zu kleine gemalte Schilder lieber durch ein eigenes ersetzen; Tabellen erst ausmessen, dann füllen.
- **Halbposen einzeln bestellen.** Ein Bogen mit vier Halbposen kopiert oft die Zielposen. Besser je Geste ein Bild: Neutralpose (Konzeptblatt) und die ausgeschnittene Zielpose als zwei Vorlagen, „ONE single figure exactly halfway … clearly different from both images“. 15 von 15 waren brauchbar.
- **Kopfgröße nachträglich angleichen** (`tools/grafik_w3/kopf_angleichen.py`): nur bei stehenden Posen; Hocke und erhobene Arme verfälschen die Messung und werden übersprungen.
- **Gegenstand wechselt zwischen Posen** (Kalles Laptop): eigenes Standbild ohne Gegenstand im selben Gemini-Chat bearbeiten lassen und als „R“ der betroffenen Gesten nehmen.
- **Meshy lohnt sich für Gangarten, nicht für Gesten.** Vier Bibliotheks-Clips (12 Credits) geben fünf Figuren einen eigenen Gang und Max einen Hinke-Gang; als Oberkörper dient beim Hinken eine gemalte Pose (Hand am Rücken). Würfe, Ausweichen und Gesten mit Gegenstand bleiben gemalte Posen mit Halbposen. Treppen gehen kostenlos mit Max' vorhandenen Treppen-Winkeln.
- **Text-zu-Bewegung als Vorlage für Zwischenposen** (Max' Zeitlupen-Ausweichen, Klon wirft den Locher; je 10 Credits): Der Clip wird nicht ins Teile-Rig gespielt, sondern mit `tools/grafik_w3/t2m_seite_rendern.py` als graue Seitenansicht gerendert. Ein passendes Renderbild geht zusammen mit dem Posenbogen an Gemini („in the mannequin's pose … halfway between pose X and Y“). So entstehen Zwischenposen mit glaubwürdiger Körperhaltung, das Aussehen bleibt gemalt. Einzelne Halbposen mit `--hoehe` umrechnen (geschätzt zwischen den Nachbarposen), sonst wird eine gebeugte Figur auf volle Höhe gestreckt. Blonde Haare kippen beim Umrechnen in Hautfarbe; dann die Hautpixel oberhalb der Brille auf die Haarfarbe setzen. Gegenstände, die die Figur loslässt, aus der Pose entfernen, Godot zeigt sie als eigenes Sprite.
- **Swift-Clips (3 Credits) reichen als Haltungsvorlage.** Sie liefern nur ein Skelett (BVH); `tools/grafik_w3/t2m_bvh_strich.py` zeichnet daraus Strichmännchen in der Seitenansicht (naher Arm dunkel, ferner hell, gespiegelt auf Blick nach rechts). Prime (10 Credits, FBX mit Puppe) lohnt nur, wenn die Puppe selbst gebraucht wird.
- **Breite Einzelposen vor `bew_w3.py` auf dreifache Breite polstern.** `figur.blatt_lesen` hält jede Zeile, die über die halbe Bildbreite durchgehend gefüllt ist, für eine Bodenlinie und schneidet die Figur dort in Streifen (gebückte Oma, hockender Kalle); die Höhe stimmt dann nicht mehr.
- **Figur mit Möbel (Kapsel):** Varianten als Bearbeitung des Konzeptbilds bestellen („keep the pod … EXACTLY identical, change only the boy“), dann nur Max einsetzen: Unterschied zur leeren Kapsel als Maske, auf die Kapsel aus dem vorhandenen Sprite kleben (`kapsel_folgen.py`). Aussteigen, sobald Max höher als die Kapsel wird, als freie Figur davor.
- **Raumzustände, die Gemini im Ganzen neu malt** (andere Farben, grauer Sockel), lassen sich nicht nur an der Stelle einsetzen: `zustand_einsetzen.py` findet dann überall Unterschiede. Besser den Zustand als Bearbeitung des Grundbilds bestellen („change only the energy cell … everything else exactly identical“), dann pixeln und nur die Zelle einsetzen. Sebastians Fassung bleibt als Alternative liegen.
- **Sprites, die breiter als das halbe Vorlagenbild sind** (Auto in Seitenansicht), trifft dieselbe Bodenlinien-Falle wie breite Posen: vorher auf dreifache Breite polstern.
- **Schrift auf schräg liegendem Papier** (Nahansichten): Gemini malt trotz „blank“ oft Schein-Schrift und legt die Seiten schräg. (Überholt am 21.11.: Schrift nicht mehr perspektivisch verzerren, siehe „Umsetzung nach dem Review“.) Ziffern weiter aus der eigenen Tabelle (4 wurde schräg zur 9). Schein-Kritzelei an Fliesenwänden: Wand aus sauberen Paneelen mit gleicher Fugenlage nachbauen statt ausmalen. Schein-Inhalt auf schrägen Formularen nur in den Feldern entfernen und mit dem nächsten echten Papierpixel derselben Seite füllen (sonst ziehen Ränder, Schatten und Glanz hinein); übrig gebliebene kurze Linienstücke danach mit weg. Gemalte Tabellenlinien, die man beim Leeren trifft, an den gemessenen Stellen der Nachbarspalte neu ziehen.

### Einbau (20. November 2026)

- **Reihenfolge bei neuen Figuren-IDs:** erst `tools/spieldaten.py`, dann den `UI_OBJ_`-Schlüssel in `uebersetzung/ui.csv`, dann `tools/skript_export.py` (schreibt `texte.csv`), erst danach `godot_raeume.py`. Sonst meldet es den Schlüssel als fehlend, obwohl er in `ui.csv` steht.
- **Raum nach Layout bauen:** `godot --headless --editor --path game -- --cq-bauen --cq-layout=<raum,…>` legt neue Figuren und Klickflächen an; eine ersetzte Figur (Straßenmusiker) bleibt als alter Knoten in der Szene und muss von Hand raus.
- **Klickflächen ohne `name:`** und ohne Bezug im Skript landen nicht im Bauplan (Lautsprecher in Kammer 2).
- `godot_raeume.py` schreibt auch unter Linux alle Platzhalter neu; nur die betroffenen behalten.
- **Läufe aus dem Teile-Rig auf die Standhöhe bringen:** Max' Hinken war 8 % größer als sein Stand-Sprite. `figuren_einbau.py` verkleinert Gangarten, die größer sind; Kriechen und Tiergänge sind zu Recht flacher und bleiben. Gangarten stehen auf der Fußlinie, statt nach Umriss ausgerichtet zu werden.
- **Effekt-Ausschnitte aus einer anderen Pixelfassung:** Nur die Pixel zeigen, die sich zwischen den Bildern ändern, und diese auf die Palette des eingebauten Hintergrunds bringen (`effekte_einbau.py`). Die „lage“ aus Sebastians Probe passte bei allen 17 Ausschnitten ohne Versatz.
- **Raum-Skala aus einer Zielgröße rechnen:** Max' Stand-Sprite ist 185 px hoch; an der hinteren Laufkante gilt Skala mal Tiefe. Für „gut 100 px an der Glastür“ ergab 0,8 × 0,69 = 0,55 genau 104 px; im Spiel per `c.scale` nachgemessen statt geschätzt.
- **Im Hintergrund gemalte Gegenstände:** Das Prop bekommt ein durchsichtiges Bild in Platzhaltergröße (`gegenstaende_einbau.py`, `GEMALT`), sonst liegt der orange Platzhalter über der gemalten Zelle. Die Varianten des Hintergrunds zeigen dann den richtigen Zustand.
- **figuren_einbau.py erneut laufen lassen:** Vorher `max` und `pixel` (Bild und JSON) aus Git zurückholen, weil das Skript deren bestehende Sheets erweitert.
- **Effekte, die mitsprechen** (Sprechanlage, Lautsprecher): `spricht: <Kürzel>` im Layout zeigt die Bildfolge nur, solange `Spiel.sagen` diese Figur sprechen lässt. Bedingungen kennen jetzt auch „A|B“ (eins von beiden), für Tag- und Nachtfassungen derselben Anzeige.
- **Gesten-Tabellen:** `REDE_MAX` in `gesten_einsatz.gd` hat Vorrang vor den Welt-Tabellen; eine Zeile, die eine eigene Max-Geste bekommt, muss dort raus. Bei `WARTEN` gilt der erste passende Eintrag, darum steht Max' Rücken-Geste vor seinem allgemeinen Eintrag.

### Umsetzung nach dem Review (21. November 2026)

Elf Arbeitspakete aus dem Review vom 20.11. (`review/2026-11-20/arbeitspakete.md`, Stand je Paket in der Kontrolltabelle).

- **Schrift auf Nahansichten mit eigenen Glyphen.** Pixelify 12 hat mehrdeutige Versalien (B, C, E, T, R, Z) und abstehendes a und t. Auf schrägen Flächen nicht verzerren, sondern die Zeilen kursiv verschieben und die Buchstaben treppen (`tools/nahansichten_welt3_schrift.py`).
- **Gesten-Streifen enthalten den Stand.** Eine Korrektur am Stand (Schmidts Fuß, der Mund der Frau) mit `tools/grafik_w3/stelle_uebertragen.py` in alle Streifen übernehmen, mit gemeinsamer Lage je Bild. Gehaltene Gegenstände (Mopp, Kelle) in allen Posen gleich herum.
- **Erstes Bild jeder Geste gegen den Stand prüfen.** `beste_lage()` suchte ±6 px um die Zellunterkante statt um die Fußlinie; 62 Bewegungen standen 2 px versetzt. Jetzt prüft `erstes_bild_pruefen()` in `figuren_einbau.py`. Die Quellen-Überlagerung (`korrektur_20-11/quelle`) beim Einbau immer mitgeben.
- **Neue Hintergründe mit Blender-Rohbau als Vorlage:** Laser, Spalt, Farbfelder und Fahrbahn stehen jetzt dort, wo das Rätsel sie braucht; übrig blieb kleine Nacharbeit (Türrahmen in der Basis, Tasse an der Tischkante, Einhorn). Die Raumgröße für Figuren über `skala` 1,0 vorn und die Tiefe aus dem Rohbau, Max an der Glastür nachgemessen.
- **Code-Sicht zweistufig:** Jedes Paar aus zwei Dingen kostet einen Versuch, auch ohne Pointe; kostenlos sind nur Wörter am selben Ding und das Zurücktauschen. So bleibt die Lösung ein Rätsel und ist nicht durchprobierbar.
- **Texte in zwei Stufen:** erst Bild-Texte, Längen und fehlende Zeilen, dann KI-Klang in einem eigenen Commit mit Vorher/Nachher-Liste und den Spalten „erhalten?“ und „leichter?“. Vier Vorschläge mussten abgeschwächt werden, weil sie Hinweise deutlicher gemacht hätten.

## 14. Welt 4, Vorbereitung (26. November 2026)

- **Rohbau geht auch in der Cloud-Sitzung unter Linux:** `pip install bpy` (Python 3.13) in eine eigene Umgebung, dazu `apt-get install libegl1 libgl1-mesa-dri libgles2 libgl1`, sonst bricht Workbench mit „Couldn't open libEGL.so.1“ ab; die EGL_BAD_MATCH-Warnungen sind harmlos. `rohbau_notiz.py` nimmt unter Linux DejaVuSans statt Arial. Fertige PNGs auf 256 Farben ohne Dithering reduzieren (31 auf 14 MB für 15 Räume).
- **Rohbau gleich nach dem ersten Rendern gegen die Liste „Muss sichtbar sein“ lesen:** In der ersten Runde waren das Glücksrad zu groß (deckte den Ausgang), Villa und Mond auf dem Friedhof zu nah, die Wolkenkratzer in Kapitolis zu nah und die Bottiche der Fabrik zu weit vorn. Eine zweite Runde mit geänderten Koordinaten reichte.
- **Türen, die im Bild-in-Bild zusammenkommen, an die Naht legen:** Küchentür am rechten Rand der Küche, Kellertür am linken Rand des Kellers; die zusammengesetzte Skizze (`tools/grafik_w4/bild_in_bild_skizze.py`) zeigt das vor dem ersten Konzeptbild.
- **Bewegungsliste gegen jede Regie-Angabe abgleichen, bevor die Prompts als vollständig gelten:** Welt 4 hatte 23 Animationen gegen rund 100 Regie-Angaben (Review R5-W4-14). Mit den Zeilen-IDs in der Spalte „Moment“ ist der Abgleich nachprüfbar.
- **Erste Hintergründe Welt 4 (27.11.):** Gemini hat bei fünf Räumen die grünen Ausgangsmarken der automatischen Layout-Skizze als grün gerahmte Tür mitgemalt. Sebastian hängt bewusst Rohbau, Rohbau mit Notizen und Layout-Skizze an (27.11.); der Raum-Prompt sagt deshalb ausdrücklich, dass Beschriftungen, Kästen und grüne Ausgangsmarken nur Notizen sind, und die Prüfung achtet auf mitgemalte Marken. Graustufen-Fassungen für Rätsel (Testbild) nicht malen lassen: Gemini gibt mehreren Balken denselben Grauton; per Werkzeug aus dem bunten Bild rechnen (`tools/grafik_w4/hintergruende_korrigieren.py`). Dort auch Regiestuhl-Reparatur im Werbespot-Set und Rahmen-Umfärben.
