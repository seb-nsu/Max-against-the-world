# Review 21.11.2026 (Fortsetzung 25.11.): Text-Prüfer `tx-b`

Rolle: Narrative Designer. Kürzel `tx-b`. Geprüfter Stand: `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s` (= `main` auf `04c5a79f` plus Review-Dateien).

Umfang: alle Zeilen in `game/lokalisierung/texte.csv` mit den Präfixen `W2_` (Welt 2 „Antikodonien“, 1466 Zeilen) und `W3_` (Welt 3 „Neo-Neustadt 2099“, 1321 Zeilen), jeweils Deutsch und Englisch. Zusammen 2787 Zeilen.

Geprüft wird: Humor und Ton, eigene Stimme je Figur, KI-Klang jeder Dialogzeile (Prüfkatalog humanizer-de), Anspielungen und Filmzitate, Lokalisierung DE/EN, rote Fäden und Running Gags. Es wird nur gelesen und dokumentiert; es wird nicht gespielt. IDs ab `R5-TX-46` (Fortsetzung von `tx-a.md`).

## Zählung (wird nach jedem Block nachgeführt)

| Präfix | gelesen | von |
| --- | --- | --- |
| W2_ | 1029 | 1466 |
| W3_ | 0 | 1321 |

Gelesen in Welt 2 (DE und EN, jede Zeile): NIL 114, FAHR 37, STOL 13, HAFS 18, THRO 52, HIER 41, DUEL 49, AUDI 40, KUCH 77, SPHX 83, KRON 35, TRAI 21, WERK 88, HEBL 36, BUER 93, AGOR 98, SAND 58, STAD 56, TAG1 20. Offen: DISK 47, GRAB 40, FINA 23, RING 37, PARA 51, INV 91, ABS 28, ZURU 20, HINT 100.

## Stand

- [x] Auftrag, humanizer-de, Rolle, Konzept, Skripte, Rätsel, frühere Reviews gelesen
- [ ] Welt 2 (1029 von 1466)
- [ ] Welt 3
- [ ] Auswertung (Stimmen, Anspielungen, Running Gags, Lokalisierung, Top 10)

(Notiz in Arbeit; Abschnitte folgen blockweise. Was unten steht, ist gesichert.)

## Arbeitsweise

- Lesefassung je Raum mit `werkzeuge/tx-b_auszug.py` (Schlüssel, Regie aus dem Skript, DE, EN, Marken früherer Reviews). Rohzählungen mit `werkzeuge/tx-b_zaehlen.py` (Muster, Längen, Sprecher, EN-Prüfung). Die Zählungen sind Suchtreffer, kein Urteil; ein Fund entsteht erst beim Lesen.
- Maßstab wie in `tx-a.md`: Ein Einzelsignal ist kein Fund (Cluster-Regel aus humanizer-de). Figurenstimmen sind ausgenommen: Ramses' „Oder …“, Leonidas' Großbuchstaben, die Beamten, in Welt 3 Deckert, Automat, M.U.T.T.I., Schmidt, Herr Vier, Hausmeister, Kalle.
- Gemeldet wird ein Muster, wenn es am selben Hotspot oder im selben Raum doppelt steht, wenn es einer anderen Figur gehört oder wenn die zweite Blase nur die erste erklärt.
- Musternamen: M-Nummern aus humanizer-de (M7 Dichotomie, M8 Kontrast-Formel, M9 Dreierreihe, M45 Lehnübersetzung, M61 gleicher Bauplan, M62 Kommentar-Schwanz) und die zehn Couch-Quest-Regeln aus `docs/review/2026-11-20/notizen/skript-humanizer.md` („Regel 1“ bis „Regel 10“).

## Welt 2: Funde je Raum (Zwischenstand, Räume NIL bis TAG1)

Alle Prioritäten kosmetisch, wenn nicht anders vermerkt.

### Nilufer, Fähre, Fahrt, Stollen, Hafensteg (`NIL`, `FAHR`, `STOL`, `HAFS`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-46 | `W2_STOL_MAX_0060` (mit `0065`) | Max | kosmetisch | M7 Dichotomie, am selben Hotspot doppelt | „Ein Steinweg den Hügel hoch zu weißen Säulen. Da oben brüllt jemand, also ist das entweder Sport oder Politik.“ | Die nächste Zeile am selben Weg (`0065`) schließt wieder mit „entweder als Held … oder als Pfütze“. In Welt 2 baut Max sechs Ansehen-Zeilen so (`NIL_MAX_0640`, `STOL_MAX_0060`, `0065`, `WERK_MAX_0040`, `BUER_MAX_0050`, dazu `NIL_MAX_0690` „beeindruckt sein soll oder Angst haben“). `0065` hat die bessere Pointe und bleibt. | „Ein Steinweg den Hügel hoch zu weißen Säulen. Da oben brüllt jemand. Das wird Sport sein. Oder schon wieder Politik.“ EN: „A stone path up the hill to white columns. Someone's yelling up there. Must be sport. Or politics again.“ |
| R5-TX-47 | `W2_NIL_MAX_0510`, `W2_DUEL_MAX_0030` | Max | kosmetisch | M45 Lehnübersetzung („Meinungen haben“), gleicher Bau zweimal | „Es hat keine Hände, nur ziemlich viele Meinungen.“ / „Er hat kein Halsband mit Lautsprecher, nur sehr viel Meinung.“ | Schließt an R5-TX-16 an: „opinions“ ist im Englischen ein fester Witz, im Deutschen klingt es übersetzt. Dazu ist es zweimal derselbe Satzbau („kein X, nur viel Meinung“). Eine Zeile reicht; die beim Hofkater trägt, weil sie auf das Halsband zeigt. | `NIL_MAX_0510`: „Dem Krokodil den Kugelschreiber geben? Es hat keine Hände. Und unterschreiben will es hier sowieso nichts.“ EN: „Give the crocodile the ballpoint pen? It hasn't got hands. And it's not signing anything round here anyway.“ |
| R5-TX-48 | `W2_NIL_MAX_1030` | Max | kosmetisch | Anschluss (Rest von ND-06 vom 17.11.) | „Und wer hat ihn falsch herum gehalten?“ | Der Fährmann sagt eine Zeile vorher „falsch herum hingelegt“ (`NIL_FAE_0350`). Max fragt nach einem anderen Verb; im Englischen ebenso („laid it down“ / „held it upside down“). | „Und wer hat ihn falsch herum hingelegt?“ EN: „And who laid it down the wrong way round?“ |
| R5-TX-49 | `W2_FAHR_MAX_0010` | Max | kosmetisch | Regel 4 (Superlativ-Bilanz), im selben Block doppelt | „Drei Haltestellen, eine Linie, kein Umsteigen. Ehrlich, das ist der beste Nahverkehr, den ich je gesehen habe.“ | „das X-ste, das ich je gesehen habe“ steht im selben Block noch einmal bei Pixel (`FAHR_PIX_0180` „der kleinste Garten, den ich je gesehen habe“). Max untertreibt sonst; „Ehrlich,“ ist Anlauf. Die Aufzählung davor ist gut und bleibt. | „Drei Haltestellen, eine Linie, kein Umsteigen. Das krieg sogar ich ohne App hin.“ EN: „Three stops, one line, no changes. Even I can manage that without an app.“ |
| R5-TX-55 | `W2_NIL_PIX_0240_2` (Nachbar `0225_2`) | Pixel | kosmetisch | M8 Kontrast-Formel, zwei Nachbar-Hotspots | „Dieser Hut ist kein Kleidungsstück. Dieser Hut ist ein Hilfeschrei.“ | Am Hotspot daneben endet Pixel mit „Ich bin ein Kater und kein Sparschwein.“ (`0225_2`). Zweimal „kein X, sondern Y“ als Schlusspointe auf engem Raum (Regel 1: höchstens einmal je Raum). Der Hut-Satz ist der stärkere und bleibt; der Sparschwein-Satz lässt sich ohne Verneinung bauen. | `0225_2`: „Ich lege niemandem etwas unter die Zunge. Sparschweine gibt es in Rosa, und selbst die tun das nicht gern.“ EN: „I put nothing under anyone's tongue. Piggy banks come in pink, and even they do not enjoy it.“ |
| R5-TX-56 | `W2_NIL_PIX_0700_2` | Pixel | kosmetisch | „A nennt das X. Ich nenne es Y.“ (wie R5-TX-21, R5-TX-25) | „Ein Architekt würde das Statik nennen. Ich nenne es Sturheit, und ich weiß, wovon ich rede.“ | Dritter Einsatz derselben Formel seit Welt 1. Der Nachsatz „ich weiß, wovon ich rede“ ist die eigentliche Pointe und reicht. | „Statik ist das nicht. Das ist Sturheit, und ich weiß, wovon ich rede.“ EN: „That is not statics. That is stubbornness, and I know what I am talking about.“ |
| R5-TX-60 | `W2_NIL_PIX_0660_2` (EN) | Pixel | kosmetisch | Lokalisierung: Pixel mit Kurzform (wie R5-TX-33) | „I'm reading that as a threat. Aimed at me.“ | Pixel spricht im Englischen ohne Kurzformen (Konzept). Das Schild im Zitat darf „don't“ behalten. | „I read that as a threat. Aimed at me.“ |

### Palast: Thronsaal, Hieroglyphen, Duell, Audienz, Küche (`THRO`, `HIER`, `DUEL`, `AUDI`, `KUCH`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-50 | `W2_KUCH_PIX_0200_2` | Pixel | kosmetisch | M62 Kommentar-Schwanz (zweite Blase erklärt die erste) | „Das ist die einzige Art zu denken, die ich für wirklich zukunftsfähig halte.“ | Blase eins („Ich mag diese Frau. Sie denkt in Öfen.“) ist die Pointe. Blase zwei wertet sie nur noch aus, mit „wirklich zukunftsfähig“ in Papierdeutsch. Regel 2: Der letzte Satz bringt Neues. | „Dein Großvater denkt in Schrauben. Davon ist noch niemand satt geworden.“ EN: „Your grandfather thinks in screws. Nobody has ever dined on a screw.“ |
| R5-TX-53 | `W2_WERK_MAX_0150` (mit `W2_KUCH_MAX_0110`, `W2_THRO_MAX_0330`) | Max | kosmetisch | M61 gleicher Bauplan beim Nehmen | „Ich nehm den Essig mit. Falls jemand Salat macht. Oder die Zeit zurückdreht.“ | Dreimal „Ich nehm X mit. Falls jemand … (Oder …)“. Saft und Essig tragen beide den Hinweis auf Rätsel 11b und klingen deshalb wie dieselbe Zeile. Der Hinweis (Zeit, Fähre rückwärts) muss bleiben. | „Essig, eingepackt. Mit Salat rechne ich hier nicht. Eher mit einer Fähre, die rückwärts durch die Zeit fährt.“ EN: „Vinegar, packed. I'm not expecting salad. More likely a ferry going backwards through time.“ |
| R5-TX-61 | `W2_HIER_SCH_0120` (EN) | Schreiber | kosmetisch | Lokalisierung: Zeichen | „That reads as... one moment.“ | Einzige W2-Zeile mit drei Punkten statt „…“; im Deutschen steht das richtige Zeichen. | „That reads as … one moment. Should I really read that out? Oh well. I'll read it out.“ |

### Sphinx, Krone, Training, Werkstatt, Hebel (`SPHX`, `KRON`, `TRAI`, `WERK`, `HEBL`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-51 | `W2_TRAI_MAX_0170` | Max | kosmetisch | Regel 4 und Regel 2: Entwicklung wird ausgesprochen, Dublette | „Ich hab gerade dreimal freiwillig Sport gemacht. Das erzähl ich niemandem.“ | Pixel sagt zwei Zeilen vorher schon „Er hat ‚noch mal‘ gesagt. Freiwillig. Beim Sport.“ (`TRAI_PIX_0140`). Max wiederholt die Bilanz mit denselben Wörtern. Der Moment trägt über „Noch mal.“ (`TRAI_MAX_0110`); Max sollte ihn kleinreden. Pixels Antwort `0180` („Ich erzähle es allen.“) passt weiter. | „Das bleibt unter uns. Das mit dem ‚Noch mal‘.“ EN: „That stays between us. The ‚again‘ thing.“ (EN mit geraden Anführungszeichen wie in `TRAI_PIX_0140`.) |
| R5-TX-52 | `W2_HEBL_PIX_0030` (mit `0200`) | Pixel | kosmetisch | M8 Kontrast-Formel, im selben Minispiel doppelt | „Die Dose kommt da sofort wieder heraus. Sie ist kein Gewicht.“ // „Sie ist ein Erbstück, und Erbstücke wirft man nicht durch die Luft.“ | „Ich bin kein Gewicht, ich bin ein Gott.“ (`HEBL_PIX_0200`) ist die Hauptpointe des Hebel-Spiels. Die Dose nimmt sie mit demselben Bau vorweg; dazu sagt Archimedes „amtlich ist kein Gewicht“ (`HEBL_ARC_0090`). | `0030`: „Die Dose kommt da sofort wieder heraus.“ // `0030_2` unverändert. EN: „The tin is coming straight back out of there.“ |
| R5-TX-57 | `W2_WERK_MAX_0450` | Max | kosmetisch | Anrede (ND-21 vom 17.11., weiterhin offen) | „Ihr seid der König?“ | Einziges „Ihr“ in Welt 2; in den Zeilen danach duzt Max König Hieron wie alle anderen. Im Englischen fällt es nicht auf. | „Du bist der König?“ (Wer den Bruch als Witz will, braucht eine zweite Zeile, die ihn bemerkt.) |

### Olympia: Büro, Agora, Sandale, Stadion, Tag 1 (`BUER`, `AGOR`, `SAND`, `STAD`, `TAG1`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-54 | `W2_AGOR_TIR_0380` (mit `W2_SPHX_SPH_0470`, `UI_W2_BAUSTEIN_BLAU`) | Tiro, Sphinx | **wichtig** | Regel 10 (Rätselinformation wörtlich), DE und EN | „Blau. Ein blauer Stift. Er schreibt und schreibt und hat trotzdem schlechte Laune, genau wie ich.“ | Die Zeile liefert den Sphinx-Baustein. Im Notizbuch steht aber „Es ist blau und hat trotzdem **keine** Laune“ (EN „still not sad“), die Sphinx sagt „blau ohne Laune“. Tiro sagt das Gegenteil („hat trotzdem schlechte Laune“, EN „is still in a bad mood“). Der Spieler kann den Baustein nicht aus dem Gehörten wiedererkennen. Dazu trägt das deutsche Wortspiel nicht (R5-TX-43: „blau“ heißt betrunken, nicht traurig). | Mit der Fassung aus R5-TX-43 („Es ist blau und trotzdem nüchtern“ / „It is blue and never gets the blues“): Tiro DE „Blau. Ein blauer Stift. Schreibt und schreibt und bleibt dabei nüchtern. Blau und trotzdem nüchtern, das schafft bei uns keiner.“ EN „Blue. A blue pen. It writes and writes and never gets the blues. Unlike me.“ Sphinx DE „Es schreibt ohne Tinte, es klickt, es ist blau und trotzdem nüchtern. Ein Käfer? Ein Beamter? Ich … nein. Nein.“ EN „… it's blue and never gets the blues. A beetle? …“ |
| R5-TX-58 | `W2_AGOR_GRI_0410` / `_2` (EN) | Grieche | kosmetisch | Lokalisierung: Blasen ungleich geteilt (wie R5-TX-37) | EN Blase 1: „All right, the calendar. And the underfloor heating. And the concrete. And the post. But apart from that?“ | Im Deutschen beginnt „Aber sonst?“ die zweite Blase. Im Englischen steht es am Ende der ersten; bei der Vertonung passen die Schnitte nicht zueinander. | Blase 1: „All right, the calendar. And the underfloor heating. And the concrete. And the post.“ Blase 2: „But apart from that? What do we get from them, apart from the calendar, underfloor heating, concrete and the post?“ (132 Zeichen) |
| R5-TX-59 | `W2_AUDI_RAM_0100`, `W2_BUER_MAX_0375` (EN) | Ramses, Max | kosmetisch | Lokalisierung: Begriff uneinheitlich, Max steif | „The games begin once you have a starting pass.“ / „I have my starting pass. I cannot take any more paper.“ | Der Startpass heißt im Englischen sonst 19-mal „entry pass“ (auch im Inventar). „I cannot“ ist Pixels Ton, nicht der von Max. | „… once you have an entry pass.“ / „I've got my entry pass. I can't take any more paper.“ |

### Raumübergreifend (Zwischenstand)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-62 | `W2_FAHR_PIX_0220`, `W2_THRO_PIX_0250_2`, `W2_WERK_PIX_0295`, `W2_AGOR_PIX_0050`, `W2_AGOR_PIX_0480`, `W2_STAD_PIX_0060`, dazu `W2_NIL_PIX_0040` | Pixel | kosmetisch | M9/M61: „Hauptwort. Eigenschaft, Eigenschaft und Eigenschaft.“ (Nachfolger des Schnupper-Dreiers R5-TX-39) | „Moos. Weich, kühl und ein klein wenig feucht.“ / „Möwen. Weiß, laut und unverschämt.“ / „Heu. Warm, trocken, und es raschelt angenehm.“ / „Eine Tonne. Dunkel, eng, und sie riecht nach Mensch.“ / „Steinstufen in der Sonne. Warm, breit und leider hart.“ | Sieben Zeilen in den bisher gelesenen Räumen mit demselben Bauplan. Als Liegeplatz-Bewertung mit Punkten (Heu „Acht von zehn“, Stufen „Sieben Punkte“) ist das ein Running Gag und bleibt. Ohne Wertung ist es nur die Schablone. Zählung wird nach dem Rest von Welt 2 und für Welt 3 ergänzt. | Zwei ohne Wertung umbauen (Regel 3: mit ganzem Satz beginnen). `WERK_PIX_0295`: „Die Möwen hier sind unverschämt. Sie sehen mich an, als wäre ich der Fisch.“ `AGOR_PIX_0480`: „In dieser Tonne wohnt jemand. Man riecht es bis hierher.“ EN: „The gulls here are insolent. They look at me as if I were the fish.“ / „Somebody lives in that barrel. One can smell it from here.“ |

## Frühere Funde Welt 2 (Review 17.11.), Stand heute (Zwischenstand)

| Früher | Stand heute |
| --- | --- |
| ND-01 Zeilen über 140 Zeichen | DE behoben (0 über 140). EN: 11 Zeilen über 140 (Liste folgt unter Lokalisierung). |
| ND-04 Platzhalter Hieroglyphen | behoben (`HIER_SCH_0120` ohne Platzhalter, neue `0125`). |
| ND-05 „anderes Büro“ zu oft | weitgehend behoben (`NIL_HER_0910`, `AUDI_RAM_0100` ohne). Verbleibend `NIL_HER_0970`, `BUER_HER_0330`, `BUER_MAX_0340`; das ist Aufbau und Auszahlung und in Ordnung. |
| ND-06 Bauplan falsch herum | Text angepasst, Rest siehe R5-TX-48. |
| ND-07a, ND-13 Thron/Wand | behoben (`THRO_MAX_0260/0265`, `HIER_SCH_0050` „an der Wand“). |
| ND-09 Sphinx | behoben (`SPHX_MAX_0030`). |
| ND-11 Agora | behoben (`AGOR_MAX_0225`). |
| ND-12 Hermes-Gespräch endet nicht | behoben (`BUER_HER_0650`). |
| ND-16a „Die spinnen, die Griechen“ doppelt | behoben (nur noch `AUDI_MAX_0110`). |
| ND-16b Zenon doppelt | behoben (nur noch `TAG1_PIX_0070`). |
| ND-17 „freiwillig“ | reduziert; Zählung folgt unter Running Gags. |
| ND-18 Medienvergleiche Thronsaal | teils (`THRO_MAX_0120` ohne Vergleich, `0110` Gaming-Stuhl bleibt und passt). |
| ND-20 Küche | behoben (`KUCH_MAX_0105`). |
| ND-21 Anrede „Ihr“ | offen, siehe R5-TX-57. |
