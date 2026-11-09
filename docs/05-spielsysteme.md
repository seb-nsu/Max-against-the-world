# Spielsysteme: Dialoge, Schrift, UI, Hinweise, Speichern

Nov 6, 2026 · @Sebastian

Diese Datei arbeitet die fünf offenen Bausteine aus `03-produktion.md` aus, so weit, dass Claude das Grundgerüst und den Vertical Slice (Produktion, Meilensteine Stufe 1 und 2) danach direkt in Godot bauen kann. Das komplette Prolog-Skript steht als Muster in `skript/prolog.md`.

## Dialog-Skript

Jede Zeile des Spiels steht genau einmal in einer Skript-Tabelle pro Welt und hat eine feste ID. Godot liest daraus die Übersetzungsdatei, und dieselbe ID benennt später die Audiodatei. So kosten Übersetzung und Vertonung später kaum Umbauarbeit.

**Zeilen-ID:** `Abschnitt_Szene_Sprecher_Nummer`, zum Beispiel `P0_DACH_MAX_0012` oder `W1_TAV_PIX_0040`. Die Nummern gehen in Zehnerschritten, damit später Zeilen dazwischen passen. Eine ID wird nie neu vergeben, auch wenn ihre Zeile gestrichen wird.

| Teil | Werte |
| --- | --- |
| Abschnitt | P0 Prolog, W1 bis W4, ZS1 bis ZS3 Zwischenspiele, FI Finale, UI Menüs, SYS Systemtexte |
| Szene | Drei bis vier Buchstaben pro Raum, etwa DACH, TAV, WALD, TURM |
| Sprecher | MAX, PIX, OPA, OMA; NAR für Regie- und Animationszeilen ohne Sprecher (nicht vertont); Nebenfiguren mit drei Buchstaben wie GOL, ZEL, WAL, bei Gruppen auch mit Ziffer (GO1, GO2). Die Kürzel gelten je Abschnitt und stehen in den Welt-Tabellen (`welten/*.yaml`); dasselbe Kürzel kann in einem anderen Abschnitt eine andere Figur meinen (MUT ist in Welt 3 M.U.T.T.I., im Finale die Mutter) |

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

Godot bekommt daraus eine CSV-Übersetzungsdatei mit den Spalten ID, de und en. Ein kleines Export-Skript, das Claude schreibt, wandelt die Tabelle nach jeder Änderung um. Im GDScript steht dann nur die ID, etwa `await C.Max.say("P0_DACH_MAX_0010")`, und Godot setzt je nach Sprache den Text ein. Texte in Menüs und Knöpfen holt Godot mit tr("UI\_MENU\_CONTINUE") aus derselben CSV, also keine festen Strings in Szenen.

Eigennamen-Glossar: Sprechende Namen werden nicht wörtlich übersetzt, sondern bekommen eine englische Entsprechung mit demselben Witz. Die Liste wächst mit jeder Welt; Claude hält sie beim Übersetzen ein.

| Deutsch | Englisch | Hinweis |
| --- | --- | --- |
| Type 405 | Type 405 | bleibt, Fehlercode-Witz funktioniert in beiden Sprachen |
| Herr Vier | Mr. Four | Zahl bleibt, Anrede wechselt |
| Tiertort | Paw and Order | Serienparodie, andere Vorlage mit gleichem Effekt |
| Schwurbelstein | Waffleton | Klang eines Ortsnamens plus Geschwafel |
| Unterbrösel | Lower Crumbly | englisches Dorfnamensmuster |
| Hoggelwarz | Hogwartle | erkennbar, aber verfremdet |
| Zapp-O-Mat | Zap-O-Matic | Werbesprech der 60er |
| M.U.T.T.I. | M.O.T.H.E.R. | Abkürzung neu ausschreiben |
| Modell 08/15 | Model 08/15 | bleibt; Pixel erklärt den Ausdruck einmal in einer Ansehen-Zeile |
| Dr. Werbepause | Dr. Adbreak | Titel bleibt |
| Pfote (Hilfe) | Paw | UI-Begriff |
| Moderwort | Lord Mouldword | erkennbar, aber verfremdet |

**Zeilenarten:**

| Art | Wann | Umfang |
| --- | --- | --- |
| Szene | Zwischensequenzen und Story-Momente | Fest, wird zuerst geschrieben |
| Gespräch | Dialogbäume mit Auswahl, je Option eine Antwort | Pro Figur ein Baum, drei bis sechs Optionen |
| Ansehen | Rechtsklick auf Hotspot oder Gegenstand | Jeder Hotspot eine Zeile von Max, etwa jeder dritte zusätzlich Pixel |
| Benutzen | Benutzen oder Nehmen in der Welt | Jeder Hotspot mit Funktion; sonst Ersatzzeile |
| Kombinieren | Gegenstand auf Gegenstand oder Hotspot | Alle Lösungen, dazu die naheliegenden Fehlversuche |
| Ersatz | Nichts Spezielles passt | Ein Pool von 25 Zeilen pro Figur, zufällig gezogen, nie zweimal hintereinander |
| Hinweis | Pixels Hilfeknopf | Drei Zeilen pro Rätsel, siehe Hinweissystem |
| Zuruf | Pixel kommentiert ungefragt, wenn der Spieler eine Weile nichts tut | Zwei bis drei pro Raum |
| Pixel auf Mensch | Pixel wird als Gegenstand auf eine Figur oder einen Gegenstand gezogen | Eine Zeile je Figur; auf Gegenständen eine Schnuppern-Zeile; 40 bis 60 Zeilen je Welt |

**Schreibregeln:**

- Höchstens drei Textzeilen pro Sprechblase, also etwa 120 Zeichen; längerer Text wird an Satzgrenzen automatisch auf Folgeblasen derselben ID verteilt. Drei kurze Zeilen lesen sich bei 320×180 besser als zwei lange, weil die Blase schmal bleibt und die Figur nicht verdeckt.
- Pixels Kaskaden (eine Pointe, die sich über mehrere Blasen steigert) stehen als eine Zeile mit „//“ als Blasentrenner; der Spieler klickt sich durch, die Vertonung bekommt je Blase eine eigene Datei (siehe `04-audio.md`). Dieselbe feste Trennung darf jede Figur nutzen, wenn eine Satzgrenze den Witz zerstören würde (etwa Ciceros Rede „ohne Punkt ohne Komma“). Ein einzelner Satz ohne „//“ hat höchstens 120 Zeichen (`tools/pruefen.py` warnt).
- Max spricht kurz, trocken, mit Serien-, Streaming- und Handy-Vergleichen; Pixel lang, hochnäsig, mit Essen und Schlafplätzen (Tabelle „Max' Stimme“ im Konzept).
- Max erklärt nie die Vorlage, und jede Anspielung funktioniert auch ohne sie. Retro-Witze gehören Pixel oder Opa.
- Ein Fehlversuch darf nie wie eine Belohnung für Raten wirken, aber er soll lustig sein. Naheliegende falsche Kombinationen bekommen eine eigene Zeile.
- Jede Zeile, die eine Lösung andeutet, steht so im Skript, dass das Hinweissystem darauf aufbauen kann.

**Umfang:** Laut `04-audio.md` etwa 3.000 bis 4.000 Zeilen. Als Budget: Prolog 170, jede Welt 700 bis 850, Zwischenspiele 170, Finale und Abspann 280, Menüs und Systemtexte 150. Die Budgets für Zwischenspiele und Finale sind am 9. November 2026 an die Skript-Entwürfe angeglichen (168 und 276 Zeilen); die Welt-Entwürfe liegen noch darüber (siehe `offene-punkte.md`, P5). Die Pixel-auf-Mensch-Zeilen stecken im Budget der Welten.

**Ablauf pro Raum:**

1. Claude legt aus den Rätseltabellen die Szenen- und Pflichtzeilen an.
2. Claude ergänzt Ansehen-, Benutzen- und Kombinieren-Zeilen für alle Hotspots aus der Grafik-Datei der Welt.
3. Du kürzt und markierst Lieblingszeilen; nur was du freigibst, wird final.
4. Der Raum wird mit Platzhaltergrafik gespielt; Zeilen, die beim Spielen nicht zünden, fliegen raus.

Als Muster steht das ganze Prolog-Skript in `skript/prolog.md`, einschließlich der Gesprächsbäume von Opa und Pixel, der Zurufe und der Ersatzzeilen-Pools.

## Schrift

Empfehlung: **Monogram Extended** für Sprechblasen, Inventar und Menüs, **Pixelify Sans** nur für Titel und große Überschriften. Beide sind kostenlos und kommerziell nutzbar. Ob ß und die deutschen Anführungszeichen enthalten sind, steht auf keiner Seite; das prüft der Test unten vor der Festlegung.

| Schrift | Lizenz | Nennung nötig | Deutsch | Einsatz |
| --- | --- | --- | --- | --- |
| [Monogram Extended](https://datagoblin.itch.io/monogram) | CC0 | Nein | Laut [Devlog](https://datagoblin.itch.io/monogram/devlog/30375/monogram-extended-is-out) unterstützt; nur die Extended-Datei, nicht die Basisdatei | Erste Wahl für Text im Spiel |
| [m5x7](https://managore.itch.io/m5x7) | CC0, Nennung erwünscht | Nein | „Viele Akzentbuchstaben“, Umlaute nicht einzeln genannt | Ersatz, falls Monogram im Test durchfällt |
| [Pixelify Sans](https://fontsource.org/fonts/pixelify-sans/about) | OFL 1.1 | Lizenztext muss mitgeliefert werden | Deutsch ausdrücklich gelistet | Titel, Hauptmenü, Kapitelkarten |
| [m6x11](https://managore.itch.io/m6x11) | Frei mit Namensnennung | Ja | Nicht angegeben | Nur, falls mehr Platz pro Zeile nötig ist |
| [Silver](https://poppyworks.itch.io/silver) | CC BY 4.0, ab 100.000 $ Budget oder Umsatz Lizenz anfragen | Ja | Mehrsprachig, Details nicht geprüft | Nur für spätere Übersetzungen mit anderen Schriftsystemen |

Lizenzen gelesen am 6. November 2026 auf den verlinkten Seiten.

**Größe:** Text wird in der Spielauflösung 320×180 gesetzt, genau wie die Grafik, und mit ihr 6-fach skaliert. Bei einer etwa 7 Pixel hohen Schrift passen rund 40 Zeichen in eine Zeile, wenn die Sprechblase höchstens 240 Pixel breit bleibt; bei drei Zeilen sind das rund 120 Zeichen. Entschieden am 8. November 2026: Text bleibt in Spielauflösung, weil er so zur Pixelgrafik passt. Wird das im Test schlecht lesbar, gibt es eine Option „Große Schrift“, die Text auf einer eigenen Ebene in doppelter Auflösung zeichnet.

**Einstellungen in Godot:** Schrift ohne Kantenglättung importieren (Antialiasing aus, Hinting aus, Subpixel aus) und nur in ganzzahligen Vielfachen der Grundgröße verwenden. Sprechblasen bekommen einen dunklen Rand (#262b44 aus Endesga 32), damit Text auf jedem Hintergrund lesbar bleibt. Jede Figur hat eine eigene Textfarbe aus der Palette: Max weiß, Pixel türkis wie seine Halsband-Leuchte, Opa orange.

**Test vor der Entscheidung:** Diesen Satz in jeder Kandidatin in Godot bei Originalgröße setzen und auf drei Hintergründen ansehen (Dachboden, Zauberwald, Neonstadt):

> „Größer als Ostern.“ Äpfel, Öl, Übermut – Straße, Zapp-O-Mat 3000, 20:15 Uhr… Weißt du’s? Ja! (5 %)

Die Lizenzdateien aller verwendeten Schriften kommen in den Ordner `licenses/` und in den Abspann.

## UI

Die Steuerung ist eine Zwei-Klick-Steuerung ohne Verbenleiste: Linksklick tut das Naheliegende, Rechtsklick sieht an. Das passt zu den fünf geplanten Mauszeigern und lässt bei 180 Pixeln Höhe das ganze Bild für die Szene frei. Grundlage ist die Popochiu-Vorlage „Simple Click“, die Claude anpasst.

**Steuerung:**

| Eingabe | Wirkung |
| --- | --- |
| Linksklick auf Boden | Gehen; Doppelklick auf einen Ausgang wechselt sofort den Raum |
| Linksklick auf Hotspot | Benutzen, Nehmen oder Reden, je nach Objekt; der Zeiger zeigt vorher, was passiert |
| Rechtsklick | Ansehen |
| Gegenstand im Inventar anklicken, dann Ziel | Kombinieren oder Benutzen mit; Rechtsklick legt ihn zurück |
| Umschalt/Shift (halten) | Zeigt alle Hotspots im Raum als kleine Punkte |
| Tab oder Klick aufs Porträt | Wechsel zwischen Max und Pixel (ab Welt 1) |
| Linksklick, Leertaste oder Eingabetaste während Text | Text weiter: überspringt die aktuelle Zeile (Tasten in den Optionen umlegbar) |
| Esc | Überspringt eine Zwischensequenz, sonst Pausemenü |
| F5 / F9 | Schnellspeichern / Schnellladen |

**Bildschirmaufbau (320×180):**

| Element | Ort | Verhalten |
| --- | --- | --- |
| Inventarleiste | Oben, 32 Pixel hoch, acht Plätze für 24×24-Symbole | Klappt ein, sobald die Maus den oberen Rand verlässt; Pfeile blättern bei mehr als acht Gegenständen |
| Porträts von Max und Pixel | Oben links, 24×24 | Immer sichtbar; die aktive Figur ist hell, die andere grau |
| Hilfe-Pfote | Oben rechts, 24×24 | Immer sichtbar; leuchtet sanft, wenn ein neuer Hinweis bereitliegt |
| Objektname | Unter dem Zeiger, eine Zeile | Zeigt beim Überfahren den Namen, beim Kombinieren „Thunfischdose mit Pixel“ |
| Sprechblasen | Über der sprechenden Figur | Rand und Farbe je Figur (siehe Schrift) |
| Dialogauswahl | Unten, bis zu vier Zeilen | Mausrad oder Pfeile bei mehr Optionen; gelesene Optionen werden grau |
| Sonder-Leisten | Je nach Welt | Fernbedienung (Welt 4) und Code-Sicht (Welt 3) erscheinen nur dort, unten rechts; in Gesprächen ist die Fernbedienungs-Leiste ausgegraut, außer im Gespräch mit dem Kommissar (Rätsel Welt 4, Gäste zwischen den Sendern) |

Mockup: Bevor Claude die UI baut, entsteht ein Bild in 320×180 mit allen Elementen aus dieser Tabelle auf dem Dachboden-Hintergrund, mit Inventarleiste, Sprechblase mit drei Zeilen und Dialogauswahl. Sebastian gibt das Bild frei, danach erst Code.

**Bildschirme und Menüs:**

| Bildschirm | Inhalt |
| --- | --- |
| Hauptmenü | Titelbild mit Zapp-O-Mat; Fortsetzen (lädt den neuesten Stand), Neues Spiel, Laden, Optionen, Beenden. Die Menüpunkte sind Fernsehkanäle, der Drehknopf wählt |
| Pausemenü (Esc) | Weiterspielen, Speichern, Laden, Optionen, Hauptmenü |
| Speichern und Laden | Zwölf Plätze mit Vorschaubild, Ort, Welt, Spielzeit und Datum, dazu Autospeicher und Schnellspeicher (siehe Speichern) |
| Notizbuch | Öffnet sich aus dem Inventar, immer auf Seite 1. Seite 1: aktuelle Ziele, die das Hinweissystem mitpflegt. Seite 2: gesammelte Regeln und Passwort-Teile. Seite 3: Pixels Einkaufsliste als Running Gag, je Welt ein neuer Wunsch (Konzept, Running Gags) |
| Nahansicht | Überlagerung in 320×180 mit Rahmen und Schließen-Knopf oben rechts; zeigt Objekte, deren Text in der Szene zu klein wäre. Die Liste der Objekte steht je Welt in der Grafik-Datei (Zeile „Nahansichten“). Das Notizbuch trägt Regeln und Passwort-Teile erst nach dem Öffnen der Nahansicht ein |
| Programmzeitschrift (Welt 4) | Eigene Überlagerung wie eine Nahansicht, eine aufgeschlagene Doppelseite ohne Blättern: links die Zeitleiste mit fünf Senderspalten, jede Sendung ein klickbares Feld (Klick springt zur Sendezeit); rechts sechs Detailkästen mit Bild und Titel (darunter die 20:15-Folge, das Mitternachtsvideo und Dr. Werbepauses Spot); gefundene Kanäle werden angekreuzt; nach dem Fund steht auch Kanal 999 darin, und ein Klick führt in den Empfang. Dieser Aufbau ist verbindlich für Rätsel Welt 4 und Grafik Welt 4 |
| Reisetasche | Vor jeder Welt: zwei Wahlfächer, ein Pflichtfach; Pixel kommentiert beim Berühren jedes Gegenstands |
| Optionen | Siehe unten |

**Optionen:**

- Lautstärke getrennt für Musik, Geräusche und Stimmen
- Textgeschwindigkeit und „Text weiter per Klick“ oder automatisch
- Untertitel an oder aus (sobald es Stimmen gibt); Liedtexte haben immer Untertitel, kursiv mit Notenzeichen, bei den drei Rätsel-Liedern auch dann, wenn Untertitel aus sind (`04-audio.md`)
- Sprache Deutsch oder Englisch
- Große Schrift, Hotspots dauerhaft hervorheben, Bildschirmwackeln aus
- Vollbild oder Fenster, Fenstergröße in ganzzahligen Stufen
- Farbenblind-Hilfe: Farbcodes bekommen zusätzlich Symbole (Kreis, Dreieck, Quadrat), siehe Welt 3
- Flackern reduzieren: ersetzt Lampenflackern und Umschalt-Störungen durch weiche Varianten; ein Epilepsie-Hinweis erscheint beim ersten Start
- Tastenbelegung änderbar, dazu eine Taste „Text weiter“ (Standard Leertaste, Eingabetaste geht auch; Linksklick geht immer). Die Hotspot-Anzeige liegt auf Umschalt/Shift (halten), damit keine Taste doppelt belegt ist

Steam-Tags für Barrierefreiheit, die das Spiel damit erfüllt: Untertitel, anpassbare Textgröße, Farbenblind-Modus, Tastenbelegung anpassbar, Steuerung nur mit der Maus, kein Zeitdruck. Die Liste wird vor der Store-Seite gegen Steams aktuelle Barrierefreiheits-Felder geprüft.

**Später für Steam Deck und Controller:** Der Stick bewegt einen Zeiger, der an Hotspots einrastet; A wie Linksklick, B wie Rechtsklick, Schultertasten wechseln Figur und Inventar. Das plant Claude im Grundgerüst mit ein, baut es aber erst nach dem Vertical Slice.

## Hinweissystem

Die Hilfe-Pfote gibt zu jedem offenen Rätselschritt drei Hinweise, vom Stups bis zur Lösung, wie in `raetsel/prolog-und-welt-1.md` beschrieben. Neu festgelegt ist hier, *welchen* Schritt Pixel wählt, wie lange er wartet und wie die Hinweise gespeichert werden. Das Notizbuch nutzt dieselben Daten für die Zielliste.

**Welcher Schritt drankommt:**

1. Jedes Rätsel ist in Schritte geteilt, so wie in den Rätseltabellen (a), (b), (c). Ein Schritt ist gesperrt, offen oder gelöst; offen ist er, sobald seine Voraussetzungen erfüllt sind.
2. Hat der Spieler im Notizbuch auf Seite 1 ein Ziel angeklickt, nimmt Pixel diesen Schritt, solange er offen ist.
3. Sonst nimmt er den offenen Schritt, mit dessen Hotspots oder Gegenständen der Spieler zuletzt etwas gemacht hat.
4. Gibt es keinen solchen, nimmt er den offenen Schritt mit der kleinsten Rätselnummer.
5. Ist nichts offen, sagt Pixel, wohin es weitergeht („Da ist ein Ausgang. Ausgänge sind zum Benutzen da.“).

**Stufen und Wartezeit:** Jeder Schritt merkt sich seine erreichte Stufe, auch über Speichern hinweg. Ein erneuter Klick wiederholt den letzten Hinweis. Die nächste Stufe gibt es erst nach 30 Sekunden (Stufe 2) bzw. 60 Sekunden (Stufe 3) seit dem letzten Hinweis; vorher sagt Pixel eine Wartezeile („Ich denke noch nach. Das sieht aus wie Schlafen, ist es aber nicht.“). Die Pfote leuchtet sanft, sobald die nächste Stufe bereitliegt.

**Wer hilft wann:** Im Prolog schläft Pixel bis P1, also gibt Opa die Hinweise zu P1 über Reden; die Pfote ist bis dahin ausgegraut. In den Zwischenspielen ist kein Schritt offen; die Pfote sagt dort nur ZS1\_HINT\_PIX\_0010. In Welt 3 hängt der Weg von der Ebene ab: In der Realität steht Pixel neben Max und spricht normal. In der Simulation hört Max ihn, sobald Kabel-Kalle ihn beim ersten Aufwachen „auf die Leitung“ gelegt hat, aus dem Hörer der nächsten Telefonzelle oder aus Omas Wandtelefon; vorher und im Büroturm (Rätsel 7) gibt es nur das Terminal mit Miau-Morse, das Kalle übersetzt. Im Labor spricht Pixel aus M.U.T.T.I.s Lautsprecher, den Kalle angezapft hat. In Welt 4 meldet er sich aus dem Rauschen. Die Pfote funktioniert also überall, nur ihr Ausgabeweg wechselt.

**Nachsicht bei Minispielen:** Kein Minispiel kann den Spieler aufhalten. Nach zwei Fehlversuchen bietet eine Figur an, das Minispiel als bestanden zu werten (Welt 2: Ramses wertet „großzügig“, Welt 4: Flimmer schaltet die Zombies ab). Wer annimmt, kommt weiter; nur Errungenschaften, die eine Bestleistung verlangen, entfallen. Wer ablehnt, spielt weiter. Die Minispiele sind Archimedes' Hebel und das Rede-Ringen (Welt 2) und das Zombie-Video (Welt 4); Wortlaut und Ablauf stehen in den Rätsel-Dateien.

**Zählung:** Pro Welt wird gezählt, wie oft Stufe 3 genutzt wurde. Bei null gibt Pixel am Ende der Welt widerwillig zu, beeindruckt zu sein. Für eine Steam-Errungenschaft reicht derselbe Zähler.

Errungenschaften (Steam): 13 Stück, alle aus Zählern und Schaltern, die das Spiel ohnehin speichert. Keine verlangt Zeitdruck oder Raten.

- Ohne Pfote, Welt 1 bis 4 (vier Stück): keine Stufe 3 in der jeweiligen Welt
- Empfang: Prolog beendet, der Fernseher läuft
- Ziegenflüsterer: alle drei Ziegen über die Brücke
- Fünfkampf: alle fünf Disziplinen in Welt 2 mit Bestleistung (Definition in `raetsel/welt-2.md`)
- Déjà-vu: Simulation in Welt 3 zum dritten Mal betreten
- Freund 08/15: Modell 08/15 als Freund gewonnen
- Zapp-Meister: alle Kanäle der Programmzeitschrift gefunden
- Einkaufsliste komplett: alle Wünsche Pixels im Notizbuch
- Welt gerettet: Finale gesehen
- Neugier: alle Nahansichten des Spiels geöffnet

**Datenformat:** Eine Datei pro Welt, etwa `hints_w1.tres`, mit einem Eintrag pro Schritt:

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
- Claude schreibt einen automatischen Test, der im Vertical Slice nach jedem gelösten Schritt speichert, lädt und prüft, dass nichts fehlt.

## Offene Entscheidungen

- [ ] Schrift festlegen nach dem Umlaut-Test (Monogram Extended oder m5x7)
- [x] Text in Spielauflösung lassen oder gleich die Ebene in doppelter Auflösung bauen: entschieden am 8. November 2026, Text bleibt in Spielauflösung; die Ebene in doppelter Auflösung kommt nur als Option „Große Schrift“.
- [ ] Wartezeiten der Hinweise (30 und 60 Sekunden) nach dem ersten Test mit Fremden anpassen
- [ ] Zwei-Klick-Steuerung bestätigen oder doch eine Verbenleiste
- [ ] Prüfen, ob das gemeinsame Zustandssystem für Code-Sicht und Fernbedienung (Produktion, System 1) dieselben Schalter wie Speichern und Hinweise nutzt; das wäre die einfachste Lösung
