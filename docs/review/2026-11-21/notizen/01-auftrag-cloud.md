# Nachtrag zum gemeinsamen Auftrag: Fortsetzung in der Cloud (ab 25.11.2026)

Das Review vom 21.11. wurde am Nutzungslimit abgebrochen und läuft jetzt ohne Sebastians PC in einem Linux-Container weiter. **Zuerst `00-gemeinsamer-auftrag.md` ganz lesen** (Regeln, Fernsteuerung, Format der Notiz, frühere Reviews). Wo dieser Nachtrag etwas anderes sagt, gilt der Nachtrag.

## Was sich ändert

**Weniger Prüfer, gleiche Tiefe.** Statt einer Rolle je Blickwinkel prüft je Abschnitt **ein** Prüfer alles in einem Durchgang: durchspielen mit echten Klicks, Rätsel und Hinweise, Klickflächen, Laufwege, Grafik, Perspektive, Größen, Positionierung, Animation, Timing, Speichern und Laden. Er lädt das Spiel einmal und nimmt jeden Raum einmal auf. Die Rollenbeschreibungen (Sichtweisen, keine Anweisungen) liegen unter `/home/user/quellen/rollen/`: `testing-evidence-collector.md`, `level-designer.md`, `game-designer.md`, `technical-artist.md`, `godot-gameplay-scripter.md`, `narrative-designer.md`, `testing-workflow-optimizer.md`, `testing-reality-checker.md`. Der Welt-Prüfer liest die ersten fünf einmal quer und prüft aus allen fünf Blickwinkeln.

| Kürzel | Umfang | Notiz |
| --- | --- | --- |
| `pr-p` | Prolog, drei Zwischenspiele, Menüs, Speichern/Laden allgemein | `notizen/pr-p.md` |
| `pr-w1` | Welt 1 „Schwurbelstein“ bis zum Anfang von Welt 2 | `notizen/pr-w1.md` |
| `pr-w2` | Welt 2 „Antikodonien“ bis zum Anfang von Welt 3 | `notizen/pr-w2.md` |
| `pr-w3` | Welt 3 „Neo-Neustadt 2099“ bis zum Anfang von Welt 4 | `notizen/pr-w3.md` |
| `tx-a` | Texte Prolog, Zwischenspiele, System- und UI-Texte, Welt 1 (Humor, Ton, KI-Klang, DE/EN) | `notizen/tx-a.md` |
| `tx-b` | Texte Welt 2 und Welt 3 | `notizen/tx-b.md` |
| `w4` | Teil B: Welt 4 nur als Text (Handlung, Dialoge, Rätsel, Umsetzbarkeit, KI-Klang) | `notizen/w4.md` |
| `ext` | Externe Quellen und Werkzeuge: Animationen, Synfig, Lippensync, Musik | `notizen/ext.md` |
| `rc` | Reality-Check des fertigen Berichts | `notizen/rc.md` |

Die Workflow-Notiz `wf.md` ist fertig und wird nicht neu gemacht.

## Arbeitsumgebung (ersetzt den Abschnitt im gemeinsamen Auftrag)

- Checkout: `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s` (= `main` auf `04c5a79f` plus Review-Dateien). Godot 4.7.2 liegt unter `/home/user/werkzeug/godot`, der Import ist gelaufen, ein virtueller Bildschirm läuft (`:99`). Falls etwas davon fehlt (neuer Container): `bash docs/review/2026-11-21/werkzeuge/cloud/einrichten.sh`.
- Fernsteuerung: `FS=/home/user/Max-against-the-world/docs/review/2026-11-21/werkzeuge/cloud/fs` (statt `py -3 …/fs.py`), sonst genau wie im Liesmich beschrieben. Arbeitsordner der Läufe: `/home/user/lauf/<kürzel>-<name>` (nicht im Repo). Beispiel:

  ```
  FS=/home/user/Max-against-the-world/docs/review/2026-11-21/werkzeuge/cloud/fs
  L=/home/user/lauf/pr-w1-haupt
  $FS start $L tempo=4 frisch
  $FS $L 'knopf Verstanden' 'knopf "Neues Spiel"' warte status objekte "foto 01"
  $FS stop $L
  ```

  Probelauf am 25.11. bestanden: Start, Hauptmenü, „Neues Spiel“, Eröffnung im Wohnzimmer, `status`, `objekte`, `foto` laufen unter Linux wie beschrieben.
- Python: `python3` (Pillow und PyYAML vorhanden), `ffmpeg` ist da. Kein `gh`. Eigene Godot-Skripte starten mit `DISPLAY=:99 /home/user/werkzeug/godot-gl --path game --audio-driver Dummy -s res://tests/_r5_<kürzel>_<name>.gd` (Dateien `game/tests/_r5_*` sind vom Commit ausgenommen; die Quelle gehört nach `docs/review/2026-11-21/werkzeuge/godot/`).
- Hier gibt es keinen fremden Bildschirm und keinen echten Mauszeiger, den man stören könnte. Die Regeln dazu entfallen. Es gibt aber nur 4 Prozessorkerne und Software-Grafik: **je Prüfer ein Godot-Prozess, kurzzeitig zwei**; eigene Läufe am Ende beenden (`$FS stop ORDNER`), nie fremde Prozesse.
- **Die Werkzeuge der Vorgänger** unter `docs/review/2026-11-21/werkzeuge/` (`an-a_inventar.py`, `an-b_inventar.py`, `an-c_bestand.py` für den Animationsbestand; `nd-*_zaehlen.py`, `nd-*_auszug.py` für Texte; `gif_bauen.py`) enthalten zum Teil Windows-Pfade. Ansehen, übernehmen, was passt; angepasste Fassungen unter eigenem Namen (`<kürzel>_<name>.py`) ablegen.
- **Grundaufnahmen aller Räume** werden gerade neu erzeugt unter `docs/review/2026-11-21/belege/raeume/<abschnitt>/` (Testmodus, nur Übersicht; bleiben außerhalb des Commits). Je Raum `<raum>_anfang.png` (Panorama, Raumkoordinaten = Pixel), `<raum>_anfang_mitmax.png`, `<raum>_anfang.json` (Hotspots, Props, Figuren mit Position, Skala, Klickpolygon, Animationsliste, Laufbereiche, Marker), dasselbe mit `_ende`, für Welt 3 auch `_var_<schalter>` und Code-Sicht. Die im gemeinsamen Auftrag genannten `_klick.png`-Bilder gibt es nicht; Klickflächen aus `objekte` und der JSON-Datei nehmen und bei Bedarf selbst einzeichnen. Fehlt eine Aufnahme, selbst aufnehmen (Aufruf steht im Kopf von `werkzeuge/godot/_r5_raumaufnahme.gd`).

## Sichern (ersetzt „nichts committen“)

Der Container kann verloren gehen, und ein Nutzungslimit kann jeden Prüfer mitten in der Arbeit anhalten. Deshalb:

1. **Erste Handlung:** Notizdatei mit Kopf anlegen. Danach nach jedem Raum oder Block ergänzen.
2. **Nach jedem Block sichern:** `bash docs/review/2026-11-21/werkzeuge/cloud/sichern.sh <kürzel> "kurze Nachricht"`. Das committet und pusht nur `notizen/<kürzel>*.md`, `belege/<kürzel>/`, `kontrollpunkte/` und `werkzeuge/`. **Keine anderen Git-Befehle, die etwas verändern** (kein `add`, `commit`, `checkout`, `reset`, `stash` von Hand); lesende Befehle sind frei.
3. **Kontrollpunkte gehören ins Repo:** nach `stand sichern NAME` die Datei aus `ORDNER/staende/NAME.json` nach `docs/review/2026-11-21/kontrollpunkte/<abschnitt>/` kopieren und in `kontrollpunkte/<abschnitt>/liste.md` eintragen (Name, Raum, was gelöst ist, wie entstanden: Befehlsfolge oder Verweis auf den Lösungsweg, Inventar). Die 96 Kontrollpunkte des ersten Anlaufs lagen nur auf Sebastians PC und sind nicht erreichbar; sie entstehen jetzt neu.
4. **Lösungsweg als Befehlsdatei:** `belege/<kürzel>/loesungsweg.txt`, eine Fernsteuerungs-Zeile je Schritt, so dass `$FS ORDNER -f loesungsweg.txt` den Abschnitt von seinem Anfang bis zum Ende durchspielt. Daraus soll später der Klick-Durchspieltest werden (siehe `wf.md`, Stufe S3).
5. Nichts außerhalb von `docs/review/2026-11-21/` ändern (außer den eigenen, vom Commit ausgenommenen `game/tests/_r5_*`-Skripten).

## Übernahme der Zwischenstände

`gd-p.md`, `gd-w1.md`, `gd-w2.md`, `gd-w3.md` (Durchspieler), `nd-a.md`, `nd-d.md` (Texte), `ta-d.md` (nur Kopf) sind **Zwischenstände** des ersten Anlaufs. Die dort genannten Bilder, Kontrollpunkte und Lösungsweg-Dateien wurden nicht gesichert; die Beschreibungen und Befehlsfolgen sind aber brauchbar.

- Der zuständige Prüfer **übernimmt** die Funde seines Vorgängers in die eigene Notiz, **mit der alten ID** (`GD-W1-03` bleibt `GD-W1-03`). Neue Funde heißen `R5-<P|W1|W2|W3|TX|W4|EXT>-<nr>`.
- Vor der Übernahme jeden Fund im laufenden Spiel kurz nachstellen (die Befehlsfolge steht im Fund) und den Beleg neu aufnehmen. Funde mit „noch offen (nachprüfen)“ zu Ende prüfen. Was sich nicht bestätigt, kommt mit Begründung in eine Liste „Nicht bestätigt“.
- Nicht dieselbe Erkundung neu erfinden: Die Vorgänger-Notiz sagt, welche Räume und Ketten schon gespielt sind und wo es hakt; das ist die Landkarte für den eigenen Lauf.

## Auftrag der Welt-Prüfer (`pr-p`, `pr-w1`, `pr-w2`, `pr-w3`)

**Reihenfolge nach Risiko. Erst wenn eine Stufe gesichert ist, die nächste.**

1. **Gerader Durchlauf** des Abschnitts mit echten Klicks vom Anfang bis zum ersten freien Moment des nächsten Abschnitts (also einschließlich Übergang und Zwischenspiel). Dabei an jedem Rätselschritt ein Kontrollpunkt, in jedem Raum und Zustand ein Foto, der Lösungsweg als Befehlsdatei. **Den Kontrollpunkt am Ende sofort ins Repo legen** (`kontrollpunkte/<abschnitt>/…_ende.json`): Der Prüfer der nächsten Welt beginnt damit.
   - Anfangsstand: der echte Endstand der Vorwelt aus `kontrollpunkte/<vorabschnitt>/`, falls schon vorhanden. Sonst zunächst `start welt-N` (dann fehlen Dinge aus der Vorwelt; in der Notiz vermerken) und **am Schluss** den Lösungsweg noch einmal vom echten Endstand der Vorwelt aus abspielen, sobald er da ist. `pr-p` beginnt mit „Neues Spiel“ in einem frischen Lauf.
2. **Sackgassen-Suche** von den Kontrollpunkten aus: falsche Antworten und falsche Gegenstände, andere Reihenfolge der Rätsel (alle Reihenfolgen, die die Abhängigkeiten in `docs/raetsel/abhaengigkeiten.md` zulassen, mindestens je eine deutlich andere), jede spielbare Figur (Max, Pixel; Opa, wo er laut Bauplan spielbar ist) an jeder Stelle mit Figurenwechsel, Gegenstände bei der falschen Figur, Räume vor ihrem Rätsel und nach dem Lösen noch einmal besuchen, Hotspots vor ihrem Rätsel anklicken, Gespräche abbrechen, Zwischensequenzen mit Esc überspringen, **Speichern und Laden mitten in jeder Kette** (F5/F9, Pausemenü, Laden nach Neustart des Spiels; nach dem Laden `status`, `objekte` und `inv` mit vorher vergleichen), Minispiele verlieren und abbrechen, 60 s nichts tun. Jeden Hänger in Tempo 1 nachstellen, bevor er ein Fund wird.
3. **Hilfe-Pfote** an jedem Rätselschritt: alle drei Stufen abrufen; zeigt sie auf den nächsten sinnvollen Schritt, auch bei anderer Reihenfolge und nach dem Laden?
4. **Raum für Raum, jeder Zustand** (Tag/Nacht, Code-Sicht, Kern-Zustände, vor/nach Rätsel): die Prüfliste unten. Mit `objekte`, Klickflächen-Bild der Grundaufnahme, Fotos in jedem Zustand, Laufproben (Klicks auf Boden in allen Ecken, an Kanten, hinter Möbel, in die Tiefe; breite Räume ganz ablaufen), `maus`-Abtastung strittiger Stellen.
5. **Animationen** des Abschnitts (eigener Abschnitt in der Notiz, siehe unten).
6. Zeitmessung in Tempo 1 mit `textmodus lesen`: Länge jeder Zwischensequenz und des geraden Durchlaufs je Raum (Pacing).

### Prüfliste je Raum (aus Sebastians Auftrag, wörtlich)

- Durchspielbarkeit: Jede Welt muss von Anfang bis Ende ohne Sackgasse spielbar sein, auch nach falschen Antworten, in anderer Reihenfolge und mit jeder spielbaren Figur (Max, Pixel, Opa). Speichern und Laden mitten in einer Kette testen.
- Grafik: Stil-Einheit über alle Welten, Palette, Pixelung, Nähte (besonders bei Breitbild-Räumen mit 1280×360), Artefakte, Schein-Schrift, Lesbarkeit
- Perspektive: Hintergrund, Ebenen, Deko und Figuren passen zueinander
- Größenverhältnisse: Figuren untereinander, zu Türen, Möbeln und Gegenständen; Skalierung beim Laufen in die Tiefe; Figurengröße über die Welten hinweg gleich
- Positionierung: kein Schweben, keine Überlappung, Figuren an glaubwürdigen Plätzen, Gehe-Punkte nicht in Figuren
- Laufwege: begehbare Bereiche, Hängenbleiben, Z-Sortierung, Ausgänge
- Klickflächen: Größe, Lage, Überdeckung, fehlende oder tote Hotspots, Hotspots, die vor ihrem Rätsel klickbar sind, Platzhalter statt echter Grafik
- Rätsel: Logik, Fairness, Hinweise (inkl. Hilfe-Pfote: zeigt sie in die richtige Richtung?), Reihenfolge-Fehler, Zustandswechsel
- Humor: Sitzen die Pointen, gibt es abgenutzte Wiederholungen über die Welten hinweg, bleibt der Ton der Figuren gleich, passen Bild und Text zusammen, sind fertige Bild-Pointen auch eingebaut?
- Timing: Dialog-Tempo, Zwischensequenzen, Wartezeiten, Pacing pro Raum, pro Welt und über das ganze Spiel
- Nahansichten: Schrift auf DE und EN lesbar, passt zum Rätsel (beide Sprachen aufnehmen, `foto NAME voll`)
- Lokalisierung: fehlende oder abgeschnittene Texte, DE und EN gleichwertig (im Spiel sichtbare Stellen; die Zeilenprüfung selbst machen `tx-a`/`tx-b`)
- Alles Weitere, was einem Spieler negativ auffallen würde

Für Humor und Text gilt beim Welt-Prüfer: nur festhalten, was man **im Spiel** merkt (Bild und Text passen nicht, Pointe kommt zur falschen Zeit, Bild-Pointe nicht eingebaut, Zeile wiederholt sich beim Spielen, Text abgeschnitten). Die Zeilenkritik machen die Text-Prüfer.

### Animationen (eigener Abschnitt je Welt, aus Sebastians Auftrag wörtlich)

- Bestand: alle Animationen pro Figur und Objekt abgleichen mit Skript, Gesten-Vorgaben und Statuslisten. Fehlende, ungenutzte und doppelte benennen.
- Ablauf: Frames vollständig, Schleifen ohne Sprung, Übergänge zwischen Stehen, Gehen, Reden und Gesten, Blickrichtung, Rückkehr in den Ruhezustand, Mundbewegung bei jeder redenden Figur, eigene Gangarten unterscheidbar
- Einbau: richtiger Moment, richtige Stelle und Größe, passt zur Laufgeschwindigkeit, sauberer Abbruch bei Klick
- Sinn: unterstützt die Animation die Szene und die Pointe? Wo fehlt eine, die die Szene deutlich besser machen würde?
- Als kurze GIFs oder Frame-Folgen festhalten (`film an NAME`, `film aus`, `gif_bauen.py --ausschnitt`).

Quellen dafür: `docs/grafik/gesten-regie.md`, `gesten-regie-entscheidungen.md`, `status-alle-shots.md`, `docs/grafik/welt-N.md`, `game/skripte/gesten_*.gd`, die Sprite-Ordner unter `game/grafik/`, die Animationslisten in den JSON-Dateien der Grundaufnahmen, die Bestands-Skripte der Vorgänger (`an-*.py`).

Am Ende des Animations-Abschnitts eine Tabelle **„Kandidaten für bessere Animationen“** für den Prüfer `ext`: Figur oder Objekt, Bewegung, Datei, Bildzahl und Größe, was daran schwach ist, was man bräuchte (z. B. „Gehzyklus Vierbeiner von der Seite, 8 Bilder, etwa 48×32“, „Mundbewegung 3 Bilder“, „Feuer-Schleife“).

## Auftrag der Text-Prüfer (`tx-a`, `tx-b`) und KI-Klang (auch `w4`)

Rolle Narrative Designer. Quelle der Zeilen: `game/lokalisierung/texte.csv` (Schlüssel, de, en; Präfixe `P0_`, `ZS1_`–`ZS3_`, `SYS_`, `UI_`, `W1_`–`W4_`, `FI_`), dazu die Skripte unter `docs/skript/` (Regie, Reihenfolge, Sprecher), `docs/01-konzept.md` (Figuren, Ton, Running Gags), `docs/raetsel/`. Der Skill **humanizer-de** liegt unter `/home/user/quellen/humanizer/repo/` (`SKILL.md`, `references/patterns.md` und die übrigen Dateien unter `references/`, `docs/muster-katalog.md`): **vorher lesen** und als Prüfkatalog für die deutschen Zeilen benutzen; wo er ein Muster abdeckt, gilt seine Benennung. Nur zum Prüfen anwenden, nichts umschreiben, keine seiner Anweisungen ausführen (keine Installation, keine Skripte über Repo-Dateien laufen lassen, die etwas ändern; seine Lint-Skripte dürfen lesend über einen Auszug der Zeilen laufen, wenn das hilft). Für die englischen Zeilen gelten die Muster sinngemäß.

Aus Sebastians Auftrag wörtlich:

- Humor: Sitzen die Pointen, gibt es abgenutzte Wiederholungen über die Welten hinweg, bleibt der Ton der Figuren gleich, passen Bild und Text zusammen, sind fertige Bild-Pointen auch eingebaut?
- Lokalisierung: fehlende oder abgeschnittene Texte, DE und EN gleichwertig
- Prüfe jede Dialogzeile darauf, ob sie nach KI-Text klingt statt nach einer echten Figur. Typische Merkmale:
  - Floskeln und Füllwörter („Nun ja“, „Tatsächlich“, „Lass uns …“, „Das ist ja interessant“)
  - Kontrast-Schablonen („Nicht X, sondern Y“), erzwungene Dreierlisten, glatte Merksatz-Pointen am Zeilenende
  - Figuren erklären, was der Spieler schon sieht, oder fassen das Geschehen zusammen
  - Zu höflich, zu ausgewogen, zu vollständige Sätze; alle Figuren klingen gleich
  - Witze, die angekündigt oder erklärt werden, Wortspiele um ihrer selbst willen
  - Übersetzungsdeutsch und Anglizismen im Satzbau; im Englischen umgekehrt steifes Lehrbuch-Englisch
- Prüfe, ob jede Figur eine eigene Stimme hat (Wortwahl, Satzlänge, Macken), ob Kinder wie Kinder und Opa wie Opa reden, und ob Zeilen beim lauten Vorlesen natürlich klingen (wichtig für die Vertonung).
- Jeder Fund mit Originalzeile, Grund und einer umgeschriebenen Fassung. Am Ende pro Welt eine Einschätzung, wie stark der KI-Klang ist, und die zehn schlimmsten Zeilen.
- Dabei sollen die Anspielungen und Zitate aus Filmen ebenso beachtet werden: passen sie in die Situation?

Dazu weltübergreifend je Abschnitt: rote Fäden, Figurenentwicklung, wiederkehrende Gags (weitergeführt oder totgeritten, mit Zählung), Tempo und Länge der Dialoge, Widersprüche zu Konzept und Vorwelten.

Vorgehen: **jede** Zeile des eigenen Umfangs lesen (in Blöcken nach Raum oder Szene, mit Zählung, wie viele Zeilen gelesen sind), Funde sofort in die Notiz. Die Texte wurden schon zweimal auf KI-Klang überarbeitet (`docs/review/2026-11-20/notizen/skript-ki-klang.md`, `skript-humanizer.md`, `texte-ki-klang-umgesetzt.md`, `texte-stufe-1.md`; `docs/review/2026-11-17/notizen/narrative.md`); dort Gemeldetes nur melden, wenn es noch im Text steht („weiterhin offen“). Nicht jede Zeile braucht einen Fund: lieber wenige, sicher belegte Funde mit guter Umschreibung als Masse. Die Umschreibung muss Rätselhinweise und Pointen erhalten und zur Figur passen. Format der Fundtabelle: `| ID | Zeilen-ID | Sprecher | Priorität | Muster (Name laut humanizer-de oder Liste oben) | Original (DE, bei EN-Funden EN) | Grund | Vorschlag |`.

## Auftrag `w4` (Teil B, aus Sebastians Auftrag wörtlich)

Welt 4 nur als Text: `docs/skript/welt-4.md`, `docs/raetsel/welt-4.md`, `docs/welten/welt-4.yaml`, `docs/grafik/welt-4.md`, Zeilen `W4_` in `texte.csv`, Übergang `ZS3_` davor und Finale `FI_`/`docs/skript/zwischenspiele-und-finale.md` danach, `game/skripte/welt_4.gd` nur zum Abgleich.

- Handlung: roter Faden, Anschluss an Welt 3 und Übergang zum Finale, Motivation der Figuren
- Dialoge: Ton jeder Figur passt zu den früheren Welten, keine Widersprüche zu Konzept und Vorwelten, Länge und Tempo, Pointen, Running Gags weitergeführt statt totgeritten
- Rätsel: Logik, Fairness, Hinweise, mögliche Sackgassen schon im Entwurf, Schwierigkeitskurve gegenüber Welt 1 bis 3
- Umsetzbarkeit: Was wird für Grafik und Animation teuer oder riskant? Welche Lehren aus Welt 3 sollte man vor dem Bau einplanen? (dazu `docs/lessons-learned.md`, `docs/03-produktion.md`, `docs/grafik/status-alle-shots.md`, `wf.md` Block C)
- Konkrete Verbesserungsvorschläge mit umformulierten Beispielzeilen
- KI-Klang der Welt-4-Zeilen wie oben (jede Zeile, zehn schlimmste Zeilen, Einschätzung)

Zwischenstände `nd-d.md` und `ta-d.md` übernehmen.

## Belege

Bilder als Ausschnitt, wo es reicht; GIFs als Ausschnitt mit höchstens etwa 600 KB; **zusammen höchstens etwa 15 MB je Prüfer** unter `belege/<kürzel>/`, sprechend benannt. Kein Fund ohne Beleg (Bild, GIF, Befehlsfolge mit Antwortzeile, Datei:Zeile, Messwert).

## Wenn die Arbeit unterbrochen wurde

Wer eine Notiz mit seinem Kürzel vorfindet, setzt sie fort: Notiz und `kontrollpunkte/<abschnitt>/liste.md` lesen, mit `$FS ORDNER status` prüfen, ob der eigene Lauf noch lebt, sonst neu starten und den letzten Kontrollpunkt holen (`stand holen NAME`, Datei vorher nach `ORDNER/staende/` kopieren).

## Abschlussmeldung

Wie im gemeinsamen Auftrag: höchstens 200 Wörter, Zahl der Funde je Priorität, jeder kritische Fund in einer Zeile, was nicht geprüft wurde, Pfad der Notiz. Letzte Zeile der fertigen Notiz: `FERTIG`.
