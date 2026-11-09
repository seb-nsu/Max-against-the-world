# Überarbeitung nach den Gutachten

57 Änderungen aus zwei Runden, dazu Runde 3 mit Nr. 58 bis 189. Runde 1 (Nr. 1–29) führt zwei Gutachten zusammen (Claude Fable und ein zweiter Agent) und ist bis auf die Produktionspunkte erledigt. Runde 2 (Nr. 30–57) stammt aus Fables 360-Grad-Review vom 5. November 2026, Gesamtnote 7/10; der Stand steht je Zeile. Runde 3 (Nr. 58–189) stammt aus Fables Review vom 8. November 2026 und ist am selben Tag umgesetzt, bis auf die unten als Offen markierten Punkte. Runde 4 (8. November 2026, abends) steht als eigene Tabelle am Ende von Runde 3; zurückgestellte Punkte sammelt der Abschnitt „Für später“ am Ende des Tabs.

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
| 3 | **Episode 1 zuerst:** Prolog und Welt 1 als eigenständige Episode fertigstellen und veröffentlichen, bevor andere Welten gebaut werden. Entschieden am 8. November 2026: verworfen zugunsten einer kostenlosen Demo (Prolog und Welt 1) zum Steam Next Fest (Runde 3 Nr. 165). | Produktion | Beide | Erledigt |
| 4 | **Grundgerüst vor Inhalt:** Laufen, Klick-Interface, Inventar mit Kombinieren, Dialoge, Figurenwechsel, Speichern und Pixels Hilfesystem in Godot bauen. | Produktion | Fable | Offen |
| 5 | **Vertical Slice:** Prolog plus Welt 1 Rätsel 1 bis 4 (Taverne, Zauberstab, Ziegen, Troll), etwa 40 Minuten Spielzeit, mit fremden Spielern testen. | Produktion | Beide | Offen |
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
| 16 | **Wunderdinge zurücksetzen:** Ein verbrauchtes Wunderding wird weit flussaufwärts wieder unbenutzt, gegen eine kleine Aufgabe des Fährmanns. Entschieden am 8. November 2026: verworfen, kein Zurücksetzen; die Regel gegen Sackgassen reicht (Runde 3 Nr. 105). | Welt 2 | Zweiter Agent | Erledigt |
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
| 28 | **Weniger Superhelden:** von sieben auf drei. Grafik und Rätsel haben drei, das Konzept noch sieben, siehe Nr. 50. | Konzept: Welt 4 | Fable | Erledigt |
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
| 30 | **Kochlöffel absichern:** Moderwort gibt den Löffel nach R13 beschämt zurück, er reist automatisch mit; dazu ein dritter Weg im Finale | Welt 1 R12, Finale | Fable 360 | Erledigt |  |
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
| 39 | **Welt 3 entschlacken:** Matrix-Verweise kürzen, wörtliche Zitate abwandeln, „T-800“ umbenennen (z. B. „Modell 08/15“); Umfang der Star-Wars-Gags prüfen (auf drei Gags plus Piepsi gekürzt) | Welt 3, Finale | Fable 360 | Erledigt | erstmal nur prüfen und dann rückmeldung geben. → Umgesetzt: Frau im roten Kleid und doppelte Déjà-vu-Szene gestrichen, Löffel- und Müllpressen-Zitat abgewandelt, T-800 heißt jetzt Modell 08/15. Star Wars auf Piepsi, Hologramm, Gedankentrick und Kessel-Lauf gekürzt; Leuchtstoffröhre und Müllpresse gestrichen. Nachtrag 8. November 2026: Der Gedankentrick in Welt 3 R8 zählt zu den drei Gags; Welt 4 zählt seine Anspielungen getrennt (Runde 3 Nr. 112). |
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
| 56 | **Umfang festlegen:** Ziel-Spielzeit (etwa 8 Stunden) und Rätselbudget je Welt; Demo fürs Steam Next Fest statt verkaufter Episode 1; Nr. 23 vor dem Vertical Slice entscheiden. Umgesetzt am 8. November 2026 in Produktion (Umfang, Meilensteine, Kosten; Runde 3 Nr. 166 bis 168) | Produktion | Fable 360 | Erledigt |
| 57 | **Marktauftritt:** Max, Pixel und Opa von Hand zeichnen, KI nur für Hintergründe und Nebenfiguren; Arbeitstitel festlegen. Stand 8. November 2026: Max, Pixel und Opa als KI-Entwurf von Hand nachgezogen (Produktion, Absprachen); Markencheck des Arbeitstitels offen (Runde 3 Nr. 165, 179) | Produktion | Fable 360 | In Arbeit |

**Was bleibt, wie es ist:** die Einkaufslisten-Pointe mit allen Hinweisen, Pixel als zweite Figur mit seinem Hilfesystem, die Zeitfähre Zeldinas Wohnungssuche, die Code-Sicht mit dem Original-Kopie-Tausch, M.U.T.T.I. als Küchenmaschine, die Sitcom-Tür im Spukhaus und die Hyäne, die nie lacht.

## Runde 3: Fable-Review vom 8. November 2026

132 Befunde (Nr. 58 bis 189) und 16 Automatisierungsideen (A1 bis A16) aus Fables Review vom 8. November 2026. Umgesetzt wurden Nr. 58 bis 172 (außer 123 und 124, Entscheidung Sebastian), dazu 177 bis 179 und 182 bis 189. Die Spalte „Änderung“ nennt die Empfehlung aus dem Gutachten; Abweichungen stehen beim Status in Klammern. Rechtliche Hinweise im Dokument sind keine Rechtsberatung.

| Nr. | Änderung | Betrifft | Status |
| --- | --- | --- | --- |
| 58 | Entweder übergibt Zappmann die Fernbedienung in einem goldenen Etui, das Opa „Zündkapsel“ nennt und erst im Finale öffnet, oder Max weiß, dass es eine Fernbedienung ist, erkennt aber erst an Omas/Opas Reaktion, dass es Opas normale ist. Die zweite Variante ist ehrlicher und braucht keinen neuen Gegenstand. | Konzept: Finale, Ablauf 1 und 4; Rätsel W4 R13 | Erledigt |
| 59 | Entweder streichen oder im Finale einen Satz spendieren („Ich wollte nicht zugeben, wo sie ist.“). Zweite Option ist ein Gag. | Skript Prolog, P0\_DACH\_OPA\_0140; Konzept: Finale, Ablauf 5 | Erledigt |
| 60 | Eigenen Abschnitt „Zwischenspiele“ im Rätsel-W1-Tab oder im Konzept anlegen: pro Rückkehr Ablauf, Zeilenbudget (etwa 25), Dachboden-Zustand (Tageszeit, abgelegte Artefakte), Reisetaschen-Angebot. | Konzept: Max’ Entwicklung, Gegenstände zwischen den Welten; Grafik Prolog und Finale: Szenen; Spielsysteme: Umfang | Erledigt |
| 61 | Pharaonensiegel mit „405“ als Zahl im Sammelbild-Prompt ergänzen (Zahl von Hand setzen) und eine Ansehen-Zeile von Pixel („Vierhundertfünf. Klingt nach einer Backzahl.“). | Konzept: Was das Finale vorbereitet; Rätsel W2 Inventar; Grafik W2 Ägypten-Sammelbild; Grafik Prolog/Finale Gegenstände | Erledigt |
| 62 | Ersetzen durch einen Back-Satz, der böse klingt, etwa: „Der Kern muss weich bleiben. Außen hart, innen weich. Sonst ist alles verloren.“ Dachbodenschlüssel streichen oder im Finale (verriegelte Luke) aufgreifen. | Rätsel W3 R13; Konzept: Running Gags (Opa meldet sich) | Erledigt |
| 63 | Festlegen: Verbündete verschwinden mit dem Zapp-O-Mat-Sting, bevor die Luke aufgeht; Oma sieht nur Rauch und Kuchen. Oder bewusst als Gag: Oma schaut Zeldina an und sagt „Du bist also die Neue.“ | Konzept: Finale, Ablauf 3 bis 7 | Erledigt |
| 64 | Pro Welt einen konkreten Pixel-Wunsch festlegen, der auf der Liste landet (W1 Ei „zum Frühstück“, W2 „irgendwas aus Mehl“, W3 „Batterien für die Dosenöffner-App“, W4 „Milch, endlich“). | Konzept: Running Gags; Spielsysteme: Notizbuch | Erledigt |
| 65 | Abschiedssatz ändern („Und lies den Zettel erst drüben!“) oder Zettel-Text unheimlicher machen („Alles hängt davon ab. Alles.“). | Skript Prolog, P0\_DACH\_OPA\_0860; Konzept: Running Gags | Erledigt |
| 66 | Ein Opa-Satz im Prolog („Drüben vergeht die Zeit anders. Hier nicht. Also beeil dich trotzdem.“) und je Rückkehr ein etwas tieferer Lichtstrahl durchs Dachfenster (siehe Nr. 60). | Skript Prolog P0\_DACH\_OPA\_0845; Grafik Prolog/Finale: Szenen | Erledigt |
| 67 | Ein Satz reicht: Die Mutter findet Opas Liste auf dem Couchtisch („Konrad, du hast nichts davon gekauft, oder?“). | Konzept: Finale, Ablauf 7; Grafik Prolog/Finale Figur Mutter | Erledigt |
| 68 | Stufe 1 um eine Spielhandlung verlängern: Max muss die verriegelte Luke und die Maschine untersuchen, während Opa drei weitere Weltherrschafts-Sätze brüllt und Pixel ernsthaft nervös wird („Ich hab ihn immer für harmlos gehalten.“). | Konzept: Finale, Ablauf 2 | Erledigt |
| 69 | Dem Schmied eine andere Marotte geben (er schmiedet nur noch Kochgeschirr, seit die Ziege da ist) und die Namensschilder in der Taverne an Humberts Sammlung hängen. | Konzept: Welt 1 Orte, Eigene Figuren; Rätsel W1 Bonus-Gags; Grafik W1 Schmiede | Erledigt |
| 70 | Max als Pilz mit blau-weißer Kappe, oder Toadi-Vergleich im Rätseltext streichen. | Rätsel W1 R6; Grafik W1 Figuren Toadi und Max als Pilz | Erledigt |
| 71 | Konzept-Ort „Der Kern“ auf den Rätselstand bringen. | Konzept: Welt 3 Orte (Der Kern), Figuren; Rätsel W3 R8, R11 | Erledigt |
| 72 | Den Lieferengpass-Gag behalten, er ist spezifischer: „Rot und Blau sind aus. Ich hätte Beige.“ Dann Rätsel und Grafik anpassen. | Konzept: Welt 3 Figuren; Rätsel W3 R3; Grafik W3 Figuren | Erledigt |
| 73 | Mindestens Oma, Mutter, 08/15, Kalle, Herr Vier, Morphäus, Deckert, Kommissar, Dr. Werbepause, Hyäne, Hermes, Sphinx ergänzen. Für 08/15: ElevenLabs kann österreichischen Akzent nicht verlässlich; stattdessen „blechern, übertrieben höflich, rollt das R“ und den Akzent über Wortwahl („Servus, Bursche“) herstellen. | Audio: Stimmen | Erledigt |
| 74 | Die schwarze Katze in Welt 3 ist ohnehin strittig (Nr. 108); sie streichen reduziert die Dopplung. | Rätsel W1 R1, W2 R2; Grafik W3 Schwarze Katze | Erledigt (Katze bleibt Kulisse ohne Rätselfunktion, siehe Nr. 108) |
| 75 | Eine Ansehen-Zeile im Prolog (Werkbank oder Dachboden-Deko „alter Staubsauger“). Kostet eine Zeile, zahlt den Steckbrief aus. | Max und Pixel: Pixel, Ohren; Skript Prolog P0\_DACH\_PIX\_0945 | Erledigt |
| 76 | In Welt 3 ein Gag: Max hält das Handy ans Terminal, „Kein Netz. Nicht mal 2099.“ In Welt 4 fragt Dr. Werbepause nach Max’ Handy („Nächste Folge in 5 … 4 … oh, Akku leer. Wie unprofessionell.“). | Rätsel W2 Wunderdinge; Konzept: Max’ Stimme | Erledigt |
| 77 | Ausgangs-Tabelle für Welt 1 (Ort → Ausgänge → Bedingung), oder eine Übersichtskarte wie in Welt 2 (KARTE-Baustein existiert bereits). | Rätsel W1; Grafik W1 Orte | Erledigt |
| 78 | Zellenpaare festlegen: Unterstadt-Straße ↔ Stadtstraße, Widerstandsbasis-Terminal ↔ Omas Küche (Telefon an der Wand). Ohne Paare kann Claude die Raumwechsel nicht skripten. | Rätsel W3 Wechseln über Telefonzellen; R7; Grafik W3 Omas Küche | Erledigt |
| 79 | Festlegen: Max kommt vom Friedhof in den Keller (Röhrenfernseher-Raum), die verschlossene Tür führt vom Keller in die Halle, dort hängen Lichterkette und Stumm-Taste. Dann braucht R7 R6, nicht nur R5; Diagramm anpassen. | Rätsel W4 R5, R6, R7; Grafik W4 Spukhaus Halle und Keller | Erledigt |
| 80 | „lässt nur durch“ durch „gibt ihre Schriftrolle nur heraus“ ersetzen, oder die Sphinx vor die Palastküche setzen. | Rätsel W2 R8 | Erledigt |
| 81 | Pro Wettkampftag die Voraussetzungen als Liste nennen; das ist zugleich der Schalter fürs Speichersystem. | Rätsel W2 Einleitung, Abhängigkeitsdiagramm | Erledigt |
| 82 | Einfacher: In der Simulation flüstert Pixel über die Telefonzellen-Hörer oder (im Labor) über M.U.T.T.I.s Lautsprecher, den Kalle anzapft. Die Pfote bleibt die Pfote, nur die Inszenierung wechselt. | Spielsysteme: Hinweissystem (Wer hilft wann); Rätsel W3 Orte | Erledigt |
| 83 | Regel festlegen: Wer gerade mit Max spricht, wenn er umschaltet, kommt mit. Das ist eine Zeile Code und ein Satz im Tutorial (Flimmer erklärt es). | Rätsel W4 Gäste zwischen den Sendern, R3 | Erledigt |
| 84 | Status auf Erledigt. | Überarbeitung Nr. 28; Konzept: Der Superhelden-Kanal | Erledigt |
| 85 | Beide Stellen korrigieren. | Grafik W1 Orte; Überarbeitung Nr. 30 | Erledigt |
| 86 | Konzept-Abschnitte „Rätsel und Aufgaben“ je Welt auf drei Sätze kürzen und auf den Rätsel-Tab verweisen; sonst laufen sie bei jeder Änderung wieder auseinander. | Konzept: Welt 2 Rätsel und Aufgaben, Orte; Konzept: Welt 4 Sender-Tabelle | Erledigt |
| 87 | Teil (a) Minka als eigenes, leichtes Rätsel vorziehen (Pixel wird von Toadi aus Versehen als Spielfigur „angeklickt“), dann R1 mit (b) und (c). | Rätsel W1 Schwierigkeitskurve, R1 | Erledigt |
| 88 | Festlegen: Max zieht die Thunfischdose auf Gollo, dann fragt er von selbst. Zitat leicht abwandeln („Rate mal, was in meiner Tasche ist. Nein, nicht das.“). | Rätsel W1 R1; Spielsysteme Hinweis R1c | Erledigt |
| 89 | Zettel um eine Zeile ergänzen („Sechs Flaschen, ein Trank, ein Öl, zweimal Gift, zweimal Saft“) und Regel 1 als „Das Fischöl steht gleich rechts neben dem Trank“ schreiben. Pixels lügende Nase vorher einmal harmlos vorführen (etwa an Humberts Fischsuppe), sonst kennt der Spieler die Regel nur aus dem Dokument. | Rätsel W1 R6, Ausgearbeitet | Erledigt |
| 90 | Waldemar gibt den Eimer nach dem Fußbad zurück („Regel 14b: Leihgaben sind zurückzugeben“), oder am Brunnen hängt ein zweiter Eimer. | Rätsel W1 R4, R8, Inventar Eimer; Grafik W1 Animation Waldemar Fußbad | Erledigt |
| 91 | Das Lied singt den Spitznamen mit Lücken („Mo-… -del-… -chen“) oder nennt die Reihenfolge der Fundorte („Erst die Mutter, dann die Prinzessin, dann wir, dann die Wand“). | Rätsel W1 R11 Teil 1; Audio: Goblin-Arbeitslied | Erledigt |
| 92 | Besen fegen Max zurück zur Treppe (kein Tod). In Smaugis Kammer fegen sie danach brav seine Haufen zusammen; Smaugi: „Endlich räumt mal jemand mit.“ Das löst beide Stellen und ist ein Gag. | Rätsel W1 R11, R12 | Erledigt |
| 93 | Drei Boden-Hotspots an den Kreuzungen der Fliesenmuster; Pixel schüttelt sich auf jedem (Animation existiert). Kein neues UI. | Rätsel W1 R11; Spielsysteme UI | Erledigt |
| 94 | Humbert und Grimmzahn sind bereits im Turm (Humbert liefert Fondue für Zeldinas Einweihung, Grimmzahn besichtigt den Hausmeisterposten); Zeldina folgt Max ab R9 sichtbar. | Rätsel W1 R12 | Erledigt |
| 95 | Zum Beispiel: Max nennt der Maklerin den Dunklen Turm als „Objekt mit Potenzial“ (Steckbrief aus der Taverne als Exposé), sie zieht los, um Moderwort ein Angebot zu machen; Pixel sprachlos. Drei Dialogoptionen, eine richtig. | Rätsel W1 R9; Grafik W1 Dorfplatz (Steckbrief) | Erledigt |
| 96 | Für P1 gibt Opa Hinweise über „Reden“ (drei Optionen, Stufen über Wiederholung), die Pfote erscheint danach. Spielsysteme-Text anpassen. | Spielsysteme: Hinweissystem; Skript Prolog P0\_DACH\_PIX\_0380; Grafik Prolog/Finale UI Hilfe-Symbol | Erledigt |
| 97 | Beim ersten Betreten der Taverne: Pixel springt auf einen Balken, Porträt blinkt, Pixel: „Klick mich an. Ich beiße nur manchmal.“ | Rätsel W1 Zwei Spielfiguren; Spielsysteme Steuerung | Erledigt |
| 98 | Regel umdrehen: Nur Dinge mit Sanduhr-Symbol im Inventar altern (Flüssigkeiten in Krügen, Pflanzen, Stein). Alles andere ist „aus dem Zeitstrom gefallen“. Tafel am Steg: „Was lebt, gärt oder verwittert, reist mit der Zeit.“ | Rätsel W2 Die Zeitfähre, R6; Grafik W2 Orte (Tafel) | Erledigt |
| 99 | Festlegen: Die Dose wird nur vorgezeigt und zurückgenommen („Der Gott behält seine Opfergabe. Göttliches Vorrecht.“). | Rätsel W2 R2, Wunderdinge; Konzept: Gegenstände zwischen den Welten | Erledigt |
| 100 | Cicero sagt in R10 ausdrücklich „ein Grab von genau 137 Jahren, nicht ein Jahr jünger“; die Zahl landet im Notizbuch. Den Zerbrösel-Zustand streichen oder als Gag nutzen (Stein zweimal hin und her gefahren). | Rätsel W2 R10; Grafik W2 Grabstein-Zustände | Erledigt |
| 101 | Zielsatz festlegen (etwa „Diener der Katze bittet Pharao um Gehör“ = Mann, Katze, Pharao, Auge) und die Grammatikregel (Subjekt-Objekt-Verb, Bild-Reihenfolge) als eine Inschrift zeigen. | Rätsel W2 R2; Grafik W2 Hieroglyphen 4×4 | Erledigt |
| 102 | Satz kürzen. | Rätsel W2 Ausgearbeitet R7 | Erledigt |
| 103 | Bei Tag 1 erwähnen, dass Ramses samt Hofstaat per Fähre anreist. | Rätsel W2 R6, R11 | Erledigt |
| 104 | „Wurfscheibe“ oder „Plastikteller“. | Rätsel W2 R7, Konzept Fünfkampf Nr. 4; Grafik W2 | Erledigt |
| 105 | Entscheiden: streichen oder als Gag („Der Kaugummi ist wieder in der Packung. Frag nicht.“). | Überarbeitung Nr. 16; Rätsel W2 Regel gegen Sackgassen | Erledigt (Nr. 16 verworfen, Regel gegen Sackgassen reicht) |
| 106 | Tabelle ändern: Simulation „kalte Kekse vom Vortag“, Realität „Hundekuchen“. Dann funktioniert R11 und der Finale-Bonus „ofenwarme Kekse“ (Konzept) hat einen Grund. | Rätsel W3 Was zwischen den Ebenen mitreist; R11; Grafik W3 Kekse-Zustände | Erledigt |
| 107 | Eigenschaften festlegen, z. B. Tür *verschlossen*, Lautsprecher *gesprächig*, Bernd *schwer* und *im Weg*, Gummihuhn *leicht*. Lösung: verschlossen↔gesprächig (Tür redet sich auf), schwer↔leicht mit dem Huhn (Bernd schwebt weg). Dann Sandale = dritter Tausch als Komfort. | Rätsel W3 R9 | Erledigt |
| 108 | Entscheiden: Pixel macht das Déjà-vu (Rätsel), die schwarze Katze fliegt aus Grafik und Konzept, oder sie bleibt reines Ansehen-Objekt ohne „Rätsel 3“-Zuordnung. | Rätsel W3 R3; Konzept: Welt 3 Orte; Grafik W3 Figuren, Nur zum Ansehen, Animationen; Überarbeitung Nr. 39 | Erledigt (Katze bleibt als Kulisse nur zum Ansehen) |
| 109 | Ein Satz im Konzept: M.U.T.T.I. betreibt die Simulation, Schmidt ist ihr Außendienst („Abteilung Fürsorge und Verfolgung“), das Labor ist ihr Serverkeller. Das erklärt auch die tiefere Ebene (Nr. 35). | Rätsel W3 R6, R10; Konzept: Welt 3; Grafik W3 Akte | Erledigt |
| 110 | Reihenfolge begründen: Jede Antwort von M.U.T.T.I. gibt das nächste Stichwort vor (Regel 1 → „Ich beschütze“ → Max: „Dann gib Kuchen“ → Regel 2 → „Kuchen ist Zucker“ → Regel 3). So ist es ein Dialogrätsel mit Logik, nicht Permutation. | Rätsel W3 R10 | Erledigt |
| 111 | Das Kochbuch ist die Bedienungsanleitung der Küchenmaschine, die M.U.T.T.I. einmal war („Regel 2: Nach jedem Rührgang Kuchen“). Passt zur Mixer-Optik. | Rätsel W3 R4; Grafik W3 | Erledigt |
| 112 | Zählung der Star-Wars-Gags klarstellen: Gedankentrick bleibt einer der drei Gags in Welt 3; Welt 4 zählt seine Anspielungen getrennt. | Rätsel W3 R8; Überarbeitung Nr. 39 | Erledigt (Vermerk bei Nr. 39) |
| 113 | Rückspulen hält an einer von vier festen Stellen (Einzelbilder); Max wählt das Bild, in dem der Bottich offen ist. Kein Timing. | Rätsel W4 R10; Überarbeitung Nr. 11 | Erledigt |
| 114 | In Zappmanns Studio steht ein Archivband; Rückspulen auf dem Monitor der Monitorwand springt dort ganz zurück („Hinweis aus 7“). Oder die Programmzeitschrift hat einen Eintrag „Wiederholung: Zappis Puppenstube, 1977“. | Rätsel W4 Tasten-Tabelle, R13; Grafik W4 Archivband | Erledigt |
| 115 | Jeder Schritt braucht einen sichtbaren Grund: Live-Show läuft (Pause), Zappmann verweist auf seine Vergangenheit (Bild-in-Bild), Applausband übertönt alles (Stumm), Zappmann schweigt (Untertitel), Quote-Anzeige (Sendersuchlauf). Jede Reaktion sagt, was fehlt. | Rätsel W4 R13 | Erledigt |
| 116 | Panels mit Hinweisen versehen (Sprechblasen-Formen, Tageszeit, Zustand des Schurken), oder auf drei Panels mit klarer Kausalkette reduzieren. | Rätsel W4 R11; Grafik W4 Comic-Panels | Erledigt |
| 117 | Alibi ändern: Die Hyäne behauptet, die Familie habe um 20:15 Lasagne gekocht; es war Fondue (Programmzeitschrift). „Wie ein Tier verhalten“ konkretisieren: Max trinkt am Wasserloch (Benutzen), der Erzähler kommentiert. | Rätsel W4 R4, Ausgearbeitet; Konzept: Die Sender | Erledigt |
| 118 | Entscheiden: Entweder Rückspulen ist der Weg und das Minispiel entfällt (spart ein Minispiel), oder das Minispiel ist der Weg und Rückspulen nur die Vorbereitung (Zombies in Startposition). | Rätsel W4 R5; Konzept: Die Sender (Mitternachts-TV) | Erledigt (Minispiel bleibt der Weg, Rückspulen ist Vorbereitung) |
| 119 | Frage umformulieren (ohne Uhrzeit) oder festhalten, dass die Programmzeitschrift die Antwort enthält. | Rätsel W4 R9, Programmzeitschrift | Erledigt |
| 120 | Verlassen und Betreten eines Raums setzt Tausche und Eigenschaften zurück; M.U.T.T.I. kommentiert („Zurücksetzen. Wie bei allen meinen Testpersonen.“). Im Speicherstand nur „Raum gelöst ja/nein“. | Spielsysteme: Speichern (Welt 3); Rätsel W3 Code-Sicht | Erledigt |
| 121 | Fünfkampf-Regel 2 auf alle Minispiele ausdehnen: nach zwei Fehlversuchen „großzügig werten“ (Flimmer bietet an, die Zombies abzuschalten). | Rätsel W4 R5; Konzept: Der Fünfkampf (Regeln) | Erledigt |
| 122 | Amboss streichen oder als Bonus-Kombinationsgag im Comic-Kanal (Max auf Dr. Werbepause) behalten; dann in die Inventartabelle. | Grafik W4 Gegenstände; Rätsel W4 Genre-Logik, Inventar | Erledigt |
| 123 | Je einmal drehen: „Und was hat uns Rom gebracht? Außer Touristen?“; „Hilf mir, Max. Du bist mein einziger Enkel, der Werkzeug hält.“; „Es gibt keine Gabel. Doch. Da. Omas.“; siehe Nr. 88; „Sport. Freiwillig. Die haben doch einen Diskus.“ | Rätsel W2 R9; Rätsel W3 R13; Grafik W3 Nur zum Ansehen; Rätsel W1 R1; Konzept: Max’ Stimme | Bewusst nicht umgesetzt (Entscheidung Sebastian) |
| 124 | Ring, Kokosnuss, Wasserorgel-80er, Radio an Pixel geben; Max bekommt dafür je eine Streaming-Pointe („Ein Ring im Ausverkauf. Wie ein Abo, das keiner kündigt.“). | Grafik W1 Nur zum Ansehen (Ring-Laden, Kokosnuss); Grafik W2 (Wasserorgel); Grafik W4 (Radio); Konzept: Max’ Stimme | Bewusst nicht umgesetzt (Entscheidung Sebastian) |
| 125 | Albus → „Alwin Grauwald“; Hoggelwarts → „Hoggelwarz“ oder „Zauberschule Schwurbelstein für Durchgefallene“ (der Witz liegt im Untertitel, nicht im Namen); Sahra Connor → „Sahra Konner“ oder 47 Einträge „Connor“ ohne Vornamen. Marketing-Regel schriftlich festhalten. | Konzept: Welt 1 Figuren und Orte, Rechtscheck; Rätsel W3 R8; Grafik W1; Audio; Produktion: Parodien | Erledigt |
| 126 | Pixel bekommt als Figurenrecht Mehrfach-Sprechblasen (zwei IDs hintereinander, kurze Pause), die Regel bleibt pro Blase. Im Skript als „Kaskade“ markieren. | Audio: Stimmen; Skript Prolog; Spielsysteme: Schreibregeln | Erledigt (Kaskade mit „//“ in einer Zeile) |
| 127 | Keine Umbenennung nötig, aber: Steam-Seite ohne diese Namen, Trailer ohne Toadi-Zeile, und vor Veröffentlichung einen Anwalt eine Stunde auf die Figurenliste schauen lassen (Konzept selbst sagt das, steht aber in keiner Aufgabenliste mit Termin). | Konzept: Figuren aller Welten, Rechtscheck; Produktion: Parodien, Rechtliches | Erledigt |
| 128 | „Sonst geht heute Abend die Welt unter. Zumindest meine.“; Schreibweise korrigieren; „Sieht aus wie ein Hase mit Empfang.“ | Skript Prolog P0\_DACH\_OPA\_0090, P0\_WOHN\_MAX\_0140, P0\_DACH\_MAX\_0470 | Erledigt |
| 129 | Pixel-Zeilen als Kaskade teilen (Nr. 126), Max-Zeilen kürzen (meist fällt der dritte Satz: „Respekt.“, „Vielversprechend.“, „Oder Reisepläne.“ sind die Pointen, der Mittelsatz kann weg). Prüfskript einführen (siehe Automatisierung A3). | Skript Prolog; Spielsysteme: Schreibregeln, Schrift | Erledigt (Regel geändert: drei Zeilen, etwa 120 Zeichen, automatisches Aufteilen an Satzgrenzen; keine Zeile gekürzt) |
| 130 | Spalte „Bedingung“ nachtragen („nach P1“) und für vorher je eine Max-Zeile. | Skript Prolog Abschnitt 7 | Erledigt |
| 131 | Entweder Schema im Skript nachziehen (Abschnittsüberschrift liefert Art; Bedingung-Spalte ergänzen) oder Spielsysteme auf das schlankere Schema kürzen. Vor dem ersten Export entscheiden. | Skript Prolog; Spielsysteme: Spalten der Skript-Tabelle | Erledigt (Kurzform im Dokument, volle Tabelle beim Export) |
| 132 | Ein Opa-Baum mit vier Optionen (Zapp-O-Mat, Kalender, Pixel, Fernbedienung) und Pixels erster Baum nach P1 (drei Optionen). Zugleich erhält P1 so seinen Hinweiskanal (Nr. 96). | Skript Prolog Abschnitt 2b; Spielsysteme: Zeilenarten (Gespräch) | Erledigt |
| 133 | Vier Zurufe (zwei Wohnzimmer, zwei Dachboden) ergänzen, Pool auf 25 je Figur auffüllen, bevor der Vertical Slice gebaut wird. | Skript Prolog Abschnitte 8b und 9; Spielsysteme Zeilenarten | Erledigt |
| 134 | Treppenhaus als Durchgangsraum mit zwei Ansehen-Zeilen (Hut, Fenster) aufnehmen; er wird im Finale ohnehin gebraucht. | Skript Prolog Abschnitt 1b; Grafik Prolog/Finale Orte | Erledigt |
| 135 | Beide Spalten führen; Regie darf leer bleiben (Standardausdruck). | Skript Prolog alle Tabellen | Erledigt (siehe Nr. 131) |
| 136 | „Halt! Die Tasche!“; 0880 als echtes Katzen-Miau (Lautsprecher übersetzt Panik nicht) kennzeichnen: Pixel „… (Lautsprecher: ‚Übersetzung nicht verfügbar‘)“. Das wäre ein eigener Gag. | Skript Prolog Abschnitt 6 | Erledigt |
| 137 | „manual can opener cranking around a tin lid, then a hiss“. | Audio: Geräusche (Max und Pixel); Rätsel W1 P1 | Erledigt |
| 138 | Opa bekommt eine Sprachmarotte, die der Voice Design nutzen kann: falsche Einheiten („Vier Dinge, das sind zwölf Zentimeter Hoffnung.“), oder Erfinder-Benennungen für alles („der Kater, Modell Pixel, Baujahr unbekannt“). | Skript Prolog Abschnitte 2 bis 6 | Erledigt (Erfinder-Benennungen) |
| 139 | Farbstreifen zusätzlich mit Symbolen (Kreis, Dreieck, Quadrat) versehen, Kabel entsprechend; W4 R1 funktioniert über Pixels Graustufen ohnehin. Option „Farbenblind-Hilfen“ (Symbole immer an). | Rätsel W3 R7; Grafik W3 Flur; Spielsysteme: Optionen | Erledigt |
| 140 | Option „Flackern reduzieren“ (Umschalt-Effekt als weicher Wisch), Epilepsie-Hinweis im Hauptmenü-Erststart. Steam fragt das in der Accessibility-Sektion inzwischen ab. | Grafik W4 Animationen (Umschalten, Lampenflackern); Spielsysteme: Optionen | Erledigt |
| 141 | Bildschirm „Nahansicht“ (Popochiu-Overlay 320×180 mit Schließen-Knopf) in Spielsysteme aufnehmen; Liste aller Nahansicht-Objekte je Welt. Jedes braucht ein eigenes Asset. | Spielsysteme: Bildschirme und Menüs; Grafik: Text in Bildern; Grafik Prolog/Finale und W1 bis W4: Zeile Nahansichten | Erledigt |
| 142 | Als Bildschirm definieren: fünf Spalten (Sender) × Zeitleiste, klickbare Sendungen, Text von Hand. | Rätsel W4 Programmzeitschrift; Grafik W4 Gegenstände; Spielsysteme Bildschirme | Erledigt |
| 143 | Minispiele wie Zwischensequenzen behandeln (Wunsch merken, danach speichern) oder Zustand sichern. Ersteres ist billiger. | Spielsysteme: Speichern | Erledigt |
| 144 | Porträts und Pfote in die Inventarleiste integrieren (ein Streifen, klappt gemeinsam) oder Sprechblasen bei hohen Figuren nach unten klappen lassen. Vor dem Vertical Slice als Mockup prüfen. | Spielsysteme: Bildschirmaufbau | Erledigt (Mockup vor dem Code festgelegt) |
| 145 | Notizbuch Seite 1 (Ziele) als Auswahl nutzen: Klick auf ein Ziel setzt Pixels Fokus. Nutzt vorhandene Daten. | Spielsysteme: Hinweissystem, Notizbuch | Erledigt |
| 146 | Im Grundgerüst als erstes prüfen (Tag 1 der Technik), bevor 3.500 Zeilen auf diesem Mechanismus aufsetzen. | Spielsysteme: Dialog-Skript; Produktion: Übersetzung | Erledigt |
| 147 | Begleiter-Status als Schalter aufnehmen, Täusche streichen. | Spielsysteme: Was gespeichert wird | Erledigt |
| 148 | Regel: Pixel auf Mensch = Mensch kommentiert den Kater (eine Zeile pro Figur), Pixel auf Gegenstand = Schnuppern-Zeile. Das sind 40 bis 60 zusätzliche Zeilen pro Welt, bisher nicht im Budget. | Spielsysteme: Zeilenarten, Umfang; Rätsel W1 Zwei Spielfiguren | Erledigt |
| 149 | Konzeptbild neu erzeugen mit „strictly side view, flat stage, back wall parallel to the picture plane, floor as a flat band in the lower third“; Baustein KONZEPT um diese Wörter ergänzen, sonst passiert das bei jeder Szene. | Grafik: Technischer Stil (Perspektive), Bausteine KONZEPT und HINTERGRUND | Erledigt (Bild neu erzeugen steht als Aufgabe) |
| 150 | Je zwei Merkmale tauschen: Morphäus mit Strickjacke und Lesebrille auf der Stirn, rothaarig; Schmidt mit braunem Cordanzug und Fliege, die Sonnenbrille bleibt (sie ist Rätselgegenstand); Leonidas mit Trainingsanzug und Pfeife, der Helm bleibt. | Grafik W3 Figuren; Grafik W2 Figuren; Grafik: Regeln (Parodien) | Erledigt |
| 151 | Pro Welt bis zu acht Zusatzfarben erlauben (W3: zwei Magenta, zwei Cyan; W4 je Sender zwei), dokumentiert im Grafik-Tab. Palettize dann mit Welt-Palette, nicht mit der Basis. | Grafik: Farbstimmung pro Welt | Erledigt |
| 152 | Zähltabelle in Produktion mit Stückzahl, Werkzeug, geschätzter Zeit. Grob 600 bis 800 Arbeitsstunden allein Grafik. Das gehört in Nr. 56. | Produktion: Umfang der Grafik | Erledigt |
| 153 | Vor dem ersten Asset die aktuelle Stil-Liste gegenprüfen und im Grafik-Tab mit Datum vermerken. | Grafik: Werkzeuge und Ablauf | Erledigt (Prüfhinweis mit Datum im Grafik-Tab) |
| 154 | Fünftes Foto als Variante einplanen. | Grafik Prolog/Finale UI Abspann-Fotos | Erledigt |
| 155 | Leuchte als zwei Pixel Türkis fest einplanen und beim Sprechen blinken lassen (in den Sprite-Prompt). | Max und Pixel: Pixel; Grafik: Baustein Pixel | Erledigt |
| 156 | Hoodie-Grundton auf #3a4466 (dunkler) und Licht auf #5a6988 verschieben, Silhouetten-Test wie im Tab beschrieben durchführen. | Max und Pixel: Farben | Erledigt (Silhouetten-Test steht als Aufgabe) |
| 157 | Eines von beidem streichen. | Grafik W1 Szenen, Deko Welt 1 | Erledigt (Okarina aus dem Hintergrund genommen, Schwert bleibt) |
| 158 | Drei Prompts ergänzen; Bergwerk kann das Goblin-Lied instrumental nutzen (spart eines). | Audio: Musik | Erledigt (fünf Prompts ergänzt) |
| 159 | Liedtext als Untertitel und ins Notizbuch; Reihenfolge zusätzlich visuell (Goblins heben Schilder in Reihenfolge). Gesang früh testen, bevor das Rätsel darauf gebaut wird. | Audio: Gesungene Stücke; Rätsel W1 R10/R11 | Erledigt |
| 160 | Budget auf drei Monate Pro (≈ 300 $) setzen und mit dem Vertical Slice den echten Faktor messen. | Audio: Sprachausgabe (Umfang); Produktion: Kosten | Erledigt |
| 161 | Lizenz beim Download prüfen und korrekt eintragen. | Audio: Werkzeuge | Erledigt (Apache-2.0) |
| 162 | Zehn Prompts ergänzen; alle aus CC0 machbar. | Audio: Geräusche | Erledigt |
| 163 | Zwei Sätze zur Technik (Silbenzahl → Zahl der Blips, Grundtonhöhe aus Stimmen-Tabelle) reichen, damit das Grundgerüst den Haken schon vorsieht. | Audio: Sprachausgabe, Drei Möglichkeiten | Erledigt |
| 164 | Entweder alle Stücke mit ACE-Step und Referenz-Audio erzeugen oder den Motiv-Satz in jeden Welt-Prompt kopieren. | Audio: Leitmotiv, Musik-Tabelle | Erledigt (Motiv-Satz in den Prompts) |
| 165 | Beide Paare entscheiden und die unterlegene Nummer auf „Verworfen“ setzen. Empfehlung: Demo statt Episode; Figuren per KI-Entwurf, aber Max und Pixel in Aseprite von Hand nachziehen. | Überarbeitung Nr. 3, 56, 57; Produktion: Absprachen; Max und Pixel | Erledigt (Demo statt Episode; Max, Pixel, Opa als KI-Entwurf von Hand nachgezogen; Nr. 3 steht auf Erledigt mit Vermerk „verworfen“, weil die Statusliste kein „Verworfen“ kennt) |
| 166 | Meilensteinplan mit fünf Stufen: Grundgerüst (4 Wochen), Vertical Slice (8), Demo W1 komplett (6 Monate), W2 bis W4 (je 5 bis 7 Monate), Finale und Politur (3). Pro Stufe Stundenbudget und Abbruchkriterium. | Produktion: Meilensteine und Stundenbudget | Erledigt |
| 167 | Tabelle ergänzen; Gesamtbudget realistisch 5.000 bis 9.000 $ über die Laufzeit. | Produktion: Kosten | Erledigt |
| 168 | Nr. 56 schließen: 8 Stunden, 53 Rätsel, 12 Zwischenspiele; das reicht als Budget. | Überarbeitung Nr. 56; Produktion: Absprachen | Erledigt |
| 169 | Git LFS für audio/ und concepts/ von Tag 1 an; GitHub-LFS-Kontingent prüfen. | Produktion: Sicherung, Versionierung | Erledigt |
| 170 | Siehe Automatisierung A9: Telemetrie-Log im Build plus eine Seite Beobachtungsbogen. | Produktion: Was noch fehlt (Testen) | Erledigt |
| 171 | Slice realistisch beziffern (8 Räume, 13 Figuren, \~450 Zeilen) oder auf Prolog + R1 + R2 kürzen (4 Räume). | Produktion: Vorgehen, Reihenfolge | Erledigt (realistisch beziffert, nicht gekürzt) |
| 172 | Konkrete Version (z. B. Godot 4.3 LTS-nah, Popochiu 2.0.x) mit Datum eintragen. | Produktion: System 1 | Erledigt (Form festgelegt; die Versionsnummer trägt Sebastian beim Projektstart ein) |
| 173 | Toadi optisch weiter entfernen (Pilzkopf → Pilz-Hut), Abspann-Pilz durch Toadi selbst ersetzen, Marketing komplett frei davon. Zeldina kann bleiben, wenn sie im Store nicht vorkommt. | Konzept: Running Gags, Welt 1 Figuren, Abspann-Szene; Grafik W1 | Offen (Pilz-Hut in Grafik W1 bereits umgesetzt; Namen über Nr. 125 und 127 geprüft) |
| 174 | Punkt „Gewerbe/Steuer“ mit Termin vor Steam-Seite aufnehmen; Steuerberater-Erstgespräch einplanen. | Produktion: Was noch fehlt (Rechtliches) | Offen |
| 175 | Pillen als „Pastillen“ oder „Bonbons“ mit Apothekenkreuz klar medizinisch; Wein darf bleiben (historisch), im Fragebogen korrekt angeben. Ziel PEGI 7 / USK 6 oder 12 vorab festlegen. | Rätsel W3 R3; Rätsel W2 R11; Rätsel W1 R10 | Offen |
| 176 | Entscheidung treffen (Nr. 165) und im Store-Text offensiv erklären, was von Hand kam. Keine KI-Hintergründe in den ersten drei Screenshots ohne Nacharbeit. | Produktion: KI-Offenlegung; Überarbeitung Nr. 57; Max und Pixel | Offen |
| 177 | Eigennamen-Glossar als eigene Tabelle (DE, EN, Begründung) anlegen; Type 405 in EN als Gag halten. | Spielsysteme: Dialog-Skript (Eigennamen-Glossar) | Erledigt |
| 178 | Zielliste „Steam-Accessibility-Tags, die wir erfüllen“ in Spielsysteme. | Spielsysteme: Optionen | Erledigt |
| 179 | Zehn Minuten Suche in DPMAregister, EUIPO eSearch und Steam, Ergebnis mit Datum in Produktion eintragen. Titel mit „Pixel“ oder „Zapp-O-Mat“ wären unterscheidungskräftiger. | Produktion: Rechtliches; Überarbeitung Nr. 57 | Erledigt (Aufgabe mit Ablauf eingetragen; die Suche selbst macht Sebastian, sobald der Arbeitstitel steht) |
| 180 | Spalte „Ähnlichkeitsprüfung ok“ im KI-Protokoll; für Figuren mit Vorbild (Nr. 150) Pflichtfeld. | Grafik: Regeln (Parodien), KI-Protokoll | Offen |
| 181 | Nur als Posen-Referenz nutzen, nicht als Pixelgrundlage; nach dem Umfärben und Ohr-Ergänzen bleibt sonst die Silhouette dieselbe. | Grafik: Steckbriefe (Pixel) | Offen |
| 182 | Kanäle festlegen (3, 7, 42, 999) und den Werbeblock als Rückkehr-Gag nutzen (Nr. 60). | Skript Prolog; Grafik Prolog/Finale (Werbeblock); Audio (Werbeblock-Spot) | Erledigt |
| 183 | Zehn bis fünfzehn Errungenschaften früh listen. Alle sind Schalter, die ohnehin existieren. | Spielsysteme: Hinweissystem (Errungenschaften) | Erledigt (13 Stück) |
| 184 | Zeilen „Zwischenspiele“ ins Budget. | Spielsysteme: Umfang | Erledigt (160 Zeilen) |
| 185 | Menü-Mockup als UI-Asset ergänzen. | Grafik Prolog/Finale UI | Erledigt |
| 186 | Festlegen: Artefakte bleiben bei Opa (Dachboden-Zustand, Nr. 60), der Portal-Gag kommentiert stattdessen den Kochlöffel. | Rätsel W3 Inventar (Portalgerät); Konzept: Finale, Ablauf 1 | Erledigt |
| 187 | Kritzelei muss angesehen werden (Nahansicht, Nr. 141), erst dann Eintrag. | Rätsel W1 Inventar; Spielsysteme: Nahansicht, Notizbuch | Erledigt |
| 188 | Ein Satz von Opa über die Lampen: „KENNE IHN. LANGE GESCHICHTE.“ Setzt das Finale auf. | Rätsel W4 R7; Konzept: Finale Ablauf 5 | Erledigt |
| 189 | Fünfkampf-Disziplinen gegen den antiken Pentathlon geprüft (Lauf, Weitsprung, Diskus, Speer, Ringen): stimmt. | Konzept: Der Fünfkampf | Kein Befund, nur geprüft |
| A1 | Skript-Pipeline: Skript-Tabelle (CSV/Sheet) → Prüfskript → Godot-Übersetzungs-CSV (ID, de, en) → Zeilen-ID-Liste für Audio | Automatisierung, Phase Grundgerüst; Aufwand 1 bis 2 Tage | Offen |
| A2 | Prüfregeln im Prüfskript: Zeilen über 120 Zeichen, doppelte IDs, IDs ohne Zehnerschritt, Sprecher nicht in Liste, Zeile ohne Bedingung bei Pixel vor P1, Zeilen im Code ohne Skripteintrag und umgekehrt | Automatisierung, Phase Grundgerüst; Aufwand 0,5 Tage | Offen |
| A3 | Godot headless: automatischer Rätsel-Durchlauf (Lösungspfad als Skript: Raum betreten, Hotspot klicken, Gegenstand kombinieren), danach Prüfung aller Schalter | Automatisierung, Phase Grundgerüst, Vertical Slice; Aufwand 3 bis 5 Tage Grundlage, dann 0,5 Tage pro Welt | Offen |
| A4 | Speichern/Laden-Test nach jedem gelösten Schritt plus Rundreise-Test (speichern, laden, Zustand vergleichen) | Automatisierung, Phase Grundgerüst; Aufwand im Rahmen von A3, 1 Tag | Offen |
| A5 | Parallele Claude-Agenten je Raum nach dem Grundgerüst: Jeder Agent bekommt Rätseltabelle, Grafikliste und Skript seines Raums und baut Hotspots, Props, Dialoge | Automatisierung, Phase Serienproduktion; Aufwand 1 Tag Vorlage, dann parallel | Offen |
| A6 | Audio-Pipeline: Skript-CSV → ElevenLabs-API (Voice pro Sprecher, Regie als Style-Hinweis) → Dateiname = Zeilen-ID → Audacity-Batch → Import | Automatisierung, Phase Release (Technik im Vertical Slice); Aufwand 2 Tage | Offen |
| A7 | CI mit GitHub Actions: bei jedem Push Prüfskript (A2), Godot-Export headless, Rätsel-Test (A3), Artefakt = spielbarer Build | Automatisierung, Phase Grundgerüst; Aufwand 1 bis 2 Tage | Offen |
| A8 | Web-Export (HTML5) für Testspieler per Link | Automatisierung, Phase Vertical Slice; Aufwand 0,5 Tage, wenn A7 steht | Offen |
| A9 | Telemetrie im Testbuild: Log je Spieler (Zeit pro Rätselschritt, Hinweisstufen, Fehlklicks pro Hotspot, Ersatzzeilen-Treffer), Upload als JSON; Auswertung per Skript | Automatisierung, Phase Vertical Slice; Aufwand 2 Tage | Offen |
| A10 | Grafik-Batch: Prompt-Tabelle → Retro-Diffusion-API → automatisches Palettize auf Welt-Palette → Zuschnitt → Dateiname nach Schema → Eintrag ins KI-Protokoll | Automatisierung, Phase Demo Welt 1; Aufwand 2 bis 3 Tage | Offen |
| A11 | KI-Protokoll automatisch: Jedes Werkzeug-Skript (A6, A10) schreibt Dateiname, Werkzeug, Modell, Prompt, Datum, Nachbearbeitung in eine CSV; Export für das Steam-Formular | Automatisierung, Phase Grundgerüst; Aufwand 0,5 Tage | Offen |
| A12 | Lokalisierung: EN-Spalte per Claude aus der CSV, mit Kontext (Art, Auslöser, Regie) im Prompt; Prüfskript für Längen in EN; Glossar für Eigennamen (siehe Spielsysteme) | Automatisierung, Phase Release; Aufwand 1 Tag plus Übersetzungsläufe | Offen |
| A13 | Automatische Dokument-Konsistenzprüfung: Skript, das aus den Rätsel-Tabs „Benötigt/Belohnung“ liest und Abhängigkeitsgraph, Sackgassen und Nummernverweise prüft | Automatisierung, Phase Vertical Slice; Aufwand 1 Tag | Offen |
| A14 | Hinweis-Datei (hints\_wX.tres) aus Skript und Rätseltabelle generieren statt von Hand pflegen | Automatisierung, Phase Vertical Slice; Aufwand 1 Tag | Offen |
| A15 | Automatische Playtest-Auswertung per Claude: Telemetrie-JSON plus Beobachtungsnotizen → Bericht je Rätsel mit Vorschlag | Automatisierung, Phase Demo Welt 1; Aufwand 0,5 Tage | Offen |
| A16 | Screenshot-Regressionstest: Headless-Build rendert jeden Raum mit Max an fester Position, Vergleich gegen Referenz (Laufbereich, Skalierung, Palette) | Automatisierung, Phase Serienproduktion; Aufwand 1 Tag | Offen |

### Runde 4: Bewertung vom 8. November 2026

Zweites Gutachten vom 8. November 2026 (abends, Gesamtnote 7,5), umgesetzt am selben Tag. Die Kategorien Produktion und Recht/Markt wurden nicht angefasst; ihre Punkte stehen unter „Für später“. Die Konzeptregel „Zitate nur abgewandelt“ ist gestrichen; die behaltenen Zitate (Nr. 123, 124) sind damit regelkonform.

| Nr. | Punkt | Betrifft | Status |
| --- | --- | --- | --- |
| R4-1 | Zitate-Regel gestrichen, ersetzt durch: bekannte Zitate erlaubt, wenn als Anspielung erkennbar; Nr. 123 und 124 regelkonform | Konzept: Hinweise zu Anspielungen; Produktion: Absprachen (Parodien) | Erledigt |
| R4-2 | Hieroglyphen-Kacheln: Ohr und Mund statt Schlange und Boot; Grammatik-Nahansicht benannt | Grafik W2: Sammelbilder, Nahansichten | Erledigt |
| R4-3 | Energiezelle: Pixel legt sie aus der Kiste auf die Werkbank, Farbe orange in allen Tabs | Konzept: Zwischenspiele; Grafik Prolog/Finale: Werkbank-Ablage | Erledigt |
| R4-4 | Opa 1320 ohne „Rückweg-Teil“ („Zurück holt dich der Werbeblock“); 1140 als Kaskade unter 120 Zeichen | Skript Prolog | Erledigt |
| R4-5 | Welt 1: Stolleneingang frei, Rune-Tür = Kellereingang nach Rätsel 10, Geheimtür oben in den Abstellkammern; Raumplan des Dunklen Turms | Rätsel W1: Ortsnetz, Raumplan; Grafik W1: Bergwerk | Erledigt |
| R4-6 | Grabstein-Haufen als Gag-Lieferung ohne Entwurf (Rätsel 10), nicht „138 Jahre“ | Grafik W2 | Erledigt |
| R4-7 | Programmzeitschrift ein verbindlicher Aufbau (Doppelseite, fünf Senderspalten links, sechs Detailkästen rechts) | Spielsysteme: Bildschirme; Rätsel W4; Grafik W4: UI | Erledigt |
| R4-8 | Hotspot-Anzeige auf Umschalt/Shift (halten); „Text weiter“ auf Leertaste, Eingabetaste und Linksklick (geändert am 9. November 2026) | Spielsysteme: Optionen | Erledigt |
| R4-9 | Backmaschine mit zwei Fassungen (Ei, Mehl) und Empfänger für die Fernbedienung | Grafik Prolog/Finale: Dachboden Finale, Ortstabelle | Erledigt |
| R4-10 | Omas Kekse sind auf dem Dachboden Hundekuchen (Verwandlungsregel gilt in jeder Realität), Oma isst sie trotzdem | Konzept: Gegenstände zwischen den Welten | Erledigt |
| R4-11 | Fünfte Nahansicht „Wandkritzelei“ gestrichen; Luftschloss-Kritzelei trägt Rätsel 11 | Grafik W1: Nahansichten | Erledigt |
| R4-12 | Hausmeister 08/15 wischt in der Realität vor der Panzertür, nicht vor dem Kern | Konzept: Welt 3 Orte | Erledigt |
| R4-13 | Rätseltitel „Der Hausmeister Modell 08/15“ statt „Terminator-Hausmeister“ | Rätsel W3 R8 | Erledigt |
| R4-14 | Welt 3: In der Realität spricht Pixel normal; Morse nur zwischen den Ebenen | Spielsysteme: Wer hilft wann | Erledigt |
| R4-15 | Rätsel W4 R9 braucht Dr. Werbepauses Spot (gesehen, nicht gelöst) | Rätsel W4: Tabelle, Voraussetzungen | Erledigt |
| R4-16 | Schwierigkeitskurve Welt 1: sechs von 13 mittel oder schwer | Rätsel W1 | Erledigt |
| R4-17 | Spukhaus-Halle mit Zuständen (Lichterkette aus, blinkt) | Grafik W4: Orte | Erledigt |
| R4-18 | Hofkater sandfarben, Matrix-Katze bleibt schwarz | Grafik W2: Figuren, Animationen | Erledigt |
| R4-19 | Olivenöl: ganzer Krug, Riemen brauchen einen Schluck, Rest reist nach Welt 3 | Rätsel W2: Das Olivenöl, Inventar | Erledigt |
| R4-20 | Stimm-Prompts für Flimmer, Nebet, Sobek, Tiro, Brian; 08/15 ohne Akzent-Anweisung | Audio: Stimmen | Erledigt |
| R4-21 | Schmiede ohne Namensschilder, Taverne mit Humberts Schwertsammlung | Grafik W1: Orte, Hintergründe | Erledigt |
| R4-22 | Ansehen-Zeilen vor der ersten Begegnung für Moderwort (Steckbrief), M.U.T.T.I. (Plakat), Zappmann (Porträt) | Rätsel W1: Bonus-Gags; Rätsel W3: Ansehen; Rätsel W4 R12 | Erledigt |
| R4-23 | Ebenenplan Welt 3 mit allen Übergängen | Rätsel W3: Neue Mechaniken | Erledigt |
| R4-24 | „Lange Geschichte“ Opa und Zappmann im Finale aufgelöst (Bastel-Onkel, explodierter Backofen) | Konzept: Finale, Stufe 2 | Erledigt |
| R4-25 | P1-Hinweise als Opa-Optionen im Gesprächsbaum (1322, 1324, 1326) | Skript Prolog: Reden | Erledigt |
| R4-26 | Eigene Stücke für Spukhaus und Senderzentrale-Empfang | Audio: Musik | Erledigt |

## Für später

Punkte, die bewusst zurückgestellt sind: Produktion, Recht und Markt aus dem Gutachten vom 8. November 2026 (abends), die offenen Nummern aus Runde 3 und alles, was Runde 4 nicht umsetzen konnte. Nummern ab 190 gibt es in Runde 3 nicht; die Liste endet bei 189 und A1 bis A16.

| Nr. | Punkt | Kategorie | Quelle | Stand 9. November 2026 |
| --- | --- | --- | --- | --- |
| S1 | Pro Stufe ein echtes Kürzungs- oder Abbruchkriterium in „Umsteuern, wenn“ | Produktion | Bewertung 4, Produktion | Geschlossen (Sebastian): umgesteuert wird am Ablauf, nicht am Inhalt |
| S2 | Slice-Dauer auf eine Zahl ziehen (30, 40 oder 45 Minuten) | Produktion | Bewertung 4, Top 10 Nr. 10 | Erledigt: 40 Minuten in Nr. 5, Produktion „Umfang“ und Meilenstein 2 |
| S3 | „12 Zwischenspiele“ gegen 3 Rückkehren plus 4 Packszenen abgleichen | Produktion | Bewertung 4, Top 10 Nr. 10 | Erledigt: 3 Zwischenspiele mit eingebautem Packen (166 Zeilen laut Skript), Finale in acht Abschnitten (rund 270 Zeilen) |
| S4 | Nahansichten-Zählung angleichen | Produktion | Bewertung 4, Top 10 Nr. 10 | Erledigt: 14 (Prolog 2, W1 4, W2 3, W3 4, W4 1), 28 Stunden |
| S5 | Godot- und Popochiu-Version mit Datum eintragen | Produktion | Nr. 172; Bewertung 4 | Erledigt: Godot 4.7.2 mit Popochiu 2.2.1, geprüft am 9. November 2026 |
| S6 | Puffer von 20 Prozent und Datum für die Steam-Seite | Produktion | Bewertung 4, zur 9 | Schätzung in der Produktion; endgültige Termine später |
| S7 | Gewerbe/Steuer mit Termin vor der Steam-Seite, Steuerberater-Erstgespräch | Recht | Nr. 174 | Offen, erst später |
| S8 | Altersfreigabe (USK 6 oder 12, PEGI 7); Pillen als Pastillen mit Apothekenkreuz | Recht | Nr. 175 | Pastillen erledigt (Konzept, Rätsel W3, Skript W3, Grafik); Altersfreigabe offen |
| S9 | KI-Offenlegungsstrategie entscheiden und im Store-Text erklären | Recht, Markt | Nr. 176 | Erledigt: Abschnitt „KI-Offenlegung“ in der Produktion |
| S10 | Markencheck des Titels (DPMA, EUIPO, Steam) | Recht, Markt | Nr. 179; Konzept: Rechtscheck | Websuche erledigt (Ergebnis in der Produktion); Registersuche DPMA und EUIPO offen |
| S11 | Halbe Seite Markt | Markt | Bewertung 4, zur 9 | Erledigt: Abschnitt „Markt“ in der Produktion |
| S12 | Toadi und Zeldina komplett aus dem Marketing halten, Abspann-Pilz geprüft | Recht | Nr. 173 | Erledigt als Regel in der Produktion; Abspann-Pilz vor dem Trailer prüfen |
| S13 | Spalte „Ähnlichkeitsprüfung ok“ im KI-Protokoll | Grafik, Recht | Nr. 180 | Erledigt: Spalten des KI-Protokolls in der Produktion |
| S14 | Pixel-Referenz nur als Posen-Vorlage | Grafik | Nr. 181 | Erledigt als Regel in der Produktion (Hauptfiguren) |
| S15 | Dachboden-Konzeptbild in Seitenansicht neu erzeugen | Grafik, Produktion | Bewertung 4, Grafik zur 8 | Alle Grafik-Prompts geprüft und genauer gefasst; neuer Dachboden-Prompt im Tab Prolog und Finale; Bild selbst noch zu erzeugen |
| S16 | Erstes Sprite-Paar Max und Pixel mit Silhouetten-Test | Grafik, Produktion | Bewertung 4, Grafik zur 9 | Offen |
| S17 | UI-Mockup 320×180 | Spielsysteme, Produktion | Bewertung 4, Spielsysteme zur 9 | Offen |
| S18 | Hörtest des Goblin-Lieds | Audio, Produktion | Bewertung 4, Audio zur 9 | Untertitel für alle Lieder eingebaut (Audio, Spielsysteme); Hörtest nach dem Erzeugen |
| S19 | Welt-1-Skript als zweites Muster | Dialog-Skript | Bewertung 4 | Erledigt durch die Skripte |
| S20 | Prüfskript (Zeilenlänge, IDs, Sprecher) | Dialog-Skript, Technik | A2; Bewertung 4 | In Stufe 1 (Grundgerüst) eingeplant |
| S21 | Konsistenz-Check der Rätsel-Tabs | Durchgängigkeit, Technik | A13; Bewertung 4 | In Stufe 1 (Grundgerüst) eingeplant |
| A1 | Skript-Pipeline: Skript-Tabelle, Prüfskript, Godot-Übersetzungs-CSV, Zeilen-ID-Liste für Audio | Automatisierung | Runde 3 A1 | In Stufe 1 eingeplant |
| A2 | Prüfregeln im Prüfskript | Automatisierung | Runde 3 A2 | In Stufe 1 eingeplant |
| A3 | Godot headless: automatischer Rätsel-Durchlauf und Schalterprüfung | Automatisierung | Runde 3 A3 | Offen, Stufe 2 |
| A4 | Speichern/Laden-Test und Rundreise-Test | Automatisierung | Runde 3 A4 | Offen, Stufe 1 |
| A5 | Parallele Claude-Agenten je Raum nach dem Grundgerüst | Automatisierung | Runde 3 A5 | Offen, später |
| A6 | Audio-Pipeline: Skript-CSV, ElevenLabs-API, Audacity-Batch, Import | Automatisierung | Runde 3 A6 | Offen, Technik in Stufe 2 |
| A7 | CI mit GitHub Actions | Automatisierung | Runde 3 A7 | In Stufe 1 eingeplant |
| A8 | Web-Export für Testspieler | Automatisierung | Runde 3 A8 | Offen, Stufe 2 |
| A9 | Telemetrie im Testbuild | Automatisierung | Runde 3 A9 | Offen, Stufe 2 |
| A10 | Grafik-Batch: Prompt-Tabelle, Retro-Diffusion-API, Palettize, Zuschnitt, Protokoll | Automatisierung | Runde 3 A10 | Offen, später |
| A11 | KI-Protokoll automatisch als CSV | Automatisierung | Runde 3 A11 | Offen, Stufe 1; Spalten stehen fest |
| A12 | Lokalisierung EN per Claude aus der CSV mit Glossar | Automatisierung | Runde 3 A12 | Offen, Stufe 5 |
| A13 | Automatische Dokument-Konsistenzprüfung aus den Rätsel-Tabs | Automatisierung | Runde 3 A13 | In Stufe 1 eingeplant |
| A14 | Hinweis-Datei aus Skript und Rätseltabelle generieren | Automatisierung | Runde 3 A14 | Offen, Stufe 2 |
| A15 | Automatische Playtest-Auswertung per Claude | Automatisierung | Runde 3 A15 | Offen, später |
| A16 | Screenshot-Regressionstest headless | Automatisierung | Runde 3 A16 | Offen, später |
