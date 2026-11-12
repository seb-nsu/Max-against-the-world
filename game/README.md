# Couch Quest – Godot-Projekt

Godot 4.7.2 mit Popochiu 2.2.1 (Plugin in `addons/popochiu`, Lizenz dort in `LICENSE`).
Auflösung 640×360 (seit 10. November 2026, vorher 480×270; Maße zentral in `tools/aufloesung.py`,
Wechsel mit `python3 tools/aufloesung.py --umrechnen ALT NEU`), Pixelgrafik ohne Glättung, ganzzahlig
skaliert. Text (Nunito) wird in voller Bildschirmauflösung gezeichnet (Stretch-Modus
„canvas_items“ mit Pixel-Einrasten, `docs/05-spielsysteme.md`, Schrift). Bildschirmfotos aus dem
laufenden Spiel: `tests/bildschirmfoto.gd`, `tests/bildschirmfoto_menues.gd` und `tests/bildschirmfoto_minispiele.gd` (Aufruf im Kopf der Datei, braucht xvfb-run). Stand (11. November 2026):
Graubox. Prolog, Welt 1 bis 4, die drei Zwischenspiele mit Reisetasche und das Finale mit Abspann
sind mit Platzhaltergrafik durchspielbar, die drei Minispiele (Hebel, Rede-Ringen, Zombie-Tanz)
mit eigener Spielfläche. Grafik und Tondateien fehlen; der Ton ist verdrahtet und spielt bis dahin
Platzhalter-Töne.

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
das Notizbuch. Mit Gamepad oder Steam Deck: Stick bewegt den Zeiger, Steuerkreuz springt zum
nächsten Hotspot, A benutzt, B sieht an, X zeigt die Hotspots, Y ist die Hilfe-Pfote, LB wechselt
die Figur, RB springt ins Inventar, Start öffnet das Pausemenü (`skripte/controller.gd`).

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
python3 tools/layout_skizzen.py         # Layout-Skizzen mit Tiefe für die Konzeptbilder → docs/grafik/skizzen/
python3 tools/pixelieren.py ORIGINAL ZIEL  # Gemini-Konzeptbild → Hintergrund 640×360, 32 Farben
python3 tools/stimmung.py GRUND ZIEL STIMMUNG [--lampe X,Y]  # Lichtstimmung per Umfärben
python3 tools/prompts_zusammensetzen.py # fertige Prompts je Raum, Figur und Sammelbild → docs/grafik/fertige-prompts/
python3 tools/stimmigkeit.py --bogen b.png # Räume farblich vergleichen (Helligkeit, Wärme, Sättigung)
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
- **Minispiele** (Archimedes' Hebel und Rede-Ringen in Welt 2, Zombie-Tanz in Welt 4): Die Regeln
  stehen ohne Oberfläche in `skripte/minispiele/` (`hebel.gd`, `rede_ringen.gd`,
  `zombie_tanz.gd`), die Spielflächen in `oberflaeche/minispiel_*.gd` (gemeinsamer Rahmen
  `minispiel.gd`). `Spiel.minispiel_oeffnen(skript)` öffnet eine Spielfläche; sie zählt wie eine
  Zwischensequenz. Die Regeln des Abschnitts führen den Ablauf und fragen die Spielfläche nach dem
  nächsten Zug. Im Testmodus kommen die Züge aus `Spiel.vorgabe_auswahl`; mit
  `Spiel.minispiel_von_hand` drückt ein Test die echten Knöpfe (`tests/minispiele.gd`). Figuren und
  Hintergründe sind gezeichnete Platzhalter, bis es die Grafik gibt. Tempo und Versatz des
  Zombie-Tanzes stehen als `BPM` und `VERSATZ` in `zombie_tanz.gd` (nach dem Erzeugen der Musik
  messen und eintragen).
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
| `Einstellungen` | Optionen in `user://settings.cfg`: Lautstärken je Bus, Fenster, VSync, Bildrate, Sprache, Texttempo, Tastenbelegung, Barrierefreiheit; gelten sofort |
| `Klang` | Audio-Gerüst: Musik und Atmosphäre je Raum (Welt-Tabelle, Felder `musik`, `atmo`, `tupfer`), Jingles, Geräusche, Stimmen über IDs aus `audio/`; fehlende Dateien bleiben still oder spielen einen Platzhalter (`docs/04-audio.md`, Im Spiel). Wo welches Geräusch spielt, steht in `skripte/klang_einsatz.gd`: Tabellen je Skriptzeile, Objekt, Gegenstand, Laut einer Figur und Schritt je Raum |

Menüs in `oberflaeche/`: `hauptmenue.tscn` ist die Startszene; `pausemenue.gd` (Esc),
`spielstaende.gd` (Speichern und Laden) und `optionen.gd` (fünf Reiter) teilen den Stil aus
`menue_stil.gd`. Wer im Editor direkt einen Raum starten will, nimmt „Szene starten“ (F6).

Speichern nutzt Popochius eigene Speicherung (Räume, Figuren, Inventar je Figur, Gespräche),
nur das Dateiformat ist eigenes JSON mit Versionsnummer: `user://saves/<platz>.json`
(`skripte/cq_save_load.gd`). Stand ist Version 3; ältere Spielstände hebt `umwandeln()` beim Lesen an
(Koordinaten der alten Auflösung, umbenannte Schalter). Der Zustand hängt über `game/popochiu_globals.gd` daran.

## Testbuild und Telemetrie

Für Tests mit Fremden (Stufe 2, `docs/03-produktion.md` A8 und A9) gibt es einen Testbuild für
Linux, Windows und den Browser. `export_presets.cfg` hat drei Vorlagen, „Linux Testbuild“,
„Windows Testbuild“ und „Web Testbuild“, alle mit dem Feature-Tag `cq_testbuild`:

```
godot --headless --path game --export-release "Linux Testbuild" ../build/linux/couch_quest.x86_64
godot --headless --path game --export-release "Windows Testbuild" ../build/windows/couch_quest.exe
godot --headless --path game --export-release "Web Testbuild" ../build/web/index.html
```

Der Web-Build läuft ohne Threads und braucht deshalb keine besonderen Server-Header; zum
Ausprobieren reicht `python3 -m http.server` im Ordner `build/web`. Im Browser lädt der
Telemetrie-Knopf in den Einstellungen das Protokoll als Datei herunter.

Dafür müssen die Export-Vorlagen 4.7.2 installiert sein (Editor: Editor → Export-Vorlagen
verwalten; oder `Godot_v4.7.2-stable_export_templates.tpz` nach
`~/.local/share/godot/export_templates/4.7.2.stable/` entpacken). Ohne eigene Vorlagen geht es
über GitHub Actions: Workflow „Testbuild“ (`.github/workflows/testbuild.yml`) von Hand starten
(Actions → Testbuild → Run workflow). Er lädt Godot und die Vorlagen, lässt den Test im
Testmodus laufen, exportiert alle drei Builds und legt sie als Artefakte ab (Linux als `tar.gz`,
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
3. Hotspot-Umrisse, Laufbereich und Marker an das neue Bild anpassen: entweder mit den
   Popochiu-Werkzeugen im Editor oder über das Layout. Für das Layout im Raum-Eintrag von
   `tools/layout/<abschnitt>.yaml` `hintergrund: res://grafik/hintergruende/<datei>.png` setzen,
   Rechtecke, Laufziele, Laufbereich, Marker und Figurenplätze aus dem Bild eintragen, dann
   `python3 tools/godot_raeume.py` und
   `godot --headless --editor --path game -- --cq-bauen --cq-layout=<raum_id>`. Diese Option
   überschreibt für die genannten Räume Lage und Umriss aller Objekte in der Szene (Ausnahme von
   der Regel „nur anlegen“); Skripte bleiben unberührt. Feste Positionen im Raumskript (etwa
   Pixels Plätze in `room_dachboden.gd`) von Hand nachziehen. Ändern sich Figurengrößen (`groesse_px` in den
   Welt-Tabellen), passt `--cq-bauen --cq-figuren-groesse` Sprite, Fußpunkt, Klickfläche und
   Sprechblasenhöhe aller Figuren an die neuen Texturen an. Erster Raum so: Dachboden,
   10. November 2026. Hat der Boden im Bild Tiefe (Raumansicht „Mittelweg“, Entscheidung 10. November
   2026), im Layout des Raums `tiefe: 0.85` eintragen und `laufbereich` auf den Boden im Bild
   setzen, dann `tools/godot_raeume.py` laufen lassen: `CQRaum.tiefe_anwenden()` verkleinert die
   Figuren von 100 Prozent am unteren Rand des Laufbereichs auf 85 Prozent an seiner Hinterkante.
   Räume mit Treppe oder senkrechtem Laufweg (Treppenhaus) bekommen keinen Eintrag.
   Mit Tiefe kann eine Figur vor oder hinter Möbeln stehen, die auf dem Boden stehen: Solche
   Teile aus dem Hintergrund als eigenes Prop ausschneiden und ihre Baseline auf den Fußpunkt
   setzen, dann sortiert Popochiu die Figuren richtig davor oder dahinter.
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
godot --headless --path . -s res://tests/menues.gd                    # Menüs, Optionen, Audio-Gerüst, erster Raum nach dem Hauptmenü, unter 1 Minute
godot --headless --path . -s res://tests/minispiele.gd                # Hebel, Rede-Ringen, Zombie-Tanz, unter 1 Minute
godot --headless --path . -s res://tests/ton.gd                       # Geräusche, Atmosphäre, Stücke, unter 1 Minute
godot --headless --path . -s res://tests/schalter.gd                  # Untertitel, Wackeln aus, Farbenblind-Hilfe, unter 1 Minute
```

**Screenshot-Regressionstest (A16):** `tests/bildschirm_vergleich.gd` betritt jeden gebauten Raum
aller Abschnitte, fotografiert ihn ohne Oberfläche und vergleicht mit `tests/bildschirm/referenz/`
im Repo-Wurzelordner (Toleranz: höchstens 0,5 Prozent abweichende Pixel). Braucht einen Bildschirm,
unter Linux xvfb-run; gut 3 Minuten. Abweichungen landen als Dreierbild (Referenz, jetzt, Maske)
im Ausgabeordner, dazu je Abschnitt eine Übersicht aller Räume. Nach gewollten Grafikänderungen
(neue Platzhalter, echte Hintergründe, geänderte Layouts) die Referenzen neu schreiben und die
Übersicht einmal mit dem Auge prüfen:

```
xvfb-run -a -s "-screen 0 1280x720x24" godot --path . --rendering-driver opengl3 --resolution 640x360 \
    -s res://tests/bildschirm_vergleich.gd -- [--aktualisieren] [AUSGABEORDNER]
```

Läuft in GitHub Actions als eigener Job „bildschirm“; Abweichungen und Übersichten gibt es dort als
Artefakt. Die Bildschirmfotos der Oberfläche (`bildschirmfoto.gd`, `bildschirmfoto_menues.gd`,
`bildschirmfoto_minispiele.gd`)
nehmen `--sprache=en` für die englische Fassung.

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
