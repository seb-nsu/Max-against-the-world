# 360-Grad-Prüfung von Couch Quest

> **Stand der Arbeit (wird laufend aktualisiert, am Ende entfernt)**
>
> - Geprüfter Stand: `main` bei Commit `6fe02fd` (enthält den Humor-Durchgang aus Pull Request 14).
> - Arbeitszweig: `claude/project-thread-769z6c`.
> - **Erledigt:** Dateiliste aufgenommen. Vollständig gelesen: alle Dateien unter `docs/` außer `uebersetzung/en.csv` (nur Stichprobe). Rohfunde dazu stehen im Abschnitt „Arbeitsnotizen“ ganz unten.
> - **Als Nächstes:** Bilder ansehen (`game/grafik/`, `concepts/`, `docs/grafik/skizzen/`, Projektordner), dann Spielcode (`game/skripte`, `game/oberflaeche`, `game/tests`, `tools`, `.github/workflows`), dann zweiter Durchgang durch die Skripte je Welt für die Abschnitte C, D und E.
> - **Auftrag erweitert (Sebastian, 10. November, 22:03 Uhr):** Der Spielcode im Repository wird mitgeprüft.
> - **Noch offen:** Story-Bibel, Abschnitte A bis N, Codeprüfung, Gesamtbild, Korrekturen, Fundliste, Zusammenfassung.

## 1. Zusammenfassung

*(folgt am Ende)*

## 2. Fundliste

*(folgt; Funde werden während der Prüfung hier gesammelt)*

| Nr. | Bereich | Ort | Problem | Schwere | Vorschlag |
| --- | --- | --- | --- | --- | --- |

## Bestandsaufnahme

### Welche Dateien es gibt

Die Hauptfassung liegt im Repository `seb-nsu/Max-against-the-world`. Der Projektordner (Bibliothek) enthält zusätzlich Exporte, ältere Konzeptfassungen, Layout-Skizzen, Grafiktests und Oberflächen-Entwürfe.

**Repository, Texte (rund 1,6 MB, etwa 14.500 Zeilen):**

| Datei | Umfang | Inhalt |
| --- | --- | --- |
| `README.md` | 1 Seite | Kurzbeschreibung, Ordnerübersicht, Werkzeuge |
| `docs/00-aufbau.md` | 31 Zeilen | Welche Datei welche Information besitzt |
| `docs/01-konzept.md` | 390 Zeilen | Geschichte, Ton, Figuren, Welt-Ideen, Finale, Rechtscheck |
| `docs/03-produktion.md` | 240 Zeilen | Technik, Werkzeuge, Kosten, Meilensteine, Recht und Markt |
| `docs/04-audio.md` | 240 Zeilen | Musik, Geräusche, Stimmen mit Prompts |
| `docs/05-spielsysteme.md` | 349 Zeilen | Dialogsystem, Schrift, Oberfläche, Hinweissystem, Speichern |
| `docs/entscheidungen.md` | 251 Zeilen | Geltende Entscheidungen mit Begründung |
| `docs/offene-punkte.md` | 81 Zeilen | Offene Punkte |
| `docs/skript/prolog.md` | 495 Zeilen | Dialog-Skript Prolog |
| `docs/skript/welt-1.md` bis `welt-4.md` | 1.300 bis 1.547 Zeilen je Welt | Dialog-Skripte der vier Welten |
| `docs/skript/zwischenspiele-und-finale.md` | 675 Zeilen | Zwischenspiele und Finale |
| `docs/raetsel/*.md` (6 Dateien) | 89 bis 398 Zeilen | Rätsel-Abläufe, Hinweise, Abhängigkeitsdiagramme |
| `docs/welten/*.yaml` (6 Dateien) + `README.md` | 139 bis 774 Zeilen | Welt-Tabellen: Räume, Wege, Gegenstände, Figuren |
| `docs/grafik/00-stil-und-werkzeuge.md` | 212 Zeilen | Stilregeln und Werkzeuge |
| `docs/grafik/01-max-und-pixel.md` | 122 Zeilen | Steckbriefe der Hauptfiguren |
| `docs/grafik/02-prolog-und-finale.md`, `welt-1.md` bis `welt-4.md` | 157 bis 230 Zeilen | Szenen-, Figuren- und Gegenstandsbeschreibungen |
| `docs/grafik/fertige-prompts/*.md` (5 Dateien) | 65 bis 159 Zeilen | Zusammengesetzte Grafikprompts |
| `docs/uebersetzung/en.csv`, `ui.csv` | 609 KB, 47 KB | Englische Fassung, Oberflächentexte |
| `docs/test/beobachtungsbogen.md` | 1 Seite | Bogen für Spieltests |
| `game/lokalisierung/texte.csv` | 1,2 MB | Aus dem Skript erzeugte Spieltexte |
| `game/daten/*` (18 JSON-Dateien) | erzeugt | Räume, Welten, Hinweise als Spieldaten |
| `game/skripte/*.gd`, `game/oberflaeche/*.gd` | 39 Skripte | Spiellogik und Menüs (Godot) |
| `tools/*.py` (19 Skripte), `tools/layout/*.yaml` | – | Prüf-, Export- und Grafikwerkzeuge |

**Repository, Bilder:**

| Ort | Anzahl | Inhalt |
| --- | --- | --- |
| `concepts/` | 3 | Freigegebene Konzeptbilder: Max, Pixel, Dachboden |
| `game/grafik/hintergruende/` | 6 | Echte Hintergründe: Dachboden (4 Stimmungen), Treppenhaus, Wohnzimmer |
| `game/grafik/platzhalter/` | 453 | Platzhalter für alle übrigen Räume, Figuren, Gegenstände |
| `docs/grafik/skizzen/` | 55 | Layout-Skizzen aller Räume |
| `tests/bildschirm/referenz/` | 55 | Referenz-Bildschirmfotos der Räume |

**Projektordner (Bibliothek):**

| Ort | Inhalt |
| --- | --- |
| `export/01` bis `07` | Sieben zusammengefasste Exportdateien (Stand vor dem Humor-Durchgang prüfen) |
| `konzepte/` | Ältere Konzeptfassungen und die drei Konzeptbilder |
| `grafik/` | Dachboden-Tests (Farben, Maßstab, Figurengrößen), Auflösungstest, Stimmungen, fertige Prompts, Layout-Skizzen |
| `grafik-pruefung/` | Layoutvergleich Dachboden |
| `skript/` | Vorher-Nachher-Gegenüberstellungen des Humor-Durchgangs |
| `ui/` | 22 Menü- und Oberflächen-Entwürfe, Schrifttests |
| `git/` | Drei Git-Bündel (Sicherungen) |
| `uploads/hearth/` | 8 hochgeladene Dateien ohne Endung (noch zu sichten) |

### Was zu fehlen scheint (erster Stand)

- **Audiodateien:** Im Repository liegt keine einzige Audiodatei. Geprüft werden kann nur `docs/04-audio.md`.
- **Fertige Grafiken:** Nur 6 Hintergründe (alle Prolog) sind echt. Alle übrigen 453 Bilder sind Platzhalter. Figuren- und Gegenstandsgrafiken fehlen ganz.
- **`docs/02-…`:** In der Nummerierung der Hauptdokumente fehlt die 02 (es gibt 00, 01, 03, 04, 05). Noch zu klären, ob das Absicht ist.
- **README:** nennt 320×180 als Auflösung, der Stand im Repository ist 640×360 (Commit `bd6e948`). Noch am Material zu bestätigen.

*(Inhaltsangaben und Story-Bibel folgen nach dem vollständigen Lesen.)*

## Story-Bibel

*(folgt)*

## 3. Abschnitte A bis N

*(folgen)*

## Gesamtbild

*(folgt)*

## 4. Was auf keinen Fall verloren gehen darf

*(folgt)*

## 5. Direkt korrigierte Kleinigkeiten

| Datei | Vorher | Nachher |
| --- | --- | --- |

*(noch keine)*

## 6. Empfohlene Reihenfolge

*(folgt)*

## Arbeitsnotizen (Rohfunde, werden am Ende in die Abschnitte einsortiert und dann gelöscht)

Noch nicht alle am Material gegengeprüft. „Z.“ ist die Zeilennummer der Datei.

### Aus `README.md`, `docs/00-aufbau.md`, `docs/entscheidungen.md`, `docs/05-spielsysteme.md`

- `README.md` Z.5: nennt „Pixel-Art in 320×180, Grafik mit Retro Diffusion“. Stand laut `entscheidungen.md` Z.143: 640×360, Hintergründe aus Gemini-Konzeptbild mit `tools/pixelieren.py`. Veraltet.
- Die fehlende Nummer 02 ist erklärt: `entscheidungen.md` Z.3 nennt `docs/02-ueberarbeitung.md` als Datei in der Git-Historie. Kein Fehler.
- `entscheidungen.md` Z.148: „Figuren um ein Viertel größer: Max 105 Pixel“ steht ohne Durchstreichung da, ist aber durch Z.144 (Max 189 Pixel) überholt und steht in der Tabelle hinter der neueren Zeile. Verwirrt.
- `entscheidungen.md` Z.83 sagt, Errungenschaften seien der „sechste Kanal“ im Hauptmenü. `05-spielsysteme.md` Z.191 und Z.250: Kanal 5 (Fortsetzen, Neues Spiel, Laden, Optionen, Errungenschaften, Beenden). Widerspruch.
- `05-spielsysteme.md` Z.345–346 („Offene Entscheidungen“): „Schrift festlegen (Monogram Extended oder m5x7)“ ist noch offen angehakt, obwohl Nunito am 9. November festgelegt wurde (Z.124). Der Punkt darunter sagt „Text bleibt in Spielauflösung“, Z.142 sagt das Gegenteil (Textebene in 1920×1080). Veraltet.
- `05-spielsysteme.md` Z.142 gegen Z.144: Sprechblasen „46 px“ gegen „12 Spielpixel (bei 1080p 48 px)“; Blasenbreite „1.080 px“ gegen „270 Spielpixel“. Bei 640×360 und Faktor 3 sind 12 Spielpixel 36 px und 270 Spielpixel 810 px. Die Zahlen stammen noch aus 480×270. Am Code prüfen (`gui_theme.tres`).
- `05-spielsysteme.md` Z.205: Fenstergrößen „960×540, 1440×810, 1920×1080“ als „ganzzahlige Stufen“. Bei 640×360 sind das die Faktoren 1,5 und 2,25. Ganzzahlig wären 1280×720 und 1920×1080. Am Code prüfen (`optionen.gd`).
- `05-spielsysteme.md` Z.124: Begründung nennt noch „bei 320×180“.
- `05-spielsysteme.md` Z.104 („Max spricht kurz“) passt nicht mehr ganz zur neuen Dialogregel in `01-konzept.md` Z.63 („erzählt einen Gedanken zu Ende“).

### Aus `docs/01-konzept.md`

- Z.59–60 (neue Dialogregeln) gegen Z.69–78 (Beispielsätze): Die Regel verbietet Reihen aus Ein- und Zwei-Wort-Sätzen und begrenzt „Wie X, nur Y“. Die Beispielsätze direkt darunter tun genau das: „Sport. Freiwillig. Die spinnen, die Griechen.“, „Klebt. Ich nenne das eine Bindung.“, „Sieht aus wie Montagmorgen, nur grüner.“, „Sie klingt wie die Schulsekretärin, nur mit Laser.“ Die Beispiele stammen aus der Zeit vor dem Humor-Durchgang. Wer künftig danach schreibt, bekommt zwei widersprüchliche Vorgaben.
- Z.177: Quelle für Cicero und das Archimedes-Grab ist eine unbekannte Biografie-Seite (`alankyerematen.org`). Die Zahl 137 stimmt (212 v. Chr. bis 75 v. Chr.), die Quelle ist schwach. Besser Wikipedia oder Cicero, Tusculanae 5,64.
- Z.362: Tabelle nennt den Titel noch „Arbeitstitel“, obwohl er festgelegt ist. Repository heißt „Max-against-the-world“ (Einzahl), Titel „…the worlds“ (Mehrzahl).
- Z.73: „Die spinnen, die Griechen“ ist das bekannteste Asterix-Zitat (in den Rechtscheck-Tabellen nicht aufgeführt).

### Aus `docs/skript/prolog.md`

Stärken (bleiben): „Die Wissenschaft hat Knie, Junge! Alte Knie!“ (P0_WOHN_OPA_0042), „Zu einem Flugzeug sagst du ja auch nicht Bus.“ (P0_DACH_OPA_0060), „Fair, motivierend, großväterlich.“ (0130), „Funknetz, vier Buchstaben: NEIN“ (P0_WOHN_MAX_0365), „ZAPPOMAT“ mit dazugemaltem Kästchen (0355), Pixels Auftritt „Wer. Hat. Mich. Geweckt.“ mit Lachs-Traum (0310–0360), „Ein Hase, der Empfang hat“ (0470), Kochbuch mit „Nicht wieder vergessen.“ (0955), Kartons „Später“ / „Später, wirklich. Der ist von 1979.“ (1810/1815), „230 Volt. Nicht lecken.“ (1835).

Funde:

- **Regelbruch Retro-Wissen:** P0_DACH_MAX_0680 – Max sagt „Das ist ein Testbild“. Laut `01-konzept.md` Z.55 kennt Max mit 16 kein Testbild; die Pointe gehört Pixel oder Opa. Drei Zeilen vorher (0430) kennt er den Sendeschluss korrekt nicht. Vorschlag: „Kanal 4. Bunte Streifen und ein Pfeifton. Das ist das Langweiligste …“
- **Widerspruch Pixels Vorwissen:** P0_DACH_OPA_0370 „Er kennt die Welten, und er kennt alle Antworten.“ gegen P0_DACH_PIX_0850 „Fernsehreisen … Ich habe nur noch keine gemacht.“ Entweder kennt Pixel die Welten oder er war nie dort.
- **Tageszeit:** P0_TREP_MAX_0020 „Draußen wird es langsam dunkel.“ Laut Konzept Z.124 ist im Prolog Nachmittag, das Licht wird erst von Rückkehr zu Rückkehr abendlicher, und das Treppenhaus kommt „im Finale am Abend“ wieder. Gegen Grafik-Datei prüfen.
- **Lösung hinter dem zweiten Ansehen:** P0_DACH_MAX_0630 – die Kanalnummer (und die Nahansicht) kommt erst beim zweiten Ansehen des Kalenders. Überall sonst ist das zweite Ansehen nur ein Bonus-Gag. Spieler, die einmal schauen, haben den roten Kreis, aber nicht die Nummer. Gegen `raetsel/prolog-und-welt-1.md` und Code prüfen.
- **Wiederholung:** Opa sagt zweimal fast dasselbe über die Zeit (0155 „vergeht die Zeit hier oben irgendwie anders“, 0845 „Drüben vergeht die Zeit anders als hier“).
- **Wiederholung:** „seit ich denken kann“ zweimal im Treppenhaus (P0_TREP_MAX_0050 und 0110).
- **Muster „nicht X, sondern Y“:** P0_WOHN_MAX_0365 („keine Lösung, … eine Haltung“), P0_TREP_MAX_0115 („keine Bitte, sondern eine Warnung“), P0_DACH_PIX_0215 („keine Freundlichkeit, sondern eine förmliche Warnung“), SYS_WDH_PIX_0020 („keine Meinung, sondern ein Messergebnis“), SYS_WDH_PIX_0030, SYS_ERS_PIX_0150. Zwei davon enden auf „Warnung“.
- **Muster im Benutzen:** Fast jedes Deko-Objekt folgt derselben Bauform: erstes Mal „Ich mach das nicht, weil …“, zweites Mal „Ich hab’s doch getan, und …, ich lass das jetzt“. Rund 25 Objekte in drei Räumen. Einzeln gut, in Serie vorhersehbar. Vorschlag: bei jedem dritten Objekt die Form brechen (Opa ruft dazwischen, Pixel kommentiert, oder es passiert schlicht nichts).
- **Glatte Schlusssätze:** Viele Max-Zeilen enden mit einem angehängten Kurzsatz als Pointe („Ruhe in Frieden, Keks.“, „Die Lampe sammelt.“, „Er gewinnt.“, „Ich lass das ab sofort.“, „Ich fass hier nichts mehr an.“, „Wir reden nie wieder darüber.“). Gleiche Satzmelodie über ganze Räume.
- Kopfzeile Z.3: „rund 180 Zeilen“; `05-spielsysteme.md` Z.111 sagt „165 Zeilen“, Budget 170. Nachzählen.
- P0_DACH_PIX_0340 „Der redet seit Jahren“ – Max kennt den Kater seit Jahren und hat es nie bemerkt, Opa „schaltet den Lautsprecher ein“. Kleiner Wackler, als Gag vertretbar.

### Aus `docs/skript/welt-1.md`

Stärken (bleiben): Humberts Keller-Pointe „Dreihundert Jahre lang ein Etikett.“ und „Das schmeckt nach Macht. Und nach Gruyère.“ (W1_TAV_HUM_1250/1270); Gollo verliert gern („Ich liebe es. Ich habe verloren. Endlich.“, 1210); „Das ist kein Blick. Das ist mein Gesicht.“ (W1_LUFT_PIX_0460); Zeldinas Logik „Dunkle Lords tragen Kisten umsonst“ (0260); „Vermittelt.“ (0550); „Das ist Finden mit Anlauf.“ (0640); Waldemar durchgehend („Die Versammlung bin ich. Ich bin nie beschlussfähig.“, W1_BRUE_WAL_1270; „Gefühle sind vorher anzumelden“, 0266); Ziegisch-Dialekte (0700–0810); Smaugi „Seit die Besen da sind, finde ich alles. Das ist noch schlimmer.“ (W1_SMAU_SMA_0030); Tür sagt „Mama?“ (0770); „Damit kann ich nur Käse.“ – „Ich auch. Aber ich hab Übung.“ (W1_THRO 0410/0420); „Wer im Wald einfach was nimmt, kriegt am Ende eine Moral.“ (W1_WALD_MAX_0730); Max’ Moment „Ja. … Trotzdem.“ (W1_LUFT_MAX_0310). Das Passwort-Rätsel (vier Fundorte, Reihenfolge ableitbar) und das Flaschenrätsel (genau eine Lösung, nachgerechnet) sind fair.

Funde:

- **Falscher Sprecher (Tippfehler):** Z.400 und Z.404, W1_SCHM_SCH_0760 und _0780: Sprecherspalte „Schreiber“ statt „Schmied“. Direkt korrigierbar.
- **Doppelte Frage im selben Gespräch:** Schmied, W1_SCHM_MAX_0221/0222 („Hast du mal versucht, sie wegzuschicken?“ – „Dreimal.“) und 0750/0760 („Und warum jagst du sie nicht weg?“ – „Hab ich versucht.“). Der Nachsatz aus dem Humor-Durchgang wiederholt die vorhandene Rückfrage.
- **Entscheidung rückgängig gemacht:** W1_SCHM_SCH_0780 („Jedes Schwert hat einen Namen. Ingrid, Helga, Kurt.“) und die Namensschilder am Kochgeschirr (0040/0045). `entscheidungen.md` Z.188 hatte „zwei Schwert-Namensgeber im Dorf“ ausdrücklich abgeschafft. Dazu fragt Max zweimal fast wortgleich „Du nennst deine Schwerter beim Vornamen?“ (W1_TAV_MAX_0550) / „Du hast deinen Schwertern Namen gegeben?“ (W1_SCHM_MAX_0770).
- **Widerspruch Rotkäppchens Oma:** W1_WALD_ROT_0222 („Sie zieht dauernd um, immer tiefer in den Wald“) gegen W1_WALD_ROT_0780 („Ist in Rente. Wohnt auf Mallorca.“) und W1_ABS_ROT_0180 („Oma wartet“).
- **Widerspruch Zeldina:** W1_LUFT_ZEL_0840 („Der Drache war der Vermieter. Der Turm war zu teuer.“). Später will sie genau diesen Turm, Smaugi ist dort Untermieter mit Kram, und der Turm gehört Moderwort.
- **Gollo, Abschiedszeilen:** W1_ABS_GOL_0220 („Unser Gold ist weg … Nur das Ssschätzchen bleibt. Niemand will es.“) stimmt in keinem Zustand: Vor Rätsel 1 hat er die Münze noch, nach Rätsel 1 ist der Ring weg. Außerdem spricht Gollo nur hier in „wir/unser“, sonst immer „ich“.
- **Anrede:** Maklerin und Stabmacher duzen Max im Gespräch, siezen ihn aber in den Abschiedszeilen (W1_ABS_MAK_0230/0240, W1_ABS_STA_0120).
- **Kleiner Sachfehler:** W1_ANK_PIX_0040 „wenn ich die Fernbedienung richtig gelesen habe“ – der Zapp-O-Mat hat einen Drehknopf, die Fernbedienung ist ja gerade weg.
- **Paragrafen:** W1_BRUE_WAL_1060 nennt „Paragraf eins: Erst das Märchen, dann das Bad“, auf dem Schild ist Paragraf 1 die Reihenfolge der Ziegen (0040) und so zitiert ihn Waldemar auch in 0480. Außerdem „Paragraf 14b“ (0060) gegen „Regel 14b“ (1000).
- **Pointe vorweggenommen:** W1_HOGG_ALW_0360 „Die Milch ist in einem anderen Schloss.“ Der Satz mit der Milch ist laut Konzept die Schlusspointe im Abspann (Toadi: „deine Milch ist in einem anderen Supermarkt“). In Welt 1 fällt der Schloss-Satz insgesamt sechsmal (Toadi 4×, Toadis Abschied, Alwin).
- **Wörtliches Tolkien-Zitat:** W1_TAV_GOL_0760 „Was hat Wurzeln, die keiner sieht, und ist höher als Bäume?“ ist fast wörtlich das Rätsel aus „Der Hobbit“, dazu „Was hab ich in meiner Tasche?“ (1120). Rechtlich heikler als ein Name, weil es Text des Originals ist. Eigenes Rätsel schreiben.
- **Wörtliche Markenbegriffe:** „Gleis neundreiviertel“ (W1_DORF_MAX_0295), „Vielsaft“ (deutscher Originalbegriff, W1_TAV_MAX_0290), „Schicksalsberg“ (deutscher Originalbegriff). Im Rechtscheck stehen Vielsaft und Schicksalsberg als „bleiben“, Gleis 9¾ fehlt dort.
- **Namensgleichheit:** Das Huhn heißt Hilde (W1_TAV_PIX_1470), die Oma heißt Hildegard. Vermutlich Zufall; entweder umbenennen oder im Finale als Gag nutzen.
- **Motivation Bosskampf:** Nach Rätsel 12 hat Max das Ei, das Ziel der Welt. Warum er noch in den Thronsaal geht, steht nur in zwei Zeilen (W1_THRO_MAX_0020 „Das hab ich aber schon.“, ZEL_0040 „Wegen der Wohnung.“). Vorschlag: gleich nach der Ei-Übergabe (W1_SMAU_MAX_0630) eine Zeile, in der Max sich entscheidet, Zeldina noch zu helfen. Das wäre zugleich sein Entwicklungsmoment mit mehr Gewicht.
- **Rätsel 9 (Maklerin):** Der Steckbrief als „Exposé“ ist die schwächste Logik der Welt. Auf dem Steckbrief steht nichts vom Turm. Ohne Steckbrief im Inventar erscheint die richtige Option gar nicht. Fair wird es erst durch Hinweis Stufe 2. Vorschlag: Steckbrief nennt „Wohnhaft: Dunkler Turm, 7 Stockwerke“.
- **Alwins Reim (W1_HOGG_ALW_0620):** Strophe 2 reimt sich kaum („Trank / Rand“, letzte Zeile ohne Reim), obwohl Alwin „in Reimen“ ankündigt. Entweder als Gag markieren (Alwin: „Die letzte Zeile reimt sich nicht. Ich war müde.“) oder sauber reimen.
- **Zweitzeilen fehlen:** In Taverne (W1_TAV_MAX_0110–0360), Klassenzimmer (W1_HOGG_MAX_0110–0210) haben die Ansehen-Zeilen keine „zweites Mal“-Fassung, in allen anderen Räumen schon. Mit `tools/pruefen.py` nachzählen.
- **Verwaister Gegenstand?** „Fläschchen, klein/gross“ (W1_INV_MAX_0130–0145) kommt im Raum-Skript von Welt 1 nicht vor. Gegen `welten/welt-1.yaml` prüfen.
- **Wiederholte Bausteine:** „Montag“ als Vergleich (P0_WOHN_MAX_0185, W1_HOGG_MAX_0160, W1_BERG_MAX_0020); „seit ich/sie denken kann“ (jetzt viermal); Pixel-Kaskaden enden sehr oft auf dieselbe Wendung („Ich spreche da aus Erfahrung“, „junger Mann“, „und zwar“). Häufigkeiten am Ende per Suche belegen.
- Kopfzeile Z.3: „rund 870 Zeilen in 16 Abschnitten“ – veraltet (laut `05-spielsysteme.md` über 1.000).
- Sprecherspalte uneinheitlich: „Alwin“ / „Alwin Grauwald“, „Goblin 1 und 2“ unter der ID GO1.

### Aus `docs/skript/welt-2.md`

Stärken (bleiben): Sphinx-Rätsel mit eigener Zeile für jede falsche Kombination; Hofkater-Duell („Das ist kein Widerspruch. Das ist Theologie.“, „Götter liegen nicht durch. Sie liegen ein.“); Ramses’ Stimme durchgehend („Ich habe entschieden, dass es zählt.“); Schreiber („Das hab ich jetzt nicht gesagt.“); Hermes („noch innerhalb der Garantie“, „Dann ist er da!“ zeigt auf eine Wand); das Amt („Das ist Verwaltung. Dasselbe Wort, nur länger.“, „Wir prüfen keine Siegel, wir verneigen uns vor ihnen.“, „Nummer ziehen.“ ohne Nummern); Leonidas’ leiser Moment („… ein bisschen. ABER LAUT!“, W2_STAD_LEO_0370); Trainings-Szene mit „Noch mal.“ (W2_TRAI_MAX_0110) als Max’ Entwicklungsmoment, sauber vorbereitet und von Pixel kommentiert; Grab-Szene („keiner lobt die zwei Drittel“, W2_GRAB_ARC_0210, mit Max’ ehrlicher Antwort 0215); Rückbezug auf Welt 1 (W2_DISK_MAX_0160, Pixels Nase bei den Flaschen); „Wir sind hundertzwölf Jahre gefahren für einen Kranz aus Blättern.“ (W2_PARA_VOL_0010); Archimedes’ Hebel-Kommentare je Gegenstand (W2_HEBL_ARC_0020–0190); die Zeit-Fähre als Mechanik, die drei Rätsel trägt (Feigen, Grabstein 112 + 25 = 137, Essig zu Wein). Ciceros 137 Jahre stimmen sogar historisch.

Funde:

- **Falscher Sprecher (Tippfehler):** Z.831, W2_AGOR_GRI_0660: „Grimmzahn“ statt „Grieche“. Direkt korrigierbar. Ursache: `tools/zeilen_einfuegen.py` nimmt den häufigsten Sprechernamen eines Kürzels über **alle** Skriptdateien, nicht nur aus derselben Welt (SCH: Schreiber/Schmied/Schmidt, GRI: Grimmzahn/Grieche). Dieselbe Ursache: W1 Z.400/404 und W3 Z.342/346/350 (dort „Schreiber“ statt „Schmidt“). Code-Fund.
- **Tippfehler:** Z.1223, W2_INV_MAX_0030: „Ich auch,.“ Direkt korrigierbar („Ich auch.“).
- **Komma zwischen Subjekt und Verb in Pixel-Zeilen** (alle aus dem Humor-Durchgang, Commit 5a7110f): W2_TAG1_PIX_0070 „Der Philosoph, hat Max nicht gekannt.“; W2_KRON_PIX_0150 „Und DU, bist bloß der Diener einer Katze.“; W2_TAG1_PIX_0170 „So, stelle ich mir Sport vor.“; W2_HEBL_PIX_0200 „Und niemand, erwähnt jemals wieder den Umzugskarton.“; W2_HINT_PIX_0622 „Und Syrakus, liegt flussabwärts.“; W2_GRAB_PIX_0150 „… dasselbe Geräusch, und werde dafür …“; W2_INV_PIX_0140 „Ich habe keine Flügel, und bin trotzdem …“; W2_BUER_PIX_0640 „Ich öle mich nie, und bin trotzdem geschmeidig.“ Grammatisch falsch. Falls als Sprechpause gemeint: besser Gedankenstrich oder Punkt. Über alle Dateien suchen.
- **Großbuchstaben mit ß:** W2_STAD_LEO_0210 „SCHOß“. In Versalien „SCHOSS“ oder „SCHOẞ“ (prüfen, ob Nunito das große ß hat).
- **Rätsel 7, falsche Begründung:** W2_DISK_HER_0240 „Wenn ich es war, hab ich zweimal die Wahrheit gesagt.“ Stimmt nicht: Wäre Hermes der Dieb, wäre seine zweite Aussage („Die Sphinx war’s“) gelogen. Zweimal die Wahrheit hätte dann Leonidas gesagt. Das Rätsel selbst ist eindeutig (nachgerechnet: nur bei Tiro lügt jeder genau einmal). Vorschlag: „Wenn ich es war, hat Leonidas zweimal die Wahrheit gesagt. Der? Niemals.“
- **Rätsel 7, Rahmen:** Der Diskus fehlt „HEUTE NACHT“ (W2_DISK_LEO_0010), obwohl es gleich nach Tag 1 weitergeht; die Sphinx sitzt 112 Fähr-Jahre entfernt und gilt trotzdem als „in der Nähe“ (W2_DISK_MAX_0020). Klein, als Gag vertretbar.
- **Zählfehler:** W2_NIL_PIX_1070 „Ich sitze seit drei Welten Modell“ – es ist die zweite Welt.
- **Gag doppelt:** W2_HAFS_PIX_0020 (Sendeschluss, „anständige Leute gingen schlafen“) wiederholt P0_DACH_PIX_0420 fast wörtlich. „Die spinnen, die Griechen“ steht zweimal (W2_AUDI_MAX_0110, W2_STAD_MAX_0010). „Wie lange noch … meine Geduld missbrauchen“ zweimal (W2_AGOR_CIC_0350, W2_ABS_CIC_0200). „Störe meine Kreise nicht“ dreimal (W2_WERK_ARC_0440, W2_INV_MAX_0465, W2_ABS_ARC_0160). „Was haben die Römer je für uns getan“ viermal (Hermes W2_BUER_HER_0650, Grieche 0400/0410, Konter 4).
- **Verpassbarer Wunsch:** Pixels Wunsch für Welt 2 (W2_NIL_PIX_0620, Notizbuch Seite 3) hängt an „Ansehen: Weizenfeld, zweites Mal“. Dort teilen sich zwei Zeilen denselben Auslöser (0615 Max, 0620 Pixel). Gegen Errungenschaft Einkaufsliste und Finale prüfen.
- **Zahlen:** Fährmann „seit viertausend Jahren“, Hermes „dreitausend Jahre“, Sphinx riecht „nach dreihundert Jahren Nachdenken“ (W2_DISK_PIX_0200), Wartezeile „seit Jahrtausenden“ (W2_HINT_PIX_9995), Amt „seit vierhundert Jahren“. Die Sphinx-Zahl wirkt wie ein Versehen.
- **Anrede:** Beamter 1 duzt („Dann wirst du einer“), in der Abschiedszeile siezt er (W2_ABS_BE1_0240 „für Sie jetzt geschlossen“). Als Amtsdeutsch vertretbar, sonst angleichen.
- **Wörtliche Zitate (Recht, Abschnitt M):** „Passierschein A38“ (Asterix erobert Rom) als tragendes Rätselwort; Figur „Brian“ mit „Ich bin nicht der Messias“ / „Nur der wahre Messias würde das leugnen“ / Sandale gegen Schuh / „Was haben die Römer je für uns getan“ samt Aufzählung (Das Leben des Brian, teils wortnah); „Die spinnen, die …“ (Asterix); „DAS IST OLYMPIA!“, „HEUTE ABEND SPEISEN WIR …“ (300). Als Parodie in dieser Dichte vertretbar, aber A38 und der Messias-Dialog sind die zwei Stellen mit dem größten Wiedererkennungswert bei den Rechteinhabern.
- **Anspielungen Welt 2 (für Tabelle D):** Gladiator (Hand im Weizen, W2_NIL_MAX_0610/0615), Obelix (0725), Prince of Persia (0635), Charon/Obolus, „Walk like an Egyptian“ (Wandfries, W2_THRO_MAX_0230 ff.), Indiana Jones (Steinkugel, W2_SPHX_MAX_0070/0075), Ali Baba (W2_KUCH_MAX_0065), Asterix (A38, „Die spinnen“), Brot und Spiele, Ödipus/Sphinx-Rätsel, Archimedes (Heureka, Brennspiegel, Kugel im Zylinder, fester Punkt, Kreise), Cicero (Catilina-Rede, Grab des Archimedes), Tiro (Kurzschrift), Diogenes (Tonne, Sonne), Zenon (Achilles und die Schildkröte, W2_STAD_MAX_0255, W2_TAG1_PIX_0070), Assassin’s Creed (Adler, Heuhaufen, W2_AGOR_MAX_0035/0040), Leben des Brian, 300 (Leonidas, Brunnen W2_STAD_MAX_0125), Orpheus (Straßenmusiker), Venus von Milo, Nase der Sphinx, schiefer Turm, Monkey Island (Beleidigungs-Duell als Mechanik), Shrek (Zwiebeln haben Schichten, W2_INV_MAX_0355), „der Butler war’s“, Pizza Hawaii, Marathon. Sehr dicht, aber fast alle funktionieren ohne Vorwissen als Bild oder Figur. Ohne Vorwissen leer: Prince of Persia (0635), Gladiator-Hand, Assassin’s-Creed-Zweitzeile.
- **Anachronismus:** Archimedes sagt „Umzugskarton“ (W2_HEBL_ARC_0190). Als Gag gesetzt (Pixel greift es auf), kann bleiben.
- Kopfzeile Z.3 „rund 900 Zeilen“ veraltet.
- Auslöser-Schreibweise „Ansehen: Traubensaft, Traubensaft“ (W2_INV_MAX_0390 ff.) ist verwirrend; gemeint ist Gegenstand, Zustand.
- Noch gegen `raetsel/welt-2.md` prüfen: Kaugummi wird im Duell oder bei Nebet verbraucht, Kugelschreiber beim Rundschreiben; bleibt für die Sphinx immer ein Wunderding übrig (Handy geht erst bei der Parade)? Hinweis R02b Stufe 3 nennt den Brennspiegel als Ersatzwunder – ist Syrakus vor der Audienz erreichbar? Konter 1 bis 3 nur über „Schriftrolle ansehen, zweites Mal“ (W2_RING_MAX_0030)?

### Aus `docs/skript/welt-3.md`

Stärken (bleiben): Mensch-Test (die logische Antwort fällt durch, die menschliche erscheint erst mit Beobachtung; „Das ist keine Menschlichkeit. Das ist 2026.“ W3_TEST_DEC_0300; „Mensch, vorläufig.“); Herr Vier durchgehend („Drei ist eine Vier, der etwas fehlt.“, „‚Viel‘ ist Faulheit mit Vokalen.“, „Es ist nicht Salz.“ – „Es ist ein bisschen Salz.“); Orakel-Oma („Ich habe schon gefegt, für danach.“, „Darum ist es eine Prophezeiung und kein Bericht.“ W3_KUCH_ORA_0410, bereitet Max’ Schlusssatz vor); die blaue Pastille als spielbare Sackgasse mit Pixels zwei Ohrfeigen („Das war von Opa. Das hier ist von mir.“ W3_SOFA_PIX_0540) und Max’ „Das war … bequem. Wirklich bequem. Darum nehm ich die nicht.“ (W3_APO_MAX_0570); Schmidt ohne Punkt und die redende Tür; Kaffeetasse als Chef; Hundekuchen-Szene (W3_BAS_PIX_0090) als Lehrstück für die Verwandlungsregel; Kalle („Alles mit T.“, „Parsec ist eine Strecke“ – „Sag ich doch. Kurze Strecke.“); Modell 08/15 („Das ist mein Satz, Bursche. Aber ich leihe ihn dir gern. Bring ihn sauber zurück.“ W3_EING_HAU_1086); Opa durchs Portal: „Hast du an die Milch gedacht?“ (W3_KAM1_OPA_0100); Bernd spricht genau einmal (W3_KAM3_BER_0230); M.U.T.T.I.s Ende („… bin ich keine gute Mutti.“ – „Doch. Ehrlich gesagt: ziemlich normal.“ W3_KERN_MUT_0180/MAX_0190); Radio-Moment „Welttag der vergessenen Geburtstage“ (W3_KUCH_RAD_0230) und der Kuckuck „Milch! Milch! Milch!“; Gegenstände aus Welt 2 wirken nach (Olivenöl, Sandale). Fehltausche haben durchweg eigene Pointen und setzen sich beim Verlassen zurück: keine Sackgasse gefunden.

Funde:

- **Falscher Sprecher (Tippfehler):** Z.342, 346, 350 (W3_TUER_SCH_0340/0360/0380): „Schreiber“ statt „Schmidt“. Direkt korrigierbar.
- **Tippfehler:** Z.543, W3_TURM_MAX_0520 „Gute Führung,.“; Z.1242, W3_HINT_PIX_0120 „Genau das braucht du.“ (brauchst); Z.291, W3_SIM_MAX_0050 „Und ist es … zu leise.“ (Wortstellung: „Und es ist … zu leise.“). Direkt korrigierbar.
- **Pixel spricht, wo er nicht ist:** In Simulation und Labor ist Pixel nur über Hörer, Wandtelefon, Terminal oder Lautsprecher zu hören (Abschnittstexte 5, 7, 14, 19). Sieben Zweitzeilen haben trotzdem den Sprecher „Pixel“ ohne Leitung und beschreiben Körperliches: W3_KUCH_PIX_0535 („Ich rieche sie bis hierher“), W3_TURM_PIX_0235 (würde in den Pflanzen graben), W3_KAM1_PIX_0365 (feine Nase am Pappkuchen), W3_KERN_PIX_0415 (würde sich auf die Zelle legen), W3_INV_PIX_0045 (kalte Kekse gibt es nur in der Simulation), W3_INV_PIX_0115 (Gummihuhn gibt es nur im Labor), W3_INV_PIX_0135 („Ich setze mich trotzdem auf dich“, glühende Zelle nur im Kern). Vorschlag: Sprecher und Auslöser auf die Leitung umstellen und den Text anpassen, oder Max sprechen lassen. Im Code prüfen, was vor PIXEL_AUF_LEITUNG passiert.
- **Widerspruch im selben Gespräch:** Auftragszettel von Modell 08/15. W3_EING_HAU_0050: oben „Sahra Konner finden“, darunter „Boden wischen“, der zweite Punkt ist erledigt (Pixel greift das in 0060 auf). W3_EING_HAU_1060 (Humor-Durchgang): „Erstens wischen. Zweitens Sahra Konner finden. … Ich bin seit neunzehn Jahren bei Punkt zwei.“
- **Zahlen zu Pixel:** W3_HINT_PIX_0350 „sechzehn Jahre lang. Ich war die ganze Zeit dabei“ gegen „seit vierzehn Jahren“ (W2_TRAI_PIX_0140, W3_KAM1_PIX_0480).
- **Kleidung Morphäus:** W3_APO_MAX_0295 „nur der Mantel weht“, er trägt aber Strickjacke (W3_APO_MOR_0300, Pixel nennt ihn „Strickjacke“).
- **Gleiche Lösung zweimal:** Rätsel 5 (Tür) und Kammer 3 lösen sich mit demselben Tausch verschlossen ↔ gesprächig. Im Skript als Rückbezug gebaut (Tür-Netzwerk, Hinweis W3_HINT_PIX_1010), kann bleiben; die zweite Hälfte (Bernd/Huhn) trägt das Neue.
- **Hinweise nennen Bedienung:** W3_HINT_PIX_0130 und 0730 „Rechtsklick“, W3_HINT_PIX_0330 und 1230 „Drück Tab“. In Welt 2 heißt es neutral „Wechsle zu mir“. Mit Controller oder umbelegten Tasten stimmt der Text nicht (siehe `05-spielsysteme.md`, Controller). Neutral formulieren oder Platzhalter für die Taste.
- **„seit drei Welten“** zweimal in derselben Welt (W3_SIM_MAX_0050, W3_KUCH_MAX_0710), dazu W3_KAM1_PIX_0200 und W3_KAM3_PIX_0280.
- **Zahl 47** viermal in verschiedenen Rollen (Sahra Konner 47-mal, 47 Leute bei der Oma, Testperson 47, Max ist Testperson 48). Wirkt gewollt; falls ja, einmal im Skript-Kopf festhalten.
- **Wörtliche Zitate (Recht):** Blade Runner: Schildkröte in der Wüste auf dem Rücken (W3_TEST_DEC_0100, fast wörtlich der Test aus dem Film), Nudelbude „zwei mal zwei … vier“, Origami-Einhorn, „Replikant“ (W3_TEST_MAX_0220). Matrix: Morphäus, rote und blaue Pastille mit „wie tief der Kaninchenbau geht“ (W3_NUD_MOR_0420, wortnah), Déjà-vu-Katze, Vase („du wirst meine Vase zerbrechen“), Gabel statt Löffel, Agent mit Klonen, Zeitlupen-Kugel. Star Wars: „Hilf mir, Max. Du bist meine einzige Hoffnung.“ (W3_PIEP_OPA_0120), „Kessel-Lauf in unter zwölf Parsec“ (W3_BAS_KAL_0440, wörtlich), „Das ist nicht der Junge, den du suchst“ (W3_EING_MAX_0160). Terminator: „Sahra Konner“, „Ich komme wieder“. Portal: Begleitwürfel, Portalgerät, „DER KUCHEN EXISTIERT NICHT“ (W3_KAM2_MAX_0140), Testkammern, Kuchen-Versprechen. Per Anhalter: Handtuch „Keine Panik“. Monkey Island: Gummihuhn mit Seilrolle (W3_KAM2_PIX_0070). 2001: Großrechner summt ein Kinderlied. Die Welt ist die dichteste; „Kessel-Lauf“, „einzige Hoffnung“ und der Schildkröten-Test sind am nächsten am Originaltext.
- Kopfzeile Z.3 „rund 870 Zeilen in 20 Abschnitten“ veraltet.
- Sprecherspalte uneinheitlich: „Schmidt“ / „Agent Schmidt“, „Kalle“ / „Kabel-Kalle“ / „Kalle (Text)“ / „Kalle (Text auf dem Bildschirm)“.

### Aus `docs/skript/welt-4.md`

Stärken (bleiben): Testbild-Rätsel als Pixel in Graustufen („Grau, Dunkelgrau und Thunfisch“ W4_TEST_PIX_0140); Flimmer („Einen Fehler macht man, eine Störung ist man!“, „Ich bin immer da. Das ist mein Problem.“); Gerd Glück („Drei Silben, nur 19,99!“; er nimmt den Laufgag zurück, W4_BONU_GER_0230, Pixel 0240); Sitcom („WIR REDEN NICHT ÜBER FOLGE 87!“, „Du hattest nie einen, Schatz.“, Stummtaste: „wirkt plötzlich sehr traurig“ W4_TAST_MAX_0030); Erzähler der Tierdoku („Sofa-Mensch“); Kommissar („Jeder hat eins. Darum sind alle verdächtig.“); die Hyäne platzt bei „Fondue“; die Genre-Mechanik (Küchentür in den Horrorkeller, „Schatz, ich bin zuhause!“ vertreibt die Geister, Käse und Banane verwandeln sich je Sender); Lichterkette mit Opa („NICHT HINSETZEN.“, „DU BIST DAS EINE.“, „VORHEIZEN.“); der Amboss stoppt Pixels Erkenntnis (W4_KAPI_PIX_0030 bis 0070) und das Rückspulen (W4_TAST_MAX_0160); Springseil der Wahrheit (W4_KAPI_MAX_0420, „Ich mag Max. Ein bisschen. Das Seil ist kaputt.“ W4_PIXM_PIX_0170); Endkampf, in dem jede Taste einen sichtbaren Grund hat; Albtraum-Szene; Zappmann als Spiegel von Max („Ich wollte nur nie wieder aufstehen müssen. Und jetzt sitze ich hier allein.“ W4_STUD_ZAP_0300, „Hab ich auch, vor vier Welten, auf einem anderen Sofa.“ W4_STUD_MAX_0310); „sag ihm, der Backofen ist verziehen“ (0390); Nachsicht nach Fehlversuchen über Flimmer (W4_FRIE_FLI_0300); Sonnenbrille aus Welt 3 als Abkürzung (W4_HALL_AGE_0470).

Funde:

- **Tippfehler:** Z.474, W4_FRIE_MAX_0010 „Das Programm macht Pause, und hat das Programm ein besseres Leben als ich.“ (Wortstellung: „und das Programm hat“); Z.734, W4_KAPI_FLE_0310 „Fledermause hängen!“ (Fledermäuse); Z.1148, W4_PIXM_PIX_0270 „Das finde ich, sehr verständlich.“ (Komma, gehört zum Pixel-Komma-Muster).
- **Ungewollter Beiklang:** W4_FABR_FLE_0330 „Ein Führer mit Laken! Ich folge ihm!“ Führer plus weißes Laken liest sich unglücklich. Vorschlag: „Anführer“, wie bei Wilma. Bereich M, mittel.
- **Zeitlinie:** W4_STUD_MAX_0160 „Ich habe eine Woche lang Dinge getan.“ gegen die Regel „ein Nachmittag“. W4_STUD_ZAP_0390 „Vor ein paar Wochen ist sie mir aufs Sofa gefallen“ und W4_RAU_PIX_0255 „Ich warte seit Wochen“ gegen den Prolog prüfen (seit wann ist die Fernbedienung weg?).
- **Doppelt belegte Auslöser:** Derselbe Hotspot hat zweimal „zweites Mal“, meist eine alte Pixel-Zeile und eine neue Max-Zeile mit Endziffer 5: W4_GLUE_MAX_0455 / W4_GLUE_PIX_0460 (beide Kreuzfahrt aus Pappe, gleicher Inhalt); W4_SAV_MAX_0265 / W4_SAV_PIX_0270; W4_FRIE_PIX_0145 / W4_FRIE_MAX_0150; W4_FRIE_MAX_0075 / W4_FRIE_MAX_0190 (Gittertor); W4_KELL_MAX_0045 / W4_KELL_PIX_0050; W4_KELL_PIX_0075 / W4_KELL_MAX_0080; W4_ARCH_PIX_0025 / W4_ARCH_MAX_0030; W4_FABR_PIX_0045 / W4_FABR_MAX_0050; W4_SIT_PIX_0130 / W4_SIT_MAX_0140. Auch Welt 2, Weizenfeld (0615/0620). Über alle Dateien per Skript prüfen und im Code nachsehen, welche Zeile gespielt wird.
- **Gag doppelt:** Klo-Witz zur Lachkonserve (W4_SIT_PIX_0090 und W4_SIT_MAX_0140). Erklärung von Sendeschluss und Testbild jetzt in Prolog, Welt 2, W4_TEST_PIX_0040/0225 und W4_FRIE_PIX_0020. „Meine Vorfahren“ (W4_TEST_PIX_0240, W4_FRIE_PIX_0145, W3_TEST_PIX_0360, W3_BAS_PIX_0790). „seit ich denken kann“ (W4_RAU_PIX_0200). 47 erneut (W4_KAPI_FLE_0330 „siebenundvierzig Regenschirme“). Montag (W4_KAPI_SIE_0220 ff., in Welt 3 mehrfach). „ehrlich gesagt“ sehr häufig bei Max.
- **Rätsel 4, Logik:** W4_SIT_SMU_0360 „Außer der gefleckten Dame in Reihe drei“ setzt die Hyäne ins Sitcom-Publikum. Das gäbe ihr ein Alibi. Vorschlag: „… die sonst immer in Reihe drei sitzt. Gestern war ihr Platz leer.“ Sonst ist das Rätsel fair (zwei Quellen für Fondue, vier Alibis, Untertitel-Hinweis W4_TAST_MAX_0090).
- Pixels Wunsch für Welt 4 ist nicht verpassbar (W4_STUD_PIX_0450 beim Abschluss), anders als in Welt 2.
- Hinweise nennen teils Bedienung („Klick …“, „Drück …“, „Wechsel zu mir“). Die nachgetragenen Stufen ab 0520 stehen außer der Reihe (im Kopf erklärt).
- Regel „Max kennt keine Retro-Medien“ in Welt 4 eingehalten (W4_TEST_MAX_0030/0050, W4_GLUE_MAX_0210). Grenzfälle: W4_FERN_MAX_0250 „Dafür hat man früher den Daumen benutzt“ und Max’ Filmanspielungen (Poltergeist W4_TEST_MAX_0255, Ghostbusters W4_KELL_MAX_0175, ACME W4_KAPI_MAX_0565, Superman W4_KAPI_MAX_0525, König der Löwen W4_SAV_MAX_0115/0125, Truman Show W4_SIT_MAX_0275, „Video Killed the Radio Star“ W4_EMPF_MAX_0275, The Ring W4_KELL_MAX_0045 und Pixel W4_INV_PIX_0035).
- **Anspielungen und Recht, Welt 4:** Glücksrad, Tatort („Tiertort“), Columbo (Kommissar), Bares für Rares (Trödel-Experte), Wetten, dass..? („Top, die Wette gilt nicht“ W4_STUD_MAX_0645), Dschungelcamp (Kiste, Sternchen, „Prüfung 3“), Thriller (rote Jacke, W4_FRIE_MAX_0105), Stranger Things (Lichterkette mit Buchstaben, tragendes Rätselbild), Akte X („Die Wahrheit ist irgendwo da draußen“ W4_HALL_AGE_0350, wörtlicher Slogan), Star Wars (Lichtröhre, „Die Macht ist nicht mit dir“, Müllpresse mit Auge), Superman, Batman, Wonder Woman als Parodien (Super-Siegfried „seit 1938“, Fledermann, „Wonder-Wilma“, Kapitolis, Käse-Suchscheinwerfer), Spider-Man (W4_KAPI_PIX_0510/0515), Joker-Bottich, Looney Tunes (Amboss), Shopping-TV, Sitcom-Klischees, Naturdoku-Erzähler.
- Kopfzeile Z.3 „rund 880 Zeilen in 20 Abschnitten“ veraltet. Auslöser-Schreibweise „Ansehen: Bettlaken, Bettlaken“.

### Werkzeug `tools/zeilen_einfuegen.py` (Ursache der falschen Sprecher)

Der Sprechername zu einem Kürzel wird als häufigster Name über **alle** Skriptdateien bestimmt, nicht je Welt. Darum wurde SCH in Welt 1 und 3 zu „Schreiber“ (statt Schmied, Schmidt) und GRI in Welt 2 zu „Grimmzahn“ (statt Grieche). Betroffen: `welt-1.md` Z.400/404, `welt-2.md` Z.831, `welt-3.md` Z.342/346/350. Vorschlag: Namenssuche auf die Datei der Zielzeile beschränken. Schwere mittel.

### Aus `docs/skript/zwischenspiele-und-finale.md`

Stärken (bleiben): Opas „Rückverwandlungsschwund“ mit der Steigerung über drei Rückkehren („Rückverwandlungs…“ – „…schwund. Ich weiß.“); Pixels „Hatschi. // Bäckerei.“; Max bietet Haushalt an und Opa friert ein (ZS2_DACH_MAX_0160 bis OPA_0210); „Das Passwort ist ‚Kuchen123‘. Oder?“ (ZS3_DACH_MAX_0160); der Stapel „Prospekte“ mit Auflösung (FI_AUFL_PIX_0310); Zettel „Bin aufgestanden. Z.“ (FI_RUF_NAR_0280); Zeldina als Wohnungssuchende („Wie sieht es denn mit den Nebenkosten aus?“, Oma: „Du bist also die Neue.“ – „Der Dachboden wäre frei.“); Modell 08/15 („Servus, Tür.“); die Abfrage Drachenei – „Ein Ei. Freiland.“; „Du hättest mich auch einfach fragen können“ – „Und was hättest du gesagt?“ – „… Nein. Wahrscheinlich nicht.“ (FI_AUFL_MAX_0372 bis 0376) als ehrlichster Moment des Spiels; Oma („Der Junge ist in Ordnung. Du nicht, Konrad. Aber der Junge.“, „Ich dachte: Den nehme ich.“); „Ich hol sie.“ und Pixels Sturz vom Schrank; „Der Kuchen war keine Lüge.“; Toadis letzter Satz. Der rote Kreis im Kalender wächst sichtbar mit (Kreis, Doppelkreis, Ausrufezeichen).

Funde:

- **Pixels Wünsche sind nicht verpassbar:** Die Einträge für Welt 1 bis 3 fallen in den Zwischenspielen (ZS1_DACH_PIX_0220, ZS2_DACH_PIX_0230, ZS3_DACH_PIX_0210). Der Verdacht aus Welt 2 (Weizenfeld) ist damit erledigt.
- **Zeitlinie stimmt:** „Drei Tage Mittelalter“, „drei Tage und ein Fünfkampf“, „eine Woche im Regen“; auf dem Dachboden vergeht ein Nachmittag. Max’ „eine Woche lang“ in Welt 4 ist damit ungefähr gedeckt (genau wären es rund zwei Wochen). Die Fernbedienung fehlt „seit Wochen“ (FI_AUFL_OPA_0180), passt zu Welt 4.
- **Roboter ohne Bedingung:** FI_RAET_MAX_0090 „Zeldina, Opa, der Roboter und ich.“ hat keine Bedingung FREUND_0815. Ohne den Roboter ist der Satz falsch. Gegen Code und Welt-Tabelle prüfen.
- **„Oben“ statt „unten“:** FI_HINT_PIX_0200 „Oben hat jemand Geburtstag.“ Max und Pixel sind auf dem Dachboden, Oma steht unter der Luke.
- **Anrede der Mutter:** FI_WOHN_MUT_0230 „Alles Gute, Mama.“ (zu Oma), aber FI_WOHN_MUT_0260 „Konrad, das ist deine Einkaufsliste.“ Wenn Oma ihre Mutter ist, wäre Opa „Papa“. Gegen das Konzept prüfen (wessen Eltern sind es?).
- **Unklarer Satz:** FI_AUFL_MAX_0270 „Und Zappmann? Die Lichterkette hat geblinkt, du kennst ihn. Lange Geschichte.“ Das „Lange Geschichte“ am Ende klingt, als beantworte Max seine Frage selbst. Gemeint ist wohl „Lange Geschichte?“.
- **Unklare Rechnung:** FI_DACH_OPA_0060 „Zwanzig Minuten Fernsehzeit sind drei Stunden Werkbank.“ ZS2 sagt: drüben drei Tage, hier zwanzig Minuten. Der Satz dreht das Verhältnis um und ist schwer zu verstehen.
- **Figuren sprechen in Entwurfs-Sprache:** „Seit Welt 3“ (FI_AUFL_PIX_0240), „In Welt 4“ (FI_DACH_PIX_0160, FI_AUFL_MAX_0250). In der Geschichte heißen die Orte Kanal 42 und Kanal 999. „Vier Welten“ als Menge ist dagegen in Ordnung.
- **Offener Faden Milchwerbung:** Pixel verdächtigt Opa als Absender (ZS3_DACH_PIX_0020), im Finale hat Opa die Werbung aber nie gesehen (FI_WOHN_OPA_0050). Wer die Werbung sendet, bleibt offen. Kann als Rätsel stehen bleiben, dann sollte Pixels Verdacht nicht so eindeutig auf Opa zeigen.
- **Doppelt belegte Auslöser:** ZS1_DACH_MAX_0315 / PIX_0320, ZS2_DACH_MAX_0315 / PIX_0320, ZS3_DACH_MAX_0315 / PIX_0320 (Werkbank-Ablage, zweites Mal), ZS3_DACH_MAX_0335 / PIX_0340 (Kiste, zweites Mal).
- **Wiederholung:** „Lange Geschichte“ viermal (ZS1_DACH_MAX_0072, ZS3_DACH_MAX_0050, FI_AUFL_MAX_0270, FI_AUFL_MAX_0500); „Ich komme wieder“ dreimal bei Modell 08/15 (Welt 3, FI_RUF_HAU_0190, FI_WOHN_HAU_0390); „Das ist kein X, das ist Y“ (ZS1_DACH_PIX_0530 Glaube, ZS1_DACH_PIX_0454 Tradition, ZS3_DACH_PIX_0020 Botschaft, FI_RIEG_MAX_0090 Feature, FI_HINT_PIX_0040).
- **Kleinigkeiten:** „Seite 3“ (FI_WOHN_MAX_0160) und „Seite drei“ (0165) nebeneinander. IDs außer der Reihe (ZS1 0420/0425 nach 0462; FI_RUF 0380/0390 nach 0330; FI_WOHN 0420/0430 nach 0190). ZS1_DACH_MAX_0120 „ich hatte es drei Tage im Arm“, das Ei bekommt Max aber erst am Ende von Welt 1.
- **Wörtliches Zitat:** FI_RIEG_MAX_0155 „Es ist gefährlich, allein zu gehen.“ (The Legend of Zelda), passt zu Zeldina, ohne Vorwissen leer.

### Aus `docs/raetsel/*` und `docs/welten/*`

Gelesen: alle sechs Rätsel-Dateien, `abhaengigkeiten.md`, `welten/README.md` und alle sechs Welt-Tabellen.

Stärken (bleiben): Jede Welt hat eine eigene Mechanik, die aus dem Thema kommt (Figurenwechsel, Zeitfähre, Eigenschaften tauschen, Tasten und Genre-Logik). Sackgassen sind durchgehend bedacht: Wunderdinge haben Zweitwege, die Sphinx braucht nur das Wort, Fehltausche setzen sich zurück, Pixel hält Max ohne Archivband am Aufzug zurück, das Finale hat einen eigenen Abschnitt „Lösbarkeit“. Logikrätsel sind nachgerechnet (Flaschen: nur Flasche 3; Diskus: nur Tiro; Kammer 3: genau eine Lösung). Minispiele haben eine Nachsichtsregel. Farbcode-Rätsel hat Symbole für Farbenblinde.

Funde:

- **Zwei-Ebenen-Mechanik in Welt 3 wird kaum gebraucht:** Die Tabelle nennt vier Eingriffe von Pixel (Strom aus = Nacht, Wasser = Regen, Fenster = Schnee, Kabel = Ente). Ein Rätsel verlangt nur das Kabel (7); das Fenster ist der Zweitweg in 11. Nacht und Regen haben kein Rätsel. Der Satz „Viele Rätsel verlangen mehrere Sprünge“ (`raetsel/welt-3.md`) verspricht mehr. Im Skript und Code prüfen, ob Nacht und Regen wenigstens Reaktionen haben.
- **Freund 08/15 ist dauerhaft verpassbar:** Nur wer das Olivenöl in Zwischenspiel 2 einpackt und den Roboter vor der Übergabe der Seite ölt, bekommt ihn im Finale. Das ist gewollt und im Finale angesprochen (FI_RUF_PIX_0230). Fair ist es, wenn Pixel vor der Übergabe einmal warnt; im Skript Welt 3 gegenprüfen.
- **Welt 4, Rätsel 4:** Die Rätsel-Datei sagt selbst, die Hyäne „lacht bei keinem Witz der Folge“. Zusammen mit W4_SIT_SMU_0360 („gefleckte Dame in Reihe drei“) saß sie also im Publikum. Dann wäre ihr Alibi (sie war bei der Sitcom) wahr und nur das Gericht falsch erinnert. Am Skript gegenprüfen.
- **Veraltete Größenangaben:** `raetsel/welt-2.md` nennt die Agora „640×180“, die Welt-Tabelle 1280×360. `welten/README.md` nennt im Beispiel „320x180 oder 640x180“ und Nahansichten mit 320×180. Kommentare in den Tabellen nennen alte Pixelmaße (Prolog: Pixel „schlafend 10 hoch, 24 lang“; Welt 1: „Pixel als Ziege 20 px“; Welt 2: Opa „Figur 60 px im Prolog“, Beamter „stehend 58“, Sobek „16 px hoch, 70 px lang“; Welt 3: „Max als Ente 30, Max in der Kapsel 70 breit“; Welt 4: Zombie „im Grab 30“). Die Zahlen in den Feldern sind umgerechnet, die Kommentare nicht.
- **„in die Maschine“ zu früh:** `ohne_verwendung` bei Drachenei (welt-1), Goldenem Sack (welt-2) und Energiezelle (welt-3): „Opa legt es im Zwischenspiel in die Maschine“. Im Zwischenspiel kommt es auf die Werkbank, in die Maschine erst im Finale.
- **Schalter-Namen uneinheitlich:** Welt 1, 2 und 4 nutzen das Präfix (`W1_R01_A_GELOEST`). Welt 3 hat viele ohne Präfix (`STEMPEL_MENSCH`, `REGEL_2`, `KAMMER_1_GELOEST`, `MUTTI_AUS` …). Weltübergreifend sind nur FREUND_0815 und KEKSE_DABEI.
- **KEKSE_DABEI doppelt vergeben:** `welt-3.yaml` setzt den Schalter schon bei R3b (Morphäus gibt die Kekse), `finale.yaml` bei F2. Laut Skript gilt er nur, wenn die Tüte im Finale im Inventar ist. Im Code prüfen, ob der Schalter beim Ablegen in die Fundkiste wieder fällt.
- **Sprecherkürzel sind nicht spielweit eindeutig:** SCH (Schmied, Schreiber, Schmidt), GRI (Grimmzahn, Grieche), MUT (M.U.T.T.I., Mutter), MUS (Straßenmusiker Welt 2 und 3). Das ist die Wurzel des Sprecher-Fehlers im Werkzeug `zeilen_einfuegen.py`. Für Stimmen und Besetzung in `04-audio.md` gegenprüfen.
- **Nahansichten:** 14 gezählt (Prolog 2, Welt 1 vier, Welt 2 drei, Welt 3 vier, Welt 4 eine). Stimmt mit `entscheidungen.md`.
- **Rätsel 12 in Welt 3:** Herr Vier hat die Zugangskarte „in einer Lieferung fürs Labor gefunden“. Der Zufall ist bequem; ein halber Satz mehr (er beliefert die Kantine) würde reichen.
- **Rätsel 9 in Welt 1 (Steckbrief als Exposé):** der Sprung vom Steckbrief zum Wohnungsangebot ist die steilste Idee der Welt. Ob das Skript sie genug anbahnt, steht bei Bereich J.

### Aus `docs/grafik/00-stil-und-werkzeuge.md`, `01-max-und-pixel.md`, `02-prolog-und-finale.md`, `grafik/welt-1.md`, `grafik/welt-2.md`

**Stärken:** Klare Stilregeln (640×360, Perspektive „Mittelweg“, Licht von oben links, Palette je Welt, Endesga 32 für Figuren). Prompt-Bausteine mit Größenregeln. Der Steckbrief von Max und Pixel wird wörtlich wiederverwendet. Parodie-Sicherungen stehen in den Prompts selbst („No …“ am Ende, Kuh „(not purple)“, Pixel „not orange, no lasagne“). Hinweise fürs Rätsel stehen ausdrücklich im Prompt, Lösungsverräter sind neutral gehalten (identische Fläschchen). KI-Protokoll und Farbenblind-Symbole sind mitgedacht.

**Funde:**

- **Baustein FIGUR-KLEIN passt nicht zu seinen Figuren (mittel).** `00-stil-und-werkzeuge.md`: FIGUR-KLEIN gilt für 29 bis 75 Pixel auf einer Leinwand von 96×96. Zugewiesen ist er aber auch Toadi (101), dem Zauberbesen (101), der Schmiede-Ziege (93), dem Schwan (81) und den Flamingos in Welt 4 (81). Figuren über etwa 90 Pixel passen nicht auf die Leinwand. Vorschlag: Grenze im Baustein auf die echte Spanne anheben oder diese Figuren auf FIGUR mit ausdrücklicher Höhe umstellen.
- **Veraltete Zahl im Deko-Prompt (mittel, echter Prompt-Fehler).** `02-prolog-und-finale.md` Z. 195: „scene props at the same scale as a 84-pixel tall character“. Die Figuren sind 189 Pixel hoch. Dazu Z. 165: „Oma steht vorerst mit 84 Pixeln an der Untergrenze … will Sebastian sie kleiner (etwa 120 Pixel)“. Oma ist laut Tabelle 189, und 120 ist nicht kleiner als 84.
- **Pixel schlafend in drei Größen (klein).** `00`: „about 25 pixels high and 48 long“. `02`: „34 Pixel hoch, 36 lang“. `prolog.yaml` Kommentar: „10 hoch, 24 lang“. Dazu „Pixel auf dem Schrank … 34 hoch, 39 lang“, obwohl der laufende Pixel 88 lang ist.
- **Pixel als Ziege in drei Größen (klein).** `grafik/welt-1.md`: Tabelle „69 Pixel“, Motiv „About 51 pixels tall in costume“, `welt-1.yaml` Kommentar „20 px“.
- **Maschine im Finale (klein).** `02`: Motiv „about 297 pixels tall“, Bild-zu-Bild-Prompt „about half the image height“ (das wären 180).
- **Bildschirm-Einblendungen, Spalte „Anlass“ (klein).** `02`: Kanal 3 „Rückkehr 1 bis 3 und Finale“, Kanal 7 „Rückkehr 2 bis 3“. Laut Skript zeigt der Zapp-O-Mat Kanal 3 nur im Zwischenspiel 1, Kanal 7 nur im Zwischenspiel 2, Kanal 42 im Zwischenspiel 3, Kanal 999 im Finale.
- **Wohnzimmer Abend (klein).** `02`: Der Tabellen-Prompt hat keine Lichterkette, der Bild-zu-Bild-Prompt ergänzt „a string of small warm fairy lights“. Der Prompt für Rückkehr 3 erwähnt „the poster“, das Poster ist aber ein Deko-Sprite und steht nicht im Hintergrund-Prompt.
- **Baustein HINTERGRUND noch auf Retro Diffusion geschrieben (klein).** `00`: `rd_plus__environment`, „damit Retro Diffusion … trifft“. Der Standardweg ist inzwischen Gemini plus `tools/pixelieren.py`.
- **Beamter 1 (klein).** `grafik/welt-2.md`: „about 147 pixels tall seated (87 standing)“. Stehend kleiner als sitzend, also alte Zahl. `welt-2.yaml` Kommentar „stehend 58“.
- **Formatierung (Direktkorrektur möglich).** `02`, Zeile Hauptmenü: `rd\_pro\_\_ui\_panel` ohne Code-Schreibweise, alle anderen Werkzeugnamen stehen in Backticks.
- Die Parodie-Regel hält in Welt 1 und 2: keine Film- oder Spielnamen in den englischen Prompts, Namen stehen nur in den deutschen Spalten „Anspielung“.
- **Anspielungen aus den Tabellen „Nur zum Ansehen“ (für Abschnitt D).** Welt 1: Bremer Stadtmusikanten (Statue), Ritter der Kokosnuss (Kokosnusshälften), Herr der Ringe (Ring-Laden), The Witcher (Laute mit Münzbecher), Sprechender Hut (Socke), Aschenputtel (Kürbisturm, Glasschuh), Schneewittchen (Spiegel), Zelda (Okarina), Artus (Schwert im Stein), Zauberlehrling (Besen). Welt 2: Walk Like an Egyptian (Fries mit Ghettoblaster), Gladiator (Weizenfeld), Die Mumie (Katzenmumie), Assassin's Creed (Heuhaufen, Adler-Säule), Leben des Brian (Latein-Kritzelei), Indiana Jones (Steinkugel), Orpheus, Pisa (schiefer Turm), Venus von Milo.

### Aus `docs/grafik/welt-3.md`, `docs/grafik/welt-4.md` und `docs/grafik/fertige-prompts/*`

**Stärken:** Drei klar getrennte Looks in Welt 3 (Unterstadt, Simulation, Labor). In Welt 4 trägt der Farb-Baustein den Sender. Parodie-Sicherungen sind konsequent („No leather coat, no small dark sunglasses, not bald“, „No diamond shield, no S shape, no red and blue“, „not a likeness of any real actor“). Schmidt und Klon unterscheiden sich nur an Tasse und schiefem Hausschuh, das ist als Rätselhinweis sauber gezeichnet. Großrechner bewusst ohne rotes Auge.

**Funde in den Quelldateien:**

- **Grenze zwischen FIGUR und FIGUR-KLEIN ist uneinheitlich (klein).** 101 Pixel: Toadi und Zauberbesen (Welt 1) laufen als FIGUR-KLEIN, Max als Ente, Gepard und Geier als FIGUR. 81 Pixel (Opa-Hologramm, Flamingo, Geist) liegt über der Baustein-Grenze von 75.
- **Welt 4, Figurentabelle (klein, Form).** In Welt 3 steht die Größe in der Spalte „Baustein“ („FIGUR, 201 Pixel“), in Welt 4 fehlt sie dort bei etwa der Hälfte der Zeilen (Gerd Glück, Sitcom-Familie, Kommissar, Erzähler, Zombie, FBI-Agent, Fledermann, Wonder-Wilma, Dr. Werbepause, Empfangsdame, Zappmann, Junger Zappmann, Käsemann).
- **Formatierung (Direktkorrektur möglich).** `grafik/welt-4.md` Z. 197 und Z. 199: `rd\_pro\_\_ui\_panel` ohne Code-Schreibweise, zwei Zeilen darüber steht derselbe Name in Backticks.
- **Programmzeitschrift (klein).** `grafik/welt-4.md` Z. 199: Werkzeug `rd_pro__ui_panel`, das Motiv ist aber eine Nahansicht 640×360. Die Nahansichten von Welt 3 laufen über HINTERGRUND.
- **Kommissar mit Zigarre (klein, Abschnitt M).** `grafik/welt-4.md`: „a short cigar in his mouth“. Für die Altersfreigabe ist sichtbarer Tabak ein Prüfpunkt. Vorschlag: kalte Zigarre nur in der Brusttasche oder ein Lutscher.
- **Gabel-Kommentar (Abschnitt D).** `grafik/welt-3.md`, „Nur zum Ansehen“: Max: „Es gibt keinen Löffel. Nur Omas Gabel …“. Max zitiert hier wörtlich einen Film von 1999. Laut Konzept kennt er alte Medien nicht. Im Skript prüfen.
- **Anspielungen aus „Nur zum Ansehen“ (für Abschnitt D).** Welt 3: Matrix (Katze, Gabel), Blade Runner (Origami-Einhorn, Nudelbude, Deckert), Vangelis, Per Anhalter durch die Galaxis (Handtuch), 2001 (singender Großrechner), Portal (Pappkuchen, Pinnwand, Begleitwürfel), Escher (Treppe), Star Wars (Kessel-Lauf, Gedankentrick, Hologramm-Hilferuf). Welt 4: Video Killed the Radio Star, Mixtapes, Africa von Toto, Bat-Signal, Thriller, Poltergeist, Spinnen-Held, Tagesschau-Gong, Trödel-Shows, Dschungel-Shows, Buntstift-Wette, Lichtschwert, Müllpresse mit Auge, Lichterkette mit Buchstaben, Akte X, Columbo.

**Funde in den fertigen Prompts (erzeugt von `tools/prompts_zusammensetzen.py`, alle am Material geprüft):**

- **Acht Prompts enden mit dem Wort „Baustein.“ statt einer Farbangabe (mittel).** Betroffen: Welt 2 Flusskarte, Welt 3 Code-Sicht und Opas Sofa, Welt 4 Rauschen, Zappmanns erste Kindersendung, Bild-in-Bild, Max auf der Couch, Opa vor flackernden Lampen. Ursache: `tabelle()` überspringt nur Kopfzeilen, die mit „| Szene“ beginnen. Die Kopfzeile der Farb-Tabelle („| Sender | Baustein |“) landet als erster Eintrag im Wörterbuch, und `farbe_fuer()` nimmt bei unbekanntem Schlüssel den ersten Eintrag.
- **Zwei „Prompts“ für Dinge, die laut Tabelle gar keine Grafik sind (mittel).** Welt 4 „Bild-in-Bild“ („Keine eigene Grafik …“) und „Opa vor flackernden Lampen“ („Wiederverwendung …“). Der Prompt besteht aus dem englischen Baustein und einem deutschen Arbeitssatz. Ebenso Welt 3 „Opas Sofa“ (beginnt mit „Wiederverwendung des Prolog-Wohnzimmers …“).
- **Deutsche Arbeitsnotizen stehen mitten in englischen Prompts (mittel).** Welt 3: „1280×360, zwei Hälften. Linke Hälfte: … Rechte Hälfte: …“ (Unterstadt, Widerstandsbasis, Stadtstraße; Welt 4 Savanne), „(Platz für Piepsi als eigenes Sprite)“. Welt 4: „(Pixels Sicht für Rätsel 1; die Balken selbst setzt man von Hand, siehe Minispiele)“, „(Buchstaben von Hand)“, „(Aufschrift „DR. W.“ und „Szene 1, Take 400“ von Hand)“, „(Messingschild von Hand)“, „(Flamingos, Löwe und übrige Tiere als eigene Sprites)“, und im Comic-Farb-Baustein „(Ausnahme: hier haben auch Hintergründe Konturen)“. Ein Bildgenerator liest „DR. W.“ und „Take 400“ als Wunsch nach Schrift. Welt 1 und 2 machen es richtig („wide 1280x360 scene built from two 640x360 halves that join seamlessly“).
- **Farb-Baustein passt nicht zu Innenräumen (klein).** Widerstandsbasis, Kühlung und Laboreingang bekommen „wet reflective streets, neon reflections in puddles, rising steam“. Küche der Orakel-Oma und Büroturm bekommen „flat perfect blue sky“. Spukhaus-Keller und -Halle bekommen „knee-high fog, colored disco spotlights, full moon“. Thronsaal und Palastküche (Welt 2) bekommen „turquoise river water, harsh midday sun“. Das Goblin-Bergwerk bekommt die fröhliche Märchenpalette („lush greens … sky blue“), weil „Bergwerk“ nicht in der Liste der düsteren Räume steht.
- **Baustein KONZEPT ist ein Innenraum-Baustein (klein).** „front view of the room … back wall parallel to the picture plane … doors and tall cupboards reach only about 50 percent“ steht auch vor Savanne, Sphinx, Hafen, Straßen. Dazu: KONZEPT verbietet „faces … on objects“, das Motiv der Fondue-Fabrik verlangt ein Warnschild „cheese with a face“.
- **Pixelangaben in Konzept-Prompts (klein).** „640x360“ und „about 297 pixels tall“ sagen ChatGPT und Gemini nichts. KONZEPT rechnet richtig in Prozent der Bildhöhe (Erwachsener 52 Prozent). Die Maschine im Finale wäre mit 297 Pixeln 82 Prozent der Bildhöhe.

### Aus `docs/04-audio.md`

**Stärken:** Ein Leitmotiv, das jede Welt in ihrem Stil anspielt. Klang-IDs sind im Code schon verdrahtet, Dateien müssen nur in die Ordner. Brabbel-Laute als Platzhalter. Die drei gesungenen Rätsel-Lieder haben immer Untertitel. Klare Regeln zu Rechten (keine geklonten Stimmen, keine Künstlernamen). Stimmen-Prompts treffen die Figuren (Deckert „sounds like rain on a window“, Brian „every sentence sounds like the end of a very long day“).

**Funde:**

- **Das Finale hat keine eigene Musik (mittel).** Alle vier Räume in `welten/finale.yaml` spielen `gegenwart`. Das Stück ist beschrieben als „Cozy lo-fi living room music … lazy Sunday afternoon, slightly sleepy“. Im Finale läuft eine Maschine heiß, Oma steht vor der Luke, es ist Nacht. Die schläfrige Musik arbeitet gegen die Szene. Vorschlag: zwei neue Stücke. `finale_maschine` (dasselbe Thema, schneller, tickend, mit Druckkessel-Pfeifen) und `finale_geburtstag` (warme Fassung des Titelthemas für das Wohnzimmer). Auch der Supermarkt bei Nacht verdient eher Stille mit Kühlregal-Brummen.
- **Das Leitmotiv ist mit ElevenLabs Music so nicht umsetzbar (mittel).** Der Zusatz „quotes the short cheerful five-note whistled motif of the main theme once“ beschreibt eine Melodie, die das Modell nicht kennt. Jedes Stück erfindet dann fünf andere Töne. Vorschlag: die fünf Töne einmal festlegen (Noten in `04-audio.md`), als Pfeif-Aufnahme oder MIDI speichern und in Audacity über jedes Welt-Stück legen. Oder alle Welt-Stücke über ACE-Step mit Referenz-Audio erzeugen.
- **Stimme der Hyäne widerspricht dem Rätsel (klein).** Prompt: „A sly giggling female voice, breaks into cackles mid-sentence“. Im Skript ist ihr Witz, dass sie todernst bleibt („Ich lache nie.“, W4_VERH_HYA_0310; „Ich sitze hier und bin ernst.“, 0330) und erst bei „Fondue“ platzt (0350). Eine kichernde Stimme verrät die Lösung. Vorschlag: „A female voice held unnaturally flat and serious, lips pressed, tiny suppressed squeaks between words; bursts into wild cackling only in the marked lines“.
- **Pixels Stimme hat keine warme Seite (klein).** Prompt: „very arrogant and theatrical … as if bored by everyone“. Pixels Bogen braucht die leisen Stellen („Ich mag Max. Ein bisschen.“). Vorschlag: ergänzen um „with a rarely shown, dry warmth underneath“.
- **Musik-Baustein „immer anhängen“ passt nicht zu drei Stücken (klein).** Der Baustein endet auf „seamless loop … 90 seconds“. `zappomat` (4 Sekunden, „not a loop“), `werbeblock` (5 Sekunden) und `abspann` (endet auf einer Kadenz) widersprechen dem. Ausnahme in den Regeln nennen.
- **Rhythmus-Minispiel braucht ein festes Tempo (klein).** `w4_mitternacht`: „118 BPM, steady beat for a rhythm game“. Erzeugte Musik hält das Tempo nicht taktgenau. Vorschlag: Tempo nach dem Erzeugen messen und die Taktmarken von Hand setzen, oder den Takt als eigene Schlagzeugspur darüberlegen.
- **Kosten widersprechen sich (klein).** Tabelle Werkzeuge: „etwa 3 Monate Pro (rund 300 $)“. Abschnitt Umfang: „etwa vier Monate ElevenLabs Pro (rund 400 $)“. `03-produktion.md` nennt 300 $.
- **Zeilenzahl veraltet (klein).** „Das Skript hat etwa 5.000 Zeilen“. Gezählt sind es 5.414 Zeilen in `docs/skript/` (Prolog 349, Welt 1 1.178, Welt 2 1.182, Welt 3 1.059, Welt 4 1.103, Zwischenspiele und Finale 543). `03-produktion.md` nennt 5.284.
- **Geräusche ohne Einsatzliste (klein).** Nur 14 Geräusche haben eine ID. Die Welt-Geräusche (etwa 45 Prompts) haben weder ID noch Einsatzort. Drei Spielsystem-Geräusche fehlen in der ID-Liste (Zeitfähre, Code-Sicht, Portalgerät). Es gibt keine Raum-Atmosphäre außer Taverne, Regen, Stadion und Rauschen.
- **Rechtslage Suno und Udio (klein).** „Dort laufen noch Klagen“ und „Udio erlaubt keine Downloads mehr“ sind Momentaufnahmen. Vor der Steam-Seite neu prüfen, mit Datum.
- Die Mehrfachbelegung der Kürzel (MUT, SCH, GRI, MUS) ist hier ausdrücklich beschrieben („dann entscheidet der Name“). Das Werkzeug `zeilen_einfuegen.py` hält sich nicht daran.

### Aus `docs/03-produktion.md`, `docs/offene-punkte.md`, `docs/test/beobachtungsbogen.md`

**Stärken:** Kosten, Markt und Rechtliches sind nüchtern gerechnet. Die Testziele sind messbar („jeder Witz mindestens einmal gelacht“). Der Beobachtungsbogen fragt nach Lachen, nicht nur nach Zeiten. Telemetrie nur mit Zustimmung. Toadi und Zeldina sind aus dem Marketing ausgeschlossen.

**Funde:**

- **Der Meilensteinplan passt nicht mehr zum Stand (mittel).** Die Tabelle plant 4 Wochen Grundgerüst, 8 Wochen Vertical Slice, Welten 2 bis 4 je 5 bis 7 Monate, Übersetzung in Stufe 5. Laut den Stand-Absätzen darunter sind seit dem 10. November alle Welten als Graubox spielbar, die englische Fassung ist fertig, Menüs, Errungenschaften und Controller sind gebaut. Offen sind Grafik, Audio, Tests mit Fremden und Feinschliff. Der Plan sollte neu geschrieben werden: nach Grafik und Audio je Welt, nicht nach Bau je Welt. „Beispiel bei Projektstart im Januar 2027“ ist überholt.
- **KI-Offenlegung stimmt nicht mit dem Arbeitsweg überein (mittel, Abschnitt M).** Formular und Store-Text sagen: Konzeptbilder „als Vorlage, nie im Spiel“, Hintergründe „mit Retro Diffusion erzeugt“. Der festgelegte Standardweg (`grafik/00-stil-und-werkzeuge.md` Z. 37) ist: Gemini-Konzeptbild, dann `tools/pixelieren.py`. Das Gemini-Bild ist dann das Spielbild, nur verkleinert. Auch die Tabellen „Absprachen“ (Grafik) und „System 2“ (Hintergründe) nennen noch Retro Diffusion. Offener Punkt S9 deckt den Store-Text ab, aber nicht die Tabellen.
- **„Von Hand gezeichnet“ ist zu stark (klein, Abschnitt M).** Store-Text: „Max, Pixel und Opa sind Pixel für Pixel von Hand gezeichnet“. Die Absprache lautet: KI-Entwurf, von Hand nachgezogen. Ehrlicher: „von Hand nachgezeichnet“.
- **Zahlen:** „59 Räume“ (Umfang der Grafik), die Welt-Tabellen haben 58, der Bildschirmtest „55 Räume“. Vertical Slice „8 Räume“, im Stand-Absatz „neun Räume“. Grafikstunden „für 480×270 … geschätzt“, die Auflösung ist jetzt 640×360. Die 53 Rätsel stimmen (3 + 13 + 11 + 13 + 13).
- **Rechnung ohne Umsatzsteuer (klein).** „70.000 $ brutto, nach dem Steam-Anteil von 30 Prozent rund 49.000 $“. Vorher gehen Umsatzsteuer und Rückgaben ab; realistisch bleiben eher 38.000 bis 42.000 $.
- **„Was noch fehlt“ ist veraltet (klein).** Dialog-Skript („Claude schreibt, du kürzt“), Hinweis-System und Speichern stehen als offen da, sind aber gebaut.
- **`offene-punkte.md` hält seine eigene Regel nicht (klein).** Kopf: „Hier steht nur, was noch offen ist.“ Die Automatisierungs-Tabelle führt A1, A2, A3, A4, A7 und A11 mit Stufe statt Stand („Offen ist ihr Bau“), obwohl A1, A3, A4 und A7 laut `03-produktion.md` laufen. A13, A14 und A16 stehen als „erledigt“ in der Liste. P10 und P11 („beim Projektstart“) sind zeitlich überholt. P7 spricht von Retro Diffusion „vor dem ersten Auftrag“.
- **Formatierung (Direktkorrektur möglich).** `03-produktion.md` Z. 58 und Z. 62: `rd\_advanced\_animation\_\_custom\_action` und `rd\_pro\_\_ui\_panel` ohne Code-Schreibweise, in der Tabelle „System 2“ darüber stehen dieselben Namen in Backticks.
- **Altersfreigabe:** Ziel USK 6 und PEGI 7. Prüfpunkte aus dem Material: Taverne („crowded and drunk“), Zigarre des Kommissars, Zombies, „Führer mit Laken“ (W4_FABR_FLE_0330). Nichts davon ist hart, aber die Zigarre ist der einzige sichtbare Tabak im Spiel und leicht zu ersetzen.

### Aus `docs/uebersetzung/ui.csv` (alle 927 Einträge gelesen) und `en.csv` (nur Stichprobe)

- **Groß- und Kleinschreibung der Hotspot-Namen uneinheitlich (klein).** Fast alle beginnen groß („Kaputtes Radio“, „Tropfendes Rohr“, „Weinender Mann“). Klein beginnen: „klingelnde Telefonzelle“, „goldenes Sofa“, „frische Bananenschale im Comic-Kanal“, „normaler Käse in der Fabrik“, „verkettete Tür“. Die Namen kommen aus den Welt-Tabellen und stehen auch in den Graubox-Bildern. Deshalb nur als Vorschlag, nicht direkt korrigiert.
- **Entwickler-Texte im Spiel (klein).** „Ende der Graubox. Welt 2 folgt.“ (UI_WELT_1_ENDE, ebenso Welt 2 und 3), „Ende des Prologs. Weiter geht es in Welt 1.“ Vor dem ersten Test mit Fremden prüfen, ob sie noch erscheinen.
- **Hinweis zur Tasche nennt nur die Maus (klein).** UI_TASCHE_HILFE: „Klick packt ein oder aus. Rechtsklick: Pixel fragen.“ Mit Controller stimmt der Satz nicht.
- **Errungenschaft „Freund 08/15“ ist dauerhaft verpassbar (klein).** Wer das Olivenöl nicht einpackt, kann sie in diesem Durchgang nicht mehr holen. Für Sammler ein Ärgernis; der Text der Errungenschaft könnte einen Wink geben.
- **Englische Fassung, Recht (Abschnitt M).** Einige englische Namen liegen näher am Original als die deutschen: „Hogwartle“ (Hoggelwarz), „Polyjuicy Lemonade“ (Vielsaft-Limo), „Wheel of Fortune Shopping“ und „Wheel of fortune studio“ (im Englischen der eingetragene Titel der Sendung), „Paw and Order“, „Morphaeus“.
- **Englische Fassung, Kleinigkeiten:** „Sneezeroses“ (Hotspot) gegen „sneeze roses“ (Ziel); „Wettkandidat“ als „Rival contestant“ (gemeint ist ein Kandidat mit einer Wette).
- Die englische Skriptfassung (`en.csv`, 5.607 Zeilen) ist eine abgeleitete Übersetzung. Sie wurde nicht Zeile für Zeile geprüft.
