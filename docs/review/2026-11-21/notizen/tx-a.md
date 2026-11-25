# Review 21.11.2026 (Fortsetzung 25.11.): Text-Prüfer `tx-a`

Rolle: Narrative Designer. Kürzel `tx-a`. Geprüfter Stand: `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s` (= `main` auf `04c5a79f` plus Review-Dateien).

Umfang: alle Zeilen in `game/lokalisierung/texte.csv` mit den Präfixen `P0_` (333), `ZS1_` (110), `ZS2_` (87), `ZS3_` (112), `SYS_` (108), `UI_` (965), `W1_` (1433), jeweils Deutsch und Englisch. Zusammen 3148 Zeilen.

Geprüft wird: Humor und Ton, eigene Stimme je Figur, KI-Klang jeder Dialogzeile (Prüfkatalog humanizer-de), Anspielungen und Filmzitate, Lokalisierung DE/EN, rote Fäden und Running Gags. Es wird nur gelesen und dokumentiert; es wurde nicht gespielt.

## Zählung (wird nach jedem Block nachgeführt)

| Präfix | gelesen | von |
| --- | --- | --- |
| P0_ | 333 | 333 |
| ZS1_ | 110 | 110 |
| ZS2_ | 87 | 87 |
| ZS3_ | 112 | 112 |
| W1_ | 1049 | 1433 |
| SYS_ | 0 | 108 |
| UI_ | 0 | 965 |

## Stand

- [x] Auftrag, humanizer-de, Rolle, Konzept, Skripte, Rätsel, frühere Reviews gelesen
- [x] Prolog
- [x] Zwischenspiele 1–3
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

## Zwischenspiele 1–3 (`ZS1_` 110, `ZS2_` 87, `ZS3_` 112 Zeilen)

### KI-Klang: Einschätzung

**Gering**, in Zwischenspiel 1 gering bis mittel. Die drei Szenen sind die besten Dialoge meines Umfangs: echte Wechsel, Figuren weichen aus, statt zu erklären, und die Kuchen-Spur läuft über Gerüche und Versprecher statt über Erklärsätze. Zwischenspiel 3 ist seit AP-07 sauber; was dort bleibt, ist der bekannte Rest W3-1.

| Muster | ZS1 | ZS2 | ZS3 | Urteil |
| --- | --- | --- | --- | --- |
| Kontrast „kein X, das ist Y“ / „nicht X, sondern Y“ / Schwanz „…, nicht Y“ (M8) | 6 (`OPA_0160`, `PIX_0324`, `MAX_0434`, `PIX_0436_2`, `PIX_0454_2`, `PIX_0530`) | 2 (`OPA_0130`, `PIX_0320`), beide tragen | 0 | ZS1: Fund R5-TX-10 |
| Pack-Kommentar nach Schablone „Gegenstand. Wo du hinfährst / Im Fernsehen … Urteil.“ (M55/M61) | 0 (vier verschiedene Anfänge) | 5 × „Wo du hinfährst“ | 9 × „Im Fernsehen“, 2 × „Wo du hinfährst“ | Fund R5-TX-11 |
| „Ich sage nichts“ mit anschließendem Sagen (Couch-Quest-Regel 6) | 1 (`PIX_0140_2`) | 1 (`PIX_0390_2`) | 3 (`PIX_0140_3`, `0480_2`, `0540_2`) | ZS3: weiterhin offen (W3-1), R5-TX-12 |
| Kalenderspruch „Wer X, hat Y“ (M56) | 1 (`PIX_0355_2`) | 0 | 0 | in den zehn schwächsten |
| „Das nennt man / das nenne ich“ | 0 | 2 (`PIX_0592_2`, `PIX_0670_2`) | 0 | in den zehn schwächsten |
| Entweder-oder-Schluss | 1 (`PIX_0600_2`), wird in `ZS2_DACH_PIX_0596_2` aufgegriffen | 0 | 0 | bleibt (Rückruf) |
| Fragmentreihen | 1 | 3 | 4 | alle gewollt (Opas „Dann … Dann … Dann“, Niesen, Zählen) |
| Floskeln aus Sebastians Liste, KI-Wörter (M64), Gedankenstriche | 0 | 0 | 0 | |

Eine Messung, die kein Fund ist, aber zur Stimme gehört: Pixel wird von Abschnitt zu Abschnitt kürzer. Wörter je Satz: Prolog 7,8, ZS1 6,9, ZS2 6,1, ZS3 5,5; Anteil Kurzsätze (höchstens drei Wörter): 15 %, 23 %, 31 %, 34 %. Das liegt an den Pack-Kommentaren („Der Eimer.“, „Ketchup.“, „Gepackt.“). Laut Konzept holt Pixel aus und wird nur für einen Effekt kurz.

### Funde Zwischenspiele

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-10 | `ZS1_DACH_MAX_0434`, `ZS1_DACH_PIX_0436_2`, `ZS1_DACH_PIX_0454_2`, `ZS1_DACH_PIX_0530` | Max, Pixel | kosmetisch | Kontrast-Schablone (M8 negative Parallelismen) | „Das sagt mir keine Uhr, das sagen mir meine Füße.“ / „Meine Pfoten sind für Teppich gebaut, nicht für Burggräben und Ziegenpfade.“ / „… das ist bei deinem Großvater keine Lüge mehr, das ist schon Tradition.“ / „Das ist kein Gepäck, junger Mann, das ist mein Glaube …“ | Fünfmal derselbe Bau in einer Szene, davon `0434` und `0436_2` direkt hintereinander bei zwei Figuren. `ZS1_DACH_PIX_0324` („nicht als Drohung … als Vision“) ist ein Rückruf auf `P0_DACH_PIX_0215_2` und bleibt; Opas `0160` ist Vortragston und bleibt. | `0434`: „Drüben waren es Tage, Opa. Frag meine Füße.“ (Pixels „Meine auch. Alle vier …“ schließt weiter an) · `0436_2`: „Ich bin ein Wohnungskater. Meine Pfoten sind für Teppich gebaut, und drüben gab es drei Tage lang nur Burggraben und Ziegenpfad.“ · `0454_2`: „Zweimal dieselbe Ausrede. Beim dritten Mal trägt er sie als Brauchtum in den Kalender ein.“ · `0530`: „Der Thunfisch bleibt. Über Gepäck lasse ich mit mir reden, junger Mann, über meinen Glauben nicht.“ |
| R5-TX-11 | `ZS2_DACH_PIX_0520_2`, `0560_2`, `0590_2`, `0592`, `0594_2`; `ZS3_DACH_PIX_0520_2`, `0560_2`, `0570_2`, `0580_2`, `0591`, `0592`, `0593`, `0594`, `0596`, `0597`, `0598_2` | Pixel | kosmetisch | Gleicher Satzanfang, gleicher Bauplan (M55/M61) | „Wo du hinfährst, quietscht vieles.“ / „Wo du hinfährst, gibt es Strom.“ / „Wo du hinfährst, fliegt allerdings alles von selbst …“ / „Im Fernsehen leuchtet schon alles von allein …“ / „Im Fernsehen klebt so etwas unter jedem Stuhl …“ / „Im Fernsehen unterschreibt man damit Verträge …“ | Die Pack-Kommentare sollen kryptisch, aber ehrlich sagen, ob sich ein Gegenstand lohnt. In ZS2 und ZS3 tun sie es alle im selben Bau: Name, „Wo du hinfährst“ oder „Im Fernsehen“, Urteil („Dagegen kommt er nicht an.“, „Du würdest also nichts Neues beitragen.“, „Sieben wären dort Verschwendung.“). Wer die Fundkiste durchklickt, hört in ZS3 neunmal „Im Fernsehen“. In ZS1 hat jeder Kommentar einen eigenen Anfang; so sollte es bleiben. | Bei jeder zweiten Zeile den Ort ins Bild ziehen statt voranstellen, Auskunft bleibt: `ZS2_0592` „Der Eimer. In der Zukunft soll es ohne Pause regnen.“ · `ZS2_0594_2` „Die Zukunft leuchtet an jeder Hauswand, in Farben, die es gar nicht gibt. Daneben ist er eine Kerze am Mittag.“ · `ZS3_0592` „Der Leuchttrank. Gegen die Zähne eines Moderators hat er keine Chance, die leuchten von allein.“ (zweite Blase: „Lass ihn hier.“) · `ZS3_0596` „Kaugummi. Unter jedem Stuhl jeder Talkshow klebt seit Jahrzehnten welches.“ · `ZS3_0597` „Der Kugelschreiber. Damit unterschreiben sie drüben Verträge, die keiner gelesen hat.“ |
| R5-TX-12 | `ZS3_DACH_PIX_0540_2` (dazu `0140_3`, `0480_2`) | Pixel | kosmetisch | „Ich sage nichts“-Figur; **weiterhin offen (W3-1 in `offene-punkte.md`)** | „Ich sage nicht, womit. Es steht praktisch daneben.“ | Über alle drei Zwischenspiele ist der Gag gut dosiert (ZS1 einmal, ZS2 einmal), nur ZS3 hat ihn dreimal. `0140_3` („Ich sage nichts. Ich lege es nur hin.“) ist die beste Fassung, `0480_2` („Ich schweige ab jetzt …“) ist die Auflösung des Gags. Übrig ist `0540_2`. | „Das Futter liegt praktisch daneben.“ (Hinweis bleibt, Formel entfällt; damit zwei in ZS3 wie in der Regel) |
| R5-TX-13 | `ZS1_DACH_OPA_0390`, `ZS1_DACH_MAX_0400` | Opa, Max | wichtig | Lokalisierung: Pointe geht im Englischen verloren | DE: „… sonst geht es nicht auf.“ – „‚Aufgehen‘? Du meinst, so wie ein Plan aufgeht. Oder?“ EN: „… or it won't rise.“ – „‚Rise‘? You mean like a plan coming together. Right?“ | „Aufgehen“ ist im Deutschen doppeldeutig (Teig, Plan). „Rise“ heißt nur das Erste; Max' Umdeutung ergibt im Englischen keinen Sinn, und damit fällt die wichtigste Kuchen-Andeutung von ZS1 flach. | Ein Wort nehmen, das für Kuchen und Pläne gilt: Opa: „… I'm not saying more, or it'll fall flat.“ – Max: „‚Fall flat‘? You mean like a plan falls flat. Right?“ – Pixel unverändert („Like a plan. Naturally. How else.“). |
| R5-TX-14 | `ZS1_DACH_OPA_0514` / `ZS2_DACH_OPA_0510`; `ZS2_DACH_OPA_0040`; `ZS1_DACH_OPA_0452`; `ZS1_DACH_MAX_0420`; `ZS1_DACH_OPA_0510` / `ZS2_DACH_OPA_0510` / `ZS2_DACH_MAX_0600` | Opa, Max | kosmetisch | Lokalisierung: Running Gags im Englischen nicht wortgleich; eine Zeile zu lang | „I never throw anything away. Ever.“ gegen „… Never.“ · „A hero, grandson model!“ gegen „model coat hanger“, „The cat, model Pixel“ · „A round appointment.“ · `0420`: 143 Zeichen · „Two free pockets“ / „Two compartments“ / „Two pockets“ | Opas Satz „Ich werfe nichts weg. Nie.“ und seine „Modell …“-Bezeichnungen sind Running Gags und müssen im Englischen jedes Mal gleich gebaut sein. „Runder Termin“ spielt auf den runden Geburtstag an; „round appointment“ sagt im Englischen nichts. `0420` liegt über der 140-Zeichen-Grenze. | Überall „I never throw anything away. Ever.“ · „A hero, model grandson!“ · `0452`: „An occasion. A big round occasion. Hence the circle.“ · `0420`: „Grandpa's lost-and-found box. Anything that won't fit in the bag goes in. He never throws things away. He calls it his archive.“ (128) · „pockets“ durchgehend, passend zu den UI-Texten (siehe System/UI). |

### Die zehn schwächsten Zeilen der Zwischenspiele

| # | Zeile | Original | Umschreibung |
| --- | --- | --- | --- |
| 1 | `ZS1_DACH_MAX_0434` | Drüben waren es Tage, Opa. Das sagt mir keine Uhr, das sagen mir meine Füße. | Drüben waren es Tage, Opa. Frag meine Füße. |
| 2 | `ZS1_DACH_PIX_0454_2` | Zweimal dieselbe Ausrede, das ist bei deinem Großvater keine Lüge mehr, das ist schon Tradition. | Zweimal dieselbe Ausrede. Beim dritten Mal trägt er sie als Brauchtum in den Kalender ein. |
| 3 | `ZS1_DACH_PIX_0436_2` | Ich bin ein Wohnungskater. Meine Pfoten sind für Teppich gebaut, nicht für Burggräben und Ziegenpfade. | Ich bin ein Wohnungskater. Meine Pfoten sind für Teppich gebaut, und drüben gab es drei Tage lang nur Burggraben und Ziegenpfad. |
| 4 | `ZS1_DACH_PIX_0530` | Der Thunfisch bleibt. Das ist kein Gepäck, junger Mann, das ist mein Glaube, und über den wird nicht verhandelt. | Der Thunfisch bleibt. Über Gepäck lasse ich mit mir reden, junger Mann, über meinen Glauben nicht. |
| 5 | `ZS1_DACH_PIX_0355_2` | Wer zweimal misst, hat einmal zu lange auf einen Prinzen gewartet. Ich kenne das von Futterlieferungen. | So misst nur jemand, der zu lange auf einen Prinzen gewartet hat. Ich kenne das von Futterlieferungen. |
| 6 | `ZS2_DACH_PIX_0594_2` | Wo du hinfährst, leuchtet jede Hauswand, und zwar in Farben, die es gar nicht gibt. Er würde dort nicht einmal auffallen. | Die Zukunft leuchtet an jeder Hauswand, in Farben, die es gar nicht gibt. Daneben ist er eine Kerze am Mittag. |
| 7 | `ZS2_DACH_PIX_0592_2` | Ein einzelner Eimer gegen so viel Regen, das nenne ich Optimismus. Ich bewundere ihn und lasse ihn hier. | Ein einzelner Eimer gegen so viel Regen. Ich bewundere seinen Optimismus und lasse ihn hier. |
| 8 | `ZS2_DACH_PIX_0670_2` | Ich bin dagegen, und zwar jetzt schon, ohne es probiert zu haben. Das nennt man Prinzipien. | Ich bin dagegen, und zwar jetzt schon, ohne es probiert zu haben. Bei Dosenfutter bin ich konservativ. |
| 9 | `ZS3_DACH_PIX_0540_2` | Ich sage nicht, womit. Es steht praktisch daneben. | Das Futter liegt praktisch daneben. |
| 10 | `ZS3_DACH_PIX_0596` | Kaugummi. Im Fernsehen klebt so etwas unter jedem Stuhl, in jeder Sendung, seit Jahrzehnten. | Kaugummi. Unter jedem Stuhl jeder Talkshow klebt seit Jahrzehnten welches. |

### Gut in den Zwischenspielen (Belegzeilen)

- Der Versprecher in ZS2 ist die beste Figurenszene des Umfangs: „Oder … ich helf dir dafür. Im Haushalt.“ – „Opa sagt nichts. Opa sagt sehr lange nichts.“ – „Ist er kaputt? Hast du ihn kaputt gemacht?“ – „Du hast gerade … Haushalt gesagt. Freiwillig.“ – „Ich nehm es zurück. … das hat der Sand gemacht.“ (`ZS2_DACH_MAX_0160` bis `0200`). Hier steht Max' Entwicklung in einer Reaktion, nicht in einer Rede. „Freiwillig“ fällt genau einmal und an der richtigen Stelle.
- „Hatschi. // Bäckerei.“ – „Gesundheit. Und was?“ (`ZS2_DACH_PIX_0100`/`MAX_0110`): Pixels einziger Kurzsatz als Effekt, wie im Konzept vorgesehen.
- Die Passwort-Versuche steigern sich, wie das Konzept es will: Viertel (`ZS1_DACH_MAX_0150`), halbes Passwort mit Versprecher (`ZS2_DACH_MAX_0140`–`0160`), „Kuchen123“ (`ZS3_DACH_MAX_0160`, „Du. Gerade eben.“ `0190`).
- Opas Ausreden haben eine Linie und werden jedes Mal dünner: „Ein runder Termin. Deshalb ja auch der Kreis.“ (`ZS1_DACH_OPA_0452`), „Ein Verstärkungskreis.“ (`ZS2_DACH_OPA_0340`), „Ein Betonungszeichen. Rein wissenschaftlich.“ (`ZS3_DACH_OPA_0370`). Dazu Pixels Geruchsreihe Angst und Kuchen, Angst und Mehl, Angst, Mehl und Verzweiflung.
- Max klingt nach sechzehn: „ich schwör's“ (`ZS1_DACH_MAX_0120`), „Meine Schuhe sind gefühlt noch im Mittelalter.“ (`0202`), „Ich zum Glück nicht, ich bin sechzehn.“ (`ZS3_DACH_MAX_0435`), „Haha. Nein, Weltuntergang, ich muss mich konzentrieren.“ (`ZS3_DACH_MAX_0310`).
- Opa: „Siehst du! Und das ganz ohne WLAN. Stell dir vor, was du mit WLAN alles nicht geschafft hättest.“ (`ZS1_DACH_OPA_0194`), „Das Prinzip hab ich vom Schnellkochtopf.“ (`ZS2_DACH_OPA_0060`), „Rückverwandlungs…“ – „…schwund. Ich weiß.“ (`ZS3_DACH_OPA_0070`/`MAX_0080`).
- Kleine Rückrufe sitzen: Ketchup „Chance oder Problem“ (`ZS1_DACH_PIX_0600_2`) wird zu „weder Chance noch Problem“ (`ZS2_DACH_PIX_0596_2`); „Prospekte“ wird ein Stapel, auf dem Pixel bald schlafen kann (`ZS2_DACH_PIX_0650_2`, `ZS3_DACH_PIX_0650_2`).

## Welt 1 (`W1_`, 1433 Zeilen)

Für Welt 1 gab es bisher keinen KI-Klang-Durchgang (offener Punkt W3-2). Die Funde stehen je Raum; die Einschätzung mit Zahlen, die raumübergreifenden Funde und die zehn schwächsten Zeilen folgen am Ende des Abschnitts.

### Ankunft und Dorfplatz (`W1_ANK`, `W1_DORF`, 173 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-15 | `W1_ANK_PIX_0090_2`, `W1_DORF_PIX_0200_2`, `W1_DORF_PIX_1320`/`_2` | Pixel | kosmetisch | Entweder-oder-Schluss mit „beides“ | „Oder Hunger. Nach meiner Erfahrung meistens beides …“ / „Entweder ist dieser Mann sehr böse, oder der Zeichner war sehr schlecht. Aus Erfahrung tippe ich auf beides.“ / „Entweder ist es gut festgemacht oder sehr faul. // Ich respektiere beides …“ | Dreimal löst Pixel in den ersten beiden Räumen eine Alternative mit „beides“ auf, zweimal sogar mit „(aus) Erfahrung“. Derselbe Schluss steht schon in `P0_TREP_MAX_0010` und `ZS1_DACH_PIX_0600_2`. Toadis „Ich kann auch beides!“ (`W1_DORF_TOA_0620`) ist Panik und bleibt. | `0200_2` behalten (beste Fassung, passt zum Steckbrief ohne Gesicht). `0090_2`: „Oder Hunger. Bei mir sieht das genauso aus, meistens kurz vor dem Abendessen.“ · `1320`/`_2`: „Das Schloss da oben bewegt sich nicht. Es ist gut festgemacht oder sehr faul. // Ich hoffe auf faul. Mit so einem Schloss könnte ich mich anfreunden.“ |
| R5-TX-16 | `W1_DORF_TOA_0430` | Toadi | kosmetisch | Lehnübersetzung (M45; Regel 8 der Couch-Quest-Regeln nennt genau „Meinungen haben“) | „Eine Katze! Ist sie gefährlich? Sie sieht aus, als hätte sie Meinungen!“ | „To have opinions“ ist eine englische Wendung; ein Deutscher sagt „zu allem eine Meinung haben“ oder „alles besser wissen“. (Weitere Stellen in Welt 1 siehe raumübergreifende Funde.) | „Eine Katze! Ist sie gefährlich? Sie guckt, als wüsste sie alles besser!“ |
| R5-TX-17 | `W1_DORF_MAX_1140` | Max | kosmetisch | Gedankenstrich (M16, Regel 9) | „Gießen. Und jetzt warten wir drei Wochen, oder –“ (EN ebenso „or –“) | Einziger Gedankenstrich in Welt 1; Abbrüche schreibt das Spiel sonst mit „…“. | „Gießen. Und jetzt warten wir drei Wochen, oder …“ / „Water it. And now we wait three weeks, or …“ |
| R5-TX-18 | `W1_DORF_MAX_0840`, `W1_DORF_BRU_0850`, `W1_DORF_PIX_0870`, `W1_HINT_PIX_0530` | Max, Brunnen, Pixel | wichtig | Lokalisierung: Doppelsinn und Rätselhinweis gehen verloren | EN: „Something that wants to go far.“ / „Oh, it wants to go far all right.“ / „wish for "something that wants to go far"“ | „Hoch hinaus“ heißt ehrgeizig und wörtlich nach oben; genau deshalb liefert der Brunnen eine Bohne, die zum Luftschloss wächst. „Go far“ zeigt in die Ferne, nicht nach oben; die Bohne passt im Englischen nicht zum Wunsch, und der Hinweis in `HINT_0530` zeigt in die falsche Richtung. | „Something that aims high.“ / „Something that aims high. Granted. No returns, no exchanges.“ / „Oh, it aims high all right. Plants just have a very slow sense of humour.“ / Hinweis: „Coin in, wish for "something that aims high". …“ |
| R5-TX-19 | `W1_DORF_MAX_0160` | Max (liest Schild) | kosmetisch | Lokalisierung: Wortspiel falsch aufgelöst | EN: „Everything Grandma doesn't wear any more.“ | „Alles, was Oma nicht mehr trägt“ meint beim Lieferdienst das Tragen des Korbs. „Wear“ macht daraus einen Altkleiderhandel; der Witz ist weg und die Zeile mit 117 Zeichen länger als das Deutsche. | „"Little Red's Delivery. Everything Grandma can't carry any more. There in ten minutes or the basket's free."“ (106) |

Stand der Zeilen, die der Durchgang vom 14.11. als schwächste nannte: `W1_ANK_MAX_0050` (Staffel übersprungen), `W1_DORF_MAX_0110` (Apps) und `W1_DORF_MAX_1160` (Download bei Opa) stehen unverändert. Als KI-Klang zähle ich sie nicht; es sind Max' Medienvergleiche, die das Konzept will. `1160` hat mit „Okay.“ einen leeren Anlauf, der sich streichen lässt: „Das ging schneller als jeder Download bei Opa. Und der hat Glasfaser bestellt. Vor drei Jahren.“

### Taverne (`W1_TAV`, 176 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-20 | `W1_TAV_PIX_1610_2` | Pixel | kosmetisch | Stockphrase mit Echo-Nachklapp (M62, Regel 5) | „Es ist eine Gabe. Eine schwere Gabe, wenn man sie nicht nutzen darf.“ | Fertigfloskel („eine Gabe und ein Fluch“). Der Zuruf soll zum Fondue lenken; die zweite Blase bringt nichts Neues und klingt nach Kalender. | „Er wird langsam ungeduldig. Ich übrigens auch.“ |
| R5-TX-21 | `W1_TAV_MAX_0120` | Max | kosmetisch | Symmetrisches Satzpaar („A nennt das X. Ich nenne das Y.“) | „Ein Topf voll blubberndem Käse. Gollo nennt das Vulkan. Ich nenne das Abendessen.“ | Gebaute Zweizeiler-Pointe; Max untertreibt sonst und baut keine Parallelen. „Nennen“ als Pointenwort steht außerdem in `W1_DORF_PIX_0400`, `W1_STAB_STA_0240_2` und `W1_STAB_MAX_0550` (die letzte ist die Beispielzeile aus dem Konzept und bleibt). | „Ein Topf voll blubberndem Käse. Gollo sagt Vulkan dazu. Für mich sieht das nach Abendessen aus.“ |

`W1_TAV_MAX_1230` (14.11. als schwach genannt) ist überarbeitet und hat kein „In Serien“ mehr; `W1_TAV_MAX_1330` („In Serien braucht man irgendwann alles.“) und `W1_TAV_MAX_0360` (Handy bei einem Prozent) stehen noch, sind aber je einmal im Raum und tragen.

### Schmiede (`W1_SCHM`, 65 Zeilen)

Kein eigener Fund. `W1_SCHM_PIX_0300_2` („Das ist keine Treue, das ist Anbiederung.“) ist die einzige Kontrast-Formel im Raum und sitzt, weil Pixel hier wirklich einen Begriff zurückweist. `W1_SCHM_MAX_0010` (Esse so heiß wie mein Handy) steht unverändert.

### Zauberstab-Laden (`W1_STAB`, 82 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-22 | `W1_STAB_MAX_0430`, `W1_STAB_MAX_0460` (im Verbund mit `0410`, `0480`, `PIX_0490`) | Max | kosmetisch | Kontrast-Schablone (M8), Häufung in einer Rätselfolge | „Er wählt mich nicht, er pikst mich nur.“ / „Ich fühl mich nicht gewählt, ich fühl mich bloß vermessen.“ / „Das ist ein Partysnack, kein Zauberstab.“ / „Thunfisch klebt nicht, Thunfisch stinkt.“ – „Thunfisch stinkt nicht. Thunfisch duftet …“ | Fünf Kontraste in den Fehlversuchen eines Rätsels, die man hintereinander hört. `0410` spielt auf „Der Stab wählt den Zauberer“ an und bleibt; `0480`/`0490` ist ein echter Widerspruch zwischen zwei Figuren und trägt die Rätselauskunft „klebt nicht“. Übrig sind zwei. | `0430`: „Zwei Meter ausgeklappt. Ich fühl mich bloß vermessen.“ (der Doppelsinn bleibt, „gewählt“ kennt der Spieler aus `0410`/`0420`) · `0460`: „Zahnstocher mit Käse. Damit verzaubere ich höchstens ein Buffet.“ |
| R5-TX-23 | `W1_STAB_MAX_0555` (dazu `W1_STAB_PIX_0120`, `W1_STAB_STA_0530`) | Max | kosmetisch | Zeugma konkret + abstrakt als Dreier (M9) | „Mein Zauberstab, gemacht aus Holz, Käse und Hoffnung. Zwei davon sind haltbar.“ | Dreimal im selben Raum dieselbe Bauart: „Staub, Samt und Hoffnung“ (Pixel), „Honig, Käse, Schicksal“ (Stabmacher), „Holz, Käse und Hoffnung“ (Max), zweimal mit demselben Wort. Pixels Zeile wird in `0120_2` weitergeführt („Die Hoffnung riecht schon ein wenig abgestanden“) und bleibt, die des Stabmachers ist seine Feierlichkeit. Bei Max ist es geliehene Stimme. | „Mein Zauberstab. Ein Kochlöffel mit Käse dran. Haltbar ist davon nur der Löffel.“ |
| R5-TX-24 | `W1_STAB_STA_0220` | Stabmacher | kosmetisch | Lokalisierung: Anrede im Englischen ergänzt | EN: „The wand chooses the wizard, young man. Not the other way round. I have three left.“ | Im Deutschen fehlt die Anrede. „Young man“ ist Pixels Erkennungswort (höchstens viermal je Abschnitt) und fällt im selben Raum in `W1_STAB_PIX_0490`. Das Zitat ist ohne Anrede genauso erkennbar. | „The wand chooses the wizard. Not the other way round. I have three left.“ |

Gut in diesen fünf Räumen (Belegzeilen, ausführlich im Abschnitt „Gut gelöst“): `W1_DORF_MAX_0950` („Das ist keine Ziege. Das ist ein Sofa mit Hörnern.“), `W1_ANK_MAX_0121`, `W1_DORF_TOA_0522`, `W1_DORF_ROT_0930`, `W1_TAV_PIX_0340` („Meine Nase lügt nie. Sie interpretiert.“) mit Rückruf in `W1_STAB_PIX_0540`, `W1_TAV_HUM_0540`, `W1_TAV_GOL_1210`, `W1_SCHM_SCH_0240`, `W1_STAB_STA_0222` („Das sagst du. Der Löffel hat sich dazu noch nicht geäußert.“), `W1_STAB_STA_0282`, `W1_STAB_STA_0420`.

### Hoggelwarz (`W1_HOGG`, 116 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-25 | `W1_HOGG_MAX_0130` | Max | kosmetisch | Symmetrisches Satzpaar, baugleich mit `W1_TAV_MAX_0120` | „Ein Kessel, in dem schon etwas Grünes blubbert. Alwin nennt das Grundlage. Ich nenne das verdächtig.“ | Dieselbe Schablone wie in der Taverne („Gollo nennt das Vulkan. Ich nenne das Abendessen.“), wieder vor einem blubbernden Topf. Beim zweiten Mal hört man den Bauplan. | „Ein Kessel, in dem schon etwas Grünes blubbert. Alwin sagt, das ist die Grundlage. Wovon, sagt er nicht.“ |
| R5-TX-26 | `W1_HOGG_MAX_0120` (dazu `W1_HOGG_MAX_0140`, `W1_HOGG_ALW_0580`, `W1_HOGG_MAX_0930`) | Max | kosmetisch | Entweder-oder-Schluss | „Eine leere Tafel. Entweder hat Alwin nichts zu sagen, oder er hat schon wieder alles vergessen.“ | Tafel und Flaschenregal liegen nebeneinander und enden beide auf Entweder-oder; dazu Alwins „Wähle weise. Oder schnell. Beides ergibt eine Geschichte.“ und Max' „Ob das mutig ist oder dumm …“. `0140` („entweder Magie oder Marketing“) ist die stärkste und bleibt. | „Eine leere Tafel. Alwin hat den Stoff vergessen, und die Tafel verrät nichts.“ |

`W1_HOGG_MAX_0940` (Reserve, kommt laut Regie nicht vor) hat „kein Trank …, sondern Chaos“; falls die Zeile wieder eingebaut wird, vorher glätten. `W1_HOGG_MAX_0040` (Million Follower) steht unverändert und trägt.

### Troll-Brücke (`W1_BRUE`, 131 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-27 | `W1_BRUE_WAL_1230`, `W1_BRUE_WAL_0490`, `W1_BRUE_PIX_1130_2` (im Verbund mit `W1_BRUE_WAL_0280`, `0620`, `0770`, `0810`, `0940`) | Waldemar, Pixel | kosmetisch | Kontrast-Schablone (M8), Häufung im Raum | „… ich bin Troll, kein Vorleser.“ / „Das ist ein Märchen, keine Horde!“ / „Das ist kein Abenteuer mehr, das ist ein Wartezimmer.“ – daneben „Ich bin Troll, kein Anwalt. Leider.“, „Das ist kein Satz. Das ist ein Laut.“, „Das ist keine Drohung! Das ist eine Mittagspause!“, „Das steht nicht im Text, das ist privat.“ | Acht Kontraste in einem Raum. Bei Waldemar ist das Einordnen Figur (ein Pedant sortiert), `0620`, `0770`, `0810` und `0280` bleiben. Übrig sind die Dublette „Ich bin Troll, kein …“ (`0280` und `1230`), ein vierter Ausruf gleicher Bauart und Pixels Formel im Zuruf. „Wir sind X, keine Y“ gehört in Welt 1 den Goblins (Streikschild, siehe Bergwerk). | `1230`: „Dann bist du vorsorglich angehalten. Das Schild dort erklärt alles. Lesen musst du selbst, Vorlesen steht nicht in der Satzung.“ · `0490`: „HALT! Nach dem Kleinen der Mittlere! Nicht der Große! Wir sind hier in einem Märchen!“ · `1130_2`: „Für ein Wartezimmer fehlen nur noch die Zeitschriften.“ |

### Wasserschloss (`W1_WASS`, 30 Zeilen)

Kein eigener Fund. Der Raum ist kurz und sitzt: „Er hat das geübt. Vor dem Spiegel, mit Betonung auf ‚anderen‘.“ (`W1_WASS_PIX_0050`), „Haustiere erlaubt. Außer Fische. Fische sind Vormieter.“ (`W1_WASS_MAX_0065`), „Der Teppich hat eine Beule. Die Beule schnarcht.“ (`W1_WASS_MAX_0105`). Der Zuruf `W1_WASS_PIX_0170` gehört zum raumübergreifenden Fund R5-TX-33.

### Zauberwald (`W1_WALD`, 92 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-28 | `W1_WALD_MAX_0015`, `W1_WALD_MAX_0450` (dazu `W1_WALD_MAX_0010`, `0110`) | Max | kosmetisch | „Oder …“-Nachklapp | „Wenn ich da draufspringe, werde ich größer. Oder ich krieg Bauchschmerzen.“ / „Hab ich irgendwo gelesen. Oder gerade erfunden.“ | Viermal im Raum schiebt Max ein „Oder …“ nach, zweimal an demselben Hotspot hintereinander (`0010`, `0015`). `0010` (gewarnt oder überredet) und `0110` (unterschreiben oder Pommes) tragen und bleiben. | `0015`: „Wenn ich da draufspringe, werde ich größer. Im Spiel jedenfalls. Hier gibt's wahrscheinlich nur Bauchschmerzen.“ · `0450`: „Wasser hilft Rosen beim Wachsen, aber nicht beim Aufgehen. Hab ich irgendwo gelesen, glaub ich.“ |

### Luftschloss (`W1_LUFT`, 99 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-29 | `W1_LUFT_MAX_0090` | Max | kosmetisch | Schiefe Redewendung | „Das Geländer hat bestimmt noch nie einen Prüfer von innen gesehen.“ | „Von innen gesehen“ sagt man von Orten (eine Werkstatt, eine Schule). Einen Prüfer von innen zu sehen ergibt kein Bild. Das Englische ist richtig („has definitely never met a safety inspector“). | „Das Geländer hat bestimmt noch nie einen Prüfer gesehen.“ |
| R5-TX-30 | `W1_LUFT_MAX_0165` | Max | kosmetisch | Kontrast-Formel A; nimmt die Pointe einer anderen Figur vorweg | „Das ist keine Prinzessin, die gerettet werden will, das ist eine, die umzieht.“ | Max erklärt den Witz, den Zeldina zwei Klicks später selbst macht („Ich suche eine Wohnung, keinen Retter.“, `W1_LUFT_ZEL_0220`). `0160` („Entführt sieht anders aus.“) sagt schon genug. | „Sie trägt das Schwert über dem Karton, griffbereit. So packt jemand, der schon oft umgezogen ist.“ |

Das Luftschloss ist der stärkste Raum der Welt: „Vier. Feilschen kostet extra. Fünf, wenn Sie so weitergucken.“ (`W1_LUFT_MAK_0420`), „Das ist kein Blick. Das ist mein Gesicht.“ (`W1_LUFT_PIX_0460`, hier trägt die Formel), „Du hast gerade meinen Entführer an eine Maklerin verkauft.“ – „Vermittelt.“ (`W1_LUFT_ZEL_0540`/`MAX_0550`), „Das ist Finden mit Anlauf.“ (`W1_LUFT_TOA_0640`), und Max' Entwicklungsmoment in zwei Wörtern: „Ja. … Trotzdem.“ (`W1_LUFT_MAX_0310`).

### Goblin-Bergwerk (`W1_BERG`, 85 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-31 | `W1_BERG_PIX_0060`, `W1_BERG_PIX_0810_2` (dazu `W1_BERG_MAX_0670`, `W1_BRUE_PIX_1130_2`, `ZS1_DACH_PIX_0454_2`) | Pixel | kosmetisch | Kontrast-Schablone „Das ist kein X mehr, das ist Y“ | „Das ist kein Streik mehr, das ist Resignation mit Filter.“ / „Das ist weniger ein Streik als ein Keller mit Meinung …“ – später Max: „Das ist kein Passwort mehr. Das ist eine ganze Kindheit.“ | Pixel stuft im selben Raum zweimal den Streik um, und Max' beste Zeile des Raums (`0670`) kommt danach im selben Bau und verliert dadurch. Dieselbe Schablone steht in `W1_BRUE_PIX_1130_2` und `ZS1_DACH_PIX_0454_2`. `0670` soll sie allein haben. | `0060`: „Kaffee von vorgestern. So riecht Resignation, und zwar mit Filter.“ (`0060_2` „Ich erkenne sie am Geruch …“ schließt an) · `0810_2`: „Ein Keller mit Meinung. Solche Keller kenne ich, ich habe in einem gewohnt.“ |

„Wir sind Goblins, keine Maschinen“ (Streikschild, `W1_BERG_MAX_0025`), „Wir sind Goblins, keine Möwen.“ (`GRI_0600`), „Ich bin Gewerkschafter, keine Mauer.“ (`GRI_0380`), „Ich hab Spitzhacke, keine Bürste.“ (`GO1_0200`): Hier ist die Formel Parole und gehört der Gruppe; das bleibt. Stark: Grimmzahns Daumen („Ich habe keinen mehr!“ `0320_2`, „Ich habe doch noch einen!“ `0520`), „Hell!“ – „Zu hell.“ (`GO1_0530`/`GO2_0540`), „Goblins, die nichts tun. Aber organisiert.“ (`MAX_0020`), „Jetzt nicht mehr.“ (`MAX_0690`).
