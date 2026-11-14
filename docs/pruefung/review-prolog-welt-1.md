# Großes Review: Prolog und Welt 1 (Auftrag für Fable)

Stand 14. November 2026. Ersetzt den kleineren Auftrag `review-welt-1.md`. Prolog und Welt 1 sind grafisch komplett, der Aseprite-Durchgang (P15) ist gelaufen, und die Figuren gehen und gestikulieren teils mit Bewegungen aus 3D-Modellen (Meshy und Blender, „Mischweg“: Beinwinkel aus der 3D-Bewegung, gemaltes Sprite). Dieses Review ist die Gesamtprüfung vor dem Test mit fünf Fremden. Empfohlene Einstellung: Fable, Denkstufe „hoch“. Ergebnis ist ein Bericht, keine Code-Änderung.

## Auftrag in einem Satz

Spiel Prolog und Welt 1 bis zum Ende des Thronsaals wie ein Tester durch, sieh dir jeden Raum, jede Figur und jede Animation an und bewerte Spielbarkeit, Rätsel, Witz, Grafik, Animation und Technik; prüfe, ob der Aseprite- und 3D-Durchgang seine Ziele erreicht hat, und liefere eine priorisierte Liste, was vor dem Test mit Fremden noch geändert werden sollte.

## Stand des Spiels prüfen

- Prüfe den neuesten Stand: Arbeitszweig `claude/project-thread-c7ynqe` (enthält den Aseprite-Durchgang, die Gemini-Posen und den 3D-Gang) oder `main`, falls er schon gemergt ist. `git log --oneline -20` zeigt, was zuletzt dazukam.
- Arbeite in einem eigenen Checkout oder Ordner, nicht in einem fremden Arbeitsordner mit offenen Änderungen.

## Regeln

- **Nur prüfen und berichten.** Keine Dateien im Spiel ändern, nichts committen außer den Ergebnisdateien. Hilfsskripte und Bildschirmfotos im eigenen Arbeitsordner.
- **Belege.** Jeder Fund nennt Raum, Objekt, Figur oder Zeilen-ID (etwa `W1_TAV_MAX_1425`) und, wo es um Optik geht, ein Bildschirmfoto oder ein kurzes GIF mit markierter Stelle.
- **Bekanntes einordnen.** `docs/offene-punkte.md` (P15 Nacharbeiten, Animationen, P16 lebendige Hintergründe) listet bekannte Baustellen. Für jeden Eintrag dort: erledigt, teilweise, offen. Nur melden, was schlimmer ist als beschrieben oder falsch priorisiert.
- **Deutsch schreiben**, Spieltexte kurz im Original zitieren.
- **Spielerperspektive zuerst.** Nicht „was steht im Design-Dokument“, sondern „was erlebt jemand, der das Spiel zum ersten Mal spielt“.

## Was zu lesen ist (in dieser Reihenfolge)

1. `docs/01-konzept.md`: Ton, Figuren, Geschichte, Zielgruppe.
2. `docs/raetsel/prolog-und-welt-1.md`: Rätselkette P1 bis P3 und R1 bis R13, Lösungen, Hinweise.
3. `docs/skript/prolog.md` und `docs/skript/welt-1.md`: alle Zeilen (überfliegen, gezielt nachschlagen).
4. `docs/05-spielsysteme.md`: Bedienung, Hinweissystem, Speichern.
5. `docs/offene-punkte.md`: P15 (Nacharbeiten je Raum), Animationen, P16.
6. `docs/grafik/02-prolog-und-finale.md` und `docs/grafik/welt-1.md`: Grafik-Plan, Abschnitt „Umgesetzt und Abweichungen“.
7. `docs/test/beobachtungsbogen.md`: woran der Test mit Fremden gemessen wird.

## Werkzeuge

Aus dem Ordner `game/`, Godot-Konsole `"E:/Game Engine/Godot_v4.7.2-stable_win64.exe/Godot_v4.7.2-stable_win64_console.exe"`:

- Durchspieltest (Logik, alle Rätsel, beide Wege): `--headless --path . -s res://tests/prolog_durchlauf.gd`
- Bildschirmfotos aller Räume: `--path . --rendering-driver opengl3 --resolution 640x360 -s res://tests/bildschirm_vergleich.gd -- <ordner>` (Übersicht je Abschnitt als `uebersicht_*.png`)
- Prüfskript Daten und Skript: `py -3 tools/pruefen.py` (aus dem Hauptordner)
- Eigene Ansichten und Filme: ein kleines `SceneTree`-Skript in `game/tests/_name.gd` schreiben und nach Gebrauch löschen. Vorlage: `tests/bildschirm_vergleich.gd`. Im Testmodus (`Spiel.testmodus = true`) laufen Szenen ohne Wartezeit; für Aufnahmen von Szenen und Animationen den Testmodus weglassen, `E.settings.auto_continue_text = true` setzen und Bilder in kurzen Abständen speichern (daraus ein GIF bauen). Ein Raum lässt sich direkt starten mit `change_scene_to_file("res://game/rooms/<id>/room_<id>.tscn")` nach `Zustand.abschnitt = "welt-1"`.
- Aseprite liegt unter `C:/Program Files/Aseprite/Aseprite.exe` (Batch-Modus mit Lua), falls ein Sprite oder ein Sprite-Sheet einzeln angesehen werden soll.

## Prüfliste

### 1. Spielfluss und Rätsel (wichtigster Teil)

Für jedes Rätsel P1 bis P3 und R1 bis R13:

- Ist das Ziel klar, bevor der Spieler die Lösung braucht? Wer oder was sagt es?
- Ist die Lösung fair: Gibt es einen Hinweis, der zur Lösung führt, ohne sie zu verraten? Logisch im Sinn der Spielwelt (Märchenlogik ja, Zufall nein)?
- Mondlogik: Schritte, auf die man nur durch Durchprobieren kommt?
- Stecken bleiben: Gegenstand verbraucht, Raum gesperrt, Figur weg? Weiß der Spieler immer, wo es weitergeht?
- Laufwege: Wie oft muss man für ein Rätsel zwischen Räumen hin und her, und ist das angenehm?
- Hilfe-Pfote: Führen die Stufen 1 bis 3 zur Lösung, und sind sie unterhaltsam?
- Besonders prüfen: das Huhn-Rätsel in der Taverne (Berta hackt, Pixel übersetzt, Laute; `W1_TAV_*_1425` bis `1605`), der Kanal im Prolog (Opa darf Drehknopf und Kalender nicht verdecken), Rätsel 11 mit den Besen und Kreuzungen im Turmkeller, Rätsel 12 in Smaugis Kammer (Hintergrund wechselt nach dem Rätsel).
- Schätzung: Wie lange braucht ein Erstspieler pro Rätsel (Ziel 8 bis 12 Minuten), und wie lange dauert der Vertical Slice (Prolog bis R4, Ziel etwa 40 Minuten)?

### 2. Witz und Text

- Tragen die Witze? Je Raum die drei besten und drei schwächsten Stellen mit Zeilen-ID.
- Wiederholen sich Muster zu oft (Pixels „junger Mann“, „//“-Nachsätze, Satzbauten)?
- Passen Ton und Stimme der Figuren zum Konzept?
- Sind Zeilen zu lang für Sprechblasen bei 640×360?
- Passen Texte und Bilder zusammen (etwa Max beschreibt etwas, das im Bild anders aussieht: Nahansichten, Kritzelei, Hinweiszettel)?
- Anspielungen: Wirkt etwas wie eine Kopie statt wie eine Anspielung (`03-produktion.md`, Regeln zu Parodien)?

### 3. Räume und Grafik

Für die drei Prolog-Räume und die 14 Räume von Welt 1, anhand von Bildschirmfotos:

- Lesbarkeit: Erkennt man Ausgänge, Hotspots und wichtige Gegenstände, ohne sie zu suchen? Fallen nehmbare Dinge zu sehr auf oder gar nicht (Ziel laut P15: eingebunden, nur leicht hervorgehoben)?
- Maßstab: Passen Figuren zu Türen, Möbeln und Häusern (`tiefe:` und `skala:` in `tools/layout/*.yaml`)? Stehen sie auf dem Boden, schweben sie, verdecken sie Wichtiges?
- Platzierung und Blickrichtung der Figuren: sinnvoll in den Raum gestellt?
- Stilbruch: Wirkt ein Hintergrund, eine Figur oder ein Sprite wie aus einem anderen Spiel (Strich, Farben, Licht)? Besonders: Figuren, die ohne feste Palette umgerechnet wurden, gegen die übrigen.
- Nähte und Montagen: Breitbild-Räume (Dorfplatz, Zauberwald, Bergwerk, Luftschloss), zusammengesetzte Fassungen (Turmkeller mit Tür zu, Smaugis aufgeräumte Kammer), ausgeschnittene Vordergrund-Teile (Tresen, Korb, alter Baum).
- Übergänge: Passen Ausgänge benachbarter Räume zusammen (wer rechts hinausgeht, kommt links herein)?
- Lebendige Hintergründe (Dorfplatz Vögel und Blätter, Klassenzimmer Schüler am Fenster): stimmig, zu viel, zu wenig, und wo fehlen sie am meisten?
- Nahansichten: lesbar, schön genug, passend zum Text?

### 4. Figuren und Animationen

Hier liegt die meiste neue Arbeit; bitte mit Filmen oder Bildfolgen prüfen, nicht nur mit Standbildern.

- **Gang:** Max, Opa und die Figuren mit 3D-Gang (Alwin, Humbert, Schmied, Stabmacher, Maklerin, Rotkäppchen, Grimmzahn, Goblins). Rutschen die Füße über den Boden, passt die Schrittlänge zur Laufgeschwindigkeit, bleiben Kopf und Oberkörper ruhig, sieht man Nähte zwischen gemaltem Sprite und gedrehten Beinen? Wirkt der Gang zur Figur passend (Opa gebückt, Max lässig)?
- **Treppe** im Prolog (Max), **Sitzen und Aufstehen** im Wohnzimmer, **Ankunft in Welt 1** (Max landet, liegt, steht auf; Pixel landet auf vier Pfoten; Toadi rennt herbei; Max dreht sich um), **Pixel springt auf den Dachbalken** in der Taverne.
- **Reden:** Mundbewegung und Gesten, wo vorhanden (Opa). Wirkt das Kopfnicken der übrigen Figuren ausreichend?
- **Atmen und Eigenheiten:** Grundsatz aus `offene-punkte.md`: Gehen nur, wer läuft; jede Figur darf eine kleine Eigenheit haben (Alwin rührt, Schmied hämmert, Schmiede-Ziege dreht eine Runde). Pro Figur eine Empfehlung: reicht, Eigenheit (welche), Szenen-Animation.
- **Szenen, in denen eine fehlende Animation den Witz kostet** (Bertas Flucht auf den Balken, Waldemars Musical-Nummer, Gollos Ringwurf, Humbert geht in den Keller, Moderworts Niesen, Fluch wird Käse, Pilz-Verwandlung).
- **Mischweg bewerten:** Lohnt sich der 3D-Weg für weitere Figuren und Welten, oder ist gemalte Pose-zu-Pose-Animation in Aseprite besser? Begründung mit Beispielen.

### 5. Bedienung und Technik

- Maus und Controller: Ist alles erreichbar, verdecken Figuren Hotspots, sind Klickflächen zu klein?
- Speichern und Laden mitten in Rätseln und Szenen (auch nach Hintergrundwechseln im Turmkeller und in Smaugis Kammer): geht nichts verloren, steht alles an seinem Platz?
- Überspringen von Szenen mit Esc: steht danach jeder richtig (Ankunft, Pilz-Verwandlung, Berta)?
- Fehlermeldungen in der Godot-Ausgabe (SCRIPT ERROR, fehlende Dateien, Warnungen).
- Leistung: ruckelt etwas (Breitbild-Räume, Ambiente-Ebene, große Sprite-Sheets)?
- Ergebnisse von `prolog_durchlauf.gd`, `bildschirm_vergleich.gd` und `pruefen.py`.

### 6. Gesamtbild

- Fühlt sich Welt 1 wie ein zusammenhängendes Märchenbuch an (Konzept: je näher am Turm, desto violetter)? Passt der Prolog im Stil dazu?
- Stärkstes und schwächstes Element von Prolog und Welt 1.
- Ist der Vertical Slice (Prolog bis R4) bereit für den Test mit fünf Fremden? Falls nein: die drei Dinge, die vorher sein müssen.
- Was sollte für die Welten 2 bis 4 aus diesem Durchgang gelernt werden (Arbeitsweise Gemini, Aseprite, 3D, Einbau)?

## Ergebnis

Eine Datei `docs/pruefung/review-prolog-welt-1-ergebnis.md` mit:

1. **Kurzfazit** (höchstens zehn Sätze): Zustand, größte Stärke, größtes Risiko, Testreife des Slice.
2. **Funde als Tabelle**, sortiert nach Priorität:

   | Nr. | Priorität | Bereich | Raum, Figur oder Rätsel | Fund | Beleg | Vorschlag | Aufwand |
   | --- | --- | --- | --- | --- | --- | --- | --- |

   Priorität: **A** vor dem Test mit Fremden, **B** vor der Demo mit ganz Welt 1, **C** irgendwann. Bereich: Rätsel, Text, Grafik, Animation, Bedienung, Technik. Aufwand: klein (unter einer Stunde), mittel, groß.
3. **Rätsel-Übersicht**: je Rätsel eine Zeile mit Fairness (gut, knapp, unfair), geschätzter Zeit und wichtigstem Fund.
4. **P15-Abgleich**: jeder Eintrag aus „Nacharbeiten an eingebauten Hintergründen“ mit erledigt, teilweise oder offen.
5. **Animationsplan**: Tabelle Figur, Zustand heute, empfohlene Bewegungen, Weg (gemalt, 3D, Code), Priorität.
6. **Bildschirmfotos und GIFs** zu den Funden in `docs/pruefung/review-prolog-welt-1/` (nummeriert wie die Funde).

Am Ende kurz angeben, was nicht geprüft werden konnte und warum.
