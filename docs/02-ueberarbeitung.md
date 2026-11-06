# Überarbeitung nach den Gutachten

57 Änderungen aus zwei Runden. Runde 1 (Nr. 1–29) führt zwei Gutachten zusammen (Claude Fable und ein zweiter Agent) und ist bis auf die Produktionspunkte erledigt. Runde 2 (Nr. 30–57) stammt aus Fables 360-Grad-Review vom 5. November 2026, Gesamtnote 7/10, und ist offen.

## Wo sich die Gutachten unterscheiden

| Thema | Claude Fable | Zweiter Agent | Empfehlung |
| --- | --- | --- | --- |
| Rätseldesign | 7/10, einige unfaire Stellen und Engpässe | Note 1,0, kaum Mondlogik | Fables Einzelkritik umsetzen; sie benennt konkrete Rätsel, der Agent lobt das System als Ganzes |
| Anzahl der Welten | Auf drei kürzen, Welt 3 in Welt 4 aufgehen lassen | Vier behalten, in Episoden veröffentlichen | Vier im Konzept behalten, aber Episode 1 (Prolog und Welt 1) zuerst bauen; danach neu entscheiden |
| Portale in Welt 3 | Streichen, Code-Sicht als einzige neue Mechanik | Behalten, beim Flug durch das Portal friert die Zeit ein | Streichen: spart viel Programmierarbeit, und die Code-Sicht trägt die Welt allein |
| Sendeuhr in Welt 4 | Nur für zwei Rätsel nutzen | Funktion „Warten bis Sendung X“ | Beides kombinieren: nur zwei zeitgebundene Rätsel, und die Programmzeitschrift springt per Klick zur Sendezeit |
| Fünfkampf | Wettkampftage auf zwei kürzen, Minispiele insgesamt auf vier | Zwei bis drei Disziplinen als Dialog- oder Inventar-Sequenzen | Beides: zwei Wettkampftage, zwei echte Minispiele (Hebel, Rede-Ringen), der Rest als witzige Zwischensequenz nach gelöster Vorbereitung |

## Priorität hoch

| Nr. | Änderung | Betrifft | Quelle | Status |
| --- | --- | --- | --- | --- |
| 1 | **Twist motivieren:** Opas „böser“ Auftritt entsteht aus einem Missverständnis. Die Backmaschine verriegelt wegen Teig-Überdrucks die Tür, Oma ist schon auf der Treppe, und Opa schreit in Panik geschwollene Sätze über sein „dunkles Werk“ (Schokokuchen), die nach Weltherrschaft klingen. | Konzept: Finale | Beide | Erledigt |
| 2 | **Max bekommt eine Entwicklung:** vom Couch-Potato zum Jungen, der am Ende freiwillig die Milch holt. Kleine Momente in jeder Welt bereiten das vor. | Konzept: Überblick, Finale | Fable | Erledigt |
| 3 | **Episode 1 zuerst:** Prolog und Welt 1 als eigenständige Episode fertigstellen und veröffentlichen, bevor andere Welten gebaut werden. | Produktion | Beide | Offen |
| 4 | **Grundgerüst vor Inhalt:** Laufen, Klick-Interface, Inventar mit Kombinieren, Dialoge, Figurenwechsel, Speichern und Pixels Hilfesystem in Godot bauen. | Produktion | Fable | Offen |
| 5 | **Vertical Slice:** Prolog plus Welt 1 Rätsel 1 bis 4 (Taverne, Zauberstab, Ziegen, Troll), etwa 30 Minuten Spielzeit, mit fremden Spielern testen. | Produktion | Beide | Offen |
| 6 | **Minispiele reduzieren:** zwei Wettkampftage statt drei; nur Hebel und Rede-Ringen bleiben echte Minispiele, die anderen Disziplinen werden Zwischensequenzen nach gelöster Vorbereitung. | Welt 2 | Beide | Erledigt |
| 7 | **Portale streichen:** Die Testkammern nutzen nur noch die Code-Sicht, ohne Schwung-Physik. | Welt 3, Rätsel 9 | Fable | Erledigt |
| 8 | **Sendeuhr entschärfen:** nur Alibi (20:15) und Zombie-Video (Mitternacht) sind zeitgebunden; die Programmzeitschrift springt per Klick zur Sendezeit. | Welt 4, Rätsel 4, 5, 11 | Beide | Erledigt |
| 9 | **Engpässe auflösen:** Flaschenrätsel auf mittel (drei Regeln) und Socke/Archiv anders freischalten; vor dem Passierschein einen zweiten Weg zu Tag 1 öffnen. | Welt 1, Rätsel 6; Welt 2, Rätsel 3 | Fable | Erledigt |
| 10 | **Unfaire Rätsel fair machen:** Luftschloss von Anfang an am Himmel sichtbar (W1 R5); Hinweis, dass klebrige Dinge den Stab „wählen“ lassen (W1 R2); Hinweis im Büro auf das Rundschreiben (W2 R3); Sphinx mit drei festen Lösungswörtern und je drei Hinweisen (W2 R8). | Welt 1 und 2 | Fable | Erledigt |
| 11 | **Timing entfernen:** Besen-Wachen als reines Beobachtungsrätsel (W1 R11); kein Quiz-Timer beim Glücksrad-Hauptgewinn (W4 R9). Der Tausch im Flug (W3 R9) entfällt mit den Portalen. | Welt 1, 3, 4 | Beide | Erledigt |
| 12 | **Konzept und Rätsel-Tabs angleichen:** Selfie-Startgebühr streichen (W2), Hexenschuss-Gag als Mini-Gag bei Agent Schmidt einbauen (W3 R6), Sitcom-Kochidee durch den Kommissar-Besuch ersetzen (W4); dazu die Namen ersetzen: „Sahra Connor“ statt Sarah Connor, „Tiertort“ statt Tatort, keine Figurendesigns nachzeichnen. | Konzept, Welt 2 bis 4 | Beide | Erledigt |

## Priorität mittel

| Nr. | Änderung | Betrifft | Quelle | Status |
| --- | --- | --- | --- | --- |
| 13 | **Milch-Lücke schließen:** Die Ziegenmilch geht im Zaubertrank komplett drauf, und Max weigert sich, die schwertfressende Ziege noch einmal zu melken. Sonst wirkt „Wo ist die Milch?“ am Ende unlogisch. | Welt 1, Rätsel 6; Finale | Zweiter Agent | Erledigt |
| 14 | **Verbündete im Finale auf zwei reduzieren:** Zeldina und Hausmeister Modell 08/15 (früher T-800), der nur erscheint, wenn Max ihn in Welt 3 mit Olivenöl befreundet hat. | Konzept: Finale | Fable | Erledigt |
| 15 | **Welt 3 aufräumen:** Regel 1 wird bisher in Rätsel 6 und 7 vergeben; eindeutig festlegen. Außerdem eine klare Regel, was zwischen Simulation und Realität mitreisen kann (Zugangskarte). | Welt 3 | Fable | Erledigt |
| 16 | **Wunderdinge zurücksetzen:** Ein verbrauchtes Wunderding wird weit flussaufwärts wieder unbenutzt, gegen eine kleine Aufgabe des Fährmanns. | Welt 2 | Zweiter Agent | Offen |
| 17 | **Siegesparade entschärfen:** nach dem Fünfkampf-Höhepunkt nur noch leicht oder als reine Belohnungsszene. Entschieden: Die Parade bleibt bewusst ein mittleres Rätsel nach dem Höhepunkt, weil sonst ein anderes Rätsel von Welt 2 schwerer werden müsste; kein anderes Rätsel wurde dafür geändert. | Welt 2, Rätsel 11 | Fable | Erledigt |
| 18 | **Bild-in-Bild vereinfachen:** als geskriptete Szene statt frei nutzbarer Taste, um die doppelte Szenendarstellung zu sparen. | Welt 4, Rätsel 6 und 13 | Fable | Erledigt |
| 19 | **Reisetasche mit Hinweisen:** Pixel kommentiert beim Packen jeden Gegenstand kryptisch, damit Spieler nicht blind wählen. | Konzept | Fable | Erledigt |
| 20 | **Pixel in Welt 4 einbinden:** Er krabbelt durch das Rauschen zwischen den Kanälen und verhandelt in Tatort Savanne mit den Großkatzen, während Max nur Gebrüll versteht. | Welt 4 | Zweiter Agent | Erledigt |
| 21 | **Eigenständige Figuren:** pro Welt mindestens zwei Figuren, die kein Zitat sind; Parodiefiguren bekommen eigene Marotten wie die Goblin-Gewerkschaft. | Alle Welten | Beide | Erledigt |
| 22 | **Bürokratie-Gags ausdünnen:** von etwa acht auf die drei besten; die anderen durch Slapstick, Fehlübersetzungen von Pixel oder Erwartungsbruch ersetzen. Laut Review 2 waren es noch acht, siehe Nr. 41. Stand jetzt: drei Formular-Gags (Goblin-Gewerkschaft, Passierschein, Maklerin); bewusst bleiben Hausmeister-Posten (Welt 1, Rätsel 10, Weg B), Zeremonienmeister (Welt 2, Rätsel 11) und Empfangsdame (Welt 4, Rätsel 12), weil sie keine Formular-Gags sind. | Alle Welten | Fable | Erledigt |
| 23 | **Gemeinsame Technik:** Code-Sicht und Fernbedienung auf derselben Grundlage bauen (Objektzustände per Overlay umschalten). | Produktion | Zweiter Agent | Offen |
| 24 | **Logikrätsel ausarbeiten:** Flaschen (W1 R6), Diskus-Dieb (W2 R7) und Tatort Savanne (W4 R4) mit konkreten Regeln schreiben und prüfen, dass genau eine Lösung herauskommt. | Welt 1, 2, 4 | Eigene Notiz | Erledigt |

## Priorität niedrig

| Nr. | Änderung | Betrifft | Quelle | Status |
| --- | --- | --- | --- | --- |
| 25 | **Dramatische Ironie bewusst spielen:** Aufmerksame Spieler ahnen den Backofen früh (Type 405, AA-Batterie). Pixel darf das andeuten, während Max ahnungslos bleibt. | Konzept: Finale | Fable | Erledigt |
| 26 | **Katzengott öfter nutzen:** mindestens ein weiteres Rätsel mit Pixels Gottstatus, etwa mit dem Hofkater des Pharaos als Rivalen. | Welt 2 | Fable | Erledigt |
| 27 | **Zeitfähre sichtbar machen:** Gegenstände altern während der Fahrt sichtbar im Inventar, damit die Regel ohne Erklärung verständlich ist. | Welt 2 | Fable | Erledigt |
| 28 | **Weniger Superhelden:** von sieben auf drei. Grafik und Rätsel haben drei, das Konzept noch sieben, siehe Nr. 50. | Konzept: Welt 4 | Fable | Offen |
| 29 | **Tempo in Welt 3:** Die schweren Rätsel 6, 7, 9 und 10 nicht direkt hintereinander, sondern mit leichteren dazwischen. | Welt 3 | Fable | Erledigt |

## Runde 2: 360-Grad-Review (Fable, 5. November 2026)

Gesamtnote 7/10. Fast alle Baustellen sind Schreibarbeit; nach Nr. 30–50 erwartet Fable überall mindestens 8, außer beim Umfang (6–7).

| Kategorie | Note | Kernkritik |
| --- | --- | --- |
| Rätseldesign | 7 | Logikrätsel korrekt; Feigen-Logikloch, Katzenhaar ohne Hinweis, Finale ohne Fallback |
| Struktur | 7 | Hoggelwarts über Weg B optional, Welt 3 fast linear, Sonnenbrille ohne Fundort |
| Welten | 8 | Jede Welt mit eigener Mechanik; Welt 3 hat zu viele Regeln |
| Ablauf und Tempo | 6 | Rätsel nach dem Höhepunkt, sieben Minispiele, Sofa-Versuchung doppelt, Max fehlt ein Grund weiterzumachen |
| Umfang | 5 | Solo 2,5–4 Jahre, keine Ziel-Spielzeit |
| Abwechslung | 8 | Sehr breiter Rätselmix; einige Figurentypen doppelt |
| Gag-Dichte | 7 | Zwei Running Gags nie platziert, noch acht Bürokratie-Gags |
| Anspielungen, Qualität | 6 | Wörtliche Zitate, „T-800“ als Markenbegriff, Retro-Witze aus Max' Mund |
| Anspielungen, Anzahl | 6 | Welt 3 mit etwa 25 übersättigt, Prolog dünn, Streaming und deutsches TV fehlen |
| Humor | 7 | Max und Pixel tragen; Max erklärt zu oft die Vorlage |
| Durchgängigkeit | 5 | 18 Widersprüche zwischen den Tabs |
| Figuren und Story | 7 | Zeldina, M.U.T.T.I., Pixel stark; Zappmann dünn, Oma ohne Satz |
| Gesamteindruck und Markt | 7 | Klarer Verkaufssatz; Risiko KI-Offenlegung und Episodenmodell |

### Priorität hoch: Sackgassen und Logik

| Nr. | Änderung | Betrifft | Quelle | Status |  |
| --- | --- | --- | --- | --- | --- |
| 30 | **Kochlöffel absichern:** Moderwort gibt den Löffel nach R12 beschämt zurück, er reist automatisch mit; dazu ein dritter Weg im Finale | Welt 1 R12, Finale | Fable 360 | Erledigt |  |
| 31 | **Feigen-Regel:** Geerntetes altert auf der Zeitfähre nicht zurück; einmal im Inventar erklären | Welt 2 R6 | Fable 360 | Erledigt |  |
| 32 | **Sonnenbrille erwerbbar:** Das verunsicherte Original legt sie nach dem Original-Kopie-Tausch ab | Welt 3 R6 | Fable 360 | Erledigt |  |
| 33 | **Wasserschloss:** als kurze Toadi-Gag-Szene ergänzen oder aus der Belohnung streichen | Welt 1 R4 | Fable 360 | Erledigt | als gag szene → umgesetzt (Welt 1, Rätsel 4; Grafik Welt 1) |
| 34 | **Backmaschine logisch:** Opa legt Ei und Mehl ein; Fernbedienung mit Batterie stoppt die Maschine | Konzept: Finale | Fable 360 | Erledigt |  |
| 35 | **Keine zweite Kapsel:** Das Labor ist eine tiefere Ebene derselben Simulation, die Laborkapsel entfällt; der Fenster-Weg in R11 stimmt dann wieder | Welt 3 R9, R11; Grafik Welt 3 | Fable 360 | Erledigt |  |
| 36 | **Katzenhaar-Hinweis:** Ein Übungsbesen in Hoggelwarts dreht durch, sobald Pixel hereinkommt | Welt 1 R11 | Fable 360 | Erledigt |  |
| 37 | **Brunnen-Wunsch als Auswahl** statt Freitext | Welt 1 R5 | Fable 360 | Erledigt |  |

### Priorität mittel: Humor, Anspielungen, Ablauf

| Nr. | Änderung | Betrifft | Quelle | Status |  |
| --- | --- | --- | --- | --- | --- |
| 38 | **Max' Stimme altersgerecht:** Retro-Pointen (Testbild, Kassetten) an Pixel oder Opa; Max bekommt Streaming-, Autoplay- und Spoiler-Humor; Regel: Max erklärt nie die Vorlage | Alle Welten, Konzept | Fable 360 | Erledigt |  |
| 39 | **Welt 3 entschlacken:** Matrix-Verweise kürzen, wörtliche Zitate abwandeln, „T-800“ umbenennen (z. B. „Modell 08/15“); Umfang der Star-Wars-Gags prüfen (auf drei Gags plus Piepsi gekürzt) | Welt 3, Finale | Fable 360 | Erledigt | erstmal nur prüfen und dann rückmeldung geben. → Umgesetzt: Frau im roten Kleid und doppelte Déjà-vu-Szene gestrichen, Löffel- und Müllpressen-Zitat abgewandelt, T-800 heißt jetzt Modell 08/15. Star Wars auf Piepsi, Hologramm, Gedankentrick und Kessel-Lauf gekürzt; Leuchtstoffröhre und Müllpresse gestrichen. |
| 40 | **Running Gags platzieren:** „Deine Prinzessin ist in einem anderen Schloss“ und ein Radio-Moment je Welt 2–4 | Welt 2–4 | Fable 360 | Erledigt |  |
| 41 | **Bürokratie-Gags wirklich auf drei** (Goblin-Gewerkschaft, Passierschein, Maklerin) | Alle Welten | Fable 360 | Erledigt | Teilweise: drei Formular-Gags (Goblin-Gewerkschaft, Passierschein, Maklerin); Hausmeister-Posten, Zeremonienmeister und Empfangsdame bleiben bewusst, weil sie keine Formular-Gags sind. |
| 42 | **Max' Motivation:** Opa rückt das WLAN-Passwort erst nach dem vierten Gegenstand heraus | Konzept, Rückkehr-Szenen | Fable 360 | Erledigt |  |
| 43 | **Entwicklung in Welt 2:** kurze Trainings-Szene mit Archimedes nach R5 | Welt 2 | Fable 360 | Erledigt |  |
| 44 | **Kein Rätsel nach dem Höhepunkt:** Smaugi vor Moderwort legen; Minispiele von sieben auf fünf | Welt 1, alle Minispiele | Fable 360 | Erledigt | Wenn ohne Story oder rätsel verlust machbar, rätsel vorverlegen.\
Überprüfung inwieweit mini spiele durch rätsel ersetzt werden können. Fünfkampf bleibt aber so. → Smaugi kommt jetzt vor Moderwort (Welt 1, Rätsel 12 und 13 getauscht). Aufräumen (Welt 1) und Schiebepuzzle (Welt 4, Rätsel 1) sind jetzt Rätsel statt Minispiele. Echte Minispiele bleiben Hebel, Rede-Ringen und Rhythmus; Comic-Panels und Quiz zählen als rätselartige Einlagen. |
| 45 | **Sofa-Versuchungen unterscheiden:** blaue Pille = Unwissenheit, Zappmann = gesehen werden ohne etwas zu tun | Welt 3 R3, Welt 4 R13 | Fable 360 | Erledigt |  |
| 46 | **Zappmann vertiefen:** ein ehemaliges Kind wie Max, das nie mehr aufgestanden ist | Welt 4 | Fable 360 | Erledigt |  |
| 47 | **Oma bekommt den Satz,** der die Milch nötig macht: „Kuchen ohne Milch? Konrad.“ | Finale | Fable 360 | Erledigt |  |
| 48 | **Opas frühere Reisen** erklären Hologramm, Goldene Fernbedienung und die Dachboden-Poster | Konzept, Prolog | Fable 360 | Erledigt |  |
| 49 | **Hoggelwarts zur Pflicht:** Moderworts Zeugnis gibt es nur nach bestandener Prüfung | Welt 1 R6, R10 | Fable 360 | Erledigt |  |
| 50 | **Konzept angleichen:** drei Superhelden und Käsemann, Socke, Ringladen, Diagramm-Beschriftung Welt 3 (13 Rätsel), Belohnung Welt 3 R1 | Konzept, Rätsel Welt 3 | Fable 360 | Erledigt |  |
| 51 | **Audio-Lücken:** drei Gesangsstücke (Goblin-Lied, Waldemars Musical, Werbejingle) und Stimmen für die Figuren aus Welt 1 | Audio | Fable 360 | Erledigt |  |

### Priorität niedrig

| Nr. | Änderung | Betrifft | Quelle | Status |
| --- | --- | --- | --- | --- |
| 52 | **Fehlende Anspielungen:** rollender Stein an der Sphinx, M.U.T.T.I. als Sprachassistentin, Autoplay-Countdown als Dr. Werbepauses Waffe, deutsche TV-Formate | Welt 2–4 | Fable 360 | Erledigt |
| 53 | **Wiederholungen abbauen:** Hermes ohne Lieferdienst, Pixels Fischnase ein zweites Mal nutzen, Brian nimmt Max das Messias-Schild ab | Welt 2 | Fable 360 | Erledigt |
| 54 | **Opa-Kontakt in jeder Welt** mit einem Satz, der nach Weltherrschaft klingt und Backen meint | Alle Welten | Fable 360 | Erledigt |
| 55 | **Reisetasche:** zwei Wahlfächer plus ein Pflichtfach für Notizbuch, Thunfischdose und Kochlöffel | Konzept | Fable 360 | Erledigt |
| 56 | **Umfang festlegen:** Ziel-Spielzeit (etwa 8 Stunden) und Rätselbudget je Welt; Demo fürs Steam Next Fest statt verkaufter Episode 1; Nr. 23 vor dem Vertical Slice entscheiden | Produktion | Fable 360 | Offen |
| 57 | **Marktauftritt:** Max, Pixel und Opa von Hand zeichnen, KI nur für Hintergründe und Nebenfiguren; Arbeitstitel festlegen | Produktion | Fable 360 | Offen |

**Was bleibt, wie es ist:** die Einkaufslisten-Pointe mit allen Hinweisen, Pixel als zweite Figur mit seinem Hilfesystem, die Zeitfähre Zeldinas Wohnungssuche, die Code-Sicht mit dem Original-Kopie-Tausch, M.U.T.T.I. als Küchenmaschine, die Sitcom-Tür im Spukhaus und die Hyäne, die nie lacht.
