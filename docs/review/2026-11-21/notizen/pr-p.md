# Notiz pr-p: Prolog, Zwischenspiele, Menüs, Speichern/Laden

**Rolle:** Welt-Prüfer (alle fünf Blickwinkel in einem Durchgang). **Kürzel:** pr-p. **Geprüfter Commit:** `04c5a79f` (Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`).

**Umfang:** (a) Prolog vom ersten Programmstart über „Neues Spiel“ bis zum ersten freien Moment auf dem Dorfplatz, (b) die drei Zwischenspiele (`start zs 1` bis `3`), (c) Menüs (Hauptmenü, Pause, Speichern/Laden, F5/F9, Optionen mit Sprachwechsel, Notizbuch, Errungenschaften).

**Wie geprüft:** Fernsteuerung (`werkzeuge/cloud/fs`), echte Klicks, kein Testmodus. Läufe unter `/home/user/lauf/pr-p-*`. Kontrollpunkte: `kontrollpunkte/prolog/` mit `liste.md`. Lösungsweg: `belege/pr-p/loesungsweg.txt`. Vorgänger-Notiz `gd-p.md` (Zwischenstand) wird übernommen und nachgestellt.

**Stand der Notiz:** ZWISCHENSTAND. Erledigt: gerader Durchlauf (Stufe 1, `prolog_ende.json` liegt im Repo), Speichern/Laden erster Block. Offen: alles Weitere.

## Funde

### Speichern und Laden (alle Abschnitte)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-P-01 | alle | **kritisch** | Durchspielbarkeit, Technik | **Wer in derselben Sitzung einen älteren Stand lädt (F9 oder Pause → Laden), verliert alle Gegenstände, die er seit jenem Stand aufgehoben hat.** Sie sind weder im Inventar noch im Raum: das Prop bleibt unsichtbar. Im Prolog nachgestellt: (a) Neues Spiel, F5 im Wohnzimmer, Teetasse nehmen, F9 → Tasse weg (`objekte`: `@teetasse … (unsichtbar)`, `inv`: leer). (b) Pause → Speichern Platz 1, Tasse, Thunfischdose und Dosenöffner nehmen, Pause → Laden Platz 1 → alle drei Props unsichtbar, Inventar leer; P1 ist damit unlösbar (Sackgasse, die Pfote ist vor P1 aus). Erst ein Neustart des Programms heilt es: Nach Neustart und „Fortsetzen“/„Laden“ sind die Props wieder da (die Spielstände selbst sind in Ordnung). Ursache: `CQRaum._zustand_anwenden()` blendet ein Prop aus, wenn `I.has_item_been_collected()` wahr ist; Popochius `ever_collected` lässt sich nie wieder auf falsch setzen (`popochiu_inventory_item.gd` Z. 331–336: „Once true, ever_collected can never be false again“), auch nicht beim Laden. `Spiel.zum_hauptmenue()` kennt das Problem („Ein frischer Start ist der einzige sichere Weg zu einem sauberen Zustand“, `spiel.gd` Z. 170) und startet das Programm neu; F9 und „Laden“ im Pausemenü tun das nicht. Betrifft jedes nehmbare Prop in allen Welten (gleiche Regel in `cq_raum.gd` Z. 760–765). Typischer Fall: Spieler probiert etwas aus und lädt den Schnellspeicher von vor fünf Minuten. | `belege/pr-p/sl_f5_tasse_f9_tasse_weg.png`, `belege/pr-p/sl_pause_laden_dachboden_ohne_oeffner_inventar_leer.png`; Lauf `pr-p-sl`: `taste f5`, `klick @teetasse`, `taste f9`, `objekte`, `inv`; `game/skripte/objekte/cq_raum.gd` Z. 760–765; `game/addons/popochiu/engine/objects/inventory_item/popochiu_inventory_item.gd` Z. 331–336 | Beim Laden `ever_collected` aller Gegenstände aus dem Spielstand setzen (in `cq_save_load.daten_anwenden()` direkt das Feld schreiben, am Setter vorbei, oder die Sichtbarkeit der Props aus einem eigenen Schalter `GENOMMEN_<id>` in `Zustand` ableiten, der mitgespeichert wird). Dazu ein Test: speichern, Gegenstand nehmen, **älteren** Stand laden, Prop muss sichtbar sein (die vorhandenen Rundreise-Tests laden immer den eben gespeicherten Stand). |

(weitere Blöcke folgen)

ZWISCHENSTAND (nicht fertig)
