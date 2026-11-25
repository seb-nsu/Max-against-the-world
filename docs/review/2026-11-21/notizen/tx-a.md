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
| W1_ | 1433 | 1433 |
| SYS_ | 108 | 108 |
| UI_ | 965 | 965 |

## Stand

- [x] Auftrag, humanizer-de, Rolle, Konzept, Skripte, Rätsel, frühere Reviews gelesen
- [x] Prolog
- [x] Zwischenspiele 1–3
- [x] Welt 1
- [x] SYS, UI
- [x] Auswertung (Stimmen, Anspielungen, Running Gags, Lokalisierung, Top 10)

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

### Dunkler Turm, Keller (`W1_TURM`, 60 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-32 | `W1_TURM_MAX_0095` | Max | kosmetisch | Anspielung erklärt sich selbst; **weiterhin offen (Durchgang 14.11., Abschnitt 4: „erklärt die Vorlage“)** | „Die Besen sind verzaubert. Ich bräuchte jetzt einen alten Meister mit Hut, der ‚Halt‘ ruft, aber so einer kommt nur in Filmen.“ | Laut Konzept erklärt Max nie die Vorlage. „Kommt nur in Filmen“ zeigt mit dem Finger auf den Zauberlehrling. | „Die Besen sind verzaubert. Jetzt müsste ein alter Meister mit Hut reinkommen und ‚Halt‘ rufen. Kommt aber keiner.“ |

Sonst trägt der Raum: Pixels lange Sätze über zwei Blasen sind hier am besten („Ich habe Haare, ich habe Würde, // und für diese Aufgabe opfere ich genau eines von beiden.“ `W1_TURM_PIX_0150`; „Wenn dein Großvater fragt, warum ich kahl bin, // dann sagst du ihm: Weltrettung. Und dass er mir dafür einen Lachs schuldet.“ `0220`).

### Smaugis Abstellkammern (`W1_SMAU`, 103 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-33 | `W1_SMAU_PIX_0722`, `W1_SMAU_ZEL_0825`; dazu `W1_SMAU_PIX_0721`, `0723`, `0724`, `0826`, `W1_HINT_PIX_0621` | Pixel, Zeldina | wichtig | Lokalisierung: Name nicht übersetzt; Pixel mit Kurzformen | EN: „Moderwort's old school report should give it away.“ / „Hold on. Moderwort is up there …“ / „We're missing the beginning.“ / „There's a whole bush of them …“ / „she won't give it up“ | Der Lord heißt im Englischen überall „Mouldword“; in diesen zwei Zeilen steht der deutsche Name. Dieselbe Gruppe nachgetragener Zeilen bricht auch Pixels englische Stimme: In 693 von 699 Pixel-Zeilen des Umfangs spricht er ohne Kurzformen, nur in diesen sechs nicht (`P0_DACH_PIX_0955_2` ist ein Zitat und zählt nicht). | „Mouldword's old school report …“ / „Hold on. Mouldword is up there …“ / „We are missing the beginning.“ (ebenso `0722`–`0724`) / „There is a whole bush of them in the enchanted forest.“ / „… and she will not give it up.“ |

Stark: „… Kicher. Richtig. Mama?“ (`W1_SMAU_TUE_0770`), Max' zweiter Entwicklungsmoment „Ich hab das Ei. Ich könnte jetzt gehen. // … Zeldina hat immer noch keine Wohnung.“ (`W1_SMAU_MAX_0645`), Smaugis „Noch nicht. Aber wenn ich anfange, bin ich vorbereitet.“ (`SMA_0840`) und Grimmzahns „Nein. Aber zufrieden. Für einen Goblin ist das dasselbe.“ (`GRI_0570`).

### Thronsaal (`W1_THRO`, 70 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-34 | `W1_THRO_MAX_0120` (dazu `W1_THRO_MAX_0130`) | Max | kosmetisch | Entweder-oder-Schluss an zwei Nachbar-Hotspots | „Taschentücher, stapelweise. Entweder hat hier jemand Heuschnupfen, oder sehr viele Gefühle.“ / „Das ist entweder Mut, oder es war die Maklerin.“ | Wie in Hoggelwarz (R5-TX-26) stehen zwei Entweder-oder direkt nebeneinander. `0130` hat die bessere Pointe (die Maklerin war schon da) und bleibt. | „Taschentücher, stapelweise. Hier hat jemand Heuschnupfen und dazu noch Gefühle.“ |

`W1_THRO_MAX_0310` wiederholte am 14.11. `W1_STAB_MAX_0550` wörtlich; das ist behoben („Fondue-Rückstände. Der Löffel hat eben Geschmack.“). Stark: „DIE MAKLERIN! … Sie hat Fotos gemacht! Vom Schlafzimmer!“ (`MOD_0050`), „Damit kann ich nur Käse.“ – „Ich auch. Aber ich hab Übung.“ (`MOD_0410`/`MAX_0420`), „Die kriegt Smaugis Teekannen. Alle dreihundert.“ (`ZEL_0530`), „Auf der letzten Seite steht ganz klein ‚Morgen.‘ Und auf der davor auch. Das Gefühl kenne ich.“ (`MAX_0155`).

### Figurenwechsel, Inventar, erschöpfte Gespräche, Hinweise (`W1_WECH`, `W1_INV`, `W1_ABS`, `W1_HINT`, 151 Zeilen)

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-35 | `W1_ABS_ALW_0080` | Alwin | kosmetisch | Anspielung im Deutschen nicht erkennbar | „Du wirst nicht vorbeikommen. An mir. Ich meine: an weiteren Antworten.“ (EN: „You shall not pass.“) | Das Englische zitiert Gandalf wörtlich. In der deutschen Filmfassung heißt der Satz „Du kannst nicht vorbei!“; „Du wirst nicht vorbeikommen“ erkennt niemand. | „Du kannst nicht vorbei! An mir. Ich meine: an weiteren Antworten.“ |
| R5-TX-36 | `W1_HINT_PIX_1320` | Pixel | kosmetisch | Sinnfehler in einer Rätselauskunft (Regel 10: Auskunft wörtlich) | „Du hast einen Löffel, der mal Käse war.“ (EN: „a spoon that used to be cheese“) | Der Löffel war nie Käse; an ihm klebt Fondue („Fondue-Rückstände“, `W1_THRO_MAX_0310`). In einem Stufe-2-Hinweis stört das Rätseln. | „Socke auf, er niest, der Stab fliegt. Dann braucht er Ersatz. Du hast einen Löffel, an dem noch Käse klebt.“ / „… You have a spoon with cheese still stuck to it.“ |
| R5-TX-37 | `W1_HINT_PIX_0330`, `W1_HINT_PIX_0330_2` | Pixel | kosmetisch | Lokalisierung: Blasen im Englischen anders geteilt | DE 23 + 122 Zeichen („Hol die Schmiede-Ziege.“ // „Bestell die zweite …“), EN 121 + 29 („Fetch the forge goat. Order the second …“ // „I hate everything about this.“) | Die Blasen tragen in beiden Sprachen verschiedenen Inhalt. Bei einer Vertonung je Schlüssel passen Aufnahme und Text nicht mehr zusammen. | EN wie DE teilen: „Fetch the forge goat.“ // „Order the second with the form from the village board and give me the goatskin rug from the tavern. I hate everything about this.“ |
| R5-TX-38 | `W1_HOGG_ALW_0342` (154), `W1_HOGG_ALW_0610` (163), `W1_HINT_PIX_0621` (144), `W1_HINT_PIX_0730` (145), `W1_HINT_PIX_0910` (143), `W1_HINT_PIX_0930` (145) | Alwin, Pixel | kosmetisch | Lokalisierung: englische Blase länger als 140 Zeichen | siehe Zeichenzahlen; deutsch 121 bis 138 | Im Deutschen gilt für Sprechblasen die Grenze 140 (`tools/pruefen.py`); im Englischen liegen sechs Zeilen darüber. Ob die Blase umbricht oder überläuft, habe ich nicht im Spiel gesehen. | `0342`: „The mushroom. Without it, it's breakfast. With it, it's education. Glow mushrooms grow in the enchanted forest, past the troll bridge.“ (134) · `0610`: „Six bottles on my shelf, count them and see: one potion, one oil, two poisons, two juices there be. My shelf held no more, take it from me.“ (140) · `0621`: „Berta in the tavern has the egg and will not give it up. Ask me what she says. Mushroom: enchanted forest. Milk: animals with bells.“ (132) · `0730`: „Talk to Waldemar about singing, follow him into the forest, hold the sock in the pollen. And promise him the credits, it costs nothing.“ (135) · `0910`: „The estate agent wants commission. Haggling fails, pets cost extra. She wants to sell something. Give her something to sell.“ (124) · `0930`: „Show the estate agent Mouldword's wanted poster and pitch her the tower. Seven floors, tower location. I shall never say that again.“ (132) |

Die Inventarzeilen gehören zum Besten der Welt: „Er klebt an allem, was er liebt.“ (`W1_INV_PIX_0015`), „Ein Kästchen für ‚Oma‘, eins für ‚Wolf‘ und eins für ‚Sonstiges‘. Ich bin Sonstiges.“ (`W1_INV_MAX_0040`), „Das ging schneller als bei mir. Und ohne Stimmbruch.“ (`W1_INV_MAX_0140`), „Der hat mehr Echo als meine Klasse, wenn der Lehrer was fragt.“ (`W1_INV_MAX_0060`). Die Hinweise halten die Regel „Auskunft zuerst und wörtlich“ durchgehend ein; Stufe 3 nennt immer den Handgriff.

### Raumübergreifende Funde in Welt 1

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-39 | `W1_DORF_PIX_0410`, `W1_TAV_PIX_0380`, `W1_TAV_PIX_0390`, `W1_STAB_PIX_0120`, `W1_HOGG_PIX_0220`, `W1_HOGG_PIX_0660`, `W1_BRUE_PIX_0080`, `W1_BRUE_PIX_0160`, `W1_WALD_PIX_0105`, `W1_WALD_PIX_0180`, `W1_LUFT_PIX_0170`, `W1_BERG_PIX_0130`, `W1_SMAU_PIX_0190`, `W1_THRO_PIX_0180` | Pixel | wichtig | Dreierreihe als Öffner, drittes Glied abstrakt (M9 Trikolon, M61 gleicher Bauplan; in Welt 3 als „Schnupper-Dreier“ schon bereinigt) | „Staub, Samt und Hoffnung.“ / „Holz, Farbe und Pedanterie.“ / „Moos, Regelbuch und Lampenfieber. Dieser Troll riecht nach einer zweiten Karriere.“ / „Karton, Kronenpolitur und Entschlossenheit. Diese Frau riecht nach einem Plan.“ / „Schlaf, Kaffee und Schweinsleder. Dieser Goblin hat sein Leben im Griff.“ / „Tomate, Zucker und Lüge.“ / „Pollenstaub, Taschentücher und Selbstmitleid.“ | Pixels Antwort auf „Schnuppern“ hat in 10 von 14 Räumen denselben Bau: drei Hauptwörter, das dritte ein Gefühl oder eine Eigenschaft, danach eine Deutung, viermal mit „Diese(r) X …“. Wer Pixel in jedem Raum schnuppern lässt (und das Spiel lädt dazu ein), hört die Schablone spätestens im dritten Raum. Einzeln ist fast jede Zeile gut; die Menge macht den Maschinenklang. | Fünf behalten, die mehr tun als aufzählen: `DORF_0410` (Stabreim), `STAB_0120` (wird in `_2` weitergeführt), `HOGG_0220` („frittierte Geschichte“), `BRUE_0160`, `SMAU_0190`. Die übrigen anders anfangen: `TAV_0380`: „Da unten ist es kalt, und es riecht nach Rüben. Ganz hinten hängt ein Etikett, an dem keine Flasche mehr ist.“ · `TAV_0390`: „Rost. Aber liebevoll gepflegter Rost. Humbert poliert mit Gefühl, das rieche ich deutlich.“ · `HOGG_0660`: „Zitrone und Honig. Dahinter kommt noch etwas, das mir nicht gefällt. Das könnte alles Mögliche sein.“ · `BRUE_0080`: „Frische Farbe auf altem Holz. Jemand hat jeden Paragrafen einzeln poliert.“ · `WALD_0105`: „Ich habe noch einmal geschnuppert. Tomate mit sehr viel Zucker, und sie tut trotzdem so, als wäre sie Blut.“ · `WALD_0180`: „Dieser Karren riecht nach nasser Pappe und nach Omas Küche. Er hat mehr erlebt als ich,“ · `LUFT_0170`: „Karton und Kronenpolitur. Diese Frau hat einen Plan, das rieche ich bis hierher.“ · `BERG_0130`: „Er riecht nach Kaffee und schläft trotzdem. Dieser Goblin hat sein Leben im Griff.“ · `THRO_0180`/`_2`: „Nasse Taschentücher. Und er tut sich leid, das rieche ich bis hierher. // Ein Dunkler Schnupfen mit Thron.“ (im Original steht außerdem ein Komma zu viel: „weniger ein Dunkler Lord, als …“) |
| R5-TX-40 | `W1_HOGG_PIX_0910`, `W1_BRUE_PIX_1130`, `W1_WALD_PIX_0710` (im Verbund mit `W1_TAV_PIX_1620`, `W1_SCHM_PIX_0610`, `W1_TURM_PIX_0280`, `W1_WASS_PIX_0170`, `W1_BERG_PIX_0810`, `W1_THRO_PIX_0720`, `W1_TURM_PIX_0290`) | Pixel | kosmetisch | Aufzählung als Öffner im Zuruf (M9, M61) | „Der Kessel blubbert, die Flaschen schweigen, und Alwin summt ein Rezept.“ / „Die Ziegen warten, ich warte, und der Troll wartet auch.“ / „Die Pilze leuchten, die Rosen schmollen, und der ganze Wald hat Stimmung.“ | 10 von Pixels 28 Zurufen beginnen mit einer Reihe, sechs davon nach dem Muster „A tut dies, B tut das, und C …“, gefolgt von „du stehst“. Die Taverne hat die beste Fassung („Humbert poliert, Gollo zittert, Minka starrt, und du stehst.“); danach wiederholt sie sich. Die Hauptwort-Reihen in Wasserschloss, Bergwerk und Thronsaal fassen jeweils den Raum zusammen oder geben einen Hinweis und bleiben. | `HOGG_0910`: „Alwin summt ein Rezept, und der Kessel blubbert im Takt.“ (`_2` bleibt) · `BRUE_1130`: „Jetzt warten sogar die Ziegen.“ (`_2` nach R5-TX-27: „Für ein Wartezimmer fehlen nur noch die Zeitschriften.“) · `WALD_0710`: „Der ganze Wald hat Stimmung. Sogar die Rosen, und die schmollen.“ (`_2` bleibt) |
| R5-TX-41 | `W1_DORF_MAX_0290` (mit `W1_DORF_PIX_0140`), `W1_STAB_PIX_0570_2`, `W1_TURM_PIX_0200_2`, `W1_WALD_MAX_0095`, `W1_SCHM_PIX_0065_2` | Max, Pixel | kosmetisch | Wort-Ticks über Figuren hinweg (M64, Regel 7) | „Endlich ein Denkmal, das die Verhältnisse realistisch darstellt.“ (Pixel) und im selben Raum „Endlich mal eine Schule mit realistischen Zielen.“ (Max) · „Endlich jemand in diesem Königreich, der …“ · „nackt und gleichzeitig sehr produktiv“ · „sehr praktisch und gleichzeitig sehr beunruhigend“ · „und zwar aus Prinzip“ | „Endlich (mal) ein/jemand …“ steht siebenmal bei vier Figuren (dazu `W1_TAV_PIX_0080`, `W1_HOGG_ALW_0070`, `W1_LUFT_MAX_0110`, `W1_LUFT_PIX_0130`; das Paar vor dem Spiegel ist gewollt und bleibt). „Gleichzeitig X und Y“ steht fünfmal (auch `W1_HOGG_PIX_0920_2`, `W1_WASS_MAX_0075`, `W1_TURM_PIX_0100_2`), „aus Prinzip“ dreimal in zwei Nachbarräumen (`W1_TAV_PIX_0130_2`, `W1_TAV_HUM_0540`). | `DORF_MAX_0290`: „Ein Wegweiser: ‚Hoggelwarz für Durchgefallene‘. Da könnte ich mich sogar bewerben.“ · `STAB_PIX_0570_2`: „Ich mag sie. In diesem Königreich hat sonst niemand einen Blick für Qualität.“ · `TURM_PIX_0200_2`: „Das war ein Pfund Fell. Ich fühle mich nackt, aber sehr produktiv.“ · `WALD_MAX_0095`: „… Das ist sehr praktisch. Und ziemlich beunruhigend.“ · `SCHM_PIX_0065_2`: „Worum wir konkurrieren, weiß ich nicht genau. Aber ich werde gewinnen, schon aus Gewohnheit.“ |

Zu R5-TX-15: Wird `W1_DORF_PIX_1320_2` wie vorgeschlagen geändert, bleibt `W1_HINT_PIX_0010_2` („Beides zählt, aber das Zweite zählt mehr.“) die einzige Zeile dieser Bauart; sonst sind die beiden eine Dublette.

### Einschätzung KI-Klang Welt 1

**Gering bis mittel.** Geprüft 1433 Zeilen (Max 575, Pixel 472, 26 weitere Sprecher 386). Einzeln gelesen klingt fast jede Zeile gesprochen; Stockphrasen, Signposting, Gedankenstriche und „Gefühl ausgesprochen“ fehlen praktisch (ein Gedankenstrich, eine Stockphrase). Der Maschinenklang entsteht durch Baupläne, die sich von Raum zu Raum wiederholen, und er liegt fast ganz bei Pixel. Die Nebenfiguren sind davon frei.

| Muster | Vorkommen in Welt 1 | davon als Fund mit Umschreibung |
| --- | --- | --- |
| Dreierreihe als Öffner bei Pixel (Schnuppern, Ansehen) | 13 Zeilen in 10 von 14 Räumen, dazu 2 Zweierreihen | 9 (R5-TX-39), 1 (R5-TX-23 bei Max) |
| Aufzählung als Öffner im Zuruf | 10 von 28 Zurufen | 3 (R5-TX-40) |
| Kontrast („kein X, sondern/das ist Y“, „X, kein Y“) | rund 40 (30 per Suche, 10 von Hand), gehäuft an der Brücke (9), im Bergwerk (8), im Stab-Laden (5) | 9 (R5-TX-22, 27, 30, 31) |
| Entweder-oder-Schluss | 10 „entweder“, 5 Schlüsse auf „beides“ | 5 (R5-TX-15, 26, 34) |
| „Oder …“-Nachklapp | 14, davon 4 im Zauberwald | 2 (R5-TX-28) |
| „A nennt das X. Ich nenne das Y.“ / „Das nennt man …“ | 6 | 2 (R5-TX-21, 25) |
| Wort-Ticks („Endlich ein …“, „gleichzeitig“, „aus Prinzip“) | 7 / 5 / 3 | 5 (R5-TX-41) |
| Stockphrase, Lehnübersetzung, Gedankenstrich, schiefe Wendung | je 1 | 4 (R5-TX-16, 17, 20, 29) |
| „und zwar“ | 19 (12 bei Pixel) | keiner; bei Pixel Figur |

### Die zehn schwächsten Zeilen in Welt 1

| # | Zeile | Original | Umschreibung |
| --- | --- | --- | --- |
| 1 | `W1_HOGG_MAX_0130` | Ein Kessel, in dem schon etwas Grünes blubbert. Alwin nennt das Grundlage. Ich nenne das verdächtig. | Ein Kessel, in dem schon etwas Grünes blubbert. Alwin sagt, das ist die Grundlage. Wovon, sagt er nicht. |
| 2 | `W1_TAV_MAX_0120` | Ein Topf voll blubberndem Käse. Gollo nennt das Vulkan. Ich nenne das Abendessen. | Ein Topf voll blubberndem Käse. Gollo sagt Vulkan dazu. Für mich sieht das nach Abendessen aus. |
| 3 | `W1_LUFT_PIX_0170` | Karton, Kronenpolitur und Entschlossenheit. Diese Frau riecht nach einem Plan. | Karton und Kronenpolitur. Diese Frau hat einen Plan, das rieche ich bis hierher. |
| 4 | `W1_THRO_PIX_0180`/`_2` | Pollenstaub, Taschentücher und Selbstmitleid. // Das ist weniger ein Dunkler Lord, als ein Dunkler Schnupfen. Mit Thron. | Nasse Taschentücher. Und er tut sich leid, das rieche ich bis hierher. // Ein Dunkler Schnupfen mit Thron. |
| 5 | `W1_BERG_PIX_0060` | Kaffee von vorgestern. Das ist kein Streik mehr, das ist Resignation mit Filter. | Kaffee von vorgestern. So riecht Resignation, und zwar mit Filter. |
| 6 | `W1_BRUE_PIX_1130`/`_2` | Die Ziegen warten, ich warte, und der Troll wartet auch. // Das ist kein Abenteuer mehr, das ist ein Wartezimmer. Es fehlen nur noch die Zeitschriften. | Jetzt warten sogar die Ziegen. // Für ein Wartezimmer fehlen nur noch die Zeitschriften. |
| 7 | `W1_LUFT_MAX_0165` | Sie trägt das Schwert über dem Karton. Das ist keine Prinzessin, die gerettet werden will, das ist eine, die umzieht. | Sie trägt das Schwert über dem Karton, griffbereit. So packt jemand, der schon oft umgezogen ist. |
| 8 | `W1_TAV_PIX_1610_2` | Es ist eine Gabe. Eine schwere Gabe, wenn man sie nicht nutzen darf. | Er wird langsam ungeduldig. Ich übrigens auch. |
| 9 | `W1_STAB_MAX_0555` | Mein Zauberstab, gemacht aus Holz, Käse und Hoffnung. Zwei davon sind haltbar. | Mein Zauberstab. Ein Kochlöffel mit Käse dran. Haltbar ist davon nur der Löffel. |
| 10 | `W1_DORF_PIX_1320`/`_2` | Das Schloss da oben bewegt sich nicht. Entweder ist es gut festgemacht oder sehr faul. // Ich respektiere beides, das Zweite allerdings ein wenig mehr. | Das Schloss da oben bewegt sich nicht. Es ist gut festgemacht oder sehr faul. // Ich hoffe auf faul. Mit so einem Schloss könnte ich mich anfreunden. |

## System und Oberfläche (`SYS_` 108 Zeilen, `UI_` 965 Zeilen)

`SYS_` (Ersatz-, Wiederholungs- und Plauderzeilen) habe ich wie Dialog gelesen, `UI_` auf Lokalisierung, Länge und einheitliche Benennung. In keiner Zeile des Umfangs fehlt das Englische oder ist leer.

**KI-Klang `SYS_`: gering.** 108 Zeilen, kein Fund im Deutschen. Die Pools sind abwechslungsreich gebaut und halten die Stimmen: Max kurz und mit Medien- oder Spielwort (20 von 51 Max-Zeilen, was bei einem Pool gewollt ist), Pixel in zwei Blasen mit Nachsatz. Stark: „Ich kannte einmal eine Katze, die genau das versucht hat. // Sie spricht bis heute nicht darüber, und wir respektieren das alle.“ (`SYS_ERS_PIX_0190`), „Lädt. Lädt immer noch. Ich nehm das als Nein.“ (`SYS_ERS_MAX_0140`), „Nichts Neues. Wenn sich etwas ändert, sage ich Bescheid. // Das ist gelogen, ich sage nie Bescheid. Aber es klingt nett.“ (`SYS_WDH_PIX_0080`).

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-42 | `UI_OBJ_LEUCHTPILZ`, `UI_OBJ_LEUCHTPILZE`, `UI_OBJ_LEUCHTTRANK`, `UI_OBJ_BACH`, `UI_OBJ_TEPPICH`, `UI_OBJ_FLASCHE`, `UI_OBJ_STREIKSCHILDER`, `UI_OBJ_HUHN`, `UI_RAUM_DORFPLATZ`, `UI_OBJ_OPAS_PAPYRUS`, `UI_OBJ_HAUFEN`; `W1_HINT_PIX_0330`, `W1_HINT_PIX_0631` | – | kosmetisch | Lokalisierung: Objektname und Dialog benennen im Englischen dasselbe Ding verschieden | „Glowing mushroom“ gegen „glow mushroom“ (5 Dialogzeilen) · „Glowing potion“ gegen „glow potion“ (4) · „Brook“ gegen „stream“ (5) · „Carpet“ gegen „rug“ (`W1_WASS_MAX_0100`) · „Little bottle“ gegen „vial“ (2) · „Strike signs“ gegen „picket signs“ · „Hen“ gegen „chicken“ (6) · „Smithy goat“ gegen „forge goat“, „jug from the forge“ gegen „from the smithy“ · „Lower Crumbly“ gegen „Castle Crumble“ · „Grandpa's Papyrus“, „Crumbled Heap“ groß, alle anderen Namen klein | Der Spieler liest den Namen am Hotspot und hört im Satz daneben ein anderes Wort. Bei den Hinweisen stört es am meisten: „forge“ heißt im Spiel die Esse (`UI_OBJ_ESSE`), die Schmiede heißt „Smithy“. | Namen an den Dialog angleichen: „Glow mushroom(s)“, „Glow potion“, „Stream“, „Rug“, „Vial“, „Picket signs“, „Chicken“, „Lower Crumble square“ (20 Zeichen statt 28), „Grandpa's papyrus“, „Crumbled heap“. Hinweise: „Fetch the smithy goat.“ / „Then the jug from the smithy …“ |
| R5-TX-43 | `UI_W2_BAUSTEIN_BLAU` | (Rätselbaustein) | kosmetisch | Lehnübersetzung (M45) | „Es ist blau und hat trotzdem keine Laune“ (EN: „It is blue and still not sad“) | Das Wortspiel ist englisch (blue für traurig). Im Deutschen heißt „blau“ betrunken; „keine Laune“ ergibt mit „blau“ keinen Witz. | „Es ist blau und trotzdem nüchtern“ (Englisch bleibt) |
| R5-TX-44 | `SYS_ERS_PIX_0300`/`_2`, `SYS_WDH_MAX_0080`, `UI_TASCHE_HILFE` | Pixel, Max | kosmetisch | Lokalisierung: Redewendung wörtlich übersetzt, steifes Englisch | „If that works, I will eat a broom.“ / „Grandpa says a lot of things when the day is long.“ / „Select packs or unpacks. Look at: ask Pixel.“ | „Einen Besen fressen“ und „viel reden, wenn der Tag lang ist“ gibt es im Englischen nicht; beide Zeilen stehen im Pool und kommen oft. Die Taschenhilfe liest sich wie eine Wortliste. | „If that works, I shall eat my own tail. // You may rest easy, the tail is in no danger.“ · „Grandpa says you spot something new the third time you look. Grandpa says a lot of things.“ · „Select to pack or unpack. Look to ask Pixel.“ |

## Stimmen der Figuren

Messwerte aus `tx-a_zaehlen.py sprecher` (Wörter je Satz, Anteil Sätze mit höchstens drei Wörtern).

| Figur | Woran man sie erkennt | Belegzeilen | Wo sie aus der Rolle fällt |
| --- | --- | --- | --- |
| **Max** (Prolog 6,8 Wörter je Satz, Welt 1 6,1) | Trocken, untertreibt, redet wie ein Sechzehnjähriger: Schule, Handy, Serien, „ich schwör's“. Stellt fest und hängt einen kurzen Nachsatz an. Seine Entwicklung steht in Reaktionen, nie in Reden. | „Ich hab keine Haltung. Ich hab einen Hoodie.“ (`W1_ANK_MAX_0121`) · „Das ging schneller als bei mir. Und ohne Stimmbruch.“ (`W1_INV_MAX_0140`) · „Der hat mehr Echo als meine Klasse, wenn der Lehrer was fragt.“ (`W1_INV_MAX_0060`) · „Ja. … Trotzdem.“ (`W1_LUFT_MAX_0310`) · „Fußbad. Zählt.“ (`W1_BRUE_MAX_0980`) | Wo er gebaute Zweizeiler spricht, klingt er nach Autor: „Gollo nennt das Vulkan. Ich nenne das Abendessen.“ (`W1_TAV_MAX_0120`), „Alwin nennt das Grundlage. Ich nenne das verdächtig.“ (`W1_HOGG_MAX_0130`), „aus Holz, Käse und Hoffnung“ (`W1_STAB_MAX_0555`), „Das ist keine Prinzessin, die …“ (`W1_LUFT_MAX_0165`). Die Medienvergleiche (rund 25 in 575 Zeilen, höchstens vier je Raum) sind Figur und kein Fund. |
| **Pixel** (Prolog 7,8, Welt 1 6,7, ZS3 5,5) | Hochnäsig, ausführlich, Sätze über zwei Blasen mit „und zwar“, „wohlgemerkt“, „junger Mann“; alles führt zu Essen, Schlafplätzen oder Würde. Englisch ohne Kurzformen. Kurzsatz nur als Effekt. | „Meine Nase lügt nie. Sie interpretiert.“ (`W1_TAV_PIX_0340`) · „Ich habe Haare, ich habe Würde, // und für diese Aufgabe opfere ich genau eines von beiden.“ (`W1_TURM_PIX_0150`) · „Nein. // Nein. // … Gut. Aber ich will das Fell danach brennen sehen.“ (`W1_BRUE_PIX_0410`) · „Hatschi. // Bäckerei.“ (`ZS2_DACH_PIX_0100`) | Seine Stimme ist klar, aber seine Zeilen sind die mit den meisten Bauplänen: Schnupper-Dreier (R5-TX-39), Zuruf-Reihe (R5-TX-40), „beides“-Schluss (R5-TX-15), „kein X mehr, das ist Y“ (R5-TX-31). In ZS3 wird er kurzatmig (34 % Kurzsätze gegen 15 % in ZS1), dort klingt er stellenweise wie Max. Sechs englische Zeilen mit Kurzformen (R5-TX-33). |
| **Opa** (Prolog 5,8) | Ausrufe, Erfinderstolz, benennt alles als „Modell …“, „Ehrenwort eines Wissenschaftlers“, weicht beim Kalender aus. Redet wie ein Opa: Vergleiche aus Haushalt und Technik von früher. | „Die Menschheit steht am Abgrund, und du kommst in Socken!“ (`P0_DACH_OPA_0010`) · „Zu einem Flugzeug sagst du ja auch nicht Bus.“ (`P0_DACH_OPA_0060`) · „Stell dir vor, was du mit WLAN alles nicht geschafft hättest.“ (`ZS1_DACH_OPA_0194`) · „Das Prinzip hab ich vom Schnellkochtopf.“ (`ZS2_DACH_OPA_0060`) | Im Deutschen nirgends. Im Englischen schwankt die Anrede zwischen „boy“ und „lad“ (R5-TX-06), und „Modell“-Wendungen sind nicht gleich gebaut (R5-TX-14). |
| **Toadi** (4,7; 41 % Kurzsätze) | Panik in Ausrufen, korrigiert sich im selben Atemzug, sagt seinen Satz mit dem Schloss. | „Ich hatte keine dabei, nur Panik.“ (`W1_ANK_TOA_0190`) · „Ich hole … ich habe nichts zum Holen. Ich hole Luft.“ (`W1_DORF_TOA_0880`) · „Das ist Finden mit Anlauf.“ (`W1_LUFT_TOA_0640`) | Nur `W1_DORF_TOA_0430` („als hätte sie Meinungen“, R5-TX-16). |
| **Humbert** | Warmer Wirt, gibt Schwertern Vornamen und behandelt sie als Familie. | „Das ist Gerhard, mein Liebling. … Klaus-Dieter rostet aus Prinzip.“ (`W1_TAV_HUM_0540`) · „Du heißt Ingrid. Du Ingrid die Zweite.“ (`W1_SMAU_HUM_0530`) | nirgends |
| **Gollo** (3,1; 68 % Kurzsätze) | Stakkato, gedehnte Zischlaute, „wir“ für sich selbst, will den Ring loswerden. | „Ich liebe es. Ich habe verloren. Endlich.“ (`W1_TAV_GOL_1210_2`) · „Jetzt schweigen wirsss. Wir und unser Kummer.“ (`W1_ABS_GOL_0210`) | nirgends |
| **Schmied** (3,8) | Resigniert, knapp, jede Antwort endet bei Blech oder der Ziege. | „Sie ist eines Morgens aufgetaucht. Wie Schulden.“ (`W1_SCHM_SCH_0240`) · „Nur nicht die Hoffnung, die habe ich selbst nicht mehr.“ (`W1_SCHM_SCH_0100`) | nirgends |
| **Stabmacher** (4,8) | Feierlich und geschäftstüchtig zugleich, nimmt Gegenstände als Personen. | „Das sagst du. Der Löffel hat sich dazu noch nicht geäußert.“ (`W1_STAB_STA_0222`) · „Ohne Schachteln ist es ein Flur.“ (`W1_STAB_STA_0260`) | Englisch: „young man“ ergänzt (R5-TX-24). |
| **Alwin** (4,6) | Zerstreut, fragt sich selbst und antwortet, alles wird Küche. | „Ist es? Ist es nicht? Die Grenzen sind fließend. Wie Teig.“ (`W1_HOGG_ALW_0340`) · „Ich habe vier Tage an ‚Schleim‘ gesessen.“ (`W1_HOGG_ALW_0980`) | nirgends; `W1_ABS_ALW_0080` verfehlt nur das Zitat (R5-TX-35). |
| **Waldemar** (4,2; 48 % Kurzsätze) | Paragrafen, Amtsdeutsch, Gefühl nur als Nachsatz. Die klarste Nebenstimme. | „Die Versammlung bin ich. Ich bin nie beschlussfähig.“ (`W1_BRUE_WAL_1270`) · „Zugelassen. Mit Bauchschmerzen.“ (`W1_BRUE_WAL_0460_2`) · „Ich melde sie jedes Mal an, und jedes Mal lehne ich sie ab.“ (`W1_BRUE_WAL_0266`) | Die Dublette „Ich bin Troll, kein Anwalt / kein Vorleser“ (R5-TX-27). |
| **Rotkäppchen** (4,1) | Lieferdienst-Ton, Satzfetzen ohne Subjekt, Bewertungssprache. | „Ich frag nicht. Trinkgeld stimmt.“ (`W1_WALD_ROT_0260`) · „Bewertung nicht vergessen! Fünf Körbe!“ (`W1_WALD_ROT_0300`) | nirgends |
| **Zeldina** (4,4) | Praktisch, trocken, rechnet in Miete und Kartons. | „Umzugsfirmen kosten. Dunkle Lords tragen Kisten umsonst.“ (`W1_LUFT_ZEL_0260`) · „Die kriegt Smaugis Teekannen. Alle dreihundert.“ (`W1_THRO_ZEL_0530`) | Dreimal „X, kein(e) Y“ (`W1_LUFT_ZEL_0220`, `0290`, `W1_ABS_ZEL_0010`); noch kein Fund, aber an der Grenze. |
| **Maklerin** | Siezt als Einzige, Zuschläge und Kleingedrucktes. | „Vier. Feilschen kostet extra. Fünf, wenn Sie so weitergucken.“ (`W1_LUFT_MAK_0420`) | nirgends |
| **Grimmzahn und Goblins** (3,7; 56 % Kurzsätze) | Parolen, Ausrufe, „Wir sind traditionell“. Die Goblins sprechen in Einzelwörtern. | „Ich habe keinen mehr!“ / „Ich habe doch noch einen!“ (`W1_BERG_GRI_0320_2`, `0520`) · „Hell!“ – „Zu hell.“ (`W1_BERG_GO1_0530`, `GO2_0540`) | nirgends; die Formel „Wir sind X, keine Y“ ist hier Parole. |
| **Smaugi** (3,7; 58 % Kurzsätze) | Zögert, nimmt zurück, hängt an jedem Ding. Spiegelt Opas „Ich werfe nichts weg“. | „Aber nimm nichts mit. Doch, nimm. Nein. Ach.“ (`W1_SMAU_SMA_0400`) · „Ich sammle nicht. Ich bewahre.“ (`W1_SMAU_SMA_0380`) | nirgends |
| **Moderwort** (2,5; 74 % Kurzsätze) | Großbuchstaben-Drohungen, vom Niesen zerhackt; am Ende leise. | „Sie hat Fotos gemacht! Vom Schlafzimmer!“ (`W1_THRO_MOD_0050`) · „Ich wollte nur, dass mich einer ernst nimmt. Einmal. Ohne zu niesen.“ (`W1_THRO_MOD_0380`) | nirgends |
| **Brunnen, Geheimtür, Spiegel** | Automatenstimme („Gewährt. Nicht zurückgeben, nicht umtauschen.“ `W1_DORF_BRU_0850`), Kichern („… Kicher. Richtig. Mama?“ `W1_SMAU_TUE_0770`), Schmeichler (`W1_LUFT_SPI_0100`). | | nirgends |

Kurz: Die Nebenfiguren sind die Stärke des Textes; man erkennt jede an einem Satz, auch ohne Namen. Max redet wie ein Jugendlicher, Opa wie ein Opa. Max und Pixel rücken in Welt 1 beim Satzbau zusammen (6,1 und 6,7 Wörter je Satz, Kurzsätze 25 % und 22 %); auseinander hält sie der Inhalt, weniger der Rhythmus. Wenn Pixels Schablonen (R5-TX-39, 40) gelöst werden, sollte er dabei seine langen Sätze behalten.

## Anspielungen und Filmzitate

| Zeile | Quelle | Passt? | Warum |
| --- | --- | --- | --- |
| `P0_DACH_PIX_0420` („Schnee“, Sendeschluss) | Fernsehen vor dem 24-Stunden-Programm | passt | Pixel ist das Haustier eines alten Bastlers; Max kennt es nicht, das trennt die Stimmen. |
| `ZS1_DACH_MAX_0425` (Zauberwürfel, „seit 1982“) | Rubik-Würfel | passt | Charakterisiert Opa in einem Satz. |
| `ZS3_DACH_PIX_0550` („Konner, Sahra“, Telefonbuch) | Terminator | passt | Wer es kennt, lacht, wer nicht, liest einen Namen. |
| `W1_ANK_TOA_0130`, Figuren Toadi und Zeldina | Super Mario, Zelda | passt | Die Welt ist der Fantasy-Kanal; Namen reichen als Hinweis. |
| `W1_DORF_TOA_1200`, `W1_WASS_TOA_0020`, `W1_LUFT_TOA_0600`, `W1_THRO_TOA_0540` | „Die Prinzessin ist in einem anderen Schloss“ (Super Mario Bros.) | passt genau | Siehe Running Gags; wird aufgebaut, wiederholt, gebrochen. |
| `W1_LUFT_ZEL_0860` (Rohr) | Super Mario | passt | Erklärt nebenbei, warum Toadi nie ankommt. |
| `W1_WALD_MAX_0010`, `0015` (Pilze, draufspringen, größer werden) | Super Mario | passt | Max nennt das Spiel nicht („Jedes Spiel aus meiner Kindheit“). |
| `W1_DORF_MAX_0130`, `0135` (Tierstapel, Räuber) | Bremer Stadtmusikanten | passt | „Boyband, die sich nie auf einen Sänger einigen konnte“ ist Max. |
| `W1_DORF_MAX_0250`, `0255`, `W1_TAV_PIX_0970`, `1000` (Kokosnusshälften) | Die Ritter der Kokosnuss | passt | Ohne Titel, nur das Geräusch; wird in der Taverne zum Rätselbaustein. |
| `W1_DORF_MAX_0260`, `W1_TAV_HUM_0010` („Zum tänzelnden Pony-Express“) | Der Herr der Ringe | passt | Wirtshausname plus Lieferdienst-Thema der Welt. |
| `W1_DORF_MAX_0240`, `0245` („Einer für alles“, „Ringe bitte nicht ins Feuer werfen“) | Der Herr der Ringe | passt | Als Ladenschild trocken genug. |
| `W1_TAV_GOL_0720`, `1570`, `W1_ABS_GOL_0220` („Mein Ssschätzchen“) | Gollum | passt | Einzige zitatnahe Stelle; im Englischen „My preciousss“. |
| `W1_TAV_MAX_0785`, `W1_HINT_PIX_0133` („Was hab ich in meiner Tasche?“) | Der Hobbit, Rätselspiel | passt genau | Die Anspielung ist die Rätsellösung; wer das Buch kennt, wird belohnt, wer nicht, bekommt den Hinweis. |
| `W1_TAV_MAX_0270`, `W1_TAV_HUM_0580` (Jahrgang Schicksalsberg) | Der Herr der Ringe | passt | Englisch „Mount Doomsday“, leicht verschoben, bleibt erkennbar. |
| `W1_TAV_MAX_0290` (Vielsaft-Limo) | Harry Potter | passt | „Schmeckt wie jemand anderes.“ |
| `W1_STAB_STA_0220`, `W1_INV_MAX_0020`, `W1_HINT_PIX_0210` („Der Stab wählt den Zauberer“) | Harry Potter | passt | Trägt das ganze Rätsel 2; Max' Antwort „Dieser hier hat Eintopf gewählt.“ |
| `W1_STAB_STA_0280` (Sortierhut in Rente, Socke), Hoggelwarz, Moderwort ohne Nase | Harry Potter | passt | Parodie über Namen und Bild, kein Zitat. |
| `W1_BRUE_WAL_0040` bis `0060` | Die drei Böcke Gruff | passt | Das Märchen ist das Rätsel. |
| `W1_BRUE_WAL_0262` („das mit der Katze, die auf dem Dach singt“) | Cats (mit Anklang an Anatevka) | passt | Absichtlich ungenau, so redet jemand, der es heimlich hört. |
| `W1_WALD_MAX_0120` bis `W1_WALD_PIX_0130` (Kürbis, Glasschuh, Mitternacht) | Aschenputtel | passt | „Mitternachts-Garantie“. |
| `W1_WALD_ROT_0260`, `0780` (Wolf als Kunde, Oma auf Mallorca) | Rotkäppchen | passt | Englisch „Spain“ statt Mallorca, in Ordnung. |
| `W1_LUFT_SPI_0100` („Spiegel, Spiegel …“) | Schneewittchen | passt | Der Spiegel schmeichelt jedem. |
| `W1_TURM_MAX_0135` („Hei-ho“) | Schneewittchen | passt | Ein Wort, kein Kommentar. |
| `W1_TURM_MAX_0095` (alter Meister mit Hut, „Halt“) | Der Zauberlehrling / Fantasia | **passt nicht ganz** | Erklärt die Vorlage („kommt nur in Filmen“), siehe R5-TX-32. |
| `W1_SMAU_MAX_0140`, `0145`, `0150` (Okarina, sieben Löcher, Regen) | Zelda: Ocarina of Time | passt | „Irgendwie kenn ich sie trotzdem“ ist die beste Art, ein Spiel zu zitieren. |
| `W1_SMAU_PIX_0160`, `W1_SMAU_MAX_0170` (Schwert im Stein) | Artus | passt | „Oder er bekommt Rücken.“ |
| Smaugi, Goldhaufen, Ei | Der Hobbit | passt | Drache als Sammler mit Putzfimmel; spiegelt Opa. |
| `W1_INV_MAX_0135` („Trink mich“) | Alice im Wunderland | passt | „Ich hab in Büchern gelesen, was danach passiert“ bleibt allgemein. |
| `W1_ABS_ALW_0080` („Du wirst nicht vorbeikommen.“) | Der Herr der Ringe (Gandalf) | **passt im Deutschen nicht** | Die deutsche Filmfassung sagt „Du kannst nicht vorbei!“, siehe R5-TX-35. |
| `UI_W4_ZS_TIERTORT` („Tiertort Savanne“ / „Paw and Order: Savannah“) | Tatort / Law & Order | passt | Gut lokalisiert, jede Sprache hat ihre eigene Krimireihe. |
| `UI_ERR_FREUND_0815`, `UI_OBJ_MODELL_0815` („Modell 08/15“) | deutsche Redewendung | im Englischen ohne Witz | Als Name tragbar; „Model 08/15“ sagt englischen Spielern nichts. Kein Fund, weil Welt 3 nicht in meinem Umfang liegt. |

Ergebnis: 31 Anspielungen im Umfang, 28 passen. Keine nennt den Titel der Vorlage; das ist die Stärke. Zwei Stellen fallen ab (`W1_TURM_MAX_0095`, `W1_ABS_ALW_0080`), eine trägt nur im Deutschen („Modell 08/15“).

## Running Gags

| Gag | Vorkommen im Umfang | Urteil |
| --- | --- | --- |
| „… in einem anderen Schloss“ | 6: Toadi kündigt an (`W1_DORF_TOA_1200`), sagt es (`W1_WASS_TOA_0020`), wird unterbrochen (`W1_LUFT_TOA_0600`), löst auf (`W1_THRO_TOA_0540`); dazu Alwins Milch (`W1_HOGG_ALW_0360_2`) und Toadis Gesprächsende (`W1_ABS_TOA_0090`) | Trägt. Vorbildlich gebaut: jedes Mal anders, am Ende die Umkehrung. Alwins Variante weicht von „wörtlich nur Toadi“ im Konzept ab, ist aber seit Fund 19 so gewollt und führt zum Luftschloss. |
| Pixels Essenswunsch und Einkaufsliste | Ei, weich: 10 Zeilen in Welt 1 und ZS1 (`W1_TAV_PIX_1450`, `W1_SMAU_PIX_0090_2`, `0095`, `0640_2`, `W1_INV_PIX_0105`, `0175_2`, `W1_THRO_PIX_0570_2`, `W1_HINT_PIX_1230`, `ZS1_DACH_PIX_0220`, `0324`); Liste in `UI_EINKAUF_1` bis `4` | Trägt. Die Steigerung von drei auf zweieinhalb Minuten hält ihn frisch. Zehnmal ist die obere Grenze; mehr sollte es in Welt 1 nicht werden. |
| „Meine Nase lügt nie. Sie interpretiert.“ | 3 (`W1_TAV_PIX_0340`, `W1_STAB_PIX_0540`, `W1_HOGG_PIX_0780`) | Trägt, bester Gag der Welt: Behauptung, Rückruf, Pointe in einem Wort. |
| Pixel wird getragen | 5 (`P0_DACH_PIX_1400`, `W1_DORF_PIX_0340`, `W1_LUFT_PIX_0020`, `0130_2`, `W1_HINT_PIX_0830`) | Trägt. |
| Der Staubsauger | 3 (`P0_DACH_PIX_0945`, `W1_WASS_PIX_0085_2`, `W1_LUFT_PIX_0485_2`) | Trägt, gut dosiert. |
| Schwerter mit Vornamen | Taverne durchgehend, `W1_SMAU_HUM_0530`, `W1_ABS_HUM_0060`, `W1_INV_MAX_0080` | Trägt; „Ingrid die Zweite“ ist die Auszahlung. |
| „Ich hab Übung.“ | 3 (`W1_LUFT_ZEL_0560`, `W1_THRO_ZEL_0260`, `W1_THRO_MAX_0420`) | Trägt; Max übernimmt Zeldinas Satz im letzten Moment. |
| „Fünf Körbe“ | 2 (`W1_WALD_ROT_0300`, `W1_WALD_MAX_0560`) | Trägt. |
| Opas Zettel („Alles hängt davon ab.“) | 3 (`W1_ANK_OPA_0070`, `W1_SMAU_MAX_0630`, `W1_THRO_MAX_0580`) | Trägt als roter Faden; Max weiß bis zum Schluss nicht, wovon. |
| Radio-Moment, Milch-Werbung | Welt 1 einmal (`W1_BRUE_GRA_0110`), Werbeblock in ZS1 bis ZS3 je einmal | Trägt und steigert sich; „Nur für Vergessliche“ zeigt auf Opa, ohne ihn zu nennen. |
| Passwort-Versuche | 4 (Prolog Viertel, ZS1 Viertel, ZS2 halbes mit Versprecher, ZS3 „Kuchen123“) | Trägt, steigert sich wie geplant. |
| „Ehrenwort eines Wissenschaftlers“ | 3 (`P0_DACH_OPA_0110`, `ZS1_DACH_OPA_0200`, `ZS3_DACH_OPA_0640`) | Trägt. |
| „Ich werfe nichts weg. Nie.“ | 2 wörtlich (`ZS1_DACH_OPA_0514`, `ZS2_DACH_OPA_0510`), einmal über Max (`ZS1_DACH_MAX_0420`); Echo bei Smaugi | Trägt; im Englischen nicht wortgleich (R5-TX-14). |
| „Modell …“ | 5 bei Opa (Pixel, Kleiderbügel zweimal, Spezialzwecke, Enkel) | Trägt. |
| Roter Kreis im Kalender, Opas Ausreden | Prolog, ZS1, ZS2, ZS3 | Trägt; jede Ausrede ist dünner. |
| Rückverwandlungsschwund | ZS1, ZS2, ZS3 (abgekürzt) | Trägt; die Abkürzung in ZS3 ist richtig. |
| 17 Fernbedienungen | Prolog, ZS1, ZS2, ZS3 | Trägt. |
| „junger Mann“ | Prolog 2, ZS1 1, Welt 1 4 (`W1_ANK_PIX_0020_2`, `W1_TAV_PIX_0150_2`, `W1_STAB_PIX_0490`, `W1_TURM_PIX_0170`) | Eingehalten (Grenze vier je Abschnitt). |
| „Ich sage nichts“ / „Ich nenne keine Namen“ | Welt 1 einmal (`W1_HINT_PIX_0111_2`), ZS1 einmal, ZS3 dreimal | In ZS3 einmal zu viel (R5-TX-12, W3-1). |
| „freiwillig“ | Prolog 2, Welt 1 4, ZS2 1 | Trägt; die Auszahlung in ZS2 („Haushalt … Freiwillig.“) sitzt. |
| Pixels Schnupper-Dreier | 13 in Welt 1, dazu 2 im Zuruf | **Abgenutzt ab dem dritten Raum** (R5-TX-39). Als Gag war er nie gemeint; er ist ein Bauplan. |
| „beides“ / „das Zweite mehr“ | 5 in Welt 1, je einmal in Prolog und ZS1 | Abgenutzt ab dem zweiten Mal (R5-TX-15). |

## Lokalisierung, Zusammenfassung

- **Fehlend oder leer:** keine Zeile. Englisch und Deutsch gleich nur bei Namen, Lauten und Fachwörtern (Prüfung `tx-a_zaehlen.py en`).
- **Pointe oder Hinweis im Englischen verloren:** `ZS1_DACH_OPA_0390`/`MAX_0400` (aufgehen/rise, R5-TX-13), `W1_DORF_MAX_0840` und drei weitere (hoch hinaus/go far, R5-TX-18), `W1_DORF_MAX_0160` (trägt/wear, R5-TX-19), `SYS_ERS_PIX_0300`, `SYS_WDH_MAX_0080` (R5-TX-44). Kleiner: `W1_DORF_MAX_0270` (meckern), `W1_ABS_SCH_0160` (Blech).
- **Namen und Begriffe:** „Moderwort“ statt „Mouldword“ in zwei englischen Zeilen (R5-TX-33); Objektnamen gegen Dialog (R5-TX-42); „pockets“ gegen „compartments“ (R5-TX-14); „boy“ gegen „lad“ (R5-TX-06).
- **Stimme:** Pixel englisch ohne Kurzformen in 693 von 699 Zeilen, sechs Ausreißer (R5-TX-33); „young man“ beim Stabmacher ergänzt (R5-TX-24). Zum offenen Punkt P10 (passt Pixels Tonfall ohne Kurzformen?): Aus meiner Sicht ja. Es ist das englische Gegenstück zu seinen langen deutschen Sätzen und trennt ihn hörbar von Max.
- **Länge, Sprechblasen:** Deutsch nie über 140. Englisch über 140: `P0_DACH_MAX_0282` (144), `ZS1_DACH_MAX_0420` (143) und sechs Zeilen in Welt 1 (R5-TX-38). Englisch ist im Schnitt kürzer (Welt 1: 70 gegen 74 Zeichen).
- **Länge, Oberfläche (Abschneide-Risiko, nicht im Spiel geprüft):** Englisch deutlich länger als Deutsch bei `UI_RAUM_DORFPLATZ` (28 gegen 21), `UI_RAUM_LUFTSCHLOSS` / `UI_OBJ_LUFTSCHLOSS` (17 gegen 11), `UI_RAUM_ZAUBERWALD` (16 gegen 10), `UI_RAUM_STARTBUERO` (19 gegen 9), `UI_RAUM_GRABHUEGEL` (24 gegen 17), `UI_OBJ_ZEUGNIS` (25 gegen 17), `UI_OBJ_TARIFVERTRAG` (20 gegen 12), `UI_OBJ_RANKENENDE` (20 gegen 10), `UI_OBJ_FUNDKISTE` (18 gegen 9), `UI_W4_ZS_TIERTORT` (23 gegen 16), `UI_W4_ZS_KANAL_999` (33 gegen 25), `UI_EINKAUF_1` (35 gegen 28), `UI_EINKAUF_2` (37 gegen 30), `UI_OPT_FARBENBLIND_HILFE` (55 gegen 48), `UI_ERR_OHNE_PFOTE_1_TEXT` bis `4` (59 gegen 54), `UI_LADEN_NACH_SZENE` (35 gegen 30), `UI_OPT_GERAEUSCHE` (13 gegen 9). Wo ein Feld auf die deutsche Länge gebaut ist, sind das die ersten Kandidaten.
- **Blasen ungleich geteilt:** `W1_HINT_PIX_0330`/`_2` (R5-TX-37).
- **Lehrbuch-Englisch:** selten. Fundstellen in R5-TX-07 (Prolog), R5-TX-44. Sonst liest sich das Englische britisch und gesprochen („beanpole“, „knocking-off time“, „Not happening“).
- **Gut lokalisiert:** „Waffleton“, „Mouldword“, „Manyjuice Lemonade“, „Paw and Order: Savannah“, Größe 38 wird „size 5“, „Mausi“ wird „Kitty-Wiggles“, „We're traditional, not fussy.“ (`W1_BERG_GRI_0360`), die Reime auf Alwins Zettel halten alle drei Rätselregeln.

## Frühere Funde, Stand heute

| Alter Fund | Stand | Beleg |
| --- | --- | --- |
| Durchgang 14.11., Fund 7 (Minka und Topf, Text gegen Bild) | Text passt; Bild nicht geprüft | `W1_HINT_PIX_0111` „lässt dich nicht an den Topf“ |
| Fund 9 (Toadi als Pilz) | Text unverändert stimmig; Bild nicht geprüft | „Familie?“ `W1_HOGG_TOA_0730` |
| Fund 10 (Blasen über 140 Zeichen) | Deutsch behoben (Höchstwert 140); Englisch 8 Zeilen darüber | R5-TX-07, R5-TX-14, R5-TX-38 |
| Fund 19 („In welchem Schloss?“ ohne Bezug) | behoben | `W1_HOGG_ALW_0360_2` |
| Fund 25 (Text gegen Bild) | Kessel und Streikschilder im Text bereinigt. **Etiketten weiterhin widersprüchlich**, siehe R5-TX-45 unten | `W1_HOGG_MAX_0140`, `W1_HOGG_PIX_0150` |
| Fund 28 (Muster) | „junger Mann“ eingehalten. Medienvergleiche: höchstens vier je Raum, kein Fund mehr. „Ich hab …“ als Zeilenanfang: in Welt 1 22 Zeilen, höchstens drei je Raum, kein Fund; im Prolog weiterhin gehäuft (R5-TX-01) | Zählung |
| Schwächste Zeilen laut 14.11., Abschnitt 4 | `W1_TAV_MAX_1230` und `W1_THRO_MAX_0310` überarbeitet. Unverändert, aber aus meiner Sicht tragbar: `W1_ANK_MAX_0050`, `W1_DORF_MAX_0110`, `W1_SCHM_MAX_0010`, `W1_STAB_MAX_0090`, `W1_TAV_MAX_0360`, `W1_HOGG_MAX_0040`, `W1_BRUE_MAX_0030`, `W1_SMAU_MAX_0690`. Weiterhin schwach: `W1_TURM_MAX_0095` (R5-TX-32), `W1_DORF_MAX_1160` (leeres „Okay.“) | siehe Raumtabellen |
| ND-22 (Ankunft Welt 1 lang) | nicht neu gemessen; `W1_ANK` hat weiterhin 34 Zeilen | Zeilenzahl |
| ND-23 (Rückkehr ZS1 als eine Szene, 32 Zeilen) | weiterhin offen | `room_dachboden.gd`, eine Szene |
| ND-24 (vier Erzählzeilen über 75 Zeichen) | weiterhin offen, Längen unverändert: `W1_HOGG_NAR_0010` (122), `W1_DORF_NAR_0920` (105), `W1_DORF_NAR_1150` (96), `W1_TAV_NAR_0040` (91) | Zählung |
| P10 (Pixel englisch ohne Kurzformen) | Entscheidung offen; Empfehlung: beibehalten, sechs Ausreißer angleichen | R5-TX-33 |
| P11 (`P0_WOHN_MAX_0355`, neun/acht Buchstaben) | weiterhin offen | R5-TX-04 |
| W3-1 („Ich sage nichts“ in ZS3) | weiterhin offen, eine Zeile übrig | R5-TX-12 |
| W3-2 (kein KI-Klang-Durchgang für Welt 1, ZS1, ZS2) | mit dieser Notiz geprüft; Umsetzung steht aus | diese Notiz |

| ID | Zeilen-ID | Sprecher | Priorität | Muster | Original | Grund | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R5-TX-45 | `W1_HOGG_PIX_0150` (gegen `W1_HOGG_MAX_0140`, `W1_HOGG_ALW_0380`, `W1_HOGG_MAX_0930`) | Pixel | kosmetisch | Widerspruch im Rätseltext; **weiterhin offen (Fund 25 vom 14.11., Teil Etiketten)** | Pixel: „Sechs Flaschen, kein Etikett.“ – Max am selben Hotspot: „Sechs braune Flaschen mit vertauschten Etiketten“, Alwin: „Die Etiketten hat jemand vertauscht.“, Max: „Eine Flasche, deren Etikett lügt.“ | Am selben Regal sagt eine Figur „vertauscht“, die andere „keins“. Für das Flaschenrätsel ist das die Frage, ob Lesen hilft. Welche Fassung zum Bild passt, habe ich nicht geprüft. | Wenn die Flaschen im Bild Etiketten tragen: „Sechs Flaschen, und kein Etikett stimmt. Ich rieche sie von hier aus, alle sechs.“ Wenn nicht: `0140` „Sechs braune Flaschen ohne Etikett, und zwei davon sind deutlich größer.“, `0930` „Eine Flasche ohne Etikett.“, Alwin „Die Etiketten hat jemand abgemacht. Vermutlich ich.“ |

## Gut gelöst

- **Die Nebenfiguren.** Jede hat nach zwei Sätzen eine eigene Stimme, und keine klingt nach der anderen: Waldemar („Die Versammlung bin ich. Ich bin nie beschlussfähig.“ `W1_BRUE_WAL_1270`), der Schmied („Wie Schulden.“ `W1_SCHM_SCH_0240`), Gollo („Ich habe verloren. Endlich.“ `W1_TAV_GOL_1210_2`), Rotkäppchen („Mittel war leider aus, ich hab dir XXL mitgebracht. Da wächst du schon noch rein.“ `W1_DORF_ROT_0930`), Smaugi („Doch, nimm. Nein. Ach.“ `W1_SMAU_SMA_0400`).
- **Max' Entwicklung steht in kleinen Reaktionen.** „Ja. … Trotzdem.“ (`W1_LUFT_MAX_0310`), „Ich könnte jetzt gehen. // … Zeldina hat immer noch keine Wohnung.“ (`W1_SMAU_MAX_0645`), „Haushalt … Freiwillig.“ (`ZS2_DACH_MAX_0160` bis `0200`). Nirgends wird ein Gefühl ausgesprochen oder eine Lehre gezogen.
- **Anspielungen ohne Erklärung.** „Was hab ich in meiner Tasche?“ ist zugleich Zitat und Rätsellösung; die Okarina („irgendwie kenn ich sie trotzdem“) und die Kokosnusshälften kommen ohne Titel aus.
- **Rückrufe über Räume hinweg.** „Interpretiert.“ (`W1_HOGG_PIX_0780`), „Fünf Körbe, Waldemar.“ (`W1_WALD_MAX_0560`), „Ich auch. Aber ich hab Übung.“ (`W1_THRO_MAX_0420`), Grimmzahns Daumen, Smaugis dreihundert Teekannen als Provision.
- **Rätselauskunft zuerst und wörtlich.** Die 72 Hinweiszeilen sagen auf Stufe 3 immer den Handgriff und bleiben trotzdem Pixel („Sag es der Tür. Sag es nie mir.“ `W1_HINT_PIX_1131`).
- **Das Schloss-Motiv** (sechs Stellen, jede anders, am Ende umgedreht) und die Passwort-Versuche über vier Abschnitte sind sauber gesteigert.
- **Kaum klassische Maschinenmerkmale.** In 3148 Zeilen zwei Gedankenstriche, eine Stockphrase, kein Signposting, keine Meta-Sprache, keine Schlussmoral. Was bleibt, sind wiederholte Baupläne, und die lassen sich mit einigen Dutzend geänderten Zeilen lösen.

## Nicht geprüft

- Nicht gespielt. Keine Blase und kein Feld im laufenden Spiel gesehen: Abschneiden, Umbruch, Einblenddauer und die Länge englischer Namen in der Oberfläche sind nur gezählt.
- Keine Bilder geprüft. Aussagen zu Text gegen Bild (Etiketten in Hoggelwarz, Minka am Topf, Toadis Hut) betreffen nur den Text.
- Welche Zeilen im Spiel wirklich hintereinander fallen, kenne ich nur aus den Regie-Anmerkungen im Auszug; die Skripte unter `docs/skript/` habe ich nicht gesondert durchgelesen, das Rätsel-Dokument nur nachgeschlagen.
- Die Prüfskripte von humanizer-de habe ich nicht ausgeführt; der Katalog diente nur zur Benennung.
- Keine Vertonung, keine Sprachausgabe; „laut gelesen“ heißt hier: auf Sprechbarkeit gelesen.
- Englisch als Nicht-Muttersprachler geprüft. Die Vorschläge sollte jemand mit britischem Ohr gegenlesen.
- Dialoge von Welt 2 bis 4 und Finale liegen nicht in meinem Umfang; von dort habe ich nur die `UI_`-Zeilen gelesen.
- Das Timing der Ankunftsszenen (ND-22, ND-23) habe ich nicht neu gemessen.

## Vorschläge für die Lessons Learned

1. **KI-Klang sitzt hier im Bauplan, nicht im Satz.** Die Zeilen sind einzeln gut; auffällig werden sie, wenn derselbe Zeilentyp in jedem Raum gleich gebaut ist. Deshalb Texte nicht nur raumweise gegenlesen, sondern je Zeilentyp quer über alle Räume: alle Schnupper-Zeilen untereinander, alle Zurufe, alle zweiten Blicke. `tx-a_auszug.py` liefert die Regie-Angabe je Zeile, damit geht das in Minuten.
2. **Formeln je Welt zählen, nicht nur je Raum.** „Höchstens einmal pro Raum“ hat bei Pixels Dreierreihe nicht gegriffen, weil sie in jedem Raum genau einmal steht. Ergänzung für die Dialogregeln: Ein Öffner-Bau (Reihe aus drei Hauptwörtern, „Entweder … oder … beides“, „kein X mehr, das ist Y“) höchstens dreimal je Welt und nur bei einer Figur.
3. **Nachgetragene Zeilen brauchen dieselbe Englisch-Prüfung wie der Rest.** Die Fehler in R5-TX-33 stehen alle in später ergänzten Zeilen. Vier Prüfungen lassen sich in `tools/pruefen.py` einbauen: deutscher Eigenname in der englischen Spalte (Liste Moderwort, Schwurbelstein, Grimmzahn, Zapp-O-Mat …), Kurzform in englischen Pixel-Zeilen, englische Blase über 140 Zeichen, Blasen in Deutsch und Englisch stark ungleich geteilt.
4. **Wortspiele beim Schreiben markieren.** „Aufgehen“, „hoch hinaus“, „trägt“ sind im Englischen wörtlich übersetzt worden und haben Pointe oder Hinweis verloren. Eine Anmerkung im Skript („Doppelsinn: Teig und Plan“) reicht.
5. **Zitate in der Fassung nachschlagen, die das Publikum kennt.** „You shall not pass“ heißt im deutschen Film „Du kannst nicht vorbei!“.
6. **Englische Objektnamen als Glossar führen.** `UI_OBJ_` ist die Quelle; Dialog und Hinweise benutzen dasselbe Wort (R5-TX-42).

## Werkzeug

- `docs/review/2026-11-21/werkzeuge/tx-a_auszug.py ZIELORDNER`: schreibt je Präfix und Raum eine Lesedatei mit Schlüssel, Sprecher, Regie, Deutsch und Englisch; markiert Zeilen, die in früheren Notizen vorkommen.
- `docs/review/2026-11-21/werkzeuge/tx-a_zaehlen.py [muster|laenge|sprecher|en] [--ids] PRÄFIXE`: Rohzählung der Muster, Zeichenlängen, Satzlängen je Sprecher, Auffälligkeiten im Englischen. Die Zahlen in dieser Notiz stammen daraus oder aus Einzelsuchen in `texte.csv`; jede gemeldete Zeile habe ich gelesen.

## Zusammenfassung in Zahlen

| Abschnitt | Zeilen | kritisch | wichtig | kosmetisch | KI-Klang |
| --- | --- | --- | --- | --- | --- |
| Prolog | 333 | 0 | 1 (R5-TX-01) | 8 | gering; auffällig nur die Benutzen-Schablone |
| Zwischenspiele 1–3 | 309 | 0 | 1 (R5-TX-13) | 4 | gering, ZS1 gering bis mittel (Kontrast-Häufung) |
| Welt 1 | 1433 | 0 | 3 (R5-TX-18, 33, 39) | 25 | gering bis mittel; wiederholte Baupläne bei Pixel |
| System, Oberfläche | 1073 | 0 | 0 | 3 | gering; nur Lokalisierung |
| **Summe** | **3148** | **0** | **5** | **40** | |

45 Funde, R5-TX-01 bis R5-TX-45. R5-TX-45 steht unter „Frühere Funde, Stand heute“ und zählt zu Welt 1.

FERTIG
