# Couch Quest – Godot-Projekt

Godot 4.7.2 mit Popochiu 2.2.1 (Plugin in `addons/popochiu`, Lizenz dort in `LICENSE`).
Auflösung 480×270 (vorläufig; Maße zentral in `tools/aufloesung.py`, Wechsel mit
`python3 tools/aufloesung.py --umrechnen 480x270 640x360`), Pixelgrafik ohne Glättung, ganzzahlig
skaliert. Text (Nunito) wird in voller Bildschirmauflösung gezeichnet (Stretch-Modus
„canvas_items“ mit Pixel-Einrasten, `docs/05-spielsysteme.md`, Schrift). Bildschirmfotos aus dem
laufenden Spiel: `tests/bildschirmfoto.gd` (Aufruf im Kopf der Datei, braucht xvfb-run). Stand: Stufe 1
(Grundgerüst) und Graubox: Prolog und ganz Welt 1 (R1 bis R13, Rätsel 10 über Weg A oder B)
sind mit Platzhaltergrafik durchspielbar, danach die Ankunft in Zwischenspiel 1 mit der Abgabe
des Dracheneis. Reisetasche packen und Kanal 7 fehlen noch: der Drehknopf meldet dort „Ende der
Graubox“.

## Öffnen und spielen

1. Godot 4.7.2 starten, „Importieren“, `game/project.godot` wählen.
2. Beim ersten Öffnen importiert Godot alle Dateien. Meldungen über Autoloads, die nicht
   kompilieren, verschwinden nach dem ersten Import; dann einmal neu öffnen.
3. F5 startet im Wohnzimmer.

Steuerung: Linksklick benutzt, geht oder redet; Rechtsklick sieht an; Doppelklick auf einen
Ausgang wechselt sofort den Raum. Gegenstände: anklicken, dann auf das Ziel klicken. Einen
ausgewählten Gegenstand noch einmal auf sich selbst klicken heißt „im Inventar benutzen“ (nur
Zusatzreaktion, kein Rätsel hängt daran). Ganz links in der Inventarleiste liegt, sobald Pixel
wach ist, das Pixel-Feld: wie ein Gegenstand auf ein Ziel ziehen, dann schnuppert oder redet
Pixel dort. Klick aufs Pixel-Porträt oder Tab wechselt die Figur (ab der Taverne in Welt 1).
Shift zeigt die Hotspots, F5 und F9 sind Schnellspeichern und -laden, N öffnet im Debug-Build
das Notizbuch.

## Ordner

| Ordner | Inhalt | Wer pflegt |
| --- | --- | --- |
| `game/` | Popochiu-Objekte: Räume, Figuren, Gegenstände, Gespräche, GUI | angelegt vom Godot-Bau, danach von Hand |
| `skripte/` | Autoloads und Basisklassen (siehe unten) | von Hand |
| `oberflaeche/` | HUD (Porträts, Hilfe-Pfote, Meldungen), Nahansicht, Notizbuch | von Hand |
| `daten/welten/`, `daten/hinweise/` | Welt-Tabellen und Hinweise als JSON | erzeugt: `tools/spieldaten.py` |
| `daten/raeume/` | Bauplan je Abschnitt: Hotspots, Ansehen-Zeilen, Props, Gespräche | erzeugt: `tools/godot_raeume.py` |
| `grafik/platzhalter/` | Platzhalter-PNGs | erzeugt: `tools/godot_raeume.py` |
| `lokalisierung/` | `texte.csv` mit allen Zeilen und UI-Texten (de, en) | erzeugt: `tools/skript_export.py` |
| `addons/couch_quest_bau/` | Godot-Bau: legt Popochiu-Objekte nach dem Bauplan an | von Hand |
| `tests/` | Headless-Durchlauf Prolog und Welt 1 bis R4 | von Hand |

Die Inhalte gehören den Dokumenten in `docs/`. Erzeugte Dateien nie von Hand ändern, sondern
das Dokument ändern und das Werkzeug neu laufen lassen.

## Erzeugt und handgeschrieben

Der Weg vom Skript ins Spiel hat drei Schritte:

```
python3 tools/skript_export.py          # docs/skript + ui.csv → lokalisierung/texte.csv
python3 tools/spieldaten.py             # Welt-Tabellen, Hinweise → daten/welten, daten/hinweise
python3 tools/godot_raeume.py           # + tools/layout/<abschnitt>.yaml → daten/raeume/*.json, Platzhalter
godot --headless --editor --path game -- --cq-bauen   # Godot-Bau: fehlende Popochiu-Objekte anlegen
```

- **Immer neu erzeugt:** die JSON-Dateien in `daten/`, `texte.csv` und die Platzhalter-PNGs.
  Ansehen-Zeilen, Nehmen-Zeilen, Gesprächsoptionen, Bedingungen („vor P1“, „zweites Mal“),
  Zurufe und Ersatzzeilen liest das Spiel zur Laufzeit aus dem Bauplan. Eine geänderte Zeile im
  Skript braucht deshalb nur die Werkzeuge, keinen neuen Godot-Bau.
- **Einmal angelegt, dann handgeschrieben:** alles unter `game/`. Der Godot-Bau legt nur an, was
  fehlt (Raum, Hotspot, Prop, Marker, Figur, Gegenstand, Gespräch), und überschreibt nie etwas.
  Rechtecke, Laufbereich und Positionen aus `tools/layout/*.yaml` sind nur Startwerte; danach
  gehören Umrisse und Positionen der Szene und werden im Editor nachgezogen.
- **Rätsellogik** steht in den Skripten der Objekte unter `game/`, z. B.
  `game/rooms/dachboden/room_dachboden.gd` (Szenen P1 bis P3),
  `game/rooms/dachboden/props/zapp_o_mat/prop_zapp_o_mat.gd` (Antenne, Fehlversuche),
  `game/inventory_items/thunfischdose/inventory_item_thunfischdose.gd` (Kombination für P1),
  `game/rooms/taverne/room_taverne.gd` (R1), `game/inventory_items/kochloeffel/` (R2),
  `game/rooms/dorfplatz/room_dorfplatz.gd` (Lieferung der XXL-Ziege),
  `game/rooms/trollbruecke/room_trollbruecke.gd` (R3, R4: `figur_benutzt()` für Rätsel mit
  mehreren Figuren), `game/rooms/dorfplatz/hotspots/brunnen/` und `erdfleck/` (R5, R8),
  `game/rooms/klassenzimmer/hotspots/kessel/` und `flasche_im_regal.gd` (R6),
  `game/rooms/zauberwald/room_zauberwald.gd` (R7), `game/dialogs/maklerin/` (R9),
  `game/rooms/bergwerk/room_bergwerk.gd` (R10, Arbeitslied), `game/rooms/turmkeller/` (R11b),
  `game/rooms/abstellkammern/room_abstellkammern.gd` (R11a, R12),
  `game/rooms/thronsaal/room_thronsaal.gd` (R13, Abschluss) und für Zwischenspiel 1 wieder
  `room_dachboden.gd`. Regeln über mehrere Räume (Ziegen, Zeldina und Grimmzahn als
  Begleiter, die Abnehmer in Smaugis Kammer, Pixel im Fell) stehen in `skripte/welt_1.gd`;
  `CQRaum` ruft sie nach jedem Betreten und Laden auf.
- **Auswahl ohne Gesprächsfigur** (Wünsche am Brunnen, Passwort an der Geheimtür):
  `Spiel.auswahl(texte)` zeigt Popochius Inline-Auswahl; Tests geben die Antwort über
  `Spiel.vorgabe_auswahl` vor. Das Passwort sind vier Auswahlen nacheinander (gewählte Teile
  verschwinden, die Vorgabe ist der Index in die Restliste).
- **Sprechende Objekte** (Brunnen, Grammophon, Geheimtür, Spiegel; Kürzel ohne Figur): die
  Blase kommt vom Objekt im Raum (`Spiel.OBJEKTSTIMMEN`, unsichtbare Popochiu-Figur an der
  Oberkante), sonst als Systemtext.
- **Zwischenspiele** laufen auf dem Dachboden des Prologs mit dem Abschnitt `finale` (der
  Dachboden steht auch in dessen Welt-Tabelle) und dem Wert `ZWISCHENSPIEL`
  (`Spiel.zwischenspiel_beginnen(nr)`; das Inventar bleibt). Ein Raum, der zum aktuellen
  Abschnitt gehört, setzt den Abschnitt beim Betreten nicht zurück. Rätsel-IDs aus anderen
  Abschnitten („nach P3“) findet `Zustand` über alle Welt-Tabellen. Was sich im Zwischenspiel
  am Dachboden ändert, liefert `ansehen_zusatz()` des Raums zusätzlich zum Bauplan.

Das Layout (`tools/layout/<abschnitt>.yaml`) legt fest, welche Räume gebaut werden. Schlüssel
neben den Räumen: `_ausbau` (gebaute Rätsel; die übrigen gelten als gesperrt, Pfote und
Notizbuch schweigen dazu), `_alias` (Skriptname → Objekt), `_tiere` (Max versteht nur Miau),
`_figuren` (Figuren ohne festen Raum). Je Raum: `alias`, `ohne` (Objekte, deren Zeilen der
Generator überspringen soll), `hotspots`, `props` (`item: null` für Props ohne Gegenstand),
`marker`, `figuren`; je Ausgang: `gesperrt` (Zeile), `versteckt`, `erreichbar_ab`.

Basisklassen in `skripte/objekte/`: `CQRaum`, `CQHotspot`, `CQAusgang`, `CQProp`, `CQFigur`,
`CQGegenstand`, `CQDialog`. Sie liefern das Standardverhalten (Ansehen aus dem Bauplan,
Ersatzzeile, Nehmen, Raumwechsel, Gespräch aus dem Bauplan). Ein Objektskript überschreibt nur
die Sonderfälle.

Autoloads in `skripte/`:

| Autoload | Aufgabe |
| --- | --- |
| `Bauplan` | lädt `daten/` und beantwortet Fragen wie „welche Ansehen-Zeilen hat der Kalender“ |
| `Zustand` | Schalter (Namen wie in den Welt-Tabellen) und Werte; leitet den Rätselstatus gesperrt, offen oder gelöst ab; wird mitgespeichert |
| `Spiel` | Sprechen über Zeilen-IDs, Zwischensequenzen, Figurenwechsel, Nahansicht, Notizbuch, Zurufe, Ende des Prologs |
| `Hinweise` | Hilfe-Pfote: Schrittwahl, Stufen, Wartezeiten 30 und 60 Sekunden, Wartezeile |
| `Spielstand` | Autospeicher bei jedem Raumwechsel (3 Plätze), F5/F9, 12 manuelle Plätze, wartet mit dem Speichern bis eine Szene vorbei ist |
| `Telemetrie` | anonymes Spielprotokoll, nur im Testbuild und nur mit Zustimmung (siehe Testbuild und Telemetrie) |

Speichern nutzt Popochius eigene Speicherung (Räume, Figuren, Inventar je Figur, Gespräche),
nur das Dateiformat ist eigenes JSON mit Versionsnummer: `user://saves/<platz>.json`
(`skripte/cq_save_load.gd`). Der Zustand hängt über `game/popochiu_globals.gd` daran.

## Testbuild und Telemetrie

Für Tests mit Fremden (Stufe 2, `docs/03-produktion.md` A9) gibt es einen Testbuild für Linux
und Windows. `export_presets.cfg` hat zwei Vorlagen, „Linux Testbuild“ und „Windows Testbuild“,
beide mit dem Feature-Tag `cq_testbuild`:

```
godot --headless --path game --export-release "Linux Testbuild" ../build/linux/couch_quest.x86_64
godot --headless --path game --export-release "Windows Testbuild" ../build/windows/couch_quest.exe
```

Dafür müssen die Export-Vorlagen 4.7.2 installiert sein (Editor: Editor → Export-Vorlagen
verwalten; oder `Godot_v4.7.2-stable_export_templates.tpz` nach
`~/.local/share/godot/export_templates/4.7.2.stable/` entpacken). Ohne eigene Vorlagen geht es
über GitHub Actions: Workflow „Testbuild“ (`.github/workflows/testbuild.yml`) von Hand starten
(Actions → Testbuild → Run workflow). Er lädt Godot und die Vorlagen, lässt den Test im
Testmodus laufen, exportiert beide Builds und legt sie als Artefakte ab (Linux als `tar.gz`,
damit das Ausführbar-Bit bleibt). Die Build-Kennung im Protokoll ist dort der Commit.

Beim Start des exportierten Spiels meldet Popochiu 2.2.1 Kompilierfehler in seinen
Editor-Skripten (`EditorInterface` gibt es dort nicht; der Übergangs-Layer hängt am
Editor-Helfer), dazu „Failed to load script cursor.gd“. Headless startet der Linux-Build
trotzdem, betritt das Wohnzimmer, zählt Spielzeit und schreibt das Protokoll. Ob Mauszeiger und
Übergänge im Fenster stimmen, ist am Bildschirm zu prüfen (offener Punkt A9 in
`docs/offene-punkte.md`).

**Telemetrie** (`skripte/telemetrie.gd`): aktiv nur im Testbuild (Feature-Tag, im Editor zum
Ausprobieren die Projekteinstellung `couch_quest/testbuild = true`) und nur, wenn der Tester
zugestimmt hat. Gefragt wird einmal beim ersten Start (Dialog, Texte `UI_TELEMETRIE_*` in
`docs/uebersetzung/ui.csv`); die Antwort steht in `user://telemetrie/einwilligung.cfg` und lässt
sich in den Einstellungen (Knopf in der Inventarleiste) mit dem Schalter „Telemetrie“ ändern.
Daneben öffnet „Telemetrie-Ordner öffnen“ den Ordner im Dateimanager.

- Anonym: zufällige Sitzungs-ID, zufällige Tester-ID (einmal je Zustimmung, damit mehrere
  Sitzungen eines Testers zusammengehören), keine Namen und Pfade, nur der Name des
  Betriebssystems.
- Je Sitzung eine Datei `user://telemetrie/<sitzung>.jsonl`, ein JSON-Objekt je Zeile, nach
  jeder Zeile geschrieben (übersteht Abstürze). Ereignisse: Sitzung Anfang und Ende, Raum
  betreten und verlassen (mit Dauer), Rätselschritt offen und gelöst (Status wie Hinweise und
  Notizbuch: `Zustand.status()`, Schritt-IDs der Hinweis-Datei), Hinweis (Schritt, Stufe, neue
  Stufe oder Wiederholung, Wartezeile, Pfote oder Opa), Ersatzzeile, Fehlklick (Aktion auf ein
  Objekt, die in einer Ersatzzeile endet: Objekt, Benutzen/Ansehen/Gegenstand, welcher
  Gegenstand), Klick ins Leere, Gesprächsoption, Auswahl ohne Gesprächsfigur, Speichern und
  Laden. Felder und Tabelle im Kopf von `telemetrie.gd`.
- Angebunden über die Basisklassen (`aktion_beginnen()`/`aktion_beenden()` in `CQHotspot`,
  `CQProp`, `CQFigur`, `CQGegenstand`, `CQAusgang`), `CQRaum` (Raum), `CQDialog.waehlen()`,
  `CQSaveLoad` (Speichern, Laden) und die Signale `Hinweise.hinweis_gegeben` und
  `Spiel.ersatz_gesagt`. Neue Objektskripte brauchen nichts Eigenes.
- Kein Upload: Tester schicken die Datei selbst. Ein Upload (HTTPS-POST der fertigen Datei beim
  Sitzungsende an einen kleinen eigenen Dienst, mit derselben Zustimmung) ist für später
  vorgesehen; bis dahin gibt es keinen Server.

Auswertung: `python3 tools/telemetrie_auswertung.py <dateien oder ordner> -o bericht.md`. Der
Bericht nennt je Rätselschritt Median und Maximum der Zeit, wie viele Tester Stufe 1, 2, 3
brauchten, Hinweis-Klicks und Fehlklicks, je Rätsel die Gesamtzeit, Stufe 3 je Welt, die
Spielzeit bis R4 und vergleicht mit den Zielwerten. Dazu gehört der Beobachtungsbogen
`docs/test/beobachtungsbogen.md` (ein Blatt je Tester).

## Grafik ersetzen

Platzhalter liegen in `grafik/platzhalter/` und sind in den Szenen als Textur gesetzt. Für
echte Grafik:

1. Bild nach dem Dateinamen-Schema aus `docs/grafik/00-stil-und-werkzeuge.md` ablegen (nicht in
   `platzhalter/`).
2. Im Editor die Textur des Props bzw. der Figur austauschen. Hintergründe sind das Prop
   `Background` jedes Raums.
3. Hotspot-Umrisse, Laufbereich und Marker an das neue Bild anpassen (Popochiu-Werkzeuge im
   Editor).
4. Gegenstands-Icons: die Pfade stehen im Bauplan (`icons` je Zustand); dafür in
   `tools/godot_raeume.py` den Pfad ändern oder im Gegenstandsskript `aussehen_anpassen()`
   überschreiben.

Der Zapp-O-Mat ist ein Sheet mit fünf Bildern (aus, Schnee, Antenne, bunt, Wirbel); welches
Bild gilt, leitet `room_dachboden.gd` aus P1 bis P3 ab.

## Tests

```
cd game
godot --headless --path . --import                                   # einmal nach dem Klonen
godot --headless --path . -s res://tests/prolog_durchlauf.gd          # Testmodus, gut 3 Minuten
godot --headless --path . -s res://tests/prolog_durchlauf.gd -- --echt   # echte Sprechblasen, gut 9 Minuten
```

Der allererste Import nach dem Klonen meldet rund 60 Fehler (Autoloads und Übersetzungen, die erst beim Import entstehen). Das ist normal: Ein zweiter Import und das Öffnen im Editor laufen fehlerfrei. Im Editor genügt es, das Projekt einmal zu öffnen und, falls Godot fragt, neu zu laden.

Der Test spielt den Lösungspfad P1 bis P3 und danach Welt 1 bis R4 (Taverne, Zauberstab-Laden,
Schmiede, Dorfplatz, Troll-Brücke, Wasserschloss, Zauberwald, Bergwerk, Hoggelwarz) mit
Fehlversuchen, Hinweisen, Gesprächen und Figurenwechsel und prüft nach jedem Schritt Schalter, Status, Inventar und eine Speichern/Laden-Rundreise
(speichern, Zustand verfälschen, laden, vergleichen), auch mit Pixel als aktiver Figur.
Exit-Code 0 heißt alles grün.

Der Test schaltet außerdem die Telemetrie ein (Testbuild, erst ohne, dann mit Zustimmung) und
prüft am Ende das Protokoll: Sitzung, Räume, Schritte offen und gelöst, Hinweise mit Wartezeile,
Ersatzzeile und Fehlklick (Dosenöffner auf Poster), Klick ins Leere, Gesprächsoption, Auswahl,
Speichern, Laden, keine Pfade. Die Datei liegt in `user://test_telemetrie/<prozess>/` (Spielstände in
`user://test_saves/<prozess>/`, damit zwei Läufe gleichzeitig gehen) und wird danach
gelöscht; mit `CQ_TELEMETRIE_BEHALTEN=1` bleibt sie liegen (Beispiel für die Auswertung, sie
zählt dort nur mit `--mit-tests`, wenn sie aus dem Testmodus stammt).

- **Testmodus** (Standard): Zeilen werden nur protokolliert, Wege nicht gelaufen, Nahansicht
  und Notizbuch nicht geöffnet. Raumwechsel, Übergänge, Inventar und Speichern laufen echt.
- **`--echt`**: alles läuft wie im Spiel, mit `say()`, `E.cutscene()`, Laufwegen und
  Überlagerungen. Damit das headless geht, schaltet der Test Popochius automatisches
  Weiterschalten der Sprechblasen ein, lässt die Zeit zehnfach laufen
  (`CQ_ZEITFAKTOR=1` für Echtzeit) und schließt Nahansicht und Notizbuch nach einer halben
  Sekunde. Ohne automatisches Weiterschalten wartet jede Sprechblase headless ewig auf einen
  Klick.

GitHub Actions (`.github/workflows/pruefen.yml`, Job `godot`) lädt Godot, importiert und lässt
beide Varianten laufen.

## Änderungen an Popochiu

Das Addon `addons/popochiu` ist unverändert. Drei Probleme von Popochiu 2.2.1 sind in der
Projektkopie der Inventarleiste behoben (`game/gui/components/simple_click_bar/simple_click_bar.gd`,
Stellen mit „Couch Quest:“ markiert):

- `I.add_item()`/`remove_item()` warten auf ein Fertig-Signal der Leiste. Die Leiste zeigt nur das
  Inventar der aktiven Figur; bei der anderen Figur kam das Signal nie, und der Aufruf hing. Jetzt
  meldet die Leiste in dem Fall sofort „fertig“.
- Beim Laden leert Popochiu die Inventare aller Figuren. War Pixel aktiv, hingen Max' Gegenstände
  nicht in der Leiste, und `remove_child` meldete Fehler. Jetzt wird nur entfernt, was dort hängt.

- Nach dem Laden mit Pixel als aktiver Figur und dem Wechsel zurück zu Max hing ein Gegenstand
  schon in der Leiste, und `add_child` meldete einen Fehler. Jetzt hängt `show_item` nur um,
  was noch nicht dort hängt.

Dazu hält die Leiste das Pixel-Feld ganz links.
