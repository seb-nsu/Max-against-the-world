# Rätsel: Welt 2, Antikodonien

Welt 2 hat 11 Rätsel und zwei Fünfkampf-Minispiele (die anderen drei Disziplinen sind Szenen). Vier Rätsel sind schwer, doppelt so viele wie in Welt 1. Neu sind Logik-, Sprach- und Physikrätsel sowie knappe Gegenstände, die man klug einsetzen muss.

## Neue Mechaniken

**Pixel, der Katzengott:** In Ägypten wird Pixel als Gott verehrt. Dort gehorchen ihm alle Ägypter, während Griechen und Römer ihn für eine gewöhnliche Katze halten. Der Spieler muss also überlegen, *wo* Pixel welche Macht hat. Pixel genießt das sehr und will danach nie wieder Dosenfutter.

**Wunderdinge aus der Gegenwart:** Max hat ein paar moderne Dinge in den Taschen. Die Antike hält sie für Wunder, aber jedes lässt sich nur einmal einsetzen.

| Wunderding | Wirkung in der Antike |
| --- | --- |
| Handy mit 3 % Akku | Taschenlampe, Fotoapparat oder Musik, aber nur eine Nutzung |
| Kaugummi | Gilt als „ewiges Brot“ |
| Kugelschreiber | Schreibt ohne Tintenfass, Beamte sind fassungslos |
| Leere Thunfischdose | Glänzt wie Silber, Pixel hängt sentimental daran |

Verbraucht werden sie so: der Kaugummi im Götter-Duell (2b) oder bei Nebet (4), der Kugelschreiber beim selbst geschriebenen Rundschreiben (3a, Weg A; danach ist die Mine leer), das Handy als Taschenlampe am Ende der Parade (11, nur Bonus). Als Lösungswort für die Sphinx (8) wird keins verbraucht. Die Thunfischdose wird nur vorgezeigt und nie verbraucht.

**Die Zeitfähre:** Die Krokodil-Fähre fährt durch den verknoteten Zeitstrom. Flussaufwärts liegt das ältere Reich (Ägypten), flussabwärts Griechenland mit zwei Anlegestellen: Olympia und, ganz am Ende, Syrakus. Jede Strecke hat eine feste Zahl an Jahren: Ägypten bis Olympia 112, Olympia bis Syrakus 25. Es altert aber nicht alles: Nur Dinge mit Sanduhr-Symbol im Inventar reisen mit der Zeit, also Getränke, die gären (Traubensaft, Wein, Essig in ihren Krügen), Pflanzen mit Wurzel (wachsen) und Stein (verwittert). Sie werden flussabwärts älter und flussaufwärts wieder jünger. Alles andere ist „aus dem Zeitstrom gefallen“ und bleibt, wie es ist: Handy, Kaugummi, Kugelschreiber, Startpass, Olivenöl, Diskus, gepflückte Früchte. Die Tafel am Fährsteg sagt es in drei Zeilen: „Was wächst, gärt oder verwittert, reist mit der Zeit. Was du selbst pflückst, bleibt. Der Rest ist der Zeit egal.“ Mehrere Rätsel verlangen deshalb, Dinge gezielt zwischen den Epochen hin und her zu fahren. Während der Fahrt zeigt das Inventar sichtbar, wie Dinge altern oder jünger werden, und eine Sanduhr am Fährsteg zeigt die Richtung an; so versteht man die Regel ohne Erklärung.

| Mitgenommen | Flussabwärts (älter) | Flussaufwärts (jünger) |
| --- | --- | --- |
| Traubensaft | Wein, zu weit gefahren: Essig | Essig wird wieder Wein, Wein wieder Traubensaft; bis zu Trauben reicht kein Krug zurück (siehe Schwellen unten) |
| Frischer Grabstein | Olympia (112 Jahre): grau, Kanten bestoßen, feine Risse, noch kein Moos; Syrakus (137 Jahre): verwittert und moosbewachsen | Wieder grau in Olympia, wieder frisch im Nil-Delta; gemeißelt wird nur dort, jünger als frisch wird er also nie |
| Feigensetzling im Topf | Feigenbaum mit reifen Früchten (jede Fahrt flussabwärts, auch aus dem Kern) | Ein einzelner Feigenkern |
| Alles ohne Sanduhr (Handy, Kaugummi, Kugelschreiber, Startpass, Olivenöl, Diskus, gepflückte Feigen) | Unverändert | Unverändert |

**Regel gegen Sackgassen:** Jedes Rätsel, für das ein Wunderding gedacht ist, hat einen zweiten, aufwändigeren Lösungsweg. Wer ein Wunderding „falsch“ ausgibt, bleibt nie hängen, er muss nur mehr tun. Wer klug spart, bekommt am Ende einen Bonus-Gag bei der Siegesparade: Wer Handy, Kaugummi und Kugelschreiber bis zur Parade behält, wird von Pixel widerwillig gelobt. Ein Zurücksetzen ausgegebener Wunderdinge gibt es nicht; die Zeitfähre lässt sie ohnehin unverändert (kein Sanduhr-Symbol).

## Wegeplan

Welt 2 hat drei Anlegestellen und elf Räume; jeder Raum liegt höchstens zwei Wege von seiner Anlegestelle entfernt, und jeder Weg führt auch zurück. Die Fähre verbindet die drei Anlegestellen in beide Richtungen, auch direkt von Ägypten nach Syrakus. Raum-IDs, Ausgänge und Freischaltung stehen verbindlich in der Welt-Tabelle (`welten/welt-2.yaml`); diese Tabelle beschreibt sie.

| Ort | Räume | erreichbar ab | Ausgänge | Rätsel |
| --- | --- | --- | --- | --- |
| Ägypten, Anlegestelle | Nil-Delta mit Fährsteg | Start der Welt | Fähre am Stegende (Flusskarte) zum Fährsteg Olympia und zum Hafen Syrakus; Sandweg am rechten Bildrand zum Thronsaal; Dünenpfad hinten rechts zur Sphinx | 1; 10a (Stein meißeln); Papyrusblatt im Schilf (3a, Weg B); Opas Papyrus beim ersten Betreten nach der ersten Fährfahrt |
| Ägypten, Palast | Thronsaal, Palastküche | Start, zu Fuß über den Sandweg | Thronsaal: Eingang links zum Nil-Delta, Tür rechts zur Palastküche; Palastküche: Tür links zum Thronsaal | 2a, 2b, 4; Pharaonenteller (7); Traubensaft (11b, falsche Fährte); Fächerwedler bestechen (6b, freiwillig) |
| Ägypten, Wüste | Sphinx | Start, zu Fuß über den Dünenpfad | Weg links zum Nil-Delta | 8; Verdächtige Sphinx (7) |
| Olympia, Anlegestelle | Fährsteg Olympia | Fähre (1) | Fähre am Stegende zum Nil-Delta und zum Hafen Syrakus; Steinweg rechts zur Agora | – |
| Olympia, Stadt | Agora (640×180), Startbüro | Fähre (1), zu Fuß vom Fährsteg Olympia | Agora: Weg rechts zum Fährsteg Olympia, Bogen links zum Stadion, Tür in der Säulenhalle zum Startbüro; Startbüro: Tür links zur Agora | 3, 6a, 9; Tiro (7); Sandalen von Hermes im Startbüro (nach 3) |
| Olympia, Stadion | Stadion | Fähre (1), zu Fuß über die Agora | Weg links zur Agora | Wettkampftag 1; 7 (Leonidas, Hermes); Finaltag; 11a, 11b |
| Syrakus | Hafen Syrakus, Archimedes' Werkstatt, Grabhügel Syrakus | Fähre (1) | Hafen Syrakus: Fähre am Steg links zum Nil-Delta und zum Fährsteg Olympia, Gasse rechts zur Werkstatt, Pfad im Hintergrund zum Grabhügel; Archimedes' Werkstatt: Tür rechts zum Hafen; Grabhügel Syrakus: Weg links zum Hafen | 5, 10b; Tintenfisch in den Netzen (3a, Weg B); Brennspiegel und Essigkrug in der Werkstatt (2b, 11a, 11b); Feigen reifen auf der Fahrt hierher (6b) |

**Wege zu Fuß und mit der Fähre:** Wer einen Ausgang benutzt, kommt im nächsten Raum an dem Ausgang an, der zurückführt. Die Fähre liegt immer an dem Steg, an dem Max zuletzt ausgestiegen ist; da er die Epochen nur mit ihr wechselt, steht sie immer bereit. Die Flusskarte bietet von jedem Steg beide anderen Anlegestellen an. Die Fahrt Ägypten–Syrakus geht ohne Halt durch, ihre Jahre zählen zusammen (112 + 25 = 137), und das Inventar zeigt beide Etappen nacheinander. Ramses' Reisen zu den Wettkampftagen sind Zwischenszenen und belegen die Fähre nicht.

**Vor der Fähre:** Palast und Sphinx sind von Anfang an zu Fuß erreichbar. Was sich dort schon vor Rätsel 1 lösen lässt (Hieroglyphen-Botschaft 2a, Öl gegen Kaugummi oder Fladen, mit drei Handy-Bausteinen sogar die Sphinx), darf der Spieler vorziehen; der Normalweg im Abhängigkeitsdiagramm bleibt „Fähre zuerst“. Das Götter-Duell (2b) braucht Sobek als Gefolge und geht erst nach der Fähre.

**Zeitrechnung der Fähre:** Stein und Getränke mit Sanduhr-Symbol haben ein Alter, das nur von der Anlegestelle abhängt: Flussabwärts zählt die Fähre die Jahre der Strecke dazu, flussaufwärts zieht sie sie ab. Jeder Umweg führt deshalb zum selben Ergebnis. Gespeichert wird nur, an welchem Steg die Fähre liegt (Wert `W2_FAEHRE_STEG`); das Alter jedes Steins und Krugs ergibt sich daraus. Pflanzen sind einfacher: Jede Fahrt flussabwärts macht aus Setzling oder Kern den Feigenbaum mit Früchten, jede Fahrt flussaufwärts macht daraus einen Kern (Wert `W2_FEIGE_ZUSTAND`).

| Ding | Ägypten | Olympia | Syrakus |
| --- | --- | --- | --- |
| Grabstein, im Nil-Delta gemeißelt (nur dort gibt es einen Steinmetz) | frisch und weiß (0 Jahre) | grau, Kanten bestoßen, feine Risse, kein Moos (112 Jahre) | verwittert und moosbewachsen (137 Jahre): Lösung Rätsel 10b |
| Traubensaft aus der Palastküche | Traubensaft | Essig (112 Jahre) | Essig |
| Essigkrug aus der Werkstatt (120 Jahre alt) | Traubensaft | Wein: Lösung Rätsel 11b | Essig |

Schwellen für Getränke, gerechnet ab dem Pressen: Trauben unter −20 Jahren, Traubensaft von −20 bis 49, Wein von 50 bis 99, Essig ab 100 Jahren. Damit stimmen alle Zeilen der Tabelle und des Skripts. Das jüngste mögliche Alter ist −17 (Essigkrug im Nil-Delta); Trauben kommen im Spiel also nie vor und brauchen kein Bild. Während einer Fahrt zeigt das Inventar jede Schwelle, die der Krug überschreitet: Der Traubensaft aus dem Palast wird auf dem Weg nach Olympia kurz Wein und dann Essig.

## Abhängigkeitsdiagramm

Die verbindlichen Abhängigkeiten stehen in der Welt-Tabelle (`welten/welt-2.yaml`, Feld `benoetigt`); Diagramm: [Rätsel-Abhängigkeiten](abhaengigkeiten.md). Kurzform des Normalwegs:

- Start: 1 (Fähre), 2a (Hieroglyphen), 4 (Öl, freiwillig), 8 (Sphinx) sind sofort möglich; 2b (Götter-Duell) nach 1.
- 2a und 2b ergeben die Audienz, danach 3a (Rundschreiben) und 3b (Startpass); 3b geht auch ohne 3a mit dem Empfehlungsschreiben der Sphinx (8). 5 (Krone) nach 1.
- Wettkampftag 1 nach 3b und 5. Danach 6a (Sandale, freiwillig), 7 (Diskus), 10a (Grabstein, braucht auch 5).
- 6b (Feigen, freiwillig, nur vor dem Finaltag) nach 6a, 9 (Konter) nach 8, 10b (Alter) nach 10a.
- Finaltag nach 7 (Diskus oder Ersatz), 9 und 10b; 6b verbessert nur den Speer. Danach 11a (Paraden-Plan) und 11b (Wein), dann der Goldene Sack Pharaonenkorn.

Nach der Fähre sind vier Rätsel gleichzeitig offen: Hieroglyphen, Olivenöl, Archimedes und die Sphinx. Die Wettkampftage geben nur grobe Etappen vor; dazwischen fährt Max frei zwischen den Epochen hin und her. Die Zeitfähre selbst ist Teil der Lösung bei 6b (Feigen), 10b (Alter des Grabsteins) und 11b (Wein).

## Die Rätsel von Welt 2

Max landet im Nil-Delta. Die Orte (Ägypten, Olympia mit Stadion und Agora, Syrakus) verbindet eine Krokodil-Fähre durch den verknoteten Zeitstrom. Rom gibt es nicht als eigenen Ort; die Römer kommen als Touristengruppe nach Olympia, angeführt von Cicero, der zu Studienzwecken in Griechenland weilt. Die zwei Wettkampftage sind feste Etappen: Tag 1 beginnt, sobald Rätsel 3 (Startpass) und 5 (Hebel) gelöst sind und Max die Startlinie im Stadion benutzt; Rätsel 4 (Öl) ist freiwillig und verbessert nur den Lauf. Der Finaltag beginnt, sobald Rätsel 7 (Diskus oder Ersatz), 9 und 10 gelöst sind und Max wieder die Startlinie benutzt; Rätsel 8 ist über 9 Pflicht. Rätsel 6 ist wie 4 freiwillig und verbessert nur den Speerwurf. Diese beiden Listen sind zugleich die Schalter für das Speichersystem (siehe Teilschritte und Schalter). Ramses reist zu beiden Wettkampftagen samt Hofstaat und Fächerwedlern per Fähre an.

| Nr. | Rätsel | Stufe | Lösung | Benötigt | Belohnung |
| --- | --- | --- | --- | --- | --- |
| 1 | **Die Krokodil-Fähre** | leicht | Der Fährmann will einen Obolus, den Max nicht hat. Aber das Krokodil, das die Fähre zieht, verneigt sich vor Pixel. Max lässt Pixel als Gott einsteigen und fährt als „heiliger Diener“ gratis mit. | – | Fähre zu allen Orten; die Katzengott-Mechanik ist eingeführt |
| 2 | **Die Hieroglyphen-Botschaft** | mittel | (2a) Ramses empfängt nur, wer ihm eine Botschaft in Hieroglyphen schickt, denn er kann nichts anderes lesen und ist zu eitel, das zuzugeben. Mit einer Bildtafel aus 16 Kacheln setzt Max vier Zeichen zu einem Satz zusammen. Der Zielsatz steht fest: „Diener der Katze bittet den Pharao um Gehör“, also Mann, Katze, Pharao, Ohr. Die Grammatik zeigt eine einzige Inschrift im Palast (Nahansicht): Wer handelt, steht zuerst, dann wem er dient, dann der Empfänger, zuletzt die Tat als Körperteil (Ohr für Gehör, Mund für Brot, Hand für Gold). Falsche Kombinationen ergeben lustige Sätze („Ich, Krokodil, will Brot vom Pharao“), die der Schreiber vorliest; so lernt der Spieler die Regel durch Ausprobieren. Die Lesung baut sich aus den Kachelnamen zusammen: „\[Feld 1\], Diener \[Feld 2\], bittet \[Feld 3\] um \[Feld 4\]“; in Feld 4 liest der Schreiber Ohr als Gehör, Mund als Brot, Hand als Gold, Auge als Blick und jedes andere Zeichen als „um … irgendwas“. (2b) Vor dem Thron wacht außerdem der Hofkater auf seinem Kissen, der Pixels Gottstatus anzweifelt. Pixel fordert ihn zum Götter-Duell: Wer mehr Verbeugungen bekommt, gewinnt. Ein echter Gott braucht drei Dinge: eine Opfergabe, ein Gefolge und ein Wunder. Max besorgt sie: die Thunfischdose aus dem Prolog als Opfergabe (nur vorgezeigt; Pixel nimmt sie danach zurück: „Der Gott behält seine Opfergabe. Göttliches Vorrecht.“), Sobek das Fährkrokodil als Gefolge (es kriecht Pixel bereitwillig hinterher) und als Wunder eine Kaugummiblase, die wie eine kleine Sonne schwebt. Wer den Kaugummi schon ausgegeben hat, holt stattdessen einen Lichtblitz aus Archimedes' Brennspiegel (ein kleiner Handspiegel, den Max in der Werkstatt in Syrakus mitnehmen darf). Der Hofkater hat nur Opfergabe (eine Schale Datteln) und Gefolge (die Fächerwedler) und zieht beleidigt ab. Sind 2a und 2b gelöst, folgt die Audienz. | 2a: –; 2b: Fähre (1) | Audienz; Ramses verlangt den Olympiasieg |
| 3 | **Der Passierschein** | schwer | In Olympia dürfen nur Griechen starten. Das Startbüro verlangt einen Bürgerschein, das Bürgerbüro einen Startpass, eine Endlosschleife (*Asterix erobert Rom*). Hermes kommt wie immer zu spät vorbei und meldet fröhlich: „Dein Startpass ist in einem anderen Büro.“ An der Bürowand hängt ein vergilbter Aushang: Jedes neue Rundschreiben gilt sofort und über allen anderen Vorschriften. (3a, Das neue Rundschreiben) Max durchschaut die Schleife: Er verfasst mit dem Kugelschreiber auf einem leeren Formular aus dem Formularberg ein „neues Rundschreiben“, das einen Passierschein verlangt, den es nicht gibt (Weg A; danach ist der Kugelschreiber verbraucht). Gibt er es am Schalter ab (3b), geraten die Beamten in Panik und stellen ihm alles aus, nur damit er geht. Ohne Kugelschreiber geht es auch (Weg B), dann muss Max Tinte aus dem Tintenfisch in den Fischernetzen am Hafen von Syrakus (im Inventar „Tintenfass“) und ein Papyrusblatt aus dem Schilf im Nil-Delta besorgen und schreibt mit dem Finger. Wer die Sortierende Socke aus Welt 1 dabeihat (Weg D), lässt sie den Formularberg sortieren und findet die Lücke schneller: Die Socke fördert ein fertiges, nie abgegebenes Rundschreiben zutage („Startpass nur gegen Passierschein A38“), das Max nur noch abgeben muss. Weg C ohne Schleife: Wer die Sphinx (8) schon gelöst hat, bekommt von ihr auf Nachfrage ein Empfehlungsschreiben in Rätselform. Damit überspringt Max 3a und gibt in 3b gleich das Empfehlungsschreiben ab; die Beamten verstehen es nicht und stempeln lieber alles ab, als nachzufragen. Gleich nach dem Startpass kommt Hermes ins Büro und leiht Max von sich aus seine geflügelten Sandalen; ohne sie kann Tag 1 nicht beginnen. | Audienz (2a und 2b) | **Startpass**, dann die **Geflügelten Sandalen** von Hermes |
| 4 | **Das Olivenöl** | leicht | Hermes leiht Max im Startbüro seine geflügelten Sandalen, sobald Max den Startpass hat (siehe 3); die Sandalen wollen aber davonfliegen. Köchin Nebet gibt einen ganzen Krug Olivenöl für die Riemen nur gegen ein neues Gericht für ihre Fusionsküche. Die Riemen brauchen einen Schluck; der Rest bleibt im Inventar und darf nach Welt 3 reisen (Hausmeister Modell 08/15). Max schenkt ihr Kaugummi als „ewiges Brot“, alternativ kocht er mit Pixels Anweisungen ein ägyptisches Rezept nach: Brot, Datteln und Zwiebeln vom Schneidetisch, erst Brot mit Datteln, dann Zwiebeln darauf, dann im Lehmofen gebacken, wie Pixel es ansagt (ein Fusions-Fladen; im Inventar „Fladen“ in den Stufen mit Datteln, roh und mit Kruste). Einen Schluck Öl auf die Sandalen geben, sobald Max sie hat. | – (geht schon vor der Fähre); die Sandalen gibt es erst nach dem Startpass (3) | **Olivenöl**, dann **Lauf an Tag 1** |
| 5 | **Archimedes' Krone** | mittel | König Hieron verdächtigt seinen Goldschmied des Betrugs. Max hat Waage, Messbecher, Badewanne, die Krone und einen Goldbarren gleichen Gewichts. Er muss erkennen, dass gleich schwere Dinge aus reinem Gold gleich viel Wasser verdrängen, und beide nacheinander eintauchen. Die Krone verdrängt mehr, sie ist gefälscht. Archimedes ruft „Heureka“ und rennt nackt hinaus. Danach folgt eine kurze Trainings-Szene ohne Rätsel: Archimedes lässt Max dreimal am Hebel üben, und Max beschwert sich jedes Mal weniger. Beim dritten Mal sagt er von selbst: „Noch mal.“ Pixel ist fassungslos. | Fähre (1) | Archimedes wird Trainer und baut den **Wurfhebel** |
| 6 | **Das Zeichen der Sandale** | mittel | Freiwillig wie Rätsel 4. (6a) Hermes' Sandalen reißen sich in jedem Fall los, mit Öl erst nach dem Ziel, ohne Öl gleich am Start. Eine davon landet auf der Agora von Olympia, wo eine Menge aus Griechen und römischen Touristen sie für ein heiliges Zeichen hält (*Das Leben des Brian*). Wer sie trägt, gilt als Messias. Brian, der bisher dafür gehalten wurde, hängt Max erleichtert sein Schild um und fährt endlich in den Urlaub. Pixel springt als Spielfigur auf die Säule mit dem Adler und angelt sie, Max zieht sie an, und die Menge überhäuft ihn mit Geschenken, darunter einen kleinen **Feigensetzling im Topf**; Brians Schild bleibt Max als Andenken. (6b) Die Fächerwedler wollen aber frische Feigen. Max fährt den Setzling mit der Zeitfähre flussabwärts nach Syrakus (jede Fahrt flussabwärts macht aus Setzling oder Kern den Baum mit Früchten): 25 Jahre später ist daraus ein ausgewachsener Feigenbaum im Topf mit prallen Früchten geworden. Max pflückt die Feigen und fährt zurück. Was Max selbst pflückt, ist aus dem Zeitstrom gefallen und altert auf der Fähre nicht mehr; nur der Baum selbst würde flussaufwärts wieder zum Kern. Was in einem Krug ist, gärt dagegen weiter, deshalb funktioniert das Wein-Rätsel der Parade. Beide Regeln stehen auf der Tafel am Fährsteg (siehe Die Zeitfähre); gepflückte Feigen tragen im Inventar kein Sanduhr-Symbol mehr. Beim ersten Pflücken trägt Max diese Regel ins Notizbuch ein, und Pixel kommentiert: „Obst mit Ablaufdatum. Wie im echten Leben, nur rückwärts.“ Damit besticht er die Fächerwedler für gleichmäßigen Wind; sie nehmen die Feigen im Thronsaal an (im Stadion stehen sie nur an den Wettkampftagen). Das geht, bis der Finaltag beginnt; ohne Bestechung dreht am Finaltag der Wind, der Speer landet im Kampfrichterzelt, und Max kommt trotzdem weiter, nur ohne Bestleistung im Speer. Ist alles für den Finaltag bereit und sind die Wedler nicht bestochen, erinnert Max beim ersten Benutzen der Startlinie daran; erst beim nächsten Benutzen beginnt der Finaltag. | Tag 1 | Feigen, dann **Treffer beim Speerwurf am Finaltag** (der Hebel aus 5 gehört schon zu Tag 1) |
| 7 | **Der Diskus-Diebstahl** | schwer | Gleich nach Tag 1 ist der offizielle Diskus weg. Leonidas meldet den Diebstahl lautstark, Ramses moderiert die Befragung; einen Kampfrichter als Figur gibt es nicht (das Zelt im Stadion bleibt Kulisse). Vier Verdächtige machen je zwei Aussagen; jeder lügt genau einmal (Logikrätsel). Wer kombiniert, entlarvt Ciceros Schreiber Tiro, der den Diskus als Unterlage für seine Kurzschrift braucht. Wer aufgibt, nimmt einen Ersatz (Pharaonenteller neben dem Thron; Schallplatte „Schlager für Erfinder, Folge 3“, die Opa in die Reisetasche geschmuggelt hat; Wurfscheibe, die seit dem Schulausflug in Max' Bauchtasche steckt; Schallplatte und Wurfscheibe findet Max beim Durchsuchen seiner Taschen nach Tag 1). Den Ersatz wählt Max bei Leonidas; auch damit ist 7 gelöst. Der echte Diskus und die Wurfscheibe fliegen am weitesten, der Teller mittel, die Schallplatte kurz. | Tag 1 | **Diskus** oder Ersatz |
| 8 | **Die Sphinx mit Schreibblockade** | schwer | Die Sphinx gibt ihre Schriftrolle nur heraus, wenn man ihr ein neues Rätsel stellt, das sie nicht lösen kann. Max wählt eines von drei Lösungswörtern (Handy, Kaugummi, Kugelschreiber), alles Wunderdinge, die die Sphinx nicht kennt. Dazu legt er aus seinem Notizbuch drei Hinweise, die auf genau dieses Ding passen. Jede falsche Kombination kommentiert die Sphinx konkret, etwa „Ein Kugelschreiber klingelt nicht“; sie kommentiert immer den ersten Baustein, der nicht passt. Die neun Bausteine (je drei pro Wunderding) und ihre Fundorte stehen unten unter „Ausgearbeitet: Die Rätsel-Bausteine der Sphinx“. Beim Erhalt der Schriftrolle stehen die Konter 1 bis 3 im Notizbuch. | – (Normalweg nach der Fähre) | Schriftrolle **Die sieben Antworten** mit ersten Kontern |
| 9 | **Konter sammeln** | mittel | Für das Rede-Ringen braucht Max Konter. Er hat die Schriftrolle der Sphinx, belauscht Griechen auf der Agora, die sich über die römischen Touristen beschweren („Was haben die Römer je für uns getan?“), und schickt Pixel zu einem Philosophen, der in einer Tonne wohnt und jeden Vorbeigehenden beschimpft. Pixel kriecht mit in die Tonne und lernt dort die besten Beleidigungen. Je mehr Konter, desto leichter wird das Rede-Ringen am Finaltag. Die Schriftrolle liefert drei Konter (1 bis 3), die Griechen zwei (4 und 5), die Tonne zwei (6 und 7); Cicero hat fünf Beleidigungen. Rätsel 9 gilt als gelöst, sobald für jede Beleidigung mindestens ein Konter im Notizbuch steht, also Schriftrolle plus beide Griechen-Konter; die Tonne bringt Ersatz-Konter für die erste und dritte Beleidigung. | Schriftrolle (8) | **Konter** für das Rede-Ringen |
| 10 | **Ein Grab für Archimedes** | schwer | (10a) Cicero tritt erst an, wenn er das Grab des Archimedes gefunden hat, aber Archimedes lebt noch. Der besteht darauf, sein Grab selbst zu entwerfen: Kugel und Zylinder. Den Entwurf gibt er heraus, sobald Cicero das Grab verlangt hat, die Krone (5) geprüft ist und Tag 1 vorbei ist. Cicero sucht das Grab dort, wo er es auch wirklich fand: in Syrakus. Der Stein muss dort genau 137 Jahre alt aussehen. Cicero sagt es ausdrücklich: „Ein Grab von genau 137 Jahren, nicht ein Jahr jünger.“ Die Zahl landet im Notizbuch, und die Tafel am Fährsteg nennt die Jahre pro Strecke. Bestellt Max den Stein bei den Pyramiden-Arbeitern ohne Archimedes' Entwurf, liefern sie einen zerbröselten Haufen (Gag, kein Fehlschlag; er bestellt einfach noch einmal). Gemeißelt wird nur im Nil-Delta, denn nur dort gibt es Steinmetze: Max bringt Archimedes' Entwurf zu den Pyramiden-Arbeitern und bekommt den frischen Grabstein. (10b) Dann fährt er ihn den ganzen Fluss hinunter: 112 + 25 = 137 Jahre. Das Alter des Steins hängt nur davon ab, an welcher Anlegestelle er gerade ist: im Nil-Delta frisch, in Olympia nach 112 Jahren grau mit bestoßenen Kanten und feinen Rissen, aber noch ohne Moos, in Syrakus nach 137 Jahren verwittert und moosig. Umwege und Hin- und Herfahren schaden also nie. Max stellt ihn am Grabhügel Syrakus auf den leeren Sockel; dort ist er verwittert und moosbewachsen, und Cicero „entdeckt“ ihn begeistert. Archimedes ist dabei in der Nähe und kommentiert alles. | Archimedes (5), Tag 1 | Cicero tritt an: **Finaltag** |
| 11 | **Die Siegesparade** | mittel | (11a) Nach dem Sieg ist Ramses' Volk, das mit der Fähre angereist ist, unbeeindruckt; es will Brot und Spiele. Ramses lässt die Parade deshalb gleich in Olympia abhalten, damit die ganze antike Welt zusieht. Max plant eine Parade im Stadion, und Ramses' Zeremonienmeister gibt ihm den Paraden-Plan mit vier Feldern und verrät grob, worauf es ankommt: Hermes muss Einladungen verteilen, bevor das Volk kommt; Archimedes' Brennspiegel brauchen Mittagssonne; Ciceros Rede wirkt nur, wenn alle schon da sind; Pixel erscheint als Gott zum Höhepunkt. Lösung: Hermes, Brennspiegel, Cicero, Pixel; den Brennspiegel muss Max dafür aus der Werkstatt mitgebracht haben. (11b) Danach verlangt Ramses Wein für das Fest: Wein gibt es nirgends, aber in Archimedes' Werkstatt steht der Essigkrug mit uraltem Essig. Max fährt ihn flussaufwärts von Syrakus nach Olympia: 25 Jahre jünger ist er wieder Wein. Fährt er weiter bis Ägypten, kommt nur Traubensaft an. Wer stattdessen Traubensaft aus dem Palast nach Olympia fährt, bekommt nach 112 Jahren Essig. Wer das Handy noch hat, macht mit der Taschenlampe den Abschluss. Wer alle drei Wunderdinge (Handy, Kaugummi, Kugelschreiber) bis zur Parade behalten hat, bekommt dazu den Bonus-Gag: Pixel lobt ihn, widerwillig. | Finaltag | **Goldener Sack Pharaonenkorn** |

### Ausgearbeitet: Der Diskus-Diebstahl (Rätsel 7)

Jeder Verdächtige macht zwei Aussagen, und jeder lügt genau einmal. Der Dieb war in der Nacht im Stadion.

| Verdächtiger | Aussage 1 | Aussage 2 |
| --- | --- | --- |
| Leonidas | „Hermes war es.“ | „Ich war es nicht.“ |
| Hermes | „Tiro war heute Nacht im Stadion.“ | „Die Sphinx war es.“ |
| Tiro | „Ich war heute Nacht nicht im Stadion.“ | „Hermes war es nicht.“ |
| Sphinx | „Ich war es nicht.“ | „Leonidas war es.“ |

**Lösung: Tiro.** Wäre Leonidas der Dieb, lögen beide seiner Aussagen; wäre es Hermes, stimmten beide. Wäre es die Sphinx, löge sie mit beiden Aussagen. Nur mit Tiro als Dieb lügt jeder genau einmal. Per Skript geprüft: Es gibt genau eine Lösung. Pixel darf an allen vier Verdächtigen schnuppern. Tiro riecht nach Tintenfisch-Tinte, und weil Pixels Nase bei Fischgeruch lügt, meldet er ausgerechnet ihn als „ganz sicher unschuldig“. Wer sich an das Flaschenrätsel aus Welt 1 erinnert, wird misstrauisch.

### Ausgearbeitet: Die Rätsel-Bausteine der Sphinx (Rätsel 8)

Max braucht ein Lösungswort und die drei Bausteine genau dieses Wortes; insgesamt gibt es neun. Die Sphinx braucht nur das Wort, nicht das Ding.

| Wort | Baustein | Fundort |
| --- | --- | --- |
| Handy | „Es klingelt, wenn jemand dich will“ | Handy ansehen, erstes Mal |
| Handy | „Es leuchtet im Dunkeln, aber nur kurz“ | Handy ansehen, zweites Mal, oder Handy auf den Hofkater beim Götter-Duell (2b) |
| Handy | „Es stirbt bei drei Prozent“ | Gespräch mit dem Fährmann über das Fahrgeld (1) |
| Kaugummi | „Es wird nie alle“ | Kaugummi ansehen, erstes Mal, oder Nebet (4) |
| Kaugummi | „Es klebt unter jedem Tisch“ | Kaugummi ansehen, zweites Mal |
| Kaugummi | „Man kann daraus eine Sonne machen“ | Götter-Duell mit der Kaugummiblase (2b) |
| Kugelschreiber | „Es schreibt ohne Tintenfass“ | Kugelschreiber ansehen, erstes Mal, oder bei den Beamten im Startbüro (3) |
| Kugelschreiber | „Es klickt, wenn man nervös ist“ | Kugelschreiber ansehen, zweites Mal |
| Kugelschreiber | „Es ist blau und hat trotzdem keine Laune“ | Kugelschreiber auf Tiro, Agora |

Das Handy-Wort lässt sich immer vollständig legen (zwei Bausteine aus dem Ansehen, einer vom Fährmann). Wer Kaugummi oder Kugelschreiber schon ausgegeben hat oder das Duell mit dem Brennspiegel gewonnen hat, bleibt also nie hängen.

### Ausgearbeitet: Die Wettkampftage

Max tritt im antiken Fünfkampf an: Stadionlauf, Weitsprung, Speerwurf, Diskus und Ringen. Die Disziplinen lockern das Adventure auf, ersetzen es aber nicht. Dafür gelten fünf Regeln:

1. **Kurz:** 30 bis 90 Sekunden pro Disziplin.
2. **Nachsichtig:** Nach zwei Fehlversuchen bietet Ramses an, „großzügig zu werten“. Niemand bleibt stecken; wer ablehnt, spielt weiter.
3. **Mit dem Adventure verbunden:** Jede Disziplin hat eine Vorbereitung, die Max vorher durch Erkunden und Rätsel erledigt. Gute Vorbereitung macht sie leichter.
4. **Verteilt:** Wettkampftag 1 (Vorrunde, Mitte der Welt) mit Sandalen-Lauf und Archimedes' Hebel; Finaltag (Ende der Welt) mit Ventilator-Speer, Nasen-Diskus und Rede-Ringen. Dazwischen geht das Adventure weiter.
5. **Lustiges Scheitern:** Jeder Fehlversuch hat eine eigene Pointe.

Nur Archimedes' Hebel und das Rede-Ringen sind echte Minispiele, ohne Zeitdruck. Die anderen drei laufen als kurze Szenen ab; wie sie ausgehen, hängt von der Vorbereitung ab.

| Nr. | Disziplin | Form | Vorbereitung | Ablauf | Pointen |
| --- | --- | --- | --- | --- | --- |
| 1 | **Sandalen-Lauf** (Stadionlauf), Tag 1 | Szene | Geflügelte Sandalen von Hermes (nach 3), Olivenöl auf die Riemen (4, freiwillig) | Die Sandalen reißen sich in jedem Fall los. Mit Öl halten sie bis ins Ziel, und Max läuft als Erster ein. Ohne Öl fliegen sie gleich am Start davon, und Max rennt barfuß als Letzter, kommt aber weiter. Eine Sandale landet auf der Agora (6a). | Leonidas ruft „Marathon!“ und biegt falsch ab (er landet in Syrakus); eine Schildkröte überholt Max (Zenons Paradoxon). |
| 2 | **Archimedes' Hebel** (Weitsprung), Tag 1 | Minispiel | Archimedes baut den Wurfhebel nach der Kronen-Probe (5) und bringt ihn ins Stadion. | Max legt Gegenstände aus dem Inventar als Gegengewichte in den Korb und stellt den Winkel ein. Jeder Gegenstand hat ein Gewicht und einen Kommentar von Archimedes. Die Gewichte legt die Umsetzung fest; Archimedes' Kommentare geben die Richtung vor (Pixel ist „genau richtig“, der Grabstein „viel zu schwer“). | Zu leicht: Max rutscht in die Sandgrube. Zu schwer: Max landet im Fluss oder mitten in Ciceros Rede auf der Agora. |
| 3 | **Ventilator-Speer** (Speerwurf), Finaltag | Szene | Die Fächerwedler machen den Wind; mit frischen Feigen bestochen, wedeln sie gleichmäßig (6b). | Mit Bestechung trifft der Speer genau den Olivenkranz. Ohne Bestechung dreht der Wind, und der Speer landet im Zelt der Kampfrichter; gezählt wird trotzdem. | Der Speer spießt unterwegs Leonidas' Mittagsteller auf. |
| 4 | **Nasen-Diskus** (Diskus), Finaltag | Szene | Diskus von Tiro oder Ersatz (7) | Max wählt den Wurfgegenstand, der Wurf läuft automatisch. Echter Diskus und Wurfscheibe fliegen am weitesten, der Pharaonenteller mittel, die Schallplatte kurz. | Vorher zeigt eine Gag-Folge drei Probewürfe mit Leonidas' aufgespießtem Mittagsteller: Die Sphinx verliert ihre Nase, die Marmorstatue auf der Agora ihre Arme, und der Glockenturm hinter dem Stadion neigt sich. |
| 5 | **Rede-Ringen gegen Cicero** (Ringen), Finaltag | Minispiel | Konter: drei von der Schriftrolle der Sphinx (8), zwei von den Griechen auf der Agora, zwei von Pixel aus der Tonne des Philosophen (9) | Siehe unten. | Bei einem Fehlversuch hält Cicero eine dreistündige Rede im Zeitraffer, Pixel und das Publikum schlafen ein. |

**Bestleistung:** Weiter kommt Max in jedem Fall. Als Bestleistung zählt eine Disziplin, wenn sie ohne großzügige Wertung endet, der Lauf mit geölten Sandalen gelaufen und der Diskus mit dem echten Diskus oder der Wurfscheibe geworfen wurde; Hebel und Speer zählen mit Treffer. Fünf Bestleistungen ergeben die Errungenschaft „Fünfkampf“ und Pixels Zeile W2\_RING\_PIX\_0290. Die Ergebnisse stehen in den Schaltern der Wettkampftage (siehe Teilschritte und Schalter).

### Ausgearbeitet: Rede-Ringen in der Sandgrube (Minispiel am Finaltag)

Cicero muss fünfmal getroffen werden, und wo er steht, zeigt jederzeit den Fortschritt. Kein Zeitdruck.

- **Aufbau:** Seitenansicht der Sandgrube. Fünf Schrittlinien liegen gleichmäßig von links nach rechts im Sand, die fünfte direkt vor der niedrigen Mauer am rechten Rand. Max steht links vor Linie 1 und bleibt dort; Cicero beginnt auf Linie 1.
- **Ablauf:** Cicero wirft die fünf Beleidigungen in fester Reihenfolge; die Nummer der Beleidigung ist immer die Linie, auf der er steht. Max wählt im Konter-Panel einen Konter aus dem Notizbuch. Das Panel zeigt alle gesammelten Konter (höchstens sieben); Konter verbrauchen sich nicht.
- **Treffer:** Cicero stolpert eine Linie nach rechts, die Linie leuchtet kurz golden auf, das Publikum jubelt. Der fünfte Treffer schiebt ihn über die Mauer: Sieg.
- **Fehlversuch:** Cicero hält die dreistündige Rede im Zeitraffer, Pixel und Publikum schlafen ein. Danach rückt Cicero eine Linie zurück nach links (nie hinter Linie 1) und wirft die Beleidigung dieser Linie noch einmal. Der falsche Konter bleibt für die Beleidigung, bei der er danebenging, im Panel ausgegraut, damit niemand denselben Fehler zweimal macht.
- **Hilfe:** Nach zwei Fehlversuchen bietet Ramses „großzügige Wertung“ an. Nimmt Max an, zählt das Ringen als gewonnen, nur die Fünfkampf-Errungenschaft entfällt; wer ablehnt, spielt weiter.

| Linie und Beleidigung | Passende Konter |
| --- | --- |
| 1: „Du bist ein Junge in einem Sack …“ | 2 (Schriftrolle) oder 7 (Tonne) |
| 2: „Was hat deine Welt je hervorgebracht?“ | 4 (Griechen) |
| 3: „Wie ich schon in meiner dritten Rede sagte …“ | 3 (Schriftrolle) oder 6 (Tonne) |
| 4: „Und so stehe ich hier vor euch …“ | 5 (Griechen) |
| 5: „Ich werde reden, bis die Sonne untergeht …“ | 1 (Schriftrolle) |

Pflicht sind damit die drei Konter der Schriftrolle und die zwei der Griechen; die Tonne gibt Ausweich-Konter und macht das Ringen leichter.

## Teilschritte und Schalter

Die Schritte heißen wie in der Welt-Tabelle und im Hinweissystem; jeder Schritt hat den Schalter `W2_Rnn(_X)_GELOEST` (Schema in 05-spielsysteme, Speichern). Die zwei Wettkampftage laufen dort als eigene Schritte R12 und R13 mit, damit Welt-Tabelle, Notizbuch und Speichern sie wie Rätsel behandeln; sie zählen nicht zu den 11 Rätseln und haben keine Hinweisstufen. Sie beginnen, sobald ihre Voraussetzungen erfüllt sind; Tag 1, wenn Max dann die Startlinie im Stadion benutzt.

| Schritt | Inhalt | Schalter |
| --- | --- | --- |
| R1 | Die Krokodil-Fähre | `W2_R01_GELOEST` |
| R2a | Die Hieroglyphen-Botschaft | `W2_R02_A_GELOEST` |
| R2b | Das Götter-Duell | `W2_R02_B_GELOEST` |
| R3a | Das neue Rundschreiben (entfällt mit dem Empfehlungsschreiben) | `W2_R03_A_GELOEST` |
| R3b | Der Passierschein | `W2_R03_B_GELOEST` |
| R4 | Das Olivenöl (freiwillig) | `W2_R04_GELOEST` |
| R5 | Archimedes' Krone | `W2_R05_GELOEST` |
| R12 | Wettkampftag 1: Sandalen-Lauf und Hebel | `W2_TAG1_GELOEST`, `W2_LAUF_BESTLEISTUNG`, `W2_HEBEL_BESTLEISTUNG` |
| R6a | Das Zeichen der Sandale (freiwillig) | `W2_R06_A_GELOEST` |
| R6b | Frische Feigen für die Fächerwedler (freiwillig) | `W2_R06_B_GELOEST` |
| R7 | Der Diskus-Diebstahl | `W2_R07_GELOEST` |
| R8 | Die Sphinx mit Schreibblockade | `W2_R08_GELOEST` |
| R9 | Konter sammeln | `W2_R09_GELOEST` |
| R10a | Ein Grab für Archimedes: Entwurf und Grabstein | `W2_R10_A_GELOEST` |
| R10b | Das Alter des Grabsteins: 137 Jahre in Syrakus | `W2_R10_B_GELOEST` |
| R13 | Finaltag: Speer, Diskus, Rede-Ringen | `W2_FINALTAG_GELOEST`, `W2_SPEER_BESTLEISTUNG`, `W2_DISKUS_BESTLEISTUNG`, `W2_RINGEN_BESTLEISTUNG` |
| R11a | Die Siegesparade: der Paraden-Plan | `W2_R11_A_GELOEST` |
| R11b | Wein für Ramses | `W2_R11_B_GELOEST` |

Dazu kommen zwei Werte: `W2_FAEHRE_STEG` (Nil-Delta, Fährsteg Olympia oder Hafen Syrakus) und `W2_FEIGE_ZUSTAND` (Feigensetzling, Feigenbaum oder Feigenkern). Das Alter von Grabstein, Traubensaft und Essigkrug folgt aus dem Steg und wird nicht eigens gespeichert. Ob ein Wunderding verbraucht ist, steht im Inventar; den Bonus-Gag der Parade gibt es, wenn Handy, Kaugummi und Kugelschreiber dort noch liegen.

## Inventar

Namen wie in der Welt-Tabelle; dort stehen auch Herkunft, Zustände und Verwendung als Liste.

| Gegenstand | Fundort | Verwendung |
| --- | --- | --- |
| Handy, Kaugummi, Kugelschreiber | Max' Taschen (Wunderdinge, siehe oben) | Handy: Taschenlampe bei der Parade (11, Bonus); Kaugummi: Wunder im Götter-Duell (2b) oder „ewiges Brot“ (4); Kugelschreiber: Rundschreiben, Weg A (3a); alle drei: Lösungswörter für die Sphinx (8), eins davon reicht |
| Thunfischdose | Pflichtfach, aus dem Prolog | Opfergabe im Götter-Duell (2b), nur vorgezeigt |
| Sortierende Socke | Wahlfach, aus Welt 1 | Formularberg sortieren, Weg D (3a) |
| Notizbuch, Kochlöffel-Zauberstab | Pflichtfach | Ziele, Regeln, Bausteine und Konter (Notizbuch); in Welt 2 nur Hebel-Kommentar (Kochlöffel-Zauberstab) |
| Bildtafel | Schreiber im Thronsaal; er behält sie nach der Botschaft | Botschaft schreiben (2a) |
| Pharaonenteller | Neben dem Thron, nehmbar nach der Audienz | Diskus-Ersatz (7), geworfen am Finaltag |
| Brot, Datteln, Zwiebel | Schneidetisch in der Palastküche | Fladen nach Pixels Rezept (4) |
| Fladen | Brot mit Datteln, dann mit Zwiebel, dann im Lehmofen (Stufen: mit Datteln, roh, mit Kruste) | Neues Gericht für Nebet ohne Kaugummi (4) |
| Olivenöl | Nebet in der Palastküche (4), ein ganzer Krug | Sandalen ölen vor Tag 1; der Rest des Krugs (angebrochen) reist nach Welt 3 |
| Traubensaft | Amphore in der Palastküche | Falsche Fährte für den Wein (11b): wird flussabwärts zu Essig |
| Papyrusblatt | Schilf im Nil-Delta | Rundschreiben mit Tinte, Weg B (3a) |
| Tintenfass | Tintenfisch in den Fischernetzen am Hafen Syrakus | Rundschreiben mit Tinte, Weg B (3a) |
| Leeres Formular | Formularberg im Startbüro | Rundschreiben mit Kugelschreiber, Weg A (3a) |
| Rundschreiben | Selbst geschrieben (Kugelschreiber oder Tinte) oder von der Sortierenden Socke im Formularberg gefunden (3a) | Startpass (3b) |
| Empfehlungsschreiben | Sphinx, nach Rätsel 8 auf Nachfrage | Startpass, Weg C (3b, ohne 3a) |
| Startpass | Startbüro (3b) | Teilnahme an Tag 1 |
| Geflügelte Sandalen | Hermes, im Startbüro gleich nach dem Startpass | Sandalen-Lauf an Tag 1; dort reißen sie sich los |
| Geflügelte Sandale | Adler-Säule auf der Agora, von Pixel geangelt (6a) | Zeichen der Sandale (6a); reist nach Welt 3 |
| Brians Schild | Brian hängt es Max um (6a) | Kein Rätsel; „Ich bin nicht der Messias.“, hinten „Doch.“ |
| Feigensetzling | Geschenk der Menge auf der Agora (6a); wird auf der Fähre zum Feigenbaum oder Feigenkern | Feigen reifen lassen (6b) |
| Feigen | Vom Feigenbaum gepflückt, nach der Fahrt nach Syrakus (altern nicht mehr) | Fächerwedler bestechen (6b, freiwillig): Treffer beim Speerwurf am Finaltag |
| Waage, Messbecher | Archimedes' Werkstatt | Kronen-Probe (5) |
| Krone, Goldbarren | Hieron, in der Werkstatt; er nimmt sie nach der Probe zurück | Kronen-Probe (5) |
| Brennspiegel | Archimedes' Werkstatt (nehmbar) | Wunder im Götter-Duell ohne Kaugummi (2b); Paraden-Plan, Feld 2 (11a) |
| Essigkrug | Archimedes' Werkstatt, 120 Jahre alter Essig | Wein für Ramses (11b), nach Olympia gefahren |
| Schallplatte, Wurfscheibe | Nach Tag 1 in Reisetasche (von Opa geschmuggelt) und Bauchtasche (seit dem Schulausflug) | Diskus-Ersatz (7), geworfen am Finaltag |
| Diskus | Tiro (7) | Nasen-Diskus am Finaltag |
| Rätsel-Bausteine | Aufgeschnappt in der ganzen Welt, im Notizbuch (neun Stück, Fundorte unter „Ausgearbeitet: Die Rätsel-Bausteine der Sphinx“) | Sphinx (8) |
| Schriftrolle | Sphinx (8): „Die sieben Antworten“ | Konter 1 bis 3 (9) |
| Entwurf | Archimedes, nach Ciceros Forderung, der Krone (5) und Tag 1 | Grabstein meißeln lassen (10a) |
| Grabstein | Pyramiden-Arbeiter (Steinmetz) im Nil-Delta, nach Archimedes' Entwurf; Zustände frisch, grau, verwittert | Das Grab (10b) |
| Zerbröselter Haufen | Steinmetz, wenn Max ohne Entwurf bestellt | Kein Rätsel (Gag); Max bestellt einfach noch einmal |
| Olivenkranz | Ramses nach dem Rede-Ringen (Finaltag) | Beweis des Sieges, Parade (11a) |
| Paraden-Plan | Zeremonienmeister, zu Beginn der Parade | Vier Felder ordnen (11a) |
| Goldener Sack Pharaonenkorn | Ramses (11b) | Ziel der Welt. Das Pharaonensiegel auf dem Sack trägt die Zahl 405; Pixel beim Ansehen: „Vierhundertfünf. Klingt nach einer Backzahl.“ (In der Gegenwart: Mehl Type 405.) |
| Opas Papyrus | Hermes bringt ihn beim ersten Betreten des Nil-Deltas nach der ersten Fährfahrt | Kein Rätsel; Nahansicht, Hinweis auf Opas Plan („Fein wie Staub“) |
