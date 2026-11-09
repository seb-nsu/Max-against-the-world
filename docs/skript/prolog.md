# Skript Prolog: Opas Dachboden

Das ganze Prolog-Skript als Entwurf und Muster für alle Welten: rund 170 Zeilen, Spielzeit etwa zehn Minuten. Die Tabellen nutzen die Kurzform aus `05-spielsysteme.md`: ID, Sprecher, Text und Regie oder Auslöser; eine Bedingung steht im Auslöser nach Semikolon. Eine Sprechblase fasst bis zu drei Zeilen (etwa 120 Zeichen); „//“ trennt Pixels Kaskaden in Folgeblasen. Die Nummern laufen pro Szene in Zehnerschritten durch, egal wer spricht, damit die Reihenfolge an der ID ablesbar ist. Die Kanäle sind festgelegt: 3 für Welt 1, 7 für Welt 2, 42 für Welt 3, 999 für Welt 4.

## 1. Wohnzimmer: Kein WLAN

Szene. Max liegt auf Opas Sofa, das Handy über dem Gesicht. Im Fernseher läuft eine Tierdoku ohne Ton.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_WOHN\_MAX\_0010 | Max | Ein Balken. Ein einziger Balken. | liegt, starrt aufs Handy |
| P0\_WOHN\_MAX\_0020 | Max | Und der ist auch nur zur Deko da. |  |
| P0\_WOHN\_OPA\_0030 | Opa (von oben) | Maaax! Komm mal rauf! Wissenschaft! | gedämpft durch die Decke |
| P0\_WOHN\_MAX\_0040 | Max | Wissenschaft hat kein WLAN. | ruft zurück, bewegt sich nicht |
| P0\_WOHN\_OPA\_0050 | Opa (von oben) | Das neue WLAN-Passwort liegt hier oben! |  |
| P0\_WOHN\_MAX\_0060 | Max | … | setzt sich langsam auf |
| P0\_WOHN\_MAX\_0070 | Max | Okay. Das ist unfair. | steht auf, Handy in die Bauchtasche |

**Ansehen im Wohnzimmer:**

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_WOHN\_MAX\_0110 | Max | Opas Fernseher. Älter als das Internet und genauso langsam. | Ansehen: Fernseher |
| P0\_WOHN\_MAX\_0120 | Max | Oma guckt auf jedem Foto, als hätte jemand ihren Geburtstag vergessen. | Ansehen: Familienfoto |
| P0\_WOHN\_MAX\_0130 | Max | Kalter Tee. Opa vergisst ihn jeden Tag. Es ist fast eine Tradition. | Ansehen: Teetasse |
| P0\_WOHN\_MAX\_0140 | Max | Hier lag früher die Fernbedienung. Jetzt liegt hier ein fernbedienungsförmiger Staubrand. | Ansehen: Leerer Platz auf dem Couchtisch |
| P0\_WOHN\_MAX\_0150 | Max | Das Sofa. Mein Zuhause. Mein Lebenswerk. | Ansehen: Sofa |

## 1b. Treppenhaus: Durchgang

Durchgang zwischen Wohnzimmer und Dachboden, zwei Ansehen-Objekte und die Treppe. Kein Rätsel, im Finale dieselbe Szene am Abend.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_TREP\_MAX\_0010 | Max | Opas Hut. Er trägt ihn nie, aber er hängt immer hier. Wie ein Wächter. | Ansehen: Hut am Haken |
| P0\_TREP\_MAX\_0020 | Max | Draußen Nachmittag, drinnen 1987. | Ansehen: Fenster |
| P0\_TREP\_MAX\_0030 | Max | Jede Stufe knarrt in einer anderen Tonart. Opa nennt das Alarmanlage. | Ansehen: Treppe |

## 2. Dachboden: Opas Auftrag

Szene beim ersten Betreten. Opa steht vor dem Zapp-O-Mat, Pixel schläft auf dem Kabel.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_DACH\_OPA\_0010 | Opa | Max! Endlich! Die Menschheit steht am Abgrund! | Finger erhoben |
| P0\_DACH\_MAX\_0020 | Max | Hi, Opa. Das Passwort? |  |
| P0\_DACH\_OPA\_0030 | Opa | Passwörter sind für Leute, die eine Zukunft haben. Wir haben vielleicht keine mehr. | dramatisch |
| P0\_DACH\_OPA\_0040 | Opa | Darf ich vorstellen: der Zapp-O-Mat 3000. Jeder Kanal ist eine Welt. | zeigt auf den Fernseher |
| P0\_DACH\_MAX\_0050 | Max | Das ist ein Fernseher. |  |
| P0\_DACH\_OPA\_0060 | Opa | Das ist ein Fernseher, durch den man hindurchgehen kann. Großer Unterschied. |  |
| P0\_DACH\_OPA\_0070 | Opa | Ich brauche vier Dinge. Ein Drachenei. Einen goldenen Sack Pharaonenkorn. | zählt an den Fingern |
| P0\_DACH\_OPA\_0080 | Opa | Eine ewige Energiezelle. Und die Goldene Fernbedienung. |  |
| P0\_DACH\_OPA\_0090 | Opa | Sonst geht heute Abend die Welt unter. Zumindest meine. | leiser |
| P0\_DACH\_MAX\_0100 | Max | Klingt nach einer Staffel mit zu vielen Folgen. |  |
| P0\_DACH\_OPA\_0110 | Opa | Vier Dinge, dann bekommst du das Passwort. Ehrenwort eines Wissenschaftlers. |  |
| P0\_DACH\_MAX\_0120 | Max | Wie wär's mit einem Teil vom Passwort pro Ding? |  |
| P0\_DACH\_OPA\_0130 | Opa | Wie wär's mit gar keinem, wenn du weiter verhandelst? |  |
| P0\_DACH\_OPA\_0140 | Opa | Übrigens, hast du irgendwo meine Fernbedienung gesehen? Die normale. | beiläufig |
| P0\_DACH\_MAX\_0150 | Max | Nein. |  |
| P0\_DACH\_OPA\_0160 | Opa | Schade. Ganz schlecht. Egal! Erst mal muss der Kater vom Kabel. Der Kater, Modell Pixel, Baujahr unbekannt. |  |

## 2b. Gespräche: Opa und Pixel

Reden mit Opa und Pixel auf dem Dachboden. Max stellt die Frage, die Antwort folgt als eigene Zeile; gelesene Optionen werden grau. Pixels Baum gilt ab P1.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_1310 | Max | Was genau ist der Zapp-O-Mat? | Option Opa |
| P0\_DACH\_OPA\_1320 | Opa | Ein Fernseher, der nicht zeigt, sondern hinschickt. Zurück holt dich der Werbeblock. Frag nicht, warum. | stolz, dann unsicher |
| P0\_DACH\_MAX\_1322 | Max | Wie krieg ich Pixel vom Kabel? | Option Opa; nur vor P1 (Hinweise zu P1 laut Spielsysteme, Wer hilft wann) |
| P0\_DACH\_OPA\_1324 | Opa | Mit Argumenten. Er versteht genau eins, und das liegt in meiner Werkzeugkiste. // Zwischen Schraubenzieher und Draht. | Hinweis P1, Stufe 1 (Thunfischdose); Kaskade |
| P0\_DACH\_OPA\_1326 | Opa | Und die Dose ist zu. Da hilft kein Reden. Da hilft Kurbeln. | Hinweis P1, Stufe 2 (Dosenöffner); ersetzt 1324 beim nächsten Klick auf die Option, frühestens 30 Sekunden nach 1324 |
| P0\_DACH\_OPA\_1328 | Opa | Mach die Thunfischdose mit dem Dosenöffner auf. Dann ist er sofort da. | Hinweis P1, Stufe 3; ersetzt 1326 beim nächsten Klick auf die Option, frühestens 60 Sekunden nach 1326; vorher wiederholt Opa die letzte Stufe |
| P0\_DACH\_MAX\_1330 | Max | Warum ich? | Option Opa |
| P0\_DACH\_OPA\_1340 | Opa | Weil du der Einzige bist, der gerade nichts zu tun hat. Und weil ich dir vertraue. In der Reihenfolge. | zwinkert |
| P0\_DACH\_MAX\_1350 | Max | Was ist drüben gefährlich? | Option Opa |
| P0\_DACH\_OPA\_1360 | Opa | Alles, was du anfasst, ohne es vorher anzusehen. Ansehen ist umsonst. | Hinweis auf den Rechtsklick |
| P0\_DACH\_MAX\_1370 | Max | Ich muss noch was anderes machen. | Option Opa, beendet das Gespräch |
| P0\_DACH\_OPA\_1380 | Opa | Dann mach. Der Fernseher läuft nicht weg. Hoffe ich. | sieht den Zapp-O-Mat prüfend an |
| P0\_DACH\_MAX\_1390 | Max | Kommst du mit? | Option Pixel; nach P1 |
| P0\_DACH\_PIX\_1400 | Pixel | Ich komme nirgendwo mit. Ich werde mitgenommen. // Das ist ein Unterschied in Würde. | Kaskade |
| P0\_DACH\_MAX\_1410 | Max | Was weißt du über Opas Erfindungen? | Option Pixel; nach P1 |
| P0\_DACH\_PIX\_1420 | Pixel | Alle wärmen gut. Keine funktioniert. Eine fliegt. | Hinweis auf den Toaster |
| P0\_DACH\_MAX\_1430 | Max | Schlaf weiter. | Option Pixel, beendet das Gespräch |
| P0\_DACH\_PIX\_1440 | Pixel | Endlich ein vernünftiger Vorschlag. | rollt sich ein |

## 3. Rätsel P1: Der schlafende Kater

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_0210 | Max | Pixel liegt auf dem Stromkabel. Er hat sich den wärmsten Platz im Haus ausgesucht. Respekt. | Ansehen: Pixel |
| P0\_DACH\_MAX\_0220 | Max | Er wiegt so viel wie ein Umzugskarton. Ein voller. | Benutzen: Pixel |
| P0\_DACH\_OPA\_0230 | Opa | Den kriegst du nicht weg. Der Kater schläft wie ein Stein. Ein beleidigter Stein. | nach zwei Versuchen |
| P0\_DACH\_MAX\_0240 | Max | Opas Werkzeugkiste. Schraubenzieher, Draht, Thunfisch. Wie man halt so sortiert. | Ansehen: Werkzeugkiste |
| P0\_DACH\_MAX\_0250 | Max | Eine Dose Thunfisch. Notproviant. Opa denkt an alles. Außer an WLAN. | Nehmen: Thunfischdose |
| P0\_DACH\_MAX\_0260 | Max | Ein Dosenöffner. Zum Kurbeln. Wie eine App, nur mit Muskeln. | Nehmen: Dosenöffner |
| P0\_DACH\_MAX\_0270 | Max | Ich hab keine Lust, die mit den Zähnen aufzumachen. | Thunfischdose auf Pixel (noch zu) |
| P0\_DACH\_MAX\_0280 | Max | Zisch. | Dosenöffner mit Thunfischdose |
| P0\_DACH\_NAR\_0290 | – | Pixel hebt die Nase. Ein Auge geht auf. Dann das zweite. | Szene, ohne Text, nur Animation |
| P0\_DACH\_OPA\_0300 | Opa | Ah, er lebt! Moment, ich schalte ihm den Lautsprecher ein. | drückt aufs Halsband |
| P0\_DACH\_PIX\_0310 | Pixel | Wer. Hat. Mich. Geweckt. | Halsband leuchtet türkis |
| P0\_DACH\_PIX\_0320 | Pixel | Ich lag auf dem einzigen warmen Kabel dieses Dachbodens. // Ich hatte einen Traum. // Er handelte von Lachs. |  |
| P0\_DACH\_MAX\_0330 | Max | Er redet. |  |
| P0\_DACH\_PIX\_0340 | Pixel | Er redet seit Jahren. Bisher hat nur keiner zugehört. Ist das Thunfisch in Lake oder in Öl? |  |
| P0\_DACH\_MAX\_0350 | Max | In Lake. |  |
| P0\_DACH\_PIX\_0360 | Pixel | Barbarisch. Gib her. | frisst, wechselt vom Kabel auf die Werkbank |
| P0\_DACH\_OPA\_0370 | Opa | Pixel kommt mit. Er kennt die Welten. Und er kennt alle Antworten. | schaltet nebenbei den Zapp-O-Mat ein, der Bildschirm rauscht |
| P0\_DACH\_PIX\_0380 | Pixel | Ich kenne alle Antworten. Ich gebe sie nur ungern heraus. // Wer festhängt, kann ja mal die Pfote drücken. Höflich. | Hilfe-Pfote leuchtet zum ersten Mal auf |
| P0\_DACH\_MAX\_0390 | Max | Ein Kater mit Hilfefunktion. Wie ein Chatbot, nur haariger. |  |

## 4. Rätsel P2: Nur Rauschen

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_0400 | Max | Der Zapp-O-Mat. Aus. Solange Pixel auf dem Kabel liegt, schaltet Opa ihn nicht ein. | Ansehen: Zapp-O-Mat; vor P1 |
| P0\_DACH\_MAX\_0410 | Max | Er ist an. Er zeigt nur nichts. Sieht aus wie ein Ladebildschirm, der aufgegeben hat. | Ansehen: Zapp-O-Mat (rauschend); nach P1 |
| P0\_DACH\_PIX\_0420 | Pixel | Das nennt man Schnee. Früher hat man das stundenlang angesehen, wenn das Programm vorbei war. |  |
| P0\_DACH\_MAX\_0430 | Max | Wenn das Programm vorbei war? Das Programm war einfach … vorbei? |  |
| P0\_DACH\_OPA\_0440 | Opa | Die Antenne fehlt! Empfangsorgan, Modell Kleiderbügel. Ich hab sie verliehen. Oder eingebaut. Irgendwo. |  |
| P0\_DACH\_MAX\_0450 | Max | Opas Kleiderschrank. Drei Strickjacken, alle braun, alle mit Werkzeug in den Taschen. | Ansehen: Kleiderschrank |
| P0\_DACH\_MAX\_0460 | Max | Ein Kleiderbügel aus Draht. Leer und traurig. | Nehmen: Drahtkleiderbügel |
| P0\_DACH\_MAX\_0470 | Max | Wenn ich den hier knicke und da biege … Sieht aus wie ein Hase mit Empfang. Vielversprechend. | Benutzen: Drahtkleiderbügel im Inventar, oder ungebogener Bügel auf Zapp-O-Mat nach P1 (dann folgt 0480 direkt) |
| P0\_DACH\_MAX\_0480 | Max | So. Antenne. Ich bin jetzt offiziell Techniker. | Antenne auf Zapp-O-Mat; nach P1, löst P2 |
| P0\_DACH\_PIX\_0490 | Pixel | Früher war das ein ehrbarer Beruf. |  |
| P0\_DACH\_OPA\_0500 | Opa | Das Bild ist da! Jetzt nur noch der richtige Kanal. Welcher war's noch mal? | Rauschen wird bunter |

## 5. Rätsel P3: Der richtige Kanal

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_OPA\_0610 | Opa | Ich hab's mir aufgeschrieben. Ganz bestimmt. Irgendwo, wo ich jeden Tag hinsehe. | nach P2 |
| P0\_DACH\_MAX\_0620 | Max | Ein Kalender. Ein Tag ist dick rot eingekreist. Entweder Geburtstag oder Zahnarzt. | Ansehen: Kalender |
| P0\_DACH\_MAX\_0630 | Max | Und daneben, ganz klein: „K3 – Schwurbelstein“. | Ansehen: Kalender, zweites Mal; öffnet die Nahansicht Kalender, Max kennt ab jetzt die Nummer |
| P0\_DACH\_MAX\_0640 | Max | Opa, was ist mit dem roten Kreis? | Reden: Opa, nach Kalender |
| P0\_DACH\_OPA\_0650 | Opa | Der Kreis? Ach, der. Das ist … ein Kreis. Kreise sind wichtig. Rund. Ja. | weicht aus, schaut weg |
| P0\_DACH\_PIX\_0660 | Pixel | Er lügt. Ich rieche das. Es riecht nach Angst und ein bisschen nach Kuchen. |  |
| P0\_DACH\_MAX\_0670 | Max | Kanal 3. | Benutzen: Drehknopf; nach P2 und nach 0630, löst P3 |
| P0\_DACH\_MAX\_0680 | Max | Kanal 4. Sieht aus wie Kanal 3, nur langweiliger. | Benutzen: Drehknopf nach P2, bevor Max die Nummer kennt (Testbild Kanal 4) |
| P0\_DACH\_OPA\_0690 | Opa | Halt! Die Tasche! | Bildschirm zeigt den Wirbel |

## 6. Die Reisetasche

Kurze Szene, führt die Reisetasche ein. Im Prolog gibt es nur das Pflichtfach; die Wahlfächer öffnen sich ab der Rückkehr aus Welt 1.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_DACH\_OPA\_0810 | Opa | Meine Reisetasche. Notizbuch und Thunfisch reisen immer mit. Das ist das Pflichtfach. | reicht die Tasche |
| P0\_DACH\_PIX\_0820 | Pixel | Der Thunfisch ist die einzig vernünftige Entscheidung heute. |  |
| P0\_DACH\_OPA\_0830 | Opa | Und das hier liest du erst drüben. | steckt einen Zettel ein |
| P0\_DACH\_MAX\_0840 | Max | Ein Zettel. Opa, das ist wie ein Spoiler, nur dass man ihn nicht lesen darf. | Ansehen: Opas Zettel |
| P0\_DACH\_OPA\_0845 | Opa | Drüben vergeht die Zeit anders. Hier nicht. Also beeil dich trotzdem. | ernst, dann grinst er |
| P0\_DACH\_PIX\_0850 | Pixel | Ich hasse Reisen. // Ich hasse Zeitreisen noch mehr. // Ich hasse Fernsehreisen am allermeisten, glaube ich. |  |
| P0\_DACH\_OPA\_0860 | Opa | Viel Glück! Bring das Ei heil zurück! Und lies den Zettel erst drüben! | Max berührt den Bildschirm |
| P0\_DACH\_MAX\_0870 | Max | Hab ich jetzt zugestimmt? Ich glaube, ich hab nicht zugestimmt – | wird eingesaugt |
| P0\_DACH\_PIX\_0880 | Pixel | Miiiaaau! | hinterher; Lautsprecher: „Übersetzung nicht verfügbar“ |

## 7. Nur zum Ansehen auf dem Dachboden

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_0910 | Max | Opas erster Versuch einer Unterwasser-Zeitmaschine. Der Fisch hat's nicht geschafft. | Ansehen: Ausgestopfter Fisch |
| P0\_DACH\_PIX\_0920 | Pixel | Siebzehn Fernbedienungen, und die richtige ist nie dabei. | Ansehen: Kiste mit Fernbedienungen; nach P1 |
| P0\_DACH\_MAX\_0930 | Max | Eine Pyramide und eine Neonstadt. Opa hat einen sehr breiten Geschmack. Oder Reisepläne. | Ansehen: Poster |
| P0\_DACH\_MAX\_0940 | Max | Ein Toaster mit Propeller. Fliegendes Frühstück. Nie wieder. | Ansehen: Toaster |
| P0\_DACH\_PIX\_0945 | Pixel | Wir haben uns geeinigt. Er bleibt aus, ich behalte das andere Ohr. | Ansehen: Opas Staubsauger-Prototyp; nach P1 |
| P0\_DACH\_PIX\_0950 | Pixel | Ein Eselsohr bei Schokokuchen. Interessant. | Ansehen: Kochbuch; nach P1 |
| P0\_DACH\_MAX\_0960 | Max | „Schlager für Erfinder, Folge 3“. Es gibt also noch zwei schlimmere. | Ansehen: Plattenspieler |
| P0\_DACH\_MAX\_0970 | Max | Der Ohrensessel. Gefährlich bequem. Wenn ich mich da reinsetze, komme ich nie wieder raus. | Ansehen: Ohrensessel |
| P0\_DACH\_MAX\_0980 | Max | Eine Werkbank voller halber Erfindungen. Wie mein Hausaufgaben-Ordner. | Ansehen: Werkbank |
| P0\_DACH\_MAX\_0990 | Max | Das Dachfenster. Draußen ist Welt. Wird überbewertet. | Ansehen: Dachfenster |
| P0\_DACH\_MAX\_1000 | Max | Da geht's runter. Zum Sofa. Nein. Konzentration. | Bodenluke; vor P3 |

## 8. Fehlversuche mit eigener Zeile

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_1110 | Max | Pixel will keinen Draht. Pixel will Fisch. Pixel will immer Fisch. | Kleiderbügel auf Pixel |
| P0\_DACH\_PIX\_1120 | Pixel | Steck mir das nicht in den Fernseher. Ich bin keine Antenne. Ich bin ein Gesamtkunstwerk. | Pixel auf Zapp-O-Mat (Figurenwechsel noch nicht möglich, als Inventar-Versuch); nach P1 |
| P0\_DACH\_MAX\_1130 | Max | Der Dosenöffner passt nicht in den Fernseher. Hab's geprüft. | Dosenöffner auf Zapp-O-Mat |
| P0\_DACH\_MAX\_1150 | Max | Erst Strom, dann Empfang. Und für Strom muss der Kater vom Kabel. | Drahtkleiderbügel oder Antenne auf Zapp-O-Mat vor P1 |
| P0\_DACH\_OPA\_1140 | Opa | Nicht am Knopf drehen, bevor das Bild da ist! Der Werbeblock ist für den Rückweg. // Fünf Sekunden Milchwerbung, dann bist du wieder hier. Keiner weiß, warum. | Drehknopf vor P2 |

## 8b. Zurufe

Pixel und Opa kommentieren ungefragt, wenn der Spieler 45 Sekunden nichts tut. Zufällig gezogen, nie zweimal hintereinander.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_WOHN\_OPA\_1210 | Opa | Max! Bist du noch da oder schon eingeschlafen? | Wohnzimmer, aus dem Off; vor dem Dachboden |
| P0\_WOHN\_MAX\_1220 | Max | Ohne WLAN vergeht die Zeit langsamer. Das ist Physik. Glaube ich. | Wohnzimmer |
| P0\_DACH\_PIX\_1230 | Pixel | Ich würde ja helfen. Aber ich bin gerade so schön liegengeblieben. | Dachboden; nach P1 |
| P0\_DACH\_PIX\_1240 | Pixel | Der Fernseher starrt dich an. Du starrst zurück. Einer von euch muss nachgeben. | Dachboden; nach P1, vor P3 |

## 8c. Hinweise der Hilfe-Pfote (P0\_HINT)

Ab P1 gibt Pixel die Hinweise über die Pfote (P1 selbst über Opa, Abschnitt 2b). Schema wie in Welt 1: P0\_HINT\_PIX\_RRSK, RR Rätselnummer, S Stufe, K Teilschritt (0). Datei game/daten/hinweise/prolog.json.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_HINT\_PIX\_0210 | Pixel | Ein Fernseher ohne Antenne ist wie ein Napf ohne Futter. Sinnlos. | P2, Stufe 1 |
| P0\_HINT\_PIX\_0220 | Pixel | Im Schrank hängt allerlei Draht. Opa nennt das Garderobe. | P2, Stufe 2 |
| P0\_HINT\_PIX\_0230 | Pixel | Nimm den Kleiderbügel aus dem Schrank und steck ihn oben auf den Fernseher. Ich habe Pfoten, ich mach das nicht. | P2, Stufe 3 |
| P0\_HINT\_PIX\_0310 | Pixel | Dein Opa schreibt sich alles irgendwohin. Meistens an die Wand. | P3, Stufe 1 |
| P0\_HINT\_PIX\_0320 | Pixel | Sieh dir den Kalender genauer an. Nicht nur den roten Kreis. | P3, Stufe 2 |
| P0\_HINT\_PIX\_0330 | Pixel | Auf dem Kalender steht die Kanalnummer. Stell sie am Drehknopf ein. | P3, Stufe 3 |
| P0\_HINT\_PIX\_9995 | Pixel | Ich denke noch nach. Das sieht aus wie Schlafen, ist es aber nicht. | Wartezeile, nächste Stufe noch gesperrt |

## 9. Ersatz-Zeilen (Auszug aus dem Pool)

Zufällig gezogen, wenn nichts Spezielles passt; gelten für das ganze Spiel.

| ID | Sprecher | Text |
| --- | --- | --- |
| SYS\_ERS\_MAX\_0010 | Max | Nein. |
| SYS\_ERS\_MAX\_0020 | Max | Das ergibt nicht mal in einer Serie Sinn. |
| SYS\_ERS\_MAX\_0030 | Max | Funktioniert nicht. Wie meine Motivation. |
| SYS\_ERS\_MAX\_0040 | Max | Ich könnte. Aber warum. |
| SYS\_ERS\_MAX\_0050 | Max | Netter Versuch, Max. Nein, eigentlich nicht. |
| SYS\_ERS\_MAX\_0060 | Max | Das lasse ich lieber. Für die Kommentare. |
| SYS\_ERS\_PIX\_0110 | Pixel | Interessant. Nein, Moment. Doch nicht. |
| SYS\_ERS\_PIX\_0120 | Pixel | Ich bin zu wichtig für so etwas. |
| SYS\_ERS\_PIX\_0130 | Pixel | Das ist weder essbar noch zum Draufschlafen. Also irrelevant. |
| SYS\_ERS\_PIX\_0140 | Pixel | Meine Pfoten sind für Größeres bestimmt. Zum Beispiel für Thunfisch. |
| SYS\_ERS\_MAX\_0070 | Max | Das ist eine Idee. Keine gute, aber eine. |
| SYS\_ERS\_MAX\_0080 | Max | Ich hab das mal in einer Serie gesehen. Ging schief. |
| SYS\_ERS\_MAX\_0090 | Max | Dafür gibt es bestimmt eine App. Hier nicht. |
| SYS\_ERS\_MAX\_0100 | Max | Ich lade das lieber nicht herunter. |
| SYS\_ERS\_MAX\_0110 | Max | Nö. Nächster Vorschlag. |
| SYS\_ERS\_MAX\_0120 | Max | Das wäre ein Cliffhanger. Ohne Fortsetzung. |
| SYS\_ERS\_MAX\_0130 | Max | Opa würde sagen: Früher ging das. Früher ging alles. |
| SYS\_ERS\_MAX\_0140 | Max | Buffering. Also: nein. |
| SYS\_ERS\_MAX\_0150 | Max | Ich spüre, wie mein Akku sinkt. Gefühlt. |
| SYS\_ERS\_MAX\_0160 | Max | Nicht mal mit Cheatcode. |
| SYS\_ERS\_MAX\_0170 | Max | Das passt nicht zusammen. Wie Pixel und Höflichkeit. |
| SYS\_ERS\_MAX\_0180 | Max | Ich überspring das. Wie das Intro. |
| SYS\_ERS\_MAX\_0190 | Max | Dafür bin ich nicht ausgeschlafen genug. |
| SYS\_ERS\_MAX\_0200 | Max | Das steht in keiner Komplettlösung. Aus gutem Grund. |
| SYS\_ERS\_MAX\_0210 | Max | Hm. Nein. Hm. |
| SYS\_ERS\_MAX\_0220 | Max | Das wäre eine Folge, die niemand zweimal schaut. |
| SYS\_ERS\_MAX\_0230 | Max | Ich lass die Finger davon. Zumindest einen. |
| SYS\_ERS\_MAX\_0240 | Max | Mein Handy hätte das gewusst. Hätte. |
| SYS\_ERS\_MAX\_0250 | Max | Fast. Also gar nicht. |
| SYS\_ERS\_PIX\_0150 | Pixel | Versuch es mit Thunfisch. Alles geht mit Thunfisch. |
| SYS\_ERS\_PIX\_0160 | Pixel | Ich habe das gesehen. Ich werde es nie vergessen. Leider. |
| SYS\_ERS\_PIX\_0170 | Pixel | Nein. Und ich sage das als Experte für Nein. |
| SYS\_ERS\_PIX\_0180 | Pixel | Darauf schlafe ich nicht. Also wozu. |
| SYS\_ERS\_PIX\_0190 | Pixel | Ich kenne eine Katze, die das versucht hat. Sie redet nicht mehr darüber. |
| SYS\_ERS\_PIX\_0200 | Pixel | Das riecht nach Fehler. Ich habe eine sehr gute Nase. |
| SYS\_ERS\_PIX\_0210 | Pixel | Ich könnte helfen. Ich könnte auch schlafen. Rate. |
| SYS\_ERS\_PIX\_0220 | Pixel | In meiner Jugend hat man so etwas einfach umgestoßen. |
| SYS\_ERS\_PIX\_0230 | Pixel | Meine Vorfahren wurden wie Götter verehrt. Das hier ist unter unserer Würde. |
| SYS\_ERS\_PIX\_0240 | Pixel | Ich bin ein Kater, kein Schraubenzieher. |
| SYS\_ERS\_PIX\_0250 | Pixel | Das ist eine Frage für Menschen. Ich bin nur wegen des Fischs hier. |
| SYS\_ERS\_PIX\_0260 | Pixel | Miau. Das war ein Nein. Ein höfliches. |
| SYS\_ERS\_PIX\_0270 | Pixel | Dafür müsste ich aufstehen. Also nein. |
| SYS\_ERS\_PIX\_0280 | Pixel | Ich fühle mich nicht angesprochen. Ich fühle mich selten angesprochen. |
| SYS\_ERS\_PIX\_0290 | Pixel | Sehr kreativ. Sehr falsch. |
| SYS\_ERS\_PIX\_0300 | Pixel | Wenn das klappt, fresse ich einen Besen. Keine Sorge, es klappt nicht. |
| SYS\_ERS\_PIX\_0310 | Pixel | Das funktioniert nur in Filmen. Und in Filmen bin ich besser. |
| SYS\_ERS\_PIX\_0320 | Pixel | Ich hatte einen Traum, in dem das funktionierte. Es war ein Albtraum. |
| SYS\_ERS\_PIX\_0330 | Pixel | Das ist unter meinem Niveau. Mein Niveau liegt bei Dosen. |
| SYS\_ERS\_PIX\_0340 | Pixel | Ich rate selten ab. Jetzt rate ich ab. |
| SYS\_ERS\_PIX\_0350 | Pixel | Nein. Aber hübsch, wie du es versucht hast. |
