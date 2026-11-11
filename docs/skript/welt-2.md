# Skript Welt 2: Antikodonien

Das komplette Dialog-Skript für Welt 2 als Entwurf, rund 900 Zeilen: Ankunft im Nil-Delta, alle elf Rätsel mit Gesprächsbäumen, Ansehen-, Benutzen- und Kombinierzeilen, die beiden Wettkampftage mit beiden Minispielen, Zeitfähre, Siegesparade und Abschluss, dazu Pixel-auf-Mensch-Zeilen, Zurufe und die Hinweise in drei Stufen je Rätselschritt. Aufbau und Kurzform wie im Skript Prolog: ID, Sprecher, Text und Regie (Szenen) oder Auslöser (sonst), Bedingung nach Semikolon; Nummern in Zehnerschritten je Szene, Pixels Kaskaden mit „//“. Die Rückkehr auf den Dachboden steht im Skript der Zwischenspiele, die Ersatzzeilen im SYS\_ERS-Pool.

## 1. Nil-Delta: Ankunft

Szene beim ersten Betreten. Max und Pixel purzeln aus dem Wirbel in den Sand am Fährsteg. Im Hintergrund steht die Pyramide auf der Spitze, Arbeiter kratzen sich am Kopf.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_NIL\_MAX\_0010 | Max | Sand. Im Schuh, im Hoodie und, wie ich gerade merke, auch im Ladeanschluss. Super. | setzt sich auf, schüttelt den Sneaker aus |
| W2\_NIL\_PIX\_0020 | Pixel | Ich bin auf dem Kopf gelandet, und zwar auf deinem. Ich danke dir, er war weicher, als ich befürchtet hatte. | klettert von Max' Kopf |
| W2\_NIL\_MAX\_0030 | Max | Kanal 7. Ich bin in einer Doku gelandet, bei der man nicht vorspulen kann. Und die Hitze ist leider echt. | blinzelt in die Sonne |
| W2\_NIL\_PIX\_0040 | Pixel | Heiß, trocken, und weit und breit keine Dose. Und trotzdem kommt mir das alles seltsam vertraut vor. // Ich war schon einmal hier, junger Mann, vor etwa viertausend Jahren. Man hat mich angebetet. // Ich sehe keinen Grund, warum man damit aufhören sollte. | hebt das Kinn |
| W2\_NIL\_MAX\_0050 | Max | Du warst nie hier. Du warst ja nicht mal im Garten, weil du Gras an den Pfoten eklig findest. |  |
| W2\_NIL\_PIX\_0060 | Pixel | Meine Vorfahren waren hier, und das zählt. Bei Katzen erbt man den Ruhm gleich mit. // Blut ist dicker als Dosenlake, wie meine Großmutter zu sagen pflegte. Sie hat übrigens nie Dosenlake getrunken. |  |
| W2\_NIL\_MAX\_0070 | Max | Ähm. Die Pyramide da hinten steht auf der Spitze. |  |
| W2\_NIL\_PIX\_0080 | Pixel | Das ist dir also aufgefallen. Beachtlich, wirklich. Direkt nach dem Sand und noch vor dem Handy. |  |
| W2\_NIL\_MAX\_0090 | Max | Okay. Ein Pharao, ein goldener Sack, und dann zurück aufs Sofa. Wie schwer kann das schon sein. | steht auf, Hände in die Bauchtasche |
| W2\_NIL\_PIX\_0100 | Pixel | Genau das hast du in Schwurbelstein auch gesagt. Vor dem Troll. Und vor der Ziege. | geht voraus Richtung Steg |
| W2\_NIL\_MAX\_0105 | Max | Die Ziege hat angefangen. Das sag ich jedem, der fragt. |  |
| W2\_NIL\_NAR\_0110 | – | Im Wasser neben dem Steg hebt ein Krokodil den Kopf, sieht Pixel und senkt ihn langsam wieder. Sehr langsam. | Sobek-Verbeugung, Animation ohne Text |
| W2\_NIL\_PIX\_0120 | Pixel | Siehst du? Es fängt schon an. Ich habe ein Gespür für so etwas. |  |

## 2. Nil-Delta: Rätsel 1, die Krokodil-Fähre

Der Fährmann will einen Obolus. Max hat keinen. Sobek verneigt sich vor Pixel, und Pixel steigt als Gott ein; Max fährt als heiliger Diener gratis mit.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_NIL\_MAX\_0210 | Max | Eine Fähre aus Holz, gezogen von einem Krokodil. Die Sicherheitseinweisung lass ich mir lieber gar nicht erst erklären. | Ansehen: Fähre |
| W2\_NIL\_PIX\_0215 | Pixel | Ein Boot mit eingebautem Krokodil. Endlich ein Verkehrsmittel, das versteht, dass man Respekt auch mit Zähnen ausdrücken kann. | Ansehen: Fähre, zweites Mal |
| W2\_NIL\_MAX\_0220 | Max | Ein alter Mann mit einer Stange und einer offenen Hand. Die Hand hält er so, wie andere ein Kartenlesegerät hinhalten. | Ansehen: Fährmann |
| W2\_NIL\_PIX\_0225 | Pixel | Früher hat man dem Fährmann eine Münze unter die Zunge gelegt, und zwar meistens, wenn man tot war. // Ich lege niemandem etwas unter die Zunge. Ich bin ein Kater und kein Sparschwein. | Ansehen: Fährmann, zweites Mal |
| W2\_NIL\_MAX\_0230 | Max | Das Krokodil trägt einen Hut aus Schilf und guckt genau so, wie ich im Matheunterricht gucke. | Ansehen: Sobek |
| W2\_NIL\_PIX\_0240 | Pixel | Ein Teenager, ganz eindeutig. Man erkennt es am Augenrollen und, wenn ich das anmerken darf, am Hut. // Dieser Hut ist kein Kleidungsstück. Dieser Hut ist ein Hilfeschrei. | Ansehen: Sobek, zweites Mal |
| W2\_NIL\_MAX\_0250 | Max | Ich würde gern mitfahren. | Reden: Fährmann, Einstieg |
| W2\_NIL\_FAE\_0260 | Fährmann | Ein Obolus. Eine Münze. Unter die Zunge oder in die Hand. Die Zunge ist mir lieber, dann redet keiner. |  |
| W2\_NIL\_MAX\_0270 | Max | Ich hab einen Kaugummi und ein Handy. Das stirbt bei drei Prozent. Es hat drei Prozent. | Notizbuch: Sphinx-Baustein „stirbt bei drei Prozent“ |
| W2\_NIL\_FAE\_0280 | Fährmann | Der Fluss nimmt keine Kaugummis. Der Fluss nimmt Münzen, seit viertausend Jahren, und zwar ohne Preiserhöhung. |  |
| W2\_NIL\_MAX\_0290 | Max | Wohin fährt die Fähre? | Option Fährmann |
| W2\_NIL\_FAE\_0300 | Fährmann | Flussabwärts nach Olympia und dann bis Syrakus, flussaufwärts wieder zurück. Dazwischen liegen Jahre, und das meine ich wörtlich. |  |
| W2\_NIL\_MAX\_1010 | Max | Jahre? Ich wollte eigentlich zum Abendessen wieder da sein. |  |
| W2\_NIL\_FAE\_1020 | Fährmann | Dann fahr nicht flussabwärts. Wer Hunger hat, fährt besser gegen den Strom, da wird das Essen nicht kalt. |  |
| W2\_NIL\_MAX\_0310 | Max | Was ist mit dem Krokodil? | Option Fährmann |
| W2\_NIL\_FAE\_0320 | Fährmann | Das ist Sobek. Er zieht die Fähre, seit sein Vater in Rente ist, und er hat keine Lust. Er hatte noch nie Lust. // Vor nichts und niemandem verneigt der sich. Nicht mal vor mir. |  |
| W2\_NIL\_FAE\_0330 | Fährmann | Moment. Vor wem verneigt er sich da gerade? | sieht zu Pixel |
| W2\_NIL\_MAX\_0340 | Max | Warum steht die Pyramide auf dem Kopf? | Option Fährmann |
| W2\_NIL\_FAE\_0350 | Fährmann | Wegen dem Bauplan. Jemand hat ihn falsch herum gehalten, und seit dreißig Jahren streiten sie sich, wer. |  |
| W2\_NIL\_MAX\_1030 | Max | Und wer hat ihn falsch herum gehalten? |  |
| W2\_NIL\_FAE\_1040 | Fährmann | Das ist ja der Streit. Die Pyramide steht derweil da und hält still. Sie ist hier die Einzige mit Geduld. |  |
| W2\_NIL\_PIX\_1050 | Pixel | Ich würde mich auch auf den Kopf stellen, wenn mich dreißig Jahre lang alle anstarren. // Ich würde mich danach allerdings hinlegen. Auf etwas Weiches. Und mich nie wieder bewegen. |  |
| W2\_NIL\_MAX\_0360 | Max | Dann warte ich halt. | Option Fährmann, beendet das Gespräch |
| W2\_NIL\_FAE\_0370 | Fährmann | Der Fluss wartet mit dir. Der Fluss hat Zeit, mehr als jeder andere hier. |  |
| W2\_NIL\_MAX\_0380 | Max | Ich hab kein Geld, er will Geld. Wie zu Hause, nur mit Krokodil. | Benutzen: Fähre ohne Lösung |
| W2\_NIL\_PIX\_0390 | Pixel | Das Krokodil hat sich vor mir verneigt. Vor mir. // In diesem Land hat man endlich den Geschmack, den ich anderswo so schmerzlich vermisse. | Pixel ans Wasser (Spielfigur Pixel oder Pixel auf Sobek) |
| W2\_NIL\_MAX\_0400 | Max | Dann nimm halt Pixel als Fahrkarte. | Pixel auf Fähre; Spielfigur Pixel betritt die Fähre |
| W2\_NIL\_FAE\_0410 | Fährmann | Das Krokodil verneigt sich. Das Krokodil hat sich noch nie verneigt, nicht ein einziges Mal, nicht mal vor mir. | Sobek-Verbeugung |
| W2\_NIL\_FAE\_0420 | Fährmann | Ein Gott. Ein echter Katzengott, auf meiner Fähre. Götter fahren bei mir frei, und ihre Diener selbstverständlich auch. | verneigt sich ebenfalls |
| W2\_NIL\_MAX\_0430 | Max | Moment. Diener? |  |
| W2\_NIL\_PIX\_0440 | Pixel | Heiliger Diener, wenn ich bitten darf. Wenn wir das schon machen, dann machen wir es richtig. // Du trägst ab sofort mein Kissen. Es gibt zwar noch kein Kissen, aber das ist ein Problem, // das ein guter Diener ganz von selbst löst, ohne dass man ihn darauf hinweisen muss. | schwebt auf die Fähre |
| W2\_NIL\_MAX\_0450 | Max | Ich bin jetzt offiziell das Zubehör eines Katers. Das schreib ich ganz bestimmt nicht in meinen Lebenslauf. |  |
| W2\_NIL\_FAE\_0460 | Fährmann | Wohin soll's gehen, Erhabener? Und du, Diener, setzt dich bitte nach hinten. | Flusskarte öffnet sich |
| W2\_NIL\_MAX\_0470 | Max | Ich hab ihm den Kaugummi als Fahrgeld angeboten. Er sagt, der Fluss nimmt keine Kaugummis. Der Fluss ist ziemlich wählerisch. | Kaugummi auf Fährmann |
| W2\_NIL\_MAX\_0480 | Max | Das Handy als Pfand? Das ist mein letzter Beweis, dass es mich gibt. | Handy auf Fährmann |
| W2\_NIL\_FAE\_0490 | Fährmann | Eine leere Dose. Die glänzt zwar wie Silber, ist aber keins. Ich bin alt, Junge, aber nicht blind. | Thunfischdose auf Fährmann |
| W2\_NIL\_PIX\_0500 | Pixel | Die Dose bleibt bei mir. Sie hat für mich einen großen Erinnerungswert. // Sie erinnert mich nämlich an Thunfisch, und an Thunfisch erinnere ich mich gern und oft. | nach 0490 |
| W2\_NIL\_MAX\_0510 | Max | Dem Krokodil den Kugelschreiber geben? Es hat keine Hände, nur ziemlich viele Meinungen. | Kugelschreiber auf Sobek |

## 3. Nil-Delta: Ansehen und Umgebung

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_NIL\_MAX\_0610 | Max | Jemand ist hier mit der Hand durchs Korn gelaufen, und zwar sehr bedeutungsvoll. | Ansehen: Weizenfeld mit Handabdruck |
| W2\_NIL\_MAX\_0615 | Max | Ein Handabdruck im Korn. Fehlt eigentlich nur noch einer in Rüstung, der traurig guckt, während irgendwo Geigen einsetzen. | Ansehen: Weizenfeld mit Handabdruck, zweites Mal |
| W2\_NIL\_PIX\_0620 | Pixel | Korn. Daraus macht man Dinge mit Kruste, und Dinge mit Kruste sind das Beste, was Menschen je erfunden haben. // Merk dir das. Ich merke es mir auch, für alle Fälle. | Ansehen: Weizenfeld, drittes Mal; Notizbuch Seite 3: „irgendwas aus Mehl, mit Kruste“ |
| W2\_NIL\_MAX\_0630 | Max | Eine Sanduhr, so groß wie ich. Der Sand läuft mal nach oben, mal nach unten, je nachdem, wohin die Fähre gerade fährt. | Ansehen: Sanduhr |
| W2\_NIL\_MAX\_0635 | Max | Wenn ich die umdrehe, spule ich vielleicht die Zeit zurück. In Spielen klappt das immer, und danach macht man einen Salto. | Ansehen: Sanduhr, zweites Mal |
| W2\_NIL\_MAX\_0640 | Max | Eine Tafel mit drei Zeilen. Entweder der Fahrplan oder die Hausordnung, was hier vermutlich dasselbe ist. | Ansehen: Tafel; öffnet Nahansicht |
| W2\_NIL\_MAX\_0645 | Max | Ich lese die drei Zeilen noch mal. Sie werden nicht kürzer, aber jedes Mal wichtiger. | Ansehen: Tafel, zweites Mal; öffnet Nahansicht |
| W2\_NIL\_MAX\_0650 | Max | „Was wächst, gärt oder verwittert, reist mit der Zeit. Was du selbst pflückst, bleibt. Der Rest ist der Zeit egal.“ | Nahansicht Tafel; Notizbuch Seite 2 |
| W2\_NIL\_PIX\_0660 | Pixel | Eine Fähre mit Kleingedrucktem. Ich muss zugeben, die Antike war weiter, als man ihr gemeinhin zutraut. | Nahansicht Tafel, nach dem Lesen |
| W2\_NIL\_MAX\_0670 | Max | Schilf. Daraus machen sie hier Papyrus, also Papier, bevor es Papier gab. Opa hätte Tränen in den Augen. | Ansehen: Schilf |
| W2\_NIL\_PIX\_0675 | Pixel | Schilf raschelt so verlockend, wenn man hineinspringt. Ich springe trotzdem nicht hinein. // Dort wohnen nämlich Krokodile mit Ambitionen, und ich habe für heute genug Verehrer. | Ansehen: Schilf, zweites Mal |
| W2\_NIL\_MAX\_0680 | Max | Ein Blatt Papyrus. Leer. Das erste leere Blatt seit viertausend Jahren, und ich hab's. | Nehmen: Papyrus aus dem Schilf |
| W2\_NIL\_MAX\_0690 | Max | Die Pyramide steht auf der Spitze und wackelt kein bisschen. Ich weiß nicht, ob ich beeindruckt sein soll oder Angst haben. | Ansehen: verkehrte Pyramide |
| W2\_NIL\_PIX\_0700 | Pixel | Sie steht seit dreißig Jahren so, und sie steht immer noch. // Ein Architekt würde das Statik nennen. Ich nenne es Sturheit, und ich weiß, wovon ich rede. | Ansehen: verkehrte Pyramide, zweites Mal |
| W2\_NIL\_MAX\_0710 | Max | Er hält den Plan verkehrt herum. Mit beiden Händen und voller Überzeugung. | Ansehen: Bauplan, verkehrt herum gehalten |
| W2\_NIL\_MAX\_0715 | Max | Ich leg den Kopf schief. Jetzt steht die Pyramide richtig, und ich steh falsch. | Ansehen: Bauplan, verkehrt herum gehalten, zweites Mal |
| W2\_NIL\_MAX\_0720 | Max | Ein Pyramiden-Arbeiter. Er grinst ohne Zähne und mit Hammer, und das beruhigt mich nicht so richtig. | Ansehen: Steinmetz |
| W2\_NIL\_MAX\_0725 | Max | Er klopft im Akkord. Wenn der Stein fertig ist, holt ihn bestimmt ein Dicker mit Streifenhose ab und trägt ihn heim. | Ansehen: Steinmetz, zweites Mal |
| W2\_NIL\_MAX\_0730 | Max | Ein Sandweg, der nach rechts führt. In jedem Spiel liegt rechts die Zukunft, also geh ich mal davon aus. | Ansehen: Sandweg |
| W2\_NIL\_MAX\_0735 | Max | Der Sand weiß, wohin er will. Nach rechts. Wie alle hier. | Ansehen: Sandweg, zweites Mal |
| W2\_NIL\_MAX\_0740 | Max | Hallo. Baut ihr die Pyramide gerade ab oder auf? | Reden: Steinmetz, Einstieg |
| W2\_NIL\_STM\_0750 | Steinmetz | Auf! Unten anfangen, oben aufhören, so steht's im Plan. Und der Plan hat recht. Der Plan hat immer recht. |  |
| W2\_NIL\_MAX\_0760 | Max | Der Plan ist verkehrt herum. |  |
| W2\_NIL\_STM\_0770 | Steinmetz | Das sagen alle. Dann drehen wir ihn um, und dann ist er wieder verkehrt herum. Irgendwann haben wir es aufgegeben. | zuckt mit den Schultern |
| W2\_NIL\_MAX\_0780 | Max | Meißelt ihr auch kleine Sachen? | Option Steinmetz |
| W2\_NIL\_STM\_0790 | Steinmetz | Alles, was eine Kante hat. Grabsteine, Türschwellen, Katzenfiguren. Bring einen Entwurf, und wir hauen ihn in Stein, wörtlich. |  |
| W2\_NIL\_MAX\_1060 | Max | Katzenfiguren? Pixel, bleib mal kurz so sitzen. |  |
| W2\_NIL\_PIX\_1070 | Pixel | Ich sitze seit zwei Welten Modell, und zwar ohne jede Gage. // Wenn dieser Mann mich meißelt, ohne vorher über Thunfisch zu verhandeln, verklage ich den Nil. |  |
| W2\_NIL\_MAX\_0800 | Max | Wie lange bleibt so ein Stein frisch? | Option Steinmetz (bleibt) |
| W2\_NIL\_STM\_0810 | Steinmetz | Hier bei mir: ewig. Auf der Fähre kommt's drauf an, wie weit du fährst, weil Stein mit der Zeit reist. Steht auf der Tafel. | Hinweis Rätsel 10 |
| W2\_NIL\_MAX\_1080 | Max | Und wenn ich bis Syrakus fahre? |  |
| W2\_NIL\_STM\_1090 | Steinmetz | Dann ist er alt, wenn du ankommst. Alt und ehrwürdig. Und für ehrwürdig zahlen die Leute extra. |  |
| W2\_NIL\_MAX\_0820 | Max | Ich geh dann mal. | Option Steinmetz, beendet das Gespräch |
| W2\_NIL\_STM\_0830 | Steinmetz | Pass auf die Spitze auf, wenn du gehst. Die hat schon zwei Besucher erwischt. |  |

## 4. Nil-Delta: Hermes und Opas Papyrus

Szene, läuft beim ersten Betreten des Nil-Deltas nach der ersten Fährfahrt. Hermes kommt angerannt, zu spät wie immer.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_NIL\_HER\_0910 | Hermes | Post! Eilpost! Dringend und älter als ich! Tut mir leid, sie lag im anderen Büro! | rennt auf der Stelle, kramt im Beutel |
| W2\_NIL\_MAX\_0920 | Max | Ein Papyrus. Für mich. Von … Opa. Natürlich ist der von Opa. | nimmt die Rolle |
| W2\_NIL\_HER\_0930 | Hermes | Absender „Konrad, Dachboden“. Die Zustellung hat etwa dreitausend Jahre gedauert. Das ist noch innerhalb der Garantie. |  |
| W2\_NIL\_OPA\_0940 | Opa (gelesen) | „Fein muss es sein. Fein wie Staub. Wie die Welt, wenn ich versage.“ | Max liest, Opas Stimme |
| W2\_NIL\_MAX\_0950 | Max | Er klingt jedes Mal ein bisschen böser. Ich hoffe, das liegt an der Zustellung. |  |
| W2\_NIL\_PIX\_0960 | Pixel | Fein wie Staub. Der Mann plant etwas, und ich tippe auf Weltherrschaft. // Oder auf Frühjahrsputz, was für Katzen ungefähr auf dasselbe hinausläuft. // Beides endet damit, dass man mich von meinem Lieblingskissen hebt. |  |
| W2\_NIL\_HER\_0970 | Hermes | Ich muss weiter, Termine! Und falls ihr nach Olympia wollt: Euer Startpass ist in einem anderen Büro. | rennt los, bleibt stehen |
| W2\_NIL\_MAX\_0980 | Max | Ich hab doch noch gar keinen Startpass. |  |
| W2\_NIL\_HER\_0990 | Hermes | Eben! | weg |
| W2\_NIL\_MAX\_1000 | Max | Opas Papyrus. „Fein wie Staub.“ Ich les das lieber nicht als Drohung. Am besten les ich es gar nicht. | Ansehen: Opas Papyrus im Inventar (keine Nahansicht) |
| W2\_NIL\_MAX\_1005 | Max | Opas Handschrift ist auf Papyrus noch schlechter als auf Papier. Ich hätte ehrlich nicht gedacht, dass das geht. | Ansehen: Opas Papyrus im Inventar (keine Nahansicht), zweites Mal |

## 5. Die Zeitfähre und die Flusskarte

Fahrt zwischen den Anlegestellen. Die Flusskarte zeigt Ägypten, Olympia und Syrakus; während der Fahrt zeigt das Inventar, wie Dinge mit Sanduhr-Symbol altern oder jünger werden. Die Alterungs-Kommentare kommen beim ersten Mal automatisch, danach nur beim Ansehen des Gegenstands.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_FAHR\_MAX\_0010 | Max | Drei Haltestellen, eine Linie, kein Umsteigen. Ehrlich, das ist der beste Nahverkehr, den ich je gesehen habe. | Ansehen: Flusskarte |
| W2\_FAHR\_MAX\_0015 | Max | Ägypten, Olympia, Syrakus. Die Linie heißt bestimmt „Zeitreise-Express“. Oder ganz langweilig „Linie 1“. | Ansehen: Flusskarte, zweites Mal |
| W2\_FAHR\_PIX\_0020 | Pixel | Flussaufwärts wird alles jünger, sagt die Karte. Ich bleibe trotzdem genau so, wie ich bin. // Man verbessert nichts, was bereits vollkommen ist. Das gilt für Thunfisch und für mich. | Flusskarte, erstes Öffnen |
| W2\_FAHR\_FAE\_0030 | Fährmann | Abfahrt. Gut festhalten, die Jahre ziehen einen gern am Ärmel. | jede Abfahrt |
| W2\_FAHR\_FAE\_0040 | Fährmann | Hundertzwölf Jahre bis Olympia. Für euch zwei sind es zwei Minuten. Die Rechnung macht der Fluss, nicht ich. | erste Fahrt Ägypten nach Olympia |
| W2\_FAHR\_FAE\_0050 | Fährmann | Fünfundzwanzig Jahre bis Syrakus. Eine kurze Strecke, für einen Stein gerade mal ein Nickerchen. | erste Fahrt Olympia nach Syrakus |
| W2\_FAHR\_MAX\_0060 | Max | Die Sanduhr läuft rückwärts. Wir spulen gerade zurück, und außer dem Sand merkt das keiner. | erste Fahrt flussaufwärts |
| W2\_FAHR\_PIX\_0070 | Pixel | Ich hasse Zeitreisen, das habe ich deinem Großvater bereits mitgeteilt. // Zeitreisen auf dem Wasser hasse ich noch mehr, weil Wasser grundsätzlich nass ist. // Und Zeitreisen auf dem Wasser mit Krokodil hasse ich am allermeisten. Glaube ich. Er sieht mich so ergeben an. | erste Fahrt überhaupt |
| W2\_FAHR\_SOB\_0080 | Sobek | (zufriedenes Grollen) | Pixel sieht Sobek an; Lautsprecher: „Übersetzung: Er findet dich okay.“ |
| W2\_FAHR\_MAX\_0090 | Max | Der Traubensaft blubbert und wird zu Wein. Hoffentlich schmeckt der besser als Opas Johannisbeer-Experiment. | Traubensaft wird Wein (flussabwärts) |
| W2\_FAHR\_PIX\_0100 | Pixel | Jetzt ist es Wein. Noch ein Stück weiter, und es wird zu etwas, womit man Salat beleidigt. | Wein wird Essig (weiter flussabwärts) |
| W2\_FAHR\_MAX\_0110 | Max | Essig. Der Krug riecht jetzt genau wie Omas Fensterputzmittel. | Essig im Inventar nach zu weiter Fahrt |
| W2\_FAHR\_MAX\_0120 | Max | Der Essig wird wieder Wein. Zurückspulen funktioniert also auch bei Getränken, gut zu wissen. | Essig wird Wein (flussaufwärts) |
| W2\_FAHR\_MAX\_0130 | Max | Jetzt ist es Traubensaft. Noch ein Stück, und es sind Trauben, und noch eins, und ich halte vermutlich einen Weinberg. | Wein wird Traubensaft (weiter flussaufwärts) |
| W2\_FAHR\_MAX\_0150 | Max | Der Setzling wächst. Ich kann zugucken. Das ist die erste Pflanze, die bei mir überlebt. | Feigensetzling wird Baum (flussabwärts) |
| W2\_FAHR\_PIX\_0160 | Pixel | Ein ganzer Baum, mit Feigen, in einem Topf, auf einem Floß. // Diese Antike kennt kein Maß, junger Mann, und das sage ich als jemand, der sich gern etwas gönnt. | Feigenbaum im Inventar |
| W2\_FAHR\_MAX\_0170 | Max | Der Setzling schrumpft, bis nur noch ein Kern übrig ist. Ich hab gerade einen Baum auf Werkseinstellungen zurückgesetzt. | Setzling wird Kern (flussaufwärts) |
| W2\_FAHR\_PIX\_0180 | Pixel | Ein Feigenkern. Das ist der kleinste Garten, den ich je gesehen habe. // Ich würde darauf schlafen, wenn ich nicht befürchten müsste, dass er unter mir zu einem Baum wird. | Feigenkern im Inventar |
| W2\_FAHR\_MAX\_0190 | Max | Die gepflückten Feigen bleiben einfach Feigen, der Fluss ignoriert sie. Endlich mal was, das nicht abläuft. | gepflückte Feigen an Bord |
| W2\_FAHR\_MAX\_0200 | Max | Der Grabstein wird grau, ungefähr so wie ein Foto, das zu lange im Fenster gelegen hat. | frischer Grabstein wird grau (nach Olympia) |
| W2\_FAHR\_MAX\_0210 | Max | Risse, Moos und ein kleiner Käfer. In zwei Minuten sind auf dem Stein hundert Jahre Geschichte passiert. | Grabstein wird verwittert (bis Syrakus) |
| W2\_FAHR\_PIX\_0220 | Pixel | Moos. Weich, kühl und ein klein wenig feucht. // Beinahe ein Schlafplatz. Aber eben nur beinahe, und beim Schlafen mache ich keine Kompromisse. | verwitterter Grabstein im Inventar |
| W2\_FAHR\_MAX\_0230 | Max | Der Grabstein wird wieder glatter, die Risse gehen zu, das Moos verschwindet. Zurückspulen geht auch bei Stein. | Grabstein wird jünger (flussaufwärts: verwittert zu grau, grau zu frisch) |
| W2\_FAHR\_MAX\_0240 | Max | Das Handy bleibt bei drei Prozent. Nicht mal viertausend Jahre kriegen das Ding geladen. | Handy während der Fahrt ansehen |
| W2\_FAHR\_MAX\_0250 | Max | Der Kaugummi bleibt, wie er ist. Der ist schon aus dem Zeitstrom gefallen, bevor ich ihn gekauft hab. | Kaugummi während der Fahrt ansehen |
| W2\_FAHR\_PIX\_0260 | Pixel | Die Dose altert nicht, selbstverständlich nicht. Sie ist zeitlos, genau wie ich. // Wir zwei haben eine Menge gemeinsam, wenn man davon absieht, dass sie leer ist und ich nicht. | Thunfischdose während der Fahrt ansehen |
| W2\_FAHR\_MAX\_0270 | Max | Das Öl bleibt Öl. Kein Sanduhr-Symbol. Der Zeit ist es egal. | Olivenöl während der Fahrt ansehen |
| W2\_FAHR\_FAE\_0280 | Fährmann | Olympia. Aussteigen, wer Sport mag. Ich bleib sitzen. | Ankunft Olympia |
| W2\_FAHR\_FAE\_0290 | Fährmann | Syrakus, Ende der Strecke. Dahinter kommt nur noch Meer, und das Meer nimmt keine Katzen. | Ankunft Syrakus |
| W2\_FAHR\_FAE\_0300 | Fährmann | Ägypten. Weiter flussaufwärts geht's nicht, da kommt nur noch Sand. Und Verwandtschaft. | Ankunft Ägypten |

## 6. Fährsteg Olympia und Hafen Syrakus

Zwei Durchgangsräume, kein Rätsel. Am Hafen von Syrakus liegt der Tintenfisch für den zweiten Lösungsweg des Passierscheins (Rätsel 3).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_STOL\_MAX\_0010 | Max | Olivenbäume, ein Fischerboot und Vogelgezwitscher. Das sieht so friedlich aus, dass ich fast nach dem Mauszeiger suche. | Ansehen: Olivenbäume |
| W2\_STOL\_PIX\_0015 | Pixel | Ein Boot ohne Fisch und Bäume voller Vögel, die ich nicht jagen darf. // Das ist kein Idyll. Das ist eine Ausstellung von Dingen, die mir verwehrt bleiben. | Ansehen: Olivenbäume, zweites Mal |
| W2\_STOL\_MAX\_0020 | Max | Ein Fischerboot ohne Fischer. Der ist wahrscheinlich im Stadion, weil hier anscheinend alle im Stadion sind. | Ansehen: Fischerboot |
| W2\_STOL\_PIX\_0030 | Pixel | Ein Boot, leer, und nicht ein einziger Fisch darin. // Ich hatte mir von Olympia mehr erwartet. Ich hatte mir, um genau zu sein, Sardinen erwartet. | Ansehen: Fischerboot, zweites Mal |
| W2\_STOL\_MAX\_0040 | Max | Noch eine Sanduhr. Die haben an jeder Haltestelle eine, und die geht wenigstens nie nach. | Ansehen: Sanduhr Olympia |
| W2\_STOL\_MAX\_0045 | Max | Der Sand läuft hier gemütlicher. Griechischer Sand hat offenbar keine Termine. | Ansehen: Sanduhr Olympia, zweites Mal |
| W2\_STOL\_MAX\_0050 | Max | Dieselbe Tafel wie in Ägypten, mit denselben drei Zeilen. Der Fluss wiederholt sich gern. | Ansehen: Tafel Olympia |
| W2\_STOL\_MAX\_0055 | Max | Ich hab Wort für Wort verglichen. Alles gleich, bis auf einen Kaffeefleck. Antiker Kaffee, schätze ich. | Ansehen: Tafel Olympia, zweites Mal |
| W2\_STOL\_MAX\_0060 | Max | Ein Steinweg den Hügel hoch zu weißen Säulen. Da oben brüllt jemand, also ist das entweder Sport oder Politik. | Ansehen: Weg zur Agora |
| W2\_STOL\_MAX\_0065 | Max | Der Hügel ist steil. Wer da hochrennt, kommt oben entweder als Held an oder als Pfütze, und ich tippe bei mir auf Pfütze. | Ansehen: Weg zur Agora, zweites Mal |
| W2\_HAFS\_MAX\_0010 | Max | Ein Hafen, dahinter das Meer, und dahinter kommt einfach gar nichts mehr. Hier hört die Zeit auf. | Ansehen: Meer |
| W2\_HAFS\_PIX\_0020 | Pixel | Hier ist Sendeschluss, und du weißt nicht einmal, was das ist. // Früher kam nachts ein Testbild, und dann war Ruhe. // Eine zivilisierte Zeit. Ich vermisse sie jeden Abend gegen elf. | Ansehen: Meer, zweites Mal |
| W2\_HAFS\_MAX\_0030 | Max | Fischernetze. Da drin zappelt etwas mit Armen, und zwar mit eindeutig zu vielen Armen. | Ansehen: Fischernetze |
| W2\_HAFS\_MAX\_0035 | Max | Das Ding im Netz winkt mir mit allen acht Armen. Ich winke mit zweien zurück und verliere. | Ansehen: Fischernetze, zweites Mal |
| W2\_HAFS\_MAX\_0040 | Max | Ein Tintenfisch, klein und nass. Er guckt, als wüsste er, was ich vorhabe. Keine Sorge, ich leih mir nur Tinte. | Nehmen: Tintenfisch aus dem Netz; wird „Tintenfass“ im Inventar |
| W2\_HAFS\_PIX\_0050 | Pixel | Ein Tintenfisch. Frittiert ist er ein Gedicht, roh ist er eine Beleidigung. // Und du hast ihn roh genommen, mit bloßen Händen, ohne Zitrone. Ich bin entsetzt. | Nehmen: Tintenfisch, danach |
| W2\_HAFS\_MAX\_0060 | Max | Amphoren. Die Antike hatte für alles einen Krug und für nichts einen Deckel. | Ansehen: Amphoren am Kai |
| W2\_HAFS\_PIX\_0065 | Pixel | Krüge ohne Deckel. Man könnte hineinsehen, man könnte hineinfallen, man könnte darin übernachten. // Ich sage nur: Möglichkeiten. Ich sage nicht, dass ich sie schon alle ausprobiert habe. | Ansehen: Amphoren am Kai, zweites Mal |
| W2\_HAFS\_MAX\_0070 | Max | Eine Gasse bergauf. Oben raucht ein Schornstein, und über der Tür hängt ein Zahnrad. Da wohnt jemand, der zu viel nachdenkt. | Ansehen: Gasse zur Werkstatt |
| W2\_HAFS\_MAX\_0075 | Max | Das Zahnrad über der Tür dreht sich im Wind. Hier erfindet sogar das Türschild was. | Ansehen: Gasse zur Werkstatt, zweites Mal |
| W2\_HAFS\_MAX\_0080 | Max | Die Sanduhr von Syrakus. Hier liegt der ganze Sand unten, weil hier die Linie zu Ende ist. | Ansehen: Sanduhr Syrakus |
| W2\_HAFS\_MAX\_0085 | Max | „Endstation, bitte alle aussteigen.“ Ich sag das gerade in Gedanken mit Bahnhofsstimme. | Ansehen: Sanduhr Syrakus, zweites Mal |
| W2\_HAFS\_PIX\_0090 | Pixel | Möwen. Sie schreien, als hätte man ihnen das Mittagessen weggenommen. // Ich kenne dieses Gefühl. Ich kenne es von jedem Tag, an dem du den Napf vergisst. | Zuruf-Ersatz bei Möwen im Hintergrund |

## 7. Thronsaal: Ankunft und Ansehen

Beim ersten Betreten sitzt Ramses auf dem Thron und sieht von einem Zepter zum anderen. Der Hofkater sitzt auf dem Kissen vor den Stufen und lässt niemanden durch. Der Schreiber sitzt links am Pult.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_THRO\_MAX\_0010 | Max | Ein Thron, drei Stufen und ein Mann mit zwei Zeptern. Der kann sich nicht mal entscheiden, welche Hand er benutzt. | erstes Betreten |
| W2\_THRO\_RAM\_0020 | Ramses | Wer ist das? Ein Besucher? Oder ein Bittsteller? Oder … etwa beides? Oh nein. Das ist zu viel. | sieht auf, dann wieder auf die Zepter |
| W2\_THRO\_HOF\_0030 | Hofkater | Fsssch. | vom Kissen, ohne aufzustehen |
| W2\_THRO\_PIX\_0040 | Pixel | Da liegt eine Katze auf einem Kissen. Auf MEINEM Kissen. // Ich habe dieses Kissen bis eben noch nie gesehen, aber ich weiß, dass es meins ist. Das spürt man. | Schwanz zuckt |
| W2\_THRO\_SCH\_0050 | Schreiber | Der Pharao empfängt nur schriftlich, in Hieroglyphen. Alles andere liest er nicht, also kann er nicht, also will er nicht. // Das hab ich jetzt nicht gesagt. | ohne aufzusehen |
| W2\_THRO\_MAX\_0060 | Max | Ein Pharao, der nur Bilder liest, und ein Kater, der Eintritt verlangt. Das wird ein langer Nachmittag. |  |

Ansehen im Thronsaal:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_THRO\_MAX\_0110 | Max | Gold, Stufen, Kissen. Der Thron sieht aus wie ein Gaming-Stuhl für jemanden, der nie zum Spielen kommt. | Ansehen: Thron |
| W2\_THRO\_MAX\_0115 | Max | Die Kissen sind komplett plattgesessen. Ramses sitzt hier offenbar sehr lange und sehr unentschlossen. | Ansehen: Thron, zweites Mal |
| W2\_THRO\_MAX\_0120 | Max | Ramses der Unentschlossene. Er guckt, als hätte er seit Stunden den Startbildschirm offen und kann sich nicht für „Neues Spiel“ entscheiden. | Ansehen: Ramses |
| W2\_THRO\_PIX\_0125 | Pixel | Er hat zwei Zepter und weiß nicht, welches er halten soll. // Ich hätte beide vom Tisch geschoben. Problem gelöst, und zwar mit Eleganz. | Ansehen: Ramses, zweites Mal |
| W2\_THRO\_MAX\_0130 | Max | Eine sandfarbene Katze mit Ohrring. Sie guckt auf mich herab, obwohl sie unter mir sitzt. Das ist echtes Talent. | Ansehen: Hofkater |
| W2\_THRO\_PIX\_0140 | Pixel | Ein Ohrring! Wer trägt denn bitte Schmuck am Ohr? Mit dem Ohr hört man doch, das ist ein Arbeitsgerät. // Und das Kissen ist aus Seide. Aus Seide, junger Mann. // Das hier wird kein Gespräch. Das wird ein Krieg. | Ansehen: Hofkater, zweites Mal |
| W2\_THRO\_MAX\_0150 | Max | Zwei Männer mit Palmwedeln, so groß wie Surfbretter. Sie schwitzen mehr, als sie wedeln. | Ansehen: Fächerwedler |
| W2\_THRO\_MAX\_0155 | Max | Sie wedeln im Takt, fast jedenfalls. Einer ist immer einen halben Wedel hinterher. | Ansehen: Fächerwedler, zweites Mal |
| W2\_THRO\_FAW\_0160 | Fächerwedler | Wir wedeln für Lohn. Für Feigen würden wir besser wedeln, und für frische Feigen würden wir sogar gerade wedeln. | Reden: Fächerwedler, vor der Bestechung |
| W2\_THRO\_MAX\_0170 | Max | Ein Pult, eine Tontafel und ein paar Binsenstifte. Das ist hier wohl das Sekretariat. | Ansehen: Schreiberpult |
| W2\_THRO\_MAX\_0175 | Max | Auf der Tontafel steht „Wichtig“, und darunter steht nichts. | Ansehen: Schreiberpult, zweites Mal |
| W2\_THRO\_MAX\_0180 | Max | Ein Schreiber mit einem Stift hinterm Ohr. Er sieht aus, als hätte er seit zehn Jahren dieselbe Nachricht offen. | Ansehen: Schreiber |
| W2\_THRO\_MAX\_0185 | Max | Der Stift hinter seinem Ohr steckt da schon so lange, dass er da inzwischen wohnt. | Ansehen: Schreiber, zweites Mal |
| W2\_THRO\_MAX\_0190 | Max | Ein goldener Sarkophag, an die Wand gelehnt. Und er hat eine Schlafmaske auf. | Ansehen: Sarkophag |
| W2\_THRO\_PIX\_0200 | Pixel | Das ist Ramses' Liege für den Mittagsschlaf, großzügig bemessen und mit Deckel gegen Störungen. // Ich würde sie sofort nehmen. Nur die Maske nicht. Ich schlafe mit offenem Geist. | Ansehen: Sarkophag, zweites Mal |
| W2\_THRO\_MAX\_0210 | Max | In der Nische steht eine mumifizierte Katze. Sie guckt genau wie Pixel, wenn ich den falschen Napf nehme. | Ansehen: Mumifizierte Katze |
| W2\_THRO\_PIX\_0220 | Pixel | Ein Vorfahre. Er sieht sehr ausgeruht aus, was nach viertausend Jahren Schlaf auch das Mindeste ist. // Ich bin so neidisch, dass ich es kaum in Worte fassen kann. // Ich tue es trotzdem, weil ich in Worten sehr gut bin. | Ansehen: Mumifizierte Katze, zweites Mal |
| W2\_THRO\_MAX\_0230 | Max | Der Fries an der Wand. Lauter Leute, die seitwärts tanzen, und einer hat einen riesigen Lautsprecher auf der Schulter. | Ansehen: Wandfries |
| W2\_THRO\_MAX\_0240 | Max | Der mit dem Lautsprecher tanzt als Einziger vorwärts. | Ansehen: Wandfries, zweites Mal |
| W2\_THRO\_PIX\_0250 | Pixel | Das Ding heißt Ghettoblaster. Es wog ungefähr so viel wie ich und fraß acht Batterien auf einmal. // Eine ehrliche Maschine. Laut, schwer und hungrig, wie alle guten Dinge auf dieser Welt. | Ansehen: Wandfries, drittes Mal |
| W2\_THRO\_MAX\_0260 | Max | Säulen voller Zeichen: Augen, Vögel, Hände. Wer hier einen Tippfehler macht, braucht einen Meißel. | Ansehen: Säulen |
| W2\_THRO\_MAX\_0265 | Max | Ein Auge, ein Vogel, eine Welle. Ich lese das als „Gucken, fliegen, nass werden“, aber vermutlich liege ich daneben. | Ansehen: Säulen, zweites Mal |
| W2\_THRO\_MAX\_0270 | Max | Eine Inschrift mit vier Feldern und darunter eine kleine Tabelle. Hier hat jemand die Spielregeln an die Wand gemeißelt. | Ansehen: Inschrift; öffnet Nahansicht |
| W2\_THRO\_MAX\_0275 | Max | Vier Felder, eine Tabelle. Wer das gemeißelt hat, hatte Angst, es zu vergessen. | Ansehen: Inschrift, zweites Mal; öffnet Nahansicht |
| W2\_THRO\_MAX\_0280 | Max | Erst, wer handelt. Dann, wem er dient. Dann, wen er bittet. Zuletzt die Tat als Körperteil: Ohr für Gehör, Mund für Brot, Hand für Gold. | Nahansicht Inschrift; Notizbuch Seite 2 |
| W2\_THRO\_PIX\_0290 | Pixel | Eine Grammatik, in der das Essen ein Mund ist. // Endlich eine Sprache, die verstanden hat, worauf es im Leben ankommt. | Nahansicht Inschrift, nach dem Lesen |
| W2\_THRO\_MAX\_0300 | Max | Eine hohe Tür. Dahinter klappert es, und es riecht nach Zwiebeln. Das ist die Küche. | Ansehen: Tür zur Küche |
| W2\_THRO\_PIX\_0310 | Pixel | Zwiebeln, Brot, Datteln und Fett. Ich will dir nicht vorschreiben, wohin du gehst. // Aber wenn du nicht sofort da entlang gehst, gehe ich allein, und ich komme nicht wieder. | Ansehen: Tür zur Küche, zweites Mal |
| W2\_THRO\_MAX\_0320 | Max | Ein goldener Teller neben dem Thron, leer. Das ist quasi ein Napf für Götter. | Ansehen: Pharaonenteller |
| W2\_THRO\_PIX\_0325 | Pixel | Ein goldener Napf, und er ist leer. Das ist eine Einladung. // Eine, die hier offenbar keiner annimmt. Ich schon. Ich nehme Einladungen immer an. | Ansehen: Pharaonenteller, zweites Mal |
| W2\_THRO\_MAX\_0330 | Max | Ich nehm den Teller mit. Falls irgendwer Gold in Scheibenform braucht. | Nehmen: Pharaonenteller; nach der Audienz |
| W2\_THRO\_RAM\_0340 | Ramses | Der Teller? Nimm ihn. Oder nicht. Nein, nimm ihn. Oder … ach, er ist schon weg. Gut. Dann ist das entschieden. | nach 0330 |
| W2\_THRO\_MAX\_0350 | Max | Fackeln und Sonnenstrahlen gleichzeitig. Das ist Stimmungsbeleuchtung, bevor es das Wort dafür gab. | Ansehen: Fackeln |
| W2\_THRO\_MAX\_0355 | Max | Die Fackeln qualmen, die Sonne nicht. Hier ist die Sonne das modernere Licht. | Ansehen: Fackeln, zweites Mal |

## 8. Thronsaal: Rätsel 2a, die Hieroglyphen-Botschaft

Der Schreiber gibt die Bildtafel mit 16 Kacheln. Max legt vier Zeichen in die Felder, der Schreiber liest das Ergebnis vor. Zielsatz: Mann, Katze, Pharao, Ohr. Die Lesung baut sich aus den Kachelnamen zusammen: „\[Feld 1\], Diener \[Feld 2\], bittet \[Feld 3\] um \[Feld 4\]“; Ohr liest er als Gehör, Mund als Brot, Hand als Gold, Auge als Blick, alles andere in Feld 4 als „um … irgendwas“.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_HIER\_MAX\_0010 | Max | Ich muss mit dem Pharao reden. | Reden: Schreiber, Einstieg |
| W2\_HIER\_SCH\_0020 | Schreiber | Dann schreib ihm. Vier Zeichen, ein Satz. Hier ist die Bildtafel mit sechzehn Kacheln. Mehr Zeichen hat der Pharao nie gelernt. | gibt die Bildtafel |
| W2\_HIER\_MAX\_0030 | Max | Eine Tafel mit Kacheln: Auge, Vogel, Krokodil, Brot, Katze, Sonne und so weiter. Das ist im Grunde ein Emoji-Menü aus Stein. | Ansehen: Bildtafel |
| W2\_HIER\_MAX\_0035 | Max | Ich such die Kachel mit dem Daumen hoch. Gibt's nicht. Die Antike hatte offenbar keine Likes. | Ansehen: Bildtafel, zweites Mal |
| W2\_HIER\_MAX\_0040 | Max | Gibt es eine Anleitung? | Option Schreiber |
| W2\_HIER\_SCH\_0050 | Schreiber | Steht an der Säule. Vier Felder, eine Tabelle. Hat mein Vorgänger reingemeißelt, weil er es sonst selbst vergessen hätte. | Hinweis auf die Inschrift |
| W2\_HIER\_MAX\_0310 | Max | Und wo ist dein Vorgänger jetzt? |  |
| W2\_HIER\_SCH\_0320 | Schreiber | In Rente. Er schreibt seiner Frau jetzt die Einkaufslisten, in Hieroglyphen. Seitdem geht sie allein einkaufen. |  |
| W2\_HIER\_MAX\_0060 | Max | Was soll in der Botschaft stehen? | Option Schreiber |
| W2\_HIER\_SCH\_0070 | Schreiber | Wer du bist, wem du dienst, wen du bittest, und worum. Und bitte nichts mit Käfern. Er hasst Käfer. |  |
| W2\_HIER\_MAX\_0330 | Max | Was hat er gegen Käfer? |  |
| W2\_HIER\_SCH\_0340 | Schreiber | Ein Skarabäus hat ihm beim Staatsempfang eine Mistkugel vor den Thron gerollt. Er redet nicht darüber, und wir auch nicht. |  |
| W2\_HIER\_MAX\_0080 | Max | Liest du ihm alles vor? | Option Schreiber |
| W2\_HIER\_SCH\_0090 | Schreiber | Alles, wörtlich und mit Betonung. Das ist mein Job, und einen anderen hab ich nicht. |  |
| W2\_HIER\_PIX\_0350 | Pixel | Auch die Beleidigungen? Ich frage aus rein beruflichem Interesse. |  |
| W2\_HIER\_SCH\_0360 | Schreiber | Die ganz besonders. Die betone ich am schönsten, und deshalb schreibt hier auch niemand Beleidigungen. |  |
| W2\_HIER\_MAX\_0100 | Max | Ich überlege noch. | Option Schreiber, beendet das Gespräch |
| W2\_HIER\_SCH\_0110 | Schreiber | Überleg schnell. Der Pharao überlegt nämlich auch, und zwar seit elf Jahren. |  |
| W2\_HIER\_SCH\_0120 | Schreiber | Das liest sich: „\[Satz\]“. Soll ich das wirklich vorlesen? Na gut. Ich les es vor. | jede falsche Kombination, Grundzeile; danach eine der Pointen oder 0220 |
| W2\_HIER\_SCH\_0130 | Schreiber | „Krokodil, Diener der Katze, bittet den Pharao um Brot.“ Das Krokodil hat Hunger. Ich würde das ernst nehmen. | Krokodil, Katze, Pharao, Mund |
| W2\_HIER\_SCH\_0140 | Schreiber | „Mann, Diener der Katze, bittet den Pharao um Gold.“ Um Gold? Das ist mutig. Falsch, aber mutig. | Mann, Katze, Pharao, Hand |
| W2\_HIER\_SCH\_0150 | Schreiber | „Mann, Diener des Pharaos, bittet die Katze um Gehör.“ Das ist falsch herum. Aber der Kater nickt. | Mann, Pharao, Katze, Ohr |
| W2\_HIER\_PIX\_0160 | Pixel | Endlich eine korrekte Botschaft. Lass sie bitte genau so, sie ist vollkommen. | nach 0150 |
| W2\_HIER\_PIX\_0170 | Pixel | „Katze, Diener des Mannes“? Ich diene niemandem, und schon gar nicht schriftlich. // Streich das. Streich das sofort, bevor es jemand liest und für Geschichte hält. | Katze in Feld 1 und Mann in Feld 2 |
| W2\_HIER\_SCH\_0180 | Schreiber | Ein Käfer. Ich hab Käfer gesagt. Ich hab ausdrücklich gesagt: keine Käfer. | Skarabäus in irgendeinem Feld |
| W2\_HIER\_SCH\_0190 | Schreiber | Du bittest ein Haus um Gehör. Häuser hören nicht zu, glaub mir, ich wohne in einem. | Haus in Feld 3 |
| W2\_HIER\_SCH\_0200 | Schreiber | „Vogel, Diener des Krokodils.“ Der Vogel ist nicht sein Diener. Der Vogel ist sein Mittagessen. | Vogel in Feld 1 und Krokodil in Feld 2 |
| W2\_HIER\_SCH\_0210 | Schreiber | „Der Pharao, Diener des Mannes.“ Wenn ich das vorlese, schleppe ich morgen Steine für die Pyramide. | Pharao in Feld 1 |
| W2\_HIER\_SCH\_0220 | Schreiber | „… bittet um Sonne.“ Um Sonne, in Ägypten. Wir haben wirklich genug, danke. | Sonne in Feld 4 |
| W2\_HIER\_SCH\_0230 | Schreiber | „… bittet um Wasser.“ Da draußen ist ein Fluss. Ein ziemlich großer sogar. | Wasser in Feld 4 |
| W2\_HIER\_SCH\_0240 | Schreiber | „… bittet um Brot.“ Dafür ist die Küche zuständig, nicht der Thron. Die Tür rechts. | Mund in Feld 4, sonst richtig |
| W2\_HIER\_MAX\_0250 | Max | Mann, Katze, Pharao, Ohr: „Diener der Katze bittet den Pharao um Gehör.“ Das stimmt sogar. Leider. | richtige Kombination |
| W2\_HIER\_SCH\_0260 | Schreiber | Grammatisch sauber, inhaltlich seltsam. Ich trag's rein. | nimmt die Tafel |
| W2\_HIER\_PIX\_0270 | Pixel | „Diener der Katze.“ Ich möchte, dass das auf deinem Hoodie steht, junger Mann. // In Gold, auf dem Rücken, damit es jeder lesen kann, der hinter dir hergeht. Also ich. | nach 0260 |
| W2\_HIER\_SCH\_0280 | Schreiber | Der Pharao hat gelesen. Also, ich hab gelesen, und er hat genickt. Er empfängt euch, sobald der Kater euch durchlässt. Viel Glück. | zurück vom Thron; Rätsel 2a gelöst |
| W2\_HIER\_MAX\_0290 | Max | Ich könnte das mit dem Kugelschreiber dazukritzeln. Aber dann würde der Schreiber weinen, und das will ich nicht. | Kugelschreiber auf Bildtafel |
| W2\_HIER\_MAX\_0300 | Max | Pixel auf die Tafel legen? Dann lautet die Botschaft einfach nur „Katze“. Vielleicht würde das sogar reichen. | Pixel auf Bildtafel |

## 9. Thronsaal: Rätsel 2b, das Götter-Duell

Der Hofkater zweifelt Pixels Gottstatus an. Pixel fordert ihn heraus: Wer mehr Verbeugungen bekommt, gewinnt. Ein Gott braucht Opfergabe, Gefolge und Wunder. Max besorgt die Thunfischdose (vorgezeigt), Sobek (kriecht Pixel hinterher) und die Kaugummiblase oder den Lichtblitz aus Archimedes' Brennspiegel. Der Hofkater hat nur zwei von drei. Das Gespräch mit dem Hofkater führt Pixel als Spielfigur.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_DUEL\_MAX\_0010 | Max | Entschuldigung, ich würde gern mal durch. | Max auf Hofkater (Reden oder Benutzen) |
| W2\_DUEL\_HOF\_0020 | Hofkater | Fsssch. | rührt sich nicht |
| W2\_DUEL\_MAX\_0030 | Max | Der redet nicht mit mir. Er hat kein Halsband mit Lautsprecher, nur sehr viel Meinung. Pixel, das ist deine Abteilung. |  |
| W2\_DUEL\_PIX\_0040 | Pixel | Verzeihung. Du sitzt auf meinem Kissen. | Spielfigur Pixel: Reden mit Hofkater |
| W2\_DUEL\_HOF\_0050 | Hofkater | Ich sitze auf dem Kissen des Hofes. Du bist eine Hauskatze mit Elektronik am Hals. | Lautsprecher übersetzt, blechern |
| W2\_DUEL\_PIX\_0060 | Pixel | Ich bin ein Gott, du Sofakissenbewohner. Das Krokodil hat sich vor mir verneigt, der Fährmann hat sich verneigt, // und ein Grashalm am Ufer hat sich, wenn ich mich recht erinnere, ebenfalls verneigt. Es war windstill. |  |
| W2\_DUEL\_HOF\_0070 | Hofkater | Ein Gott hat eine Opfergabe, ein Gefolge und ein Wunder. Ich habe eine Opfergabe und ein Gefolge. Du hast einen Jungen mit Sand im Schuh. |  |
| W2\_DUEL\_PIX\_0080 | Pixel | Dann zählen wir Verbeugungen, hier und jetzt, vor dem Thron. Wer mehr bekommt, bekommt das Kissen. // Und das Ohr. // Ich meine, den Ohrring. Ich meine, das Kissen. Du hast genau verstanden, was ich meine. | Duell angenommen |
| W2\_DUEL\_MAX\_0090 | Max | Ein Duell zwischen zwei Katern um ein Kissen. Ich hab schon Realityshows gesehen, bei denen es um weniger ging, aber nicht viele. |  |
| W2\_DUEL\_MAX\_0100 | Max | Opfergabe, Gefolge, Wunder. Drei Sachen. Opa würde sagen, das ist eine Einkaufsliste. | Notizbuch Seite 1 |
| W2\_DUEL\_MAX\_0110 | Max | Eine Schale mit Datteln vor dem Kissen. Das ist seine Opfergabe, von der Küche gespendet, wahrscheinlich nicht ganz freiwillig. | Ansehen: Opferschale des Hofkaters |
| W2\_DUEL\_PIX\_0115 | Pixel | Datteln. Für ihn. Von der Küche. // Ich habe soeben einen Antrag auf Gleichbehandlung gestellt. Bei mir selbst. Er wird gerade wohlwollend geprüft. | Ansehen: Opferschale des Hofkaters, zweites Mal |
| W2\_DUEL\_MAX\_0120 | Max | Zwei schwitzende Männer mit Palmwedeln. Das ist sein Gefolge. Großes Gefolge, wenig Begeisterung. | Ansehen: Fächerwedler, während des Duells |
| W2\_DUEL\_MAX\_0125 | Max | Die wedeln jetzt für den Kater. Die haben nicht so genau nachgefragt, für wen. | Ansehen: Fächerwedler, während des Duells, zweites Mal |
| W2\_DUEL\_MAX\_0130 | Max | Hier, bitte schön. Eine Dose, silbern, glänzend und leer. Unsere Opfergabe. | Thunfischdose auf Hofkater oder vor das Kissen |
| W2\_DUEL\_HOF\_0140 | Hofkater | Leer. | schnuppert |
| W2\_DUEL\_PIX\_0150 | Pixel | Leer ist eine Frage der Haltung. Sie glänzt, mein Lieber. // Deine Datteln dagegen glänzen nicht. Sie kleben bloß, und Kleben ist keine Ausstrahlung. | Opfergabe zählt; ein Diener verneigt sich |
| W2\_DUEL\_PIX\_0160 | Pixel | Der Gott behält seine Opfergabe selbstverständlich. Das ist ein göttliches Vorrecht, und ich nehme es sehr ernst. | nimmt die Dose zurück; Dose bleibt im Inventar |
| W2\_DUEL\_MAX\_0170 | Max | Sobek kriecht durch den Thronsaal, immer hinter Pixel her. Ein sehr langer, sehr grüner Fan. | Sobek folgt Pixel in den Thronsaal (Pixel am Steg: Spielfigur Pixel benutzt Sobek, danach folgt er) |
| W2\_DUEL\_HOF\_0180 | Hofkater | Ein Krokodil. Als Gefolge. Das ist … das ist unfair. Das ist einfach nur unfair. | weicht auf dem Kissen zurück |
| W2\_DUEL\_PIX\_0190 | Pixel | Das, mein Lieber, ist ein Gefolge mit Zähnen. // Deine Wedler haben Wedel. Mein Gefolge hat zweiundsechzig Zähne und eine sehr kurze Geduld. Ich habe nachgezählt. | Gefolge zählt; zweiter Diener verneigt sich |
| W2\_DUEL\_SOB\_0200 | Sobek | (glückliches Schnauben) | Lautsprecher: „Übersetzung: Er möchte gestreichelt werden. Von niemandem.“ |
| W2\_DUEL\_MAX\_0210 | Max | Ein Wunder? Ich hab einen Kaugummi. Erdbeere. | Kaugummi im Inventar ansehen während des Duells |
| W2\_DUEL\_MAX\_0220 | Max | Okay. Ein Wunder, bitte sehr. | Kaugummi benutzen im Thronsaal; Kaugummi wird verbraucht; Notizbuch: Baustein „Sonne“ |
| W2\_DUEL\_NAR\_0230 | – | Max kaut. Eine rosa Blase wächst, löst sich, steigt auf und schwebt leuchtend unter die Decke. | Effekt Kaugummi-Sonne |
| W2\_DUEL\_HOF\_0240 | Hofkater | Eine kleine Sonne. Rosa. Sie schwebt. Ich … ich habe keine Sonne. | starrt nach oben |
| W2\_DUEL\_MAX\_0250 | Max | Hier. Ein Spiegel und die Sonne, und schon hab ich eine antike Taschenlampe. | Brennspiegel benutzen im Thronsaal; nur wenn der Kaugummi schon weg ist |
| W2\_DUEL\_NAR\_0260 | – | Ein Lichtstrahl schießt vom Spiegel über die Säulen und endet in einem weißen Blitz. Der Hofkater fällt vom Kissen. | Effekt Brennspiegel |
| W2\_DUEL\_RAM\_0270 | Ramses | Ein Wunder! Oder ein Unfall! Oder … nein. Ein Wunder. Ich habe mich entschieden. Fast. | vom Thron |
| W2\_DUEL\_NAR\_0280 | – | Schreiber, Fächerwedler, Diener und Sobek verneigen sich vor Pixel. Der Hofkater zählt nach. Dreimal. | Wunder zählt; Duell entschieden |
| W2\_DUEL\_HOF\_0290 | Hofkater | Drei zu zwei. Ich gratuliere nicht, ich gehe. Das Kissen ist sowieso durchgelegen. | steht auf, Schwanz hoch |
| W2\_DUEL\_PIX\_0300 | Pixel | Hat er eben gesagt, es sei durchgelegen? // Es ist nicht durchgelegen. Es ist perfekt, es hat genau die richtige Kuhle, und es ist meins. // Ich bin ein Gott. Götter liegen nicht durch. Sie liegen ein. | springt aufs Kissen; Hofkater zieht beleidigt ab |
| W2\_DUEL\_MAX\_0310 | Max | Drei zu zwei. Der Grashalm hätte den Unterschied gemacht. |  |
| W2\_DUEL\_PIX\_0320 | Pixel | Ich möchte etwas festhalten: Ab heute kein Dosenfutter mehr. Götter essen frisch. // Mit einer Ausnahme, und zwar Thunfisch. Thunfisch ist immer eine Ausnahme. // Das ist kein Widerspruch. Das ist Theologie. | nach dem Duell, einmalig |
| W2\_DUEL\_MAX\_0330 | Max | Den Hofkater mit dem Kugelschreiber beeindrucken? Der hat garantiert schon gesehen, wie Leute damit Mathebücher bemalen. | Kugelschreiber auf Hofkater |
| W2\_DUEL\_MAX\_0340 | Max | Ein Handy ist hier kein Wunder, sondern ein Zauberstein mit drei Prozent. Das zählt noch nicht mal als Taschenlampe. Noch nicht. | Handy auf Hofkater; Handy bleibt; Notizbuch: Baustein „leuchtet kurz“ |
| W2\_DUEL\_HOF\_0350 | Hofkater | Fsssch. Eine Dose ohne Inhalt. Eine Fliege ohne Flügel. | Thunfischdose vor dem Duell (Pixel hat noch nicht geredet) |
| W2\_DUEL\_MAX\_0360 | Max | Pixel auf den Hofkater werfen? Dann gibt's Fell, und zwar überall. Lieber erst reden lassen. | Pixel auf Hofkater, als Inventar-Versuch |

## 10. Thronsaal: Die Audienz

Szene, läuft, sobald die Botschaft gelesen und der Hofkater fort ist. Danach bleibt Ramses mit Gesprächsbaum im Thronsaal.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_AUDI\_RAM\_0010 | Ramses | Der Diener der Katze. Und die Katze. Tretet näher. Oder bleibt stehen. Nein, näher. Ja. Genau da. | winkt mit beiden Zeptern |
| W2\_AUDI\_MAX\_0020 | Max | Hi. Ich bräuchte den Goldenen Sack Pharaonenkorn, bitte. |  |
| W2\_AUDI\_RAM\_0030 | Ramses | Den Sack? Mein Volk würde mich auslachen. Es lacht mich schon aus. Es sagt, ich könne mich nicht entscheiden. // Das ist … teilweise … möglicherweise … | verstummt |
| W2\_AUDI\_PIX\_0040 | Pixel | Er ist mit dem Satz noch nicht fertig. // Ich hole mir in der Zwischenzeit etwas aus der Küche und komme wieder, bevor er beim Verb angekommen ist. |  |
| W2\_AUDI\_RAM\_0050 | Ramses | Wahr! Teilweise wahr. Ich brauche Ansehen, und Ansehen bekommt man nur durch einen Sieg. In Olympia, im Fünfkampf. Alle fünf. | Entschluss, dann Zweifel |
| W2\_AUDI\_MAX\_0060 | Max | Ich soll also Sport machen. Fünf verschiedene Sorten. |  |
| W2\_AUDI\_RAM\_0070 | Ramses | Du gewinnst für Ägypten, mein Volk jubelt, und ich gebe dir den Sack. Vielleicht. Nein. Ganz sicher. Vermutlich. |  |
| W2\_AUDI\_MAX\_0080 | Max | Ich hab noch nie was gewonnen, bei dem man schwitzen muss. |  |
| W2\_AUDI\_PIX\_0090 | Pixel | Er hat noch nie etwas gewonnen, Punkt. // Ausgenommen einen Streit mit dem Router, und selbst den hat der Router gewonnen. |  |
| W2\_AUDI\_MAX\_0095 | Max | Der Router hat geschummelt. Der hat einfach aufgehört zu blinken, als ich recht hatte. |  |
| W2\_AUDI\_RAM\_0100 | Ramses | Die Spiele beginnen, sobald du einen Startpass hast. Den gibt es in Olympia, im Büro. Oder im anderen Büro. Ich weiß es nicht. |  |
| W2\_AUDI\_MAX\_0110 | Max | Sport. Freiwillig. Die spinnen, die Griechen. | Audienz beendet; Ziel im Notizbuch |

Gesprächsbaum Ramses, nach der Audienz:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_AUDI\_MAX\_0210 | Max | Warum nennt man dich den Unentschlossenen? | Option Ramses |
| W2\_AUDI\_RAM\_0220 | Ramses | Man hat mir zwei Namen vorgeschlagen: der Große und der Weise. Ich überlege noch, seit elf Jahren. Inzwischen heiße ich eben so. |  |
| W2\_AUDI\_MAX\_0360 | Max | Und welcher Name hätte dir besser gefallen? |  |
| W2\_AUDI\_RAM\_0370 | Ramses | Der Große. Oder der Weise. Siehst du? Jetzt geht es schon wieder los. |  |
| W2\_AUDI\_MAX\_0230 | Max | Was ist das Pharaonenkorn eigentlich? | Option Ramses |
| W2\_AUDI\_RAM\_0240 | Ramses | Das feinste Korn des Reiches. Gemahlen, gesiebt, gesegnet, mit Siegel. Man könnte … Dinge daraus machen. Ich weiß nur nicht, welche. |  |
| W2\_AUDI\_PIX\_0250 | Pixel | Ich weiß, welche. Dinge mit Kruste. Es steht bereits in meinem Notizbuch. // Also in deinem. Also in meinem, das du für mich führst. | nach 0240 |
| W2\_AUDI\_MAX\_0260 | Max | Was weißt du über den Fünfkampf? | Option Ramses |
| W2\_AUDI\_RAM\_0270 | Ramses | Lauf, Sprung, Speer, Diskus, Ringen, an zwei Tagen. Ich reise an, mit Hofstaat, mit Wedlern, mit allem. Ich habe mich entschieden. Oder? Ja. |  |
| W2\_AUDI\_MAX\_0380 | Max | Du kommst also ganz sicher? |  |
| W2\_AUDI\_RAM\_0390 | Ramses | Ziemlich sicher. Die Wedler sind schon geölt, und bei uns ist das so gut wie ein Schwur. |  |
| W2\_AUDI\_MAX\_0280 | Max | Kannst du mich wenigstens irgendwie unterstützen? | Option Ramses |
| W2\_AUDI\_RAM\_0290 | Ramses | Ich kann großzügig werten. Wenn es schlecht läuft, sehr schlecht, zweimal schlecht, dann sage ich: Das war gut genug. // Das ist meine Stärke. Meine einzige. | führt die Nachsicht-Regel ein |
| W2\_AUDI\_PIX\_0400 | Pixel | Großzügig werten. Bei uns zu Hause nennt man so etwas Bestechung. Mit Krone klingt es bloß vornehmer. |  |
| W2\_AUDI\_RAM\_0410 | Ramses | Bei uns nennt man das Gnade. Bestechung wäre es nur, wenn ich etwas davon hätte. Habe ich etwas davon? Ich überlege noch. |  |
| W2\_AUDI\_MAX\_0300 | Max | Warum ist dein Volk unzufrieden? | Option Ramses |
| W2\_AUDI\_RAM\_0310 | Ramses | Es will Brot und Spiele. Brot habe ich. Aber Spiele? Welche denn? Brettspiele? Wettspiele? Siehst du, genau das ist das Problem. |  |
| W2\_AUDI\_MAX\_0420 | Max | Ein Wettkampf ist doch auch ein Spiel. Und Brot verkauft man dann einfach am Rand. |  |
| W2\_AUDI\_RAM\_0430 | Ramses | Ein Spiel mit Brot am Rand … Schreib das auf. Nein, nicht aufschreiben. Doch. Später. |  |
| W2\_AUDI\_MAX\_0320 | Max | Ich geh dann mal trainieren. | Option Ramses, beendet das Gespräch |
| W2\_AUDI\_RAM\_0330 | Ramses | Geh. Oder bleib. Geh. Ich meine es ernst. Vermutlich. |  |
| W2\_AUDI\_MAX\_0340 | Max | Ramses den Kugelschreiber zeigen? Dann muss er sich zwischen Kuli und Binse entscheiden, und das überlebt er nicht. | Kugelschreiber auf Ramses |
| W2\_AUDI\_RAM\_0350 | Ramses | Ein Kranz! Aus Oliven! Der Sieg! Sofort zur Parade. Nein, erst das Volk. Nein, erst … Zeremonienmeister! | Olivenkranz auf Ramses im Stadion, nach dem Finaltag, solange der Paraden-Plan nicht gelöst ist |

## 11. Palastküche: Rätsel 4, das Olivenöl

Köchin Nebet gibt einen ganzen Krug Olivenöl nur gegen ein neues Gericht für ihre Fusionsküche. Weg A: Kaugummi als „ewiges Brot“. Weg B: Max backt nach Pixels Anweisung einen Fladen aus Brot, Datteln und Zwiebeln im Lehmofen. Hier steht auch der Traubensaft für die Parade (Rätsel 11).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_KUCH\_PIX\_0010 | Pixel | Brot. Zwiebeln. Datteln. Fett. Rauch. // Ich bin zu Hause. Ich war zwar noch nie in meinem Leben hier, // aber genau so muss es sich anfühlen, wenn man nach einer langen Reise endlich heimkehrt. | erstes Betreten |
| W2\_KUCH\_MAX\_0020 | Max | Eine Köchin mit Mehl im Gesicht und einer Kelle in der Hand. Sie guckt mich an, als wär ich eine Zutat. | Ansehen: Nebet |
| W2\_KUCH\_MAX\_0025 | Max | Sie rührt mit der einen Hand und zeigt mit der Kelle in der anderen auf mich. Und dabei schmeckt sie auch noch ab. | Ansehen: Nebet, zweites Mal |
| W2\_KUCH\_MAX\_0030 | Max | Zwei runde Lehmöfen, innen Feuer, außen heiß. Hier gibt's keinen Timer, hier gibt's nur Erfahrung und Geduld. | Ansehen: Lehmöfen |
| W2\_KUCH\_MAX\_0035 | Max | Die Öfen knistern, und es riecht nach Brot. Ich hab Hunger, und das ist nicht mal mein Jahrtausend. | Ansehen: Lehmöfen, zweites Mal |
| W2\_KUCH\_MAX\_0040 | Max | Brot, Zwiebeln und eine Schale Datteln. Das ist seit dreitausend Jahren das Menü. | Ansehen: Schneidetisch |
| W2\_KUCH\_PIX\_0050 | Pixel | Das Brot hat Kruste. Ich wiederhole, damit es auch bei dir ankommt: Kruste. // Schreib das auf. Ja, ich weiß, dass es schon drinsteht. Schreib es trotzdem noch einmal hin, und zwar größer. | Ansehen: Schneidetisch, zweites Mal |
| W2\_KUCH\_MAX\_0060 | Max | Hohe Tonkrüge voller Olivenöl. Es riecht wie in der Pizzeria bei uns an der Ecke, und jetzt hab ich Hunger auf Pizza. | Ansehen: Ölkrüge |
| W2\_KUCH\_MAX\_0065 | Max | Ich zähl die Krüge und hör bei zwölf auf. In einem davon sitzt bestimmt ein Räuber. Oder gleich vierzig. | Ansehen: Ölkrüge, zweites Mal |
| W2\_KUCH\_NEB\_0070 | Nebet | Finger weg vom Öl! Das Öl ist für Köche, und du bist kein Koch. Du bist ein Junge mit Sand im Haar. | Nehmen: Ölkrug, vor der Lösung |
| W2\_KUCH\_MAX\_0080 | Max | Leere Amphoren. Wenn das Pfandflaschen wären, könnte ich mir davon locker eine Fährfahrt leisten. | Ansehen: Leere Amphoren |
| W2\_KUCH\_MAX\_0085 | Max | Die leeren Amphoren stehen ordentlich in einer Reihe. Hier hat jemand nach der Party sogar aufgeräumt. | Ansehen: Leere Amphoren, zweites Mal |
| W2\_KUCH\_MAX\_0090 | Max | Knoblauch und Kräuter hängen von der Decke. Riecht gesund, deshalb halt ich lieber Abstand. | Ansehen: Knoblauch und Kräuter |
| W2\_KUCH\_PIX\_0095 | Pixel | Knoblauch. Den rieche ich drei Räume weit, und zwar gegen den Wind. // Er ist der einzige Grund, junger Mann, warum ich nicht auf der Stelle hier einziehe. | Ansehen: Knoblauch und Kräuter, zweites Mal |
| W2\_KUCH\_MAX\_0100 | Max | Eine Amphore mit Trauben drauf. Traubensaft, steht da. Zumindest noch. | Ansehen: Traubensaft-Amphore |
| W2\_KUCH\_MAX\_0105 | Max | Traubensaft, der in hundert Jahren Essig wird. Er hat seine Zukunft quasi schon hinter sich. | Ansehen: Traubensaft-Amphore, zweites Mal |
| W2\_KUCH\_MAX\_0110 | Max | Ich nehm den Saft mit. Falls jemand Durst hat. Oder in hundert Jahren Essig braucht. | Nehmen: Traubensaft; Sanduhr-Symbol im Inventar |
| W2\_KUCH\_NEB\_0120 | Nebet | Den Saft kannst du haben. Der Pharao kann sich nicht zwischen Saft und Wein entscheiden, also trinkt er Wasser. | nach 0110 |
| W2\_KUCH\_MAX\_0130 | Max | Dampf, überall. Hier kocht wenigstens jemand, der es wirklich kann, und nicht bloß für die Kamera. | Ansehen: Dampf |
| W2\_KUCH\_MAX\_0135 | Max | Ich hab den Dampf eingeatmet. Jetzt bin ich zu ungefähr fünf Prozent Linseneintopf. | Ansehen: Dampf, zweites Mal |
| W2\_KUCH\_MAX\_0140 | Max | Hallo. Ich bräuchte etwas Öl, wenn das geht. | Reden: Nebet, Einstieg |
| W2\_KUCH\_NEB\_0150 | Nebet | Jeder braucht Öl! Der Pharao braucht Öl, die Wedler brauchen Öl, und der Kater braucht Öl, wenn man ihn ansieht. // Was gibst du mir dafür? | rührt weiter |
| W2\_KUCH\_MAX\_0160 | Max | Was würdest du denn nehmen? | Option Nebet |
| W2\_KUCH\_NEB\_0170 | Nebet | Ein neues Gericht. Etwas, das es hier nicht gibt. Ich koche Fusionsküche: Ägypten trifft Griechenland trifft … irgendwas. // Aber mir fehlt das Irgendwas. |  |
| W2\_KUCH\_MAX\_0490 | Max | Bei uns gibt es Pizza Hawaii. Da trifft Italien auf Ananas, und seitdem streiten sich alle darüber. |  |
| W2\_KUCH\_NEB\_0500 | Nebet | Ananas? Das klingt wie ein Gott, den man besser nicht beleidigt. Ich schreib's mir auf, unter „vielleicht“. |  |
| W2\_KUCH\_MAX\_0180 | Max | Was ist Fusionsküche? | Option Nebet |
| W2\_KUCH\_NEB\_0190 | Nebet | Du nimmst zwei Dinge, die nichts miteinander zu tun haben, und steckst sie zusammen in einen Ofen. // So ist diese ganze Welt hier entstanden, Junge. Bei mir kann man das Ergebnis wenigstens essen. |  |
| W2\_KUCH\_PIX\_0200 | Pixel | Ich mag diese Frau. Sie denkt in Öfen. // Das ist die einzige Art zu denken, die ich für wirklich zukunftsfähig halte. | nach 0190 |
| W2\_KUCH\_MAX\_0210 | Max | Wofür brauchen die Fächerwedler Öl? | Option Nebet (bleibt) |
| W2\_KUCH\_NEB\_0220 | Nebet | Für die Wedel, damit sie nicht knarren. Aber viel lieber hätten sie Feigen, frische Feigen. Sie reden von nichts anderem. | Hinweis Rätsel 6 |
| W2\_KUCH\_MAX\_0510 | Max | Aber Feigen wachsen hier doch überall. |  |
| W2\_KUCH\_NEB\_0520 | Nebet | Die Bäume tragen erst wieder in ein paar Jahren, und die Wedler wollen nicht warten. Wedler warten nie, Wedler wedeln. |  |
| W2\_KUCH\_MAX\_0230 | Max | Hast du ein Rezept für mich? | Option Nebet (bleibt) |
| W2\_KUCH\_NEB\_0240 | Nebet | Ich habe hundert Rezepte, mir fehlt das hundertunderste. Frag doch deinen Kater. Katzen wissen, was schmeckt, das ist ihr ganzer Beruf. | Hinweis Weg B |
| W2\_KUCH\_MAX\_0530 | Max | Pixel? Was schmeckt denn so? |  |
| W2\_KUCH\_PIX\_0540 | Pixel | Alles, was du mir nicht gibst. Das ist die ehrliche Antwort. // Die hilfreiche Antwort bekommst du später, unter vier Augen, wenn die Köchin nicht zuhört und mir nichts klauen kann. |  |
| W2\_KUCH\_MAX\_0250 | Max | Ich komm wieder. | Option Nebet, beendet das Gespräch |
| W2\_KUCH\_NEB\_0260 | Nebet | Dann komm mit etwas Neuem. Oder gar nicht. |  |
| W2\_KUCH\_MAX\_0270 | Max | Hier, ewiges Brot. Man kaut drauf herum, und es wird einfach nie alle. | Kaugummi auf Nebet; Kaugummi wird verbraucht |
| W2\_KUCH\_NEB\_0280 | Nebet | Nie alle? | nimmt, kaut, kaut, kaut |
| W2\_KUCH\_NEB\_0290 | Nebet | Es wird nicht weniger. Es wird nicht weniger! Ich kaue seit einer Minute, und es wird einfach nicht weniger! | begeistert; Notizbuch: Rätsel-Baustein „wird nie alle“ |
| W2\_KUCH\_PIX\_0300 | Pixel | Sie kaut etwas, das kein Essen ist, und ist glücklich dabei. // Ich sehe weg. Das bin ich dem Essen schuldig. |  |
| W2\_KUCH\_NEB\_0310 | Nebet | Ewiges Brot! Das ist Fusion! Das ist Zukunft! Hier, der ganze Krug, nimm ihn. Und jetzt geh, bevor ich es mir anders überlege. | gibt Olivenöl; Rätsel 4 gelöst |
| W2\_KUCH\_PIX\_0320 | Pixel | Du willst also ein Rezept von mir. Gut. Hör zu, ich sage es nur dreimal. // Man nehme Brot. Darauf Datteln. Darauf Zwiebeln. // Dann in den Ofen damit, bis es knackt. Das nennt man Kruste, und Kruste nennt man Kunst. | Reden: Pixel in der Küche, nach 0240; Weg B frei |
| W2\_KUCH\_MAX\_0330 | Max | Ein Fladen. Flach, rund, warm. Pixel hat schon zweimal draufgeguckt. | Nehmen: Brot vom Tisch |
| W2\_KUCH\_MAX\_0340 | Max | Datteln, klebrig, süß und voller Kerne. Die Natur hat Süßigkeiten erfunden und vergessen, die Kerne rauszunehmen. | Nehmen: Datteln |
| W2\_KUCH\_MAX\_0350 | Max | Eine Zwiebel. Die einzige Zutat, die sich wehrt. | Nehmen: Zwiebel |
| W2\_KUCH\_MAX\_0360 | Max | Brot mit Datteln. Das sieht aus wie ein Fehler, den jemand mit voller Absicht gemacht hat. | Brot mit Datteln kombinieren |
| W2\_KUCH\_MAX\_0370 | Max | Und Zwiebeln obendrauf. Pixel sagt, das ist Kunst. Pixel frisst allerdings auch Spinnen. | Fladen mit Zwiebel kombinieren |
| W2\_KUCH\_MAX\_0380 | Max | Ab in den Ofen. Und jetzt warten, ohne Fortschrittsbalken und ohne Ahnung, wie lange. | roher Fladen auf Lehmofen |
| W2\_KUCH\_PIX\_0390 | Pixel | Es knackt. Hörst du das? Das ist Kruste, die gerade entsteht. // Es ist das schönste Geräusch der Welt, gleich nach dem Geräusch eines Dosenöffners. | während des Backens |
| W2\_KUCH\_MAX\_0400 | Max | Hier, bitte. Ein Dattel-Zwiebel-Fladen nach einem Rezept vom Kater. | Fladen mit Kruste auf Nebet |
| W2\_KUCH\_NEB\_0410 | Nebet | Süß, scharf und knusprig. Und das Rezept ist von einer Katze! Das ist Fusion in Reinform. Der ganze Krug gehört dir. | gibt Olivenöl; Rätsel 4 gelöst |
| W2\_KUCH\_PIX\_0420 | Pixel | Ich bekomme nichts davon ab? Nicht einmal einen Krümel? Ich habe es erfunden. // Das ist Diebstahl geistigen Eigentums. Mit Kruste. | nach 0410 |
| W2\_KUCH\_MAX\_0430 | Max | Ein Krug Olivenöl, ziemlich schwer. Riecht nach Salat. | Ansehen: Olivenöl im Inventar |
| W2\_KUCH\_MAX\_0435 | Max | Der Krug ist rutschig. Ich trag ihn wie ein Baby, das mich nicht mag. | Ansehen: Olivenöl im Inventar, zweites Mal |
| W2\_KUCH\_MAX\_0440 | Max | Ihr die Dose zeigen? Sie hat zehn davon, aus Ton und mit Deckel. | Thunfischdose auf Nebet |
| W2\_KUCH\_MAX\_0450 | Max | Das Handy als Rezept? Da ist zwar eine Koch-App drauf, aber drei Prozent reichen höchstens für die Zutatenliste. | Handy auf Nebet; nichts passiert |
| W2\_KUCH\_MAX\_0460 | Max | Den Traubensaft in den Ofen stellen? Dann hab ich heißen Traubensaft, und Opa nennt das Punsch. | Traubensaft auf Lehmofen |
| W2\_KUCH\_MAX\_0470 | Max | Den rohen Fladen abgeben? Damit würde sie mich bewerfen, und zwar zu Recht. | roher Fladen auf Nebet |
| W2\_KUCH\_PIX\_0480 | Pixel | Du wolltest mich gerade in den Ofen stecken. Ich habe es gesehen. // Ich merke mir das. Ich merke mir alles, und ich habe ein sehr langes Gedächtnis und sehr viel Zeit. | Pixel auf Lehmofen |

## 12. Die Sphinx: Rätsel 8, Schreibblockade

Die Sphinx gibt ihre Schriftrolle nur gegen ein Rätsel, das sie nicht lösen kann. Max wählt ein Lösungswort (Handy, Kaugummi, Kugelschreiber) und legt dazu drei Rätsel-Bausteine aus dem Notizbuch. Die neun Bausteine sammelt er in der Welt: Handy: „Es klingelt, wenn jemand dich will“ (Ansehen Handy), „Es leuchtet im Dunkeln, aber nur kurz“ (Hofkater-Duell oder Ansehen Handy, zweites Mal), „Es stirbt bei drei Prozent“ (Fährmann). Kaugummi: „Es wird nie alle“ (Nebet oder Ansehen Kaugummi), „Es klebt unter jedem Tisch“ (Ansehen Kaugummi, zweites Mal), „Man kann daraus eine Sonne machen“ (Duell). Kugelschreiber: „Es schreibt ohne Tintenfass“ (Beamte oder Ansehen Kugelschreiber), „Es klickt, wenn man nervös ist“ (Ansehen Kugelschreiber, zweites Mal), „Es ist blau und hat trotzdem keine Laune“ (Tiro). Die Sphinx kommentiert immer den ersten Baustein, der nicht zum Wort passt.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_SPHX\_MAX\_0010 | Max | Hat ein Rätsel im Gesicht und keine Ahnung im Kopf. | Ansehen: Sphinx |
| W2\_SPHX\_PIX\_0020 | Pixel | Ein Löwenkörper mit einem Menschenkopf. // Und ausgerechnet die falsche Hälfte ist fürs Denken zuständig, wenn du mich fragst. | Ansehen: Sphinx, zweites Mal |
| W2\_SPHX\_MAX\_0030 | Max | Ein Schreibpult, so groß wie ein Auto, und daneben zerknüllte Papyri. Hier hat jemand sehr viel nicht geschrieben. | Ansehen: Schreibpult |
| W2\_SPHX\_MAX\_0035 | Max | Das Pult ist so groß, dass ich darunter wohnen könnte. Mit Blick auf zerknülltes Papier. | Ansehen: Schreibpult, zweites Mal |
| W2\_SPHX\_MAX\_0040 | Max | Zerknüllte Papyri. Auf allen steht „Was hat vier Beine und …“, und dann kommt nichts mehr. | Ansehen: zerknüllte Papyri |
| W2\_SPHX\_MAX\_0045 | Max | Ich hab einen glattgestrichen. „Was hat …“ Da hat sie aufgegeben, bevor das Rätsel überhaupt angefangen hat. | Ansehen: zerknüllte Papyri, zweites Mal |
| W2\_SPHX\_MAX\_0050 | Max | Ein Notizblock mit einem einzigen Wort: „Rätsel“. Darunter ein Strich und darunter nichts. | Ansehen: Notizblock |
| W2\_SPHX\_MAX\_0055 | Max | Ein Wort und ein Strich. Der Strich ist sehr gerade. Darauf ist sie stolz. | Ansehen: Notizblock, zweites Mal |
| W2\_SPHX\_MAX\_0060 | Max | Fußspuren im Sand. Jemand ist hergekommen, hat sich das Gesicht angeguckt und ist gegangen. Rückwärts. | Ansehen: Fußspuren |
| W2\_SPHX\_PIX\_0065 | Pixel | Die Spuren führen hin und wieder zurück, und zurück sind sie deutlich schneller. // Das ist ein Laufmuster, das ich zutiefst respektiere. Ich wende es bei Tierärzten an. | Ansehen: Fußspuren, zweites Mal |
| W2\_SPHX\_MAX\_0070 | Max | Eine riesige Steinkugel in einer Rinne, direkt über dem Pult. Ich kenn das, und das geht nie gut aus. | Ansehen: Steinkugel |
| W2\_SPHX\_MAX\_0075 | Max | Ich hab einen Rucksack, aber weder Hut noch Peitsche. Wenn die Kugel rollt, renn ich trotzdem, bloß deutlich uncooler. | Ansehen: Steinkugel, zweites Mal |
| W2\_SPHX\_SPH\_0080 | Sphinx | Keine Sorge. Die rollt gleich los. Schon seit dreihundert Jahren. | nach 0070 |
| W2\_SPHX\_MAX\_0090 | Max | Ich geh trotzdem außen rum. | nach 0080; Max umgeht die Kugel bei jedem Weg zum Pult |
| W2\_SPHX\_MAX\_0100 | Max | Die Nase ist noch dran. Noch. | Ansehen: Nase, vor dem Finaltag |
| W2\_SPHX\_MAX\_0105 | Max | Eine Nase, so groß wie ein Bus. Ich hab das Gefühl, die hält nicht mehr lange, weil irgendwer immer mit was Schwerem vorbeikommt. | Ansehen: Nase, vor dem Finaltag, zweites Mal |
| W2\_SPHX\_MAX\_0110 | Max | Die Nase liegt im Sand. Das war ich, mit einem Teller. Ich sag einfach gar nichts. | Ansehen: Nase im Sand, nach dem Finaltag |
| W2\_SPHX\_MAX\_0115 | Max | Wenn mich jemand fragt, war's der Wind. Ein sehr gezielter Wind mit Teller. | Ansehen: Nase im Sand, nach dem Finaltag, zweites Mal |
| W2\_SPHX\_SPH\_0120 | Sphinx | Ich höre alles, Junge. Ich habe nur keine Nase mehr, um es zu riechen. | nach 0110 |
| W2\_SPHX\_MAX\_0130 | Max | Hallo. Du bist die Sphinx, oder? | Reden: Sphinx, Einstieg |
| W2\_SPHX\_SPH\_0140 | Sphinx | Ich bin die Sphinx. Ich stelle Rätsel. Stellte. Seit dreihundert Jahren fällt mir keins mehr ein. // Und das mit den vier Beinen kennen inzwischen alle. | seufzt, Echo |
| W2\_SPHX\_MAX\_0150 | Max | Was ist das für eine Rolle da? | Option Sphinx |
| W2\_SPHX\_SPH\_0160 | Sphinx | „Die sieben Antworten.“ Alles, was man einem Redner entgegnen kann, die beste Rolle der Antike. // Ich gebe sie nur her gegen ein Rätsel, das ich nicht lösen kann. |  |
| W2\_SPHX\_MAX\_0590 | Max | Und wenn du das Rätsel lösen kannst? |  |
| W2\_SPHX\_SPH\_0600 | Sphinx | Dann fresse ich dich nicht. Das war früher anders, aber heute gibt es Auflagen. |  |
| W2\_SPHX\_MAX\_0170 | Max | Wie stelle ich dir ein Rätsel? | Option Sphinx |
| W2\_SPHX\_SPH\_0180 | Sphinx | Ein Ding, das ich nicht kenne, und drei Hinweise, die nur auf dieses Ding passen. Passt einer nicht, merke ich es. // Ich merke alles. Außer, was ich nicht kenne. |  |
| W2\_SPHX\_PIX\_0610 | Pixel | Ein Ding, das sie nicht kennt. Das ist dein Fachgebiet, junger Mann. // Du besitzt eine erstaunliche Menge an Dingen, die niemand kennt und die auch niemand haben will. |  |
| W2\_SPHX\_MAX\_0620 | Max | Danke. Glaub ich. |  |
| W2\_SPHX\_MAX\_0190 | Max | Was hat am Morgen vier Beine … | Option Sphinx, Gag |
| W2\_SPHX\_SPH\_0200 | Sphinx | Der Mensch. Das ist meins. Das war meins. Jeder sagt das. Ein Tourist hat es neulich sogar auf mich draufgekritzelt. |  |
| W2\_SPHX\_MAX\_0630 | Max | Okay, das war geklaut, ich geb's zu. |  |
| W2\_SPHX\_SPH\_0640 | Sphinx | Alle klauen es. Ich hab es auch geklaut, von einer älteren Sphinx, und die hatte es von einem Schaf. Rätsel sind wie Flöhe. |  |
| W2\_SPHX\_MAX\_0210 | Max | Kannst du mir ein Empfehlungsschreiben geben? | Option Sphinx (bleibt); nach Rätsel 8 |
| W2\_SPHX\_SPH\_0220 | Sphinx | Nur in Rätselform, anders kann ich nicht. „Wer dies liest und nicht versteht, stempelt besser, bevor er fragt.“ Nimm. | gibt Empfehlungsschreiben; zweiter Weg für Rätsel 3 |
| W2\_SPHX\_MAX\_0650 | Max | Und was soll das heißen? |  |
| W2\_SPHX\_SPH\_0660 | Sphinx | Dass er stempeln soll, steht doch da. Du verstehst es auch nicht? Sehr gut. Dann wirkt es. |  |
| W2\_SPHX\_MAX\_0230 | Max | Ich überleg mir was. | Option Sphinx, beendet das Gespräch |
| W2\_SPHX\_SPH\_0240 | Sphinx | Das sagen alle, und dann kommen sie nie wieder. Ich warte trotzdem. Ich bin aus Stein, ich kann nichts anderes. |  |
| W2\_SPHX\_MAX\_0250 | Max | Ich stell dir ein Rätsel. | Option Sphinx (bleibt); öffnet die Rätsel-Auswahl |
| W2\_SPHX\_SPH\_0260 | Sphinx | Ein Kaugummi klingelt nicht. | Kaugummi plus Handy-Baustein 1 |
| W2\_SPHX\_SPH\_0270 | Sphinx | Ein Kaugummi leuchtet nicht. Nicht mal kurz. | Kaugummi plus Handy-Baustein 2 |
| W2\_SPHX\_SPH\_0280 | Sphinx | Ein Kaugummi hat keine Prozente. Ein Kaugummi hat Geschmack, wenn auch nur kurz. | Kaugummi plus Handy-Baustein 3 |
| W2\_SPHX\_SPH\_0290 | Sphinx | Ein Kaugummi schreibt nicht. Er hätte auch nichts zu sagen. | Kaugummi plus Kugelschreiber-Baustein 1 |
| W2\_SPHX\_SPH\_0300 | Sphinx | Ein Kaugummi klickt nicht. Er schmatzt. | Kaugummi plus Kugelschreiber-Baustein 2 |
| W2\_SPHX\_SPH\_0310 | Sphinx | Ein Kaugummi ist rosa. Du hast rosa gesagt. Also, du hast nicht rosa gesagt, aber ich weiß es trotzdem. | Kaugummi plus Kugelschreiber-Baustein 3 |
| W2\_SPHX\_SPH\_0320 | Sphinx | Ein Kugelschreiber klingelt nicht. | Kugelschreiber plus Handy-Baustein 1 |
| W2\_SPHX\_SPH\_0330 | Sphinx | Ein Kugelschreiber leuchtet nicht. Außer du hältst ihn in die Sonne, und das zählt nicht. | Kugelschreiber plus Handy-Baustein 2 |
| W2\_SPHX\_SPH\_0340 | Sphinx | Ein Kugelschreiber stirbt nicht bei drei Prozent. Er stirbt mitten im Wort, das weiß jeder Schreiber. | Kugelschreiber plus Handy-Baustein 3 |
| W2\_SPHX\_SPH\_0350 | Sphinx | Ein Kugelschreiber wird alle. Dann wirft man ihn weg, oder man kritzelt wie wild, bis er doch wieder geht. | Kugelschreiber plus Kaugummi-Baustein 1 |
| W2\_SPHX\_SPH\_0360 | Sphinx | Ein Kugelschreiber klebt nicht unter dem Tisch. Er liegt darunter. Immer. | Kugelschreiber plus Kaugummi-Baustein 2 |
| W2\_SPHX\_SPH\_0370 | Sphinx | Aus einem Kugelschreiber macht man keine Sonne. Man malt höchstens eine damit, auf Papier. | Kugelschreiber plus Kaugummi-Baustein 3 |
| W2\_SPHX\_SPH\_0380 | Sphinx | Ein Handy wird alle. Du hast es selbst gesagt: drei Prozent. | Handy plus Kaugummi-Baustein 1 |
| W2\_SPHX\_SPH\_0390 | Sphinx | Ein Handy klebt nicht unter dem Tisch. Es liegt auf dem Tisch, und alle starren drauf. | Handy plus Kaugummi-Baustein 2 |
| W2\_SPHX\_SPH\_0400 | Sphinx | Aus einem Handy macht man keine Sonne. Man macht die Sonne damit heller, und das ist etwas anderes. | Handy plus Kaugummi-Baustein 3 |
| W2\_SPHX\_SPH\_0410 | Sphinx | Ein Handy schreibt nicht ohne Tintenfass, es schreibt ohne Hand. Das ist schlimmer. | Handy plus Kugelschreiber-Baustein 1 |
| W2\_SPHX\_SPH\_0420 | Sphinx | Ein Handy klickt nicht, es summt. Deins sogar nur noch ganz leise. | Handy plus Kugelschreiber-Baustein 2 |
| W2\_SPHX\_SPH\_0430 | Sphinx | Ein Handy ist nicht blau. Deins ist schwarz, mit Riss. | Handy plus Kugelschreiber-Baustein 3 |
| W2\_SPHX\_PIX\_0440 | Pixel | Sie hat recht. Das ist das Schlimmste daran. | nach jedem Fehlversuch, zufällig in jedem dritten Fall |
| W2\_SPHX\_SPH\_0450 | Sphinx | Es klingelt, es leuchtet, es stirbt bei drei Prozent. Ein Tier? Ein Stern? Ein kranker Stern? Ich … ich weiß es nicht. | Handy mit drei Handy-Bausteinen |
| W2\_SPHX\_SPH\_0460 | Sphinx | Es wird nie alle, es klebt, es wird eine Sonne. Brot? Harz? Ein klebriger Gott? Ich kenne es nicht. Ich kenne es nicht! | Kaugummi mit drei Kaugummi-Bausteinen |
| W2\_SPHX\_SPH\_0470 | Sphinx | Es schreibt ohne Tinte, es klickt, es ist blau ohne Laune. Ein Käfer? Ein Beamter? Ich … nein. Nein. | Kugelschreiber mit drei Kugelschreiber-Bausteinen |
| W2\_SPHX\_SPH\_0480 | Sphinx | Dreihundert Jahre, und dann schlägt mich ein Junge im Hoodie. Nimm die Rolle. Nimm sie, bevor ich weine. Stein weint schlecht. | gibt die Schriftrolle; Rätsel 8 gelöst; Konter 1 bis 3 ins Notizbuch |
| W2\_SPHX\_MAX\_0490 | Max | Ein Handy. | Auflösung, je nach Wort: Handy |
| W2\_SPHX\_MAX\_0500 | Max | Ein Kaugummi. | Auflösung: Kaugummi |
| W2\_SPHX\_MAX\_0510 | Max | Ein Kugelschreiber. | Auflösung: Kugelschreiber |
| W2\_SPHX\_SPH\_0520 | Sphinx | Das gibt es nicht. Das gibt es noch nicht! Das ist … unfair. Das ist genial. Ich schreibe es auf. | nach der Auflösung; Notizblock bekommt eine zweite Zeile |
| W2\_SPHX\_PIX\_0530 | Pixel | Sie hat eine Schreibblockade, und du hast sie mit einem Kugelschreiber gelöst. Oder mit Kaugummi. // Jedenfalls ohne erkennbaren Verstand. Es hat trotzdem funktioniert. | nach 0520 |
| W2\_SPHX\_MAX\_0540 | Max | „Die sieben Antworten.“ Eine Schriftrolle mit rotem Band. Die ersten drei Antworten sind fertig, danach kommen viermal drei Punkte. | Ansehen: Schriftrolle im Inventar |
| W2\_SPHX\_MAX\_0545 | Max | Vier Antworten fehlen noch. Die Sphinx wartet so lange, und im Warten ist sie fast so gut wie eine Katze. | Ansehen: Schriftrolle im Inventar, zweites Mal |
| W2\_SPHX\_SPH\_0550 | Sphinx | Die letzten vier … habe ich nie fertig bekommen. Schreibblockade. Hol dir den Rest auf der Agora, da reden alle. | nach 0540, wenn Max bei der Sphinx steht |
| W2\_SPHX\_MAX\_0560 | Max | Ich kann der Sphinx das Handy nicht einfach zeigen. Sie muss raten, sonst zählt es nicht. Regeln sind Regeln. | Handy, Kaugummi oder Kugelschreiber direkt auf Sphinx |
| W2\_SPHX\_MAX\_0570 | Max | Die Kugel anschubsen? Nee. Ich weiß, wie das endet, nämlich mit Rennen. | Benutzen: Steinkugel |
| W2\_SPHX\_PIX\_0580 | Pixel | Eine Sphinx. Eine Verwandte von mir, entfernt. Sehr entfernt. Mit Schreibproblemen. // Wir sprechen in der Familie nicht über sie, und ich bitte dich, das ebenfalls zu respektieren. | Pixel auf Sphinx |

## 13. Syrakus, Archimedes' Werkstatt: Ansehen und Gespräch

Archimedes steht an der Werkbank, König Hieron mit verschränkten Armen daneben. Die Wasserorgel ist der Radio-Moment dieser Welt.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_WERK\_MAX\_0010 | Max | Zahnräder, Hebel, Spiegel und eine Badewanne. Wenn Opa hier wohnen würde, käme er nie wieder raus. Er hätte sogar Meerblick. | erstes Betreten |
| W2\_WERK\_PIX\_0020 | Pixel | Es riecht nach Tinte, Schweiß und Genie. // Zwei dieser drei Gerüche mag ich nicht, und ich überlasse es deiner Fantasie, welche. | erstes Betreten, danach |
| W2\_WERK\_MAX\_0030 | Max | Ein alter Mann mit nassen Haaren und einem Zirkel. Er sieht aus, als hätte er drei Ideen gleichzeitig und keine davon zu Ende. | Ansehen: Archimedes |
| W2\_WERK\_MAX\_0035 | Max | Er murmelt beim Atmen Zahlen. Falls er gleich nackt aus der Wanne springt und was Griechisches brüllt, guck ich weg. | Ansehen: Archimedes, zweites Mal |
| W2\_WERK\_MAX\_0040 | Max | Ein König ohne Krone, mit verschränkten Armen. Das ist entweder Würde oder ziemlich schlechte Laune. | Ansehen: Hieron |
| W2\_WERK\_MAX\_0045 | Max | Er guckt abwechselnd zu Archimedes und zur Tür. Ein König mit Geduld, aber nur noch für kurze Zeit. | Ansehen: Hieron, zweites Mal |
| W2\_WERK\_MAX\_0050 | Max | Eine Marmorbadewanne voll Wasser, direkt neben der Werkbank. Hier wird in der Wanne nachgedacht, und das kann ich verstehen. | Ansehen: Badewanne |
| W2\_WERK\_PIX\_0055 | Pixel | Eine Wanne voller Wasser, mitten in der Werkstatt, ohne Deckel und ohne Warnschild. // Die meint mich. | Ansehen: Badewanne, zweites Mal |
| W2\_WERK\_MAX\_0060 | Max | Ein Bronzespiegel, poliert wie ein Handydisplay. Er wirft die Sonne zurück, als wäre sie ihm völlig egal. | Ansehen: Brennspiegel |
| W2\_WERK\_MAX\_0065 | Max | Ich seh mich im Spiegel, ganz in Bronze. Ich seh aus wie eine Medaille, die keiner haben wollte. | Ansehen: Brennspiegel, zweites Mal |
| W2\_WERK\_MAX\_0070 | Max | Ich nehm den Spiegel mit. Tragbares Sonnenlicht kann man immer gebrauchen. | Nehmen: Brennspiegel |
| W2\_WERK\_ARC\_0080 | Archimedes | Nimm ihn, nimm ihn! Aber richte ihn nicht auf Schiffe. Das gab beim letzten Mal Ärger. | nach 0070 |
| W2\_WERK\_MAX\_0090 | Max | Eine Waage mit zwei Schalen. In der einen liegt Staub. Sie ist trotzdem im Gleichgewicht. | Ansehen: Waage |
| W2\_WERK\_MAX\_0095 | Max | Beide Schalen leer, beide gleich hoch. Die Waage ist zufrieden, und das ist ziemlich selten. | Ansehen: Waage, zweites Mal |
| W2\_WERK\_MAX\_0100 | Max | Ich nehm die Waage. Jetzt kann ich Sachen vergleichen, ganz ohne Vergleichsportal. | Nehmen: Waage |
| W2\_WERK\_MAX\_0110 | Max | Ein Tonbecher mit Strichen, also ein Messbecher. Opa hat auch so einen und misst damit Kaffee und Schrauben. | Ansehen: Messbecher |
| W2\_WERK\_MAX\_0115 | Max | Die Striche am Becher sind ungleich. Archimedes hat ihn wohl im Kopf geeicht, und zwar beim Baden. | Ansehen: Messbecher, zweites Mal |
| W2\_WERK\_MAX\_0120 | Max | Messbecher. Eingepackt. | Nehmen: Messbecher |
| W2\_WERK\_MAX\_0130 | Max | Eine Werkbank voller Skizzen, Zahnräder und Krüge. Hier erfindet jemand schneller, als er aufräumt. | Ansehen: Werkbank |
| W2\_WERK\_MAX\_0135 | Max | Unter den Skizzen liegen noch mehr Skizzen. Er hat keinen Papierkorb, er hat Schichten. | Ansehen: Werkbank, zweites Mal |
| W2\_WERK\_MAX\_0140 | Max | Ein großer Tonkrug mit saurem Gesicht drauf. Riecht nach Pommesbude, also nach uraltem Essig. | Ansehen: Essigkrug |
| W2\_WERK\_MAX\_0145 | Max | Der Krug guckt sauer, und der Inhalt ist es auch. Die zwei passen gut zusammen. | Ansehen: Essigkrug, zweites Mal |
| W2\_WERK\_MAX\_0150 | Max | Ich nehm den Essig mit. Falls jemand Salat macht. Oder die Zeit zurückdreht. | Nehmen: Essigkrug; Sanduhr-Symbol im Inventar |
| W2\_WERK\_ARC\_0160 | Archimedes | Der Essig? Das war mal Wein, vor fünfundzwanzig Jahren. Ich hab ihn vergessen. Ich vergesse alles, was man nicht berechnen kann. | nach 0150; Hinweis Rätsel 11 |
| W2\_WERK\_MAX\_0170 | Max | Ein Holzhebel an einem Stein, zum Werfen. Hoffentlich von Steinen und nicht von mir. | Ansehen: Wurfhebel, vor dem Training |
| W2\_WERK\_MAX\_0175 | Max | Ich zieh da nicht dran. Wer an einem Hebel zieht, ohne zu wissen wofür, fliegt. Das hab ich aus Zeichentrickfilmen. | Ansehen: Wurfhebel, vor dem Training, zweites Mal |
| W2\_WERK\_MAX\_0180 | Max | Bronzeröhren, ein Wasserkessel und Tasten. Ein Synthesizer mit Wasserkocher. Archimedes wär in den Achtzigern ein Star gewesen. | Ansehen: Wasserorgel |
| W2\_WERK\_MAX\_0185 | Max | Auf eine Taste hat jemand „Nicht drücken“ gekritzelt. Natürlich ist das die abgenutzteste. | Ansehen: Wasserorgel, zweites Mal |
| W2\_WERK\_ARC\_0190 | Archimedes | Die Orgel? Die spielt den Olympischen Boten, also die Nachrichten. Hör zu. | Benutzen: Wasserorgel |
| W2\_WERK\_ARC\_0200 | Archimedes | „Milchpreise in Syrakus auf Rekordhoch. Und: Ein Erfinder vergisst den Geburtstag seiner Frau, der Stadtrat ist entsetzt.“ | nach 0190 |
| W2\_WERK\_MAX\_0210 | Max | Nachrichten aus einer Wasserorgel. Und die klingen genau wie die, die Opa immer laufen hat. | nach 0200 |
| W2\_WERK\_PIX\_0220 | Pixel | Milchpreise. Immer Milchpreise, in jeder Welt, zu jeder Zeit. // Ich fange an, ein Muster zu erkennen. Und ich habe beschlossen, es mit aller Kraft zu ignorieren. | nach 0210 |
| W2\_WERK\_MAX\_0230 | Max | Ein Bauplan für eine Maschine mit Kessel und Kolben, also eine Dampfmaschine. Er ist zweitausend Jahre zu früh dran. | Ansehen: Bauplan Dampfmaschine |
| W2\_WERK\_MAX\_0240 | Max | Hätte er das patentiert, wär er heute reich. Also tot, aber reich. | Ansehen: Bauplan Dampfmaschine, zweites Mal |
| W2\_WERK\_MAX\_0250 | Max | Ein Modell von einem Turm, das schief steht. Absichtlich, sagt der Zettel daneben. Der Zettel lügt. | Ansehen: Modell schiefer Turm |
| W2\_WERK\_MAX\_0260 | Max | Das wird noch Probleme machen. | Ansehen: Modell schiefer Turm, zweites Mal |
| W2\_WERK\_MAX\_0270 | Max | Skizzen an der Wand: eine Kugel in einem Zylinder. Sehr sauber gezeichnet, fast schon ein Logo. | Ansehen: Skizze Kugel und Zylinder |
| W2\_WERK\_MAX\_0275 | Max | Kugel im Zylinder. Die hat er bestimmt hundertmal gezeichnet. | Ansehen: Skizze Kugel und Zylinder, zweites Mal |
| W2\_WERK\_ARC\_0280 | Archimedes | Mein Lieblingsbeweis! Die Kugel füllt zwei Drittel des Zylinders. Das will ich auf meinem Grab haben. Irgendwann. Nicht heute. | nach 0270 |
| W2\_WERK\_MAX\_0290 | Max | Ein breites Fenster. Draußen Hafen, Möwen und Licht. Drinnen ein Mann, der nichts davon sieht. | Ansehen: Fenster |
| W2\_WERK\_PIX\_0295 | Pixel | Möwen. Weiß, laut und unverschämt. // Wenn ich hier rauskomme, werden wir ein Gespräch unter Jägern führen. Es wird kurz sein. | Ansehen: Fenster, zweites Mal |
| W2\_WERK\_MAX\_0300 | Max | Zahnräder, die ineinandergreifen. Jedes dreht das nächste. Das letzte dreht eine Kurbel für den Pfeffer. | Ansehen: Zahnräder |
| W2\_WERK\_MAX\_0305 | Max | Wenn ich am kleinen drehe, dreht sich das große. Ganz langsam. | Ansehen: Zahnräder, zweites Mal |
| W2\_WERK\_MAX\_0310 | Max | Bist du Archimedes? | Reden: Archimedes, Einstieg |
| W2\_WERK\_ARC\_0320 | Archimedes | Ja! Nein! Moment, ich rechne. Ja. Archimedes. Und du bist nass. Nein, das bin ich. Was willst du? | fuchtelt mit dem Zirkel |
| W2\_WERK\_MAX\_0330 | Max | Ich brauche einen Trainer für den Fünfkampf. | Option Archimedes |
| W2\_WERK\_ARC\_0340 | Archimedes | Ich trainiere niemanden, solange der König mich anstarrt. Und er starrt, bis ich seine Krone geprüft habe. Siehst du das Problem? |  |
| W2\_WERK\_MAX\_0530 | Max | Und wenn ich dir bei der Krone helfe? |  |
| W2\_WERK\_ARC\_0540 | Archimedes | Dann bist du schlauer als ich, und ich trainiere dich aus reiner Eifersucht. Abgemacht. |  |
| W2\_WERK\_MAX\_0350 | Max | Was ist mit der Krone? | Option Archimedes (bleibt) |
| W2\_WERK\_ARC\_0360 | Archimedes | Der Goldschmied hat vielleicht Silber untergemischt. Die Krone wiegt genau so viel wie der Barren, den er bekam. // Wiegen hilft also nicht. Ich brauche … etwas anderes. Ich weiß nur nicht, was. | Hinweis Rätsel 5 |
| W2\_WERK\_PIX\_0550 | Pixel | Etwas anderes als wiegen. Ich würde sie vom Tisch werfen, junger Mann. // Bei mir hilft das bei fast allem, und wenn nicht, war der Gegenstand ohnehin nicht wichtig. |  |
| W2\_WERK\_ARC\_0560 | Archimedes | Runterwerfen … Nein. Obwohl … Nein. Aber du denkst in die richtige Richtung, Kater. Nach unten. |  |
| W2\_WERK\_MAX\_0370 | Max | Warum sind deine Haare nass? | Option Archimedes (bleibt) |
| W2\_WERK\_ARC\_0380 | Archimedes | Ich denke in der Wanne, heute schon dreimal. Jedes Mal läuft Wasser über, und jedes Mal ärgere ich mich. // Dabei müsste ich … nein. Weg. Weg ist der Gedanke. | Hinweis Rätsel 5, Stufe 2 |
| W2\_WERK\_MAX\_0570 | Max | Was für ein Gedanke? |  |
| W2\_WERK\_ARC\_0580 | Archimedes | Der mit dem Wasser. Er kommt, wenn ich in der Wanne sitze, und geht, sobald ich aussteige. Vielleicht muss ich mal mit ihm rausrennen. |  |
| W2\_WERK\_MAX\_0390 | Max | Was macht die Wasserorgel? | Option Archimedes |
| W2\_WERK\_ARC\_0400 | Archimedes | Musik aus Wasser und Luft. Und Nachrichten, wenn man die dritte Taste drückt. Ich weiß nicht, wie. Es war ein Unfall. | Hinweis auf den Radio-Moment |
| W2\_WERK\_MAX\_0590 | Max | Nachrichten? Von wo denn? |  |
| W2\_WERK\_ARC\_0600 | Archimedes | Von irgendwo, wo ein Mann dauernd über Milchpreise redet. Ich verstehe kein Wort, aber es klingt dringend. |  |
| W2\_WERK\_MAX\_0410 | Max | Ich bräuchte einen Entwurf für dein Grab. | Option Archimedes (bleibt); nach Ciceros Forderung (Rätsel 10), nach Rätsel 5 und nach Tag 1 |
| W2\_WERK\_ARC\_0420 | Archimedes | Mein Grab? Ich lebe! Ich lebe sogar sehr! // Aber wenn schon, dann richtig: Kugel im Zylinder, zwei Drittel. Hier ist der Entwurf. // Lass ihn ordentlich meißeln. Ich schaue dann zu. Von oben. Also, von hier. | gibt den Entwurf |
| W2\_WERK\_MAX\_0430 | Max | Bis später. | Option Archimedes, beendet das Gespräch |
| W2\_WERK\_ARC\_0440 | Archimedes | Stör meine Kreise nicht! Also, ich hab gerade keine Kreise. Aber trotzdem. |  |
| W2\_WERK\_MAX\_0450 | Max | Ihr seid der König? | Reden: Hieron, Einstieg |
| W2\_WERK\_HIE\_0460 | Hieron | Ich bin Hieron. Ich habe einen Goldschmied, eine Krone und einen Verdacht. Und einen Erfinder, der badet, statt zu rechnen. | verschränkte Arme |
| W2\_WERK\_MAX\_0470 | Max | Darf ich die Krone mal sehen? | Option Hieron (bleibt) |
| W2\_WERK\_HIE\_0480 | Hieron | Hier, die Krone und der Barren, beide gleich schwer. Beweis mir, dass sie nicht aus reinem Gold ist. Oder dass sie es ist. Mir reicht ein Beweis. | gibt Krone und Goldbarren |
| W2\_WERK\_MAX\_0610 | Max | Gleich schwer heißt also nicht automatisch gleich echt. |  |
| W2\_WERK\_HIE\_0620 | Hieron | Genau. Dann erklär mir das bitte. Ich verstehe es nämlich auch nicht, und ich bin der König. |  |
| W2\_WERK\_MAX\_0490 | Max | Warum setzt du sie nicht einfach auf? | Option Hieron |
| W2\_WERK\_HIE\_0500 | Hieron | Eine falsche Krone tragen? Dann bin ich ein falscher König. Dann kann ich gleich nach Ägypten gehen, zu dem, der sich nicht entscheiden kann. |  |
| W2\_WERK\_MAX\_0630 | Max | Ramses? Der überlegt seit elf Jahren, wie er heißen will. |  |
| W2\_WERK\_HIE\_0640 | Hieron | Siehst du. So endet man ohne echte Krone. |  |
| W2\_WERK\_MAX\_0510 | Max | Ich seh mir das an. | Option Hieron, beendet das Gespräch |
| W2\_WERK\_HIE\_0520 | Hieron | Sieh schnell hin. Ich stehe hier schon seit dem Frühstück. |  |

## 14. Werkstatt: Rätsel 5, Archimedes' Krone

Max wägt Krone und Barren (gleich schwer), taucht beide nacheinander in die Badewanne und misst mit dem Messbecher, wie viel Wasser überläuft. Die Krone verdrängt mehr: gefälscht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_KRON\_MAX\_0010 | Max | Eine goldene Krone. Sie glänzt, aber hier glänzt alles, und genau das ist ja das Problem. | Ansehen: Krone |
| W2\_KRON\_MAX\_0015 | Max | So viel Gold auf einem Haufen, und keiner weiß, wie viel davon wirklich Gold ist. | Ansehen: Krone, zweites Mal |
| W2\_KRON\_MAX\_0020 | Max | Ein Goldbarren. Ich halt ihn mit zwei Händen und fühl mich trotzdem nicht reich. | Ansehen: Goldbarren |
| W2\_KRON\_PIX\_0030 | Pixel | Gold. Man kann es nicht essen, und man kann nicht vernünftig darauf schlafen, weil es kalt ist. // Es ist das nutzloseste Material der Welt. Ich will es trotzdem haben. Das ist Gold. | Ansehen: Goldbarren, zweites Mal |
| W2\_KRON\_MAX\_0040 | Max | Krone auf die Waage. Die Schale geht runter, und sonst passiert nichts. | Krone auf Waage |
| W2\_KRON\_MAX\_0050 | Max | Barren auf die andere Schale: gleich schwer. | Goldbarren auf Waage mit Krone |
| W2\_KRON\_ARC\_0060 | Archimedes | Siehst du! Gleich! Die Waage sagt nichts! Die Waage ist nutzlos! Ich hab sie trotzdem lieb. | nach 0050 |
| W2\_KRON\_MAX\_0070 | Max | Die Krone ins Wasser. Es schwappt über, und Archimedes zuckt zusammen. | Krone in Badewanne |
| W2\_KRON\_MAX\_0080 | Max | Ich fang das Wasser auf. Zwei Striche. | Messbecher an Badewanne, nach der Krone; Notizbuch: „Krone: zwei Striche“ |
| W2\_KRON\_MAX\_0090 | Max | Jetzt der Barren ins Wasser. Es schwappt, aber weniger. | Goldbarren in Badewanne |
| W2\_KRON\_MAX\_0100 | Max | Ein Strich. Nur einer. | Messbecher an Badewanne, nach dem Barren; Notizbuch: „Barren: ein Strich“ |
| W2\_KRON\_MAX\_0110 | Max | Gleich schwer, aber die Krone macht mehr nass. Sie ist größer, als sie sein dürfte, also steckt was Leichteres als Gold drin. // Heißt: gefälscht. | beide Werte vorhanden; Max zu Archimedes oder automatisch |
| W2\_KRON\_ARC\_0120 | Archimedes | Mehr Wasser! Gleiches Gewicht! Größeres Volumen! Leichteres Metall! Falsche Krone! Ich … ich … | Augen weit |
| W2\_KRON\_ARC\_0130 | Archimedes | HEUREKA! | springt in die Wanne und wieder raus, rennt mit flatterndem Handtuch zur Tür hinaus |
| W2\_KRON\_HIE\_0140 | Hieron | Er hat es wieder getan. Jedes Mal dasselbe. Die halbe Stadt kennt ihn nur so. | sieht ihm nach |
| W2\_KRON\_PIX\_0150 | Pixel | Er rennt nackt durch Syrakus und schreit ein einziges Wort. // Und DU bist bloß der Diener einer Katze. // Ich finde, im Vergleich kommst du sehr gut weg. Das solltest du öfter bedenken. |  |
| W2\_KRON\_MAX\_0160 | Max | Also: gefälscht, das steht fest. Kann ich jetzt endlich trainieren? | zu Hieron |
| W2\_KRON\_HIE\_0170 | Hieron | Gefälscht. Gut. Also, nicht gut. Aber gut zu wissen. Der Goldschmied bekommt Besuch. // Archimedes gehört dir, sobald er zurück ist. Und angezogen. | nimmt Krone und Barren; Rätsel 5 gelöst |
| W2\_KRON\_MAX\_0180 | Max | Die Krone aufsetzen? Hieron würde mich köpfen lassen. Mit der Krone. | Krone auf Max |
| W2\_KRON\_MAX\_0190 | Max | Die Krone auf Pixel? Dann nimmt er sie nie wieder ab. | Krone auf Pixel |
| W2\_KRON\_PIX\_0200 | Pixel | Sie passt. Sie passt vollkommen, als wäre sie für mich gemacht worden. // Du nimmst sie mir jetzt ab, und wir sprechen nie wieder darüber, wie gut sie mir stand. | nach 0190 |
| W2\_KRON\_MAX\_0210 | Max | Pixel in die Badewanne? Dann weiß ich, wie viel Wasser ein Kater verdrängt, und wie viel Blut ich verliere. | Pixel auf Badewanne |
| W2\_KRON\_PIX\_0220 | Pixel | Wasser, Wanne und ich. Das sind drei Dinge, die niemals zusammenkommen. // Niemals. Nicht in dieser Welt und auch in keiner anderen, die dein Großvater noch erfindet. | nach 0210 |
| W2\_KRON\_MAX\_0230 | Max | Die Dose in die Wanne? Sie schwimmt, weil sie leer ist. Das wusste ich auch ohne Wanne. | Thunfischdose in Badewanne |
| W2\_KRON\_MAX\_0240 | Max | Die Waage dem König geben? Er weiß doch, was die Waage sagt. Genau deshalb steht er ja so da. | Waage auf Hieron |
| W2\_KRON\_MAX\_0250 | Max | Der Messbecher ist leer. Ich muss erst was eintauchen und dann messen. Reihenfolge, wie in einem Tutorial. | Messbecher an Badewanne, bevor etwas eingetaucht wurde |
| W2\_KRON\_MAX\_0260 | Max | Nur den Barren auf die Waage? Dann wiegt er einen Barren, genau einen. Bringt nichts. | Goldbarren auf Waage ohne Krone |
| W2\_KRON\_MAX\_0270 | Max | Den Spiegel ins Wasser? Dann hab ich einen nassen Spiegel. Und Archimedes eine neue Idee. | Brennspiegel in Badewanne |

## 15. Werkstatt: Die Trainings-Szene

Szene nach Rätsel 5. Archimedes kommt zurück, in ein Handtuch gewickelt, und baut den Wurfhebel fertig. Max übt dreimal. Das ist sein Entwicklungsmoment in dieser Welt: Beim dritten Mal sagt er von selbst „Noch mal“.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_TRAI\_ARC\_0010 | Archimedes | So! Angezogen! Größtenteils! Der Hebel ist fertig. Du setzt dich vorne hin, ich lege hinten Gewicht rein, und dann fliegst du. | klopft auf den Hebel |
| W2\_TRAI\_MAX\_0020 | Max | Ich … fliege. |  |
| W2\_TRAI\_ARC\_0030 | Archimedes | Gib mir einen festen Punkt, und ich hebe die Welt aus den Angeln. Du bist kleiner als die Welt. Das wird leicht. |  |
| W2\_TRAI\_MAX\_0040 | Max | Muss das sein? | setzt sich auf den Hebel, erster Versuch |
| W2\_TRAI\_NAR\_0050 | – | Der Hebel schnellt hoch. Max landet zwei Meter weiter im Sand, mit dem Gesicht zuerst. | Animation katapultiert |
| W2\_TRAI\_PIX\_0060 | Pixel | Zwei Meter. Ein Hase springt weiter. Ein Hase, der keine Lust hat. |  |
| W2\_TRAI\_ARC\_0070 | Archimedes | Zu wenig Gewicht! Mehr! Noch mal! | legt einen Stein in den Korb |
| W2\_TRAI\_MAX\_0080 | Max | Okay. Aber nur, weil ich eh schon im Sand liege. | zweiter Versuch |
| W2\_TRAI\_NAR\_0090 | – | Der Hebel schnellt hoch. Max fliegt in einem sauberen Bogen und landet auf den Füßen. Fast. | Animation katapultiert, weiter |
| W2\_TRAI\_ARC\_0100 | Archimedes | Besser! Der Winkel! Der Winkel war fast richtig! Noch … | sieht Max an |
| W2\_TRAI\_MAX\_0110 | Max | Noch mal. | steht von selbst auf, klopft den Sand ab |
| W2\_TRAI\_PIX\_0120 | Pixel | Verzeihung. Was hast du da gerade gesagt? |  |
| W2\_TRAI\_MAX\_0130 | Max | Noch mal. Der Winkel war fast richtig. | setzt sich hin, dritter Versuch |
| W2\_TRAI\_PIX\_0140 | Pixel | Er hat „noch mal“ gesagt. Freiwillig. Beim Sport. // Ich kenne diesen Jungen seit vierzehn Jahren, und ich habe ihn auf jedem Sofa dieses Hauses liegen sehen. // Er hat noch nie „noch mal“ gesagt. Nicht einmal beim Nachtisch. | fassungslos, Schwanz gesträubt |
| W2\_TRAI\_NAR\_0150 | – | Max fliegt. Landet. Steht. | Animation; Max' Haltung in dieser Szene etwas aufrechter |
| W2\_TRAI\_ARC\_0160 | Archimedes | Perfekt! Also: gut. Also: brauchbar. Der Hebel kommt mit nach Olympia, und du bist mein Schüler. // Ich hatte nie einen Schüler. Du bist der erste. Enttäusch mich nicht. | Wurfhebel ins Stadion; Tag 1 vorbereitet |
| W2\_TRAI\_MAX\_0170 | Max | Ich hab gerade dreimal freiwillig Sport gemacht. Das erzähl ich niemandem. |  |
| W2\_TRAI\_PIX\_0180 | Pixel | Ich erzähle es allen. Und zwar zuerst dem Krokodil, weil es so schön zuhört. |  |

## 16. Olympia, Startbüro: Rätsel 3, der Passierschein

Beamter 1 (Startschalter) verlangt einen Bürgerschein, Beamter 2 (Bürgerschalter) einen Startpass. Der Aushang sagt: Jedes neue Rundschreiben gilt sofort und über allem. Weg A: Max schreibt mit dem Kugelschreiber auf ein leeres Formular ein Rundschreiben, das einen Passierschein Vier-Strich-Ypsilon verlangt. Weg B: Papyrus aus dem Nil plus Tintenfisch-Tinte vom Hafen. Weg C: das Empfehlungsschreiben der Sphinx. Weg D: Mit der Sortierenden Socke findet Max im sortierten Formularberg ein fertiges Rundschreiben, das nur noch abgegeben werden muss. Gleich nach dem Startpass kommt Hermes zurück und leiht Max von sich aus seine Sandalen (0600, 0610); ohne sie beginnt Tag 1 nicht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_BUER\_MAX\_0010 | Max | Zwei Schalter, ein Berg Schriftrollen und eine Bank voller Leute, die aussehen, als wären sie hier geboren. Eindeutig ein Amt. | erstes Betreten |
| W2\_BUER\_PIX\_0020 | Pixel | Staub, Langeweile und Sonnenstrahlen. Das ist, mit Verlaub, ein vollkommener Schlafplatz. // Ich verstehe die Leute auf der Bank. Ich beneide sie sogar ein wenig. | erstes Betreten, danach |
| W2\_BUER\_MAX\_0030 | Max | Ein Beamter mit Glatze und einer Schriftrolle, so lang wie er selbst. Er schläft mit offenen Augen, und das ist echt eine Fähigkeit. | Ansehen: Beamter 1 |
| W2\_BUER\_MAX\_0035 | Max | Er hat gerade geblinzelt, ein einziges Mal. Das war seine Mittagspause. | Ansehen: Beamter 1, zweites Mal |
| W2\_BUER\_MAX\_0040 | Max | Brille, Schnurrbart, Stempel. Der Stempel ist größer als sein Kopf und vermutlich auch wichtiger. | Ansehen: Beamter 2 |
| W2\_BUER\_MAX\_0045 | Max | Wenn nichts vor ihm liegt, stempelt er in die Luft. Übung macht den Beamten. | Ansehen: Beamter 2, zweites Mal |
| W2\_BUER\_MAX\_0050 | Max | Schriftrollen bis zur Decke. Das ist entweder das Archiv oder der Müll, und bei Ämtern weiß man das nie so genau. | Ansehen: Formularberg |
| W2\_BUER\_MAX\_0055 | Max | Ganz unten liegt ein Antrag auf einen Antrag, und daneben einer für ein Formular, das es gar nicht gibt. Erledigt ist hier nichts. | Ansehen: Formularberg, zweites Mal |
| W2\_BUER\_MAX\_0060 | Max | Ein leeres Formular, ganz unten im Stapel. Das ist das einzige, das noch keiner ausgefüllt hat. | Nehmen: leeres Formular vom Formularberg |
| W2\_BUER\_MAX\_0070 | Max | Wachstafeln. Man schreibt was rein und kratzt es wieder raus. Die Rückgängig-Taste der Antike. | Ansehen: Wachstafeln |
| W2\_BUER\_MAX\_0075 | Max | Auf einer steht „Rückgängig“, und sonst ist sie leer. Da hat es wohl jemand benutzt. | Ansehen: Wachstafeln, zweites Mal |
| W2\_BUER\_MAX\_0080 | Max | Ein vergilbter Zettel an der Wand. Niemand liest ihn, und deshalb gilt er wahrscheinlich immer noch. | Ansehen: Aushang; öffnet Nahansicht |
| W2\_BUER\_MAX\_0085 | Max | Der Zettel ist so alt, dass sich die Ecken eingerollt haben. Er sieht aus wie Pixel beim Schlafen. | Ansehen: Aushang, zweites Mal; öffnet Nahansicht |
| W2\_BUER\_MAX\_0090 | Max | „Jedes neue Rundschreiben gilt sofort und über allen anderen Vorschriften.“ Das ist eine Sicherheitslücke mit Reißzwecke. | Nahansicht Aushang; Notizbuch Seite 2 |
| W2\_BUER\_PIX\_0100 | Pixel | Neue Regel schlägt alte Regel. In meinem Haushalt gilt dasselbe, junger Mann. // Mit dem kleinen Unterschied, dass bei uns ich die neuen Regeln mache. Und die alten auch. | Nahansicht Aushang, nach dem Lesen |
| W2\_BUER\_MAX\_0110 | Max | Eine Bank mit Wartenden. Einer hat einen Bart bis zum Boden, und der sitzt hier bestimmt seit Nummer eins. | Ansehen: Bank mit Wartenden |
| W2\_BUER\_PIX\_0115 | Pixel | Der Mann mit dem Bart wartet seit Nummer eins. Ich warte seit fünf Minuten. // Und ich kann dir versichern, dass wir beide gleich weit am Ende sind. | Ansehen: Bank mit Wartenden, zweites Mal |
| W2\_BUER\_MAX\_0120 | Max | Staub in den Sonnenstrahlen. Der schwebt so langsam, dass man fast zugucken kann, wie die Zeit vergeht. | Ansehen: Staub |
| W2\_BUER\_MAX\_0125 | Max | Der Staub tanzt im Licht. Er hat hier eindeutig das spannendste Leben von allen. | Ansehen: Staub, zweites Mal |
| W2\_BUER\_MAX\_0130 | Max | Hallo. Ich bräuchte einen Startpass. | Reden: Beamter 1, Einstieg |
| W2\_BUER\_BE1\_0140 | Beamter 1 | Bürgerschein. | ohne aufzuwachen |
| W2\_BUER\_MAX\_0150 | Max | Hab ich nicht. |  |
| W2\_BUER\_BE1\_0160 | Beamter 1 | Dann keinen Startpass. Startpass gibt's nur für Bürger, und Bürger haben einen Bürgerschein. Schalter zwei. |  |
| W2\_BUER\_MAX\_0170 | Max | Und was ist, wenn ich gar kein Grieche bin? | Option Beamter 1 |
| W2\_BUER\_BE1\_0180 | Beamter 1 | Dann wirst du einer. An Schalter zwei. Mit Startpass. |  |
| W2\_BUER\_MAX\_0660 | Max | Und was passiert an Schalter zwei? |  |
| W2\_BUER\_BE1\_0670 | Beamter 1 | Da fragt man dich, ob du Grieche bist. Ich würde nicht nein sagen. Nur so als Rat. |  |
| W2\_BUER\_MAX\_0190 | Max | Wer hat diese Regeln gemacht? | Option Beamter 1 (bleibt) |
| W2\_BUER\_BE1\_0200 | Beamter 1 | Ein Rundschreiben. Rundschreiben kommen von oben, und oben ist irgendwo. Wir fragen nicht. | Hinweis Rätsel 3 |
| W2\_BUER\_PIX\_0680 | Pixel | Bei uns zu Hause ist oben meistens der Kühlschrank. Ich sitze dort gern und erlasse Bestimmungen. |  |
| W2\_BUER\_BE1\_0690 | Beamter 1 | Dann ist euer Kühlschrank sehr streng. Wir fragen trotzdem nicht. |  |
| W2\_BUER\_MAX\_0210 | Max | Dann geh ich halt zu Schalter zwei. | Option Beamter 1, beendet das Gespräch |
| W2\_BUER\_BE1\_0220 | Beamter 1 | Nummer ziehen. | es gibt keine Nummern |
| W2\_BUER\_MAX\_0230 | Max | Ich brauche einen Bürgerschein. | Reden: Beamter 2, Einstieg |
| W2\_BUER\_BE2\_0240 | Beamter 2 | Startpass. | rückt die Brille zurecht |
| W2\_BUER\_MAX\_0250 | Max | Den bekomme ich nur mit Bürgerschein. |  |
| W2\_BUER\_BE2\_0260 | Beamter 2 | Richtig. Und den Bürgerschein bekommst du nur mit Startpass. Das System funktioniert, seit vierhundert Jahren. // Niemand hat es je geschafft. Wir sind sehr stolz. |  |
| W2\_BUER\_MAX\_0270 | Max | Das ist doch eine Endlosschleife. | Option Beamter 2 |
| W2\_BUER\_BE2\_0280 | Beamter 2 | Das ist Verwaltung. Dasselbe Wort, nur länger. |  |
| W2\_BUER\_MAX\_0700 | Max | Und wie komme ich da raus? |  |
| W2\_BUER\_BE2\_0710 | Beamter 2 | Raus kommt man nicht. Entweder man wird erledigt, oder man wird alt. Beides ist eine Art Stempel. |  |
| W2\_BUER\_MAX\_0290 | Max | Gibt es Ausnahmen? | Option Beamter 2 (bleibt) |
| W2\_BUER\_BE2\_0300 | Beamter 2 | Nur, wenn ein neues Rundschreiben kommt. Dann machen wir, was drinsteht, sofort und egal, was. // Das ist unsere größte Angst und unsere einzige Freude. | Hinweis Rätsel 3 |
| W2\_BUER\_MAX\_0720 | Max | Und wer schreibt die Rundschreiben? |  |
| W2\_BUER\_BE2\_0730 | Beamter 2 | Jemand mit Siegel. Oder jemand, der eins gefunden hat. Wir prüfen keine Siegel, wir verneigen uns vor ihnen. |  |
| W2\_BUER\_MAX\_0310 | Max | Ich überleg mir was. | Option Beamter 2, beendet das Gespräch |
| W2\_BUER\_BE2\_0320 | Beamter 2 | Die Bank ist frei. Ab übermorgen. |  |
| W2\_BUER\_HER\_0330 | Hermes | Hallo! Da seid ihr ja! Ich hab's rausgefunden: Euer Startpass ist in einem anderen Büro! | stürmt herein, nach dem ersten Gespräch mit einem Beamten |
| W2\_BUER\_MAX\_0340 | Max | Es gibt hier aber kein anderes Büro. |  |
| W2\_BUER\_HER\_0350 | Hermes | Dann ist er da! | zeigt auf eine Wand |
| W2\_BUER\_PIX\_0360 | Pixel | Der Mann hat geflügelte Schuhe und ist trotzdem immer zu spät. // Das ist Charakter. Dagegen helfen keine Federn. |  |
| W2\_BUER\_MAX\_0370 | Max | Ein Formular und ein Kugelschreiber, der ohne Tintenfass schreibt. Ich schreib jetzt ein Rundschreiben, von oben. Oben bin jetzt ich. | Kugelschreiber auf leeres Formular; Notizbuch: Baustein „schreibt ohne Tintenfass“ |
| W2\_BUER\_MAX\_0380 | Max | „Rundschreiben. Ab sofort gibt es Startpass und Bürgerschein nur gegen Passierschein Vier-Strich-Ypsilon.“ | Rundschreiben im Inventar; Kugelschreiber verbraucht (Mine leer, Wunderding ausgegeben) |
| W2\_BUER\_MAX\_0390 | Max | Tinte vom Tintenfisch auf Papyrus vom Nil, und ich schreib mit dem Finger. Das klebt mehr als jeder Touchscreen. | Tintenfass auf Papyrus |
| W2\_BUER\_MAX\_0400 | Max | Dasselbe Rundschreiben, bloß blauer und mit Fingerabdruck. Amtlich genug. | Rundschreiben (Tinte) im Inventar |
| W2\_BUER\_MAX\_0410 | Max | Die Socke. Sie sortiert alles, und zwar sofort. | Sortierende Socke auf Formularberg |
| W2\_BUER\_NAR\_0420 | – | Die Socke wirbelt durch den Berg. Rollen fliegen, Staub steigt, Beamter 1 wacht kurz auf und schläft wieder ein. Oben liegt ein einzelnes Rundschreiben, fertig geschrieben, nie abgegeben. | Animation |
| W2\_BUER\_MAX\_0430 | Max | „Rundschreiben: Startpass nur gegen Passierschein Vier-Strich-Ypsilon.“ Jemand hatte vor mir dieselbe Idee und dann wohl keinen Mut mehr. | Rundschreiben gefunden; Socke zurück ins Inventar |
| W2\_BUER\_PIX\_0440 | Pixel | Diese Socke hat in zehn Sekunden erledigt, was dieses Amt in vierhundert Jahren nicht geschafft hat. // Ich bin beinahe stolz. Auf eine Socke. So tief bin ich gesunken. |  |
| W2\_BUER\_MAX\_0450 | Max | Hier. Ein neues Rundschreiben, von oben. | Rundschreiben auf Beamter 1 oder Beamter 2 |
| W2\_BUER\_BE2\_0460 | Beamter 2 | Ein Rundschreiben. Ein neues. Es gilt sofort. Es verlangt … einen Passierschein Vier-Strich-Ypsilon. | liest, Brille rutscht |
| W2\_BUER\_BE1\_0470 | Beamter 1 | Den gibt es nicht. | hellwach |
| W2\_BUER\_BE2\_0480 | Beamter 2 | Den gibt es nicht! Aber wir müssen ihn verlangen! Wir müssen etwas verlangen, das es nicht gibt! Das ist … das ist das Ende! | Panik |
| W2\_BUER\_BE1\_0490 | Beamter 1 | Stempel alles. Alles! Startpass, Bürgerschein, Passierschein. Damit er geht. Damit er nie wiederkommt. |  |
| W2\_BUER\_NAR\_0500 | – | Beamter 2 stempelt. Tische, Rollen, die Bank, den Mann mit dem Bart. Dann Max' Formular. Dreimal. | Animation Stempel |
| W2\_BUER\_BE2\_0510 | Beamter 2 | Startpass. Bürgerschein. Passierschein Vier-Strich-Ypsilon, hiermit erfunden und sofort ungültig. Und jetzt geh. Bitte. | gibt Startpass; Rätsel 3 gelöst |
| W2\_BUER\_MAX\_0520 | Max | Ein Startpass, eine Wachstafel mit Siegel. Ich bin jetzt offiziell Grieche und Sportler, beides zum ersten Mal. | Ansehen: Startpass im Inventar |
| W2\_BUER\_MAX\_0525 | Max | Mein Name steht drauf, falsch geschrieben, aber mit Siegel. Jetzt ist der falsche Name amtlich. | Ansehen: Startpass im Inventar, zweites Mal |
| W2\_BUER\_MAX\_0530 | Max | Hier. Ein Empfehlungsschreiben von der Sphinx. | Empfehlungsschreiben auf Beamter 1 oder 2 |
| W2\_BUER\_BE2\_0540 | Beamter 2 | „Wer dies liest und nicht versteht, stempelt besser, bevor er fragt.“ Verstehst du das? | zu Beamter 1 |
| W2\_BUER\_BE1\_0550 | Beamter 1 | Nein. Stempel. | Stempel-Animation; Startpass; Rätsel 3 gelöst |
| W2\_BUER\_BE2\_0560 | Beamter 2 | Ein Stift ohne Tintenfass. Er schreibt einfach so. Das ist … das ist nicht zulässig. Das ist wunderbar. Weg damit. | Kugelschreiber auf Beamter 2; schiebt ihn zurück, Kugelschreiber bleibt; Notizbuch: Baustein „schreibt ohne Tintenfass“ |
| W2\_BUER\_MAX\_0570 | Max | Ein leeres Formular abgeben? Dann bin ich der Erste, der das Amt mit gar nichts überfordert. Nein, der Zweite. Der Bart war schneller. | leeres Formular auf Beamter |
| W2\_BUER\_MAX\_0580 | Max | Opas Papyrus abgeben? „Fein wie Staub.“ Die würden das stempeln und ernst nehmen, und das will ich nicht erleben. | Opas Papyrus auf Beamter |
| W2\_BUER\_BE1\_0590 | Beamter 1 | Katzen brauchen keinen Startpass, weil Katzen nicht starten dürfen. Katzen dürfen aber warten. | Pixel auf Beamter 1 |
| W2\_BUER\_MAX\_0600 | Max | Hermes, hast du zufällig Schuhe für den Lauf? | automatisch direkt nach 0510 oder 0550; Hermes stürmt wieder herein |
| W2\_BUER\_HER\_0610 | Hermes | Meine Sandalen? Klar, nimm sie! Die wollen sowieso immer weg. Schnür sie gut, sonst sind sie vor dir im Ziel. Oder in Ägypten. | gibt die geflügelten Sandalen |
| W2\_BUER\_MAX\_0620 | Max | Geflügelte Sandalen. Sie zappeln im Inventar und brummen dabei leise, als hätte jemand den Vibrationsalarm angelassen. | Ansehen: Sandalen im Inventar |
| W2\_BUER\_PIX\_0625 | Pixel | Sandalen mit Flügeln, und sie zappeln. // Ich habe beschlossen, sie als Beute zu betrachten. Halt sie gut fest, sonst kümmere ich mich darum. | Ansehen: Sandalen im Inventar, zweites Mal |
| W2\_BUER\_MAX\_0630 | Max | Ein Schluck Öl auf die Riemen. Jetzt sitzen sie, hoffentlich bis ins Ziel. | Olivenöl auf Sandalen; Sandalen geölt, Olivenöl bleibt angebrochen im Inventar |
| W2\_BUER\_PIX\_0640 | Pixel | Du ölst Schuhe. Ich öle mich nie, und bin trotzdem geschmeidig. // Das nennt man Veranlagung. Man hat sie, oder man hat Olivenöl. | nach 0630 |
| W2\_BUER\_HER\_0650 | Hermes | Die Römer? Die haben die Post schneller gemacht. Die war vorher mein Job. Ich meine, sie ist es noch. Ich muss los! | Option Hermes: Was hältst du von den Römern? |

## 17. Agora von Olympia: Ansehen, Cicero, Griechen, Tonne

Marktplatz neben dem Stadion. Cicero redet am Pult vor römischen Touristen, Tiro schreibt mit, Griechen beschweren sich, der Philosoph beschimpft alle aus seiner Tonne. Hier sammelt Max die Konter für das Rede-Ringen (Rätsel 9): Konter 1 bis 3 stehen auf der Schriftrolle, 4 und 5 kommen von den Griechen, 6 und 7 aus der Tonne. Die Sandale (Rätsel 6) steht in Abschnitt 18.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_AGOR\_MAX\_0010 | Max | Ein Marktplatz, auf dem alle gleichzeitig reden und keiner zuhört. Ich bin quasi in einem Kommentarbereich gelandet. | erstes Betreten |
| W2\_AGOR\_MAX\_0020 | Max | Eine Säulenhalle, weiß, kühl und schattig. Hier hängen die Leute ab, die zu klug für Sport sind. | Ansehen: Säulenhalle |
| W2\_AGOR\_MAX\_0025 | Max | Im Schatten sitzen Männer und denken laut. Philosophie klingt erstaunlich ähnlich wie Schnarchen. | Ansehen: Säulenhalle, zweites Mal |
| W2\_AGOR\_MAX\_0030 | Max | Eine hohe Säule mit einem Steinadler obendrauf. Und unten liegt ein Heuhaufen, genau darunter. | Ansehen: hohe Säule mit Adler |
| W2\_AGOR\_MAX\_0035 | Max | Adler oben, Heuhaufen unten. Gleich springt da einer mit ausgebreiteten Armen runter. Das hab ich schon tausendmal gesehen, auf dem Bildschirm. | Ansehen: hohe Säule mit Adler, zweites Mal |
| W2\_AGOR\_MAX\_0040 | Max | Wer da runterspringt, landet genau im Heu. Rein zufällig natürlich. | Ansehen: Heuhaufen |
| W2\_AGOR\_PIX\_0050 | Pixel | Heu. Warm, trocken, und es raschelt angenehm. Acht von zehn Punkten als Schlafplatz. // Zwei Punkte Abzug für den Adler, der einem beim Schlafen zusieht. Ich mag kein Publikum, wenn ich nicht auftrete. | Ansehen: Heuhaufen, zweites Mal |
| W2\_AGOR\_MAX\_0060 | Max | Eine Marmorfrau mit beiden Armen. Sieht teuer aus, also fass ich nichts an. | Ansehen: Venusstatue, vor dem Finaltag |
| W2\_AGOR\_MAX\_0065 | Max | Sie steht da, als würde sie gleich was Wichtiges sagen, und das seit zweitausend Jahren. | Ansehen: Venusstatue, vor dem Finaltag, zweites Mal |
| W2\_AGOR\_MAX\_0070 | Max | Die Marmorfrau hat keine Arme mehr. Das war auch ich. Sie sieht trotzdem berühmter aus als vorher. | Ansehen: Venusstatue, nach dem Finaltag |
| W2\_AGOR\_MAX\_0075 | Max | Ich guck lieber woanders hin. Jedes Mal, wenn ich hinsehe, fühl ich mich verhaftet. | Ansehen: Venusstatue, nach dem Finaltag, zweites Mal |
| W2\_AGOR\_MAX\_0080 | Max | Ein Rednerpult. Da steht einer drauf und redet seit Stunden. Die Leute davor haben Sonnenhüte, die wussten also, was kommt. | Ansehen: Rednerpult |
| W2\_AGOR\_MAX\_0085 | Max | Er redet immer noch. Die Sonnenhüte haben sich echt gelohnt. | Ansehen: Rednerpult, zweites Mal |
| W2\_AGOR\_MAX\_0090 | Max | Obst, Töpfe und noch mehr Töpfe. Jeder Stand verkauft dasselbe und behauptet, seins sei besser. | Ansehen: Marktstände |
| W2\_AGOR\_PIX\_0100 | Pixel | Obst. Nur Obst, so weit das Auge reicht, und nicht ein einziger Fisch. // Olympia ist ein Markt für Leute, die noch nie richtig gegessen haben. Ich bedauere sie, aber nur kurz. | Ansehen: Marktstände, zweites Mal |
| W2\_AGOR\_MAX\_0110 | Max | Eine Tonne, und da drin sitzt ein Mann. Der Mann schreit, die Tonne nicht. | Ansehen: Tonne |
| W2\_AGOR\_MAX\_0115 | Max | Ich hab mich vor die Tonne gestellt, und er sagt, ich steh ihm in der Sonne. Ich geh. Mit Leuten in Tonnen streite ich mich nicht. | Ansehen: Tonne, zweites Mal |
| W2\_AGOR\_MAX\_0120 | Max | Griechen und Touristen in roten Togen mit Sonnenhüten. Die Touristen zeigen auf alles, die Griechen zeigen auf die Touristen. | Ansehen: Menge |
| W2\_AGOR\_PIX\_0125 | Pixel | Lauter Leute in Röcken und Sandalen, und keiner von ihnen hat Thunfisch dabei. // Ich stelle hiermit fest: Kultur wird maßlos überschätzt. | Ansehen: Menge, zweites Mal |
| W2\_AGOR\_MAX\_0130 | Max | Ein Tourist mit Sonnenhut, Sandalen und weißen Socken. Manche Dinge ändern sich in zweitausend Jahren einfach nicht. | Ansehen: Römischer Tourist |
| W2\_AGOR\_MAX\_0135 | Max | Weiße Socken in Sandalen. Wenn ich zu Hause bin, erzähl ich das meinem Vater. Er wird stolz sein. | Ansehen: Römischer Tourist, zweites Mal |
| W2\_AGOR\_TOU\_0140 | Tourist | Und das hier, Liebling, ist die Agora. Steht im Reiseführer ganz oben, direkt nach „Nicht das Wasser trinken“. | Reden: Tourist |
| W2\_AGOR\_MAX\_0150 | Max | Eine Touristin mit riesiger Sonnenbrille und Souvenir-Amphore. Sie guckt, als hätte sie das alles schon gesehen, und zwar zweimal. | Ansehen: Römische Touristin |
| W2\_AGOR\_MAX\_0155 | Max | Sie trägt die Amphore wie eine Handtasche, und hinten drauf steht „Gruß aus Olympia“. | Ansehen: Römische Touristin, zweites Mal |
| W2\_AGOR\_MAX\_0160 | Max | Ein Straßenmusiker mit Lyra und Hut. Im Hut liegt eine Olive. Angebissen. | Ansehen: Straßenmusiker |
| W2\_AGOR\_PIX\_0170 | Pixel | Man sagt, er singe Steine weich. Bei mir hat das nicht funktioniert, und ich habe es versucht. // Die ganze Nacht lang. Die Steine blieben hart, und ich war am Morgen heiser. | Ansehen: Straßenmusiker, zweites Mal |
| W2\_AGOR\_MAX\_0180 | Max | Eine Kritzelei an der Wand, auf Lateinisch. Zwei Namen und ein Herz. | Ansehen: Latein-Kritzelei |
| W2\_AGOR\_PIX\_0190 | Pixel | Römische Touristen, junger Mann. Sie hinterlassen überall ihre Grammatikfehler. // Und ihre Socken. Ich weiß nicht, was davon schlimmer riecht. | Ansehen: Latein-Kritzelei, zweites Mal |
| W2\_AGOR\_MAX\_0200 | Max | Ein stattlicher Mann in Toga mit erhobenem Arm. Er redet, als wäre jeder Satz ein Finale. | Ansehen: Cicero |
| W2\_AGOR\_MAX\_0205 | Max | Er hat den Arm schon wieder oben. Der geht gar nicht mehr runter. | Ansehen: Cicero, zweites Mal |
| W2\_AGOR\_MAX\_0210 | Max | Ein dünner Schreiber mit Wachstafel. Er schreibt schneller, als Cicero redet, und das ist eigentlich unmöglich. | Ansehen: Tiro |
| W2\_AGOR\_MAX\_0215 | Max | Er schreibt, während Cicero Luft holt. Er schreibt sogar das Luftholen mit. | Ansehen: Tiro, zweites Mal |
| W2\_AGOR\_MAX\_0220 | Max | Ein müder Mann in brauner Kutte, der dauernd abwinkt. Vor ihm knien Leute, und er wär ganz eindeutig lieber woanders. | Ansehen: Brian |
| W2\_AGOR\_MAX\_0225 | Max | Wenn der gleich einen Schuh verliert, rennen ihm alle hinterher und beten den Schuh an. Ich kenn die Sorte Menge. | Ansehen: Brian, zweites Mal |
| W2\_AGOR\_MAX\_0230 | Max | Entschuldigung. Bist du Cicero? | Reden: Cicero, Einstieg |
| W2\_AGOR\_CIC\_0240 | Cicero | Ich bin Marcus Tullius Cicero. Und bevor du fragst: Ja, ich halte eine Rede, nein, sie ist nicht zu Ende, und ja, du darfst zuhören. // Das dürfen alle. | ohne den Arm zu senken |
| W2\_AGOR\_MAX\_0250 | Max | Trittst du auch beim Ringen an? | Option Cicero (bleibt) |
| W2\_AGOR\_CIC\_0260 | Cicero | Beim Rede-Ringen, gewiss. Aber erst, wenn ich gefunden habe, weswegen ich hier bin: das Grab des Archimedes. // Ein Grab von genau hundertsiebenunddreißig Jahren, nicht ein Jahr jünger. | Notizbuch: „137 Jahre“; Rätsel 10 offen, sobald auch Rätsel 5 und Tag 1 erledigt sind |
| W2\_AGOR\_MAX\_0600 | Max | Woher weißt du denn so genau, wie alt es ist? |  |
| W2\_AGOR\_CIC\_0610 | Cicero | Ich habe es ausgerechnet. Dreimal, mit einer Rede dazwischen. Jedes Mal kamen hundertsiebenunddreißig Jahre heraus. Und eine Erkältung. |  |
| W2\_AGOR\_MAX\_0270 | Max | Archimedes lebt aber. Er steht in Syrakus in seiner Werkstatt. Nass. | Option Cicero; nach dem Besuch in Syrakus |
| W2\_AGOR\_CIC\_0280 | Cicero | Unsinn. Archimedes ist seit hundertsiebenunddreißig Jahren tot. Es steht in meinen Büchern, und meine Bücher irren nicht. // Der Mann in Syrakus ist ein Schwindler mit nassen Haaren. |  |
| W2\_AGOR\_PIX\_0290 | Pixel | Er glaubt einem Buch mehr als einem nassen Mann vor seiner Nase. // Ich kenne das. Ich glaube der Dose auch mehr als dem Napf, und ich habe damit bisher immer recht behalten. | nach 0280 |
| W2\_AGOR\_MAX\_0300 | Max | Und wo suchst du das Grab? | Option Cicero (bleibt) |
| W2\_AGOR\_CIC\_0310 | Cicero | In Syrakus, auf dem Hügel vor der Stadt, zwischen Dornen und Brombeeren. Dort liegt es, das weiß ich. Ich finde es nur nicht. // Ich brauche einen Stein. Einen alten. | Hinweis Rätsel 10 |
| W2\_AGOR\_MAX\_0620 | Max | Einen alten Stein? Steine sind doch alle alt. |  |
| W2\_AGOR\_CIC\_0630 | Cicero | Einen Grabstein, Junge, mit Würde und Moos. Ein neuer Stein ist ein Versprechen. Ein alter Stein ist ein Beweis. |  |
| W2\_AGOR\_MAX\_0320 | Max | Worum geht's denn in deiner Rede? | Option Cicero |
| W2\_AGOR\_CIC\_0330 | Cicero | Um die Römer, die Griechen, die Tugend, die Zeit, das Vaterland, die Pflicht, die … wo war ich? Egal. Ich fange von vorn an. |  |
| W2\_AGOR\_PIX\_0640 | Pixel | Er hat die Rede verloren, bevor er sie überhaupt gefunden hat. // Das muss man erst einmal schaffen. Ich bewundere das beinahe. Ich verliere nur Haare. |  |
| W2\_AGOR\_MAX\_0340 | Max | Ich geh dann mal. | Option Cicero, beendet das Gespräch |
| W2\_AGOR\_CIC\_0350 | Cicero | Wie lange noch, Junge, willst du meine Geduld missbrauchen? Also geh. Ich rede weiter. Ich rede immer weiter. |  |
| W2\_AGOR\_MAX\_0360 | Max | Was schreibst du da? | Reden: Tiro |
| W2\_AGOR\_TIR\_0370 | Tiro | Alles, jedes Wort, in Kurzschrift. Die hab ich erfunden, weil er nie aufhört. Ich bräuchte nur … eine feste Unterlage. Eine runde. // Egal. Vergiss es. | räuspert sich; Hinweis Rätsel 7 |
| W2\_AGOR\_TIR\_0380 | Tiro | Blau. Ein blauer Stift. Er schreibt und schreibt und hat trotzdem schlechte Laune, genau wie ich. | Kugelschreiber auf Tiro; Notizbuch: Baustein „blau ohne Laune“ |
| W2\_AGOR\_MAX\_0390 | Max | Was ist denn hier los? | Reden: Grieche in der Menge, Einstieg |
| W2\_AGOR\_GRI\_0400 | Grieche | Die Römer! Überall Römer! Sie fotografieren unsere Säulen mit Wachstafeln und fragen, wo das Kolosseum ist! Und was haben wir von denen? Nichts! |  |
| W2\_AGOR\_GRI\_0410 | Grieche | Na gut, den Kalender. Und die Fußbodenheizung. Und den Beton. Und die Post. Aber sonst? Was haben wir von denen, außer Kalender, Fußbodenheizung, Beton und Post? | zweiter Grieche ruft dazwischen; Konter 4 ins Notizbuch: „Außer dem Kalender, der Fußbodenheizung und dem Beton?“ |
| W2\_AGOR\_GRI\_0420 | Grieche | Und wenn einer von denen redet, dann redet er. Stundenlang. Da hilft nur eins: fragen, ob er auch mal Luft holt. Das bringt sie aus dem Takt. | Option Grieche: Wie haltet ihr Cicero aus?; Konter 5 ins Notizbuch: „Holst du auch mal Luft?“ |
| W2\_AGOR\_MAX\_0650 | Max | Fragen, ob er auch mal Luft holt. Merk ich mir. |  |
| W2\_AGOR\_GRI\_0660 | Grieche | Aber frag nicht zu laut, sonst hält er eine Rede übers Atmen. |  |
| W2\_AGOR\_MAX\_0430 | Max | Danke für das Gespräch. | Option Grieche, beendet das Gespräch |
| W2\_AGOR\_GRI\_0440 | Grieche | Und jetzt sag bloß nicht, du bist Römer. Du siehst nicht aus wie ein Römer. Du siehst aus wie jemand, der zu lange drinnen war. |  |
| W2\_AGOR\_MAX\_0450 | Max | Hallo? Alles okay da drin? | Reden: Philosoph |
| W2\_AGOR\_PHI\_0460 | Philosoph | GEH MIR AUS DER SONNE! Du stehst im Licht wie ein Sack ohne Boden! Dein Hoodie hat mehr Verstand als du, und der ist aus Stoff! | schreit, Laterne schwankt |
| W2\_AGOR\_MAX\_0470 | Max | Okay. Netter Mann, sehr direkt. Ich glaub, der kann uns helfen. Bloß nicht mir. |  |
| W2\_AGOR\_PIX\_0480 | Pixel | Eine Tonne. Dunkel, eng, und sie riecht nach Mensch. // Ich gehe da jetzt hinein, und ich möchte betonen, dass ich es nicht gern tue. // Ich tue es, weil dieser Mann Dinge sagt, die ich unbedingt lernen möchte. | Spielfigur Pixel: Tonne benutzen |
| W2\_AGOR\_PHI\_0490 | Philosoph | Eine Katze! Endlich jemand, der nichts will und nichts tut! Komm rein. Ich zeig dir, wie man Menschen beleidigt. Lektion eins: Augenkontakt. | Pixel in der Tonne |
| W2\_AGOR\_NAR\_0500 | – | Aus der Tonne dringt Geschimpfe, dann Gelächter, dann Geschimpfe. Nach einer Weile kommt Pixel heraus, mit sehr hoch getragenem Kopf. | Animation, Zeitraffer |
| W2\_AGOR\_PIX\_0510 | Pixel | Ich habe zwei Dinge gelernt. // Erstens: „Du redest wie einer, der sich selbst zuhört, weil es sonst keiner tut.“ // Zweitens: „Deine Toga hat mehr Falten als dein Argument.“ Ich bin bereit für alles. | Konter 6 und 7 ins Notizbuch |
| W2\_AGOR\_MAX\_0520 | Max | Ein Kater kommt aus einer Tonne und ist noch arroganter als vorher. Ich wusste nicht, dass das überhaupt geht. |  |
| W2\_AGOR\_PHI\_0530 | Philosoph | Die Katze versteht mehr als du! Die Katze versteht mehr als Cicero! Und jetzt: aus der Sonne! | nach 0520 |
| W2\_AGOR\_MAX\_0540 | Max | Die Dose in die Tonne werfen? Dann hab ich eine Tonne mit Dose und einen Philosophen mit Beule. | Thunfischdose auf Tonne |
| W2\_AGOR\_MAX\_0550 | Max | Ich pass nicht in die Tonne, und ich will auch nicht. Ich bin das Gegenteil von einem Philosophen: Ich wohne auf einem Sofa. | Benutzen: Tonne mit Max |
| W2\_AGOR\_MAX\_0560 | Max | Ich komm nicht auf die Säule. Ich komm ja nicht mal die Sprossenwand in der Turnhalle hoch. | Benutzen: Säule mit Max |
| W2\_AGOR\_MAX\_0570 | Max | Ins Heu springen? Von wo denn? Ich steh doch schon unten. | Benutzen: Heuhaufen |
| W2\_AGOR\_MAX\_0580 | Max | Cicero einen Kaugummi geben? Dann redet er mit vollem Mund. Das wär tatsächlich leiser, aber nein. | Kaugummi auf Cicero |
| W2\_AGOR\_MAX\_0590 | Max | Dem Musiker die Dose hinstellen? Dann singt er da rein, und am Ende ist die Dose weich. | Thunfischdose auf Straßenmusiker |

## 18. Agora: Rätsel 6, das Zeichen der Sandale und die Feigen

Nach Tag 1 hängt eine von Hermes' Sandalen oben auf der Säule mit dem Adler. Die Menge hält sie für ein heiliges Zeichen. Rätsel 6 ist freiwillig; die Feigen verbessern nur den Speerwurf am Finaltag. Pixel holt sie als Spielfigur herunter, Max zieht sie an, Brian hängt ihm sein Schild um, die Menge schenkt ihm einen Feigensetzling. Der reift auf der Fähre nach Syrakus zum Baum; die gepflückten Feigen bestechen die Fächerwedler.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_SAND\_MAX\_0010 | Max | Da oben hängt eine Sandale. Meine. Also, die von Hermes. Auf dem Adler. Und der Adler sieht nicht glücklich aus. | Ansehen: Sandale auf der Säule |
| W2\_SAND\_MAX\_0015 | Max | Der Adler hält die Sandale fest, als wär sie ein Pfand. Ich brauch einen Plan. Oder eine Leiter. | Ansehen: Sandale auf der Säule, zweites Mal |
| W2\_SAND\_TOU\_0020 | Tourist | Die Sandale! Ein Zeichen! Folgt der Sandale! | Menge, beim Betreten nach Tag 1 |
| W2\_SAND\_GRI\_0030 | Grieche | Nein, der Schuh! Folgt dem Schuh! Es ist ein Schuh! | zweite Stimme |
| W2\_SAND\_TOU\_0040 | Tourist | Es ist eine Sandale! Ketzer! |  |
| W2\_SAND\_PIX\_0050 | Pixel | Sie streiten über das richtige Wort für Schuh. // Ich muss gestehen, dass ich Menschen noch nie so gut verstanden habe wie in diesem Augenblick. |  |
| W2\_SAND\_BRI\_0060 | Brian | Ich bin nicht der Messias. Das sag ich seit Jahren, aber niemand hört zu. | Reden: Brian, vor der Sandale |
| W2\_SAND\_MAX\_0070 | Max | Und wer sagt, dass du es bist? | Option Brian |
| W2\_SAND\_BRI\_0080 | Brian | Alle. Weil ich mal einen Kiesel fallen gelassen hab. Seitdem ist jeder Kiesel heilig. Dabei wollte ich eigentlich nur ans Meer. |  |
| W2\_SAND\_MAX\_0400 | Max | Das Meer ist doch gleich da hinten. |  |
| W2\_SAND\_BRI\_0410 | Brian | Da hinten stehen auch dreihundert Leute, die mir folgen. Du gehst nicht ans Meer, wenn dreihundert Leute mitwollen. |  |
| W2\_SAND\_MAX\_0090 | Max | Was würde dich denn erlösen? | Option Brian (bleibt) |
| W2\_SAND\_BRI\_0100 | Brian | Ein neuer Messias. Irgendwer, mit irgendwas. Dann fahr ich in den Urlaub. Ich hab seit zwölf Jahren gepackt. | Hinweis Rätsel 6 |
| W2\_SAND\_MAX\_0420 | Max | Du hast echt seit zwölf Jahren gepackt? |  |
| W2\_SAND\_BRI\_0430 | Brian | Zwei Tuniken und eine Sandale. Die andere haben sie mir geklaut, die ist jetzt eine Reliquie. |  |
| W2\_SAND\_MAX\_0110 | Max | Viel Glück. | Option Brian, beendet das Gespräch |
| W2\_SAND\_BRI\_0120 | Brian | Danke. Das sagt sonst nie jemand. Die wollen immer, dass ich es ihnen bringe. |  |
| W2\_SAND\_PIX\_0130 | Pixel | Eine Säule, hoch und glatt, und oben ein Adler aus Stein und ein Schuh. // Ich mache das nur, weil ich es kann. // Und ein kleines bisschen auch, weil du es nicht kannst. | Spielfigur Pixel: Säule benutzen |
| W2\_SAND\_NAR\_0140 | – | Pixel klettert, springt, hängt kurz am Adler, angelt die Sandale mit der Pfote und lässt sie fallen. Sie landet vor Max' Füßen. Pixel landet im Heu. | Animation |
| W2\_SAND\_PIX\_0150 | Pixel | Rein zufällig im Heu gelandet. Ich bleibe noch einen Moment liegen, aus Prinzip. // Ein Kater, der aus großer Höhe fällt, hat ein Anrecht auf eine angemessene Pause. |  |
| W2\_SAND\_MAX\_0160 | Max | Sandale an. Jetzt bin ich wohl ein Zeichen. | Sandale auf Max |
| W2\_SAND\_TOU\_0170 | Tourist | Er trägt die Sandale! Er ist es! Der Messias! | Menge kniet |
| W2\_SAND\_MAX\_0180 | Max | Ich bin nicht der Messias. |  |
| W2\_SAND\_GRI\_0190 | Grieche | Er sagt Nein! So bescheiden ist nur der Echte! |  |
| W2\_SAND\_MAX\_0200 | Max | Okay. Dann bin ich's halt. |  |
| W2\_SAND\_TOU\_0210 | Tourist | Er hat es zugegeben! Noch heiliger! |  |
| W2\_SAND\_PIX\_0220 | Pixel | Du kannst nicht gewinnen. Ich kenne das gut, und zwar von mir. // Ich bin der Kater, gegen den man nicht gewinnen kann. Frag deinen Großvater, er hat es jahrelang versucht. |  |
| W2\_SAND\_BRI\_0230 | Brian | Endlich. Hier, das Schild. Es gehört jetzt dir. Ich fahr ans Meer. Ruf nicht an. Es gibt kein Telefon, und das ist auch gut so. | hängt Max das Schild um, geht |
| W2\_SAND\_MAX\_0240 | Max | Ein Holzschild: „Ich bin nicht der Messias.“ Und auf der Rückseite steht: „Doch.“ Brian hatte mal Humor. Irgendwann. | Ansehen: Brians Schild im Inventar |
| W2\_SAND\_MAX\_0245 | Max | Vorne Nein, hinten Doch. Brian hat sich zwölf Jahre lang nicht entschieden. | Ansehen: Brians Schild im Inventar, zweites Mal |
| W2\_SAND\_NAR\_0250 | – | Die Menge drängt heran: ein Krug, ein Hut, ein Sack Oliven. Und ein kleiner Feigensetzling im Topf, den ein Kind Max in die Hand drückt. | Geschenke; Feigensetzling ins Inventar |
| W2\_SAND\_MAX\_0260 | Max | Ein Feigensetzling im Topf mit zwei Blättern. In zwanzig Jahren ist das vielleicht mal ein Snack. | Ansehen: Feigensetzling; Sanduhr-Symbol im Inventar |
| W2\_SAND\_MAX\_0265 | Max | Zwei Blätter. Ich hab noch mal gezählt, immer noch zwei. | Ansehen: Feigensetzling, zweites Mal; Sanduhr-Symbol im Inventar |
| W2\_SAND\_PIX\_0270 | Pixel | Zwanzig Jahre, oder eine Fährfahrt. Du hast die Tafel doch gelesen. // Ich habe sogar gesehen, wie du sie gelesen hast. Du hast dabei die Lippen bewegt. | nach 0260; Hinweis |
| W2\_SAND\_FAW\_0280 | Fächerwedler | Ein Setzling? Wir wollen Feigen, reife, pralle Feigen. Keine Hoffnung im Topf. | Feigensetzling auf Fächerwedler |
| W2\_SAND\_MAX\_0290 | Max | Ein ausgewachsener Feigenbaum in einem Blumentopf, voller Früchte. Und ich hab ihn erst seit zwei Minuten. | Ansehen: Feigenbaum im Inventar |
| W2\_SAND\_MAX\_0295 | Max | Ein ganzer Baum in meinem Inventar. Pixel hat schon geguckt, ob man draufklettern kann. | Ansehen: Feigenbaum im Inventar, zweites Mal |
| W2\_SAND\_MAX\_0300 | Max | Ich pflücke. Was ich selbst pflücke, bleibt, wie es ist. So steht's auf der Tafel, und jetzt steht's auch in meinem Notizbuch. | Benutzen: Feigenbaum im Inventar; gepflückte Feigen ohne Sanduhr; Notizbuch Seite 2 |
| W2\_SAND\_PIX\_0310 | Pixel | Obst mit Ablaufdatum, junger Mann, aber eben nur, solange es am Baum hängt. // Kaum hat man es gepflückt, ist ihm die Zeit egal. Ich halte das für eine sehr kluge Lebenseinstellung. | nach 0300 |
| W2\_SAND\_MAX\_0320 | Max | Frische Feigen, lila und prall. Ich kenn zwei, die dafür alles tun. | Ansehen: gepflückte Feigen |
| W2\_SAND\_MAX\_0325 | Max | Die Feigen kleben mir an den Fingern. Ich rieche jetzt wie ein ganzer Obststand. | Ansehen: gepflückte Feigen, zweites Mal |
| W2\_SAND\_MAX\_0330 | Max | Hier, frische Feigen. Für gleichmäßigen Wind. | gepflückte Feigen auf Fächerwedler im Thronsaal |
| W2\_SAND\_FAW\_0340 | Fächerwedler | Feigen! Frische! Wir wedeln, wie du willst: links, rechts, gleichmäßig, im Takt. Wir wedeln sogar nachts. | nimmt die Feigen; Rätsel 6 gelöst |
| W2\_SAND\_PIX\_0350 | Pixel | Zwei erwachsene Männer, bestochen mit Obst, vor meinen Augen. // Und ich bekomme nicht eine Feige ab. Nicht einmal eine halbe. Ich esse zwar keine Feigen, aber darum geht es nicht. |  |
| W2\_SAND\_MAX\_0360 | Max | Ein Feigenkern. Ich bin zu weit gefahren, und zwar in die falsche Richtung. Der Baum ist jetzt bloß noch ein Gedanke. | Ansehen: Feigenkern im Inventar |
| W2\_SAND\_MAX\_0365 | Max | Ein Kern. Ein ganzer Baum, zusammengefaltet in einen Krümel. | Ansehen: Feigenkern im Inventar, zweites Mal |
| W2\_SAND\_FAW\_0370 | Fächerwedler | Ein Kern. Du gibst uns einen Kern. Dafür wedeln wir genau einmal. So. Fertig. | Feigenkern auf Fächerwedler |
| W2\_SAND\_MAX\_0380 | Max | Den ganzen Baum abgeben? Dann wedeln die damit. Das wär auch Wind, aber nicht der richtige. | Feigenbaum auf Fächerwedler |
| W2\_SAND\_MAX\_0390 | Max | Den Setzling hier einpflanzen? Dann steht hier in hundert Jahren ein Baum. Ich hab keine hundert Jahre, ich hab eine Fähre. | Feigensetzling auf Schilf oder Erde |

## 19. Olympia, Stadion: Ansehen und Leonidas

Laufbahn, Sandgrube, Kampfrichterzelt, Zuschauerränge, im Hintergrund der Glockenturm. Leonidas trainiert und brüllt. An den Wettkampftagen sitzt Ramses mit Hofstaat und Fächerwedlern auf den Rängen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_STAD\_MAX\_0010 | Max | Ein Stadion. Hier schwitzen Leute mit Absicht. | erstes Betreten |
| W2\_STAD\_MAX\_0020 | Max | Eine Laufbahn aus Sand. Sie führt von hier nach da, und mehr passiert nicht. Angeblich ist das aufregend. | Ansehen: Laufbahn |
| W2\_STAD\_MAX\_0025 | Max | Ich guck die Bahn entlang. Am Ende ist das Ziel, am Anfang steh ich. Dazwischen steht eine Schildkröte und dehnt sich. | Ansehen: Laufbahn, zweites Mal |
| W2\_STAD\_MAX\_0030 | Max | Eine Sandgrube mit Mauer. Hier wird gerungen, mit Armen oder, wie ich gehört hab, mit Wörtern. | Ansehen: Sandgrube |
| W2\_STAD\_MAX\_0035 | Max | Im Sand sind lauter Abdrücke von Rücken. Ich fühl mit jedem einzelnen mit. | Ansehen: Sandgrube, zweites Mal |
| W2\_STAD\_MAX\_0040 | Max | Ein weißes Zelt für die Kampfrichter. Drinnen Schatten, draußen Mittag. Die haben hier eindeutig den besten Job. | Ansehen: Kampfrichterzelt |
| W2\_STAD\_PIX\_0045 | Pixel | Ein Zelt mit Schatten. Ich beantrage dort hiermit einen Platz. // Als Kampfrichter für das Nickerchen. Ich bin streng, aber gerecht, und ich bewerte vor allem die Haltung. | Ansehen: Kampfrichterzelt, zweites Mal |
| W2\_STAD\_MAX\_0050 | Max | Steinränge voller Leute, die schon jubeln, bevor überhaupt was passiert. Die haben alle Sonnenbrand und trotzdem gute Laune. | Ansehen: Zuschauerränge |
| W2\_STAD\_PIX\_0060 | Pixel | Steinstufen in der Sonne. Warm, breit und leider hart. Sieben Punkte. // Ich verteile heute sehr großzügig Punkte. Das liegt an der Hitze, nicht an meiner Güte. | Ansehen: Zuschauerränge, zweites Mal |
| W2\_STAD\_MAX\_0070 | Max | Ein weißer Glockenturm, weit hinten, kerzengerade. Noch. | Ansehen: Glockenturm, vor dem Finaltag |
| W2\_STAD\_MAX\_0075 | Max | Der Turm steht kerzengerade. Ich hab das Gefühl, der wird später mal berühmt, und zwar aus den falschen Gründen. | Ansehen: Glockenturm, vor dem Finaltag, zweites Mal |
| W2\_STAD\_MAX\_0080 | Max | Der Turm steht schief. Das war der Teller. Ich hoffe, keiner hat's gesehen. Alle haben's gesehen. | Ansehen: Glockenturm, nach dem Finaltag |
| W2\_STAD\_MAX\_0085 | Max | Er neigt sich jedes Mal ein bisschen mehr, wenn ich hingucke. Also guck ich nicht mehr hin. | Ansehen: Glockenturm, nach dem Finaltag, zweites Mal |
| W2\_STAD\_MAX\_0090 | Max | Eine Steintafel mit den Siegern. Lauter Namen mit „-os“ am Ende. | Ansehen: Siegerliste |
| W2\_STAD\_PIX\_0100 | Pixel | Maxos. Das klingt nach einem Reinigungsmittel. // Und es würde zu dir passen, denn du stehst ebenfalls schon sehr lange ungenutzt herum. | Ansehen: Siegerliste, zweites Mal |
| W2\_STAD\_MAX\_0110 | Max | Eine Startlinie im Sand. Davor steht man, dahinter rennt man. Ich bin eher so der Davor-Typ. | Ansehen: Startlinie |
| W2\_STAD\_MAX\_0115 | Max | Die Linie ist schnurgerade gezogen. Wer das war, hatte mehr Ehrgeiz als die meisten Läufer hier. | Ansehen: Startlinie, zweites Mal |
| W2\_STAD\_MAX\_0120 | Max | Ein Mann mit Helm, Trainingsanzug und Trillerpfeife. Er brüllt, und zwar ohne erkennbaren Grund. Einfach so vor sich hin. | Ansehen: Leonidas |
| W2\_STAD\_MAX\_0125 | Max | Er brüllt, auch wenn keiner was gefragt hat. Ich wette, der hat zu Hause einen Lieblingsbrunnen, in den er Leute schubst. | Ansehen: Leonidas, zweites Mal |
| W2\_STAD\_LEO\_0130 | Leonidas | WER BIST DU? | Reden: Leonidas, Einstieg |
| W2\_STAD\_MAX\_0140 | Max | Max. Ich trete auch an. |  |
| W2\_STAD\_LEO\_0150 | Leonidas | DU? GEGEN MICH? DAS IST OLYMPIA! | tritt gegen nichts |
| W2\_STAD\_MAX\_0160 | Max | Warum brüllst du eigentlich so? | Option Leonidas |
| W2\_STAD\_LEO\_0170 | Leonidas | ICH BRÜLLE NICHT! DAS IST MEINE ZIMMERLAUTSTÄRKE! |  |
| W2\_STAD\_PIX\_0320 | Pixel | Meine Ohren klappen nach hinten. // Das tun sie sonst nur beim Staubsauger, und der hat wenigstens den Anstand, irgendwann wieder auszugehen. |  |
| W2\_STAD\_LEO\_0330 | Leonidas | DER KATER HÄLT MICH AUS! DER KATER IST EIN SPARTANER! |  |
| W2\_STAD\_MAX\_0180 | Max | Was ist deine beste Disziplin? | Option Leonidas |
| W2\_STAD\_LEO\_0190 | Leonidas | ALLE! LAUF! SPRUNG! SPEER! DISKUS! UND DAS MIT DEN WORTEN! DA BRÜLLE ICH AM LAUTESTEN! |  |
| W2\_STAD\_MAX\_0340 | Max | Und beim Rede-Ringen? Da geht's doch um Argumente. |  |
| W2\_STAD\_LEO\_0350 | Leonidas | WER LAUTER IST, GEWINNT! SO HABE ICH ES IMMER VERSTANDEN! BIS JETZT HAT NIEMAND WIDERSPROCHEN! |  |
| W2\_STAD\_MAX\_0200 | Max | Wo isst du eigentlich zu Mittag? | Option Leonidas |
| W2\_STAD\_LEO\_0210 | Leonidas | AM RAND DER LAUFBAHN! TELLER AUF DEM SCHOSS! NIEMAND WAGT SICH IN MEINE NÄHE! | Vorbereitung Speer-Pointe |
| W2\_STAD\_MAX\_0360 | Max | Klingt ein bisschen einsam. |  |
| W2\_STAD\_LEO\_0370 | Leonidas | … ein bisschen. ABER LAUT! |  |
| W2\_STAD\_MAX\_0220 | Max | Bis zum Wettkampf. | Option Leonidas, beendet das Gespräch |
| W2\_STAD\_LEO\_0230 | Leonidas | HEUTE ABEND SPEISEN WIR … ZU HAUSE! MEINE MUTTER KOCHT! |  |
| W2\_STAD\_PIX\_0240 | Pixel | Er brüllt, und ich höre trotzdem nicht zu. // Das ist meine Superkraft. Ich habe sie an dir jahrelang trainiert. | Zuruf, Stadion, wenn Leonidas da ist |
| W2\_STAD\_MAX\_0250 | Max | Eine kleine Schildkröte mit Stirnband. Sie guckt entschlossener als alle anderen hier. | Ansehen: Schildkröte |
| W2\_STAD\_MAX\_0255 | Max | Die Schildkröte hat Vorsprung. Ein Grieche hat mal ausgerechnet, dass man sie dann nie einholt, und ich hab sie laufen sehen. Ich glaub's sofort. | Ansehen: Schildkröte, zweites Mal |
| W2\_STAD\_MAX\_0260 | Max | Ramses auf der Tribüne zwischen zwei Fächerwedlern. Er guckt von einem zum anderen und kann sich nicht entscheiden, wem er zujubelt. | Ansehen: Ramses im Stadion; Wettkampftage |
| W2\_STAD\_MAX\_0265 | Max | Er klatscht für beide Seiten gleichzeitig. Das ist sozusagen sein politisches Programm. | Ansehen: Ramses im Stadion, zweites Mal; Wettkampftage |
| W2\_STAD\_MAX\_0270 | Max | Der Hebel steht neben der Sandgrube. Archimedes hat ihn ganz allein hergeschleppt. Mit einem Hebel. | Ansehen: Wurfhebel im Stadion; nach dem Training |
| W2\_STAD\_MAX\_0275 | Max | Der Hebel wirft einen Schatten bis zur Tribüne, und Archimedes steht daneben und guckt stolz. Zu Recht. | Ansehen: Wurfhebel im Stadion, zweites Mal; nach dem Training |
| W2\_STAD\_MAX\_0280 | Max | Ohne Startpass lassen die mich nicht mal an die Linie. In Olympia ist das Amt stärker als jeder Athlet. | Benutzen: Startlinie ohne Startpass |
| W2\_STAD\_MAX\_0290 | Max | Den Startpass hab ich. Aber fünf Disziplinen ohne Trainer? Ich brauch jemanden, der mir das Fliegen beibringt. | Benutzen: Startlinie mit Startpass, vor Rätsel 5 |
| W2\_STAD\_MAX\_0300 | Max | Kein Diskus, keine Konter, kein Gegner. Das wär kein Finale, das wär bloß Rumstehen in Sandalen. | Benutzen: Startlinie nach Tag 1, solange der Finaltag noch nicht bereit ist |
| W2\_STAD\_MAX\_0310 | Max | Alles bereit. Nur die Wedler wedeln, wie sie wollen, und mit frischen Feigen würden sie gerade wedeln. Ich könnte aber auch einfach so werfen. | Benutzen: Startlinie, erstes Mal, wenn der Finaltag bereit ist und die Wedler nicht bestochen sind; beim nächsten Benutzen beginnt der Finaltag |

## 20. Stadion, Tag 1: Der Sandalen-Lauf

Szene. Beginnt, sobald Startpass (3) und Hebel (5) vorhanden sind und Max die Startlinie benutzt; die Sandalen hat Max dann schon von Hermes. Vorher antworten W2\_STAD\_MAX\_0280 und 0290. Mit geölten Sandalen halten die Riemen bis ins Ziel; ohne Öl fliegen die Sandalen am Start davon, und Max läuft barfuß als Letzter, kommt aber weiter. In jedem Fall landet eine Sandale auf der Agora.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_TAG1\_RAM\_0010 | Ramses | Die Spiele sind eröffnet! Oder sie beginnen! Oder … fangt einfach an! | von der Tribüne, beide Zepter hoch |
| W2\_TAG1\_LEO\_0020 | Leonidas | MARATHON! | rennt los, biegt sofort falsch ab, Richtung Agora |
| W2\_TAG1\_MAX\_0030 | Max | Das ist der Stadionlauf. Einmal geradeaus. |  |
| W2\_TAG1\_LEO\_0040 | Leonidas | MARATHOOON! | von weit weg, falsche Richtung |
| W2\_TAG1\_MAX\_0050 | Max | Die Sandalen ziehen nach vorn. Zum ersten Mal in meinem Leben will irgendwas an mir nach vorn. | mit Öl; Max läuft, Sandalen flattern |
| W2\_TAG1\_NAR\_0060 | – | Max läuft. Die Schildkröte neben der Bahn läuft auch. Die Schildkröte überholt ihn. Kurz. Dann er sie. Dann sie ihn. | Animation Schildkröte |
| W2\_TAG1\_PIX\_0070 | Pixel | Eine Schildkröte überholt ihn. Ein Philosoph hat einmal bewiesen, dass so etwas unmöglich ist. // Der Philosoph hat Max nicht gekannt. | von der Tribüne |
| W2\_TAG1\_NAR\_0080 | – | Max überquert die Ziellinie. Die Riemen reißen, die Sandalen schießen in den Himmel. Eine fliegt Richtung Agora. | mit Öl; Max läuft stolz ein |
| W2\_TAG1\_MAX\_0090 | Max | Ziel. Erster. Vor einer Schildkröte und einem Mann, der gerade in Syrakus ankommt. Ich nehm's. | mit Öl |
| W2\_TAG1\_NAR\_0100 | – | Die Riemen reißen am Start. Die Sandalen heben ab, eine Richtung Agora, eine Richtung Sonne. Max steht barfuß im heißen Sand. | ohne Öl |
| W2\_TAG1\_MAX\_0110 | Max | Heiß. Heiß. Heiß. Heiß! | ohne Öl; rennt barfuß auf Zehenspitzen |
| W2\_TAG1\_PIX\_0120 | Pixel | Er läuft genau so, wie ich damals über die heiße Herdplatte gelaufen bin. // Mit dem einen Unterschied, junger Mann, dass ich aus der Erfahrung etwas gelernt habe. | ohne Öl |
| W2\_TAG1\_MAX\_0130 | Max | Letzter, hinter der Schildkröte. Aber ich bin im Ziel, und das zählt. Sagt Ramses. Hoffentlich. | ohne Öl |
| W2\_TAG1\_RAM\_0140 | Ramses | Er ist angekommen! Das zählt! Oder? Es zählt. Ich habe entschieden, dass es zählt. Weiter! | in jedem Fall; Lauf abgeschlossen |
| W2\_TAG1\_LEO\_0150 | Leonidas | WO IST DAS ZIEL? ICH BIN IN SYRAKUS! HIER IST EIN NASSER MANN! | aus dem Off |
| W2\_TAG1\_MAX\_0160 | Max | Hermes' Sandalen sind weg, eine davon Richtung Agora. Ich hab so das Gefühl, da seh ich sie wieder. | nach dem Lauf; Hinweis Rätsel 6 |
| W2\_TAG1\_PIX\_0170 | Pixel | Jetzt kommt der Hebel. Du setzt dich hin, ich lege nichts hinein, und du fliegst nirgendwohin. // So stelle ich mir Sport vor. Er ist kurz, er ist ruhig, und keiner schwitzt. | Übergang zum Hebel-Minispiel |

## 21. Stadion, Tag 1: Minispiel Archimedes' Hebel

Max legt Gegenstände aus dem Inventar als Gegengewichte in den Korb und stellt den Winkel ein. Jeder Gegenstand hat ein Gewicht und einen Kommentar von Archimedes. Zu leicht: Sandgrube. Zu schwer: Fluss oder Ciceros Rede. Nach zwei Fehlversuchen bietet Ramses an, großzügig zu werten. Kein Zeitdruck. Jede Kommentarzeile gehört zu einem Gegenstand, den Max an Tag 1 haben kann (Bildtafel, Grabstein und Feigenbaum hat er dann nicht mehr oder noch nicht, deshalb gibt es für sie keine Zeile); Gegenstände ohne eigene Zeile gehen ohne Kommentar in den Korb.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_HEBL\_ARC\_0010 | Archimedes | Gewicht hinten, Junge vorne, dazwischen der Winkel. Drei Dinge. Mehr ist Physik nie. | Start des Minispiels |
| W2\_HEBL\_ARC\_0020 | Archimedes | Eine leere Dose. Die wiegt ungefähr so viel wie die Idee einer Dose. | Thunfischdose in den Korb |
| W2\_HEBL\_PIX\_0030 | Pixel | Die Dose kommt da sofort wieder heraus. Sie ist kein Gewicht. // Sie ist ein Erbstück, und Erbstücke wirft man nicht durch die Luft. | nach 0020 |
| W2\_HEBL\_ARC\_0040 | Archimedes | Ein Buch mit Notizen. Wissen wiegt leider nichts. Das habe ich oft bedauert. | Notizbuch in den Korb |
| W2\_HEBL\_ARC\_0050 | Archimedes | Ein Kochlöffel. Holz. Leicht. Klebt. Warum klebt er? | Kochlöffel in den Korb |
| W2\_HEBL\_ARC\_0060 | Archimedes | Ein schwarzer Stein mit Riss. Drei Prozent von irgendwas. Und drei Prozent wiegen nichts. | Handy in den Korb |
| W2\_HEBL\_ARC\_0070 | Archimedes | Ein blauer Stift. Er wiegt so viel wie eine Feder. Eine blaue Feder. | Kugelschreiber in den Korb |
| W2\_HEBL\_ARC\_0080 | Archimedes | Kaugummi. Der wiegt noch weniger als der Gedanke an ihn. | Kaugummi in den Korb |
| W2\_HEBL\_ARC\_0090 | Archimedes | Eine Wachstafel mit Siegel. Leicht, aber amtlich. Und amtlich ist kein Gewicht. | Startpass in den Korb |
| W2\_HEBL\_ARC\_0100 | Archimedes | Ein Krug Öl! Gut! Schwer! Rutschig! Nicht kippen, sonst fliegt der Korb statt du. | Olivenöl in den Korb |
| W2\_HEBL\_ARC\_0110 | Archimedes | Meine Waage. Sie wiegt sich selbst. Das ist philosophisch, aber leider nicht viel. | Waage in den Korb |
| W2\_HEBL\_ARC\_0120 | Archimedes | Ein Fass mit einem Tintenfisch. Wiegt wenig und spritzt viel. Der Korb wird blau, aber fliegen wirst du trotzdem nicht. | Tintenfass in den Korb |
| W2\_HEBL\_ARC\_0130 | Archimedes | Ein voller Krug. Sehr schwer. Was ist drin? Egal. Masse ist Masse. | Traubensaft, Wein oder Essig in den Korb |
| W2\_HEBL\_ARC\_0140 | Archimedes | Ein goldener Teller. Mittelschwer und rund, und rund nützt auf einem Hebel gar nichts. | Pharaonenteller in den Korb |
| W2\_HEBL\_ARC\_0150 | Archimedes | Ein Brief mit Fettfleck. „Fein wie Staub.“ Dann wiegt er auch so viel. Der Fleck vielleicht ein Gramm. | Opas Papyrus in den Korb |
| W2\_HEBL\_ARC\_0160 | Archimedes | Mein Messbecher. Leer wiegt er nichts, und voll wiegt er Wasser, und das fliegt von allein. Zu leicht. | Messbecher in den Korb |
| W2\_HEBL\_ARC\_0170 | Archimedes | Mein Spiegel, aus Bronze. Brauchbar. Aber wenn die Sonne reinfällt, zündest du den Korb an. | Brennspiegel in den Korb |
| W2\_HEBL\_ARC\_0180 | Archimedes | Eine Socke. Sie wiegt nichts und sortiert dabei meinen Korb. Faszinierend. Und nutzlos. | Sortierende Socke in den Korb |
| W2\_HEBL\_ARC\_0190 | Archimedes | Der Kater! Endlich ein Gewicht mit Charakter. So schwer wie ein voller Umzugskarton. Genau richtig. | Pixel in den Korb |
| W2\_HEBL\_PIX\_0200 | Pixel | Ich bin kein Gewicht, ich bin ein Gott. // Aber wenn es denn sein muss, dann bin ich eben ein sehr schweres und sehr beleidigtes Gewicht. // Und niemand erwähnt jemals wieder den Umzugskarton. | nach 0190 |
| W2\_HEBL\_NAR\_0210 | – | Der Hebel klappt müde hoch. Max rutscht einen Meter und landet in der Sandgrube. | zu leicht |
| W2\_HEBL\_MAX\_0220 | Max | Ich lieg in der Sandgrube, direkt vor dem Hebel. Das war kein Sprung, das war Umfallen mit Anlauf. | zu leicht |
| W2\_HEBL\_NAR\_0230 | – | Der Hebel schnellt hoch. Max fliegt über die Ränge, über die Olivenbäume, und landet mit einem Platsch im Fluss. Der Fährmann treibt vorbei. | zu schwer, erste Variante |
| W2\_HEBL\_MAX\_0240 | Max | Ich bin im Fluss gelandet und komplett nass. Der Fährmann hat gewinkt. Glaub ich. | zu schwer, Variante Fluss |
| W2\_HEBL\_NAR\_0250 | – | Max fliegt über die Mauer, über den Markt und landet mitten auf dem Rednerpult. Cicero redet weiter. | zu schwer, Variante Agora |
| W2\_HEBL\_CIC\_0260 | Cicero | … wie dieser junge Mann beweist, der soeben vom Himmel fiel: Das Schicksal unterbricht den Redner, aber niemals die Rede. | zu schwer, Variante Agora |
| W2\_HEBL\_RAM\_0270 | Ramses | Zweimal daneben. Ich könnte großzügig werten. Soll ich? Ich soll. Oder du versuchst es noch mal. Beides. Eins davon. | nach zwei Fehlversuchen |
| W2\_HEBL\_MAX\_0280 | Max | Großzügig klingt gut. Nehm ich. | Option: großzügig werten lassen |
| W2\_HEBL\_MAX\_0290 | Max | Noch mal. Der Winkel war fast richtig. | Option: weiter versuchen |
| W2\_HEBL\_NAR\_0300 | – | Der Hebel schnellt hoch. Max fliegt in einem sauberen Bogen über die Sandgrube und landet hinter der Markierung. Auf den Füßen. Fast. | richtiges Gewicht |
| W2\_HEBL\_ARC\_0310 | Archimedes | HEUREKA! Also: Gut gemacht. Das sage ich sonst nur zu mir selbst. | Sieg im Hebel |
| W2\_HEBL\_RAM\_0320 | Ramses | Weit! Sehr weit! Mein Volk … sieht interessiert aus. Fast. Tag eins ist vorbei. Morgen das Finale. Oder übermorgen. Morgen. | Tag 1 beendet |
| W2\_HEBL\_LEO\_0330 | Leonidas | ICH WÄRE WEITER GESPRUNGEN! WENN ICH DA GEWESEN WÄRE! ICH WAR IN SYRAKUS! | zurück, außer Atem |

## 22. Stadion und überall: Rätsel 7, der Diskus-Diebstahl

Gleich nach Tag 1 fehlt der offizielle Diskus. Vier Verdächtige, je zwei Aussagen, jeder lügt genau einmal: Leonidas und Hermes im Stadion, Tiro auf der Agora, die Sphinx in Ägypten. Pixel darf an allen schnuppern; bei Tiro lügt seine Nase wegen der Tintenfisch-Tinte. Lösung: Tiro. Ersatz: Pharaonenteller (Thronsaal), Schallplatte (Opa hat sie in die Reisetasche geschmuggelt) oder Wurfscheibe (steckt seit dem Schulausflug in Max' Bauchtasche); die beiden letzten findet Max beim Durchsuchen seiner Taschen nach Tag 1 (Schallplatte in der Reisetasche, Wurfscheibe in der Bauchtasche).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_DISK\_LEO\_0010 | Leonidas | DER DISKUS IST WEG! DER OFFIZIELLE! GESTOHLEN! HEUTE NACHT! IM STADION! | Szene nach Tag 1 |
| W2\_DISK\_MAX\_0020 | Max | Ein Diebstahl, vier Leute waren in der Nähe, und jeder sagt zwei Sachen. Jeder lügt genau einmal. Am Ende war's bestimmt der Butler. | Notizbuch Seite 1: Diskus finden |
| W2\_DISK\_PIX\_0030 | Pixel | Es gibt hier keinen Butler. Es gibt mich, und ich schnuppere. // Meine Nase ist unbestechlich. Meistens. Sagen wir: an guten Tagen. |  |
| W2\_DISK\_MAX\_0040 | Max | Wo warst du heute Nacht? | Verhör Leonidas |
| W2\_DISK\_LEO\_0050 | Leonidas | HERMES WAR ES! | Aussage 1; Notizbuch |
| W2\_DISK\_LEO\_0060 | Leonidas | ICH WAR ES NICHT! | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0070 | Pixel | Er riecht nach Eintopf. Von seiner Mutter. // Unschuldig. Laut, aber unschuldig. | Pixel schnuppert an Leonidas |
| W2\_DISK\_MAX\_0080 | Max | Hermes, wo warst du heute Nacht? | Verhör Hermes |
| W2\_DISK\_HER\_0090 | Hermes | Tiro war heute Nacht im Stadion! Hab ich genau gesehen! Ich war da gerade irgendwo zu spät! | Aussage 1; Notizbuch |
| W2\_DISK\_HER\_0100 | Hermes | Und die Sphinx war's! Ganz sicher! Oder ziemlich sicher. Ich muss los! | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0110 | Pixel | Er riecht nach Wind, nach Post und nach Eile. // Der Mann hat keine Zeit zum Stehlen. Der hat nicht einmal Zeit, um zu riechen. | Pixel schnuppert an Hermes |
| W2\_DISK\_MAX\_0120 | Max | Tiro, wo warst du heute Nacht? | Verhör Tiro, Agora |
| W2\_DISK\_TIR\_0130 | Tiro | Ich war heute Nacht nicht im Stadion. | räuspert sich; Aussage 1; Notizbuch |
| W2\_DISK\_TIR\_0140 | Tiro | Hermes war es nicht. Der war zu spät, wie immer. | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0150 | Pixel | Er riecht nach … Tintenfisch. Eindeutig nach Tintenfisch. // Also ist er ganz sicher unschuldig. Meine Nase ist sich da sehr sicher. Ausgesprochen sicher. | Pixel schnuppert an Tiro; Nase lügt bei Fischgeruch |
| W2\_DISK\_MAX\_0160 | Max | Deine Nase war in Schwurbelstein auch sehr sicher. Bei den Flaschen, wenn ich mich recht erinnere. | nach 0150 |
| W2\_DISK\_MAX\_0170 | Max | Sphinx, wo warst du heute Nacht? | Verhör Sphinx, Ägypten |
| W2\_DISK\_SPH\_0180 | Sphinx | Ich war es nicht. Ich war hier. Ich bin immer hier, ich bin aus Stein. | Aussage 1; Notizbuch |
| W2\_DISK\_SPH\_0190 | Sphinx | Leonidas war es. Er brüllt viel zu laut, um unschuldig zu sein. | Aussage 2; Notizbuch |
| W2\_DISK\_PIX\_0200 | Pixel | Sie riecht nach Sand, nach Stein und nach dreihundert Jahren Nachdenken. // Unschuldig, junger Mann. Und vor allem unbeweglich, was beim Stehlen eher hinderlich ist. | Pixel schnuppert an Sphinx |
| W2\_DISK\_MAX\_0210 | Max | Du warst es. | Anklage Leonidas |
| W2\_DISK\_LEO\_0220 | Leonidas | ICH? DANN HÄTTE ICH ZWEIMAL GELOGEN! ICH LÜGE NUR EINMAL! AUS PRINZIP! | Fehlversuch |
| W2\_DISK\_MAX\_0230 | Max | Du warst es. | Anklage Hermes |
| W2\_DISK\_HER\_0240 | Hermes | Wenn ich es war, hat Leonidas zweimal die Wahrheit gesagt. Das schafft der nicht mal mit Anlauf. | Fehlversuch |
| W2\_DISK\_MAX\_0250 | Max | Du warst es. | Anklage Sphinx |
| W2\_DISK\_SPH\_0260 | Sphinx | Dann hätte ich zweimal gelogen. Ich lüge nur einmal, wie alle hier. Das ist das einzige Rätsel, das ich noch kann. | Fehlversuch |
| W2\_DISK\_MAX\_0270 | Max | Du warst es. Du warst im Stadion, und Hermes war es nicht: eine Wahrheit, eine Lüge. Und Pixels Nase hat bei dir gelogen, weil du nach Fisch riechst. | Anklage Tiro |
| W2\_DISK\_TIR\_0280 | Tiro | Ich … ja. Ich brauchte eine Unterlage, eine runde, glatte, für die Kurzschrift. Er redet so schnell. // Hier, nimm ihn. Er hat Kratzer, aber das sind Abkürzungen. | gibt den Diskus; Rätsel 7 gelöst |
| W2\_DISK\_PIX\_0290 | Pixel | Tintenfisch. Ich wusste es. Ich habe es gewusst und dann das Gegenteil gesagt. // Das nennt man Instinkt. Falschen Instinkt, zugegeben, aber Instinkt. |  |
| W2\_DISK\_MAX\_0300 | Max | Der echte Diskus. Bronze, mit Kurzschrift zerkratzt. Jeder sagt, der fliegt am besten, und ich glaub jedem. | Ansehen: Diskus |
| W2\_DISK\_MAX\_0305 | Max | Ich wieg ihn in der Hand. Er ist schwer und will fliegen. Ich will nur, dass er das ohne mich tut. | Ansehen: Diskus, zweites Mal |
| W2\_DISK\_MAX\_0310 | Max | Eine Schallplatte: „Schlager für Erfinder, Folge 3“. Opa hat sie mir in die Tasche geschmuggelt. Sie ist rund, und sie fliegt. Mehr muss sie nicht. | Ansehen: Schallplatte |
| W2\_DISK\_PIX\_0320 | Pixel | Folge 3. Dein Großvater besitzt alle drei, und er singt jedes Mal mit. // Ich habe es überlebt, und ich weiß bis heute nicht, wie. Ich glaube, ich habe mich unter das Sofa gerettet. | Ansehen: Schallplatte, zweites Mal |
| W2\_DISK\_MAX\_0330 | Max | Eine Wurfscheibe, bunt und aus Plastik. Die ist seit dem Schulausflug in meiner Bauchtasche. Sie fliegt besser als ich. | Ansehen: Wurfscheibe |
| W2\_DISK\_MAX\_0335 | Max | Auf der Unterseite steht noch „Klassenfahrt 7b“. Das wird die Antike nie entziffern. | Ansehen: Wurfscheibe, zweites Mal |
| W2\_DISK\_MAX\_0340 | Max | Ich geb's auf. Ich nehm einen Ersatz: Teller, Platte oder Scheibe. Hauptsache rund. | Option bei Leonidas: Ersatz wählen |

## 23. Grabhügel Syrakus und Nil-Delta: Rätsel 10, ein Grab für Archimedes

Cicero tritt erst an, wenn er das Grab gefunden hat: in Syrakus, genau 137 Jahre alt. Max holt den Entwurf bei Archimedes (Abschnitt 13), lässt den Stein im Nil-Delta meißeln und fährt ihn den ganzen Fluss hinunter: 112 + 25 = 137. Ohne Entwurf liefern die Arbeiter einen zerbröselten Haufen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_GRAB\_MAX\_0010 | Max | Einen Grabstein für Archimedes, bitte. Hier ist der Entwurf. | Entwurf auf Steinmetz, Nil-Delta |
| W2\_GRAB\_STM\_0020 | Steinmetz | Kugel im Zylinder. Schön, sauber, zwei Drittel steht hier. Das hauen wir. Komm in einer Stunde wieder. Also: jetzt. Wir sind schnell. | gibt den frischen Grabstein |
| W2\_GRAB\_MAX\_0030 | Max | Einen Grabstein für Archimedes, bitte. Einfach … irgendwas. | Steinmetz bitten ohne Entwurf |
| W2\_GRAB\_STM\_0040 | Steinmetz | Irgendwas. Gut. Irgendwas können wir. | hämmert; gibt einen zerbröselten Haufen |
| W2\_GRAB\_MAX\_0050 | Max | Ein Haufen Steine in einem Beutel. Das ist kein Grabstein, das ist Grabschotter. | Ansehen: zerbröselter Haufen |
| W2\_GRAB\_MAX\_0055 | Max | Ich schüttel den Beutel, und er klappert. Grabsteine sollten nicht klappern. | Ansehen: zerbröselter Haufen, zweites Mal |
| W2\_GRAB\_PIX\_0060 | Pixel | Du hast „irgendwas“ bestellt, und du hast „irgendwas“ bekommen. // Die Antike liefert ausgesprochen genau. Das sollte man sich für die nächste Bestellung merken. | nach 0050 |
| W2\_GRAB\_STM\_0070 | Steinmetz | Noch mal? Diesmal mit Plan? Pläne sind gut. Außer verkehrt herum. | zweite Bestellung |
| W2\_GRAB\_MAX\_0080 | Max | Ein frischer Grabstein, weiß, scharfkantig, mit Kugel im Zylinder. Der sieht aus wie gestern gemacht, weil er gestern gemacht wurde. | Ansehen: frischer Grabstein; Sanduhr-Symbol |
| W2\_GRAB\_MAX\_0085 | Max | Die Kanten sind so scharf, dass ich mich fast am Respekt schneide. | Ansehen: frischer Grabstein, zweites Mal; Sanduhr-Symbol |
| W2\_GRAB\_MAX\_0090 | Max | Hundertsiebenunddreißig Jahre. Ägypten bis Olympia hundertzwölf, Olympia bis Syrakus fünfundzwanzig. Das ist Mathe, die ich sogar freiwillig mache. | Notizbuch, nach Steinmetz-Gespräch und Tafel |
| W2\_GRAB\_MAX\_0100 | Max | Ein überwucherter Hügel mit Dornen, Brombeeren und alten Steinen. Hier liegen Leute, die keiner mehr sucht. Außer Cicero. | erstes Betreten Grabhügel |
| W2\_GRAB\_MAX\_0110 | Max | Brombeeren, schon reif. Ich pflück trotzdem keine. Ich hab mich letzte Woche an einer Tiefkühlpizza geschnitten, das reicht mir. | Ansehen: Brombeeren |
| W2\_GRAB\_PIX\_0115 | Pixel | Brombeeren. Für dich sind sie verboten, für mich sind sie uninteressant. // Das ist ein seltener Moment der Einigkeit zwischen uns. Wir sollten ihn feierlich begehen. | Ansehen: Brombeeren, zweites Mal |
| W2\_GRAB\_MAX\_0120 | Max | Alte Grabsteine, halb im Grün versunken. Namen, die keiner mehr liest, wie Profile, die seit Jahren offline sind. | Ansehen: alte Grabsteine |
| W2\_GRAB\_MAX\_0125 | Max | Auf einem steht nur „War nett“. Kürzer kann man ein Leben echt nicht zusammenfassen. | Ansehen: alte Grabsteine, zweites Mal |
| W2\_GRAB\_MAX\_0130 | Max | Ein leerer Steinsockel auf einer Lichtung. Da fehlt eindeutig jemand drauf. Also, sein Stein. | Ansehen: leerer Sockel |
| W2\_GRAB\_MAX\_0135 | Max | Ein Sockel ohne Stein. Das fällt so auf wie Opas Sessel, wenn Opa nicht drin sitzt. | Ansehen: leerer Sockel, zweites Mal |
| W2\_GRAB\_MAX\_0140 | Max | Zypressen. Sie zeigen alle nach oben. Ich hab nachgesehen. Da ist nichts. | Ansehen: Zypressen |
| W2\_GRAB\_MAX\_0145 | Max | Die Zypressen wiegen sich im Takt. Die Zikaden geben ihn vor. | Ansehen: Zypressen, zweites Mal |
| W2\_GRAB\_PIX\_0150 | Pixel | Zikaden. Sie machen den ganzen Tag dasselbe Geräusch und werden dafür von Dichtern gelobt. // Ich mache den ganzen Tag dasselbe Geräusch, und werde dafür aus dem Schlafzimmer getragen. | Ansehen: Zikaden oder Zuruf Grabhügel |
| W2\_GRAB\_PIX\_0155 | Pixel | Die Zikaden haben eben eine Pause gemacht, eine ganze Sekunde lang. // Das war der schönste Moment, den ich bisher in Syrakus erleben durfte. | Ansehen: Zikaden oder Zuruf Grabhügel, zweites Mal |
| W2\_GRAB\_MAX\_0160 | Max | Der Stein kommt auf den Sockel. Verwittert, moosig, hundertsiebenunddreißig Jahre alt und ganz frisch vom Nil. | verwitterter Grabstein auf Sockel |
| W2\_GRAB\_CIC\_0170 | Cicero | Dort! Zwischen den Dornen! Kugel und Zylinder! Das Grab des Archimedes! Ich habe es gefunden! Ich! Nach hundertsiebenunddreißig Jahren! | stürmt herbei |
| W2\_GRAB\_ARC\_0180 | Archimedes | Er hat ihn gefunden. Meinen Stein, den ich entworfen habe und den du bestellt hast. Ich stehe direkt daneben. Ich lebe. | neben Max, trocken |
| W2\_GRAB\_CIC\_0190 | Cicero | Und ein Pilger, der dem großen Toten ähnlich sieht! Wie passend! Wie ergreifend! Ich muss eine Rede halten. // Nein: Ich muss ringen. Morgen, im Stadion. Ich trete an! | Rätsel 10 gelöst |
| W2\_GRAB\_PIX\_0200 | Pixel | Dieser Mann hat ein Grab gefunden, dessen Bewohner ihm gerade dabei zusieht. // Das ist das Traurigste, was ich je gesehen habe. // Gleich nach einem leeren Napf. Den vergisst man nie. |  |
| W2\_GRAB\_ARC\_0210 | Archimedes | Zwei Drittel. Er hat nicht mal die zwei Drittel gelobt. Hundertsiebenunddreißig Jahre, und keiner lobt die zwei Drittel. | nach 0200 |
| W2\_GRAB\_MAX\_0215 | Max | Ich find die zwei Drittel gut. Ehrlich. Sehr sauber gerechnet. |  |
| W2\_GRAB\_CIC\_0240 | Cicero | Ein Haufen. Das ist entweder sehr alt oder sehr schlecht gemacht. Ich tippe auf Letzteres. | zerbröselter Haufen auf Sockel |
| W2\_GRAB\_MAX\_0250 | Max | Den Entwurf auf den Sockel legen? Dann hat Cicero ein Grab aus Papier, und er würde es finden und vorlesen. | Entwurf auf Sockel |
| W2\_GRAB\_MAX\_0260 | Max | Pixel auf den Sockel? Der würde sich hinlegen und als Statue durchgehen. Sogar als ziemlich gute. | Pixel auf Sockel |

## 24. Stadion, Finaltag: Ventilator-Speer und Nasen-Diskus

Szenen. Der Finaltag beginnt, sobald Diskus oder Ersatz (7), Konter (9) und Grab (10) erledigt sind und Max die Startlinie benutzt; vorher antworten W2\_STAD\_MAX\_0300 und 0310. Die Feigen (6) sind freiwillig: Mit bestochenen Wedlern trifft der Speer den Olivenkranz (0030, 0040, 0060), ohne Bestechung landet er im Kampfrichterzelt (0070, 0080). Gezählt wird in beiden Fällen. Vor dem Diskus zeigt eine Gag-Folge Max' Probewürfe mit Leonidas' aufgespießtem Mittagsteller.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W2\_FINA\_RAM\_0010 | Ramses | Das Finale! Speer, Diskus, Ringen! In dieser Reihenfolge! Oder in einer anderen! In dieser! | Tribüne |
| W2\_FINA\_MAX\_0020 | Max | Ein Speer, lang, spitz und schwer. Ich hab noch nie was geworfen, das länger war als ich. | nimmt den Speer |
| W2\_FINA\_FAW\_0030 | Fächerwedler | Gleichmäßig! Links, rechts, links, rechts! Für die Feigen! | bestochen; wedeln im Takt |
| W2\_FINA\_NAR\_0040 | – | Max wirft. Der Speer steigt, der Wind trägt ihn. Er spießt unterwegs Leonidas' Mittagsteller auf und bleibt genau im Olivenkranz stecken. | bestochen |
| W2\_FINA\_LEO\_0050 | Leonidas | MEIN EINTOPF! | in jedem Fall |
| W2\_FINA\_MAX\_0060 | Max | Mitten im Kranz. Mit Beilage. | bestochen |
| W2\_FINA\_NAR\_0070 | – | Max wirft. Der Wind dreht, dreht wieder, der Speer spießt Leonidas' Teller auf und verschwindet im Kampfrichterzelt. Das Zelt sackt zusammen. | nicht bestochen |
| W2\_FINA\_MAX\_0080 | Max | Das Zelt. Mit den Kampfrichtern drin. Die werten jetzt bestimmt total neutral. | nicht bestochen |
| W2\_FINA\_PIX\_0090 | Pixel | Du hast das Mittagessen eines Spartaners aufgespießt. // Das ist die mutigste Tat deines bisherigen Lebens, und sie war ein Versehen. Ich finde, das passt zu dir. | nach dem Speer |
| W2\_FINA\_RAM\_0100 | Ramses | Gezählt! Irgendwie! Weiter zum Diskus! | nach dem Speer |
| W2\_FINA\_MAX\_0110 | Max | Erst mal ein paar Probewürfe, zum Warmwerden. Was soll schon passieren. | Diskus-Szene beginnt |
| W2\_FINA\_NAR\_0120 | – | Wurf eins: Der Teller segelt über den Fluss. In der Ferne fällt der Sphinx die Nase ab. Wurf zwei: Über die Agora. Die Marmorfrau verliert beide Arme. Wurf drei: Der Glockenturm hinten neigt sich. Und bleibt so. | Gag-Folge, drei Schnitte; geworfen wird Leonidas' Mittagsteller vom Speer |
| W2\_FINA\_MAX\_0130 | Max | Das wird noch Probleme machen. Ich hab's ja gesagt. | nach 0120 |
| W2\_FINA\_PIX\_0140 | Pixel | Drei Würfe, drei Wahrzeichen. Die Menschheit wird Jahrtausende brauchen, um das zu erklären. // Ich sage nichts dazu, junger Mann. Ich war nicht dabei, ich habe nichts gesehen, und ich kenne dich nicht. |  |
| W2\_FINA\_MAX\_0150 | Max | Und jetzt der echte Wurf. Womit werf ich? | Auswahl Wurfgegenstand |
| W2\_FINA\_NAR\_0160 | – | Der Diskus fliegt. Weit. Sehr weit. Die Kurzschrift-Kratzer pfeifen im Wind. | echter Diskus oder Wurfscheibe: weitester Wurf |
| W2\_FINA\_NAR\_0170 | – | Der Teller fliegt. Ordentlich. Glänzend. Landet mit einem Pling. | Pharaonenteller: mittlerer Wurf |
| W2\_FINA\_NAR\_0180 | – | Die Schallplatte fliegt. Eiert. Landet. Spielt beim Aufprall kurz einen Schlager. | Schallplatte: kurzer Wurf |
| W2\_FINA\_RAM\_0190 | Ramses | Weit genug! Oder nicht! Weit genug. Jetzt das Ringen, gegen Cicero, mit Worten. Ich habe Angst. Für dich. Und vor Worten. | nach dem Diskus |

## 25. Stadion, Finaltag: Minispiel Rede-Ringen gegen Cicero

In der Sandgrube. Cicero wirft fünf Beleidigungen; jede braucht einen passenden Konter aus dem Notizbuch (Rolle: Konter 1 bis 3, Griechen: 4 und 5, Tonne: 6 und 7). Jeder Treffer schiebt Cicero einen Schritt aus der Grube. Manche Beleidigungen haben zwei passende Konter, deshalb wird es mit mehr Kontern leichter. Falscher Konter: Cicero hält eine dreistündige Rede im Zeitraffer, Pixel und Publikum schlafen ein, Cicero rückt einen Schritt zurück. Nach zwei Fehlversuchen bietet Ramses großzügige Wertung an. Kein Zeitdruck.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_RING\_CIC\_0010 | Cicero | In die Grube, Junge. Hier ringt man nicht mit den Armen, hier ringt man mit dem Wort. Und das Wort gehört mir. | Start des Minispiels |
| W2\_RING\_MAX\_0020 | Max | Ein Wortgefecht im Sand. Okay. Ich hab schon Kommentarbereiche überlebt, das hier schaff ich auch. |  |
| W2\_RING\_MAX\_0030 | Max | Konter eins: „Wer so lange redet, hat Angst vor dem Ende des Satzes.“ Zwei: „Ein Argument, so dünn, dass man den Redner dahinter sieht.“ Drei: „Du zitierst dich selbst. Der Einzige, der dir noch zuhört.“ | Ansehen: Schriftrolle, zweites Mal (nach W2\_SPHX\_MAX\_0540); liest die Konter vor |
| W2\_RING\_CIC\_0040 | Cicero | Du bist ein Junge in einem Sack, und der Sack hat mehr Form als dein Verstand! | Beleidigung 1; passend: Konter 7 oder 2 |
| W2\_RING\_CIC\_0050 | Cicero | Was hat deine Welt je hervorgebracht? Nichts! Wir Römer brachten Ordnung, Recht und Größe! | Beleidigung 2; passend: Konter 4 |
| W2\_RING\_CIC\_0060 | Cicero | Wie ich schon in meiner dritten Rede sagte, und in der vierten, und in der fünften. Und wie ich selbst stets wiederhole … | Beleidigung 3; passend: Konter 3 oder 6 |
| W2\_RING\_CIC\_0070 | Cicero | Und so stehe ich hier vor euch und sage euch und sage es wieder // und werde es weiter sagen ohne Pause ohne Punkt ohne Komma bis … | Beleidigung 4; passend: Konter 5 |
| W2\_RING\_CIC\_0080 | Cicero | Ich werde reden, bis die Sonne untergeht und wieder aufgeht und wieder untergeht! | Beleidigung 5; passend: Konter 1 |
| W2\_RING\_MAX\_0090 | Max | Deine Toga hat mehr Falten als dein Argument. | Konter 7 auf Beleidigung 1; Treffer |
| W2\_RING\_MAX\_0100 | Max | Ein Argument, so dünn, dass man den Redner dahinter sieht. | Konter 2 auf Beleidigung 1; Treffer |
| W2\_RING\_MAX\_0110 | Max | Außer dem Kalender, der Fußbodenheizung und dem Beton? | Konter 4 auf Beleidigung 2; Treffer |
| W2\_RING\_CIC\_0120 | Cicero | Der Kalender … gut, der Kalender. Und die Fußbodenheizung. Aber sonst? Sonst! | nach 0110, stolpert einen Schritt |
| W2\_RING\_MAX\_0130 | Max | Du zitierst dich selbst. Der Einzige, der dir noch zuhört. | Konter 3 auf Beleidigung 3; Treffer |
| W2\_RING\_MAX\_0140 | Max | Du redest wie einer, der sich selbst zuhört, weil es sonst keiner tut. | Konter 6 auf Beleidigung 3; Treffer |
| W2\_RING\_MAX\_0150 | Max | Holst du auch mal Luft? | Konter 5 auf Beleidigung 4; Treffer |
| W2\_RING\_CIC\_0160 | Cicero | Ich … | holt Luft, verliert den Faden, stolpert eine Linie nach rechts |
| W2\_RING\_MAX\_0170 | Max | Wer so lange redet, hat Angst vor dem Ende des Satzes. | Konter 1 auf Beleidigung 5; Treffer |
| W2\_RING\_CIC\_0180 | Cicero | Falsch! Daneben! Und dafür hörst du jetzt meine Rede über die Pflicht. Alle drei Teile. | falscher Konter; Zeitraffer beginnt |
| W2\_RING\_NAR\_0190 | – | Die Sonne wandert. Cicero redet. Die Zuschauer kippen einer nach dem anderen um. Pixel schnarcht mit Blase. Ramses sieht von einem Zepter zum anderen und schläft dazwischen ein. | Zeitraffer, drei Stunden |
| W2\_RING\_PIX\_0200 | Pixel | Ich habe geträumt. Von Stille. Von vollkommener, wunderbarer Stille. // Es war der schönste Traum seit dem mit dem Lachs, und der war wirklich außergewöhnlich. | nach dem Zeitraffer |
| W2\_RING\_MAX\_0210 | Max | Drei Stunden. Mein Bein ist eingeschlafen und hat geträumt. Noch mal. | nach dem Zeitraffer |
| W2\_RING\_RAM\_0220 | Ramses | Zweimal eingeschlafen. Ich könnte großzügig werten, bevor er die vierte Rede anfängt. Soll ich? Ich soll. Oder du machst weiter. | nach zwei Fehlversuchen |
| W2\_RING\_NAR\_0230 | – | Cicero steht mit dem Rücken an der Mauer, dann auf der Mauer, dann dahinter. Er redet noch, aber außerhalb der Grube. | fünfter Treffer |
| W2\_RING\_CIC\_0240 | Cicero | Ich bin … außerhalb. Ich habe verloren. Ich werde eine Rede darüber halten, eine lange. Nicht hier. Ich verspreche es. Hier nicht. | Sieg |
| W2\_RING\_MAX\_0250 | Max | Ich hab gerade gegen den berühmtesten Redner der Welt gewonnen. Mit Sätzen aus einer Tonne. |  |
| W2\_RING\_PIX\_0260 | Pixel | Zwei dieser Sätze stammen von mir. Rechnerisch habe also ich gewonnen. // Du warst die Stimme, und ich war der Inhalt. So ist es bei uns beiden ja meistens. |  |
| W2\_RING\_RAM\_0270 | Ramses | Der Kranz! Nimm den Kranz! Den Olivenkranz! Du hast gewonnen! Ich habe gewonnen! Ägypten hat … irgendjemand hat gewonnen! | übergibt den Olivenkranz |
| W2\_RING\_MAX\_0280 | Max | Die Goldmedaille ist aus Blättern. Grünen Blättern. Ich hab fünf Sportarten durchgezogen und dafür einen Salat bekommen. | Ansehen: Olivenkranz |
| W2\_RING\_MAX\_0285 | Max | Der Kranz piekst. Ich trag ihn trotzdem. Sieger leiden still. | Ansehen: Olivenkranz, zweites Mal |
| W2\_RING\_PIX\_0290 | Pixel | Alle fünf. Ohne Gnade vom Pharao. // Ich habe nichts hinzuzufügen. Das ist mir noch nie passiert. // Ich werde es trotzdem leugnen. | nur bei Bestleistung in allen fünf Disziplinen (ohne großzügige Wertung, Lauf mit Öl, echter Diskus oder Wurfscheibe; siehe raetsel/welt-2.md); Errungenschaft Fünfkampf |

## 26. Stadion, Parade-Schmuck: Rätsel 11, die Siegesparade und der Abschluss

Ramses' Volk ist unbeeindruckt und will Brot und Spiele. Die Parade findet in Olympia statt. Der Zeremonienmeister nennt grob die Reihenfolge; Max ordnet im Paraden-Plan vier Felder: Hermes (Einladungen), Archimedes' Brennspiegel (Mittagssonne, Feld 2), Ciceros Rede (wenn alle da sind), Pixel als Gott (Höhepunkt). Ramses verlangt Wein: der Essig aus Syrakus wird auf der Fahrt nach Olympia wieder Wein. Wer das Handy noch hat, macht mit der Taschenlampe den Abschluss. Danach übergibt Ramses den Sack; die Welt endet, bevor Max den Dachboden erreicht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_PARA\_VOL\_0010 | Ägypter | Ein Kranz. Aus Blättern. Wir sind hundertzwölf Jahre gefahren für einen Kranz aus Blättern. | Szene nach dem Sieg, Volk auf den Rängen |
| W2\_PARA\_VOL\_0020 | Ägypter | Brot! Und Spiele! Die Spiele hatten wir ja jetzt. Wo bleibt das Brot? |  |
| W2\_PARA\_RAM\_0030 | Ramses | Eine Parade! Hier! Jetzt! In Olympia, damit die ganze Welt zusieht! Zeremonienmeister, erklär es ihm. Ich kann das nicht. Ich kann nichts erklären. | Entschluss |
| W2\_PARA\_ZER\_0040 | Zeremonienmeister | Eine Parade hat eine Ordnung. Einladungen vor den Gästen, Spiegel brauchen Mittagssonne, Reden brauchen Zuhörer. // Und ein Gott kommt zuletzt, immer. Hier ist der Plan, vier Felder. Füll sie. | gibt den Paraden-Plan; Notizbuch Seite 2 |
| W2\_PARA\_MAX\_0050 | Max | Vier Felder, vier Leute und eine Sonne über dem zweiten. Ein Stundenplan für eine Party. | Ansehen: Paraden-Plan |
| W2\_PARA\_MAX\_0055 | Max | Die Sonne über Feld zwei ist mit Goldfarbe gemalt. Da hat jemand klare Prioritäten. | Ansehen: Paraden-Plan, zweites Mal |
| W2\_PARA\_HER\_0060 | Hermes | Einladungen? Ich! Das kann ich! Zu spät, aber das kann ich! | Hermes in Feld 1 |
| W2\_PARA\_HER\_0070 | Hermes | Die Einladungen nach den Gästen? Dann lade ich Leute ein, die schon da sind. Das ist sogar für mich zu spät. | Hermes in Feld 2 bis 4 |
| W2\_PARA\_ARC\_0080 | Archimedes | Mittagssonne! Spiegel! Lichtstrahl über das ganze Stadion! Niemand verbrennt! Fast niemand! | Brennspiegel in Feld 2 |
| W2\_PARA\_ARC\_0090 | Archimedes | Ohne Mittagssonne ist mein Spiegel nur ein Teller. Ein glänzender Teller. Und Teller hatte ich heute genug. | Brennspiegel in Feld 1, 3 oder 4 |
| W2\_PARA\_CIC\_0100 | Cicero | Eine Rede vor vollen Rängen. Kurz. Ich verspreche es: kurz. Also, kürzer. | Cicero in Feld 3 |
| W2\_PARA\_CIC\_0110 | Cicero | Eine Rede vor leeren Rängen? Das habe ich hundertmal gemacht. Es zählt nicht, das weiß ich inzwischen. | Cicero in Feld 1 oder 2 |
| W2\_PARA\_CIC\_0120 | Cicero | Nach dem Gott? Nach einem Gott redet niemand. Nicht einmal ich. Besonders nicht ich. | Cicero in Feld 4 |
| W2\_PARA\_PIX\_0130 | Pixel | Ich erscheine zum Höhepunkt, schwebend auf einem Kissen. // Alles andere wäre eine Beleidigung, und von Beleidigungen verstehe ich seit der Tonne eine ganze Menge. | Pixel in Feld 4 |
| W2\_PARA\_PIX\_0140 | Pixel | Ich komme nicht zuerst. Götter kommen niemals zuerst, Götter lassen warten. // Frag irgendeinen Gott. Oder frag einfach mich, das geht schneller. | Pixel in Feld 1 bis 3 |
| W2\_PARA\_ZER\_0150 | Zeremonienmeister | Einladung, Licht, Rede, Gott. Das ist eine Parade. Jetzt fehlt nur noch der Wein, und darauf besteht der Pharao. | richtige Reihenfolge; Plan gelöst |
| W2\_PARA\_RAM\_0160 | Ramses | Wein! Ohne Wein keine Parade! Ich habe nur Traubensaft, und mit Traubensaft feiert niemand. Nicht mal ich, und ich feiere mit allem. | Wein verlangt |
| W2\_PARA\_MAX\_0170 | Max | Hier, Wein. Der war mal Essig, und davor war er schon mal Wein. Lange Geschichte, kurze Fährfahrt. | Wein auf Ramses |
| W2\_PARA\_RAM\_0180 | Ramses | Wein! Echter Wein! Also … er riecht ein bisschen nach Werkstatt. Egal. Wein! | nimmt den Krug; Wein erledigt |
| W2\_PARA\_RAM\_0190 | Ramses | Essig. Du gibst mir Essig. Zu einer Parade. Das ist … ich weiß nicht, was das ist. Doch: falsch. | Essig auf Ramses |
| W2\_PARA\_RAM\_0200 | Ramses | Traubensaft. Den hab ich selbst, zwei Krüge. Ich trinke ihn nicht, niemand trinkt ihn. Er ist einfach da. | Traubensaft auf Ramses |
| W2\_PARA\_PIX\_0210 | Pixel | Er will Wein, er hat Saft, und in der Werkstatt steht Essig. Du musst nur in die richtige Richtung fahren. // Du hast die Sanduhr gesehen. Ich habe gesehen, wie du sie gesehen hast. | Hinweis nach 0190 oder 0200 |
| W2\_PARA\_NAR\_0220 | – | Hermes rennt, das Volk strömt, der Spiegel wirft Mittagslicht über das Stadion. Cicero hält eine kurze Rede, und dann schwebt Pixel auf seinem Kissen über die Laufbahn. Alle verneigen sich. Auch die Ägypter. | Parade läuft |
| W2\_PARA\_VOL\_0230 | Ägypter | Ein Gott! Ein Katzengott! Und Wein! Und … Brot? Egal! Wein! | Volk jubelt |
| W2\_PARA\_MAX\_0240 | Max | Und zum Schluss: drei Prozent Akku. Taschenlampe an. | Handy benutzen während der Parade; nur wenn noch vorhanden |
| W2\_PARA\_NAR\_0250 | – | Ein weißer Lichtkegel streift über die Ränge. Das Handy piept einmal und wird schwarz. Die Menge hält den Atem an. | Handy verbraucht |
| W2\_PARA\_PIX\_0260 | Pixel | Du hast alle drei Wunderdinge behalten, bis ganz zum Schluss. // Das ist Faulheit. Sie hat sich diesmal gelohnt. // Gut gemacht. Ich sage es leise, damit es niemand hört. | Bonus-Gag: Handy, Kaugummi und Kugelschreiber noch vorhanden |
| W2\_PARA\_RAM\_0270 | Ramses | Mein Volk jubelt. Mir! Also dem Kater. Also dir. Egal. Hier ist der Goldene Sack Pharaonenkorn. // Ich habe mich entschieden. Zum ersten Mal. Es fühlt sich … gut an. Glaube ich. | übergibt den Sack; Ziel der Welt |
| W2\_PARA\_MAX\_0280 | Max | Ein goldener Sack, schwer und weich, mit Siegel. Der zweite von vier. Und ich hab dafür Sport gemacht. Freiwillig. Teilweise. | Ansehen: Goldener Sack Pharaonenkorn |
| W2\_PARA\_MAX\_0285 | Max | Ich hab draufgeklopft, und er knistert. Für fünf Sportarten und einen Pharao klingt das ziemlich unspektakulär. | Ansehen: Goldener Sack Pharaonenkorn, zweites Mal |
| W2\_PARA\_PIX\_0290 | Pixel | Vierhundertfünf. Klingt nach einer Backzahl. | Ansehen: Goldener Sack Pharaonenkorn (Siegel auf dem Sack), Pixel |
| W2\_PARA\_PIX\_0295 | Pixel | Ich habe die Zahl noch einmal gelesen. Vierhundertfünf. Sie klingt immer noch nach Ofen. | Ansehen: Goldener Sack Pharaonenkorn (Siegel auf dem Sack), Pixel, zweites Mal |
| W2\_PARA\_PIX\_0300 | Pixel | Riecht nach Bäckerei. | Pixel schnuppert am Sack; Max überhört es |
| W2\_PARA\_MAX\_0310 | Max | Was? |  |
| W2\_PARA\_PIX\_0320 | Pixel | Nichts. Fahr. |  |
| W2\_PARA\_PIX\_0330 | Pixel | Keine einzige Lösung von mir, die ganze Welt lang. // Ich fühle mich übergangen, junger Mann. // Mach weiter so. | nur wenn Hinweisstufe 3 in Welt 2 nie genutzt |
| W2\_PARA\_HER\_0340 | Hermes | Wartet! Noch ein Brief! Von „Konrad, Dachboden“! Nein, Moment. Das ist derselbe. Der war nur in einem anderen Beutel. | letzter Auftritt, rennt weg |
| W2\_PARA\_ARC\_0350 | Archimedes | Komm wieder, Schüler. Ich habe noch einen Hebel. Einen größeren. Für die Welt. | Abschied |
| W2\_PARA\_MAX\_0360 | Max | Zurück zur Fähre, dann zum Werbeblock, dann zum Sofa. Mit dem Sack. Also zu Opa. | Weltende; Übergang zum Zwischenspiel |

## 27. Inventar: Wunderdinge und Pixel auf Mensch

Ansehen-Zeilen der Wunderdinge liefern die Rätsel-Bausteine für die Sphinx (Abschnitt 12). Danach die Pixel-auf-Mensch-Zeilen: Pixel wird als Gegenstand auf eine Figur gezogen, eine Zeile je Figur; Figuren mit eigener Pixel-Zeile in früheren Abschnitten (Hofkater, Sphinx, Beamter 1, Lehmofen) stehen dort.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_INV\_MAX\_0010 | Max | Drei Prozent. Es klingelt noch, falls mich jemand erreichen will. Will bloß keiner, weil hier seit viertausend Jahren kein Netz ist. | Ansehen: Handy, erstes Mal; Baustein „klingelt“ |
| W2\_INV\_MAX\_0020 | Max | Die Taschenlampe geht noch, einmal und kurz. Danach ist das Handy ein sehr teurer Stein. | Ansehen: Handy, zweites Mal; Baustein „leuchtet kurz“ |
| W2\_INV\_MAX\_0030 | Max | Ein Kaugummi. Man kaut und kaut, und er wird nie alle. Die Antike hält das für ein Wunder. Ich auch. | Ansehen: Kaugummi, erstes Mal; Baustein „wird nie alle“ |
| W2\_INV\_MAX\_0040 | Max | Am Ende klebt er unter irgendeinem Tisch. Das ist sein Schicksal, auch hier. | Ansehen: Kaugummi, zweites Mal; Baustein „klebt unter jedem Tisch“ |
| W2\_INV\_MAX\_0050 | Max | Ein Kugelschreiber, der ohne Tintenfass schreibt. Hier ist das Zauberei, und zu Hause heißt es Schule. | Ansehen: Kugelschreiber, erstes Mal; Baustein „schreibt ohne Tintenfass“ |
| W2\_INV\_MAX\_0060 | Max | Klick. Klick. Klick. Ich klicke, wenn ich nervös bin, und ich bin seit Welt eins nervös. | Ansehen: Kugelschreiber, zweites Mal; Baustein „klickt, wenn man nervös ist“ |
| W2\_INV\_PIX\_0070 | Pixel | Ein Pharao mit zwei Zeptern, der sich nicht entscheiden kann. Ich habe vier Pfoten und entscheide trotzdem schneller. // Zum Beispiel jetzt: Ich gehe. | Pixel auf Ramses |
| W2\_INV\_PIX\_0080 | Pixel | Ein Krokodil, das sich vor mir verneigt. Das ist das erste vernünftige Reptil, das ich kenne. // Zugegeben, es ist auch das einzige. Aber es setzt einen sehr hohen Maßstab. | Pixel auf Sobek |
| W2\_INV\_PIX\_0090 | Pixel | Der Fährmann riecht nach Fluss und Kleingeld. // Er darf mich fahren, aber er darf mich unter keinen Umständen anfassen. Das habe ich ihm durch Blicke mitgeteilt. | Pixel auf Fährmann |
| W2\_INV\_PIX\_0100 | Pixel | Sie hat Mehl an den Händen und Datteln in der Schürze. // Ich würde bei ihr einziehen. Heute noch. Ich würde nicht einmal meine Sachen holen. | Pixel auf Nebet |
| W2\_INV\_PIX\_0110 | Pixel | Ein nasser Mann mit Zirkel, der gerade ausrechnet, wie viel Wasser ich verdränge. // Ich verdränge stattdessen ihn, und zwar jetzt sofort. Aus meiner Nähe. | Pixel auf Archimedes |
| W2\_INV\_PIX\_0120 | Pixel | Er redet, und ich schlafe. Das ist unsere Beziehung. // Und ich muss sagen, sie funktioniert besser als die meisten, die ich kenne. | Pixel auf Cicero |
| W2\_INV\_PIX\_0130 | Pixel | Er brüllt, und ich lege die Ohren an. Er brüllt lauter, und ich gewinne trotzdem. // Ich habe nämlich zwei Ohren, und er hat nur eine einzige Lautstärke. | Pixel auf Leonidas |
| W2\_INV\_PIX\_0140 | Pixel | Flügel an den Füßen und trotzdem immer zu spät. // Ich habe keine Flügel, und bin trotzdem immer pünktlich. Zumindest zum Essen. | Pixel auf Hermes |
| W2\_INV\_PIX\_0150 | Pixel | Er riecht nach Tinte und schlechtem Gewissen. // Also, nach Tinte. Nur nach Tinte, junger Mann. Ganz sicher. Meine Nase irrt sich nie bei solchen Dingen. | Pixel auf Tiro |
| W2\_INV\_PIX\_0160 | Pixel | Ein müder Mann, der nicht angebetet werden will. // Ich verstehe ihn nicht. Ich respektiere ihn auch nicht. Aber vor allem verstehe ich ihn nicht. | Pixel auf Brian |
| W2\_INV\_PIX\_0170 | Pixel | Er hält seinen Stempel wie ein Zepter. Ich habe heute schon zwei Zepter gesehen. // Und seins ist, das muss man ihm lassen, das ehrlichere von allen. | Pixel auf Beamter 2 |
| W2\_INV\_PIX\_0180 | Pixel | Er riecht nach Staub und Pyramide, und er würde mich in Stein hauen, wenn ich stillhielte. // Ich halte aber nie still. Aus Prinzip, und weil ich ein bewegliches Kunstwerk bin. | Pixel auf Steinmetz |
| W2\_INV\_PIX\_0190 | Pixel | Palmwedel, Schweiß und Feigenhunger. Zwei Männer, die den ganzen Tag für andere Leute Wind machen. // Ich will nicht abfällig sein, aber das hat etwas Hündisches. | Pixel auf Fächerwedler |
| W2\_INV\_PIX\_0200 | Pixel | Federn auf dem Kopf und ein Plan in der Hand. Er organisiert. // Ich würde mich von ihm organisieren lassen, aber nur, wenn ein Kissen dabei herauskommt. | Pixel auf Zeremonienmeister |
| W2\_INV\_PIX\_0210 | Pixel | Er riecht nach Reiseführer und Sonnencreme und zeichnet mich gerade auf eine Wachstafel. // Ich posiere selbstverständlich. Aus Gewohnheit, und weil man mich von links am besten trifft. | Pixel auf Römischer Tourist |

## 27b. Inventar ansehen (INV)

Rechtsklick auf einen Gegenstand in der Inventarleiste. Erstes Mal die erste Zeile, zweites Mal die Zweitzeile, danach der Wiederholungs-Pool (siehe `05-spielsysteme.md`). Gegenstände, die hier fehlen, haben ihre Ansehen-Zeile schon in ihrem Abschnitt oder im Abschnitt, aus dem sie mitreisen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_INV\_MAX\_0310 | Max | Ein leeres Papyrusblatt, frisch aus dem Nil. Riecht nach Fluss. Und nach Krokodil. | Ansehen: Papyrusblatt |
| W2\_INV\_MAX\_0315 | Max | Ich hab es gegen das Licht gehalten. Keine geheime Botschaft, nur Fasern. Ich hatte mehr erwartet. | Ansehen: Papyrusblatt, zweites Mal |
| W2\_INV\_MAX\_0320 | Max | Der goldene Teller vom Pharao. Pixel sieht ihn an wie einen Napf, der endlich seinen Rang erkannt hat. | Ansehen: Pharaonenteller |
| W2\_INV\_PIX\_0325 | Pixel | Golden, rund und leer. Wenn man mir den hinstellt, bin ich offiziell eine Gottheit. // Ich warte nur noch auf einen angemessenen Anlass. Zum Beispiel Thunfisch darauf. | Ansehen: Pharaonenteller, zweites Mal |
| W2\_INV\_MAX\_0330 | Max | Ein Fladenbrot, noch warm. Es riecht nach dem Bäcker bei uns an der Ecke, und der hat garantiert nicht dreitausend Jahre Erfahrung. | Ansehen: Brot |
| W2\_INV\_MAX\_0335 | Max | Ich hab kurz überlegt, reinzubeißen. Dann hab ich an Pixels Gesicht gedacht und es gelassen. | Ansehen: Brot, zweites Mal |
| W2\_INV\_MAX\_0340 | Max | Datteln, klebrig, süß und runzlig. Wie Rosinen, die es im Leben zu was gebracht haben. | Ansehen: Datteln |
| W2\_INV\_PIX\_0345 | Pixel | Datteln. Weder Fleisch noch Fisch, junger Mann. // Ich respektiere sie ausschließlich als Wurfgeschoss, und auch da nur, wenn sie jemanden treffen, den ich nicht mag. | Ansehen: Datteln, zweites Mal |
| W2\_INV\_MAX\_0350 | Max | Eine Zwiebel. Sie liegt in meiner Tasche, und mir tränen trotzdem die Augen. Die hat Fernwirkung. | Ansehen: Zwiebel |
| W2\_INV\_MAX\_0355 | Max | Zwiebeln haben Schichten. Das hat mir mal jemand Großes, Grünes erklärt, und er wirkte sehr überzeugt. | Ansehen: Zwiebel, zweites Mal |
| W2\_INV\_MAX\_0360 | Max | Ein Fladen mit Datteln drauf. Halb Pizza, halb Kuchen und ganz eindeutig ein Fehler. | Ansehen: Fladen, mit Datteln |
| W2\_INV\_MAX\_0365 | Max | Da fehlt noch was. Etwas, das stinkt und einen zum Weinen bringt. Pixel weiß, was. | Ansehen: Fladen, mit Datteln, zweites Mal |
| W2\_INV\_MAX\_0370 | Max | Ein roher Fladen mit Datteln und Zwiebeln. Sieht aus wie eine Pizza, die sich in der Zeit verlaufen hat. | Ansehen: Fladen, roh |
| W2\_INV\_MAX\_0375 | Max | Roh und weich. Wenn ich den so abgebe, gibt's Ärger. Pixel sagt: erst Kruste, dann Ruhm. | Ansehen: Fladen, roh, zweites Mal |
| W2\_INV\_MAX\_0380 | Max | Dattel-Zwiebel-Fladen mit Kruste. Er knackt, wenn ich ihn anfasse. Pixel nennt das Kunst, ich nenn es Mittagessen. | Ansehen: Fladen, mit Kruste |
| W2\_INV\_PIX\_0385 | Pixel | Diese Kruste habe ich erfunden, und ich verlange dafür Lizenzgebühren. // Zahlbar in Thunfisch, monatlich und im Voraus. | Ansehen: Fladen, mit Kruste, zweites Mal |
| W2\_INV\_MAX\_0390 | Max | Ein Krug Traubensaft mit Sanduhr-Symbol. Er tickt. Saft sollte nicht ticken. | Ansehen: Traubensaft, Traubensaft |
| W2\_INV\_MAX\_0395 | Max | Der Pharao kann sich nicht zwischen Saft und Wein entscheiden. Ich halte die Antwort im Krug, sie ist bloß noch nicht fertig. | Ansehen: Traubensaft, Traubensaft, zweites Mal |
| W2\_INV\_MAX\_0400 | Max | Jetzt ist es Wein. Den darf ich nicht trinken, ich trag ihn nur. Für die Wissenschaft. | Ansehen: Traubensaft, Wein |
| W2\_INV\_PIX\_0405 | Pixel | Wein. Er riecht nach dem Silvesterabend deines Großvaters. // Und, wenn ich genauer schnuppere, auch nach dem Neujahrsmorgen danach. | Ansehen: Traubensaft, Wein, zweites Mal |
| W2\_INV\_MAX\_0410 | Max | Essig. Der Saft ist durch die Zeit sauer geworden, so wie ein Lehrer nach zwanzig Jahren Pausenaufsicht. | Ansehen: Traubensaft, Essig |
| W2\_INV\_MAX\_0415 | Max | Ich hab dran geschnuppert. Meine Nase hat gekündigt, fristlos. | Ansehen: Traubensaft, Essig, zweites Mal |
| W2\_INV\_MAX\_0420 | Max | Archimedes' Essigkrug. Das saure Gesicht drauf guckt mich an, und ich guck sauer zurück. | Ansehen: Essigkrug, Essig |
| W2\_INV\_MAX\_0425 | Max | Riecht wie eine Pommesbude um Mitternacht. Unverwechselbar. Leider. | Ansehen: Essigkrug, Essig, zweites Mal |
| W2\_INV\_MAX\_0430 | Max | Der Essig ist wieder Wein, rückwärts gealtert. Das schaffen sonst nur Leute mit sehr teurer Creme. | Ansehen: Essigkrug, Wein |
| W2\_INV\_MAX\_0435 | Max | Das Gesicht auf dem Krug guckt jetzt weniger sauer, fast schon versöhnlich. Wein macht offenbar milde. | Ansehen: Essigkrug, Wein, zweites Mal |
| W2\_INV\_MAX\_0440 | Max | Aus Essig ist Saft geworden. Wenn das mit Noten auch ginge, wär ich Klassenbester. | Ansehen: Essigkrug, Traubensaft |
| W2\_INV\_PIX\_0445 | Pixel | Saft im Essigkrug. Das Gesicht auf dem Krug ist verwirrt. // Ich verstehe es gut. Mir ginge es nicht anders, wenn man mich rückwärts altern ließe und ich plötzlich ein Kätzchen wäre. | Ansehen: Essigkrug, Traubensaft, zweites Mal |
| W2\_INV\_MAX\_0450 | Max | Ein Tintenfisch im Fass. Er hat acht Arme und verschränkt alle. | Ansehen: Tintenfass |
| W2\_INV\_MAX\_0455 | Max | Er hat mich gerade angespritzt, und jetzt hab ich einen blauen Daumen. Wir sind quitt. | Ansehen: Tintenfass, zweites Mal |
| W2\_INV\_MAX\_0460 | Max | Archimedes' Entwurf: Kugel im Zylinder, zwei Drittel. Er hat sogar die Schatten schraffiert. Für einen Grabstein. | Ansehen: Entwurf |
| W2\_INV\_MAX\_0465 | Max | Unten steht ganz klein: „Nicht knicken.“ Er meint das ernst, er hat Zirkelspuren am Daumen. | Ansehen: Entwurf, zweites Mal |
| W2\_INV\_MAX\_0470 | Max | Der Grabstein ist grau geworden, so grau wie ein Foto am Kühlschrank, das keiner mehr anguckt. | Ansehen: Grabstein, grau |
| W2\_INV\_MAX\_0475 | Max | Grau, aber noch scharfkantig. Für einen Stein ist er gerade mitten in der Pubertät. | Ansehen: Grabstein, grau, zweites Mal |
| W2\_INV\_MAX\_0480 | Max | Risse, Moos und ein Käfer. Ich trage hundert Jahre Geschichte in der Tasche, und die sind ziemlich schwer. | Ansehen: Grabstein, verwittert |
| W2\_INV\_PIX\_0485 | Pixel | Der Käfer wohnt jetzt bei dir. Ich habe ihn nicht gefressen. Noch nicht. // Und er weiß das. Ich sehe es an der Art, wie er mich ansieht. | Ansehen: Grabstein, verwittert, zweites Mal |
| W2\_INV\_MAX\_0490 | Max | Ein leeres Formular, das einzige im ganzen Amt. Es ist so leer, dass es schon fast wieder Möglichkeiten hat. | Ansehen: Leeres Formular |
| W2\_INV\_MAX\_0495 | Max | Oben steht „Antrag auf“, und dann nichts. Ich könnte alles beantragen. In Gedanken beantrage ich einen Mittagsschlaf. | Ansehen: Leeres Formular, zweites Mal |
| W2\_INV\_MAX\_0500 | Max | Mein Rundschreiben, mit blauem Kuli auf Papyrus. Es sieht amtlich aus, wenn man nicht genau hinguckt, und Beamte gucken nie genau hin. | Ansehen: Rundschreiben, mit Kugelschreiber |
| W2\_INV\_MAX\_0505 | Max | Passierschein Vier-Strich-Ypsilon. Den gibt es nicht, aber ich hab ihn trotzdem vorgeschrieben. So funktioniert Verwaltung. | Ansehen: Rundschreiben, mit Kugelschreiber, zweites Mal |
| W2\_INV\_MAX\_0510 | Max | Das Rundschreiben in Tintenfisch-Tinte. Es riecht nach Meer und Amtsstube, und das ist eine gefährliche Mischung. | Ansehen: Rundschreiben, mit Tinte |
| W2\_INV\_MAX\_0515 | Max | Mein Fingerabdruck in der Ecke sieht aus wie ein Siegel. Ich hab gerade aus Versehen was beglaubigt. | Ansehen: Rundschreiben, mit Tinte, zweites Mal |
| W2\_INV\_MAX\_0520 | Max | Ein Rundschreiben aus dem Formularberg. Jemand hatte dieselbe Idee wie ich und hat es dann nur nie abgegeben. | Ansehen: Rundschreiben, gefunden |
| W2\_INV\_MAX\_0525 | Max | Die Tinte ist verblasst, die Idee nicht. | Ansehen: Rundschreiben, gefunden, zweites Mal |
| W2\_INV\_MAX\_0530 | Max | Ein Empfehlungsschreiben der Sphinx, in Rätselform. Ich versteh es nicht, und genau das ist vermutlich der Sinn. | Ansehen: Empfehlungsschreiben |
| W2\_INV\_MAX\_0535 | Max | „Wer dies liest und nicht versteht, stempelt besser.“ Die Sphinx droht höflich. Das hat sie von den Katzen. | Ansehen: Empfehlungsschreiben, zweites Mal |
| W2\_INV\_MAX\_0540 | Max | Eine geflügelte Sandale, ganz allein. Sie flattert herum und sucht ihre Schwester. | Ansehen: Geflügelte Sandale |
| W2\_INV\_PIX\_0545 | Pixel | Eine Sandale mit Flügeln. Sie zuckt, und ich zucke zurück. // Bisher steht es unentschieden. Aber ich habe Zeit, und sie hat nur einen Riemen. | Ansehen: Geflügelte Sandale, zweites Mal |

## 27c. Gespräch erschöpft (ABS)

Ein Klick auf die Figur, wenn im Gesprächsmenü nur noch „Tschüss“ übrig wäre: Das Menü öffnet sich nicht, die Figur sagt abwechselnd eine dieser beiden Zeilen. Kommt ein neues Thema dazu, öffnet sich das Menü wieder (Regel in `05-spielsysteme.md`).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_ABS\_FAE\_0010 | Fährmann | Mehr weiß ich nicht, Junge. Ich weiß nur, wohin der Fluss fließt. Und wann. Und wer zahlt. | Reden: Fährmann, Gespräch erschöpft |
| W2\_ABS\_FAE\_0020 | Fährmann | Steig ein oder geh. Herumstehen kostet bei mir nämlich auch einen Obolus. | Reden: Fährmann, Gespräch erschöpft |
| W2\_ABS\_STM\_0030 | Steinmetz | Ich hab alles gesagt. Jetzt red ich nur noch mit dem Stein, der widerspricht wenigstens nicht. | Reden: Steinmetz, Gespräch erschöpft |
| W2\_ABS\_STM\_0040 | Steinmetz | Komm wieder, wenn du was zum Meißeln hast. Oder jemanden, der einen Grabstein braucht. Hoffentlich nicht dich. | Reden: Steinmetz, Gespräch erschöpft |
| W2\_ABS\_HER\_0050 | Hermes | Keine Zeit, keine Zeit! Ich hab dir alles gesagt! Glaub ich! Wo war ich? Egal! Weiter! | Reden: Hermes, Gespräch erschöpft |
| W2\_ABS\_HER\_0060 | Hermes | Ich muss los! Termine! Falls du was brauchst: Es ist in einem anderen Büro! | Reden: Hermes, Gespräch erschöpft |
| W2\_ABS\_RAM\_0070 | Ramses | Geh. Nein, bleib. Nein, geh. Wir haben alles besprochen, glaube ich. Ich habe mich entschieden: Geh. | Reden: Ramses, Gespräch erschöpft |
| W2\_ABS\_RAM\_0080 | Ramses | Ich würde dir gern noch etwas sagen. Aber ich kann mich nicht entscheiden, was. | Reden: Ramses, Gespräch erschöpft |
| W2\_ABS\_SCH\_0090 | Schreiber | Alles, was du gesagt hast, steht hier, und alles, was ich gesagt habe, auch. Die Tafel ist voll, und ich bin es auch. | Reden: Schreiber, Gespräch erschöpft |
| W2\_ABS\_SCH\_0100 | Schreiber | Wenn du noch was willst: bitte schriftlich. Aber nicht bei mir, ich hab Feierabend. Seit zehn Jahren. | Reden: Schreiber, Gespräch erschöpft |
| W2\_ABS\_NEB\_0110 | Nebet | Ich hab dir alles erzählt, was in einen Topf passt. Jetzt raus aus meiner Küche, bevor du anbrennst. | Reden: Nebet, Gespräch erschöpft |
| W2\_ABS\_NEB\_0120 | Nebet | Wenn du nicht kochst, stehst du im Weg. Und du kochst nicht. Also: weg. | Reden: Nebet, Gespräch erschöpft |
| W2\_ABS\_SPH\_0130 | Sphinx | Was hat zwei Beine, keine Fragen mehr und steht trotzdem noch hier? Du. Das war mein erstes Rätsel seit Jahren. Danke. | Reden: Sphinx, Gespräch erschöpft |
| W2\_ABS\_SPH\_0140 | Sphinx | Ich habe dir alles gesagt. In Rätselform wäre es länger. Sei froh. | Reden: Sphinx, Gespräch erschöpft |
| W2\_ABS\_ARC\_0150 | Archimedes | Gib mir einen festen Punkt, und ich rede weiter. Ohne festen Punkt bin ich fertig, für heute. | Reden: Archimedes, Gespräch erschöpft |
| W2\_ABS\_ARC\_0160 | Archimedes | Störe meine Kreise nicht. Das ist nicht böse gemeint, es sind bloß sehr schöne Kreise. | Reden: Archimedes, Gespräch erschöpft |
| W2\_ABS\_HIE\_0170 | Hieron | Ich habe alles gesagt, was ein König sagen muss. Jetzt warte ich. Das kann ich königlich gut. | Reden: Hieron, Gespräch erschöpft |
| W2\_ABS\_HIE\_0180 | Hieron | Wenn du mich noch mal ansprichst, will ich eine Lösung hören. Oder eine Krone. Am liebsten beides. | Reden: Hieron, Gespräch erschöpft |
| W2\_ABS\_CIC\_0190 | Cicero | Ich könnte dir noch drei Stunden über die Tugend erzählen. Aber dafür brauche ich Zuschauer, und du zählst nur halb. | Reden: Cicero, Gespräch erschöpft |
| W2\_ABS\_CIC\_0200 | Cicero | Wie lange willst du meine Geduld noch missbrauchen? Das ist eine rhetorische Frage. Geh. | Reden: Cicero, Gespräch erschöpft |
| W2\_ABS\_BRI\_0210 | Brian | Ich hab nichts mehr zu sagen. Und wenn du jetzt sagst, das ist ein Zeichen, schrei ich. | Reden: Brian, Gespräch erschöpft |
| W2\_ABS\_BRI\_0220 | Brian | Geh weg. Bitte. Das ist keine Botschaft, das ist nur eine Bitte. Schreib's nicht auf. | Reden: Brian, Gespräch erschöpft |
| W2\_ABS\_BE1\_0230 | Beamter 1 | Nummer ziehen, warten, wiederkommen. Das war alles, was ich sagen darf, und ich hab's gesagt. | Reden: Beamter 1, Gespräch erschöpft |
| W2\_ABS\_BE1\_0240 | Beamter 1 | Mein Schalter ist für dich jetzt geschlossen. Für alle anderen auch. Er war nie offen. | Reden: Beamter 1, Gespräch erschöpft |
| W2\_ABS\_BE2\_0250 | Beamter 2 | Für weitere Fragen ist ein anderes Amt zuständig. Welches, steht auf einem Formular, das es nicht gibt. | Reden: Beamter 2, Gespräch erschöpft |
| W2\_ABS\_BE2\_0260 | Beamter 2 | Wir sind fertig miteinander. Verwaltungstechnisch. Menschlich waren wir es nie. | Reden: Beamter 2, Gespräch erschöpft |
| W2\_ABS\_LEO\_0270 | Leonidas | ICH HAB ALLES GESAGT! JETZT WIRD TRAINIERT! NICHT GEREDET! | Reden: Leonidas, Gespräch erschöpft |
| W2\_ABS\_LEO\_0280 | Leonidas | DU WILLST NOCH WAS? DAS IST KEIN GESPRÄCH! DAS IST AUFWÄRMEN! LAUF! | Reden: Leonidas, Gespräch erschöpft |

## 28. Zurufe

Pixel kommentiert ungefragt, wenn der Spieler 45 Sekunden nichts tut. Zufällig gezogen, nie zweimal hintereinander.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_ZURU\_PIX\_0010 | Pixel | Der Fluss fließt, der Sand rieselt, und du stehst. // Zwei von drei Dingen hier bewegen sich, und ich muss dir leider sagen, welches nicht. | Nil-Delta oder Fährsteg |
| W2\_ZURU\_PIX\_0020 | Pixel | Das Krokodil hat sich inzwischen dreimal vor mir verneigt. Du hast dich in derselben Zeit kein einziges Mal bewegt. // Lern vom Krokodil. Das sage ich nicht oft. | Nil-Delta |
| W2\_ZURU\_PIX\_0030 | Pixel | Der Pharao hat sich in der Zeit, in der du hier herumstehst, für gar nichts entschieden. // Ihr zwei wärt ein wunderbares Team, junger Mann. Ihr würdet gemeinsam nie irgendwo ankommen. | Thronsaal |
| W2\_ZURU\_PIX\_0040 | Pixel | Es riecht nach Brot. Es riecht seit fünf Minuten nach Brot, und du tust nichts. // Das ist Folter. Folter mit Kruste. Ich werde das bei Gelegenheit melden. | Palastküche |
| W2\_ZURU\_PIX\_0050 | Pixel | Die Sphinx denkt nach, und du denkst nach. Einer von euch beiden ist aus Stein. // Ich bin mir, wenn ich euch so ansehe, nicht mehr ganz sicher, wer. | Sphinx |
| W2\_ZURU\_PIX\_0060 | Pixel | Archimedes hat in dieser Zeit zwei Dinge erfunden. Eins davon war schlecht. // Das sind trotzdem zwei mehr als du, und ich zähle sehr großzügig. | Werkstatt |
| W2\_ZURU\_PIX\_0070 | Pixel | Die Bank ist gerade frei geworden. Setz dich doch. // Dann bist du wenigstens offiziell untätig, mit Nummer und allem, was dazugehört. | Startbüro |
| W2\_ZURU\_PIX\_0080 | Pixel | Cicero hat seit deiner Ankunft nicht aufgehört zu reden. Du hast seit deiner Ankunft nicht angefangen. // Ich nenne das einen Gleichstand. | Agora |
| W2\_ZURU\_PIX\_0090 | Pixel | Die Schildkröte ist gerade einmal ums ganze Stadion gelaufen. // Ich erwähne es nur. Ich ziehe keine Schlüsse. Das überlasse ich dir. | Stadion |
| W2\_ZURU\_PIX\_0100 | Pixel | Da ist ein Ausgang. Ausgänge sind zum Benutzen da. // Genau wie Fähren. Und Öfen. Und, wenn ich das anmerken darf, Dosenöffner. | überall, wenn kein Rätselschritt offen ist |

## 29. Hinweise

Drei Stufen je Rätselschritt für die Hilfe-Pfote, Wartezeiten laut Spielsysteme. Die Schritte heißen W2\_R01 bis W2\_R11, mit Buchstaben für Teilschritte (Liste in `raetsel/welt-2.md`, Teilschritte und Schalter). Die IDs folgen dem Schema W2\_HINT\_PIX\_RRSK aus den Spielsystemen: RR Rätselnummer, S Stufe, K Teilschritt (0 ohne, 1 für a, 2 für b). Die Wettkampftage (R12, R13) haben je drei kurze Hinweise, die nur zur Startlinie führen (W2\_HINT\_PIX\_1210 bis 1330).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W2\_HINT\_PIX\_0110 | Pixel | Der Fährmann will eine Münze, und du hast keine. // Aber das Krokodil hat sich vor jemandem verneigt. Nicht vor dir. Denk darüber nach, vor wem. | R01, Stufe 1 |
| W2\_HINT\_PIX\_0120 | Pixel | Götter fahren umsonst, und ihre Diener auch. // Ich sage das Wort „Diener“ übrigens nicht gern. Es kommt mir nur so leicht über die Lippen. | R01, Stufe 2 |
| W2\_HINT\_PIX\_0130 | Pixel | Wechsle zu mir und lass mich auf die Fähre gehen. Oder zieh mich drauf wie einen Gegenstand. // Ich bin kein Gegenstand, junger Mann. Mach es trotzdem. | R01, Stufe 3 |
| W2\_HINT\_PIX\_0211 | Pixel | Der Pharao liest nur Bilder, und der Schreiber hat eine Tafel voller Bilder. // Vier Felder, ein Satz. Mehr verlangt niemand von dir. Nicht einmal ich. | R02a, Stufe 1 |
| W2\_HINT\_PIX\_0221 | Pixel | Die Grammatik steht an der Säule: wer handelt, wem er dient, wen er bittet. // Und das Ohr steht für Gehör. Ein Körperteil, das du bei mir selten benutzt. | R02a, Stufe 2 |
| W2\_HINT\_PIX\_0231 | Pixel | Mann, Katze, Pharao, Ohr. Du dienst der Katze und bittest um Gehör. Ich habe nichts gegen diesen Satz. | R02a, Stufe 3 |
| W2\_HINT\_PIX\_0212 | Pixel | Der Hofkater will drei Dinge sehen: Opfergabe, Gefolge, Wunder. Er selbst hat zwei. // Wir brauchen also drei. Ich habe es nachgerechnet, damit du es nicht musst. | R02b, Stufe 1 |
| W2\_HINT\_PIX\_0222 | Pixel | Die Dose glänzt wie eine Opfergabe, und das Krokodil läuft mir ohnehin hinterher. // Fehlt nur noch ein Wunder. Etwas, das leuchtet oder schwebt. | R02b, Stufe 2 |
| W2\_HINT\_PIX\_0232 | Pixel | Zeig die Dose, hol Sobek vom Steg, und dann: Kaugummiblase. Oder Archimedes' Spiegel in die Sonne, wenn der Kaugummi weg ist. | R02b, Stufe 3 |
| W2\_HINT\_PIX\_0311 | Pixel | Schalter eins will, was Schalter zwei hat, und umgekehrt. Ein Kreis. // Lies einmal, was dort an der Wand hängt. Es hängt da nicht zur Zierde. | R03a, Stufe 1 |
| W2\_HINT\_PIX\_0321 | Pixel | Ein neues Rundschreiben gilt sofort. Und wer schreibt die Rundschreiben? Niemand weiß es. // Also kannst genauso gut du es sein. | R03a, Stufe 2 |
| W2\_HINT\_PIX\_0331 | Pixel | Nimm ein Formular und den Kugelschreiber. Oder Papyrus vom Nil und Tinte vom Tintenfisch im Hafen. Verlang etwas, das es nicht gibt. Sie stempeln alles, nur damit du gehst. | R03a, Stufe 3 |
| W2\_HINT\_PIX\_0312 | Pixel | Die Beamten stempeln nur, was über allen Vorschriften steht. // Ein neues Rundschreiben zum Beispiel. Oder einen Brief, den keiner versteht. | R03b, Stufe 1 |
| W2\_HINT\_PIX\_0322 | Pixel | Ein Rundschreiben schreibst du selbst. Einen unverständlichen Brief schreibt dir die Sphinx, wenn du ihr Rätsel geschafft hast. // Eins von beiden reicht. | R03b, Stufe 2 |
| W2\_HINT\_PIX\_0332 | Pixel | Gib das Rundschreiben oder das Empfehlungsschreiben der Sphinx am Schalter ab. Dann gibt es den Startpass. Und Hermes. Leider. | R03b, Stufe 3 |
| W2\_HINT\_PIX\_0410 | Pixel | Die Sandalen wollen weg, und Öl hält Riemen. Öl gibt es in der Küche. // Die Köchin will dafür allerdings etwas Neues, junger Mann. Etwas, das sie noch nie gekostet hat. | R04, Stufe 1 |
| W2\_HINT\_PIX\_0420 | Pixel | Sie kocht Fusionsküche, also etwas, das es hier nicht gibt. Und du hast Dinge, die es hier nicht gibt. // Oder du fragst mich nach einem Rezept. Ich warte schon lange darauf. | R04, Stufe 2 |
| W2\_HINT\_PIX\_0430 | Pixel | Gib ihr den Kaugummi als ewiges Brot. Oder back Brot mit Datteln und Zwiebeln im Ofen, so wie ich es sage. Dann Öl auf die Sandalen. | R04, Stufe 3 |
| W2\_HINT\_PIX\_0510 | Pixel | Krone und Barren wiegen gleich viel, die Waage sagt also nichts. // Aber Archimedes ärgert sich jedes Mal, wenn die Wanne überläuft. Was glaubst du, warum? | R05, Stufe 1 |
| W2\_HINT\_PIX\_0520 | Pixel | Gleich schwer, aber was größer ist, macht mehr nass. // Miss mit dem Becher, wie viel Wasser überläuft. Ich sehe dir dabei zu, aus sicherer Entfernung. | R05, Stufe 2 |
| W2\_HINT\_PIX\_0530 | Pixel | Krone in die Wanne, Becher dran. Barren in die Wanne, Becher dran. Mehr Wasser bei der Krone heißt: gefälscht. Dann sag es ihm. Er rennt dann. Nackt. | R05, Stufe 3 |
| W2\_HINT\_PIX\_0611 | Pixel | Eine Sandale hängt oben auf der Säule, und die Menge hält sie für heilig. // Du kannst nicht klettern. Ich schon. Ich sage das ohne jeden Hochmut. | R06a, Stufe 1 |
| W2\_HINT\_PIX\_0621 | Pixel | Wechsel zu mir, Säule hoch, Sandale runter. Dann ziehst du sie an. Dann bist du heilig. Es wird nicht lange halten. | R06a, Stufe 2 |
| W2\_HINT\_PIX\_0631 | Pixel | Ich hole sie, du ziehst sie an, Brian hängt dir sein Schild um, und die Menge schenkt dir Dinge. Nimm alles. Besonders das mit Blättern. | R06a, Stufe 3 |
| W2\_HINT\_PIX\_0612 | Pixel | Die Wedler wollen reife Feigen, und du hast einen Setzling. // Dazwischen liegen Jahre. Oder, wenn man es geschickt anstellt, eine Fährfahrt. | R06b, Stufe 1 |
| W2\_HINT\_PIX\_0622 | Pixel | Flussabwärts wird alles älter, auch Pflanzen im Topf. Das steht auf der Tafel. // Und Syrakus liegt flussabwärts. | R06b, Stufe 2 |
| W2\_HINT\_PIX\_0632 | Pixel | Fahr den Setzling nach Syrakus, pflück die Feigen vom Baum, fahr zurück. Gepflücktes altert nicht mehr. Gib den Wedlern die Feigen. Nicht mir. Leider. | R06b, Stufe 3 |
| W2\_HINT\_PIX\_0710 | Pixel | Vier Verdächtige, je zwei Aussagen, und jeder lügt genau einmal. // Schreib alles auf, und streich dann durch, was nicht aufgeht. So mache ich es mit meinen Feinden. | R07, Stufe 1 |
| W2\_HINT\_PIX\_0720 | Pixel | Prüf jeden als Dieb: Stimmt dann bei jedem genau eine Aussage? // Und, junger Mann, ganz unter uns: Meine Nase lügt bei Fisch. Einer riecht nach Fisch. | R07, Stufe 2 |
| W2\_HINT\_PIX\_0730 | Pixel | Tiro. Er war im Stadion, Hermes war es nicht. Eine Lüge, eine Wahrheit. Klag ihn an. Er gibt den Diskus her. Mit Kratzern. | R07, Stufe 3 |
| W2\_HINT\_PIX\_0810 | Pixel | Die Sphinx will ein Rätsel, das sie nicht lösen kann. Sie kennt alles aus ihrer Zeit. // Du dagegen trägst Dinge aus deiner Zeit mit dir herum. Ziemlich nutzlose Dinge, aber immerhin. | R08, Stufe 1 |
| W2\_HINT\_PIX\_0820 | Pixel | Wähl ein Wunderding und drei Hinweise aus dem Notizbuch, die nur darauf passen. // Die Hinweise sammelst du, wenn du deine Sachen ansiehst oder Leute damit überraschst. | R08, Stufe 2 |
| W2\_HINT\_PIX\_0830 | Pixel | Zum Handy: klingelt, leuchtet, drei Prozent. Zum Kaugummi: nie alle, klebt, Sonne. Zum Stift: ohne Tintenfass, klickt, blau. Drei, die zusammengehören. | R08, Stufe 3 |
| W2\_HINT\_PIX\_0910 | Pixel | Cicero redet, und du brauchst Antworten. Die Rolle hat drei, der Rest fehlt noch. // Auf der Agora reden alle. Hör einfach mal zu. Das wäre auch für mich eine schöne Abwechslung. | R09, Stufe 1 |
| W2\_HINT\_PIX\_0920 | Pixel | Die Griechen schimpfen über die Römer, und der Mann in der Tonne schimpft über alle. // Einer von uns beiden passt in diese Tonne. Rate, wer. | R09, Stufe 2 |
| W2\_HINT\_PIX\_0930 | Pixel | Rede mit den Griechen in der Menge, dann wechsel zu mir und schick mich in die Tonne. Sieben Konter, fünf Beleidigungen. Das reicht sogar für dich. | R09, Stufe 3 |
| W2\_HINT\_PIX\_1011 | Pixel | Cicero will ein Grab, aber Archimedes lebt. Und Archimedes will sein Grab gern selbst entwerfen. // Frag ihn. Er wird empfindlich reagieren. Frag ihn trotzdem. | R10a, Stufe 1 |
| W2\_HINT\_PIX\_1021 | Pixel | Mit dem Entwurf zu den Pyramiden-Arbeitern im Nil-Delta. Ohne Entwurf liefern sie Schotter. // Ich habe es mit eigenen Augen gesehen, und ich habe gelacht. | R10a, Stufe 2 |
| W2\_HINT\_PIX\_1031 | Pixel | Hol den Entwurf in der Werkstatt, gib ihn dem Steinmetz am Nil, nimm den frischen Stein. Dann geht es ums Alter. | R10a, Stufe 3 |
| W2\_HINT\_PIX\_1012 | Pixel | Hundertsiebenunddreißig Jahre, nicht eins jünger. Stein altert auf der Fähre. // Die Tafel nennt die Jahre für jede Strecke. Rechne. Ich warte so lange. | R10b, Stufe 1 |
| W2\_HINT\_PIX\_1022 | Pixel | Ägypten bis Olympia hundertzwölf, Olympia bis Syrakus fünfundzwanzig. Zusammen? Genau. // Der Stein muss also den ganzen Fluss hinunter. | R10b, Stufe 2 |
| W2\_HINT\_PIX\_1032 | Pixel | Stein am Nil meißeln lassen, ohne Umweg bis Syrakus fahren, auf den Sockel am Grabhügel stellen. Cicero findet ihn. Archimedes steht daneben. Ich auch. | R10b, Stufe 3 |
| W2\_HINT\_PIX\_1111 | Pixel | Der Zeremonienmeister hat dir die Ordnung genannt. Einladungen zuerst, der Spiegel braucht Mittag, die Rede braucht Leute. // Und der Gott kommt zuletzt, junger Mann. Der Gott bin ich. | R11a, Stufe 1 |
| W2\_HINT\_PIX\_1121 | Pixel | Über dem zweiten Feld ist eine Sonne, also gehört der Spiegel dorthin. // Davor Hermes, danach Cicero, und ganz am Ende ich. Wie es sich gehört. | R11a, Stufe 2 |
| W2\_HINT\_PIX\_1131 | Pixel | Hermes, Spiegel, Cicero, Pixel. In dieser Reihenfolge in die vier Felder. Mein Name steht zuletzt, weil der Höhepunkt zuletzt kommt. | R11a, Stufe 3 |
| W2\_HINT\_PIX\_1112 | Pixel | Ramses will Wein, aber es gibt keinen. Es gibt Saft im Palast und Essig in der Werkstatt. // Und was gärt, reist mit der Zeit. | R11b, Stufe 1 |
| W2\_HINT\_PIX\_1122 | Pixel | Essig war Wein, bevor er Essig wurde, und flussaufwärts wird alles jünger. // Fünfundzwanzig Jahre reichen. Nicht mehr. | R11b, Stufe 2 |
| W2\_HINT\_PIX\_1132 | Pixel | Nimm den Essigkrug aus der Werkstatt, fahr von Syrakus nach Olympia, nicht weiter, und gib Ramses den Wein. Wer bis Ägypten fährt, hat Saft. | R11b, Stufe 3 |
| W2\_HINT\_PIX\_1210 | Pixel | Startpass, Sandalen und ein Mann mit Hebel. // Die Spiele haben einen Anfang, und dieser Anfang hat eine Linie. | R12, Stufe 1 |
| W2\_HINT\_PIX\_1220 | Pixel | Im Stadion ist eine Startlinie. Linien sind dafür da, dass man sich dahinterstellt. // Ich persönlich setze mich meistens drauf. Das wirkt entschlossener. | R12, Stufe 2 |
| W2\_HINT\_PIX\_1230 | Pixel | Geh ins Stadion und benutz die Startlinie. Dann beginnt Wettkampftag 1. Öl auf den Sandalen ist freiwillig, macht dich aber schneller. | R12, Stufe 3 |
| W2\_HINT\_PIX\_1310 | Pixel | Ein Diskus, genug Konter, und Cicero hat sein Grab. Mehr braucht der Finaltag nicht. // Außer dir. | R13, Stufe 1 |
| W2\_HINT\_PIX\_1320 | Pixel | Der Finaltag beginnt dort, wo Tag 1 begonnen hat. // Und falls die Fächerwedler noch keine Feigen bekommen haben: Der Wind dreht. | R13, Stufe 2 |
| W2\_HINT\_PIX\_1330 | Pixel | Benutz die Startlinie im Stadion. Fehlen die Feigen für die Wedler, fällt es dir dort selbst ein, und beim zweiten Mal geht es trotzdem los. | R13, Stufe 3 |
| W2\_HINT\_PIX\_9995 | Pixel | Ich denke noch nach. Die Sphinx sitzt seit Jahrtausenden über einem einzigen Rätsel. // Ich brauche nur ein Nickerchen länger. | Wartezeile, nächste Stufe noch gesperrt |
