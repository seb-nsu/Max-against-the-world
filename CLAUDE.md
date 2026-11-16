# Hinweise für Claude

Couch Quest ist ein Godot-4-Point-and-Click-Adventure (Popochiu, Pixel-Art 640×360). Antworten auf Deutsch, schlicht und praxisnah.

## Vor jeder Arbeit lesen

- `docs/lessons-learned.md`: was funktioniert hat, wo es mehrere Runden gebraucht hat, Kosten, Thread-Aufteilung. Bei Grafik, Animation oder Einbau zuerst dort nachsehen.
- `docs/quellen.md`: externe Quellen (zum Beispiel Slynyrd zu Animation) mit dem, was wir daraus übernommen haben. Neue hilfreiche Links dort eintragen.
- `docs/00-aufbau.md`: welche Datei welche Information besitzt.
- `docs/grafik/00-stil-und-werkzeuge.md`: Stil, Prompt-Bausteine, Werkzeuge.
- `docs/entscheidungen.md` und `docs/offene-punkte.md`.

## Feste Regeln (Kurzfassung)

- Eine Gesamtliste aller Shot-IDs je Abschnitt führen und nach jeder Runde nachführen, statt mehrerer Offen-Listen.
- Läufe von Menschen: Meshy-Clip plus Teile-Rig aus dem gemalten Sprite, 8 Bilder, automatische Prüfung (zwei Beine, keine Löcher). Nie direkt aus Gemini.
- Posenbögen: höchstens vier Posen, eigene Spalten mit Abstand, Konzeptblatt als Vorlage, Magenta-Hintergrund, den Kater „the tomcat“ nennen.
- Varianten im selben Gemini-Chat aus dem Grundbild, beim Einbau nur die geänderte Stelle einsetzen. Breite Räume als ein Panorama.
- Vor dem Zeigen: gegen Stand-Sprite und im Raum mit allen Figuren prüfen, Einzelbilder vergrößert, GIF in Spieltempo.
- Kosten vorher mit realem Stückpreis nennen, bei 70 % der Grenze melden. Freigaben für die PC-Sitzung als wörtlichen Satz erbitten.
- Erzeugte Dateien (`docs/grafik/fertige-prompts/`, `game/daten/`) nie von Hand bearbeiten, sondern neu erzeugen.
- Vor jedem Commit `python3 tools/pruefen.py`. Screenshot-Referenzen nur unter Linux aufnehmen. Vor dem Push pullen. PRs mit großen Quellbögen per Squash mergen.
- Im gemeinsamen Ordner `E:\Claude\Couch Quest` nichts verwerfen oder zurücksetzen; dort liegen Sebastians ungesicherte Godot-Änderungen.

Neue Erkenntnisse kommen nach `docs/lessons-learned.md`, nicht hierher.
