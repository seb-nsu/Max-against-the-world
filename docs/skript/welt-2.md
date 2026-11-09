# Skript Welt 2: Antikodonien

Das komplette Dialog-Skript für Welt 2 als Entwurf, rund 900 Zeilen: Ankunft im Nil-Delta, alle elf Rätsel mit Gesprächsbäumen, Ansehen-, Benutzen- und Kombinierzeilen, die beiden Wettkampftage mit beiden Minispielen, Zeitfähre, Siegesparade und Abschluss, dazu Pixel-auf-Mensch-Zeilen, Zurufe und die Hinweise in drei Stufen je Rätselschritt. Aufbau und Kurzform wie im Skript Prolog: ID, Sprecher, Text und Regie (Szenen) oder Auslöser (sonst), Bedingung nach Semikolon; Nummern in Zehnerschritten je Szene, Pixels Kaskaden mit „//“. Die Rückkehr auf den Dachboden steht im Skript der Zwischenspiele, die Ersatzzeilen im SYS\_ERS-Pool.

## 1. Nil-Delta: Ankunft

Szene beim ersten Betreten. Max und Pixel purzeln aus dem Wirbel in den Sand am Fährsteg. Im Hintergrund steht die Pyramide auf der Spitze, Arbeiter kratzen sich am Kopf.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_NIL\_MAX\_0010 | Max | Sand. Im Schuh, im Hoodie, im Handy. | setzt sich auf, schüttelt den Sneaker aus |
| W2\_NIL\_PIX\_0020 | Pixel | Ich bin auf dem Kopf gelandet. Auf deinem. Danke dafür. | klettert von Max' Kopf |
| W2\_NIL\_MAX\_0030 | Max | Kanal 7. Fühlt sich an wie eine Doku, bei der man nicht vorspulen kann. | blinzelt in die Sonne |
| W2\_NIL\_PIX\_0040 | Pixel | Heiß. Trocken. Keine Dose weit und breit. // Ich war schon mal hier. Vor etwa viertausend Jahren. // Man hat mich angebetet. Ich erwarte dasselbe. | hebt das Kinn |
| W2\_NIL\_MAX\_0050 | Max | Du warst nie hier. Du warst nicht mal im Garten. |  |
| W2\_NIL\_PIX\_0060 | Pixel | Meine Vorfahren waren hier. Das zählt. Blut ist dicker als Dosenlake. |  |
| W2\_NIL\_MAX\_0070 | Max | Die Pyramide steht falsch rum. |  |
| W2\_NIL\_PIX\_0080 | Pixel | Das ist dir aufgefallen. Beachtlich. Vor dem Sand, nach dem Handy. |  |
| W2\_NIL\_MAX\_0090 | Max | Ein Pharao, ein goldener Sack, dann Sofa. Wie schwer kann das sein. | steht auf, Hände in die Bauchtasche |
| W2\_NIL\_PIX\_0100 | Pixel | Das hast du in Schwurbelstein auch gesagt. Vor dem Troll. Und vor der Ziege. | geht voraus Richtung Steg |
| W2\_NIL\_NAR\_0110 | – | Im Wasser neben dem Steg hebt ein Krokodil den Kopf, sieht Pixel und senkt ihn langsam wieder. Sehr langsam. | Sobek-Verbeugung, Animation ohne Text |
| W2\_NIL\_PIX\_0120 | Pixel | Siehst du? Es fängt schon an. |  |

## 2. Nil-Delta: Rätsel 1, die Krokodil-Fähre

Der Fährmann will einen Obolus. Max hat keinen. Sobek verneigt sich vor Pixel, und Pixel steigt als Gott ein; Max fährt als heiliger Diener gratis mit.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_NIL\_MAX\_0210 | Max | Eine Fähre aus Holz und einem Krokodil. Die Sicherheitseinweisung spare ich mir. | Ansehen: Fähre |
| W2\_NIL\_PIX\_0215 | Pixel | Ein Boot mit eingebautem Krokodil. Endlich ein Verkehrsmittel, das mich versteht. | Ansehen: Fähre, zweites Mal |
| W2\_NIL\_MAX\_0220 | Max | Ein alter Mann mit Stange und offener Hand. Die Hand ist das Kartenlesegerät. | Ansehen: Fährmann |
| W2\_NIL\_PIX\_0225 | Pixel | Früher hat man dem Fährmann eine Münze unter die Zunge gelegt. Ich lege niemandem etwas unter die Zunge. Ich bin Katze, kein Sparschwein. | Ansehen: Fährmann, zweites Mal |
| W2\_NIL\_MAX\_0230 | Max | Das Krokodil trägt einen Hut aus Schilf. Und guckt wie ich im Matheunterricht. | Ansehen: Sobek |
| W2\_NIL\_PIX\_0240 | Pixel | Ein Teenager. Man sieht es am Augenrollen. Und am Hut. Der Hut ist ein Hilfeschrei. | Ansehen: Sobek, zweites Mal |
| W2\_NIL\_MAX\_0250 | Max | Ich würde gern mitfahren. | Reden: Fährmann, Einstieg |
| W2\_NIL\_FAE\_0260 | Fährmann | Ein Obolus. Eine Münze. Unter die Zunge oder in die Hand, mir egal. |  |
| W2\_NIL\_MAX\_0270 | Max | Ich hab drei Prozent Akku und einen Kaugummi. | Notizbuch: Sphinx-Baustein „stirbt bei drei Prozent“ |
| W2\_NIL\_FAE\_0280 | Fährmann | Der Fluss nimmt keine Kaugummis. Der Fluss nimmt Münzen. Seit viertausend Jahren. Ohne Preiserhöhung. |  |
| W2\_NIL\_MAX\_0290 | Max | Wohin fährt die Fähre? | Option Fährmann |
| W2\_NIL\_FAE\_0300 | Fährmann | Flussabwärts nach Olympia, dann bis Syrakus. Flussaufwärts zurück. Dazwischen liegen Jahre. Wörtlich. |  |
| W2\_NIL\_MAX\_0310 | Max | Was ist mit dem Krokodil? | Option Fährmann |
| W2\_NIL\_FAE\_0320 | Fährmann | Sobek. Zieht die Fähre, seit sein Vater in Rente ist. Hat keine Lust. Hat nie Lust. Verneigt sich vor nichts. |  |
| W2\_NIL\_FAE\_0330 | Fährmann | Moment. Vor wem verneigt er sich da gerade? | sieht zu Pixel |
| W2\_NIL\_MAX\_0340 | Max | Warum steht die Pyramide auf dem Kopf? | Option Fährmann |
| W2\_NIL\_FAE\_0350 | Fährmann | Der Bauplan. Jemand hat ihn falsch herum gehalten. Seit dreißig Jahren streiten sie, wer. |  |
| W2\_NIL\_MAX\_0360 | Max | Dann warte ich halt. | Option Fährmann, beendet das Gespräch |
| W2\_NIL\_FAE\_0370 | Fährmann | Der Fluss wartet mit. Der Fluss hat Zeit. |  |
| W2\_NIL\_MAX\_0380 | Max | Ich hab kein Geld. Er will Geld. Das ist das ganze Problem, in einem Satz. | Benutzen: Fähre ohne Lösung |
| W2\_NIL\_PIX\_0390 | Pixel | Das Krokodil hat sich vor mir verneigt. Vor mir. Ich glaube, hier hat man Geschmack. | Pixel ans Wasser (Spielfigur Pixel oder Pixel auf Sobek) |
| W2\_NIL\_MAX\_0400 | Max | Nimm Pixel als Fahrkarte. | Pixel auf Fähre; Spielfigur Pixel betritt die Fähre |
| W2\_NIL\_FAE\_0410 | Fährmann | Das Krokodil verneigt sich. Das Krokodil hat sich noch nie verneigt. Nicht mal vor mir. | Sobek-Verbeugung |
| W2\_NIL\_FAE\_0420 | Fährmann | Ein Gott. Ein echter Katzengott. Auf meiner Fähre. Götter fahren frei. Und ihre Diener. | verneigt sich ebenfalls |
| W2\_NIL\_MAX\_0430 | Max | Diener. |  |
| W2\_NIL\_PIX\_0440 | Pixel | Heiliger Diener. Wenn schon, dann richtig. // Du trägst ab jetzt mein Kissen. // Es gibt noch kein Kissen. Besorg eins. | schwebt auf die Fähre |
| W2\_NIL\_MAX\_0450 | Max | Ich bin das Zubehör eines Katers. Das geht in keinen Lebenslauf. |  |
| W2\_NIL\_FAE\_0460 | Fährmann | Wohin, Erhabener? Und du, Diener, setz dich nach hinten. | Flusskarte öffnet sich |
| W2\_NIL\_MAX\_0470 | Max | Ein Kaugummi als Fahrgeld. Er sagt, der Fluss nimmt keine Kaugummis. | Kaugummi auf Fährmann |
| W2\_NIL\_MAX\_0480 | Max | Das Handy als Pfand? Dann hab ich drei Prozent weniger Leben. | Handy auf Fährmann |
| W2\_NIL\_FAE\_0490 | Fährmann | Eine leere Dose. Glänzt wie Silber. Ist aber keine. Ich bin alt, nicht blind. | Thunfischdose auf Fährmann |
| W2\_NIL\_PIX\_0500 | Pixel | Die Dose bleibt bei mir. Sie hat Erinnerungswert. Sie erinnert mich an Thunfisch. |  |
| W2\_NIL\_MAX\_0510 | Max | Dem Krokodil den Kugelschreiber geben? Es hat keine Hände. Nur Meinungen. | Kugelschreiber auf Sobek |

## 3. Nil-Delta: Ansehen und Umgebung

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_NIL\_MAX\_0610 | Max | Jemand hat hier sehr bedeutungsvoll durchs Korn gestreichelt. | Ansehen: Weizenfeld mit Handabdruck |
| W2\_NIL\_MAX\_0615 | Max | Ein Handabdruck im Korn. Fehlt nur noch, dass einer in Rüstung durchläuft, traurig guckt und irgendwo Streicher anfangen. | Ansehen: Weizenfeld mit Handabdruck, zweites Mal |
| W2\_NIL\_PIX\_0620 | Pixel | Korn. Daraus macht man Dinge mit Kruste. Merk dir das. Ich merke es mir. | Ansehen: Weizenfeld, zweites Mal; Notizbuch Seite 3: „irgendwas aus Mehl, mit Kruste“ |
| W2\_NIL\_MAX\_0630 | Max | Eine Sanduhr, so groß wie ich. Der Sand läuft nach oben. Oder nach unten. Je nachdem, wohin die Fähre fährt. | Ansehen: Sanduhr |
| W2\_NIL\_MAX\_0635 | Max | Wenn ich die umdrehe, spule ich vielleicht die Zeit zurück. Das klappt in Spielen immer. Danach macht man einen Salto. | Ansehen: Sanduhr, zweites Mal |
| W2\_NIL\_MAX\_0640 | Max | Eine Tafel mit drei Zeilen. Fahrplan oder Hausordnung. | Ansehen: Tafel; öffnet Nahansicht |
| W2\_NIL\_MAX\_0645 | Max | Drei Zeilen. Ich lese sie nochmal. Sie werden nicht kürzer, nur wichtiger. | Ansehen: Tafel, zweites Mal; öffnet Nahansicht |
| W2\_NIL\_MAX\_0650 | Max | „Was wächst, gärt oder verwittert, reist mit der Zeit. Was du selbst pflückst, bleibt. Der Rest ist der Zeit egal.“ | Nahansicht Tafel; Notizbuch Seite 2 |
| W2\_NIL\_PIX\_0660 | Pixel | Eine Fähre mit Kleingedrucktem. Die Antike war weiter, als ich dachte. | Nahansicht Tafel, nach dem Lesen |
| W2\_NIL\_MAX\_0670 | Max | Schilf. Papyrus. Papier, bevor es Papier gab. Opa hätte Tränen in den Augen. | Ansehen: Schilf |
| W2\_NIL\_PIX\_0675 | Pixel | Schilf. Raschelt, wenn man reinspringt. Ich springe nicht rein. Da wohnen Krokodile mit Ambitionen. | Ansehen: Schilf, zweites Mal |
| W2\_NIL\_MAX\_0680 | Max | Ein Blatt Papyrus. Leer. Wie mein Hausaufgabenheft im Mai. | Nehmen: Papyrus aus dem Schilf |
| W2\_NIL\_MAX\_0690 | Max | Die Pyramide steht auf der Spitze. Wie ein Pop-up, das man nicht wegklicken kann. | Ansehen: verkehrte Pyramide |
| W2\_NIL\_PIX\_0700 | Pixel | Sie steht seit dreißig Jahren so. Und sie steht noch. Das nenne ich Statik. Oder Sturheit. | Ansehen: verkehrte Pyramide, zweites Mal |
| W2\_NIL\_MAX\_0710 | Max | So halte ich meine Hausaufgaben auch immer. | Ansehen: Bauplan, verkehrt herum gehalten |
| W2\_NIL\_MAX\_0715 | Max | Ich dreh den Kopf. Jetzt steht die Pyramide richtig. Und ich falsch. | Ansehen: Bauplan, verkehrt herum gehalten, zweites Mal |
| W2\_NIL\_MAX\_0720 | Max | Ein Pyramiden-Arbeiter. Grinst ohne Zähne und mit Hammer. Das beruhigt nicht. | Ansehen: Steinmetz |
| W2\_NIL\_MAX\_0725 | Max | Er klopft im Akkord. Wenn der Stein fertig ist, holt ihn bestimmt ein Dicker mit Streifenhose ab und trägt ihn heim. | Ansehen: Steinmetz, zweites Mal |
| W2\_NIL\_MAX\_0730 | Max | Ein Sandweg. Führt nach rechts. Rechts ist immer die Zukunft. Sagt jedes Spiel. | Ansehen: Sandweg |
| W2\_NIL\_MAX\_0735 | Max | Sand, der weiß, wohin er will. Mehr, als ich von mir sagen kann. | Ansehen: Sandweg, zweites Mal |
| W2\_NIL\_MAX\_0740 | Max | Hallo. Baut ihr die Pyramide gerade ab oder auf? | Reden: Steinmetz, Einstieg |
| W2\_NIL\_STM\_0750 | Steinmetz | Auf! Unten anfangen, oben aufhören. Sagt der Plan. Der Plan hat Recht. Der Plan hat immer Recht. |  |
| W2\_NIL\_MAX\_0760 | Max | Der Plan ist verkehrt herum. |  |
| W2\_NIL\_STM\_0770 | Steinmetz | Das sagen alle. Dann drehen wir ihn um, und dann ist er wieder verkehrt herum. Wir haben es aufgegeben. | zuckt mit den Schultern |
| W2\_NIL\_MAX\_0780 | Max | Meißelt ihr auch kleine Sachen? | Option Steinmetz |
| W2\_NIL\_STM\_0790 | Steinmetz | Alles mit Kante. Grabsteine, Türschwellen, Katzenfiguren. Bring einen Entwurf, und wir hauen ihn in Stein. Wörtlich. |  |
| W2\_NIL\_MAX\_0800 | Max | Wie lange bleibt so ein Stein frisch? | Option Steinmetz (bleibt) |
| W2\_NIL\_STM\_0810 | Steinmetz | Hier: ewig. Auf der Fähre: kommt drauf an, wie weit du fährst. Stein reist mit der Zeit. Steht auf der Tafel. | Hinweis Rätsel 10 |
| W2\_NIL\_MAX\_0820 | Max | Ich geh dann mal. | Option Steinmetz, beendet das Gespräch |
| W2\_NIL\_STM\_0830 | Steinmetz | Pass auf die Spitze auf. Die hat schon zwei Besucher erwischt. |  |

## 4. Nil-Delta: Hermes und Opas Papyrus

Szene, läuft beim ersten Betreten des Nil-Deltas nach der ersten Fährfahrt. Hermes kommt angerannt, zu spät wie immer.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_NIL\_HER\_0910 | Hermes | Post! Eilpost! Dringend, älter als ich, tut mir leid, lag im anderen Büro. | rennt auf der Stelle, kramt im Beutel |
| W2\_NIL\_MAX\_0920 | Max | Ein Papyrus. Für mich. Von … Opa. Natürlich. | nimmt die Rolle |
| W2\_NIL\_HER\_0930 | Hermes | Absender „Konrad, Dachboden“. Zustellung hat etwa dreitausend Jahre gedauert. Innerhalb der Garantie. |  |
| W2\_NIL\_OPA\_0940 | Opa (gelesen) | „Fein muss es sein. Fein wie Staub. Wie die Welt, wenn ich versage.“ | Max liest, Opas Stimme |
| W2\_NIL\_MAX\_0950 | Max | Er klingt jedes Mal böser. |  |
| W2\_NIL\_PIX\_0960 | Pixel | Fein wie Staub. Der Mann plant etwas. // Ich tippe auf Weltherrschaft. // Oder Frühjahrsputz. Beides schlecht für Katzen. |  |
| W2\_NIL\_HER\_0970 | Hermes | Ich muss weiter! Termine! Falls ihr nach Olympia wollt: Euer Startpass ist in einem anderen Büro. | rennt los, bleibt stehen |
| W2\_NIL\_MAX\_0980 | Max | Ich hab noch gar keinen Startpass. |  |
| W2\_NIL\_HER\_0990 | Hermes | Eben! | weg |
| W2\_NIL\_MAX\_1000 | Max | Opas Papyrus. „Fein wie Staub.“ Ich lese das lieber nicht als Drohung. Ich lese es lieber gar nicht. | Ansehen: Opas Papyrus im Inventar (keine Nahansicht) |
| W2\_NIL\_MAX\_1005 | Max | Opas Handschrift ist auf Papyrus noch schlechter als auf Papier. Ich hätte nicht gedacht, dass das geht. | Ansehen: Opas Papyrus im Inventar (keine Nahansicht), zweites Mal |

## 5. Die Zeitfähre und die Flusskarte

Fahrt zwischen den Anlegestellen. Die Flusskarte zeigt Ägypten, Olympia und Syrakus; während der Fahrt zeigt das Inventar, wie Dinge mit Sanduhr-Symbol altern oder jünger werden. Die Alterungs-Kommentare kommen beim ersten Mal automatisch, danach nur beim Ansehen des Gegenstands.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_FAHR\_MAX\_0010 | Max | Drei Haltestellen. Eine Linie. Kein Umsteigen. Der beste Nahverkehr, den ich je gesehen habe. | Ansehen: Flusskarte |
| W2\_FAHR\_MAX\_0015 | Max | Ägypten, Olympia, Syrakus. Die Linie heißt bestimmt „Zeitreise Express“. Oder „Linie 1“. | Ansehen: Flusskarte, zweites Mal |
| W2\_FAHR\_PIX\_0020 | Pixel | Flussaufwärts wird alles jünger. Ich bleibe trotzdem, wie ich bin. Ich bin schon perfekt. | Flusskarte, erstes Öffnen |
| W2\_FAHR\_FAE\_0030 | Fährmann | Abfahrt. Festhalten. Die Jahre ziehen am Ärmel. | jede Abfahrt |
| W2\_FAHR\_FAE\_0040 | Fährmann | Hundertzwölf Jahre bis Olympia. Für euch zwei Minuten. Die Rechnung macht der Fluss. | erste Fahrt Ägypten nach Olympia |
| W2\_FAHR\_FAE\_0050 | Fährmann | Fünfundzwanzig Jahre bis Syrakus. Eine kurze Strecke. Für einen Stein ein Nickerchen. | erste Fahrt Olympia nach Syrakus |
| W2\_FAHR\_MAX\_0060 | Max | Die Sanduhr läuft rückwärts. Das ist wie Zurückspulen, nur dass es keiner merkt außer dem Sand. | erste Fahrt flussaufwärts |
| W2\_FAHR\_PIX\_0070 | Pixel | Ich hasse Zeitreisen. // Ich hasse Zeitreisen auf dem Wasser noch mehr. // Ich hasse Zeitreisen auf dem Wasser mit Krokodil am allermeisten. Glaube ich. | erste Fahrt überhaupt |
| W2\_FAHR\_SOB\_0080 | Sobek | (zufriedenes Grollen) | Pixel sieht Sobek an; Lautsprecher: „Übersetzung: Er findet dich okay.“ |
| W2\_FAHR\_MAX\_0090 | Max | Der Traubensaft blubbert. Er wird zu Wein. Hoffentlich schmeckt er besser als Opas Johannisbeer-Experiment. | Traubensaft wird Wein (flussabwärts) |
| W2\_FAHR\_PIX\_0100 | Pixel | Jetzt ist es Wein. Noch ein Stück, und es ist etwas, das Salat verdirbt. | Wein wird Essig (weiter flussabwärts) |
| W2\_FAHR\_MAX\_0110 | Max | Essig. Der Krug riecht wie Omas Fensterputz. | Essig im Inventar nach zu weiter Fahrt |
| W2\_FAHR\_MAX\_0120 | Max | Der Essig wird wieder Wein. Zurückspulen funktioniert also auch bei Getränken. | Essig wird Wein (flussaufwärts) |
| W2\_FAHR\_MAX\_0130 | Max | Jetzt ist es Traubensaft. Noch ein Stück, und es sind Trauben. Noch eins, und ich halte wahrscheinlich einen Weinberg. | Wein wird Traubensaft (weiter flussaufwärts) |
| W2\_FAHR\_MAX\_0150 | Max | Der Setzling wächst. Er wächst gerade schneller als jede Serie, die ich je durchgezogen habe. | Feigensetzling wird Baum (flussabwärts) |
| W2\_FAHR\_PIX\_0160 | Pixel | Ein ganzer Baum. Mit Feigen. In einem Topf. Auf einem Floß. Die Antike hat kein Maß. | Feigenbaum im Inventar |
| W2\_FAHR\_MAX\_0170 | Max | Der Setzling schrumpft. Jetzt ist er ein Kern. Ich hab einen Baum auf Werkseinstellungen zurückgesetzt. | Setzling wird Kern (flussaufwärts) |
| W2\_FAHR\_PIX\_0180 | Pixel | Ein Feigenkern. Das ist der kleinste Garten, den ich je gesehen habe. Ich schlafe trotzdem nicht darauf. | Feigenkern im Inventar |
| W2\_FAHR\_MAX\_0190 | Max | Die gepflückten Feigen bleiben Feigen. Der Fluss ignoriert sie. Endlich mal etwas, das nicht abläuft. | gepflückte Feigen an Bord |
| W2\_FAHR\_MAX\_0200 | Max | Der Grabstein wird grau. Wie ein Foto, das zu lange in der Sonne lag. | frischer Grabstein wird grau (nach Olympia) |
| W2\_FAHR\_MAX\_0210 | Max | Risse, Moos, ein kleiner Käfer. Der Stein sieht aus wie hundert Jahre Geschichte in zwei Minuten. | Grabstein wird verwittert (bis Syrakus) |
| W2\_FAHR\_PIX\_0220 | Pixel | Moos. Weich, kühl, ein bisschen feucht. Fast ein Schlafplatz. Fast. | verwitterter Grabstein im Inventar |
| W2\_FAHR\_MAX\_0230 | Max | Der Grabstein wird wieder glatter. Die Risse schließen sich, das Moos verschwindet. Zurückspulen geht auch bei Stein. | Grabstein wird jünger (flussaufwärts: verwittert zu grau, grau zu frisch) |
| W2\_FAHR\_MAX\_0240 | Max | Das Handy bleibt bei drei Prozent. Nicht mal viertausend Jahre laden es auf. | Handy während der Fahrt ansehen |
| W2\_FAHR\_MAX\_0250 | Max | Der Kaugummi ist unverändert. Ich glaube, der ist schon aus dem Zeitstrom gefallen, bevor ich ihn gekauft habe. | Kaugummi während der Fahrt ansehen |
| W2\_FAHR\_PIX\_0260 | Pixel | Die Dose altert nicht. Natürlich nicht. Sie ist zeitlos. Wie ich. | Thunfischdose während der Fahrt ansehen |
| W2\_FAHR\_MAX\_0270 | Max | Das Öl bleibt Öl. Hat kein Sanduhr-Symbol. Es ist der Zeit egal. Das kenne ich von mir. | Olivenöl während der Fahrt ansehen |
| W2\_FAHR\_FAE\_0280 | Fährmann | Olympia. Aussteigen, wer Sport mag. Ich bleibe sitzen. | Ankunft Olympia |
| W2\_FAHR\_FAE\_0290 | Fährmann | Syrakus. Ende der Strecke. Dahinter kommt Meer, und das Meer nimmt keine Katzen. | Ankunft Syrakus |
| W2\_FAHR\_FAE\_0300 | Fährmann | Ägypten. Flussaufwärts ist Schluss. Dahinter kommt nur noch Sand. Und Verwandtschaft. | Ankunft Ägypten |

## 6. Fährsteg Olympia und Hafen Syrakus

Zwei Durchgangsräume, kein Rätsel. Am Hafen von Syrakus liegt der Tintenfisch für den zweiten Lösungsweg des Passierscheins (Rätsel 3).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_STOL\_MAX\_0010 | Max | Olivenbäume, ein Fischerboot, Vogelgezwitscher. Wie ein Bildschirmschoner. | Ansehen: Olivenbäume |
| W2\_STOL\_PIX\_0015 | Pixel | Ein Boot ohne Fisch und Bäume ohne Vögel, die ich jagen darf. Der Bildschirmschoner ist kaputt. | Ansehen: Olivenbäume, zweites Mal |
| W2\_STOL\_MAX\_0020 | Max | Ein Fischerboot. Ohne Fischer. Der ist wahrscheinlich im Stadion. Alle sind im Stadion. | Ansehen: Fischerboot |
| W2\_STOL\_PIX\_0030 | Pixel | Ein Boot. Leer. Kein Fisch. Ich bin tief enttäuscht von Olympia. | Ansehen: Fischerboot, zweites Mal |
| W2\_STOL\_MAX\_0040 | Max | Noch eine Sanduhr. Die haben an jeder Haltestelle eine. Wie Uhren am Bahnhof, nur ehrlicher. | Ansehen: Sanduhr Olympia |
| W2\_STOL\_MAX\_0045 | Max | Der Sand läuft hier gemütlicher. Griechischer Sand hat keine Termine. | Ansehen: Sanduhr Olympia, zweites Mal |
| W2\_STOL\_MAX\_0050 | Max | Dieselbe Tafel wie in Ägypten. Dieselben drei Zeilen. Der Fluss wiederholt sich gern. | Ansehen: Tafel Olympia |
| W2\_STOL\_MAX\_0055 | Max | Ich vergleiche Wort für Wort. Gleich. Bis auf einen Kaffeefleck. Antiker Kaffee. | Ansehen: Tafel Olympia, zweites Mal |
| W2\_STOL\_MAX\_0060 | Max | Ein Steinweg den Hügel hoch zu weißen Säulen. Da oben wird gebrüllt. Das ist entweder Sport oder Politik. | Ansehen: Weg zur Agora |
| W2\_STOL\_MAX\_0065 | Max | Der Hügel ist steil. Wer da hochrennt, kommt oben als Held an. Oder als Pfütze. Ich tippe auf Pfütze. | Ansehen: Weg zur Agora, zweites Mal |
| W2\_HAFS\_MAX\_0010 | Max | Ein Hafen. Dahinter das Meer. Dahinter nichts mehr. Die Zeit hat hier Sendeschluss. | Ansehen: Meer |
| W2\_HAFS\_PIX\_0020 | Pixel | Sendeschluss. Du weißt gar nicht, was das ist. Ich schon. Da kam ein Testbild, und alle gingen schlafen. Eine zivilisierte Zeit. | Ansehen: Meer, zweites Mal |
| W2\_HAFS\_MAX\_0030 | Max | Fischernetze. Darin zappelt etwas mit Armen. Zu vielen Armen. | Ansehen: Fischernetze |
| W2\_HAFS\_MAX\_0035 | Max | Das Ding im Netz winkt mir. Mit allen acht Armen. Ich winke mit zweien zurück. Ich verliere. | Ansehen: Fischernetze, zweites Mal |
| W2\_HAFS\_MAX\_0040 | Max | Ein Tintenfisch. Klein, nass, beleidigt. Ich leih mir nur die Tinte. | Nehmen: Tintenfisch aus dem Netz; wird „Tintenfass“ im Inventar |
| W2\_HAFS\_PIX\_0050 | Pixel | Ein Tintenfisch. Frittiert ein Gedicht. Roh eine Beleidigung. Du hast ihn roh genommen. | Nehmen: Tintenfisch, danach |
| W2\_HAFS\_MAX\_0060 | Max | Amphoren. Die Antike hatte für alles einen Krug und für nichts einen Deckel. | Ansehen: Amphoren am Kai |
| W2\_HAFS\_PIX\_0065 | Pixel | Krüge ohne Deckel. Man könnte reinsehen. Man könnte reinfallen. Ich sage nur: Möglichkeiten. | Ansehen: Amphoren am Kai, zweites Mal |
| W2\_HAFS\_MAX\_0070 | Max | Eine Gasse bergauf. Oben raucht ein Schornstein, und über der Tür hängt ein Zahnrad. Da wohnt jemand, der zu viel nachdenkt. | Ansehen: Gasse zur Werkstatt |
| W2\_HAFS\_MAX\_0075 | Max | Das Zahnrad über der Tür dreht sich im Wind. Sogar das Türschild erfindet etwas. | Ansehen: Gasse zur Werkstatt, zweites Mal |
| W2\_HAFS\_MAX\_0080 | Max | Die Sanduhr von Syrakus. Unten ist der ganze Sand. Hier ist das Ende der Linie. | Ansehen: Sanduhr Syrakus |
| W2\_HAFS\_MAX\_0085 | Max | Endstation. Bitte alle aussteigen. Ich sag das in Gedanken mit Bahnhofsstimme. | Ansehen: Sanduhr Syrakus, zweites Mal |
| W2\_HAFS\_PIX\_0090 | Pixel | Möwen. Sie schreien, als hätte man ihnen das Mittagessen weggenommen. Ich kenne das Gefühl. | Zuruf-Ersatz bei Möwen im Hintergrund |

## 7. Thronsaal: Ankunft und Ansehen

Beim ersten Betreten sitzt Ramses auf dem Thron und sieht von einem Zepter zum anderen. Der Hofkater sitzt auf dem Kissen vor den Stufen und lässt niemanden durch. Der Schreiber sitzt links am Pult.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_THRO\_MAX\_0010 | Max | Ein Thron, drei Stufen, ein Mann mit zwei Zeptern. Der kann sich nicht mal für eine Hand entscheiden. | erstes Betreten |
| W2\_THRO\_RAM\_0020 | Ramses | Wer ist das? Ein Besucher? Oder ein Bittsteller? Oder … beides? Oh nein. | sieht auf, dann wieder auf die Zepter |
| W2\_THRO\_HOF\_0030 | Hofkater | Fsssch. | vom Kissen, ohne aufzustehen |
| W2\_THRO\_PIX\_0040 | Pixel | Da liegt eine Katze auf einem Kissen. Auf MEINEM Kissen. Ich habe es noch nicht gesehen, aber es ist meins. | Schwanz zuckt |
| W2\_THRO\_SCH\_0050 | Schreiber | Der Pharao empfängt nur schriftlich. In Hieroglyphen. Alles andere liest er nicht. Also: kann er nicht. Also: will er nicht. Sag ich nicht gesagt haben. | ohne aufzusehen |
| W2\_THRO\_MAX\_0060 | Max | Ein Pharao mit Leseschwäche und ein Türsteher mit Fell. Das wird ein langer Abend. |  |

Ansehen im Thronsaal:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_THRO\_MAX\_0110 | Max | Gold, Stufen, Kissen. Ein Gaming-Stuhl für Leute, die nie spielen. | Ansehen: Thron |
| W2\_THRO\_MAX\_0115 | Max | Die Kissen sind plattgesessen. Ramses sitzt hier offenbar sehr lange. Und sehr unentschlossen. | Ansehen: Thron, zweites Mal |
| W2\_THRO\_MAX\_0120 | Max | Ramses der Unentschlossene. Er sieht aus, als hätte er seit Stunden den Startbildschirm offen. | Ansehen: Ramses |
| W2\_THRO\_PIX\_0125 | Pixel | Er hat zwei Zepter und weiß nicht, welches. Ich hätte beide umgeworfen. Problem gelöst. | Ansehen: Ramses, zweites Mal |
| W2\_THRO\_MAX\_0130 | Max | Eine sandfarbene Katze mit Ohrring. Sie guckt auf mich runter, obwohl sie unter mir sitzt. Das ist Talent. | Ansehen: Hofkater |
| W2\_THRO\_PIX\_0140 | Pixel | Ein Ohrring. Ein Ohrring! Wer trägt denn Schmuck am Ohr? Man hört doch damit. // Und das Kissen ist Seide. // Das wird ein Krieg. | Ansehen: Hofkater, zweites Mal |
| W2\_THRO\_MAX\_0150 | Max | Zwei Männer mit Palmwedeln, so groß wie Surfbretter. Sie schwitzen mehr, als sie wedeln. | Ansehen: Fächerwedler |
| W2\_THRO\_MAX\_0155 | Max | Sie wedeln im Takt. Fast. Einer ist immer einen halben Wedel hinterher. | Ansehen: Fächerwedler, zweites Mal |
| W2\_THRO\_FAW\_0160 | Fächerwedler | Wir wedeln für Lohn. Für Feigen wedeln wir besser. Für frische Feigen wedeln wir gerade. | Reden: Fächerwedler, vor der Bestechung |
| W2\_THRO\_MAX\_0170 | Max | Ein Pult, eine Tontafel, Binsenstifte. Das Sekretariat. | Ansehen: Schreiberpult |
| W2\_THRO\_MAX\_0175 | Max | Auf der Tontafel steht: „Wichtig.“ Darunter: nichts. Das kenne ich aus meinem Hausaufgabenheft. | Ansehen: Schreiberpult, zweites Mal |
| W2\_THRO\_MAX\_0180 | Max | Ein Schreiber mit Stift hinterm Ohr. Sieht aus, als hätte er seit zehn Jahren dieselbe Nachricht offen. | Ansehen: Schreiber |
| W2\_THRO\_MAX\_0185 | Max | Er hat den Stift hinterm Ohr seit zehn Jahren. Der Stift wohnt da jetzt. | Ansehen: Schreiber, zweites Mal |
| W2\_THRO\_MAX\_0190 | Max | Ein goldener Sarkophag, angelehnt an die Wand. Mit Schlafmaske. | Ansehen: Sarkophag |
| W2\_THRO\_PIX\_0200 | Pixel | Ramses' Mittagsschlaf-Liege. Großzügig bemessen. Ich würde sie nehmen. Ich würde die Maske nicht nehmen. | Ansehen: Sarkophag, zweites Mal |
| W2\_THRO\_MAX\_0210 | Max | In der Nische: eine Katze. Mumifiziert. Sie guckt genauso wie Pixel, wenn ich den falschen Napf nehme. | Ansehen: Mumifizierte Katze |
| W2\_THRO\_PIX\_0220 | Pixel | Ein Vorfahre. Sieht ausgeruht aus. // Viertausend Jahre Schlaf. // Ich bin so neidisch, dass ich es kaum sagen kann. Ich sage es trotzdem. | Ansehen: Mumifizierte Katze, zweites Mal |
| W2\_THRO\_MAX\_0230 | Max | Der Fries. Lauter Leute, die seitlich tanzen. Und einer hat einen riesigen Lautsprecher auf der Schulter. | Ansehen: Wandfries |
| W2\_THRO\_MAX\_0240 | Max | Wenigstens hat einer hier Musik dabei. | Ansehen: Wandfries, zweites Mal |
| W2\_THRO\_PIX\_0250 | Pixel | Das Ding heißt Ghettoblaster. Es wog so viel wie ich und brauchte acht Batterien. Eine ehrliche Maschine. | Ansehen: Wandfries, drittes Mal |
| W2\_THRO\_MAX\_0260 | Max | Säulen voller Zeichen. Augen, Vögel, Hände. Eine Emoji-Tastatur aus Stein. | Ansehen: Säulen |
| W2\_THRO\_MAX\_0265 | Max | Ein Auge, ein Vogel, eine Welle. Ich lese das als: „Gucken, fliegen, nass werden.“ Vermutlich falsch. | Ansehen: Säulen, zweites Mal |
| W2\_THRO\_MAX\_0270 | Max | Eine Inschrift mit vier Feldern. Und darunter eine kleine Tabelle. Jemand hat hier die Spielregeln an die Wand gemeißelt. | Ansehen: Inschrift; öffnet Nahansicht |
| W2\_THRO\_MAX\_0275 | Max | Vier Felder und eine Tabelle. Die Regeln stehen in Stein. Wörtlich. | Ansehen: Inschrift, zweites Mal; öffnet Nahansicht |
| W2\_THRO\_MAX\_0280 | Max | Erst, wer handelt. Dann, wem er dient. Dann, wen er bittet. Zuletzt die Tat als Körperteil: Ohr für Gehör, Mund für Brot, Hand für Gold. | Nahansicht Inschrift; Notizbuch Seite 2 |
| W2\_THRO\_PIX\_0290 | Pixel | Eine Grammatik, in der das Essen ein Mund ist. Endlich eine Sprache, die mich versteht. | Nahansicht Inschrift, nach dem Lesen |
| W2\_THRO\_MAX\_0300 | Max | Eine hohe Tür. Dahinter klappert es und riecht nach Zwiebeln. Küche. | Ansehen: Tür zur Küche |
| W2\_THRO\_PIX\_0310 | Pixel | Zwiebeln, Brot, Datteln, Fett. Ich würde sagen: Da entlang. Sofort. | Ansehen: Tür zur Küche, zweites Mal |
| W2\_THRO\_MAX\_0320 | Max | Ein goldener Teller neben dem Thron. Leer. Ein Napf für Götter. | Ansehen: Pharaonenteller |
| W2\_THRO\_PIX\_0325 | Pixel | Ein goldener Napf. Leer. Das ist kein Teller, das ist eine Einladung, die keiner annimmt. Ich schon. | Ansehen: Pharaonenteller, zweites Mal |
| W2\_THRO\_MAX\_0330 | Max | Ich nehme den Teller. Falls jemand Gold in Scheibenform braucht. | Nehmen: Pharaonenteller; nach der Audienz |
| W2\_THRO\_RAM\_0340 | Ramses | Der Teller? Nimm ihn. Oder nicht. Nein, nimm ihn. Oder … ach, er ist schon weg. Gut. Entschieden. | nach dem Nehmen |
| W2\_THRO\_MAX\_0350 | Max | Fackeln und Sonnenstrahlen zugleich. Stimmungsbeleuchtung, bevor es das Wort gab. | Ansehen: Fackeln |
| W2\_THRO\_MAX\_0355 | Max | Die Fackeln qualmen, die Sonne nicht. Die Sonne ist hier das modernere Licht. | Ansehen: Fackeln, zweites Mal |

## 8. Thronsaal: Rätsel 2a, die Hieroglyphen-Botschaft

Der Schreiber gibt die Bildtafel mit 16 Kacheln. Max legt vier Zeichen in die Felder, der Schreiber liest das Ergebnis vor. Zielsatz: Mann, Katze, Pharao, Ohr. Die Lesung baut sich aus den Kachelnamen zusammen: „\[Feld 1\], Diener \[Feld 2\], bittet \[Feld 3\] um \[Feld 4\]“; Ohr liest er als Gehör, Mund als Brot, Hand als Gold, Auge als Blick, alles andere in Feld 4 als „um … irgendwas“.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_HIER\_MAX\_0010 | Max | Ich muss zum Pharao. | Reden: Schreiber, Einstieg |
| W2\_HIER\_SCH\_0020 | Schreiber | Dann schreib ihm. Vier Zeichen, ein Satz. Hier, die Bildtafel. Sechzehn Kacheln. Mehr Zeichen hat der Pharao nie gelernt. | gibt die Bildtafel |
| W2\_HIER\_MAX\_0030 | Max | Eine Tafel mit Kacheln. Ein Pharao-Bauskasten. Auge, Vogel, Krokodil, Brot, Katze, Sonne … wie ein Emoji-Menü, nur aus Stein. | Ansehen: Bildtafel |
| W2\_HIER\_MAX\_0035 | Max | Lauter Kacheln. Ich such die mit dem Daumen hoch. Gibt's nicht. Die Antike hatte keine Likes. | Ansehen: Bildtafel, zweites Mal |
| W2\_HIER\_MAX\_0040 | Max | Gibt es eine Anleitung? | Option Schreiber |
| W2\_HIER\_SCH\_0050 | Schreiber | An der Säule. Vier Felder, eine Tabelle. Hat mein Vorgänger reingemeißelt, weil er es sonst selbst vergessen hätte. | Hinweis auf die Inschrift |
| W2\_HIER\_MAX\_0060 | Max | Was soll in der Botschaft stehen? | Option Schreiber |
| W2\_HIER\_SCH\_0070 | Schreiber | Wer du bist, wem du dienst, wen du bittest, und was. Und bitte nichts mit Käfern. Er hasst Käfer. |  |
| W2\_HIER\_MAX\_0080 | Max | Liest du ihm alles vor? | Option Schreiber |
| W2\_HIER\_SCH\_0090 | Schreiber | Alles. Wörtlich. Mit Betonung. Das ist mein Job, und ich habe keinen anderen. |  |
| W2\_HIER\_MAX\_0100 | Max | Ich überlege noch. | Option Schreiber, beendet das Gespräch |
| W2\_HIER\_SCH\_0110 | Schreiber | Überleg schnell. Der Pharao überlegt auch. Seit elf Jahren. |  |
| W2\_HIER\_SCH\_0120 | Schreiber | Das liest sich: „\[Satz\]“. Soll ich das wirklich vorlesen? Ich lese es vor. | jede falsche Kombination, Grundzeile; danach eine der Pointen oder 0220 |
| W2\_HIER\_SCH\_0130 | Schreiber | „Krokodil, Diener der Katze, bittet den Pharao um Brot.“ Das Krokodil hat Hunger. Das ist keine Botschaft, das ist eine Warnung. | Krokodil, Katze, Pharao, Mund |
| W2\_HIER\_SCH\_0140 | Schreiber | „Mann, Diener der Katze, bittet den Pharao um Gold.“ Um Gold? Mutig. Falsch, aber mutig. | Mann, Katze, Pharao, Hand |
| W2\_HIER\_SCH\_0150 | Schreiber | „Mann, Diener des Pharaos, bittet die Katze um Gehör.“ Falsch herum. Aber der Kater nickt. | Mann, Pharao, Katze, Ohr |
| W2\_HIER\_PIX\_0160 | Pixel | Endlich eine korrekte Botschaft. Lass sie so. | nach 0150 |
| W2\_HIER\_PIX\_0170 | Pixel | „Katze, Diener des Mannes“? Ich diene niemandem. Streich das. Streich das sofort. | Katze in Feld 1 und Mann in Feld 2 |
| W2\_HIER\_SCH\_0180 | Schreiber | Ein Käfer. Ich habe Käfer gesagt. Ich habe ausdrücklich Käfer gesagt. | Skarabäus in irgendeinem Feld |
| W2\_HIER\_SCH\_0190 | Schreiber | Du bittest ein Haus um Gehör. Häuser hören nicht zu. Glaub mir, ich wohne in einem. | Haus in Feld 3 |
| W2\_HIER\_SCH\_0200 | Schreiber | „Vogel, Diener des Krokodils.“ Das ist nicht sein Diener. Das ist sein Mittagessen. | Vogel in Feld 1 und Krokodil in Feld 2 |
| W2\_HIER\_SCH\_0210 | Schreiber | „Der Pharao, Diener des Mannes.“ Wenn ich das vorlese, bin ich morgen Pyramiden-Arbeiter. | Pharao in Feld 1 |
| W2\_HIER\_SCH\_0220 | Schreiber | „… bittet um Sonne.“ Um Sonne. In Ägypten. Wir haben genug. Danke. | Sonne in Feld 4 |
| W2\_HIER\_SCH\_0230 | Schreiber | „… bittet um Wasser.“ Da draußen ist ein Fluss. Ein großer. | Wasser in Feld 4 |
| W2\_HIER\_SCH\_0240 | Schreiber | „… bittet um Brot.“ Dafür ist die Küche zuständig, nicht der Thron. Die Tür rechts. | Mund in Feld 4, sonst richtig |
| W2\_HIER\_MAX\_0250 | Max | Mann, Katze, Pharao, Ohr. „Diener der Katze bittet den Pharao um Gehör.“ Stimmt sogar. Leider. | richtige Kombination |
| W2\_HIER\_SCH\_0260 | Schreiber | Grammatisch sauber. Inhaltlich seltsam. Ich trag's rein. | nimmt die Tafel |
| W2\_HIER\_PIX\_0270 | Pixel | „Diener der Katze.“ Ich möchte, dass das auf deinem Hoodie steht. In Gold. | nach 0260 |
| W2\_HIER\_SCH\_0280 | Schreiber | Der Pharao hat gelesen. Also: Ich habe gelesen, er hat genickt. Er empfängt euch. Sobald der Kater euch durchlässt. Viel Glück. | zurück vom Thron; Rätsel 2a gelöst |
| W2\_HIER\_MAX\_0290 | Max | Ich könnte das mit dem Kugelschreiber dazukritzeln. Nein. Der Schreiber würde weinen. | Kugelschreiber auf Bildtafel |
| W2\_HIER\_MAX\_0300 | Max | Pixel auf die Tafel legen? Dann ist die Botschaft: „Katze.“ Einfach nur „Katze.“ Vielleicht reicht das sogar. | Pixel auf Bildtafel |

## 9. Thronsaal: Rätsel 2b, das Götter-Duell

Der Hofkater zweifelt Pixels Gottstatus an. Pixel fordert ihn heraus: Wer mehr Verbeugungen bekommt, gewinnt. Ein Gott braucht Opfergabe, Gefolge und Wunder. Max besorgt die Thunfischdose (vorgezeigt), Sobek (kriecht Pixel hinterher) und die Kaugummiblase oder den Lichtblitz aus Archimedes' Brennspiegel. Der Hofkater hat nur zwei von drei. Das Gespräch mit dem Hofkater führt Pixel als Spielfigur.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_DUEL\_MAX\_0010 | Max | Ich würde gern durch. | Max auf Hofkater (Reden oder Benutzen) |
| W2\_DUEL\_HOF\_0020 | Hofkater | Fsssch. | rührt sich nicht |
| W2\_DUEL\_MAX\_0030 | Max | Er redet nicht mit mir. Er hat kein Halsband mit Lautsprecher. Er hat nur Meinung. Pixel, das ist deine Abteilung. |  |
| W2\_DUEL\_PIX\_0040 | Pixel | Du sitzt auf meinem Kissen. | Spielfigur Pixel: Reden mit Hofkater |
| W2\_DUEL\_HOF\_0050 | Hofkater | Ich sitze auf dem Kissen des Hofes. Du bist eine Hauskatze mit Elektronik am Hals. | Lautsprecher übersetzt, blechern |
| W2\_DUEL\_PIX\_0060 | Pixel | Ich bin ein Gott. Das Krokodil hat sich verneigt. Der Fährmann hat sich verneigt. Ein Grashalm hat sich verneigt, glaube ich. |  |
| W2\_DUEL\_HOF\_0070 | Hofkater | Ein Gott hat eine Opfergabe, ein Gefolge und ein Wunder. Ich habe eine Opfergabe und ein Gefolge. Du hast einen Jungen mit Sand im Schuh. |  |
| W2\_DUEL\_PIX\_0080 | Pixel | Dann zählen wir Verbeugungen. Hier. Vor dem Thron. Wer mehr bekommt, bekommt das Kissen. // Und das Ohr. // Ich meine den Ohrring. Ich meine das Kissen. | Duell angenommen |
| W2\_DUEL\_MAX\_0090 | Max | Ein Kater-Duell um ein Kissen. Ich hab mal eine Serie über Hausfrauen gesehen, die war ruhiger. |  |
| W2\_DUEL\_MAX\_0100 | Max | Opfergabe, Gefolge, Wunder. Drei Dinge. Opa hätte gesagt: eine Einkaufsliste. | Notizbuch Seite 1 |
| W2\_DUEL\_MAX\_0110 | Max | Eine Schale mit Datteln vor dem Kissen. Das ist seine Opfergabe. Von der Küche gespendet, vermutlich unfreiwillig. | Ansehen: Opferschale des Hofkaters |
| W2\_DUEL\_PIX\_0115 | Pixel | Datteln. Für ihn. Von der Küche. Ich habe einen Antrag auf Gleichbehandlung gestellt. Bei mir selbst. | Ansehen: Opferschale des Hofkaters, zweites Mal |
| W2\_DUEL\_MAX\_0120 | Max | Zwei schwitzende Männer mit Palmwedeln. Das ist sein Gefolge. Großes Gefolge, wenig Begeisterung. | Ansehen: Fächerwedler während des Duells |
| W2\_DUEL\_MAX\_0125 | Max | Sie wedeln jetzt für den Kater. Ich glaube, sie haben nicht genau gefragt, für wen. | Ansehen: Fächerwedler während des Duells, zweites Mal |
| W2\_DUEL\_MAX\_0130 | Max | Hier. Eine Dose. Silber, glänzend, leer. Die Opfergabe. | Thunfischdose auf Hofkater oder vor das Kissen |
| W2\_DUEL\_HOF\_0140 | Hofkater | Leer. | schnuppert |
| W2\_DUEL\_PIX\_0150 | Pixel | Leer ist eine Frage der Haltung. Sie glänzt. Deine Datteln glänzen nicht. | Opfergabe zählt; ein Diener verneigt sich |
| W2\_DUEL\_PIX\_0160 | Pixel | Der Gott behält seine Opfergabe. Göttliches Vorrecht. | nimmt die Dose zurück; Dose bleibt im Inventar |
| W2\_DUEL\_MAX\_0170 | Max | Sobek kriecht durch den Thronsaal. Hinter Pixel her. Wie ein sehr langer, sehr grüner Fan. | Sobek folgt Pixel in den Thronsaal (Pixel am Steg: Spielfigur Pixel benutzt Sobek, danach folgt er) |
| W2\_DUEL\_HOF\_0180 | Hofkater | Ein Krokodil. Als Gefolge. Das ist … das ist unfair. Das ist einfach unfair. | weicht auf dem Kissen zurück |
| W2\_DUEL\_PIX\_0190 | Pixel | Das ist ein Gefolge mit Zähnen. Deine Wedler haben nur Wedel. | Gefolge zählt; zweiter Diener verneigt sich |
| W2\_DUEL\_SOB\_0200 | Sobek | (glückliches Schnauben) | Lautsprecher: „Übersetzung: Er möchte gestreichelt werden. Von niemandem.“ |
| W2\_DUEL\_MAX\_0210 | Max | Ein Wunder. Ich hab einen Kaugummi. Das ist kein Wunder. Außer für Leute, die noch nie einen hatten. | Kaugummi im Inventar ansehen während des Duells |
| W2\_DUEL\_MAX\_0220 | Max | Okay. Ein Wunder, bitte sehr. | Kaugummi benutzen im Thronsaal; Kaugummi wird verbraucht; Notizbuch: Baustein „Sonne“ |
| W2\_DUEL\_NAR\_0230 | – | Max kaut. Eine rosa Blase wächst, löst sich, steigt auf und schwebt leuchtend unter die Decke. | Effekt Kaugummi-Sonne |
| W2\_DUEL\_HOF\_0240 | Hofkater | Eine kleine Sonne. Rosa. Sie schwebt. Ich … ich habe keine Sonne. | starrt nach oben |
| W2\_DUEL\_MAX\_0250 | Max | Hier. Ein Spiegel und eine Sonne. Antike Taschenlampe. | Brennspiegel benutzen im Thronsaal; nur wenn der Kaugummi schon weg ist |
| W2\_DUEL\_NAR\_0260 | – | Ein Lichtstrahl schießt vom Spiegel über die Säulen und endet in einem weißen Blitz. Der Hofkater fällt vom Kissen. | Effekt Brennspiegel |
| W2\_DUEL\_RAM\_0270 | Ramses | Ein Wunder! Oder ein Unfall! Oder … nein. Ein Wunder. Ich habe mich entschieden. Fast. | vom Thron |
| W2\_DUEL\_NAR\_0280 | – | Schreiber, Fächerwedler, Diener und Sobek verneigen sich vor Pixel. Der Hofkater zählt nach. Dreimal. | Wunder zählt; Duell entschieden |
| W2\_DUEL\_HOF\_0290 | Hofkater | Drei zu zwei. Ich gratuliere nicht. Ich gehe. Das Kissen ist sowieso durchgelegen. | steht auf, Schwanz hoch |
| W2\_DUEL\_PIX\_0300 | Pixel | Hat er gesagt, es ist durchgelegen? // Es ist nicht durchgelegen. // Es ist perfekt. Es ist meins. Ich bin ein Gott. | springt aufs Kissen; Hofkater zieht beleidigt ab |
| W2\_DUEL\_MAX\_0310 | Max | Drei zu zwei. Knapper, als es hätte sein müssen. Wie jedes Finale. |  |
| W2\_DUEL\_PIX\_0320 | Pixel | Ich möchte festhalten: Ab heute kein Dosenfutter mehr. Götter essen frisch. // Außer Thunfisch. Thunfisch ist eine Ausnahme. Thunfisch ist immer eine Ausnahme. | nach dem Duell, einmalig |
| W2\_DUEL\_MAX\_0330 | Max | Pixel mit dem Kugelschreiber beeindrucken? Er hat schon gesehen, wie ich damit mein Mathebuch bemale. | Kugelschreiber auf Hofkater |
| W2\_DUEL\_MAX\_0340 | Max | Ein Handy ist kein Wunder. Es ist ein Zauberstein mit drei Prozent. Das zählt hier nicht mal als Taschenlampe. Noch nicht. | Handy auf Hofkater; Handy bleibt; Notizbuch: Baustein „leuchtet kurz“ |
| W2\_DUEL\_HOF\_0350 | Hofkater | Fsssch. Eine Dose ohne Inhalt. Eine Fliege ohne Flügel. | Thunfischdose vor dem Duell (Pixel hat noch nicht geredet) |
| W2\_DUEL\_MAX\_0360 | Max | Pixel an den Hofkater? Dann gibt es Fell. Überall. Erst reden. | Pixel auf Hofkater, als Inventar-Versuch |

## 10. Thronsaal: Die Audienz

Szene, läuft, sobald die Botschaft gelesen und der Hofkater fort ist. Danach bleibt Ramses mit Gesprächsbaum im Thronsaal.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_AUDI\_RAM\_0010 | Ramses | Der Diener der Katze. Und die Katze. Tretet näher. Oder bleibt stehen. Nein, näher. Ja. | winkt mit beiden Zeptern |
| W2\_AUDI\_MAX\_0020 | Max | Hi. Ich brauche den Goldenen Sack Pharaonenkorn. |  |
| W2\_AUDI\_RAM\_0030 | Ramses | Den Sack. Mein Volk würde mich dafür auslachen. Es lacht mich schon aus. Es sagt, ich könne mich nicht entscheiden. Das ist … teilweise … möglicherweise … | verstummt |
| W2\_AUDI\_PIX\_0040 | Pixel | Er ist noch nicht fertig mit dem Satz. Ich hole mir solange etwas aus der Küche. |  |
| W2\_AUDI\_RAM\_0050 | Ramses | Wahr! Teilweise wahr. Ich brauche Ansehen. Ansehen bekommt man nur durch einen Sieg. In Olympia. Im Fünfkampf. Alle fünf. | Entschluss, dann Zweifel |
| W2\_AUDI\_MAX\_0060 | Max | Ich soll Sport machen. Fünf Sorten. |  |
| W2\_AUDI\_RAM\_0070 | Ramses | Du gewinnst für Ägypten, mein Volk jubelt, ich gebe dir den Sack. Vielleicht. Nein. Ganz sicher. Vermutlich. |  |
| W2\_AUDI\_MAX\_0080 | Max | Ich hab noch nie etwas gewonnen, bei dem man schwitzen muss. |  |
| W2\_AUDI\_PIX\_0090 | Pixel | Er hat noch nie etwas gewonnen, Punkt. Außer einen Streit mit dem Router. Und den hat der Router gewonnen. |  |
| W2\_AUDI\_RAM\_0100 | Ramses | Die Spiele beginnen, sobald du einen Startpass hast. Den gibt es in Olympia. Im Büro. Oder im anderen Büro. Ich weiß es nicht. |  |
| W2\_AUDI\_MAX\_0110 | Max | Sport. Freiwillig. Die spinnen, die Griechen. | Audienz beendet; Ziel im Notizbuch |

Gesprächsbaum Ramses, nach der Audienz:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_AUDI\_MAX\_0210 | Max | Warum nennt man dich den Unentschlossenen? | Option Ramses |
| W2\_AUDI\_RAM\_0220 | Ramses | Man hat mir zwei Namen vorgeschlagen. Der Große und der Weise. Ich überlege noch. Seit elf Jahren. Inzwischen heiße ich so. |  |
| W2\_AUDI\_MAX\_0230 | Max | Was ist das Pharaonenkorn eigentlich? | Option Ramses |
| W2\_AUDI\_RAM\_0240 | Ramses | Das feinste Korn des Reiches. Gemahlen, gesiebt, gesegnet. Mit Siegel. Man könnte … Dinge daraus machen. Ich weiß nicht, welche. |  |
| W2\_AUDI\_PIX\_0250 | Pixel | Ich weiß, welche. Mit Kruste. Steht schon in meinem Notizbuch. Also in deinem. Meins. | nach 0240 |
| W2\_AUDI\_MAX\_0260 | Max | Was weißt du über den Fünfkampf? | Option Ramses |
| W2\_AUDI\_RAM\_0270 | Ramses | Lauf, Sprung, Speer, Diskus, Ringen. Zwei Tage. Ich reise an. Mit Hofstaat. Mit Wedlern. Mit allem. Ich habe mich entschieden, mitzukommen. Oder? Ja. |  |
| W2\_AUDI\_MAX\_0280 | Max | Kannst du mich wenigstens unterstützen? | Option Ramses |
| W2\_AUDI\_RAM\_0290 | Ramses | Ich kann großzügig werten. Wenn es schlecht läuft. Sehr schlecht. Zweimal schlecht. Dann sage ich: Das war gut genug. Das ist meine Stärke. Meine einzige. | führt die Nachsicht-Regel ein |
| W2\_AUDI\_MAX\_0300 | Max | Warum ist dein Volk unzufrieden? | Option Ramses |
| W2\_AUDI\_RAM\_0310 | Ramses | Es will Brot und Spiele. Ich habe Brot. Aber Spiele? Welche? Brettspiele? Wettspiele? Siehst du, das ist das Problem. |  |
| W2\_AUDI\_MAX\_0320 | Max | Ich geh dann mal trainieren. | Option Ramses, beendet das Gespräch |
| W2\_AUDI\_RAM\_0330 | Ramses | Geh. Oder bleib. Geh. Ich meine es ernst. Vermutlich. |  |
| W2\_AUDI\_MAX\_0340 | Max | Ramses den Kugelschreiber zeigen? Dann muss er sich zwischen Stift und Binse entscheiden. Das überlebt er nicht. | Kugelschreiber auf Ramses |
| W2\_AUDI\_RAM\_0350 | Ramses | Ein Kranz! Aus Oliven! Der Sieg! Sofort zur Parade. Nein, erst das Volk. Nein, erst … Zeremonienmeister! | Olivenkranz auf Ramses im Stadion, nach dem Finaltag, solange der Paraden-Plan nicht gelöst ist |

## 11. Palastküche: Rätsel 4, das Olivenöl

Köchin Nebet gibt einen ganzen Krug Olivenöl nur gegen ein neues Gericht für ihre Fusionsküche. Weg A: Kaugummi als „ewiges Brot“. Weg B: Max backt nach Pixels Anweisung einen Fladen aus Brot, Datteln und Zwiebeln im Lehmofen. Hier steht auch der Traubensaft für die Parade (Rätsel 11).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_KUCH\_PIX\_0010 | Pixel | Brot. Zwiebeln. Datteln. Fett. Rauch. // Ich bin zu Hause. // Ich war noch nie zu Hause, aber so fühlt es sich an. | erstes Betreten |
| W2\_KUCH\_MAX\_0020 | Max | Eine Köchin mit Mehl im Gesicht und Kelle in der Hand. Sie sieht mich an wie eine Zutat. | Ansehen: Nebet |
| W2\_KUCH\_MAX\_0025 | Max | Sie rührt mit der einen Hand und zeigt mit der Kelle auf mich mit der anderen. Multitasking. | Ansehen: Nebet, zweites Mal |
| W2\_KUCH\_MAX\_0030 | Max | Zwei runde Lehmöfen. Innen Feuer, außen heiß. Die Mikrowelle der Antike, nur mit Geduld. | Ansehen: Lehmöfen |
| W2\_KUCH\_MAX\_0035 | Max | Die Öfen knistern. Es riecht nach Brot. Ich hab Hunger, und das ist nicht mal meine Zeit. | Ansehen: Lehmöfen, zweites Mal |
| W2\_KUCH\_MAX\_0040 | Max | Brot, Zwiebeln, eine Schale Datteln. Das Menü der letzten dreitausend Jahre. | Ansehen: Schneidetisch |
| W2\_KUCH\_PIX\_0050 | Pixel | Das Brot hat Kruste. Ich wiederhole: Kruste. Schreib das auf. Ich weiß, dass es schon drinsteht. Schreib es noch mal. | Ansehen: Schneidetisch, zweites Mal |
| W2\_KUCH\_MAX\_0060 | Max | Hohe Tonkrüge. Olivenöl. Riecht wie die Pizzeria an der Ecke, nur ohne Pizza. | Ansehen: Ölkrüge |
| W2\_KUCH\_MAX\_0065 | Max | Ich zähle die Krüge. Bei zwölf hör ich auf. In einem sitzt bestimmt ein Räuber. Oder vierzig. | Ansehen: Ölkrüge, zweites Mal |
| W2\_KUCH\_NEB\_0070 | Nebet | Finger weg vom Öl! Das Öl ist für Köche. Du bist kein Koch. Du bist ein Junge mit Sand im Haar. | Nehmen: Ölkrug, vor der Lösung |
| W2\_KUCH\_MAX\_0080 | Max | Pfandflaschen. Nur ohne Pfand. | Ansehen: Leere Amphoren |
| W2\_KUCH\_MAX\_0085 | Max | Leere Amphoren in einer Reihe. Wie Flaschen nach einer Party, nur mit Henkeln. | Ansehen: Leere Amphoren, zweites Mal |
| W2\_KUCH\_MAX\_0090 | Max | Knoblauch und Kräuter an der Decke. Riecht gesund. Ich halte Abstand. | Ansehen: Knoblauch und Kräuter |
| W2\_KUCH\_PIX\_0095 | Pixel | Knoblauch. Den rieche ich drei Räume weit. Er ist der Grund, warum ich hier nicht wohne. | Ansehen: Knoblauch und Kräuter, zweites Mal |
| W2\_KUCH\_MAX\_0100 | Max | Eine Amphore mit Trauben drauf. Traubensaft. Noch. Hab ich gelesen. | Ansehen: Traubensaft-Amphore |
| W2\_KUCH\_MAX\_0105 | Max | Traubensaft, der in hundert Jahren Essig wird. Er hat seine Zukunft schon hinter sich. | Ansehen: Traubensaft-Amphore, zweites Mal |
| W2\_KUCH\_MAX\_0110 | Max | Ich nehm den Saft. Falls jemand Durst hat. Oder in hundert Jahren Essig braucht. | Nehmen: Traubensaft; Sanduhr-Symbol im Inventar |
| W2\_KUCH\_NEB\_0120 | Nebet | Den Saft kannst du haben. Der Pharao trinkt ihn nicht. Er kann sich nicht zwischen Saft und Wein entscheiden, also trinkt er Wasser. | nach dem Nehmen |
| W2\_KUCH\_MAX\_0130 | Max | Dampf. Überall. Wie in einer Kochshow, nur dass hier jemand wirklich kochen kann. | Ansehen: Dampf |
| W2\_KUCH\_MAX\_0135 | Max | Ich atme den Dampf ein. Jetzt bin ich zu fünf Prozent Linseneintopf. | Ansehen: Dampf, zweites Mal |
| W2\_KUCH\_MAX\_0140 | Max | Hallo. Ich bräuchte etwas Öl. | Reden: Nebet, Einstieg |
| W2\_KUCH\_NEB\_0150 | Nebet | Jeder braucht Öl. Der Pharao braucht Öl, die Wedler brauchen Öl, der Kater braucht Öl, wenn man ihn ansieht. Was gibst du dafür? | rührt weiter |
| W2\_KUCH\_MAX\_0160 | Max | Was würdest du denn nehmen? | Option Nebet |
| W2\_KUCH\_NEB\_0170 | Nebet | Ein neues Gericht. Etwas, das es hier nicht gibt. Ich koche Fusionsküche: Ägypten trifft Griechenland trifft … irgendwas. Aber mir fehlt das Irgendwas. |  |
| W2\_KUCH\_MAX\_0180 | Max | Was ist Fusionsküche? | Option Nebet |
| W2\_KUCH\_NEB\_0190 | Nebet | Du nimmst zwei Dinge, die nichts miteinander zu tun haben, und steckst sie in einen Ofen. Wie diese Welt. Nur schmackhafter. |  |
| W2\_KUCH\_PIX\_0200 | Pixel | Ich mag sie. Sie denkt in Öfen. | nach 0190 |
| W2\_KUCH\_MAX\_0210 | Max | Wofür brauchen die Fächerwedler Öl? | Option Nebet (bleibt) |
| W2\_KUCH\_NEB\_0220 | Nebet | Für die Wedel, damit sie nicht knarren. Aber lieber hätten sie Feigen. Frische. Sie reden von nichts anderem. | Hinweis Rätsel 6 |
| W2\_KUCH\_MAX\_0230 | Max | Hast du ein Rezept für mich? | Option Nebet (bleibt) |
| W2\_KUCH\_NEB\_0240 | Nebet | Ich habe hundert Rezepte. Ich brauche das hundertunderste. Frag deinen Kater. Katzen wissen, was schmeckt. Das ist ihr ganzer Beruf. | Hinweis Weg B |
| W2\_KUCH\_MAX\_0250 | Max | Ich komm wieder. | Option Nebet, beendet das Gespräch |
| W2\_KUCH\_NEB\_0260 | Nebet | Mit etwas Neuem. Oder gar nicht. |  |
| W2\_KUCH\_MAX\_0270 | Max | Hier. Ewiges Brot. Man kaut es, und es wird nie alle. | Kaugummi auf Nebet; Kaugummi wird verbraucht |
| W2\_KUCH\_NEB\_0280 | Nebet | Nie alle? | nimmt, kaut, kaut, kaut |
| W2\_KUCH\_NEB\_0290 | Nebet | Es wird nicht weniger. Es wird nicht weniger! Ich kaue seit einer Minute, und es wird nicht weniger! | begeistert; Notizbuch: Rätsel-Baustein „wird nie alle“ |
| W2\_KUCH\_PIX\_0300 | Pixel | Sie kaut etwas, das kein Essen ist, und ist glücklich. Das ist der traurigste Moment dieser Welt. |  |
| W2\_KUCH\_NEB\_0310 | Nebet | Ewiges Brot! Das ist Fusion! Das ist Zukunft! Hier. Der ganze Krug. Nimm ihn. Geh, bevor ich es mir anders überlege. | gibt Olivenöl; Rätsel 4 gelöst |
| W2\_KUCH\_PIX\_0320 | Pixel | Du willst ein Rezept von mir. Gut. Hör zu, ich sage es nur dreimal. // Brot. Darauf Datteln. Darauf Zwiebeln. // In den Ofen, bis es knackt. Das nennt man Kruste. Das nennt man Kunst. | Reden: Pixel in der Küche, nach 0240; Weg B frei |
| W2\_KUCH\_MAX\_0330 | Max | Ein Fladen. Flach. Wie meine Motivation, aber essbar. | Nehmen: Brot vom Tisch |
| W2\_KUCH\_MAX\_0340 | Max | Datteln. Klebrig, süß, voller Kerne. Wie ein Gummibärchen mit Vergangenheit. | Nehmen: Datteln |
| W2\_KUCH\_MAX\_0350 | Max | Eine Zwiebel. Ich weine schon beim Ansehen. | Nehmen: Zwiebel |
| W2\_KUCH\_MAX\_0360 | Max | Brot mit Datteln. Sieht aus wie ein Fehler, den jemand mit Absicht gemacht hat. | Brot mit Datteln kombinieren |
| W2\_KUCH\_MAX\_0370 | Max | Und Zwiebeln obendrauf. Pixel sagt, das ist Kunst. Pixel frisst auch Spinnen. | Fladen mit Zwiebel kombinieren |
| W2\_KUCH\_MAX\_0380 | Max | Rein in den Ofen. Und warten. Ohne Fortschrittsbalken. | roher Fladen auf Lehmofen |
| W2\_KUCH\_PIX\_0390 | Pixel | Es knackt. Hörst du das? Das ist Kruste, die entsteht. Das schönste Geräusch nach einem Dosenöffner. | während des Backens |
| W2\_KUCH\_MAX\_0400 | Max | Hier. Dattel-Zwiebel-Fladen. Rezept vom Kater. | Fladen mit Kruste auf Nebet |
| W2\_KUCH\_NEB\_0410 | Nebet | Süß. Scharf. Knusprig. Von einer Katze. Das ist Fusion in Reinform. Der ganze Krug gehört dir. | gibt Olivenöl; Rätsel 4 gelöst |
| W2\_KUCH\_PIX\_0420 | Pixel | Ich bekomme nichts davon ab? Ich habe es erfunden. Das ist Diebstahl mit Kruste. | nach 0410 |
| W2\_KUCH\_MAX\_0430 | Max | Ein Krug Olivenöl. Schwer. Riecht nach Salat und Sieg. | Ansehen: Olivenöl im Inventar |
| W2\_KUCH\_MAX\_0435 | Max | Der Krug ist rutschig. Natürlich ist er rutschig. Da ist Öl drin. | Ansehen: Olivenöl im Inventar, zweites Mal |
| W2\_KUCH\_MAX\_0440 | Max | Die Dose zeigen? Sie hat zehn davon. Aus Ton. Mit Deckel. | Thunfischdose auf Nebet |
| W2\_KUCH\_MAX\_0450 | Max | Das Handy als Rezept? Es hat eine Koch-App. Und drei Prozent. Das reicht für die Zutatenliste. | Handy auf Nebet; nichts passiert |
| W2\_KUCH\_MAX\_0460 | Max | Den Traubensaft in den Ofen? Dann hab ich heißen Traubensaft. Opa nennt das Punsch. | Traubensaft auf Lehmofen |
| W2\_KUCH\_MAX\_0470 | Max | Rohen Fladen abgeben? Sie würde mich damit bewerfen. Zu Recht. | roher Fladen auf Nebet |
| W2\_KUCH\_PIX\_0480 | Pixel | Du willst mich in den Ofen stecken. Ich merke mir das. Ich merke mir alles. | Pixel auf Lehmofen |

## 12. Die Sphinx: Rätsel 8, Schreibblockade

Die Sphinx gibt ihre Schriftrolle nur gegen ein Rätsel, das sie nicht lösen kann. Max wählt ein Lösungswort (Handy, Kaugummi, Kugelschreiber) und legt dazu drei Rätsel-Bausteine aus dem Notizbuch. Die neun Bausteine sammelt er in der Welt: Handy: „Es klingelt, wenn jemand dich will“ (Ansehen Handy), „Es leuchtet im Dunkeln, aber nur kurz“ (Hofkater-Duell oder Ansehen Handy, zweites Mal), „Es stirbt bei drei Prozent“ (Fährmann). Kaugummi: „Es wird nie alle“ (Nebet oder Ansehen Kaugummi), „Es klebt unter jedem Tisch“ (Ansehen Kaugummi, zweites Mal), „Man kann daraus eine Sonne machen“ (Duell). Kugelschreiber: „Es schreibt ohne Tintenfass“ (Beamte oder Ansehen Kugelschreiber), „Es klickt, wenn man nervös ist“ (Ansehen Kugelschreiber, zweites Mal), „Es ist blau und hat trotzdem keine Laune“ (Tiro). Die Sphinx kommentiert immer den ersten Baustein, der nicht zum Wort passt.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_SPHX\_MAX\_0010 | Max | Hat ein Rätsel im Gesicht und keine Ahnung im Kopf. | Ansehen: Sphinx |
| W2\_SPHX\_PIX\_0020 | Pixel | Ein Löwenkörper, ein Menschenkopf. Die falsche Hälfte denkt. | Ansehen: Sphinx, zweites Mal |
| W2\_SPHX\_MAX\_0030 | Max | Ein Schreibpult, so groß wie ein Auto. Daneben zerknüllte Papyri. Jemand hat hier sehr viel nicht geschrieben. | Ansehen: Schreibpult |
| W2\_SPHX\_MAX\_0035 | Max | Das Pult ist so groß, dass ich darunter wohnen könnte. Mit Aussicht auf zerknülltes Papier. | Ansehen: Schreibpult, zweites Mal |
| W2\_SPHX\_MAX\_0040 | Max | Zerknüllte Papyri. „Was hat vier Beine und …“ Mehr steht nirgends. | Ansehen: zerknüllte Papyri |
| W2\_SPHX\_MAX\_0045 | Max | Ich glätte einen Papyrus. „Was hat …“ Er hat aufgegeben, bevor das Rätsel angefangen hat. | Ansehen: zerknüllte Papyri, zweites Mal |
| W2\_SPHX\_MAX\_0050 | Max | Ein Notizblock mit einem Wort: „Rätsel“. Darunter ein Strich. Darunter nichts. | Ansehen: Notizblock |
| W2\_SPHX\_MAX\_0055 | Max | Ein Wort und ein Strich. Das ist mehr, als ich bei manchen Aufsätzen hatte. | Ansehen: Notizblock, zweites Mal |
| W2\_SPHX\_MAX\_0060 | Max | Fußspuren im Sand. Jemand ist hierhergekommen, hat sich das Gesicht angesehen und ist wieder gegangen. Kann ich verstehen. | Ansehen: Fußspuren |
| W2\_SPHX\_PIX\_0065 | Pixel | Die Spuren gehen hin und zurück. Schnell zurück. Das ist ein Laufmuster, das ich respektiere. | Ansehen: Fußspuren, zweites Mal |
| W2\_SPHX\_MAX\_0070 | Max | Eine riesige Steinkugel in einer Rinne. Direkt über dem Pult. Das kenne ich. Das geht nie gut aus. | Ansehen: Steinkugel |
| W2\_SPHX\_MAX\_0075 | Max | Ich hab einen Rucksack, aber keinen Hut und keine Peitsche. Wenn die Kugel rollt, renne ich trotzdem. Nur uncooler. | Ansehen: Steinkugel, zweites Mal |
| W2\_SPHX\_SPH\_0080 | Sphinx | Die rollt gleich los. Seit dreihundert Jahren. | nach 0070 |
| W2\_SPHX\_MAX\_0090 | Max | Ich geh trotzdem außen rum. | nach 0080; Max umgeht die Kugel bei jedem Weg zum Pult |
| W2\_SPHX\_MAX\_0100 | Max | Die Nase ist noch dran. Noch. | Ansehen: Nase, vor dem Finaltag |
| W2\_SPHX\_MAX\_0105 | Max | Eine Nase so groß wie ein Bus. Ich hab das Gefühl, die überlebt nicht mehr lange. Irgendwer kommt immer mit etwas Schwerem vorbei. | Ansehen: Nase, vor dem Finaltag, zweites Mal |
| W2\_SPHX\_MAX\_0110 | Max | Die Nase liegt im Sand. Das war ich. Mit einem Teller. Ich sag nichts. | Ansehen: Nase im Sand, nach dem Finaltag |
| W2\_SPHX\_MAX\_0115 | Max | Wenn mich jemand fragt, war es der Wind. Ein sehr gezielter Wind mit Teller. | Ansehen: Nase im Sand, nach dem Finaltag, zweites Mal |
| W2\_SPHX\_SPH\_0120 | Sphinx | Ich höre alles. Ich habe nur keine Nase mehr, um es zu riechen. | nach 0110 |
| W2\_SPHX\_MAX\_0130 | Max | Hallo. Du bist die Sphinx. | Reden: Sphinx, Einstieg |
| W2\_SPHX\_SPH\_0140 | Sphinx | Ich bin die Sphinx. Ich stelle Rätsel. Stellte. Seit dreihundert Jahren fällt mir keins mehr ein. Alle kennen das mit den vier Beinen. | seufzt, Echo |
| W2\_SPHX\_MAX\_0150 | Max | Was ist das für eine Rolle da? | Option Sphinx |
| W2\_SPHX\_SPH\_0160 | Sphinx | „Die sieben Antworten.“ Alles, was man einem Redner entgegnen kann. Die beste Rolle der Antike. Ich gebe sie nur gegen ein Rätsel her, das ich nicht lösen kann. |  |
| W2\_SPHX\_MAX\_0170 | Max | Wie stelle ich dir ein Rätsel? | Option Sphinx |
| W2\_SPHX\_SPH\_0180 | Sphinx | Ein Ding, das ich nicht kenne. Drei Hinweise, die nur auf dieses Ding passen. Passt ein Hinweis nicht, merke ich es. Ich merke alles. Außer, was ich nicht kenne. |  |
| W2\_SPHX\_MAX\_0190 | Max | Was hat vier Beine am Morgen … | Option Sphinx, Gag |
| W2\_SPHX\_SPH\_0200 | Sphinx | Der Mensch. Das ist meins. Das war meins. Jeder sagt das. Ein Tourist hat es neulich auf mich gekritzelt. |  |
| W2\_SPHX\_MAX\_0210 | Max | Kannst du mir ein Empfehlungsschreiben geben? | Option Sphinx (bleibt); nach Rätsel 8 |
| W2\_SPHX\_SPH\_0220 | Sphinx | In Rätselform. Anders kann ich nicht. „Wer dies liest und nicht versteht, stempelt besser, bevor er fragt.“ Nimm. | gibt Empfehlungsschreiben; zweiter Weg für Rätsel 3 |
| W2\_SPHX\_MAX\_0230 | Max | Ich überleg mir was. | Option Sphinx, beendet das Gespräch |
| W2\_SPHX\_SPH\_0240 | Sphinx | Das sagen alle. Dann kommen sie nie wieder. Ich warte trotzdem. Ich bin aus Stein. Ich kann nichts anderes. |  |
| W2\_SPHX\_MAX\_0250 | Max | Ich stell dir ein Rätsel. | Option Sphinx (bleibt); öffnet die Rätsel-Auswahl |
| W2\_SPHX\_SPH\_0260 | Sphinx | Ein Kaugummi klingelt nicht. | Kaugummi plus Handy-Baustein 1 |
| W2\_SPHX\_SPH\_0270 | Sphinx | Ein Kaugummi leuchtet nicht. Nicht mal kurz. | Kaugummi plus Handy-Baustein 2 |
| W2\_SPHX\_SPH\_0280 | Sphinx | Ein Kaugummi hat keine Prozente. Ein Kaugummi hat Geschmack. Kurz. | Kaugummi plus Handy-Baustein 3 |
| W2\_SPHX\_SPH\_0290 | Sphinx | Ein Kaugummi schreibt nicht. Es hätte auch nichts zu sagen. | Kaugummi plus Kugelschreiber-Baustein 1 |
| W2\_SPHX\_SPH\_0300 | Sphinx | Ein Kaugummi klickt nicht. Es schmatzt. | Kaugummi plus Kugelschreiber-Baustein 2 |
| W2\_SPHX\_SPH\_0310 | Sphinx | Ein Kaugummi ist rosa. Du hast rosa gesagt. Also, du hast nicht rosa gesagt, aber ich weiß es. | Kaugummi plus Kugelschreiber-Baustein 3 |
| W2\_SPHX\_SPH\_0320 | Sphinx | Ein Kugelschreiber klingelt nicht. | Kugelschreiber plus Handy-Baustein 1 |
| W2\_SPHX\_SPH\_0330 | Sphinx | Ein Kugelschreiber leuchtet nicht. Außer du hältst ihn in die Sonne, und dann zählt es nicht. | Kugelschreiber plus Handy-Baustein 2 |
| W2\_SPHX\_SPH\_0340 | Sphinx | Ein Kugelschreiber stirbt nicht bei drei Prozent. Er stirbt mitten im Wort. Das weiß jeder Schreiber. | Kugelschreiber plus Handy-Baustein 3 |
| W2\_SPHX\_SPH\_0350 | Sphinx | Ein Kugelschreiber wird alle. Dann wirft man ihn weg. Oder kritzelt wie wild. | Kugelschreiber plus Kaugummi-Baustein 1 |
| W2\_SPHX\_SPH\_0360 | Sphinx | Ein Kugelschreiber klebt nicht unter dem Tisch. Er liegt darunter. Immer. | Kugelschreiber plus Kaugummi-Baustein 2 |
| W2\_SPHX\_SPH\_0370 | Sphinx | Aus einem Kugelschreiber macht man keine Sonne. Man macht höchstens eine Sonne damit. Auf Papier. | Kugelschreiber plus Kaugummi-Baustein 3 |
| W2\_SPHX\_SPH\_0380 | Sphinx | Ein Handy wird alle. Du hast es selbst gesagt. Drei Prozent. | Handy plus Kaugummi-Baustein 1 |
| W2\_SPHX\_SPH\_0390 | Sphinx | Ein Handy klebt nicht unter dem Tisch. Es liegt auf dem Tisch. Und alle starren drauf. | Handy plus Kaugummi-Baustein 2 |
| W2\_SPHX\_SPH\_0400 | Sphinx | Aus einem Handy macht man keine Sonne. Man macht die Sonne damit heller. Das ist etwas anderes. | Handy plus Kaugummi-Baustein 3 |
| W2\_SPHX\_SPH\_0410 | Sphinx | Ein Handy schreibt nicht ohne Tintenfass. Ein Handy schreibt ohne Hand. Das ist schlimmer. | Handy plus Kugelschreiber-Baustein 1 |
| W2\_SPHX\_SPH\_0420 | Sphinx | Ein Handy klickt nicht. Es summt. Bei dir sogar nur noch leise. | Handy plus Kugelschreiber-Baustein 2 |
| W2\_SPHX\_SPH\_0430 | Sphinx | Ein Handy ist nicht blau. Deins ist schwarz. Mit Riss. | Handy plus Kugelschreiber-Baustein 3 |
| W2\_SPHX\_PIX\_0440 | Pixel | Sie hat recht. Das ist das Schlimmste daran. | nach jedem Fehlversuch, zufällig in jedem dritten Fall |
| W2\_SPHX\_SPH\_0450 | Sphinx | Es klingelt, es leuchtet, es stirbt bei drei Prozent. Ein Tier? Ein Stern? Ein kranker Stern? Ich … ich weiß es nicht. | Handy mit drei Handy-Bausteinen |
| W2\_SPHX\_SPH\_0460 | Sphinx | Es wird nie alle, es klebt, es wird eine Sonne. Brot? Harz? Ein klebriger Gott? Ich kenne es nicht. Ich kenne es nicht! | Kaugummi mit drei Kaugummi-Bausteinen |
| W2\_SPHX\_SPH\_0470 | Sphinx | Es schreibt ohne Tinte, es klickt, es ist blau ohne Laune. Ein Käfer? Ein Beamter? Ich … nein. Nein. | Kugelschreiber mit drei Kugelschreiber-Bausteinen |
| W2\_SPHX\_SPH\_0480 | Sphinx | Dreihundert Jahre, und ein Junge mit Hoodie schlägt mich. Nimm die Rolle. Nimm sie, bevor ich weine. Stein weint schlecht. | gibt die Schriftrolle; Rätsel 8 gelöst; Konter 1 bis 3 ins Notizbuch |
| W2\_SPHX\_MAX\_0490 | Max | Ein Handy. | Auflösung, je nach Wort: Handy |
| W2\_SPHX\_MAX\_0500 | Max | Ein Kaugummi. | Auflösung: Kaugummi |
| W2\_SPHX\_MAX\_0510 | Max | Ein Kugelschreiber. | Auflösung: Kugelschreiber |
| W2\_SPHX\_SPH\_0520 | Sphinx | Das gibt es nicht. Das gibt es noch nicht. Das ist … unfair. Das ist genial. Ich schreibe es auf. | nach der Auflösung; Notizblock bekommt eine zweite Zeile |
| W2\_SPHX\_PIX\_0530 | Pixel | Sie hat Schreibblockade, und du hast sie mit einem Kugelschreiber gelöst. Oder mit Kaugummi. Jedenfalls ohne Verstand. Beeindruckend. | nach 0520 |
| W2\_SPHX\_MAX\_0540 | Max | „Die sieben Antworten.“ Eine Schriftrolle mit rotem Band. Die ersten drei Antworten sind fertig. Danach kommen vier Mal drei Punkte. | Ansehen: Schriftrolle im Inventar |
| W2\_SPHX\_MAX\_0545 | Max | Vier Antworten fehlen. Die Sphinx wartet. Sphinxe sind gut im Warten. Fast so gut wie Katzen. | Ansehen: Schriftrolle im Inventar, zweites Mal |
| W2\_SPHX\_SPH\_0550 | Sphinx | Die letzten vier … habe ich nie fertig bekommen. Schreibblockade. Hol dir den Rest auf der Agora. Da reden alle. | nach 0540, wenn Max bei der Sphinx steht |
| W2\_SPHX\_MAX\_0560 | Max | Ich kann der Sphinx nicht einfach das Handy zeigen. Sie muss raten. Sonst zählt es nicht. Regeln. | Handy, Kaugummi oder Kugelschreiber direkt auf Sphinx |
| W2\_SPHX\_MAX\_0570 | Max | Die Kugel anschubsen? Nein. Ich weiß, wie das endet. Mit Rennen. | Benutzen: Steinkugel |
| W2\_SPHX\_PIX\_0580 | Pixel | Eine Sphinx. Eine Verwandte, entfernt. Sehr entfernt. Mit Schreibproblemen. Wir reden nicht darüber. | Pixel auf Sphinx |

## 13. Syrakus, Archimedes' Werkstatt: Ansehen und Gespräch

Archimedes steht an der Werkbank, König Hieron mit verschränkten Armen daneben. Die Wasserorgel ist der Radio-Moment dieser Welt.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_WERK\_MAX\_0010 | Max | Zahnräder, Hebel, Spiegel, eine Badewanne. Opas Dachboden, nur mit Meerblick. | erstes Betreten |
| W2\_WERK\_PIX\_0020 | Pixel | Es riecht nach Tinte, Schweiß und Genie. Zwei davon mag ich nicht. | erstes Betreten, danach |
| W2\_WERK\_MAX\_0030 | Max | Ein alter Mann mit nassen Haaren und Zirkel. Er sieht aus, als hätte er gerade drei Ideen gleichzeitig und keine davon zu Ende. | Ansehen: Archimedes |
| W2\_WERK\_MAX\_0035 | Max | Er murmelt beim Atmen Zahlen. Falls er gleich nackt aus der Wanne springt und was Griechisches brüllt, schau ich weg. | Ansehen: Archimedes, zweites Mal |
| W2\_WERK\_MAX\_0040 | Max | Ein König ohne Krone. Mit verschränkten Armen. Das ist entweder Würde oder schlechte Laune. | Ansehen: Hieron |
| W2\_WERK\_MAX\_0045 | Max | Er sieht abwechselnd auf Archimedes und auf die Tür. Ein König mit Geduld auf Zeit. | Ansehen: Hieron, zweites Mal |
| W2\_WERK\_MAX\_0050 | Max | Eine Badewanne aus Marmor. Voll Wasser. Direkt neben der Werkbank. Hier wird in der Wanne nachgedacht. Kann ich verstehen. | Ansehen: Badewanne |
| W2\_WERK\_PIX\_0055 | Pixel | Eine Wanne voll Wasser, mitten in der Werkstatt. Das ist kein Möbelstück. Das ist eine Drohung. | Ansehen: Badewanne, zweites Mal |
| W2\_WERK\_MAX\_0060 | Max | Ein Bronzespiegel, poliert wie ein Handy-Display. Er wirft die Sonne zurück, als wäre sie ihm egal. | Ansehen: Brennspiegel |
| W2\_WERK\_MAX\_0065 | Max | Ich seh mich im Spiegel. Bronzefarben. Ich sehe aus wie eine Medaille, die keiner wollte. | Ansehen: Brennspiegel, zweites Mal |
| W2\_WERK\_MAX\_0070 | Max | Ich nehm den Spiegel mit. Tragbares Sonnenlicht. | Nehmen: Brennspiegel |
| W2\_WERK\_ARC\_0080 | Archimedes | Nimm ihn, nimm ihn! Aber nicht gegen Schiffe richten. Das gab Ärger. | nach 0070 |
| W2\_WERK\_MAX\_0090 | Max | Eine Waage mit zwei Schalen. Wiegt, was man ihr gibt, und sagt nie, was es wert ist. | Ansehen: Waage |
| W2\_WERK\_MAX\_0095 | Max | Beide Schalen leer, beide gleich hoch. Die Waage ist zufrieden. Selten, so etwas. | Ansehen: Waage, zweites Mal |
| W2\_WERK\_MAX\_0100 | Max | Eine Waage. Ich kann jetzt Dinge vergleichen. Wie ein Preisvergleich, nur in Gramm. | Nehmen: Waage |
| W2\_WERK\_MAX\_0110 | Max | Ein Tonbecher mit Strichen. Ein Messbecher. Opa hat so einen. Er misst damit Kaffee und Schrauben. | Ansehen: Messbecher |
| W2\_WERK\_MAX\_0115 | Max | Die Striche am Becher sind ungleich. Archimedes hat ihn wohl im Kopf geeicht. Beim Baden. | Ansehen: Messbecher, zweites Mal |
| W2\_WERK\_MAX\_0120 | Max | Messbecher. Eingepackt. | Nehmen: Messbecher |
| W2\_WERK\_MAX\_0130 | Max | Eine Werkbank voller Skizzen, Zahnräder und Krugsäure. Hier erfindet jemand schneller, als er aufräumt. | Ansehen: Werkbank |
| W2\_WERK\_MAX\_0135 | Max | Unter den Skizzen sind noch mehr Skizzen. Er hat keinen Papierkorb. Er hat Schichten. | Ansehen: Werkbank, zweites Mal |
| W2\_WERK\_MAX\_0140 | Max | Ein großer Tonkrug mit saurem Gesicht drauf. Riecht nach Pommesbude. Essig. Uralt. | Ansehen: Essigkrug |
| W2\_WERK\_MAX\_0145 | Max | Der Krug guckt sauer. Der Inhalt auch. Die beiden passen gut zusammen. | Ansehen: Essigkrug, zweites Mal |
| W2\_WERK\_MAX\_0150 | Max | Ich nehm den Essig. Falls jemand Salat macht. Oder Zeit zurückdreht. | Nehmen: Essigkrug; Sanduhr-Symbol im Inventar |
| W2\_WERK\_ARC\_0160 | Archimedes | Der Essig? War mal Wein. Vor fünfundzwanzig Jahren. Ich hab ihn vergessen. Ich vergesse alles, was man nicht berechnen kann. | nach 0150; Hinweis Rätsel 11 |
| W2\_WERK\_MAX\_0170 | Max | Ein Hebel aus Holz an einem Stein. Zum Werfen. Hoffentlich von Steinen. Nicht von mir. | Ansehen: Wurfhebel, vor dem Training |
| W2\_WERK\_MAX\_0175 | Max | Ich zieh nicht dran. Wer an einem Hebel zieht, ohne zu wissen wozu, fliegt. Hab ich in Cartoons gelernt. | Ansehen: Wurfhebel, vor dem Training, zweites Mal |
| W2\_WERK\_MAX\_0180 | Max | Bronzeröhren, ein Wasserkessel, Tasten. Ein Synthesizer mit Wasserkocher. Archimedes wäre in den Achtzigern ein Star gewesen. | Ansehen: Wasserorgel |
| W2\_WERK\_MAX\_0185 | Max | Eine Taste ist mit „Nicht drücken“ bekritzelt. Natürlich ist das die abgenutzteste. | Ansehen: Wasserorgel, zweites Mal |
| W2\_WERK\_ARC\_0190 | Archimedes | Die Orgel? Spielt den Olympischen Boten. Die Nachrichten. Hör zu. | drückt eine Taste; Radio-Moment |
| W2\_WERK\_ARC\_0200 | Archimedes | „Milchpreise in Syrakus auf Rekordhoch. Und: Ein Erfinder vergisst den Geburtstag seiner Frau, der Stadtrat ist entsetzt.“ | liest mit, Orgel tönt |
| W2\_WERK\_MAX\_0210 | Max | Nachrichten aus einer Wasserorgel. Und sie klingen genau wie die, die Opa immer laufen hat. | nach 0200 |
| W2\_WERK\_PIX\_0220 | Pixel | Milchpreise. Immer Milchpreise. In jeder Welt. Ich fange an, ein Muster zu sehen. Ich werde es ignorieren. | nach 0210 |
| W2\_WERK\_MAX\_0230 | Max | Ein Bauplan für eine Maschine mit Kessel und Kolben. Dampf. Er ist zweitausend Jahre zu früh dran. | Ansehen: Bauplan Dampfmaschine |
| W2\_WERK\_MAX\_0240 | Max | Hätte er das patentiert, wär er heute reich. Also tot, aber reich. | Ansehen: Bauplan Dampfmaschine, zweites Mal |
| W2\_WERK\_MAX\_0250 | Max | Ein Modell von einem Turm. Er steht schief. Absichtlich, sagt der Zettel. Der Zettel lügt. | Ansehen: Modell schiefer Turm |
| W2\_WERK\_MAX\_0260 | Max | Das wird noch Probleme machen. | Ansehen: Modell schiefer Turm, zweites Mal |
| W2\_WERK\_MAX\_0270 | Max | Skizzen an der Wand. Eine Kugel in einem Zylinder. Sehr sauber. Wie ein Logo. | Ansehen: Skizze Kugel und Zylinder |
| W2\_WERK\_MAX\_0275 | Max | Kugel im Zylinder. Er hat das bestimmt hundertmal gezeichnet. So oft zeichne ich nicht mal meinen Namen. | Ansehen: Skizze Kugel und Zylinder, zweites Mal |
| W2\_WERK\_ARC\_0280 | Archimedes | Mein Lieblingsbeweis. Die Kugel füllt zwei Drittel des Zylinders. Das will ich auf meinem Grab. Irgendwann. Nicht heute. | nach 0270 |
| W2\_WERK\_MAX\_0290 | Max | Ein breites Fenster. Draußen Hafen, Möwen, Licht. Die Werkstatt hat besseren Empfang als Opas Wohnzimmer. | Ansehen: Fenster |
| W2\_WERK\_PIX\_0295 | Pixel | Möwen. Weiß, laut, frech. Wenn ich da rauskomme, haben wir ein Gespräch unter Jägern. | Ansehen: Fenster, zweites Mal |
| W2\_WERK\_MAX\_0300 | Max | Zahnräder. Sie greifen ineinander wie Serien-Staffeln: Jede dreht die nächste. | Ansehen: Zahnräder |
| W2\_WERK\_MAX\_0305 | Max | Wenn ich am kleinen dreh, dreht sich das große. Langsam. Wie ich morgens. | Ansehen: Zahnräder, zweites Mal |
| W2\_WERK\_MAX\_0310 | Max | Bist du Archimedes? | Reden: Archimedes, Einstieg |
| W2\_WERK\_ARC\_0320 | Archimedes | Ja! Nein! Moment, ich rechne. Ja. Archimedes. Und du bist nass. Nein, das bin ich. Was willst du? | fuchtelt mit dem Zirkel |
| W2\_WERK\_MAX\_0330 | Max | Ich brauche einen Trainer für den Fünfkampf. | Option Archimedes |
| W2\_WERK\_ARC\_0340 | Archimedes | Ich trainiere niemanden, solange der König mich ansieht. Und der König sieht mich an, bis ich seine Krone geprüft habe. Siehst du das Problem? |  |
| W2\_WERK\_MAX\_0350 | Max | Was ist mit der Krone? | Option Archimedes (bleibt) |
| W2\_WERK\_ARC\_0360 | Archimedes | Der Goldschmied hat vielleicht Silber untergemischt. Die Krone wiegt genau so viel wie der Barren, den er bekam. Also wiegen hilft nicht. Ich brauche … etwas anderes. Ich weiß nur nicht, was. | Hinweis Rätsel 5 |
| W2\_WERK\_MAX\_0370 | Max | Warum sind deine Haare nass? | Option Archimedes (bleibt) |
| W2\_WERK\_ARC\_0380 | Archimedes | Ich denke in der Wanne. Heute dreimal. Jedes Mal läuft Wasser über, und jedes Mal ärgere ich mich. Dabei müsste ich … nein. Weg. Weg, der Gedanke. | Hinweis Rätsel 5, Stufe 2 |
| W2\_WERK\_MAX\_0390 | Max | Was macht die Wasserorgel? | Option Archimedes |
| W2\_WERK\_ARC\_0400 | Archimedes | Musik aus Wasser und Luft. Und Nachrichten, wenn man die dritte Taste drückt. Ich weiß nicht, wie. Es war ein Unfall. | Hinweis auf den Radio-Moment |
| W2\_WERK\_MAX\_0410 | Max | Ich bräuchte einen Entwurf für dein Grab. | Option Archimedes (bleibt); nach Ciceros Forderung (Rätsel 10), nach Rätsel 5 und nach Tag 1 |
| W2\_WERK\_ARC\_0420 | Archimedes | Mein Grab? Ich lebe! Ich lebe sehr! // Aber wenn, dann richtig. Kugel im Zylinder. Zwei Drittel. Hier, der Entwurf. // Lass ihn ordentlich meißeln. Ich schaue zu. Von oben. Also von hier. | gibt den Entwurf |
| W2\_WERK\_MAX\_0430 | Max | Bis später. | Option Archimedes, beendet das Gespräch |
| W2\_WERK\_ARC\_0440 | Archimedes | Stör meine Kreise nicht! Also, ich habe keine Kreise gerade. Aber trotzdem. |  |
| W2\_WERK\_MAX\_0450 | Max | Ihr seid der König? | Reden: Hieron, Einstieg |
| W2\_WERK\_HIE\_0460 | Hieron | Ich bin Hieron. Ich habe einen Goldschmied, eine Krone und einen Verdacht. Und einen Erfinder, der badet statt zu rechnen. | verschränkte Arme |
| W2\_WERK\_MAX\_0470 | Max | Darf ich die Krone mal sehen? | Option Hieron (bleibt) |
| W2\_WERK\_HIE\_0480 | Hieron | Hier. Krone. Barren. Gleich schwer. Beweis mir, dass sie nicht aus reinem Gold ist. Oder dass sie es ist. Mir reicht ein Beweis. | gibt Krone und Goldbarren |
| W2\_WERK\_MAX\_0490 | Max | Warum trägst du sie nicht einfach? | Option Hieron |
| W2\_WERK\_HIE\_0500 | Hieron | Eine falsche Krone tragen? Dann bin ich ein falscher König. Dann kann ich auch gleich nach Ägypten. Da ist einer, der sich nicht entscheiden kann. |  |
| W2\_WERK\_MAX\_0510 | Max | Ich seh mir das an. | Option Hieron, beendet das Gespräch |
| W2\_WERK\_HIE\_0520 | Hieron | Sieh schnell. Ich stehe hier seit dem Frühstück. |  |

## 14. Werkstatt: Rätsel 5, Archimedes' Krone

Max wägt Krone und Barren (gleich schwer), taucht beide nacheinander in die Badewanne und misst mit dem Messbecher, wie viel Wasser überläuft. Die Krone verdrängt mehr: gefälscht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_KRON\_MAX\_0010 | Max | Eine goldene Krone. Glänzt. Alles glänzt hier. Das ist das Problem. | Ansehen: Krone |
| W2\_KRON\_MAX\_0015 | Max | So viel Gold auf einem Haufen. Und keiner weiß, wie viel davon wirklich Gold ist. | Ansehen: Krone, zweites Mal |
| W2\_KRON\_MAX\_0020 | Max | Ein Goldbarren. Schwer wie mein Schulrucksack am Montag. | Ansehen: Goldbarren |
| W2\_KRON\_PIX\_0030 | Pixel | Gold. Man kann es nicht essen und nicht darauf schlafen. Es ist das nutzloseste Material der Welt. Ich will es trotzdem. | Ansehen: Goldbarren, zweites Mal |
| W2\_KRON\_MAX\_0040 | Max | Krone auf die Waage. Die Schale geht runter. Und sonst nichts. | Krone auf Waage |
| W2\_KRON\_MAX\_0050 | Max | Barren auf die andere Schale. Gleich schwer. Das ist der Punkt. Das war schon immer der Punkt. | Goldbarren auf Waage mit Krone |
| W2\_KRON\_ARC\_0060 | Archimedes | Siehst du! Gleich! Die Waage sagt nichts! Die Waage ist nutzlos! Ich habe sie trotzdem lieb. | nach 0050 |
| W2\_KRON\_MAX\_0070 | Max | Die Krone ins Wasser. Es schwappt über. Archimedes zuckt zusammen. | Krone in Badewanne |
| W2\_KRON\_MAX\_0080 | Max | Ich fang das Wasser auf. Zwei Striche. | Messbecher an Badewanne, nach der Krone; Notizbuch: „Krone: zwei Striche“ |
| W2\_KRON\_MAX\_0090 | Max | Der Barren ins Wasser. Schwappt. Weniger. | Goldbarren in Badewanne |
| W2\_KRON\_MAX\_0100 | Max | Ein Strich. Nur einer. | Messbecher an Badewanne, nach dem Barren; Notizbuch: „Barren: ein Strich“ |
| W2\_KRON\_MAX\_0110 | Max | Gleich schwer, aber die Krone macht mehr nass. Sie ist größer, als sie sein dürfte. Also ist was drin, das leichter ist als Gold. Also: gefälscht. | beide Werte vorhanden; Max zu Archimedes oder automatisch |
| W2\_KRON\_ARC\_0120 | Archimedes | Mehr Wasser! Gleiches Gewicht! Größeres Volumen! Leichteres Metall! Falsche Krone! Ich … ich … | Augen weit |
| W2\_KRON\_ARC\_0130 | Archimedes | HEUREKA! | springt in die Wanne und wieder raus, rennt mit flatterndem Handtuch zur Tür hinaus |
| W2\_KRON\_HIE\_0140 | Hieron | Er hat es wieder getan. Jedes Mal. Die halbe Stadt kennt ihn nur so. | sieht ihm nach |
| W2\_KRON\_PIX\_0150 | Pixel | Er rennt nackt durch Syrakus und schreit ein Wort. // Und DU bist der Diener einer Katze. // Ich finde, du kommst gut weg. |  |
| W2\_KRON\_MAX\_0160 | Max | Also: gefälscht. Steht fest. Kann ich jetzt trainieren? | zu Hieron |
| W2\_KRON\_HIE\_0170 | Hieron | Gefälscht. Gut. Also nicht gut. Aber gut zu wissen. Der Goldschmied bekommt Besuch. Archimedes gehört dir. Sobald er zurück ist. Und angezogen. | nimmt Krone und Barren; Rätsel 5 gelöst |
| W2\_KRON\_MAX\_0180 | Max | Die Krone aufsetzen? Hieron würde mich köpfen lassen. Mit der Krone. | Krone auf Max |
| W2\_KRON\_MAX\_0190 | Max | Die Krone auf Pixel? Er würde sie nie wieder abnehmen. | Krone auf Pixel |
| W2\_KRON\_PIX\_0200 | Pixel | Sie passt. Sie passt perfekt. Du nimmst sie mir jetzt ab, und wir reden nie wieder darüber. | nach 0190 |
| W2\_KRON\_MAX\_0210 | Max | Pixel in die Badewanne? Dann weiß ich, wie viel Wasser ein Kater verdrängt. Und wie viel Blut ich verliere. | Pixel auf Badewanne |
| W2\_KRON\_PIX\_0220 | Pixel | Wasser. Wanne. Ich. Drei Dinge, die nie zusammenkommen. Nie. | nach 0210 |
| W2\_KRON\_MAX\_0230 | Max | Die Dose in die Wanne? Sie schwimmt. Ist leer. Das weiß ich auch ohne Wanne. | Thunfischdose in Badewanne |
| W2\_KRON\_MAX\_0240 | Max | Die Waage dem König geben? Er weiß, was die Waage sagt. Deshalb steht er so. | Waage auf Hieron |
| W2\_KRON\_MAX\_0250 | Max | Der Messbecher ist leer. Ich muss erst etwas eintauchen, dann messen. Reihenfolge. Wie bei einem Tutorial. | Messbecher an Badewanne, bevor etwas eingetaucht wurde |
| W2\_KRON\_MAX\_0260 | Max | Der Barren in die Waage allein? Er wiegt einen Barren. Genau einen. Hilft nicht. | Goldbarren auf Waage ohne Krone |
| W2\_KRON\_MAX\_0270 | Max | Den Spiegel ins Wasser? Dann hab ich einen nassen Spiegel. Und ein beleidigtes Spiegelbild. | Brennspiegel in Badewanne |

## 15. Werkstatt: Die Trainings-Szene

Szene nach Rätsel 5. Archimedes kommt zurück, in ein Handtuch gewickelt, und baut den Wurfhebel fertig. Max übt dreimal. Das ist sein Entwicklungsmoment in dieser Welt: Beim dritten Mal sagt er von selbst „Noch mal“.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_TRAI\_ARC\_0010 | Archimedes | So! Angezogen! Größtenteils! Der Hebel ist fertig. Du setzt dich vorne hin, ich lege Gewicht hinten rein, und dann fliegst du. | klopft auf den Hebel |
| W2\_TRAI\_MAX\_0020 | Max | Ich fliege. |  |
| W2\_TRAI\_ARC\_0030 | Archimedes | Gib mir einen festen Punkt, und ich hebe die Welt aus den Angeln. Du bist kleiner als die Welt. Das wird leicht. |  |
| W2\_TRAI\_MAX\_0040 | Max | Muss das sein. | setzt sich auf den Hebel, erster Versuch |
| W2\_TRAI\_NAR\_0050 | – | Der Hebel schnellt hoch. Max landet zwei Meter weiter im Sand. Auf dem Gesicht. | Animation katapultiert |
| W2\_TRAI\_PIX\_0060 | Pixel | Zwei Meter. Ein Hase springt weiter. Ein beleidigter Hase. |  |
| W2\_TRAI\_ARC\_0070 | Archimedes | Zu wenig Gewicht! Mehr! Noch mal! | legt einen Stein in den Korb |
| W2\_TRAI\_MAX\_0080 | Max | Okay. Aber nur, weil ich sowieso schon im Sand liege. | zweiter Versuch |
| W2\_TRAI\_NAR\_0090 | – | Der Hebel schnellt hoch. Max fliegt in einem sauberen Bogen und landet auf den Füßen. Fast. | Animation katapultiert, weiter |
| W2\_TRAI\_ARC\_0100 | Archimedes | Besser! Der Winkel! Der Winkel war fast richtig! Noch … | sieht Max an |
| W2\_TRAI\_MAX\_0110 | Max | Noch mal. | steht von selbst auf, klopft den Sand ab |
| W2\_TRAI\_PIX\_0120 | Pixel | Was hast du gesagt? |  |
| W2\_TRAI\_MAX\_0130 | Max | Noch mal. Der Winkel war fast richtig. | setzt sich hin, dritter Versuch |
| W2\_TRAI\_PIX\_0140 | Pixel | Er hat „noch mal“ gesagt. Freiwillig. Bei Sport. // Ich kenne diesen Jungen seit vierzehn Jahren. // Er hat noch nie „noch mal“ gesagt. Nicht mal bei Nachtisch. | fassungslos, Schwanz gesträubt |
| W2\_TRAI\_NAR\_0150 | – | Max fliegt. Landet. Steht. | Animation; Max' Haltung in dieser Szene etwas aufrechter |
| W2\_TRAI\_ARC\_0160 | Archimedes | Perfekt! Also: gut. Also: brauchbar. Der Hebel kommt mit nach Olympia. Du bist mein Schüler. Ich habe nie Schüler gehabt. Du bist der erste. Enttausch mich nicht. | Wurfhebel ins Stadion; Tag 1 vorbereitet |
| W2\_TRAI\_MAX\_0170 | Max | Ich hab gerade dreimal freiwillig Sport gemacht. Das erzähle ich niemandem. |  |
| W2\_TRAI\_PIX\_0180 | Pixel | Ich erzähle es allen. Zuerst dem Krokodil. |  |

## 16. Olympia, Startbüro: Rätsel 3, der Passierschein

Beamter 1 (Startschalter) verlangt einen Bürgerschein, Beamter 2 (Bürgerschalter) einen Startpass. Der Aushang sagt: Jedes neue Rundschreiben gilt sofort und über allem. Weg A: Max schreibt mit dem Kugelschreiber auf ein leeres Formular ein Rundschreiben, das einen Passierschein A38 verlangt. Weg B: Papyrus aus dem Nil plus Tintenfisch-Tinte vom Hafen. Weg C: das Empfehlungsschreiben der Sphinx. Weg D: Mit der Sortierenden Socke findet Max im sortierten Formularberg ein fertiges Rundschreiben, das nur noch abgegeben werden muss. Gleich nach dem Startpass kommt Hermes zurück und leiht Max von sich aus seine Sandalen (0600, 0610); ohne sie beginnt Tag 1 nicht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_BUER\_MAX\_0010 | Max | Zwei Schalter, ein Berg Schriftrollen, eine Bank voller Leute, die aussehen, als wären sie hier geboren. Ein Amt. | erstes Betreten |
| W2\_BUER\_PIX\_0020 | Pixel | Staub, Langeweile, Sonnenstrahlen. Ein perfekter Schlafplatz. Ich verstehe die Leute auf der Bank. | erstes Betreten, danach |
| W2\_BUER\_MAX\_0030 | Max | Ein Beamter mit Glatze und einer Schriftrolle, so lang wie er. Er schläft mit offenen Augen. Das ist eine Fähigkeit. | Ansehen: Beamter 1 |
| W2\_BUER\_MAX\_0035 | Max | Er hat gerade geblinzelt. Einmal. Ich glaube, das war sein Mittag. | Ansehen: Beamter 1, zweites Mal |
| W2\_BUER\_MAX\_0040 | Max | Brille, Schnurrbart, Stempel. Der Stempel ist größer als sein Kopf. Vermutlich wichtiger. | Ansehen: Beamter 2 |
| W2\_BUER\_MAX\_0045 | Max | Er stempelt in die Luft, wenn nichts vor ihm liegt. Übung macht den Beamten. | Ansehen: Beamter 2, zweites Mal |
| W2\_BUER\_MAX\_0050 | Max | Schriftrollen bis zur Decke. Das Archiv. Oder der Müll. Bei Ämtern weiß man das nie. | Ansehen: Formularberg |
| W2\_BUER\_MAX\_0055 | Max | Ganz unten liegt ein Antrag auf einen Antrag. Daneben einer für ein Formular, das es nicht gibt. Hier ist alles möglich, nur nichts erledigt. | Ansehen: Formularberg, zweites Mal |
| W2\_BUER\_MAX\_0060 | Max | Ein leeres Formular. Ganz unten im Stapel. Das einzige, das noch niemand ausgefüllt hat. | Nehmen: leeres Formular vom Formularberg |
| W2\_BUER\_MAX\_0070 | Max | Wachstafeln. Man schreibt rein, man kratzt es raus. Die Rückgängig-Taste der Antike. | Ansehen: Wachstafeln |
| W2\_BUER\_MAX\_0075 | Max | Auf einer steht „Rückgängig“. Sie ist leer. Jemand hat es benutzt. | Ansehen: Wachstafeln, zweites Mal |
| W2\_BUER\_MAX\_0080 | Max | Ein vergilbter Zettel an der Wand. Niemand liest ihn. Deshalb gilt er wahrscheinlich noch. | Ansehen: Aushang; öffnet Nahansicht |
| W2\_BUER\_MAX\_0085 | Max | Der Zettel ist so alt, dass die Ecken sich eingerollt haben. Wie ein Kater beim Schlafen. | Ansehen: Aushang, zweites Mal; öffnet Nahansicht |
| W2\_BUER\_MAX\_0090 | Max | „Jedes neue Rundschreiben gilt sofort und über allen anderen Vorschriften.“ Das ist eine Sicherheitslücke mit Reißzwecke. | Nahansicht Aushang; Notizbuch Seite 2 |
| W2\_BUER\_PIX\_0100 | Pixel | Neue Regel schlägt alte Regel. In meinem Haushalt gilt das auch. Nur dass ich die neuen Regeln mache. | Nahansicht Aushang, nach dem Lesen |
| W2\_BUER\_MAX\_0110 | Max | Eine Bank mit Wartenden. Der eine hat einen Bart bis zum Boden. Der ist hier seit Nummer eins. | Ansehen: Bank mit Wartenden |
| W2\_BUER\_PIX\_0115 | Pixel | Der Mann mit dem Bart wartet seit Nummer eins. Ich warte seit fünf Minuten. Wir sind beide am Ende. | Ansehen: Bank mit Wartenden, zweites Mal |
| W2\_BUER\_MAX\_0120 | Max | Staub in Sonnenstrahlen. Wie Ladebalken, nur in Zeitlupe. | Ansehen: Staub |
| W2\_BUER\_MAX\_0125 | Max | Der Staub tanzt im Licht. Er hat hier das spannendste Leben von allen. | Ansehen: Staub, zweites Mal |
| W2\_BUER\_MAX\_0130 | Max | Hallo. Ich brauche einen Startpass. | Reden: Beamter 1, Einstieg |
| W2\_BUER\_BE1\_0140 | Beamter 1 | Bürgerschein. | ohne aufzuwachen |
| W2\_BUER\_MAX\_0150 | Max | Ich hab keinen. |  |
| W2\_BUER\_BE1\_0160 | Beamter 1 | Dann keinen Startpass. Startpass nur für Bürger. Bürger haben Bürgerschein. Schalter zwei. |  |
| W2\_BUER\_MAX\_0170 | Max | Was ist, wenn ich kein Grieche bin? | Option Beamter 1 |
| W2\_BUER\_BE1\_0180 | Beamter 1 | Dann wirst du einer. Schalter zwei. Mit Startpass. |  |
| W2\_BUER\_MAX\_0190 | Max | Wer hat diese Regeln gemacht? | Option Beamter 1 (bleibt) |
| W2\_BUER\_BE1\_0200 | Beamter 1 | Ein Rundschreiben. Rundschreiben kommen von oben. Oben ist irgendwo. Wir fragen nicht. | Hinweis Rätsel 3 |
| W2\_BUER\_MAX\_0210 | Max | Dann geh ich zu Schalter zwei. | Option Beamter 1, beendet das Gespräch |
| W2\_BUER\_BE1\_0220 | Beamter 1 | Nummer ziehen. | es gibt keine Nummern |
| W2\_BUER\_MAX\_0230 | Max | Ich brauche einen Bürgerschein. | Reden: Beamter 2, Einstieg |
| W2\_BUER\_BE2\_0240 | Beamter 2 | Startpass. | rückt die Brille zurecht |
| W2\_BUER\_MAX\_0250 | Max | Den bekomme ich nur mit Bürgerschein. |  |
| W2\_BUER\_BE2\_0260 | Beamter 2 | Richtig. Und den Bürgerschein nur mit Startpass. Das System funktioniert. Seit vierhundert Jahren hat es niemand geschafft. Wir sind sehr stolz. |  |
| W2\_BUER\_MAX\_0270 | Max | Das ist eine Endlosschleife. | Option Beamter 2 |
| W2\_BUER\_BE2\_0280 | Beamter 2 | Das ist Verwaltung. Dasselbe Wort, länger. |  |
| W2\_BUER\_MAX\_0290 | Max | Gibt es Ausnahmen? | Option Beamter 2 (bleibt) |
| W2\_BUER\_BE2\_0300 | Beamter 2 | Nur, wenn ein neues Rundschreiben kommt. Dann machen wir, was drinsteht. Sofort. Egal, was. Das ist unsere größte Angst und unsere einzige Freude. | Hinweis Rätsel 3 |
| W2\_BUER\_MAX\_0310 | Max | Ich überleg mir was. | Option Beamter 2, beendet das Gespräch |
| W2\_BUER\_BE2\_0320 | Beamter 2 | Die Bank ist frei. Ab übermorgen. |  |
| W2\_BUER\_HER\_0330 | Hermes | Hallo! Da seid ihr ja! Ich hab's: Euer Startpass ist in einem anderen Büro! | stürmt herein, nach dem ersten Gespräch mit einem Beamten |
| W2\_BUER\_MAX\_0340 | Max | Es gibt kein anderes Büro. |  |
| W2\_BUER\_HER\_0350 | Hermes | Dann ist er da! | zeigt auf eine Wand |
| W2\_BUER\_PIX\_0360 | Pixel | Der Mann hat geflügelte Schuhe und ist trotzdem immer zu spät. Das ist keine Ausrüstung, das ist Charakter. |  |
| W2\_BUER\_MAX\_0370 | Max | Ein Formular und ein Kugelschreiber. Ich schreibe ein Rundschreiben. Von oben. Oben bin jetzt ich. | Kugelschreiber auf leeres Formular; Notizbuch: Baustein „schreibt ohne Tintenfass“ |
| W2\_BUER\_MAX\_0380 | Max | „Rundschreiben. Ab sofort gibt es Startpass und Bürgerschein nur gegen Passierschein A38.“ Den gibt es nicht. Das ist der Trick. | Rundschreiben im Inventar; Kugelschreiber verbraucht (Mine leer, Wunderding ausgegeben) |
| W2\_BUER\_MAX\_0390 | Max | Tinte aus einem Tintenfisch auf Papyrus aus dem Nil. Ich schreibe mit dem Finger. Wie auf einem Tablet, nur klebriger. | Tintenfass auf Papyrus |
| W2\_BUER\_MAX\_0400 | Max | Dasselbe Rundschreiben. Nur blauer und mit Fingerabdruck. Amtlich genug. | Rundschreiben (Tinte) im Inventar |
| W2\_BUER\_MAX\_0410 | Max | Die Socke. Sie sortiert. Alles. Sofort. | Sortierende Socke auf Formularberg |
| W2\_BUER\_NAR\_0420 | – | Die Socke wirbelt durch den Berg. Rollen fliegen, Staub steigt, Beamter 1 wacht kurz auf und schläft wieder ein. Oben liegt ein einzelnes Rundschreiben, fertig geschrieben, nie abgegeben. | Animation |
| W2\_BUER\_MAX\_0430 | Max | „Rundschreiben: Startpass nur gegen Passierschein A38.“ Jemand hatte vor mir dieselbe Idee. Und dann wohl keinen Mut mehr. | Rundschreiben gefunden; Socke zurück ins Inventar |
| W2\_BUER\_PIX\_0440 | Pixel | Die Socke hat in zehn Sekunden erledigt, was dieses Amt in vierhundert Jahren nicht geschafft hat. Ich bin fast stolz. Auf eine Socke. |  |
| W2\_BUER\_MAX\_0450 | Max | Hier. Neues Rundschreiben. Von oben. | Rundschreiben auf Beamter 1 oder Beamter 2 |
| W2\_BUER\_BE2\_0460 | Beamter 2 | Ein Rundschreiben. Ein neues. Es gilt sofort. Es verlangt … einen Passierschein A38. | liest, Brille rutscht |
| W2\_BUER\_BE1\_0470 | Beamter 1 | Den gibt es nicht. | hellwach |
| W2\_BUER\_BE2\_0480 | Beamter 2 | Den gibt es nicht! Aber wir müssen ihn verlangen! Wir müssen etwas verlangen, das es nicht gibt! Das ist … das ist das Ende! | Panik |
| W2\_BUER\_BE1\_0490 | Beamter 1 | Stempel alles. Alles. Startpass, Bürgerschein, Passierschein. Damit er geht. Damit er nie wiederkommt. |  |
| W2\_BUER\_NAR\_0500 | – | Beamter 2 stempelt. Tische, Rollen, die Bank, den Mann mit dem Bart. Dann Max' Formular. Dreimal. | Animation Stempel |
| W2\_BUER\_BE2\_0510 | Beamter 2 | Startpass. Bürgerschein. Passierschein A38, hiermit erfunden und sofort ungültig. Geh. Bitte. | gibt Startpass; Rätsel 3 gelöst |
| W2\_BUER\_MAX\_0520 | Max | Ein Startpass. Wachstafel mit Siegel. Ich bin offiziell Grieche und Sportler. Beides zum ersten Mal. | Ansehen: Startpass im Inventar |
| W2\_BUER\_MAX\_0525 | Max | Mein Name steht drauf, falsch geschrieben, mit Siegel. Jetzt ist der falsche Name amtlich. | Ansehen: Startpass im Inventar, zweites Mal |
| W2\_BUER\_MAX\_0530 | Max | Hier. Ein Empfehlungsschreiben. Von der Sphinx. | Empfehlungsschreiben auf Beamter 1 oder 2 |
| W2\_BUER\_BE2\_0540 | Beamter 2 | „Wer dies liest und nicht versteht, stempelt besser, bevor er fragt.“ Verstehst du das? | zu Beamter 1 |
| W2\_BUER\_BE1\_0550 | Beamter 1 | Nein. Stempel. | Stempel-Animation; Startpass; Rätsel 3 gelöst |
| W2\_BUER\_BE2\_0560 | Beamter 2 | Ein Stift. Ohne Tintenfass. Er schreibt einfach so. Das ist … das ist nicht zulässig. Das ist wunderbar. Weg damit. | Kugelschreiber auf Beamter 2; schiebt ihn zurück, Kugelschreiber bleibt; Notizbuch: Baustein „schreibt ohne Tintenfass“ |
| W2\_BUER\_MAX\_0570 | Max | Ein leeres Formular abgeben? Dann bin ich hier der Erste, der das Amt mit Nichts überfordert. Nein, der Zweite. Der Bart war erster. | leeres Formular auf Beamter |
| W2\_BUER\_MAX\_0580 | Max | Opas Papyrus abgeben? „Fein wie Staub.“ Sie würden ihn stempeln und ernst nehmen. Das will ich nicht erleben. | Opas Papyrus auf Beamter |
| W2\_BUER\_BE1\_0590 | Beamter 1 | Katzen brauchen keinen Startpass. Katzen dürfen nicht starten. Katzen dürfen aber warten. | Pixel auf Beamter 1 |
| W2\_BUER\_MAX\_0600 | Max | Hermes, hast du Schuhe für den Lauf? | automatisch direkt nach 0510 oder 0550; Hermes stürmt wieder herein |
| W2\_BUER\_HER\_0610 | Hermes | Meine Sandalen? Klar! Nimm sie! Sie wollen sowieso immer weg. Schnür sie gut, sonst sind sie vor dir im Ziel. Oder in Ägypten. | gibt die geflügelten Sandalen |
| W2\_BUER\_MAX\_0620 | Max | Geflügelte Sandalen. Sie zappeln im Inventar. Wie ein Handy auf Vibration, nur mit Federn. | Ansehen: Sandalen im Inventar |
| W2\_BUER\_PIX\_0625 | Pixel | Sandalen mit Flügeln. Sie zappeln. Ich habe beschlossen, sie als Beute zu betrachten. | Ansehen: Sandalen im Inventar, zweites Mal |
| W2\_BUER\_MAX\_0630 | Max | Einen Schluck Öl auf die Riemen. Jetzt sitzen sie. Hoffentlich bis ins Ziel. | Olivenöl auf Sandalen; Sandalen geölt, Olivenöl bleibt angebrochen im Inventar |
| W2\_BUER\_PIX\_0640 | Pixel | Du ölst Schuhe. Ich öle mich nie, und ich bin trotzdem geschmeidig. Das nennt man Veranlagung. | nach 0630 |
| W2\_BUER\_HER\_0650 | Hermes | Was haben die Römer je für uns getan? Nichts. Außer die Post schneller machen. Die war vorher mein Job. Ich meine, sie ist es noch. Ich muss los! | Option Hermes: Was hältst du von den Römern? |

## 17. Agora von Olympia: Ansehen, Cicero, Griechen, Tonne

Marktplatz neben dem Stadion. Cicero redet am Pult vor römischen Touristen, Tiro schreibt mit, Griechen beschweren sich, der Philosoph beschimpft alle aus seiner Tonne. Hier sammelt Max die Konter für das Rede-Ringen (Rätsel 9): Konter 1 bis 3 stehen auf der Schriftrolle, 4 und 5 kommen von den Griechen, 6 und 7 aus der Tonne. Die Sandale (Rätsel 6) steht in Abschnitt 18.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_AGOR\_MAX\_0010 | Max | Ein Marktplatz. Alle reden gleichzeitig, keiner hört zu. Wie die Kommentare unter einem Video. | erstes Betreten |
| W2\_AGOR\_MAX\_0020 | Max | Eine Säulenhalle. Weiß, kalt, schattig. Hier hängen die Leute ab, die zu klug für Sport sind. | Ansehen: Säulenhalle |
| W2\_AGOR\_MAX\_0025 | Max | Im Schatten sitzen Männer und denken laut. Das Geräusch von Philosophie ist sehr nah an Schnarchen. | Ansehen: Säulenhalle, zweites Mal |
| W2\_AGOR\_MAX\_0030 | Max | Eine hohe Säule mit einem Steinadler oben drauf. Und unten ein Heuhaufen. Direkt darunter. | Ansehen: hohe Säule mit Adler |
| W2\_AGOR\_MAX\_0035 | Max | Adler oben, Heuhaufen unten. Gleich springt da einer mit ausgebreiteten Armen runter. Ich hab das tausendmal gesehen. Auf dem Bildschirm. | Ansehen: hohe Säule mit Adler, zweites Mal |
| W2\_AGOR\_MAX\_0040 | Max | Wer da runterspringt, landet genau im Heu. Rein zufällig. | Ansehen: Heuhaufen |
| W2\_AGOR\_PIX\_0050 | Pixel | Heu. Warm, trocken, raschelt. Acht von zehn Punkten als Schlafplatz. Abzug für den Adler. | Ansehen: Heuhaufen, zweites Mal |
| W2\_AGOR\_MAX\_0060 | Max | Eine Marmorfrau mit beiden Armen. Sieht teuer aus. Ich fasse nichts an. | Ansehen: Venusstatue, vor dem Finaltag |
| W2\_AGOR\_MAX\_0065 | Max | Sie steht da, als würde sie gleich etwas Wichtiges sagen. Seit zweitausend Jahren. | Ansehen: Venusstatue, vor dem Finaltag, zweites Mal |
| W2\_AGOR\_MAX\_0070 | Max | Die Marmorfrau hat keine Arme mehr. Das war auch ich. Sie sieht trotzdem berühmter aus als vorher. | Ansehen: Venusstatue, nach dem Finaltag |
| W2\_AGOR\_MAX\_0075 | Max | Ich schau lieber woanders hin. Jedes Mal, wenn ich hinsehe, fühl ich mich verhaftet. | Ansehen: Venusstatue, nach dem Finaltag, zweites Mal |
| W2\_AGOR\_MAX\_0080 | Max | Ein Rednerpult. Jemand steht drauf und redet seit Stunden. Die Leute davor haben Sonnenhüte. Die wussten, was kommt. | Ansehen: Rednerpult |
| W2\_AGOR\_MAX\_0085 | Max | Er redet. Immer noch. Die Sonnenhüte haben sich ausgezahlt. | Ansehen: Rednerpult, zweites Mal |
| W2\_AGOR\_MAX\_0090 | Max | Obst, Töpfe, mehr Töpfe. Jeder Stand verkauft dasselbe und behauptet, es sei besser. | Ansehen: Marktstände |
| W2\_AGOR\_PIX\_0100 | Pixel | Obst. Nur Obst. Kein Fisch. Olympia ist ein Markt für Leute, die noch nie gegessen haben. | Ansehen: Marktstände, zweites Mal |
| W2\_AGOR\_MAX\_0110 | Max | Eine Tonne. Darin ein Mann. Der Mann schreit. Die Tonne nicht. | Ansehen: Tonne |
| W2\_AGOR\_MAX\_0115 | Max | Ich stell mich vor die Tonne. Er sagt, ich steh ihm in der Sonne. Ich geh. Mit jemandem, der in einer Tonne wohnt, streitet man nicht. | Ansehen: Tonne, zweites Mal |
| W2\_AGOR\_MAX\_0120 | Max | Griechen und Touristen in roten Togen mit Sonnenhüten. Die Touristen zeigen auf alles. Die Griechen zeigen auf die Touristen. | Ansehen: Menge |
| W2\_AGOR\_PIX\_0125 | Pixel | Lauter Leute in Röcken mit Sandalen. Niemand hat Thunfisch. Ich stelle fest: Kultur ist überbewertet. | Ansehen: Menge, zweites Mal |
| W2\_AGOR\_MAX\_0130 | Max | Ein Tourist mit Sonnenhut, Sandalen und weißen Socken. Manche Dinge ändern sich in zweitausend Jahren nicht. | Ansehen: Römischer Tourist |
| W2\_AGOR\_MAX\_0135 | Max | Weiße Socken in Sandalen. Wenn ich nach Hause komme, erzähl ich das meinem Vater. Er wird stolz sein. | Ansehen: Römischer Tourist, zweites Mal |
| W2\_AGOR\_TOU\_0140 | Tourist | Und das hier, Liebling, ist die Agora. Steht im Reiseführer. Ganz oben. Direkt nach „Nicht das Wasser trinken“. | Reden: Tourist |
| W2\_AGOR\_MAX\_0150 | Max | Eine Touristin mit riesiger Sonnenbrille und Souvenir-Amphore. Sie sieht aus, als hätte sie alles schon gesehen. Zweimal. | Ansehen: Römische Touristin |
| W2\_AGOR\_MAX\_0155 | Max | Sie hält die Amphore wie eine Handtasche. Hinten drauf steht „Gruß aus Olympia“. | Ansehen: Römische Touristin, zweites Mal |
| W2\_AGOR\_MAX\_0160 | Max | Ein Straßenmusiker mit Lyra und Hut. Der Hut ist leerer als mein Akku. | Ansehen: Straßenmusiker |
| W2\_AGOR\_PIX\_0170 | Pixel | Der singt Steine weich. Bei mir klappt das nicht. Ich habe es versucht. Die Steine blieben hart, und ich blieb heiser. | Ansehen: Straßenmusiker, zweites Mal |
| W2\_AGOR\_MAX\_0180 | Max | Kritzelei an der Wand. Lateinisch. Jemand hat es dreimal korrigiert und ist dann gegangen. | Ansehen: Latein-Kritzelei |
| W2\_AGOR\_PIX\_0190 | Pixel | Römische Touristen. Hinterlassen überall ihre Grammatikfehler. Und ihre Socken. | Ansehen: Latein-Kritzelei, zweites Mal |
| W2\_AGOR\_MAX\_0200 | Max | Ein stattlicher Mann in Toga mit erhobenem Arm. Er redet, als wäre jeder Satz ein Finale. | Ansehen: Cicero |
| W2\_AGOR\_MAX\_0205 | Max | Er hat den Arm schon wieder oben. Ich glaube, der geht gar nicht mehr runter. | Ansehen: Cicero, zweites Mal |
| W2\_AGOR\_MAX\_0210 | Max | Ein dünner Schreiber mit Wachstafel. Er schreibt schneller, als Cicero redet. Das ist menschlich unmöglich. | Ansehen: Tiro |
| W2\_AGOR\_MAX\_0215 | Max | Er schreibt, während Cicero Luft holt. Er schreibt sogar das Luftholen mit. | Ansehen: Tiro, zweites Mal |
| W2\_AGOR\_MAX\_0220 | Max | Ein müder Mann in brauner Kutte, der ständig abwinkt. Vor ihm knien Leute. Er würde lieber woanders sein. | Ansehen: Brian |
| W2\_AGOR\_MAX\_0225 | Max | Wenn er gleich einen Schuh verliert, rennen ihm alle hinterher und verehren den Schuh. Ich kenne die Sorte Menge. | Ansehen: Brian, zweites Mal |
| W2\_AGOR\_MAX\_0230 | Max | Entschuldigung. Du bist Cicero? | Reden: Cicero, Einstieg |
| W2\_AGOR\_CIC\_0240 | Cicero | Ich bin Marcus Tullius Cicero. Und bevor du fragst: Ja, ich halte eine Rede, nein, sie ist nicht zu Ende, und ja, du darfst zuhören. Das dürfen alle. | ohne den Arm zu senken |
| W2\_AGOR\_MAX\_0250 | Max | Trittst du beim Ringen an? | Option Cicero (bleibt) |
| W2\_AGOR\_CIC\_0260 | Cicero | Beim Rede-Ringen. Gewiss. Aber erst, wenn ich gefunden habe, weswegen ich hier bin: das Grab des Archimedes. Ein Grab von genau hundertsiebenunddreißig Jahren, nicht ein Jahr jünger. | Notizbuch: „137 Jahre“; Rätsel 10 offen, sobald auch Rätsel 5 und Tag 1 erledigt sind |
| W2\_AGOR\_MAX\_0270 | Max | Archimedes lebt. Er steht in Syrakus in seiner Werkstatt. Nass. | Option Cicero; nach dem Besuch in Syrakus |
| W2\_AGOR\_CIC\_0280 | Cicero | Unsinn. Archimedes ist seit hundertsiebenunddreißig Jahren tot. Es steht in meinen Büchern, und meine Bücher irren nicht. Der Mann in Syrakus ist ein Schwindler mit nassen Haaren. |  |
| W2\_AGOR\_PIX\_0290 | Pixel | Er glaubt einem Buch mehr als einem nassen Mann vor seiner Nase. Ich kenne das. Ich glaube der Dose mehr als dem Napf. | nach 0280 |
| W2\_AGOR\_MAX\_0300 | Max | Wo suchst du das Grab? | Option Cicero (bleibt) |
| W2\_AGOR\_CIC\_0310 | Cicero | In Syrakus, auf dem Hügel vor der Stadt, zwischen Dornen und Brombeeren. Dort liegt es. Ich weiß es. Ich finde es nur nicht. Ich brauche einen Stein. Einen alten. | Hinweis Rätsel 10 |
| W2\_AGOR\_MAX\_0320 | Max | Worum geht es in deiner Rede? | Option Cicero |
| W2\_AGOR\_CIC\_0330 | Cicero | Um die Römer, die Griechen, die Tugend, die Zeit, das Vaterland, die Pflicht, die … wo war ich? Egal. Ich fange von vorn an. |  |
| W2\_AGOR\_MAX\_0340 | Max | Ich geh dann mal. | Option Cicero, beendet das Gespräch |
| W2\_AGOR\_CIC\_0350 | Cicero | Wie lange noch, Junge, willst du meine Geduld missbrauchen? Also geh. Ich rede weiter. Ich rede immer weiter. |  |
| W2\_AGOR\_MAX\_0360 | Max | Was schreibst du da? | Reden: Tiro |
| W2\_AGOR\_TIR\_0370 | Tiro | Alles. Jedes Wort. In Kurzschrift. Ich habe sie erfunden, weil er nie aufhört. Ich brauche nur … eine feste Unterlage. Eine runde. Egal. Vergiss es. | räuspert sich; Hinweis Rätsel 7 |
| W2\_AGOR\_TIR\_0380 | Tiro | Blau. Ein blauer Stift. Er schreibt und schreibt und ist trotzdem schlecht gelaunt. Wie ich. | Kugelschreiber auf Tiro; Notizbuch: Baustein „blau ohne Laune“ |
| W2\_AGOR\_MAX\_0390 | Max | Was ist hier los? | Reden: Grieche in der Menge, Einstieg |
| W2\_AGOR\_GRI\_0400 | Grieche | Die Römer! Überall Römer! Sie fotografieren unsere Säulen mit Wachstafeln und fragen, wo das Kolosseum ist! Was haben die Römer je für uns getan? |  |
| W2\_AGOR\_GRI\_0410 | Grieche | Na gut, die Straßen. Und das Aquädukt. Und die Thermen. Und die Post. Aber sonst? Was haben die Römer je für uns getan, außer Straßen, Aquädukt, Thermen und Post? | zweiter Grieche ruft dazwischen; Konter 4 ins Notizbuch: „Außer den Straßen, dem Aquädukt und den Thermen?“ |
| W2\_AGOR\_GRI\_0420 | Grieche | Und wenn einer von denen redet, dann redet er. Stundenlang. Da hilft nur eins: fragen, ob er auch mal Luft holt. Das bringt sie aus dem Takt. | Option Grieche: Wie haltet ihr Cicero aus?; Konter 5 ins Notizbuch: „Holst du auch mal Luft?“ |
| W2\_AGOR\_MAX\_0430 | Max | Danke für das Gespräch. | Option Grieche, beendet das Gespräch |
| W2\_AGOR\_GRI\_0440 | Grieche | Und jetzt sag nicht, du bist Römer. Du siehst nicht aus wie ein Römer. Du siehst aus wie jemand, der zu lange drinnen war. |  |
| W2\_AGOR\_MAX\_0450 | Max | Hallo? Alles okay da drin? | Reden: Philosoph |
| W2\_AGOR\_PHI\_0460 | Philosoph | GEH MIR AUS DER SONNE! Du stehst im Licht wie ein Sack ohne Boden! Dein Hoodie hat mehr Verstand als du, und der ist aus Stoff! | schreit, Laterne schwankt |
| W2\_AGOR\_MAX\_0470 | Max | Okay. Netter Mann. Sehr direkt. Ich glaub, der kann uns helfen. Nur nicht mir. |  |
| W2\_AGOR\_PIX\_0480 | Pixel | Eine Tonne. Dunkel, eng, riecht nach Mensch. // Ich gehe da jetzt rein. // Nicht, weil ich will. Weil er Dinge sagt, die ich lernen möchte. | Spielfigur Pixel: Tonne benutzen |
| W2\_AGOR\_PHI\_0490 | Philosoph | Eine Katze! Endlich jemand, der nichts will und nichts tut! Komm rein. Ich zeige dir, wie man Menschen beleidigt. Lektion eins: Augenkontakt. | Pixel in der Tonne |
| W2\_AGOR\_NAR\_0500 | – | Aus der Tonne dringt Geschimpfe, dann Gelächter, dann Geschimpfe. Nach einer Weile kommt Pixel heraus, mit sehr hoch getragenem Kopf. | Animation, Zeitraffer |
| W2\_AGOR\_PIX\_0510 | Pixel | Ich habe zwei Dinge gelernt. // Erstens: „Du redest wie einer, der sich selbst zuhört, weil es sonst keiner tut.“ // Zweitens: „Deine Toga hat mehr Falten als dein Argument.“ Ich bin bereit für alles. | Konter 6 und 7 ins Notizbuch |
| W2\_AGOR\_MAX\_0520 | Max | Ein Kater kommt aus einer Tonne und ist noch arroganter als vorher. Ich wusste nicht, dass das geht. |  |
| W2\_AGOR\_PHI\_0530 | Philosoph | Die Katze versteht mehr als du! Die Katze versteht mehr als Cicero! Und jetzt: aus der Sonne! | nach 0520 |
| W2\_AGOR\_MAX\_0540 | Max | Die Dose in die Tonne werfen? Dann hab ich eine Tonne mit Dose. Und einen Philosophen mit Beule. | Thunfischdose auf Tonne |
| W2\_AGOR\_MAX\_0550 | Max | Ich pass nicht in die Tonne. Und ich will auch nicht. Ich bin das Gegenteil von einem Philosophen: Ich wohne auf einem Sofa. | Benutzen: Tonne mit Max |
| W2\_AGOR\_MAX\_0560 | Max | Ich kann nicht auf die Säule. Ich kann nicht mal auf die Sprossenwand. | Benutzen: Säule mit Max |
| W2\_AGOR\_MAX\_0570 | Max | Ins Heu springen? Von wo? Ich steh schon unten. | Benutzen: Heuhaufen |
| W2\_AGOR\_MAX\_0580 | Max | Cicero einen Kaugummi geben? Dann redet er mit vollem Mund. Das wäre tatsächlich leiser. Aber nein. | Kaugummi auf Cicero |
| W2\_AGOR\_MAX\_0590 | Max | Dem Musiker die Dose hinstellen? Er würde reinsingen. Und die Dose würde weich. | Thunfischdose auf Straßenmusiker |

## 18. Agora: Rätsel 6, das Zeichen der Sandale und die Feigen

Nach Tag 1 hängt eine von Hermes' Sandalen oben auf der Säule mit dem Adler. Die Menge hält sie für ein heiliges Zeichen. Rätsel 6 ist freiwillig; die Feigen verbessern nur den Speerwurf am Finaltag. Pixel holt sie als Spielfigur herunter, Max zieht sie an, Brian hängt ihm sein Schild um, die Menge schenkt ihm einen Feigensetzling. Der reift auf der Fähre nach Syrakus zum Baum; die gepflückten Feigen bestechen die Fächerwedler.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_SAND\_MAX\_0010 | Max | Da oben hängt eine Sandale. Meine. Also Hermes'. Auf dem Adler. Der Adler sieht nicht glücklich aus. | Ansehen: Sandale auf der Säule |
| W2\_SAND\_MAX\_0015 | Max | Der Adler hält die Sandale fest wie ein Pfand. Ich brauche einen Plan. Oder eine Leiter. | Ansehen: Sandale auf der Säule, zweites Mal |
| W2\_SAND\_TOU\_0020 | Tourist | Die Sandale! Ein Zeichen! Folgt der Sandale! | Menge, beim Betreten nach Tag 1 |
| W2\_SAND\_GRI\_0030 | Grieche | Nein, der Schuh! Folgt dem Schuh! Es ist ein Schuh! | zweite Stimme |
| W2\_SAND\_TOU\_0040 | Tourist | Es ist eine Sandale! Ketzer! |  |
| W2\_SAND\_PIX\_0050 | Pixel | Sie streiten über das Wort für Schuh. Ich habe Menschen noch nie so sehr verstanden wie jetzt. |  |
| W2\_SAND\_BRI\_0060 | Brian | Ich bin nicht der Messias. Ich sag's seit Jahren. Niemand hört zu. | Reden: Brian, vor der Sandale |
| W2\_SAND\_MAX\_0070 | Max | Wer sagt denn, dass du es bist? | Option Brian |
| W2\_SAND\_BRI\_0080 | Brian | Alle. Weil ich mal einen Kiesel fallen gelassen hab. Seitdem ist jeder Kiesel heilig. Ich wollte eigentlich nur ans Meer. |  |
| W2\_SAND\_MAX\_0090 | Max | Was würde dich erlösen? | Option Brian (bleibt) |
| W2\_SAND\_BRI\_0100 | Brian | Ein neuer Messias. Irgendwer. Mit irgendwas. Dann fahr ich in den Urlaub. Ich hab seit zwölf Jahren gepackt. | Hinweis Rätsel 6 |
| W2\_SAND\_MAX\_0110 | Max | Viel Glück. | Option Brian, beendet das Gespräch |
| W2\_SAND\_BRI\_0120 | Brian | Danke. Das sagt sonst nie jemand. Sie wollen immer, dass ich es ihnen bringe. |  |
| W2\_SAND\_PIX\_0130 | Pixel | Eine Säule. Hoch. Glatt. Oben ein Adler aus Stein und ein Schuh. // Ich mache das nur, weil ich es kann. // Und weil du es nicht kannst. | Spielfigur Pixel: Säule benutzen |
| W2\_SAND\_NAR\_0140 | – | Pixel klettert, springt, hängt kurz am Adler, angelt die Sandale mit der Pfote und lässt sie fallen. Sie landet vor Max' Füßen. Pixel landet im Heu. | Animation |
| W2\_SAND\_PIX\_0150 | Pixel | Rein zufällig. Im Heu. Ich bleibe kurz liegen. Aus Prinzip. |  |
| W2\_SAND\_MAX\_0160 | Max | Sandale an. Jetzt bin ich ein Zeichen. | Sandale auf Max |
| W2\_SAND\_TOU\_0170 | Tourist | Er trägt die Sandale! Er ist es! Der Messias! | Menge kniet |
| W2\_SAND\_MAX\_0180 | Max | Ich bin nicht der Messias. |  |
| W2\_SAND\_GRI\_0190 | Grieche | Nur der wahre Messias würde das leugnen! |  |
| W2\_SAND\_MAX\_0200 | Max | Okay, dann bin ich's. |  |
| W2\_SAND\_TOU\_0210 | Tourist | Er hat es zugegeben! Noch heiliger! |  |
| W2\_SAND\_PIX\_0220 | Pixel | Du kannst nicht gewinnen. Ich kenne das. Von mir. Ich bin die Katze, die man nicht gewinnen kann. |  |
| W2\_SAND\_BRI\_0230 | Brian | Endlich. Hier. Das Schild. Es ist jetzt deins. Ich fahr ans Meer. Ruf nicht an. Es gibt kein Telefon. Gut so. | hängt Max das Schild um, geht |
| W2\_SAND\_MAX\_0240 | Max | Ein Holzschild: „Ich bin nicht der Messias.“ Auf der Rückseite: „Doch.“ Brian hatte Humor. Irgendwann. | Ansehen: Brians Schild im Inventar |
| W2\_SAND\_MAX\_0245 | Max | Messias auf der einen Seite, kein Messias auf der anderen. Ein Schild für jede Laune. | Ansehen: Brians Schild im Inventar, zweites Mal |
| W2\_SAND\_NAR\_0250 | – | Die Menge drängt heran: ein Krug, ein Hut, ein Sack Oliven. Und ein kleiner Feigensetzling im Topf, den ein Kind Max in die Hand drückt. | Geschenke; Feigensetzling ins Inventar |
| W2\_SAND\_MAX\_0260 | Max | Ein Feigensetzling. Im Topf. Zwei Blätter. In zwanzig Jahren vielleicht ein Snack. | Ansehen: Feigensetzling; Sanduhr-Symbol im Inventar |
| W2\_SAND\_MAX\_0265 | Max | Zwei Blätter. Ich zähle nochmal. Immer noch zwei. Wachstum braucht Zeit. Oder einen Fluss. | Ansehen: Feigensetzling, zweites Mal; Sanduhr-Symbol im Inventar |
| W2\_SAND\_PIX\_0270 | Pixel | Zwanzig Jahre. Oder eine Fährfahrt. Du hast die Tafel gelesen. Ich habe gesehen, wie du sie gelesen hast. | nach 0260; Hinweis |
| W2\_SAND\_FAW\_0280 | Fächerwedler | Ein Setzling? Wir wollen Feigen. Reife. Pralle. Keine Hoffnung im Topf. | Feigensetzling auf Fächerwedler |
| W2\_SAND\_MAX\_0290 | Max | Ein ausgewachsener Feigenbaum in einem Blumentopf. Voller Früchte. Ich hab ihn seit zwei Minuten. | Ansehen: Feigenbaum im Inventar |
| W2\_SAND\_MAX\_0295 | Max | Ein ganzer Baum in meinem Inventar. Pixel hat schon geguckt, ob man draufklettern kann. | Ansehen: Feigenbaum im Inventar, zweites Mal |
| W2\_SAND\_MAX\_0300 | Max | Ich pflücke. Was ich selbst pflücke, bleibt, wie es ist. Steht auf der Tafel. Jetzt steht es auch in meinem Notizbuch. | Benutzen: Feigenbaum im Inventar; gepflückte Feigen ohne Sanduhr; Notizbuch Seite 2 |
| W2\_SAND\_PIX\_0310 | Pixel | Obst mit Ablaufdatum. Wie im echten Leben, nur rückwärts. | nach 0300 |
| W2\_SAND\_MAX\_0320 | Max | Frische Feigen. Lila, prall, klebrig. Der Weg zum gleichmäßigen Wind. | Ansehen: gepflückte Feigen |
| W2\_SAND\_MAX\_0325 | Max | Die Feigen kleben mir an den Fingern. Ich riech jetzt wie ein Obststand. | Ansehen: gepflückte Feigen, zweites Mal |
| W2\_SAND\_MAX\_0330 | Max | Hier. Frische Feigen. Für gleichmäßigen Wind. | gepflückte Feigen auf Fächerwedler im Thronsaal |
| W2\_SAND\_FAW\_0340 | Fächerwedler | Feigen! Frische! Wir wedeln, wie du willst. Links, rechts, gleichmäßig, im Takt. Wir wedeln sogar nachts. | nimmt die Feigen; Rätsel 6 gelöst |
| W2\_SAND\_PIX\_0350 | Pixel | Zwei erwachsene Männer, bestochen mit Obst. Und ich bekomme nicht mal eine. Nicht mal eine halbe. |  |
| W2\_SAND\_MAX\_0360 | Max | Ein Feigenkern. Ich bin zu weit gefahren. In die falsche Richtung. Der Baum ist jetzt ein Gedanke. | Ansehen: Feigenkern im Inventar |
| W2\_SAND\_MAX\_0365 | Max | Ein Kern. Ein ganzer Baum, zusammengefaltet in einen Krümel. Zeit ist ein schlechter Gärtner. | Ansehen: Feigenkern im Inventar, zweites Mal |
| W2\_SAND\_FAW\_0370 | Fächerwedler | Ein Kern. Du gibst uns einen Kern. Wir wedeln dafür genau einmal. So. Fertig. | Feigenkern auf Fächerwedler |
| W2\_SAND\_MAX\_0380 | Max | Den ganzen Baum abgeben? Dann wedeln sie damit. Das wäre auch Wind. Aber nicht der richtige. | Feigenbaum auf Fächerwedler |
| W2\_SAND\_MAX\_0390 | Max | Den Setzling in den Nil pflanzen? Dann steht er in hundert Jahren hier. Ich hab keine hundert Jahre. Ich hab eine Fähre. | Feigensetzling auf Schilf oder Erde |

## 19. Olympia, Stadion: Ansehen und Leonidas

Laufbahn, Sandgrube, Kampfrichterzelt, Zuschauerränge, im Hintergrund der Glockenturm. Leonidas trainiert und brüllt. An den Wettkampftagen sitzt Ramses mit Hofstaat und Fächerwedlern auf den Rängen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_STAD\_MAX\_0010 | Max | Sport. Freiwillig. Die spinnen, die Griechen. | erstes Betreten |
| W2\_STAD\_MAX\_0020 | Max | Eine Laufbahn aus Sand. Sie führt von hier nach da. Mehr passiert nicht. Angeblich ist das aufregend. | Ansehen: Laufbahn |
| W2\_STAD\_MAX\_0025 | Max | Ich seh die Bahn entlang. Am Ende steht ein Ziel. Am Anfang stehe ich. Dazwischen liegt Schmerz. | Ansehen: Laufbahn, zweites Mal |
| W2\_STAD\_MAX\_0030 | Max | Eine Sandgrube mit Mauer. Hier wird gerungen. Mit Armen. Oder mit Wörtern, hab ich gehört. | Ansehen: Sandgrube |
| W2\_STAD\_MAX\_0035 | Max | Im Sand sind Abdrücke von Rücken. Viele Rücken. Ich fühl mit jedem einzelnen. | Ansehen: Sandgrube, zweites Mal |
| W2\_STAD\_MAX\_0040 | Max | Ein weißes Zelt für die Kampfrichter. Innen Schatten, außen Mittag. Die haben den besten Job hier. | Ansehen: Kampfrichterzelt |
| W2\_STAD\_PIX\_0045 | Pixel | Ein Zelt mit Schatten. Ich beantrage dort einen Platz. Als Kampfrichter für Nickerchen. | Ansehen: Kampfrichterzelt, zweites Mal |
| W2\_STAD\_MAX\_0050 | Max | Steinränge voller Leute. Sie jubeln, bevor etwas passiert. Wie eine Lachkonserve, nur mit Sonnenbrand. | Ansehen: Zuschauerränge |
| W2\_STAD\_PIX\_0060 | Pixel | Steinstufen in der Sonne. Warm, breit, hart. Sieben Punkte. Ich verteile gerade sehr großzügig Punkte. | Ansehen: Zuschauerränge, zweites Mal |
| W2\_STAD\_MAX\_0070 | Max | Ein weißer Glockenturm, weit hinten. Kerzengerade. Noch. | Ansehen: Glockenturm, vor dem Finaltag |
| W2\_STAD\_MAX\_0075 | Max | Der Turm steht kerzengerade. Ich hab das Gefühl, der wird später mal berühmt. Aus den falschen Gründen. | Ansehen: Glockenturm, vor dem Finaltag, zweites Mal |
| W2\_STAD\_MAX\_0080 | Max | Der Turm steht schief. Das war der Teller. Ich hoffe, niemand hat es gesehen. Alle haben es gesehen. | Ansehen: Glockenturm, nach dem Finaltag |
| W2\_STAD\_MAX\_0085 | Max | Er neigt sich ein bisschen mehr, wenn ich hinschaue. Ich schaue nicht mehr hin. | Ansehen: Glockenturm, nach dem Finaltag, zweites Mal |
| W2\_STAD\_MAX\_0090 | Max | Eine Steintafel mit Siegern. Lauter Namen mit „-os“. Ich hätte keine Chance. | Ansehen: Siegerliste |
| W2\_STAD\_PIX\_0100 | Pixel | Maxos. Klingt nach einem Reinigungsmittel. Passt zu dir: nie benutzt. | Ansehen: Siegerliste, zweites Mal |
| W2\_STAD\_MAX\_0110 | Max | Eine Startlinie im Sand. Davor steht man, dahinter rennt man. Ich bevorzuge davor. | Ansehen: Startlinie |
| W2\_STAD\_MAX\_0115 | Max | Die Linie ist gerade gezogen. Wer immer das war, hatte mehr Ehrgeiz als die Läufer. | Ansehen: Startlinie, zweites Mal |
| W2\_STAD\_MAX\_0120 | Max | Ein Mann mit Helm, Trainingsanzug und Trillerpfeife. Er brüllt. Ohne Grund. Er brüllt einfach so vor sich hin. | Ansehen: Leonidas |
| W2\_STAD\_MAX\_0125 | Max | Er brüllt, auch wenn keiner was gefragt hat. Ich wette, er hat zu Hause einen Lieblingsbrunnen, in den er Leute schubst. | Ansehen: Leonidas, zweites Mal |
| W2\_STAD\_LEO\_0130 | Leonidas | WER BIST DU? | Reden: Leonidas, Einstieg |
| W2\_STAD\_MAX\_0140 | Max | Max. Ich trete an. |  |
| W2\_STAD\_LEO\_0150 | Leonidas | DU? GEGEN MICH? DAS IST OLYMPIA! | tritt gegen nichts |
| W2\_STAD\_MAX\_0160 | Max | Warum brüllst du? | Option Leonidas |
| W2\_STAD\_LEO\_0170 | Leonidas | ICH BRÜLLE NICHT! DAS IST MEINE ZIMMERLAUTSTÄRKE! |  |
| W2\_STAD\_MAX\_0180 | Max | Was ist deine beste Disziplin? | Option Leonidas |
| W2\_STAD\_LEO\_0190 | Leonidas | ALLE! LAUF! SPRUNG! SPEER! DISKUS! UND DAS MIT DEN WORTEN! DA BRÜLLE ICH AM LAUTESTEN! |  |
| W2\_STAD\_MAX\_0200 | Max | Wo isst du eigentlich zu Mittag? | Option Leonidas |
| W2\_STAD\_LEO\_0210 | Leonidas | AM RAND DER LAUFBAHN! TELLER AUF DEM SCHOß! NIEMAND WAGT SICH IN MEINE NÄHE! | Vorbereitung Speer-Pointe |
| W2\_STAD\_MAX\_0220 | Max | Bis zum Wettkampf. | Option Leonidas, beendet das Gespräch |
| W2\_STAD\_LEO\_0230 | Leonidas | HEUTE ABEND SPEISEN WIR … ZU HAUSE! MEINE MUTTER KOCHT! |  |
| W2\_STAD\_PIX\_0240 | Pixel | Er brüllt, und ich höre trotzdem nicht zu. Das ist meine Superkraft. | nach jedem Gespräch mit Leonidas, zufällig |
| W2\_STAD\_MAX\_0250 | Max | Eine kleine Schildkröte mit Stirnband. Sie sieht entschlossen aus. Entschlossener als ich je war. | Ansehen: Schildkröte |
| W2\_STAD\_MAX\_0255 | Max | Die Schildkröte hat Vorsprung. Ein Grieche hat mal ausgerechnet, dass man sie dann nie einholt. Ich glaub's sofort. Ich hab sie laufen sehen. | Ansehen: Schildkröte, zweites Mal |
| W2\_STAD\_MAX\_0260 | Max | Ramses auf der Tribüne, zwischen zwei Fächerwedlern. Er sieht von einem zum anderen. Er kann sich nicht entscheiden, wem er zujubelt. | Ansehen: Ramses im Stadion; Wettkampftage |
| W2\_STAD\_MAX\_0265 | Max | Er klatscht für beide Seiten. Gleichzeitig. Das ist sein politisches Programm. | Ansehen: Ramses im Stadion, zweites Mal; Wettkampftage |
| W2\_STAD\_MAX\_0270 | Max | Der Hebel steht neben der Sandgrube. Archimedes hat ihn hergeschleppt. Allein. Mit einem Hebel. | Ansehen: Wurfhebel im Stadion; nach dem Training |
| W2\_STAD\_MAX\_0275 | Max | Der Hebel wirft Schatten bis zur Tribüne. Archimedes steht daneben und guckt stolz. Er hat allen Grund. | Ansehen: Wurfhebel im Stadion, zweites Mal; nach dem Training |
| W2\_STAD\_MAX\_0280 | Max | Ohne Startpass lassen die mich nicht mal an die Linie. In Olympia ist das Amt stärker als jeder Athlet. | Benutzen: Startlinie ohne Startpass |
| W2\_STAD\_MAX\_0290 | Max | Startpass hab ich. Aber fünf Disziplinen ohne Trainer? Ich brauch jemanden, der mir das Fliegen beibringt. | Benutzen: Startlinie mit Startpass, vor Rätsel 5 |
| W2\_STAD\_MAX\_0300 | Max | Kein Diskus, keine Konter, kein Gegner. Das wäre kein Finale, das wäre Herumstehen in Sandalen. | Benutzen: Startlinie nach Tag 1, solange der Finaltag noch nicht bereit ist |
| W2\_STAD\_MAX\_0310 | Max | Alles bereit. Nur die Wedler wedeln, wie sie wollen. Mit frischen Feigen wedeln sie gerade. Ich kann aber auch einfach werfen. | Benutzen: Startlinie, erstes Mal, wenn der Finaltag bereit ist und die Wedler nicht bestochen sind; beim nächsten Benutzen beginnt der Finaltag |

## 20. Stadion, Tag 1: Der Sandalen-Lauf

Szene. Beginnt, sobald Startpass (3) und Hebel (5) vorhanden sind und Max die Startlinie benutzt; die Sandalen hat Max dann schon von Hermes. Vorher antworten W2\_STAD\_MAX\_0280 und 0290. Mit geölten Sandalen halten die Riemen bis ins Ziel; ohne Öl fliegen die Sandalen am Start davon, und Max läuft barfuß als Letzter, kommt aber weiter. In jedem Fall landet eine Sandale auf der Agora.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_TAG1\_RAM\_0010 | Ramses | Die Spiele sind eröffnet! Oder beginnen! Oder … fangt einfach an! | von der Tribüne, beide Zepter hoch |
| W2\_TAG1\_LEO\_0020 | Leonidas | MARATHON! | rennt los, biegt sofort falsch ab, Richtung Agora |
| W2\_TAG1\_MAX\_0030 | Max | Das ist der Stadionlauf. Einmal gerade aus. |  |
| W2\_TAG1\_LEO\_0040 | Leonidas | MARATHOOON! | von weit weg, falsche Richtung |
| W2\_TAG1\_MAX\_0050 | Max | Die Sandalen ziehen. Sie wollen nach vorn. Zum ersten Mal will etwas an mir nach vorn. | mit Öl; Max läuft, Sandalen flattern |
| W2\_TAG1\_NAR\_0060 | – | Max läuft. Die Schildkröte neben der Bahn läuft auch. Die Schildkröte überholt ihn. Kurz. Dann er sie. Dann sie ihn. | Animation Schildkröte |
| W2\_TAG1\_PIX\_0070 | Pixel | Eine Schildkröte überholt ihn. Ein Philosoph hat mal bewiesen, dass das unmöglich ist. Der Philosoph hat Max nicht gekannt. | von der Tribüne |
| W2\_TAG1\_NAR\_0080 | – | Max überquert die Ziellinie. Die Riemen reißen, die Sandalen schießen in den Himmel. Eine fliegt Richtung Agora. | mit Öl; Max läuft stolz ein |
| W2\_TAG1\_MAX\_0090 | Max | Ziel. Erster. Vor einer Schildkröte und einem Mann, der gerade in Syrakus ankommt. Ich nehme es. | mit Öl |
| W2\_TAG1\_NAR\_0100 | – | Die Riemen reißen am Start. Die Sandalen heben ab, eine Richtung Agora, eine Richtung Sonne. Max steht barfuß im heißen Sand. | ohne Öl |
| W2\_TAG1\_MAX\_0110 | Max | Heiß. Heiß. Heiß. Heiß. | ohne Öl; rennt barfuß auf Zehenspitzen |
| W2\_TAG1\_PIX\_0120 | Pixel | Er läuft wie ich auf dem Herd. Nur dass ich daraus gelernt habe. | ohne Öl |
| W2\_TAG1\_MAX\_0130 | Max | Letzter. Hinter der Schildkröte. Aber im Ziel. Das zählt. Sagt Ramses. Hoffentlich. | ohne Öl |
| W2\_TAG1\_RAM\_0140 | Ramses | Er ist angekommen! Das zählt! Oder? Es zählt. Ich habe entschieden, dass es zählt. Weiter! | in jedem Fall; Lauf abgeschlossen |
| W2\_TAG1\_LEO\_0150 | Leonidas | WO IST DAS ZIEL? ICH BIN IN SYRAKUS! HIER IST EIN NASSER MANN! | aus dem Off |
| W2\_TAG1\_MAX\_0160 | Max | Hermes' Sandalen sind weg. Eine Richtung Agora. Ich glaube, da werde ich sie wiedersehen. | nach dem Lauf; Hinweis Rätsel 6 |
| W2\_TAG1\_PIX\_0170 | Pixel | Jetzt der Hebel. Du setzt dich hin, ich lege nichts hinein, du fliegst nirgendwohin. So stelle ich mir Sport vor. | Übergang zum Hebel-Minispiel |

## 21. Stadion, Tag 1: Minispiel Archimedes' Hebel

Max legt Gegenstände aus dem Inventar als Gegengewichte in den Korb und stellt den Winkel ein. Jeder Gegenstand hat ein Gewicht und einen Kommentar von Archimedes. Zu leicht: Sandgrube. Zu schwer: Fluss oder Ciceros Rede. Nach zwei Fehlversuchen bietet Ramses an, großzügig zu werten. Kein Zeitdruck. Jede Kommentarzeile gehört zu einem Gegenstand, den Max an Tag 1 haben kann (Bildtafel, Grabstein und Feigenbaum hat er dann nicht mehr oder noch nicht, deshalb gibt es für sie keine Zeile); Gegenstände ohne eigene Zeile gehen ohne Kommentar in den Korb.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_HEBL\_ARC\_0010 | Archimedes | Gewicht hinten, Junge vorne, Winkel dazwischen. Drei Dinge. Mehr ist Physik nie. | Start des Minispiels |
| W2\_HEBL\_ARC\_0020 | Archimedes | Eine leere Dose. Sie wiegt so viel wie die Idee einer Dose. | Thunfischdose in den Korb |
| W2\_HEBL\_PIX\_0030 | Pixel | Die Dose kommt da sofort wieder raus. Sie ist kein Gewicht. Sie ist ein Erbstück. | nach 0020 |
| W2\_HEBL\_ARC\_0040 | Archimedes | Ein Buch mit Notizen. Wissen wiegt leider nichts. Das habe ich oft bedauert. | Notizbuch in den Korb |
| W2\_HEBL\_ARC\_0050 | Archimedes | Ein Kochlöffel. Holz. Leicht. Klebt. Warum klebt er? | Kochlöffel in den Korb |
| W2\_HEBL\_ARC\_0060 | Archimedes | Ein schwarzer Stein mit Riss. Drei Prozent von irgendwas. Drei Prozent wiegen nichts. | Handy in den Korb |
| W2\_HEBL\_ARC\_0070 | Archimedes | Ein Stift. Blau. Wiegt eine Feder. Eine blaue Feder. | Kugelschreiber in den Korb |
| W2\_HEBL\_ARC\_0080 | Archimedes | Kaugummi. Das wiegt weniger als der Gedanke daran. | Kaugummi in den Korb |
| W2\_HEBL\_ARC\_0090 | Archimedes | Eine Wachstafel mit Siegel. Leicht. Aber amtlich. Amtlich ist kein Gewicht. | Startpass in den Korb |
| W2\_HEBL\_ARC\_0100 | Archimedes | Ein Krug Öl! Gut! Schwer! Rutschig! Nicht kippen, sonst fliegt der Korb statt du. | Olivenöl in den Korb |
| W2\_HEBL\_ARC\_0110 | Archimedes | Meine Waage. Sie wiegt sich selbst. Das ist philosophisch, aber nicht viel. | Waage in den Korb |
| W2\_HEBL\_ARC\_0120 | Archimedes | Ein Fass mit einem Tintenfisch. Wiegt wenig, spritzt viel. Der Korb wird blau, du fliegst trotzdem nicht. | Tintenfass in den Korb |
| W2\_HEBL\_ARC\_0130 | Archimedes | Ein voller Krug. Sehr schwer. Was ist drin? Egal. Masse ist Masse. | Traubensaft, Wein oder Essig in den Korb |
| W2\_HEBL\_ARC\_0140 | Archimedes | Ein goldener Teller. Mittel. Rund. Rund ist gut für nichts auf einem Hebel. | Pharaonenteller in den Korb |
| W2\_HEBL\_ARC\_0150 | Archimedes | Ein Brief mit Fettfleck. „Fein wie Staub.“ Dann wiegt er auch so viel. Der Fleck vielleicht ein Gramm. | Opas Papyrus in den Korb |
| W2\_HEBL\_ARC\_0160 | Archimedes | Mein Messbecher. Leer wiegt er nichts. Voll wiegt er Wasser, und Wasser fliegt allein. Zu leicht. | Messbecher in den Korb |
| W2\_HEBL\_ARC\_0170 | Archimedes | Mein Spiegel. Bronze. Brauchbar. Aber wenn die Sonne reinfällt, zündest du den Korb an. | Brennspiegel in den Korb |
| W2\_HEBL\_ARC\_0180 | Archimedes | Eine Socke. Sie wiegt nichts und sortiert dabei meinen Korb. Faszinierend. Nutzlos. | Sortierende Socke in den Korb |
| W2\_HEBL\_ARC\_0190 | Archimedes | Der Kater! Endlich ein Gewicht mit Charakter. Wie ein Umzugskarton. Ein voller. Genau richtig. | Pixel in den Korb |
| W2\_HEBL\_PIX\_0200 | Pixel | Ich bin kein Gewicht. Ich bin ein Gott. // Aber wenn es sein muss, dann bin ich ein sehr schweres, sehr beleidigtes Gewicht. // Niemand erwähnt den Umzugskarton je wieder. | nach 0190 |
| W2\_HEBL\_NAR\_0210 | – | Der Hebel klappt müde hoch. Max rutscht einen Meter und landet in der Sandgrube. | zu leicht |
| W2\_HEBL\_MAX\_0220 | Max | Sandgrube. Direkt vor dem Hebel. Das war kein Sprung. Das war ein Umfallen mit Anlauf. | zu leicht |
| W2\_HEBL\_NAR\_0230 | – | Der Hebel schnellt hoch. Max fliegt über die Ränge, über die Olivenbäume, und landet mit einem Platsch im Fluss. Der Fährmann treibt vorbei. | zu schwer, erste Variante |
| W2\_HEBL\_MAX\_0240 | Max | Nass. Ich bin im Fluss gelandet. Der Fährmann hat gewinkt. Glaub ich. | zu schwer, Variante Fluss |
| W2\_HEBL\_NAR\_0250 | – | Max fliegt über die Mauer, über den Markt und landet mitten auf dem Rednerpult. Cicero redet weiter. | zu schwer, Variante Agora |
| W2\_HEBL\_CIC\_0260 | Cicero | … und wie dieser junge Mann, der soeben vom Himmel fiel, beweist. Das Schicksal unterbricht den Redner, aber niemals die Rede. | zu schwer, Variante Agora |
| W2\_HEBL\_RAM\_0270 | Ramses | Zweimal daneben. Ich könnte großzügig werten. Soll ich? Ich soll. Oder du versuchst es noch mal. Beides. Eins davon. | nach zwei Fehlversuchen |
| W2\_HEBL\_MAX\_0280 | Max | Großzügig. Nehm ich. | Option: großzügig werten lassen |
| W2\_HEBL\_MAX\_0290 | Max | Noch mal. Der Winkel war fast richtig. | Option: weiter versuchen |
| W2\_HEBL\_NAR\_0300 | – | Der Hebel schnellt hoch. Max fliegt in einem sauberen Bogen über die Sandgrube und landet hinter der Markierung. Auf den Füßen. Fast. | richtiges Gewicht |
| W2\_HEBL\_ARC\_0310 | Archimedes | HEUREKA! Also: gut gemacht. Ich sage das sonst nur zu mir. | Sieg im Hebel |
| W2\_HEBL\_RAM\_0320 | Ramses | Weit! Sehr weit! Mein Volk … sieht interessiert aus. Fast. Tag eins ist vorbei. Morgen das Finale. Oder übermorgen. Morgen. | Tag 1 beendet |
| W2\_HEBL\_LEO\_0330 | Leonidas | ICH WÄRE WEITER GESPRUNGEN! WENN ICH DA GEWESEN WÄRE! ICH WAR IN SYRAKUS! | zurück, außer Atem |

## 22. Stadion und überall: Rätsel 7, der Diskus-Diebstahl

Gleich nach Tag 1 fehlt der offizielle Diskus. Vier Verdächtige, je zwei Aussagen, jeder lügt genau einmal: Leonidas und Hermes im Stadion, Tiro auf der Agora, die Sphinx in Ägypten. Pixel darf an allen schnuppern; bei Tiro lügt seine Nase wegen der Tintenfisch-Tinte. Lösung: Tiro. Ersatz: Pharaonenteller (Thronsaal), Schallplatte (Opa hat sie in die Reisetasche geschmuggelt) oder Wurfscheibe (steckt seit dem Schulausflug in Max' Bauchtasche); die beiden letzten findet Max beim Durchsuchen seiner Taschen nach Tag 1 (Schallplatte in der Reisetasche, Wurfscheibe in der Bauchtasche).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_DISK\_LEO\_0010 | Leonidas | DER DISKUS IST WEG! DER OFFIZIELLE! GESTOHLEN! HEUTE NACHT! IM STADION! | Szene nach Tag 1 |
| W2\_DISK\_MAX\_0020 | Max | Ein Diebstahl. Vier Leute waren in der Nähe. Jeder sagt zwei Dinge. Das kenne ich. Jeder lügt genau einmal, und am Ende war's der Butler. | Notizbuch Seite 1: Diskus finden |
| W2\_DISK\_PIX\_0030 | Pixel | Es gibt keinen Butler. Es gibt mich. Ich schnuppere. Meine Nase ist unbestechlich. Meistens. |  |
| W2\_DISK\_MAX\_0040 | Max | Wo warst du heute Nacht? | Verhör Leonidas |
| W2\_DISK\_LEO\_0050 | Leonidas | HERMES WAR ES! | Aussage 1; Notizbuch |
| W2\_DISK\_LEO\_0060 | Leonidas | ICH WAR ES NICHT! | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0070 | Pixel | Riecht nach Schweiß, Bronze und Mutters Eintopf. Unschuldig. Laut, aber unschuldig. | Pixel schnuppert an Leonidas |
| W2\_DISK\_MAX\_0080 | Max | Hermes, wo warst du heute Nacht? | Verhör Hermes |
| W2\_DISK\_HER\_0090 | Hermes | Tiro war heute Nacht im Stadion! Hab ich gesehen! Ich war gerade zu spät irgendwo! | Aussage 1; Notizbuch |
| W2\_DISK\_HER\_0100 | Hermes | Und die Sphinx war es! Ganz sicher! Oder ziemlich sicher. Ich muss los! | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0110 | Pixel | Riecht nach Wind, Post und Eile. Der hat keine Zeit zum Stehlen. Der hat nicht mal Zeit zum Riechen. | Pixel schnuppert an Hermes |
| W2\_DISK\_MAX\_0120 | Max | Tiro, wo warst du heute Nacht? | Verhör Tiro, Agora |
| W2\_DISK\_TIR\_0130 | Tiro | Ich war heute Nacht nicht im Stadion. | räuspert sich; Aussage 1; Notizbuch |
| W2\_DISK\_TIR\_0140 | Tiro | Hermes war es nicht. Der war zu spät. Wie immer. | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0150 | Pixel | Riecht nach … Tintenfisch. Eindeutig Tintenfisch. Also: ganz sicher unschuldig. Meine Nase ist sich sicher. Sehr sicher. | Pixel schnuppert an Tiro; Nase lügt bei Fischgeruch |
| W2\_DISK\_MAX\_0160 | Max | Deine Nase war in Schwurbelstein auch sehr sicher. Bei den Flaschen. | nach 0150 |
| W2\_DISK\_MAX\_0170 | Max | Sphinx, wo warst du heute Nacht? | Verhör Sphinx, Ägypten |
| W2\_DISK\_SPH\_0180 | Sphinx | Ich war es nicht. Ich war hier. Ich bin immer hier. Ich bin aus Stein. | Aussage 1; Notizbuch |
| W2\_DISK\_SPH\_0190 | Sphinx | Leonidas war es. Er brüllt zu laut, um unschuldig zu sein. | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0200 | Pixel | Riecht nach Sand, Stein und dreihundert Jahren Nachdenken. Unschuldig. Und unbeweglich. | Pixel schnuppert an Sphinx |
| W2\_DISK\_MAX\_0210 | Max | Du warst es. | Anklage Leonidas |
| W2\_DISK\_LEO\_0220 | Leonidas | ICH? DANN HÄTTE ICH ZWEIMAL GELOGEN! ICH LÜGE NUR EINMAL! AUS PRINZIP! | Fehlversuch |
| W2\_DISK\_MAX\_0230 | Max | Du warst es. | Anklage Hermes |
| W2\_DISK\_HER\_0240 | Hermes | Wenn ich es war, hab ich zweimal die Wahrheit gesagt. Das schaff ich nicht mal mit Anlauf. | Fehlversuch |
| W2\_DISK\_MAX\_0250 | Max | Du warst es. | Anklage Sphinx |
| W2\_DISK\_SPH\_0260 | Sphinx | Dann hätte ich zweimal gelogen. Ich lüge einmal. Wie alle hier. Das ist das einzige Rätsel, das ich noch kann. | Fehlversuch |
| W2\_DISK\_MAX\_0270 | Max | Du warst es. Du warst im Stadion. Hermes war es nicht. Eine Wahrheit, eine Lüge. Und Pixels Nase hat bei dir gelogen, weil du nach Fisch riechst. | Anklage Tiro |
| W2\_DISK\_TIR\_0280 | Tiro | Ich … ja. Ich brauchte eine Unterlage. Eine runde, glatte. Für die Kurzschrift. Er redet so schnell. Hier. Nimm ihn. Er hat Kratzer. Das sind Abkürzungen. | gibt den Diskus; Rätsel 7 gelöst |
| W2\_DISK\_PIX\_0290 | Pixel | Tintenfisch. Ich wusste es. Ich habe es gewusst und das Gegenteil gesagt. Das ist Instinkt. Falscher Instinkt, aber Instinkt. |  |
| W2\_DISK\_MAX\_0300 | Max | Der echte Diskus. Bronze, mit Kurzschrift verkratzt. Er fliegt am besten, sagt jeder. Ich glaube jedem. | Ansehen: Diskus |
| W2\_DISK\_MAX\_0305 | Max | Ich wieg ihn in der Hand. Schwer. Er will fliegen. Ich will, dass er das ohne mich tut. | Ansehen: Diskus, zweites Mal |
| W2\_DISK\_MAX\_0310 | Max | Eine Schallplatte. „Schlager für Erfinder, Folge 3.“ Opa hat sie in die Tasche geschmuggelt. Sie ist rund. Sie fliegt. Mehr muss sie nicht. | Ansehen: Schallplatte |
| W2\_DISK\_PIX\_0320 | Pixel | Folge 3. Er hat alle drei. Er singt mit. Ich habe es überlebt. Ich weiß nicht, wie. | Ansehen: Schallplatte, zweites Mal |
| W2\_DISK\_MAX\_0330 | Max | Eine Wurfscheibe. Bunt, Plastik, seit dem Schulausflug in der Bauchtasche. Sie fliegt besser als ich. | Ansehen: Wurfscheibe |
| W2\_DISK\_MAX\_0335 | Max | Auf der Unterseite steht noch „Klassenfahrt 7b“. Die Antike wird das nie entziffern. | Ansehen: Wurfscheibe, zweites Mal |
| W2\_DISK\_MAX\_0340 | Max | Ich geb auf. Ich nehm einen Ersatz. Teller, Platte oder Scheibe. Hauptsache rund. | Option bei Leonidas: Ersatz wählen |

## 23. Grabhügel Syrakus und Nil-Delta: Rätsel 10, ein Grab für Archimedes

Cicero tritt erst an, wenn er das Grab gefunden hat: in Syrakus, genau 137 Jahre alt. Max holt den Entwurf bei Archimedes (Abschnitt 13), lässt den Stein im Nil-Delta meißeln und fährt ihn den ganzen Fluss hinunter: 112 + 25 = 137. Ohne Entwurf liefern die Arbeiter einen zerbröselten Haufen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_GRAB\_MAX\_0010 | Max | Ein Grabstein für Archimedes. Mit Entwurf. | Entwurf auf Steinmetz, Nil-Delta |
| W2\_GRAB\_STM\_0020 | Steinmetz | Kugel im Zylinder. Schön. Sauber. Zwei Drittel, steht hier. Wir hauen das. Komm in einer Stunde wieder. Also: jetzt. Wir sind schnell. | gibt den frischen Grabstein |
| W2\_GRAB\_MAX\_0030 | Max | Ein Grabstein für Archimedes. Einfach … irgendwas. | Steinmetz bitten ohne Entwurf |
| W2\_GRAB\_STM\_0040 | Steinmetz | Irgendwas. Gut. Irgendwas können wir. | hämmert; gibt einen zerbröselten Haufen |
| W2\_GRAB\_MAX\_0050 | Max | Ein Haufen Steine. In einem Beutel. Das ist kein Grabstein, das ist Grabschotter. | Ansehen: zerbröselter Haufen |
| W2\_GRAB\_MAX\_0055 | Max | Ich schüttle den Beutel. Er klappert. Grabsteine sollten nicht klappern. | Ansehen: zerbröselter Haufen, zweites Mal |
| W2\_GRAB\_PIX\_0060 | Pixel | Du hast „irgendwas“ bestellt. Du hast „irgendwas“ bekommen. Die Antike liefert genau. | nach 0050 |
| W2\_GRAB\_STM\_0070 | Steinmetz | Noch mal? Mit Plan diesmal? Pläne sind gut. Außer verkehrt herum. | zweite Bestellung |
| W2\_GRAB\_MAX\_0080 | Max | Ein frischer Grabstein. Weiß, scharfkantig, Kugel im Zylinder. Sieht aus wie gestern gemacht. Weil: gestern. | Ansehen: frischer Grabstein; Sanduhr-Symbol |
| W2\_GRAB\_MAX\_0085 | Max | Die Kanten sind so scharf, dass ich mir fast in den Respekt schneide. | Ansehen: frischer Grabstein, zweites Mal; Sanduhr-Symbol |
| W2\_GRAB\_MAX\_0090 | Max | Hundertsiebenunddreißig Jahre. Ägypten bis Olympia hundertzwölf, Olympia bis Syrakus fünfundzwanzig. Das ist Mathe, die ich sogar freiwillig mache. | Notizbuch, nach Steinmetz-Gespräch und Tafel |
| W2\_GRAB\_MAX\_0100 | Max | Ein überwucherter Hügel. Dornen, Brombeeren, alte Steine. Hier liegen Leute, die niemand mehr sucht. Außer Cicero. | erstes Betreten Grabhügel |
| W2\_GRAB\_MAX\_0110 | Max | Brombeeren. Reif. Ich pflücke keine. Letzte Woche hab ich mich an einer Tiefkühlpizza geschnitten. | Ansehen: Brombeeren |
| W2\_GRAB\_PIX\_0115 | Pixel | Brombeeren. Für dich verboten, für mich uninteressant. Ein seltener Moment der Einigkeit. | Ansehen: Brombeeren, zweites Mal |
| W2\_GRAB\_MAX\_0120 | Max | Alte Grabsteine, halb im Grün. Namen, die keiner mehr liest. Wie Profile, die seit Jahren offline sind. | Ansehen: alte Grabsteine |
| W2\_GRAB\_MAX\_0125 | Max | Auf einem steht nur „War nett“. Kürzer kann man ein Leben nicht zusammenfassen. | Ansehen: alte Grabsteine, zweites Mal |
| W2\_GRAB\_MAX\_0130 | Max | Ein leerer Steinsockel in einer Lichtung. Fehlt nur noch jemand, der drauf liegt. Also sein Stein. | Ansehen: leerer Sockel |
| W2\_GRAB\_MAX\_0135 | Max | Ein Sockel ohne Stein. Wie ein Sofa ohne Opa. Irgendwas fehlt sehr deutlich. | Ansehen: leerer Sockel, zweites Mal |
| W2\_GRAB\_MAX\_0140 | Max | Zypressen. Sie zeigen nach oben. Als wüssten sie etwas. | Ansehen: Zypressen |
| W2\_GRAB\_MAX\_0145 | Max | Die Zypressen wiegen sich. Alle gleichzeitig. Wie bei einem Konzert für Bäume. | Ansehen: Zypressen, zweites Mal |
| W2\_GRAB\_PIX\_0150 | Pixel | Zikaden. Sie machen den ganzen Tag dasselbe Geräusch und werden dafür gelobt. Ich mache den ganzen Tag dasselbe Geräusch und werde ermahnt. | Ansehen: Zikaden oder Zuruf Grabhügel |
| W2\_GRAB\_PIX\_0155 | Pixel | Die Zikaden haben gerade eine Pause gemacht. Eine Sekunde. Das war das Schönste an Syrakus. | Ansehen: Zikaden oder Zuruf Grabhügel, zweites Mal |
| W2\_GRAB\_MAX\_0160 | Max | Der Stein auf den Sockel. Verwittert, moosig, hundertsiebenunddreißig Jahre alt. Frisch aus dem Nil. | verwitterter Grabstein auf Sockel |
| W2\_GRAB\_CIC\_0170 | Cicero | Dort! Zwischen den Dornen! Kugel und Zylinder! Das Grab des Archimedes! Ich habe es gefunden! Ich! Nach hundertsiebenunddreißig Jahren! | stürmt herbei |
| W2\_GRAB\_ARC\_0180 | Archimedes | Er hat ihn gefunden. Meinen Stein. Den ich entworfen habe. Den du bestellt hast. Ich stehe daneben. Ich lebe. | neben Max, trocken |
| W2\_GRAB\_CIC\_0190 | Cicero | Und ein Pilger, der dem großen Toten ähnlich sieht! Wie passend! Wie ergreifend! Ich muss eine Rede halten. Nein: Ich muss ringen. Morgen. Im Stadion. Ich trete an! | Rätsel 10 gelöst |
| W2\_GRAB\_PIX\_0200 | Pixel | Der Mann hat ein Grab gefunden, dessen Bewohner ihm gerade zusieht. // Das ist das Traurigste, was ich je gesehen habe. // Nach einem leeren Napf. |  |
| W2\_GRAB\_ARC\_0210 | Archimedes | Zwei Drittel. Er hat nicht mal die zwei Drittel gelobt. Hundertsiebenunddreißig Jahre, und keiner lobt die zwei Drittel. | nach 0200 |
| W2\_GRAB\_CIC\_0240 | Cicero | Ein Haufen. Das ist entweder sehr alt oder sehr schlecht gemacht. Ich wette auf Letzteres. | zerbröselter Haufen auf Sockel |
| W2\_GRAB\_MAX\_0250 | Max | Den Entwurf auf den Sockel legen? Dann hat Cicero ein Grab aus Papier. Er würde es finden und vorlesen. | Entwurf auf Sockel |
| W2\_GRAB\_MAX\_0260 | Max | Pixel auf den Sockel? Er würde sich hinlegen und als Statue durchgehen. Ehrlich gesagt: gute Statue. | Pixel auf Sockel |

## 24. Stadion, Finaltag: Ventilator-Speer und Nasen-Diskus

Szenen. Der Finaltag beginnt, sobald Diskus oder Ersatz (7), Konter (9) und Grab (10) erledigt sind und Max die Startlinie benutzt; vorher antworten W2\_STAD\_MAX\_0300 und 0310. Die Feigen (6) sind freiwillig: Mit bestochenen Wedlern trifft der Speer den Olivenkranz (0030, 0040, 0060), ohne Bestechung landet er im Kampfrichterzelt (0070, 0080). Gezählt wird in beiden Fällen. Vor dem Diskus zeigt eine Gag-Folge Max' Probewürfe mit Leonidas' aufgespießtem Mittagsteller.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_FINA\_RAM\_0010 | Ramses | Das Finale! Speer, Diskus, Ringen! In dieser Reihenfolge! Oder einer anderen! In dieser! | Tribüne |
| W2\_FINA\_MAX\_0020 | Max | Ein Speer. Lang, spitz, schwer. Wie ein Selfie-Stick für Leute, die niemanden mehr sehen wollen. | nimmt den Speer |
| W2\_FINA\_FAW\_0030 | Fächerwedler | Gleichmäßig! Links, rechts, links, rechts! Für die Feigen! | bestochen; wedeln im Takt |
| W2\_FINA\_NAR\_0040 | – | Max wirft. Der Speer steigt, der Wind trägt ihn. Er spießt unterwegs Leonidas' Mittagsteller auf und bleibt genau im Olivenkranz stecken. | bestochen |
| W2\_FINA\_LEO\_0050 | Leonidas | MEIN EINTOPF! | in jedem Fall |
| W2\_FINA\_MAX\_0060 | Max | Mitten im Kranz. Mit Beilage. | bestochen |
| W2\_FINA\_NAR\_0070 | – | Max wirft. Der Wind dreht, dreht wieder, der Speer spießt Leonidas' Teller auf und verschwindet im Kampfrichterzelt. Das Zelt sackt zusammen. | nicht bestochen |
| W2\_FINA\_MAX\_0080 | Max | Das Zelt. Mit Kampfrichtern. Die werten jetzt bestimmt sehr neutral. | nicht bestochen |
| W2\_FINA\_PIX\_0090 | Pixel | Du hast das Mittagessen eines Spartaners aufgespießt. Das ist die mutigste Tat deines Lebens, und sie war ein Versehen. | nach dem Speer |
| W2\_FINA\_RAM\_0100 | Ramses | Gezählt! Irgendwie! Weiter zum Diskus! | nach dem Speer |
| W2\_FINA\_MAX\_0110 | Max | Erst mal ein paar Probewürfe. Zum Warmwerden. Was soll schon passieren. | Diskus-Szene beginnt |
| W2\_FINA\_NAR\_0120 | – | Wurf eins: Der Teller segelt über den Fluss. In der Ferne fällt der Sphinx die Nase ab. Wurf zwei: Über die Agora. Die Marmorfrau verliert beide Arme. Wurf drei: Der Glockenturm hinten neigt sich. Und bleibt so. | Gag-Folge, drei Schnitte; geworfen wird Leonidas' Mittagsteller vom Speer |
| W2\_FINA\_MAX\_0130 | Max | Das wird noch Probleme machen. Hab ich ja gesagt. | nach 0120 |
| W2\_FINA\_PIX\_0140 | Pixel | Drei Würfe, drei Wahrzeichen. Die Menschheit wird Jahrtausende brauchen, um das zu erklären. Ich sage nichts. Ich war nicht dabei. |  |
| W2\_FINA\_MAX\_0150 | Max | Und jetzt der echte. Womit werfe ich? | Auswahl Wurfgegenstand |
| W2\_FINA\_NAR\_0160 | – | Der Diskus fliegt. Weit. Sehr weit. Die Kurzschrift-Kratzer pfeifen im Wind. | echter Diskus oder Wurfscheibe: weitester Wurf |
| W2\_FINA\_NAR\_0170 | – | Der Teller fliegt. Ordentlich. Glänzend. Landet mit einem Pling. | Pharaonenteller: mittlerer Wurf |
| W2\_FINA\_NAR\_0180 | – | Die Schallplatte fliegt. Eiert. Landet. Spielt beim Aufprall kurz einen Schlager. | Schallplatte: kurzer Wurf |
| W2\_FINA\_RAM\_0190 | Ramses | Weit genug! Oder nicht! Weit genug. Jetzt das Ringen. Gegen Cicero. Mit Worten. Ich habe Angst. Für dich. Und vor Worten. | nach dem Diskus |

## 25. Stadion, Finaltag: Minispiel Rede-Ringen gegen Cicero

In der Sandgrube. Cicero wirft fünf Beleidigungen; jede braucht einen passenden Konter aus dem Notizbuch (Rolle: Konter 1 bis 3, Griechen: 4 und 5, Tonne: 6 und 7). Jeder Treffer schiebt Cicero einen Schritt aus der Grube. Manche Beleidigungen haben zwei passende Konter, deshalb wird es mit mehr Kontern leichter. Falscher Konter: Cicero hält eine dreistündige Rede im Zeitraffer, Pixel und Publikum schlafen ein, Cicero rückt einen Schritt zurück. Nach zwei Fehlversuchen bietet Ramses großzügige Wertung an. Kein Zeitdruck.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_RING\_CIC\_0010 | Cicero | In die Grube, Junge. Hier ringt man nicht mit Armen. Hier ringt man mit dem Wort. Und das Wort gehört mir. | Start des Minispiels |
| W2\_RING\_MAX\_0020 | Max | Wortgefecht. Wie ein Kommentarbereich, nur mit Sand. |  |
| W2\_RING\_MAX\_0030 | Max | Konter eins: „Wer so lange redet, hat Angst vor dem Ende des Satzes.“ Zwei: „Ein Argument, so dünn, dass man den Redner dahinter sieht.“ Drei: „Du zitierst dich selbst. Der Einzige, der dir noch zuhört.“ | Ansehen: Schriftrolle, zweites Mal (nach W2\_SPHX\_MAX\_0540); liest die Konter vor |
| W2\_RING\_CIC\_0040 | Cicero | Du bist ein Junge in einem Sack, und der Sack hat mehr Form als dein Verstand! | Beleidigung 1; passend: Konter 7 oder 2 |
| W2\_RING\_CIC\_0050 | Cicero | Was hat deine Welt je hervorgebracht? Nichts! Wir Römer brachten Ordnung, Recht und Größe! | Beleidigung 2; passend: Konter 4 |
| W2\_RING\_CIC\_0060 | Cicero | Wie ich schon in meiner dritten Rede sagte, und in der vierten, und in der fünften. Und wie ich selbst stets wiederhole … | Beleidigung 3; passend: Konter 3 oder 6 |
| W2\_RING\_CIC\_0070 | Cicero | Und so stehe ich hier vor euch und sage euch und sage es wieder // und werde es weiter sagen ohne Pause ohne Punkt ohne Komma bis … | Beleidigung 4; passend: Konter 5 |
| W2\_RING\_CIC\_0080 | Cicero | Ich werde reden, bis die Sonne untergeht und wieder aufgeht und wieder untergeht! | Beleidigung 5; passend: Konter 1 |
| W2\_RING\_MAX\_0090 | Max | Deine Toga hat mehr Falten als dein Argument. | Konter 7 auf Beleidigung 1; Treffer |
| W2\_RING\_MAX\_0100 | Max | Ein Argument, so dünn, dass man den Redner dahinter sieht. | Konter 2 auf Beleidigung 1; Treffer |
| W2\_RING\_MAX\_0110 | Max | Außer den Straßen, dem Aquädukt und den Thermen? | Konter 4 auf Beleidigung 2; Treffer |
| W2\_RING\_CIC\_0120 | Cicero | Die Straßen … gut, die Straßen. Und das Aquädukt. Aber sonst? Sonst! | nach 0110, stolpert einen Schritt |
| W2\_RING\_MAX\_0130 | Max | Du zitierst dich selbst. Der Einzige, der dir noch zuhört. | Konter 3 auf Beleidigung 3; Treffer |
| W2\_RING\_MAX\_0140 | Max | Du redest wie einer, der sich selbst zuhört, weil es sonst keiner tut. | Konter 6 auf Beleidigung 3; Treffer |
| W2\_RING\_MAX\_0150 | Max | Holst du auch mal Luft? | Konter 5 auf Beleidigung 4; Treffer |
| W2\_RING\_CIC\_0160 | Cicero | Ich … | holt Luft, verliert den Faden, stolpert eine Linie nach rechts |
| W2\_RING\_MAX\_0170 | Max | Wer so lange redet, hat Angst vor dem Ende des Satzes. | Konter 1 auf Beleidigung 5; Treffer |
| W2\_RING\_CIC\_0180 | Cicero | Falsch! Daneben! Und dafür hörst du jetzt meine Rede über die Pflicht. Alle drei Teile. | falscher Konter; Zeitraffer beginnt |
| W2\_RING\_NAR\_0190 | – | Die Sonne wandert. Cicero redet. Die Zuschauer kippen einer nach dem anderen um. Pixel schnarcht mit Blase. Ramses sieht von einem Zepter zum anderen und schläft dazwischen ein. | Zeitraffer, drei Stunden |
| W2\_RING\_PIX\_0200 | Pixel | Ich habe geträumt. Von Stille. Es war der schönste Traum seit dem Lachs. | nach dem Zeitraffer |
| W2\_RING\_MAX\_0210 | Max | Drei Stunden. Das war eine Folge ohne Vorspultaste. Noch mal. | nach dem Zeitraffer |
| W2\_RING\_RAM\_0220 | Ramses | Zweimal eingeschlafen. Ich könnte großzügig werten. Bevor er die vierte Rede anfängt. Soll ich? Ich soll. Oder du machst weiter. | nach zwei Fehlversuchen |
| W2\_RING\_NAR\_0230 | – | Cicero steht mit dem Rücken an der Mauer, dann auf der Mauer, dann dahinter. Er redet noch, aber außerhalb der Grube. | fünfter Treffer |
| W2\_RING\_CIC\_0240 | Cicero | Ich bin … außerhalb. Ich habe verloren. Ich werde eine Rede darüber halten. Eine lange. Nicht hier. Ich verspreche es. Hier nicht. | Sieg |
| W2\_RING\_MAX\_0250 | Max | Ich hab gegen den berühmtesten Redner der Welt gewonnen. Mit Sätzen aus einer Tonne. |  |
| W2\_RING\_PIX\_0260 | Pixel | Zwei der Sätze waren von mir. Also habe ich gewonnen. Du warst nur die Stimme. Ich war der Inhalt. |  |
| W2\_RING\_RAM\_0270 | Ramses | Der Kranz! Nimm den Kranz! Den Olivenkranz! Du hast gewonnen! Ich habe gewonnen! Ägypten hat … jemand hat gewonnen! | übergibt den Olivenkranz |
| W2\_RING\_MAX\_0280 | Max | Die Goldmedaille. Sie ist aus Blättern. Grüne. Ich hab fünf Sportarten für einen Salat gewonnen. | Ansehen: Olivenkranz |
| W2\_RING\_MAX\_0285 | Max | Der Kranz piekst. Ich trag ihn trotzdem. Sieger leiden still. | Ansehen: Olivenkranz, zweites Mal |
| W2\_RING\_PIX\_0290 | Pixel | Alle fünf. Ohne Gnade vom Pharao. // Ich bin beeindruckt. // Das sage ich einmal. Es wird nie wieder vorkommen. | nur bei Bestleistung in allen fünf Disziplinen (ohne großzügige Wertung, Lauf mit Öl, echter Diskus oder Wurfscheibe; siehe raetsel/welt-2.md); Errungenschaft Fünfkampf |

## 26. Stadion, Parade-Schmuck: Rätsel 11, die Siegesparade und der Abschluss

Ramses' Volk ist unbeeindruckt und will Brot und Spiele. Die Parade findet in Olympia statt. Der Zeremonienmeister nennt grob die Reihenfolge; Max ordnet im Paraden-Plan vier Felder: Hermes (Einladungen), Archimedes' Brennspiegel (Mittagssonne, Feld 2), Ciceros Rede (wenn alle da sind), Pixel als Gott (Höhepunkt). Ramses verlangt Wein: der Essig aus Syrakus wird auf der Fahrt nach Olympia wieder Wein. Wer das Handy noch hat, macht mit der Taschenlampe den Abschluss. Danach übergibt Ramses den Sack; die Welt endet, bevor Max den Dachboden erreicht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_PARA\_VOL\_0010 | Ägypter | Ein Kranz. Aus Blättern. Wir sind hundertzwölf Jahre gefahren für einen Kranz aus Blättern. | Szene nach dem Sieg, Volk auf den Rängen |
| W2\_PARA\_VOL\_0020 | Ägypter | Brot! Und Spiele! Wir hatten Spiele. Wo ist das Brot? |  |
| W2\_PARA\_RAM\_0030 | Ramses | Eine Parade! Hier! Jetzt! In Olympia, damit die ganze Welt zusieht! Zeremonienmeister, erklär es ihm. Ich kann das nicht. Ich kann nichts erklären. | Entschluss |
| W2\_PARA\_ZER\_0040 | Zeremonienmeister | Eine Parade hat eine Ordnung. Einladungen vor den Gästen. Spiegel brauchen Mittagssonne. Reden brauchen Zuhörer. Und ein Gott kommt zuletzt. Immer. Hier, der Plan. Vier Felder. Füll sie. | gibt den Paraden-Plan; Notizbuch Seite 2 |
| W2\_PARA\_MAX\_0050 | Max | Vier Felder, vier Leute, eine Sonne über dem zweiten. Ein Stundenplan für eine Party. | Ansehen: Paraden-Plan |
| W2\_PARA\_MAX\_0055 | Max | Die Sonne über Feld zwei ist mit Goldfarbe gemalt. Da hat jemand Prioritäten. | Ansehen: Paraden-Plan, zweites Mal |
| W2\_PARA\_HER\_0060 | Hermes | Einladungen? Ich! Das kann ich! Zu spät, aber ich kann es! | Hermes in Feld 1 |
| W2\_PARA\_HER\_0070 | Hermes | Die Einladungen nach den Gästen? Dann lade ich Leute ein, die schon da sind. Das ist nicht mal für mich zu spät genug. | Hermes in Feld 2 bis 4 |
| W2\_PARA\_ARC\_0080 | Archimedes | Mittagssonne! Spiegel! Lichtstrahl über das ganze Stadion! Niemand verbrennt! Fast niemand! | Brennspiegel in Feld 2 |
| W2\_PARA\_ARC\_0090 | Archimedes | Ohne Mittagssonne ist mein Spiegel ein Teller. Ein glänzender Teller. Ich habe genug Teller gesehen heute. | Brennspiegel in Feld 1, 3 oder 4 |
| W2\_PARA\_CIC\_0100 | Cicero | Eine Rede vor vollen Rängen. Kurz. Ich verspreche: kurz. Also kürzer. | Cicero in Feld 3 |
| W2\_PARA\_CIC\_0110 | Cicero | Eine Rede vor leeren Rängen? Das habe ich hundert Mal gemacht. Es zählt nicht. Das weiß ich inzwischen. | Cicero in Feld 1 oder 2 |
| W2\_PARA\_CIC\_0120 | Cicero | Nach dem Gott? Niemand redet nach einem Gott. Nicht mal ich. Besonders nicht ich. | Cicero in Feld 4 |
| W2\_PARA\_PIX\_0130 | Pixel | Ich erscheine zum Höhepunkt. Auf einem Kissen. Schwebend. Alles andere ist eine Beleidigung, und ich kenne jetzt viele. | Pixel in Feld 4 |
| W2\_PARA\_PIX\_0140 | Pixel | Ich komme nicht zuerst. Götter kommen nicht zuerst. Götter lassen warten. Frag irgendeinen Gott. Frag mich. | Pixel in Feld 1 bis 3 |
| W2\_PARA\_ZER\_0150 | Zeremonienmeister | Einladung, Licht, Rede, Gott. Das ist eine Parade. Jetzt fehlt nur noch der Wein. Der Pharao besteht darauf. | richtige Reihenfolge; Plan gelöst |
| W2\_PARA\_RAM\_0160 | Ramses | Wein! Ohne Wein keine Parade! Ich habe Traubensaft. Niemand feiert mit Traubensaft. Nicht mal ich. Und ich feiere mit allem. | Wein verlangt |
| W2\_PARA\_MAX\_0170 | Max | Hier. Wein. War mal Essig. War davor mal Wein. Lange Geschichte, kurze Fährfahrt. | Wein auf Ramses |
| W2\_PARA\_RAM\_0180 | Ramses | Wein! Echter! Also … er riecht ein bisschen nach Werkstatt. Egal. Wein! | nimmt den Krug; Wein erledigt |
| W2\_PARA\_RAM\_0190 | Ramses | Essig. Du gibst mir Essig. Zu einer Parade. Das ist … ich weiß nicht, was das ist. Doch: falsch. | Essig auf Ramses |
| W2\_PARA\_RAM\_0200 | Ramses | Traubensaft. Hab ich selbst. Zwei Krüge. Ich trinke ihn nicht. Niemand trinkt ihn. Er ist einfach da. | Traubensaft auf Ramses |
| W2\_PARA\_PIX\_0210 | Pixel | Er will Wein, er hat Saft, und in der Werkstatt steht Essig. Du musst nur in die richtige Richtung fahren. Du hast die Sanduhr gesehen. Ich habe gesehen, wie du sie gesehen hast. | Hinweis nach 0190 oder 0200 |
| W2\_PARA\_NAR\_0220 | – | Hermes rennt, das Volk strömt, der Spiegel wirft Mittagslicht über das Stadion. Cicero hält eine kurze Rede, und dann schwebt Pixel auf seinem Kissen über die Laufbahn. Alle verneigen sich. Auch die Ägypter. | Parade läuft |
| W2\_PARA\_VOL\_0230 | Ägypter | Ein Gott! Ein Katzengott! Und Wein! Und … Brot? Egal! Wein! | Volk jubelt |
| W2\_PARA\_MAX\_0240 | Max | Und zum Schluss: drei Prozent Akku. Taschenlampe an. | Handy benutzen während der Parade; nur wenn noch vorhanden |
| W2\_PARA\_NAR\_0250 | – | Ein weißer Lichtkegel streift über die Ränge. Das Handy piept einmal und wird schwarz. Die Menge hält den Atem an. | Handy verbraucht |
| W2\_PARA\_PIX\_0260 | Pixel | Du hast alle drei Wunderdinge behalten. Bis zum Schluss. // Das ist entweder Sparsamkeit oder Faulheit. // Bei dir ist das dasselbe. Trotzdem: gut gemacht. | Bonus-Gag: Handy, Kaugummi und Kugelschreiber noch vorhanden |
| W2\_PARA\_RAM\_0270 | Ramses | Mein Volk jubelt. Mir! Also dem Kater. Also dir. Egal. Hier. Der Goldene Sack Pharaonenkorn. Ich habe mich entschieden. Zum ersten Mal. Es fühlt sich … gut an. Glaube ich. | übergibt den Sack; Ziel der Welt |
| W2\_PARA\_MAX\_0280 | Max | Ein goldener Sack. Schwer. Weich. Mit Siegel. Der zweite von vier. Und ich hab dafür Sport gemacht. Freiwillig. Teilweise. | Ansehen: Goldener Sack Pharaonenkorn |
| W2\_PARA\_MAX\_0285 | Max | Ich klopf drauf. Er knistert. Pharaonenkorn klingt genau wie normales Korn. Nur teurer. | Ansehen: Goldener Sack Pharaonenkorn, zweites Mal |
| W2\_PARA\_PIX\_0290 | Pixel | Vierhundertfünf. Klingt nach einer Backzahl. | Ansehen: Siegel auf dem Sack |
| W2\_PARA\_PIX\_0295 | Pixel | Ich hab die Zahl nochmal gelesen. Vierhundertfünf. Sie klingt immer noch nach Ofen. | Ansehen: Siegel auf dem Sack, zweites Mal |
| W2\_PARA\_PIX\_0300 | Pixel | Riecht nach Bäckerei. | Pixel schnuppert am Sack; Max überhört es |
| W2\_PARA\_MAX\_0310 | Max | Was? |  |
| W2\_PARA\_PIX\_0320 | Pixel | Nichts. Fahr. |  |
| W2\_PARA\_PIX\_0330 | Pixel | Keine einzige Lösung von mir. Die ganze Welt lang. // Ich bin … beeindruckt. // Streich das aus dem Protokoll. | nur wenn Hinweisstufe 3 in Welt 2 nie genutzt |
| W2\_PARA\_HER\_0340 | Hermes | Wartet! Noch ein Brief! Von „Konrad, Dachboden“! Nein, Moment. Das ist derselbe. Er ist in einem anderen Beutel. | letzter Auftritt, rennt weg |
| W2\_PARA\_ARC\_0350 | Archimedes | Komm wieder, Schüler. Ich habe noch einen Hebel. Einen größeren. Für die Welt. | Abschied |
| W2\_PARA\_MAX\_0360 | Max | Zurück zur Fähre. Zum Werbeblock. Zum Sofa. Zum Sack. Also zu Opa. | Weltende; Übergang zum Zwischenspiel |

## 27. Inventar: Wunderdinge und Pixel auf Mensch

Ansehen-Zeilen der Wunderdinge liefern die Rätsel-Bausteine für die Sphinx (Abschnitt 12). Danach die Pixel-auf-Mensch-Zeilen: Pixel wird als Gegenstand auf eine Figur gezogen, eine Zeile je Figur; Figuren mit eigener Pixel-Zeile in früheren Abschnitten (Hofkater, Sphinx, Beamter 1, Lehmofen) stehen dort.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_INV\_MAX\_0010 | Max | Drei Prozent. Es klingelt noch, wenn jemand mich will. Will nur keiner. Kein Netz seit viertausend Jahren. | Ansehen: Handy, erstes Mal; Baustein „klingelt“ |
| W2\_INV\_MAX\_0020 | Max | Taschenlampe geht noch. Einmal. Kurz. Danach ist es ein sehr teurer Stein. | Ansehen: Handy, zweites Mal; Baustein „leuchtet kurz“ |
| W2\_INV\_MAX\_0030 | Max | Ein Kaugummi. Man kaut und kaut, und er wird nie alle. Die Antike hält das für ein Wunder. Ich auch, ehrlich gesagt. | Ansehen: Kaugummi, erstes Mal; Baustein „wird nie alle“ |
| W2\_INV\_MAX\_0040 | Max | Am Ende klebt er unter irgendeinem Tisch. Das ist sein Schicksal. Auch hier. | Ansehen: Kaugummi, zweites Mal; Baustein „klebt unter jedem Tisch“ |
| W2\_INV\_MAX\_0050 | Max | Ein Kugelschreiber. Schreibt ohne Tintenfass. Hier ist das Zauberei. Zu Hause ist das Schule. | Ansehen: Kugelschreiber, erstes Mal; Baustein „schreibt ohne Tintenfass“ |
| W2\_INV\_MAX\_0060 | Max | Klick. Klick. Klick. Ich klicke, wenn ich nervös bin. Ich bin seit Welt eins nervös. | Ansehen: Kugelschreiber, zweites Mal; Baustein „klickt, wenn man nervös ist“ |
| W2\_INV\_PIX\_0070 | Pixel | Ein Pharao mit zwei Zeptern. Ich habe vier Pfoten und entscheide trotzdem schneller. Zum Beispiel jetzt: Ich gehe. | Pixel auf Ramses |
| W2\_INV\_PIX\_0080 | Pixel | Ein Krokodil, das sich vor mir verneigt. Das erste vernünftige Reptil, das ich kenne. Das einzige, das ich kenne. | Pixel auf Sobek |
| W2\_INV\_PIX\_0090 | Pixel | Der Fährmann riecht nach Fluss und Kleingeld. Er darf mich fahren. Er darf mich nicht anfassen. | Pixel auf Fährmann |
| W2\_INV\_PIX\_0100 | Pixel | Sie hat Mehl an den Händen und Datteln in der Schürze. Ich würde bei ihr einziehen. Heute. | Pixel auf Nebet |
| W2\_INV\_PIX\_0110 | Pixel | Ein nasser Mann mit Zirkel. Er rechnet, wie viel Wasser ich verdränge. Ich verdränge ihn. Jetzt. | Pixel auf Archimedes |
| W2\_INV\_PIX\_0120 | Pixel | Er redet. Ich schlafe. Das ist unsere Beziehung, und sie funktioniert. | Pixel auf Cicero |
| W2\_INV\_PIX\_0130 | Pixel | Er brüllt. Ich lege die Ohren an. Er brüllt lauter. Ich gewinne trotzdem. Ich habe zwei Ohren, er nur eine Lautstärke. | Pixel auf Leonidas |
| W2\_INV\_PIX\_0140 | Pixel | Flügel an den Füßen und immer zu spät. Ich habe keine Flügel und bin immer pünktlich. Zum Essen. | Pixel auf Hermes |
| W2\_INV\_PIX\_0150 | Pixel | Er riecht nach Tinte und schlechtem Gewissen. Also: nach Tinte. Nur nach Tinte. Ganz sicher. | Pixel auf Tiro |
| W2\_INV\_PIX\_0160 | Pixel | Ein müder Mann, der nicht angebetet werden will. Ich verstehe ihn nicht. Ich respektiere ihn auch nicht. Aber ich verstehe ihn nicht. | Pixel auf Brian |
| W2\_INV\_PIX\_0170 | Pixel | Er hält einen Stempel wie ein Zepter. Ich habe heute zwei Zepter gesehen. Seins ist das ehrlichere. | Pixel auf Beamter 2 |
| W2\_INV\_PIX\_0180 | Pixel | Er riecht nach Staub und Pyramide. Er würde mich in Stein hauen, wenn ich stillhalte. Ich halte nie still. Aus Prinzip. | Pixel auf Steinmetz |
| W2\_INV\_PIX\_0190 | Pixel | Palmwedel, Schweiß, Feigenhunger. Zwei Männer, die den ganzen Tag für andere Wind machen. Wie ein Hund. Wie zwei Hunde. | Pixel auf Fächerwedler |
| W2\_INV\_PIX\_0200 | Pixel | Federn auf dem Kopf und ein Plan in der Hand. Er organisiert. Ich würde organisiert werden, wenn es ein Kissen gäbe. | Pixel auf Zeremonienmeister |
| W2\_INV\_PIX\_0210 | Pixel | Er riecht nach Reiseführer und Sonnencreme. Er fotografiert mich mit einer Wachstafel. Ich posiere. Aus Gewohnheit. | Pixel auf Römischer Tourist |

## 27b. Inventar ansehen (INV)

Rechtsklick auf einen Gegenstand in der Inventarleiste. Erstes Mal die erste Zeile, zweites Mal die Zweitzeile, danach der Wiederholungs-Pool (siehe `05-spielsysteme.md`). Gegenstände, die hier fehlen, haben ihre Ansehen-Zeile schon in ihrem Abschnitt oder im Abschnitt, aus dem sie mitreisen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_INV\_MAX\_0310 | Max | Ein leeres Papyrusblatt. Frisch aus dem Nil. Riecht nach Fluss und nach Hausaufgaben, die noch keiner gemacht hat. | Ansehen: Papyrusblatt |
| W2\_INV\_MAX\_0315 | Max | Ich halte es gegen das Licht. Keine geheime Botschaft. Nur Fasern. Ich hatte mehr erwartet. Ich erwarte immer mehr. | Ansehen: Papyrusblatt, zweites Mal |
| W2\_INV\_MAX\_0320 | Max | Der goldene Teller vom Pharao. Pixel sieht ihn an wie einen Napf, der endlich seinen Rang erkannt hat. | Ansehen: Pharaonenteller |
| W2\_INV\_PIX\_0325 | Pixel | Golden, rund, leer. Wenn man mir den hinstellt, bin ich offiziell eine Gottheit. Ich warte nur auf den Anlass. | Ansehen: Pharaonenteller, zweites Mal |
| W2\_INV\_MAX\_0330 | Max | Ein Fladenbrot. Noch warm. Riecht wie die Bäckerei an der Ecke, nur dreitausend Jahre früher. | Ansehen: Brot |
| W2\_INV\_MAX\_0335 | Max | Ich hab kurz überlegt, reinzubeißen. Dann hab ich an Pixels Gesicht gedacht. Ich lass es. | Ansehen: Brot, zweites Mal |
| W2\_INV\_MAX\_0340 | Max | Datteln. Klebrig, süß, runzlig. Wie Rosinen, die sich hochgearbeitet haben. | Ansehen: Datteln |
| W2\_INV\_PIX\_0345 | Pixel | Datteln. Kein Fleisch, kein Fisch. Ich respektiere sie nur als Wurfgeschoss. | Ansehen: Datteln, zweites Mal |
| W2\_INV\_MAX\_0350 | Max | Eine Zwiebel. Sie liegt in meiner Tasche, und mir tränen trotzdem die Augen. Sie hat Fernwirkung. | Ansehen: Zwiebel |
| W2\_INV\_MAX\_0355 | Max | Zwiebeln haben Schichten. Hat mir mal jemand Großes, Grünes erklärt. Er wirkte sehr überzeugt. | Ansehen: Zwiebel, zweites Mal |
| W2\_INV\_MAX\_0360 | Max | Ein Fladen mit Datteln drauf. Halb Pizza, halb Kuchen, ganz Fehler. | Ansehen: Fladen, mit Datteln |
| W2\_INV\_MAX\_0365 | Max | Da fehlt noch was. Etwas, das stinkt und einen zum Weinen bringt. Pixel weiß, was. | Ansehen: Fladen, mit Datteln, zweites Mal |
| W2\_INV\_MAX\_0370 | Max | Ein roher Fladen mit Datteln und Zwiebeln. Sieht aus wie eine Pizza, die sich in der Zeit verlaufen hat. | Ansehen: Fladen, roh |
| W2\_INV\_MAX\_0375 | Max | Roh und weich. Wenn ich den so abgebe, gibt's Ärger. Pixel sagt: erst Kruste, dann Ruhm. | Ansehen: Fladen, roh, zweites Mal |
| W2\_INV\_MAX\_0380 | Max | Dattel-Zwiebel-Fladen mit Kruste. Knackt, wenn ich ihn anfasse. Pixel nennt das Kunst. Ich nenne es Mittagessen. | Ansehen: Fladen, mit Kruste |
| W2\_INV\_PIX\_0385 | Pixel | Diese Kruste. Ich habe sie erfunden. Ich verlange Lizenzgebühren. Zahlbar in Thunfisch. | Ansehen: Fladen, mit Kruste, zweites Mal |
| W2\_INV\_MAX\_0390 | Max | Ein Krug Traubensaft mit Sanduhr-Symbol. Er tickt. Saft sollte nicht ticken. | Ansehen: Traubensaft, Traubensaft |
| W2\_INV\_MAX\_0395 | Max | Der Pharao konnte sich nicht zwischen Saft und Wein entscheiden. Ich halte die Antwort im Krug. Sie ist noch nicht fertig. | Ansehen: Traubensaft, Traubensaft, zweites Mal |
| W2\_INV\_MAX\_0400 | Max | Jetzt ist es Wein. Ich darf den nicht trinken. Ich trag ihn nur. Für die Wissenschaft. | Ansehen: Traubensaft, Wein |
| W2\_INV\_PIX\_0405 | Pixel | Wein. Riecht nach Opas Silvester. Und nach dem Morgen danach. | Ansehen: Traubensaft, Wein, zweites Mal |
| W2\_INV\_MAX\_0410 | Max | Essig. Der Saft ist durch die Zeit gealtert. Wie ein Lehrer nach zwanzig Jahren Pausenaufsicht. | Ansehen: Traubensaft, Essig |
| W2\_INV\_MAX\_0415 | Max | Ich schnupper dran. Meine Nase hat gekündigt. Fristlos. | Ansehen: Traubensaft, Essig, zweites Mal |
| W2\_INV\_MAX\_0420 | Max | Archimedes' Essigkrug. Das saure Gesicht drauf guckt mich an. Ich guck sauer zurück. | Ansehen: Essigkrug, Essig |
| W2\_INV\_MAX\_0425 | Max | Riecht wie eine Pommesbude um Mitternacht. Unverwechselbar. Leider. | Ansehen: Essigkrug, Essig, zweites Mal |
| W2\_INV\_MAX\_0430 | Max | Der Essig ist wieder Wein. Rückwärts gealtert. Das schaffen sonst nur Leute mit sehr teurer Creme. | Ansehen: Essigkrug, Wein |
| W2\_INV\_MAX\_0435 | Max | Das Gesicht auf dem Krug guckt jetzt weniger sauer. Fast versöhnlich. Wein macht milde. | Ansehen: Essigkrug, Wein, zweites Mal |
| W2\_INV\_MAX\_0440 | Max | Aus Essig wurde Saft. Wenn das mit Noten auch ginge, wäre ich Klassenbester. | Ansehen: Essigkrug, Traubensaft |
| W2\_INV\_PIX\_0445 | Pixel | Saft im Essigkrug. Das Gesicht auf dem Krug ist verwirrt. Ich verstehe es gut. | Ansehen: Essigkrug, Traubensaft, zweites Mal |
| W2\_INV\_MAX\_0450 | Max | Ein Tintenfisch in einem Fass. Er guckt beleidigt. Ich hab ihm versprochen, nur ein bisschen Tinte zu nehmen. | Ansehen: Tintenfass |
| W2\_INV\_MAX\_0455 | Max | Er hat mich gerade angespritzt. Jetzt hab ich einen blauen Daumen. Wir sind quitt. | Ansehen: Tintenfass, zweites Mal |
| W2\_INV\_MAX\_0460 | Max | Archimedes' Entwurf. Kugel im Zylinder, zwei Drittel. Er hat sogar die Schatten schraffiert. Für einen Grabstein. | Ansehen: Entwurf |
| W2\_INV\_MAX\_0465 | Max | Unten steht klein: „Störe meine Kreise nicht.“ Er meint das ernst. Er hat Zirkelspuren am Daumen. | Ansehen: Entwurf, zweites Mal |
| W2\_INV\_MAX\_0470 | Max | Der Grabstein ist grau geworden. Wie ein Foto am Kühlschrank, das keiner mehr ansieht. | Ansehen: Grabstein, grau |
| W2\_INV\_MAX\_0475 | Max | Grau, aber noch scharfkantig. Er ist in der Pubertät. Für Steine. | Ansehen: Grabstein, grau, zweites Mal |
| W2\_INV\_MAX\_0480 | Max | Risse, Moos und ein Käfer. Ich trage hundert Jahre Geschichte in meiner Tasche. Sie ist schwer. | Ansehen: Grabstein, verwittert |
| W2\_INV\_PIX\_0485 | Pixel | Der Käfer wohnt jetzt bei dir. Ich habe ihn nicht gefressen. Noch nicht. Er weiß das. | Ansehen: Grabstein, verwittert, zweites Mal |
| W2\_INV\_MAX\_0490 | Max | Ein leeres Formular. Das einzige im ganzen Amt. Es ist so leer, dass es fast schon Möglichkeiten hat. | Ansehen: Leeres Formular |
| W2\_INV\_MAX\_0495 | Max | Oben steht „Antrag auf“. Dann nichts. Ich könnte alles beantragen. Ich beantrage in Gedanken einen Mittagsschlaf. | Ansehen: Leeres Formular, zweites Mal |
| W2\_INV\_MAX\_0500 | Max | Mein Rundschreiben. Blauer Kuli auf Papyrus. Es sieht amtlich aus, wenn man nicht genau hinsieht. Beamte sehen nie genau hin. | Ansehen: Rundschreiben, mit Kugelschreiber |
| W2\_INV\_MAX\_0505 | Max | Passierschein A38. Den gibt es nicht. Ich hab ihn trotzdem vorgeschrieben. So funktioniert Verwaltung. | Ansehen: Rundschreiben, mit Kugelschreiber, zweites Mal |
| W2\_INV\_MAX\_0510 | Max | Das Rundschreiben in Tintenfisch-Tinte. Riecht nach Meer und Amtsstube. Eine gefährliche Mischung. | Ansehen: Rundschreiben, mit Tinte |
| W2\_INV\_MAX\_0515 | Max | Mein Fingerabdruck in der Ecke sieht aus wie ein Siegel. Ich hab gerade aus Versehen etwas beglaubigt. | Ansehen: Rundschreiben, mit Tinte, zweites Mal |
| W2\_INV\_MAX\_0520 | Max | Ein Rundschreiben aus dem Formularberg. Jemand hatte dieselbe Idee wie ich. Er hat nur nie abgegeben. | Ansehen: Rundschreiben, gefunden |
| W2\_INV\_MAX\_0525 | Max | Die Tinte ist verblasst, die Idee nicht. Gute Ideen halten in Ämtern länger als die Leute. | Ansehen: Rundschreiben, gefunden, zweites Mal |
| W2\_INV\_MAX\_0530 | Max | Ein Empfehlungsschreiben der Sphinx. In Rätselform. Ich verstehe es nicht. Das ist wohl der Sinn. | Ansehen: Empfehlungsschreiben |
| W2\_INV\_MAX\_0535 | Max | „Wer dies liest und nicht versteht, stempelt besser.“ Das ist kein Brief. Das ist eine Drohung mit Pfote. | Ansehen: Empfehlungsschreiben, zweites Mal |
| W2\_INV\_MAX\_0540 | Max | Eine geflügelte Sandale. Allein. Sie flattert und sucht ihre Schwester. | Ansehen: Geflügelte Sandale |
| W2\_INV\_PIX\_0545 | Pixel | Eine Sandale mit Flügeln. Sie zuckt. Ich zucke zurück. Unentschieden. | Ansehen: Geflügelte Sandale, zweites Mal |

## 27c. Gespräch erschöpft (ABS)

Ein Klick auf die Figur, wenn im Gesprächsmenü nur noch „Tschüss“ übrig wäre: Das Menü öffnet sich nicht, die Figur sagt abwechselnd eine dieser beiden Zeilen. Kommt ein neues Thema dazu, öffnet sich das Menü wieder (Regel in `05-spielsysteme.md`).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_ABS\_FAE\_0010 | Fährmann | Mehr weiß ich nicht, Junge. Ich weiß nur, wo der Fluss hinfließt. Und wann. Und wer zahlt. | Reden: Fährmann, Gespräch erschöpft |
| W2\_ABS\_FAE\_0020 | Fährmann | Steig ein oder geh. Herumstehen kostet auch einen Obolus. Bei mir schon. | Reden: Fährmann, Gespräch erschöpft |
| W2\_ABS\_STM\_0030 | Steinmetz | Ich hab alles gesagt. Jetzt rede ich nur noch mit dem Stein. Der widerspricht nicht. | Reden: Steinmetz, Gespräch erschöpft |
| W2\_ABS\_STM\_0040 | Steinmetz | Komm wieder, wenn du was zum Meißeln hast. Oder jemanden, der einen Grabstein braucht. Hoffentlich nicht dich. | Reden: Steinmetz, Gespräch erschöpft |
| W2\_ABS\_HER\_0050 | Hermes | Keine Zeit, keine Zeit! Ich hab dir alles gesagt! Glaube ich! Wo war ich? Egal! Weiter! | Reden: Hermes, Gespräch erschöpft |
| W2\_ABS\_HER\_0060 | Hermes | Ich muss los! Termine! Falls du was brauchst: Es ist in einem anderen Büro! | Reden: Hermes, Gespräch erschöpft |
| W2\_ABS\_RAM\_0070 | Ramses | Geh. Nein, bleib. Nein, geh. Wir haben alles besprochen. Glaube ich. Ich habe mich entschieden: Geh. | Reden: Ramses, Gespräch erschöpft |
| W2\_ABS\_RAM\_0080 | Ramses | Ich würde dir gern noch etwas sagen. Aber ich kann mich nicht entscheiden, was. | Reden: Ramses, Gespräch erschöpft |
| W2\_ABS\_SCH\_0090 | Schreiber | Alles, was du gesagt hast, steht hier. Alles, was ich gesagt habe, auch. Die Tafel ist voll. Ich bin es auch. | Reden: Schreiber, Gespräch erschöpft |
| W2\_ABS\_SCH\_0100 | Schreiber | Wenn du noch was willst: Bitte schriftlich. Aber nicht bei mir. Ich hab Feierabend. Seit zehn Jahren. | Reden: Schreiber, Gespräch erschöpft |
| W2\_ABS\_NEB\_0110 | Nebet | Ich hab dir alles erzählt, was in einen Topf passt. Jetzt raus aus meiner Küche, bevor du anbrennst. | Reden: Nebet, Gespräch erschöpft |
| W2\_ABS\_NEB\_0120 | Nebet | Wenn du nicht kochst, stehst du im Weg. Und du kochst nicht. Also. Weg. | Reden: Nebet, Gespräch erschöpft |
| W2\_ABS\_SPH\_0130 | Sphinx | Was hat zwei Beine, keine Fragen mehr und steht trotzdem noch hier? Du. Das war mein erstes Rätsel seit Jahren. Danke. | Reden: Sphinx, Gespräch erschöpft |
| W2\_ABS\_SPH\_0140 | Sphinx | Ich habe dir alles gesagt. In Rätselform wäre es länger. Sei froh. | Reden: Sphinx, Gespräch erschöpft |
| W2\_ABS\_ARC\_0150 | Archimedes | Gib mir einen festen Punkt, und ich rede weiter. Ohne festen Punkt bin ich fertig. Für heute. | Reden: Archimedes, Gespräch erschöpft |
| W2\_ABS\_ARC\_0160 | Archimedes | Störe meine Kreise nicht. Das ist nicht böse gemeint. Es sind nur sehr schöne Kreise. | Reden: Archimedes, Gespräch erschöpft |
| W2\_ABS\_HIE\_0170 | Hieron | Ich habe alles gesagt, was ein König sagen muss. Jetzt warte ich. Das kann ich königlich gut. | Reden: Hieron, Gespräch erschöpft |
| W2\_ABS\_HIE\_0180 | Hieron | Wenn du mich noch mal ansprichst, will ich eine Lösung hören. Oder eine Krone. Am liebsten beides. | Reden: Hieron, Gespräch erschöpft |
| W2\_ABS\_CIC\_0190 | Cicero | Ich könnte dir noch drei Stunden über die Tugend erzählen. Aber dafür brauche ich Zuschauer. Du zählst nur halb. | Reden: Cicero, Gespräch erschöpft |
| W2\_ABS\_CIC\_0200 | Cicero | Wie lange willst du meine Geduld noch missbrauchen? Das ist eine rhetorische Frage. Geh. | Reden: Cicero, Gespräch erschöpft |
| W2\_ABS\_BRI\_0210 | Brian | Ich hab nichts mehr zu sagen. Und wenn du jetzt sagst, das ist ein Zeichen, schrei ich. | Reden: Brian, Gespräch erschöpft |
| W2\_ABS\_BRI\_0220 | Brian | Geh weg. Bitte. Das ist keine Botschaft. Nur eine Bitte. Schreib's nicht auf. | Reden: Brian, Gespräch erschöpft |
| W2\_ABS\_BE1\_0230 | Beamter 1 | Nummer ziehen. Warten. Kommen Sie wieder. Das war alles, was ich sagen darf, und ich hab's gesagt. | Reden: Beamter 1, Gespräch erschöpft |
| W2\_ABS\_BE1\_0240 | Beamter 1 | Mein Schalter ist für Sie jetzt geschlossen. Für alle anderen auch. Er war nie offen. | Reden: Beamter 1, Gespräch erschöpft |
| W2\_ABS\_BE2\_0250 | Beamter 2 | Für weitere Fragen ist ein anderes Amt zuständig. Welches, steht auf einem Formular, das es nicht gibt. | Reden: Beamter 2, Gespräch erschöpft |
| W2\_ABS\_BE2\_0260 | Beamter 2 | Wir sind fertig miteinander. Verwaltungstechnisch. Menschlich waren wir es nie. | Reden: Beamter 2, Gespräch erschöpft |
| W2\_ABS\_LEO\_0270 | Leonidas | ICH HAB ALLES GESAGT! JETZT WIRD TRAINIERT! NICHT GEREDET! | Reden: Leonidas, Gespräch erschöpft |
| W2\_ABS\_LEO\_0280 | Leonidas | DU WILLST NOCH WAS? DAS IST KEIN GESPRÄCH! DAS IST AUFWÄRMEN! LAUF! | Reden: Leonidas, Gespräch erschöpft |

## 28. Zurufe

Pixel kommentiert ungefragt, wenn der Spieler 45 Sekunden nichts tut. Zufällig gezogen, nie zweimal hintereinander.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_ZURU\_PIX\_0010 | Pixel | Der Fluss fließt, der Sand rieselt, du stehst. Zwei von drei Dingen hier bewegen sich. | Nil-Delta oder Fährsteg |
| W2\_ZURU\_PIX\_0020 | Pixel | Das Krokodil hat sich inzwischen dreimal verneigt. Du hast dich null Mal bewegt. Lerne vom Krokodil. | Nil-Delta |
| W2\_ZURU\_PIX\_0030 | Pixel | Der Pharao hat sich in der Zeit, in der du hier stehst, für nichts entschieden. Ihr wärt ein gutes Team. | Thronsaal |
| W2\_ZURU\_PIX\_0040 | Pixel | Es riecht nach Brot. Es riecht seit fünf Minuten nach Brot. Und du tust nichts. Das ist Folter. Mit Kruste. | Palastküche |
| W2\_ZURU\_PIX\_0050 | Pixel | Die Sphinx denkt nach. Du denkst nach. Einer von euch ist aus Stein. Ich bin mir nicht mehr sicher, wer. | Sphinx |
| W2\_ZURU\_PIX\_0060 | Pixel | Archimedes hat in der Zeit zwei Dinge erfunden. Eins davon war schlecht. Trotzdem: zwei mehr als du. | Werkstatt |
| W2\_ZURU\_PIX\_0070 | Pixel | Die Bank ist frei geworden. Setz dich. Dann bist du wenigstens offiziell untätig. | Startbüro |
| W2\_ZURU\_PIX\_0080 | Pixel | Cicero hat seit deiner Ankunft nicht aufgehört zu reden. Du hast seit deiner Ankunft nicht angefangen. Gleichstand. | Agora |
| W2\_ZURU\_PIX\_0090 | Pixel | Die Schildkröte ist einmal ums Stadion gelaufen. Ich sage es nur. | Stadion |
| W2\_ZURU\_PIX\_0100 | Pixel | Da ist ein Ausgang. Ausgänge sind zum Benutzen da. Und Fähren. Und Öfen. | überall, wenn kein Rätselschritt offen ist |

## 29. Hinweise

Drei Stufen je Rätselschritt für die Hilfe-Pfote, Wartezeiten laut Spielsysteme. Die Schritte heißen W2\_R01 bis W2\_R11, mit Buchstaben für Teilschritte (Liste in `raetsel/welt-2.md`, Teilschritte und Schalter). Die IDs folgen dem Schema W2\_HINT\_PIX\_RRSK aus den Spielsystemen: RR Rätselnummer, S Stufe, K Teilschritt (0 ohne, 1 für a, 2 für b). Die Wettkampftage (R12, R13) haben keine Hinweise.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_HINT\_PIX\_0110 | Pixel | Der Fährmann will eine Münze. Du hast keine. Aber das Krokodil hat sich vor jemandem verneigt. Nicht vor dir. | R01, Stufe 1 |
| W2\_HINT\_PIX\_0120 | Pixel | Götter fahren frei. Und ihre Diener. Ich habe das Wort „Diener“ nicht gern gesagt. | R01, Stufe 2 |
| W2\_HINT\_PIX\_0130 | Pixel | Wechsel zu mir und lass mich auf die Fähre. Oder zieh mich drauf wie einen Gegenstand. Ich bin kein Gegenstand. Mach es trotzdem. | R01, Stufe 3 |
| W2\_HINT\_PIX\_0211 | Pixel | Der Pharao liest nur Bilder. Der Schreiber hat eine Tafel voller Bilder. Vier Felder, ein Satz. | R02a, Stufe 1 |
| W2\_HINT\_PIX\_0221 | Pixel | Die Grammatik steht an der Säule. Wer handelt, wem er dient, wen er bittet, und das Ohr für Gehör. | R02a, Stufe 2 |
| W2\_HINT\_PIX\_0231 | Pixel | Mann, Katze, Pharao, Ohr. Du dienst der Katze und bittest um Gehör. Ich habe nichts gegen diesen Satz. | R02a, Stufe 3 |
| W2\_HINT\_PIX\_0212 | Pixel | Der Hofkater will drei Dinge sehen: Opfergabe, Gefolge, Wunder. Er hat zwei. Wir brauchen drei. Rechne. | R02b, Stufe 1 |
| W2\_HINT\_PIX\_0222 | Pixel | Die Dose glänzt wie eine Opfergabe. Das Krokodil läuft mir sowieso hinterher. Fehlt ein Wunder. Etwas, das leuchtet oder schwebt. | R02b, Stufe 2 |
| W2\_HINT\_PIX\_0232 | Pixel | Zeig die Dose, hol Sobek vom Steg, und dann: Kaugummiblase. Oder Archimedes' Spiegel in die Sonne, wenn der Kaugummi weg ist. | R02b, Stufe 3 |
| W2\_HINT\_PIX\_0311 | Pixel | Schalter eins will, was Schalter zwei hat, und umgekehrt. Das ist kein Amt, das ist ein Kreis. Lies, was an der Wand hängt. | R03a, Stufe 1 |
| W2\_HINT\_PIX\_0321 | Pixel | Ein neues Rundschreiben gilt sofort. Wer schreibt die Rundschreiben? Niemand weiß es. Also: du. | R03a, Stufe 2 |
| W2\_HINT\_PIX\_0331 | Pixel | Nimm ein Formular und den Kugelschreiber. Oder Papyrus vom Nil und Tinte vom Tintenfisch im Hafen. Verlang etwas, das es nicht gibt. Sie stempeln alles, nur damit du gehst. | R03a, Stufe 3 |
| W2\_HINT\_PIX\_0312 | Pixel | Die Beamten stempeln nur, was über allen Vorschriften steht. Ein neues Rundschreiben. Oder einen Brief, den keiner versteht. | R03b, Stufe 1 |
| W2\_HINT\_PIX\_0322 | Pixel | Ein Rundschreiben schreibst du selbst. Einen unverständlichen Brief schreibt dir die Sphinx, wenn du ihr Rätsel geschafft hast. Eins reicht. | R03b, Stufe 2 |
| W2\_HINT\_PIX\_0332 | Pixel | Gib das Rundschreiben oder das Empfehlungsschreiben der Sphinx am Schalter ab. Dann gibt es den Startpass. Und Hermes. Leider. | R03b, Stufe 3 |
| W2\_HINT\_PIX\_0410 | Pixel | Die Sandalen wollen weg. Öl hält Riemen. Öl gibt es in der Küche. Die Köchin will dafür etwas Neues. | R04, Stufe 1 |
| W2\_HINT\_PIX\_0420 | Pixel | Sie kocht Fusionsküche. Etwas, das es hier nicht gibt. Du hast Dinge, die es hier nicht gibt. Oder du fragst mich nach einem Rezept. | R04, Stufe 2 |
| W2\_HINT\_PIX\_0430 | Pixel | Gib ihr den Kaugummi als ewiges Brot. Oder back Brot mit Datteln und Zwiebeln im Ofen, so wie ich es sage. Dann Öl auf die Sandalen. | R04, Stufe 3 |
| W2\_HINT\_PIX\_0510 | Pixel | Krone und Barren wiegen gleich. Die Waage sagt nichts. Archimedes ärgert sich jedes Mal, wenn die Wanne überläuft. Warum wohl? | R05, Stufe 1 |
| W2\_HINT\_PIX\_0520 | Pixel | Gleich schwer, aber was größer ist, macht mehr nass. Miss, wie viel Wasser überläuft. Mit dem Becher. | R05, Stufe 2 |
| W2\_HINT\_PIX\_0530 | Pixel | Krone in die Wanne, Becher dran. Barren in die Wanne, Becher dran. Mehr Wasser bei der Krone heißt: gefälscht. Dann sag es ihm. Er rennt dann. Nackt. Ich warne nur. | R05, Stufe 3 |
| W2\_HINT\_PIX\_0611 | Pixel | Eine Sandale hängt auf der Säule, und die Menge hält sie für heilig. Du kannst nicht klettern. Ich schon. | R06a, Stufe 1 |
| W2\_HINT\_PIX\_0621 | Pixel | Wechsel zu mir, Säule hoch, Sandale runter. Dann ziehst du sie an. Dann bist du heilig. Es wird nicht lange halten. | R06a, Stufe 2 |
| W2\_HINT\_PIX\_0631 | Pixel | Ich hole sie, du ziehst sie an, Brian hängt dir sein Schild um, und die Menge schenkt dir Dinge. Nimm alles. Besonders das mit Blättern. | R06a, Stufe 3 |
| W2\_HINT\_PIX\_0612 | Pixel | Die Wedler wollen reife Feigen. Du hast einen Setzling. Dazwischen liegen Jahre. Oder eine Fährfahrt. | R06b, Stufe 1 |
| W2\_HINT\_PIX\_0622 | Pixel | Flussabwärts wird alles älter. Auch Pflanzen im Topf. Steht auf der Tafel. Syrakus ist flussabwärts. | R06b, Stufe 2 |
| W2\_HINT\_PIX\_0632 | Pixel | Fahr den Setzling nach Syrakus, pflück die Feigen vom Baum, fahr zurück. Gepflücktes altert nicht mehr. Gib den Wedlern die Feigen. Nicht mir. Leider. | R06b, Stufe 3 |
| W2\_HINT\_PIX\_0710 | Pixel | Vier Verdächtige, zwei Aussagen, jeder lügt genau einmal. Schreib alles auf. Dann streich durch, was nicht aufgeht. | R07, Stufe 1 |
| W2\_HINT\_PIX\_0720 | Pixel | Prüf jeden als Dieb: Stimmt dann bei jedem genau eine Aussage? Und: Meine Nase lügt bei Fisch. Einer riecht nach Fisch. Nur so. | R07, Stufe 2 |
| W2\_HINT\_PIX\_0730 | Pixel | Tiro. Er war im Stadion, Hermes war es nicht. Eine Lüge, eine Wahrheit. Klag ihn an. Er gibt den Diskus her. Mit Kratzern. | R07, Stufe 3 |
| W2\_HINT\_PIX\_0810 | Pixel | Die Sphinx will ein Rätsel, das sie nicht lösen kann. Sie kennt alles aus ihrer Zeit. Du hast Dinge aus deiner. | R08, Stufe 1 |
| W2\_HINT\_PIX\_0820 | Pixel | Wähl ein Wunderding und drei Hinweise aus dem Notizbuch, die nur darauf passen. Die Hinweise sammelst du, wenn du deine Sachen ansiehst oder Leute damit überraschst. | R08, Stufe 2 |
| W2\_HINT\_PIX\_0830 | Pixel | Zum Handy: klingelt, leuchtet, drei Prozent. Zum Kaugummi: nie alle, klebt, Sonne. Zum Stift: ohne Tintenfass, klickt, blau. Drei, die zusammengehören. | R08, Stufe 3 |
| W2\_HINT\_PIX\_0910 | Pixel | Cicero redet. Du brauchst Antworten. Die Rolle hat drei, der Rest steht noch aus. Auf der Agora reden alle. Hör zu. | R09, Stufe 1 |
| W2\_HINT\_PIX\_0920 | Pixel | Die Griechen schimpfen über Römer, der Mann in der Tonne schimpft über alle. Einer von uns passt in die Tonne. Rate. | R09, Stufe 2 |
| W2\_HINT\_PIX\_0930 | Pixel | Rede mit den Griechen in der Menge, dann wechsel zu mir und schick mich in die Tonne. Sieben Konter, fünf Beleidigungen. Das reicht sogar für dich. | R09, Stufe 3 |
| W2\_HINT\_PIX\_1011 | Pixel | Cicero will ein Grab, Archimedes lebt. Archimedes will sein Grab selbst entwerfen. Frag ihn. Er wird empfindlich. Frag trotzdem. | R10a, Stufe 1 |
| W2\_HINT\_PIX\_1021 | Pixel | Mit dem Entwurf zu den Pyramiden-Arbeitern im Nil-Delta. Ohne Entwurf liefern sie Schotter. Ich habe es gesehen. | R10a, Stufe 2 |
| W2\_HINT\_PIX\_1031 | Pixel | Hol den Entwurf in der Werkstatt, gib ihn dem Steinmetz am Nil, nimm den frischen Stein. Dann geht es ums Alter. | R10a, Stufe 3 |
| W2\_HINT\_PIX\_1012 | Pixel | Hundertsiebenunddreißig Jahre, nicht eins jünger. Stein altert auf der Fähre. Die Tafel nennt die Jahre pro Strecke. Rechne. Ich warte. | R10b, Stufe 1 |
| W2\_HINT\_PIX\_1022 | Pixel | Ägypten bis Olympia hundertzwölf, Olympia bis Syrakus fünfundzwanzig. Zusammen? Genau. Der Stein muss den ganzen Fluss hinunter. | R10b, Stufe 2 |
| W2\_HINT\_PIX\_1032 | Pixel | Stein am Nil meißeln lassen, ohne Umweg bis Syrakus fahren, auf den Sockel am Grabhügel stellen. Cicero findet ihn. Archimedes steht daneben. Ich auch. Leider. | R10b, Stufe 3 |
| W2\_HINT\_PIX\_1111 | Pixel | Der Zeremonienmeister hat dir die Ordnung gesagt. Einladungen zuerst. Spiegel braucht Mittag. Rede braucht Leute. Gott zuletzt. Der Gott bin ich. | R11a, Stufe 1 |
| W2\_HINT\_PIX\_1121 | Pixel | Das zweite Feld hat eine Sonne. Da gehört der Spiegel hin. Davor Hermes, danach Cicero, am Ende ich. | R11a, Stufe 2 |
| W2\_HINT\_PIX\_1131 | Pixel | Hermes, Spiegel, Cicero, Pixel. In dieser Reihenfolge in die vier Felder. Mein Name steht zuletzt, weil der Höhepunkt zuletzt kommt. | R11a, Stufe 3 |
| W2\_HINT\_PIX\_1112 | Pixel | Ramses will Wein. Es gibt keinen. Es gibt Saft im Palast und Essig in der Werkstatt. Was gärt, reist mit der Zeit. | R11b, Stufe 1 |
| W2\_HINT\_PIX\_1122 | Pixel | Essig war Wein, bevor er Essig wurde. Flussaufwärts wird alles jünger. Fünfundzwanzig Jahre reichen. Nicht mehr. | R11b, Stufe 2 |
| W2\_HINT\_PIX\_1132 | Pixel | Nimm den Essigkrug aus der Werkstatt, fahr von Syrakus nach Olympia, nicht weiter, und gib Ramses den Wein. Wer bis Ägypten fährt, hat Saft. | R11b, Stufe 3 |
