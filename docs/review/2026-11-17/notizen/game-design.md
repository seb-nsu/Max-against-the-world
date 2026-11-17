# Review 17.11.2026, Rolle Game Designer (GD)

Geprüft: `main` auf `ae6619c1`, Checkout `cq-r3`. Sicht: Rätsel-Logik, Fairness, Hinweise, Sackgassen, Reihenfolge, Onboarding.

Stand: fertig.

## Vorgehen

- Doku: `docs/raetsel/prolog-und-welt-1.md`, `welt-2.md`, `abhaengigkeiten.md`; frühere Funde (Review 14.11. Nr. 6, 13–17, 21, 34, 35; 360-Prüfung Abschnitt J).
- Code: `game/skripte/welt_2.gd` ganz, `welt_1.gd`, `hinweise.gd`, `zustand.gd` (Status, offene Schritte), `oberflaeche/notizbuch.gd`, Raumskripte Dorfplatz/Trollbrücke (Eimer), Daten `game/daten/welten/welt-2.json`, `game/daten/raeume/welt-2.json`, `game/daten/hinweise/*.json`, Texte `game/lokalisierung/texte.csv`.
- Tests (headless, nacheinander):
  - `welt_2_anspiel.gd`: 58 Prüfungen, 0 Fehler (`belege/game-design/welt_2_anspiel.txt`). Achtung: Der Test gibt viele Gegenstände per `geben()` und setzt die Sphinx-Bausteine direkt (`Z.setze_wert("W2_BAUSTEINE", …)`), prüft also Lösbarkeit, nicht Auffindbarkeit.
  - `prolog_durchlauf.gd`: 884 Prüfungen, 0 Fehler (`belege/game-design/prolog_durchlauf.txt`).
  - Eigenes Szenario `game/tests/_review_gd_w2.gd` (Kopie: `belege/game-design/_review_gd_w2.gd.txt`), zwei Läufe: `belege/game-design/szenario_lauf1.txt`, `szenario_lauf2.txt` (Lauf 1 hatte in D2 eine falsche Bausteinwahl meinerseits; deshalb gelten für D–I die Werte aus Lauf 2, für A1–A5 und B1 aus Lauf 1). Kürzel A1 … I3 unten beziehen sich auf die Zeilen „BEFUND …“ dieser Dateien.

## Frühere Funde: Nachkontrolle

| Früherer Fund | Stand | Beleg |
| --- | --- | --- |
| 14.11. Nr. 6 (Gollo, Rätselspiel) | behoben | Option 0785 vorhanden; Durchlauf grün |
| Nr. 13 (Flasche tauschen) | behoben | `prolog_durchlauf`: „zweite Flasche: getauscht (0946)“ |
| Nr. 14 (Kritzelei, fehlender Passwort-Teil) | behoben | `welt_1.gd` `passwort_fehlt()` (0721–0724); Test „vier Passwort-Teile“ |
| Nr. 15 (Thronsaal ohne Pollen) | behoben | Zeile 0825/0826 laut Umsetzung; Durchlauf grün |
| Nr. 16 (Berta) | behoben | Test „Berta hackt, Pixels Tipp (1425–1427)“, „Laute vertreibt Berta“ |
| Nr. 17 (Besen) | behoben (Logik); Bild nicht geprüft | Test „Besen fegt Max (0160/0170)“, „R11b gelöst“ |
| Nr. 21 (Leuchtpilz) | behoben | Test „Nehmen Leuchtpilz“ |
| Nr. 34, 35 | behoben | Maklerin nimmt Steckbrief (`dialog_maklerin.gd:13`); Doku nachgezogen |
| 360-J: Kalender erst beim zweiten Ansehen | behoben | `daten/raeume/prolog.json` Kalender: 0630 als `folge` von 0620; Test „Kalender, erstes Ansehen: auch die Kanalnummer“ |
| 360-J: `W2_DISK_HER_0240` falsche Begründung | behoben | Text jetzt „hat Leonidas zweimal die Wahrheit gesagt“ (logisch richtig) |
| 360-J: Diskus-Anklage ohne Verhör | behoben | `welt_2.gd:1406–1410`, Test „R7: keine Anklage, bevor alle vier verhört sind“ |
| 360-J: Hinweisstufen über Welten | behoben | `hinweise.gd` `schluessel()` je Abschnitt |

Keiner der früheren Funde ist nachweislich offen.

## Funde

### Welt 2, weltweit (Hinweissystem und Notizbuch)

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GD-01 | 2 | alle | wichtig | Rätsel | **Pfote sagt in Welt 2 „Es ist alles erledigt. Jetzt fehlt nur noch, dass du in den Fernseher steigst.“** Welt 2 hat keine eigene „nichts offen“-Zeile, es greift die des Prologs. Das passiert gleich nach Rätsel 1: Ein Schritt gilt erst als offen, wenn sein Raum schon besucht ist; nach der Fähre ist außer dem Nil-Delta noch nichts besucht, also ist nichts offen. Auch das Notizbuch zeigt dann nur „Gerade ist nichts offen.“ Wer nach der Fähre ratlos ist (Thronsaal, Sphinx, Küche noch nie betreten), hört eine falsche Aussage statt eines Wegweisers. | Szenario A2: `offen=[]`, Zeile `P0_HINT_PIX_0010`; `hinweise.gd:205` (Rückfall auf Prolog), `zustand.gd:160` (`war_in(r.raum)`), `daten/hinweise/welt-2.json` `sonderzeilen` nur `wartezeile` | Eigene Zeile `W2_HINT_PIX_0010` im Stil von Welt 1 („Geh irgendwohin, wo du noch nicht warst. Der Pharao wohnt rechts den Sandweg hoch.“). Besser zusätzlich: Ein Pflichtschritt, dessen Raum noch unbesucht ist, darf trotzdem eine Stufe-1-Zeile bekommen, die nur den Ort nennt. |
| GD-02 | 2 | alle | wichtig | Rätsel | **Die Pfote bevorzugt freiwillige Rätsel vor Pflichträtseln, bis zum Schluss.** Ohne Notizbuch-Ziel und ohne zuletzt berührten Schritt wählt die Pfote den offenen Schritt mit der kleinsten Nummer. Die freiwilligen R4 (Öl) und R6a (Sandale) werden nie „erledigt“, wenn man sie auslässt, und stehen vorn. Folge: Nach Tag 1 rät Pixel zum Öl für die Sandalen, obwohl die Sandalen schon weg sind; mit dem Grabstein in der Hand, und sogar während der Parade (R11a offen), hört man „Öl gibt es in der Küche.“ R6a wird noch nach dem Finaltag empfohlen, obwohl die Feigen dann nichts mehr bringen. Das Notizbuch listet R4 und R6a ebenfalls bis zum Ende als Ziele. | Szenario A6 (Pfote → R6a statt R7/R9/R10a), A7, A8, A9 (`offen=["R4","R6a","R11a"]`, Zeile `W2_HINT_PIX_0410`); `hinweise.gd:59` (natürliche Sortierung), `daten/hinweise/welt-2.json` (`optional: true` wird nicht ausgewertet) | Freiwillige Schritte in `schritt_waehlen()` nur nehmen, wenn kein Pflichtschritt offen ist. R4 nach Tag 1 und R6a/R6b nach dem Finaltag als „verpasst“ schließen (Schalter oder `offen_bis` in der Hinweis-Datei), dann verschwinden sie auch aus dem Notizbuch. |
| GD-03 | 2 | Nil-Delta, Thronsaal | wichtig | Rätsel | **Nach der Audienz kein Hinweis Richtung Olympia/Startbüro.** Ramses verlangt den Olympiasieg, R3b ist aber erst „offen“, wenn das Startbüro schon besucht wurde. Bis dahin zeigt die Pfote auf die Sphinx (R8) oder auf nichts (GD-01); das Notizbuch hat kein Ziel „In Olympia anmelden“. Dasselbe beim Grabstein: R10b erscheint erst, wenn der Grabhügel schon einmal betreten wurde; vorher schickt die Pfote in die Küche (GD-02). | Szenario A5 (`offen=["R8"]` nach Audienz, Startbüro unbesucht), A8 (`offen=["R4","R6a"]` mit Grabstein, Grabhügel unbesucht) | Wie GD-01: Raum-Bedingung für Pflichtschritte lockern oder Stufe 1 nennt den Ort („Anmelden musst du dich in Olympia, im Büro an der Agora.“). |

### Welt 2, Nil-Delta und Sphinx

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GD-04 | 2 | Sphinx | wichtig | Rätsel | **Sphinx-Rätsel mit zu wenigen Bausteinen: nur eine Zufalls-Ersatzzeile.** Wer „Ich stell dir ein Rätsel“ wählt und noch keine drei Bausteine hat, hört nach der Wortwahl „Fast. Also, gar nicht.“ (Ersatzpool). Kein Wort dazu, dass Hinweise fehlen oder wo man sie findet. Dazu kommt: Zwei der drei Bausteine je Wunderding gibt es nur beim **zweiten** Ansehen des Gegenstands (klebt, klickt, leuchtet; „leuchtet“ sonst nur über das Handy auf den Hofkater, der nach R2b weg ist). Die 360-Prüfung hat genau dieses Muster beim Kalender (Prolog) bemängelt, dort ist es behoben; hier ist es Pflicht. Stufe 3 (`W2_HINT_PIX_0830`) zählt die neun Sätze auf, sagt aber nicht, dass man die Dinge zweimal ansehen muss. | Szenario B1: Ersatz `SYS_ERS_MAX_0250`, Bausteine `["stirbt"]`; `welt_2.gd:1507` (`Spiel.ersatz()`); `daten/raeume/welt-2.json` Handy/Kaugummi/Kugelschreiber: zweite Zeile mit `"mal": 2` | Bei weniger als drei Bausteinen eine Sphinx-Zeile: „Ein Rätsel braucht drei Hinweise. Du hast {n}. Sieh dir deine Wunderdinge genauer an.“ Zweite Ansehen-Zeile beim ersten Ansehen direkt anhängen (wie beim Kalender) oder Stufe 2 nennt das zweite Ansehen. |

### Welt 2, Thronsaal (R2a, R2b)

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GD-05 | 2 | Thronsaal | wichtig | Rätsel | **Der Bonus „alle drei Wunderdinge behalten“ ist unerreichbar.** Das Götter-Duell (Pflicht für die Audienz) braucht ein Wunder. Der Brennspiegel zählt nur, wenn der Kaugummi **nicht** mehr in der Tasche ist. Der Kaugummi verlässt die Tasche nur im Duell oder bei Nebet. Wer ihn sparen will, kann das Duell also nicht gewinnen; `W2_PARA_PIX_0260` kommt nie. Die Rätseldoku verspricht genau diesen Bonus („Wer klug spart …“); die Hinweisstufe 3 bestätigt die Sperre („Oder Archimedes' Spiegel …, wenn der Kaugummi weg ist“). | Szenario C1/C2: Brennspiegel bei vorhandenem Kaugummi `behandelt=false`, Wunder bleibt `false`; C3 Kaugummi weg; I2 am Ende `Kaugummi=false`; `welt_2.gd:778` (`and not _hat("kaugummi")`), `welt_2.gd:1791`; `docs/raetsel/welt-2.md` „Regel gegen Sackgassen“ | Bedingung `not _hat("kaugummi")` streichen: Der Brennspiegel ist immer ein gültiges Wunder (Pixel kann ihn als „der teurere Weg“ kommentieren). |
| GD-06 | 2 | Thronsaal | kosmetisch | Rätsel | Brennspiegel mit Kaugummi in der Tasche fällt ohne eigene Zeile auf das Standardverhalten durch. Wer den sparsamen Weg sucht, bekommt keine Rückmeldung, warum der Spiegel nicht zählt. | Szenario C1/C2 (`behandelt=false`) | Entfällt mit GD-05; sonst eine Zeile vom Hofkater. |

### Welt 2, Startbüro (R3a, R3b)

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GD-07 | 2 | Startbüro | kosmetisch | Rätsel | **Nach dem Startpass lässt sich noch ein Rundschreiben schreiben, das den Kugelschreiber verbraucht.** Kugelschreiber + Formular (ebenso Tinte + Papyrus) prüft nicht, ob R3a/R3b schon gelöst sind; die Socke prüft es. Das zweite Rundschreiben am Schalter spielt die ganze Stempel-Szene noch einmal, gibt noch einen Startpass und lässt Hermes die Sandalen erneut übergeben (auch nach Tag 1, wenn sie längst weg sind). Wunderding sinnlos verloren. | Szenario E1–E4: nach Weg C `Kugelschreiber noch da=false`, `Stempel-Szene erneut=true`; Socke korrekt gesperrt (E4); `welt_2.gd:871`, `:882`, `:919` (`_schalter` ohne Prüfung auf R3b) | In beiden `kombi_…` und in `_schalter` zuerst `if Zustand.geloest("R3b")` → Zeile „Ich hab meinen Startpass. Mehr Papier halte ich nicht aus.“ |

### Welt 2, Stadion und Agora (R7, R9, Wettkampftage)

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GD-08 | 2 | Stadion, Agora, Sphinx | wichtig | Rätsel | **Die acht Aussagen des Diskus-Diebstahls hört man genau einmal und kann sie nirgends nachlesen.** Das Verhör läuft beim ersten Ansprechen; danach gibt es nur noch „Du warst es!/Reden/Doch nicht“, „Reden“ führt in das normale Gespräch ohne Aussagen. Das Notizbuch zeigt keine Aussagen (Seite 2 listet nur Nahansichten), obwohl Rätseldoku und Code-Kommentar „alle acht Aussagen im Notizbuch“ sagen. Die Verdächtigen stehen an drei Orten in zwei Epochen (Stadion, Agora, Sphinx in Ägypten). Für das einzige echte Logikrätsel der Welt ist das unfair: Wer nicht mitschreibt, muss raten. | Szenario G1: erneutes Ansprechen, „Reden“ → `Aussagen wiederholt=false`, Protokoll leer; `welt_2.gd:1403` (`_einmal`), `oberflaeche/notizbuch.gd` `regeln()` nur Nahansichten; `docs/raetsel/welt-2.md` Abschnitt „Der Diskus-Diebstahl“ | Notizbuch-Seite „Aussagen“ (je Verdächtiger die zwei Sätze, sobald gehört). Mindestens: Option „Was hast du noch mal gesagt?“ bei jedem Verdächtigen. Dasselbe gilt für Sphinx-Bausteine und Konter, die nur in Auswahllisten auftauchen. |
| GD-09 | 2 | Stadion | wichtig | Rätsel | **Aufgeben beim Diskus-Diebstahl kostet nichts.** Der Ersatz bei Leonidas löst R7 sofort; die Wurfscheibe liegt automatisch nach Tag 1 in der Tasche und zählt beim Diskuswurf genauso als Bestleistung wie der echte Diskus (auch für „Fünfkampf“). Das schwerste Rätsel der Welt hat damit keinen Anreiz; wer nach dem Verhör „Ich geb's auf“ sieht, nimmt es. | Szenario G2 (`R7=true, Wurfscheibe=true`) und I1 (`Diskus-Bestleistung mit Wurfscheibe=true`); `welt_2.gd:1425`, `:1666` | Bestleistung nur mit dem echten Diskus, Wurfscheibe „fast so weit“. Oder Ersatz erst nach einem falschen Anklageversuch oder nach Hinweisstufe 2 anbieten. |
| GD-10 | 2 | Stadion | kosmetisch | Rätsel | Die Startlinie vor dem Finaltag sagt immer „Kein Diskus, keine Konter, kein Gegner“, egal was fehlt. Wer nur noch die Konter braucht, erfährt nicht, dass Diskus und Grab schon erledigt sind. | `welt_2.gd` `benutzen_startlinie` → `W2_STAD_MAX_0300` | Drei Zeilen je fehlendem Teil (oder die erste fehlende nennen). |

### Welt 2, Grabhügel und Fähre (R10, R11)

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| GD-11 | 2 | Grabhügel | kosmetisch | Rätsel | **„137 Jahre“ ist kein Rätsel, sondern ein Botengang.** Der Sockel steht nur in Syrakus, und dort ist der Stein immer genau 137 Jahre alt. Es gibt keinen Weg, falsch zu liegen; die vorbereitete Zeile für einen zu jungen Stein (`W2_GRAB_MAX_0090`) kann nicht kommen. Stufe 3 sagt „ohne Umweg bis Syrakus fahren“ und deutet eine Gefahr an, die es nicht gibt. Das ist bewusst so gebaut („Umwege schaden nie“), nimmt der Zeitfähre aber ihr zweites Rätsel; R11b (Wein) trägt die Mechanik allein. | Szenario H3/H4: Stein in Olympia „grau“, in Syrakus sofort gelöst; `welt_2.gd:1619`; `W2_HINT_PIX_1032` | Entweder so lassen und Stufe 3 ohne „ohne Umweg“, oder Cicero sucht in Olympia (dann muss man wissen, dass der Stein dort nur 112 Jahre hat) und Max muss ihn nach Syrakus umlenken. |
| GD-12 | 2 | Stadion | kosmetisch | Rätsel | Paraden-Plan richtig gelegt, aber ohne Brennspiegel: Archimedes sagt nur „Ohne Mittagssonne ist mein Spiegel nur ein Teller“. Das klingt nach falscher Position, nicht nach fehlendem Gegenstand; dass der Spiegel in der Werkstatt in Syrakus liegt, sagt niemand. | Szenario I3: Protokoll endet mit `W2_PARA_ARC_0090`, R11a `false`; `welt_2.gd` `parade_planen` | Eigene Zeile: „Mein Spiegel liegt noch in der Werkstatt. Ich bin Erfinder, kein Packesel.“ |

### Prolog und Welt 1

Keine neuen Funde aus Game-Design-Sicht. Durchlauf grün (884 Prüfungen), frühere Funde behoben (Tabelle oben). Geprüfte Reihenfolge-Stelle ohne Fehler: Eimer wird nach R8 nicht verbraucht (`hotspot_erdfleck.gd` setzt nur `W1_EIMER` auf „leer“), R8 vor R4c ist also keine Sackgasse. Die Pfote in Welt 1 hat keine freiwilligen Schritte mit eigenen Zeilen und eine eigene „nichts offen“-Zeile; GD-01/02 betreffen sie nicht.

## Rätsel-Übersicht

Zeit: grobe Schätzung für Erstspieler ohne Pfote, ab dem Moment, wo das Rätsel erreichbar ist.

### Prolog

| Rätsel | Fairness | geschätzte Zeit Erstspieler | wichtigster Fund |
| --- | --- | --- | --- |
| P1 Der schlafende Kater | gut, Opa gibt Hinweise | 5–8 min | keiner |
| P2 Nur Rauschen | gut | 1–2 min | keiner |
| P3 Der richtige Kanal | gut (Kanalnummer jetzt beim ersten Ansehen) | 1–2 min | keiner (360-J behoben) |

### Welt 1

| Rätsel | Fairness | geschätzte Zeit Erstspieler | wichtigster Fund |
| --- | --- | --- | --- |
| R1 Taverne-Coup (a–c) | gut | 8–12 min | keiner (Fund 6 behoben) |
| R2 Zauberstab | gut, angebahnt (Honigfinger) | 2–4 min | keiner |
| R3 Drei Ziegenböcke | gut | 5–8 min | keiner |
| R4 Troll-Brücke (a–c) | gut, Satzung als Nahansicht | 6–10 min | keiner |
| R5 Brunnen | gut | 2–3 min | keiner |
| R6 Sechs Flaschen | gut, eindeutig | 8–12 min | keiner (Fund 13, 16 behoben) |
| R7 Niesrosen | mittel (Waldemar erst beim nächsten Betreten im Wald) | 3–5 min | keiner |
| R8 Bohnenranke | gut | 1–2 min | keiner |
| R9 Zeldina | gut (Steckbrief jetzt angebahnt) | 3–5 min | keiner |
| R10 Goblin-Frage | gut, zwei Wege | 4–6 min | keiner |
| R11 Dunkler Turm | gut seit Fund 14 | 8–12 min | keiner |
| R12 Smaugi | gut | 3–5 min | keiner |
| R13 Moderwort | gut seit Fund 15 | 2–3 min | keiner |

### Welt 2

| Rätsel | Fairness | geschätzte Zeit Erstspieler | wichtigster Fund |
| --- | --- | --- | --- |
| R1 Krokodil-Fähre | gut (Krokodil verneigt sich, Fährmann sagt es) | 2–3 min | GD-01 (danach kein Wegweiser) |
| R2a Hieroglyphen | gut: Grammatik-Inschrift, Pointen bei Fehlversuch | 5–8 min | keiner |
| R2b Götter-Duell | gut lösbar, Hofkater nennt die drei Dinge | 5–8 min | GD-05 (Bonus unerreichbar) |
| R3a Rundschreiben (freiwillig) | gut, vier Wege | 4–6 min | GD-07 |
| R3b Passierschein | gut | 1–2 min | GD-03 (kein Hinweis Richtung Olympia) |
| R4 Olivenöl (freiwillig) | gut, Pixel sagt das Rezept an | 3–5 min | GD-02 (bleibt bis zum Ende in der Pfote) |
| R5 Archimedes' Krone | gut, Hinweise klar | 3–5 min | keiner |
| R12 Tag 1 (Lauf, Hebel) | gut, Nachsicht nach zwei Fehlversuchen | 3–5 min | keiner |
| R6a Sandale (freiwillig) | gut, Szene beim Betreten der Agora zeigt die Sandale | 2–4 min | GD-02 |
| R6b Feigen (freiwillig) | mittel: „Feigenbaum im Inventar benutzen“ zum Pflücken muss man finden | 5–8 min | GD-02 |
| R7 Diskus-Diebstahl | schwach: Aussagen nicht nachlesbar, Aufgeben gleichwertig | 10–15 min (oder 1 min mit Ersatz) | GD-08, GD-09 |
| R8 Sphinx | mittel: Bausteine meist nur beim zweiten Ansehen, Fehlversuch ohne Bausteine stumm | 8–15 min | GD-04 |
| R9 Konter | gut, Pflicht nur Schriftrolle + Griechen | 3–5 min | keiner |
| R10a Grabstein | gut, Haufen-Gag als weiche Rückmeldung | 4–6 min | GD-03 |
| R10b Alter des Grabsteins | lösbar, aber ohne Entscheidung | 2–3 min | GD-11 |
| R13 Finaltag | gut, Erinnerung an Feigen beim ersten Klick | 4–8 min (Rede-Ringen) | GD-10 |
| R11a Paraden-Plan | gut, Hinweise im Gespräch und auf dem Plan | 2–4 min | GD-12 |
| R11b Wein | gut, schönstes Zeitfähren-Rätsel; Saft und Essig geben eigene Rückmeldung | 4–8 min | keiner |

## Gut gelöst

- Welt 2 hat **keine harte Sackgasse** gefunden: Wunderdinge haben Zweitwege (Fladen statt Kaugummi bei Nebet, Tinte/Socke/Empfehlungsschreiben statt Kugelschreiber), Zeitfähre-Zustände hängen nur am Steg (`welt_2.gd` `_alter()`), Hin- und Herfahren macht nichts kaputt, Fehlschläge setzen sich zurück (Hebel-Korb, Rede-Ringen, Sphinx).
- **Fehlversuche sind belohnt**: Hieroglyphen-Pointen je Muster, Sphinx kommentiert den ersten falschen Baustein, Essig/Saft bei Ramses eigene Zeilen, Haufen-Gag beim Steinmetz.
- **Nachsicht** nach zwei Fehlversuchen bei Hebel und Rede-Ringen; die falschen Konter bleiben ausgegraut.
- Diskus-Logik ist jetzt korrekt formuliert (Hermes 0240) und erst nach allen vier Verhören anklagbar.
- Startlinie erinnert einmal an die Feigen, bevor der Finaltag beginnt (gute weiche Warnung vor einer verpassbaren Verbesserung).
- Hinweisstufen sind je Welt getrennt; Welt 2 hat für jeden Schritt drei Zeilen, keine Lücke in den Texten selbst.
- Prolog und Welt 1: alle früheren Rätsel-Funde nachweislich umgesetzt und durch den Durchlauftest abgedeckt.

## Nicht geprüft

- Minispiel-Bedienung von Hebel und Rede-Ringen von Hand (nur über Testvorgaben).
- Hebel mit „Später“ schließen und das Stadion mitten in Tag 1 verlassen (Figuren-Verteilung währenddessen).
- Speichern/Laden mitten in Welt 2 (Feigen-Zustand, Fährsteg) außerhalb der vorhandenen Tests.
- Ob die Bildtafel-Auswahl mit 16 Einträgen im echten Fenster lesbar ist (Bedienung, nicht Rätsel).
- Lesbarkeit der Fährtafel, der Inschrift und des Aushangs als Bild (Grafik-Rolle).
- Echte Spielzeit; die Zeiten oben sind Schätzungen.

## Zählung

kritisch 0, wichtig 7 (GD-01, 02, 03, 04, 05, 08, 09), kosmetisch 5 (GD-06, 07, 10, 11, 12).
