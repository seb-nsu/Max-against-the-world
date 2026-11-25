# Review 21.11.2026 (Fortsetzung 25.11.): Text-Prüfer `tx-a`

Rolle: Narrative Designer. Kürzel `tx-a`. Geprüfter Stand: `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s` (= `main` auf `04c5a79f` plus Review-Dateien).

Umfang: alle Zeilen in `game/lokalisierung/texte.csv` mit den Präfixen `P0_` (333), `ZS1_` (110), `ZS2_` (87), `ZS3_` (112), `SYS_` (108), `UI_` (965), `W1_` (1433), jeweils Deutsch und Englisch. Zusammen 3148 Zeilen.

Geprüft wird: Humor und Ton, eigene Stimme je Figur, KI-Klang jeder Dialogzeile (Prüfkatalog humanizer-de), Anspielungen und Filmzitate, Lokalisierung DE/EN, rote Fäden und Running Gags. Es wird nur gelesen und dokumentiert; es wurde nicht gespielt.

## Zählung (wird nach jedem Block nachgeführt)

| Präfix | gelesen | von |
| --- | --- | --- |
| P0_ | 333 | 333 |
| ZS1_ | 0 | 110 |
| ZS2_ | 0 | 87 |
| ZS3_ | 0 | 112 |
| W1_ | 0 | 1433 |
| SYS_ | 0 | 108 |
| UI_ | 0 | 965 |

## Stand

- [x] Auftrag, humanizer-de, Rolle, Konzept, Skripte, Rätsel, frühere Reviews gelesen
- [x] Prolog
- [ ] Zwischenspiele 1–3
- [ ] Welt 1
- [ ] SYS, UI
- [ ] Auswertung (Stimmen, Anspielungen, Running Gags, Lokalisierung, Top 10)

Vorgänger `nd-a.md`: enthält nur Kopf und Arbeitsplan, keine Funde. Es gibt nichts zu übernehmen außer dem Auszugs-Werkzeug.

## Arbeitsweise

- Prüfkatalog: humanizer-de 5.28.4 (`SKILL.md`, Kurzreferenz aller 72 Muster und die für Dialog einschlägigen Blöcke in `references/patterns.md`, `de-naturalness.md`, `decision-tables.md`, `register-profiles.md`, `quality-rubric.md`, `docs/muster-katalog.md`). Nur als Audit angewandt: Cluster-Regel (ein einzelnes Signal ist kein Fund), Ausnahme für Figurenstimmen. Musternamen: „M8“ usw. = Nummer in humanizer-de; wo der Katalog nichts hat, gilt der Name aus Sebastians Liste oder aus den zehn „Humanizer-Regeln für Couch-Quest-Dialoge“ (`docs/review/2026-11-20/notizen/skript-humanizer.md`, Ende), z. B. „Kommentar-Schwanz“ (dort §2, im Katalog M62 Schließzwang).
- Lesefassung je Raum mit Sprecher und Regie: `werkzeuge/tx-a_auszug.py` (aus `nd-a_auszug.py`, erweitert um ZS2/ZS3 und eine Marke, ob die Zeilen-ID in einem früheren Review vorkommt). Jede Zeile DE und EN gelesen.
- Zählungen: `werkzeuge/tx-a_zaehlen.py` (`muster`, `sprecher`, `laenge`, `en`). Zählungen sind Rohtreffer; Fund wird nur, was beim Lesen als Häufung oder als Bruch der Figur auffällt.
- Frühere Arbeit an diesen Texten: Prolog am 11.11. auf KI-Muster durchgesehen (24 Zeilen, `entscheidungen.md` Z. 61). Welt 3 und Zwischenspiel 3 am 20./21.11. (AP-07 Stufe 1 und 2). **Welt 1, Zwischenspiel 1 und 2 hatten noch keinen KI-Klang-Durchgang** (offener Punkt W3-2). Review 14.11. (Abschnitt 4 „Witz und Text“, Funde 7, 9, 10, 19, 25, 28) und 17.11. (ND-22 bis ND-24) betreffen meinen Umfang.

## Prolog (`P0_`, 333 Zeilen)

### KI-Klang: Einschätzung

**Gering.** Der Prolog ist der sauberste Abschnitt meines Umfangs; man merkt die Durchsicht vom 11.11. Kein „nicht X, sondern Y“ (0 Treffer), keine Wörter aus der KI-Wortliste (M64: 0), keine Floskeln aus Sebastians Liste („Nun ja“ 0, „Lass uns“ 0, „interessant“ 0, „tatsächlich“ 2, beide unauffällig), 3 Fragmentreihen (alle gewollt: `P0_DACH_PIX_0310`, `OPA_1364`, `OPA_0690`). Die Figuren sind auseinanderzuhalten (Wörter je Satz: Max 6,8, Pixel 7,8, Opa 5,8; Opa mit 34 % Kurzsätzen, Max 18 %).

Was bleibt, ist **ein** mechanisches Muster, und das ist strukturell: Die Benutzen-Zeilen von Max sind nach einem Bauplan geschrieben.

| Muster | Treffer | Urteil |
| --- | --- | --- |
| Benutzen-Schablone „Ich ‹Verb› … nicht. ‹Grund mit Pointe›“ als Erstzeile (M55 gleichförmiger Satzbau, M61 Isometrie) | 20 Zeilen, davon 19 der rund 30 Benutzen-Erstzeilen | Fund R5-TX-01 |
| Zweitzeile beginnt mit „Ich hab (doch) …“ | 23 Zeilen von Max | Fund R5-TX-01 (teils schon 14.11., Fund 28) |
| Entweder-oder-Schluss bei Max | 4 (`TREP_MAX_0010`, `DACH_MAX_0620`, `DACH_MAX_0930`, `INV_MAX_0072`) | Fund R5-TX-02 |
| „Bei Opa …“ als Pointenrahmen | 6 bei Max | im Rahmen (Figurenbezug), zwei gleiche Schlüsse siehe R5-TX-02 |
| „und zwar“ | 7 | Fund R5-TX-03 |
| „ziemlich sicher“ / „seit ich denken kann“ | 3 / 2 | Fund R5-TX-03 |
| Ein-/Zwei-Wort-Nachklapp am Zeilenende | 18, davon deutend nur `DACH_MAX_0210` („Respekt.“) | kein Fund |
| Kontrast-Formeln (M8) | 0 echte | kein Fund |
| Gedankenstrich (M16) | 1 als Abbruch (`DACH_MAX_0870`), 1 im Kalendertext | R5-TX-09 |

### Funde Prolog

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-01 | `P0_DACH_MAX_1610`, `1620`, `1630`, `1640`, `1670`, `1680`, `1700`, `1710`, `1720`, `1820`, `1840`; `P0_TREP_MAX_0040`, `0120`, `0140`, `0180`; `P0_WOHN_MAX_0200`, `0320`, `0360`; Zweitzeilen `P0_DACH_MAX_1615` bis `1745`, `P0_TREP_MAX_0045` bis `0185` | Max | wichtig | Gleichförmiger Satzbau (M55/M61); zum Teil weiterhin offen (14.11., Fund 28: „44 Zweitzeilen beginnen mit ‚Ich hab …‘“) | „Ich wühl nicht in Opas Werkzeug. Da drin beißt garantiert irgendwas.“ / „Ich steck da kein Brot rein. Ich will nicht schuld sein, wenn er abhebt.“ / „Ich schalte den nicht ein. Pixel würde mir das …“ / „Ich leg die nicht auf. …“ / „Ich setz mich da nicht rein. …“ | Jede einzelne Zeile ist gut. Zusammen sind sie eine Vorlage: Erstes Benutzen = „Ich X nicht“ plus Begründung (19 von rund 30), zweites Benutzen = „Ich hab doch X, und dann Y“ (23). Wer auf dem Dachboden der Reihe nach alles anfasst, hört elfmal hintereinander denselben Satzanfang. Das ist die Stelle im Prolog, die nach Baukasten klingt, und sie liegt in den ersten zehn Spielminuten. | Je Raum höchstens jede dritte Benutzen-Zeile mit „Ich … nicht“ beginnen; sonst mit der Sache oder der Folge anfangen. Pointen bleiben. Beispiele: `1610` „Da drin beißt garantiert irgendwas. Meine Finger bleiben draußen.“ · `1640` „Der guckt so vorwurfsvoll, als hätte ich ihn ausgestopft. Den fass ich lieber nicht an.“ · `1670` „Brot hab ich eh keins dabei. Und wenn er abhebt, will ich nicht schuld sein.“ · `1680` „Wenn ich den einschalte, hält Pixel mir das bis an sein Lebensende vor.“ · `1700` „‚Schlager für Erfinder‘. Der Titel reicht mir als Warnung, die Platte bleibt, wo sie ist.“ · `TREP_0140` „Mäntel sind für Leute, die freiwillig rausgehen. Ich bleib im Hoodie.“ · Zweitzeilen: `1685` „Der Schalter hat zurückgeguckt. Ich schwör's.“ · `1725` „Eine Schraube angezogen, und hinten fällt was um. Das war bestimmt Zufall.“ |
| R5-TX-02 | `P0_TREP_MAX_0010`, `P0_DACH_MAX_0930`, `P0_INV_MAX_0072` (dazu `P0_DACH_MAX_0620`, bleibt) | Max | kosmetisch | Entweder-oder-Schluss (Regel-Nr. 5 aus `skript-ki-klang.md`; M7 Dichotomie) | „Am Band steckt eine Feder, entweder vom Fasan oder aus dem Kopfkissen. Bei Opa ist beides möglich.“ / „Entweder hat Opa einen sehr breiten Geschmack, oder er hat Reisepläne.“ | Viermal dieselbe Mechanik in 208 Max-Zeilen: zwei Deutungen anbieten, offenlassen. `0620` trägt den Hinweis auf den Geburtstag und soll bleiben. Dazu endet `TREP_0010` wie `INV_MAX_0055` („Bei Opa ist das alles dasselbe“). | `TREP_0010`: „Opas Hut. Am Band steckt eine Feder. Fasan, sagt Opa. Das Kopfkissen im Gästezimmer hat seitdem ein Loch.“ · `DACH_0930`: „Ein Poster mit einer Pyramide und eins mit einer Neonstadt. Opa fährt nie in den Urlaub. Der plant was.“ (Vorausdeutung auf Welt 2 und 3 bleibt) · `INV_0072` kann bleiben, wenn die beiden anderen geändert sind. |
| R5-TX-03 | `P0_WOHN_MAX_0020`, `1220`, `P0_TREP_MAX_0110`; `P0_TREP_MAX_0050`, `0110`; „und zwar“: `P0_WOHN_MAX_0140`, `0190`, `P0_DACH_MAX_1740`, `P0_DACH_PIX_1400`, `1170`, `P0_HINT_PIX_0320`, `0320_2` | Max, Pixel | kosmetisch | Wort-Tick (Wiederholung über Figuren; Couch-Quest-Regel 8 „Wörter zählen“) | „Und ich bin ziemlich sicher, dass der auch bloß zur Deko da ist.“ / „Ich bin ziemlich sicher, dass das Physik ist.“ / „… und ich bin mir ziemlich sicher, dass er noch nie draußen war.“; „Das Fenster geht nicht auf, seit ich denken kann.“ / „Der lehnt hier, seit ich denken kann …“ | „ziemlich sicher“ dreimal in den ersten Minuten, „seit ich denken kann“ an zwei Nachbar-Hotspots im Treppenhaus, „und zwar“ siebenmal bei zwei Figuren (bei Pixel passt es zum gestelzten Ton, bei Max ist es Schriftdeutsch). In `HINT_PIX_0320` steht „und zwar“ in beiden Blasen hintereinander. | `TREP_0110`: „Ein Regenschirm. Der lehnt hier schon immer, und draußen war er, glaub ich, noch nie.“ · `WOHN_0140`: „Ein sauberes Rechteck im Staub. Da lag Opas Fernbedienung. Ziemlich lange, so wie das aussieht.“ · `WOHN_0190`: „Ich lass das Bild lieber hängen. Oma merkt, wenn eins schief hängt. Sogar aus dem Urlaub.“ · `HINT_0320_2`: „Der Kreis ist ein anderes Problem. Seins.“ |
| R5-TX-04 | `P0_WOHN_MAX_0355` | Max | kosmetisch | Lokalisierung, DE/EN ungleich; **weiterhin offen (P11 in `offene-punkte.md`)** | DE: „‚Gerät mit Bildschirm, neun Buchstaben‘: Opa hat ‚ZAPPOMAT‘ eingetragen und für den neunten einfach ein Kästchen dazugemalt.“ EN: „‚Device with a screen, eight letters‘: Grandpa wrote ‚ZAPOMATIC‘ and simply drew an extra box for the ninth.“ | Die englische Fassung geht auf (acht Kästchen, neun Buchstaben, eins dazugemalt). Die deutsche nicht: ZAPPOMAT hat acht Buchstaben, bei neun Kästchen bliebe eins leer. | DE: „‚Gerät mit Bildschirm, sieben Buchstaben‘: Opa hat ‚ZAPPOMAT‘ eingetragen und für den achten einfach ein Kästchen dazugemalt.“ |
| R5-TX-05 | `P0_ABS_OPA_0010` | Opa | kosmetisch | Lokalisierung (EN, ungewollter Nebensinn) | EN: „Now I have to get back to tinkering, the future won't screw itself together.“ | „screw itself“ liest sich im Englischen zweideutig; im Deutschen („schraubt sich nicht von allein“) ist nichts davon. | „… the future won't bolt itself together.“ |
| R5-TX-06 | `P0_WOHN_OPA_0042`, `P0_DACH_OPA_1360`, `P0_ABS_OPA_0010` („boy“) gegen `P0_DACH_OPA_1324_2`, `1340` („lad“) | Opa | kosmetisch | Lokalisierung (EN uneinheitlich) | „Science has knees, boy!“ / „Emergency rations, lad.“ | Opas „Junge“ ist im Englischen mal „boy“, mal „lad“. Die Fassung ist sonst britisch (biscuit, colour, aerial, tin). | Durchgehend „lad“ (siehe auch Zwischenspiele). |
| R5-TX-07 | `P0_WOHN_MAX_0040`, `P0_DACH_PIX_1230`, `P0_HINT_PIX_0220`, `P0_DACH_MAX_0282` | Max, Pixel | kosmetisch | Lehrbuch-Englisch; eine Zeile über der 140-Zeichen-Grenze | „I've just found the perfect lying position.“ / „But I have stayed lying down so exemplarily,“ / „He calls it clothing storage.“ / `0282`: 144 Zeichen (DE 131) | Wörtlich übersetzt; kein Muttersprachler sagt „lying position“ oder „clothing storage“. `0282` ist die einzige Prolog-Blase über 140 Zeichen (Grenze aus `tools/pruefen.py`). | `0040`: „Can't science come down? I've only just got comfy.“ · `1230`: „I would help, truly. But I have only just achieved such an exemplary lie-down,“ · `HINT_0220`: „… He calls it his wardrobe.“ / „I call it supplies.“ · `0282`: „Phew, the whole house can smell that. If it doesn't wake Pixel, I'll have to hold the tin right under his nose.“ (110) |
| R5-TX-08 | `P0_DACH_MAX_1130`, `P0_DACH_MAX_0990` | Max | kosmetisch | Anrede des Spielers uneinheitlich | „Ich hab's ausprobiert, damit du es nicht musst.“ / „Die wird, wenn ihr mich fragt, sowieso überbewertet.“ | Max spricht das Publikum einmal mit „du“, einmal mit „ihr“ an. Für die Vertonung eine Entscheidung wert (siehe auch Systemzeilen). | Einheitlich „du“: `0990` „Die wird, wenn du mich fragst, sowieso überbewertet.“ |
| R5-TX-09 | `P0_DACH_MAX_0870` | Max | kosmetisch | Gedankenstrich als Abbruchzeichen (M16; Couch-Quest-Regel 9: Abbrüche mit „…“) | „Ich glaub nicht, dass ich zugestimmt hab –“ | Einziger Gedankenstrich als Satzzeichen im Prolog; alle anderen Abbrüche im Spiel stehen mit „…“. | „… dass ich zugestimmt hab …“ |

### Die zehn schwächsten Zeilen im Prolog

Der Abstand zu den guten Zeilen ist klein; „schwach“ heißt hier Bauplan, nicht schlechter Witz.

| # | Zeile | Original | Umschreibung |
| --- | --- | --- | --- |
| 1 | `P0_DACH_MAX_1610` | Ich wühl nicht in Opas Werkzeug. Da drin beißt garantiert irgendwas. | Da drin beißt garantiert irgendwas. Meine Finger bleiben draußen. |
| 2 | `P0_DACH_MAX_1640` | Ich fass ihn nicht an. Er guckt so vorwurfsvoll, als hätte ich ihn ausgestopft. | Der guckt so vorwurfsvoll, als hätte ich ihn ausgestopft. Den fass ich lieber nicht an. |
| 3 | `P0_DACH_MAX_1670` | Ich steck da kein Brot rein. Ich will nicht schuld sein, wenn er abhebt. | Brot hab ich eh keins dabei. Und wenn er abhebt, will ich nicht schuld sein. |
| 4 | `P0_DACH_MAX_1680` | Ich schalte den nicht ein. Pixel würde mir das bis an sein Lebensende vorhalten. | Wenn ich den einschalte, hält Pixel mir das bis an sein Lebensende vor. |
| 5 | `P0_DACH_MAX_1700` | Ich leg die nicht auf. „Schlager für Erfinder“ ist mir Warnung genug. | „Schlager für Erfinder“. Der Titel reicht mir als Warnung, die Platte bleibt, wo sie ist. |
| 6 | `P0_TREP_MAX_0140` | Ich zieh keinen an. Mäntel sind für Leute, die freiwillig rausgehen, und zu denen gehöre ich nicht. | Mäntel sind für Leute, die freiwillig rausgehen. Ich bleib im Hoodie. |
| 7 | `P0_TREP_MAX_0010` | Opas Hut. Am Band steckt eine Feder, entweder vom Fasan oder aus dem Kopfkissen. Bei Opa ist beides möglich. | Opas Hut. Am Band steckt eine Feder. Fasan, sagt Opa. Das Kopfkissen im Gästezimmer hat seitdem ein Loch. |
| 8 | `P0_DACH_MAX_0930` | Ein Poster mit einer Pyramide und eins mit einer Neonstadt. Entweder hat Opa einen sehr breiten Geschmack, oder er hat Reisepläne. | Ein Poster mit einer Pyramide und eins mit einer Neonstadt. Opa fährt nie in den Urlaub. Der plant was. |
| 9 | `P0_TREP_MAX_0110` | Ein Regenschirm. Der lehnt hier, seit ich denken kann, und ich bin mir ziemlich sicher, dass er noch nie draußen war. | Ein Regenschirm. Der lehnt hier schon immer, und draußen war er, glaub ich, noch nie. |
| 10 | `P0_WOHN_MAX_0355` | „Gerät mit Bildschirm, neun Buchstaben“: Opa hat „ZAPPOMAT“ eingetragen und für den neunten einfach ein Kästchen dazugemalt. | „Gerät mit Bildschirm, sieben Buchstaben“: Opa hat „ZAPPOMAT“ eingetragen und für den achten einfach ein Kästchen dazugemalt. |

### Gut im Prolog (Belegzeilen)

- Max: „Und ich hab einen Balken. Wir leiden beide.“ (`P0_WOHN_MAX_0044`), „Opa hat ‚NEIN‘ eingetragen.“ (`0365`), „Opa hat ihn jeden Tag gegossen. Ich glaube, daran ist er gestorben.“ (`P0_TREP_MAX_0025`), „Opa ruft von oben: ‚Das war die dritte!‘ Es war die zweite.“ (`0065`), „Im Dezember steht bloß ‚Pixel: Lachs‘.“ (`P0_DACH_MAX_1635`). Das sind Beobachtungen mit einer Wendung, keine Formeln.
- Opa: „Zu einem Flugzeug sagst du ja auch nicht Bus.“ (`P0_DACH_OPA_0060`), „Das ist … ein Kreis. Kreise sind wichtig. Sie sind rund. Ja. Genau.“ (`1364`, Ausweichen statt Erklären), „Drüben vergeht die Zeit anders als hier. Hier vergeht sie normal. Also beeil dich trotzdem.“ (`0845`).
- Pixel: „Ich komme nirgendwo mit. Ich werde mitgenommen, und zwar, wenn möglich, getragen.“ (`P0_DACH_PIX_1400`), „Wenn du mich noch einmal so ansiehst, fange ich an zu schnurren. // Das ist eine Drohung.“ (`0215`), „Wenn es brennt, reicht ein Zettel.“ (`1440`).
- Das Wechselspiel sitzt: „Also ja.“ – „Also ja. Aber unter Protest.“ (`P0_DACH_MAX_1402`/`PIX_1404`), „Du hast eben noch auf einem Stromkabel geschlafen.“ – „Auf einem warmen Stromkabel, das ist ein Unterschied.“ (`0362`/`0364`).
- Hinweise: Stufe 3 ist überall eindeutig und trotzdem in der Figur („Ich würde es selbst tun, aber ich habe Pfoten und einen Ruf.“, `P0_HINT_PIX_0230_2`). Der Hinweis auf den Geburtstag liegt dreifach und unaufdringlich (`P0_DACH_MAX_0620`, `PIX_1366`, `PIX_0955_2`).
- Englisch: Pixel ohne Kurzformen („I do not come along. I am taken along …“) gibt ihm auch im Englischen eine eigene Stimme (offener Punkt P10: aus meiner Sicht behalten). „NOPE“ für „NEIN“ (vier Buchstaben) ist sauber gelöst.
