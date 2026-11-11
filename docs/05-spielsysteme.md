# Spielsysteme: Dialoge, Schrift, UI, Hinweise, Speichern

Nov 6, 2026 · @Sebastian

Diese Datei arbeitet die fünf offenen Bausteine aus `03-produktion.md` aus, so weit, dass Claude das Grundgerüst und den Vertical Slice (Produktion, Meilensteine Stufe 1 und 2) danach direkt in Godot bauen kann. Das komplette Prolog-Skript steht als Muster in `skript/prolog.md`.

## Dialog-Skript

Jede Zeile des Spiels steht genau einmal in einer Skript-Tabelle pro Welt und hat eine feste ID. Godot liest daraus die Übersetzungsdatei, und dieselbe ID benennt später die Audiodatei. So kosten Übersetzung und Vertonung später kaum Umbauarbeit.

**Zeilen-ID:** `Abschnitt_Szene_Sprecher_Nummer`, zum Beispiel `P0_DACH_MAX_0012` oder `W1_TAV_PIX_0040`. Neue Zeilen bekommen Nummern in Zehnerschritten, damit später Zeilen dazwischen passen. Eine eingeschobene Zeile nimmt die nächste freie Nummer zwischen ihren Nachbarn (zum Beispiel 0521 und 0522 nach 0520), aber nicht die Nummer plus 5, die für Zweitzeilen reserviert ist. Bestehende Zeilen werden nie umnummeriert, weil Gesprächsoptionen im Spielcode über ihre Nummer angesprochen werden. `tools/pruefen.py` prüft nur, dass die Nummern im Block aufsteigen. Eine ID wird nie neu vergeben, auch wenn ihre Zeile gestrichen wird.

| Teil | Werte |
| --- | --- |
| Abschnitt | P0 Prolog, W1 bis W4, ZS1 bis ZS3 Zwischenspiele, FI Finale, UI Menüs, SYS Systemtexte |
| Szene | Drei bis vier Buchstaben pro Raum, etwa DACH, TAV, WALD, TURM |
| Sprecher | MAX, PIX, OPA, OMA; NAR für Regie- und Animationszeilen ohne Sprecher (nicht vertont); Nebenfiguren mit drei Buchstaben wie GOL, ZEL, WAL, bei Gruppen auch mit Ziffer (GO1, GO2). Die Kürzel gelten je Abschnitt und stehen in den Welt-Tabellen (`welten/*.yaml`); dasselbe Kürzel kann in einem anderen Abschnitt eine andere Figur meinen (MUT ist in Welt 3 M.U.T.T.I., im Finale die Mutter) |

**Schlüssel für Namen in der Oberfläche:** Was die Maus beim Überfahren zeigt und das Notizbuch als Ziel nennt, steht nicht im Skript, sondern in `uebersetzung/ui.csv` (Spalten keys, de, en):

| Schlüssel | Wofür | Beispiel |
| --- | --- | --- |
| `UI_OBJ_<objekt_id>` | Hotspot, Prop, Ausgang mit eigenem Namen, Figur, Gegenstand; ID wie in der Welt-Tabelle bzw. aus dem Auslöser („Ansehen: Fondue-Topf“ → `fondue_topf`) | `UI_OBJ_FONDUE_TOPF` |
| `UI_RAUM_<raum_id>` | Raumname, auch für Ausgänge ohne eigenen Namen | `UI_RAUM_TAVERNE` |
| `UI_ZIEL_<Abschnitt>_<Rätsel-ID>` | Ziel im Notizbuch, je Rätselschritt; mit Abschnitt, weil die Rätsel-IDs in jeder Welt neu bei R1 beginnen | `UI_ZIEL_P0_P1`, `UI_ZIEL_W1_R4A` |

Objekt- und Raum-IDs sind über das ganze Spiel ein Name: Dieselbe ID in zwei Räumen (etwa `fenster`) zeigt denselben Namen. Braucht ein Objekt einen anderen Namen, bekommt es eine eigene ID. Zustände mit eigenem Namen hängen den Zustand an (`UI_OBJ_ANTENNE`, `UI_OBJ_EIMER_MIT_WASSER`). `tools/godot_raeume.py` meldet fehlende Schlüssel mit Vorschlag.

**Spalten der Skript-Tabelle:**

| Spalte | Inhalt | Beispiel |
| --- | --- | --- |
| ID | Zeilen-ID | P0\_DACH\_MAX\_0010 |
| Art | Zeilenart, siehe unten | Ansehen |
| Auslöser | Was die Zeile auslöst | Ansehen: Kalender |
| Bedingung | Spielzustand, ohne den die Zeile nicht kommt | nach P1 |
| Sprecher | Wer spricht | MAX |
| Text DE | Die Zeile | Ein Kalender. Ein Tag ist dick rot eingekreist. Entweder Geburtstag oder Zahnarzt. |
| Text EN | Später, von Claude übersetzt | leer |
| Regie | Ausdruck oder Animation | genervt |
| Status | Entwurf, gekürzt, final | Entwurf |

Kurzform in den Skript-Tabellen: Die Tabellen im Dokument zeigen nur ID, Sprecher, Text und Regie (bei Szenen) oder Auslöser (sonst); eine Bedingung steht im Auslöser nach Semikolon, etwa „Kalender; nach P1“. Art und Status ergeben sich aus Abschnitt und ID, Text EN füllt Claude später in der CSV. Die volle Tabelle mit allen zehn Spalten entsteht erst beim Export.

Godot bekommt daraus eine CSV-Übersetzungsdatei mit den Spalten ID, de und en. Ein kleines Export-Skript, das Claude schreibt, wandelt die Tabelle nach jeder Änderung um. Im GDScript steht dann nur die ID, etwa `await C.Max.say("P0_DACH_MAX_0010")`, und Godot setzt je nach Sprache den Text ein. Texte in Menüs und Knöpfen holt Godot mit tr("UI\_MENU\_CONTINUE") aus derselben CSV, also keine festen Strings in Szenen. Umgesetzt in `tools/skript_export.py`: Es schreibt `game/lokalisierung/texte.csv` (keys, de, en), den englischen Text holt es aus `uebersetzung/en.csv`, Menütexte aus `uebersetzung/ui.csv`. Kaskaden mit „//“ werden in Blasen geteilt: Die erste Blase behält die Zeilen-ID, jede weitere bekommt `_2`, `_3` angehängt (`P0_DACH_PIX_0020_2`); dieselben Schlüssel benennen die Audiodateien.

Eigennamen-Glossar: Sprechende Namen werden nicht wörtlich übersetzt, sondern bekommen eine englische Entsprechung mit demselben Witz. Die Liste wächst mit jeder Welt; Claude hält sie beim Übersetzen ein.

| Deutsch | Englisch | Hinweis |
| --- | --- | --- |
| Type 405 | Type 405 | bleibt, Fehlercode-Witz funktioniert in beiden Sprachen |
| Herr Vier | Mr Four | Zahl bleibt, Anrede wechselt (britisch ohne Punkt, wie im ganzen Text) |
| Tiertort (Savanne) | Paw and Order (Savannah) | Serienparodie, andere Vorlage mit gleichem Effekt |
| Schwurbelstein | Waffleton | Klang eines Ortsnamens plus Geschwafel |
| Unterbrösel | Lower Crumbly | englisches Dorfnamensmuster |
| Hoggelwarz | Hogglewarz | erkennbar, aber verfremdet |
| Zapp-O-Mat | Zap-O-Matic | Werbesprech der 60er |
| M.U.T.T.I. | M.O.T.H.E.R. | Abkürzung neu ausschreiben |
| Modell 08/15 | Model 08/15 | bleibt; Pixel erklärt den Ausdruck einmal in einer Ansehen-Zeile |
| Dr. Werbepause | Dr. Adbreak | Titel bleibt |
| Pfote (Hilfe) | Paw | UI-Begriff |
| Moderwort | Lord Mouldword | erkennbar, aber verfremdet |
| Mo-Knuddel-Puddi-Bärchen | Mo-Cuddles-Pudding-Teddy | Passwort; die vier Teile heißen in ui.csv und Notizbuch genauso, das Arbeitslied singt „Cuddles-Pudding“ |
| Grimmzahn | Grimtooth | Gewerkschaftsboss der Goblins |
| Rotkäppchen | Little Red | Lieferdienst bleibt Lieferdienst |
| Burg Brösel / Schloss Steinbeiß | Castle Crumble / Stonebite Palace | Burgen, in denen Zeldina nicht ist |
| Schicksalsberg (Jahrgang) | Mount Doomsday | Weinjahrgang in der Taverne |
| Vielsaft-Limo | Manyjuice Lemonade | Trank-Parodie |
| Glücksrad-Shopping | Lucky Wheel Shopping | nicht „Wheel of Fortune“, das ist im Englischen ein eingetragener Sendungstitel |
| Bohn-O-Mat | Bean-O-Matic | wie Zap-O-Matic |
| Niesrosen | Sneezeroses | Wortbildung bleibt |
| Gerhard, Birgit, Klaus-Dieter (Humberts Schwerter) | Gerald, Brenda, Nigel | deutsche Allerweltsnamen werden englische; Ingrid, Helga, Kurt bleiben |
| Zeldina, Toadi, Smaugi, Gollo, Alwin, Humbert, Waldemar, Minka, Kalle, Flimmer, Zappmann, Gerd Glück, Konrad, Hildegard | gleich | funktionieren in beiden Sprachen |
| Kuchen123 | Cake123 | Max' Passwort-Raten im Zwischenspiel 3 |
| „Servus“ (Modell 08/15) | „Greetings“ | der Roboter grüßt alles, auch Türen |
| Zappis Puppenstube | Zappi's Dollhouse | Opas Kindersendung von 1977 |
| Opas Dachboden, Schwurbelstein, Antikodonien, Neo-Neustadt 2099, Kanal 999 (Weltnamen) | Grandpa's attic, Waffleton, Antikodonien, Neo-Neustadt 2099, Channel 999 | Weltnamen in Spielständen und auf dem Drehknopf; Antikodonien und Neo-Neustadt bleiben |

Stand der englischen Fassung (10. November 2026): alle Skriptzeilen (Prolog, Welt 1 bis 4, die drei Zwischenspiele, das Finale), die Systemzeilen und alle Menütexte sind übersetzt. Kommt eine neue deutsche Zeile ohne englische dazu, zeigt das Spiel dort die deutsche (Rückfallsprache `de`). Ablauf: `python3 tools/en_eintragen.py --offen W2` gibt die offenen Zeilen mit Sprecher, Auslöser und Regie aus, Claude übersetzt sie als `ID | Text` in eine Datei, `python3 tools/en_eintragen.py DATEI` trägt sie nach `uebersetzung/en.csv` ein (Kaskaden müssen dieselbe Zahl Blasen haben, sonst wird die Zeile abgelehnt), danach `python3 tools/skript_export.py`. Ein Muttersprachler prüft die Witze vor dem Release.

**Zeilenarten:**

| Art | Wann | Umfang |
| --- | --- | --- |
| Szene | Zwischensequenzen und Story-Momente | Fest, wird zuerst geschrieben |
| Gespräch | Dialogbäume mit Auswahl, je Option eine Antwort | Pro Figur ein Baum, drei bis sechs Optionen, dazu zwei Abschiedszeilen (ABS) |
| Ansehen | Rechtsklick auf Hotspot oder Gegenstand | Jeder Hotspot und jeder Gegenstand (je Zustand) eine erste und eine zweite Zeile von Max, etwa jeder dritte zusätzlich beide von Pixel; ab dem dritten Mal der Wiederholungs-Pool |
| Benutzen | Benutzen oder Nehmen in der Welt | Jeder Hotspot mit Funktion; sonst Ersatzzeile. Was der Spieler nehmen kann, aber gerade nicht darf (Ketchup vor der Erlaubnis, zweite Flasche), bekommt eine eigene Zeile mit dem Grund, nie Ersatz oder Stille |
| Kombinieren | Gegenstand auf Gegenstand oder Hotspot | Alle Lösungen, dazu die naheliegenden Fehlversuche. Funktioniert eine Lösung nur an einem Ort, sagt die Zeile am falschen Ort, wohin (etwa Käse auf den Löffel nur beim Stabmacher) |
| Ersatz | Nichts Spezielles passt | Ein Pool von 25 Zeilen pro Figur, zufällig gezogen, nie zweimal hintereinander |
| Hinweis | Pixels Hilfeknopf | Drei Zeilen pro Rätsel, siehe Hinweissystem |
| Zuruf | Pixel kommentiert ungefragt, wenn der Spieler eine Weile nichts tut | Zwei bis drei pro Raum |
| Pixel auf Mensch | Pixel wird als Gegenstand auf eine Figur oder einen Gegenstand gezogen | Eine Zeile je Figur; auf Gegenständen eine Schnuppern-Zeile; 40 bis 60 Zeilen je Welt |

**Wiederholung und Erschöpfung:**

- Ansehen in der Welt und im Inventar: Beim ersten Mal kommt die eigene Zeile, beim zweiten die eigene Zeile mit „zweites Mal“ im Auslöser (jede Ansehen-Stelle bekommt eine, direkt unter der ersten). Ab dem dritten Mal kommt immer eine Zeile aus dem Wiederholungs-Pool (`SYS_WDH_MAX_*`, `SYS_WDH_PIX_*`, Prolog-Skript Abschnitt 9), nie zweimal dieselbe hintereinander, gesprochen vom Sprecher der ersten Zeile. Gezählt wird je Objekt, Zustand und Figur; der Zähler wird mitgespeichert.
- Inventar-Ansehen: Jeder Gegenstand hat je Zustand eine Zeile im Skript-Abschnitt INV seines Abschnitts, Auslöser „Ansehen: <Name>, <zustand>“, optional „…, zweites Mal“.
- Gespräche: Optionen mit Hinweis oder Rätselbezug tragen „(bleibt)“ hinter „Option <Figur>“ und bleiben nach Nutzung ausgegraut wählbar; Plauderoptionen verschwinden. Ist nur noch die Option übrig, die das Gespräch beendet, öffnet ein Klick auf die Figur kein Menü, sondern spielt abwechselnd ihre zwei Abschiedszeilen (Auslöser „Reden, Gespräch erschöpft“). Sind alle Plauderoptionen einer Figur weg, sagt Max beim nächsten Klick auf sie einmalig eine Zeile aus dem Pool `SYS_PLA_MAX_*` (Auslöser „Plauderoptionen erschöpft“, Prolog-Skript Abschnitt 9).

**Schreibregeln:**

- Zwei Textzeilen pro Sprechblase sind die Regel, drei die Ausnahme für einen einzelnen langen Satz (bis 120 Zeichen). Längerer Text wird an Satzgrenzen automatisch auf Folgeblasen derselben ID verteilt; zwei Sätze, die je in eine Zeile passen, bekommen je eine Zeile. Zwei Zeilen erfasst man mit einem Blick; gespielt wird vor allem am Laptop und am Rechner.
- Pixels Kaskaden (eine Pointe, die sich über mehrere Blasen steigert) stehen als eine Zeile mit „//“ als Blasentrenner; der Spieler klickt sich durch, die Vertonung bekommt je Blase eine eigene Datei (siehe `04-audio.md`). Dieselbe feste Trennung darf jede Figur nutzen, wenn eine Satzgrenze den Witz zerstören würde (etwa Ciceros Rede „ohne Punkt ohne Komma“). Ein einzelner Satz ohne „//“ hat höchstens 120 Zeichen (`tools/pruefen.py` warnt).
- Max spricht kurz, trocken, mit Serien-, Streaming- und Handy-Vergleichen; Pixel lang, hochnäsig, mit Essen und Schlafplätzen (Tabelle „Max' Stimme“ im Konzept).
- Max erklärt nie die Vorlage, und jede Anspielung funktioniert auch ohne sie. Retro-Witze gehören Pixel oder Opa.
- Ein Fehlversuch darf nie wie eine Belohnung für Raten wirken, aber er soll lustig sein. Naheliegende falsche Kombinationen bekommen eine eigene Zeile.
- Jede Zeile, die eine Lösung andeutet, steht so im Skript, dass das Hinweissystem darauf aufbauen kann.
- Gespräche sollen fließen. Eine Plauderoption endet nicht nach einer einzigen Antwortzeile, sondern bekommt einen Nachsatz oder eine Rückfrage von Max (Ausnahme: Abschiede). Eine neue Zeile kommt mit `tools/zeilen_einfuegen.py` hinter die passende Zeile, ohne dass etwas umnummeriert wird.
- Jede Zeile muss im Spiel vorkommen. Eine Zeile, die bewusst nicht vorkommt, wird im Skript als „Reserve, kommt nicht vor“ markiert.

**Umfang:** Etwa 5.000 Zeilen (angehoben am 9. November 2026, weil jede Ansehen-Stelle eine Zweitzeile bekommt und Inventar-Ansehen, Abschiedszeilen und Pools dazukamen). Als Budget: Prolog 170, jede Welt 1.000 bis 1.100, Zwischenspiele 200, Finale und Abspann 320, Menüs und Systemtexte 150. Die Systemzeilen (`SYS_ERS_*` 50, `SYS_WDH_*` 30, `SYS_PLA_*` 6) stehen in `skript/prolog.md`, zählen aber zu Menüs und Systemtexten; der Prolog selbst hat 165 Zeilen. Stand der Entwürfe am 9. November 2026: Welten 1.019 bis 1.099, Zwischenspiele 191, Finale und Abspann 315. Die Pixel-auf-Mensch-Zeilen stecken im Budget der Welten.

**Ablauf pro Raum:**

1. Claude legt aus den Rätseltabellen die Szenen- und Pflichtzeilen an.
2. Claude ergänzt Ansehen-, Benutzen- und Kombinieren-Zeilen für alle Hotspots aus der Grafik-Datei der Welt.
3. Du kürzt und markierst Lieblingszeilen; nur was du freigibst, wird final.
4. Der Raum wird mit Platzhaltergrafik gespielt; Zeilen, die beim Spielen nicht zünden, fliegen raus.

Als Muster steht das ganze Prolog-Skript in `skript/prolog.md`, einschließlich der Gesprächsbäume von Opa und Pixel, der Zurufe und der Ersatzzeilen-Pools.

## Schrift

Festgelegt am 9. November 2026 (Sebastian): **Nunito** (ExtraBold) für Sprechblasen, Objektnamen, Dialogauswahl und Menüs, gesetzt in voller Bildschirmauflösung über dem Pixelbild, wie bei Thimbleweed Park. **Pixelify Sans** bleibt für Titel und große Überschriften. Die Pixelschriften unten waren die erste Wahl; im Mockup nahm Monogram Extended bei der damaligen Auflösung 320×180 zu viel Bildfläche ein (drei Zeilen Blase plus vier Zeilen Auswahl), deshalb der Wechsel.

| Schrift | Lizenz | Nennung nötig | Deutsch | Einsatz |
| --- | --- | --- | --- | --- |
| [Nunito](https://fontsource.org/fonts/nunito) | OFL 1.1 | Lizenztext muss mitgeliefert werden | Alle Zeichen des Testsatzes vorhanden (geprüft mit fontTools) | Text im Spiel |

Frühere Kandidaten (Pixelschriften in Spielauflösung):

| Schrift | Lizenz | Nennung nötig | Deutsch | Einsatz |
| --- | --- | --- | --- | --- |
| [Monogram Extended](https://datagoblin.itch.io/monogram) | CC0 | Nein | Laut [Devlog](https://datagoblin.itch.io/monogram/devlog/30375/monogram-extended-is-out) unterstützt; nur die Extended-Datei, nicht die Basisdatei | Erste Wahl für Text im Spiel |
| [m5x7](https://managore.itch.io/m5x7) | CC0, Nennung erwünscht | Nein | „Viele Akzentbuchstaben“, Umlaute nicht einzeln genannt | Ersatz, falls Monogram im Test durchfällt |
| [Pixelify Sans](https://fontsource.org/fonts/pixelify-sans/about) | OFL 1.1 | Lizenztext muss mitgeliefert werden | Deutsch ausdrücklich gelistet | Titel, Hauptmenü, Kapitelkarten |
| [m6x11](https://managore.itch.io/m6x11) | Frei mit Namensnennung | Ja | Nicht angegeben | Nur, falls mehr Platz pro Zeile nötig ist |
| [Silver](https://poppyworks.itch.io/silver) | CC BY 4.0, ab 100.000 $ Budget oder Umsatz Lizenz anfragen | Ja | Mehrsprachig, Details nicht geprüft | Nur für spätere Übersetzungen mit anderen Schriftsystemen |

Lizenzen gelesen am 6. November 2026 auf den verlinkten Seiten.

**Größe:** Text liegt auf einer eigenen Ebene in 1920×1080 (bei anderen Bildschirmen mitskaliert), Grafik und Inventarsymbole bleiben in Spielauflösung. Sprechblasen in 48 px, Objektnamen und Dialogauswahl in 39 px; eine Blase ist höchstens 1.080 px breit, das sind rund 50 Zeichen je Zeile. Die Option „Große Schrift“ vergrößert die Textebene um ein Viertel. Ersetzt die Entscheidung vom 8. November 2026 (Text in Spielauflösung).

**Einstellungen in Godot:** Stretch-Modus „canvas_items“ mit ganzzahliger Skalierung und Pixel-Einrasten (`rendering/2d/snap`): Grafik bleibt scharf in Spielpixeln, Schrift wird in Bildschirmauflösung gezeichnet. Größen stehen in Spielpixeln bei 640×360: Sprechblasen 16 (bei 1080p 48 px), Objektnamen und Dialogauswahl 13 (39 px), Blasen höchstens 360 breit (1.080 px, rund 50 Zeichen je Zeile). Thema `game/gui/resources/gui_theme.tres`; Pixelify Sans für Titel ohne Kantenglättung in ganzzahligen Vielfachen. Bildschirmfotos aus dem laufenden Spiel macht `game/tests/bildschirmfoto.gd`. Text in Sprechblasen und Objektnamen bekommt einen dunklen Rand (#262b44 aus Endesga 32), damit Text auf jedem Hintergrund lesbar bleibt. Jede Figur hat eine eigene Textfarbe aus der Palette: Max weiß, Pixel türkis wie seine Halsband-Leuchte, Opa orange.

**Test vor der Entscheidung:** Diesen Satz in jeder Kandidatin in Godot bei Originalgröße setzen und auf drei Hintergründen ansehen (Dachboden, Zauberwald, Neonstadt):

> „Größer als Ostern.“ Äpfel, Öl, Übermut – Straße, Zapp-O-Mat 3000, 20:15 Uhr… Weißt du’s? Ja! (5 %)

**Ergebnis des Tests (9. November 2026, `tools/schrifttest.py`):** Monogram Extended bei 16 px hat alle Zeichen des Testsatzes, setzt ihn in drei Zeilen und bleibt auf allen drei Hintergründen scharf und lesbar. m5x7 fehlen die deutschen Anführungszeichen, der Halbgeviertstrich und die Auslassungspunkte, der Monogram-Basisdatei zusätzlich Umlaute und ß. Pixelify Sans hat alle Zeichen, wirkt bei 10 px aber unruhig und bleibt für Titel. Im UI-Mockup (`tools/ui_mockup.py`) wirkte der Text trotzdem zu wuchtig; Sebastian hat sich am 9. November 2026 für Nunito in voller Auflösung entschieden (Mockup `tools/ui_mockup_hd.py`).

Die Lizenzdateien aller verwendeten Schriften kommen in den Ordner `licenses/` und in den Abspann.

## UI

Die Steuerung ist eine Zwei-Klick-Steuerung ohne Verbenleiste: Linksklick tut das Naheliegende, Rechtsklick sieht an. Das passt zu den fünf geplanten Mauszeigern und lässt das ganze Bild für die Szene frei. Grundlage ist die Popochiu-Vorlage „Simple Click“, die Claude anpasst.

**Steuerung:**

| Eingabe | Wirkung |
| --- | --- |
| Linksklick auf Boden | Gehen; Doppelklick auf einen Ausgang wechselt sofort den Raum |
| Linksklick auf Hotspot | Benutzen, Nehmen oder Reden, je nach Objekt; der Zeiger zeigt vorher, was passiert |
| Rechtsklick | Ansehen |
| Gegenstand im Inventar anklicken, dann Ziel | Kombinieren oder Benutzen mit; Rechtsklick legt ihn zurück. Den ausgewählten Gegenstand auf sich selbst anwenden darf eine eigene Zeile haben, aber kein Rätsel hängt davon ab |
| Pixel-Feld ganz links in der Inventarleiste | Solange Max aktiv und Pixel wach ist, verhält sich Pixel wie ein Gegenstand: auswählen und auf ein Objekt oder eine Figur anwenden („Pixel auf Mensch“, Schnuppern auf Gegenständen) |
| Umschalt/Shift (halten) | Zeigt alle Hotspots im Raum als kleine Punkte, mit Namen (in den Optionen abschaltbar) |
| Tab oder Klick aufs Porträt | Wechsel zwischen Max und Pixel (ab Welt 1); im Prolog ohne Wirkung |
| Linksklick, Leertaste oder Eingabetaste während Text | Text weiter: überspringt die aktuelle Zeile (Tasten in den Optionen umlegbar) |
| Esc | Überspringt eine Zwischensequenz, sonst Pausemenü |
| F5 / F9 | Schnellspeichern / Schnellladen |

**Bildschirmaufbau (640×360; Maße in `tools/aufloesung.py`):**

| Element | Ort | Verhalten |
| --- | --- | --- |
| Inventarleiste | Oben, 64 Pixel hoch, acht Plätze für 48×48-Symbole; bei aktivem Max ist der erste Platz das Pixel-Feld (ab P1), bei aktivem Pixel zeigt die Leiste Pixels einen Gegenstand im Maul | Klappt ein, sobald die Maus den oberen Rand verlässt, und bleibt in Gesprächen und Zwischensequenzen eingeklappt (nur ein schmaler Griff bleibt sichtbar); Pfeile blättern bei mehr als acht Gegenständen |
| Porträts von Max und Pixel | Oben links, 48×48 | Immer sichtbar; die aktive Figur ist hell, die andere grau |
| Hilfe-Pfote | Oben rechts, 48×48 | Immer sichtbar; leuchtet sanft, wenn ein neuer Hinweis bereitliegt |
| Objektname | Unter dem Zeiger, eine Zeile | Zeigt beim Überfahren den Namen, beim Kombinieren „Thunfischdose mit Pixel“ |
| Sprechblasen | Über der sprechenden Figur | Rand und Farbe je Figur (siehe Schrift). Sprechende Dinge ohne Figur (Brunnen, Grammophon, Geheimtür, Spiegel) sprechen mit Blase über dem Objekt in ihrer Sprecherfarbe, nie als Systemtext |
| Dialogauswahl | Unten, bis zu vier Zeilen | Mausrad oder Pfeile bei mehr Optionen; gelesene Optionen werden grau. Dieselbe Auswahl dient für Wahlen ohne Gesprächsfigur (Wünsche am Brunnen, Passwort an der Geheimtür); ein Passwort setzt Max Teil für Teil zusammen, gewählte Teile verschwinden, damit nichts geraten wird |
| Sonder-Leisten | Je nach Welt | Fernbedienung (Welt 4) und Code-Sicht (Welt 3) erscheinen nur dort, unten rechts; in Gesprächen ist die Fernbedienungs-Leiste ausgegraut, außer im Gespräch mit dem Kommissar (Rätsel Welt 4, Gäste zwischen den Sendern) |

Mockup: `tools/ui_mockup_hd.py` zeichnet zwei Zustände auf dem Dachboden-Hintergrund, Erkunden (Leiste offen, Zeiger mit Objektname, Blase) und Gespräch (Leiste eingeklappt, Blase mit zwei Zeilen, Dialogauswahl). Schrift Nunito freigegeben am 9. November 2026; Grundauflösung 640×360 festgelegt am 10. November 2026 (vorher 480×270); danach baut Claude die UI.

**Bildschirme und Menüs:**

| Bildschirm | Inhalt |
| --- | --- |
| Hauptmenü | Startszene des Spiels (`game/oberflaeche/hauptmenue.gd`). Titelbild mit Zapp-O-Mat; Fortsetzen (lädt den neuesten Stand, ohne Spielstand ausgegraut), Neues Spiel, Laden, Optionen, Errungenschaften, Beenden. Die Menüpunkte sind Fernsehkanäle 1 bis 6, der Bildschirm zeigt den gewählten Kanal (bei Fortsetzen Ort, Spielzeit und Datum), der Drehknopf dreht mit; Zifferntasten schalten direkt. Beim allerersten Start kommt vorher der Epilepsie-Hinweis |
| Pausemenü (Esc) | Weiterspielen, Speichern, Laden, Optionen, Hauptmenü. Öffnet nur, wenn nichts läuft (in Zwischensequenzen und Gesprächen überspringt Esc), und hält das Spiel an. „Hauptmenü“ fragt mit einem zweiten Klick nach, weil Ungespeichertes verloren geht; das Spiel startet dafür neu, damit kein Zustand der alten Sitzung übrig bleibt |
| Speichern und Laden | Zwölf Plätze mit Vorschaubild, Ort, Welt, Spielzeit und Datum, dazu Autospeicher und Schnellspeicher (siehe Speichern) |
| Notizbuch | Öffnet sich aus dem Inventar, immer auf Seite 1. Seite 1: aktuelle Ziele, die das Hinweissystem mitpflegt. Seite 2: gesammelte Regeln und Passwort-Teile. Seite 3: Pixels Einkaufsliste als Running Gag, je Welt ein neuer Wunsch (Konzept, Running Gags) |
| Nahansicht | Bildschirmfüllende Überlagerung in Spielauflösung (640×360) mit Rahmen und Schließen-Knopf oben rechts; zeigt Objekte, deren Text in der Szene zu klein wäre. Es gibt genau 14 Nahansichten im ganzen Spiel; die Liste gehört den Welt-Tabellen (`welten/*.yaml`: Feld `nahansicht` bei Gegenständen, Liste `nahansichten` für Schilder, Tafeln und Ähnliches), die Grafik-Dateien beschreiben die Bilder (Zeile „Nahansichten“). Das Notizbuch trägt Regeln und Passwort-Teile erst nach dem Öffnen der Nahansicht ein |
| Programmzeitschrift (Welt 4) | Eigene Überlagerung wie eine Nahansicht, eine aufgeschlagene Doppelseite ohne Blättern: links die Zeitleiste mit fünf Senderspalten, jede Sendung ein klickbares Feld (Klick springt zur Sendezeit); rechts sechs Detailkästen mit Bild und Titel (darunter die 20:15-Folge, das Mitternachtsvideo und Dr. Werbepauses Spot); gefundene Kanäle werden angekreuzt; nach dem Fund steht auch Kanal 999 darin, und ein Klick führt in den Empfang. Dieser Aufbau ist verbindlich für Rätsel Welt 4 und Grafik Welt 4 |
| Reisetasche | Vor jeder Welt: zwei Wahlfächer, ein Pflichtfach. Überlagerung im oberen Bildteil, damit die Sprechblasen darüber sichtbar bleiben: oben Pflichtfach und Wahlfächer, darunter, was daneben liegt (alles Mitreisefähige aus dem Inventar und der Fundkiste). Klick packt ein oder aus, Rechtsklick fragt Pixel; Pixel kommentiert jeden Gegenstand beim ersten Berühren. „Fertig gepackt“ schließt, der Rest kommt in die Fundkiste |
| Optionen | Siehe unten |

**Optionen:** fünf Reiter wie in üblichen PC-Spielen, aus Haupt- und Pausemenü. Jede Änderung gilt sofort und steht in `user://settings.cfg`; „Standard“ setzt alles zurück.

| Reiter | Einstellungen |
| --- | --- |
| Audio | Gesamtlautstärke, Musik, Geräusche, Stimmen (je 0 bis 100, eigener Audio-Bus); stumm, solange das Fenster im Hintergrund ist |
| Anzeige | Fenster, Vollbild oder randloses Fenster; Fenstergröße in ganzzahligen Stufen (1280×720, 1920×1080, 2560×1440); VSync; Bildrate 30, 60, 120 oder unbegrenzt |
| Spiel | Sprache Deutsch oder Englisch; Textgeschwindigkeit (langsam, normal, schnell, sofort); Text weiter per Klick oder automatisch; Untertitel an oder aus (sobald es Stimmen gibt; Liedtexte haben immer Untertitel, kursiv mit Notenzeichen, bei den drei Rätsel-Liedern auch dann, wenn Untertitel aus sind, `04-audio.md`); Brabbel-Laute als Probe, bis die Entscheidung über die Sprachausgabe fällt |
| Steuerung | Tastenbelegung für Text weiter (Standard Leertaste, Eingabetaste geht auch; Linksklick geht immer), Figur wechseln (Tab), Hotspots zeigen (Umschalt/Shift halten, damit keine Taste doppelt belegt ist), Pausemenü (Esc), Schnellspeichern (F5), Schnellladen (F9). Mit der Maus geht alles auch ohne Tasten. Darunter steht die Controller-Belegung (siehe Controller und Steam Deck) |
| Barrierefreiheit | Große Schrift (ein Viertel größer); Hotspots dauerhaft zeigen; Namen zu den Hotspots zeigen (Standard an: wer die Hotspots zeigt, sieht auch, was sie sind); Bildschirmwackeln aus; Flackern reduzieren (ersetzt Lampenflackern und Umschalt-Störungen durch weiche Varianten; ein Epilepsie-Hinweis erscheint beim ersten Start); Farbenblind-Hilfe (Farbcodes bekommen zusätzlich Symbole: Kreis, Dreieck, Quadrat, siehe Welt 3) |

Wackeln, Flackern und Farbenblind-Hilfe sind als Schalter da. Stand 11. November 2026: „Untertitel“, „Bildschirmwackeln aus“ und „Farbenblind-Hilfe“ haben noch keine Wirkung und stehen im Menü grau mit „(kommt noch)“; „Flackern reduzieren“ wirkt schon im Hauptmenü. Jeder Effekt geht über `game/skripte/effekte.gd` (`CQEffekte.wackeln()`, `flackern_erlaubt()`, `weich_blinken()`, `farbsymbol()`), damit die Schalter überall gleich wirken, sobald die Effekte mit der Grafik kommen; wer einen Effekt baut, ruft diese Funktionen statt der Kamera oder eigener Zufallswerte.

Steam-Tags für Barrierefreiheit, die das Spiel damit erfüllt: Untertitel, anpassbare Textgröße, Farbenblind-Modus, Tastenbelegung anpassbar, Steuerung nur mit der Maus, volle Controller-Unterstützung, kein Zeitdruck. „Untertitel“ und „Farbenblind-Modus“ zählen erst, wenn die Schalter wirken. Die Liste wird vor der Store-Seite gegen Steams aktuelle Barrierefreiheits-Felder geprüft.

**Controller und Steam Deck** (`game/skripte/controller.gd`, Autoload „Controller“): Das ganze Spiel geht mit dem Gamepad, ohne Maus und Tastatur.

| Taste | Im Spiel | In Menüs |
| --- | --- | --- |
| Linker Stick | Zeiger bewegen; über Hotspots wird er langsamer, beim Loslassen rastet er auf dem nächsten Hotspot ein (18 Pixel Umkreis) | Auswahl |
| Steuerkreuz | Sprung zum nächsten Hotspot in der Richtung (auch Inventar, Porträts, Pfote, Knöpfe in Überlagerungen; bei offener Dialogauswahl nur deren Zeilen) | Auswahl, links/rechts verstellt Regler |
| A | wie Linksklick: benutzen, gehen, reden, Text weiter | bestätigen |
| B | wie Rechtsklick: ansehen, Gegenstand ablegen; schließt Notizbuch und Nahansicht | zurück |
| X oder linker Trigger halten | Hotspots zeigen | – |
| Y | Hilfe-Pfote | – |
| LB | Figur wechseln | Reiter zurück (Optionen) |
| RB | Zeiger in die Inventarleiste und wieder zurück | Reiter vor (Optionen) |
| Start | Pausemenü, Zwischensequenz überspringen | schließt das Pausemenü |

Der Zeiger ist die Maus: Er wird mit `warp_mouse` bewegt, A und B gehen als Mausklicks an den Viewport. So gilt für Popochiu, Inventar, Gespräche und Überlagerungen dieselbe Logik wie mit der Maus; eine echte Mausbewegung schaltet sofort zurück. Menüs mit Fokus (Haupt- und Pausemenü, Optionen, Spielstände, Errungenschaften) laufen über Godots `ui_*`-Aktionen. Die Tasten werden zur Laufzeit in die InputMap ergänzt, auch nach „Zurücksetzen“ in den Optionen; der Reiter Steuerung zeigt die Belegung. Offen für später: Steam-Input-Glyphen statt der Buchstaben, eigene Belegung der Controller-Tasten.

## Hinweissystem

Die Hilfe-Pfote gibt zu jedem offenen Rätselschritt drei Hinweise, vom Stups bis zur Lösung, wie in `raetsel/prolog-und-welt-1.md` beschrieben. Neu festgelegt ist hier, *welchen* Schritt Pixel wählt, wie lange er wartet und wie die Hinweise gespeichert werden. Das Notizbuch nutzt dieselben Daten für die Zielliste.

**Welcher Schritt drankommt:**

1. Jedes Rätsel ist in Schritte geteilt, so wie in den Rätseltabellen (a), (b), (c). Ein Schritt ist gesperrt, offen oder gelöst; offen ist er, sobald seine Voraussetzungen erfüllt sind.
2. Hat der Spieler im Notizbuch auf Seite 1 ein Ziel angeklickt, nimmt Pixel diesen Schritt, solange er offen ist.
3. Sonst nimmt er den offenen Schritt, mit dessen Hotspots oder Gegenständen der Spieler zuletzt etwas gemacht hat.
4. Gibt es keinen solchen, nimmt er den offenen Schritt mit der kleinsten Rätselnummer.
5. Ist nichts offen, sagt Pixel, wohin es weitergeht („Da ist ein Ausgang. Ausgänge sind zum Benutzen da.“).

**Stufen und Wartezeit:** Jeder Schritt merkt sich seine erreichte Stufe, auch über Speichern hinweg. Ein erneuter Klick wiederholt den letzten Hinweis. Die nächste Stufe gibt es erst nach 30 Sekunden (Stufe 2) bzw. 60 Sekunden (Stufe 3) seit dem letzten Hinweis; vorher sagt Pixel eine Wartezeile („Ich denke noch nach. Das sieht aus wie Schlafen, ist es aber nicht.“). Jeder Abschnitt mit Pfote hat eine eigene Wartezeile mit der Nummer 9995 im Ton seiner Welt. Die Pfote leuchtet sanft, sobald die nächste Stufe bereitliegt.

**Wer hilft wann:** Im Prolog schläft Pixel bis P1, also gibt Opa die Hinweise zu P1 über Reden; die Pfote ist bis dahin ausgegraut. In den Zwischenspielen ist kein Schritt offen; die Pfote sagt dort nur ZS1\_HINT\_PIX\_0010. In Welt 3 hängt der Weg von der Ebene ab: In der Realität steht Pixel neben Max und spricht normal. In der Simulation hört Max ihn, sobald Kabel-Kalle ihn beim ersten Aufwachen „auf die Leitung“ gelegt hat, aus dem Hörer der nächsten Telefonzelle oder aus Omas Wandtelefon; vorher und im Büroturm (Rätsel 7) gibt es nur das Terminal mit Miau-Morse, das Kalle übersetzt. Im Labor spricht Pixel aus M.U.T.T.I.s Lautsprecher, den Kalle angezapft hat. In Welt 4 meldet er sich aus dem Rauschen. Die Pfote funktioniert also überall, nur ihr Ausgabeweg wechselt.

**Nachsicht bei Minispielen:** Kein Minispiel kann den Spieler aufhalten. Nach zwei Fehlversuchen bietet eine Figur an, das Minispiel als bestanden zu werten (Welt 2: Ramses wertet „großzügig“, Welt 4: Flimmer schaltet die Zombies ab). Wer annimmt, kommt weiter; nur Errungenschaften, die eine Bestleistung verlangen, entfallen. Wer ablehnt, spielt weiter. Die Minispiele sind Archimedes' Hebel und das Rede-Ringen (Welt 2) und das Zombie-Video (Welt 4); Wortlaut und Ablauf stehen in den Rätsel-Dateien.

**Zählung:** Pro Welt wird gezählt, wie oft Stufe 3 genutzt wurde. Bei null gibt Pixel am Ende der Welt widerwillig zu, beeindruckt zu sein. Für eine Steam-Errungenschaft reicht derselbe Zähler.

Errungenschaften (Steam): 13 Stück, alle aus Zählern und Schaltern, die das Spiel ohnehin speichert. Keine verlangt Zeitdruck oder Raten. Gebaut in `game/skripte/errungenschaften.gd` (Autoload „Errungenschaften“): Nach jeder Änderung im Zustand werden alle Bedingungen geprüft. Freigeschaltet bleibt freigeschaltet, über alle Spielstände hinweg (`user://errungenschaften.cfg`); ist GodotSteam eingebunden, geht jede neue Errungenschaft unter ihrer ID auch an Steam, und beim Start wird nachgemeldet, was offline freigeschaltet wurde. Ohne Steam zeigt die Leiste unten eine Meldung. Das Hauptmenü listet alle auf (Kanal 5). Die ID ist der API-Name in Steamworks; Name und Beschreibung stehen in `uebersetzung/ui.csv` (UI\_ERR\_<ID>, UI\_ERR\_<ID>\_TEXT).

| ID | Name | Bedingung im Spiel |
| --- | --- | --- |
| EMPFANG | Empfang | Prolog beendet, der Fernseher läuft: P0\_P3\_GELOEST |
| ZIEGENFLUESTERER | Ziegenflüsterer | alle drei Ziegen über die Brücke: Rätsel R4 in Welt 1 gelöst |
| OHNE\_PFOTE\_1 bis \_4 | Ohne Pfote: Welt 1 bis 4 | Welt beendet und dort keine Stufe 3 (Zähler `stufe3_zaehler`). Beendet heißt: Welt 1 bis 3, sobald das Zwischenspiel danach beginnt (Wert ZWISCHENSPIEL ≥ Nummer); Welt 4 mit Rätsel R13 |
| FUENFKAMPF | Fünfkampf | alle fünf Disziplinen in Welt 2 mit Bestleistung (Definition in `raetsel/welt-2.md`): W2\_LAUF\_, \_HEBEL\_, \_SPEER\_, \_DISKUS\_, \_RINGEN\_BESTLEISTUNG |
| DEJA\_VU | Déjà-vu | Simulation in Welt 3 zum dritten Mal betreten: Wert W3\_SIMULATION\_BESUCHE ≥ 3 |
| FREUND\_0815 | Freund 08/15 | Modell 08/15 als Freund gewonnen: FREUND\_0815 |
| ZAPP\_MEISTER | Zapp-Meister | alle Kanäle der Programmzeitschrift gefunden: W4\_ALLE\_KANAELE |
| EINKAUFSLISTE | Einkaufsliste komplett | alle Wünsche Pixels im Notizbuch: Wert EINKAUFSLISTE ≥ 4 |
| NEUGIER | Neugier | alle 14 Nahansichten des Spiels geöffnet (Welt-Tabellen) |
| WELT\_GERETTET | Welt gerettet | Finale gesehen: FI\_ENDE\_GESEHEN |

Vier Namen gibt es in den Welt-Tabellen noch nicht; wer die Welt baut, legt sie unter `weitere_schalter` an und setzt sie: W3\_SIMULATION\_BESUCHE (Welt 3, zählt jedes Betreten der Simulation), W4\_ALLE\_KANAELE (Welt 4), EINKAUFSLISTE (Finale-Tabelle, Zahl der Wünsche auf Seite 3) und FI\_ENDE\_GESEHEN (Finale, nach dem Abspann). Wo eine Bedingung nicht als Schalter passt, schaltet `Errungenschaften.freischalten("ID")` direkt frei.

**Datenformat:** Eine Datei pro Abschnitt, `game/daten/hinweise/<abschnitt>.json`, erzeugt von `tools/spieldaten.py` aus Welt-Tabelle und Skript (nie von Hand bearbeiten), mit einem Eintrag pro Schritt:

| Feld | Beispiel |
| --- | --- |
| Schritt | W1\_R01\_B |
| Ziel für das Notizbuch | Den Wirt vom Fondue-Topf weglocken |
| Offen wenn | Taverne betreten |
| Gelöst wenn | Wirt ist im Keller |
| Zugehörige Objekte | Wirt, Weinkarte, Fondue-Topf |
| Hinweise | W1\_HINT\_PIX\_0112, \_0122, \_0132 (Texte im Skript; Schema siehe unten) |

**Hinweis-IDs, Regel für alle Abschnitte:** Hinweiszeilen heißen `<Abschnitt>_HINT_PIX_<Nummer>` (im Prolog Opas P1-Hinweise ausgenommen, sie stehen im Gesprächsbaum als P0\_DACH\_OPA\_1324, 1326, 1328). Jede Nummer ist im Abschnitt eindeutig, jede Hinweiszeile nennt im Auslöser ihren Schritt und ihre Stufe (etwa „R1c, Stufe 3“), und die Zuordnung Schritt → Zeilen steht nur im Skript. Die Nummer selbst trägt keine Bedeutung, auf die sich Code oder andere Dateien verlassen; die Hinweis-Datei (A14) liest Schritt und Stufe aus dem Auslöser. Reservierte Nummern: 0010 bzw. 9990 „nichts offen“, 9995 Wartezeile. Die Skripte nutzen diese Schemata, und sie werden nicht umnummeriert:

| Abschnitt | Schema | Beispiel |
| --- | --- | --- |
| Prolog, Welt 1, Welt 2 | RRSK: RR Rätselnummer, S Stufe 1 bis 3, K Teilschritt (0 ohne Teilschritte, 1 bis 3 für a bis c bzw. Teil 1 und 2) | W1 R1b = 0112, 0122, 0132 |
| Welt 3 | RR plus Zehnerschritte: je Rätsel ein Hunderterblock, je Teilschritt drei aufeinanderfolgende Zehner (Stufe 1 bis 3); R9 belegt 09xx und 10xx, darum R10 = 11xx bis R13 = 14xx | R1b = 0140, 0150, 0160 |
| Welt 4 | fortlaufend in Zehnerschritten, Schritt für Schritt in Rätselfolge, Stufe 1 bis 3 als drei aufeinanderfolgende Nummern; nachgetragene Stufen und Schritte ab 0520, sie stehen bei ihrem Schritt | W4\_R01 = 0010, 0020, 0030 |
| Zwischenspiele und Finale | fortlaufend in Zehnerschritten (FI Schritt 0 bis D) | FI Schritt 0 = 0010, 0020, 0030 |

### Hinweise für den Vertical Slice

Alle Hinweise für Prolog und Welt 1, Rätsel 1 bis 4, als Grundlage für den ersten Test. Wortlaut und IDs stehen im Skript (`skript/prolog.md`, Gesprächsbaum Opa; `skript/welt-1.md`, Abschnitt Hinweise); bei einer Abweichung gilt das Skript.

| Schritt | Stufe 1: Stups | Stufe 2: Hinweis | Stufe 3: Lösung |
| --- | --- | --- | --- |
| P1 Pixel wecken (Opa) | „Mit Argumenten. Er versteht genau eins, und das liegt in meiner Werkzeugkiste. // Zwischen Schraubenzieher und Draht.“ (P0\_DACH\_OPA\_1324) | „Und die Dose ist zu. Da hilft kein Reden. Da hilft Kurbeln.“ (P0\_DACH\_OPA\_1326) | „Mach die Thunfischdose mit dem Dosenöffner auf. Dann ist er sofort da.“ (P0\_DACH\_OPA\_1328) |
| P2 Antenne | „Ein Fernseher ohne Antenne ist wie ein Napf ohne Futter. Sinnlos.“ (P0\_HINT\_PIX\_0210) | „Im Schrank hängt allerlei Draht. Opa nennt das Garderobe.“ (0220) | „Nimm den Kleiderbügel aus dem Schrank und steck ihn oben auf den Fernseher. Ich habe Pfoten, ich mach das nicht.“ (0230) |
| P3 Kanal | „Dein Opa schreibt sich alles irgendwohin. Meistens an die Wand.“ (P0\_HINT\_PIX\_0310) | „Sieh dir den Kalender genauer an. Nicht nur den roten Kreis.“ (0320) | „Auf dem Kalender steht die Kanalnummer. Stell sie am Drehknopf ein.“ (0330) |
| R1a Minka | „Die Wirtskatze lässt dich nicht an den Topf. Sie braucht Ablenkung. Charmante Ablenkung.“ | „Ich könnte mit Minka reden. Wechsel zu mir, falls du dich traust.“ | „Wechsel zu mir und sprich mit Minka. Ich locke sie raus. Mein Charme ist eine Naturgewalt.“ |
| R1b Wirt | „Der Wirt klebt am Topf wie ich an der Heizung. Er braucht einen Grund zu gehen.“ | „Schau auf die Weinkarte. Etwas, das ganz hinten im Keller liegt.“ | „Bestell den Jahrgang Schicksalsberg. Den holt er aus dem Keller, und das dauert.“ |
| R1c Gollo | „Gollo traut sich nicht. Er will vorher spielen. Rätselspiele, natürlich.“ | „Er verliert nur bei einer Frage, die nur du beantworten kannst.“ | „Zieh die Thunfischdose auf Gollo. Dann fragst du ihn, was in deiner Tasche ist. Da kommt er nie drauf.“ |
| R2 Zauberstab | „Der Stabmacher sagt, der Stab wählt den Zauberer. Klingt, als bräuchte der Stab einen Grund, an dir zu kleben.“ | „In der Taverne gibt's etwas Klebriges.“ | „Schmier Käse auf den Löffel. Ich bin ein Kater, kein Lösungsbuch.“ |
| R3 Ziegen | „Der Troll will drei Ziegen. Wir haben null. Schlechter Start.“ | „Eine Ziege frisst gerade beim Schmied, eine zweite kann man am Dorfbrett bestellen. Die dritte … bitte nicht.“ | „Hol die Schmiede-Ziege. Bestell die zweite mit dem Zettel am Dorfbrett und gib mir den Ziegenfell-Vorleger aus der Taverne. Ich hasse alles daran.“ |
| R4a Reihenfolge | „Der Troll ist ein Paragrafenreiter. Lies das Brückenschild.“ | „Im Märchen läuft immer erst die Kleine, dann die Mittlere, dann die Große.“ | „Schick die Ziegen klein, mittel, groß über die Brücke. Ich bin die Kleine. Sag's niemandem.“ |
| R4b Ziegisch | „Die Ziegen müssen ihren Text sagen. Sie sprechen nur Ziegisch. Ich übrigens fließend.“ | „Lies den Text aus der Satzung vor, ich übersetze. Meistens richtig.“ | „Lies die Satzung vor, dann wechsel zu mir und rede mit den Ziegen. Beim zweiten Mal übersetze ich ordentlich.“ |
| R4c Ins Wasser | „Laut Satzung muss der Troll ins Wasser. Er kann nicht schwimmen. Lies genau, was da steht.“ | „Da steht ‚Wasser‘, nicht ‚Fluss‘. Wasser gibt es auch woanders.“ | „Hol mit dem Eimer Wasser aus dem Brunnen und stell es dem Troll hin. Fußbad. Regel erfüllt.“ |

## Speichern

Gespeichert wird jederzeit außerhalb von Zwischensequenzen, in zwölf freie Plätze, dazu automatisch bei jedem Raumwechsel. Popochiu bringt Speichern und Laden für Räume, Figuren und Inventar mit; Claude prüft im Grundgerüst, was davon reicht, und ergänzt den Rest als eigenen Spielstand-Teil.

**Speicherplätze:**

| Art | Wann | Plätze |
| --- | --- | --- |
| Autospeicher | Bei jedem Raumwechsel und zu Beginn und Ende jeder Welt | Drei, der älteste wird überschrieben |
| Schnellspeicher | F5, Laden mit F9 | Einer |
| Manuell | Pausemenü | Zwölf, mit Vorschaubild, Ort, Welt, Spielzeit und Datum |

Während einer Zwischensequenz, eines Gesprächs oder eines Minispiels merkt sich das Spiel den Wunsch und speichert direkt danach; Minispiele zählen dabei wie Zwischensequenzen. „Fortsetzen“ im Hauptmenü lädt den neuesten Stand, egal welcher Art.

**Was gespeichert wird:**

| Bereich | Inhalt |
| --- | --- |
| Allgemein | Spielversion, Spielzeit, aktuelle Welt und Raum, aktive Figur, Positionen von Max und Pixel |
| Inventar | Gegenstände von Max mit Reihenfolge, Pixels einer Gegenstand im Maul, Inhalt der Reisetasche |
| Rätsel | Zustand jedes Rätselschritts (gesperrt, offen, gelöst) als benannte Schalter wie `W1_R04_C_GELOEST` |
| Hinweise | Erreichte Stufe pro Schritt, Zeit des letzten Hinweises, Zähler der Stufe-3-Hinweise pro Welt |
| Dialoge | Bereits gewählte Optionen (werden grau angezeigt) |
| Begleiter | Wer Max gerade folgt, als Schalter: Ziegenherde (Welt 1 bis Rätsel 4), Zeldina (ab Welt 1 Rätsel 9), Grimmzahn (Goblin-Weg B), Gäste zwischen den Sendern (Welt 4) |
| Entscheidungen mit Folgen | Goblin-Weg A oder B, Modell 08/15 als Freund, Ziegen-Melk-Schwur, verbrauchte Wunderdinge, Ergebnisse der fünf Disziplinen (`W2_…_BESTLEISTUNG`) |
| Welt 2 | Standort der Fähre (`W2_FAEHRE_STEG`) und Zustand der Feigenpflanze (`W2_FEIGE_ZUSTAND`); das Alter von Grabstein und Krügen folgt aus dem Standort und wird nicht gespeichert |
| Welt 3 | Aktuelle Ebene (Simulation oder Realität), je Code-Sicht-Raum nur „gelöst ja/nein“ (Tausche werden nicht gespeichert, Verlassen setzt sie zurück), Zustand von Fenster, Strom und Kabeln |
| Welt 4 | Gefundene Tasten, aktueller Sender, Uhrzeit, welche Gäste in welchem Sender sind, Genre-Form getragener Gegenstände |

**Dateien:** Jeder Platz ist eine JSON-Datei mit Vorschaubild im Benutzerordner (`user://saves/`). Optionen liegen getrennt in `user://settings.cfg`, damit sie für alle Spielstände gelten. Jede Datei trägt eine Versionsnummer; ändert sich der Aufbau, übersetzt eine kleine Umwandlung alte Spielstände, damit Tester nicht neu anfangen müssen. Steam Cloud synchronisiert später einfach den Ordner `saves`.

**Regeln für den Code:**

- Gespeichert werden nur Schalter und Werte, nie etwas, das sich daraus ableiten lässt. Ob eine Tür offen ist, folgt aus dem Rätselschalter.
- Schalter heißen wie die Rätselschritte, damit Hinweissystem, Notizbuch und Speichern dieselbe Sprache sprechen.
- Hilfsschalter und Hilfswerte, die zu keinem Rätsel gehören (etwa `P0_SCHNEE_GESEHEN`, `W1_ZIEGE_FOLGT`), tragen das Präfix ihres Abschnitts und stehen in der Welt-Tabelle unter `weitere_schalter`; `tools/pruefen.py` warnt, wenn der Code einen anderen Namen setzt.
- Claude schreibt einen automatischen Test, der im Vertical Slice nach jedem gelösten Schritt speichert, lädt und prüft, dass nichts fehlt.

## Offene Entscheidungen

- [x] Schrift festlegen: entschieden am 9. November 2026, Nunito für Text im Spiel, Pixelify Sans für Titel (Abschnitt Schrift).
- [x] Text in Spielauflösung lassen oder gleich die Ebene in doppelter Auflösung bauen: entschieden am 8. November 2026, Text bleibt in Spielauflösung; die Ebene in doppelter Auflösung kommt nur als Option „Große Schrift“.
- [ ] Wartezeiten der Hinweise (30 und 60 Sekunden) nach dem ersten Test mit Fremden anpassen
- [ ] Zwei-Klick-Steuerung bestätigen oder doch eine Verbenleiste
- [ ] Prüfen, ob das gemeinsame Zustandssystem für Code-Sicht und Fernbedienung (Produktion, System 1) dieselben Schalter wie Speichern und Hinweise nutzt; das wäre die einfachste Lösung
