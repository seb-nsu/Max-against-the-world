# Review 21.11.2026 (Fortsetzung 25.11.): Text-Prüfer `tx-b`

Rolle: Narrative Designer. Kürzel `tx-b`. Geprüfter Stand: `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s` (= `main` auf `04c5a79f` plus Review-Dateien).

Umfang: alle Zeilen in `game/lokalisierung/texte.csv` mit den Präfixen `W2_` (Welt 2 „Antikodonien“, 1466 Zeilen) und `W3_` (Welt 3 „Neo-Neustadt 2099“, 1321 Zeilen), jeweils Deutsch und Englisch. Zusammen 2787 Zeilen.

Geprüft wird: Humor und Ton, eigene Stimme je Figur, KI-Klang jeder Dialogzeile (Prüfkatalog humanizer-de), Anspielungen und Filmzitate, Lokalisierung DE/EN, rote Fäden und Running Gags. Es wird nur gelesen und dokumentiert; es wird nicht gespielt. IDs ab `R5-TX-46` (Fortsetzung von `tx-a.md`).

## Zählung (wird nach jedem Block nachgeführt)

| Präfix | gelesen | von |
| --- | --- | --- |
| W2_ | 1466 | 1466 |
| W3_ | 1321 | 1321 |

Gelesen in Welt 2 (DE und EN, jede Zeile): NIL 114, FAHR 37, STOL 13, HAFS 18, THRO 52, HIER 41, DUEL 49, AUDI 40, KUCH 77, SPHX 83, KRON 35, TRAI 21, WERK 88, HEBL 36, BUER 93, AGOR 98, SAND 58, STAD 56, TAG1 20, DISK 47, GRAB 40, FINA 23, RING 37, PARA 51, INV 91, ABS 28, ZURU 20, HINT 100. Summe 1466.

Gelesen in Welt 3 (DE und EN, jede Zeile): ANK 14, STR 76, NUD 75, TEST 47, APO 63, SOFA 11, SIM 49, TUER 51, KUCH 103, TURM 75, TERM 50, BAS 163, PIEP 36, EING 97, SUPP 22, KAM1 70, KAM2 39, KAM3 41, KERN 74, ENDE 23, INV 29, ABS 14, HINT 99. Summe 1321.

## Stand

- [x] Auftrag, humanizer-de, Rolle, Konzept, Skripte, Rätsel, frühere Reviews gelesen
- [x] Welt 2 gelesen (1466 von 1466)
- [x] Welt 3 gelesen (1321 von 1321)
- [x] Auswertung (Stimmen, Anspielungen, Running Gags, Lokalisierung, Top 10)

## Arbeitsweise

- Lesefassung je Raum mit `werkzeuge/tx-b_auszug.py` (Schlüssel, Regie aus dem Skript, DE, EN, Marken früherer Reviews). Rohzählungen mit `werkzeuge/tx-b_zaehlen.py` (Muster, Längen, Sprecher, EN-Prüfung). Die Zählungen sind Suchtreffer, kein Urteil; ein Fund entsteht erst beim Lesen.
- Maßstab wie in `tx-a.md`: Ein Einzelsignal ist kein Fund (Cluster-Regel aus humanizer-de). Figurenstimmen sind ausgenommen: Ramses' „Oder …“, Leonidas' Großbuchstaben, die Beamten, in Welt 3 Deckert, Automat, M.U.T.T.I., Schmidt, Herr Vier, Hausmeister, Kalle.
- Gemeldet wird ein Muster, wenn es am selben Hotspot oder im selben Raum doppelt steht, wenn es einer anderen Figur gehört oder wenn die zweite Blase nur die erste erklärt.
- Musternamen: M-Nummern aus humanizer-de (M7 Dichotomie, M8 Kontrast-Formel, M9 Dreierreihe, M45 Lehnübersetzung, M61 gleicher Bauplan, M62 Kommentar-Schwanz) und die zehn Couch-Quest-Regeln aus `docs/review/2026-11-20/notizen/skript-humanizer.md` („Regel 1“ bis „Regel 10“).

## Welt 2: Funde je Raum

Alle Prioritäten kosmetisch, wenn nicht anders vermerkt.

### Nilufer, Fähre, Fahrt, Stollen, Hafensteg (`NIL`, `FAHR`, `STOL`, `HAFS`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-46 | `W2_STOL_MAX_0060` (mit `0065`) | Max | kosmetisch | M7 Dichotomie, am selben Hotspot doppelt | „Ein Steinweg den Hügel hoch zu weißen Säulen. Da oben brüllt jemand, also ist das entweder Sport oder Politik.“ | Die nächste Zeile am selben Weg (`0065`) schließt wieder mit „entweder als Held … oder als Pfütze“. In Welt 2 baut Max sechs Ansehen-Zeilen so (`NIL_MAX_0640`, `STOL_MAX_0060`, `0065`, `WERK_MAX_0040`, `BUER_MAX_0050`, dazu `NIL_MAX_0690` „beeindruckt sein soll oder Angst haben“). `0065` hat die bessere Pointe und bleibt. | „Ein Steinweg den Hügel hoch zu weißen Säulen. Da oben brüllt jemand. Das wird Sport sein. Oder schon wieder Politik.“ EN: „A stone path up the hill to white columns. Someone's yelling up there. Must be sport. Or politics again.“ |
| R5-TX-47 | `W2_NIL_MAX_0510`, `W2_DUEL_MAX_0030` | Max | kosmetisch | M45 Lehnübersetzung („Meinungen haben“), gleicher Bau zweimal | „Es hat keine Hände, nur ziemlich viele Meinungen.“ / „Er hat kein Halsband mit Lautsprecher, nur sehr viel Meinung.“ | Schließt an R5-TX-16 an: „opinions“ ist im Englischen ein fester Witz, im Deutschen klingt es übersetzt. Dazu ist es zweimal derselbe Satzbau („kein X, nur viel Meinung“). Eine Zeile reicht; die beim Hofkater trägt, weil sie auf das Halsband zeigt. | `NIL_MAX_0510`: „Dem Krokodil den Kugelschreiber geben? Es hat keine Hände. Und unterschreiben will es hier sowieso nichts.“ EN: „Give the crocodile the ballpoint pen? It hasn't got hands. And it's not signing anything round here anyway.“ |
| R5-TX-48 | `W2_NIL_MAX_1030` | Max | kosmetisch | Anschluss (Rest von ND-06 vom 17.11.) | „Und wer hat ihn falsch herum gehalten?“ | Der Fährmann sagt eine Zeile vorher „falsch herum hingelegt“ (`NIL_FAE_0350`). Max fragt nach einem anderen Verb; im Englischen ebenso („laid it down“ / „held it upside down“). | „Und wer hat ihn falsch herum hingelegt?“ EN: „And who laid it down the wrong way round?“ |
| R5-TX-49 | `W2_FAHR_MAX_0010` | Max | kosmetisch | Regel 4 (Superlativ-Bilanz), im selben Block doppelt | „Drei Haltestellen, eine Linie, kein Umsteigen. Ehrlich, das ist der beste Nahverkehr, den ich je gesehen habe.“ | „das X-ste, das ich je gesehen habe“ steht im selben Block noch einmal bei Pixel (`FAHR_PIX_0180` „der kleinste Garten, den ich je gesehen habe“). Max untertreibt sonst; „Ehrlich,“ ist Anlauf. Die Aufzählung davor ist gut und bleibt. | „Drei Haltestellen, eine Linie, kein Umsteigen. Das krieg sogar ich ohne App hin.“ EN: „Three stops, one line, no changes. Even I can manage that without an app.“ |
| R5-TX-55 | `W2_NIL_PIX_0240_2` (Nachbar `0225_2`) | Pixel | kosmetisch | M8 Kontrast-Formel, zwei Nachbar-Hotspots | „Dieser Hut ist kein Kleidungsstück. Dieser Hut ist ein Hilfeschrei.“ | Am Hotspot daneben endet Pixel mit „Ich bin ein Kater und kein Sparschwein.“ (`0225_2`). Zweimal „kein X, sondern Y“ als Schlusspointe auf engem Raum (Regel 1: höchstens einmal je Raum). Der Hut-Satz ist der stärkere und bleibt; der Sparschwein-Satz lässt sich ohne Verneinung bauen. | `0225_2`: „Ich lege niemandem etwas unter die Zunge. Sparschweine gibt es in Rosa, und selbst die tun das nicht gern.“ EN: „I put nothing under anyone's tongue. Piggy banks come in pink, and even they do not enjoy it.“ |
| R5-TX-56 | `W2_NIL_PIX_0700_2` | Pixel | kosmetisch | „A nennt das X. Ich nenne es Y.“ (wie R5-TX-21, R5-TX-25) | „Ein Architekt würde das Statik nennen. Ich nenne es Sturheit, und ich weiß, wovon ich rede.“ | Dritter Einsatz derselben Formel seit Welt 1; in Welt 2 steht „nennen“ als Pointenwort in zwölf Zeilen. `KUCH_PIX_0320_3` („Das nennt man Kruste, und Kruste nennt man Kunst“) mit dem Rückruf `INV_MAX_0380` („Pixel nennt das Kunst, ich nenn es Mittagessen“) ist ein Paar und bleibt. Hier reicht der Nachsatz „ich weiß, wovon ich rede“ als Pointe. | „Statik ist das nicht. Das ist Sturheit, und ich weiß, wovon ich rede.“ EN: „That is not statics. That is stubbornness, and I know what I am talking about.“ |
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

### Diskus-Diebstahl, Grab, Finaltag, Rede-Ringen, Parade (`DISK`, `GRAB`, `FINA`, `RING`, `PARA`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-63 | `W2_RING_MAX_0030` / `_2` (EN) | Max | **wichtig** | Lokalisierung: Blase über 140 Zeichen, Zitat zerrissen, Rätselinformation | EN Blase 1 (171 Zeichen): „Comeback one: "Anyone who talks that long is afraid of the end of the sentence." Two: "An argument so thin you can see the speaker through it." Three: "You quote yourself.“ // Blase 2: „The only one still listening."“ | Im Deutschen steht Konter eins in der ersten Blase (69 Zeichen), zwei und drei in der zweiten. Im Englischen läuft die erste Blase über die Grenze, und der dritte Konter ist mitten im Zitat geteilt. Das sind die drei Konter, die der Spieler im Ringen wiedererkennen muss. | Blase 1: „Comeback one: "Anyone who talks that long is afraid of the end of the sentence."“ (80) Blase 2: „Two: "An argument so thin you can see the speaker through it." Three: "You quote yourself. The only one still listening."“ (121) |
| R5-TX-64 | `W2_GRAB_MAX_0090` / `_2`, `W2_DISK_MAX_0310` / `_2` (EN) | Max | kosmetisch | Lokalisierung: Blasen ungleich geteilt (wie R5-TX-37) | `GRAB` EN: „One hundred and thirty-seven years.“ // „Egypt to Olympia one hundred and twelve, Olympia to Syracuse twenty-five. That's maths I actually enjoy.“ `DISK` EN: „A record: "Hits for Inventors, Volume 3". Grandpa smuggled it into my bag.“ // „It's round, and it flies. It doesn't need to do more.“ | In beiden Paaren ist ein Satz in die andere Blase gerutscht. Bei `GRAB` steht die Rechnung (Rätsel 10b) im Deutschen in der ersten Blase und die Pointe allein in der zweiten. Für die Vertonung müssen die Schnitte gleich liegen. | `GRAB_MAX_0090`: „One hundred and thirty-seven years. Egypt to Olympia one hundred and twelve, Olympia to Syracuse twenty-five.“ // `_2`: „That's maths I actually enjoy.“ `DISK_MAX_0310`: „A record: "Hits for Inventors, Volume 3".“ // `_2`: „Grandpa smuggled it into my bag. It's round, and it flies. It doesn't need to do more.“ |
| R5-TX-65 | `W2_GRAB_PIX_0155_2` (mit `0200_2`) | Pixel | kosmetisch | Regel 4 (Superlativ-Bilanz), im selben Raum doppelt | „Das war der schönste Moment, den ich bisher in Syrakus erleben durfte.“ | Pixel zieht in Welt 2 sechsmal eine Superlativ-Bilanz (`FAHR_PIX_0180`, `KRON_PIX_0030_2`, `GRAB_PIX_0155_2`, `GRAB_PIX_0200_2`, `FINA_PIX_0090_2`, `RING_PIX_0200_2`), zwei davon am Grabhügel. `0200_2` („Das ist das Traurigste, was ich je gesehen habe.“ // „Gleich nach einem leeren Napf.“) bricht die Formel selbst und bleibt. | `0155`: unverändert („Die Zikaden haben eben eine Pause gemacht, eine ganze Sekunde lang.“) // `0155_2`: „Ich habe sie genossen. Ich hätte gern noch eine.“ EN: „I enjoyed it. I should like another.“ |
| R5-TX-66 | `W2_GRAB_CIC_0240` | Cicero | kosmetisch | M7 Dichotomie, Formel gehört Max (Regel 7) | „Ein Haufen. Das ist entweder sehr alt oder sehr schlecht gemacht. Ich tippe auf Letzteres.“ | Derselbe Bau wie `STOL_MAX_0065` („entweder als Held … oder als Pfütze, und ich tippe bei mir auf Pfütze“), siehe R5-TX-46. Cicero redet sonst in Ausrufen und langen Bögen; hier klingt er wie Max. | „Ein Haufen! Ich suche seit Jahren das Grab eines Genies, und man zeigt mir einen Haufen. Der ist nicht alt. Der ist schlecht gemacht.“ EN: „A heap! I have sought the tomb of a genius for years, and I am shown a heap. It is not old. It is badly made.“ |

### Inventar, Gespräch erschöpft, Zurufe, Hinweise (`INV`, `ABS`, `ZURU`, `HINT`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-67 | `W2_ZURU_PIX_0020`, `0030`, `0050`, `0060`, `0080`, `0090` (und `0010`) | Pixel | kosmetisch | M61 gleicher Bauplan (Zuruf-Reihe, wie R5-TX-40) | „Das Krokodil hat sich inzwischen dreimal vor mir verneigt. Du hast dich in derselben Zeit kein einziges Mal bewegt.“ / „Archimedes hat in dieser Zeit zwei Dinge erfunden. Eins davon war schlecht.“ // „Das sind trotzdem zwei mehr als du …“ | Sieben von zehn Zurufen vergleichen Max mit jemandem im Raum, der in derselben Zeit mehr getan hat (Fluss, Krokodil, Pharao, Sphinx, Archimedes, Cicero, Schildkröte); dreimal fällt „in der/dieser/derselben Zeit“. Jeder für sich ist gut, die besten sind Pharao (`0030`), Sphinx (`0050`) und Cicero (`0080`). Wer in drei Räumen wartet, hört dreimal denselben Witz. | Zwei umbauen, ohne Vergleich. `0020`: „Das Krokodil sieht dich an. Es überlegt, ob du Treibgut bist.“ // „Beweg dich. Dann hört es auf zu überlegen.“ `0060`: „Archimedes hat mich eben gemessen. Mit dem Zirkel.“ // „Tu etwas, bevor er auf die Idee kommt, mich zu wiegen.“ EN: „The crocodile is looking at you. It is wondering whether you are driftwood.“ // „Move. Then it will stop wondering.“ / „Archimedes has just measured me. With the compasses.“ // „Do something before it occurs to him to weigh me.“ |
| R5-TX-68 | `W2_AUDI_RAM_0270`, `W2_KUCH_NEB_0240`, `W2_BUER_MAX_0055`, `W2_BUER_MAX_0430`, `W2_AGOR_MAX_0080`, `W2_FINA_NAR_0040`, `W2_INV_MAX_0010`, `W2_HINT_PIX_0631`, `W2_HINT_PIX_1132`, `W2_HINT_PIX_1330` (EN) | mehrere | kosmetisch | Lokalisierung: EN über 140 Zeichen (wie R5-TX-38; ND-01 vom 17.11. nur im Deutschen behoben) | Längen EN: 160, 147, 141, 142, 143, 151, 144, 145, 159, 141 | Die Grenze von 140 Zeichen je Blase wird im Deutschen überall gehalten, im Englischen in elf Zeilen nicht (die elfte ist R5-TX-63). Ob die Blase im Spiel überläuft, wurde nicht geprüft; die Prüfung in `tools/pruefen.py` sollte auch die englische Spalte messen. | Gekürzt, Inhalt gleich: `AUDI_RAM_0270` „Running, jumping, javelin, discus, wrestling, two days. I shall come, with court, fanners, everything. I have decided. Haven't I? Yes.“ · `KUCH_NEB_0240` „… Ask your cat. Cats know what tastes good, it's their whole profession.“ (133) · `BUER_MAX_0055` „… one for a form that doesn't exist. Nothing here gets done.“ (136) · `BUER_MAX_0430` „"Circular: entry pass only with Permit Four-Slash-Y." …“ (128) · `AGOR_MAX_0080` „A speaker's platform. Someone's been standing on it talking for hours. …“ (135) · `FINA_NAR_0040` „Max throws. The javelin climbs, the wind carries it. It skewers Leonidas's lunch plate on the way and lands dead centre in the olive wreath.“ (140) · `INV_MAX_0010` „… in case anyone wants to reach me. Nobody does. There's been no signal here for four thousand years.“ (129) · `HINT_PIX_0631` „… Take it all. Especially the leafy one.“ (135) · `HINT_PIX_1132` „… and give Ramses the wine. In Egypt it would be juice.“ (137) · `HINT_PIX_1330` „… If the fanners' figs are missing, you will remember there, …“ (134) |
| R5-TX-69 | `W2_HINT_PIX_1131`, `W2_HINT_PIX_0231`, `W2_HINT_PIX_0530`, `W2_STAD_MAX_0255` (EN) | Pixel, Max | kosmetisch | Lokalisierung: Begriffe uneinheitlich | „… in the four boxes.“ / „… ask for an audience.“ / „Crown in the bath …“ / „And she looks like she knows it.“ | Die vier Felder des Paraden-Plans heißen sonst „fields“ (`PARA_ZER_0040_2`, `HINT_PIX_1121`). „Gehör“ ist sonst „a hearing“ (`HIER_MAX_0250`, `HINT_PIX_0221_2`); in der Lösungsstufe sollte das Wort dasselbe sein wie auf der Tafel. Die Wanne ist achtmal „tub“, hier „bath“. Die Schildkröte ist „it“ (`STAD_MAX_0250`, `TAG1_NAR_0060`) und einmal „she“. | „… in the four fields.“ / „You serve the cat and ask for a hearing.“ / „Crown in the tub, cup underneath. Bar in the tub, cup underneath.“ / „And it looks like it knows it.“ |
| R5-TX-70 | `W2_GRAB_PIX_0150_2`, `W2_INV_PIX_0140_2` | Pixel | kosmetisch | Zeichensetzung (DE) | „Ich mache den ganzen Tag dasselbe Geräusch, und werde dafür aus dem Schlafzimmer getragen.“ / „Ich habe keine Flügel, und bin trotzdem immer pünktlich.“ | Komma vor „und“ bei gemeinsamem Subjekt. Fällt auf, weil Pixel sonst druckreif spricht. | Komma streichen: „… dasselbe Geräusch und werde dafür …“ / „Ich habe keine Flügel und bin trotzdem immer pünktlich.“ |

### Raumübergreifend: Wörter und Formeln in Welt 2

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-71 | `W2_INV_PIX_0070`, `0130`, `0140_2`, `W2_BUER_PIX_0360`, `W2_KRON_PIX_0030_2`, `W2_ZURU_PIX_0060_2` (Auswahl) | Pixel | kosmetisch | Regel 8 (Wörter zählen): „trotzdem“ als Gelenk der Pointe | „Ich habe vier Pfoten und entscheide trotzdem schneller.“ / „Er brüllt lauter, und ich gewinne trotzdem.“ / „Flügel an den Füßen und trotzdem immer zu spät.“ // „Ich habe keine Flügel, und bin trotzdem immer pünktlich.“ | „trotzdem“ steht in Welt 1 13-mal, in Welt 2 38-mal (Pixel 20, Max 10), in Welt 3 31-mal. Bei „Pixel auf Mensch“ trägt es drei Pointen hintereinander, und der Hermes-Witz („Flügel und trotzdem zu spät“) steht doppelt (`BUER_PIX_0360`, `INV_PIX_0140`). Das Wort ist unauffällig, der Bau dahinter („hat A und ist trotzdem B“) ist es nicht. | `INV_PIX_0140`: „Flügel an den Füßen, und der Brief kommt am Donnerstag.“ // `_2`: „Ich habe keine Flügel und war noch nie zu spät. Jedenfalls nicht zum Essen.“ `INV_PIX_0130`: „Er brüllt, und ich lege die Ohren an. Er brüllt lauter, und ich lege sie fester an.“ (`_2` bleibt.) EN: „Wings on his feet, and the letter arrives on Thursday.“ // „I have no wings and have never been late. Not for a meal, at any rate.“ / „He yells, and I flatten my ears. He yells louder, and I flatten them harder.“ |
| R5-TX-72 | `W2_SPHX_MAX_0105`, `W2_STAD_MAX_0075`, `W2_TAG1_MAX_0160` | Max | kosmetisch | Regel 6 (Anlauf): „Ich hab (so) das Gefühl“ als Vorausdeutung, dreimal | „Eine Nase, so groß wie ein Bus. Ich hab das Gefühl, die hält nicht mehr lange …“ / „Der Turm steht kerzengerade. Ich hab das Gefühl, der wird später mal berühmt, und zwar aus den falschen Gründen.“ / „Ich hab so das Gefühl, da seh ich sie wieder.“ | Dreimal kündigt Max mit demselben Satzanfang an, was kommt (in Welt 3 noch dreimal). Nase und Turm sind derselbe Gag (Diskus-Folgen); `SPHX_MAX_0100` („Die Nase ist noch dran. Noch.“) macht ihn besser und kürzer. | `STAD_MAX_0075`: „Der Turm steht kerzengerade. Noch.“ (Rückruf auf die Nase.) `TAG1_MAX_0160`: „Hermes' Sandalen sind weg, eine davon Richtung Agora. Die seh ich wieder.“ EN: „The tower stands perfectly straight. For now.“ / „Hermes's sandals are gone, one of them towards the agora. I'll be seeing that one again.“ |
| R5-TX-73 | `W2_NIL_MAX_0670`, `W2_THRO_MAX_0350`; `W2_THRO_MAX_0130`, `W2_BUER_MAX_0030` | Max | kosmetisch | M61 gleicher Bauplan, je zweimal | „… also Papier, bevor es Papier gab.“ / „Das ist Stimmungsbeleuchtung, bevor es das Wort dafür gab.“ · „Das ist echtes Talent.“ / „… und das ist echt eine Fähigkeit.“ | Zwei Formeln von Max, die je zweimal vorkommen: „X, bevor es X gab“ und das anerkennende „Das ist echt(es) Y“ als Schlusssatz. Je eine reicht. | `THRO_MAX_0350`: „Fackeln und Sonnenstrahlen gleichzeitig. Bei uns heißt das Stimmungsbeleuchtung und kostet extra.“ `BUER_MAX_0030`: „Ein Beamter mit Glatze hinter einem Stapel Formulare. Er schläft mit offenen Augen. Das hab ich in Mathe zwei Jahre lang geübt.“ EN: „Torches and sunbeams at once. Back home that's called mood lighting and costs extra.“ / „A bald official behind a stack of forms. He sleeps with his eyes open. I practised that for two years in maths.“ |

### Einschätzung KI-Klang Welt 2

Welt 2 klingt nicht nach KI. Die Figuren haben eigene Stimmen, die Pointen kommen aus der Situation, und kein Satz steht im Erklärton. Es gab für diese Welt noch keinen eigenen KI-Klang-Durchgang (offener Punkt W3-2); das merkt man nicht an einzelnen Sätzen, sondern an Bauplänen, die sich wiederholen. Von 1466 Zeilen sind in 16 Funden rund 30 Zeilen zum Umschreiben benannt, das sind etwa 2 %. Kein Gedankenstrich, kein Kalenderspruch, „junger Mann“ viermal (Grenze eingehalten), „Ich sage nichts“ einmal wörtlich (`FINA_PIX_0140_2`).

| Muster | Suchtreffer | davon Figurenstimme oder in Ordnung | Fund |
| --- | --- | --- | --- |
| M7 Dichotomie („entweder … oder“ als Pointe) | 7 | 1 (Beamter 2) | R5-TX-46, R5-TX-66 |
| M8 Kontrast-Formel („Das ist kein X. Das ist Y.“) | 13 | 9 (Nebet, Sphinx, Beamter, Leonidas; Pixels „Theologie“ und „Krieg“ tragen) | R5-TX-52, R5-TX-55 |
| „A nennt das X, ich nenne es Y“ / „Das nennt man …“ | 12 | 10 | R5-TX-56 |
| Regel 4 Superlativ-Bilanz („das X-ste, das ich je …“) | 7 (Pixel 6, Max 1) | 4 | R5-TX-49, R5-TX-65 |
| M9/M61 Pixels „Hauptwort. Drei Eigenschaften.“ | 7 | 2 (mit Punktwertung) | R5-TX-62 |
| M61 Zuruf-Vergleich („X hat in der Zeit …, du nicht“) | 7 von 10 | 5 | R5-TX-67 |
| M61 Nehmen-Schablone („Ich nehm X mit. Falls jemand …“) | 3 | 1 | R5-TX-53 |
| M62 / Regel 2 zweite Blase erklärt die erste | 2 gemeldet | | R5-TX-50, R5-TX-51 |
| Regel 8 „trotzdem“ als Gelenk | 38 (Pixel 20, Max 10) | die meisten | R5-TX-71 |
| Regel 6 „Ich hab (so) das Gefühl“ | 3 | 1 | R5-TX-72 |
| M61 „X, bevor es X gab“, „Das ist echt(es) Y“ | je 2 | je 1 | R5-TX-73 |
| M45 „(viele) Meinungen haben“ | 2 | 1 | R5-TX-47 |
| „Oder …“ als Kurzsatz | 23 | 20 (Ramses, das ist seine Stimme) | keiner |
| Benutzen-Schablone „Ich X nicht …“ (R5-TX-01) | 6 | 6 | keiner |
| Anlauf „Okay.“ (Max) | 6 | 6 (Jugendsprache, je mit Inhalt danach) | keiner |

### Die zehn schwächsten Zeilen in Welt 2

Gemessen an Welt 2, nicht an schlechten Texten: Die Liste beginnt mit zwei echten Fehlern und endet bei Wiederholungen.

| Nr. | Zeilen-ID | Original | Warum | Umschreibung | Fund |
| --- | --- | --- | --- | --- | --- |
| 1 | `W2_AGOR_TIR_0380` | „Blau. Ein blauer Stift. Er schreibt und schreibt und hat trotzdem schlechte Laune, genau wie ich.“ | Sagt das Gegenteil des Bausteins, den der Spieler daraus mitnehmen soll. | „Blau. Ein blauer Stift. Schreibt und schreibt und bleibt dabei nüchtern. Blau und trotzdem nüchtern, das schafft bei uns keiner.“ | R5-TX-54 |
| 2 | `W2_RING_MAX_0030` (EN) | „Comeback one: … Three: "You quote yourself.“ // „The only one still listening."“ | 171 Zeichen, Zitat über zwei Blasen zerrissen. | Blase 1 nur Konter eins, Blase 2 Konter zwei und drei (siehe Fund). | R5-TX-63 |
| 3 | `W2_KUCH_PIX_0200_2` | „Das ist die einzige Art zu denken, die ich für wirklich zukunftsfähig halte.“ | Erklärt die Pointe der ersten Blase in Papierdeutsch. | „Dein Großvater denkt in Schrauben. Davon ist noch niemand satt geworden.“ | R5-TX-50 |
| 4 | `W2_TRAI_MAX_0170` | „Ich hab gerade dreimal freiwillig Sport gemacht. Das erzähl ich niemandem.“ | Spricht den Entwicklungsmoment aus, den Pixel eben schon benannt hat. | „Das bleibt unter uns. Das mit dem ‚Noch mal‘.“ | R5-TX-51 |
| 5 | `W2_FAHR_MAX_0010` | „… Ehrlich, das ist der beste Nahverkehr, den ich je gesehen habe.“ | Anlauf plus Superlativ; Max untertreibt sonst. | „Drei Haltestellen, eine Linie, kein Umsteigen. Das krieg sogar ich ohne App hin.“ | R5-TX-49 |
| 6 | `W2_GRAB_CIC_0240` | „Ein Haufen. Das ist entweder sehr alt oder sehr schlecht gemacht. Ich tippe auf Letzteres.“ | Cicero redet im Bauplan von Max. | „Ein Haufen! Ich suche seit Jahren das Grab eines Genies, und man zeigt mir einen Haufen. Der ist nicht alt. Der ist schlecht gemacht.“ | R5-TX-66 |
| 7 | `W2_STOL_MAX_0060` | „… also ist das entweder Sport oder Politik.“ | Entweder-oder zweimal am selben Hotspot. | „… Da oben brüllt jemand. Das wird Sport sein. Oder schon wieder Politik.“ | R5-TX-46 |
| 8 | `W2_GRAB_PIX_0155_2` | „Das war der schönste Moment, den ich bisher in Syrakus erleben durfte.“ | Zweite Superlativ-Bilanz am selben Ort. | „Ich habe sie genossen. Ich hätte gern noch eine.“ | R5-TX-65 |
| 9 | `W2_WERK_MAX_0150` | „Ich nehm den Essig mit. Falls jemand Salat macht. Oder die Zeit zurückdreht.“ | Dieselbe Zeile wie beim Saft, mit demselben Hinweis. | „Essig, eingepackt. Mit Salat rechne ich hier nicht. Eher mit einer Fähre, die rückwärts durch die Zeit fährt.“ | R5-TX-53 |
| 10 | `W2_INV_PIX_0140` / `_2` | „Flügel an den Füßen und trotzdem immer zu spät.“ // „Ich habe keine Flügel, und bin trotzdem immer pünktlich. Zumindest zum Essen.“ | Hermes-Witz doppelt (`BUER_PIX_0360`), zweimal „trotzdem“, Kommafehler. | „Flügel an den Füßen, und der Brief kommt am Donnerstag.“ // „Ich habe keine Flügel und war noch nie zu spät. Jedenfalls nicht zum Essen.“ | R5-TX-71, R5-TX-70 |

### Gut in Welt 2 (Belegzeilen)

- **Ramses** ist die beste neue Stimme: „Tretet näher. Oder bleibt stehen. Nein, näher. Ja. Genau da.“ (`AUDI_RAM_0010`), „Die Wedler sind schon geölt, und bei uns ist das so gut wie ein Schwur.“ (`AUDI_RAM_0390`), und der Schluss „Ich habe mich entschieden. Zum ersten Mal. Es fühlt sich … gut an. Glaube ich.“ (`PARA_RAM_0270_2`). Sein „Oder …“ ist ein Tick, der eine Figur baut, und er bekommt eine Auflösung.
- **Trainings-Szene:** „Noch mal.“ (`TRAI_MAX_0110`) und Pixels „Er hat noch nie ‚noch mal‘ gesagt. Nicht einmal beim Nachtisch.“ (`TRAI_PIX_0140_3`). Der Rückruf im Rede-Ringen („Mein Bein ist eingeschlafen und hat geträumt. Noch mal.“ `RING_MAX_0210`) sitzt.
- **Archimedes:** „Ja! Nein! Moment, ich rechne.“ (`WERK_ARC_0320`), „Drei Dinge. Mehr ist Physik nie.“ (`HEBL_ARC_0010`), „Er hat ihn gefunden. Meinen Stein … Ich stehe direkt daneben. Ich lebe.“ (`GRAB_ARC_0180`), „Hundertsiebenunddreißig Jahre, und keiner lobt die zwei Drittel.“ (`GRAB_ARC_0210`).
- **Beamte:** „Das ist Verwaltung. Dasselbe Wort, nur länger.“ (`BUER_BE2_0280`), „Mein Schalter ist für dich jetzt geschlossen. Für alle anderen auch. Er war nie offen.“ (`ABS_BE1_0240`), „Wir sind fertig miteinander. Verwaltungstechnisch. Menschlich waren wir es nie.“ (`ABS_BE2_0260`).
- **Leonidas** in Großbuchstaben mit Brüchen: „ICH BRÜLLE NICHT! DAS IST MEINE ZIMMERLAUTSTÄRKE!“ (`STAD_LEO_0170`), „MEIN EINTOPF!“ (`FINA_LEO_0050`), „ICH LÜGE NUR EINMAL! AUS PRINZIP!“ (`DISK_LEO_0220`).
- **Pixel:** „Das ist kein Widerspruch. Das ist Theologie.“ (`DUEL_PIX_0320_3`), „Ich verstehe ihn nicht. Ich respektiere ihn auch nicht. Aber vor allem verstehe ich ihn nicht.“ (`INV_PIX_0160_2`), „Alle fünf. Ohne Gnade vom Pharao.“ // „Ich habe nichts hinzuzufügen. Das ist mir noch nie passiert.“ // „Ich werde es trotzdem leugnen.“ (`RING_PIX_0290`).
- **Max:** „Ich hab gerade einen Baum auf Werkseinstellungen zurückgesetzt.“ (`FAHR_MAX_0170`), „Ich hab fünf Sportarten durchgezogen und dafür einen Salat bekommen.“ (`RING_MAX_0280`), „Namen, die keiner mehr liest, wie Profile, die seit Jahren offline sind.“ (`GRAB_MAX_0120`).
- **Tiro** in einer Zeile: „Hier, nimm ihn. Er hat Kratzer, aber das sind Abkürzungen.“ (`DISK_TIR_0280_2`).
- **Bau:** Der Diskus-Diebstahl ist als Logikrätsel sauber getextet (jede Aussage kurz, Fehlversuche begründen die Regel: „Dann hätte ich zweimal gelogen.“). Die Hinweise nennen in Stufe 1 die Lage, in Stufe 3 die Handgriffe, und jede zweite Blase gehört Pixel („Ich bin kein Gegenstand. Mach es trotzdem.“ `HINT_PIX_0130_2`). Die „Gespräch erschöpft“-Zeilen sind durchweg figurengerecht und gehören zum Besten der Welt.

## Welt 3: Funde je Raum

Alle Prioritäten kosmetisch, wenn nicht anders vermerkt. Welt 3 hatte am 20./21.11. einen KI-Klang-Durchgang; die Funde hier sind Reste und Wiederholungen über die Welten, keine Flächenbefunde.

### Unterstadt: Ankunft, Straße, Nudelbude, Mensch-Test, Apothekengasse (`ANK`, `STR`, `NUD`, `TEST`, `APO`, `SOFA`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-74 | `W3_STR_MAX_0035` (mit `0070`, `0260`), `W3_TUER_MAX_0315` (mit `0310`), `W3_KUCH_MAX_0690` | Max | kosmetisch | M7 Dichotomie, in einem Raum dreimal und an einem Hotspot zweimal | „Irgendwer da draußen hat entweder sehr viel Geduld oder eine sehr gute Flatrate.“ / „Die ist entweder sehr beliebt oder sehr vorsichtig.“ / „Entweder kocht unter uns jemand, oder die ganze Stadt schwitzt.“ / „Entweder Agent oder Lehrer am letzten Schultag.“ – „Entweder hat ihm jemand etwas angetan, oder er hat es sich selbst angetan.“ / „Entweder trinkt sie aus der Kanne oder sie erwartet niemanden. Beides passt.“ | Sieben „Entweder … oder“-Pointen von Max in Welt 3 (wie in Welt 2, siehe R5-TX-46), drei davon auf der Straße, zwei beim ersten und zweiten Ansehen von Schmidt. `TUER_MAX_0315` und `KUCH_MAX_0690` standen schon am 20.11. auf der Kandidatenliste. Je Raum eine behalten: `STR_MAX_0070` (Sahra Konner), `TUER_MAX_0310` (Agent oder Lehrer), `SIM_MAX_0300` (Orakel oder Opa). | `STR_MAX_0035`: „Sie klingelt immer noch. So viel Geduld hat sonst nur jemand, der mir was verkaufen will.“ (bereitet `STR_MAX_0335` vor.) `STR_MAX_0260`: „Dampf aus dem Gitter. Unter uns kocht jemand. Oder die Stadt schwitzt.“ `TUER_MAX_0315`: „Rosa Hausschuhe zu einem Cordanzug. Und er trägt beides, als wär's eine Uniform.“ `KUCH_MAX_0690`: „Ein Teller, eine Teekanne, keine Tasse. Wer alles vorher weiß, weiß wohl auch, dass ich keinen Tee mag.“ EN: „Still ringing. The only people that patient are trying to sell me something.“ / „Steam from the grate. Someone's cooking under us. Or the city is sweating.“ / „Pink slippers with a corduroy suit. And he wears both as if it were a uniform.“ / „A plate, a teapot, no cup. If you know everything in advance, you know I don't like tea.“ |
| R5-TX-75 | `W3_BAS_MAX_0800`, `W3_KERN_PIX_0030_2` (mit `W3_STR_PIX_0120`, `W3_BAS_PIX_1040`) | Max, Pixel | kosmetisch | M45 Lehnübersetzung „Meinungen haben“, Regel 8 (höchstens zweimal je Welt) | „Er sieht aus, als hätte er mal Meinungen gehabt.“ / „Wobei das von Oma keine Meinungen hat und nicht von der Decke hängt.“ | Vierter und fünfter Einsatz derselben Wendung in Welt 3 (dazu „Brot mit einer Meinung“ und Piepsis „Meinungen über Kalle“); schließt an R5-TX-16 und R5-TX-47 an. Die beiden Pixel-Zeilen tragen und bleiben. | `BAS_MAX_0800`: „Ein alter Putzroboter mit Hut, in der Ecke, braun vor Rost. Er sieht aus, als hätte er früher viel zu sagen gehabt.“ `KERN_PIX_0030_2`: „Wobei das von Oma nicht redet und nicht von der Decke hängt. Jedenfalls bisher nicht.“ EN: „… He looks like he used to have a lot to say.“ / „Except Grandma's does not talk and does not hang from the ceiling. Not so far, anyway.“ |
| R5-TX-76 | `W3_APO_MAX_0260`, `W3_TERM_MAX_0355` (mit `W3_STR_MAX_0300`) | Max | kosmetisch | M61 gleicher Bauplan: „Die Zukunft / die echte Welt hat also (auch) X“ | „Die Zukunft hat also immer noch Hausmeister.“ / „Die Zukunft hat also auch Vermieter, die nichts reparieren.“ / „Sogar die echte Welt hat also Büros.“ | Dreimal dieselbe Folgerung als Schlusssatz; beide Kandidaten vom 20.11. sind unverändert. Die erste (Hausmeister) bereitet Modell 08/15 vor und bleibt. | `APO_MAX_0260`: „Ein Rohr, das tropft. Im Jahr 2099. Unser Vermieter sagt seit drei Jahren, er kümmert sich. Der hier offenbar auch.“ `TERM_MAX_0355`: „Im Ordner riecht es nach Staub und Kopierer. Genau wie im Sekretariat.“ EN: „A dripping pipe. In 2099. Our landlord has been saying for three years he'll see to it. So has this one, apparently.“ / „The folder smells of dust and photocopier. Just like the school office.“ |
| R5-TX-77 | `W3_STR_PIX_0930` / `_2` | Pixel | kosmetisch | Dublette über die Welten (Zuruf-Reihe, R5-TX-40, R5-TX-67) | „Die Nudeln dampfen, du stehst herum, und ich sitze.“ // „Von uns dreien tut also nur einer etwas Sinnvolles, und es sind nicht die Nudeln.“ | Derselbe Zuruf wie `W2_ZURU_PIX_0010` („Der Fluss fließt, der Sand rieselt, und du stehst.“ // „Zwei von drei Dingen hier bewegen sich …“): drei Dinge, eines davon Max, dann die Abrechnung. In Welt 3 folgen sieben von zwanzig Zurufen dem Vergleichs-Bauplan (`STR_0930`, `APO_0910`, `SIM_0920`, `KUCH_0910`, `BAS_1310`, `EING_0910`, `KERN_0910`); das ist weniger dicht als in Welt 2 und in Ordnung. | „Herr Vier zählt mit, wie lange du schon da stehst. In Vierteln.“ // „Beim vierten Viertel kocht er dir etwas, ob du willst oder nicht.“ EN: „Mr Four is counting how long you have been standing there. In quarters.“ // „At the fourth quarter he will cook you something, whether you like it or not.“ |

### Simulation: Stadtstraße, Tür, Büroturm, Küche der Orakel-Oma, Terminal (`SIM`, `TUER`, `TURM`, `KUCH`, `TERM`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-78 | `W3_TURM_MAX_0620` (mit `W3_BAS_MAX_0825`, `W2_GRAB_MAX_0055`, `W2_INV_MAX_0390`) | Max | kosmetisch | M61 gleicher Bauplan: „X sollte(n) nicht Y.“ als Schlusssatz | „Schmidts Akte. Sie leuchtet grün und summt leise. Akten sollten nicht summen.“ | Vierter Einsatz über zwei Welten: „Grabsteine sollten nicht klappern.“, „Saft sollte nicht ticken.“, „Akten sollten nicht summen.“, „Küchenmaschinen sollten nicht lächeln. Das ist eine Regel.“ Die letzte spielt mit dem Regel-Motiv und bleibt. | „Schmidts Akte. Sie leuchtet grün und summt leise. Ich halt sie lieber nur mit zwei Fingern.“ EN: „Schmidt's file. It glows green and hums quietly. I'd rather hold it with two fingers.“ In Welt 2 genügt eine der beiden (`INV_MAX_0390` bleibt, `GRAB_MAX_0055`: „Ich schüttel den Beutel, und er klappert. Wie eine Spardose, in die keiner was Gutes getan hat.“) |
| R5-TX-79 | `W3_SIM_MAX_0210`, `W3_KUCH_MAX_0600` (mit `W3_STR_MAX_0330`, `W3_HINT_PIX_0020`) | Max | kosmetisch | Regel 6 (Anlauf): „ich hab das Gefühl“, Fortsetzung von R5-TX-72 | „Er zeigt 5:59, und ich hab das Gefühl, er wartet auf jemanden.“ / „Gleich schlägt sie voll, und ich hab das Gefühl, ich sollte dabei sein.“ | Über Welt 2 und 3 siebenmal dieselbe Vorausdeutung, in Welt 3 zweimal an einer Uhr. `STR_MAX_0330` („diesmal ist es für mich“) trägt und bleibt. | `SIM_MAX_0210`: „Ein Nachttisch mit Radiowecker, mitten auf dem Gehweg. Er zeigt 5:59 und wartet. Auf wen, steht nicht dran.“ `KUCH_MAX_0600`: „Eine Kuckucksuhr. Gleich schlägt sie voll. Das will ich sehen.“ EN: „… It says 5:59 and it's waiting. For whom, it doesn't say.“ / „A cuckoo clock. It's about to strike the hour. This I want to see.“ |
| R5-TX-80 | `W3_HINT_PIX_0730` | Pixel | **wichtig** | Regel 10 (Rätselinformation wörtlich), Lösungsstufe | „Die Streifen ansehen, dann den Farbcode nehmen, dann das Terminal mit dem Farbcode benutzen. Danach wechselst du zu mir.“ | Im 50. Stock gibt es keinen Hotspot „Streifen“; das Ding heißt „Farbcode an der Wand“ (`UI_OBJ_FARBCODE_AN_DER_WAND`, Max: „Drei Felder an der Wand“). „Streifen“ heißen die Hotspots im Laboreingang (Warnstreifen) und im Kern. Stufe 3 soll genau sagen, was anzuklicken ist. Englisch ebenso („Look at the stripes“). | „Den Farbcode an der Wand ansehen und abschreiben, dann das Terminal mit dem Zettel benutzen. Danach wechselst du zu mir.“ EN: „Look at the colour code on the wall and copy it down, then use the terminal with the note. After that you switch to me.“ |
| R5-TX-81 | `W3_HINT_PIX_0630_2` | Pixel | kosmetisch | Regel 10, Lösungsstufe ungenau (nur DE) | „Code-Sicht: ‚Original‘ am hintersten Schmidt gegen ‚Kopie‘ an der Tasse tauschen. Dann gehört die Tasse allen.“ | Gemeint ist das Gegenteil: Die Tasse ist danach das Original, und alle hören auf sie. Das Englische sagt es richtig („Then the cup is in charge of everyone.“). | „… Dann hören alle auf die Tasse.“ |

### Realität: Widerstandsbasis, Piepsi, Laboreingang, Suppe (`BAS`, `PIEP`, `EING`, `SUPP`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-82 | `W3_PIEP_MAX_0160` (nach `W3_PIEP_PIX_0150`) | Max | kosmetisch | Regel 2 (letzter Satz bringt Neues), Echo | „‚Der Kern muss weich bleiben.‘ Das klingt nach Weltrettung mit Backanleitung. Typisch Opa.“ | Pixel schließt die Zeile davor mit „Typisch für deinen Großvater.“ Zwei Blasen hintereinander enden mit demselben Urteil. Max' Pointe ist „Weltrettung mit Backanleitung“; danach kommt nichts Neues. | „‚Der Kern muss weich bleiben.‘ Das klingt nach Weltrettung mit Backanleitung.“ EN: „"The core must stay soft." That sounds like saving the world with baking instructions.“ |
| R5-TX-83 | `W3_PIEP_MAX_0230` (mit `W2_INV_MAX_0340`) | Max | kosmetisch | Dublette über die Welten | „Er sieht aus wie ein Eimer, der es zu etwas gebracht hat.“ | Derselbe Vergleich wie bei den Datteln in Welt 2 („Wie Rosinen, die es im Leben zu was gebracht haben.“). Hier kommt dazu, dass „Eimer“ die Pointe von `PIEP_PIX_0180` ist („nennt mich nie wieder Eimer“) und Max das Wort gleich danach benutzt; das ist gewollt und soll bleiben. | „Piepsi. Weiß, rund, Hut, drei Räder. Ich sag nicht, woran er mich erinnert. Er hört mit.“ EN: „Piepsi. White, round, hat, three wheels. I'm not saying what he reminds me of. He's listening.“ |
| R5-TX-84 | `W3_EING_PIX_1040`, `W3_EING_PIX_1030` (mit `W3_ANK_PIX_0050`, `W3_BAS_PIX_1010_2`, `W3_BAS_PIX_1120`, `W3_PIEP_PIX_0150`, `W3_INV_MAX_0020`) | Pixel (einmal Max) | kosmetisch | M9/M61: Schnupper-Formel „[Ding] und [Abstraktum]“ (Fortsetzung von R5-TX-39) | „Zettel, Reißzwecken, Angst.“ / „Die Panzertür riecht nach Stahl und Geheimnis.“ / „Es riecht nach Nudeln, nassem Beton und Zukunft.“ / „Er riecht nach Tee und Panik.“ / „Kuchen und schlechtes Gewissen.“ / „Schmeckt wahrscheinlich nach Erdbeere und Konsequenzen.“ | Der Schnupper-Dreier aus Welt 1 (13) lebt als Paar weiter: ein Ding, dann ein Abstraktum als Pointe. Welt 2 hat sieben (`WERK_PIX_0020` „Genie“, `DISK_PIX_0110` „Eile“, `DISK_PIX_0200`, `INV_PIX_0150` „schlechtem Gewissen“, `INV_PIX_0180` „Pyramide“, `BUER_PIX_0020` „Langeweile“, `INV_PIX_0190` „Feigenhunger“), Welt 3 sieben. „Schlechtes Gewissen“ riecht Pixel bei Tiro und bei Opa. Einzeln gut („Tee und Panik“ ist Kalle in drei Wörtern); am Laboreingang stehen zwei nebeneinander. | `EING_PIX_1030`: „Die Panzertür riecht nach Stahl. Dahinter: Kabel. Kabel riechen nach warm. Lass mich rein.“ `EING_PIX_1040`: „Zettel und Reißzwecken. Hunderte Testpersonen und kein Kuchen. Ich rieche die Enttäuschung. Sie riecht wie Papier.“ `INV_MAX_0020`: „Rot. Die Wahrheit, sagt Morphäus. Schmeckt wahrscheinlich nach Erdbeere. Das wär dann schon die erste Lüge.“ EN: „The armoured door smells of steel. Behind it: cables. Cables smell warm. Let me in.“ / „Slips of paper and drawing pins. …“ / „Red. The truth, says Morphaeus. Probably tastes of strawberry. Which would be the first lie.“ |

### Labor: Testkammern und Kern, Abschluss (`KAM1`, `KAM2`, `KAM3`, `KERN`, `ENDE`)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-85 | `W3_KERN_PIX_0330` (mit `W2_GRAB_PIX_0200_2` / `_3`) | Pixel | kosmetisch | Dublette über die Welten, Regel 4 | „Das ist das Traurigste, was ich je gehört habe. Und ich habe einen Hundekuchen in einer Kekstüte gesehen.“ | Derselbe Witz mit demselben Satz wie am Grab des Archimedes („Das ist das Traurigste, was ich je gesehen habe.“ // „Gleich nach einem leeren Napf.“). Hier antwortet Pixel auf M.U.T.T.I.s stärkste Zeile („Umarmungen sind unhygienisch“); die verdient eine eigene Antwort. | „Keine Umarmungen. Das halte ich genauso. Nur hänge ich dafür nicht an der Decke.“ EN: „No hugs. I keep the same policy. I just do not hang from the ceiling for it.“ |
| R5-TX-86 | `W3_KERN_MUT_0260` (mit `W2_DUEL_PIX_0320_3`) | M.U.T.T.I. | kosmetisch | Dublette über die Welten (Kontrast-Formel; bei M.U.T.T.I. an sich erlaubt) | „Richtig. Du hast gut gelesen. Zucker ist schädlich. Das ist kein Widerspruch. Das ist Ernährung. Meintest du: Gehorsam?“ | Wörtlich derselbe Bau wie Pixels beste Zeile in Welt 2 („Das ist kein Widerspruch. Das ist Theologie.“). Dazu spricht M.U.T.T.I. hier von einem Widerspruch, den an dieser Stelle (Regel 3 zuerst) noch niemand behauptet hat. Als Fingerzeig ist das gewollt; er lässt sich ohne die Formel geben. | „Richtig. Du hast gut gelesen. Zucker ist schädlich. Ich sehe darin kein Problem. Noch nicht. Meintest du: Gehorsam?“ EN: „Correct. You read well. Sugar is harmful. I see no problem with that. Not yet. Did you mean: obedience?“ |
| R5-TX-87 | `W3_KAM3_MAX_0160` (mit `W3_KAM2_MAX_0100`) | Max | kosmetisch | Regel 4 (Superlativ-Bilanz), Kandidat vom 20.11. unverändert | „Bernd schwebt weg. Das Huhn liegt am Boden und quietscht. Die Tür redet. Es ist das schönste Chaos, das ich je verursacht hab.“ | Eine Kammer vorher steht „Das ist der ungefährlichste Spezialeffekt meines Lebens.“ Zwei Bilanzen hintereinander; die Aufzählung davor ist schon die Pointe. | „Bernd schwebt weg. Das Huhn liegt am Boden und quietscht. Die Tür redet. Und das war alles ich.“ EN: „Bernd floats away. The chicken lies on the floor squeaking. The door is talking. And all of that was me.“ |
| R5-TX-88 | `W3_KAM2_MAX_0130`, `W3_KAM1_PIX_0910`, `W3_KUCH_MAX_0740` (mit `W3_NUD_PIX_0060`, `W3_KAM1_MAX_0340`) | Max, Pixel | kosmetisch | Regel 8 (Wörter zählen): „Prinzip“ | „Ich hab's trotzdem nicht angefasst. Aus Prinzip.“ / „Ich hasse es hier aus Prinzip.“ / „… vielleicht aus Prinzip.“ | „Prinzip“ steht in Welt 3 in sechs Zeilen (Welt 1 und 2 je drei), dreimal als Nachklapp „aus Prinzip“. `KAM1_PIX_0910` war am 20.11. Kandidat. Die beiden Witze mit „Prinzipien“ (Herr Vier, Bernd) bleiben. | `KAM2_MAX_0130`: „… Ich hab's trotzdem nicht angefasst. Sicher ist sicher.“ `KAM1_PIX_0910`: „Alles weiß. Alles sauber. Kein Platz zum Schlafen, der nicht aussieht wie ein Test. Ich hasse es hier. Gründlich.“ `KUCH_MAX_0740`: „… Sie hat sie noch nicht weggefegt. Ich glaub, die liegen da als Beweis.“ EN: „… Better safe than sorry.“ / „… I hate it here. Thoroughly.“ / „… She hasn't swept them up yet. I think they're lying there as evidence.“ |
| R5-TX-89 | `W3_TERM_MAX_0270` (mit `W2_TRAI_MAX_0170`, `W2_TRAI_PIX_0180`), `W3_BAS_MAX_0810` (mit `W2_INV_MAX_0455`) | Max | kosmetisch | Dubletten über die Welten | „Ich werde das niemandem erzählen, aber Pixel wird es allen erzählen.“ / „Wir sind quitt.“ | „Das erzähl ich niemandem.“ – „Ich erzähle es allen.“ ist in Welt 2 der Schluss der Trainings-Szene; hier kommt derselbe Wechsel in einem Satz noch einmal. Mit dem Vorschlag in R5-TX-51 löst sich das von selbst; sonst hier ändern. „Wir sind quitt.“ schließt in beiden Welten eine Zweitblick-Zeile (Tintenfisch, Piepsi). | Wenn R5-TX-51 nicht umgesetzt wird: `TERM_MAX_0270`: „Ich war gerade eine Ente. Mit Hoodie. Pixel hat es gesehen. Das war's dann mit meinem Ruf.“ `BAS_MAX_0810`: „Ich schubs ihn an. Er kippt. Ich stell ihn wieder hin. Er hat nichts gemerkt. Hoffe ich.“ EN: „I was just a duck. In a hoodie. Pixel saw it. So much for my reputation.“ / „… He didn't notice. I hope.“ |

### Lokalisierung Welt 3 (Einzelfunde)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original (EN) | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-90 | `W3_BAS_PIX_0970`, `W3_KAM1_PIX_0575`, `W3_ENDE_PIX_0022_2` (und `W3_ENDE_PIX_0020` / `0022`) | Pixel | kosmetisch | Pixel mit Kurzformen (wie R5-TX-33, R5-TX-60); Zwillingszeilen ungleich | „… but at least it's dry back there.“ / „Switch to me and back, and she'll pretend nothing happened.“ / „… and I shan't tell you who.“ | Pixel spricht Englisch ohne Kurzformen; in 856 Pixel-Zeilen der beiden Welten sind das vier Ausreißer (der vierte ist R5-TX-60). Die beiden Schlussvarianten `ENDE_PIX_0020` und `0022` sind im Deutschen gleich gebaut, im Englischen verschieden („You have got it … So we both worked.“ / „You have it … So we both did some work.“). Im Deutschen sagt Pixel in `KAM1_PIX_0575` „als wär nichts gewesen“; sonst „wäre“. | „… but at least it is dry back there.“ / „… and she will pretend nothing happened.“ / „… and I will not tell you who.“ Beide Varianten: „You have it, and I … So we both worked.“ DE `KAM1_PIX_0575`: „… dann tut sie so, als wäre nichts gewesen.“ |
| R5-TX-91 | `W3_BAS_KAL_0040` | Kalle | kosmetisch | Pointe im Englischen verloren | „Kalle. Cable Kalle. Cables, consoles, cups of tea. The cat's been talking the whole time.“ | Deutsch: „Technik, Terminal, Tee. Alles mit T.“ Die Übersetzung baut die Reihe auf C um, lässt aber den Satz weg, der sie zum Witz macht. | „Kalle. Cable Kalle. Cables, consoles, cups of tea. All with a C. The cat's been talking the whole time.“ (97 Zeichen) |
| R5-TX-92 | `W3_EING_PIX_0090` | Pixel | kosmetisch | Übersetzung fällt aus der Spielwelt | „In German, 08/15 means standard, run of the mill.“ | Im englischen Spiel sprechen alle Englisch; „In German“ zeigt auf die Übersetzung. Die Erklärung selbst ist nötig. | „08/15 is an old way of saying standard, run of the mill. It was said of things that did exactly what was expected of them, and nothing else.“ (138 Zeichen) |
| R5-TX-93 | `W3_STR_MAX_0240`, `W3_SIM_MAX_0050`, `W3_KUCH_MAX_0400` (dazu `W2_INV_MAX_0030`, `W2_ABS_BE1_0240`) | Max, Beamter 1 | kosmetisch | Füllwort nur im Englischen („Honestly“) | „Honestly, the city looks better from below than from above.“ / „And honestly, it's … too quiet.“ / „Honestly, that doesn't sound like me at all.“ | In fünf Zeilen setzt das Englische ein „Honestly“ davor, das im Deutschen nicht steht (EN gesamt Welt 2 fünf, Welt 3 sieben). Das ist genau der Anlauf, den Regel 6 im Deutschen gestrichen hat. | Jeweils streichen: „The city looks better from below than from above.“ / „And it's … too quiet.“ / „That doesn't sound like me at all.“ / `W2_INV_MAX_0030` „… So do I.“ / `W2_ABS_BE1_0240` „… It was never open.“ |
| R5-TX-94 | `W3_ABS_ORA_0070`, `W3_KUCH_ORA_0220`, `W3_BAS_PIX_0910` | Orakel-Oma, Pixel | kosmetisch | Anrede und Begriff uneinheitlich (DE und EN) | „Ich hab dir alles erzählt, Junge.“ / „It's the same thing, child.“ / „A biscuit with a note inside.“ | Die Oma sagt sonst „Kind“ (viermal) und im Englischen „dear“ (viermal); „Junge“ ist Deckerts und Ciceros Anrede. Der Glückskeks heißt im Englischen sonst „cookie“ (`BAS_PIX_1160`, `SUPP_MAX_0010`, `EING_HAU_0540`, Hinweise). | „Ich hab dir alles erzählt, Kind.“ / „It's the same thing, dear.“ / „A cookie with a note inside.“ |

### Einschätzung KI-Klang Welt 3

Welt 3 ist die sauberste der drei Welten. Der Durchgang vom 20./21.11. hat gewirkt: keine Erklärblasen, keine Kalendersprüche, kein Gedankenstrich, „junger Mann“ dreimal. Die Nebenfiguren sind über ihre Sprechweise sofort zu erkennen (Schmidt ohne Punkt, Kalle mit „also“, Herr Vier in Zahlen, Deckert in Stakkato, M.U.T.T.I. in Definitionen). Was bleibt, sind Wiederholungen: Baupläne, die Max schon in Welt 2 benutzt, und sechs Pointen, die es fast wörtlich in Welt 2 schon gab. Von 1321 Zeilen sind in 14 Funden rund 25 Zeilen zum Umschreiben benannt, knapp 2 %.

| Muster | Suchtreffer | davon Figurenstimme oder in Ordnung | Fund |
| --- | --- | --- | --- |
| M7 Dichotomie („entweder … oder“) | 7 | 3 | R5-TX-74 |
| M8 Kontrast-Formel („Das ist kein X. Das ist Y.“) | 16 | 15 (Automat 3, M.U.T.T.I., Herr Vier, Kalle; Rest verstreut) | R5-TX-86 (nur als Dublette) |
| M45 „Meinung(en) haben“ | 5 | 2 | R5-TX-75 |
| M61 „Die Zukunft hat also …“ | 3 | 1 | R5-TX-76 |
| M61 „X sollte(n) nicht Y.“ | 2 (Welt 2: 2) | 1 | R5-TX-78 |
| Regel 6 „ich hab das Gefühl“ | 4 | 2 | R5-TX-79 |
| M9/M61 Schnuppern „[Ding] und [Abstraktum]“ | 7 | 4 | R5-TX-84 |
| Regel 4 Superlativ-Bilanz | 4 | 2 | R5-TX-85, R5-TX-87 |
| Regel 8 „Prinzip“ | 6 Zeilen | 3 | R5-TX-88 |
| Regel 8 „trotzdem“ | 31 (Max 16, Pixel 10) | verstreut | keiner (zählt mit bei R5-TX-71) |
| Zuruf-Vergleich | 7 von 20 | 6 | R5-TX-77 (eine Dublette) |
| Dubletten aus Welt 2 | 6 | | R5-TX-77, 83, 85, 86, 89 |
| Benutzen-Schablone „Ich X nicht …“ | 14 roh, 7 echte | 7 (je mit eigener Begründung, über 13 Räume verteilt) | keiner |
| „Ich sage nichts“ (Pixel) | 0 wörtlich, 3 Varianten | 3 (Radio-Moment und Schluss, je Durchlauf höchstens zwei) | keiner, siehe W3-1 unten |

### Die zehn schwächsten Zeilen in Welt 3

| Nr. | Zeilen-ID | Original | Warum | Umschreibung | Fund |
| --- | --- | --- | --- | --- | --- |
| 1 | `W3_HINT_PIX_0730` | „Die Streifen ansehen, dann den Farbcode nehmen, …“ | Lösungshinweis nennt einen Hotspot, den es im Raum nicht gibt. | „Den Farbcode an der Wand ansehen und abschreiben, dann das Terminal mit dem Zettel benutzen. Danach wechselst du zu mir.“ | R5-TX-80 |
| 2 | `W3_KERN_PIX_0330` | „Das ist das Traurigste, was ich je gehört habe. Und ich habe einen Hundekuchen in einer Kekstüte gesehen.“ | Derselbe Witz wie am Grab in Welt 2, an der stärksten Stelle des Kerns. | „Keine Umarmungen. Das halte ich genauso. Nur hänge ich dafür nicht an der Decke.“ | R5-TX-85 |
| 3 | `W3_KERN_MUT_0260` | „… Das ist kein Widerspruch. Das ist Ernährung. …“ | Wörtlich Pixels Theologie-Zeile aus Welt 2. | „… Zucker ist schädlich. Ich sehe darin kein Problem. Noch nicht. Meintest du: Gehorsam?“ | R5-TX-86 |
| 4 | `W3_KAM3_MAX_0160` | „… Es ist das schönste Chaos, das ich je verursacht hab.“ | Superlativ-Bilanz nach einer Aufzählung, die schon die Pointe ist. | „… Die Tür redet. Und das war alles ich.“ | R5-TX-87 |
| 5 | `W3_TUER_MAX_0315` | „Entweder hat ihm jemand etwas angetan, oder er hat es sich selbst angetan.“ | Zweites Entweder-oder am selben Hotspot. | „Rosa Hausschuhe zu einem Cordanzug. Und er trägt beides, als wär's eine Uniform.“ | R5-TX-74 |
| 6 | `W3_APO_MAX_0260` | „… Die Zukunft hat also auch Vermieter, die nichts reparieren.“ | Zweite von drei „hat also“-Folgerungen. | „Ein Rohr, das tropft. Im Jahr 2099. Unser Vermieter sagt seit drei Jahren, er kümmert sich. Der hier offenbar auch.“ | R5-TX-76 |
| 7 | `W3_PIEP_MAX_0160` | „… Das klingt nach Weltrettung mit Backanleitung. Typisch Opa.“ | Schlusssatz wiederholt Pixels Schlusssatz davor. | „… Das klingt nach Weltrettung mit Backanleitung.“ | R5-TX-82 |
| 8 | `W3_STR_PIX_0930` | „Die Nudeln dampfen, du stehst herum, und ich sitze.“ // „Von uns dreien tut also nur einer etwas Sinnvolles, …“ | Zuruf aus Welt 2 mit anderen Hauptwörtern. | „Herr Vier zählt mit, wie lange du schon da stehst. In Vierteln.“ // „Beim vierten Viertel kocht er dir etwas, ob du willst oder nicht.“ | R5-TX-77 |
| 9 | `W3_KUCH_MAX_0690` | „… Entweder trinkt sie aus der Kanne oder sie erwartet niemanden. Beides passt.“ | Entweder-oder und „beides“ in einer Zeile. | „Ein Teller, eine Teekanne, keine Tasse. Wer alles vorher weiß, weiß wohl auch, dass ich keinen Tee mag.“ | R5-TX-74 |
| 10 | `W3_HINT_PIX_0630_2` | „… Dann gehört die Tasse allen.“ | Sagt das Gegenteil des Gemeinten. | „… Dann hören alle auf die Tasse.“ | R5-TX-81 |

### Gut in Welt 3 (Belegzeilen)

- **Schmidt** redet ohne Punkt, und das Spiel macht einen Witz daraus: „Sie haben da gerade einen ganzen Absatz ohne einen einzigen Punkt gesagt.“ – „Punkte sind Pausen, Pausen sind Lücken, und Lücken sind meine Abteilung …“ (`TUER_MAX_0103`, `SCH_0106`). Nach dem Tausch: „Ich … bin eine Kopie, ich fühle mich plötzlich sehr allgemein …“ (`TURM_SCH_0360`).
- **Orakel-Oma:** „Ich habe schon gefegt, für danach.“ (`KUCH_ORA_0940`), „Ungeschick ist einfach Schicksal, das keine Lust hatte, sich vorzustellen.“ (`KUCH_ORA_0220`), „Darum ist es eine Prophezeiung und kein Bericht.“ (`KUCH_ORA_0410`).
- **M.U.T.T.I.:** „Das war nicht persönlich gemeint. Doch.“ (`KAM1_MUT_0160`), „Unter ‚kreativ‘. Das ist bei mir kein Lob.“ (`KAM2_MUT_0120`), „Die Chancen stehen also gut. Für mich.“ (`KAM2_MUT_0270`), und der Schluss „… bin ich keine gute Mutti.“ – „Doch. Ehrlich gesagt: ziemlich normal.“ (`KERN_MUT_0180`, `MAX_0190`). Max untertreibt genau an der Stelle, an der es zählt.
- **Herr Vier:** „Drei ist eine Vier, der etwas fehlt.“ (`NUD_VIE_0030`), „‚Viel‘ ist Faulheit mit Vokalen.“ (`NUD_VIE_0330`), „Ein Koch, der seine vierte Zutat verrät, hat nur noch drei.“ (`SUPP_VIE_0060`).
- **Deckert:** „Maschinen antworten logisch. Menschen antworten.“ (`TEST_DEC_0020`), „Menschlich? Das ist 2026, Junge.“ (`TEST_DEC_0300`), „Die Straße läuft nicht weg. Sie regnet nur.“ (`TEST_DEC_0430`).
- **Hausmeister:** „Ich bin ein Hausmeister. Ich suche nur Dreck.“ (`EING_HAU_0170`), „Das ist mein Satz, Bursche. Aber ich leihe ihn dir gern. Bring ihn sauber zurück.“ (`EING_HAU_1086`).
- **Kalle am Terminal** in Kleinbuchstaben: „übersetzung: ‚ich bin eine katze. rot und grün sind für mich theorie.‘“ (`TERM_KAL_0140`), „übersetzung: ‚quak.‘ nein, moment. das warst du.“ (`TERM_KAL_0290`).
- **Max' Entwicklung** wird nicht ausgesprochen: „Ich weiß nicht, was drüben ist. Das Sofa kenn ich auswendig.“ (`APO_MAX_0600`), „Ich leg mich hin. Zum ersten Mal ist das eine Aufgabe.“ (`BAS_MAX_0560`). Die Sofa-Szene mit den zwei Ohrfeigen („Das war von Opa. Das hier ist von mir.“ `SOFA_PIX_0540`) trägt ohne Kommentar.
- **Pixel** hat in Welt 3 einen neuen Modus für „Pixel auf Mensch“ (kurze Erzählsätze statt Schnupper-Reihe): „Sie hält mich für unhöflich. Der Schirm hält mich für weise.“ (`STR_PIX_1050`), „Er sagt nichts. Die Sonnenbrille sagt auch nichts. Wir haben uns verstanden.“ (`BAS_PIX_1030`). Dazu der Welt-Gag „Pixel ist nass“ (`BAS_PIX_0610_2`) und die Hundekuchen-Kaskade (`BAS_PIX_0090`).

## Stimmen der Figuren

Messwerte aus `tx-b_zaehlen.py sprecher` (Wörter je Satz, Anteil Sätze mit höchstens drei Wörtern). Vergleichswerte für Max, Pixel und Opa aus `tx-a.md`.

| Figur | Woran man sie erkennt | Belegzeilen | Wo sie aus der Rolle fällt |
| --- | --- | --- | --- |
| **Max** (Welt 2: 6,4 Wörter je Satz, 20 % Kurzsätze; Welt 3: 5,6 und 30 %; bei tx-a Prolog 6,8, Welt 1 6,1) | Wie in `tx-a.md`: trocken, untertreibt, Vergleiche aus Schule, Handy, Spielen, nennt nie die Vorlage. In Welt 3 wird er knapper (Aufzählung, dann ein kurzer Satz); das passt zur Welt und zu seiner Entwicklung, die weiter nur in Reaktionen steht. | „Ich winke mit zweien zurück und verliere.“ (`W2_HAFS_MAX_0035`) · „Mitten im Kranz. Mit Beilage.“ (`W2_FINA_MAX_0060`) · „Dieser Turm ist ein Bildschirmschoner, in dem man wohnen muss.“ (`W3_TURM_MAX_0250`) · „Bitte. Ich schreibe einem Kater bitte.“ (`W3_TERM_MAX_0120`) · „Doch. Ehrlich gesagt: ziemlich normal.“ (`W3_KERN_MAX_0190`) | Die Zweizeiler aus Welt 1 („A nennt das X, ich nenne das Y“) sind fast weg. Dafür je Welt sieben „entweder … oder“-Pointen (R5-TX-46, R5-TX-74), die Vorausdeutung „ich hab das Gefühl“ (R5-TX-72, R5-TX-79), zwei Superlativ-Bilanzen (R5-TX-49, R5-TX-87) und „hat also“ (R5-TX-76). Medienvergleiche: 19 Suchtreffer in Welt 2, 16 in Welt 3, nie mehr als drei je Raum; Figur, kein Fund. |
| **Pixel** (Welt 2: 7,0 und 19 %; Welt 3: 6,4 und 26 %; bei tx-a Welt 1 6,7) | Unverändert hochnäsig und ausführlich, zwei Blasen mit „und zwar“ (Welt 2 neunmal, Welt 3 fünfmal), alles führt zu Essen, Wärme, Würde. In Welt 2 kommt der Gott dazu, in Welt 3 die Nässe. Englisch ohne Kurzformen. Der Abstand zu Max im Satzbau ist größer als in Welt 1. | „Götter liegen nicht durch. Sie liegen ein.“ (`W2_DUEL_PIX_0300_3`) · „Ich habe nämlich zwei Ohren, und er hat nur eine einzige Lautstärke.“ (`W2_INV_PIX_0130_2`) · „Ich werde mich nicht beschweren, junger Mann. Ich werde mich äußern.“ (`W3_NUD_PIX_0570`) · „Ich habe für weniger Freundschaften beendet.“ (`W3_BAS_PIX_0090_4`) · „Ich bin das Wetter. Das wollte ich schon immer sein.“ (`W3_BAS_PIX_0600_2`) | Weiter die Figur mit den meisten Bauplänen: „Hauptwort. Drei Eigenschaften.“ (R5-TX-62), Zuruf-Vergleich (R5-TX-67, R5-TX-77), Schnuppern mit Abstraktum (R5-TX-84), Superlativ-Bilanz (R5-TX-65, R5-TX-85), „trotzdem“ (R5-TX-71). Vier englische Zeilen mit Kurzformen in 856 (R5-TX-60, R5-TX-90). |
| **Opa** (nur Botschaften: Papyrus, Hologramm, Portal) | Wie im Prolog: feierlicher Auftrag, der in den Haushalt kippt. | „Fein muss es sein. Fein wie Staub. …“ (`W2_NIL_OPA_0940`) · „Der Kern muss weich bleiben. Außen hart, innen weich. Sonst ist alles verloren.“ // „Und wenn du schon unterwegs bist …“ (`W3_PIEP_OPA_0120`, `0130`) · „Hast du an die Milch gedacht?“ (`W3_KAM1_OPA_0100`) | nirgends |
| **Ramses** (3,2; 68 % Kurzsätze) | Entscheidet sich im Satz um; jede Aussage bekommt ein „Oder“. Am Ende entscheidet er einmal. | „Der Große. Oder der Weise. Siehst du? Jetzt geht es schon wieder los.“ (`W2_AUDI_RAM_0370`) · „Das Finale! Speer, Diskus, Ringen! In dieser Reihenfolge! Oder in einer anderen! In dieser!“ (`W2_FINA_RAM_0010`) · „Ich habe Angst. Für dich. Und vor Worten.“ (`W2_FINA_RAM_0190`) | nirgends |
| **Hofkater** | Pixels Spiegel: dieselbe Würde, nur mit Amt. | „Ein Gott hat eine Opfergabe, ein Gefolge und ein Wunder …“ (`W2_DUEL_HOF_0070`) | nirgends |
| **Schreiber** (5,6) | Müde, sagt die Wahrheit und nimmt sie zurück. | „… also kann er nicht, also will er nicht.“ // „Das hab ich jetzt nicht gesagt.“ (`W2_THRO_SCH_0050`) · „Falsch, aber mutig.“ (`W2_HIER_SCH_0140`) · „… ich hab Feierabend. Seit zehn Jahren.“ (`W2_ABS_SCH_0100`) | nirgends |
| **Fährmann, Steinmetz** | Zwei Handwerker, knapp und geschäftlich. | „Ich weiß nur, wohin der Fluss fließt. Und wann. Und wer zahlt.“ (`W2_ABS_FAE_0010`) · „Komm in einer Stunde wieder. Also: jetzt. Wir sind schnell.“ (`W2_GRAB_STM_0020`) · „Pläne sind gut. Außer verkehrt herum.“ (`W2_GRAB_STM_0070`) | nirgends |
| **Hermes** (4,4; 49 %) | Ausrufe im Laufen, immer zu spät, weiß es. | „Einladungen? Ich! Das kann ich! Zu spät, aber das kann ich!“ (`W2_PARA_HER_0060`) · „Das ist sogar für mich zu spät.“ (`W2_PARA_HER_0070`) · „Der war nur in einem anderen Beutel.“ (`W2_PARA_HER_0340`) | nirgends |
| **Nebet** (6,5) | Köchin, alles wird Topf und Ofen, duldet niemanden im Weg. | „Wedler warten nie, Wedler wedeln.“ (`W2_KUCH_NEB_0520`) · „Jetzt raus aus meiner Küche, bevor du anbrennst.“ (`W2_ABS_NEB_0110`) | nirgends |
| **Sphinx** (5,3) | Schreibblockade, spricht in halben Rätseln, bricht ab. | „Stein weint schlecht.“ (`W2_SPHX_SPH_0480`) · „Ein Käfer? Ein Beamter? Ich … nein. Nein.“ (`W2_SPHX_SPH_0470`) · „In Rätselform wäre es länger. Sei froh.“ (`W2_ABS_SPH_0140`) | Nur im Inhalt: Baustein „blau“ (R5-TX-54). |
| **Archimedes** (4,3; 50 %) | Ausrufe, rechnet mitten im Satz, eitel bei den zwei Dritteln. | „Ja! Nein! Moment, ich rechne.“ (`W2_WERK_ARC_0320`) · „Niemand verbrennt! Fast niemand!“ (`W2_PARA_ARC_0080`) · „Ich bin Erfinder, kein Packesel.“ (`W2_PARA_ARC_0085`) | nirgends |
| **Hieron** (5,4) | König, der wartet und Beweise will. | „Mir reicht ein Beweis.“ (`W2_WERK_HIE_0480_2`) · „Jetzt warte ich. Das kann ich königlich gut.“ (`W2_ABS_HIE_0170`) | Nur die Anrede an ihn (R5-TX-57). |
| **Beamte 1 und 2** (4,2 und 4,4) | Einwortsätze am Schalter (1), Amtslogik mit Stolz (2). | „Nein. Stempel.“ (`W2_BUER_BE1_0550`) · „Niemand hat es je geschafft. Wir sind sehr stolz.“ (`W2_BUER_BE2_0260_2`) · „… steht auf einem Formular, das es nicht gibt.“ (`W2_ABS_BE2_0250`) | nirgends |
| **Cicero** (5,4; 45 %) | Redner in Ausrufen und Wiederholungen, verspricht Kürze. | „Und das Wort gehört mir.“ (`W2_RING_CIC_0010`) · „Kurz. Ich verspreche es: kurz. Also, kürzer.“ (`W2_PARA_CIC_0100`) · „Nicht einmal ich. Besonders nicht ich.“ (`W2_PARA_CIC_0120`) | `W2_GRAB_CIC_0240` klingt nach Max (R5-TX-66). |
| **Tiro** | Räuspert sich, überarbeitet, bricht ab. | „Egal. Vergiss es.“ (`W2_AGOR_TIR_0370_2`) · „Er hat Kratzer, aber das sind Abkürzungen.“ (`W2_DISK_TIR_0280_2`) | Baustein-Zeile (R5-TX-54). |
| **Leonidas** (3,1; 54 %) | Nur Großbuchstaben, bricht mittendrin ins Kleine. | „… ein bisschen. ABER LAUT!“ (`W2_STAD_LEO_0370`) · „MEIN EINTOPF!“ (`W2_FINA_LEO_0050`) | nirgends |
| **Brian, Philosoph in der Tonne, Menge** | Brian will nur seine Ruhe; der Philosoph beleidigt; die Menge sieht überall Zeichen. | „Ich hab seit zwölf Jahren gepackt.“ (`W2_SAND_BRI_0100`) · „Das ist keine Botschaft, das ist nur eine Bitte. Schreib's nicht auf.“ (`W2_ABS_BRI_0220`) · „GEH MIR AUS DER SONNE!“ (`W2_AGOR_PHI_0460`) · „Brot! Und Spiele! Die Spiele hatten wir ja jetzt. Wo bleibt das Brot?“ (`W2_PARA_VOL_0020`) | nirgends |
| **Zeremonienmeister** | Ordnung in Hauptsätzen. | „Und ein Gott kommt zuletzt, immer. Hier ist der Plan, vier Felder. Füll sie.“ (`W2_PARA_ZER_0040_2`) | nirgends |
| **Deckert** (3,6; 53 %) | Noir-Stakkato, erzählt sich selbst, notiert alles. | „Es regnet seit neunundzwanzig Jahren. Ich zähle mit. Jemand muss es ja tun.“ (`W3_TEST_DEC_0010`) · „Nachtragend. Unfair. Gegenüber einem Reptil. Das ist ein Mensch. Weiter.“ (`W3_TEST_DEC_0140`) · „Fälle bleiben immer offen.“ (`W3_ABS_DEC_0040`) | nirgends |
| **Herr Vier** (3,9; 51 %) | Alles ist eine Zahl, und die Zahl ist vier. | „Fünf ist eine Vier, die angibt.“ (`W3_NUD_VIE_0050`) · „Vier Pfoten und ein Schwanz. Das sind fünf. Nein.“ (`W3_NUD_VIE_0660`) · „Vier Sekunden. Drei. Zwei. Gut, du darfst bleiben. Aber schweigend.“ (`W3_ABS_VIE_0060`) | nirgends |
| **Morphäus** (5,3) | Raunt Bedeutendes und nimmt es mit Alltag zurück. | „Ich biete Menschen eine Wahl an. Zurzeit mit eingeschränktem Sortiment.“ (`W3_NUD_MOR_0370`) · „Früher in Lederjacke. Die Strickjacke ist wärmer.“ (`W3_APO_MOR_0300`) · „Ich habe dir die Tür auch schon zweimal gezeigt.“ (`W3_ABS_MOR_0010`) | nirgends |
| **Pastillenautomat** (3,1; 58 %) | Maschinenhöflich, lehnt mit Definitionen ab. Kontrast-Formel ist hier Stimme. | „Kopfschmerzen sind kein Symptom. Kopfschmerzen sind Dienstag. Abgelehnt.“ (`W3_APO_AUT_0060`) · „Man steht davor und ist enttäuscht.“ (`W3_APO_AUT_0150`) · „Nebenwirkungen: Wahrheit, Unbequemlichkeit, gelegentlich Ente.“ (`W3_APO_AUT_0630`) | nirgends |
| **Schmidt, Klone, Türen** (Schmidt 14,1 Wörter je Satz, 9 % Kurzsätze) | Schmidt: ein Satz ohne Punkt, „zu Ihrem Schutz“ (sechsmal in der Welt). Klone: „Wir“. Türen: reden los, sobald sie dürfen. Der Messwert zeigt die Stimme: der einzige Sprecher mit zweistelliger Satzlänge. | „… ich spreche nicht darüber, ich spreche nur über alles andere, und zwar ausführlich“ (`W3_TUER_SCH_0340`) · „Sie wieder, wir wieder, alles wieder“ (`W3_TURM_SCH_0540`) · „Wir haben auch Hausschuhe. Sie waren im Angebot.“ (`W3_TURM_KLO_0120`) · „Niemand hört Türen zu!“ (`W3_KAM3_TUR_0110`) | nirgends; auch das Englische hält die Punktlosigkeit durch. |
| **Orakel-Oma** (4,8) | Antwortet, bevor gefragt wird; kurze Sätze, „Kind“, Küche. | „Du willst dann einen Keks. Nein. Die sind noch heiß.“ (`W3_KUCH_ORA_0010`) · „Zum Nicht-Hergeben.“ (`W3_KUCH_ORA_0140`) · „Nimm einen Keks. Nein. Doch nicht.“ (`W3_ABS_ORA_0080`) | Einmal „Junge“ statt „Kind“ (R5-TX-94). |
| **Kabel-Kalle** (5,0; 41 %) | Flüstert, korrigiert sich mit „also“, am Terminal in Kleinbuchstaben. | „Ungefähr. Nein, genau.“ (`W3_BAS_KAL_0110_2`) · „… Kabel ist nie, also wirklich nie einfach.“ (`W3_BAS_KAL_0370_2`) · „Einmal davon richtig. Rate, welches.“ (`W3_ABS_KAL_0110`) | Englisch verliert „Alles mit T.“ (R5-TX-91). |
| **Hausmeister 08/15** (5,5) | Österreichisch höflich („Servus“, „Bursche“, „habe die Ehre“), Auftragszettel, „Ich komme wieder“. | „Den zweiten Punkt hätte ich erledigt, bitte sehr.“ (`W3_EING_HAU_0050_2`) · „Ich komme wieder. Also: Ich bleibe hier. Aber es klingt besser so.“ (`W3_EING_HAU_0150`) · „Die Richtige war keine. Aber bedankt haben s' sich alle …“ (`W3_ENDE_HAU_0060_2`) | nirgends |
| **M.U.T.T.I.** (4,1; 47 %) | Kurze Aussagesätze, Fürsorge als Drohung, „Zu deinem Besten“ (fünfmal, einmal von Max zurückgegeben), am Ende Sprachassistent. | „Er wird dich nie verlassen. Es sei denn, du lässt ihn. Dann ist es deine Schuld.“ (`W3_KAM1_MUT_0180`) · „Seitdem mache ich die Türen zu. Alle.“ (`W3_KERN_MUT_0300`) · „Meintest du: Gehorsam?“ (`W3_KERN_MUT_0060`) | Nur die Dublette R5-TX-86. |
| **Rebellen, Piepsi, Bernd, Straßenleute** | Je eine Zeile, die sitzt. | „Wir sind der Widerstand. Wir widerstehen. Zum Beispiel dem Drang, die Sonnenbrille abzunehmen.“ (`W3_BAS_REL_0850`) · „Und nennt mich nie wieder Eimer.“ (Piepsi über Pixel, `W3_PIEP_PIX_0180`) · „Ich war für Begleiten gebaut. Nicht für Schalten.“ (`W3_KAM3_BER_0230`) · „Lass stecken. Bleib einfach kurz stehen.“ (`W3_STR_MUS_0170`) | nirgends |

Kurz: Auch in Welt 2 und 3 sind die Nebenfiguren die Stärke; jede ist an einem Satz zu erkennen, in Welt 3 sogar am Satzzeichen. Max redet wie ein Jugendlicher, Pixel wie Pixel, und der Abstand zwischen beiden ist größer als in Welt 1 (Welt 2: 6,4 gegen 7,0 Wörter je Satz, Welt 3: 5,6 gegen 6,4). Was die beiden Hauptfiguren schwächt, sind keine falschen Töne, sondern Baupläne, die über 2787 Zeilen zu oft wiederkommen.

## Anspielungen und Filmzitate

Keine Zeile nennt Titel oder Figur der Vorlage; die Regel aus dem Konzept ist überall eingehalten. „Passt“ heißt: Die Zeile ist auch ohne Kenntnis der Vorlage ein Witz oder eine Beschreibung.

### Welt 2

| Zeile | Vorlage | Passt? | Warum |
| --- | --- | --- | --- |
| `NIL_MAX_0610`, `0615` (Hand im Korn, Rüstung, Geigen) | Gladiator | ja | Max beschreibt nur, was er „mal gesehen“ hat; das Kornfeld ist ohnehin da. |
| `NIL_MAX_0635` (Zeit zurückspulen, Salto) | Prince of Persia | ja | Bereitet die Zeit-Fähre vor. |
| `NIL_MAX_0725` (Dicker mit Streifenhose trägt den Stein heim) | Obelix | ja | Steinmetz-Szene, ohne Namen. |
| `NIL_PIX_0225`, `NIL_FAE_0260`, `ABS_FAE_0020` (Münze unter der Zunge, Obolus) | Charon | ja | Pixel erklärt den Brauch, der Fährmann rechnet damit ab. |
| `THRO_MAX_0230` bis `PIX_0250` | Walk like an Egyptian | ja | Die Retro-Anspielung gehört Pixel, wie im Konzept. |
| `HAFS_PIX_0020` (Sendeschluss, Testbild) | Fernsehen von früher | ja | Pixel; deutet auf Welt 4. |
| `KUCH_MAX_0065` | Ali Baba | ja | |
| `SPHX_MAX_0070`, `0075`, `0570` (Kugel, Hut, Peitsche) | Indiana Jones | ja | Drei Zeilen, verteilt. |
| `SPHX_MAX_0190`, `SPH_0200` | Rätsel der Sphinx (Ödipus) | ja | Die Sphinx ist beleidigt, dass alle es kennen. |
| `KRON_ARC_0130`, `TRAI_ARC_0030`, `WERK_ARC_0440`, `WERK_ARC_0080`, `WERK_ARC_0280`, `PARA_ARC_0350` | Heureka, fester Punkt, „Stör meine Kreise nicht“, Brennspiegel, Kugel und Zylinder, „ein Hebel für die Welt“ | ja | Jedes Zitat wird gebrochen („Also, ich hab gerade keine Kreise.“). |
| `BUER` (Passierschein Vier-Strich-Ypsilon), `INV_MAX_0505` | Asterix erobert Rom | ja | Trägt das ganze Büro-Rätsel. |
| `AUDI_MAX_0110` („Die spinnen, die Griechen.“) | Asterix | ja | Jetzt nur noch einmal. |
| `NIL_HER_0970`, `BUER_HER_0330`, `ABS_HER_0060` | Super Mario („in einem anderen Schloss“) | ja | Weltübergreifender Gag, siehe unten. |
| `AGOR_MAX_0030` bis `0040` (Adler, Heuhaufen) | Assassin's Creed | ja | „Tausendmal gesehen, auf dem Bildschirm“; Pixel landet später im Heu (`SAND_PIX_0150`). |
| `AGOR_MAX_0115`, `AGOR_PHI_0460` | Diogenes („Geh mir aus der Sonne“) | ja | |
| `AGOR_CIC_0350` | Cicero, erste Rede gegen Catilina | ja | |
| `AGOR_GRI_0400` bis `0410`, `RING_MAX_0110`, `CIC_0120`; `SAND_TOU_0020` bis `0040`, `SAND_BRI_0060`, `SAND_GRI_0190` | Das Leben des Brian | ja | Die Römer-Liste wird im Rede-Ringen zum Konter; das ist die beste Verwertung einer Anspielung im ganzen Umfang. |
| `STAD_LEO_0150`, `STAD_MAX_0125`, `STAD_LEO_0230` | 300 | ja | „HEUTE ABEND SPEISEN WIR … ZU HAUSE!“ bricht das Zitat. |
| `TAG1_PIX_0070` | Zenon, Achilles und die Schildkröte | ja | Nur noch einmal. |
| `AUDI_RAM_0310`, `PARA_VOL_0020` | Brot und Spiele | ja | Mit Auszahlung („Wo bleibt das Brot?“). |
| `FINA_NAR_0120` (Sphinx-Nase, Venus von Milo, schiefer Turm) | Wahrzeichen | ja | Vorbereitet in `SPHX_MAX_0100`, `AGOR`, `STAD_MAX_0075`. |
| `TAG1_LEO_0020` | Marathon | ja | |
| `DISK_MAX_0020` („Am Ende war's bestimmt der Butler.“) | Krimi-Klischee | ja | |
| `INV_MAX_0355` („jemand Großes, Grünes“) | Shrek | ja | |
| `GRAB_CIC_0170`, `ARC_0180` | Cicero findet das Grab des Archimedes (historisch) | ja | Die Szene erklärt sich selbst; wer die Geschichte kennt, hat mehr davon. |

### Welt 3

| Zeile | Vorlage | Passt? | Warum |
| --- | --- | --- | --- |
| `ANK_MAX_0040`, Straße, Nudelbude; `NUD_MOR_0230` bis `VIE_0310` („Zwei mal zwei“ – „Vier!“) | Blade Runner | ja | Die Bestellung ist ein Rätsel, das auch ohne Vorlage aufgeht. |
| `TEST_DEC_0100` (Schildkröte auf dem Rücken), ganzer Mensch-Test | Blade Runner, Empathie-Test | ja | Umgedreht: Menschlich ist die unvernünftige Antwort. |
| `STR_MAX_0130` (Origami-Einhorn) | Blade Runner | ja | Reines Bild, niemand erklärt es. |
| `NUD_MOR_0420` (rote und blaue Pastille), `ABS_MOR_0010` („Ich kann dir nur die Tür zeigen“) | Matrix | ja | „Beige vorrätig“ und „auch schon zweimal gezeigt“ brechen den Ernst. |
| `APO_MAX_0110`, `SIM_MAX_0160` bis `0170`, `SIM_PIX_0190` (Katze zweimal) | Matrix, Déjà-vu | ja | Pixel spielt die Störung selbst; dann sieht Max die echte. Aufbau und Auszahlung. |
| `TUER_SCH_0010` („Herr Max“), `TURM_SCH_0030` bis `KLO_0050` („Wir.“), `TURM_MAX_0325` („sagt einer sehr langsam meinen Nachnamen“) | Matrix, Agent Smith | ja | |
| `TURM_NAR_0080`, `MAX_0090`, `0100` (Ausweichen in Zeitlupe, Hexenschuss) | Matrix | ja | Die Pointe gehört Max' Rücken; Rückruf in `INV_MAX_0065`. |
| `KUCH_MAX_0580` bis `0590` (Gabel biegt sich nicht) | Matrix, Löffel | ja | „Ich bin wohl noch nicht so weit.“ |
| `STR_MAX_0030`, `ENDE_NAR_0090` (Telefonzelle) | Matrix, Ausgang | ja | Hier ruft der Werbeblock an. |
| `STR_MAX_0070`, `EING_HAU_0030_2`, `0150`, `0220`, `ENDE_HAU_0070` (Sahra Konner, „Ich komme wieder“) | Terminator | ja | Der Satz wird verliehen („Bring ihn sauber zurück.“) und am Ende wahr. |
| `PIEP_OPA_0120` („Hilf mir, Max. Du bist meine einzige Hoffnung.“), Piepsi und Pixel als Übersetzer | Star Wars | ja | Opas Nachsatz („Und wenn du schon unterwegs bist …“) macht es zu seiner Zeile. |
| `EING_MAX_0160`, `HAU_0170` („Das ist nicht der Junge, den du suchst.“) | Star Wars | ja | Die Antwort („Ich suche nur Dreck.“) funktioniert allein. |
| `KAM1_MUT_0180` (Begleitwürfel), `KAM1_MAX_0070` (Portalgerät), `KAM2_MAX_0140` („DER KUCHEN EXISTIERT NICHT.“), `EING_MAX_0450` | Portal | ja | Eng an der Vorlage, aber mit eigenem Dreh: Regel 2 und 3 machen den Kuchen zum Rätsel. |
| `KAM1_MUT_0510`, `KAM2_MUT_0170`, `0270`, `KAM3_MUT_0310`, `KERN_MUT_0240` | Super Mario („in einer anderen Testkammer“) | ja | Dritte Welt des Gags, siehe unten. |
| `BAS_MAX_0750`, `0755` (Großrechner summt ein Kinderlied, immer langsamer) | 2001 | ja | Leise und ohne Erklärung. |
| `BAS_MAX_0735` (Handtuch, „Keine Panik“) | Per Anhalter durch die Galaxis | ja | Pixel nimmt das Handtuch am Ende mit. |
| `KAM2_MAX_0060`, `PIX_0070` (Gummihuhn mit Seilrolle) | Monkey Island | ja | Pixel rahmt es („Frag nicht. Es war eine andere Zeit.“). |
| `SIM_MAX_0210` bis `0225` (Radiowecker 5:59, dasselbe Lied) | Und täglich grüßt das Murmeltier | ja | |
| `KERN_MUT_0060` („Das habe ich leider nicht verstanden. Meintest du: Gehorsam?“) | Sprachassistenten | ja | |
| `KERN` Logik-Duell (KI scheitert am Widerspruch) | Science-Fiction-Standard | ja | Die drei Regeln sind in der Welt verteilt und müssen gefunden werden. |

Welt 3 ist dicht an Zitaten, aber keines steht nur als Zitat da: Jedes ist Rätselteil, Figur oder bekommt eine eigene zweite Zeile. Nichts zu streichen.

## Running Gags

Fortgeschrieben aus `tx-a.md`.

| Gag | Vorkommen in Welt 2 und 3 | Urteil |
| --- | --- | --- |
| „… in einem anderen Schloss / Büro / einer anderen Testkammer“ | Welt 1: 6. Welt 2: 4 (`NIL_HER_0970`, `BUER_HER_0330`, `BUER_MAX_0340`, `ABS_HER_0060`), dazu „in einem anderen Beutel“ (`PARA_HER_0340`) und „ein anderes Amt“ (`ABS_BE2_0250`). Welt 3: 5 (`KAM1_MUT_0510`, `KAM2_MUT_0170`, `0270`, `KAM3_MUT_0310`, `KERN_MUT_0240`). | Trägt in allen drei Welten und wird jedes Mal anders bezahlt: Toadi löst auf, Hermes findet das Büro, M.U.T.T.I. verliert den Zettel. Max' „Natürlich ist er das.“ (`KAM1_MAX_0520`) zeigt, dass er den Gag kennt, ohne ihn zu nennen. |
| Pixels Wunsch und Einkaufsliste | Welt 2: „Dinge mit Kruste“, „Kruste“ in 10 Zeilen (`NIL_PIX_0620`, `KUCH`, `INV_MAX_0375` bis `PIX_0385`, `ZURU_PIX_0040_2`); Bäckerei-Spur am Sack (`PARA_PIX_0290` bis `0320`). Welt 3: Batterien für den Dosenöffner (`KERN_PIX_0510`), vorbereitet in `W2_KUCH_PIX_0390_2` und `W2_ZURU_PIX_0100_2`. | Trägt. Der Wunsch in Welt 3 kommt spät und in einer Zeile; nach zehn Krusten ist das die richtige Dosis. |
| Radio-Moment (Milch, vergessener Geburtstag) | Welt 2: `WERK_ARC_0200` mit `WERK_PIX_0220`. Welt 3: `KUCH_RAD_0230` („Welttag der vergessenen Geburtstage“), `KUCH_PIX_0250`; dazu Kuckuck (`KUCH_NAR_0615`), Opa im Portal (`KAM1_OPA_0100`), Werbeblock in der Telefonzelle (`ENDE_MAX_0120`). | Trägt und steigert sich: In Welt 3 fragt Pixel offen nach dem roten Kreis, und Max überhört es. „Milch“ in Welt 3 neunmal; das ist viel, aber jedes Mal eine andere Quelle. |
| Opa-Botschaft je Welt | Welt 2: Papyrus „Fein wie Staub“ (`NIL_OPA_0940`), Rückrufe `HEBL_ARC_0150`, `BUER_MAX_0580`. Welt 3: Hologramm „Der Kern muss weich bleiben“ (`PIEP_OPA_0120`), vorbereitet durch die Oma (`KUCH_ORA_0350`). | Trägt. „Weltrettung mit Backanleitung“ sagt, was der Spieler denkt. |
| „junger Mann“ | Welt 2: 4 (`NIL_PIX_0040_2`, `THRO_PIX_0140_2`, `HIER_PIX_0270`, `PARA_PIX_0330_2`). Welt 3: 3 (`NUD_PIX_0570`, `SIM_PIX_0250`, `PIEP_PIX_0010_2`). | Eingehalten. |
| „Ich sage nichts“ | Welt 2: 1 wörtlich (`FINA_PIX_0140_2`), Varianten `HAFS_PIX_0065_2`, `ZURU_PIX_0090_2`. Welt 3: 0 wörtlich, Varianten `KUCH_PIX_0250_2`, `ENDE_PIX_0020_2` oder `0022_2`. | Eingehalten. |
| „freiwillig“ | Welt 2: 4 mit Gewicht (`DUEL_MAX_0110`, `AUDI_MAX_0110`, `TRAI_PIX_0140`, `TRAI_MAX_0170`). Welt 3: 2 (`TEST_DEC_0210`, `APO_PIX_0590` „Du wählst freiwillig das Unbequeme.“). | Trägt; mit R5-TX-51 eine weniger in Welt 2. Die Zeile bei der roten Pastille ist die Auszahlung für Welt 3. |
| „Noch mal.“ | Welt 2: `TRAI_MAX_0110`, `0130`, `HEBL_MAX_0290`, `RING_MAX_0210`. Welt 3: `SIM_PIX_0190` (Pixel zitiert Max). | Trägt; kleinster und bester roter Faden für Max' Entwicklung. |
| „Meine Nase lügt (nie)“ | Welt 2: 5 (`DISK_PIX_0030_2`, `0150_2`, `DISK_MAX_0160`, `INV_PIX_0150_2`, `HINT_PIX_0720_2`); wird zum Rätselteil (Nase lügt bei Fisch). | Trägt; aus dem Gag von Welt 1 wird eine Spielregel. |
| Drei Prozent Akku | Welt 2: 10 Zeilen, von `NIL_MAX_0270` bis `PARA_MAX_0240` („Und zum Schluss: drei Prozent Akku. Taschenlampe an.“). | Trägt; ist Baustein, Gag und Schlussbild. |
| Wahrzeichen (Nase, Arme, Turm) | Aufbau `SPHX_MAX_0100` („Noch.“), `AGOR`, `STAD_MAX_0075`; Auszahlung `FINA_NAR_0120`; Nachklang `AGOR_MAX_0070`. | Trägt. |
| Pixel ist nass | Welt 3: „nass“ in 23 Zeilen, vom ersten Satz bis „Nass rein, nass raus.“ (`ENDE_PIX_0130`); Motto in `BAS_PIX_0610_2`. | Trägt; der Welt-Gag für Pixel, mit dem Handtuch als Auszahlung. |
| Siebenundvierzig | Welt 3: 10 (Sahra Konner, Omas Liste, Testperson 47). | Trägt; die Zahl verbindet drei Räume, ohne dass es jemand erklärt. |
| „Zu deinem Besten“ / „Zu Ihrem Schutz“ / „Ich komme wieder“ / „Meintest du: Gehorsam?“ | je 6, 6, 4 (dazu Max einmal), 6 | Figurenformeln; jede gehört einer Figur und wird einmal gebrochen (Max: „Zu meinem Besten.“, „Zu seinem Schutz.“). |
| Der Staubsauger, Pixel wird getragen | Welt 2 je 1 (`STAD_PIX_0320_2`, `GRAB_PIX_0150_2`), Welt 3 je 1 bis 2 (`STR_PIX_0230_2`; `APO_PIX_0620`, `BAS_KAL_0340`) | Trägt, sparsam. |
| Pixels „Hauptwort. Drei Eigenschaften.“ und Schnuppern mit Abstraktum | Welt 2: 7 und 7. Welt 3: 2 und 7. | Kein Gag, ein Bauplan (R5-TX-62, R5-TX-84). In Welt 3 schon seltener. |
| Zuruf-Vergleich | Welt 2: 7 von 10. Welt 3: 7 von 20. | Bauplan (R5-TX-67, R5-TX-77). |
| „beides“ | Welt 2: 6 Zeilen, davon 3 als Schlusspointe. Welt 3: 8, davon 4. | Weiter an der Grenze (R5-TX-15); gemeldet nur in R5-TX-74 (`KUCH_MAX_0690`). |
| „Endlich jemand / etwas, der / das …“ | Welt 2: 11 Zeilen mit „endlich“, 6 im Bauplan. Welt 3: 12, davon 5 (`STR_PIX_0090_2`, `TURM_MAX_0285`, `BAS_PIX_0170`, `APO_PIX_1010`, `EING_PIX_1010`). | Fortsetzung von R5-TX-41. Noch kein eigener Fund; beim nächsten Durchgang mitzählen. |

## Lokalisierung, Zusammenfassung

- **Fehlend oder leer:** keine Zeile. Englisch gleich Deutsch nur bei `W2_TAG1_LEO_0020` / `0040` („MARATHON!“) und `W3_KAM1_MAX_0190` („Hi, Bernd.“); beides richtig.
- **Länge:** Deutsch nie über 140 Zeichen (Welt 2 im Schnitt 79, Welt 3 84). Englisch im Schnitt kürzer (74 und 79). Über 140: Welt 2 elf Zeilen (R5-TX-63, R5-TX-68), Welt 3 keine.
- **Blasen ungleich geteilt:** `W2_RING_MAX_0030` (R5-TX-63, wichtig), `W2_GRAB_MAX_0090`, `W2_DISK_MAX_0310` (R5-TX-64), `W2_AGOR_GRI_0410` (R5-TX-58). In Welt 3 keine.
- **Rätselhinweis im Englischen:** Der Baustein „blau“ stimmt in beiden Sprachen nicht mit der Quelle überein (R5-TX-54). `W3_HINT_PIX_0730` nennt in beiden Sprachen den falschen Hotspot (R5-TX-80). Sonst sind alle Hinweise der Stufe 3 im Englischen gleichwertig; `W3_HINT_PIX_0630_2` ist im Englischen sogar genauer als im Deutschen (R5-TX-81).
- **Pointe verloren:** `W3_BAS_KAL_0040` (R5-TX-91). Kleiner: `W3_EING_PIX_0090` („In German“, R5-TX-92).
- **Begriffe:** „starting pass“ gegen „entry pass“ (R5-TX-59); „boxes“, „audience“, „bath“, „she“ (R5-TX-69); „child“ gegen „dear“, „biscuit“ gegen „cookie“ (R5-TX-94).
- **Stimme:** Pixel englisch ohne Kurzformen in 852 von 856 Zeilen (R5-TX-60, R5-TX-90). Füllwort „Honestly“ fünfmal ergänzt (R5-TX-93). Max einmal steif (`W2_BUER_MAX_0375`, R5-TX-59).
- **Zeichen:** einmal „...“ statt „…“ (R5-TX-61).
- **Lehrbuch-Englisch:** in beiden Welten nicht gefunden. Das Englische ist britisch und gesprochen („bum bag“, „nicks a car“, „Put my back out“, „knocked off“).
- **Gut lokalisiert:** „M.O.T.H.E.R.“; „grave gravel“ für „Grabschotter“ (`W2_GRAB_MAX_0050`); „laziness with vowels“ (`W3_NUD_VIE_0330`); „It really does set.“ für „Er steht dann wirklich.“ (`W3_PIEP_KAL_0280`); „my memory goes back nineteen years“ für „ich denke seit neunzehn Jahren“ (`W3_EING_HAU_0130_2`); „Sounds like an oven setting.“ für die „Backzahl“ 405 (`W2_PARA_PIX_0290`); „In boxes.“ für „In Zellen.“ (`W3_HINT_PIX_0810`); der Hausmeister mit „Servus, lad“ und „if you please“; Schmidt auch englisch ohne Punkt.

## Frühere Funde Welt 2 (Review 17.11.), Stand heute

| Früher | Stand heute |
| --- | --- |
| ND-01 Zeilen über 140 Zeichen | DE behoben (0 über 140). EN: 11 Zeilen über 140 (Liste folgt unter Lokalisierung). |
| ND-04 Platzhalter Hieroglyphen | behoben (`HIER_SCH_0120` ohne Platzhalter, neue `0125`). |
| ND-05 „anderes Büro“ zu oft | weitgehend behoben (`NIL_HER_0910`, `AUDI_RAM_0100` ohne). Verbleibend `NIL_HER_0970`, `BUER_HER_0330`, `BUER_MAX_0340`, `ABS_HER_0060`, dazu die Abwandlungen `PARA_HER_0340` („in einem anderen Beutel“) und `ABS_BE2_0250` („ein anderes Amt“); das ist Aufbau, Auszahlung und Variation und in Ordnung. |
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
| ND-19 „seit Welt eins“ | behoben (`INV_MAX_0060`: „seit Schwurbelstein nervös“). |
| ND-21 Anrede „Ihr“ | offen, siehe R5-TX-57. |

## Frühere Funde Welt 3 (Review 20.11.), Stand heute

| Früher | Stand heute |
| --- | --- |
| W3-1 „Ich sage nichts“ zu oft | wörtlich nicht mehr vorhanden. Varianten: `KUCH_PIX_0250_2` („Dann sage ich auch nichts.“, Radio-Moment) und der Schluss `ENDE_PIX_0020_2` / `0022_2` („ich werde dir nicht sagen, wer“, nur eine der beiden wird gespielt). Zwei je Durchlauf, damit innerhalb der Regel. Erledigt. |
| Kandidat `KAM1_PIX_0910` („aus Prinzip“) | unverändert, siehe R5-TX-88. |
| Kandidat `KAM3_MAX_0160` (Superlativ) | unverändert, siehe R5-TX-87. |
| Kandidaten `TUER_MAX_0315`, `KUCH_MAX_0690` (Entweder-oder) | unverändert, siehe R5-TX-74. |
| Kandidaten `APO_MAX_0260`, `TERM_MAX_0355` („hat also“) | unverändert, siehe R5-TX-76. |
| Kandidat `EING_PIX_1040` („Zettel, Reißzwecken, Angst.“) | unverändert, siehe R5-TX-84. |
| Kandidat `SIM_PIX_0250` („kein Déjà-vu mehr … Das ist ein Abo“) | unverändert. Als einzige „kein X mehr, das ist Y“-Zeile der Welt und als Errungenschafts-Text vertretbar; kein Fund. |
| Kandidaten `KERN_MAX_0555`, `KERN_MAX_0570` | unverändert und in Ordnung („Als würde eine Warnung sich entschuldigen.“ ist eine der schönsten Ansehen-Zeilen). Kein Fund. |
| ND-19 Englisch (Hausmeister, Hexenschuss) | behoben: `ABS_HAU_0130` „Servus, lad.“, `TURM_MAX_0100` „Put my back out.“, Hausmeister durchgehend „Servus“, „lad“, „if you please“. |
| ND-21 `KERN_MAX_0590` (Ersatzpointe) | behoben, Text passt zu beiden Lösungswegen. |
| ND-16 Pixel-Kaskaden | `BAS_PIX_0090` hat vier Blasen (Hundekuchen); das ist die eine Stelle, an der die Länge der Witz ist. In Ordnung. |
| ND-18 Kuckuck als Erzähler | `KUCH_NAR_0615` („Milch! Milch! Milch!“) trägt weiter den Schlüssel `NAR`; laut Regie ist es eine Sprechblase an der Uhr. Am Text nichts zu ändern; ob die Blase an der Uhr sitzt, wurde nicht geprüft. |
| ND-03 Morse-T | Text steht („‚Miiiau‘ heißt T.“ `PIEP_MAX_0220_2`); ob Tabelle und Animation dazu passen, wurde nicht geprüft. |
| W3-11 Regen drinnen | Text unverändert (`BAS_PIX_0650`: „Drüben regnet es jetzt, und zwar drinnen.“). Ob der Effekt im Spiel zu sehen ist, wurde nicht geprüft. |
| W3-2 Welt 2 ohne KI-Klang-Durchgang | weiterhin offen; die Funde R5-TX-46 bis R5-TX-73 sind die Liste dafür. |

## Gut gelöst

- **Die Texte tragen.** Auf 2787 Zeilen kommen 49 Funde, davon drei wichtige, kein kritischer. Kein Fund betrifft eine Szene als Ganzes.
- **Entwicklung ohne Rede:** „Noch mal.“ in Welt 2 und die rote Pastille in Welt 3 („Das Sofa kenn ich auswendig.“) zeigen Max' Weg in je einem Satz. Die Oma sagt es voraus („Du wirst aufstehen und etwas holen, ohne dass dich jemand bittet.“ `W3_KUCH_ORA_0390`), Max wehrt ab; mehr braucht es nicht.
- **Rätseltexte:** Diskus-Diebstahl, Hieroglyphen, Paraden-Plan, Mensch-Test und Logik-Duell sind so getextet, dass Fehlversuche die Regel erklären und selbst Pointen sind („Die Pflanze ist jetzt das Original. … Die Pflanze lässt sich Zeit.“ `W3_TURM_MAX_0520`). Die Fehltausch-Zeilen der Code-Sicht gehören zum Besten in Welt 3.
- **Hinweise:** dreistufig, Lage vor Handgriff, mit Pixel-Stimme in der zweiten Blase. Zwei Ungenauigkeiten in 199 Hinweiszeilen (R5-TX-80, R5-TX-81).
- **„Gespräch erschöpft“** in beiden Welten: 42 Zeilen, jede in der Stimme der Figur, keine Schablone.
- **Rückrufe über die Welten:** Olivenöl aus Welt 2 ölt den Hausmeister (`W3_EING_MAX_0240`), Hermes' Sandale gibt einen dritten Tausch (`W3_KAM3_MAX_0270` „Du hast endlich mal was pünktlich geliefert.“), Deckerts Regenzählen kommt bei Pixel wieder (`W3_BAS_PIX_1330_2`).
- **Frühere Funde** sind zum größten Teil sauber behoben (Tabellen oben); die Längenprüfung im Deutschen hält.

## Nicht geprüft

- Das Spiel wurde nicht gestartet. Ob Zeilen an der richtigen Stelle fallen, ob Blasen überlaufen und ob Animation und Regie zum Text passen, ist nicht geprüft.
- Bilder, Ton und Vertonung: nicht geprüft. „Laut gelesen natürlich“ ist ein Urteil am Text.
- `docs/skript/welt-2.md` und `welt-3.md` wurden nur für die Regiespalte im Auszug benutzt, nicht Zeile für Zeile mit der CSV verglichen.
- Die Lint-Skripte von humanizer-de wurden nicht ausgeführt; der Katalog diente als Musterliste (Kurzreferenz und die dialogrelevanten Blöcke von `patterns.md`).
- `UI_`- und `SYS_`-Zeilen gehören zu `tx-a`; nachgeschlagen wurden nur die Sphinx-Bausteine und der Hotspot-Name „Farbcode an der Wand“.
- Englisch wurde von einem Nicht-Muttersprachler beurteilt. Die englischen Vorschläge sollten vor dem Einbau von jemandem mit britischem Englisch gegengelesen werden.
- Historische und sachliche Richtigkeit (Jahreszahlen der Fähre, Kurzschrift des Tiro, Morse) wurde nicht geprüft.
- Die Zählungen sind Suchtreffer mit regulären Ausdrücken. Sie können einzelne Formen verfehlen („Meinungen haben“ mit Einschub, gebeugte Formen).

## Vorschläge für die Lessons Learned

- **Pointen-Liste über die Welten führen.** Sechs Pointen aus Welt 2 stehen fast wörtlich in Welt 3 („Das ist das Traurigste …“, „Das ist kein Widerspruch. Das ist …“, „… der es zu etwas gebracht hat“, „Wir sind quitt.“, „erzähl ich niemandem / erzählt es allen“, der Drei-Dinge-Zuruf). Eine Liste der Schlusssätze je Figur, die beim Schreiben einer neuen Welt durchsucht wird, fängt das ab.
- **Baupläne zählen, nicht nur Wörter.** Der KI-Klang-Durchgang für Welt 3 hat Formeln entfernt, aber „entweder … oder“ steht in Welt 2 und 3 je siebenmal bei Max. Die Suche in `tx-b_zaehlen.py muster` zeigt das in Sekunden; sie gehört vor jeden Textdurchgang.
- **Die 140-Zeichen-Prüfung auch für Englisch.** Elf englische Zeilen in Welt 2 liegen darüber, im Deutschen keine. Dazu eine Prüfung, ob Folgeblasen (`_2`, `_3`) in beiden Sprachen etwa gleich lang sind; das hätte `W2_RING_MAX_0030` (69 gegen 171 Zeichen) gefunden.
- **Rätselwörter gegen ihre Quelle prüfen.** Bausteine, Konter und Hotspot-Namen in Hinweisen der Stufe 3 sollten wörtlich in der Zeile vorkommen, aus der der Spieler sie kennt (R5-TX-54, R5-TX-80). Eine Tabelle „Baustein, Quellzeile, Notizbuchtext, Hinweiszeile“ je Rätsel reicht.
- **Pixel englisch ohne Kurzformen als automatische Prüfung** (Apostroph in `_PIX_`-Zeilen außerhalb von Zitaten); vier Treffer in 856 Zeilen.
- **Welt 2 braucht den KI-Klang-Durchgang noch** (W3-2). Er ist kleiner als der für Welt 3: R5-TX-46 bis R5-TX-73 nennen rund 30 Zeilen.

## Werkzeug

- `docs/review/2026-11-21/werkzeuge/tx-b_auszug.py`: schreibt je Raum eine Lesefassung (Schlüssel, Regie aus dem Skript, Deutsch, Englisch, Marken der früheren Reviews). Aufruf: `python3 tx-b_auszug.py ZIELORDNER`.
- `docs/review/2026-11-21/werkzeuge/tx-b_zaehlen.py`: Zählungen je Präfix. Aufruf: `python3 tx-b_zaehlen.py [muster|laenge|sprecher|en] [--ids] W2 W3`. Beide sind Abwandlungen der Werkzeuge von `tx-a` für die Präfixe `W2_` und `W3_`.

## Zusammenfassung in Zahlen

| | Welt 2 | Welt 3 | zusammen |
| --- | --- | --- | --- |
| Zeilen gelesen (DE und EN) | 1466 | 1321 | 2787 |
| Funde | 28 (R5-TX-46 bis 73) | 21 (R5-TX-74 bis 94) | 49 |
| kritisch | 0 | 0 | 0 |
| wichtig | 2 (R5-TX-54, R5-TX-63) | 1 (R5-TX-80) | 3 |
| kosmetisch | 26 | 20 | 46 |
| davon KI-Klang und Baupläne | 16 | 14 | 30 |
| davon Lokalisierung | 8 | 5 | 13 |
| davon Rätseltext, Anschluss, Anrede, Zeichen | 4 | 2 | 6 |
| Zeilen zum Umschreiben (KI-Klang) | rund 30 (2 %) | rund 25 (2 %) | rund 55 |
| EN über 140 Zeichen | 11 | 0 | 11 |
| Anspielungen geprüft | 26 Einträge, alle passen | 20 Einträge, alle passen | 46 |

Einige Funde in der Spalte Welt 3 nennen auch Zeilen aus Welt 2 (R5-TX-78, R5-TX-89, R5-TX-93); gezählt sind sie dort, wo die Änderung vorgeschlagen wird.

FERTIG
