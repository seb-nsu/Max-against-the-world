# Couch Quest – Godot-Projekt

Godot 4.7.2 mit Popochiu 2.2.1 (Plugin in `addons/popochiu`, Lizenz dort in `LICENSE`).
Auflösung 320×180, Pixelgrafik ohne Glättung, ganzzahlig skaliert. Stand: Stufe 1
(Grundgerüst) und Vertical Slice als Graubox: Prolog und Welt 1 bis Rätsel 4 sind mit
Platzhaltergrafik durchspielbar. Räume hinter R4 (Luftschloss, Turm) erscheinen nur als
gesperrter Ausgang; Gespräche zu Rätseln ab R5 melden „Ende des Vertical Slice“.

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
  mehreren Figuren). Regeln über mehrere Räume (Ziegen als Begleiter, Pixel im Fell) stehen in
  `skripte/welt_1.gd`; `CQRaum` ruft sie nach jedem Betreten und Laden auf.

Das Layout (`tools/layout/<abschnitt>.yaml`) legt fest, welche Räume gebaut werden. Schlüssel
neben den Räumen: `_ausbau` (gebaute Rätsel; die übrigen gelten als gesperrt, Pfote und
Notizbuch schweigen dazu), `_alias` (Skriptname → Objekt), `_tiere` (Max versteht nur Miau),
`_figuren` (Figuren ohne festen Raum). Je Raum: `alias`, `ohne` (Props, die erst später kommen);
je Ausgang: `gesperrt` (Zeile), `versteckt`, `erreichbar_ab`.

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

Speichern nutzt Popochius eigene Speicherung (Räume, Figuren, Inventar je Figur, Gespräche),
nur das Dateiformat ist eigenes JSON mit Versionsnummer: `user://saves/<platz>.json`
(`skripte/cq_save_load.gd`). Der Zustand hängt über `game/popochiu_globals.gd` daran.

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
godot --headless --path . -s res://tests/prolog_durchlauf.gd          # Testmodus, knapp 1 Minute
godot --headless --path . -s res://tests/prolog_durchlauf.gd -- --echt   # echte Sprechblasen, 1,5 Minuten
```

Der allererste Import nach dem Klonen meldet rund 60 Fehler (Autoloads und Übersetzungen, die erst beim Import entstehen). Das ist normal: Ein zweiter Import und das Öffnen im Editor laufen fehlerfrei. Im Editor genügt es, das Projekt einmal zu öffnen und, falls Godot fragt, neu zu laden.

Der Test spielt den Lösungspfad P1 bis P3 und danach Welt 1 bis R4 (Taverne, Zauberstab-Laden,
Schmiede, Dorfplatz, Troll-Brücke, Wasserschloss, Zauberwald, Bergwerk, Hoggelwarz) mit
Fehlversuchen, Hinweisen, Gesprächen und Figurenwechsel und prüft nach jedem Schritt Schalter, Status, Inventar und eine Speichern/Laden-Rundreise
(speichern, Zustand verfälschen, laden, vergleichen), auch mit Pixel als aktiver Figur.
Exit-Code 0 heißt alles grün.

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

Das Addon `addons/popochiu` ist unverändert. Zwei Probleme von Popochiu 2.2.1 sind in der
Projektkopie der Inventarleiste behoben (`game/gui/components/simple_click_bar/simple_click_bar.gd`,
Stellen mit „Couch Quest:“ markiert):

- `I.add_item()`/`remove_item()` warten auf ein Fertig-Signal der Leiste. Die Leiste zeigt nur das
  Inventar der aktiven Figur; bei der anderen Figur kam das Signal nie, und der Aufruf hing. Jetzt
  meldet die Leiste in dem Fall sofort „fertig“.
- Beim Laden leert Popochiu die Inventare aller Figuren. War Pixel aktiv, hingen Max' Gegenstände
  nicht in der Leiste, und `remove_child` meldete Fehler. Jetzt wird nur entfernt, was dort hängt.

Dazu hält die Leiste das Pixel-Feld ganz links.
