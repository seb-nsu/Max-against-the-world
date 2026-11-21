# Notiz gd-w3: Game Designer und Durchspieler, Welt 3 „Neo-Neustadt 2099“

**Rolle:** Game Designer und Durchspieler. **Umfang:** Welt 3 vollständig (12 Räume, beide Ebenen, Code-Sicht, getrennte Figuren, Rätsel R1a bis R13, Übergang ins Zwischenspiel 3). **Geprüfter Commit:** `04c5a79f` (main nach PR #46), Checkout `cq-r5`.

**Wie geprüft:** Fernsteuerung (`werkzeuge/fs.py`) ohne Testmodus, echte Maus- und Tastenereignisse. Hauptlauf `cq-r5-lauf\gd-w3-haupt` ab `start welt-3` (Inventar: nur Pixel-Feld; Olivenöl und Hermes' Sandale aus Welt 2 fehlen damit, siehe „Nicht geprüft“). Tempo 4, Textmodus `klick`; Zeitmessungen eigens in Tempo 1. Kontrollpunkte: `cq-r5-lauf\kontrollpunkte\welt-3\` mit `liste.md`. Lösungsweg als Befehlsfolge: `belege/gd-w3/loesungsweg.txt`. Alle Belegpfade relativ zu `docs/review/2026-11-21/`.

**Stand der Notiz:** in Arbeit (wird blockweise fortgeschrieben).

## Hauptfrage: Ist Welt 3 mit echten Klicks durchspielbar?

(wird am Ende beantwortet; Zwischenstand: R1a, R1b, R2, R3a auf dem Klickweg gelöst)

## Rätselübersicht (Klickweg)

| Rätsel | per Klick gelöst | Schritte (Klicks) | Schwierigkeit | Hinweise |
| --- | --- | --- | --- | --- |
| R1a Beobachtungen | ja | 3 Rechtsklicks (Frau, Musiker, weinender Mann) | leicht | Morphäus („Sieh dich um“) und Deckert selbst; fair |
| R1b Mensch-Test | ja | Deckert ansprechen, „Fangen wir an“, 3 Antworten | leicht bis mittel | menschliche Antwort steht jeweils in der Mitte der Liste; die dritte Antwort ist im Menü halb abgeschnitten (GD-W3-01) |
| R2 Nudelbude | ja | Herr Vier ansprechen, „Wartet hier jemand“, „Die Nummer vier.“ | leicht | falsche Bestellungen geben gute Pointen und führen hin („Zahl bitte. Eine.“) |
| R3a Déjà-vu | ja | Morphäus 0450 → 0480, in der Gasse Klick auf Pixel, Automat, „Déjà-vu“ | mittel | Stufe 1 bis 3 passend, Stufe 3 nennt „Benutz mich“ |

## Funde

### Unterstadt, Straße

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W3-01 | unterstadt_strasse (alle Gespräche) | wichtig | Sonstiges (Oberfläche) | Das Gesprächsmenü zeigt nur zweieinhalb bis dreieinhalb Zeilen. Im Mensch-Test (drei Antworten) ist die dritte Antwort halb abgeschnitten und erst nach Rollen lesbar; bei Deckert (4 Optionen), Herrn Vier (6), Morphäus (5) und bei der Bestellung (4) liegt jeweils die letzte Zeile außerhalb. Bei Deckert und Herrn Vier ist das ausgerechnet die Abschiedszeile. Ein Rollbalken ist da, aber unauffällig. | `belege/gd-w3/001_test_frage1_dritte_antwort_abgeschnitten.png`, `belege/gd-w3/002_deckert_menue_vierte_zeile.png`; Fernsteuerung meldet „erst nach Rollen sichtbar“ | Menü auf vier volle Zeilen vergrößern oder Schrift/Zeilenabstand so wählen, dass drei Antworten ganz sichtbar sind; bei mehr Zeilen einen deutlichen Pfeil „weitere“. |
| GD-W3-02 | unterstadt_strasse | kosmetisch | Humor (Text gegen Zustand) | Morphäus' Abschiedsoption heißt auch nach bestandenem Mensch-Test „Ich geh mal zum Detektiv.“, und Morphäus rät dann, wie man Deckert antworten soll (`W3_NUD_MAX_0600`, `W3_NUD_MOR_0610`). Stempel war schon auf der Hand. | Lauf, Spielzeit 646 s (`belege/gd-w3/verlauf_haupt.txt`) | Nach R1b andere Abschiedszeile („Ich geh mal zum Automaten.“ / „Der Stempel ist die halbe Miete. Jetzt das Symptom.“). |
| GD-W3-03 | unterstadt_strasse | kosmetisch | Klickflächen | Der weinende Mann gewinnt nur an 19 von 36 Probestellen, an den übrigen 17 Herr Vier (überdeckt). Für R1a (Ansehen) trifft man leicht den Koch. | `rklick @weinender_mann` (Antwort der Fernsteuerung, Verlauf 181 s) | Weinenden Mann 20 px nach rechts oder vor Herrn Vier ordnen. |

### Apothekengasse

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W3-04 | apothekengasse | wichtig | Rätsel (Bedienung) | **Die Pastille lässt sich nur schlucken, indem man sie in der Leiste zweimal anklickt (Gegenstand auf sich selbst).** Alle naheliegenden Wege geben nur Ersatzzeilen: Pastille auf Max („Lädt. Lädt immer noch. Ich nehm das als Nein.“), auf Pixel, auf Morphäus, auf den Automaten, rote auf blaue. Die Pfote sagt in Stufe 3 nur „Nimm die rote.“, nicht wie. An dieser Stelle hängt der Eintritt in die Simulation. | Befehlsfolge ab Kontrollpunkt `08_pastillenwahl`: `klick inv:rote_pastille`, `klick @max` → `SYS_ERS_MAX_0140`; `klick @automat` → `SYS_ERS_MAX_0140`; `klick @pixel` → `SYS_ERS_MAX_0170`; `klick @morphaeus` → `SYS_ERS_MAX_0050`; `klick inv:blaue_pastille` zweimal → Szene. `cq_gegenstand.gd` Z. 82–87 | Pastille auf Max (und auf den Automaten) wie „Benutzen im Inventar“ behandeln; Stufe 3 um die Bedienung ergänzen („Klick sie in der Tasche zweimal an.“). |
| GD-W3-05 | apothekengasse | wichtig | Rätsel (Text gegen Zustand) | Ansehen von Omas Keksen im Inventar liefert direkt nach dem Erhalt in der Gasse `W3_BAS_MAX_0870` („Hundekuchen. Knochenförmig. Drüben waren das Kekse. Ich hab die Verwandlung gesehen …“). Max war noch nie „drüben“, im Bild ist es eine Papiertüte. Die Zeile nimmt die Pointe des ersten Aufwachens („Erleben“, raetsel/welt-3.md) vorweg und ist an der Stelle falsch. | `rklick inv:omas_kekse` bei 944 s im Hauptlauf; `belege/gd-w3/003_pastillen_und_kekse_leiste.png` | Zustand „vor der Simulation“ für die Kekse: eigene Zeile („Eine Papiertüte Kekse von einer Dame, die ich nicht kenne. Ich ess nichts von Fremden. Noch nicht.“). |
| GD-W3-06 | apothekengasse | kosmetisch | Hinweise | Pixels Zuruf beim Warten (`W3_APO_PIX_0920`, „Wenn du noch länger auf die Pastillen starrst …“) kommt schon vor dem Déjà-vu, wenn es noch gar keine Pastillen gibt (61 s gewartet, R3a offen). | Hauptlauf 781 s (`warte 61` nach Pfote Stufe 2) | Zuruf an `W3_R03_A_GELOEST` binden. |

## Frühere Funde, Stand heute

| Alte ID | Stand | Nachweis |
| --- | --- | --- |
| W3-R01-01 (Mensch-Test nicht wiederholbar) | (Variante noch zu spielen) | |
| W3-05 („nichts offen“ → Prolog-Zeile) | behoben | Nach R1b und R2, Gasse nie betreten: Pfote sagt `W3_HINT_PIX_0020` („Der Mann mit dem Hut hat die Gasse freigegeben …“), Hauptlauf 572 s |
| W3-R02-01 (Gasse 640 statt 1280) | behoben | `status` in der Gasse: Raumbreite 1280, Kamera fährt mit (x 0 → 320 am Automaten) |
| W3-R02-02 (Pfote führt beim Déjà-vu in eine Schleife) | behoben | Stufe 2 „Du müsstest mich nur darum bitten“, Stufe 3 „Benutz mich hier in der Gasse“; Klick von Max auf Pixel löst die Szene aus (874 s) |
| W3-14 (Max kommt in Figuren an) | weiterhin offen | Bei Deckert steht Max nach dem Hingehen ganz hinter der Frau mit Schirm (`belege/gd-w3/002_deckert_menue_vierte_zeile.png`) |
| W3-13 (Ansprechen ohne eigene Zeile) | weiterhin offen (weinender Mann) | `klick @weinender_mann` → `SYS_ERS_MAX_0200` |

## Gut gelöst

- Falsche Bestellungen bei Herrn Vier bleiben im Menü, jede hat eine Pointe und schiebt zur Lösung („Zahl bitte. Eine.“). Esc bricht das Menü nicht ab; eine Falle wie im Review 20.11. vermutet gibt es nicht.
- „Déjà-vu“ ohne Befund: klare Absage mit Hinweis („Zeigen Sie es mir. Ich bin eine Linse, kein Ohr.“).

## Nicht geprüft

(wird am Ende gefüllt)

## Vorschläge für die Lessons Learned

(wird am Ende gefüllt)

## Werkzeug

- `stand sichern` geht nicht in offenen Gesprächsmenüs (Esc öffnet dort kein Pausemenü); Kontrollpunkte liegen deshalb immer vor dem Ansprechen.
- Nach `knopf X` (Nahansicht schließen) steht die Folgezeile als `LAGE text`; der nächste Klick schaltet nur den Text weiter und muss wiederholt werden.
