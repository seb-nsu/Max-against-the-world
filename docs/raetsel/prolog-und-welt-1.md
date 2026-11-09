# Rätsel: Prolog und Welt 1

Welt 1 hat 13 Rätsel in drei Strängen (Zauberei, Zauberwald, Prinzessin), die sich am Dunklen Turm treffen. Weil meist mehrere Rätsel gleichzeitig offen sind, bleibt der Spieler selten ganz stecken.

## Zwei Spielfiguren: Max und Pixel

Ab Welt 1 ist Pixel spielbar. Mit einem Klick auf sein Porträt (oder der Tab-Taste) wechselt der Spieler zwischen Max und dem Kater. Viele der schwereren Rätsel brauchen beide gleichzeitig, ähnlich wie in *Day of the Tentacle*. Der Wechsel wird in Rätsel 1 eingeführt: Beim ersten Betreten der Taverne springt Pixel auf einen Dachbalken, sein Porträt blinkt, und er sagt: „Klick mich an. Ich beiße nur manchmal.“ Klickt Pixel einen Menschen an, kommentiert der Mensch den Kater (eine Zeile pro Figur); klickt er einen Gegenstand an, gibt es eine Schnupper-Zeile (Regel im Tab Spielsysteme).

|  | Max | Pixel |
| --- | --- | --- |
| Bewegung | Normale Wege | Klettert auf Regale und Dachbalken, passt durch Katzenklappen und Löcher |
| Gegenstände | Volles Inventar | Trägt nur einen kleinen Gegenstand im Maul |
| Reden | Mit Menschen und Fabelwesen | Mit Tieren (Mäuse, Ziegen, Katzen); Max versteht davon nur „Miau“ |
| Spezialfähigkeit | Kombinieren und Verhandeln | Schnuppern verrät Hinweise, aber bei allem, was nach Fisch riecht, lügt seine Nase; seine Haare machen Zauberbesen verrückt |

**Schwierigkeitskurve:** Sechs der 13 Rätsel sind mittel oder schwer, sieben leicht. Die schweren Rätsel liegen in der zweiten Hälfte der Welt. Das Dorf bleibt einsteigerfreundlich: Der Einstieg ist Teil (a) von Rätsel 1, ein leichtes Katzenrätsel, das nur den Figurenwechsel lehrt; der eigentliche Coup (b, c) folgt danach.

## Abhängigkeitsdiagramm

*(Diagramm „Rätsel-Abhängigkeiten Welt 1 · 13 Rätsel“ nur im Online-Dokument)*

Pfeile zeigen, welches Rätsel ein anderes freischaltet. Kleinere Abhängigkeiten (Ziegenmilch für den Trank, Ketchup für den Vertrag, Kochlöffel für Moderwort) stehen in der Tabelle unten. Rätsel 10 lässt sich alternativ über Zeldina lösen (Weg B), und für den Turm sammelt Max Passwort-Teile aus vier Orten. Die Sortierende Socke gibt es schon beim Zauberstab (2), und die Bohnenranke wächst mit Brunnenwasser; das Flaschenrätsel liefert den Leuchttrank für Weg A der Goblin-Frage und Moderworts Zeugnis für den Turm. Damit ist Hoggelwarz für alle Spieler Pflicht. Smaugi wohnt in den Abstellkammern des Turms und kommt deshalb vor Moderwort; das Bossduell ist der Schluss der Welt.

## Prolog: Opas Dachboden

Der Prolog bringt dem Spieler die drei Grundaktionen bei (Ansehen, Benutzen, Kombinieren), ohne dass es sich wie ein Tutorial anfühlt. Er dauert etwa zehn Minuten.

| Nr. | Rätsel | Lösung | Lehrt |
| --- | --- | --- | --- |
| P1 | **Der schlafende Kater:** Pixel schläft auf dem Verlängerungskabel des Zapp-O-Mat und lässt sich nicht wegschieben. | Max findet eine Dose Thunfisch und einen Dosenöffner in Opas Werkzeugkiste und kombiniert sie. Der Geruch weckt Pixel. Opa schaltet Pixels Halsband-Lautsprecher ein, und der Kater beschwert sich zum ersten Mal über alles. | Kombinieren im Inventar |
| P2 | **Nur Rauschen:** Der Zapp-O-Mat zeigt nur Schnee, weil die Antenne fehlt. | Im alten Kleiderschrank liegt ein Drahtkleiderbügel. Max biegt ihn zurecht und steckt ihn auf den Fernseher. | Gegenstände in der Welt benutzen |
| P3 | **Der richtige Kanal:** Opa hat vergessen, welcher Kanal zur ersten Welt führt. | Auf dem Wandkalender steht eine Kanalnummer, daneben ein dick rot eingekreister Tag, den Opa „zufällig“ nicht erklärt. Max stellt den Kanal ein und wird eingesaugt. | Genau hinsehen; legt den Hinweis auf Omas Geburtstag für das Finale |

## Die Rätsel von Welt 1

Max landet im Dorf Unterbrösel. Toadi stürmt herbei: Prinzessin Zeldina wurde entführt, und auf Burg Brösel ist sie nicht. Das ist der Startschuss für alle drei Stränge.

Ortsnetz von Welt 1 (Ausgänge und Bedingungen, Grundlage für Raumwechsel und Speichersystem):

| Ort | Ausgänge | Bedingung |
| --- | --- | --- |
| Dorfplatz Unterbrösel | Taverne, Schmiede, Zauberstab-Laden, Weg nach Hoggelwarz, Waldweg zur Troll-Brücke, Bohnenranke zum Luftschloss | Ranke erst nach Rätsel 8 |
| Taverne, Schmiede, Zauberstab-Laden | Dorfplatz | frei |
| Hoggelwarz, Klassenzimmer | Dorfplatz | Betreten frei; Alwin beginnt die Prüfung erst mit Zauberstab (2) |
| Troll-Brücke | Dorfplatz, Zauberwald, Wasserschloss | Zauberwald und Wasserschloss erst nach Rätsel 4 |
| Zauberwald | Troll-Brücke, Stolleneingang zum Goblin-Bergwerk | Stolleneingang mit Streikposten frei betretbar; der Weg durch den Stollen zur Rune-Tür öffnet erst nach Rätsel 10 |
| Wasserschloss | Troll-Brücke | Gag-Szene ohne Rätsel |
| Luftschloss | Bohnenranke zum Dorfplatz | nach Rätsel 8 |
| Goblin-Bergwerk | Zauberwald, Kellereingang des Dunklen Turms | Die Rune-Tür am Stollenende ist der Kellereingang des Turms und öffnet nach Rätsel 10 |
| Dunkler Turm, Keller und Abstellkammern | Bergwerk, Treppe zu den Abstellkammern, Geheimtür zum Thronsaal | Treppe zu den Abstellkammern nach Rätsel 11 Teil 2 (Besen eingesperrt); die Geheimtür mit dem kichernden Passwort liegt im obersten Kammer-Stockwerk und öffnet mit Rätsel 11 Teil 1; der Thronsaal wird erst nach Rätsel 12 betreten (siehe Raumplan) |
| Dunkler Turm, Thronsaal | Abstellkammern | nach Rätsel 12 |

Raumplan des Dunklen Turms, von unten nach oben. Der Turm hat sieben Stockwerke über dem Keller; sechs davon sind Smaugis Abstellkammern.

| Ebene | Raum | Inhalt | Zugang |
| --- | --- | --- | --- |
| Keller | Kellereingang aus dem Bergwerk | Rune-Tür vom Stollenende, Fliesenflur mit drei Kreuzungen (Pixels Haare, Rätsel 11 Teil 2), Start der drei Besen-Routen, Treppe nach oben | nach Rätsel 10 |
| 1 | Abstellkammer 1 | Smaugis Kram; hier sperrt Max die Besen ein (Rätsel 11 Teil 2) | nach Rätsel 11 Teil 2 |
| 2 bis 5 | Abstellkammern 2 bis 5 | Haufen, später ordentliche Stapel; Abnehmer Humbert, Grimmzahn und Zeldina stehen hier (Rätsel 12) | mit Ebene 1 |
| 6 | Oberste Abstellkammer | Smaugi und das Drachenei (Rätsel 12); Geheimtür mit kichernder Passwortabfrage (Rätsel 11 Teil 1) | mit Ebene 1 |
| 7 | Thronsaal | Lord Moderwort, Bossduell (Rätsel 13); danach Zeldinas Turm | nach Rätsel 11 Teil 1 und Rätsel 12 |

| Nr. | Rätsel | Stufe | Lösung | Benötigt | Belohnung |
| --- | --- | --- | --- | --- | --- |
| 1 | **Der Taverne-Coup** (Gollos Ring) | leicht (a), mittel (b, c) | **Teil (a), Minka, leicht:** Beim ersten Betreten der Taverne springt Pixel auf einen Dachbalken, und sein Porträt blinkt: „Klick mich an. Ich beiße nur manchmal.“ So lernt der Spieler den Figurenwechsel. Die Wirtskatze Minka bewacht den blubbernden Fondue-Topf, den „Vulkan“. Pixel flirtet mit ihr und lockt sie nach draußen. Vorher schnuppert er an Humberts Fischsuppe und meldet „Hühnerbrühe“; Max: „Deine Nase lügt bei Fisch.“ Pixel: „Meine Nase lügt nie. Sie interpretiert.“ Damit kennt der Spieler die Regel für Rätsel 6. **Teil (b) und (c), der Coup, mittel:** Gollo will seinen Ring in den Vulkan werfen. (b) Der Wirt lässt den Topf nie allein. Max bestellt den seltensten Wein des Hauses, „Jahrgang Schicksalsberg“, und der Wirt geht in den Keller. (c) Gollo traut sich im letzten Moment nicht. Er gibt den Ring nur her, wenn er ein Rätselspiel verliert. Die Frage stellt Max erst, wenn der Spieler die Thunfischdose auf Gollo zieht: „Was hab ich in meiner Tasche?“ Gollo rät dreimal falsch („Ein Ring?“), verliert und wirft den Ring hinein. Zum Dank schenkt er Max seine letzte Goldmünze. | Thunfischdose (Prolog) | **Goldmünze** und **Käsefondue** vom versöhnten Wirt; der Wechsel zu Pixel ist eingeführt |
| 2 | **Der Zauberstab wählt den Zauberer** | leicht | Der Stabmacher erzählt, sein letzter Stab habe einen Zauberer nur „gewählt“, weil er an dessen Honigfingern kleben blieb. Max bestreicht den Kochlöffel mit Käsefondue, der Löffel klebt an seiner Hand. Der Stabmacher ist ergriffen: „Er hat dich gewählt!“ | Käsefondue (1) | **Kochlöffel-Zauberstab und die Sortierende Socke, die der Stabmacher als Probestück beilegt** |
| 3 | **Drei Ziegenböcke** | leicht | Ziege 1 frisst die Schwerter des Schmieds, er gibt sie gern ab. Ziege 2 bestellt Max bei Rotkäppchens Lieferdienst (Bestellzettel am Dorfbrett); geliefert wird eine XXL-Ziege. Die kleinste Ziege fehlt, also muss Pixel im Ziegenfell-Bettvorleger aus der Taverne einspringen. | – | **Drei Ziegen** in drei Größen |
| 4 | **Das Märchen an der Troll-Brücke** | mittel | Der Troll verlangt das *ganze* Märchen nach der Märchen-Satzung am Brückenschild (Nahansicht). (a) Die Ziegen müssen in der richtigen Reihenfolge laufen: klein, mittel, groß. (b) Jede muss ihren Satz sagen, aber Ziegen sprechen nur Ziegisch. Max liest den Text aus der Satzung vor, Pixel übersetzt ihn den Ziegen, mit lustigen Übersetzungsfehlern beim ersten Versuch. (c) Am Ende muss der Troll laut Satzung „ins Wasser“, aber er kann nicht schwimmen. Max entdeckt die Lücke: Von Fallen steht da nichts. Er holt einen Eimer Wasser vom Brunnen, und der Troll nimmt ein Fußbad. Regel erfüllt. Danach gibt Waldemar den Eimer zurück: „Regel 14b: Leihgaben sind zurückzugeben.“ Hinter der Brücke liegt das Wasserschloss, eine reine Gag-Szene ohne Rätsel: Zeldinas frühere Wohnung, nur noch Umzugskartons und ein Schild „Zu vermieten“, und Toadi meldet: „Danke, Max! Aber die Prinzessin ist in einem anderen Schloss.“ | Drei Ziegen (3), Eimer (Brunnen) | Zugang zu **Zauberwald** und **Wasserschloss** |
| 5 | **Der Brunnen der Wünsche** | leicht | Das Luftschloss schwebt von Anfang an sichtbar über dem Dorf, und Toadi seufzt bei jedem Blick nach oben, dorthin komme man nur mit einer Bohnenranke. Der Brunnen erfüllt Wünsche nur gegen Gold. Max wirft Gollos Münze hinein. Im Dialog stehen drei Wünsche zur Wahl: „etwas, das hoch hinaus will“, „unendlich Pizza“ und „dass Pixel mal still ist“. Die falschen gehen mit Gag schief (eine einzelne kalte Pizzascheibe; Pixel redet danach doppelt so viel), und der Brunnen gibt die Münze als Reklamation zurück. Erst der richtige Wunsch liefert die Bohne. | Goldmünze (1) | **Zauberbohne** |
| 6 | **Die sechs Flaschen** (Aufnahmeprüfung) | mittel | Teil 1: Alwins Rezept ist ein Pfannkuchenrezept (Ei, Milch, Leuchtpilz). Milch gibt es im ganzen Reich nicht („Die Milch ist in einem anderen Schloss“), also melkt Max die Schmiede-Ziege. Die Milch geht komplett in den Trank, und Max schwört, diese Ziege nie wieder zu melken. Teil 2: Die letzte Zutat steht in einem von sechs Fläschchen mit vertauschten Etiketten (Parodie auf das Flaschenrätsel aus *Harry Potter*). Ein gereimter Hinweiszettel von Alwin (Nahansicht) nennt die Inhalte und drei Regeln, aus denen genau eine Flasche folgt (siehe unten). Pixel darf zwei Flaschen beschnuppern, aber bei der Fischöl-Flasche lügt er; die Regel kennt der Spieler seit Humberts Fischsuppe (Rätsel 1). Wer falsch wählt, wird kurz zu einem braunen Pilz; Toadi, der zusieht, fragt nur: „Familie?“ Schon beim Betreten des Klassenzimmers dreht ein Übungsbesen durch und jagt Pixels ausgefallenen Haaren hinterher; Alwin seufzt: „Besen und Katzenhaare, das endet immer in der Abstellkammer.“ Nach bestandener Prüfung holt Alwin Moderworts altes Zeugnis aus dem Archiv, als abschreckendes Beispiel. | Zauberstab (2), Ziegenmilch (3), Leuchtpilz aus dem Zauberwald (4) | **Eine Flasche Leuchttrank und Moderworts Zeugnis (Passwort-Teil)** |
| 7 | **Die Niesrosen** | leicht | Niesrosen öffnen sich nur bei Gesang. Max überredet Troll Waldemar, der heimlich Musicals liebt, zu einer großen Gesangsnummer, und verspricht ihm dafür einen Auftritt im Abspann, und fängt die Pollen in der Sortierenden Socke. | Socke (2), Zauberwald (4) | **Socke voller Pollen** |
| 8 | **Die Bohnenranke** | leicht | Max pflanzt die Zauberbohne und gießt sie mit einem Eimer Wasser aus dem Wunschbrunnen. Die Ranke wächst bis in die Wolken. | Zauberbohne (5), Eimer mit Brunnenwasser | Zugang zum **Luftschloss** |
| 9 | **Prinzessin Zeldina** | leicht | Zeldina ist bei einer Wohnungsbesichtigung auf dem Luftschloss. Die Maklerin will drei Monatsmieten Provision in Drachengold, sonst keine Schlüssel. Max hat im Gespräch mit der Maklerin drei Optionen, eine führt zum Ziel. Feilschen: Sie verdoppelt die Provision. Pixel als Haustier anmelden: Sie schlägt einen Katzenzuschlag drauf. Richtig: Max zeigt ihr Moderworts Steckbrief vom Dorfbrett als Exposé und preist den Dunklen Turm an: „Sieben Stockwerke, Turmlage, Eigentümer bald verhandlungsbereit.“ Die Maklerin wittert die Provision ihres Lebens und zieht sofort los, um Moderwort ein Angebot zu machen. Zum ersten Mal bleibt Pixel sprachlos. Zeldina: „Du hast gerade meinen Entführer an eine Maklerin verkauft.“ Max: „Vermittelt.“ Aus Dankbarkeit schließt Zeldina sich ihm an und folgt ihm ab jetzt sichtbar durch die Welt; erst danach fällt Max ein, dass der Dunkle Turm bald frei wird. Das Passwort zur Geheimtür kennt sie nur halb: Es ist Moderworts peinlicher Kinder-Spitzname aus vier Teilen, und sie weiß nur, dass er mit „Mo“ beginnt. | Luftschloss (8), Moderworts Steckbrief (Dorfbrett) | **Zeldina** im Team (folgt Max sichtbar, Begleiter-Schalter), erster **Passwort-Teil** |
| 10 | **Die Goblin-Frage** (zwei Lösungswege) | mittel | Die Goblins streiken und lassen niemanden ins Bergwerk. **Weg A, Tarifvertrag:** Max liefert den Leuchttrank als Fackel und unterschreibt „mit Blut“, also mit Ketchup aus Rotkäppchens Lieferwagen. **Weg B, Karriere:** Max verspricht Gewerkschaftsboss Grimmzahn den Posten als Hausmeister im Turm; dafür muss Zeldina zustimmen. Je nach Weg erscheinen die Goblins auf den Geburtstagsfotos im Abspann anders: singend (A) oder mit Grimmzahn, der sich als Hausmeister über alles beschwert (B). In beiden Fällen hört Max das Arbeitslied der Goblins mit dem dritten Passwort-Teil. Beim Singen halten zwei Goblins Schilder mit den Silben hoch, der Text läuft als Untertitel und landet im Notizbuch; niemand ist auf den Gesang allein angewiesen. | Weg A: Leuchttrank (6), Ketchup (4). Weg B: Zeldina (9) | Weg durch das **Goblin-Bergwerk**, **Passwort-Teil** aus dem Lied |
| 11 | **Der Dunkle Turm** | schwer | Teil 1, das Passwort: Moderworts Spitzname lautet „Mo-Knuddel-Puddi-Bärchen“, und Max setzt ihn aus vier Teilen zusammen. Jeder Fundort verrät zugleich, welcher Teil an welchen anschließt: Zeldina weiß, dass er mit „Mo“ beginnt. Moderworts altes Zeugnis, das Alwin nach der Aufnahmeprüfung herausrückt, trägt eine Notiz seiner Mutti: „Für meinen Mo-Knuddel, stolz!“ Das Goblin-Lied singt „Knuddel-Puddi, hau den Stein“. Die Kritzelei an der Wand des Luftschlosses (Nahansicht) lautet „…-Bärchen war hier“. Aus den vier Überlappungen folgt genau eine Reihenfolge; falsche Eingaben an der Geheimtür bringen Gags (die Tür kichert). Teil 2, die Besen: Im Turm patrouillieren verzauberte Besen (*Der Zauberlehrling*) nach drei festen Routen. Max beobachtet sie, dann wechselt der Spieler zu Pixel: An drei Kreuzungen im Fliesenmuster (Boden-Hotspots, je eine auf jeder Route) schüttelt sich der Kater und lässt Haare fallen. Die Besen fegen der Spur wie besessen hinterher in eine der Abstellkammern, ausgerechnet in Smaugis, und Max schließt die Tür hinter ihnen. Erwischt ein Besen Max vorher, fegt er ihn zur Treppe zurück; kein Tod, nur ein Kommentar von Pixel. Timing spielt keine Rolle, nur die drei richtigen Stellen. | Bergwerk (10), Passwort-Teile (6, 8, 9, 10) | Zugang zu **Lord Moderwort** |
| 12 | **Smaugi räumt auf** | leicht | Sechs der sieben Turmstockwerke sind Abstellkammern, und alle gehören Smaugi, einem Drachen mit Sammelzwang. Er bewacht das Ei zwischen Bergen von Kram und trennt sich von nichts, außer jemand braucht es wirklich. Die Besen aus Rätsel 11 fegen inzwischen brav seine Haufen zu ordentlichen Stapeln zusammen; Smaugi seufzt: „Seit die Besen da sind, finde ich alles. Das ist noch schlimmer.“ Die Abnehmer sind schon im Turm, Max muss nicht zurück ins Dorf: Wirt Humbert liefert Fondue für Zeldinas Einweihung, Gewerkschaftsboss Grimmzahn besichtigt den Hausmeisterposten (Weg B) oder beschwert sich, dass ihn keiner gefragt hat (Weg A), und Zeldina steht neben Max. Max findet für drei Schätze neue Besitzer: die rostigen Schwerter für Humbert, der jedes beim Vornamen nennt, die alten Fackeln für Grimmzahns Gewerkschaft und den Kronleuchter für Zeldina, die schon von ihrem neuen Turm träumt. Bei jedem Stück fragt Smaugi: „Macht dich das glücklich?“ Gerührt vom freien Platz überreicht er das Ei. Kein Minispiel mehr, sondern ein Inventar- und Dialogrätsel. | Turm (11), Goblins (10), Zeldina (9) | **Drachenei** |
| 13 | **Lord Moderwort** | mittel | Max öffnet die Pollen-Socke, Moderwort niest und verliert seinen Zauberstab. Zeldina fängt ihn, Max schiebt ihm den Kochlöffel zu. Jeder Fluch von Moderwort wird nun zu Käse. Als Max ihn mit seinem Spitznamen anspricht, gibt er beschämt auf und schreibt sich wieder in Hoggelwarz ein. Den Kochlöffel gibt er beschämt zurück: „Damit kann ich nur Käse.“ Ab jetzt reist der Löffel automatisch mit, wie Notizbuch und Thunfischdose. | Pollen (7), Zeldina (9), Kochlöffel (2) | Moderwort besiegt, Zeldina bekommt den Turm, Kochlöffel zurück; Ende der Welt |

### Ausgearbeitet: Die sechs Flaschen (Rätsel 6)

Wie bei Snapes Flaschenrätsel im ersten Harry-Potter-Band stehen sechs Fläschchen in einer Reihe, die Flaschen 2 und 5 sind deutlich größer. Darin sind: einmal der Trank, zweimal Pilzgift, zweimal Brennnesselsaft, einmal Fischöl. Alwins Zettel nennt zuerst die Inhalte („Sechs Flaschen, ein Trank, ein Öl, zweimal Gift, zweimal Saft“) und reimt dann drei Regeln:

1. „Das Fischöl, das stinkt, steht gleich rechts neben dem Trank.“ (Direkt rechts daneben, aus Sicht des Betrachters.)
2. „Die zwei Riesen sind gleich bis zum Rand.“ (Flasche 2 und 5 haben denselben Inhalt.)
3. „Am Rand des Regals steht nie, was du suchst.“

**Lösung: Flasche 3.** Regel 3 schließt Flasche 1 und 6 aus. Steht der Trank auf 2 oder 5, bräuchte die andere große Flasche ebenfalls Trank, den es nur einmal gibt. Steht er auf 4, läge das Fischöl auf 5, und Flasche 2 müsste auch Fischöl sein. Bleibt nur Flasche 3, mit dem Fischöl auf 4. Per Skript geprüft: Die Regeln lassen genau eine Trank-Position zu.

Pixel darf zwei Flaschen beschnuppern. Bei Flasche 4 (Fischöl) lügt seine Nase und meldet „Der Trank!“; wer Regel 1 verstanden hat, erkennt den Widerspruch.

## Inventar

| Gegenstand | Fundort | Verwendung |
| --- | --- | --- |
| Thunfischdose, Dosenöffner | Opas Dachboden | Pixel wecken (P1), Rätselspiel mit Gollo (1) |
| Drahtkleiderbügel | Kleiderschrank, Dachboden | Antenne (P2) |
| Goldmünze | Taverne, nach Rätsel 1 | Brunnen-Wunsch (5) |
| Käsefondue | Taverne, nach Rätsel 1 | Kochlöffel „wählt“ Max (2) |
| Kochlöffel-Zauberstab | Zauberstabmacher | Zaubertrank (6), Austausch bei Moderwort (13), danach reist er automatisch mit (Finale) |
| Ziegenfell-Bettvorleger | Taverne | Pixels Kostüm (3) |
| Bestellzettel | Dorfbrett | XXL-Ziege bestellen (3) |
| Moderworts Steckbrief | Dorfbrett (Nahansicht) | Exposé für die Maklerin (9) |
| Eimer | Brunnen | Fußbad für den Troll (4; Waldemar gibt ihn zurück), Bohnenranke gießen (8) |
| Ziegenmilch | Schmiede-Ziege | Zaubertrank (6) |
| Ei | Taverne-Huhn | Zaubertrank (6) |
| Leuchtpilz | Zauberwald | Zaubertrank (6) |
| Hinweiszettel von Alwin (Nahansicht) | Hoggelwarz-Klassenzimmer | Flaschenrätsel (6) |
| Leuchttrank | Hoggelwarz | Goblin-Fackel bei Weg A (10) |
| Sortierende Socke | Zauberstabmacher | Pollen sammeln (7, 13) |
| Moderworts altes Zeugnis | Alwin, nach der Aufnahmeprüfung (6) | Passwort-Teil (11) |
| Zauberbohne | Brunnen | Bohnenranke (8) |
| Ketchup | Rotkäppchens Lieferwagen, Zauberwald | Unterschrift bei Weg A (10) |
| Notizbuch mit Passwort-Teilen | Einträge nach Ansehen oder Anhören (6, 9, 10); die Luftschloss-Kritzelei muss in der Nahansicht angesehen werden, erst dann steht sie im Notizbuch | Geheimtür (11) |
| Drachenei | Smaugi | Ziel der Welt |

**Bonus-Gags ohne Rätselfunktion:** Humberts Schwert namens „Gerhard“ mit Namensschild, daneben die leeren Schilder seiner Sammlung, eine Flasche „Vielsaft-Limo“, Humberts Fischsuppe (Pixels Nase meldet „Hühnerbrühe“), Moderworts Steckbrief am Dorfbrett (Ansehen, lange vor der ersten Begegnung: „Gesucht wegen Weltherrschaft. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ Max: „Da hat jemand eine Schwachstelle im Lebenslauf.“). Sie belohnen Neugier mit Kommentaren von Max und Pixel.

## Hilfesystem: Pixel gibt Tipps

Wer feststeckt, klickt auf Pixel. Der Kater gibt Hinweise in drei Stufen, jeweils passend zum Rätsel, an dem der Spieler gerade am nächsten dran ist.

1. **Stups:** Pixel lenkt den Blick, ohne etwas zu verraten. Beispiel zu Rätsel 2: „Dieser Stabmacher sagt, der Stab wählt den Zauberer. Klingt, als bräuchte der Stab einen Grund, an dir zu kleben.“
2. **Hinweis:** Pixel nennt das Ziel und einen beteiligten Ort oder Gegenstand. Beispiel: „In der Taverne gibt's etwas Klebriges.“
3. **Lösung:** Pixel sagt genau, was zu tun ist, aber beleidigt: „Schmier Käse auf den Löffel. Ich bin ein Kater, kein Lösungsbuch.“

Zwischen den Stufen liegt eine kurze Wartezeit, damit Spieler nicht reflexartig durchklicken. Wer ohne Stufe 3 durchkommt, bekommt am Ende der Welt einen Kommentar von Pixel, der zugibt, beeindruckt zu sein.
