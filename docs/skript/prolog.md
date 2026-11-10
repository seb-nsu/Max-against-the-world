# Skript Prolog: Opas Dachboden

Das ganze Prolog-Skript als Entwurf und Muster für alle Welten: rund 180 Zeilen, Spielzeit etwa zehn Minuten. Die Tabellen nutzen die Kurzform aus `05-spielsysteme.md`: ID, Sprecher, Text und Regie oder Auslöser; eine Bedingung steht im Auslöser nach Semikolon. Eine Sprechblase fasst bis zu drei Zeilen (etwa 120 Zeichen); „//“ trennt Pixels Kaskaden in Folgeblasen. Die Nummern laufen pro Szene in Zehnerschritten durch, egal wer spricht, damit die Reihenfolge an der ID ablesbar ist. Die Kanäle sind festgelegt: 3 für Welt 1, 7 für Welt 2, 42 für Welt 3, 999 für Welt 4. Ton nach den Dialogregeln in `01-konzept.md` (Humor-Durchgang 10. November 2026).

## 1. Wohnzimmer: Kein WLAN

Szene. Max liegt auf Opas Sofa, das Handy über dem Gesicht. Der Fernseher ist aus.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_WOHN\_MAX\_0010 | Max | Ein Balken. Ich hab das Handy schon ans Fenster gehalten, über den Kopf und unters Kissen. Ein einziger Balken. | liegt, starrt aufs Handy |
| P0\_WOHN\_MAX\_0020 | Max | Und ich bin ziemlich sicher, dass der auch bloß zur Deko da ist. |  |
| P0\_WOHN\_OPA\_0030 | Opa (von oben) | Maaax! Komm mal rauf! Ich brauch dich für die Wissenschaft! | gedämpft durch die Decke |
| P0\_WOHN\_MAX\_0040 | Max | Kann die Wissenschaft nicht runterkommen? Ich hab gerade die perfekte Liegeposition gefunden. | ruft zurück, bewegt sich nicht |
| P0\_WOHN\_OPA\_0042 | Opa (von oben) | Die Wissenschaft hat Knie, Junge! Alte Knie! |  |
| P0\_WOHN\_MAX\_0044 | Max | Und ich hab einen Balken. Jeder hat sein Päckchen zu tragen. |  |
| P0\_WOHN\_OPA\_0050 | Opa (von oben) | Apropos Balken: Das neue WLAN-Passwort liegt hier oben. Auf einem Zettel. Direkt neben mir. |  |
| P0\_WOHN\_MAX\_0060 | Max | … | setzt sich langsam auf |
| P0\_WOHN\_MAX\_0070 | Max | Okay. Das ist Erpressung. Ziemlich gute Erpressung, muss ich zugeben. | steht auf, Handy in die Bauchtasche |

**Ansehen im Wohnzimmer:**

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_WOHN\_MAX\_0110 | Max | Opas Fernseher. Der hat tatsächlich einen eigenen Knopf für „Farbe“, als hätte man sich das früher aussuchen müssen. | Ansehen: Fernseher |
| P0\_WOHN\_MAX\_0115 | Max | Opa hat die Farbe auf halb gedreht. Er sagt, sonst sehen die Nachrichten zu fröhlich aus. | Ansehen: Fernseher, zweites Mal |
| P0\_WOHN\_MAX\_0120 | Max | Opa hält eine Torte hoch, die eindeutig verbrannt ist, und Oma lacht sich daneben kaputt. Ich glaube, das ist Liebe. | Ansehen: Familienfoto |
| P0\_WOHN\_MAX\_0125 | Max | Auf allen anderen Fotos guckt Oma, als hätte jemand was vergessen. Ich hab da so einen Verdacht, wer das sein könnte. | Ansehen: Familienfoto, zweites Mal |
| P0\_WOHN\_MAX\_0130 | Max | Kalter Tee. Opa kocht sich jeden Tag einen und vergisst ihn jeden Tag. Das ist schon fast ein Ritual. | Ansehen: Teetasse |
| P0\_WOHN\_MAX\_0135 | Max | Unten in der Tasse liegt ein halber Keks. Beim Tunken abgebrochen und nie wieder aufgetaucht. Ruhe in Frieden, Keks. | Ansehen: Teetasse, zweites Mal |
| P0\_WOHN\_MAX\_0140 | Max | Ein sauberes Rechteck im Staub. Da lag Opas Fernbedienung, und zwar ziemlich lange, so wie das aussieht. | Ansehen: Leerer Platz auf dem Couchtisch |
| P0\_WOHN\_MAX\_0145 | Max | Die Umrisse sind so genau, dass man fast eine Kreidelinie drumziehen will. Hier ist etwas Schlimmes passiert. | Ansehen: Leerer Platz auf dem Couchtisch, zweites Mal |
| P0\_WOHN\_MAX\_0150 | Max | Das Sofa. Wir zwei haben eine lange gemeinsame Geschichte, und die meisten Kapitel spielen im Liegen. | Ansehen: Sofa |
| P0\_WOHN\_MAX\_0155 | Max | Da ist eine Kuhle, die exakt meine Form hat. Ich steh direkt daneben, und das Sofa vermisst mich trotzdem schon. | Ansehen: Sofa, zweites Mal |

**Benutzen im Wohnzimmer:** Eigene Zeilen statt Ersatzzeilen, ohne Fehler-Jingle.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_WOHN\_MAX\_0160 | Max | Nicht hinlegen. Wenn ich mich jetzt hinlege, steh ich erst nächstes Jahr wieder auf, und dann ist das Passwort schon wieder alt. | Benutzen: Sofa |
| P0\_WOHN\_MAX\_0165 | Max | Nur kurz draufsetzen? Das sagt jeder. Und plötzlich ist es Dienstag, und man weiß nicht, wie. | Benutzen: Sofa, zweites Mal |
| P0\_WOHN\_MAX\_0170 | Max | Ich drück auf „An“. Er brummt, denkt kurz darüber nach und geht wieder aus. Ehrlich gesagt kenne ich das von mir. | Benutzen: Fernseher |
| P0\_WOHN\_MAX\_0175 | Max | Noch mal „An“. Diesmal brummt er lauter. Ich glaube, er will mir etwas sagen, und ich glaube, es ist „Nein“. | Benutzen: Fernseher, zweites Mal |
| P0\_WOHN\_MAX\_0180 | Max | Kalten Tee trinke ich nicht. Ich hab nicht viele Prinzipien, aber das ist eins davon. | Benutzen: Teetasse |
| P0\_WOHN\_MAX\_0185 | Max | Ich hab dran gerochen. Kalter Tee riecht genau so, wie sich ein Montagmorgen anfühlt. | Benutzen: Teetasse, zweites Mal |
| P0\_WOHN\_MAX\_0190 | Max | Ich lass das Bild lieber hängen. Oma merkt, wenn eins schief hängt, und zwar auch aus dem Urlaub. | Benutzen: Familienfoto |
| P0\_WOHN\_MAX\_0195 | Max | Ich hab es gerade gerückt. Jetzt hängen alle anderen schief. Ich lass das ab sofort. | Benutzen: Familienfoto, zweites Mal |
| P0\_WOHN\_MAX\_0200 | Max | Ich wisch den Staub nicht weg. Falls die Fernbedienung entführt wurde, ist das ein Beweisstück. | Benutzen: Leerer Platz auf dem Couchtisch |
| P0\_WOHN\_MAX\_0205 | Max | Ich hab aus Versehen reingepustet. Jetzt ist der Tatort ruiniert, und ich bin der Hauptverdächtige. | Benutzen: Leerer Platz auf dem Couchtisch, zweites Mal |

**Weitere Dinge im Wohnzimmer:**

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_WOHN\_MAX\_0310 | Max | Opas Schrank. Der knarrt schon, wenn man ihn bloß anguckt. Das hat er mit der Treppe gemeinsam. Und mit Opa. | Ansehen: Schrank |
| P0\_WOHN\_MAX\_0315 | Max | Der Schlüssel steckt. Opa schließt nie ab, weil Diebe angeblich keinen Geschmack haben. Ich glaube, er hat recht. | Ansehen: Schrank, zweites Mal |
| P0\_WOHN\_MAX\_0320 | Max | Ich mach den nicht auf. Bei Opa fällt einem immer irgendwas entgegen, und meistens ist es eine Erfindung. | Benutzen: Schrank |
| P0\_WOHN\_MAX\_0325 | Max | Okay, einen Spalt. Ein Bügelbrett kippt mir entgegen, ganz langsam, als wollte es reden. Ich mach wieder zu. | Benutzen: Schrank, zweites Mal |
| P0\_WOHN\_MAX\_0330 | Max | Eine Stehlampe mit Fransen. Sie macht genau so viel Licht, dass man den Staub sieht, aber nicht genug zum Lesen. | Ansehen: Stehlampe |
| P0\_WOHN\_MAX\_0335 | Max | Am Fuß klebt ein Zettel: „Nicht ausschalten. Wackelkontakt.“ Seit wann, steht da leider nicht. | Ansehen: Stehlampe, zweites Mal |
| P0\_WOHN\_MAX\_0340 | Max | Ich lass sie an. Wenn ich sie ausmache, geht sie vielleicht nie wieder an, und dann bin ich schuld. | Benutzen: Stehlampe |
| P0\_WOHN\_MAX\_0345 | Max | Ich hab doch kurz gewackelt. Jetzt flackert sie, und zwar irgendwie beleidigt. Ich fass hier nichts mehr an. | Benutzen: Stehlampe, zweites Mal |
| P0\_WOHN\_MAX\_0350 | Max | Opas Zeitung. Er löst das Kreuzworträtsel immer mit Kugelschreiber, auch die Kästchen, bei denen er falschliegt. | Ansehen: Zeitung |
| P0\_WOHN\_MAX\_0355 | Max | „Gerät mit Bildschirm, neun Buchstaben“: Opa hat „ZAPPOMAT“ eingetragen und für den neunten einfach ein Kästchen dazugemalt. | Ansehen: Zeitung, zweites Mal |
| P0\_WOHN\_MAX\_0360 | Max | Ich lese keine Zeitung. Da kann man nicht mal drunter kommentieren, dass alles falsch ist. | Benutzen: Zeitung |
| P0\_WOHN\_MAX\_0365 | Max | Senkrecht drei: „Funknetz, vier Buchstaben“. Opa hat „NEIN“ eingetragen. Das ist keine Lösung, das ist eine Haltung. | Benutzen: Zeitung, zweites Mal |

## 1b. Treppenhaus: Durchgang

Durchgang zwischen Wohnzimmer und Dachboden, mehrere Ansehen-Objekte und die Treppe. Kein Rätsel, im Finale dieselbe Szene am Abend.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_TREP\_MAX\_0010 | Max | Opas Hut. Am Band steckt eine Feder, entweder vom Fasan oder aus dem Kopfkissen. Bei Opa ist beides möglich. | Ansehen: Hut am Haken |
| P0\_TREP\_MAX\_0015 | Max | Der Hut riecht nach Lötzinn und Pfefferminz. Also im Grunde genau wie Opa, wenn man ihn umarmt. | Ansehen: Hut am Haken, zweites Mal |
| P0\_TREP\_MAX\_0020 | Max | Draußen wird es langsam dunkel. Drinnen ist es, wenn man sich die Tapete ansieht, ungefähr 1987. | Ansehen: Fenster |
| P0\_TREP\_MAX\_0025 | Max | Auf der Fensterbank stand mal ein Kaktus. Opa hat ihn jeden Tag gegossen. Ich glaube, daran ist er gestorben. | Ansehen: Fenster, zweites Mal |
| P0\_TREP\_MAX\_0030 | Max | Jede Stufe knarrt in einer anderen Tonart. Opa nennt das seine Alarmanlage, und ehrlich, sie funktioniert. | Ansehen: Treppe |
| P0\_TREP\_MAX\_0035 | Max | Die siebte Stufe knarrt in Moll. Über die steig ich immer drüber, ohne WLAN bin ich schon traurig genug. | Ansehen: Treppe, zweites Mal |
| P0\_TREP\_MAX\_0040 | Max | Ich setz den nicht auf. Am Ende passt er mir, und dann muss ich auch noch Opas Hobbys übernehmen. | Benutzen: Hut am Haken |
| P0\_TREP\_MAX\_0045 | Max | Ich hab ihn kurz aufgesetzt. Er rutscht mir bis über die Augen. Opa hat einen großen Kopf, da muss ja auch einiges rein. | Benutzen: Hut am Haken, zweites Mal |
| P0\_TREP\_MAX\_0050 | Max | Das Fenster geht nicht auf, seit ich denken kann. Opa sagt, sonst kommt die Gegenwart rein. | Benutzen: Fenster |
| P0\_TREP\_MAX\_0055 | Max | Ich hab am Griff gerüttelt, und der Griff hat zurückgerüttelt. Das Fenster und ich, wir lassen uns jetzt in Ruhe. | Benutzen: Fenster, zweites Mal |
| P0\_TREP\_MAX\_0060 | Max | Erste Stufe, die knarrt in Dur. Jetzt weiß das ganze Haus, dass ich komme. | Benutzen: Treppe |
| P0\_TREP\_MAX\_0065 | Max | Zweite Stufe, die knarrt in Fis. Ich bin nicht musikalisch, aber selbst ich höre, dass das falsch ist. | Benutzen: Treppe, zweites Mal |

**Weitere Dinge im Treppenhaus:**

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_TREP\_MAX\_0110 | Max | Ein Regenschirm. Der lehnt hier, seit ich denken kann, und ich bin mir ziemlich sicher, dass er noch nie draußen war. | Ansehen: Regenschirm |
| P0\_TREP\_MAX\_0115 | Max | Am Griff hängt ein Schild: „Prototyp 2. Nicht öffnen.“ Bei Opa ist so was keine Bitte, sondern eine Warnung. | Ansehen: Regenschirm, zweites Mal |
| P0\_TREP\_MAX\_0120 | Max | Ich spann den nicht auf. Im Haus bringt das Unglück, und bei Opa wahrscheinlich auch noch einen Propeller. | Benutzen: Regenschirm |
| P0\_TREP\_MAX\_0125 | Max | Na gut, ein kleines Stück. Es fängt an zu surren. Ich mach ihn sofort wieder zu, und wir reden nie wieder darüber. | Benutzen: Regenschirm, zweites Mal |
| P0\_TREP\_MAX\_0130 | Max | Opas Mäntel. Einer für Regen, einer für Sonne und einer für „man weiß ja nie“. Den trägt er am häufigsten. | Ansehen: Mäntel |
| P0\_TREP\_MAX\_0135 | Max | In jeder Manteltasche steckt ein Schraubenzieher. Opa verlässt das Haus grundsätzlich nicht unbewaffnet. | Ansehen: Mäntel, zweites Mal |
| P0\_TREP\_MAX\_0140 | Max | Ich zieh keinen an. Mäntel sind für Leute, die freiwillig rausgehen, und zu denen gehöre ich nicht. | Benutzen: Mäntel |
| P0\_TREP\_MAX\_0145 | Max | Ich hab in eine Tasche gegriffen und ein Bonbon gefunden, ungefähr so alt wie ich. Ich leg es zurück, es wohnt hier. | Benutzen: Mäntel, zweites Mal |
| P0\_TREP\_MAX\_0150 | Max | Eine Deckenlampe mit drei toten Fliegen drin. Die liegen da so ordentlich, als wäre das eine Ausstellung. | Ansehen: Deckenlampe |
| P0\_TREP\_MAX\_0155 | Max | Ich hab noch mal gezählt, jetzt sind es vier. Eine ist neu. Die Lampe sammelt. | Ansehen: Deckenlampe, zweites Mal |
| P0\_TREP\_MAX\_0160 | Max | Da komm ich nicht ran. Und ehrlich gesagt will ich die Fliegen auch nicht stören. | Benutzen: Deckenlampe |
| P0\_TREP\_MAX\_0165 | Max | Ich hab kurz überlegt zu springen. Dann ist mir eingefallen, dass ich ein Sofa-Mensch bin und kein Sprung-Mensch. | Benutzen: Deckenlampe, zweites Mal |
| P0\_TREP\_MAX\_0170 | Max | Kisten unter der Treppe. Auf einer steht „Erfindungen, fertig“, und die ist komplett leer. | Ansehen: Kisten |
| P0\_TREP\_MAX\_0175 | Max | Auf der größten steht „Erfindungen, halb“. Die ist so voll, dass der Deckel nicht mehr zugeht. | Ansehen: Kisten, zweites Mal |
| P0\_TREP\_MAX\_0180 | Max | Ich mach keine auf. Was Opa unter die Treppe stellt, hat meistens einen guten Grund, da zu bleiben. | Benutzen: Kisten |
| P0\_TREP\_MAX\_0185 | Max | Ich hab gegen eine gestupst, und drinnen hat etwas „Hallo“ gesagt. Ich geh jetzt einfach ganz normal weiter. | Benutzen: Kisten, zweites Mal |

## 2. Dachboden: Opas Auftrag

Szene beim ersten Betreten. Opa steht vor dem Zapp-O-Mat, Pixel schläft auf dem Kabel.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_DACH\_OPA\_0010 | Opa | Max! Da bist du ja endlich! Die Menschheit steht am Abgrund, und du kommst in Socken! | Finger erhoben |
| P0\_DACH\_MAX\_0020 | Max | Hi, Opa. Ich bin wegen des Passworts hier, nur damit das von Anfang an klar ist. |  |
| P0\_DACH\_OPA\_0030 | Opa | Passwörter sind was für Leute, die eine Zukunft haben. Und so, wie es gerade aussieht, haben wir vielleicht keine mehr. | dramatisch |
| P0\_DACH\_OPA\_0040 | Opa | Darf ich vorstellen: der Zapp-O-Mat 3000! Jeder Kanal ist eine eigene Welt. Einmal drehen, und du bist drüben. | zeigt auf den Fernseher |
| P0\_DACH\_MAX\_0050 | Max | Opa. Das ist ein Fernseher. |  |
| P0\_DACH\_OPA\_0060 | Opa | Das ist ein Fernseher, durch den man durchgehen kann. Zu einem Flugzeug sagst du ja auch nicht Bus. |  |
| P0\_DACH\_OPA\_0070 | Opa | Ich brauche vier Dinge. Erstens ein Drachenei. Zweitens einen goldenen Sack Pharaonenkorn. | zählt an den Fingern |
| P0\_DACH\_OPA\_0080 | Opa | Drittens eine ewige Energiezelle. Und viertens die Goldene Fernbedienung. Genau in der Reihenfolge. |  |
| P0\_DACH\_MAX\_0085 | Max | Und wofür genau braucht man das alles zusammen? |  |
| P0\_DACH\_OPA\_0090 | Opa | Damit heute Abend nicht die Welt untergeht. Zumindest nicht meine. | leiser, Blick zum Kalender |
| P0\_DACH\_MAX\_0100 | Max | Das klingt nach einer Serie, die nach der dritten Staffel hätte aufhören sollen. |  |
| P0\_DACH\_OPA\_0110 | Opa | Vier Dinge, dann kriegst du das Passwort. Ehrenwort eines Wissenschaftlers. Ich unterschreib's dir auch. |  |
| P0\_DACH\_MAX\_0120 | Max | Gegenvorschlag: Für jedes Ding krieg ich ein Viertel vom Passwort. Fair, motivierend, modern. |  |
| P0\_DACH\_OPA\_0130 | Opa | Gegenvorschlag: Du kriegst gar keins, wenn du weiter verhandelst. Fair, motivierend, großväterlich. |  |
| P0\_DACH\_OPA\_0140 | Opa | Ach, übrigens, hast du irgendwo meine Fernbedienung gesehen? Die normale, nicht die goldene. | beiläufig |
| P0\_DACH\_MAX\_0150 | Max | Nein. Seit wann ist die denn weg? |  |
| P0\_DACH\_OPA\_0155 | Opa | Seit heute Morgen. Oder seit Dienstag. Wenn man erfindet, vergeht die Zeit hier oben irgendwie anders. |  |
| P0\_DACH\_OPA\_0160 | Opa | Egal! Erst mal muss der Kater vom Kabel. Der Kater, Modell Pixel, Baujahr unbekannt. Er liegt auf meinem Strom. |  |

## 2b. Gespräche: Opa und Pixel

Reden mit Opa und Pixel auf dem Dachboden. Max stellt die Frage, die Antwort folgt als eigene Zeile; gelesene Optionen werden grau. Pixels Baum gilt ab P1. Die Frage nach dem roten Kreis (1362 bis 1366, gehört zu Rätsel P3) erscheint erst, wenn Max die Nahansicht Kalender gesehen hat, und verschwindet mit P3.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_1310 | Max | Was genau ist der Zapp-O-Mat? | Option Opa |
| P0\_DACH\_OPA\_1320 | Opa | Ein Fernseher, der nicht zeigt, sondern hinschickt. Und zurück holt dich der Werbeblock. Frag mich nicht, warum. | stolz, dann unsicher |
| P0\_DACH\_MAX\_1450 | Max | Und was ist, wenn der Werbeblock einfach nicht kommt? |  |
| P0\_DACH\_OPA\_1460 | Opa | Werbung kommt immer, Max. Das ist das Einzige im Fernsehen, auf das man sich seit fünfzig Jahren verlassen kann. |  |
| P0\_DACH\_MAX\_1462 | Max | Das ist das Beruhigendste und gleichzeitig Traurigste, was du heute gesagt hast. |  |
| P0\_DACH\_MAX\_1322 | Max | Wie krieg ich Pixel vom Kabel? | Option Opa (bleibt); nur vor P1 (Hinweise zu P1 laut Spielsysteme, Wer hilft wann) |
| P0\_DACH\_OPA\_1324 | Opa | Mit Argumenten. Er versteht genau eins, und das liegt in meiner Werkzeugkiste. // Zwischen Schraubenzieher und Draht, wo auch sonst. | Hinweis P1, Stufe 1 (Thunfischdose); Kaskade |
| P0\_DACH\_OPA\_1326 | Opa | Und die Dose ist natürlich zu. Da hilft kein gutes Zureden, da hilft nur Kurbeln. | Hinweis P1, Stufe 2 (Dosenöffner); ersetzt 1324 beim nächsten Klick auf die Option, frühestens 30 Sekunden nach 1324 |
| P0\_DACH\_OPA\_1328 | Opa | Mach die Thunfischdose mit dem Dosenöffner auf. Dann ist er schneller wach, als du „Lachs“ sagen kannst. | Hinweis P1, Stufe 3; ersetzt 1326 beim nächsten Klick auf die Option, frühestens 60 Sekunden nach 1326; vorher wiederholt Opa die letzte Stufe |
| P0\_DACH\_MAX\_1330 | Max | Warum eigentlich ich? | Option Opa |
| P0\_DACH\_OPA\_1340 | Opa | Weil du der Einzige bist, der gerade nichts zu tun hat. Und weil ich dir vertraue. In genau der Reihenfolge. | zwinkert |
| P0\_DACH\_MAX\_1470 | Max | Danke. Glaube ich zumindest. |  |
| P0\_DACH\_OPA\_1480 | Opa | Gern geschehen. Und guck nicht so. Wer nichts zu tun hat, bringt die allerbesten Voraussetzungen fürs Weltenretten mit. |  |
| P0\_DACH\_MAX\_1350 | Max | Was ist drüben gefährlich? | Option Opa (bleibt) |
| P0\_DACH\_OPA\_1360 | Opa | Alles, was du anfasst, ohne es dir vorher anzusehen. Ansehen kostet nichts, Junge. Anfassen manchmal die Augenbrauen. | Hinweis auf den Rechtsklick |
| P0\_DACH\_MAX\_1362 | Max | Opa, was hat es mit dem roten Kreis auf sich? | Option Opa (bleibt); nach der Nahansicht Kalender, nur vor P3 |
| P0\_DACH\_OPA\_1364 | Opa | Der Kreis? Ach, der. Das ist … ein Kreis. Kreise sind wichtig. Sie sind rund. Ja. Genau. | weicht aus, schaut weg |
| P0\_DACH\_PIX\_1366 | Pixel | Er lügt, und ich rieche es. Lügen riechen bei Menschen immer ein wenig nach Angst. // Bei deinem Großvater riecht die Lüge außerdem nach Kuchen. Das ist neu, und ich finde es interessant. | Hinweis auf Omas Geburtstag, Kaskade |
| P0\_DACH\_MAX\_1370 | Max | Ich muss noch was anderes machen. | Option Opa, beendet das Gespräch |
| P0\_DACH\_OPA\_1380 | Opa | Dann mach. Der Fernseher läuft nicht weg. Hoffe ich jedenfalls. | sieht den Zapp-O-Mat prüfend an |
| P0\_DACH\_MAX\_1390 | Max | Kommst du mit? | Option Pixel; nach P1 |
| P0\_DACH\_PIX\_1400 | Pixel | Ich komme nirgendwo mit, junger Mann. Ich werde mitgenommen, und zwar, wenn möglich, getragen. // Das ist ein feiner, aber bedeutender Unterschied, und er hat mit Würde zu tun. | Kaskade |
| P0\_DACH\_MAX\_1402 | Max | Also ja. |  |
| P0\_DACH\_PIX\_1404 | Pixel | Also ja. Aber ich möchte festhalten, dass ich es unter Protest tue. |  |
| P0\_DACH\_MAX\_1410 | Max | Was weißt du über Opas Erfindungen? | Option Pixel (bleibt); nach P1 |
| P0\_DACH\_PIX\_1420 | Pixel | Ich habe sie alle beschlafen, eine nach der anderen, und kann dir daher Folgendes sagen: // Alle halten wunderbar warm. Keine einzige funktioniert. Und eine davon fliegt. | Hinweis auf den Toaster, Kaskade |
| P0\_DACH\_MAX\_1490 | Max | Welche fliegt? |  |
| P0\_DACH\_PIX\_1500 | Pixel | Der Toaster dort drüben. Er steht da und tut, als wäre er bloß ein Toaster. // Glaub ihm kein Wort. Ich habe ihn einmal fliegen sehen, und seitdem frühstücke ich nicht mehr in seiner Nähe. |  |
| P0\_DACH\_MAX\_1430 | Max | Schlaf ruhig weiter. | Option Pixel, beendet das Gespräch |
| P0\_DACH\_PIX\_1440 | Pixel | Endlich ein vernünftiger Vorschlag. Der erste heute, wenn ich das anmerken darf. | rollt sich ein |

## 3. Rätsel P1: Der schlafende Kater

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_0210 | Max | Pixel liegt auf dem Stromkabel. Er hat sich zielsicher den wärmsten Platz im ganzen Haus ausgesucht. Respekt. | Ansehen: Pixel; vor P1 |
| P0\_DACH\_MAX\_0212 | Max | Pixel sitzt auf der Werkbank und verdaut. Er macht das mit erstaunlich viel Würde. | Ansehen: Pixel; nach P1 |
| P0\_DACH\_MAX\_0213 | Max | Er schnurrt im Schlaf. Oder er knurrt. Bei Pixel hab ich den Unterschied noch nie gehört. | Ansehen: Pixel, zweites Mal; vor P1 |
| P0\_DACH\_PIX\_0215 | Pixel | Wenn du mich noch einmal so ansiehst, fange ich an zu schnurren. // Und damit das klar ist: Das wäre keine Freundlichkeit, sondern eine förmliche Warnung. | Ansehen: Pixel, zweites Mal; nach P1 |
| P0\_DACH\_MAX\_0220 | Max | Ich krieg ihn nicht hoch. Er wiegt ungefähr so viel wie ein voller Umzugskarton, und er hält sich am Kabel fest. | Benutzen: Pixel |
| P0\_DACH\_OPA\_0230 | Opa | Den kriegst du so nicht weg. Der Kater schläft wie ein Stein. Wie ein sehr beleidigter Stein. | nach zwei Versuchen |
| P0\_DACH\_MAX\_0240 | Max | Opas Werkzeugkiste: Schraubenzieher, Draht und Thunfisch. Opa hat ein ganz eigenes System. | Ansehen: Werkzeugkiste |
| P0\_DACH\_MAX\_0245 | Max | Unter dem Draht liegt ein Zettel: „Werkzeug für Notfälle. Und für Pixel.“ Ich glaube, das meint dasselbe. | Ansehen: Werkzeugkiste, zweites Mal |
| P0\_DACH\_MAX\_0250 | Max | Eine Dose Thunfisch. Notproviant. Opa denkt wirklich an alles, nur ans WLAN nicht. | Nehmen: Thunfischdose |
| P0\_DACH\_MAX\_0260 | Max | Ein Dosenöffner zum Kurbeln. Das ist Küche, wie sie vor dem Strom funktioniert hat. | Nehmen: Dosenöffner |
| P0\_DACH\_MAX\_0270 | Max | Die Dose ist zu, und ich hab ehrlich keine Lust, sie mit den Zähnen aufzumachen. | Thunfischdose auf Pixel (noch zu) |
| P0\_DACH\_MAX\_0280 | Max | Und … Zisch. | Dosenöffner mit Thunfischdose |
| P0\_DACH\_NAR\_0290 | – | Pixel hebt die Nase. Ein Auge geht auf. Dann das zweite. | Szene, ohne Text, nur Animation |
| P0\_DACH\_OPA\_0300 | Opa | Ah, er lebt! Warte, ich schalte ihm den Lautsprecher ein. | drückt aufs Halsband |
| P0\_DACH\_PIX\_0310 | Pixel | Wer. Hat. Mich. Geweckt. | Halsband leuchtet türkis |
| P0\_DACH\_PIX\_0320 | Pixel | Ich lag auf dem einzigen warmen Kabel dieses Dachbodens, einem Platz, den ich mir über Jahre erarbeitet habe. // Ich hatte einen Traum. Einen großen, schimmernden, rosafarbenen Traum. // Er handelte von Lachs, falls das hier irgendjemanden interessiert. Es sollte. |  |
| P0\_DACH\_MAX\_0330 | Max | Moment mal. Der redet? |  |
| P0\_DACH\_PIX\_0340 | Pixel | Der redet seit Jahren, junger Mann. Es hat ihm bisher bloß niemand zugehört, und das trage ich keinem nach. Fast keinem. // Aber genug von mir. Ist das Thunfisch in Lake oder in Öl? |  |
| P0\_DACH\_MAX\_0350 | Max | In Lake. Steht drauf. |  |
| P0\_DACH\_PIX\_0360 | Pixel | In Lake. Natürlich. Man serviert einem Kater meines Ranges Fisch in Salzwasser, als wäre er ein gewöhnlicher Hafenkater. // Barbarisch. Gib trotzdem her. | frisst, wechselt vom Kabel auf die Werkbank |
| P0\_DACH\_OPA\_0370 | Opa | Er ist wach! Wunderbar. Pixel kommt mit dir, Max. Er kennt die Welten, und er kennt alle Antworten. | schaltet nebenbei den Zapp-O-Mat ein, der Bildschirm rauscht |
| P0\_DACH\_PIX\_0380 | Pixel | Ich kenne tatsächlich alle Antworten. Ich gebe sie nur ungern heraus, denn Wissen sollte man, genau wie Thunfisch, nicht verschwenden. // Wer also festhängt, darf meine Pfote drücken. Höflich, bitte. Und nicht zu oft. | Hilfe-Pfote leuchtet zum ersten Mal auf, Kaskade |
| P0\_DACH\_MAX\_0390 | Max | Ein Kater mit eingebauter Hilfefunktion. Ich hab schon Schlimmeres heruntergeladen. |  |

## 4. Rätsel P2: Nur Rauschen

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_0400 | Max | Der Zapp-O-Mat ist aus. Solange Pixel auf dem Kabel liegt, traut sich Opa nicht, ihn einzuschalten. | Ansehen: Zapp-O-Mat; vor P1 |
| P0\_DACH\_MAX\_0405 | Max | Der Bildschirm ist schwarz, und ich sehe mein Spiegelbild. Es sieht genauso gelangweilt aus wie ich. Wenigstens sind wir uns einig. | Ansehen: Zapp-O-Mat, zweites Mal; vor P1 |
| P0\_DACH\_MAX\_0410 | Max | Er ist an, aber er zeigt nichts. Es sieht aus, als hätte ein Ladebildschirm irgendwann einfach aufgegeben. | Ansehen: Zapp-O-Mat (rauschend); nach P1 |
| P0\_DACH\_MAX\_0415 | Max | Ohne Antenne gibt's nur Schnee. Opa sagt was von „Modell Kleiderbügel“. Ich hoffe sehr, das war bildlich gemeint. | Ansehen: Zapp-O-Mat (rauschend), zweites Mal; nach P1 |
| P0\_DACH\_PIX\_0420 | Pixel | Das nennt man Schnee, junger Mann. Früher, als das Fernsehen noch Anstand hatte, war nachts irgendwann Sendeschluss. // Dann kam das Rauschen, und anständige Leute gingen schlafen. Ich habe stattdessen zugesehen. Stundenlang. |  |
| P0\_DACH\_MAX\_0430 | Max | Moment. Das Programm war einfach … vorbei? Und dann kam nichts mehr? Mit Absicht? |  |
| P0\_DACH\_OPA\_0440 | Opa | Die Antenne fehlt! Mein Empfangsorgan, Modell Kleiderbügel. Ich hab sie verliehen. Oder irgendwo eingebaut. Eins von beiden. |  |
| P0\_DACH\_MAX\_0450 | Max | Opas Kleiderschrank. Drei Strickjacken, alle braun, und in allen Taschen steckt Werkzeug. | Ansehen: Kleiderschrank |
| P0\_DACH\_MAX\_0455 | Max | Ganz hinten hängt noch eine vierte, eine grüne. Die trägt er nur zu besonderen Anlässen, und bisher gab es keinen. | Ansehen: Kleiderschrank, zweites Mal |
| P0\_DACH\_MAX\_0460 | Max | Ein Kleiderbügel aus Draht, ganz ohne Hemd. Er sieht ein bisschen traurig aus. | Nehmen: Drahtkleiderbügel |
| P0\_DACH\_MAX\_0470 | Max | Wenn ich den hier knicke und da biege … Jetzt sieht er aus wie ein Hase, der Empfang hat. Das ist vielversprechend. | Ungebogener Bügel auf Zapp-O-Mat nach P1 (Max biegt ihn, dann folgt 0480 direkt); optional auch beim Anwenden des Bügels auf sich selbst im Inventar |
| P0\_DACH\_MAX\_0480 | Max | So. Eine Antenne. Ab sofort bin ich offiziell Techniker. | Antenne auf Zapp-O-Mat; nach P1, löst P2 |
| P0\_DACH\_PIX\_0490 | Pixel | Früher war das ein ehrbarer Beruf. Techniker kamen mit Koffer und Krawatte ins Haus, und man bot ihnen Kekse an. // Ich biete dir nichts an. Nur damit du Bescheid weißt. |  |
| P0\_DACH\_OPA\_0500 | Opa | Das Bild ist da! Jetzt brauchen wir bloß noch den richtigen Kanal. Welcher war das noch gleich? | Rauschen wird bunter |

## 5. Rätsel P3: Der richtige Kanal

Opas Ausrede zum roten Kreis (1362 bis 1366) steht als Option im Gesprächsbaum, Abschnitt 2b.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_OPA\_0610 | Opa | Ich hab ihn mir aufgeschrieben, ganz bestimmt. Irgendwo, wo ich jeden Tag hingucke. | nach P2 |
| P0\_DACH\_MAX\_0620 | Max | Ein Kalender, und ein Tag ist dick rot eingekreist. Entweder ein Geburtstag oder ein Zahnarzttermin. Bei beiden würde Opa so gucken. | Ansehen: Kalender |
| P0\_DACH\_MAX\_0630 | Max | Und daneben, ganz klein mit Bleistift: „K3 – Schwurbelstein“. | Ansehen: Kalender, zweites Mal; öffnet die Nahansicht Kalender, Max kennt ab jetzt die Nummer |
| P0\_DACH\_MAX\_0670 | Max | Kanal 3. Da wären wir. | Benutzen: Drehknopf; nach P2 und nach 0630, löst P3 |
| P0\_DACH\_MAX\_0680 | Max | Kanal 4. Das ist ein Testbild, und es ist das Langweiligste, was ich heute gesehen hab. Und ich hab Opas Zeitung gesehen. | Benutzen: Drehknopf nach P2, bevor Max die Nummer kennt (Testbild Kanal 4) |
| P0\_DACH\_OPA\_0690 | Opa | Halt! Halt, halt! Erst die Tasche! | Bildschirm zeigt den Wirbel |

## 6. Die Reisetasche

Kurze Szene, führt die Reisetasche ein. Im Prolog gibt es nur das Pflichtfach; die Wahlfächer öffnen sich ab der Rückkehr aus Welt 1.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| P0\_DACH\_OPA\_0810 | Opa | Meine Reisetasche. Notizbuch und Thunfisch reisen immer mit, das ist das Pflichtfach. Alles andere entscheidest du. | reicht die Tasche |
| P0\_DACH\_PIX\_0820 | Pixel | Der Thunfisch ist die erste vernünftige Entscheidung, die heute in diesem Haus getroffen wurde. // Ich möchte das ausdrücklich loben. |  |
| P0\_DACH\_OPA\_0830 | Opa | Und das hier liest du erst, wenn du drüben bist. Versprochen? | steckt einen Zettel ein |
| P0\_DACH\_MAX\_0840 | Max | Ein Zettel, den ich nicht lesen darf. Opa, das ist der fieseste Spoiler, den es gibt. | Ansehen: Opas Zettel |
| P0\_DACH\_MAX\_0842 | Max | Ich halte ihn gegen das Licht, aber ich sehe bloß Opas Daumenabdruck. Den hätte ich auch so erkannt. | Ansehen: Opas Zettel, zweites Mal |
| P0\_DACH\_OPA\_0845 | Opa | Drüben vergeht die Zeit anders als hier. Hier vergeht sie normal. Also beeil dich trotzdem. | ernst, dann grinst er |
| P0\_DACH\_PIX\_0850 | Pixel | Ich möchte zu Protokoll geben, dass ich Reisen hasse. // Zeitreisen hasse ich noch mehr, weil man danach nie weiß, wann es Frühstück gibt. // Und Fernsehreisen hasse ich, glaube ich, am allermeisten. Ich habe nur noch keine gemacht. |  |
| P0\_DACH\_OPA\_0860 | Opa | Viel Glück! Und bring das Ei heil zurück! Und lies den Zettel erst drüben, hörst du? | Max berührt den Bildschirm |
| P0\_DACH\_MAX\_0870 | Max | Moment, hab ich jetzt eigentlich zugestimmt? Ich glaub nicht, dass ich zugestimmt hab – | wird eingesaugt |
| P0\_DACH\_PIX\_0880 | Pixel | Miiiaaau! | hinterher; Lautsprecher: „Übersetzung nicht verfügbar“ |

## 7. Nur zum Ansehen auf dem Dachboden

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_0910 | Max | Ein ausgestopfter Fisch, und auf dem Schild darunter steht „Testpilot“. Ich will die Geschichte dazu gar nicht hören. | Ansehen: Ausgestopfter Fisch |
| P0\_DACH\_MAX\_0915 | Max | Er trägt einen winzigen Schnorchel. Opa hat wirklich an alles gedacht, bloß nicht daran, was der Fisch davon hält. | Ansehen: Ausgestopfter Fisch, zweites Mal |
| P0\_DACH\_PIX\_0920 | Pixel | Siebzehn Fernbedienungen liegen in dieser Kiste, junger Mann. Siebzehn. // Und wie es das Schicksal so will, ist die eine, die man braucht, nie darunter. | Ansehen: Kiste mit Fernbedienungen; nach P1 |
| P0\_DACH\_PIX\_0925 | Pixel | Ich habe nachgezählt, es sind immer noch siebzehn. Eine fehlt, und ich weiß sehr genau, welche. // Ich sage es nur nicht, denn ich bin ein Kater und kein Fundbüro. | Ansehen: Kiste mit Fernbedienungen, zweites Mal; nach P1 |
| P0\_DACH\_MAX\_0930 | Max | Ein Poster mit einer Pyramide und eins mit einer Neonstadt. Entweder hat Opa einen sehr breiten Geschmack, oder er hat Reisepläne. | Ansehen: Poster |
| P0\_DACH\_MAX\_0935 | Max | Am Rand hat Opa notiert: „Sonnencreme. Thunfisch. Max?“ Ich stehe also auf einer Packliste. Mit Fragezeichen. | Ansehen: Poster, zweites Mal |
| P0\_DACH\_MAX\_0940 | Max | Ein Toaster mit Propeller. Opa wollte das Frühstück ans Bett fliegen lassen. Es ist nie angekommen. | Ansehen: Toaster |
| P0\_DACH\_MAX\_0942 | Max | Am Propeller klebt noch ein Krümel. Der Toaster hat den Flug überlebt, der Toast leider nicht. | Ansehen: Toaster, zweites Mal |
| P0\_DACH\_PIX\_0945 | Pixel | Das ist der Staubsauger deines Großvaters. Er hat einmal mein Ohr angesaugt, ohne Vorwarnung und ohne sich danach zu entschuldigen. // Seitdem gilt zwischen uns eine klare Abmachung: Er bleibt aus, und ich bleibe weg. | Ansehen: Opas Staubsauger-Prototyp; nach P1 |
| P0\_DACH\_PIX\_0946 | Pixel | Er hat geblinzelt. Mit dem Schalter. Ich habe es genau gesehen. // Wir werden darüber nicht weiter sprechen, und du wirst ihn auch nicht anfassen. | Ansehen: Opas Staubsauger-Prototyp, zweites Mal; nach P1 |
| P0\_DACH\_PIX\_0950 | Pixel | Ein Eselsohr auf der Seite mit dem Schokoladenkuchen. Ein Kater merkt sich so etwas, weil es meistens mit Sahne zu tun hat. // Dein Großvater merkt es sich offenbar nicht, sonst bräuchte er kein Eselsohr. | Ansehen: Kochbuch; nach P1 |
| P0\_DACH\_PIX\_0955 | Pixel | Neben dem Schokoladenkuchen stehen ein Datum und ein Herz, mit Bleistift gemalt. // Und darunter, sehr klein und sehr zittrig: „Nicht wieder vergessen.“ Ich finde das rührend. Und verdächtig. | Ansehen: Kochbuch, zweites Mal; nach P1 |
| P0\_DACH\_MAX\_0960 | Max | Eine Platte: „Schlager für Erfinder, Folge 3“. Das heißt, irgendwo gibt es noch zwei, die schlimmer sind. | Ansehen: Plattenspieler |
| P0\_DACH\_MAX\_0965 | Max | Opa hat auf der Hülle ein Lied angekreuzt: „Mein Herz ist ein Lötkolben“. Ich hab jetzt schon Angst vor der Melodie. | Ansehen: Plattenspieler, zweites Mal |
| P0\_DACH\_MAX\_0970 | Max | Der Ohrensessel. Gefährlich bequem. Wenn ich mich da reinsetze, findet man mich erst beim nächsten Frühjahrsputz. | Ansehen: Ohrensessel |
| P0\_DACH\_MAX\_0975 | Max | In der Ritze steckt was Schwarzes mit Knöpfen. Kurz hab ich auf die Fernbedienung gehofft. Es ist ein Brillenetui. | Ansehen: Ohrensessel, zweites Mal |
| P0\_DACH\_MAX\_0980 | Max | Eine Werkbank voller halb fertiger Erfindungen. Das kommt mir aus meinem Hausaufgaben-Ordner bekannt vor. | Ansehen: Werkbank |
| P0\_DACH\_MAX\_0985 | Max | Eine halbe Zahnbürste mit Motor, ein halber Regenschirm mit Lampe. Opa erfindet immer nur die erste Hälfte. | Ansehen: Werkbank, zweites Mal |
| P0\_DACH\_MAX\_0990 | Max | Das Dachfenster. Draußen ist die Welt. Die wird, wenn ihr mich fragt, sowieso überbewertet. | Ansehen: Dachfenster |
| P0\_DACH\_MAX\_0995 | Max | Auf dem Glas sitzt eine Taube und guckt rein. Ich glaube, sie findet uns genauso komisch wie wir sie. | Ansehen: Dachfenster, zweites Mal |
| P0\_DACH\_MAX\_1000 | Max | Da geht's runter, zum Sofa. Nein. Konzentration, Max. Passwort. | Benutzen: Bodenluke; vor P3 |
| P0\_DACH\_MAX\_1005 | Max | Ich hatte mich schon an die Luke gekniet. Dann hab ich an das Passwort gedacht und bin wieder aufgestanden. | Benutzen: Bodenluke, zweites Mal; vor P3 |
| P0\_DACH\_MAX\_1010 | Max | Die Bodenluke. Da unten wartet das Sofa. Ich sehe es nicht, aber ich spüre, dass es an mich denkt. | Ansehen: Bodenluke |
| P0\_DACH\_MAX\_1015 | Max | Ich hab kurz runtergehorcht. Das Sofa schweigt. Ich glaube, es ist beleidigt, weil ich einfach gegangen bin. | Ansehen: Bodenluke, zweites Mal |

## 7b. Benutzen auf dem Dachboden

Linksklick auf Deko-Objekte: eigene Zeilen statt Ersatzzeilen, ohne Fehler-Jingle. Beim zweiten Klick die „zweites Mal“-Zeile, danach abwechselnd eine von beiden (Spiel.benutzen). Gelten auch in den Zwischenspielen, solange dort nichts Eigenes steht.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_1610 | Max | Ich wühl nicht in Opas Werkzeug. Da drin beißt garantiert irgendwas. | Benutzen: Werkzeugkiste |
| P0\_DACH\_MAX\_1615 | Max | Ich hab den Deckel angehoben, und ein Maßband hat nach mir geschnappt. Der Deckel ist wieder zu. | Benutzen: Werkzeugkiste, zweites Mal |
| P0\_DACH\_MAX\_1620 | Max | Ich zieh keine von Opas Strickjacken an. Ich hab noch einen Ruf zu verlieren, auch wenn er klein ist. | Benutzen: Kleiderschrank |
| P0\_DACH\_MAX\_1625 | Max | Ich hab die grüne Strickjacke angefasst. Sie ist viel weicher, als sie aussieht. Das erzähl ich niemandem. | Benutzen: Kleiderschrank, zweites Mal |
| P0\_DACH\_MAX\_1630 | Max | Ich blätter nicht weiter. Ich will nicht wissen, was Opa im Dezember vorhat. | Benutzen: Kalender |
| P0\_DACH\_MAX\_1635 | Max | Okay, ich hab doch geblättert. Im Dezember steht bloß „Pixel: Lachs“. Immerhin plant hier jemand voraus. | Benutzen: Kalender, zweites Mal |
| P0\_DACH\_MAX\_1640 | Max | Ich fass ihn nicht an. Er guckt so vorwurfsvoll, als hätte ich ihn ausgestopft. | Benutzen: Ausgestopfter Fisch |
| P0\_DACH\_MAX\_1645 | Max | Ich hab ihn doch angetippt, und der Schnorchel ist abgefallen. Ich steck ihn ganz schnell wieder dran. | Benutzen: Ausgestopfter Fisch, zweites Mal |
| P0\_DACH\_MAX\_1650 | Max | Ich drück auf allen rum. Irgendwo in der Nachbarschaft geht ein Garagentor auf. Wir haben keine Garage. | Benutzen: Kiste mit Fernbedienungen |
| P0\_DACH\_MAX\_1655 | Max | Noch mal gedrückt, und im Haus gegenüber geht das Licht aus. Ich hör jetzt besser auf. | Benutzen: Kiste mit Fernbedienungen, zweites Mal |
| P0\_DACH\_MAX\_1660 | Max | Ich lass das Poster hängen. Die Kreuze darauf hat Opa gemacht, und die sollen bleiben, wo sie sind. | Benutzen: Poster |
| P0\_DACH\_MAX\_1665 | Max | Ich hab die Ecke wieder festgedrückt. Das ist bis jetzt mein größter Beitrag zur Rettung der Welt. | Benutzen: Poster, zweites Mal |
| P0\_DACH\_MAX\_1670 | Max | Ich steck da kein Brot rein. Ich will nicht schuld sein, wenn er abhebt. | Benutzen: Toaster |
| P0\_DACH\_MAX\_1675 | Max | Ich hab den Hebel nur angetippt, und der Propeller hat sich einmal gedreht. Ich glaube, er hat mich gesehen. | Benutzen: Toaster, zweites Mal |
| P0\_DACH\_MAX\_1680 | Max | Ich schalte den nicht ein. Pixel würde mir das bis an sein Lebensende vorhalten. | Benutzen: Opas Staubsauger-Prototyp |
| P0\_DACH\_MAX\_1685 | Max | Ich hab den Schalter angeguckt, und irgendwie hat er zurückgeguckt. Ich lass ihn in Ruhe. | Benutzen: Opas Staubsauger-Prototyp, zweites Mal |
| P0\_DACH\_MAX\_1690 | Max | Ich koche nicht, ich bestelle. Das ist auch eine Kunst, sie wird bloß nicht anerkannt. | Benutzen: Kochbuch |
| P0\_DACH\_MAX\_1695 | Max | Ich hab doch reingeschaut. Die Seite mit dem Schokokuchen ist voller Fettflecken und kleiner Herzchen. | Benutzen: Kochbuch, zweites Mal |
| P0\_DACH\_MAX\_1700 | Max | Ich leg die nicht auf. „Schlager für Erfinder“ ist mir Warnung genug. | Benutzen: Plattenspieler |
| P0\_DACH\_MAX\_1705 | Max | Ich hab die Nadel angefasst, und ein einziger Ton kam raus. Der war schon einer zu viel. | Benutzen: Plattenspieler, zweites Mal |
| P0\_DACH\_MAX\_1710 | Max | Ich setz mich da nicht rein. Ich kenne meine Schwächen, und dieser Sessel ist eine davon. | Benutzen: Ohrensessel |
| P0\_DACH\_MAX\_1715 | Max | Ich hab mich nur auf die Lehne gesetzt, und trotzdem zieht der Sessel an mir. Ich bleib lieber stehen. | Benutzen: Ohrensessel, zweites Mal |
| P0\_DACH\_MAX\_1720 | Max | Ich bau hier nichts fertig. Das ist Opas Prinzip, und das respektiere ich. | Benutzen: Werkbank |
| P0\_DACH\_MAX\_1725 | Max | Ich hab eine Schraube angezogen, und hinten ist was umgefallen. Das war bestimmt Zufall. | Benutzen: Werkbank, zweites Mal |
| P0\_DACH\_MAX\_1730 | Max | Da komm ich nicht ran. Und draußen ist sowieso nur Wetter. | Benutzen: Dachfenster |
| P0\_DACH\_MAX\_1735 | Max | Auf Zehenspitzen seh ich ein Stück Himmel. Keine Balken. Da oben gibt's also auch kein WLAN. | Benutzen: Dachfenster, zweites Mal |
| P0\_DACH\_MAX\_1740 | Max | Kein Strom. Pixel liegt auf dem Kabel und hält es warm, und zwar mit seinem ganzen Gewicht. | Benutzen: Zapp-O-Mat; vor P1 |
| P0\_DACH\_MAX\_1745 | Max | Ich hab gegen das Gehäuse geklopft. Pixel hat ein Auge aufgemacht und es wieder zugemacht. Er gewinnt. | Benutzen: Zapp-O-Mat, zweites Mal; vor P1 |
| P0\_DACH\_MAX\_1750 | Max | Ich klopf drauf. Opa schwört, dass das hilft. Es hilft nicht. | Benutzen: Zapp-O-Mat; nach P1 |
| P0\_DACH\_MAX\_1755 | Max | Noch mal geklopft. Opa nennt das Fernsehtechnik von früher. Pixel nennt es Gewalt. | Benutzen: Zapp-O-Mat, zweites Mal; nach P1 |

## 7c. Weitere Dinge auf dem Dachboden

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_1810 | Max | Kartons bis unters Dach, und auf allen steht „Später“. | Ansehen: Umzugskartons |
| P0\_DACH\_MAX\_1815 | Max | Auf dem untersten steht „Später, wirklich“. Der ist von 1979. | Ansehen: Umzugskartons, zweites Mal |
| P0\_DACH\_MAX\_1820 | Max | Ich räum hier nicht auf. Ich bin zu Besuch, und Besuch räumt nicht auf. Das ist praktisch ein Gesetz. | Benutzen: Umzugskartons |
| P0\_DACH\_MAX\_1825 | Max | Ich hab einen hochgehoben, und er war leer. Opa hebt leere Kartons auf, falls er mal Kartons braucht. | Benutzen: Umzugskartons, zweites Mal |
| P0\_DACH\_MAX\_1830 | Max | Eine Steckdose. Da hängt der ganze Zapp-O-Mat dran, also im Grunde auch die Rettung der Welt. | Ansehen: Steckdose |
| P0\_DACH\_MAX\_1835 | Max | Daneben hat Opa geschrieben: „230 Volt. Nicht lecken.“ Ich will nicht wissen, für wen das gedacht war. | Ansehen: Steckdose, zweites Mal |
| P0\_DACH\_MAX\_1840 | Max | Ich steck da nichts ein und nichts aus. Ich hab Respekt vor Strom, und noch mehr vor Opa. | Benutzen: Steckdose |
| P0\_DACH\_MAX\_1845 | Max | Ich halte die Hand davor, und es kribbelt. Oder ich bilde mir das ein. Für mich reicht beides. | Benutzen: Steckdose, zweites Mal |

## 8. Fehlversuche mit eigener Zeile

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_DACH\_MAX\_1110 | Max | Pixel will keinen Draht. Pixel will Fisch. Ich hab das Gefühl, Pixel will immer Fisch. | Kleiderbügel auf Pixel |
| P0\_DACH\_PIX\_1120 | Pixel | Steck mich bitte nicht in den Fernseher. Ich bin keine Antenne, ich bin ein Gesamtkunstwerk. // Antennen empfangen. Ich sende. Das ist ein grundlegender Unterschied. | Pixel-Feld der Inventarleiste auf Zapp-O-Mat; nach P1 |
| P0\_DACH\_MAX\_1130 | Max | Der Dosenöffner passt nicht in den Fernseher. Ich hab's ausprobiert, damit du es nicht musst. | Dosenöffner auf Zapp-O-Mat |
| P0\_DACH\_OPA\_1140 | Opa | Nicht am Knopf drehen, bevor das Bild da ist! Der Werbeblock ist für den Rückweg. // Fünf Sekunden Milchwerbung, und schon bist du wieder hier. Keiner weiß, warum. | Drehknopf vor P2 |
| P0\_DACH\_MAX\_1150 | Max | Erst Strom, dann Empfang. Und für Strom muss der Kater vom Kabel. | Drahtkleiderbügel oder Antenne auf Zapp-O-Mat vor P1 |

## 8b. Zurufe

Pixel und Opa kommentieren ungefragt, wenn der Spieler 45 Sekunden nichts tut. Zufällig gezogen, nie zweimal hintereinander.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_WOHN\_OPA\_1210 | Opa | Max! Bist du noch da, oder bist du schon eingeschlafen? | Wohnzimmer, aus dem Off; vor dem Dachboden |
| P0\_WOHN\_MAX\_1220 | Max | Ohne WLAN vergeht die Zeit langsamer. Ich bin ziemlich sicher, dass das Physik ist. | Wohnzimmer |
| P0\_DACH\_PIX\_1230 | Pixel | Ich würde ja helfen, wirklich. Aber ich bin gerade so vorbildlich liegen geblieben, // und es wäre eine Sünde, diese Haltung für etwas so Gewöhnliches wie Hilfe aufzugeben. | Dachboden; nach P1 |
| P0\_DACH\_PIX\_1240 | Pixel | Der Fernseher starrt dich an, und du starrst zurück. Ich kenne solche Duelle von der Fensterbank. // Einer von euch muss irgendwann nachgeben, und ich wette meinen Thunfisch, dass du es bist. | Dachboden; nach P1, vor P3 |

## 8c. Hinweise der Hilfe-Pfote (P0\_HINT)

Ab P1 gibt Pixel die Hinweise über die Pfote (P1 selbst über Opa, Abschnitt 2b). Schema wie in Welt 1: P0\_HINT\_PIX\_RRSK, RR Rätselnummer, S Stufe, K Teilschritt (0). Datei game/daten/hinweise/prolog.json. Stufe 3 bleibt eindeutig, darf aber in Pixels Ton verpackt sein.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_HINT\_PIX\_0210 | Pixel | Ein Fernseher ohne Antenne ist ungefähr so nützlich wie ein Napf ohne Futter. // Man kann ihn ansehen, man kann ihn bedauern, aber satt wird davon niemand. | P2, Stufe 1 |
| P0\_HINT\_PIX\_0220 | Pixel | Im Schrank deines Großvaters hängt allerlei gebogener Draht. Er nennt das Garderobe. // Ich nenne es Material. | P2, Stufe 2 |
| P0\_HINT\_PIX\_0230 | Pixel | Nimm den Kleiderbügel aus dem Schrank und steck ihn oben auf den Fernseher. // Ich würde es selbst tun, aber ich habe Pfoten und einen Ruf. | P2, Stufe 3 |
| P0\_HINT\_PIX\_0310 | Pixel | Dein Großvater schreibt sich alles irgendwohin, weil er sonst alles vergisst. // Meistens an die Wand, gelegentlich auf mich. | P3, Stufe 1 |
| P0\_HINT\_PIX\_0320 | Pixel | Sieh dir den Kalender genauer an, und zwar nicht nur den roten Kreis. // Der Kreis ist ein anderes Problem, und zwar seins. | P3, Stufe 2 |
| P0\_HINT\_PIX\_0330 | Pixel | Auf dem Kalender steht die Kanalnummer. Stell sie am Drehknopf ein. So einfach ist das, und trotzdem musste ich es sagen. | P3, Stufe 3 |
| P0\_HINT\_PIX\_0010 | Pixel | Es ist alles erledigt. Jetzt fehlt nur noch, dass du in den Fernseher steigst. // Ich warte so lange. Katzen sind hervorragend im Warten, wir haben es jahrhundertelang geübt. | nichts offen (nur nach P3, bis der Wirbel Max einsaugt) |
| P0\_HINT\_PIX\_9995 | Pixel | Ich denke noch nach. Von außen sieht das aus wie Schlafen, ich weiß. // Es ist trotzdem Denken, nur eben mit geschlossenen Augen und gelegentlichem Schnarchen. | Wartezeile, nächste Stufe noch gesperrt |

## 8d. Inventar ansehen (INV)

Rechtsklick auf einen Gegenstand in der Inventarleiste. Das Notizbuch öffnet sich beim Ansehen selbst und braucht keine Zeile; Opas Zettel hat seine Zeile schon in Abschnitt 6 (0840); lesen darf Max ihn erst drüben.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_INV\_MAX\_0010 | Max | Thunfisch. Soweit ich weiß, die einzige Währung, die Pixel akzeptiert. | Ansehen: Thunfischdose, zu |
| P0\_INV\_PIX\_0015 | Pixel | Ich rieche sie durch das Blech. Ich rieche sie durch deine Tasche. // Ich würde sie, wenn es darauf ankäme, vermutlich durch die Zeit riechen. | Ansehen: Thunfischdose, zu, zweites Mal |
| P0\_INV\_MAX\_0020 | Max | Leer. Pixel hat sie so blank geleckt, dass ich mich nicht traue, sie zu spülen. | Ansehen: Thunfischdose, leer |
| P0\_INV\_MAX\_0025 | Max | Ich hab reingeschaut und sehe mich im Boden spiegeln. Ich sehe hungrig aus. Pixel übrigens auch. | Ansehen: Thunfischdose, leer, zweites Mal |
| P0\_INV\_MAX\_0030 | Max | Ein Dosenöffner. Opa nennt ihn Notfallwerkzeug, Pixel betet ihn vermutlich an. | Ansehen: Dosenöffner |
| P0\_INV\_MAX\_0035 | Max | Eine Kurbel und ein Zahn. Opa sagt, mehr braucht man nicht im Leben. Opa hat außerdem einen Akkuschrauber. | Ansehen: Dosenöffner, zweites Mal |
| P0\_INV\_MAX\_0040 | Max | Ein Kleiderbügel ohne Hemd. Er sieht aus, als hätte er schon aufgegeben. | Ansehen: Drahtkleiderbügel, gerade |
| P0\_INV\_MAX\_0045 | Max | Ich bieg ihn ein bisschen, und er biegt sich zurück. Er hat noch seinen Stolz. | Ansehen: Drahtkleiderbügel, gerade, zweites Mal |
| P0\_INV\_MAX\_0050 | Max | Jetzt ist er eine Antenne. Oder moderne Kunst. Hauptsache, er hat Empfang. | Ansehen: Drahtkleiderbügel, antenne |
| P0\_INV\_MAX\_0055 | Max | Wenn ich ihn hochhalte, empfange ich vielleicht Radio, Außerirdische oder Opas Lieblingssender. Bei Opa ist das alles dasselbe. | Ansehen: Drahtkleiderbügel, antenne, zweites Mal |
| P0\_INV\_MAX\_0060 | Max | Opas Reisetasche. Riecht nach Leder, nach Abenteuer und, ganz leicht, nach Thunfisch. | Ansehen: Reisetasche |
| P0\_INV\_MAX\_0065 | Max | Innen klebt ein Zettel: „Max. Nicht verlieren.“ Ich weiß nicht genau, ob die Tasche gemeint ist oder ich. | Ansehen: Reisetasche, zweites Mal |

## 8e. Gespräch erschöpft (ABS)

Ein Klick auf die Figur, wenn im Gesprächsmenü nur noch „Tschüss“ übrig wäre: Das Menü öffnet sich nicht, die Figur sagt abwechselnd eine dieser beiden Zeilen. Kommt ein neues Thema dazu, öffnet sich das Menü wieder (Regel in `05-spielsysteme.md`).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| P0\_ABS\_OPA\_0010 | Opa | Junge, ich hab dir alles erklärt, was ich weiß. Jetzt muss ich weiterschrauben, die Zukunft schraubt sich nicht von allein. | Reden: Opa, Gespräch erschöpft |
| P0\_ABS\_OPA\_0020 | Opa | Später, Max. Ich hab gerade eine Idee, und sie ist schon halb fertig. Wie alle meine Ideen. | Reden: Opa, Gespräch erschöpft |

## 9. Ersatz-Zeilen (Auszug aus dem Pool)

Zufällig gezogen, wenn nichts Spezielles passt; gelten für das ganze Spiel. Max bleibt hier kurz, weil diese Zeilen oft kommen; Pixel darf ausholen.

| ID | Sprecher | Text |
| --- | --- | --- |
| SYS\_ERS\_MAX\_0010 | Max | Nein. |
| SYS\_ERS\_MAX\_0020 | Max | Das ergibt nicht mal in einer Serie Sinn, und da ergibt wenig Sinn. |
| SYS\_ERS\_MAX\_0030 | Max | Funktioniert nicht. Meine Motivation übrigens auch nicht. |
| SYS\_ERS\_MAX\_0040 | Max | Ich könnte. Aber warum sollte ich? |
| SYS\_ERS\_MAX\_0050 | Max | Netter Versuch, Max. Nein, eigentlich gar nicht. |
| SYS\_ERS\_MAX\_0060 | Max | Das lass ich lieber. Sonst steht's morgen in den Kommentaren. |
| SYS\_ERS\_PIX\_0110 | Pixel | Interessant. Nein, Moment, ich habe es mir genauer angesehen. // Doch nicht interessant. Entschuldige die Aufregung. |
| SYS\_ERS\_PIX\_0120 | Pixel | Ich bin, bei allem Respekt, viel zu wichtig für so etwas. // Frag mich wieder, wenn es um Fisch geht oder um ein Kissen. |
| SYS\_ERS\_PIX\_0130 | Pixel | Das ist weder essbar noch zum Draufschlafen geeignet. // Damit fällt es in die große Kategorie der Dinge, die mich nichts angehen. |
| SYS\_ERS\_PIX\_0140 | Pixel | Meine Pfoten sind für Größeres bestimmt. // Für Thunfisch zum Beispiel, oder für das gelegentliche Umwerfen einer Vase. |
| SYS\_ERS\_MAX\_0070 | Max | Das ist eine Idee. Keine gute, aber immerhin eine. |
| SYS\_ERS\_MAX\_0080 | Max | Hab ich mal in einer Serie gesehen. Die wurde danach abgesetzt. |
| SYS\_ERS\_MAX\_0090 | Max | Dafür gibt es bestimmt eine App. Nur hier halt nicht. |
| SYS\_ERS\_MAX\_0100 | Max | Ich glaub, das lade ich lieber nicht herunter. |
| SYS\_ERS\_MAX\_0110 | Max | Nö. Nächster Vorschlag, bitte. |
| SYS\_ERS\_MAX\_0120 | Max | Das wäre ein Cliffhanger, und zwar einer ohne Fortsetzung. |
| SYS\_ERS\_MAX\_0130 | Max | Opa würde jetzt sagen: Früher ging das. Bei Opa ging früher alles. |
| SYS\_ERS\_MAX\_0140 | Max | Lädt. Lädt immer noch. Ich nehm das als Nein. |
| SYS\_ERS\_MAX\_0150 | Max | Ich spür richtig, wie mein Akku sinkt. Also mein innerer. |
| SYS\_ERS\_MAX\_0160 | Max | Nicht mal mit Cheatcode. |
| SYS\_ERS\_MAX\_0170 | Max | Das passt so wenig zusammen wie Pixel und Höflichkeit. |
| SYS\_ERS\_MAX\_0180 | Max | Das überspring ich. So wie jedes Intro. |
| SYS\_ERS\_MAX\_0190 | Max | Dafür bin ich nicht ausgeschlafen genug. Ich bin selten ausgeschlafen genug. |
| SYS\_ERS\_MAX\_0200 | Max | Das steht in keiner Komplettlösung, und das hat bestimmt einen Grund. |
| SYS\_ERS\_MAX\_0210 | Max | Hm. Nein. Hm. Immer noch nein. |
| SYS\_ERS\_MAX\_0220 | Max | Das wäre eine Folge, die sich niemand zweimal anguckt. |
| SYS\_ERS\_MAX\_0230 | Max | Ich lass die Finger davon. Zumindest die meisten. |
| SYS\_ERS\_MAX\_0240 | Max | Mein Handy hätte das gewusst. Wenn es Empfang hätte. |
| SYS\_ERS\_MAX\_0250 | Max | Fast. Also, ehrlich gesagt, gar nicht. |
| SYS\_ERS\_PIX\_0150 | Pixel | Versuch es mit Thunfisch. Ich sage das nicht aus Eigennutz, // sondern weil die Erfahrung lehrt, dass sich fast jedes Problem mit Thunfisch lösen lässt. |
| SYS\_ERS\_PIX\_0160 | Pixel | Ich habe das gesehen, und ich werde es nie wieder vergessen können. // Das ist kein Kompliment. |
| SYS\_ERS\_PIX\_0170 | Pixel | Nein. Und ich sage das als jemand, der seit Jahren beruflich Nein sagt. |
| SYS\_ERS\_PIX\_0180 | Pixel | Darauf kann man nicht schlafen. Ich habe es nicht ausprobiert, aber ich sehe so etwas. // Und was man nicht beschlafen kann, hat in meinen Augen keinen Zweck. |
| SYS\_ERS\_PIX\_0190 | Pixel | Ich kannte einmal eine Katze, die genau das versucht hat. // Sie spricht bis heute nicht darüber, und wir respektieren das alle. |
| SYS\_ERS\_PIX\_0200 | Pixel | Das riecht nach einem Fehler. Und bevor du fragst: Ja, Fehler haben einen Geruch, // und meine Nase gehört zu den besten dieses Landkreises. |
| SYS\_ERS\_PIX\_0210 | Pixel | Ich könnte dir helfen. Ich könnte aber auch schlafen. // Du darfst raten, wofür ich mich entscheide. Ein Tipp: Es hat mit Augenzumachen zu tun. |
| SYS\_ERS\_PIX\_0220 | Pixel | In meiner Jugend hat man so etwas einfach vom Tisch gestoßen. // Das war keine Lösung, aber es hat ungemein entspannt. |
| SYS\_ERS\_PIX\_0230 | Pixel | Meine Vorfahren wurden am Nil als Götter verehrt. // Ich glaube kaum, dass sie dafür so etwas getan haben. |
| SYS\_ERS\_PIX\_0240 | Pixel | Ich bin ein Kater, kein Schraubenzieher. Diese Verwechslung passiert in diesem Haus erstaunlich oft. |
| SYS\_ERS\_PIX\_0250 | Pixel | Das ist eine Frage für Menschen. Ich bin, um ehrlich zu sein, nur wegen des Fisches dabei. |
| SYS\_ERS\_PIX\_0260 | Pixel | Miau. Das war übrigens ein Nein. Ein höfliches, aber ein sehr bestimmtes. |
| SYS\_ERS\_PIX\_0270 | Pixel | Dafür müsste ich aufstehen, mich strecken und meine Haltung aufgeben. // Also nein. |
| SYS\_ERS\_PIX\_0280 | Pixel | Ich fühle mich davon nicht angesprochen. Ich fühle mich grundsätzlich selten angesprochen, // es sei denn, jemand öffnet eine Dose. |
| SYS\_ERS\_PIX\_0290 | Pixel | Sehr kreativ. Und, wenn ich das hinzufügen darf, sehr, sehr falsch. |
| SYS\_ERS\_PIX\_0300 | Pixel | Wenn das klappt, fresse ich einen Besen. // Du kannst beruhigt sein, der Besen ist nicht in Gefahr. |
| SYS\_ERS\_PIX\_0310 | Pixel | Das funktioniert nur in Filmen, junger Mann. // Und selbst in Filmen würde man es mich machen lassen, weil ich besser aussehe. |
| SYS\_ERS\_PIX\_0320 | Pixel | Ich hatte einmal einen Traum, in dem genau das funktioniert hat. // Ich bin schreiend aufgewacht und habe danach zwei Stunden lang meine Pfote geleckt. |
| SYS\_ERS\_PIX\_0330 | Pixel | Das liegt weit unter meinem Niveau. Mein Niveau liegt, grob gesagt, auf Höhe der Futterdosen. |
| SYS\_ERS\_PIX\_0340 | Pixel | Ich rate selten von etwas ab, weil ich mich selten genug interessiere. // Jetzt rate ich ab. Mit Nachdruck. |
| SYS\_ERS\_PIX\_0350 | Pixel | Nein. Aber ich muss sagen, es war hübsch anzusehen, wie du es versucht hast. |

## 9b. Wiederholungs-Pool fürs Ansehen (WDH)

Ab dem dritten Ansehen desselben Objekts im selben Zustand zufällig gezogen, nie zweimal dieselbe hintereinander; es spricht, wer die erste Zeile gesprochen hat (Regel in `05-spielsysteme.md`). Gilt für das ganze Spiel.

| ID | Sprecher | Text |
| --- | --- | --- |
| SYS\_WDH\_MAX\_0010 | Max | Hab ich mir schon angesehen. Es hat sich nicht verändert, und ich mich auch nicht. |
| SYS\_WDH\_MAX\_0020 | Max | Immer noch da. Sehr zuverlässig, auf jeden Fall zuverlässiger als mein WLAN. |
| SYS\_WDH\_MAX\_0030 | Max | Wenn ich das noch länger anstarre, starrt es irgendwann zurück. |
| SYS\_WDH\_MAX\_0040 | Max | Neue Folge, gleiche Handlung. |
| SYS\_WDH\_MAX\_0050 | Max | Das kenne ich inzwischen besser als meine Hausaufgaben. Was zugegeben nicht schwer ist. |
| SYS\_WDH\_MAX\_0060 | Max | Spoiler: Es ist immer noch dasselbe. |
| SYS\_WDH\_MAX\_0070 | Max | Ich könnte das jetzt aus dem Kopf malen. Schlecht, aber aus dem Kopf. |
| SYS\_WDH\_MAX\_0080 | Max | Opa sagt, beim dritten Hinsehen entdeckt man was Neues. Opa sagt viel, wenn der Tag lang ist. |
| SYS\_WDH\_MAX\_0090 | Max | Nichts Neues. Das ist die Wiederholung vom Sonntagnachmittag. |
| SYS\_WDH\_MAX\_0100 | Max | Ich guck es mir noch mal an. Nur für die Statistik. |
| SYS\_WDH\_MAX\_0110 | Max | Ich glaube, wir zwei haben uns alles gesagt. |
| SYS\_WDH\_MAX\_0120 | Max | Hier gibt's nichts mehr zu entdecken, außer vielleicht meiner Ungeduld. |
| SYS\_WDH\_MAX\_0130 | Max | Wenn ich noch öfter hingucke, muss ich dem Ding einen Namen geben. |
| SYS\_WDH\_MAX\_0140 | Max | Gesehen, verstanden, abgehakt. Na ja, fast. |
| SYS\_WDH\_MAX\_0150 | Max | Ich hab mir das gemerkt, ehrlich. Ich guck nur, ob es sich auch gemerkt hat, dass ich es mir gemerkt hab. |
| SYS\_WDH\_MAX\_0160 | Max | Das Einzige, was sich hier verändert hat, ist meine Geduld. |
| SYS\_WDH\_MAX\_0170 | Max | Wenn es wenigstens blinken würde. Dann wüsste ich, dass es mich mag. |
| SYS\_WDH\_MAX\_0180 | Max | Ich klick noch mal drauf. Das Universum klickt nicht zurück. |
| SYS\_WDH\_MAX\_0190 | Max | Manche Dinge muss man dreimal ansehen. Das hier gehört nicht dazu. |
| SYS\_WDH\_MAX\_0200 | Max | Okay. Ich hab's. Ich hab's wirklich. |
| SYS\_WDH\_PIX\_0010 | Pixel | Du hast es dir jetzt dreimal angesehen. Ich zähle mit, // weil ich sonst, wie du vielleicht bemerkt hast, nichts zu tun habe. |
| SYS\_WDH\_PIX\_0020 | Pixel | Es ist immer noch langweilig. Das ist übrigens keine Meinung, sondern ein Messergebnis. |
| SYS\_WDH\_PIX\_0030 | Pixel | Wenn du es noch einmal ansiehst, schlafe ich ein. // Nicht aus Müdigkeit, sondern als stiller, aber deutlicher Protest. |
| SYS\_WDH\_PIX\_0040 | Pixel | Ich habe es mir angesehen, und es hat nicht geschnurrt. Für mich ist der Fall damit erledigt. |
| SYS\_WDH\_PIX\_0050 | Pixel | Unverändert. Genau wie mein Futterplan, über den wir bei Gelegenheit noch reden müssen. |
| SYS\_WDH\_PIX\_0060 | Pixel | Ich kenne das schon. Ich kenne alles schon. Das bringt es mit sich, wenn man ein Kater ist. |
| SYS\_WDH\_PIX\_0070 | Pixel | Starr nicht so. Starren ist meine Disziplin, // und ich mache das seit Jahren auf einem Niveau, das du nicht erreichen wirst. |
| SYS\_WDH\_PIX\_0080 | Pixel | Nichts Neues. Wenn sich etwas ändert, sage ich Bescheid. // Das ist gelogen, ich sage nie Bescheid. Aber es klingt nett. |
| SYS\_WDH\_PIX\_0090 | Pixel | Das ist das dritte Mal. Beim vierten Mal lege ich mich drauf, und dann gehört es mir. |
| SYS\_WDH\_PIX\_0100 | Pixel | Hinsehen wird überschätzt, junger Mann. Riechen ist die Zukunft. |

## 9c. Plauderoptionen erschöpft (PLA)

Einmal je Figur, beim ersten Klick auf sie, nachdem alle ihre Plauderoptionen verbraucht sind; zufällig gezogen. Gilt für das ganze Spiel.

| ID | Sprecher | Text |
| --- | --- | --- |
| SYS\_PLA\_MAX\_0010 | Max | Über alles Lustige haben wir geredet. Jetzt bleibt nur noch das Wichtige übrig. Langweilig, aber wichtig. |
| SYS\_PLA\_MAX\_0020 | Max | Mir gehen die Themen aus. Das passiert mir sonst nur beim Elternabend. |
| SYS\_PLA\_MAX\_0030 | Max | Smalltalk aufgebraucht. Für einen Teenager war das ziemlich viel. |
| SYS\_PLA\_MAX\_0040 | Max | Ich hab alle lustigen Fragen gestellt. Die ernsten heb ich mir für den Notfall auf. |
| SYS\_PLA\_MAX\_0050 | Max | Mehr Witz hab ich gerade nicht im Inventar. |
| SYS\_PLA\_MAX\_0060 | Max | Okay, ich hab ihn komplett durchgefragt. Das war ein Quiz, bei dem es nichts zu gewinnen gab. |
