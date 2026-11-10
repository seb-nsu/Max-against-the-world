# Skript Zwischenspiele und Finale

Das Skript der drei Zwischenspiele (Rückkehren auf den Dachboden nach Welt 1, 2 und 3: Werbeblock, Artefakt-Abgabe, Passwort-Versuch, Pixels Notizbuch, Ansehen-Zeilen für den jeweiligen Dachboden-Zustand und Reisetasche packen mit Pixels Kommentaren) sowie des kompletten Finales (Heimkehr, Stufe 1 als Spielphase, Hilferuf, letztes Rätsel mit Hinweisen und Fehlversuchen, Stufe 2, Geburtstag, Abspann-Szene und Abspann): 168 Zeilen Zwischenspiele und 276 Zeilen Finale samt Abspann, zusammen 444. Kurzform wie im Prolog: ID, Sprecher, Text, Regie oder Auslöser; Bedingungen stehen in der letzten Spalte (Schalter FREUND\_0815 für Modell 08/15 als Freund, KEKSE\_DABEI für Omas Kekse: gesetzt, sobald die Kekstüte im Inventar ist, also eingepackt für Welt 4 oder im Finale aus der Fundkiste genommen, Goblin-Weg A/B, LUKE\_ERKANNT für den Abschluss von Finale Stufe 1). Sprecherkürzel neu: HAU für Modell 08/15, ZEL Zeldina, TOA Toadi, WAL Waldemar, FLI Flimmer, GER Gerd Glück, ARC Archimedes, RAM Ramses, HER Hermes, KAL Kalle; dazu die festen Kürzel OMA, MUT und NAR (Erzähler, Sprecher „–“) aus den Spielsystemen. Räume, Gegenstände und Schalter stehen in der [Welt-Tabelle Finale](../welten/finale.yaml), Abläufe, Lösungen und Hinweisstufen in [Rätsel Finale](../raetsel/finale.md). Ersatzzeilen gelten aus dem Prolog-Skript.

## 1. Zwischenspiel 1: Rückkehr nach Welt 1 (Kanal 3)

Szene. Fünf Sekunden Werbeblock auf dem Zapp-O-Mat (Milchglas, Kuh, Preisschild, Blitz), dann purzeln Max und Pixel aus dem Bildschirm. Dachboden am späten Nachmittag, das Licht durchs Dachfenster steht noch hoch. Max hält das Drachenei. Rückverwandlungs-Effekt (Glitzer, Plopp) beim Ablegen; Opa erklärt ihn weg, Max glaubt ihm.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| ZS1\_DACH\_NAR\_0010 | – | Werbeblock: Milchglas, Kuh, leeres Preisschild, Blitz. Fünf Sekunden, dann Rauschen. | Effekt Werbeblock, Jingle Werbeblock-Spot |
| ZS1\_DACH\_PIX\_0020 | Pixel | Milch. Fünf Sekunden Milch, und niemand weiß, warum. | kommt aus dem Bildschirm, schüttelt sich |
| ZS1\_DACH\_MAX\_0030 | Max | Welche Milch? Da war nur Rauschen. Und dann der Boden. Der kam sehr schnell. | landet auf dem Boden, Ei im Arm |
| ZS1\_DACH\_PIX\_0040 | Pixel | Ihr Menschen seht nie die Werbung, nur das Programm. Das ist euer ganzes Problem. |  |
| ZS1\_DACH\_OPA\_0050 | Opa | Max! Das Ei! Du hast das Ei! Ist es ganz? Sag, dass es ganz ist! | stürzt heran, Hände zittern |
| ZS1\_DACH\_MAX\_0060 | Max | Es ist ganz. Ich übrigens auch, falls das jemanden interessiert. Drei Tage Mittelalter, und keiner fragt. |  |
| ZS1\_DACH\_OPA\_0070 | Opa | Natürlich interessiert mich das! Beides! In der Reihenfolge. | nimmt das Ei wie ein Baby |
| ZS1\_DACH\_MAX\_0072 | Max | Der Drache hat ein bisschen geweint, als ich's mitgenommen hab. Er trägt jetzt Kopftuch und räumt auf. Lange Geschichte. |  |
| ZS1\_DACH\_OPA\_0074 | Opa | Drachen weinen immer, das ist die Luftfeuchtigkeit. Erzähl mir alles! Nein, warte. Erst das Ei. | wiegt das Ei |
| ZS1\_DACH\_OPA\_0080 | Opa | Der Eierkarton! Modell Spezialzwecke, sechsfach gepolstert. | holt einen gewöhnlichen Eierkarton von der Werkbank |
| ZS1\_DACH\_MAX\_0090 | Max | Opa, das ist ein Eierkarton. Da waren mal Eier drin. Ganz normale. |  |
| ZS1\_DACH\_OPA\_0100 | Opa | Für Spezialzwecke. Steht drauf. | zeigt auf eine Bleistiftkritzelei: „Spezialzwecke“ |
| ZS1\_DACH\_NAR\_0110 | – | Opa legt das Ei in den Karton. Glitzer, ein leises Plopp. Das Ei sieht plötzlich sehr nach Ei aus. | Effekt Verwandlung; Werkbank-Ablage Zustand 1 |
| ZS1\_DACH\_MAX\_0120 | Max | Komisch. Drüben war es größer. Und goldener. Und es hatte Schuppen, ich schwör's. |  |
| ZS1\_DACH\_OPA\_0130 | Opa | Rückverwandlungsschwund. Völlig normal. Drüben ist alles größer. Wie im Fernsehen. | schnell, zu schnell |
| ZS1\_DACH\_MAX\_0132 | Max | Rückverwandlungsschwund. Okay. Klingt, als hätte das schon mal jemand gemessen. | glaubt ihm |
| ZS1\_DACH\_PIX\_0140 | Pixel | Gestern noch Bio-Freiland mit eigenem Drachen. Heute Eierkarton. // Ich sage nichts. Ich bin nur ein Kater. // Ein Kater mit Augen. |  |
| ZS1\_DACH\_MAX\_0150 | Max | Okay. Ein Ding ist da, drei fehlen noch. Dann wär ein Viertel vom Passwort jetzt nur fair, oder? | Hände in der Bauchtasche |
| ZS1\_DACH\_OPA\_0160 | Opa | Fair! Weißt du, was fair ist? Der Zapp-O-Mat! Er wählt den Kanal nicht nach Laune, sondern nach Frequenz! | Finger erhoben, Vortragsmodus |
| ZS1\_DACH\_OPA\_0170 | Opa | 1962 hat man geglaubt, Fernsehen kommt aus der Steckdose. Ich habe bewiesen, dass es auch zurückgeht! // Die Antenne, Modell Kleiderbügel, ist nur das Empfangsorgan. Das Sendeorgan bist du! | Erklären-Animation |
| ZS1\_DACH\_MAX\_0180 | Max | Hast du das verstanden? Ich glaub, das war ein Nein. | zu Pixel |
| ZS1\_DACH\_PIX\_0190 | Pixel | Das war ein Nein mit Fußnoten. Dein Opa ist ein Vortrag auf Beinen. |  |
| ZS1\_DACH\_MAX\_0192 | Max | Ich hab da drüben einen Dunklen Lord zurück in die Schule geschickt, Opa. Mit einem Kochlöffel. |  |
| ZS1\_DACH\_OPA\_0194 | Opa | Siehst du! Und das ganz ohne WLAN. Stell dir vor, was du mit WLAN alles nicht geschafft hättest. | strahlt |
| ZS1\_DACH\_OPA\_0200 | Opa | Vier Dinge, ein Passwort. Ehrenwort eines Wissenschaftlers. Und jetzt: Kanal 7! |  |
| ZS1\_DACH\_MAX\_0202 | Max | Jetzt sofort? Ich bin gerade erst gelandet. Meine Schuhe sind noch im Mittelalter. |  |
| ZS1\_DACH\_OPA\_0204 | Opa | Erst wird gepackt, dann gedreht. Dreh am Knopf, wenn du so weit bist, und die Tasche steht bereit. | nickt zum Drehknopf |
| ZS1\_DACH\_PIX\_0210 | Pixel | Moment. Notizbuch. | springt auf die Werkbank, Pfote aufs Notizbuch |
| ZS1\_DACH\_PIX\_0220 | Pixel | Ein Ei, weich, zum Frühstück. Das kommt auf meine Liste. // Nicht dieses Ei. Dieses Ei hat eine Vorgeschichte. | Notizbuch Seite 3, Eintrag 1; Jingle Notizbuch |
| ZS1\_DACH\_MAX\_0230 | Max | Du hast die Liste wirklich angefangen. |  |
| ZS1\_DACH\_PIX\_0240 | Pixel | Jeder braucht eine Liste. Deine ist leer. Meine hat Ziele. // Ziel eins: weich. Ziel zwei: kommt noch. |  |

Ansehen auf dem Dachboden, Zustand später Nachmittag. Alle Prolog-Zeilen der unveränderten Objekte bleiben gültig; hier nur, was sich verändert hat.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS1\_DACH\_MAX\_0310 | Max | Ein Ei in einem Eierkarton. Auf einer Werkbank. Das Normalste, was ich heute gesehen habe. | Ansehen: Werkbank-Ablage (Ei) |
| ZS1\_DACH\_MAX\_0315 | Max | Ein Drache hat das Ei gewärmt, als wär's sein eigenes. Jetzt liegt es neben Schrauben. Opa hat ein Talent für Ehrfurcht. | Ansehen: Werkbank-Ablage (Ei), zweites Mal |
| ZS1\_DACH\_PIX\_0320 | Pixel | Es liegt da, als gehöre es hierher. Beunruhigend. | Ansehen: Werkbank-Ablage, zweites Mal |
| ZS1\_DACH\_MAX\_0330 | Max | Das Licht hat sich kaum bewegt. Drüben war ich Tage weg. Hier fehlt eine Folge, höchstens. | Ansehen: Dachfenster |
| ZS1\_DACH\_MAX\_0335 | Max | Eine Fliege läuft über das Glas. Dieselbe wie heute Morgen. Sie hat nicht mal gemerkt, dass ich weg war. | Ansehen: Dachfenster, zweites Mal |
| ZS1\_DACH\_MAX\_0340 | Max | Der rote Kreis. Immer noch da. Immer noch kein Zahnarzt, wenn ich Opa ansehe. | Ansehen: Kalender |
| ZS1\_DACH\_MAX\_0345 | Max | Ich hab nachgezählt, wie viele Tage bis zum Kreis. Es sind keine mehr. Opa weiß das. Opa schwitzt. | Ansehen: Kalender, zweites Mal |
| ZS1\_DACH\_MAX\_0350 | Max | Kanal 3 läuft noch. Ich sehe den Turm. Zeldina hängt Gardinen auf. | Ansehen: Zapp-O-Mat |
| ZS1\_DACH\_PIX\_0355 | Pixel | Zeldina misst die Gardinen mit dem Zollstock. Zweimal. Wer zweimal misst, hat schon mal einen Prinzen gehabt, der nicht kam. | Ansehen: Zapp-O-Mat, zweites Mal |
| ZS1\_DACH\_PIX\_0360 | Pixel | Siebzehn Fernbedienungen, und dein Opa fragt dich, ob du seine gesehen hast. // Denk darüber nach. Ich tu's schon länger. | Ansehen: Kiste mit Fernbedienungen |
| ZS1\_DACH\_PIX\_0365 | Pixel | Eine Fernbedienung hat Bissspuren. Die sind nicht von mir. Ich sage das nur, weil gleich jemand fragt. | Ansehen: Kiste mit Fernbedienungen, zweites Mal |
| ZS1\_DACH\_MAX\_0370 | Max | Der Sessel. Noch bequemer als vorhin. Er hat auf mich gewartet. | Ansehen: Ohrensessel |
| ZS1\_DACH\_MAX\_0375 | Max | Ich setz mich nicht rein. Wer sich da reinsetzt, wacht in drei Jahren auf und hat einen Bart. | Ansehen: Ohrensessel, zweites Mal |

Gespräch mit Opa in der freien Phase (Regel wie im Prolog: Max stellt die Frage, gelesene Optionen verschwinden, „Ich geh packen“ bleibt). Die Prolog-Optionen gelten im Zwischenspiel nicht mehr; ist alles gefragt, kommen Opas Abschiedszeilen aus dem Prolog.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| ZS1\_DACH\_MAX\_0380 | Max | Opa, was wird das eigentlich mit den vier Dingen? | Option Opa |
| ZS1\_DACH\_OPA\_0390 | Opa | Ein Werk. Ein großes, dunkles, warmes Werk. Mehr sage ich nicht, sonst geht es nicht auf. | geheimnisvoll, dann erschrocken über sich selbst |
| ZS1\_DACH\_MAX\_0400 | Max | „Aufgehen.“ Wie ein Plan. |  |
| ZS1\_DACH\_PIX\_0410 | Pixel | Wie ein Plan. Sicher. | schnuppert Richtung Opa |
| ZS1\_DACH\_MAX\_0430 | Max | Wie lange war ich eigentlich weg? | Option Opa |
| ZS1\_DACH\_OPA\_0432 | Opa | Eine Folge. Mit Werbung. Drüben läuft die Zeit schneller, der Zapp-O-Mat spult vor. Deshalb merkt deine Mutter nichts. | zufrieden |
| ZS1\_DACH\_MAX\_0434 | Max | Drüben waren es Tage. Meine Füße wissen das. |  |
| ZS1\_DACH\_PIX\_0436 | Pixel | Meine auch. Alle vier. |  |
| ZS1\_DACH\_MAX\_0440 | Max | Was kommt auf Kanal 7? | Option Opa |
| ZS1\_DACH\_OPA\_0442 | Opa | Die Antike! Pyramiden, Philosophen, Olympia. Und ein Pharao, der sich nicht entscheiden kann. | Finger erhoben |
| ZS1\_DACH\_MAX\_0444 | Max | Wofür entscheiden? |  |
| ZS1\_DACH\_OPA\_0446 | Opa | Für irgendwas. Seit Jahren. Da unten wird alles in dreifacher Ausfertigung erledigt. Nimm was mit, das Ordnung schafft. | Hinweis auf die Sortierende Socke |
| ZS1\_DACH\_MAX\_0450 | Max | Der rote Kreis im Kalender. Da sind keine Tage mehr bis dahin. | Option Opa |
| ZS1\_DACH\_OPA\_0452 | Opa | Ein Termin. Ein runder. Deshalb ja der Kreis. Völlig logisch. | schaut auf die Werkbank, nicht auf Max |
| ZS1\_DACH\_PIX\_0454 | Pixel | Er riecht wieder nach Angst. Und nach Kuchen. Zweimal dieselbe Ausrede, das ist schon Tradition. |  |
| ZS1\_DACH\_MAX\_0460 | Max | Ich geh packen. | Option Opa, beendet das Gespräch |
| ZS1\_DACH\_OPA\_0462 | Opa | Der Knopf wartet. Die Tasche auch, und die ist strenger als ich. | zeigt zum Drehknopf |

Fundkiste (neu am Kistenstapel, ab Zwischenspiel 1):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS1\_DACH\_MAX\_0420 | Max | Opas Fundkiste. Alles, was nicht in die Tasche passt. Opa wirft nichts weg. Er nennt das Archiv. | Ansehen: Fundkiste; gilt in allen drei Zwischenspielen |
| ZS1\_DACH\_MAX\_0425 | Max | Ganz unten in der Kiste liegt ein Zauberwürfel. Halb gelöst. Seit 1982. Opa nennt das Langzeitprojekt. | Ansehen: Fundkiste, zweites Mal; gilt in allen drei Zwischenspielen |

Reisetasche packen für Welt 2. Bildschirm Reisetasche (eigene Überlagerung aus den Spielsystemen, keine der 14 Nahansichten): Pflichtfach (Notizbuch, Thunfischdose, Kochlöffel) ist gefüllt, zwei Wahlfächer sind leer. Das Packen beginnt, sobald Max in der freien Phase den Drehknopf benutzt: Opa hält ihn auf und öffnet die Tasche (0510); nach dem Bestätigen folgen Opas Abschied und der zweite Dreh am Knopf (0660). So läuft es in allen drei Zwischenspielen. Daneben liegen alle Gegenstände, die Max aus Welt 1 noch hat, dazu der Dosenöffner aus dem Prolog, den Opa aufgehoben hat. Pixel kommentiert jeden beim Berühren; der Kommentar ist kryptisch, aber ehrlich. Was nicht eingepackt wird, legt Opa in die „Fundkiste“ auf dem Dachboden.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS1\_DACH\_OPA\_0510 | Opa | Zwei Wahlfächer. Nicht mehr. Die Tasche hat Prinzipien. | öffnet die Tasche, Bildschirm Reisetasche |
| ZS1\_DACH\_MAX\_0512 | Max | Zwei? Ich hab ein halbes Mittelalter in den Taschen. |  |
| ZS1\_DACH\_OPA\_0514 | Opa | Der Rest kommt in die Fundkiste. Ich werfe nichts weg. Nie. | klopft auf die Kiste am Kistenstapel |
| ZS1\_DACH\_PIX\_0520 | Pixel | Der Kochlöffel reist jetzt immer mit. Er hat sich das verdient. // Und er klebt noch. | Berühren: Kochlöffel (Pflichtfach) |
| ZS1\_DACH\_PIX\_0530 | Pixel | Der Thunfisch bleibt. Das ist kein Gepäck, das ist Religion. | Berühren: Thunfischdose (Pflichtfach) |
| ZS1\_DACH\_PIX\_0535 | Pixel | Das Notizbuch. Da steht meine Liste drin. Das reist mit, solange ich atme. | Berühren: Notizbuch (Pflichtfach) |
| ZS1\_DACH\_PIX\_0540 | Pixel | Die Socke sortiert alles, was man ihr gibt. Wo es Beamte gibt, gibt es Stapel. | Berühren: Sortierende Socke |
| ZS1\_DACH\_PIX\_0550 | Pixel | Ein Ziegenfell. Ich habe darin gelebt. Ich spreche nicht darüber. // Wo es heiß ist, braucht das niemand. | Berühren: Ziegenfell-Vorleger |
| ZS1\_DACH\_PIX\_0560 | Pixel | Moderworts Zeugnis. Ungenügend in Zaubertränke. // Beeindruckt niemanden, außer Müttern. | Berühren: Moderworts Zeugnis |
| ZS1\_DACH\_PIX\_0570 | Pixel | Der Eimer. Waldemar hat ihn zurückgegeben, Regel 14b. // Am Nil gibt es genug Wasser. Und genug Krokodile. | Berühren: Eimer |
| ZS1\_DACH\_PIX\_0580 | Pixel | Ein Dosenöffner. Kurbelt. Braucht keinen Strom. // Merk dir das. Irgendwann braucht alles Strom. | Berühren: Dosenöffner |
| ZS1\_DACH\_PIX\_0590 | Pixel | Der Leuchttrank. Leuchtet. Drüben scheint die Sonne. Rechne selbst. | Berühren: Leuchttrank; nur Goblin-Weg B |
| ZS1\_DACH\_PIX\_0600 | Pixel | Ketchup. Gilt als Blut, als Soße und als Unterschrift. // In der Antike kennt das keiner. Chance oder Problem. | Berühren: Ketchup; nur Goblin-Weg B |
| ZS1\_DACH\_MAX\_0610 | Max | Zwei Fächer, zwei Dinge. Wie ein Handy mit zwei Apps. Schmerzhaft. | Beim Versuch, ein drittes einzupacken |
| ZS1\_DACH\_PIX\_0620 | Pixel | Volle Tasche, leere Pfoten. Ich trage ohnehin nichts. | Bestätigen der Auswahl |
| ZS1\_DACH\_OPA\_0630 | Opa | Diesmal kein Zettel. Ich hab vorgearbeitet. Drüben wartet die Post auf dich. | schließt die Tasche |
| ZS1\_DACH\_MAX\_0640 | Max | Moment. Du hast mir Post in die Antike geschickt? Wie denn? |  |
| ZS1\_DACH\_OPA\_0650 | Opa | Per Boten. Der kommt zu spät, aber er kommt. Kanal 7, Max! Und wenn du Ramses siehst: Er soll sich entscheiden! | zeigt auf den Drehknopf |
| ZS1\_DACH\_MAX\_0660 | Max | Kanal 7. | Benutzen: Drehknopf; Wirbel, Übergang Welt 2 |
| ZS1\_DACH\_PIX\_0670 | Pixel | Erst Fernsehreisen, jetzt Zeitreisen. Ich hab's erwähnt. Ich erwähne es auf jedem Kanal. | hinterher |

Hilfe-Pfote in den Zwischenspielen: Es gibt kein Rätsel, offen ist nur das Packen. Pixel sagt in allen drei Zwischenspielen dieselbe Zeile.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS1\_HINT\_PIX\_0010 | Pixel | Tasche packen, Knopf drehen. Mehr ist hier nicht zu tun. Ich hätte es gern komplizierter. | Hilfe-Pfote in Zwischenspiel 1 bis 3, nichts offen |

## 2. Zwischenspiel 2: Rückkehr nach Welt 2 (Kanal 7)

Szene. Werbeblock, dann Ankunft. Dachboden am frühen Abend, das Licht liegt flacher und wärmer, die Lampe ist noch aus. Max trägt den Goldenen Sack Pharaonenkorn. Der rote Kreis im Kalender ist jetzt doppelt umrandet. Max ist ein Stück weniger maulig als bei der ersten Rückkehr.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| ZS2\_DACH\_NAR\_0010 | – | Werbeblock: Milchglas, Kuh, Preisschild, Blitz. Fünf Sekunden. | Effekt Werbeblock, Jingle Werbeblock-Spot |
| ZS2\_DACH\_PIX\_0020 | Pixel | Schon wieder Milch. Dieselbe Kuh. Sie hat mich angesehen. | kommt aus dem Bildschirm |
| ZS2\_DACH\_MAX\_0030 | Max | Du siehst Kühe im Rauschen. Ich sehe Sand in meinen Schuhen. | klopft die Sneaker aus, Sand rieselt |
| ZS2\_DACH\_OPA\_0040 | Opa | Das Korn! Der goldene Sack! Max, du bist ein Held! Ein Held, Modell Enkel! | stürzt heran |
| ZS2\_DACH\_MAX\_0050 | Max | Ramses hat sich entschieden. Hat nur drei Tage gedauert. |  |
| ZS2\_DACH\_OPA\_0060 | Opa | Drei Tage! Hier waren es zwanzig Minuten. Der Zapp-O-Mat komprimiert. Wie ein Schnellkochtopf. |  |
| ZS2\_DACH\_NAR\_0070 | – | Opa stellt den Sack neben den Eierkarton. Glitzer, Plopp. Der Sack wirkt kleiner, papierener und sehr viel weniger golden. | Effekt Verwandlung; Werkbank-Ablage Zustand 2 |
| ZS2\_DACH\_OPA\_0080 | Opa | Rückverwandlungsschwund. Sagte ich doch. | klopft den Sack ab |
| ZS2\_DACH\_NAR\_0090 | – | Eine Staubwolke steigt auf. Pixel niest. | Staubwolke-Effekt |
| ZS2\_DACH\_PIX\_0100 | Pixel | Hatschi. // Bäckerei. | niest, dann trocken |
| ZS2\_DACH\_MAX\_0110 | Max | Was? |  |
| ZS2\_DACH\_PIX\_0120 | Pixel | Es riecht nach Bäckerei. Ich sage nur, was meine Nase sagt. // Meine Nase lügt nur bei Fisch. Das hier ist kein Fisch. |  |
| ZS2\_DACH\_OPA\_0130 | Opa | Das ist der Duft der Pharaonen! Uralt! Legendär! | schiebt den Sack ein Stück weiter von Pixel weg |
| ZS2\_DACH\_MAX\_0140 | Max | Opa. Zwei von vier. Das ist die Hälfte. In jeder Serie wäre das die Midseason-Pause. |  |
| ZS2\_DACH\_OPA\_0150 | Opa | Und? |  |
| ZS2\_DACH\_MAX\_0160 | Max | Halbes Passwort. Oder … ich helfe dir dafür. Im Haushalt. Abwaschen oder so. | sieht weg, als hätte er sich versprochen |
| ZS2\_DACH\_NAR\_0170 | – | Opa sagt nichts. Opa sagt sehr lange nichts. | Opa friert ein, Pixel starrt |
| ZS2\_DACH\_PIX\_0180 | Pixel | Ist er kaputt? Hast du ihn kaputt gemacht? |  |
| ZS2\_DACH\_OPA\_0190 | Opa | Du hast gerade … Haushalt gesagt. Freiwillig. | heiser |
| ZS2\_DACH\_MAX\_0200 | Max | Ich nehme es zurück. |  |
| ZS2\_DACH\_OPA\_0210 | Opa | Zu spät! Ich hab's gehört! Der Kater hat's gehört! Aber das Passwort gibt es trotzdem erst nach dem vierten Ding. | wieder ganz der Alte |
| ZS2\_DACH\_MAX\_0220 | Max | Natürlich. |  |
| ZS2\_DACH\_PIX\_0230 | Pixel | Notizbuch. Zweiter Eintrag: Irgendwas aus Mehl, mit Kruste. // Nicht dieser Sack. Dieser Sack hat ein Siegel mit einer Zahl drauf, und ich mag Zahlen nicht. | Notizbuch Seite 3, Eintrag 2; Jingle Notizbuch |
| ZS2\_DACH\_MAX\_0240 | Max | Vierhundertfünf. Ich hab's gesehen. Klingt wie ein Fehlercode. |  |
| ZS2\_DACH\_PIX\_0250 | Pixel | Klingt wie etwas anderes. Aber bitte. Fehlercode. |  |

Ansehen auf dem Dachboden, Zustand früher Abend.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS2\_DACH\_MAX\_0310 | Max | Ein Ei und ein Sack Mehl. Wenn da noch Zucker dazukommt, wird mir das zu häuslich. | Ansehen: Werkbank-Ablage (Ei, Sack) |
| ZS2\_DACH\_MAX\_0315 | Max | Ei und Mehl nebeneinander. Ich seh sie an und denk an nichts. Ganz bewusst an nichts. | Ansehen: Werkbank-Ablage (Ei, Sack), zweites Mal |
| ZS2\_DACH\_PIX\_0320 | Pixel | Ei. Mehl. Ich zähle nicht laut mit. Ich zähle leise. // Bei vier sage ich etwas. | Ansehen: Werkbank-Ablage, zweites Mal |
| ZS2\_DACH\_MAX\_0330 | Max | Der rote Kreis ist jetzt doppelt umrandet. Jemand hat Angst, ihn zu übersehen. | Ansehen: Kalender |
| ZS2\_DACH\_MAX\_0335 | Max | Ich frag Opa nicht, was das ist. Er hat den Kalender angesehen, als würde er ihn gleich anschreien. | Ansehen: Kalender, zweites Mal |
| ZS2\_DACH\_OPA\_0340 | Opa | Der zweite Kreis? Ein Verstärkungskreis. Rein technisch. | Reden: Opa nach Kalender |
| ZS2\_DACH\_PIX\_0350 | Pixel | Er lügt wieder. Es riecht nach Angst. Und jetzt auch nach Mehl. |  |
| ZS2\_DACH\_MAX\_0360 | Max | Das Licht ist orange geworden. Drüben waren es drei Tage. Hier ist noch nicht mal Abendessen. | Ansehen: Dachfenster |
| ZS2\_DACH\_MAX\_0365 | Max | Die Sonne steht so tief, dass Pixels Schatten aussieht wie ein Tiger. Er weiß das. Er bleibt genau da liegen. | Ansehen: Dachfenster, zweites Mal |
| ZS2\_DACH\_MAX\_0370 | Max | Kanal 7. Hermes steht noch da und winkt. Er wird zu spät merken, dass ich weg bin. | Ansehen: Zapp-O-Mat |
| ZS2\_DACH\_MAX\_0375 | Max | Im Hintergrund trainiert Leonidas. Ich hör ihn sogar durch den Lautsprecher. Er brüllt in Mono. | Ansehen: Zapp-O-Mat, zweites Mal |
| ZS2\_DACH\_MAX\_0380 | Max | Ein Eierkarton, ein Mehlsack, eine Werkbank. Wenn ich nicht wüsste, dass Opa die Welt rettet, würde ich sagen: Küche. | Ansehen: Werkbank |
| ZS2\_DACH\_PIX\_0385 | Pixel | Mehl, Eier, Werkbank. Wenn er jetzt noch eine Schürze anzieht, ziehe ich aus. | Ansehen: Werkbank, zweites Mal |
| ZS2\_DACH\_PIX\_0390 | Pixel | Siebzehn Fernbedienungen. Keine davon ist golden. Noch nicht. | Ansehen: Kiste mit Fernbedienungen |
| ZS2\_DACH\_PIX\_0395 | Pixel | Ich hab sie sortiert. Nach Geschmack. Die mit Gummitasten schmecken am besten. Erzähl es niemandem. | Ansehen: Kiste mit Fernbedienungen, zweites Mal |
| ZS2\_DACH\_MAX\_0400 | Max | Der Sessel. Ich war in der Antike. Ich habe mir Sitzen verdient. Später. | Ansehen: Ohrensessel |
| ZS2\_DACH\_MAX\_0405 | Max | Auf der Armlehne ist ein Abdruck von Opas Ellbogen. Tief. Der Sessel kennt Opa länger als ich. | Ansehen: Ohrensessel, zweites Mal |
| ZS2\_DACH\_MAX\_0410 | Max | Opa, warum muss das Korn „fein wie Staub“ sein? | Reden: Opa, Option |
| ZS2\_DACH\_OPA\_0420 | Opa | Weil Klumpen alles ruinieren. Alles! Ein Klumpen, und das Werk fällt in sich zusammen. | dramatisch |
| ZS2\_DACH\_MAX\_0430 | Max | Das Werk. Das zusammenfällt. Wenn es Klumpen hat. |  |
| ZS2\_DACH\_OPA\_0440 | Opa | So ist Wissenschaft. Frag nicht weiter, du bringst mich durcheinander. |  |

Reisetasche packen für Welt 3. Gegenstände aus Welt 1, die Max damals eingepackt hatte, bekommen ihre Zeile aus Zwischenspiel 1; neu sind die Dinge aus Welt 2. Das Olivenöl ist der Schlüssel zu Modell 08/15 (Welt 3) und damit zum Roboter im Finale; Pixels Kommentar ist deshalb der deutlichste.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS2\_DACH\_OPA\_0510 | Opa | Die Tasche! Zwei Fächer. Was nicht mitkommt, kommt in die Fundkiste. Ich werfe nichts weg. Nie. | öffnet die Tasche, Bildschirm Reisetasche |
| ZS2\_DACH\_PIX\_0520 | Pixel | Olivenöl. Für alles, was quietscht. Auch für Blechköpfe. // Wo du hinfährst, quietscht viel. | Berühren: Olivenöl |
| ZS2\_DACH\_PIX\_0530 | Pixel | Eine geflügelte Sandale. Nur eine. Die andere ist jetzt ein Religionsgegenstand. // Leicht, flattert, hat Eigenschaften. Eigenschaften kann man tauschen. Sagt man. | Berühren: Hermes' geflügelte Sandale |
| ZS2\_DACH\_PIX\_0540 | Pixel | Der Olivenkranz. Gold, das kein Gold ist. Passt zu allem anderen hier. // Essbar, theoretisch. Ich habe probiert. Nein. | Berühren: Olivenkranz |
| ZS2\_DACH\_PIX\_0550 | Pixel | „Die sieben Antworten.“ Sieben Konter, kein einziger gegen eine Küchenmaschine. // Trotzdem: Papier brennt gut. Falls es kalt wird. | Berühren: Schriftrolle „Die sieben Antworten“ |
| ZS2\_DACH\_PIX\_0560 | Pixel | Dein Handy. Drei Prozent. Es hat mehr Welten gesehen als du Ladekabel. // Drüben gibt es Strom. Ob er dir gehört, ist eine andere Frage. | Berühren: Handy; nur wenn in Welt 2 nicht verbraucht |
| ZS2\_DACH\_PIX\_0570 | Pixel | Kaugummi. Ewiges Brot. In der Zukunft gilt es vermutlich als Antiquität. | Berühren: Kaugummi; nur wenn in Welt 2 nicht verbraucht |
| ZS2\_DACH\_PIX\_0580 | Pixel | Der Kugelschreiber. Beamte fürchten ihn. Maschinen vermutlich nicht. | Berühren: Kugelschreiber; nur wenn in Welt 2 nicht verbraucht |
| ZS2\_DACH\_PIX\_0590 | Pixel | Der Diskus. Oder was du geworfen hast. Rund, flach, fliegt. // Wo du hinfährst, fliegt alles von selbst. | Berühren: Diskus oder Ersatz; nur wenn behalten |
| ZS2\_DACH\_MAX\_0600 | Max | Zwei Fächer. Ich will einen Rucksack. Einen mit Cloud. | Beim Versuch, ein drittes einzupacken |
| ZS2\_DACH\_PIX\_0610 | Pixel | Gepackt. Ich habe nichts getragen und bin trotzdem erschöpft. | Bestätigen der Auswahl |
| ZS2\_DACH\_OPA\_0620 | Opa | Kanal 42. Die Zukunft. Dort gibt es eine … Dame, die alles besser weiß. Hör nicht auf sie. Hör auf dich. | ernst, kurz |
| ZS2\_DACH\_MAX\_0630 | Max | Du warst da? |  |
| ZS2\_DACH\_OPA\_0640 | Opa | Ich habe Prospekte gesehen. Kanal 42, Max! Und bring den Kern heil zurück! | zu schnell, zeigt auf den Drehknopf |
| ZS2\_DACH\_PIX\_0650 | Pixel | „Prospekte.“ Er hat „Prospekte“ gesagt. Ich lege das ab. Ganz hinten. | zu Max |
| ZS2\_DACH\_MAX\_0660 | Max | Kanal 42. | Benutzen: Drehknopf; Wirbel, Übergang Welt 3 |
| ZS2\_DACH\_PIX\_0670 | Pixel | Zukunft. Dort gibt es vermutlich Dosenfutter aus dem Drucker. Ich bin dagegen. Jetzt schon. | hinterher |

## 3. Zwischenspiel 3: Rückkehr nach Welt 3 (Kanal 42)

Szene. Werbeblock, dann Ankunft. Abendrot durchs Dachfenster, Opa hat die Lampe angeknipst. Max trägt die Ewige Energiezelle, sie glüht orange. Die Kiste mit den kaputten Fernbedienungen steht ab jetzt offen. Omas Kekse sind auf dem Dachboden Hundekuchen (Verwandlungsregel aus Welt 3 gilt in jeder Realität). Max steht spürbar aufrechter.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| ZS3\_DACH\_NAR\_0010 | – | Werbeblock: Milchglas, Kuh, Preisschild, Blitz. Fünf Sekunden. | Effekt Werbeblock, Jingle Werbeblock-Spot |
| ZS3\_DACH\_PIX\_0020 | Pixel | Dreimal Milch. Das ist keine Werbung mehr. Das ist eine Botschaft. // Jemand will, dass wir etwas kaufen. Ich ahne, wer. | kommt aus dem Bildschirm, sieht Opa an |
| ZS3\_DACH\_MAX\_0030 | Max | Es regnet nicht mehr. Ich hatte vergessen, wie das ist. | sieht an sich herunter, noch nass |
| ZS3\_DACH\_OPA\_0040 | Opa | Die Zelle. Die Ewige Energiezelle. Gib sie mir. Langsam. Mit beiden Händen. | kommt mit ausgestreckten Armen, fast andachtsvoll |
| ZS3\_DACH\_MAX\_0050 | Max | Sie ist warm. Nicht mehr heiß. Lange Geschichte mit einer Küchenmaschine. | reicht sie über |
| ZS3\_DACH\_NAR\_0060 | – | Opa hält die Zelle ins Licht. Glitzer, Plopp. Sie ist jetzt genau so groß wie sein kleiner Finger. | Effekt Verwandlung |
| ZS3\_DACH\_OPA\_0070 | Opa | Rückverwandlungs… | fängt an |
| ZS3\_DACH\_MAX\_0080 | Max | …schwund. Ich weiß. |  |
| ZS3\_DACH\_NAR\_0090 | – | Opa trägt die Zelle quer über den Dachboden, öffnet die Kiste mit den kaputten Fernbedienungen und legt sie hinein. Dann schließt er die Kiste nicht. | Kiste bleibt offen |
| ZS3\_DACH\_MAX\_0100 | Max | Du legst die ewige Energiequelle der Menschheit zu deinem Fernbedienungsschrott. |  |
| ZS3\_DACH\_OPA\_0110 | Opa | Dort ist sie am sichersten. Niemand sucht Wertvolles bei Fernbedienungen. Das weiß ich aus Erfahrung. | ausweichend |
| ZS3\_DACH\_PIX\_0120 | Pixel | Seltsam, sagt Max. Verdächtig, sage ich. // Ich bin der, der recht hat. Statistisch. | zu Max |
| ZS3\_DACH\_NAR\_0130 | – | Pixel springt in die Kiste, wühlt, taucht mit der Zelle im Maul wieder auf. Er legt sie auf die Werkbank, genau neben Ei und Mehl. | Werkbank-Ablage Zustand 3, Zelle glüht |
| ZS3\_DACH\_PIX\_0140 | Pixel | Reliquien gehören auf den Altar. Zu den anderen Reliquien. // Ei. Mehl. Und ein Ding, das in eine Fernbedienung passt. // Ich sage nichts. Ich lege es nur hin. | setzt sich kerzengerade, Schwanz um die Pfoten |
| ZS3\_DACH\_OPA\_0150 | Opa | Der Kater sortiert um. Wie im Labor. Schön. Toll. | schwitzt |
| ZS3\_DACH\_MAX\_0160 | Max | Drei von vier. Das Passwort ist „Kuchen123“. Oder? | trocken, aus dem Nichts |
| ZS3\_DACH\_NAR\_0170 | – | Opa verschluckt sich. | Panik-Animation, kurz |
| ZS3\_DACH\_OPA\_0180 | Opa | Knapp. Erschreckend knapp. Wer hat dir das gesagt? Der Kater? |  |
| ZS3\_DACH\_MAX\_0190 | Max | Du. Gerade eben. |  |
| ZS3\_DACH\_OPA\_0200 | Opa | Es ist nicht „Kuchen123“. Es ist etwas völlig anderes mit einer völlig anderen Zahl. Vierter Gegenstand. Dann. | fest |
| ZS3\_DACH\_PIX\_0210 | Pixel | Notizbuch. Dritter Eintrag: Batterien für den elektrischen Dosenöffner bei Oma. // Ja, ich weiß, wie das klingt. Nein, ich erkläre es nicht. | Notizbuch Seite 3, Eintrag 3; Jingle Notizbuch |
| ZS3\_DACH\_MAX\_0220 | Max | Ei, Mehl, Batterien. Pixel, deine Liste sieht aus wie ein Einkaufszettel. |  |
| ZS3\_DACH\_PIX\_0230 | Pixel | Alle guten Listen sehen so aus. Endlich merkst du etwas. Nur das Falsche. |  |

Ansehen auf dem Dachboden, Zustand Abendrot mit Lampe.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS3\_DACH\_MAX\_0310 | Max | Ei, Mehl, glühende Batterie. Fehlt nur noch ein Rezept. Haha. Nein. Weltuntergang. Konzentration. | Ansehen: Werkbank-Ablage (Ei, Sack, Zelle) |
| ZS3\_DACH\_MAX\_0315 | Max | Die Zelle summt, das Mehl rieselt, das Ei liegt still. Das ist eine Band, und das Ei ist der Schlagzeuger, der nie kommt. | Ansehen: Werkbank-Ablage (Ei, Sack, Zelle), zweites Mal |
| ZS3\_DACH\_PIX\_0320 | Pixel | Drei. Ich habe bis drei gezählt. Bei vier sage ich etwas. Ich habe es versprochen. | Ansehen: Werkbank-Ablage, zweites Mal |
| ZS3\_DACH\_MAX\_0330 | Max | Die Kiste steht offen. Siebzehn Fernbedienungen gucken raus wie Vogelküken. | Ansehen: Kiste mit Fernbedienungen |
| ZS3\_DACH\_MAX\_0335 | Max | Eine Fernbedienung ist runtergefallen und hat dabei den Fernseher angeschaltet. Selbst hier unten ist alles verkabelt. | Ansehen: Kiste mit Fernbedienungen, zweites Mal |
| ZS3\_DACH\_PIX\_0340 | Pixel | Alle kaputt. Alle ohne Batterie. Jemand hat hier sehr lange nach etwas gesucht. | Ansehen: Kiste, zweites Mal |
| ZS3\_DACH\_MAX\_0350 | Max | Abendrot. Drüben war ich eine Woche im Regen. Hier ist nicht mal die Tagesschau vorbei. | Ansehen: Dachfenster |
| ZS3\_DACH\_MAX\_0355 | Max | Draußen fliegt ein Flugzeug vorbei. Es ist nicht mal fliegend-autos-schnell. Ich hab mich an die Zukunft gewöhnt. Schlecht. | Ansehen: Dachfenster, zweites Mal |
| ZS3\_DACH\_MAX\_0360 | Max | Doppelt umrandet. Und jetzt ein Ausrufezeichen daneben. Dieser Tag ist heute. Heute ist bald vorbei. | Ansehen: Kalender |
| ZS3\_DACH\_MAX\_0365 | Max | Das Ausrufezeichen hat Opa so fest gemalt, dass der Stift durch das Papier ist. Er meint es ernst. Mit was auch immer. | Ansehen: Kalender, zweites Mal |
| ZS3\_DACH\_OPA\_0370 | Opa | Das Ausrufezeichen? Ein Betonungszeichen. Wissenschaftlich. | Reden: Opa nach Kalender |
| ZS3\_DACH\_PIX\_0380 | Pixel | Angst, Mehl und jetzt Verzweiflung. Seine Nase würde lügen. Meine nicht. |  |
| ZS3\_DACH\_MAX\_0390 | Max | Kanal 42. Kalle winkt. Modell 08/15 wischt den Regen weg. Einzeln. | Ansehen: Zapp-O-Mat; nur mit FREUND\_0815 |
| ZS3\_DACH\_MAX\_0395 | Max | Modell 08/15 winkt mit dem Mopp. Ich wink zurück. Es ist, als hätte ich einen Brieffreund mit Putzplan. | Ansehen: Zapp-O-Mat, zweites Mal; nur mit FREUND\_0815 |
| ZS3\_DACH\_MAX\_0400 | Max | Kanal 42. Kalle winkt. Im Hintergrund sucht ein Roboter eine Frau namens Konner. Immer noch. | Ansehen: Zapp-O-Mat; ohne FREUND\_0815 |
| ZS3\_DACH\_MAX\_0405 | Max | Er sucht und sucht. Ich hätte ihm helfen können. Ich hab's nicht. Das bleibt mir hängen. | Ansehen: Zapp-O-Mat, zweites Mal; ohne FREUND\_0815 |
| ZS3\_DACH\_MAX\_0410 | Max | Opas Lampe. Sie brummt. Alles hier brummt, wenn es Strom bekommt. Außer Pixel. | Ansehen: Lampe |
| ZS3\_DACH\_PIX\_0415 | Pixel | Sie brummt. Ich brumme auch, aber nur, wenn man mich streichelt. Die Lampe macht das umsonst. Billig. | Ansehen: Lampe, zweites Mal |
| ZS3\_DACH\_MAX\_0420 | Max | Der Sessel. Unter ihm ist Staub, über ihm bin bald ich. Nach dem vierten Ding. | Ansehen: Ohrensessel |
| ZS3\_DACH\_MAX\_0425 | Max | Ich darf noch nicht. Aber ich hab mir den Platz schon mal angeschaut. Die Delle ist meine Größe. | Ansehen: Ohrensessel, zweites Mal |
| ZS3\_DACH\_MAX\_0430 | Max | Ein altes Kochbuch. Die Seite mit dem Eselsohr ist jetzt aufgeschlagen. Da steht „Vorheizen“. Unterstrichen. | Ansehen: Kochbuch; neu ab ZS3 |
| ZS3\_DACH\_MAX\_0435 | Max | Auf der Seite ist ein Fettfleck in Form eines Herzens. Kochbücher haben auch Gefühle. Meins nicht. Ich hab keins. | Ansehen: Kochbuch, zweites Mal; neu ab ZS3 |
| ZS3\_DACH\_PIX\_0440 | Pixel | Vorheizen. Merk dir das Wort. Es kommt wieder. |  |
| ZS3\_DACH\_MAX\_0450 | Max | Opa, was genau passiert, wenn das vierte Ding da ist? | Reden: Opa, Option |
| ZS3\_DACH\_OPA\_0460 | Opa | Dann wird es warm. Dann wird es dunkel. Dann wird es gut. // Oder alles bricht zusammen und ich muss in ein anderes Land ziehen. | ernst, dann leiser |
| ZS3\_DACH\_MAX\_0470 | Max | Das klingt nach einem Plan mit Stufen. |  |
| ZS3\_DACH\_PIX\_0480 | Pixel | Mit Stufen. Und einer Ofentür. Ich schweige. Ab jetzt. | sieht weg |

Reisetasche packen für Welt 4. Neu sind die Dinge aus Welt 3. Omas Kekse liegen als Hundekuchen neben der Tasche; Pixel kommentiert sie mit seinem entsetzten Gesicht. Ob Max sie einpackt oder in der Fundkiste lässt, ist egal: Beides reicht für den Bonus-Gag im Finale.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| ZS3\_DACH\_OPA\_0510 | Opa | Letztes Packen. Zwei Fächer. Danach brauchst du die Tasche nie wieder. Hoffe ich. Rechne ich. | öffnet die Tasche, Bildschirm Reisetasche |
| ZS3\_DACH\_PIX\_0520 | Pixel | Die Sonnenbrille eines Mannes, der nie blinzelt. // Wo du hinfährst, tragen Leute so etwas, um dazuzugehören. Dazugehören spart Zeit. | Berühren: Agent Schmidts Sonnenbrille |
| ZS3\_DACH\_PIX\_0530 | Pixel | Hundekuchen. In einer Kekstüte. Ich habe sie gesehen, als sie Kekse waren. // Ich werde das nie verwinden. // Alte Damen mögen Knuspriges. Irgendeine alte Dame. Irgendwann. | Berühren: Omas Kekse (Hundekuchen); Mimik entsetzt |
| ZS3\_DACH\_PIX\_0540 | Pixel | Ein Portalgerät ohne Batterie. Es zeigt eine Sekunde lang Opas Wohnzimmer, wenn man es füttert. // Ich sage nicht, womit. Es steht praktisch daneben. | Berühren: Portalgerät |
| ZS3\_DACH\_PIX\_0550 | Pixel | Siebenundvierzig Mal Konner, Sahra. Ein Blechkopf hat sie alle besucht. Oder keine. // Papier reist gut. Wertlos, aber leicht. | Reserve, kommt nicht vor: Modell 08/15 nimmt die Telefonbuchseite in Welt 3 (R8) mit; ID bleibt vergeben |
| ZS3\_DACH\_PIX\_0560 | Pixel | Eine Kaffeetasse, die für das Original gehalten wird. Jeder Klon gehorcht ihr. // Im Fernsehen gibt es viele Klone. Ich sage nur: Sitcom-Familien. | Berühren: Kaffeetasse |
| ZS3\_DACH\_PIX\_0570 | Pixel | Schmidts Akte. Hier Papier, drüben Daten. „Abteilung Fürsorge und Verfolgung.“ // Behörden gibt es überall. Auch im Fernsehen. Besonders da. | Berühren: Schmidts Akte |
| ZS3\_DACH\_PIX\_0580 | Pixel | Kalles Morse-Tabelle. Miau, Miau, Pause, Miau. // Wo du hinfährst, krabble ich durch das Rauschen. Ich brauche keine Tabelle. Du vielleicht. | Berühren: Morse-Tabelle |
| ZS3\_DACH\_PIX\_0590 | Pixel | Das Olivenöl. Ein Rest. Er hat seine Pflicht getan. // Ich würde es hierlassen. Hier quietscht bald einiges. | Berühren: Olivenöl; nur wenn noch im Inventar |
| ZS3\_DACH\_MAX\_0600 | Max | Zwei Fächer. Letzte Welt. Ich packe wie für ein Staffelfinale. | Beim Versuch, ein drittes einzupacken |
| ZS3\_DACH\_PIX\_0610 | Pixel | Gepackt. Zum letzten Mal. Ich spreche ein Gebet für die Tasche. Es ist kurz. | Bestätigen der Auswahl |
| ZS3\_DACH\_OPA\_0620 | Opa | Kanal 999. Dort … dort hat mal jemand etwas verloren. Irgendjemand. Falls du es findest: Es gehört mir. Irgendjemandem. | sieht die Kiste an, dann weg |
| ZS3\_DACH\_MAX\_0630 | Max | Opa. |  |
| ZS3\_DACH\_OPA\_0640 | Opa | Vierter Gegenstand! Passwort! Ehrenwort eines Wissenschaftlers! Und wenn da ein Mann im Glitzersakko ist: Nicht hinsetzen! | zeigt auf den Drehknopf |
| ZS3\_DACH\_PIX\_0650 | Pixel | Er kennt den Mann im Glitzersakko. Ich lege das zu „Prospekte“. Der Stapel wächst. | zu Max |
| ZS3\_DACH\_MAX\_0660 | Max | Kanal 999. | Benutzen: Drehknopf; Wirbel, Übergang Welt 4 |
| ZS3\_DACH\_PIX\_0670 | Pixel | Fernsehen. Endlich etwas, das ich verstehe. Ich habe mehr Stunden davor verbracht als du. // Auf dir. | hinterher |

## 4. Finale: Heimkehr (FI\_DACH)

Szene. Kein Werbeblock: Die Goldene Fernbedienung bricht den Spot nach einer halben Sekunde ab. Dachboden bei Nacht, Lampe an, Mond im Dachfenster. In der Mitte steht Opas große Maschine mit zwei Fassungen und dem Empfänger für die Fernbedienung (Grafik Prolog und Finale, Dachboden Finale). Max steht gerade, Hände aus der Tasche. Die Szene läuft bis zur Verriegelung ohne Spielereingriff.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| FI\_DACH\_NAR\_0010 | – | Das Milchglas erscheint, die Kuh setzt an, und der Bildschirm knackt. Die Goldene Fernbedienung in Max' Hand blinkt einmal. Schnitt auf den Dachboden. | Werbeblock bricht ab, kein Jingle |
| FI\_DACH\_PIX\_0020 | Pixel | Kein Werbeblock. Keine Kuh. Mir fehlt etwas. Ich wusste nicht, dass mir das fehlen kann. | kommt aus dem Bildschirm, sieht sich um |
| FI\_DACH\_MAX\_0030 | Max | Es ist dunkel. Opa, es ist dunkel geworden. |  |
| FI\_DACH\_OPA\_0040 | Opa | Natürlich ist es dunkel! Es ist Abend! Vier Welten an einem Nachmittag, das hält kein Tag aus! | steht an der Maschine, Schraubenzieher hinterm Ohr |
| FI\_DACH\_MAX\_0050 | Max | Was ist das? | zeigt auf die Maschine |
| FI\_DACH\_OPA\_0060 | Opa | Das Werk. Ich habe es aufgebaut, während du weg warst. Zwanzig Minuten Fernsehzeit sind drei Stunden Werkbank. |  |
| FI\_DACH\_OPA\_0070 | Opa | Die Fernbedienung! Die goldene! Du hast sie! Gib sie her. Nein. Warte. Erst die anderen. | greift, zieht die Hand zurück |
| FI\_DACH\_NAR\_0080 | – | Opa nimmt das Ei aus dem Karton und legt es feierlich in die linke Fassung. Dann den Mehlsack in die rechte. Die Maschine schluckt beides mit einem Klack. | Fassungen schließen sich |
| FI\_DACH\_OPA\_0090 | Opa | Erstens: das Drachenei, Modell ganz. Zweitens: das Pharaonenkorn, Modell fein wie Staub. | zählt an den Fingern |
| FI\_DACH\_OPA\_0100 | Opa | Drittens: die Ewige Energiezelle. Viertens: die Goldene Fernbedienung. Jetzt. | hält die Hand auf |
| FI\_DACH\_NAR\_0110 | – | Max gibt sie ihm. Glitzer, ein leises Plopp: In Opas Hand ist sie grau und abgegriffen. // Opa klappt hinten den Deckel auf, schiebt die Zelle von der Werkbank hinein, klappt zu. | Effekt Verwandlung, dann nur ein Klick; Opa hält ab jetzt die graue Fernbedienung |
| FI\_DACH\_OPA\_0120 | Opa | Die Zündkapsel. Fertig geladen. | hält sie hoch wie ein Schwert |
| FI\_DACH\_MAX\_0130 | Max | Das ist eine Fernbedienung. |  |
| FI\_DACH\_OPA\_0140 | Opa | Zündkapsel. Mit Tasten. |  |
| FI\_DACH\_MAX\_0150 | Max | Ich hab eine Welt lang eine Fernbedienung durch die Gegend getragen. | sieht seine Hand an |
| FI\_DACH\_PIX\_0160 | Pixel | Ei. Mehl. Batterie. Fernbedienung. // Ich habe es in Welt 4 laut gesagt. Dann kam ein Amboss. // Ich sage es jetzt noch mal. Leise. Ohne Amboss. | sieht nach oben, sicherheitshalber |
| FI\_DACH\_MAX\_0170 | Max | Was sagst du? |  |
| FI\_DACH\_PIX\_0180 | Pixel | Nichts. Sieh zu. Das ist dein Moment, nicht meiner. |  |
| FI\_DACH\_NAR\_0190 | – | Opa richtet die Zündkapsel auf den Empfänger und drückt. Die Maschine brummt an. Lampen blinken, Rauch steigt, die Nadel am Druckmesser wandert nach rechts. | Maschine startet, Licht flackert |
| FI\_DACH\_OPA\_0200 | Opa | Es läuft! Es läuft! Zwölf Minuten, dann ist alles anders! | Erklären-Animation, glücklich |
| FI\_DACH\_NAR\_0210 | – | Unten klingelt es. Zweimal. Eine Stimme ruft von unten herauf. | Türklingel, dann Oma aus dem Off |
| FI\_DACH\_OMA\_0220 | Oma (von unten) | Konrad? Ich bin's. Ich bin etwas früher. Die Bahn war pünktlich, stell dir vor. | gedämpft durch die Decke |
| FI\_DACH\_OPA\_0230 | Opa | Nein. Nein, nein, nein. Nicht jetzt. Nicht sie. Nicht vor der Zeit! | wird blass, Haare noch wilder |
| FI\_DACH\_NAR\_0240 | – | Die Maschine zischt. Ein eiserner Riegel fährt über die Bodenluke, eine rote Lampe blinkt. Die Druckanzeige steht im roten Bereich. | Luke verriegelt sich, Lampe blinkt |
| FI\_DACH\_OPA\_0250 | Opa | Teig… Drucküberlastung! Sicherheitsverriegelung! Das Werk schützt sich selbst! |  |
| FI\_DACH\_MAX\_0260 | Max | Opa, da ist Oma unten und wir sind hier oben eingesperrt mit deinem Werk. |  |
| FI\_DACH\_OPA\_0270 | Opa | Niemand hält mein dunkles Werk auf! Sie darf es nicht erfahren, bevor es vollendet ist! | brüllt gegen den Lärm, Panik-Animation |
| FI\_DACH\_MAX\_0280 | Max | Okay. Das klang jetzt ehrlich gesagt nach Endgegner. | ernst, Spielphase beginnt |

## 5. Finale, Stufe 1: Verriegelt (FI\_RIEG)

Spielphase. Max muss die Luke und die Maschine untersuchen, während Opa seine Sätze brüllt und Pixel nervös wird. Schalter LUKE\_ERKANNT wird gesetzt, sobald Max die Luke benutzt hat. Erst dann geht es mit dem Hilferuf weiter (Abschnitt 6). Opas drei Weltherrschafts-Sätze kommen in dieser Reihenfolge als Zurufe alle 15 Sekunden, danach in Schleife; jeder Klick auf Opa löst den nächsten aus. Oma ruft währenddessen zweimal von unten.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| FI\_RIEG\_OPA\_0010 | Opa | Die Welt wird weich werden! Weich und warm! | Zuruf 1, auch Reden: Opa |
| FI\_RIEG\_OPA\_0020 | Opa | Noch zwölf Minuten, dann kennt mich jeder in diesem Haus! | Zuruf 2 |
| FI\_RIEG\_OPA\_0030 | Opa | Keiner verlässt diesen Dachboden, bis es aufgegangen ist! | Zuruf 3 |
| FI\_RIEG\_PIX\_0040 | Pixel | Ich hab ihn immer für harmlos gehalten. Vierzehn Jahre lang. // Vierzehn Jahre. Ich habe auf seinem Schoß geschlafen. | nach Zuruf 1; Mimik entsetzt |
| FI\_RIEG\_PIX\_0050 | Pixel | „Weich und warm.“ Das ist entweder das Ende der Welt oder etwas, worauf man sich legen kann. // Ich weiß nicht, welches ich mir wünsche. | nach Zuruf 2 |
| FI\_RIEG\_OMA\_0060 | Oma (von unten) | Konrad? Warum riecht es hier nach verbranntem Zucker? | nach 30 Sekunden |
| FI\_RIEG\_OMA\_0070 | Oma (von unten) | Ich komme jetzt hoch. Ich zähle nicht bis drei. Ich komme einfach. | nach 60 Sekunden; kurzer Schnitt ins Treppenhaus (Abend, Luke oben zu): Oma steigt die Treppe hinauf (Animation Treppe steigen), dann zurück auf den Dachboden; sie wartet ab jetzt unter der Luke |
| FI\_RIEG\_MAX\_0080 | Max | Die Luke. Ein Eisenriegel, dick wie mein Arm, und eine rote Lampe, die mich auslacht. | Ansehen: Bodenluke |
| FI\_RIEG\_MAX\_0085 | Max | Ich hab am Riegel gezogen. Der Riegel hat zurückgezogen. Er hat gewonnen. Ich hab einen Abdruck an der Hand. | Ansehen: Bodenluke, zweites Mal |
| FI\_RIEG\_MAX\_0090 | Max | Verriegelt. Richtig verriegelt. Das ist kein Bug, das ist ein Feature. | Benutzen: Bodenluke; setzt LUKE\_ERKANNT |
| FI\_RIEG\_PIX\_0100 | Pixel | Ich würde drunter durchpassen. Durch Eisen leider nicht. Ich habe es nie probiert. Ich probiere es nicht. | nach Benutzen: Bodenluke |
| FI\_RIEG\_MAX\_0110 | Max | Opas Werk. Kupferrohre, Nieten, ein Manometer im roten Bereich und ein kleines rundes Fenster. Sieht aus wie ein Boss aus einem Steampunk-Spiel. | Ansehen: Maschine |
| FI\_RIEG\_MAX\_0115 | Max | Wenn das Ding eine zweite Phase hat, renne ich. Endgegner haben immer eine zweite Phase. | Ansehen: Maschine, zweites Mal |
| FI\_RIEG\_MAX\_0120 | Max | Hinter dem Fenster bläht sich etwas Braunes. Es wächst. Ich weiß nicht, ob es mich sieht. | Ansehen: Ofentür |
| FI\_RIEG\_PIX\_0125 | Pixel | Etwas Braunes, das wächst und warm riecht. Ich hab Hunger und Angst. Meine zwei Lieblingsgefühle. | Ansehen: Ofentür, zweites Mal |
| FI\_RIEG\_PIX\_0130 | Pixel | Es riecht. Es riecht nicht nach Weltuntergang. // Weltuntergang riecht nach Schwefel, das weiß jeder Kater. Das hier riecht nach … ich sage es nicht. |  |
| FI\_RIEG\_MAX\_0140 | Max | Die Nadel steht im Roten. Rot ist nie gut. Außer bei Sneakern. | Ansehen: Druckmesser |
| FI\_RIEG\_MAX\_0145 | Max | Ich klopf ans Glas. Die Nadel zittert. Ich hör auf zu klopfen. Wir haben uns verstanden. | Ansehen: Druckmesser, zweites Mal |
| FI\_RIEG\_MAX\_0150 | Max | Zwei Fassungen, beide zu. Da sind das Ei und das Mehl drin. Das sind legendäre Artefakte. Das sind sie. Ganz sicher. | Ansehen: Fassungen |
| FI\_RIEG\_MAX\_0155 | Max | Ein legendäres Ei. Ein legendäres Mehl. In meinem Kopf sagt jemand mit tiefer Stimme: „Es ist gefährlich, allein zu gehen.“ | Ansehen: Fassungen, zweites Mal |
| FI\_RIEG\_MAX\_0160 | Max | Eine kleine Schüssel-Antenne. Da hat Opa die Zündkapsel draufgehalten. Die Fernbedienung. Das Ding. | Ansehen: Empfänger |
| FI\_RIEG\_MAX\_0165 | Max | Die Antenne dreht sich ein bisschen, wenn ich mich bewege. Sie mag mich. Oder sie will was von mir. | Ansehen: Empfänger, zweites Mal |
| FI\_RIEG\_MAX\_0170 | Max | Opa. Rotes Gesicht, weiße Haare, Schraubenzieher hinterm Ohr. Wenn das der Endgegner ist, war der Rest Tutorial. | Ansehen: Opa |
| FI\_RIEG\_MAX\_0175 | Max | Er schwitzt. Er lächelt. Er schwitzt beim Lächeln. Opa hat nichts zu verbergen, außer allem. | Ansehen: Opa, zweites Mal |
| FI\_RIEG\_MAX\_0180 | Max | Finger weg, sagt er. Ich fass es nicht an. Ich hab Angst, es fasst zurück. | Benutzen: Maschine |
| FI\_RIEG\_OPA\_0190 | Opa | Finger weg! Das ist auf den Grad genau eingestellt! Auf den Grad! | nach Benutzen: Maschine |
| FI\_RIEG\_MAX\_0200 | Max | Der Mond. Von draußen sieht das hier bestimmt gemütlich aus. | Ansehen: Dachfenster |
| FI\_RIEG\_MAX\_0205 | Max | Ein Stern blinkt. Wahrscheinlich ein Satellit. Der guckt bestimmt gerade Kanal 999 und lacht. | Ansehen: Dachfenster, zweites Mal |
| FI\_RIEG\_MAX\_0210 | Max | Zu klein für mich, zu hoch für Pixel, zu weit für Oma. Kein Ausgang. | Benutzen: Dachfenster |
| FI\_RIEG\_MAX\_0220 | Max | Der Zapp-O-Mat. Läuft noch. Kanal 999 zeigt ein leeres Studio und ein goldenes Sofa. Nein danke. | Ansehen: Zapp-O-Mat |
| FI\_RIEG\_MAX\_0225 | Max | Das Sofa auf Kanal 999 dreht sich langsam zu mir. Ich dreh mich weg. Es hat gelernt. | Ansehen: Zapp-O-Mat, zweites Mal |
| FI\_RIEG\_PIX\_0230 | Pixel | Der Fernseher ist der einzige Ausgang. Und der einzige Eingang. // Denk mal drüber nach, was durch Eingänge so reinkommt. | nach Ansehen: Zapp-O-Mat; nur mit LUKE\_ERKANNT |
| FI\_RIEG\_MAX\_0240 | Max | Die Zeit läuft, die Oma kommt, die Luke ist zu. Das ist eine Folge ohne Pause-Taste. | Zuruf Max, nach 45 Sekunden ohne Aktion |
| FI\_RIEG\_MAX\_0250 | Max | Opas Fundkiste. Ganz oben liegt eine Tüte Hundekuchen. Die aus der Zukunft. | Ansehen: Fundkiste; nur wenn Omas Kekse darin liegen; gilt auch in Abschnitt 6 und 7 |
| FI\_RIEG\_PIX\_0255 | Pixel | Die Hundekuchen haben die Reise überlebt. Leider. Manche Dinge sind ewiger als Energiezellen. | Ansehen: Fundkiste, zweites Mal; nur wenn Omas Kekse darin liegen; gilt auch in Abschnitt 6 und 7 |
| FI\_RIEG\_MAX\_0260 | Max | Die Kekse von der alten Dame, die alles vorher weiß. Vielleicht weiß sie auch, wofür. | Benutzen: Fundkiste; nur wenn Omas Kekse darin liegen; Tüte ins Inventar, setzt KEKSE\_DABEI |
| FI\_RIEG\_PIX\_0270 | Pixel | Du nimmst die Hundekuchen mit. Jetzt. Wo deine Oma die Treppe hochkommt. // Ich habe nichts gesehen. | nach 0260; Mimik entsetzt |
| FI\_RIEG\_MAX\_0280 | Max | Opas Fundkiste. Er wirft wirklich nichts weg. Ich auch nicht mehr, wie es aussieht. | Ansehen: Fundkiste; ohne Kekse darin |
| FI\_RIEG\_MAX\_0285 | Max | Ganz oben liegt ein Gutschein für „Einmal Rasenmähen“. Von mir. Aus der zweiten Klasse. Er hat ihn behalten. | Ansehen: Fundkiste, zweites Mal; ohne Kekse darin |

## 6. Finale: Hilferuf über den Zapp-O-Mat (FI\_RUF)

Szene mit vier Drehknopf-Stufen. Nach LUKE\_ERKANNT dreht Max den Knopf einmal durch alle vier Kanäle; der Spieler klickt jeden Kanal selbst an (Reihenfolge frei). Auf jedem Kanal winkt jemand kurz durch den Bildschirm, nur Zeldina (Kanal 3) und, mit Schalter FREUND\_0815, Modell 08/15 (Kanal 42) kommen heraus. Die Kanalwahl bleibt offen, bis alle vier Kanäle angeklickt sind; dann fasst Zeldina zusammen (0300 oder 0310), und Abschnitt 7 beginnt. Die Gesprächsoptionen 0320 bis 0360 bleiben in Abschnitt 7 wählbar.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| FI\_RUF\_PIX\_0010 | Pixel | Wir brauchen Hilfe. Von drüben. Du kennst da Leute. Ich kenne da Essen. | nach LUKE\_ERKANNT |
| FI\_RUF\_MAX\_0020 | Max | Ein Hilferuf per Fernseher. Wie ein Gruppenchat, nur mit Drehknopf. | geht zum Zapp-O-Mat |
| FI\_RUF\_MAX\_0030 | Max | Kanal 3. Zeldina! Wir hängen fest, Opa ist durchgedreht und die Tür ist zu! | Benutzen: Drehknopf, Kanal 3 |
| FI\_RUF\_ZEL\_0040 | Zeldina | Eine verschlossene Tür, ein durchgedrehter Vermieter und ein Dachboden? Ich komme. Das ist meine Kernkompetenz. | im Bildschirm, Moderworts Zauberstab in der Hand |
| FI\_RUF\_TOA\_0050 | Toadi | Danke, Max! Aber die Prinzessin ist … ach nein, da ist sie ja. | im Hintergrund, Pilzhut schief |
| FI\_RUF\_NAR\_0060 | – | Zeldina klettert aus dem Bildschirm, klopft sich den Staub ab und sieht sich um wie bei einer Besichtigung. | Zeldina betritt den Dachboden, Jingle Figur gewonnen |
| FI\_RUF\_ZEL\_0070 | Zeldina | Schräge Decke, Dachfenster, Altbau. Was ist mit den Nebenkosten? | sieht nach oben |
| FI\_RUF\_MAX\_0080 | Max | Notfall. Nicht Besichtigung. |  |
| FI\_RUF\_ZEL\_0090 | Zeldina | Alles ist Besichtigung, wenn man lange genug hinsieht. Wo brennt's? | sieht die Maschine |
| FI\_RUF\_PIX\_0100 | Pixel | Noch nirgends. Das ist das Beunruhigende. |  |
| FI\_RUF\_MAX\_0110 | Max | Kanal 7. Archimedes! Ramses! Irgendwer! | Benutzen: Drehknopf, Kanal 7 |
| FI\_RUF\_ARC\_0120 | Archimedes | Heureka! Nein, Moment, falscher Anlass. Ein verriegelter Dachboden? Hebel! Du brauchst einen Hebel! | im Bildschirm, nass, mit Handtuch |
| FI\_RUF\_RAM\_0130 | Ramses | Soll ich helfen? Oder nicht? Ich überlege. Ich melde mich. Vielleicht. | im Hintergrund, Fächerwedler wedeln |
| FI\_RUF\_HER\_0140 | Hermes | Dein Verbündeter ist in einem anderen Kanal! | rennt durchs Bild |
| FI\_RUF\_MAX\_0150 | Max | Danke. Sehr hilfreich. Alle. |  |
| FI\_RUF\_MAX\_0160 | Max | Kanal 42. Hallo? Jemand mit Gelenken? | Benutzen: Drehknopf, Kanal 42 |
| FI\_RUF\_HAU\_0170 | Modell 08/15 | Servus, Bursche. Verriegelt, sagst du? Ordnungsgemäß? Dann komm ich. Ordnung ist mein Fach. | im Bildschirm, Gelenke geölt; nur FREUND\_0815 |
| FI\_RUF\_NAR\_0180 | – | Modell 08/15 steigt aus dem Bildschirm, verbeugt sich blechern und sieht die Maschine an wie einen Fleck, der weg muss. | Roboter betritt den Dachboden; nur FREUND\_0815; Jingle Figur gewonnen |
| FI\_RUF\_HAU\_0190 | Modell 08/15 | Ich komme wieder. Habe ich gesagt. Ich halte Wort. Ich halte alles, was man mir hinhält. | nur FREUND\_0815 |
| FI\_RUF\_KAL\_0200 | Kalle | Max! Alter! Der Hausmeister ist unterwegs zu Konner Nummer 31. Ich kann dir Miau-Morse schicken. Hilft das? | im Bildschirm; nur ohne FREUND\_0815 |
| FI\_RUF\_MAX\_0210 | Max | Nein. | nur ohne FREUND\_0815 |
| FI\_RUF\_KAL\_0220 | Kalle | Dachte ich mir. Viel Glück, Mann. Du hast noch den Löffel! | winkt; nur ohne FREUND\_0815 |
| FI\_RUF\_PIX\_0230 | Pixel | Hättest du den Blechkopf geölt, wäre er jetzt hier. // Ich sage das nicht als Vorwurf. Ich sage es als Protokoll. | nur ohne FREUND\_0815 |
| FI\_RUF\_MAX\_0240 | Max | Kanal 999. Flimmer? Irgendwer? | Benutzen: Drehknopf, Kanal 999 |
| FI\_RUF\_FLI\_0250 | Flimmer | Max! Zschh! Ich kann nicht raus, ich bin Rauschen! Aber ich drück dir die Daumen! Ich hab keine Daumen! Zschh! | im Bildschirm, flackert |
| FI\_RUF\_GER\_0260 | Gerd Glück | Eingesperrt? Dann brauchen Sie den Gerd-Glück-Dietrich, nur für kurze Zeit, jetzt mit Gratis-Gerd! | im Hintergrund, Glitzersakko-Lichter |
| FI\_RUF\_MAX\_0270 | Max | Zappmann? | leise |
| FI\_RUF\_NAR\_0280 | – | Auf dem goldenen Sofa sitzt niemand. Ein Zettel liegt darauf: „Bin aufgestanden. Z.“ | Kamera kurz aufs Sofa |
| FI\_RUF\_MAX\_0290 | Max | Gut. Gut für ihn. |  |
| FI\_RUF\_ZEL\_0300 | Zeldina | Also. Eine Prinzessin, ein Kater, ein Junge und ein durchgedrehter Erfinder. Das reicht. Das hat in jedem Märchen gereicht. | nach allen vier Kanälen; ohne FREUND\_0815 |
| FI\_RUF\_ZEL\_0310 | Zeldina | Also. Eine Prinzessin, ein Kater, ein Junge, ein Hausmeister und ein durchgedrehter Erfinder. Das ist fast eine WG. | nach allen vier Kanälen; mit FREUND\_0815 |
| FI\_RUF\_MAX\_0320 | Max | Zeldina, was war das für ein Zauberstab? | Reden: Zeldina, Option |
| FI\_RUF\_ZEL\_0330 | Zeldina | Moderworts. Er hat ihn liegen lassen, als er zurück in die Schule ist. Ich benutze ihn für klemmende Türen. Und für Vermieter. | Hinweis auf Schritt A |
| FI\_RUF\_MAX\_0380 | Max | Für Vermieter? |  |
| FI\_RUF\_ZEL\_0390 | Zeldina | Die klemmen auch. Meistens bei der Kaution. |  |
| FI\_RUF\_MAX\_0340 | Max | Hat sich der Turm gelohnt? | Reden: Zeldina, Option |
| FI\_RUF\_ZEL\_0350 | Zeldina | Sieben Stockwerke, kein Aufzug, ein Drache als Untermieter. Ich liebe ihn. Ich suche trotzdem weiter. Man sucht immer weiter. |  |
| FI\_RUF\_MAX\_0400 | Max | Und was suchst du jetzt? |  |
| FI\_RUF\_ZEL\_0410 | Zeldina | Was mit Aufzug. Und ohne Drache. Der darf aber zu Besuch kommen, er bringt immer Kohlen mit. |  |
| FI\_RUF\_MAX\_0360 | Max | Wie geht's den Gelenken? | Reden: Modell 08/15, Option; nur FREUND\_0815 |
| FI\_RUF\_HAU\_0370 | Modell 08/15 | Geschmeidig, Bursche. Olivenöl, kalt gepresst. Ich fühle mich wie Baujahr neu. Was soll ich halten? | Hinweis auf Schritt B |

## 7. Finale: Das letzte Rätsel (FI\_RAET)

Vier Schritte, die in jeder Reihenfolge begonnen, aber nur in einer beendet werden können. (A) Zeldina hebelt den Riegel der Luke auf; die Luke bleibt trotzdem zu, weil der Teig-Druck sie von innen festhält (Druckmesser). (B) Die Ofentür muss gehalten werden, bevor die Maschine stoppt: Modell 08/15 hält sie (FREUND\_0815), sonst klemmt Max den Kochlöffel aus dem Pflichtfach hinein. (C) Die Zündkapsel: Opa hat sie vor Schreck fallen lassen, die Zelle ist herausgesprungen, beides liegt unter dem Ohrensessel; die Zelle so weit hinten, dass nur Pixel sie holen kann (Figurenwechsel). (D) Die rote Taste: Fernbedienung auf den Empfänger, Opa brüllt, Max drückt. Stoppt Max die Maschine vor (B), platzt der Teig heraus, kein Scheitern, nur ein Gag, und der Druck baut sich wieder auf. Das Ende (D) braucht B und C; A ist dafür nicht zwingend, weil beim Stopp auch die Sicherheitsverriegelung zurückfährt, aber Zeldinas Hebeln zeigt, dass der Druck das eigentliche Problem ist. Fehlversuche mit eigener Zeile stehen am Ende der Tabelle. Hinweise in Abschnitt 7b.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| FI\_RAET\_MAX\_0010 | Max | Zeldina, die Luke. Kriegst du die auf? | Reden: Zeldina, Option; Schritt A |
| FI\_RAET\_ZEL\_0020 | Zeldina | Ein Riegel. Eisen. Dick. Niedlich. | kniet an der Luke |
| FI\_RAET\_NAR\_0030 | – | Zeldina rammt den schwarzen Zauberstab in den Riegel und dreht. Funken. Der Riegel springt auf. Die Luke rührt sich trotzdem nicht. | Animation Zauberstab einsetzen; Schritt A gelöst |
| FI\_RAET\_ZEL\_0040 | Zeldina | Riegel offen. Aber da drückt etwas von innen dagegen. Etwas Großes. Etwas Weiches. |  |
| FI\_RAET\_MAX\_0050 | Max | Der Druck. Die Nadel. Solange das Ding läuft, bleibt die Luke zu. | sieht zum Druckmesser |
| FI\_RAET\_PIX\_0060 | Pixel | Dann muss das Ding aufhören zu laufen. Und wer sagt dem Ding, dass es aufhören soll? // Derjenige mit der Zündkapsel. Sieh dir deinen Opa an. Was hat er in der Hand? |  |
| FI\_RAET\_MAX\_0070 | Max | Nichts. Er hat nichts in der Hand. Er fuchtelt mit leeren Händen. | sieht Opa an |
| FI\_RAET\_OPA\_0080 | Opa | Die Zündkapsel! Wo ist die Zündkapsel? Ich hatte sie! Ich hatte sie, als es geklingelt hat! | Panik-Animation, sucht am Boden |
| FI\_RAET\_MAX\_0090 | Max | Zeldina, Opa, der Roboter und ich. Wenn wir jetzt die Luke aufkriegen, kommt Oma rein, und das Ding läuft noch. | Reden: Zeldina nach Schritt A |
| FI\_RAET\_ZEL\_0100 | Zeldina | Dann stoppt es. Und haltet vorher die Ofentür. Ich hab mal gesehen, was ein Drache macht, wenn man die Tür zu früh aufmacht. | Hinweis auf Schritt B |
| FI\_RAET\_MAX\_0110 | Max | Du kannst die Ofentür halten? | Reden: Modell 08/15, Option; nur FREUND\_0815; Schritt B |
| FI\_RAET\_HAU\_0120 | Modell 08/15 | Ich halte Türen seit Baujahr 2077. Diese hier ist warm. Ich halte sie trotzdem. Servus, Tür. | stellt sich an die Ofentür, Animation Ofentür halten; Schritt B gelöst |
| FI\_RAET\_PIX\_0130 | Pixel | Er hält eine Ofentür und grüßt sie. Das ist der höflichste Roboter, den ich kenne. Ich kenne zwei. | nur FREUND\_0815 |
| FI\_RAET\_MAX\_0140 | Max | Der Kochlöffel. In die Ofentür. Er klemmt. Er klebt. Er hält. Ich nenne das eine Bindung. | Kochlöffel auf Ofentür; ohne FREUND\_0815; Schritt B gelöst |
| FI\_RAET\_PIX\_0150 | Pixel | Ein Kochlöffel hält den Weltuntergang auf. Moderwort hätte geweint. // Ich weine nicht. Ich bin nur nah dran. | nach Kochlöffel in der Ofentür; ohne FREUND\_0815 |
| FI\_RAET\_MAX\_0160 | Max | Der Blechkopf hat's im Griff. Der Löffel bleibt, wo er ist. | Kochlöffel auf Ofentür; mit FREUND\_0815 |
| FI\_RAET\_MAX\_0170 | Max | Unter dem Sessel blinkt etwas. Rot. Im Takt. Wie eine Benachrichtigung. | Ansehen: Ohrensessel; Schritt C |
| FI\_RAET\_MAX\_0175 | Max | Es blinkt immer noch. Ungelesene Nachricht unter dem Sessel. Opa hat die Mitteilungen aus. | Ansehen: Ohrensessel, zweites Mal; Schritt C |
| FI\_RAET\_MAX\_0180 | Max | Da. Die Fernbe… die Zündkapsel. Der Deckel ist offen. Die Zelle ist weg. | Benutzen: Ohrensessel; Fernbedienung ohne Zelle ins Inventar |
| FI\_RAET\_MAX\_0190 | Max | Da hinten glüht was. Ganz hinten an der Wand. Mein Arm ist zu kurz und der Sessel zu schwer. | Benutzen: Ohrensessel, zweites Mal |
| FI\_RAET\_PIX\_0200 | Pixel | Ich passe da drunter. Ich sage nicht gern, dass ich irgendwo passe. // Wechsel zu mir. Und sieh nicht hin. | Hinweis auf Figurenwechsel |
| FI\_RAET\_PIX\_0210 | Pixel | Staub. Eine Socke. Ein Keks von 1998. Und eine glühende Zelle. Ich nehme die Zelle. Den Keks merke ich mir. | als Pixel: Benutzen: Ohrensessel; Zelle in Pixels Maul |
| FI\_RAET\_MAX\_0220 | Max | Gib her. Nein, nicht ablecken. Gib her. | Pixel auf Max oder Figurenwechsel zurück; Zelle ins Inventar |
| FI\_RAET\_MAX\_0230 | Max | Zelle rein, Deckel zu. Zündkapsel. Mit Tasten. Ich höre mich an wie Opa. | Kombinieren: Zelle mit Fernbedienung; Schritt C gelöst |
| FI\_RAET\_MAX\_0240 | Max | Eine normale Fernbedienung. Lauter, leiser, Programm, Stumm und eine rote Taste oben. Die rote ist bei allen gleich. | Ansehen: Zündkapsel im Inventar |
| FI\_RAET\_MAX\_0245 | Max | Die rote Taste ist abgegriffen. Wie bei jeder Fernbedienung der Welt. Jeder drückt zuerst auf Rot. | Ansehen: Zündkapsel im Inventar, zweites Mal |
| FI\_RAET\_OPA\_0250 | Opa | Du hast sie! Gib sie mir! Nein! Nicht auf das Werk richten! | als Max die Zündkapsel auf den Empfänger richtet; Schritt D |
| FI\_RAET\_NAR\_0260 | – | Max richtet die Zündkapsel auf den Empfänger. Vier Tasten leuchten. Der Spieler wählt. | Tastenauswahl: Lauter, Programm, Stumm, Rot |
| FI\_RAET\_OPA\_0270 | Opa | Nicht die rote Taste! | sobald der Zeiger über der roten Taste liegt |
| FI\_RAET\_MAX\_0280 | Max | Die rote Taste heißt Stopp. Auf jeder Fernbedienung der Welt. | drückt; nur wenn Schritt B gelöst; Schritt D gelöst, weiter mit Abschnitt 8 |
| FI\_RAET\_NAR\_0290 | – | Die Maschine wird lauter. Viel lauter. Die Nadel zittert. | Fehlversuch: Taste Lauter |
| FI\_RAET\_OPA\_0300 | Opa | Nicht lauter! Es hört doch schon! | Fehlversuch: Taste Lauter |
| FI\_RAET\_NAR\_0310 | – | Die Maschine zappt. Im Fenster der Ofentür ist der Teig kurz ein Nachrichtensprecher, dann wieder Teig. | Fehlversuch: Taste Programm |
| FI\_RAET\_PIX\_0320 | Pixel | Milchpreise steigen, hat er gesagt. Großväter vergessen weiterhin Geburtstage. Das war sehr kurz. Und sehr deutlich. | Fehlversuch: Taste Programm |
| FI\_RAET\_NAR\_0330 | – | Opa redet weiter, aber man hört nichts. Die Maschine brummt ungestört. | Fehlversuch: Taste Stumm |
| FI\_RAET\_PIX\_0340 | Pixel | Behalt die Taste. Wir brauchen sie später noch. Bei jedem Vortrag. | Fehlversuch: Taste Stumm |
| FI\_RAET\_NAR\_0350 | – | Max drückt Stopp. Die Ofentür fliegt auf, ein Schwall brauner Teig klatscht Max ins Gesicht. Die Tür fällt zu, die Maschine brummt weiter, die Nadel wandert zurück ins Rote. | Fehlversuch: Rote Taste vor Schritt B; Teig-Effekt |
| FI\_RAET\_MAX\_0360 | Max | Schokolade. Das ist Schokolade. Warum ist der Weltuntergang aus Schokolade. | wischt sich das Gesicht ab |
| FI\_RAET\_PIX\_0370 | Pixel | Erst die Tür halten, dann stoppen. In der Reihenfolge. Wie bei Dosen: erst öffnen, dann fressen. // Und leck dir das nicht ab. Doch. Leck es ab. Berichte. | nach Fehlversuch Rote Taste vor Schritt B |
| FI\_RAET\_OPA\_0380 | Opa | Siehst du! Siehst du, was passiert, wenn man mein Werk nicht respektiert! | nach Fehlversuch Rote Taste vor Schritt B |
| FI\_RAET\_MAX\_0390 | Max | Der Zauberstab öffnet Türen, keine Maschinen. Zeldina hat ihn außerdem nicht losgelassen. | Fehlversuch: Zeldina auf Maschine |
| FI\_RAET\_ZEL\_0400 | Zeldina | Ich hebele Riegel, keine Öfen. Da gibt es Fachleute. | Fehlversuch: Zeldina auf Ofentür |
| FI\_RAET\_HAU\_0410 | Modell 08/15 | Die Luke ist ordnungsgemäß verriegelt. Ich öffne nichts, was ordnungsgemäß ist. Servus. | Fehlversuch: Modell 08/15 auf Luke; nur FREUND\_0815 |
| FI\_RAET\_MAX\_0420 | Max | Der Löffel passt nicht in den Riegel. Er klebt nur dran. | Fehlversuch: Kochlöffel auf Luke |
| FI\_RAET\_PIX\_0430 | Pixel | Die Thunfischdose hält keine Ofentür. Sie hält mich. Das ist ihre Aufgabe. | Fehlversuch: Thunfischdose auf Ofentür |
| FI\_RAET\_OPA\_0440 | Opa | Die Zelle ist nichts ohne die Kapsel! Nichts! Ein Knöpfchen ohne Knopf! | Fehlversuch: Zelle allein auf Empfänger |
| FI\_RAET\_MAX\_0450 | Max | Keine Zelle, keine Macht. Ich kenne das vom Handy. | Fehlversuch: Fernbedienung ohne Zelle auf Empfänger |
| FI\_RAET\_MAX\_0460 | Max | Gib Opa die Zündkapsel? Er hat sie schon mal fallen lassen. Und er hat sie schon mal benutzt. | Fehlversuch: Zündkapsel auf Opa |
| FI\_RAET\_OPA\_0470 | Opa | Ja! Gib sie … nein. Nein, ich will sie gar nicht. Meine Hände zittern. Mach du. | nach Fehlversuch Zündkapsel auf Opa |

## 7b. Finale: Hinweise der Hilfe-Pfote (FI\_HINT)

Drei Stufen je Schritt nach dem Hinweissystem (Spielsysteme). Schritt 0 ist die Luke in Stufe 1, Schritte A bis D gehören zu Abschnitt 7. Pixel spricht hier normal, er steht neben Max. Datei game/daten/hinweise/finale.json: FI\_R01\_0 bis FI\_R01\_D.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| FI\_HINT\_PIX\_0010 | Pixel | Dein Opa brüllt, die Luke blinkt, und du stehst da. Einer von euch dreien sollte etwas tun. | Schritt 0, Stufe 1 |
| FI\_HINT\_PIX\_0020 | Pixel | Die Luke. Sieh sie dir an. Fass sie an. Danach wissen wir, was wir wissen. | Schritt 0, Stufe 2 |
| FI\_HINT\_PIX\_0030 | Pixel | Benutz die Luke. Sie geht nicht auf. Aber erst, wenn du es versucht hast, denkst du über Alternativen nach. So bist du. | Schritt 0, Stufe 3 |
| FI\_HINT\_PIX\_0040 | Pixel | Eine Prinzessin mit dem Zauberstab eines Dunklen Lords steht hier herum. Das ist kein Zufall. Das ist Besetzung. | Schritt A, Stufe 1 |
| FI\_HINT\_PIX\_0050 | Pixel | Zeldina hat dir gesagt, wofür sie den Stab benutzt. Türen. Vermieter. Hier gibt es eine Tür. | Schritt A, Stufe 2 |
| FI\_HINT\_PIX\_0060 | Pixel | Rede mit Zeldina und frag sie nach der Luke. Sie hebelt den Riegel auf. Ich hätte es selbst getan, aber ich habe keine Daumen. | Schritt A, Stufe 3 |
| FI\_HINT\_PIX\_0070 | Pixel | Hinter dem kleinen Fenster wächst etwas. Wenn das Ding stehen bleibt, will das Etwas raus. Jemand muss die Tür halten. | Schritt B, Stufe 1 |
| FI\_HINT\_PIX\_0080 | Pixel | Hier steht ein Roboter, der Türen hält, seit er gebaut wurde. Frag ihn. Höflich. Er ist Österreicher. | Schritt B, Stufe 2; nur FREUND\_0815 |
| FI\_HINT\_PIX\_0090 | Pixel | Kein Roboter da. Aber im Pflichtfach liegt etwas, das klemmt und klebt und sich noch nie beschwert hat. | Schritt B, Stufe 2; ohne FREUND\_0815 |
| FI\_HINT\_PIX\_0100 | Pixel | Rede mit Modell 08/15 und lass ihn die Ofentür halten. Er wird sie grüßen. Lass ihn. | Schritt B, Stufe 3; nur FREUND\_0815 |
| FI\_HINT\_PIX\_0110 | Pixel | Klemm den Kochlöffel in die Ofentür. Er hat einen Dunklen Lord überstanden, er übersteht Teig. | Schritt B, Stufe 3; ohne FREUND\_0815 |
| FI\_HINT\_PIX\_0120 | Pixel | Die Maschine hört nur auf das, was dein Opa in der Hand hatte. Hatte. Vergangenheit. Wo ist es jetzt? | Schritt C, Stufe 1 |
| FI\_HINT\_PIX\_0130 | Pixel | Unter Sesseln liegt alles, was Menschen fallen lassen. Sieh unter den Sessel. Dann wechsel zu mir, ich passe da drunter. | Schritt C, Stufe 2 |
| FI\_HINT\_PIX\_0140 | Pixel | Die Fernbedienung liegt unter dem Sessel, die Zelle ganz hinten. Du nimmst die Fernbedienung, ich hole die Zelle, du steckst sie rein. // Ich hasse es, wenn ich Arbeitsschritte aufzählen muss. | Schritt C, Stufe 3 |
| FI\_HINT\_PIX\_0150 | Pixel | Du hast eine Fernbedienung. Da vorne ist ein Empfänger. Du hast vier Welten lang nichts anderes gemacht als zielen und drücken. | Schritt D, Stufe 1 |
| FI\_HINT\_PIX\_0160 | Pixel | Dein Opa schreit bei einer Taste besonders laut. Menschen schreien immer bei der richtigen. | Schritt D, Stufe 2 |
| FI\_HINT\_PIX\_0170 | Pixel | Richte die Zündkapsel auf den Empfänger und drück die rote Taste. Stopp. Vorher die Ofentür sichern, sonst isst du Teig. Nochmal. | Schritt D, Stufe 3 |
| FI\_HINT\_PIX\_0180 | Pixel | Ich denke noch nach. Es sieht aus wie Starren. Es ist auch Starren. Aber mit Inhalt. | Wartezeile Finale, vor der nächsten Stufe |
| FI\_HINT\_PIX\_0190 | Pixel | Alles erledigt. Die Luke geht gleich auf. Ich würde mich jetzt hinsetzen, wenn ich du wäre. Ich bin nicht du. Ich sitze schon. | nichts offen, nach Schritt D |

## 8. Finale, Stufe 2: Die Auflösung (FI\_AUFL)

Szene. Die Maschine fährt herunter, die Nadel sinkt, Dampf zieht ab. Die Ofentür geht langsam auf (Modell 08/15 öffnet sie, oder der Kochlöffel fällt heraus). Es riecht nach Kuchen. Opa wird klein, Max wird ruhig, Pixel bekommt recht. Danach öffnet sich die Luke, Oma steht darin. Varianten nach FREUND\_0815 und KEKSE\_DABEI.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| FI\_AUFL\_NAR\_0010 | – | Die Maschine seufzt. Die Lampen gehen eine nach der anderen aus, die Nadel fällt ins Grüne, der Riegel klackt zurück. Stille. | Maschine stoppt, Jingle Rätsel gelöst |
| FI\_AUFL\_HAU\_0020 | Modell 08/15 | Druck normal. Ich lasse jetzt los. Servus, Tür. Es war mir eine Ehre. | öffnet die Ofentür vorsichtig; nur FREUND\_0815 |
| FI\_AUFL\_NAR\_0030 | – | Der Kochlöffel fällt aus der Tür und bleibt am Boden kleben. Die Tür schwingt auf. | ohne FREUND\_0815 |
| FI\_AUFL\_NAR\_0040 | – | Aus der Maschine quillt Duft. Warm, süß, braun. | Dampf-Effekt, warmes Licht |
| FI\_AUFL\_MAX\_0050 | Max | Das riecht nach … | hält inne |
| FI\_AUFL\_PIX\_0060 | Pixel | Sag es. |  |
| FI\_AUFL\_MAX\_0070 | Max | Kuchen. Das riecht nach Kuchen. |  |
| FI\_AUFL\_PIX\_0080 | Pixel | Bäckerei. Sagte ich. Bei Welt 2. Niemand hört dem Kater zu. |  |
| FI\_AUFL\_MAX\_0090 | Max | Opa. Was ist das für eine Maschine. | sehr ruhig |
| FI\_AUFL\_OPA\_0100 | Opa | Ein … Backofen. Ein selbstgebauter. Mit Dampfdruck und Rührwerk. Modell Konrad. | ganz klein, Goggles rutschen |
| FI\_AUFL\_MAX\_0110 | Max | Das Drachenei. |  |
| FI\_AUFL\_OPA\_0120 | Opa | Ein Ei. Freiland. |  |
| FI\_AUFL\_MAX\_0130 | Max | Das Pharaonenkorn. |  |
| FI\_AUFL\_OPA\_0140 | Opa | Mehl. Type 405. Fein wie Staub. Das war wichtig, das mit dem Staub. |  |
| FI\_AUFL\_MAX\_0150 | Max | Die Ewige Energiezelle. |  |
| FI\_AUFL\_OPA\_0160 | Opa | Eine Batterie. AA. Für die Fernbedienung. Sie hält ewig, wenn man sie nicht benutzt. |  |
| FI\_AUFL\_MAX\_0170 | Max | Und die Goldene Fernbedienung ist … |  |
| FI\_AUFL\_OPA\_0180 | Opa | Meine. Die ich seit Wochen suche. Ja. |  |
| FI\_AUFL\_NAR\_0190 | – | Niemand sagt etwas. Zeldina sieht die Decke an, als prüfe sie Feuchtigkeit. | Pause |
| FI\_AUFL\_MAX\_0200 | Max | Ich war in vier Welten. Ich habe einen Troll ins Fußbad gestellt, einen Pharao zu einer Entscheidung gebracht … eine KI in den Wahnsinn geredet und einen Fernsehchef vom Sofa geholt. // Für einen Einkaufszettel. |  |
| FI\_AUFL\_OPA\_0210 | Opa | Für einen Kuchen. Das ist etwas anderes. |  |
| FI\_AUFL\_MAX\_0220 | Max | Und die Fernbedienung? Du hast mich im Prolog gefragt, ob ich sie gesehen habe. |  |
| FI\_AUFL\_OPA\_0230 | Opa | Ich war schon mal drin. Im Zapp-O-Mat. Einmal. Zum Testen. // Auf Kanal 999 ist sie mir aus der Tasche gefallen, direkt in Zappmanns Studio. Und ich wollte nicht zugeben, wo sie liegt. Vor dem Kater schon gar nicht. | sieht Pixel nicht an |
| FI\_AUFL\_PIX\_0240 | Pixel | Ich hab's gewusst. Seit Welt 3. // Das Hologramm. „Hilf mir, Max.“ Wer lässt eine Notfall-Nachricht in einer Welt, in der er nie war? |  |
| FI\_AUFL\_MAX\_0250 | Max | Du hast es in Welt 4 laut gesagt. Dann kam der Amboss. |  |
| FI\_AUFL\_PIX\_0260 | Pixel | Das zählt als Zensur. |  |
| FI\_AUFL\_MAX\_0270 | Max | Und Zappmann? Die Lichterkette hat geblinkt, du kennst ihn. Lange Geschichte. |  |
| FI\_AUFL\_OPA\_0280 | Opa | 1977. „Zappis Puppenstube.“ Ich war der Bastel-Onkel. Jeden Samstag. // In der letzten Folge habe ich live einen Backofen vorgeführt. Er ist explodiert. Live. Mit Teig. Auf Zappi. | leise, dann mit einem Rest Stolz |
| FI\_AUFL\_OPA\_0290 | Opa | Zappmann durfte danach nie wieder vor eine Kamera. Und ich backe seitdem nur noch heimlich. Auf dem Dachboden. Mit Verriegelung. |  |
| FI\_AUFL\_MAX\_0300 | Max | Deshalb die Reiseposter. Deshalb die Kiste mit den Fernbedienungen. Deshalb Vorheizen. |  |
| FI\_AUFL\_PIX\_0310 | Pixel | Deshalb „Prospekte“. Mein Stapel war richtig. Mein Stapel ist immer richtig. |  |
| FI\_AUFL\_MAX\_0320 | Max | Und wofür der Kuchen? Wofür der ganze Weltuntergang? | zeigt auf den Kalender |
| FI\_AUFL\_OPA\_0330 | Opa | Der rote Kreis. Heute. Omas Geburtstag. // Ich habe ihn vergessen. Bis gestern Abend. Und einkaufen … die Schlange an der Kasse, die Parkplätze, die Leute. Ich hatte einen Fernseher, der in Welten führt. Also. |  |
| FI\_AUFL\_MAX\_0340 | Max | Du warst zu faul zum Einkaufen. |  |
| FI\_AUFL\_OPA\_0350 | Opa | Ich war effizient. |  |
| FI\_AUFL\_MAX\_0360 | Max | Du hast mich in vier Welten geschickt, weil du nicht zum Supermarkt wolltest. |  |
| FI\_AUFL\_OPA\_0370 | Opa | Wenn sie es merkt, geht die Welt unter. Meine. Das war nie gelogen. Nichts davon war gelogen. Nur … groß gesagt. |  |
| FI\_AUFL\_PIX\_0380 | Pixel | Er sagt die Wahrheit. Es riecht nach Kuchen und Reue. Reue riecht wie nasser Hund, nur ehrlicher. |  |
| FI\_AUFL\_NAR\_0390 | – | Die Luke geht auf. Oma steht in der Öffnung, Handtasche am Arm, und sieht: Rauch, einen Kuchen, eine Prinzessin, einen Kater, ihren Mann. | Oma betritt den Dachboden; mit FREUND\_0815 zusätzlich der Roboter |
| FI\_AUFL\_OMA\_0400 | Oma | Konrad. | nur das |
| FI\_AUFL\_OPA\_0410 | Opa | Hildegard. Du bist früh. | Hildegard: festgelegt am 9. November 2026 |
| FI\_AUFL\_OMA\_0420 | Oma | Die Bahn war pünktlich. Es gibt noch Wunder. | mustert Zeldina |
| FI\_AUFL\_OMA\_0430 | Oma | Du bist also die Neue. | zu Zeldina |
| FI\_AUFL\_ZEL\_0440 | Zeldina | Ich suche nur eine Wohnung. |  |
| FI\_AUFL\_OMA\_0450 | Oma | Der Dachboden wäre frei. | sieht Opa an |
| FI\_AUFL\_OMA\_0460 | Oma | Und Sie sind? | zu Modell 08/15; nur FREUND\_0815 |
| FI\_AUFL\_HAU\_0470 | Modell 08/15 | Hausmeister, gnä' Frau. Modell 08/15. Servus. | verbeugt sich; nur FREUND\_0815 |
| FI\_AUFL\_OMA\_0480 | Oma | Endlich mal einer, der putzt. | nur FREUND\_0815 |
| FI\_AUFL\_OMA\_0490 | Oma | Max. Du stehst gerade. Was ist passiert? | zu Max |
| FI\_AUFL\_MAX\_0500 | Max | Lange Geschichte, Oma. Vier Staffeln. |  |
| FI\_AUFL\_MAX\_0510 | Max | Oma. Die sind … von einer alten Dame, die alles vorher weiß. Alles Gute zum Geburtstag. | automatisch nach 0500, nur KEKSE\_DABEI (Tüte im Inventar): Max überreicht die Tüte |
| FI\_AUFL\_NAR\_0520 | – | Oma nimmt einen Hundekuchen, beißt ab, kaut. Pixel macht sein entsetztes Gesicht. | nur KEKSE\_DABEI; Mimik Pixel entsetzt |
| FI\_AUFL\_OMA\_0530 | Oma | Knusprig. Wie von Mutti. | nur KEKSE\_DABEI |
| FI\_AUFL\_PIX\_0540 | Pixel | Ich werde das nie verwinden. Ich sagte es. Jetzt gilt es doppelt. | nur KEKSE\_DABEI |
| FI\_AUFL\_OMA\_0550 | Oma | Gut. Der Kuchen kommt runter. Alle kommen runter. Auch die mit dem Stab und der mit dem Blech. Ich habe Geburtstag, und ich feiere ihn nicht auf einem Dachboden. | geht die Treppe hinunter; Übergang Wohnzimmer |
| FI\_AUFL\_PIX\_0560 | Pixel | Sie hat nicht einmal die Stimme erhoben. Das ist Macht. Echte Macht. Ich werde sie studieren. | hinterher |

## 9. Finale: Wohnzimmer, Geburtstag (FI\_WOHN)

Szene mit kurzer freier Phase. Wohnzimmer, Variante Geburtstag: Girlande, Luftballons, der Kuchen auf dem Couchtisch, Opa hat den Zapp-O-Mat auf dem Rolltisch mit heruntergeschoben („Fernsehen zum Geburtstag, Tradition“). Zeldina und, mit FREUND\_0815, der Roboter sitzen mit am Tisch. Nach dem Anschneiden darf der Spieler kurz alles ansehen; die Mutter kommt, sobald Max mit Oma oder Opa gesprochen hat oder nach 60 Sekunden.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| FI\_WOHN\_NAR\_0010 | – | Der Kuchen steht auf dem Couchtisch. Er ist schief, dampft und sieht großartig aus. Oma schneidet an. | Kuchen auf dem Couchtisch, Kerzen |
| FI\_WOHN\_OMA\_0020 | Oma | Er ist aufgegangen. Das muss man dir lassen, Konrad. Er ist aufgegangen. | probiert |
| FI\_WOHN\_OPA\_0030 | Opa | Siebzig Minuten bei Dampfdruck, Rührwerk auf Stufe … | setzt an |
| FI\_WOHN\_OMA\_0040 | Oma | Kuchen ohne Milch? Konrad. | stutzt, legt die Gabel hin |
| FI\_WOHN\_OPA\_0050 | Opa | Milch war … Milch war auf keinem Kanal. | ganz leise |
| FI\_WOHN\_PIX\_0060 | Pixel | Milch war auf jedem Kanal. Fünf Sekunden lang. Dreimal. Ich war der Einzige, der hingesehen hat. |  |
| FI\_WOHN\_MAX\_0070 | Max | Der Kuchen. Schief, braun, warm. Das ist der Endgegner. Ich habe ihn angeschnitten. | Ansehen: Kuchen |
| FI\_WOHN\_MAX\_0075 | Max | Der Kuchen dampft noch. Er hat vier Welten, einen Drachen und einen Endkampf hinter sich. Er sieht dafür sehr entspannt aus. | Ansehen: Kuchen, zweites Mal |
| FI\_WOHN\_MAX\_0080 | Max | Eine Girlande. Opa hat sie aufgehängt, während ich in der Antike war. Mit Reißzwecken. In Omas Tapete. | Ansehen: Girlande |
| FI\_WOHN\_MAX\_0085 | Max | Die Girlande hängt schief. Opa sagt, das ist Absicht. Oma sagt, das ist Opa. Beide haben recht. | Ansehen: Girlande, zweites Mal |
| FI\_WOHN\_MAX\_0090 | Max | Kleine Geschenke. Eines ist eine Fernbedienungshülle. Opa lernt. Langsam. | Ansehen: Geschenke |
| FI\_WOHN\_MAX\_0095 | Max | Ein Geschenk ist in Zeitung eingewickelt. In die Programmzeitschrift. Ich erkenne die Eselsohren. | Ansehen: Geschenke, zweites Mal |
| FI\_WOHN\_MAX\_0100 | Max | Oma guckt auf jedem Foto, als hätte jemand ihren Geburtstag vergessen. Jetzt weiß ich, warum. | Ansehen: Familienfoto |
| FI\_WOHN\_MAX\_0105 | Max | Auf dem neusten Foto lächelt Oma. Es ist noch nicht gemacht. Aber ich weiß schon, wie es aussieht. | Ansehen: Familienfoto, zweites Mal |
| FI\_WOHN\_MAX\_0110 | Max | Das Sofa. Mein Zuhause. Es sieht kleiner aus. Oder ich bin größer. Beides unwahrscheinlich. | Ansehen: Sofa |
| FI\_WOHN\_PIX\_0115 | Pixel | Das Sofa. Mein Revier. Ich hab es ein paar Welten lang euch Menschen überlassen. Die Leihfrist ist abgelaufen. | Ansehen: Sofa, zweites Mal |
| FI\_WOHN\_MAX\_0120 | Max | Der Zapp-O-Mat steht jetzt im Wohnzimmer. Opa sagt, Fernsehen zum Geburtstag sei Tradition. Oma sagt nichts. Das ist schlimmer. | Ansehen: Zapp-O-Mat |
| FI\_WOHN\_MAX\_0125 | Max | Der Zapp-O-Mat zeigt ein Testbild. Flimmer winkt in der Ecke. Ich wink zurück. Keiner hier versteht, warum. | Ansehen: Zapp-O-Mat, zweites Mal |
| FI\_WOHN\_MAX\_0130 | Max | Hier lag die Fernbedienung. Hier liegt sie wieder. Der Staubrand passt genau. | Ansehen: Fernbedienung auf dem Couchtisch |
| FI\_WOHN\_MAX\_0135 | Max | Ich leg die Fernbedienung genau in den Staubrand. Passt. Das Sofa seufzt. Ich auch. | Ansehen: Fernbedienung auf dem Couchtisch, zweites Mal |
| FI\_WOHN\_PIX\_0140 | Pixel | Zeldina prüft die Tapete auf Schimmel. Sie fragt Oma nach der Kaltmiete. Oma antwortet. Ich habe Angst. | Ansehen: Zeldina |
| FI\_WOHN\_PIX\_0145 | Pixel | Sie hat Oma gefragt, ob das Schloss renoviert ist. Oma hat ja gesagt. Ich glaube, sie meinte das Bad. | Ansehen: Zeldina, zweites Mal |
| FI\_WOHN\_MAX\_0150 | Max | Der Hausmeister spült. Unaufgefordert. Oma sieht ihm zu wie einem Sonnenuntergang. | Ansehen: Modell 08/15; nur FREUND\_0815 |
| FI\_WOHN\_MAX\_0155 | Max | Er trocknet jede Tasse einzeln und sagt bei jeder „Servus“. Oma hat ihm eine Schürze geschenkt. Er weint Öl. | Ansehen: Modell 08/15, zweites Mal; nur FREUND\_0815 |
| FI\_WOHN\_MAX\_0160 | Max | Seite 3. Ein Ei, weich. Irgendwas aus Mehl. Batterien. Milch. // Pixel. Deine Einkaufsliste ist Opas Einkaufsliste. | Ansehen: Notizbuch |
| FI\_WOHN\_MAX\_0165 | Max | Ganz unten auf Seite drei steht noch: „Nächstes Jahr: Sofa für zwei.“ In Pixels Pfotenschrift. | Ansehen: Notizbuch, zweites Mal |
| FI\_WOHN\_PIX\_0170 | Pixel | Ich war die ganze Zeit der Einzige mit Plan. Lachs stand nicht drauf. Das verzeihe ich dem Universum nie. |  |
| FI\_WOHN\_MAX\_0180 | Max | Oma, wusstest du, dass Opa im Fernsehen war? | Reden: Oma, Option |
| FI\_WOHN\_OMA\_0190 | Oma | Ich habe ihn dort kennengelernt. Ich saß in der ersten Reihe, als der Ofen explodierte. Der Teig hat mich getroffen. Ich dachte: Den nehme ich. | ohne eine Miene zu verziehen |
| FI\_WOHN\_PIX\_0420 | Pixel | Romantisch. Mit Teig. |  |
| FI\_WOHN\_OMA\_0430 | Oma | Er hat sich entschuldigt. Mit einem Kuchen. Seitdem backt er mir jedes Jahr einen. Meistens explodiert keiner. |  |
| FI\_WOHN\_MAX\_0200 | Max | Opa, das Passwort. | Reden: Opa, Option |
| FI\_WOHN\_OPA\_0210 | Opa | Gleich. Ich hab's aufgeschrieben. Es liegt irgendwo, wo ich jeden Tag hinsehe. | klopft seine Taschen ab |
| FI\_WOHN\_NAR\_0220 | – | Die Tür geht auf. Max' Mutter kommt herein, Jacke noch an, Schlüssel in der Hand. Sie sieht einen Roboter beim Spülen, eine Prinzessin mit Kuchen, einen Kater auf dem Schrank. Sie atmet einmal durch. | Mutter betritt das Wohnzimmer; Roboter nur FREUND\_0815 |
| FI\_WOHN\_MUT\_0230 | Mutter | Guten Abend. Alles Gute, Mama. | küsst Oma auf die Wange, sieht sich nicht weiter um |
| FI\_WOHN\_MUT\_0240 | Mutter | Ich frage nicht. Ich hatte Spätschicht. Ich frage morgen. | zu Max |
| FI\_WOHN\_NAR\_0250 | – | Sie hebt einen zerknitterten Zettel vom Couchtisch auf, direkt neben der Fernbedienung. | Zettel als Sprite, keine Nahansicht; die Mutter liest vor |
| FI\_WOHN\_MUT\_0260 | Mutter | Konrad, das ist deine Einkaufsliste. Du hast nichts davon gekauft, oder? | Animation Liste lesen |
| FI\_WOHN\_MUT\_0270 | Mutter | Eier. Mehl. Batterien. Fernbedienung finden. // Und Milch. Wo ist die Milch? | liest vor |
| FI\_WOHN\_NAR\_0280 | – | Stille. Pixel lässt sich vom Schrank in Richtung Sofa fallen. Opa zieht einen zweiten Zettel aus der Strickjacke und hält ihn Max hin. Darauf steht etwas mit vielen Zeichen. | Opa hält das WLAN-Passwort hin |
| FI\_WOHN\_OPA\_0290 | Opa | Das Passwort. Ehrenwort eines Wissenschaftlers. Hier. | leise |
| FI\_WOHN\_NAR\_0300 | – | Max sieht den Zettel an. Dann steht er auf. Er nimmt ihn nicht. | Max steht auf, aufrechte Pose |
| FI\_WOHN\_MAX\_0310 | Max | Ich hol sie. | ohne Murren, zum ersten Mal |
| FI\_WOHN\_NAR\_0320 | – | Pixel verfehlt das Sofa und fällt vor Schreck vom Schrank auf den Teppich. | Pixel fällt |
| FI\_WOHN\_PIX\_0330 | Pixel | Er hat … Er hat gesagt … Hat jemand das aufgenommen? Opa! Lief die Kamera? | vom Boden |
| FI\_WOHN\_OPA\_0340 | Opa | Max. Das Passwort. Du hast es nicht genommen. | hält den Zettel noch in der Luft |
| FI\_WOHN\_MAX\_0350 | Max | Später. Erst die Milch. Man macht eine Quest zu Ende, bevor man die nächste anfängt. | zieht die Jacke an |
| FI\_WOHN\_OMA\_0360 | Oma | Der Junge ist in Ordnung. Du nicht, Konrad. Aber der Junge. |  |
| FI\_WOHN\_ZEL\_0370 | Zeldina | Soll ich mitkommen? Ich kenne mich mit Suchen aus. | halb aufgestanden |
| FI\_WOHN\_MAX\_0380 | Max | Nein. Das ist eine Quest für eine Person. Bleib. Oma hat noch Fragen zur Kaltmiete. |  |
| FI\_WOHN\_HAU\_0390 | Modell 08/15 | Ich komme wieder. Mit dem Geschirrtuch. | aus der Küche; nur FREUND\_0815 |
| FI\_WOHN\_MAX\_0400 | Max | Ich geh dann. Zum Supermarkt. Freiwillig. Niemand sagt was. | an der Tür, zum Spieler gewandt |
| FI\_WOHN\_PIX\_0410 | Pixel | Ich sage was. Ich sage es nur später. Wenn ich wieder sitzen kann. | vom Teppich |

## 9b. Inventar ansehen (FI\_INV)

Rechtsklick auf einen Gegenstand in der Inventarleiste. Erstes Mal die erste Zeile, zweites Mal die Zweitzeile, danach der Wiederholungs-Pool (siehe `05-spielsysteme.md`). Gegenstände, die hier fehlen, haben ihre Ansehen-Zeile schon in ihrem Abschnitt oder im Abschnitt, aus dem sie mitreisen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| FI\_INV\_MAX\_0010 | Max | Das Drachenei. Warm, schwer, mit Schuppenmuster. Opa sagt, es muss ganz bleiben. Ich trag es wie ein rohes Ei. Was es ist. | Ansehen: Drachenei, drachenei; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_PIX\_0015 | Pixel | Ein Ei. Drei Minuten, weich, mit Salz. Ich sage das nicht als Drohung. Ich sage das als Vision. | Ansehen: Drachenei, drachenei, zweites Mal; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_MAX\_0020 | Max | Ein Ei. Einfach ein Ei. Ich hab eine Welt dafür gerettet. Es guckt mich an, als wäre das normal. | Ansehen: Drachenei, ei; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_MAX\_0025 | Max | Größe M, Freilandhaltung, Drache. Steht so nicht drauf. Sollte es aber. | Ansehen: Drachenei, ei, zweites Mal; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_MAX\_0030 | Max | Der goldene Sack mit Pharaonenkorn. Mit Siegel. Er knistert vornehm, wenn ich ihn bewege. | Ansehen: Goldener Sack Pharaonenkorn, goldener_sack; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_MAX\_0035 | Max | Ein ganzer Pharao konnte sich nicht entscheiden, aber beim Korn war er sich sicher. Ich hab Respekt vor diesem Sack. | Ansehen: Goldener Sack Pharaonenkorn, goldener_sack, zweites Mal; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_MAX\_0040 | Max | Ein Sack Mehl. Gold war nur die Verpackung. Opa nennt das Marketing. | Ansehen: Goldener Sack Pharaonenkorn, mehlsack; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_PIX\_0045 | Pixel | Mehl. Daraus macht man Dinge mit Kruste. Ich habe es dir in Ägypten gesagt. Ich sage es nicht noch mal. Doch, gerade eben. | Ansehen: Goldener Sack Pharaonenkorn, mehlsack, zweites Mal; Reserve, kommt nicht vor: Opa nimmt Ei und Sack schon in der Ankunftsszene; ID bleibt vergeben |
| FI\_INV\_MAX\_0050 | Max | Die Ewige Energiezelle. Sie summt ganz leise. Wenn ich sie ans Ohr halte, höre ich die Zukunft. Sie klingt nach Regen. | Ansehen: Ewige Energiezelle, ewig |
| FI\_INV\_MAX\_0055 | Max | Sie leuchtet im Dunkeln der Tasche. Meine Tasche hat jetzt Stimmungslicht. | Ansehen: Ewige Energiezelle, ewig, zweites Mal |
| FI\_INV\_MAX\_0060 | Max | Eine Batterie. Eine sehr gute Batterie. Ich hab eine KI dafür abgeschaltet. Die Fernbedienung wird glücklich sein. | Ansehen: Ewige Energiezelle, batterie |
| FI\_INV\_MAX\_0065 | Max | Auf der Seite steht „ewig“. Ich glaub's. Diese Batterie überlebt uns alle. Und die Fernbedienung auch. | Ansehen: Ewige Energiezelle, batterie, zweites Mal |
| FI\_INV\_MAX\_0070 | Max | Die Goldene Fernbedienung, ohne Zelle. Grau und leicht. Wie ein Pokal, der sich daran erinnert, dass er aus Plastik ist. | Ansehen: Goldene Fernbedienung, grau_ohne_zelle |
| FI\_INV\_MAX\_0075 | Max | Hinten ist das Batteriefach offen. Leer. Es wartet. Wie ich am Freitag auf den Schulschluss. | Ansehen: Goldene Fernbedienung, grau_ohne_zelle, zweites Mal |

## 10. Abspann-Szene und Abspann (FI\_ABSP, FI\_SUPM)

Szene. Auf dem Weg zur Tür kommt Max am Zapp-O-Mat vorbei und dreht aus Gewohnheit am Knopf. Dann der Supermarkt-Eingang am späten Abend mit zwei Ansehen-Zeilen und dem letzten Schritt durch die Tür. Danach der Abspann: fünf Geburtstagsfotos mit Bildunterschriften, während Troll Waldemar seine Musical-Nummer singt (Text ist Entwurf; laut `04-audio.md` schreibt der Autor den endgültigen Text). Nach dem Abspann ein letzter Satz von Pixel. Foto 4 hat zwei Fassungen nach dem Goblin-Weg.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| FI\_ABSP\_NAR\_0010 | – | Max geht am Zapp-O-Mat vorbei. Seine Hand findet den Drehknopf von selbst. Klick. | Max am Zapp-O-Mat im Wohnzimmer |
| FI\_ABSP\_TOA\_0020 | Toadi | Tut mir leid, Max, aber deine Milch ist in einem anderen Supermarkt. | auf dem Bildschirm, Pilzhut schief |
| FI\_ABSP\_MAX\_0030 | Max | Natürlich ist sie das. | schaltet aus, geht |
| FI\_ABSP\_PIX\_0040 | Pixel | Das ist ein Cliffhanger. Ich hasse Cliffhanger. Ich hasse sie fast so sehr wie Zeitreisen. | vom Teppich, zum Spieler |
| FI\_SUPM\_NAR\_0050 | – | Schnitt. Supermarkt-Eingang am späten Abend. Max steht vor der Glastür, Hände nicht in der Tasche. | Hintergrund Supermarkt |
| FI\_SUPM\_MAX\_0060 | Max | Ein Zeichen. Ein sehr deutliches Zeichen. | Ansehen: Aufsteller mit Milch-Sonderangebot |
| FI\_SUPM\_MAX\_0065 | Max | „Nur heute.“ Ich wusste, dass das kommt. Es steht seit vier Welten in den Sternen. Und auf dem Aufsteller. | Ansehen: Aufsteller mit Milch-Sonderangebot, zweites Mal |
| FI\_SUPM\_MAX\_0070 | Max | Die letzte Quest. Ganz ohne Drachen. | Ansehen: Milchregal durch die Tür |
| FI\_SUPM\_MAX\_0075 | Max | Die Milch steht ganz hinten. Natürlich. Jeder Laden ist ein Dungeon, und die Milch ist der Schatz im letzten Raum. | Ansehen: Milchregal durch die Tür, zweites Mal |
| FI\_SUPM\_MAX\_0080 | Max | Kein Rauschen. Kein Kanal. Nur eine Tür, die von selbst aufgeht. Hab ich auch noch nie gemacht. | Benutzen: Automatische Tür |
| FI\_SUPM\_NAR\_0090 | – | Die Tür gleitet auf. Max geht hinein. Das Licht aus dem Laden fällt auf den Gehweg. Schwarzblende. | Ende, Titelthema setzt ein, Jingle Welt geschafft |
| FI\_ABSP\_NAR\_0100 | – | Foto 1: Alle um den Couchtisch, der Kuchen angeschnitten, Oma mit Gabel, Opa mit Mehl im Haar. Im Zapp-O-Mat winken Kalle und Flimmer. Unterschrift: „Der Kuchen war keine Lüge.“ | Abspann-Foto 1 |
| FI\_ABSP\_NAR\_0110 | – | Foto 2: Zeldina misst mit Moderworts Zauberstab die Wohnzimmerwand aus. Oma hält das andere Ende. Unterschrift: „Der Dachboden wäre frei.“ | Abspann-Foto 2 |
| FI\_ABSP\_NAR\_0120 | – | Foto 3: Archimedes in Opas Badewanne, Ramses zwischen zwei Kuchenstücken, unentschlossen. Hermes kommt zur Tür herein, zu spät. Unterschrift: „Heureka. Schon wieder.“ | Abspann-Foto 3 |
| FI\_ABSP\_NAR\_0130 | – | Foto 4: Die Goblins singen im Treppenhaus, Schilder mit Silben in der Hand, Opa dirigiert mit dem Kochlöffel. Unterschrift: „Knuddel-Puddi, hau den Teig.“ | Abspann-Foto 4; nur Goblin-Weg A |
| FI\_ABSP\_NAR\_0140 | – | Foto 4: Grimmzahn mit Schlüsselbund inspiziert Opas Backofen. Er beschwert sich bei Modell 08/15 oder, ohne ihn, bei Pixel. Unterschrift: „Hausmeister unter sich.“ | Abspann-Foto 4; nur Goblin-Weg B |
| FI\_ABSP\_NAR\_0150 | – | Foto 5: Max' leerer Platz auf dem Sofa. Pixel liegt darauf, ein Auge offen, und sieht zur Tür. Unterschrift: „Er holt sie.“ | Abspann-Foto 5 |
| FI\_ABSP\_WAL\_0160 | Waldemar | Ich stand so lang unter der Brücke, hab Regeln gezählt und Ziegen gezählt … // Doch heute, ihr Leute, heut hab ich gewählt: Ich singe! Und niemand fällt ins Wasser! | Musical-Nummer, Strophe (Entwurf); Untertitel |
| FI\_ABSP\_WAL\_0170 | Waldemar | Ein Ei und ein Mehl und ein Knopf und ein Licht, // vier Welten, ein Kuchen, und Milch gab es nicht! | Refrain (Entwurf) |
| FI\_ABSP\_WAL\_0180 | Waldemar | Regel vierzehn b: Was man leiht, gibt man wieder. // Regel eins, ganz neu: Man singt seine Lieder! | zweite Strophe (Entwurf), Tonartwechsel |
| FI\_ABSP\_WAL\_0190 | Waldemar | Und wer heute noch sitzt, der steht morgen auf … // … und hooolt sieeee! | Schlusston, lang; im Hintergrund gehen die Niesrosen in Opas Blumenkasten auf |
| FI\_ABSP\_PIX\_0200 | Pixel | Er hat die Milch geholt. Freiwillig. Ohne Passwort. // Ich brauche einen Moment. Oder eine Dose. Am besten beides. | nach dem Abspann, Pixel allein auf dem Sofa, Schwarzbild mit Sprechblase; danach Hauptmenü |
