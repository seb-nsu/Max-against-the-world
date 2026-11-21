# Werkzeuge des Reviews vom 21.11.2026

## Fernsteuerung: das Spiel mit echten Klicks spielen

`godot/_r5_fernsteuerung.gd` (zum Benutzen nach `game/tests/` eines Prüf-Checkouts kopieren) startet das Spiel **ohne Testmodus** im Hauptmenü und nimmt Befehle über Dateien an. Jeder Klick ist ein echtes Mausereignis an einer Bildstelle (wie der Controller-Weg des Spiels), Tasten sind echte Tastenereignisse. Es wird nichts im Code ausgelöst: kein `on_click()`, kein `Zustand.loese()`, keine Vorgaben für Auswahlmenüs. `fs.py` ist die Bedienung dazu.

```
py -3 docs/review/2026-11-21/werkzeuge/fs.py start  ORDNER [tempo=4] [frisch]     # Godot starten (Fenster außerhalb des Bildschirms, ohne Ton)
py -3 docs/review/2026-11-21/werkzeuge/fs.py ORDNER "befehl" "befehl" …            # Befehle der Reihe nach, Antwort wird ausgegeben
py -3 docs/review/2026-11-21/werkzeuge/fs.py ORDNER -f befehle.txt                 # Befehle aus einer Datei
py -3 docs/review/2026-11-21/werkzeuge/fs.py stop   ORDNER                         # Godot beenden
```

`ORDNER` ist der Arbeitsordner eines Laufs (z. B. `C:\Users\sebgr\AppData\Local\Temp\cq-r5-lauf\gd-w1-haupt`). Darin liegen `fotos/`, `filme/`, `staende/` (Kontrollpunkte), `verlauf.txt` (alles, was je geantwortet wurde) und `godot.log` (Fehlermeldungen des Spiels). Der letzte Teil des Ordnernamens ist zugleich der Name des Laufs: Spielstände, Einstellungen und Errungenschaften liegen getrennt unter `user://r5/<lauf>/`, die echten Dateien des Spielers werden nie berührt. `frisch` löscht diese Dateien vor dem Start (erster Start mit Epilepsie-Hinweis wie bei einem neuen Spieler). `tempo=4` lässt das Spiel viermal so schnell laufen (Standard 1); alles, was mit Zeit, Bewegung oder Lesbarkeit zu tun hat, in Tempo 1 nachprüfen (`tempo 1`).

Koordinaten sind immer Bildkoordinaten im Spielbild 640×360 (nicht Raumkoordinaten; in breiten Räumen verschiebt die Kamera das Bild).

| Befehl | Wirkung |
| --- | --- |
| `status` | Lage, Raum, Figuren, Pfote, offene Rätselschritte, gesetzte Schalter und Werte |
| `objekte` | alle Objekte des Raums mit Art, Name und Lage der Klickfläche im Bild (auch unsichtbare und solche außerhalb des Bildes) |
| `maus X Y`, `maus @id` | Zeiger bewegen; meldet, was unter dem Zeiger liegt |
| `klick X Y`, `rklick X Y`, `dklick X Y` | Links-, Rechts-, Doppelklick an einer Bildstelle. Linksklick = benutzen/nehmen/reden/gehen, Rechtsklick = ansehen |
| `klick @id`, `rklick @id` | Klick auf ein Objekt. Tastet die Klickfläche an bis zu 36 Stellen ab, meldet, an wie vielen das Objekt unter dem Zeiger gewinnt und was sonst gewinnt (andere Objekte, Oberfläche, aufklappende Inventarleiste), und klickt die erste Stelle, an der es auch beim zweiten Anfahren gewinnt. Liegt das Objekt außerhalb des Bildes, muss man erst hinlaufen (Klick auf den Boden am Bildrand) |
| `inv` | Inventarleiste aufklappen und auflisten (Leiste der aktiven Figur, Besitz von Max und Pixel, Gegenstand in der Hand) |
| `klick inv:id`, `rklick inv:id` | Gegenstand in der Leiste anklicken (links: in die Hand nehmen, dann `klick @ziel` oder `klick inv:anderer`; rechts: ansehen) |
| `optionen`, `option N`, `option ID`, `option "Text"` | Gesprächs- und Auswahlzeilen auflisten bzw. anklicken; meldet, wenn eine Zeile erst nach Rollen sichtbar ist |
| `knoepfe`, `knopf "Text"` | Knöpfe von Menüs und Überlagerungen (Hauptmenü, Pause, Speichern/Laden, Nahansicht „X“, Notizbuch, Reisetasche, Minispiele) |
| `portraet max`, `portraet pixel`, `pfote` | Porträt (Figurenwechsel) bzw. Hilfe-Pfote anklicken |
| `taste esc`, `taste tab`, `taste leer`, `taste f5`, `taste f9`, `taste halten shift`, `taste los shift` | Tasten (Esc: Pause oder Überspringen, Tab: Figurenwechsel, F5/F9: Schnellspeichern/-laden, Umschalt: Hotspots zeigen) |
| `drueck X Y`, `los X Y`, `rad X Y hoch\|runter [n]` | Maustaste halten und loslassen (Ziehen), Mausrad |
| `warte` | warten, bis das Spiel wieder auf den Spieler wartet; Text wird je nach Textmodus weitergeklickt |
| `warte 31` | 31 Spielsekunden verstreichen lassen, ohne zu klicken (Zurufe nach 45 s, Wecker, Warte-Gesten, Hinweisstufen nach 30/60 s) |
| `weiter` | ein einzelner Klick zum Weiterschalten (für Textmodus `nie`) |
| `textmodus klick\|lesen\|nie` | `klick`: Text sofort weiterklicken (schneller Spieler). `lesen`: erst nach Tippzeit plus Lesezeit (55 ms je Zeichen, mindestens 1,2 s) weiterklicken; damit Szenenlängen messen. `nie`: gar nicht klicken |
| `tempo N` | Spieltempo 0,25 bis 8 |
| `marke`, `zeit` | Stoppuhr in Spielsekunden |
| `foto NAME [voll] [x y w h]` | Bildschirmfoto nach `ORDNER/fotos/NAME.png`, 640×360; `voll` = Fenstergröße 1920×1080 (für Schrift); `x y w h` = Ausschnitt in Spielpixeln |
| `film an NAME [fps]`, `film aus` | Bildfolge nach `ORDNER/filme/NAME/` (stellt für die Dauer Tempo 1 ein); danach `gif_bauen.py` |
| `start prolog\|welt-1\|welt-2\|welt-3\|welt-4\|zs N\|hauptmenue` | Abschnitt direkt beginnen (`Spiel.welt_beginnen` bzw. `zwischenspiel_beginnen`). Das stellt nur den Anfangszustand her; das Inventar ist das, was das Spiel für den Weltanfang vorsieht. Der echte Weg ist „Neues Spiel“ im Hauptmenü |
| `stand sichern NAME`, `stand holen NAME`, `stand liste` | Kontrollpunkt: speichert über den Speicherweg des Spiels (Platz 12) und legt die Datei unter `staende/` ab; `holen` lädt sie wieder (im Hauptmenü wie „Laden“, im Spiel wie Laden aus dem Pausemenü). Kontrollpunkte lassen sich zwischen Läufen kopieren (`staende/*.json`) |
| `lies AUSDRUCK` | Wert lesen, z. B. `lies Z.geloest("R1")`, `lies Z.ist("W3_NACHT")`, `lies C.player.position` (S Spiel, Z Zustand, E, R, C, I, D, G Popochiu, B Bauplan, H Hinweise). **Nur lesen.** |
| `hilfe`, `ende` | Befehlsliste, Fernsteuerung beenden |

Jede Antwort auf einen Klick listet, was seitdem geschah (mit Spielzeit): `SAGT <Zeilen-ID> | <Sprecher>: <Text>`, `ERSATZZEILE`, `ZUSTAND <Schalter>`, `INVENTAR +/-`, `RAUM`, `GESPRÄCH beginnt/endet`, `HINWEIS`, `LÄUFT zum Zeiger`, `GESPEICHERT/GELADEN`, und endet mit einer Zeile `LAGE …`:

- `frei`: der Spieler ist dran. `menue`: Gesprächs- oder Auswahlzeilen sind offen. `ueberlagerung:<name>`: Nahansicht, Notizbuch, Reisetasche, Minispiel, Code-Sicht. `pause`, `hauptmenue`. `text`: eine Zeile steht und wartet auf einen Klick (nur bei Textmodus `nie` oder nach `knopf`/`taste`).
- `STEHT seit 20 Spielsekunden ohne Fortschritt` oder `ZEITÜBERSCHREITUNG`: Das Spiel ist beschäftigt, aber es bewegt sich nichts mehr (kein Text, keine Figur, kein Ereignis). Das ist ein Kandidat für einen Hänger. Erst `foto` und `status`, dann von einem Kontrollpunkt aus in Tempo 1 nachstellen, bevor es als Fund gilt (Minispiele und Wartestellen können so aussehen).

### Was nachgebildet ist

Das Fenster liegt außerhalb des Bildschirms (Position 6000,3000), damit es am Rechner nicht stört, und bekommt nie den Fokus. Es hat deshalb keinen echten Mauszeiger. Godot und das Spiel fragen an fünf Stellen den Zeiger des Betriebssystems ab statt das Mausereignis; dort setzt die Fernsteuerung den gesteuerten Zeiger ein:

1. **Objekt unter dem Zeiger.** Godot erzeugt in jeder Physik-Runde ohne Mausereignis selbst ein Bewegungsereignis an der Position des Betriebssystem-Zeigers (`Viewport::_process_picking`, „passive hover“). Die Fernsteuerung schickt deshalb in jeder Physik-Runde ein Bewegungsereignis am gesteuerten Zeiger.
2. **Inventarleiste.** Sie klappt nach `get_global_mouse_position()` auf und zu (`simple_click_bar.gd`). Die Fernsteuerung schaltet diese Abfrage ab und wendet dieselbe Regel (Zeiger in der oberen Zone, Oberfläche nicht gesperrt) mit dem gesteuerten Zeiger an.
3. **Laufziel.** Klick auf freien Boden (`popochiu_room.gd`, `walk(get_local_mouse_position())`) und auf Boden-Hotspots (`cq_hotspot.gd`): Die Fernsteuerung erkennt genau diese Läufe und schickt die Figur zum gesteuerten Zeiger (Ereignis `LÄUFT zum Zeiger`).
4. **Zeigerbild und Objektname** werden für die Aufnahmen an den gesteuerten Zeiger gesetzt (nur Darstellung).
5. `Window.mouse_in_window` bleibt falsch; Schwebe-Effekte von Knöpfen (Farbe unter der Maus) können fehlen. Klicks auf Knöpfe gehen trotzdem.

Alles andere läuft über die echten Wege des Spiels: welches Objekt bei Überdeckung gewinnt, was ein Klick auslöst, Hingehen, Gespräche, Auswahlmenüs, Inventar, Figurenwechsel, Pfote, Pausemenü, Speichern und Laden, Tasten.

### Für eigene Godot-Skripte (wichtig)

- Das Spiel stellt beim Start sein Fenster mitten auf den Bildschirm (`Einstellungen._fenster_anwenden`), auch wenn `--position 6000,3000` angegeben ist. Eigene Skripte müssen das Fenster selbst fernhalten (in `_process`: `DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_NO_FOCUS, true)` und `DisplayServer.window_set_position(Vector2i(6000, 3000))`), sonst erscheint es auf Sebastians Bildschirm. Vorlage: `godot/_r5_raumaufnahme.gd`. Immer mit `--audio-driver Dummy` starten.
- Zeigerabfragen (`E.hovered`, Zeigerraster) stimmen nur, wenn in **jeder** Physik-Runde ein Bewegungsereignis am gewünschten Punkt gesendet wird (siehe 1.). Ohne das hängt das Ergebnis davon ab, wo der echte Mauszeiger gerade steht. Nie `warp_mouse` benutzen (bewegt den echten Zeiger).
- `Spiel.testmodus` schaltet Wege, Wartezeiten, Nahansichten und Effekte ab. Aussagen über Spielbarkeit nie aus Testmodus-Läufen ableiten.

## Weitere Werkzeuge

- `gif_bauen.py FILMORDNER ZIEL.gif [--ausschnitt x y w h] [--skala 2] [--jedes 2] [--bogen ZIEL.png]`: GIF und Kontaktbogen aus einer Bildfolge.
- `godot/_r5_raumaufnahme.gd`: wie `game/tests/werkzeuge/raumaufnahme.gd`, hält aber das Fenster vom Bildschirm fern. Die Grundaufnahmen liegen unter `belege/raeume/<abschnitt>/`.
- Skripte der einzelnen Rollen: `godot/_r5_<rolle>_*.gd`.
