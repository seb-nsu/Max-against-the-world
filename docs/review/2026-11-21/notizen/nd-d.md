# nd-d: Narrative Designer, Teil B, Welt 4 „Kanal 999“ nur als Text

**Stand: in Arbeit (Zwischenstand nach Unterbrechung, wird blockweise ergänzt).**

## Kopf

- **Rolle:** Narrative Designer für Teil B: Welt 4 nur als Text (Handlung, Dialoge, Humor, KI-Klang). Nicht gespielt, kein Godot.
- **Geprüfter Stand:** Checkout `cq-r5`, `main` auf `04c5a79f`.
- **Gelesen (ganz):** `docs/skript/welt-4.md` (1302 Zeilen, 20 Abschnitte), `docs/raetsel/welt-4.md`, `docs/01-konzept.md`, Zwischenspiel 3 und Finale (Heimkehr, Hilferuf, Auflösung) in `docs/skript/zwischenspiele-und-finale.md`, Schluss von `docs/skript/welt-3.md`, humanizer-de (SKILL, alle 72 Muster in `references/patterns.md`, `de-naturalness.md`, `decision-tables.md`, `register-profiles.md`, `muster-katalog.md`, `checkliste-ki-tells.md`; nur als Prüfkatalog im Zweig „Nur Audit“, keine Skripte daraus ausgeführt).
- **Frühere Prüfungen von Welt 4 (nichts doppelt melden):** `pruefung/360-pruefung.md` vom 11.11. (Abschnitte C, D, E zu Welt 4, Fundliste Nr. 4, 5, 6, 10, 16, 25, 42, 46, 57, 68, 76, 82, 86, 97), umgesetzt mit `ae4ce577` („Paket 6, Welt 4“) und den Paketen 1 bis 9; PR #41 (`5bb624ae`, `16fed768`: `W4_HINT_PIX_0450`, „junger Mann“ gekürzt, `W4_WERB_WER_0062`/`MAX_0072`). Stand dieser Funde heute: Abschnitt „Frühere Funde, Stand heute“.
- **Werkzeug:** `werkzeuge/nd-d_zaehlen.py` (liest nur `texte.csv` und `skript/welt-4.md`; Zählungen, Abgleich, Musterlisten).
- IDs unten ohne Präfix `W4_`. **[R]** = Zeile trägt Rätsel- oder Hinweisinformation.

## Block 1: Handlung, roter Faden, Anschluss (Zwischenstand)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| ND-D-01 | Welt 4 gesamt, Testbild bis Sitcom | wichtig | Sonstiges (Handlung) | **Der Auftrag der Welt wird nie ausgesprochen.** Opa sagt in ZS3 nur „Dort hat mal jemand etwas verloren“ und „Mann im Glitzersakko: Nicht hinsetzen“ (`ZS3_DACH_OPA_0620`, `0640`). In Welt 4 sagt bis zum Studio niemand, (a) dass Zappmann die Goldene Fernbedienung hat, (b) dass man zu ihm nur über den versteckten Kanal kommt und (c) dass dafür die fehlenden Tasten gebraucht werden. Max sagt in der Sitcom trotzdem „Ich such eine Taste“ (`SIT_MAX_0060`) und im Studio „Sie haben Opas Fernbedienung, die goldene“ (`STUD_MAX_0020`), ohne dass er das erfahren hat. Die einzige Stelle zu den Tasten ist eine Ansehen-Zeile („fünf leere Löcher“, `FERN_MAX_0010`). Das Notizbuch nennt Ziele, die Figuren nicht. | Skript Abschnitte 1 bis 5; Suche nach „Goldene“, „Tasten“, „Löcher“ in `texte.csv` (`W4_*`): erste Nennung der Goldenen `STUD_MAX_0020` | Flimmer gibt den Auftrag im Testbild in zwei Zeilen, in seiner Stimme, ohne ein Rätsel zu verraten. Nach `TEST_FLI_0100` (statt nur „Ihr wollt raus?“): **Flimmer:** „Ihr sucht was Goldenes? Mit Tasten? Das hat der Chef. Kanal 999. Den findet keiner. Der steht nicht mal im Programm.“ **Max:** „Und wie kommt man zu einem Sender, den keiner findet?“ **Flimmer:** „Mit der richtigen Taste! Die Tasten sind überall. Also überall, nur nicht da, wo man sie braucht.“ Damit sind Ziel, Gegner und Sammelaufgabe gesetzt (drei Blasen, je unter 140 Zeichen). |
| ND-D-02 | Rauschen, Glücksrad | wichtig | Sonstiges (Handlung) | **Der Name „Zappmann“ fällt, bevor ihn jemand eingeführt hat.** Pixel fragt Flimmer „Wer ist dieser Zappmann?“ (`RAU_PIX_0260`), Max fragt Gerd „Kennen Sie Zappmann?“ (`GLUE_MAX_0380`). Der Name steht vorher nirgends: Opa sagt in ZS3 nur „Mann im Glitzersakko“, Flimmer nennt ihn im Testbild nicht. Beide Fragen sind ohne Bedingung von Anfang an wählbar. | `game/skripte/welt_4.gd` Z. 1421 (Optionen ohne Bedingung), `game/daten/raeume/welt-4.json` Z. 7426; Suche „Zappmann“ in `texte.csv`: früheste Zeile `W4_RAU_PIX_0260` | Mit dem Vorschlag zu ND-D-01 erledigt, wenn Flimmer dort den Namen sagt („Das hat der Chef. Zappmann. Kanal 999.“). Sonst die Frage umstellen: `RAU_PIX_0260` „Wer hat hier eigentlich das Sagen?“ (Flimmers Antwort `0270` nennt dann den Namen: „Der Chef. Zappmann. Von allem. …“). |
| ND-D-03 | Studio, Finale | wichtig | Sonstiges (Handlung) | **Welt 4 nimmt die Auflösung des Finales vorweg und widerspricht ihr.** Im Finale ist „Und die Goldene Fernbedienung ist …“ / „Meine. Die ich seit Wochen suche.“ eine Enthüllung (`FI_AUFL_MAX_0170`, `OPA_0180`); davor sagt Max „Ich hab eine ganze Welt lang eine Fernbedienung durch die Gegend getragen und gedacht, das ist ein Artefakt“ (`FI_DACH_MAX_0150`), und das Konzept hält fest: „er weiß nur noch nicht, wessen Fernbedienung es ist“ (`01-konzept.md` Z. 312). In Welt 4 weiß Max es aber schon dreimal: „Sie haben Opas Fernbedienung“ (`STUD_MAX_0020`), „Eigentlich ist es Opas ganz normale, bloß hat sie jemand mit Gold angemalt“ (`STUD_MAX_0430`), und Zappmann sagt „Sie gehört einem alten Mann, den ich von früher kenne“ (`STUD_ZAP_0390`). Außerdem trägt Max die Goldene keine Welt lang, sondern nur vom Studio bis zum Dachboden. | Skript Welt 4 Abschnitt 16; `zwischenspiele-und-finale.md` Z. 323, 533 bis 534; Konzept Z. 312, 316 | In Welt 4 bleibt offen, wem sie gehört. `STUD_MAX_0020`: „Sie haben die Goldene Fernbedienung. Die brauch ich, und dann bin ich auch schon wieder weg.“ `STUD_MAX_0430`: „Die Goldene Fernbedienung. Gold, schwer, und unten klebt ein Rest Klebeband. Irgendwie kommt mir das Klebeband bekannt vor.“ (greift `FERN_MAX_0030` auf, Opa und das Klebeband; der Spieler ahnt es, Max nicht). `STUD_ZAP_0390` kann bleiben („einem alten Mann, den ich von früher kenne“ ist Andeutung, kein Besitzerwechsel für Max). `FI_DACH_MAX_0150` gehört zum Finale: „eine ganze Welt lang hinter einer Fernbedienung her“. |
| ND-D-04 | Studio, Finale | wichtig | Sonstiges (Handlung) | **Zappmanns Vorgeschichte passt nicht zu seinem Auftritt.** Finale: „Zappmann durfte danach nie wieder vor eine Kamera“ (`FI_AUFL_OPA_0290`). In Welt 4 moderiert er live die „Zappmann-Show“ mit Band, Kameras und Applaus („Kameras schwenken“, `STUD_ZAP_0180`), prahlt mit „einer goldenen Karriere“ seit 1988 (`STUD_ZAP_0210`), und die Monitorwand zeigt seine Erfolge. Dazu zwei verschiedene Gründe für die Scham: in Welt 4 „keiner hat geguckt“ (`HALL_OPA_0100`, `STUD_MAX_0250`), im Finale der explodierte Backofen. „Der Backofen ist verziehen“ (`STUD_ZAP_0390`) hängt dadurch in Welt 4 in der Luft, und im Finale passt „nie wieder vor eine Kamera“ nicht zu dem Mann, den der Spieler gerade auf Sendung gesehen hat. | Skript Welt 4 Z. 1024, 1027, 600; Finale Z. 547 bis 548 | Eine der beiden Seiten angleichen. Einfachste Lösung im Finale: „Danach wollte ihn keiner mehr vor einer Kamera sehen. Da hat er sich eben einen eigenen Sender gebaut.“ Das erklärt 1988, die Show ohne Publikum und warum „keiner hat geguckt“ der wunde Punkt ist. In Welt 4 reicht dann eine halbe Zeile bei Zappmann (`STUD_ZAP_0240`): „Wo hast du das her. Das war im Keller. Seit dem Samstag mit dem Teig war das im Keller.“ |
| ND-D-05 | Kapitolis, Halle, ZS3 | kosmetisch | Sonstiges (Handlung) | **Pixel „kommt drauf“, obwohl er es längst weiß.** In ZS3 weiß Pixel alles („Mit Stufen. Und einer Ofentür.“ `ZS3_DACH_PIX_0480`; „Vorheizen. Merk dir das Wort.“ `0440`) und kündigt an: „Bei vier sage ich etwas“ (`0320`). In Kapitolis zählt er dann, als fiele es ihm erst jetzt auf („Ich zähle mal, was dein Opa bestellt hat … Moment mal.“ `KAPI_PIX_0030`, `0040`), und in der Halle dämmert es ihm bei „VORHEIZEN“ noch einmal („nein. Nein, das würde er nicht tun. Doch, er würde.“ `HALL_PIX_0250`). Je nach Reihenfolge der Sender hat Pixel dieselbe Erkenntnis zwei- bis dreimal. Der Amboss-Gag lebt davon, dass Pixel es **sagen** will, nicht davon, dass er es merkt. | Skript Z. 704 bis 708, 615; ZS3 Z. 244, 264, 268; Finale `FI_AUFL_PIX_0240` „Seit Kanal 42“ | `KAPI_PIX_0030`: „Wo wir gerade beim Denken sind: Ich hatte dir bei vier etwas versprochen, und wir sind bei vier. Ei. Mehl. Batterie. Fernbedienung …“ `KAPI_PIX_0040`: „Max, dein Großvater backt einen –“ (KLONK). `HALL_PIX_0250` kürzen auf die Blasen 1 und 3: „Vorheizen. Hm. // Ich sage nichts. Ich bin ein Grab, ein flauschiges.“ (die mittlere Blase mit dem Dämmern entfällt). |

## Block 2: Zahlen (per Skript über `texte.csv`, Stand `04c5a79f`)

Belege: `belege/nd-d/szenen.txt`, `belege/nd-d/muster-voll.txt` (jede Fundstelle mit Text), `belege/nd-d/quer.txt`. Aufruf: `py -3 docs/review/2026-11-21/werkzeuge/nd-d_zaehlen.py abgleich|szenen|figuren|muster voll|quer`.

- **Skript gegen Spiel:** 1105 Zeilen-IDs im Skript, 1105 in der CSV, 1261 Sprechblasen (Kaskaden einzeln gezählt), **0 Textabweichungen**, keine leere englische Spalte. Skript und Spielstand sind deckungsgleich; es gibt hier keinen Fund.
- **Umfang:** 1105 Zeilen bei einem Budget von 1.000 bis 1.100 (`05-spielsysteme.md`, Umfang); 110.666 Zeichen Deutsch, 104.432 Englisch. Max spricht 580 Blasen (46 %), Pixel 383 (30 %), alle 28 anderen Sprecher zusammen 264 (21 %), Erzählzeilen 34.
- **Längen:** 44 deutsche Blasen über 140 Zeichen (davon 15 Hinweise, 5 Savanne, 4 Werbespot, 3 Studio), 47 englische, 18 Erzählzeilen über 100 Zeichen (längste `STUD_NAR_0100` mit 217, `WERB_NAR_0200` mit 188). Kein Satz über 120 Zeichen. Das ist der bekannte Restpunkt W3-3 („weiterhin offen“, siehe unten).

| Abschnitt | Zeilen | Blasen | Zeichen DE | Blasen über 140 | NAR über 100 |
| --- | --- | --- | --- | --- | --- |
| 1 Testbild | 37 | 47 | 4321 | 1 | 0 |
| 2 Rauschen | 38 | 56 | 4603 | 0 | 0 |
| 3 Glücksrad | 71 | 74 | 6162 | 0 | 0 |
| 4 Fernbedienung, Zeitschrift | 36 | 41 | 4131 | 1 | 0 |
| 5 Sitcom | 86 | 91 | 7313 | 1 | 0 |
| 6 Savanne | 64 | 68 | 6386 | 5 | 0 |
| 7 Verhöre | 57 | 63 | 5461 | 3 | 0 |
| 8 Friedhof | 51 | 59 | 5353 | 0 | 2 |
| 9 Keller | 51 | 57 | 4941 | 1 | 2 |
| 10 Halle | 66 | 72 | 5512 | 1 | 0 |
| 11 Bonusrunde | 32 | 34 | 3165 | 1 | 0 |
| 12 Kapitolis | 80 | 88 | 6730 | 2 | 0 |
| 13 Fabrik | 52 | 59 | 5604 | 0 | 5 |
| 14 Werbespot | 66 | 69 | 7261 | 4 | 6 |
| 15 Empfang, Archiv | 68 | 77 | 6356 | 2 | 0 |
| 16 Studio | 74 | 82 | 7415 | 3 | 3 |
| 17 Tasten | 22 | 23 | 2428 | 3 | 0 |
| 18 Pixel auf Mensch, Inventar, Erschöpft | 55 | 81 | 6316 | 1 | 0 |
| 19 Zurufe | 25 | 32 | 1912 | 0 | 0 |
| 20 Hinweise | 74 | 88 | 9296 | 15 | 0 |
| Summe | 1105 | 1261 | 110666 | 44 | 18 |

**Stimmen in Zahlen** (Wörter je Satz, Anteil der Sätze mit höchstens drei Wörtern, Anteil der Blasen mit Ausrufezeichen):

| Sprecher | Blasen | Wörter je Satz | Kurzsätze | mit „!“ |
| --- | --- | --- | --- | --- |
| Max | 580 | 6,6 | 21 % | 2 % |
| Pixel | 383 | 7,1 | 18 % | 1 % |
| Gerd Glück | 45 | 3,9 | 54 % | 100 % |
| Sitcom-Vater | 22 | 4,6 | 33 % | 32 % |
| Kommissar | 21 | 4,7 | 35 % | 0 % |
| Flimmer | 19 | 4,2 | 47 % | 42 % |
| FBI-Agent | 16 | 3,8 | 46 % | 6 % |
| Zappmann | 15 | 4,2 | 43 % | 20 % |
| Wonder-Wilma | 13 | 4,7 | 36 % | 8 % |
| Sitcom-Mutter | 12 | 4,5 | 28 % | 25 % |
| Erzähler | 12 | 5,4 | 33 % | 0 % |
| Super-Siegfried | 12 | 3,4 | 53 % | 0 % |
| Fledermann | 11 | 4,3 | 51 % | 91 % |
| Empfangsdame | 11 | 3,9 | 46 % | 0 % |
| Sitcom-Sohn | 10 | 3,8 | 50 % | 20 % |
| Dr. Werbepause | 9 | 3,2 | 66 % | 100 % |
| Opa (Lichterkette) | 6 | 2,1 | 90 % | 0 % |

Zum Vergleich Welt 3 (`2026-11-20/notizen/skript-ki-klang.md`): Max 5,6 Wörter je Satz und 32 % Kurzsätze, Pixel 6,2. Max redet in Welt 4 also deutlich mehr in ganzen Sätzen; das Stakkato, das in Welt 3 gerügt wurde, ist hier seltener. Zwei Figuren sind über das Satzzeichen unterscheidbar (Gerd und Werbepause: 100 % Ausrufezeichen; Kommissar, Erzähler, Empfangsdame, Siegfried: 0 %). Die übrigen Nebenfiguren liegen bei 3,4 bis 4,7 Wörtern je Satz dicht beieinander (siehe ND-D-30).

(weitere Blöcke folgen)
