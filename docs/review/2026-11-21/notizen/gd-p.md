# Notiz gd-p: Game Designer und Durchspieler, Prolog, Zwischenspiele, Menüs

**Rolle:** Game Designer und Durchspieler. **Kürzel:** gd-p. **Geprüfter Commit:** `04c5a79f` (Prüf-Checkout `cq-r5`).

**Umfang:** (a) Prolog vom ersten Programmstart bis zum ersten freien Moment auf dem Dorfplatz, (b) die drei Zwischenspiele (`start zs 1` bis `3`), (c) Menüs (Hauptmenü, Pause, Speichern/Laden, F5/F9, Optionen, Notizbuch, Errungenschaften).

**Wie geprüft:** mit der Fernsteuerung (`werkzeuge/fs.py`), echte Klicks, kein Testmodus. Läufe unter `C:\Users\sebgr\AppData\Local\Temp\cq-r5-lauf\`: `gd-p-haupt` (Hauptlauf ab „Neues Spiel“, Tempo 4, Textmodus `klick`). Kontrollpunkte: `cq-r5-lauf\kontrollpunkte\prolog\` mit `liste.md`. Lösungsweg: `belege/gd-p/loesungsweg_prolog.txt`.

**Stand der Notiz:** ZWISCHENSTAND (wird blockweise ergänzt). Zuletzt gespeichert nach: Wohnzimmer, Treppenhaus, Dachboden „alles ansehen“ vor P1.

## Funde

### Erster Start und Hauptmenü

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-P-01 | Hauptmenü | noch offen (nachprüfen) | Sonstiges | Der Knopf „Verstanden“ des Epilepsie-Hinweises liegt bei (482,259), direkt darunter erscheint nach dem Klick „Beenden“ (481,269). Der Zeiger steht nach „Verstanden“ also auf „Beenden“ (im Bild gelb hervorgehoben). Ein Doppelklick auf „Verstanden“ könnte das Spiel beenden. **Noch mit `dklick` in einem frischen Lauf nachzuprüfen.** | Lauf `gd-p-haupt`, `knoepfe` vor und nach „Verstanden“; Bild folgt | „Verstanden“ an eine Stelle legen, unter der kein Menüknopf liegt, oder das Menü erst nach 0,3 s klickbar machen. |

### Wohnzimmer

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-P-02 | alle | wichtig | Lokalisierung | Mit einem Gegenstand in der Hand steht unter dem Zeiger „Use Teetasse with UI_OBJ_ZEITUNG“: englischer Satzbau und der Textschlüssel statt des Namens. Tritt bei jedem Objekt auf, sobald ein Gegenstand in der Hand ist. (Beobachtung aus dem Probelauf, hier bestätigt.) | `belege/gd-p/wohn_hand_teetasse_use_with_schluessel.png`; Befehle `klick inv:teetasse`, `maus @zeitung` | In `simple_click_gui.gd` (Z. 75 laut Probelauf) den Namen übersetzen (`tr()`) und den Satz aus `texte.csv` holen: „Teetasse benutzen mit Zeitung“. |
| GD-P-03 | Wohnzimmer, Treppenhaus | kosmetisch | Humor | **weiterhin offen (X-08, 17.11.)**: Rechtsklick auf einen Ausgang bringt eine Ablehnungszeile aus dem Ersatzpool („Netter Versuch, Max. Nein, eigentlich gar nicht.“, „Ich lass die Finger davon. Zumindest die meisten.“), als hätte man etwas Falsches versucht. | `rklick @ausgang_treppenhaus` → `SYS_ERS_MAX_0050`; `rklick @ausgang_dachboden` → `SYS_ERS_MAX_0230`; `rklick @ausgang_wohnzimmer` → `SYS_ERS_MAX_0050` | Wie in AP-08 vorgesehen eine Standardzeile aus dem Namen („Da geht's ins Treppenhaus.“). |
| GD-P-04 | Wohnzimmer | kosmetisch | Humor | Benutzen der Stehlampe: „Ich lass sie an. Auf dem Zettel steht nicht, was sonst passiert …“. Von einem Zettel war vorher nicht die Rede (erstes Ansehen: „Eine Stehlampe mit Fransen …“), und im Bild ist keiner zu sehen. **Noch gegen das Skript prüfen** (zweite Ansehen-Zeile). | `klick @stehlampe` → `P0_WOHN_MAX_0340` | Zettel in der ersten Ansehen-Zeile erwähnen oder die Benutzen-Zeile ohne Zettel schreiben. |

### Treppenhaus

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-P-05 | Treppenhaus | wichtig | Klickflächen | Die Treppe selbst (x 350–600, y 45–195, das größte Objekt im Bild) führt nicht nach oben. Max sagt beim Klick „Ich geh ja schon. Die Treppe petzt sowieso.“, läuft zum Treppenfuß und bleibt stehen (dreimal geklickt: `0060`, `0065`, `0060`). Nach oben geht es nur über den Ausgang „Dachboden“ in den obersten 45 Bildzeilen (y 0–45). Dort klappt die Inventarleiste auf: Der Ausgang gewinnt nur an 12 von 36 Probestellen, an 22 klappt die Leiste auf, an 2 liegt die Pfote. Mit offener Leiste ist die Luke im Bild ganz verdeckt. Ein neuer Spieler klickt die Treppe an, bekommt eine Zusage und kommt nicht weiter. | `klick @treppe` (3×), `klick @ausgang_dachboden` („gewinnt an 12 von 36“); Bilder `gd-p-haupt/fotos/007_trep_zeiger_dachboden.png`, `008_trep_nach_treppe.png` (werden nach `belege/gd-p/` kopiert) | Linksklick auf die Treppe steigt hinauf (gleiche Wirkung wie der Ausgang); die Sprüche auf den Rechtsklick legen. Ausgangsfläche nach unten bis auf die oberen Stufen ziehen (unter y 45). |
| GD-P-06 | Treppenhaus | kosmetisch | Humor | Linksklick auf die Thunfischdose spielt vor dem Nehmen noch einmal dieselben zwei Ansehen-Zeilen (`P0_TREP_MAX_0190`, `0190_2`), die der Spieler vom Rechtsklick gerade kennt. | `rklick @thunfischdose`, dann `klick @thunfischdose` | Beim Nehmen eine eigene kurze Zeile oder die Ansehen-Zeilen überspringen, wenn sie schon gespielt wurden. |

### Dachboden (vor P1)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-P-07 | Dachboden | wichtig | Humor | Vor P1 (Pixel schläft, also genau dann, wenn der Spieler sich zum ersten Mal umsieht) bringt Ansehen bei fünf Objekten nur eine Ablehnungszeile aus dem Ersatzpool: Kiste mit Fernbedienungen („Nö. Nächster Vorschlag, bitte.“), Kochbuch („Lädt. Lädt immer noch. Ich nehm das als Nein.“), Opas Staubsauger-Prototyp („Das lade ich lieber nicht herunter.“), Drehknopf, Opa. Laut Skript gehören die Ansehen-Zeilen von Kiste und Kochbuch Pixel und gelten erst „nach P1“ (`docs/skript/prolog.md` Z. 267–276); für die Zeit davor gibt es keine Zeile. | `rklick @kiste_mit_fernbedienungen` → `SYS_ERS_MAX_0110`; `rklick @kochbuch` → `SYS_ERS_MAX_0140`; `rklick @opas_staubsauger_prototyp` → `SYS_ERS_MAX_0100`; `rklick @drehknopf` → `SYS_ERS_MAX_0130`; `rklick @opa` → `SYS_ERS_MAX_0140` | Für Max je eine Ansehen-Zeile vor P1 (z. B. Kiste: „Eine Kiste voller Fernbedienungen. Opa sammelt sie, wie andere Leute Briefmarken.“; Opa: „Opa. Strickjacke, Pantoffeln und ein Blick, als hätte er gerade die Schwerkraft widerlegt.“). |
| GD-P-08 | Dachboden | noch offen (nachprüfen bei P3) | Rätsel | Der Kalender öffnet die Nahansicht nur beim **ersten** Ansehen. Zweiter Rechtsklick: Wiederholungszeile („Wenn es wenigstens blinken würde …“), keine Nahansicht; Linksklick: „Ich blätter nicht weiter …“. Wer die Kanalnummer vor P2 gelesen und bis P3 vergessen hat, kann sie nicht noch einmal nachsehen. **Bei P3 prüfen, ob Pfote oder Opa die Nummer nennen.** | `rklick @kalender` (2×), `klick @kalender` | Nahansicht bei jedem Rechtsklick öffnen. |

## Rätselübersicht

(folgt)

## Frühere Funde, Stand heute

(folgt)

## Gut gelöst

(folgt)

## Nicht geprüft

(folgt)

## Vorschläge für die Lessons Learned

(folgt)

## Werkzeug

- Ein Aufruf von `fs.py` mit 16 Befehlen kam einmal ohne jede Ausgabe zurück und stand auch nicht im `verlauf.txt` (nichts ausgeführt); derselbe Aufruf in zwei Teilen lief danach. Ursache unbekannt.
- Ist eine Überlagerung (Nahansicht) oder das Pausemenü offen, melden alle `klick @…` „gewinnt an 0 von 36“; das ist richtig so, kostet aber eine ganze Befehlsreihe, wenn man es nicht merkt.

ZWISCHENSTAND (nicht fertig)
