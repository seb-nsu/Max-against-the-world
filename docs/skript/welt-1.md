# Skript Welt 1: Schwurbelstein

Das ganze Skript für Welt 1 als Entwurf: rund 870 Zeilen in 16 Abschnitten, ein Abschnitt pro Raum oder Szene, in der Kurzform aus dem Tab Spielsysteme (ID, Sprecher, Text, Regie oder Auslöser; Bedingungen nach Semikolon, „//“ trennt Pixels Kaskaden). Die Nummern laufen pro Szene in Zehnerschritten, jeder Tabellenblock beginnt bei einem neuen Hunderter. Sprecherkürzel der Nebenfiguren: TOA Toadi, ALW Alwin Grauwald, ZEL Zeldina, GOL Gollo, HUM Humbert, WAL Waldemar, STA Stabmacher, SCH Schmied, ROT Rotkäppchen, MAK Maklerin, GRI Grimmzahn, GO1 und GO2 Goblin-Arbeiter, MOD Moderwort, SMA Smaugi, MIN Minka, HUH Huhn, ZIE Schmiede-Ziege, XXL XXL-Ziege, SWA Schwan, BRU Brunnen, GRA Grammophon, SPI Spiegel, TUE Geheimtür. Ersatzzeilen kommen aus dem Pool SYS\_ERS im Prolog-Skript; die Hinweis-IDs folgen dem Schema W1\_HINT\_PIX\_RRSK (Abschnitt 16).

## 1. Dorfplatz Unterbrösel: Ankunft

Szene. Der Wirbel spuckt Max auf das Kopfsteinpflaster, Pixel landet auf allen vieren daneben. Mittag, Dorfmusik, das Luftschloss hängt am Himmel. Nach der Szene ist Pixels Porträt noch grau; der Wechsel wird erst in der Taverne freigeschaltet (Rätsel 1a).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_ANK\_MAX\_0010 | Max | Au. | liegt auf dem Rücken, Hoodie über dem Gesicht |
| W1\_ANK\_PIX\_0020 | Pixel | Ich bin auf den Pfoten gelandet. Natürlich. // Du bist auf dem Gesicht gelandet. Auch natürlich. | sitzt kerzengerade |
| W1\_ANK\_MAX\_0030 | Max | Wo sind wir? | setzt sich auf, sieht sich um |
| W1\_ANK\_PIX\_0040 | Pixel | Kanal 3. Riecht nach Stroh, Bier und Leuten, die „Wohlan“ sagen. | schnuppert |
| W1\_ANK\_MAX\_0050 | Max | Fantasy. Ich hab die Staffel übersprungen. | steht auf, Hände in die Bauchtasche |
| W1\_ANK\_MAX\_0060 | Max | Opas Zettel. Jetzt darf ich ihn ja lesen. | zieht den Zettel aus der Reisetasche |
| W1\_ANK\_OPA\_0070 | Opa (Zettel, Max liest vor) | „Das Ei muss ganz bleiben. Alles hängt davon ab.“ | Nahansicht Zettel, Opas Handschrift |
| W1\_ANK\_MAX\_0080 | Max | Alles hängt davon ab. Von einem Ei. Okay. | steckt den Zettel weg |
| W1\_ANK\_PIX\_0090 | Pixel | Zweimal unterstrichen. Dein Opa unterstreicht nur, wenn er Angst hat. // Oder Hunger. |  |
| W1\_ANK\_TOA\_0100 | Toadi (aus dem Off) | Hilfe! Hilfe! Ein Held! Da ist ein Held! | Rennen-Animation von rechts |
| W1\_ANK\_MAX\_0110 | Max | Wo? | dreht sich um |
| W1\_ANK\_TOA\_0120 | Toadi | Du! Du siehst aus wie einer! Also fast. Die Haltung ist noch nicht so. | Keuchen-Animation |
| W1\_ANK\_TOA\_0130 | Toadi | Prinzessin Zeldina wurde entführt! Vom Dunklen Lord! Und auf Burg Brösel ist sie nicht, ich hab nachgesehen! |  |
| W1\_ANK\_MAX\_0140 | Max | Ich suche ein Ei. Kein Prinzessinnen-Ding. |  |
| W1\_ANK\_TOA\_0150 | Toadi | Alle suchen hier etwas. Der Dunkle Lord hat alles. Das Ei bestimmt auch. Er wohnt im Dunklen Turm. Da hinten, wo es violett wird. | zeigt nach rechts hinten |
| W1\_ANK\_PIX\_0160 | Pixel | Ein Turm, der sich Dunkler Turm nennt. Subtil wie ein Napf mit der Aufschrift „Napf“. |  |
| W1\_ANK\_TOA\_0170 | Toadi | Der Weg geht über die Trollbrücke, durch den Zauberwald, durchs Bergwerk. Ich weiß das, weil ich dreimal umkehren musste. |  |
| W1\_ANK\_MAX\_0180 | Max | Und wie komm ich an der Brücke vorbei? |  |
| W1\_ANK\_TOA\_0190 | Toadi | Mit Regeln. Der Troll liebt Regeln. Ich hab keine dabei. Ich hab nur Panik dabei. | sieht zum Luftschloss hoch, seufzt |
| W1\_ANK\_TOA\_0200 | Toadi | Da oben wäre sie vielleicht. Aber da kommt man nur mit einer Bohnenranke hin. Und wer hat schon eine Bohnenranke. |  |
| W1\_ANK\_MAX\_0210 | Max | Muss das sein? | an Pixel, leise |
| W1\_ANK\_PIX\_0220 | Pixel | Du hast beim Einsaugen zugestimmt. Ich war dabei. // Außerdem: erst das Ei, dann das Sofa. Das ist die Reihenfolge. | geht los Richtung Taverne |
| W1\_ANK\_MAX\_0230 | Max | Du gehst in die Kneipe. | folgt |
| W1\_ANK\_PIX\_0240 | Pixel | Ich gehe dahin, wo es nach Käse riecht. Dass das die Kneipe ist, ist Zufall. |  |

## 2. Dorfplatz Unterbrösel: Brunnen, Dorfbrett, Bohnenranke

Der Dorfplatz ist die Drehscheibe der Welt: Rätsel 3 (Bestellung), 5 (Brunnen) und 8 (Ranke) spielen hier. Zuerst die Ansehen-Zeilen für alle Hotspots, dann Toadis Gesprächsbaum, dann die drei Rätsel.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_0110 | Max | Ein Wunschbrunnen. Steht dran: „Wünsche nur gegen Gold.“ Wie ein Abo, nur ehrlicher. | Ansehen: Brunnen |
| W1\_DORF\_PIX\_0120 | Pixel | Wasser. Es rauscht. Keine Fische drin. Ich habe nachgefragt. | Ansehen: Brunnen, Pixel |
| W1\_DORF\_MAX\_0130 | Max | Esel, Hund, Katze, Hahn, übereinander. Wie eine Boyband, die sich nicht auf einen Sänger einigen konnte. | Ansehen: Statue |
| W1\_DORF\_PIX\_0140 | Pixel | Eine Katze fast ganz oben. Endlich ein realistisches Denkmal. // Der Hahn obendrauf ist ein Druckfehler. | Ansehen: Statue, Pixel |
| W1\_DORF\_MAX\_0150 | Max | Ein Dorfbrett. Das Internet von hier. Alle pinnen, keiner liest. | Ansehen: Dorfbrett |
| W1\_DORF\_MAX\_0160 | Max | „Rotkäppchens Lieferdienst. Alles, was Oma nicht mehr trägt. In zehn Minuten da oder der Korb ist gratis.“ | Ansehen: Bestellzettel am Dorfbrett |
| W1\_DORF\_MAX\_0170 | Max | Ein Bestellzettel. Den nehm ich. Man weiß nie, wann man eine Lieferung braucht. | Nehmen: Bestellzettel |
| W1\_DORF\_MAX\_0180 | Max | „Gesucht wegen Weltherrschaft. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ | Ansehen: Moderworts Steckbrief, öffnet die Nahansicht |
| W1\_DORF\_MAX\_0190 | Max | Da hat jemand eine Schwachstelle im Lebenslauf. | Nahansicht Steckbrief, zweite Zeile |
| W1\_DORF\_PIX\_0200 | Pixel | Kein Gesicht auf dem Bild, nur zwei rote Nasenlöcher. Entweder sehr böse oder sehr schlecht gezeichnet. | Nahansicht Steckbrief, Pixel |
| W1\_DORF\_MAX\_0210 | Max | Den nehm ich mit. Als Lesezeichen. Oder zum Drohen. | Nehmen: Steckbrief |
| W1\_DORF\_MAX\_0220 | Max | Ein Schloss auf einer Wolke. Da oben ist der Empfang bestimmt auch nicht besser. | Ansehen: Luftschloss am Himmel |
| W1\_DORF\_PIX\_0230 | Pixel | Hoch oben, sonnenwarm, keine Hunde. Ich will da wohnen. // Und ich hasse Wolken. Das sagt alles. | Ansehen: Luftschloss, Pixel |
| W1\_DORF\_MAX\_0240 | Max | „Einer für alles. Ausverkauf.“ Ein Ring, sie alle zu … nein, danke. | Ansehen: Ring-Laden |
| W1\_DORF\_MAX\_0250 | Max | Ein Stall. Kein Pferd weit und breit, nur zwei Kokosnusshälften. Das Geräusch hab ich trotzdem im Ohr. | Ansehen: Stall mit Kokosnüssen |
| W1\_DORF\_MAX\_0260 | Max | „Zum tänzelnden Pony-Express.“ Klingt wie ein Lieferdienst mit Ausschank. | Ansehen: Taverne von außen |
| W1\_DORF\_MAX\_0270 | Max | Da drin hämmert jemand. Und da drin meckert jemand. Hoffentlich in der Reihenfolge. | Ansehen: Schmiede von außen |
| W1\_DORF\_MAX\_0280 | Max | Ein Laden nur für Zauberstäbe. Shopping, aber offline. Gruselig. | Ansehen: Zauberstab-Laden von außen |
| W1\_DORF\_MAX\_0290 | Max | Wegweiser: „Hoggelwarz für Durchgefallene“. Endlich eine Schule mit realistischen Zielen. | Ansehen: Weg nach Hoggelwarz |
| W1\_DORF\_MAX\_0300 | Max | Der Weg zur Brücke. Toadi sagt, da sitzt ein Troll. Toadi sagt viel. | Ansehen: Waldweg |
| W1\_DORF\_MAX\_0310 | Max | Runde Häuser mit schiefen Dächern. Als hätte ein Kind gebaut. Ein sehr begabtes Kind. | Ansehen: Häuser |
| W1\_DORF\_MAX\_0320 | Max | Ein Fleck Erde zwischen den Pflastersteinen. Sieht aus, als würde er auf etwas warten. | Ansehen: Erdfleck links vom Brunnen; vor R8 |
| W1\_DORF\_MAX\_0330 | Max | Eine Bohnenranke bis in die Wolken. Eine Treppe hätte es auch getan. | Ansehen: Bohnenranke; nach R8 |
| W1\_DORF\_PIX\_0340 | Pixel | Ich klettere nicht. Ich werde getragen. Das ist eine alte Katzentradition und ich halte sie hoch. | Ansehen: Bohnenranke, Pixel; nach R8 |
| W1\_DORF\_MAX\_0350 | Max | Ein Eimer am Brunnen. Ich leih ihn mir. Das ist kein Diebstahl, das ist Teilen. | Nehmen: Eimer |
| W1\_DORF\_MAX\_0360 | Max | Eimer voll. Wasser aus einem Wunschbrunnen. Ist das jetzt Premium-Wasser? | Eimer auf Brunnen |
| W1\_DORF\_PIX\_0370 | Pixel | Wunschwasser. Ich wünsche mir, dass du es nicht auf mich kippst. Sieh an, es klappt. | nach 0360 |
| W1\_DORF\_MAX\_0380 | Max | Gollos letzte Goldmünze. Fühlt sich schwer an. Wie Verantwortung. | Ansehen: Goldmünze im Inventar |
| W1\_DORF\_MAX\_0390 | Max | Eine Zauberbohne. Glitzert. Pixel wollte sie fressen. | Ansehen: Zauberbohne im Inventar |
| W1\_DORF\_PIX\_0400 | Pixel | Ich wollte sie probieren. Das nennt man Qualitätskontrolle. | nach 0390 |
| W1\_DORF\_PIX\_0410 | Pixel | Pergament, Pilzgeruch, Panikschweiß. Toadi hat das Brett heute schon viermal gelesen. | Pixel schnuppert: Dorfbrett |
| W1\_DORF\_PIX\_0420 | Pixel | Riecht nach Kokos. Kein Pferd. Das Pferd ist eine Lüge, und ich sage das als Experte für Lügen. | Pixel schnuppert: Stall |
| W1\_DORF\_TOA\_0430 | Toadi | Eine Katze! Ist sie gefährlich? Sie sieht aus, als hätte sie Meinungen! | Pixel auf Toadi |

Gespräch mit Toadi. Max fragt, Toadi antwortet; gelesene Optionen werden grau. Toadi folgt Max auf dem Dorfplatz und in Hoggelwarz, sonst wartet er.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_0510 | Max | Wer ist dieser Dunkle Lord? | Option Toadi |
| W1\_DORF\_TOA\_0520 | Toadi | Lord Moderwort! Hoggelwarz-Abbrecher, erstes Jahr. Seitdem hasst er alle Zauberer. Und Blumen. Also, er niest bei Blumen. Man sagt, das ist dasselbe. | hüpft nervös |
| W1\_DORF\_MAX\_0530 | Max | Wo hast du überall nachgesehen? | Option Toadi |
| W1\_DORF\_TOA\_0540 | Toadi | Burg Brösel, Schloss Steinbeiß, die Villa hinterm Mühlbach. Überall Umzugskartons, nirgends Prinzessin. Sie hinterlässt immer Kartons. Ich halte das für ein Zeichen. |  |
| W1\_DORF\_MAX\_0550 | Max | Und das Schloss da oben? | Option Toadi |
| W1\_DORF\_TOA\_0560 | Toadi | Da kommt man nur mit einer Bohnenranke hin. Bohnen gibt's beim Brunnen. Aber der will Gold. Ich habe nur Pilzgeld, und Pilzgeld nimmt keiner. | Hinweis R5 |
| W1\_DORF\_MAX\_0570 | Max | Warum rennst du mir eigentlich hinterher? | Option Toadi |
| W1\_DORF\_TOA\_0580 | Toadi | Ich bin der Diener der Prinzessin! Ist sie weg, diene ich dem, der sie sucht. Steht so in meinem Vertrag. Seite vierzig. |  |
| W1\_DORF\_MAX\_0590 | Max | Ich such ein Ei. | Antwort auf 0580 |
| W1\_DORF\_TOA\_0600 | Toadi | Dann diene ich dem Ei. | ernst, salutiert |
| W1\_DORF\_MAX\_0610 | Max | Ich muss weiter. | Option Toadi, beendet das Gespräch |
| W1\_DORF\_TOA\_0620 | Toadi | Ich warte hier! Oder ich renne! Ich kann beides gleichzeitig! | rennt auf der Stelle |

Rätsel 5, der Brunnen der Wünsche. Max wirft die Goldmünze ein, dann stehen drei Wünsche zur Wahl. Der Brunnen spricht mit Hall (Sprecher BRU). Falsche Wünsche gehen schief und geben die Münze zurück.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_BRU\_0710 | Brunnen | Wünsche nur gegen Gold. Keine Karten. Keine Pilze. Kein Vertrauen. | Benutzen: Brunnen ohne Münze |
| W1\_DORF\_MAX\_0720 | Max | Pling. | Goldmünze auf Brunnen |
| W1\_DORF\_BRU\_0730 | Brunnen | Gold erkannt. Ein Wunsch. Bitte deutlich sprechen, ich habe Wasser in den Ohren. | Dialogauswahl erscheint |
| W1\_DORF\_MAX\_0740 | Max | Unendlich Pizza. | Option 1, falsch |
| W1\_DORF\_BRU\_0750 | Brunnen | Unendlich Pizza. Wird bearbeitet. | Blubbern, eine Pizzascheibe plumpst auf den Rand |
| W1\_DORF\_MAX\_0760 | Max | Eine Scheibe. Kalt. Unendlich ist hier wohl ein Abo-Modell. |  |
| W1\_DORF\_PIX\_0770 | Pixel | Mit Ananas. Natürlich mit Ananas. Der Brunnen hasst dich. |  |
| W1\_DORF\_BRU\_0780 | Brunnen | Reklamation anerkannt. Münze zurück. Bitte nicht weitersagen. | Münze springt ins Inventar |
| W1\_DORF\_MAX\_0790 | Max | Dass Pixel mal still ist. | Option 2, falsch |
| W1\_DORF\_BRU\_0800 | Brunnen | Stille. Wird bearbeitet. | Blubbern. Pixel schweigt zwei Sekunden |
| W1\_DORF\_PIX\_0810 | Pixel | … und deshalb ist Thunfisch in Lake eine Beleidigung, das war Punkt eins von vierzig, Punkt zwei: Heizungen. // Punkt drei: Wer ist dieser Toadi überhaupt, und warum hat er einen Hut, der aussieht wie ein Frühstück? // Punkt vier … | redet doppelt so schnell, Halsband blinkt ohne Pause |
| W1\_DORF\_MAX\_0820 | Max | Er redet doppelt so viel. Das ist das Gegenteil von dem, was ich gesagt habe. |  |
| W1\_DORF\_BRU\_0830 | Brunnen | Bekannte Nebenwirkung. Reklamation anerkannt. Münze zurück. | Münze springt ins Inventar; Pixel wird nach dem Raumwechsel wieder normal |
| W1\_DORF\_MAX\_0840 | Max | Etwas, das hoch hinaus will. | Option 3, richtig |
| W1\_DORF\_BRU\_0850 | Brunnen | Etwas, das hoch hinaus will. Gewährt. Nicht zurückgeben, nicht umtauschen. | Blubbern, eine Bohne springt heraus |
| W1\_DORF\_MAX\_0860 | Max | Eine Bohne. Ich wünsch mir ein Schloss am Himmel und kriege Gemüse. | nimmt die Bohne |
| W1\_DORF\_PIX\_0870 | Pixel | Hoch hinaus. Sie wächst. Das ist Pflanzenhumor. Pflanzen sind schlecht darin. |  |
| W1\_DORF\_TOA\_0880 | Toadi | Eine Bohne! Eine echte! Einpflanzen! Gießen! Ich hole … ich habe nichts. Ich hole Panik. | hüpft |

Rätsel 3, zweite Ziege: Max heftet den Bestellzettel ans Dorfbrett, Rotkäppchen liefert eine XXL-Ziege. Die Ziegen folgen Max danach wie eine kleine Herde (Begleiter-Schalter, siehe Abschluss).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_0910 | Max | „Eine Ziege, Größe: mittel.“ Abschicken. | Bestellzettel auf Dorfbrett; pinnt ihn an |
| W1\_DORF\_NAR\_0920 | – | Ein Fahrradhupen-Geräusch. Rotkäppchen rollt mit dem Lieferkarren heran, hinter ihr trottet etwas Großes. | Szene ohne Text |
| W1\_DORF\_ROT\_0930 | Rotkäppchen | Lieferung für … Max? Eine Ziege, Größe mittel. Wir hatten nur noch XXL. Ist dasselbe, nur mehr davon. | winkt |
| W1\_DORF\_XXL\_0940 | XXL-Ziege | Mäh. | sehr tief |
| W1\_DORF\_MAX\_0950 | Max | Das ist keine Ziege. Das ist ein Sofa mit Hörnern. |  |
| W1\_DORF\_ROT\_0960 | Rotkäppchen | Unterschrift hier. Und hier. Rückgabe ausgeschlossen, die passt nicht mehr in den Karren. | hält ein Klemmbrett hin |
| W1\_DORF\_PIX\_0970 | Pixel | Zehn Minuten Lieferzeit, aus einem anderen Wald. Dein Pizzadienst schafft das nicht mal mit Rückenwind. |  |
| W1\_DORF\_ROT\_0980 | Rotkäppchen | Trinkgeld wäre lieb. Oma hat große Zähne, das heißt gar nichts, aber die Zahnarztrechnung ist echt. | fährt weg Richtung Wald |
| W1\_DORF\_XXL\_0990 | XXL-Ziege | Määäh. | Pixel redet mit XXL-Ziege |
| W1\_DORF\_PIX\_1000 | Pixel | Sie sagt, sie hatte Lieferstress und möchte nicht angefasst werden. // Außerdem findet sie, du hast ein ehrliches Gesicht. Ziegen sind schlechte Menschenkenner. | Übersetzung |
| W1\_DORF\_MAX\_1010 | Max | Zwei Ziegen. Der Troll will drei. Ich hab das Gefühl, der dritte Teil wird unangenehm. | nach Lieferung, wenn die Schmiede-Ziege schon dabei ist |

Rätsel 8, die Bohnenranke. Max pflanzt die Bohne in den Erdfleck und gießt mit dem Eimer Brunnenwasser.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_1110 | Max | Bohne rein, Erde drauf. Ich war mal gut in Bio. Eine Stunde lang. | Zauberbohne auf Erdfleck; Pflanz-Animation |
| W1\_DORF\_PIX\_1120 | Pixel | Sie wartet auf Wasser. Nicht auf Applaus. | Benutzen: gepflanzte Bohne ohne Wasser |
| W1\_DORF\_MAX\_1130 | Max | Die soll wachsen, nicht schwimmen. | Zauberbohne auf Brunnen |
| W1\_DORF\_MAX\_1140 | Max | Gießen. Und jetzt warten wir drei Wochen, oder – | Eimer mit Wasser auf gepflanzte Bohne; Gieß-Animation |
| W1\_DORF\_NAR\_1150 | – | Die Ranke schießt aus dem Boden, schraubt sich am Brunnen vorbei und verschwindet in den Wolken. | Wachsen-Animation, Kamera folgt kurz nach oben |
| W1\_DORF\_MAX\_1160 | Max | Okay. Das ging schneller als jeder Download bei Opa. |  |
| W1\_DORF\_PIX\_1170 | Pixel | Bis in die Wolken, ohne Dünger. Dein Opa würde sofort ein Patent anmelden. // Und es Bohn-O-Mat nennen. |  |
| W1\_DORF\_TOA\_1180 | Toadi | Eine Bohnenranke! Sie ist da oben! Ganz bestimmt da oben! |  |
| W1\_DORF\_MAX\_1190 | Max | Und wenn nicht? |  |
| W1\_DORF\_TOA\_1200 | Toadi | Dann ist sie in einem anderen Schloss. Das sage ich dann. Das sage ich immer. | kleinlaut |
| W1\_DORF\_MAX\_1210 | Max | Leer. Ich muss noch mal zum Brunnen. | Eimer leer auf Bohne oder Ranke |

Zurufe auf dem Dorfplatz (Pixel, nach 45 Sekunden ohne Eingabe):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_DORF\_PIX\_1310 | Pixel | Der Brunnen gurgelt. Ich glaube, er hat Hunger. Ich kenne das Geräusch von innen. | Zuruf |
| W1\_DORF\_PIX\_1320 | Pixel | Das Schloss da oben bewegt sich nicht. Entweder festgemacht oder faul. Ich respektiere beides. | Zuruf |
| W1\_DORF\_PIX\_1330 | Pixel | Toadi hat dich in zwei Minuten dreimal angesehen. Er erwartet Heldentum. Enttäusch ihn sanft. | Zuruf; solange Toadi im Raum ist |

## 3. Taverne „Zum tänzelnden Pony-Express“: Der Taverne-Coup

Szene beim ersten Betreten. Humbert poliert einen Krug, Gollo kauert in der Ecke, Minka sitzt neben dem Fondue-Topf. Pixel springt auf den Dachbalken, sein Porträt blinkt: Hier lernt der Spieler den Figurenwechsel (Rätsel 1a).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_HUM\_0010 | Humbert | Willkommen im Pony-Express! Setz dich, trink was, fass Gerhard nicht an. | poliert weiter |
| W1\_TAV\_MAX\_0020 | Max | Wer ist Gerhard? |  |
| W1\_TAV\_HUM\_0030 | Humbert | Das Schwert über dem Kamin. Das mit dem Glänzen. Er mag keine Fremden. | liebevoller Blick zum Kamin |
| W1\_TAV\_NAR\_0040 | – | Pixel springt in einem Satz auf den Dachbalken. Sein Porträt oben links beginnt zu blinken. | Szene ohne Text |
| W1\_TAV\_PIX\_0050 | Pixel | Klick mich an. Ich beiße nur manchmal. | von oben, Halsband blinkt |
| W1\_TAV\_MAX\_0060 | Max | Er sitzt auf einem Balken und gibt Anweisungen. Wie ein Streamer mit Webcam von oben. |  |
| W1\_TAV\_GOL\_0070 | Gollo | Pssst. Nicht so laut. Der Vulkan hört zu. | aus der Ecke, zischelnd |
| W1\_TAV\_PIX\_0080 | Pixel | Endlich. Jemand mit Übersicht am Steuer. Von hier oben sieht man alles. // Vor allem den Käse. | erster Wechsel zu Pixel |
| W1\_TAV\_MAX\_0090 | Max | Und zurück zu dem, der Taschen hat. | erster Wechsel zurück zu Max |

Ansehen in der Taverne:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_0110 | Max | Ein Tresen. Krüge, Flecken, Geschichten. Wie Opas Küchentisch, nur klebriger. | Tresen |
| W1\_TAV\_MAX\_0120 | Max | Ein Topf voll blubberndem Käse. Gollo nennt das Vulkan. Ich nenne das Abendessen. | Fondue-Topf |
| W1\_TAV\_PIX\_0130 | Pixel | Käse. Heiß. Flüssig. Ich würde hineinsteigen, wenn ich schwimmen könnte. // Ich kann nicht. Ich bin eine Katze mit Prinzipien. | Fondue-Topf, Pixel |
| W1\_TAV\_MAX\_0140 | Max | Die Wirtskatze. Sitzt neben dem Topf wie ein Türsteher mit Schleife. | Minka |
| W1\_TAV\_PIX\_0150 | Pixel | Sie ist weiß. Sie ist elegant. Sie trägt eine Schleife. Ich bin verloren. Sag es niemandem. | Minka, Pixel |
| W1\_TAV\_MAX\_0160 | Max | Die Kellertür. Da unten liegt der Wein. Humbert geht nur runter, wenn er muss. | Kellertür |
| W1\_TAV\_MAX\_0170 | Max | „Gesucht: Drache. Belohnung: fünf Goldmünzen.“ Da ist jemand optimistisch. | Steckbrief-Plakat Drache |
| W1\_TAV\_MAX\_0180 | Max | Ein Huhn im Korb. Es guckt, als würde ich ihm Geld schulden. | Huhn |
| W1\_TAV\_PIX\_0190 | Pixel | Ein Huhn. Ich habe gerade einen sehr natürlichen Impuls. Ich unterdrücke ihn. Für den Thunfisch. | Huhn, Pixel |
| W1\_TAV\_MAX\_0200 | Max | Ein Kamin. Das Feuer knistert. Fast wie ein Bildschirmschoner, nur warm. | Kamin |
| W1\_TAV\_MAX\_0210 | Max | Rostige Schwerter mit Namensschildern. Gerhard. Birgit. Gerhard der Zweite. Humbert hat Lieblinge. | Schwerter-Sammlung |
| W1\_TAV\_MAX\_0220 | Max | Leere Namensschilder. Humbert wartet auf neue Schwerter. Oder auf neue Namen. | Leere Schilder |
| W1\_TAV\_MAX\_0230 | Max | Eine Laute mit Becher. Dem Barden 'ne Münze zuwerfen? Ich hab genau eine, und die brauch ich. | Laute mit Münzbecher; mit Goldmünze |
| W1\_TAV\_MAX\_0240 | Max | Eine Laute mit Becher. Kein Barde. Der Becher sammelt trotzdem. Wie ein Spendenbutton. | Laute mit Münzbecher; ohne Goldmünze |
| W1\_TAV\_MAX\_0250 | Max | Ein Ziegenfell-Vorleger. Flauschig. Pixel guckt ihn an, als hätte das Fell etwas Böses getan. | Ziegenfell-Vorleger |
| W1\_TAV\_MAX\_0260 | Max | Dachbalken. Perfekt für Katzen und Spinnen. Also für Pixel und seine Mitbewohner. | Dachbalken |
| W1\_TAV\_MAX\_0270 | Max | Die Weinkarte: Hauswein, Hauswein rot, Hauswein noch röter. Und ganz unten: „Jahrgang Schicksalsberg, auf Anfrage.“ | Weinkarte am Tresen |
| W1\_TAV\_PIX\_0280 | Pixel | „Auf Anfrage“ heißt: ganz hinten im Keller, hinter den Rüben, mit Spinnweben. Das dauert. | Weinkarte, Pixel; Hinweis R1b |
| W1\_TAV\_MAX\_0290 | Max | „Vielsaft-Limo. Schmeckt wie jemand anderes.“ Ich bleib bei Wasser. | Flasche Vielsaft-Limo |
| W1\_TAV\_PIX\_0300 | Pixel | Trink das, und du siehst eine Stunde lang aus wie Toadi. Ich würde zahlen, um das zu sehen. | Vielsaft-Limo, Pixel |
| W1\_TAV\_MAX\_0310 | Max | Humberts Fischsuppe. Riecht nach Hafen. Nach dem Teil vom Hafen, wo keiner hingeht. | Fischsuppe |
| W1\_TAV\_PIX\_0320 | Pixel | Hühnerbrühe. | Fischsuppe, Pixel schnuppert |
| W1\_TAV\_MAX\_0330 | Max | Deine Nase lügt bei Fisch. | nach 0320 |
| W1\_TAV\_PIX\_0340 | Pixel | Meine Nase lügt nie. Sie interpretiert. | nach 0330; führt die Regel für R6 ein |
| W1\_TAV\_MAX\_0350 | Max | Der Wirt. Poliert denselben Krug, seit wir hier sind. Vielleicht ist es der einzige. | Humbert |
| W1\_TAV\_MAX\_0360 | Max | Ein kleiner Mann in einem viel zu großen Mantel. Er hält sein Kästchen wie ein Handy bei einem Prozent. | Gollo |
| W1\_TAV\_PIX\_0370 | Pixel | Ziege. Alte Ziege. Nass gewordene alte Ziege. Mein Albtraum hat jetzt eine Textur. | Pixel schnuppert: Vorleger |
| W1\_TAV\_PIX\_0380 | Pixel | Kalt, Staub, Rüben. Und irgendwo da unten ein Etikett ohne Flasche. Ich rieche so etwas. | Pixel schnuppert: Kellertür |
| W1\_TAV\_PIX\_0390 | Pixel | Rost und Zuneigung. Humbert poliert mit Gefühl. Das rieche ich und finde es unangenehm. | Pixel schnuppert: Schwerter |
| W1\_TAV\_HUM\_0400 | Humbert | Eine Katze! Hallo, Kleiner. Minka hat einen Freund? Minka hat sonst nur Feinde. | Pixel auf Humbert |
| W1\_TAV\_GOL\_0410 | Gollo | Eine Katze. Katzen mögen keine Ringe. Katzen mögen gar nichts. Wir sind uns ähnlich. | Pixel auf Gollo |

Gespräch mit Humbert:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_0510 | Max | Was blubbert da? | Option Humbert |
| W1\_TAV\_HUM\_0520 | Humbert | Mein Käsefondue! Seit dreihundert Jahren in der Familie. Also der Topf. Den Käse wechsle ich alle zwei Wochen. | stolz |
| W1\_TAV\_MAX\_0530 | Max | Erzähl mir von den Schwertern. | Option Humbert |
| W1\_TAV\_HUM\_0540 | Humbert | Das ist Gerhard, mein Liebling. Daneben Birgit, Gerhard der Zweite und Klaus-Dieter. Klaus-Dieter rostet aus Prinzip. | zeigt nacheinander |
| W1\_TAV\_MAX\_0550 | Max | Du nennst Schwerter beim Vornamen. | Antwort auf 0540 |
| W1\_TAV\_HUM\_0560 | Humbert | Und du nennst dein Handy nicht beim Vornamen? Was bist du für ein Mensch. | ehrlich entsetzt |
| W1\_TAV\_MAX\_0570 | Max | Habt ihr Wein? | Option Humbert |
| W1\_TAV\_HUM\_0580 | Humbert | Hauswein, Hauswein rot, Hauswein noch röter. Auf der Karte steht noch der Jahrgang Schicksalsberg. Den hat noch nie jemand bestellt. Liegt ganz hinten im Keller, hinter den Rüben. | Hinweis R1b; schaltet Option 0590 frei |
| W1\_TAV\_MAX\_0590 | Max | Dann nehm ich den Schicksalsberg. | Option Humbert; nach 0580; löst R1b |
| W1\_TAV\_HUM\_0600 | Humbert | Den Schicksalsberg. Wirklich? Jetzt? … Gut. Das dauert. Fass nichts an. Vor allem nicht Gerhard. | In-den-Keller-Animation |
| W1\_TAV\_PIX\_0610 | Pixel | Er ist weg. Der Topf ist unbewacht. Also halb. Madame sitzt noch. | nach 0600, wenn Minka noch da ist |
| W1\_TAV\_MAX\_0620 | Max | Was ist mit der Katze? | Option Humbert |
| W1\_TAV\_HUM\_0630 | Humbert | Minka? Bewacht den Topf. Seit der Sache mit dem Barden. Der hat den Käse als Haargel benutzt. | schüttelt sich |
| W1\_TAV\_MAX\_0640 | Max | Nichts weiter. | Option Humbert, beendet das Gespräch |
| W1\_TAV\_HUM\_0650 | Humbert | Dann trink was. Oder guck Gerhard an. Das machen die meisten. |  |

Gespräch mit Gollo:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_0710 | Max | Was hast du da? | Option Gollo |
| W1\_TAV\_GOL\_0720 | Gollo | Nichtsss. Ein Kästchen. Ein Ring darin. Mein Ssschätzchen. Mein Ausverkaufsartikel. Niemand will ihn. Nicht mal im Sonderangebot. | drückt das Kästchen an sich |
| W1\_TAV\_MAX\_0730 | Max | Warum wirfst du ihn nicht einfach in den Topf? | Option Gollo |
| W1\_TAV\_GOL\_0740 | Gollo | Der Vulkan! Ja! Nein! Der Wirt guckt. Die Katze guckt. Und wenn keiner guckt, gucke ich. Ich traue mich nicht. | Hinweis R1a und R1b |
| W1\_TAV\_MAX\_0750 | Max | Du spielst gern Rätselspiele? | Option Gollo |
| W1\_TAV\_GOL\_0760 | Gollo | Rätsel! Ja! Ich gewinne immer! Was hat Wurzeln, die keiner sieht, und ist höher als Bäume? | kichert |
| W1\_TAV\_MAX\_0770 | Max | Ein Berg. Das steht in jedem Buch. | Antwort auf 0760 |
| W1\_TAV\_GOL\_0780 | Gollo | Siehst du! Alle wissen alles! Ich verliere nur, wenn jemand etwas fragt, das niemand wissen kann. Und das passiert nie. | Hinweis R1c |
| W1\_TAV\_MAX\_0790 | Max | Tschüss, Gollo. | Option Gollo, beendet das Gespräch |
| W1\_TAV\_GOL\_0800 | Gollo | Geh nur. Alle gehen. Der Ring bleibt. Der Ring bleibt immer. |  |

Rätsel 1a: Pixel umgarnt Minka. Der Spieler wechselt zu Pixel und redet mit der Wirtskatze; Max versteht nur Miau.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_MIN\_0910 | Minka | Chhh! | Max benutzt Minka oder Fondue-Topf; Minka faucht |
| W1\_TAV\_MAX\_0920 | Max | Sie faucht. Ich glaube, das war ein Nein. Ein sehr klares. | nach 0910 |
| W1\_TAV\_PIX\_0930 | Pixel | Ich komme nicht an den Topf, solange Madame dort sitzt. Und ich würde es nie wagen. Noch nicht. | Pixel benutzt Fondue-Topf, Minka da |
| W1\_TAV\_MIN\_0940 | Minka | Miau? | Pixel redet mit Minka |
| W1\_TAV\_PIX\_0950 | Pixel | Madame. Ihr Fell hat die Farbe von Sahne, die noch nie etwas Falsches getan hat. | Umgarnen-Animation beginnt |
| W1\_TAV\_MIN\_0960 | Minka | Mrrr. | neigt den Kopf |
| W1\_TAV\_PIX\_0970 | Pixel | Draußen steht ein Stall. Zwei Kokosnüsse, ein Platz an der Sonne, kein Wirt. // Darf ich vorausgehen? Nein. Darf ich hinterhergehen? Unbedingt. |  |
| W1\_TAV\_MIN\_0980 | Minka | Miau. | steht auf, folgt Pixel nach draußen |
| W1\_TAV\_MAX\_0990 | Max | Ich versteh nur Miau. Aber es war ein sehr überzeugtes Miau. | Minka verlässt den Raum; R1a gelöst |
| W1\_TAV\_PIX\_1000 | Pixel | Sie sitzt jetzt im Stall und bewundert die Kokosnüsse. Ich habe einen Charme, der Hausaufgaben erledigt. | Pixel kommt zurück |

Rätsel 1c: Das Rätselspiel. Max zieht die Thunfischdose auf Gollo. Funktioniert erst, wenn Minka und Humbert weg sind; vorher weicht Gollo aus.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_GOL\_1110 | Gollo | Nicht jetzt! Der Wirt! Die Katze! Alle gucken! Frag mich, wenn keiner guckt. | Thunfischdose auf Gollo vor R1a oder R1b |
| W1\_TAV\_MAX\_1120 | Max | Gollo. Ein Rätsel. Was hab ich in meiner Tasche? | Thunfischdose auf Gollo; nach R1a und R1b |
| W1\_TAV\_GOL\_1130 | Gollo | Das ist keine Frage! Das ist … gemein. Ich rate. Dreimal. Das sind die Regeln. | kneift die Augen zu |
| W1\_TAV\_GOL\_1140 | Gollo | Ein Ring? |  |
| W1\_TAV\_MAX\_1150 | Max | Nein. |  |
| W1\_TAV\_GOL\_1160 | Gollo | Ein zweiter Ring? Ein besserer? |  |
| W1\_TAV\_MAX\_1170 | Max | Nein. |  |
| W1\_TAV\_GOL\_1180 | Gollo | Hände! Du hast Hände in der Tasche! Das zählt! |  |
| W1\_TAV\_MAX\_1190 | Max | Eine Dose Thunfisch. In Lake. | zeigt die Dose |
| W1\_TAV\_PIX\_1200 | Pixel | Barbarisch. Aber zielführend. | von oben |
| W1\_TAV\_GOL\_1210 | Gollo | Niemand hat eine Dose Thunfisch! Das kann man nicht wissen! Das ist Betrug! // Ich liebe es. Ich habe verloren. Endlich. | Ring-werfen-Animation; Zischen aus dem Topf |
| W1\_TAV\_GOL\_1220 | Gollo | Er ist weg. Ich fühle mich … leicht. Hier, meine letzte Goldmünze. Ich brauche nichts mehr. Nur Schlaf. Jahrelang. | gibt die Münze, rollt sich auf der Bank zusammen |
| W1\_TAV\_MAX\_1230 | Max | Ein Ring im Käse. In Serien dauert so was drei Staffeln. |  |
| W1\_TAV\_NAR\_1240 | – | Humbert kommt staubig und ohne Flasche aus dem Keller. | Szene ohne Text |
| W1\_TAV\_HUM\_1250 | Humbert | Da war nur ein Etikett. Da war nie ein Wein. Dreihundert Jahre lang ein Etikett. | staubig, fassungslos |
| W1\_TAV\_HUM\_1260 | Humbert | Moment. Was ist in meinem Topf? | riecht, probiert mit dem Finger |
| W1\_TAV\_HUM\_1270 | Humbert | … Das schmeckt nach Macht. Und nach Gruyère. Das ist der beste Käse meines Lebens. | Träne im Auge |
| W1\_TAV\_HUM\_1280 | Humbert | Nimm ein Schälchen für den Weg. Und sag es niemandem, sonst kommen die Elfen und wollen Reservierungen. | gibt das Käsefondue |
| W1\_TAV\_MAX\_1290 | Max | Käsefondue zum Mitnehmen. Hat was von Lieferdienst. | Inventar: Käsefondue |
| W1\_TAV\_PIX\_1300 | Pixel | Gib. Her. Ein Pfötchen voll. Ich habe die Katze weggelockt, ich habe Anspruch. |  |
| W1\_TAV\_MAX\_1310 | Max | Nein. Das brauchen wir noch. |  |
| W1\_TAV\_PIX\_1320 | Pixel | Du weißt noch gar nicht, wofür. |  |
| W1\_TAV\_MAX\_1330 | Max | In Serien braucht man immer alles. Irgendwann. | R1 gelöst |

Weitere Gegenstände und Fehlversuche in der Taverne:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_1410 | Max | Den nehm ich. Humbert sieht's nicht, er poliert. | Nehmen: Ziegenfell-Vorleger |
| W1\_TAV\_PIX\_1420 | Pixel | Du nimmst einen Teppich mit. Ich will nicht wissen, warum. Ich ahne es, und ich hasse es. | nach 1410 |
| W1\_TAV\_MAX\_1430 | Max | Ein Ei. Das Huhn protestiert leise. Ich auch, innerlich. | Nehmen: Ei unter dem Huhn |
| W1\_TAV\_HUH\_1440 | Huhn | Gaaack. | nach 1430 |
| W1\_TAV\_PIX\_1450 | Pixel | Ein Ei. Weich gekocht. Zum Frühstück. Das kommt auf meine Liste. // Nicht dieses hier. Ein eigenes. Ich teile nicht mit Kesseln. | nach 1430; Pixels Wunsch Welt 1 |
| W1\_TAV\_HUH\_1460 | Huhn | Gack gack. Gaack. | Pixel redet mit Huhn |
| W1\_TAV\_PIX\_1470 | Pixel | Sie heißt Hilde. Sie legt, seit sie denken kann, und sie denkt nicht viel. // Sie sagt, das Ei riecht nach Schule. Was auch immer das heißen soll. | Übersetzung |
| W1\_TAV\_MAX\_1480 | Max | Thunfisch in Käse. Es gibt Grenzen. | Thunfischdose auf Fondue-Topf |
| W1\_TAV\_PIX\_1490 | Pixel | Es gibt keine Grenzen. Aber nicht mit meiner Dose. | nach 1480 |
| W1\_TAV\_MAX\_1500 | Max | Ein Eimer voll Käse. Verlockend. Aber Humbert hat eine Schwertersammlung. | Eimer auf Fondue-Topf |
| W1\_TAV\_MAX\_1510 | Max | Humbert guckt. Ich nehm lieber mein eigenes Schälchen. | Kochlöffel auf Fondue-Topf |
| W1\_TAV\_MAX\_1520 | Max | Gerhard bleibt, wo er ist. Ich mag meine Hände. | Benutzen: Schwerter |
| W1\_TAV\_HUM\_1530 | Humbert | Finger weg von Gerhard! | nach 1520 |
| W1\_TAV\_MAX\_1540 | Max | Mit Gollos Ring im Topf? Ich leg's nicht drauf an. | Thunfischdose auf Fondue; nach R1 |
| W1\_TAV\_MAX\_1550 | Max | Die Limo bleibt zu. Ich will heute nicht wie jemand anderes aussehen. Ich bin schon genug. | Benutzen: Vielsaft-Limo |
| W1\_TAV\_MAX\_1560 | Max | Ein Schlag auf die Laute. Klingt wie meine Klingeltonauswahl. | Benutzen: Laute |
| W1\_TAV\_GOL\_1570 | Gollo | Zzzz. Mein Ssschätzchen … nein, weg damit … zzz. | Reden mit Gollo; nach R1 |

Zurufe in der Taverne (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_TAV\_PIX\_1610 | Pixel | Der Käse blubbert seit zehn Minuten. Er will gegessen werden. Ich höre so etwas. | Zuruf |
| W1\_TAV\_PIX\_1620 | Pixel | Humbert poliert, Gollo zittert, Minka starrt. Und du stehst. Es ist eine Taverne, kein Standbild. | Zuruf; vor R1 |
| W1\_TAV\_PIX\_1630 | Pixel | Von hier oben sehe ich alles. Vor allem, dass du nichts tust. | Zuruf; Pixel auf dem Balken |

## 4. Schmiede: Die erste Ziege und die Milch

Der Schmied schmiedet nur noch Kochgeschirr, seit die Ziege bei ihm wohnt. Hier gibt es Ziege 1 (Rätsel 3) und später die Ziegenmilch (Rätsel 6, Teil 1). Der Krug für die Milch hängt beim Kochgeschirr (Annahme, siehe Abschluss).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_SCHM\_MAX\_0010 | Max | Eine Esse. Heiß. Wie mein Handy nach drei Stunden Video. | Ansehen: Esse |
| W1\_SCHM\_PIX\_0020 | Pixel | Warm. Sehr warm. Zu warm. Die perfekte Temperatur liegt zwei Schritte weiter links. Ich habe das ausgemessen. | Ansehen: Esse, Pixel |
| W1\_SCHM\_MAX\_0030 | Max | Ein Amboss. Schwer, schwarz, schweigsam. Wir hätten uns verstanden. | Ansehen: Amboss |
| W1\_SCHM\_MAX\_0040 | Max | Pfannen, Töpfe, Kellen. Alle mit Namensschild. Das Schwerter-Ding ist hier wohl ansteckend. | Ansehen: Kochgeschirr |
| W1\_SCHM\_MAX\_0050 | Max | Eine weiße Ziege mit Glöckchen. Und einem Schwert im Maul. Das kaut sie wie Kaugummi. | Ansehen: Schmiede-Ziege |
| W1\_SCHM\_PIX\_0060 | Pixel | Sie frisst Eisen. Ich fresse Thunfisch. Wir sind beide Spezialisten, aber nur einer von uns hat Geschmack. | Ansehen: Schmiede-Ziege, Pixel |
| W1\_SCHM\_MAX\_0070 | Max | Der Schmied. Roter Bart, Ruß im Gesicht, Blick eines Mannes, der seine Ziege nicht mehr liebt. | Ansehen: Schmied |
| W1\_SCHM\_MAX\_0080 | Max | Ein Krug. Leer. Namensschild: leer. Der Schmied war noch nicht so weit. | Ansehen: Krug beim Kochgeschirr |
| W1\_SCHM\_MAX\_0090 | Max | Den Krug leih ich mir. | Nehmen: Krug |
| W1\_SCHM\_SCH\_0100 | Schmied | Nimm. Nimm alles. Nur nicht die Hoffnung, die habe ich selbst nicht mehr. | nach 0090 |
| W1\_SCHM\_MAX\_0110 | Max | Klong. Ich habe auf einen Amboss gehauen. Tag erfüllt. | Benutzen: Amboss |
| W1\_SCHM\_MAX\_0120 | Max | Heiß. Nein. | Benutzen: Esse |
| W1\_SCHM\_PIX\_0130 | Pixel | Pfannen. Unbenutzt. Eine Tragödie in Blech. | Pixel schnuppert: Kochgeschirr |
| W1\_SCHM\_SCH\_0140 | Schmied | Eine Katze. Frisst sie Eisen? Nein? Dann darf sie bleiben. Sie darf sogar wohnen. | Pixel auf Schmied |

Gespräch mit dem Schmied:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SCHM\_MAX\_0210 | Max | Warum schmiedest du Pfannen? | Option Schmied |
| W1\_SCHM\_SCH\_0220 | Schmied | Seit die Ziege hier wohnt, frisst sie jede Klinge. Pfannen frisst sie nicht. Also Pfannen. Das ist Marktwirtschaft. | seufzt |
| W1\_SCHM\_MAX\_0230 | Max | Gehört die Ziege dir? | Option Schmied |
| W1\_SCHM\_SCH\_0240 | Schmied | Die Ziege gehört niemandem. Sie ist eines Morgens aufgetaucht. Wie Schulden. |  |
| W1\_SCHM\_MAX\_0250 | Max | Was ist das für ein Schwert in ihrem Maul? | Option Schmied |
| W1\_SCHM\_SCH\_0260 | Schmied | Das war Ingrid. Humbert wollte sie für seine Sammlung. Jetzt ist sie Ziegenfutter. Sag ihm nichts, er hängt an Namen. |  |
| W1\_SCHM\_MAX\_0270 | Max | Kann ich die Ziege haben? | Option Schmied; auch bei Benutzen: Ziege |
| W1\_SCHM\_SCH\_0280 | Schmied | Du willst sie? Nimm sie! Nimm sie mit! Ich schmiede dir ein Denkmal! Aus Blech, aber ein Denkmal! | fällt fast auf die Knie; Ziege folgt Max ab jetzt |
| W1\_SCHM\_ZIE\_0290 | Schmiede-Ziege | Mäh. | kaut weiter, trottet zu Max |
| W1\_SCHM\_PIX\_0300 | Pixel | Eine Ziege. Sie folgt uns. Ich habe ein Jahr gebraucht, um deinem Opa zu folgen, und sie macht das in einer Sekunde. Anbiederung. |  |
| W1\_SCHM\_MAX\_0310 | Max | Bis dann. | Option Schmied, beendet das Gespräch |
| W1\_SCHM\_SCH\_0320 | Schmied | Geh mit Gott. Oder mit der Ziege. Hauptsache, sie geht. |  |

Pixel redet mit der Ziege, und Rätsel 6, Teil 1: die Milch. Melken geht erst, wenn Alwin sein Rezept genannt hat.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SCHM\_ZIE\_0410 | Schmiede-Ziege | Mäh. Mäh-mäh. | Pixel redet mit Ziege |
| W1\_SCHM\_PIX\_0420 | Pixel | Sie sagt, Eisen schmeckt nach Abenteuer. // Und sie sagt, sie wurde noch nie gemolken und möchte, dass das so bleibt. Ich habe ihr nichts versprochen. | Übersetzung |
| W1\_SCHM\_MAX\_0430 | Max | Warum sollte ich eine Ziege melken? Ich hab nicht mal einen Grund. Noch nicht. | Krug auf Ziege; vor Alwins Rezept |
| W1\_SCHM\_MAX\_0440 | Max | Okay. Milch. Von einer Ziege. Mit den Händen. Das Internet hat gesagt, so was passiert nur anderen. | Krug auf Ziege; nach Alwins Rezept; Melk-Animation |
| W1\_SCHM\_ZIE\_0450 | Schmiede-Ziege | MÄÄÄH. | während der Animation |
| W1\_SCHM\_MAX\_0460 | Max | Fertig. Ein Krug. Ich schwöre hiermit, diese Ziege nie wieder zu melken. Niemals. | Inventar: Ziegenmilch; Schwur-Schalter |
| W1\_SCHM\_PIX\_0470 | Pixel | Sie schwört dasselbe. Nur mit mehr Schimpfwörtern. Ziegisch hat erstaunlich viele. |  |
| W1\_SCHM\_SCH\_0480 | Schmied | Ich habe das gesehen. Ich werde es nie vergessen. Leider. | aus dem Hintergrund |
| W1\_SCHM\_MAX\_0490 | Max | Nein. Ich hab geschworen. Und ich halte Schwüre, wenn sie bequem sind. | Krug auf Ziege; nach 0460 |
| W1\_SCHM\_MAX\_0500 | Max | Ziegen fressen Eisen, keinen Fisch. Das steht fest. Zum Glück. | Thunfischdose auf Ziege |
| W1\_SCHM\_MAX\_0510 | Max | Pfannen melken geht nicht. Ich hab's geprüft, geistig. | Krug auf Kochgeschirr |

Zurufe in der Schmiede (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_SCHM\_PIX\_0610 | Pixel | Die Ziege kaut. Der Schmied seufzt. Das ist hier das Programm. Es gibt keinen anderen Kanal. | Zuruf |
| W1\_SCHM\_PIX\_0620 | Pixel | Die Esse ist warm. Ich wäre längst eingeschlafen, wenn du nicht so laut denken würdest. | Zuruf |

## 5. Zauberstab-Laden: Der Stab wählt den Zauberer

Rätsel 2. Drei Kandidaten auf dem Samtkissen: Zahnstocher, Zollstock, Kochlöffel. Max darf alle anfassen, aber nur der Käse macht aus dem Löffel einen Zauberstab.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_STAB\_MAX\_0010 | Max | Regale bis zur Decke, voller schmaler Schachteln. Wie ein Schuhladen für sehr dünne Leute. | Ansehen: Regale |
| W1\_STAB\_MAX\_0020 | Max | Eine Rollleiter. In Filmen rollt immer jemand damit elegant durchs Bild. Ich nicht. | Ansehen: Leiter |
| W1\_STAB\_MAX\_0030 | Max | Ein lila Samtkissen mit drei Dingen drauf. Das Sortiment. Das ganze. | Ansehen: Theke mit Kissen |
| W1\_STAB\_MAX\_0040 | Max | Ein Zahnstocher. Für Zauberer mit kleinen Problemen. | Ansehen: Zahnstocher |
| W1\_STAB\_MAX\_0050 | Max | Ein Zollstock. Zwei Meter Magie, zusammenklappbar. | Ansehen: Zollstock |
| W1\_STAB\_MAX\_0060 | Max | Ein Kochlöffel aus Holz. Hat schon mehr Eintöpfe gesehen als Zaubersprüche. | Ansehen: Kochlöffel auf dem Kissen |
| W1\_STAB\_PIX\_0070 | Pixel | Holz. Alter Eintopf. Jemand hat damit wirklich gekocht. Ich respektiere diesen Löffel. | Ansehen: Kochlöffel, Pixel; auch Schnuppern |
| W1\_STAB\_MAX\_0080 | Max | Ein rundes Fenster, Staub in der Luft. Das Licht macht hier mehr Show als die Ware. | Ansehen: Fenster |
| W1\_STAB\_MAX\_0090 | Max | Der Stabmacher. Sein Monokel ist so groß, dass er mich wahrscheinlich in 4K sieht. | Ansehen: Stabmacher |
| W1\_STAB\_MAX\_0100 | Max | Leer. Aber schön leer. | Benutzen: Schachtel im Regal |
| W1\_STAB\_STA\_0110 | Stabmacher | Oho, ein Kater. Schnurrhaare in Stabqualität. Darf ich eins? Nur eins? Nein? Schade. | Pixel auf Stabmacher |
| W1\_STAB\_PIX\_0120 | Pixel | Staub. Samt. Hoffnung. Hauptsächlich Staub. | Pixel schnuppert: Theke |

Gespräch mit dem Stabmacher:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_STAB\_MAX\_0210 | Max | Ich brauche einen Zauberstab. | Option Stabmacher |
| W1\_STAB\_STA\_0220 | Stabmacher | Der Stab wählt den Zauberer, junger Mann. Nicht umgekehrt. Ich habe noch drei. // Zahnstocher, Zollstock, Kochlöffel. Der Rest ist ausverkauft, seit die Schule jeden nimmt. | beugt sich vor |
| W1\_STAB\_MAX\_0230 | Max | Wie wählt ein Stab denn? | Option Stabmacher |
| W1\_STAB\_STA\_0240 | Stabmacher | Mein letzter Stab hat seinen Zauberer gewählt, indem er an ihm kleben blieb. Honigfinger. Drei Tage ließ er nicht los. // Das nenne ich Berufung. | Hinweis R2 |
| W1\_STAB\_MAX\_0250 | Max | Was ist in den ganzen Schachteln? | Option Stabmacher |
| W1\_STAB\_STA\_0260 | Stabmacher | Nichts. Aber sie sehen gut aus. Ein Laden braucht Schachteln. Ohne Schachteln ist es ein Flur. |  |
| W1\_STAB\_MAX\_0270 | Max | Was ist mit der Socke da? | Option Stabmacher |
| W1\_STAB\_STA\_0280 | Stabmacher | Ein Probestück. Der Sortierhut von Hoggelwarz ist in Rente, die Schule hat kein Geld, ich habe Socken. Das ist der Prototyp. |  |
| W1\_STAB\_MAX\_0290 | Max | Ich schau mich noch mal um. | Option Stabmacher, beendet das Gespräch |
| W1\_STAB\_STA\_0300 | Stabmacher | Fass alles an. Nur nicht zu lange. Sonst denkt der Stab, du meinst es ernst. |  |

Lösung und Fehlversuche von Rätsel 2:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_STAB\_MAX\_0410 | Max | Ein Zahnstocher. Er wählt mich nicht. Er pikst. | Nehmen: Zahnstocher |
| W1\_STAB\_STA\_0420 | Stabmacher | Nicht gewählt. Das sehe ich an deinem Gesicht. Und an dem Blutstropfen. | nach 0410 |
| W1\_STAB\_MAX\_0430 | Max | Zwei Meter ausgeklappt. Ich fühle mich nicht gewählt. Ich fühle mich vermessen. | Nehmen: Zollstock |
| W1\_STAB\_MAX\_0440 | Max | Ein Kochlöffel. Liegt in meiner Hand. Und fällt raus. Nicht gewählt. | Nehmen: Kochlöffel, kommt ins Inventar |
| W1\_STAB\_STA\_0450 | Stabmacher | Er muss an dir hängen bleiben. Von selbst. Oder fast von selbst, ich schaue nicht so genau hin. | nach 0440 |
| W1\_STAB\_MAX\_0460 | Max | Zahnstocher mit Käse. Das ist ein Snack, kein Zauberstab. | Käsefondue auf Zahnstocher |
| W1\_STAB\_MAX\_0470 | Max | Käse auf den Zollstock. Dann hab ich zwei Meter Snack. Auch nicht schlecht. Aber nein. | Käsefondue auf Zollstock |
| W1\_STAB\_MAX\_0480 | Max | Thunfisch klebt nicht. Thunfisch stinkt. Das ist ein Unterschied, sagt Pixel. | Thunfischdose auf Kochlöffel |
| W1\_STAB\_PIX\_0490 | Pixel | Thunfisch stinkt nicht. Thunfisch duftet. Noch so eine Beleidigung, und ich wechsle die Seite. | nach 0480 |
| W1\_STAB\_MAX\_0500 | Max | Käse auf den Löffel. Jetzt klebt er an meiner Hand. Fest. | Käsefondue auf Kochlöffel im Inventar; Lösung R2 |
| W1\_STAB\_STA\_0510 | Stabmacher | Er hängt an dir! Siehst du, wie er hängt! Er hat dich gewählt! | Träne unterm Monokel |
| W1\_STAB\_MAX\_0520 | Max | Er hängt, weil Käse dran ist. |  |
| W1\_STAB\_STA\_0530 | Stabmacher | Alle großen Berufungen haben einen Grund. Honig, Käse, Schicksal. Nimm ihn. Und nimm die Socke, als Probestück für die Schule. | gibt die Sortierende Socke |
| W1\_STAB\_PIX\_0540 | Pixel | Eine Socke, die sortiert. Ich kenne eine Nase, die interpretiert. Die beiden hätten sich viel zu sagen. |  |
| W1\_STAB\_MAX\_0550 | Max | Klebt. Ich nenne das eine Bindung. | Ansehen: Kochlöffel-Zauberstab im Inventar |
| W1\_STAB\_MAX\_0560 | Max | Eine rot-weiß gestreifte Socke. Sie sortiert. Wonach, weiß keiner. | Ansehen: Sortierende Socke |
| W1\_STAB\_PIX\_0570 | Pixel | Sie hat mich gerade einsortiert. Unter „Edel“. Ich mag sie. | Ansehen: Socke, Pixel |
| W1\_STAB\_MAX\_0580 | Max | Hm. Hm. Hmm. Sie denkt nach. Über mich. Das macht sonst keiner. | Benutzen: Socke im Inventar |
| W1\_STAB\_MAX\_0590 | Max | Schwing. Nichts. Noch nichts. Aber es fühlt sich dramatisch an. | Benutzen: Kochlöffel-Zauberstab ohne Ziel; Schwing-Animation |

Zurufe im Zauberstab-Laden (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_STAB\_PIX\_0610 | Pixel | Der Mann starrt dich durch sein Monokel an. Du bist gerade sehr groß für ihn. Nutz das. | Zuruf |
| W1\_STAB\_PIX\_0620 | Pixel | Drei Dinge auf einem Kissen. Eins davon ist die Antwort. Das ist eine Quizshow für sehr geduldige Leute. | Zuruf; vor R2 |

## 6. Hoggelwarz, Klassenzimmer: Die Aufnahmeprüfung

Szene beim ersten Betreten: Ein Übungsbesen erwacht und jagt Pixels Haaren hinterher, bis er in den Schrank kracht. Alwin beginnt die Prüfung erst, wenn Max den Kochlöffel-Zauberstab hat (Rätsel 2). Toadi steht in der Tür und sieht zu.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_HOGG\_NAR\_0010 | – | Ein kleiner Besen in der Ecke zuckt, richtet sich auf und rast einem Büschel grauer Katzenhaare hinterher. Krach. Schrank. | Übungsbesen-Animation |
| W1\_HOGG\_PIX\_0020 | Pixel | Ich verliere Haare. Das ist Fellpflege, keine Einladung. | empört |
| W1\_HOGG\_ALW\_0030 | Alwin | Besen und Katzenhaare, das endet immer in der Abstellkammer. | seufzt, Kelle in der Hand; Hinweis auf Rätsel 11 |
| W1\_HOGG\_MAX\_0040 | Max | Ein Besen mit Verfolgungswahn. Das Internet würde ihn lieben. |  |
| W1\_HOGG\_ALW\_0050 | Alwin | Ah, ein neuer Durchgefallener! Willkommen in Hoggelwarz! Zeig mir deinen Stab, Junge. | rückt die Brille zurecht |
| W1\_HOGG\_ALW\_0060 | Alwin | Keinen Stab? Dann komm wieder, wenn dich etwas gewählt hat. Ein Stab, ein Löffel, ein Schicksal. Alles wird genommen. | ohne Kochlöffel-Zauberstab |
| W1\_HOGG\_ALW\_0070 | Alwin | Ein Kochlöffel! Endlich einer mit Sinn für das Wesentliche. Die Prüfung kann beginnen. | mit Kochlöffel-Zauberstab; schaltet die Prüfung frei |

Ansehen im Klassenzimmer:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_MAX\_0110 | Max | Schiefe Schulbänke. Mit Kaugummi drunter, wette ich. Manche Dinge sind in jeder Welt gleich. | Schulbank |
| W1\_HOGG\_MAX\_0120 | Max | Eine leere Tafel. Alwin hat entweder nichts zu sagen oder alles vergessen. | Tafel |
| W1\_HOGG\_MAX\_0130 | Max | Ein Kessel. Blubbert leer vor sich hin. Wie ein Gruppenchat um drei Uhr nachts. | Kessel; vor dem Brauen |
| W1\_HOGG\_MAX\_0140 | Max | Sechs braune Flaschen ohne Etikett. Zwei sind doppelt so groß. Das ist entweder Magie oder Marketing. | Flaschenregal |
| W1\_HOGG\_PIX\_0150 | Pixel | Sechs Flaschen, kein Etikett. Ich rieche sie von hier. Aber ich lasse mich bitten. Zweimal. | Flaschenregal, Pixel |
| W1\_HOGG\_MAX\_0160 | Max | Hohe Fenster, kühles Licht. Schulen sehen überall aus, als hätten sie Montag. | Fenster |
| W1\_HOGG\_MAX\_0170 | Max | Der Schulleiter. Sternenrobe, Kochschürze, Kelle. Er weiß selbst nicht, was er gerade unterrichtet. | Alwin |
| W1\_HOGG\_MAX\_0180 | Max | Eine Socke mit Löchern, auf einem Hocker, wie ein Ehrengast. | Durchgelöcherte zweite Socke |
| W1\_HOGG\_PIX\_0190 | Pixel | Die ist nach dem dritten Jahrgang in Rente gegangen. Die Schüler haben sie durchgetragen. | Zweite Socke, Pixel |
| W1\_HOGG\_MAX\_0200 | Max | Der Übungsbesen. Liegt im Schrank und zuckt. Er träumt von Katzenhaaren. | Besen im Schrank |
| W1\_HOGG\_MAX\_0210 | Max | Toadi steht in der Tür und drückt die Daumen. Beide. Mehr hat er nicht. | Toadi |
| W1\_HOGG\_PIX\_0220 | Pixel | Kreide, Ruß, alter Pfannkuchen. Diese Schule hat Geschichte. Frittierte. | Pixel schnuppert: Kessel |
| W1\_HOGG\_ALW\_0230 | Alwin | Ein Kater! Hast du Haare? Natürlich hast du Haare. Weg vom Besen! Weg! … Zu spät. | Pixel auf Alwin; Besen zuckt im Schrank |

Gespräch mit Alwin (ab Prüfungsbeginn):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_HOGG\_MAX\_0310 | Max | Was muss ich für die Prüfung tun? | Option Alwin |
| W1\_HOGG\_ALW\_0320 | Alwin | Den Trank des Leuchtens brauen. Das Rezept: ein Ei, ein Krug Milch, ein Leuchtpilz. Zum Schluss die geheime Zutat aus dem Regal. | liest von der Kelle ab; Rezept bekannt |
| W1\_HOGG\_MAX\_0330 | Max | Das ist ein Pfannkuchenrezept. | Antwort auf 0320 |
| W1\_HOGG\_ALW\_0340 | Alwin | Ist es? Ist es nicht? Die Grenzen sind fließend. Wie Teig. |  |
| W1\_HOGG\_MAX\_0350 | Max | Wo gibt es hier Milch? | Option Alwin; nach 0320 |
| W1\_HOGG\_ALW\_0360 | Alwin | Milch? Milch gibt es im ganzen Reich nicht mehr. Die Milch ist in einem anderen Schloss. // Aber Ziegen. Ziegen haben Milch, sagt man. Ich habe nie nachgesehen. | Hinweis R6, Teil 1 |
| W1\_HOGG\_MAX\_0370 | Max | Was hat es mit dem Regal auf sich? | Option Alwin |
| W1\_HOGG\_ALW\_0380 | Alwin | Sechs Flaschen. Die Etiketten hat jemand vertauscht. Vermutlich ich. Mein Zettel sagt dir, welche die richtige ist. In Reimen. Ich war mal Barde. | gibt Alwins Hinweiszettel |
| W1\_HOGG\_MAX\_0390 | Max | Wer ist eigentlich dieser Moderwort? | Option Alwin |
| W1\_HOGG\_ALW\_0400 | Alwin | Ein Schüler. Erstes Jahr. Er nieste in Kräuterkunde, alle lachten, er ging. Sehr empfindlich. // Sein Zeugnis liegt noch im Archiv. Nie abgeholt. | Hinweis auf das Zeugnis |
| W1\_HOGG\_MAX\_0410 | Max | Was ist mit dem Besen los? | Option Alwin |
| W1\_HOGG\_ALW\_0420 | Alwin | Verzaubert. Alle Besen hier sind verzaubert. Sie fegen, was sich bewegt. Katzenhaare bewegen sich am schönsten. Frag mich nicht, warum. | Hinweis auf Rätsel 11 |
| W1\_HOGG\_MAX\_0430 | Max | Bis später. | Option Alwin, beendet das Gespräch |
| W1\_HOGG\_ALW\_0440 | Alwin | Geh nur. Der Kessel läuft nicht weg. Also, einmal schon. Lange Geschichte. |  |

Rätsel 6, Teil 1: die Zutaten. Reihenfolge egal. Nach der dritten Zutat verlangt Alwin die letzte aus dem Regal.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_MAX\_0510 | Max | Ei rein. Es blubbert gelb. Wie bei jedem Pfannkuchen. | Ei auf Kessel |
| W1\_HOGG\_MAX\_0520 | Max | Milch rein. Alles. Der ganze Krug. | Ziegenmilch auf Kessel |
| W1\_HOGG\_PIX\_0530 | Pixel | Du hast die ganze Milch in einen Kessel gekippt. Nicht einen Tropfen für den Kater. // Ich merke mir das. Lebenslang. Katzen haben neun davon. | nach 0520 |
| W1\_HOGG\_MAX\_0540 | Max | Pilz rein. Es leuchtet. Pfannkuchen mit Beleuchtung. | Leuchtpilz auf Kessel |
| W1\_HOGG\_ALW\_0550 | Alwin | Nicht den Fisch! Das wäre eine Quiche! | Thunfischdose auf Kessel |
| W1\_HOGG\_MAX\_0560 | Max | Käse rein, und es ist ein Auflauf. Alwin hat Regeln. Glaube ich. | Käsefondue auf Kessel |
| W1\_HOGG\_MAX\_0570 | Max | Den Löffel zum Rühren? Nein. Der ist jetzt ein Zauberstab. Da kleben Erwartungen dran. | Kochlöffel-Zauberstab auf Kessel |
| W1\_HOGG\_ALW\_0580 | Alwin | Drei Zutaten. Jetzt die letzte: eine der sechs Flaschen. Wähle weise. Oder schnell. Beides ergibt eine Geschichte. | nach der dritten Zutat |
| W1\_HOGG\_MAX\_0590 | Max | Erst Ei, Milch und Pilz. Alwin ist da streng. Beim Rezept, nicht beim Rest. | Flasche auf Kessel vor den drei Zutaten |

Rätsel 6, Teil 2: die sechs Flaschen. Alwins Zettel als Nahansicht, Pixels zwei Schnupperproben, Fehlwahl und Lösung (Flasche 3).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_ALW\_0610 | Alwin (Zettel) | Sechs Flaschen im Regal, so lautet die Zahl: ein Trank, ein Öl, zweimal Gift, zweimal Saft. Mehr hat mein Regal nie geschafft. | Nahansicht Hinweiszettel, Strophe 1 |
| W1\_HOGG\_ALW\_0620 | Alwin (Zettel) | Das Fischöl, das stinkt, steht gleich rechts neben dem Trank. Die zwei Riesen sind gleich bis zum Rand. Und am Rand des Regals steht nie, was du suchst. | Nahansicht Hinweiszettel, Strophe 2; Notizbuch trägt die drei Regeln ein |
| W1\_HOGG\_MAX\_0630 | Max | Rechts daneben. Von mir aus gesehen, hoffe ich. Sonst wird's ein Pilz. | Nahansicht, Max |
| W1\_HOGG\_PIX\_0640 | Pixel | Brennnessel. Der Geruch, wenn Pflanzen beleidigt sind. | Pixel schnuppert: Flasche 1 |
| W1\_HOGG\_PIX\_0650 | Pixel | Pilz. Bitter. Trink das, und du wirst selbst einer. Ich habe das gerade erfunden und bin mir trotzdem sicher. | Pixel schnuppert: Flasche 2 |
| W1\_HOGG\_PIX\_0660 | Pixel | Zitrone, Honig, ein Hauch Ärger. Könnte alles sein. Ich lege mich nicht fest. Das ist Stil. | Pixel schnuppert: Flasche 3 |
| W1\_HOGG\_PIX\_0670 | Pixel | Der Trank! Ganz sicher! Riecht nach Erfolg und Zitrone und … Meer. Erfolg riecht nach Meer. | Pixel schnuppert: Flasche 4 (Fischöl); die Nase lügt |
| W1\_HOGG\_PIX\_0680 | Pixel | Pilzgift. Dasselbe wie in der anderen Großen. Die Riesen sind Zwillinge. | Pixel schnuppert: Flasche 5 |
| W1\_HOGG\_PIX\_0690 | Pixel | Brennnessel. Rand des Regals. Da steht nie, was man sucht, das weiß sogar der Zettel. | Pixel schnuppert: Flasche 6 |
| W1\_HOGG\_PIX\_0700 | Pixel | Zwei Flaschen. Mehr schnuppere ich nicht. Meine Nase ist ein Instrument, kein Werkzeug. | dritter Schnupperversuch |
| W1\_HOGG\_MAX\_0710 | Max | Rein damit. | falsche Flasche auf Kessel; grüner Rauch, Pilz-Verwandlung |
| W1\_HOGG\_MAX\_0720 | Max | Ich bin ein Pilz. Ich fühle mich … bodenständig. | Max als Pilz |
| W1\_HOGG\_TOA\_0730 | Toadi | Familie? | aus der Tür, hoffnungsvoll |
| W1\_HOGG\_PIX\_0740 | Pixel | Ein Pilz mit Hoodie. Ich fotografiere das nicht, weil ich keine Hände habe. Das ist mein einziger Grund. |  |
| W1\_HOGG\_ALW\_0750 | Alwin | Falsche Flasche. Keine Sorge, das wächst sich raus. Meistens nach oben. | Verwandlung endet; Flasche steht wieder im Regal |
| W1\_HOGG\_PIX\_0760 | Pixel | Das war das Fischöl. Ich sagte Trank. Meine Nase sagte Trank. Wir stehen zu unseren Fehlern, aber nicht laut. | nach Fehlwahl Flasche 4 |
| W1\_HOGG\_MAX\_0770 | Max | Flasche drei. Nicht am Rand, nicht groß, mit Fischöl rechts daneben. Pixel, du hast gelogen. | Flasche 3 auf Kessel; Lösung |
| W1\_HOGG\_PIX\_0780 | Pixel | Interpretiert. |  |
| W1\_HOGG\_NAR\_0790 | – | Der Kessel leuchtet gelb auf und beleuchtet das ganze Klassenzimmer. | Effekt |
| W1\_HOGG\_ALW\_0800 | Alwin | Bestanden! Der Trank des Leuchtens! Abfüllen, mitnehmen, nicht trinken. Er schmeckt nach Pfannkuchen, und das verwirrt. | gibt den Leuchttrank |
| W1\_HOGG\_MAX\_0810 | Max | Ein Trank, der leuchtet. Die Taschenlampe in meinem Handy kann das auch. Konnte. Akku. | Inventar: Leuchttrank |
| W1\_HOGG\_ALW\_0820 | Alwin | Und weil du bestanden hast, zeige ich dir, wie es nicht geht. Moderworts Zeugnis. Aus dem Archiv. Als Abschreckung. | holt das Zeugnis |
| W1\_HOGG\_MAX\_0830 | Max | „Kräuterkunde: ungenügend. Zaubertränke: ungenügend. Bosheit: befriedigend.“ Und eine Notiz: „Für meinen Mo-Knuddel, stolz!“ | Ansehen: Zeugnis; Notizbuch trägt „Mo-Knuddel“ ein |
| W1\_HOGG\_PIX\_0840 | Pixel | Mo-Knuddel. Das schreibt man sich auf. Das schreibt man sich unter die Pfote. |  |
| W1\_HOGG\_ALW\_0850 | Alwin | Seine Mutti hat es unterschrieben. Er hat es nie abgeholt. Ich glaube, genau deswegen. |  |
| W1\_HOGG\_MAX\_0860 | Max | Ein Zeugnis mit Kosenamen drauf. Das ist schlimmer als jedes Klassenfoto. | Ansehen: Zeugnis im Inventar, zweites Mal |
| W1\_HOGG\_MAX\_0870 | Max | Leuchtet im Dunkeln. Steht jedenfalls drauf. | Ansehen: Leuchttrank im Inventar |
| W1\_HOGG\_MAX\_0880 | Max | Die Prüfung ist bestanden. Noch ein Trank, und Alwin stellt mich ein. | Flasche auf Kessel; nach R6 |

Zurufe im Klassenzimmer (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_PIX\_0910 | Pixel | Der Kessel blubbert, die Flaschen schweigen, Alwin summt ein Rezept. Du könntest ruhig mitmachen. | Zuruf |
| W1\_HOGG\_PIX\_0920 | Pixel | Der Besen im Schrank zuckt noch. Er träumt von meinen Haaren. Ich fühle mich geschmeichelt und bedroht. | Zuruf |

## 7. Troll-Brücke: Das Märchen nach Satzung

Rätsel 3 (dritte Ziege) und Rätsel 4 (a, b, c). Waldemar steht kerzengerade neben dem Schild, unter der Brücke läuft leise ein Grammophon. Die Ziegen warten am Dorfende der Brücke, sobald sie Max folgen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BRUE\_MAX\_0010 | Max | Eine Steinbrücke. Darunter Platz für einen Troll und seine Hobbys. | Ansehen: Brücke |
| W1\_BRUE\_MAX\_0020 | Max | Ein Bach. Knietief. Für einen Troll knöcheltief. Trotzdem Panik. | Ansehen: Bach |
| W1\_BRUE\_MAX\_0030 | Max | Ein Schild mit mehr Paragrafen als meine Handyvertrag. Die Märchen-Satzung. | Ansehen: Schild, öffnet die Nahansicht |
| W1\_BRUE\_WAL\_0040 | Waldemar (Schild) | Paragraf 1: Drei Ziegenböcke überqueren die Brücke, der kleine zuerst, dann der mittlere, dann der große. | Nahansicht Satzung; Notizbuch trägt die Regel ein |
| W1\_BRUE\_WAL\_0050 | Waldemar (Schild) | Paragraf 2: Jeder Bock spricht seinen Satz. Der Kleine: „Friss mich nicht, mein Bruder ist fetter.“ Der Mittlere: „Friss mich nicht, mein Bruder ist noch fetter.“ Der Große: „Friss mich doch, wenn du dich traust.“ | Nahansicht Satzung |
| W1\_BRUE\_WAL\_0060 | Waldemar (Schild) | Paragraf 3: Der Troll geht ins Wasser. Paragraf 14b: Leihgaben sind zurückzugeben. | Nahansicht Satzung |
| W1\_BRUE\_MAX\_0070 | Max | „Der Troll geht ins Wasser.“ Steht da. Von Fallen steht da nichts. Von Fluss auch nicht. | Nahansicht, Max; Hinweis R4c |
| W1\_BRUE\_PIX\_0080 | Pixel | Holz, Farbe, Pedanterie. Jemand hat jeden Paragrafen einzeln poliert. | Schild, Pixel schnuppert |
| W1\_BRUE\_MAX\_0090 | Max | Ein Grammophon unter der Brücke. Der Troll hört heimlich Musicals. Ich sag's keinem. | Ansehen: Grammophon |
| W1\_BRUE\_MAX\_0100 | Max | Notenblätter. „Der Troll und ich, eine Ballade in drei Paragrafen.“ Eigenkomposition. | Ansehen: Notenblätter |
| W1\_BRUE\_GRA\_0110 | Grammophon | … und zwischen zwei Liedern: Milch im Angebot. Nur heute. Nur für Vergessliche. | Benutzen: Grammophon; Radio-Moment, quäkend |
| W1\_BRUE\_MAX\_0120 | Max | Werbung. Auf einem Grammophon. Das ist wie Spam auf Papier. | nach 0110 |
| W1\_BRUE\_PIX\_0130 | Pixel | „Nur für Vergessliche.“ Eine sehr spezielle Zielgruppe. Ich kenne genau einen, der dazugehört. | nach 0120 |
| W1\_BRUE\_MAX\_0140 | Max | Wildblumen. Hübsch. Pollen. Ich merk mir das für niemanden Bestimmten. | Ansehen: Wildblumen |
| W1\_BRUE\_MAX\_0150 | Max | Der Troll. Steht so gerade, als hätte er ein Lineal verschluckt. Mit Fliege. | Ansehen: Waldemar |
| W1\_BRUE\_PIX\_0160 | Pixel | Moos, Regelbuch, Lampenfieber. Dieser Troll riecht nach einer zweiten Karriere. | Waldemar, Pixel |
| W1\_BRUE\_MAX\_0170 | Max | Da geht's in den Wald. Vorbei am Troll. Also noch nicht. | Ansehen: Waldweg; vor R4 |
| W1\_BRUE\_WAL\_0180 | Waldemar | Eine Katze. Paragraf 9: Katzen queren die Brücke jederzeit. Keine hat es je getan. Alle wollten das Ziegenritual sehen. | Pixel auf Waldemar |
| W1\_BRUE\_MAX\_0190 | Max | Da sitzt ein Troll. Mit Regelbuch. Ich geh nicht einfach drüber. | Benutzen: Brücke; vor R4 |

Gespräch mit Waldemar:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_MAX\_0210 | Max | Lass mich rüber. | Option Waldemar |
| W1\_BRUE\_WAL\_0220 | Waldemar | Regel eins: Niemand überquert die Brücke, bevor das Märchen abgelaufen ist. Regel zwei: siehe Regel eins. Regel drei: Lies das Schild. | tippt aufs Regelbuch |
| W1\_BRUE\_MAX\_0230 | Max | Welches Märchen? | Option Waldemar |
| W1\_BRUE\_WAL\_0240 | Waldemar | Das mit den drei Ziegenböcken. Klein, mittel, groß, jeder sagt seinen Satz, und am Ende gehe ich ins Wasser. // Das ist der Teil, den ich … nun. Ich kann nicht schwimmen. Aber Regel ist Regel. | räuspert sich |
| W1\_BRUE\_MAX\_0250 | Max | Was läuft da unten? | Option Waldemar |
| W1\_BRUE\_WAL\_0260 | Waldemar | Nichts! Schlager! Marschmusik! Trollmusik! // … Musicals. Sag es niemandem. Trolle hören keine Musicals. Es steht in keiner Satzung, aber in jedem Blick. | Fliege zittert |
| W1\_BRUE\_MAX\_0270 | Max | Du kannst wirklich nicht schwimmen? | Option Waldemar |
| W1\_BRUE\_WAL\_0280 | Waldemar | Ich sinke wie ein Paragraf. Aber die Satzung sagt Wasser, also Wasser. Ich bin Troll, kein Anwalt. Leider. | Hinweis R4c |
| W1\_BRUE\_MAX\_0290 | Max | Würdest du für mich singen? | Option Waldemar; nach R4, mit Socke, Zauberwald betreten |
| W1\_BRUE\_WAL\_0300 | Waldemar | Hier? Vor der Brücke? Niemals. Die Akustik. Im Wald, zwischen den Pilzen, da trägt der Ton. // Komm. Bevor ich es mir anders überlege. | geht Richtung Wald; weiter in Abschnitt 9, Rätsel 7 |
| W1\_BRUE\_MAX\_0310 | Max | Bis dann. | Option Waldemar, beendet das Gespräch |
| W1\_BRUE\_WAL\_0320 | Waldemar | Auf Wiedersehen. Paragraf 7: Höflichkeit ist Pflicht. Ich halte mich daran. Auch wenn es schwerfällt. |  |

Rätsel 3, dritte Ziege: Der Ziegenfell-Vorleger kommt auf Pixel. Danach Rätsel 4a, die Reihenfolge: Benutzen einer Ziege schickt sie auf die Brücke.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_PIX\_0410 | Pixel | Nein. // Nein. // … Gut. Aber ich will das Fell danach brennen sehen. | Ziegenfell-Vorleger auf Pixel |
| W1\_BRUE\_MAX\_0420 | Max | Du bist die kleine Ziege. |  |
| W1\_BRUE\_PIX\_0430 | Pixel | Ich bin die kleine Ziege. Sag es niemandem. Nicht mal Opa. Besonders nicht Opa. | Pixel-als-Ziege-Sprite |
| W1\_BRUE\_WAL\_0440 | Waldemar | Das ist eine Katze in einem Teppich. | mustert Pixel |
| W1\_BRUE\_MAX\_0450 | Max | Steht irgendwo, dass es keine sein darf? |  |
| W1\_BRUE\_WAL\_0460 | Waldemar | … Ich prüfe. // Nein. Steht nirgends. Zugelassen. Mit Bauchschmerzen. | blättert im Regelbuch |
| W1\_BRUE\_MAX\_0470 | Max | Ich hab zwei Ziegen und einen Kater. Der Troll will drei Ziegen. Fehlt eine Ziege oder ein Teppich. | Benutzen: Ziege, bevor alle drei da sind |
| W1\_BRUE\_WAL\_0480 | Waldemar | HALT! Paragraf eins! Der Kleine zuerst! Alle zurück auf Anfang! | falsche Ziege zuerst; Ziegen kehren um |
| W1\_BRUE\_WAL\_0490 | Waldemar | HALT! Nach dem Kleinen der Mittlere! Nicht der Große! Das ist ein Märchen, keine Horde! | falsche Reihenfolge an zweiter Stelle |
| W1\_BRUE\_PIX\_0500 | Pixel | Ich gehe. Auf allen vieren. In einem Teppich. Wenn das jemand filmt, wechsle ich den Haushalt. | Pixel-Ziege betritt die Brücke |
| W1\_BRUE\_WAL\_0510 | Waldemar | Der Kleine. Korrekt. Und der Satz? | Pixel-Ziege auf der Brücke |
| W1\_BRUE\_WAL\_0520 | Waldemar | Der Mittlere. Korrekt. Und der Satz? | Schmiede-Ziege auf der Brücke, nach dem Kleinen |
| W1\_BRUE\_WAL\_0530 | Waldemar | Der Große. Korrekt. Ich werde ein wenig nervös. Und der Satz? | XXL-Ziege auf der Brücke, nach dem Mittleren |

Rätsel 4b, Ziegisch: Max liest den Text aus der Satzung vor (Benutzen: Schild), dann wechselt der Spieler zu Pixel und redet mit den Ziegen. Der erste Versuch geht schief, der zweite sitzt. Pixel sagt seinen eigenen Satz selbst.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_ZIE\_0610 | Schmiede-Ziege | Mäh. | auf der Brücke, statt Satz |
| W1\_BRUE\_WAL\_0620 | Waldemar | Das ist kein Satz. Das ist ein Laut. Paragraf zwei verlangt den Satz. Auf Ziegisch meinetwegen, aber den Satz. |  |
| W1\_BRUE\_MAX\_0630 | Max | Die sprechen nur Ziegisch. Und ich hab Ziegisch nicht mal als App. |  |
| W1\_BRUE\_PIX\_0640 | Pixel | Ich spreche fließend Ziegisch. Lies vor, ich übersetze. Meistens richtig. | Hinweis R4b |
| W1\_BRUE\_MAX\_0650 | Max | „Friss mich nicht, mein Bruder ist fetter.“ „Friss mich nicht, mein Bruder ist noch fetter.“ „Friss mich doch, wenn du dich traust.“ Vorgelesen. Zufrieden? | Benutzen: Schild, Vorlesen; schaltet Pixels Übersetzung frei |
| W1\_BRUE\_PIX\_0660 | Pixel | Mäh. Friss mich nicht, mein Bruder ist fetter. // Ich sage das als Katze. Es war trotzdem demütigend. | Pixel-Ziege spricht ihren Satz selbst |
| W1\_BRUE\_WAL\_0670 | Waldemar | Akzeptiert. Mit Vorbehalt. Weiter. | nach 0660 |
| W1\_BRUE\_PIX\_0680 | Pixel | Mä-mäh, määh mäh. | Pixel redet mit Schmiede-Ziege, erster Versuch |
| W1\_BRUE\_ZIE\_0690 | Schmiede-Ziege | MÄH! | stürmt auf Waldemar zu, beißt ins Regelbuch |
| W1\_BRUE\_WAL\_0700 | Waldemar | Sie sagte: „Friss das Buch, der Troll ist fetter!“ Das ist nicht der Text! Und das ist mein Buch! | rettet das Regelbuch |
| W1\_BRUE\_PIX\_0710 | Pixel | Ziegisch hat Dialekte. Ich spreche Hochziegisch, sie offenbar Schmiedeziegisch. Ein Vokal, ein Unterschied. // Noch einmal. Langsam. |  |
| W1\_BRUE\_PIX\_0720 | Pixel | Mä-mäh, määh mä-äh. | Pixel redet mit Schmiede-Ziege, zweiter Versuch |
| W1\_BRUE\_ZIE\_0730 | Schmiede-Ziege | Mäh mäh, määh mäh mäh. | würdevoll |
| W1\_BRUE\_WAL\_0740 | Waldemar | „Friss mich nicht, mein Bruder ist noch fetter.“ Korrekt. Wortlaut eingehalten. | nickt |
| W1\_BRUE\_PIX\_0750 | Pixel | Määh. Mäh mäh määäh. | Pixel redet mit XXL-Ziege, erster Versuch |
| W1\_BRUE\_XXL\_0760 | XXL-Ziege | Määäh. | legt sich mitten auf die Brücke und schläft |
| W1\_BRUE\_WAL\_0770 | Waldemar | Sie sagte: „Friss mich doch, ich mach ein Nickerchen.“ Das ist keine Drohung! Das ist eine Mittagspause! |  |
| W1\_BRUE\_PIX\_0780 | Pixel | Lieferziegisch. Alles klingt nach Feierabend. Noch einmal, mit Betonung. |  |
| W1\_BRUE\_PIX\_0790 | Pixel | MÄÄH. Mäh mäh mäh MÄH. | Pixel redet mit XXL-Ziege, zweiter Versuch |
| W1\_BRUE\_XXL\_0800 | XXL-Ziege | MÄÄÄÄH. | steht auf, senkt die Hörner |
| W1\_BRUE\_WAL\_0810 | Waldemar | „Friss mich doch, wenn du dich traust.“ Korrekt. Und ich traue mich nicht. Das steht nicht im Text, das ist privat. | weicht einen Schritt zurück |
| W1\_BRUE\_MAX\_0820 | Max | Drei Ziegen, drei Sätze. Das war mehr Dialogarbeit als in meiner ganzen Schulzeit. |  |

Rätsel 4c, ins Wasser: Waldemar muss laut Paragraf 3 ins Wasser. Der Eimer vom Brunnen macht ein Fußbad daraus.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_WAL\_0910 | Waldemar | Und nun … Paragraf drei. Der Troll geht ins Wasser. | sieht in den Bach, zittert |
| W1\_BRUE\_WAL\_0920 | Waldemar | Ich … kann nicht. Ich stehe hier seit vierzig Jahren und ich kann nicht. | Fliege hängt schief |
| W1\_BRUE\_MAX\_0930 | Max | Ich schubs keinen Troll in einen Bach. Nicht mal für ein Ei. | Benutzen: Waldemar; Bach |
| W1\_BRUE\_WAL\_0940 | Waldemar | Ein leerer Eimer ist kein Wasser. Paragraf drei kennt keine Symbolik. | leerer Eimer auf Waldemar |
| W1\_BRUE\_MAX\_0950 | Max | Waldemar. Da steht Wasser. Nicht Fluss. Nicht Bach. Nur Wasser. | Eimer mit Wasser auf Waldemar |
| W1\_BRUE\_WAL\_0960 | Waldemar | Ein Eimer. Mit Wasser. … Das ist Wasser im Sinne der Satzung. Ich gehe hinein. Mit den Füßen. | setzt sich, Fußbad-Animation |
| W1\_BRUE\_WAL\_0970 | Waldemar | Regel erfüllt. Ahhh. | wackelt mit den Zehen |
| W1\_BRUE\_MAX\_0980 | Max | Fußbad. Zählt. |  |
| W1\_BRUE\_PIX\_0990 | Pixel | Die Füße im Eimer und das Gesicht eines Mannes, der endlich Urlaub hat. Ich kenne den Blick aus dem Spiegel. |  |
| W1\_BRUE\_WAL\_1000 | Waldemar | Die Brücke ist frei. Und: Regel 14b. Leihgaben sind zurückzugeben. | gibt den leeren Eimer zurück; R4 gelöst, Zauberwald und Wasserschloss offen |
| W1\_BRUE\_PIX\_1010 | Pixel | Darf ich den Teppich jetzt ausziehen? | Pixel-Ziege |
| W1\_BRUE\_MAX\_1020 | Max | Behalt ihn noch kurz. Vielleicht gibt's eine Fortsetzung. |  |
| W1\_BRUE\_PIX\_1030 | Pixel | Ich hasse Fortsetzungen. | Pixel legt das Fell ab; Vorleger zurück ins Inventar |
| W1\_BRUE\_MAX\_1040 | Max | Der Troll badet. Die Brücke ist frei. Ich geh einfach rüber. Wie ein normaler Mensch. | Ansehen: Brücke; nach R4 |
| W1\_BRUE\_WAL\_1050 | Waldemar | Noch ein Eimer? Paragraf drei ist erfüllt. Mehr Wasser wäre Luxus. Ich nehme ihn trotzdem. Nein. Regel ist Regel. | Eimer mit Wasser auf Waldemar; nach R4 |

Zurufe an der Troll-Brücke (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BRUE\_PIX\_1110 | Pixel | Der Troll steht so gerade, dass mir der Rücken wehtut. Vom Zuschauen. | Zuruf |
| W1\_BRUE\_PIX\_1120 | Pixel | Unter der Brücke läuft Musik. Sehr leise. Sehr heimlich. Sehr schlecht versteckt. | Zuruf |
| W1\_BRUE\_PIX\_1130 | Pixel | Die Ziegen warten. Ich warte. Der Troll wartet. Das ist kein Abenteuer, das ist ein Wartezimmer. | Zuruf; wenn Ziegen dabei sind, vor R4 |

## 8. Wasserschloss: Ein anderes Schloss

Gag-Szene ohne Rätsel, erreichbar nach Rätsel 4. Zeldinas frühere Wohnung: Umzugskartons, ein Schild „Zu vermieten“, ein misstrauischer Schwan. Toadi kommt angerannt, sobald Max das Tor erreicht.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_WASS\_MAX\_0010 | Max | Ein Schloss im See. Mit Steg. Und Schild. Sieht nach Wasserschaden aus. | Szene, Ankunft |
| W1\_WASS\_TOA\_0020 | Toadi | Danke, Max! Aber die Prinzessin ist in einem anderen Schloss! | rennt heran, Keuchen-Animation |
| W1\_WASS\_MAX\_0030 | Max | Ich hab sie gar nicht gesucht. |  |
| W1\_WASS\_TOA\_0040 | Toadi | Trotzdem danke! Das sagt man so! |  |
| W1\_WASS\_PIX\_0050 | Pixel | Er hat das geübt. Vor dem Spiegel. Mit Betonung auf „anderen“. |  |
| W1\_WASS\_MAX\_0060 | Max | „Zu vermieten. Zwei Zimmer, Seeblick, feucht.“ Die Ehrlichkeit ist neu. | Ansehen: Schild am Tor |
| W1\_WASS\_MAX\_0070 | Max | Umzugskartons. Beschriftet: „Kronen“, „Kronen, Ersatz“, „Kram“. Sie ist weg. Freiwillig und sortiert. | Ansehen: Umzugskartons |
| W1\_WASS\_PIX\_0080 | Pixel | Kartons. Katzen lieben Kartons. Diese sind zugeklebt. Das ist Grausamkeit mit Klebeband. | Ansehen: Kartons, Pixel |
| W1\_WASS\_MAX\_0090 | Max | Zugeklebt. Und nicht meins. Zwei Gründe, der erste reicht. | Benutzen: Kartons |
| W1\_WASS\_MAX\_0100 | Max | Ein zusammengerollter Teppich. Ich lass ihn. Ein Kater im Teppich reicht mir für heute. | Ansehen: Teppich |
| W1\_WASS\_MAX\_0110 | Max | Ein Ruderboot. Ohne Ruder. Wie ein Abo ohne Inhalt. | Ansehen: Ruderboot |
| W1\_WASS\_MAX\_0120 | Max | Ein Schwan. Er guckt, als wäre ich an irgendetwas schuld. | Ansehen: Schwan |
| W1\_WASS\_SWA\_0130 | Schwan | Fauch. | Pixel redet mit Schwan |
| W1\_WASS\_PIX\_0140 | Pixel | Er sagt, die Prinzessin ist vor drei Wochen ausgezogen. Nach oben. Mit allen Kartons. // Und er sagt, ich soll aufhören, ihn anzusehen. Ich höre nicht auf. | Übersetzung; Hinweis auf das Luftschloss |
| W1\_WASS\_MAX\_0150 | Max | Schilf. Raschelt. Nichts drin. Ich hab nachgesehen, Pixel nicht. | Ansehen: Schilf |
| W1\_WASS\_TOA\_0160 | Toadi | Die Katze! Sie ist mir gefolgt! Oder ich ihr! Es ist kompliziert! | Pixel auf Toadi, Wasserschloss |
| W1\_WASS\_PIX\_0170 | Pixel | Ein Schloss ohne Prinzessin, ein See ohne Fische, ein Schwan mit Haltung. Ich würde hier einziehen. Ohne Schwan. | Zuruf |

## 9. Zauberwald: Niesrosen und Lieferdienst

Hier liegen der Leuchtpilz (Rätsel 6), der Ketchup (Rätsel 10, Weg A) und die Niesrosen (Rätsel 7). Rotkäppchen steht am Lieferkarren, der Stolleneingang führt zum Goblin-Bergwerk.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_WALD\_MAX\_0010 | Max | Riesenpilze. Rot mit weißen Punkten. Jedes Spiel meiner Kindheit hat mich davor gewarnt. | Ansehen: Riesenpilze |
| W1\_WALD\_MAX\_0020 | Max | Kleine blaue Pilze, die leuchten. Nachtlicht für Zwerge. | Ansehen: Leuchtpilze |
| W1\_WALD\_MAX\_0030 | Max | Einer reicht. Alwin hat „ein Leuchtpilz“ gesagt, nicht „eine Lichterkette“. | Nehmen: Leuchtpilz |
| W1\_WALD\_PIX\_0040 | Pixel | Nicht essen. Ich sage das zu mir selbst. Laut. Es hilft ein bisschen. | nach 0030 |
| W1\_WALD\_MAX\_0050 | Max | Ein Busch voller rosa Rosen. Alle zu. Wie ein Chat, in dem keiner zuerst schreibt. | Ansehen: Niesrosen, geschlossen |
| W1\_WALD\_PIX\_0060 | Pixel | Niesrosen. Ich rieche sie nicht, sie sind zu. Das ist das Einzige, was ich an ihnen mag. | Ansehen: Niesrosen, Pixel |
| W1\_WALD\_MAX\_0070 | Max | Offen. Und voller Pollen. Jemand mit Heuschnupfen würde hier sofort umdrehen. | Ansehen: Niesrosen, offen; nach R7 |
| W1\_WALD\_MAX\_0080 | Max | Ein Lieferkarren voller Kisten. „Zerbrechlich“, „Oma“, „Ziege, Ersatz“. | Ansehen: Lieferkarren |
| W1\_WALD\_MAX\_0090 | Max | „Rotkäppchens Ketchup. Rot wie Omas Mütze.“ Immerhin kein Blut. | Ansehen: Ketchup am Karren |
| W1\_WALD\_PIX\_0100 | Pixel | Rot, dickflüssig, sieht aus wie Blut, wenn man nicht hinriecht. Goblins riechen nicht hin. | Ansehen: Ketchup, Pixel; Hinweis R10 A |
| W1\_WALD\_MAX\_0110 | Max | Eine Flasche Ketchup. Für den Fall, dass ich irgendwo unterschreiben muss. Oder Pommes finde. | Nehmen: Ketchup; nach Rotkäppchens Erlaubnis |
| W1\_WALD\_MAX\_0120 | Max | Ein Kürbis auf einem Kürbis auf einem Kürbis. Und ein Glasschuh. Größe 38, schätze ich. | Ansehen: Kürbisturm und Glasschuh |
| W1\_WALD\_PIX\_0130 | Pixel | Da hatte es jemand um Mitternacht sehr eilig. | Ansehen: Glasschuh, Pixel |
| W1\_WALD\_MAX\_0140 | Max | Glühwürmchen. Wie kleine WLAN-Lämpchen. Ohne WLAN. Das tut weh. | Ansehen: Glühwürmchen |
| W1\_WALD\_MAX\_0150 | Max | Ein Stolleneingang. Davor Plakate. Die Goblins streiken. Ich dachte, Goblins arbeiten gar nicht. | Ansehen: Stolleneingang |
| W1\_WALD\_MAX\_0160 | Max | Rotkäppchen. Rote Jacke, rote Kappe, Sneaker. Der Korb ist jetzt ein Karren. Zeiten ändern sich. | Ansehen: Rotkäppchen |
| W1\_WALD\_MAX\_0170 | Max | Verdrehte Bäume. Als hätte jemand den Wald beim Wachsen gestört. | Ansehen: Bäume |
| W1\_WALD\_PIX\_0180 | Pixel | Pappe, Ketchup, ein Hauch Oma. Dieser Karren hat mehr erlebt als ich, und ich war im Fernseher. | Pixel schnuppert: Lieferkarren |
| W1\_WALD\_ROT\_0190 | Rotkäppchen | Eine Katze! Hallo! Ich hab Katzenfutter dabei. Nein, hab ich nicht. Das war ein Lieferdienst-Reflex. | Pixel auf Rotkäppchen |

Gespräch mit Rotkäppchen:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_WALD\_MAX\_0210 | Max | Was lieferst du so? | Option Rotkäppchen |
| W1\_WALD\_ROT\_0220 | Rotkäppchen | Alles. Kuchen, Wein, Ziegen, Omas. Omas sind am schwersten zu verpacken. | zählt an den Fingern |
| W1\_WALD\_MAX\_0230 | Max | Kann ich eine Flasche Ketchup haben? | Option Rotkäppchen |
| W1\_WALD\_ROT\_0240 | Rotkäppchen | Der ist für die Goblins. Die bestellen jede Woche Ketchup und nie Pommes. Nimm eine, die merken's nicht. Die zählen in Fackeln. | gibt den Ketchup frei |
| W1\_WALD\_MAX\_0250 | Max | Hast du keine Angst vor dem Wolf? | Option Rotkäppchen |
| W1\_WALD\_ROT\_0260 | Rotkäppchen | Welcher Wolf? Ach, der. Der ist Kunde. Bestellt immer Nachthemden in Oma-Größe. Ich frag nicht. Trinkgeld stimmt. |  |
| W1\_WALD\_MAX\_0270 | Max | Was ist mit den Rosen? | Option Rotkäppchen |
| W1\_WALD\_ROT\_0280 | Rotkäppchen | Niesrosen. Gehen nur auf, wenn einer singt. Richtig singt. Ich hab's probiert. Sie sind zugegangen. Fester. | Hinweis R7 |
| W1\_WALD\_MAX\_0290 | Max | Bis dann. | Option Rotkäppchen, beendet das Gespräch |
| W1\_WALD\_ROT\_0300 | Rotkäppchen | Bewertung nicht vergessen! Fünf Körbe! |  |

Rätsel 7, die Niesrosen. Fehlversuche, dann Waldemars Musical-Nummer (ausgelöst im Gespräch an der Brücke, Abschnitt 7). Max fängt die Pollen in der Sortierenden Socke.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_WALD\_MAX\_0410 | Max | Zu. Die Rosen sind zu, die Socke ist leer. Keiner will hier den ersten Schritt machen. | Socke auf Rosen; vor R7 |
| W1\_WALD\_MAX\_0420 | Max | La. … Nein. Die Rosen haben sich noch fester zugemacht. Das hab ich verdient. | Benutzen: Rosen, Max singt |
| W1\_WALD\_PIX\_0430 | Pixel | Du singst wie ein Modem. Ich meine das als Kompliment. An das Modem. | nach 0420 |
| W1\_WALD\_PIX\_0440 | Pixel | Miaaau. … Sie bleiben zu. Banausen. Im Hof war ich legendär. | Pixel benutzt Rosen |
| W1\_WALD\_MAX\_0450 | Max | Wasser hilft Rosen beim Wachsen. Nicht beim Aufgehen. Hab ich irgendwo gelesen. Oder erfunden. | Eimer auf Rosen |
| W1\_WALD\_WAL\_0460 | Waldemar | Hier. Zwischen den Pilzen. Sieht jemand zu? | Szene: Waldemar kommt in den Wald |
| W1\_WALD\_MAX\_0470 | Max | Nur ich, ein Kater, ein Pilzdiener, eine Lieferantin und drei Ziegen. |  |
| W1\_WALD\_WAL\_0480 | Waldemar | Also niemand. Gut. | legt das Regelbuch ab, Fliege gerade |
| W1\_WALD\_WAL\_0490 | Waldemar | Ich steh an meiner Brücke, seit vierzig Jahren schon … ich prüfe jede Lücke, in jedem Paragraf-o-on … | Musical-Nummer, Gesang; Text als Untertitel |
| W1\_WALD\_WAL\_0500 | Waldemar | … doch heute Nacht, da sag ich: WAAASSEEER! | Schlusston, lang; Niesrosen gehen auf |
| W1\_WALD\_NAR\_0510 | – | Die Rosen öffnen sich eine nach der anderen. Eine rosa Wolke steigt auf. | Aufgehen-Animation |
| W1\_WALD\_MAX\_0520 | Max | Socke auf. Pollen rein. | hält die Socke in die Wolke; Inventar: Socke voller Pollen |
| W1\_WALD\_MAX\_0530 | Max | Die Socke sortiert schon: „Pollen, Kategorie: Niesen.“ Danke, Socke. |  |
| W1\_WALD\_PIX\_0540 | Pixel | Hatschi. // Das war nicht ich. Das war die Natur. Durch mich. | niest |
| W1\_WALD\_WAL\_0550 | Waldemar | War es … gut? Sei ehrlich. Paragraf 12: Kritik muss konstruktiv sein. | außer Atem, hoffnungsvoll |
| W1\_WALD\_MAX\_0560 | Max | Die Rosen sind aufgegangen. Rotkäppchen klatscht. Toadi weint. Das ist mehr Reaktion, als ich je bekommen habe. |  |
| W1\_WALD\_MAX\_0570 | Max | Und du kriegst deinen Auftritt. Am Ende. Ich hab Beziehungen zum Abspann. | Versprechen; Schalter Abspann |
| W1\_WALD\_WAL\_0580 | Waldemar | Im Abspann! Mit Scheinwerfer? … Ich nehme auch eine Fackel. | geht zurück zur Brücke, summt |
| W1\_WALD\_PIX\_0590 | Pixel | Du hast einem Troll einen Auftritt versprochen, den du nicht kontrollierst. Das ist entweder mutig oder Fernsehen. |  |
| W1\_WALD\_MAX\_0600 | Max | Eine Socke voller Pollen. Wer das anfasst, niest sich die Nase weg. Wer eine hat. | Ansehen: Socke voller Pollen |

Zurufe im Zauberwald (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_WALD\_PIX\_0710 | Pixel | Die Pilze leuchten, die Rosen schmollen, der Wald hat Stimmung. Du nicht. | Zuruf |
| W1\_WALD\_PIX\_0720 | Pixel | Irgendetwas beobachtet uns aus dem Gebüsch. Ich bin es nicht. Ich beobachte dich von hier. | Zuruf |

## 10. Luftschloss: Prinzessin Zeldina

Rätsel 9 und Max' Entwicklungsmoment dieser Welt. Oben stehen die Maklerin mit Klemmbrett und Zeldina mit Umzugskarton. Die Kritzelei neben dem Torbogen ist eine Nahansicht und liefert den letzten Passwort-Teil.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_LUFT\_MAX\_0010 | Max | Oben. Ich steh auf einer Wolke. Mein Physiklehrer würde weinen. | Szene, Ankunft |
| W1\_LUFT\_PIX\_0020 | Pixel | Weich. Kühl. Trägt. Ich bleibe hier, bis mich jemand runterträgt. | auf Max' Schulter, springt ab |
| W1\_LUFT\_MAK\_0030 | Maklerin | Besichtigung läuft! Drei Monatsmieten Provision, in Drachengold, sonst keine Schlüssel. Nächster! | ohne aufzusehen |
| W1\_LUFT\_MAX\_0040 | Max | Das Ende der Ranke. Runter geht's leichter. Hoffentlich. | Ansehen: Rankenende |
| W1\_LUFT\_MAX\_0050 | Max | Ein Torbogen in Pastell. Dahinter das Schloss. Zwei Zimmer, Wolkenblick, luftig. | Ansehen: Torbogen |
| W1\_LUFT\_MAX\_0060 | Max | Kinderschrift mit Kreide: „…-Bärchen war hier.“ Der Anfang ist weggewischt. | Ansehen: Kritzelei, öffnet die Nahansicht; Notizbuch trägt „…-Bärchen“ ein |
| W1\_LUFT\_PIX\_0070 | Pixel | Bärchen. Jemand wurde hier Bärchen genannt und hat es überlebt. Knapp. | Nahansicht Kritzelei, Pixel |
| W1\_LUFT\_PIX\_0080 | Pixel | Kreide, alt, und Tränen. Jemand hat beim Schreiben geweint. Bei dem Namen hätte ich das auch. | Pixel schnuppert: Kritzelei |
| W1\_LUFT\_MAX\_0090 | Max | Ein Balkon. Aussicht auf alles. Geländer ohne TÜV. | Ansehen: Balkon |
| W1\_LUFT\_SPI\_0100 | Spiegel | Spiegel, Spiegel … ach, du bist's. Sehr schöne Haare. Sehr lebendig. Sehr mutig. | Ansehen oder Benutzen: Spiegel |
| W1\_LUFT\_MAX\_0110 | Max | Endlich jemand, der mich versteht. | nach 0100 |
| W1\_LUFT\_SPI\_0120 | Spiegel | Ein prachtvoller Kater! Die Statur eines Löwen! Das Ohr: ein Charakterzug! | Pixel benutzt Spiegel |
| W1\_LUFT\_PIX\_0130 | Pixel | Endlich. Jemand mit Augen. Wir nehmen ihn mit. Nein? Dann komme ich wieder. | nach 0120 |
| W1\_LUFT\_MAX\_0140 | Max | Wolken. Begehbar. Ich frag nicht nach. | Ansehen: Wolken |
| W1\_LUFT\_MAX\_0150 | Max | Die Maklerin. Dutt, Klemmbrett, Lächeln wie ein Vertrag mit Kleingedrucktem. | Ansehen: Maklerin |
| W1\_LUFT\_MAX\_0160 | Max | Kurze Haare, Krone mit Schnur festgebunden, Umzugskarton unterm Arm. Entführt sieht anders aus. | Ansehen: Zeldina |
| W1\_LUFT\_PIX\_0170 | Pixel | Karton, Kronenpolitur, Entschlossenheit. Diese Frau riecht nach Plan. | Ansehen: Zeldina, Pixel |
| W1\_LUFT\_MAK\_0180 | Maklerin | Ein Haustier. Zuschlag. Pro Haar. | Pixel auf Maklerin |
| W1\_LUFT\_ZEL\_0190 | Zeldina | Ein Kater! Komm her. Nein? Gut. Katzen, die nicht kommen, sind die ehrlichen. | Pixel auf Zeldina |

Gespräch mit Zeldina, vor dem Team:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_LUFT\_MAX\_0210 | Max | Du bist die Prinzessin? | Option Zeldina |
| W1\_LUFT\_ZEL\_0220 | Zeldina | Zeldina. Ohne Prinzessin, bitte. Ich suche eine Wohnung, keinen Retter. | stellt den Karton ab |
| W1\_LUFT\_MAX\_0230 | Max | Toadi sucht dich überall. | Option Zeldina |
| W1\_LUFT\_ZEL\_0240 | Zeldina | Toadi sucht mich seit drei Jahren. Er ist sehr gut im Suchen und sehr schlecht im Finden. Ich hab ihm dreimal die Adresse geschickt. |  |
| W1\_LUFT\_MAX\_0250 | Max | Wurdest du jetzt entführt oder nicht? | Option Zeldina |
| W1\_LUFT\_ZEL\_0260 | Zeldina | Umzugsfirmen kosten. Dunkle Lords tragen Kisten umsonst. // Man lässt sich entführen, wartet die Rettung ab, und schon wohnt man woanders. Kostenlos. |  |
| W1\_LUFT\_PIX\_0270 | Pixel | Das ist die klügste Person dieser Welt. Ich sage das ungern über Menschen. | nach 0260 |
| W1\_LUFT\_MAX\_0280 | Max | Was ist mit der Maklerin? | Option Zeldina |
| W1\_LUFT\_ZEL\_0290 | Zeldina | Will Provision in Drachengold. Ich hab Kronen, keine Drachen. Und sie lässt nicht mit sich reden. Glaub mir, ich bin bei sechs Monatsmieten. |  |
| W1\_LUFT\_PIX\_0300 | Pixel | Das geht uns nichts an. Wir wollen ein Ei. // Die Wohnungssuche fremder Leute ist das Langweiligste, was ich kenne, und ich kenne Regen. | nach 0290 |
| W1\_LUFT\_MAX\_0310 | Max | Ja. … Trotzdem. | Entwicklungsmoment; schaltet die Maklerin-Optionen frei |
| W1\_LUFT\_MAX\_0320 | Max | Später. | Option Zeldina, beendet das Gespräch |
| W1\_LUFT\_ZEL\_0330 | Zeldina | Ich bin hier. Zwischen Karton und Klemmbrett. |  |

Rätsel 9: Gespräch mit der Maklerin, drei Optionen, eine führt zum Ziel. Die richtige braucht Moderworts Steckbrief im Inventar.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_LUFT\_MAX\_0410 | Max | Zwei Monatsmieten? | Option Maklerin, Feilschen |
| W1\_LUFT\_MAK\_0420 | Maklerin | Vier. Feilschen kostet extra. Fünf, wenn du so weiterguckst. | notiert |
| W1\_LUFT\_ZEL\_0430 | Zeldina | Lass es. Ich bin bei sechs. | nach 0420 |
| W1\_LUFT\_MAX\_0440 | Max | Ich hätte einen Kater als Mitbewohner anzubieten. | Option Maklerin, Haustier |
| W1\_LUFT\_MAK\_0450 | Maklerin | Haustier? Katzenzuschlag. Plus Haarzuschlag. Plus Zuschlag für den Blick, den er mir gerade zuwirft. |  |
| W1\_LUFT\_PIX\_0460 | Pixel | Das ist kein Blick. Das ist mein Gesicht. | nach 0450 |
| W1\_LUFT\_MAX\_0470 | Max | Ich hätte da ein Objekt. Exposé liegt bei. | Option Maklerin, mit Steckbrief; richtig |
| W1\_LUFT\_MAX\_0480 | Max | Dunkler Turm. Sieben Stockwerke, Turmlage, Eigentümer bald verhandlungsbereit. | zeigt den Steckbrief |
| W1\_LUFT\_MAK\_0490 | Maklerin | Sieben Stockwerke … Turmlage … „Gesucht“. Das heißt: motivierter Verkäufer. | Augen werden groß |
| W1\_LUFT\_MAK\_0500 | Maklerin | Das ist die Provision meines Lebens. Besichtigung vertagt! Ich muss einem Lord ein Angebot machen! | klappt das Klemmbrett zu, springt mit Schirm von der Wolke |
| W1\_LUFT\_NAR\_0510 | – | Pixel öffnet den Mund. Es kommt nichts. Zum ersten Mal. | Pixel sprachlos; Halsband blinkt leer |
| W1\_LUFT\_MAX\_0520 | Max | Pixel? |  |
| W1\_LUFT\_PIX\_0530 | Pixel | … |  |
| W1\_LUFT\_ZEL\_0540 | Zeldina | Du hast gerade meinen Entführer an eine Maklerin verkauft. |  |
| W1\_LUFT\_MAX\_0550 | Max | Vermittelt. |  |
| W1\_LUFT\_ZEL\_0560 | Zeldina | Ich komme mit. Jemand, der so verhandelt, braucht jemanden, der trägt. Ich hab Übung. | nimmt den Karton; Zeldina folgt ab jetzt; Begleiter-Schalter |
| W1\_LUFT\_MAX\_0570 | Max | Moment. Wenn die Maklerin Moderwort den Turm abschwatzt … wird der Turm frei. | fällt ihm erst jetzt ein |
| W1\_LUFT\_ZEL\_0580 | Zeldina | Sieben Stockwerke. Turmlage. Ich hab's gehört. | grinst |
| W1\_LUFT\_PIX\_0590 | Pixel | Ich habe mich wieder gefasst. Das war ein Schock. Ich brauche Thunfisch. Sofort. Zur Stabilisierung. | erste Zeile nach der Sprachlosigkeit |
| W1\_LUFT\_TOA\_0600 | Toadi | Danke, Max! Aber die Prinzessin ist in einem anderen … | stürmt keuchend von der Ranke |
| W1\_LUFT\_ZEL\_0610 | Zeldina | Toadi. Ich stehe hier. |  |
| W1\_LUFT\_TOA\_0620 | Toadi | … Schloss. Hoheit! Gefunden! Ich habe dich gefunden! |  |
| W1\_LUFT\_ZEL\_0630 | Zeldina | Du bist mir nachgerannt. |  |
| W1\_LUFT\_TOA\_0640 | Toadi | Das ist Finden mit Anlauf. | R9 gelöst |

Gespräch mit Zeldina im Team (überall, wo sie folgt):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_LUFT\_MAX\_0710 | Max | Was weißt du über Moderwort? | Option Zeldina; nach R9 |
| W1\_LUFT\_ZEL\_0720 | Zeldina | Alle nennen ihn Moderwort. Seine Mutter nicht. Die hatte einen Spitznamen für ihn, vier Teile, furchtbar. // Ich weiß nur, dass er mit „Mo“ anfängt. Es ist das Passwort zu seiner Geheimtür. Er ist ein sehr schlechter Dunkler Lord. | Notizbuch trägt „Mo“ als Anfang ein |
| W1\_LUFT\_MAX\_0730 | Max | Was willst du mit dem Turm? | Option Zeldina; nach R9 |
| W1\_LUFT\_ZEL\_0740 | Zeldina | Wohnen. Einziehen. Nie wieder umziehen. Vielleicht einen Kronleuchter. Ich träume groß, aber mit Festpreis. | Hinweis R12 |
| W1\_LUFT\_MAX\_0750 | Max | Kennst du die Goblins? | Option Zeldina; nach R9, vor R10 |
| W1\_LUFT\_ZEL\_0760 | Zeldina | Grimmzahn? Streikt seit Jahren. Will eigentlich nur einen Posten mit Schlüsselbund. Ein Turm bräuchte einen Hausmeister. Nur so ein Gedanke. | Hinweis R10, Weg B |
| W1\_LUFT\_MAX\_0770 | Max | Gehen wir. | Option Zeldina, beendet das Gespräch |
| W1\_LUFT\_ZEL\_0780 | Zeldina | Du vorne. Ich trage. |  |

Zurufe im Luftschloss (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_LUFT\_PIX\_0810 | Pixel | Wir stehen auf einer Wolke. Ich habe aufgehört, Fragen zu stellen, und empfehle dir dasselbe. | Zuruf |
| W1\_LUFT\_PIX\_0820 | Pixel | Die Maklerin hat dich zweimal taxiert. Du bist für sie ein Objekt mit Sanierungsbedarf. | Zuruf; vor R9 |

## 11. Goblin-Bergwerk: Die Goblin-Frage

Rätsel 10 mit zwei Lösungswegen. Weg A: Leuchttrank als Fackel, Tarifvertrag mit Ketchup unterschrieben. Weg B: Hausmeisterposten für Grimmzahn, Zeldina bürgt. Beide Wege enden mit dem Arbeitslied (dritter Passwort-Teil) und der offenen Rune-Tür.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BERG\_GRI\_0010 | Grimmzahn | STREIK! Keiner kommt durch! Nicht mal du, Langer! | Szene, erstes Betreten |
| W1\_BERG\_MAX\_0020 | Max | Sieht aus wie Montagmorgen, nur grüner. | Ansehen: Streikposten |
| W1\_BERG\_MAX\_0030 | Max | Streikschilder ohne Text. Die Forderung ist so klar, dass sie keiner aufschreiben musste. | Ansehen: Streikschilder |
| W1\_BERG\_MAX\_0040 | Max | Loren auf Schienen. Die Schienen enden im Streikposten. Sehr konsequent. | Ansehen: Loren |
| W1\_BERG\_MAX\_0050 | Max | Sogar die Kaffeemaschine streikt. | Ansehen: Kaffeemaschine |
| W1\_BERG\_PIX\_0060 | Pixel | Kaffee von vorgestern. Das ist kein Streik, das ist Resignation mit Filter. | Ansehen: Kaffeemaschine, Pixel |
| W1\_BERG\_MAX\_0070 | Max | Fackeln, die so schwach leuchten, dass sie praktisch im Nachtmodus sind. | Ansehen: Fackeln |
| W1\_BERG\_MAX\_0080 | Max | Eine Steinwand mit einer Rune. Sieht nach Tür aus. Sieht nach „noch nicht“ aus. | Ansehen: Rune-Tür; vor R10 |
| W1\_BERG\_MAX\_0090 | Max | Die Rune leuchtet. Der Kellereingang zum Turm. Nach oben geht's also nach unten. | Ansehen: Rune-Tür; nach R10 |
| W1\_BERG\_MAX\_0100 | Max | Der Gewerkschaftsboss. Gelber Helm, Trillerpfeife, Unterbiss. Der verhandelt um jeden Stein. | Ansehen: Grimmzahn |
| W1\_BERG\_MAX\_0110 | Max | Ein dünner Goblin mit Spitzhacke und Stirnlampe. Die Lampe ist aus. Das ist der Streik. | Ansehen: Goblin-Arbeiter 1 |
| W1\_BERG\_MAX\_0120 | Max | Ein runder Goblin mit Becher. Er schläft im Stehen. Respekt. Das schaffe ich nur im Liegen. | Ansehen: Goblin-Arbeiter 2 |
| W1\_BERG\_PIX\_0130 | Pixel | Schlaf, Kaffee, Schweinsleder. Dieser Goblin hat sein Leben im Griff. | Ansehen: Goblin 2, Pixel |
| W1\_BERG\_MAX\_0140 | Max | Ich blase nicht in fremde Fackeln. | Benutzen: Fackeln |
| W1\_BERG\_MAX\_0150 | Max | Sie zischt mich an. Solidarität. | Benutzen: Kaffeemaschine |
| W1\_BERG\_MAX\_0160 | Max | Lorenfahrt? Zehn Meter bis zum Streikposten. Ich geh zu Fuß. | Benutzen: Lore |
| W1\_BERG\_MAX\_0170 | Max | Zu. Eine Rune ist kein Klingelknopf. | Benutzen: Rune-Tür; vor R10 |
| W1\_BERG\_GRI\_0180 | Grimmzahn | Eine Katze. Gewerkschaft der Katzen? Gibt's nicht? Und das lasst ihr euch gefallen? | Pixel auf Grimmzahn |
| W1\_BERG\_GO2\_0190 | Goblin 2 | Mmh. Weich. Darf ich … nein? Okay. | Pixel auf Goblin 2 |
| W1\_BERG\_GO1\_0200 | Goblin 1 | Haare. Ich hab Spitzhacke, keine Bürste. Weg. | Pixel auf Goblin 1 |

Gespräch mit Grimmzahn:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BERG\_MAX\_0310 | Max | Warum streikt ihr? | Option Grimmzahn |
| W1\_BERG\_GRI\_0320 | Grimmzahn | Bessere Fackeln! Unsere leuchten wie nasse Kerzen! Weißt du, wie oft ich im Dunkeln den Daumen getroffen habe? // Ich habe keinen mehr! | hält die Hand hoch |
| W1\_BERG\_MAX\_0330 | Max | Was wollt ihr genau? | Option Grimmzahn |
| W1\_BERG\_GRI\_0340 | Grimmzahn | Licht. Und einen Tarifvertrag. Schriftlich. Unterschrieben mit Blut. Wir sind traditionell. | Hinweis R10 A |
| W1\_BERG\_MAX\_0350 | Max | Blut. | Antwort auf 0340 |
| W1\_BERG\_GRI\_0360 | Grimmzahn | Oder etwas, das so aussieht. Wir sind traditionell, nicht genau. |  |
| W1\_BERG\_MAX\_0370 | Max | Wie komm ich durch? | Option Grimmzahn |
| W1\_BERG\_GRI\_0380 | Grimmzahn | Gar nicht. Oder du gibst uns Licht und unterschreibst. Oder du machst mir ein besseres Angebot. Ich bin Gewerkschafter, keine Mauer. |  |
| W1\_BERG\_MAX\_0390 | Max | Wie wär's mit einem Posten als Hausmeister im Dunklen Turm? | Option Grimmzahn; nur mit Zeldina im Team; Weg B |
| W1\_BERG\_GRI\_0400 | Grimmzahn | Hausmeister? Mit Schlüsselbund? Eigenem Keller? … Wer bürgt? | misstrauisch |
| W1\_BERG\_ZEL\_0410 | Zeldina | Ich. Der Turm wird demnächst neu vergeben. Ich hätte gern jemanden, der sich über alles beschwert. Das hält die Mieter wach. |  |
| W1\_BERG\_GRI\_0420 | Grimmzahn | Angenommen! Streik ausgesetzt! Für mich. Die anderen streiken weiter, aber leiser. | Weg B gewählt; weiter mit 0610 |
| W1\_BERG\_MAX\_0430 | Max | Bis dann. | Option Grimmzahn, beendet das Gespräch |
| W1\_BERG\_GRI\_0440 | Grimmzahn | Geh. Der Streik bleibt. Der Streik bleibt immer. Außer, jemand bringt Licht. |  |

Weg A: Leuchttrank und Ketchup. Fehlversuche inklusive.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BERG\_MAX\_0510 | Max | Hier. Ein Trank, der leuchtet. Füllt eure Fackeln damit. | Leuchttrank auf Grimmzahn oder Fackeln |
| W1\_BERG\_GRI\_0520 | Grimmzahn | Das … das ist Licht. Richtiges Licht. Ich sehe meinen Daumen. Ich habe doch noch einen! | Fackeln leuchten gelb |
| W1\_BERG\_GO1\_0530 | Goblin 1 | Hell! |  |
| W1\_BERG\_GO2\_0540 | Goblin 2 | Zu hell. | kneift die Augen zu |
| W1\_BERG\_GRI\_0550 | Grimmzahn | Jetzt der Vertrag. Blut. Hier unten, neben dem Kreuz. | hält den Tarifvertrag hin |
| W1\_BERG\_GRI\_0560 | Grimmzahn | Erst Licht, dann Blut. Wir sind traditionell. | Ketchup auf Grimmzahn vor dem Leuchttrank |
| W1\_BERG\_MAX\_0570 | Max | Unterschrift. In Rot. Dickflüssig. Keiner riecht dran. | Ketchup auf Tarifvertrag |
| W1\_BERG\_GRI\_0580 | Grimmzahn | Riecht nach … Sieg. Angenommen! | schnuppert, unterschreibt selbst mit dem Daumen, den er nicht hat |
| W1\_BERG\_PIX\_0590 | Pixel | Er hat Ketchup als Blut akzeptiert. Ich habe mehr Respekt vor Goblins verloren, als ich je hatte. | Weg A gewählt; weiter mit 0610 |
| W1\_BERG\_GRI\_0600 | Grimmzahn | Fisch? Wir sind Goblins, keine Möwen. | Thunfischdose auf Grimmzahn |
| W1\_BERG\_GRI\_0605 | Grimmzahn | Ein Zauberstab! Zauberer! Noch so einer! Weg damit, ich hab schlechte Erfahrungen! | Kochlöffel-Zauberstab auf Grimmzahn |

Das Arbeitslied (beide Wege). Zwei Goblins halten Schilder mit den Silben hoch; der Text läuft als Untertitel und landet im Notizbuch.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BERG\_GRI\_0610 | Grimmzahn | Zur Feier des Tages: das Arbeitslied! Schilder hoch! | Weg A: „Feier des Lichts“; Weg B: „Feier der Beförderung“ (Textvariante in Regie) |
| W1\_BERG\_GO1\_0620 | Goblin 1 und 2 | Hau den Stein, hau den Stein! Knuddel-Puddi, hau den Stein! | Gesang, Schilder „Knuddel“ und „Puddi“; Notizbuch trägt „Knuddel-Puddi“ ein |
| W1\_BERG\_GO1\_0630 | Goblin 1 und 2 | Dunkel war's und keiner lacht, Knuddel-Puddi hat's gebracht! | Gesang, zweite Strophe |
| W1\_BERG\_MAX\_0640 | Max | Knuddel-Puddi? |  |
| W1\_BERG\_GRI\_0650 | Grimmzahn | Der Herr vom Turm. Hat als Schüler mal das Bergwerk besucht, und seine Mutti hat ihn so gerufen. Vor allen. // Wir singen das seit zwanzig Jahren. Es ist unser bestes Lied. |  |
| W1\_BERG\_PIX\_0660 | Pixel | Mo-Knuddel. Knuddel-Puddi. Das Puzzle setzt sich zusammen, und es ist peinlicher, als ich dachte. | wenn das Zeugnis schon im Notizbuch steht |
| W1\_BERG\_MAX\_0670 | Max | Das ist kein Passwort mehr. Das ist eine Kindheit. |  |
| W1\_BERG\_GRI\_0680 | Grimmzahn | Die Rune-Tür. Führt in den Keller des Turms. Wir haben sie nie benutzt. Zu dunkel. | Rune leuchtet auf, Tür öffnet sich |
| W1\_BERG\_MAX\_0690 | Max | Jetzt nicht mehr. | R10 gelöst |
| W1\_BERG\_ZEL\_0700 | Zeldina | Ein Keller. Trocken? Dann nehme ich ihn. | wenn Zeldina im Team |
| W1\_BERG\_MAX\_0710 | Max | Ein Tarifvertrag mit Ketchup-Unterschrift. Rechtlich wackelig. Geschmacklich okay. | Ansehen: Tarifvertrag im Inventar; Weg A |

Zurufe im Bergwerk (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BERG\_PIX\_0810 | Pixel | Zwei Goblins, ein Boss, null Licht. Das ist weniger ein Streik als ein Keller mit Meinung. | Zuruf |
| W1\_BERG\_PIX\_0820 | Pixel | Der runde Goblin hat seit fünf Minuten nicht geblinzelt. Entweder schläft er mit offenen Augen, oder er ist eine Fackel. | Zuruf |

## 12. Dunkler Turm, Keller und Abstellkammer 1: Die Besen

Rätsel 11, Teil 2. Drei verzauberte Besen fegen feste Routen (gerade, Zickzack, Schleife). Max beobachtet, dann wechselt der Spieler zu Pixel und klickt die drei Kreuzungen im Fliesenmuster an; die Besen jagen den Haaren in die Abstellkammer, Max schließt die Tür.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_TURM\_MAX\_0010 | Max | Der Keller des Dunklen Turms. Violett, feucht, und drei Besen fegen in Mustern. Wie ein Bildschirmschoner mit Aggressionen. | Szene, Ankunft |
| W1\_TURM\_PIX\_0020 | Pixel | Besen. Drei. Verzaubert. Ich kenne den Blick. Der in der Schule hatte ihn auch, kurz bevor er mich jagte. |  |
| W1\_TURM\_ZEL\_0030 | Zeldina | Ein Hausmeister hätte hier nicht geschadet. | wenn Zeldina folgt |
| W1\_TURM\_GRI\_0040 | Grimmzahn | Ich fange an, wenn die Besen weg sind. Steht im Vertrag. Den ich mir gerade ausdenke. | nur Weg B; Grimmzahn folgt |
| W1\_TURM\_MAX\_0050 | Max | Eine gerade Linie aus roten Fliesen. Ein Besen fegt sie rauf und runter. Immer gleich. Wie mein Tagesablauf. | Ansehen: gerade Route |
| W1\_TURM\_MAX\_0060 | Max | Zickzack-Fliesen. Der Besen hält sich dran, als gäbe es Punkte dafür. | Ansehen: Zickzack-Route |
| W1\_TURM\_MAX\_0070 | Max | Eine Schleife aus Fliesen. Der dritte Besen dreht Runden. Autoplay für Besen. | Ansehen: Schleifen-Route |
| W1\_TURM\_MAX\_0080 | Max | Hier kreuzen sich zwei Wege. Guter Platz, um etwas fallen zu lassen. Etwas Haariges. | Ansehen: Kreuzung (jede der drei) |
| W1\_TURM\_MAX\_0090 | Max | Ein Besen mit Gesicht. Wütend. Er fegt alles, was sich bewegt. Ich bewege mich lieber nicht. | Ansehen: Besen |
| W1\_TURM\_PIX\_0100 | Pixel | Er guckt mich an. Er guckt mein Fell an. Ich fühle mich wie Beute und Werkzeug gleichzeitig. | Ansehen: Besen, Pixel |
| W1\_TURM\_MAX\_0110 | Max | Eine Wendeltreppe nach oben. Die Besen lassen keinen durch. Nicht mal Zeldina mit Karton. | Ansehen: Treppe nach oben; vor Lösung |
| W1\_TURM\_MAX\_0120 | Max | Eine Tür, einen Spalt offen. Abstellkammer. Da gehört Gerümpel rein. Oder Besen. | Ansehen: Kammertür |
| W1\_TURM\_MAX\_0130 | Max | Die Treppe zurück ins Bergwerk. Da unten singen sie immer noch. | Ansehen: Kellertreppe |
| W1\_TURM\_MAX\_0140 | Max | Ich hab keine Haare zum Verlieren. Also doch, aber nicht so. | Max benutzt Kreuzung |
| W1\_TURM\_PIX\_0150 | Pixel | Wechsel zu mir. Ich habe Haare, ich habe Würde, und ich opfere genau eines davon. | nach 0140; Hinweis |
| W1\_TURM\_NAR\_0160 | – | Ein Besen erwischt Max und fegt ihn in einem Schwung zurück zur Treppe. | Besen trifft Max |
| W1\_TURM\_PIX\_0170 | Pixel | Du wurdest gefegt. Wie Staub. Ich habe nichts dagegen getan, weil es lehrreich war. | nach 0160, erstes Mal |
| W1\_TURM\_PIX\_0180 | Pixel | Schon wieder. Du bist der am häufigsten gefegte Mensch dieser Welt. Das ist ein Titel. | nach 0160, ab dem zweiten Mal |
| W1\_TURM\_PIX\_0190 | Pixel | Hier? Hier fegt keiner. Haare auf dem falschen Boden sind nur Haare. | Pixel benutzt Boden außerhalb der Kreuzungen |
| W1\_TURM\_PIX\_0200 | Pixel | Schüttel. // Das war ein Pfund Fell. Ich fühle mich nackt und produktiv. | Pixel benutzt erste Kreuzung; Haare-Animation; Besen jagt der Spur hinterher |
| W1\_TURM\_PIX\_0210 | Pixel | Noch einmal. Mein Winterfell geht für diese Aufgabe drauf. | zweite Kreuzung |
| W1\_TURM\_PIX\_0220 | Pixel | Die letzte Spur. Wenn Opa fragt, warum ich kahl bin: Weltrettung. | dritte Kreuzung; alle Besen rasen in die Kammer |
| W1\_TURM\_PIX\_0230 | Pixel | Pfoten. Türen. Das Thema hatten wir. | Pixel benutzt Kammertür |
| W1\_TURM\_MAX\_0240 | Max | Tür zu. Drei Besen, eine Kammer. Wie Pixel und eine Heizung. | Max benutzt Kammertür, Besen drin; R11 Teil 2 gelöst |
| W1\_TURM\_PIX\_0250 | Pixel | Ich höre sie fegen. Sie fegen glücklich. Es ist das Einzige, was sie können, und sie dürfen es. Beneidenswert. |  |
| W1\_TURM\_ZEL\_0260 | Zeldina | Treppe frei. Ich geh vor, ich hab den Karton. | wenn Zeldina folgt |
| W1\_TURM\_MAX\_0270 | Max | Noch offen. Erst müssen alle drei da drin sein. Sonst kommt einer zurück und fegt mich. | Max benutzt Kammertür, bevor alle Besen drin sind |
| W1\_TURM\_PIX\_0280 | Pixel | Die Besen fegen. Du schaust. Einer von uns muss sich bewegen, und ich lehne ab. | Zuruf |
| W1\_TURM\_PIX\_0290 | Pixel | Drei Muster, drei Besen, drei Kreuzungen. Ich sehe ein Muster, und ich hasse Muster. | Zuruf |

## 13. Smaugis Abstellkammern: Aufräumen und die Geheimtür

Rätsel 12 und Rätsel 11, Teil 1. Smaugi sitzt auf seinem Kram, die Besen fegen die Haufen zu Stapeln. Humbert, Grimmzahn und Zeldina sind schon da. Die kichernde Geheimtür steht oben an der Treppe.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_SMAU\_SMA\_0010 | Smaugi | Nicht anfassen! Das … das ist alles noch gut. | Szene, Ankunft; Staubwedel erhoben |
| W1\_SMAU\_MAX\_0020 | Max | Ein Drache. Mit Kopftuch. Auf Gerümpel. |  |
| W1\_SMAU\_SMA\_0030 | Smaugi | Seit die Besen da sind, finde ich alles. Das ist noch schlimmer. | seufzt, Rauchwölkchen |
| W1\_SMAU\_HUM\_0040 | Humbert | Fondue-Lieferung für eine Einweihung! Wer hat bestellt? | kommt die Treppe hoch, Topf in den Armen |
| W1\_SMAU\_ZEL\_0050 | Zeldina | Ich. Vorsichtshalber. |  |
| W1\_SMAU\_GRI\_0060 | Grimmzahn | Ich besichtige meinen Arbeitsplatz. Es ist eine Katastrophe. Ich liebe sie. | Weg B |
| W1\_SMAU\_GRI\_0070 | Grimmzahn | Keiner hat mich gefragt! Ich beschwere mich trotzdem. Formal. Schriftlich. Mit Ketchup. | Weg A |
| W1\_SMAU\_MAX\_0080 | Max | Größer als Ostern. Kleiner als mein Problem. | Ansehen: Drachenei im Nest |
| W1\_SMAU\_PIX\_0090 | Pixel | Ein Drache bewacht ein Ei, als wär's Bio-Freiland. Wozu? Das ist ein Ei. Es gehört in einen Topf. Drei Minuten. // Weich. Zum Frühstück. Ich habe eine Liste. | Ansehen: Drachenei, Pixel; Andeutung Finale |
| W1\_SMAU\_MAX\_0100 | Max | Gold. Haufenweise. Und er sitzt drauf wie auf einem Sitzsack. | Ansehen: Goldhaufen |
| W1\_SMAU\_MAX\_0110 | Max | Ein Kronleuchter, schief. Zeldina guckt ihn an wie ich ein neues Handy. | Ansehen: Kronleuchter |
| W1\_SMAU\_MAX\_0120 | Max | Ein Bündel rostiger Schwerter. Ohne Namen. Für Humbert wäre das wie Welpen im Tierheim. | Ansehen: Schwerter-Bündel |
| W1\_SMAU\_MAX\_0130 | Max | Alte Fackeln, ausgebrannt. Für die Goblins trotzdem besser als ihre. | Ansehen: Fackel-Bündel |
| W1\_SMAU\_MAX\_0140 | Max | Wenn ich da reinblase, fängt's bestimmt an zu regnen. | Ansehen: Okarina |
| W1\_SMAU\_MAX\_0150 | Max | Töööt. Es regnet nicht. Smaugi hat kurz hochgeschaut. Das reicht mir. | Benutzen: Okarina |
| W1\_SMAU\_PIX\_0160 | Pixel | Wer das rauszieht, wird König. Oder kriegt Rücken. | Ansehen: Schwert im Stein, Pixel |
| W1\_SMAU\_MAX\_0170 | Max | Steckt fest. Ich bin also kein König. Das wusste ich seit der Grundschule. | Benutzen: Schwert im Stein |
| W1\_SMAU\_MAX\_0180 | Max | Rostiger Helm, kaputter Spiegel, eine Socke, eine Teekanne. Ein Flohmarkt ohne Kundschaft. | Ansehen: Deko-Kram |
| W1\_SMAU\_PIX\_0190 | Pixel | Staub, Gold, Drachenschweiß. Und irgendwo da drin eine einzelne Socke, die nach Abenteuer riecht. | Pixel schnuppert: Haufen |
| W1\_SMAU\_MAX\_0200 | Max | Eine Treppe zum obersten Stockwerk. Davor eine Tür, die … kichert? | Ansehen: Geheimtür |
| W1\_SMAU\_MAX\_0210 | Max | Ein Drache mit Kopftuch und Staubwedel. Er sieht aus, als bräuchte er Urlaub und einen Container. | Ansehen: Smaugi |
| W1\_SMAU\_SMA\_0220 | Smaugi | Eine Katze! Die kann ich nicht behalten. Oder? Nein. Ich habe schon genug Fell im Haufen. | Pixel auf Smaugi |
| W1\_SMAU\_MAX\_0230 | Max | Ordentliche Stapel. Die Besen haben gefegt. Smaugi sieht zum ersten Mal den Boden und leidet. | Ansehen: Stapel; aufgeräumte Fassung |

Gespräch mit Smaugi:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SMAU\_MAX\_0310 | Max | Wem gehört das alles? | Option Smaugi |
| W1\_SMAU\_SMA\_0320 | Smaugi | Mir. Alles. Jeder Löffel. Ich könnte es brauchen. Irgendwann. Man weiß nie, wann man dreihundert Teekannen braucht. | streichelt eine Teekanne |
| W1\_SMAU\_MAX\_0330 | Max | Gibst du mir das Ei? | Option Smaugi |
| W1\_SMAU\_SMA\_0340 | Smaugi | Das Ei? Das EI? Es ist das Einzige hier, das keinen Staub ansetzt. Ich gebe nichts her. // Außer, jemand braucht es wirklich. Wirklich wirklich. | Hinweis R12 |
| W1\_SMAU\_MAX\_0350 | Max | Was ist mit der Tür da oben? | Option Smaugi |
| W1\_SMAU\_SMA\_0360 | Smaugi | Moderworts Geheimtür. Sie kichert, wenn man falsch rät. Sie kichert viel. Ich halte mir die Ohren zu, aber ich habe nur Krallen dafür. |  |
| W1\_SMAU\_MAX\_0370 | Max | Warum sammelst du das alles? | Option Smaugi |
| W1\_SMAU\_SMA\_0380 | Smaugi | Ich sammle nicht. Ich bewahre. Für den Fall. Welchen Fall? Den Fall! Irgendeinen Fall! | schnieft |
| W1\_SMAU\_MAX\_0390 | Max | Bis gleich. | Option Smaugi, beendet das Gespräch |
| W1\_SMAU\_SMA\_0400 | Smaugi | Geh nur. Aber nimm nichts mit. Doch, nimm. Nein. Ach. |  |

Rätsel 12: drei Schätze, drei Abnehmer. Max zieht einen Gegenstand auf den passenden Abnehmer; Smaugi fragt jedes Mal, ob es glücklich macht.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_SMAU\_SMA\_0510 | Smaugi | Macht dich das glücklich? | Max nimmt Schwerter, Fackeln oder Kronleuchter |
| W1\_SMAU\_MAX\_0520 | Max | Mich nicht. Aber ich kenne da jemanden. | nach 0510; Gegenstand im Inventar |
| W1\_SMAU\_HUM\_0530 | Humbert | Schwerter! Ohne Namen! Ihr armen Dinger. Du heißt Ingrid. Du Ingrid die Zweite. Und du … Gerhard der Dritte. | Schwerter auf Humbert; Kram-hergeben-Animation |
| W1\_SMAU\_SMA\_0540 | Smaugi | Sie haben jetzt Namen. Das macht mich … glücklich. Ist das erlaubt? | schnieft |
| W1\_SMAU\_GRI\_0550 | Grimmzahn | Fackeln! Ausgebrannt, aber dick! Die tränken wir in irgendwas, egal, es sind FACKELN! | Fackeln auf Grimmzahn |
| W1\_SMAU\_SMA\_0560 | Smaugi | Macht dich das glücklich? | an Grimmzahn |
| W1\_SMAU\_GRI\_0570 | Grimmzahn | Nein. Aber zufrieden. Für einen Goblin ist das dasselbe. |  |
| W1\_SMAU\_ZEL\_0580 | Zeldina | Der. Genau der. Über den Esstisch, den ich noch nicht habe. | Kronleuchter auf Zeldina |
| W1\_SMAU\_SMA\_0590 | Smaugi | Macht dich das glücklich? | an Zeldina |
| W1\_SMAU\_ZEL\_0600 | Zeldina | Sehr. |  |
| W1\_SMAU\_SMA\_0610 | Smaugi | Dann … nehmt. Ich habe Platz. Ich sehe Boden. Ich habe seit Jahren keinen Boden gesehen. | nach allen drei; Gerührt-schniefen-Animation |
| W1\_SMAU\_SMA\_0620 | Smaugi | Nimm das Ei. Es war nie meins. Es hat nur hier gelegen, und ich hab es gewärmt. Das ist das Einzige, was ich kann. | gibt das Drachenei; R12 gelöst |
| W1\_SMAU\_MAX\_0630 | Max | Ich pass drauf auf. Opa sagt, es muss ganz bleiben. Alles hängt davon ab. Ich weiß immer noch nicht, was. | Inventar: Drachenei |
| W1\_SMAU\_PIX\_0640 | Pixel | Ein Ei. Von einem Drachen gewärmt. Wenn das nicht weich wird, wird nichts weich. |  |
| W1\_SMAU\_GRI\_0650 | Grimmzahn | Schwerter? Wir hauen Steine, keine Ritter. | Schwerter auf Grimmzahn |
| W1\_SMAU\_ZEL\_0660 | Zeldina | Fackeln in einem Turm voller Holz? Nein danke. Ich hab Pläne mit dem Turm. | Fackeln auf Zeldina |
| W1\_SMAU\_HUM\_0670 | Humbert | Zu fein für den Pony-Express. Bei mir hängen Schinken von der Decke. | Kronleuchter auf Humbert |
| W1\_SMAU\_SMA\_0680 | Smaugi | Fisch? Ich bin ein Drache. Ich esse … auch Fisch. Aber nicht jetzt. Ich habe Kummer. | Thunfischdose auf Smaugi |
| W1\_SMAU\_MAX\_0690 | Max | Das Gold bleibt. Ich will nicht derjenige sein, der einen Drachen beklaut. In keiner Staffel. | Benutzen: Goldhaufen |

Rätsel 11, Teil 1: die Geheimtür. Benutzen öffnet die Eingabe: Der Spieler ordnet die vier Teile aus dem Notizbuch. Falsche Reihenfolgen bringen Gekicher.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_SMAU\_TUE\_0710 | Geheimtür | Passwort, bitte. Kicher. | Benutzen: Geheimtür |
| W1\_SMAU\_TUE\_0720 | Geheimtür | Unvollständig. Kicher. Such weiter. | weniger als vier Teile im Notizbuch |
| W1\_SMAU\_TUE\_0730 | Geheimtür | Kicher! Nein! Kicherkicher! | falsche Reihenfolge |
| W1\_SMAU\_MAX\_0740 | Max | Die Tür lacht mich aus. Wie Autokorrektur. | nach 0730 |
| W1\_SMAU\_TUE\_0750 | Geheimtür | Puddi-Bärchen-Mo? Das ist ja nicht mal ein Name. Kicher. | zweite falsche Reihenfolge |
| W1\_SMAU\_MAX\_0760 | Max | Mo-Knuddel-Puddi-Bärchen. | richtige Reihenfolge |
| W1\_SMAU\_TUE\_0770 | Geheimtür | … Kicher. Richtig. Mama? | öffnet sich; R11 Teil 1 gelöst |
| W1\_SMAU\_PIX\_0780 | Pixel | Die Tür hat „Mama“ gesagt. Ich brauche einen Moment. |  |
| W1\_SMAU\_ZEL\_0790 | Zeldina | Sieben Stockwerke, und die Tür hat einen Mutterkomplex. Ich nehme ihn trotzdem. |  |
| W1\_SMAU\_PIX\_0800 | Pixel | Der Drache seufzt alle dreißig Sekunden. Ich habe mitgezählt, weil ich sonst nichts zu tun hatte. | Zuruf |
| W1\_SMAU\_PIX\_0810 | Pixel | Die Besen fegen Smaugis Haufen zu Stapeln. Ordnung durch Terror. Ich kenne das von Oma. | Zuruf |

## 14. Thronsaal: Lord Moderwort und Abschluss der Welt

Rätsel 13, das Bossduell, und die letzten Zeilen in Schwurbelstein. Die Rückkehr auf den Dachboden steht im Skript der Zwischenspiele.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_THRO\_MOD\_0010 | Moderwort | Wer wagt es … hatschi … meinen Thronsaal zu betreten? | Szene, Ankunft; Taschentuch |
| W1\_THRO\_MAX\_0020 | Max | Ich. Wegen eines Eis. Das hab ich schon. |  |
| W1\_THRO\_MOD\_0030 | Moderwort | Dann … warum bist du hier? | verwirrt |
| W1\_THRO\_ZEL\_0040 | Zeldina | Wegen der Wohnung. |  |
| W1\_THRO\_MOD\_0050 | Moderwort | DIE MAKLERIN! Sie war schon hier! Sie hat Fotos gemacht! Vom Schlafzimmer! | Zaubern-Animation, violetter Funke an die Decke |
| W1\_THRO\_MAX\_0060 | Max | Er zaubert. Ich hab einen Kochlöffel. Das ist kein fairer Kampf. Für ihn. | Duell beginnt |
| W1\_THRO\_MAX\_0110 | Max | Ein riesiger schwarzer Thron mit einem winzigen Kissen. Gestickt: „Für meinen Mo“. | Ansehen: Thron |
| W1\_THRO\_MAX\_0120 | Max | Taschentücher, stapelweise. Jemand hier hat Heuschnupfen oder sehr viele Gefühle. | Ansehen: Taschentuchstapel |
| W1\_THRO\_MAX\_0130 | Max | Blumen. Im Thronsaal eines Dunklen Lords mit Heuschnupfen. Das ist entweder Mut oder Maklerin. | Ansehen: Blumenvasen |
| W1\_THRO\_PIX\_0140 | Pixel | Seite 1: Heute böse sein. Seite 2 bis 300: leer. | Ansehen: Moderworts Lerntagebuch, Pixel |
| W1\_THRO\_MAX\_0150 | Max | Ein Lerntagebuch. Mit Totenkopf. Innen ein Vorsatz und viel Platz. | Ansehen: Lerntagebuch |
| W1\_THRO\_MAX\_0160 | Max | Buntglas mit Mondlicht. Sehr dramatisch. Sehr teuer in der Reinigung. | Ansehen: Fenster |
| W1\_THRO\_MAX\_0170 | Max | Lord Moderwort. Keine Nase, aber zwei rote Löcher, die aussehen, als hätten sie gerade geweint. | Ansehen: Moderwort |
| W1\_THRO\_PIX\_0180 | Pixel | Pollenstaub, Taschentücher, Selbstmitleid. Das ist weniger ein Dunkler Lord als ein Dunkler Schnupfen. | Ansehen: Moderwort, Pixel |
| W1\_THRO\_MOD\_0190 | Moderwort | Eine Katze! Katzenhaare! Hatschi! Weg mit … hatschi … dem Vieh! | Pixel auf Moderwort |

Das Duell. Reihenfolge: Pollen-Socke, dann Kochlöffel, dann der Spitzname im Gespräch.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_THRO\_MOD\_0210 | Moderwort | Ein Kochlöffel? Ich habe einen echten Stab! Zittere! Hat… hatschi. | Kochlöffel auf Moderwort; vor dem Niesen |
| W1\_THRO\_MOD\_0220 | Moderwort | Fisch? Ich bin allergisch. Gegen alles. Hatschi. | Thunfischdose auf Moderwort |
| W1\_THRO\_MAX\_0230 | Max | Wasser hilft nicht gegen Dunkle Lords. Gegen Trolle schon. | Eimer auf Moderwort |
| W1\_THRO\_MAX\_0240 | Max | Socke auf. | Socke voller Pollen auf Moderwort; rosa Wolke |
| W1\_THRO\_MOD\_0250 | Moderwort | Was … was ist das … nein … NEIN … HAAATSCHIIII! | Niesen-Animation; der Stab fliegt |
| W1\_THRO\_ZEL\_0260 | Zeldina | Gefangen! Toadi wirft mir ständig Sachen zu, ich hab Übung. | fängt den Stab |
| W1\_THRO\_MOD\_0270 | Moderwort | Mein Stab! Gib ihn … hatschi … zurück! Ich bin wehrlos! Ich bin ein Dunkler Lord und ich bin WEHRLOS! | tastet nach dem Stab |
| W1\_THRO\_MAX\_0280 | Max | Hier. Ersatz. | Kochlöffel auf Moderwort; nach dem Niesen |
| W1\_THRO\_MOD\_0290 | Moderwort | Du wagst es … FLUCH DER EWIGEN FINSTERNIS! | Zaubern-Animation; eine Käsescheibe fällt zu Boden |
| W1\_THRO\_MOD\_0300 | Moderwort | Käse? |  |
| W1\_THRO\_MAX\_0310 | Max | Fondue-Rückstände. Ich nenne das eine Bindung. |  |
| W1\_THRO\_MOD\_0320 | Moderwort | FLUCH DER TAUSEND … | zweiter Versuch; Käse |
| W1\_THRO\_PIX\_0330 | Pixel | Er flucht Käse. Ich wechsle die Seite. Ich stehe jetzt neben ihm. Nur für den Käse. | geht zu den Käsescheiben |
| W1\_THRO\_MOD\_0340 | Moderwort | Ich höre nicht auf! Ich bin der Schrecken von Schwurbelstein! Ich bin … hatschi … | weiter; Käse |
| W1\_THRO\_MAX\_0350 | Max | Mo-Knuddel-Puddi-Bärchen. | Option Moderwort; nach dem Käse |
| W1\_THRO\_MOD\_0360 | Moderwort | … Wer hat dir das gesagt? | sehr leise |
| W1\_THRO\_MAX\_0370 | Max | Deine Mutti. Die Goblins. Eine Wand. Und eine Tür, die „Mama“ sagt. |  |
| W1\_THRO\_MOD\_0380 | Moderwort | Ich wollte nur, dass mich einer ernst nimmt. Einmal. Ohne zu niesen. | setzt sich auf die Thronstufe |
| W1\_THRO\_ZEL\_0390 | Zeldina | Dann geh zurück zur Schule. Alwin nimmt jeden. Steht am Wegweiser. |  |
| W1\_THRO\_MOD\_0400 | Moderwort | Hoggelwarz … für Durchgefallene. … Ja. Ja, das bin ich. | steht auf |
| W1\_THRO\_MOD\_0410 | Moderwort | Damit kann ich nur Käse. | gibt den Kochlöffel zurück; Kochlöffel wandert ins Pflichtfach; R13 gelöst |
| W1\_THRO\_MAX\_0420 | Max | Ich auch. Aber ich hab Übung. |  |

Abschluss der Welt:

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_THRO\_ZEL\_0510 | Zeldina | Sieben Stockwerke, Turmlage, Eigentümer verhandlungsbereit. Ich nehme ihn. Ohne Maklerin. | stellt den Karton ab |
| W1\_THRO\_MOD\_0520 | Moderwort | Und die Maklerin kriegt keine Provision? | packt Taschentücher ein |
| W1\_THRO\_ZEL\_0530 | Zeldina | Die kriegt Smaugis Teekannen. Alle dreihundert. |  |
| W1\_THRO\_TOA\_0540 | Toadi | Danke, Max! Aber die Prinzessin ist in … da ist sie. Sie ist hier. Hoheit, du bist in diesem Schloss! | stürmt herein, Keuchen-Animation |
| W1\_THRO\_ZEL\_0550 | Zeldina | Endlich. |  |
| W1\_THRO\_PIX\_0560 | Pixel | Du hast diese ganze Welt ohne eine meiner Lösungen geschafft. Ich bin … beeindruckt. // Das sage ich nie wieder. Streich es aus dem Protokoll. | nur wenn Stufe-3-Zähler Welt 1 gleich null |
| W1\_THRO\_PIX\_0570 | Pixel | Du hast es geschafft. Mit Hilfe. Mit meiner Hilfe. Das Ei ist zu einem Drittel meins. Der weiche Teil. | wenn Stufe-3-Zähler größer als null |
| W1\_THRO\_MAX\_0580 | Max | Ei. Zettel. „Alles hängt davon ab.“ Dann zurück. | hält das Ei hoch |
| W1\_THRO\_PIX\_0590 | Pixel | Zurück durch den Fernseher. Ich hasse Fernsehreisen. Ich habe es gesagt, ich sage es wieder, ich werde es immer sagen. |  |
| W1\_THRO\_MAX\_0600 | Max | Opa hat gesagt, zurück holt uns der Werbeblock. |  |
| W1\_THRO\_PIX\_0610 | Pixel | Dann bitte einen mit Essen. | Bild flimmert; Übergang zum Zwischenspiel |
| W1\_THRO\_ZEL\_0620 | Zeldina | Wenn ihr oben Hilfe braucht: Ich hab jetzt einen Zauberstab und keinen Umzug mehr. Ruft an. | Ansehen oder Reden: Zeldina nach R13; bereitet das Finale vor |
| W1\_THRO\_MOD\_0630 | Moderwort | Erstes Jahr, zweiter Anlauf. Hatschi. Diesmal mit Taschentüchern. | Reden: Moderwort nach R13 |
| W1\_THRO\_PIX\_0710 | Pixel | Er sitzt auf einem Thron für drei und benutzt ein Kissen für einen. Das Traurigste heute, und ich habe Toadi gesehen. | Zuruf |
| W1\_THRO\_PIX\_0720 | Pixel | Blumen. Taschentücher. Heuschnupfen. Dieser Raum ist ein Rätsel, das sich selbst löst. | Zuruf; vor dem Duell |

## 15. Figurenwechsel und Pixel als Spielfigur

Zeilen, die in jedem Raum von Welt 1 gelten: beim Wechsel zwischen Max und Pixel (zufällig gezogen, nie zweimal hintereinander) und bei Dingen, die nur die jeweils andere Figur kann.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_WECH\_PIX\_0010 | Pixel | Ich übernehme. Versuch, nichts zu verpassen. | Wechsel zu Pixel |
| W1\_WECH\_PIX\_0020 | Pixel | Vier Pfoten, ein Gehirn, kein Inventar. Ich bin bereit. | Wechsel zu Pixel |
| W1\_WECH\_PIX\_0030 | Pixel | Pfoten statt Hände. Du wirst merken, dass es ein Aufstieg ist. | Wechsel zu Pixel |
| W1\_WECH\_MAX\_0040 | Max | Zurück zu dem mit den Taschen. | Wechsel zu Max |
| W1\_WECH\_MAX\_0050 | Max | Okay. Hände. Hab ich vermisst. | Wechsel zu Max |
| W1\_WECH\_MAX\_0060 | Max | Ich hab mich ohne mich komisch gefühlt. | Wechsel zu Max |
| W1\_WECH\_PIX\_0070 | Pixel | Ich trage genau einen Gegenstand. Im Maul. Mit Würde. Das hier ist zu groß für beides. | Pixel versucht, einen großen Gegenstand zu nehmen |
| W1\_WECH\_PIX\_0080 | Pixel | Türen. Pfoten. Du weißt, wie das endet. | Pixel benutzt eine Tür oder einen Hebel |
| W1\_WECH\_MAX\_0090 | Max | Das ist Pixels Revier. Ich hab keine Krallen, nur Sneaker. Und ein Senkel ist offen. | Max benutzt Dachbalken, Regal oder Katzenklappe |
| W1\_WECH\_MAX\_0100 | Max | Miau. Miau? Ich glaube, es hat Nein gesagt. Oder Hunger. | Max redet mit einem Tier |
| W1\_WECH\_PIX\_0110 | Pixel | Ich rede nicht mit Menschen, ich lasse mich von ihnen kommentieren. Wechsel zu Max, wenn du Wörter brauchst. | Pixel redet mit einer Figur ohne eigene Pixel-Zeile |

## 16. Hinweise der Hilfe-Pfote

Drei Stufen je Rätselschritt. Die Texte zu Rätsel 1 bis 4 sind die Slice-Hinweise aus dem Tab Spielsysteme, hier mit IDs. ID-Schema: W1\_HINT\_PIX\_RRSK, RR Rätselnummer, S Stufe 1 bis 3, K Teilschritt (0 ohne Teilschritte, 1 bis 3 für a bis c oder Teil 1 und 2).

| ID | Sprecher | Text | Schritt |
| --- | --- | --- | --- |
| W1\_HINT\_PIX\_0111 | Pixel | Die Wirtskatze lässt dich nicht an den Topf. Sie braucht Ablenkung. Charmante Ablenkung. | R1a, Stufe 1 |
| W1\_HINT\_PIX\_0121 | Pixel | Ich könnte mit Minka reden. Wechsel zu mir, falls du dich traust. | R1a, Stufe 2 |
| W1\_HINT\_PIX\_0131 | Pixel | Wechsel zu mir und sprich mit Minka. Ich locke sie raus. Mein Charme ist eine Naturgewalt. | R1a, Stufe 3 |
| W1\_HINT\_PIX\_0112 | Pixel | Der Wirt klebt am Topf wie ich an der Heizung. Er braucht einen Grund zu gehen. | R1b, Stufe 1 |
| W1\_HINT\_PIX\_0122 | Pixel | Schau auf die Weinkarte. Etwas, das ganz hinten im Keller liegt. | R1b, Stufe 2 |
| W1\_HINT\_PIX\_0132 | Pixel | Bestell den Jahrgang Schicksalsberg. Den holt er aus dem Keller, und das dauert. | R1b, Stufe 3 |
| W1\_HINT\_PIX\_0113 | Pixel | Gollo traut sich nicht. Er will vorher spielen. Rätselspiele, natürlich. | R1c, Stufe 1 |
| W1\_HINT\_PIX\_0123 | Pixel | Er verliert nur bei einer Frage, die nur du beantworten kannst. | R1c, Stufe 2 |
| W1\_HINT\_PIX\_0133 | Pixel | Frag ihn, was du in der Tasche hast. Die Thunfischdose. Da kommt er nie drauf. | R1c, Stufe 3 |
| W1\_HINT\_PIX\_0210 | Pixel | Der Stabmacher sagt, der Stab wählt den Zauberer. Klingt, als bräuchte der Stab einen Grund, an dir zu kleben. | R2, Stufe 1 |
| W1\_HINT\_PIX\_0220 | Pixel | In der Taverne gibt's etwas Klebriges. | R2, Stufe 2 |
| W1\_HINT\_PIX\_0230 | Pixel | Schmier Käse auf den Löffel. Ich bin ein Kater, kein Lösungsbuch. | R2, Stufe 3 |
| W1\_HINT\_PIX\_0310 | Pixel | Der Troll will drei Ziegen. Wir haben null. Schlechter Start. | R3, Stufe 1 |
| W1\_HINT\_PIX\_0320 | Pixel | Eine Ziege frisst gerade beim Schmied, eine zweite kann man am Dorfbrett bestellen. Die dritte … bitte nicht. | R3, Stufe 2 |
| W1\_HINT\_PIX\_0330 | Pixel | Hol die Schmiede-Ziege, bestell die zweite mit dem Zettel am Dorfbrett und gib mir den Ziegenfell-Vorleger aus der Taverne. Ich hasse alles daran. | R3, Stufe 3 |
| W1\_HINT\_PIX\_0411 | Pixel | Der Troll ist ein Paragrafenreiter. Lies das Brückenschild. | R4a, Stufe 1 |
| W1\_HINT\_PIX\_0421 | Pixel | Im Märchen läuft immer erst die Kleine, dann die Mittlere, dann die Große. | R4a, Stufe 2 |
| W1\_HINT\_PIX\_0431 | Pixel | Schick die Ziegen klein, mittel, groß über die Brücke. Ich bin die Kleine. Sag's niemandem. | R4a, Stufe 3 |
| W1\_HINT\_PIX\_0412 | Pixel | Die Ziegen müssen ihren Text sagen. Sie sprechen nur Ziegisch. Ich übrigens fließend. | R4b, Stufe 1 |
| W1\_HINT\_PIX\_0422 | Pixel | Lies den Text aus der Satzung vor, ich übersetze. Meistens richtig. | R4b, Stufe 2 |
| W1\_HINT\_PIX\_0432 | Pixel | Lies die Satzung vor, dann wechsel zu mir und rede mit den Ziegen. Beim zweiten Mal übersetze ich ordentlich. | R4b, Stufe 3 |
| W1\_HINT\_PIX\_0413 | Pixel | Laut Satzung muss der Troll ins Wasser. Er kann nicht schwimmen. Lies genau, was da steht. | R4c, Stufe 1 |
| W1\_HINT\_PIX\_0423 | Pixel | Da steht „Wasser“, nicht „Fluss“. Wasser gibt es auch woanders. | R4c, Stufe 2 |
| W1\_HINT\_PIX\_0433 | Pixel | Hol mit dem Eimer Wasser aus dem Brunnen und stell es dem Troll hin. Fußbad. Regel erfüllt. | R4c, Stufe 3 |
| W1\_HINT\_PIX\_0510 | Pixel | Der Brunnen will Gold. Toadi hat Pilzgeld. Und du? Was hast du eigentlich in der Tasche? | R5, Stufe 1 |
| W1\_HINT\_PIX\_0520 | Pixel | Gollos Münze gehört in den Brunnen. Und dann wünsch dir nichts, was ich bereuen würde. | R5, Stufe 2 |
| W1\_HINT\_PIX\_0530 | Pixel | Münze rein, „etwas, das hoch hinaus will“ wünschen. Nicht Pizza. Ich sage das unter Schmerzen. | R5, Stufe 3 |
| W1\_HINT\_PIX\_0611 | Pixel | Alwin will Ei, Milch, Leuchtpilz. Ein Pfannkuchen, der leuchtet. Zutaten sammelt man, sie kommen nicht von allein. | R6 Teil 1, Stufe 1 |
| W1\_HINT\_PIX\_0621 | Pixel | Ei beim Huhn in der Taverne, Pilz im Zauberwald, und Milch gibt es hier nicht. Außer bei Tieren mit Glöckchen. | R6 Teil 1, Stufe 2 |
| W1\_HINT\_PIX\_0631 | Pixel | Nimm den Krug aus der Schmiede, melk die Ziege, wirf Ei, Milch und Pilz in den Kessel. Ich sehe weg. | R6 Teil 1, Stufe 3 |
| W1\_HINT\_PIX\_0612 | Pixel | Sechs Flaschen, ein Zettel. Lies den Zettel. Zweimal. Er reimt, aber er lügt nicht. Im Gegensatz zu gewissen Nasen. | R6 Teil 2, Stufe 1 |
| W1\_HINT\_PIX\_0622 | Pixel | Nicht am Rand. Nicht die Großen, die sind Zwillinge. Und das Fischöl steht rechts neben dem Trank. Rechts von dir aus. | R6 Teil 2, Stufe 2 |
| W1\_HINT\_PIX\_0632 | Pixel | Flasche drei. Die dritte von links. Ich hätte vier gesagt, und ich hätte gelogen. Nimm drei. | R6 Teil 2, Stufe 3 |
| W1\_HINT\_PIX\_0710 | Pixel | Die Rosen öffnen sich nur bei Gesang. Du singst nicht. Ich singe nicht öffentlich. Wer singt hier heimlich? | R7, Stufe 1 |
| W1\_HINT\_PIX\_0720 | Pixel | Unter der Brücke läuft Musik. Der Troll hört sie nicht nur. Frag ihn. Mit der Socke in der Hand. | R7, Stufe 2 |
| W1\_HINT\_PIX\_0730 | Pixel | Rede mit Waldemar übers Singen, folg ihm in den Wald, halt die Socke in die Pollen. Und versprich ihm den Abspann, das kostet dich nichts. | R7, Stufe 3 |
| W1\_HINT\_PIX\_0810 | Pixel | Eine Bohne wächst nicht in der Tasche. Sie braucht Erde. Da ist ein Fleck Erde neben dem Brunnen. Zufall? Nein. | R8, Stufe 1 |
| W1\_HINT\_PIX\_0820 | Pixel | Pflanzen und gießen. Zum Gießen braucht es den Eimer vom Brunnen. Mit Wasser drin, wenn man ihn hineinhält. | R8, Stufe 2 |
| W1\_HINT\_PIX\_0830 | Pixel | Bohne in den Erdfleck, Eimer am Brunnen füllen, Wasser auf die Bohne. Dann klettern. Du. Ich werde getragen. | R8, Stufe 3 |
| W1\_HINT\_PIX\_0910 | Pixel | Die Maklerin will Provision. Feilschen bringt nichts, Haustiere bringen Zuschläge. Sie will etwas verkaufen. Gib ihr etwas zu verkaufen. | R9, Stufe 1 |
| W1\_HINT\_PIX\_0920 | Pixel | Du hast einen Steckbrief in der Tasche. Für eine Maklerin ist das kein Steckbrief, das ist ein Exposé. | R9, Stufe 2 |
| W1\_HINT\_PIX\_0930 | Pixel | Zeig der Maklerin Moderworts Steckbrief und preis ihr den Turm an. Sieben Stockwerke, Turmlage. Ich sage so etwas nie wieder. | R9, Stufe 3 |
| W1\_HINT\_PIX\_1010 | Pixel | Die Goblins wollen Licht und eine Unterschrift. Oder eine Karriere. Grimmzahn ist käuflich, nur nicht mit Geld. | R10, Stufe 1 |
| W1\_HINT\_PIX\_1020 | Pixel | Weg eins: Der Leuchttrank aus Hoggelwarz ist eine Fackel, und Ketchup sieht aus wie Blut. Weg zwei: Zeldina braucht einen Hausmeister. | R10, Stufe 2 |
| W1\_HINT\_PIX\_1030 | Pixel | Gib Grimmzahn den Leuchttrank und unterschreib den Vertrag mit Ketchup. Oder biete ihm mit Zeldina den Hausmeisterposten an. Eins reicht. | R10, Stufe 3 |
| W1\_HINT\_PIX\_1111 | Pixel | Vier Teile, eine Reihenfolge. Jeder Fundort verrät, was an was hängt. Schau ins Notizbuch, nicht in die Luft. | R11 Teil 1, Stufe 1 |
| W1\_HINT\_PIX\_1121 | Pixel | Mo ist der Anfang, sagt Zeldina. Das Zeugnis hängt Knuddel an Mo. Das Lied hängt Puddi an Knuddel. Und das Bärchen steht am Ende, mit Punkten davor. | R11 Teil 1, Stufe 2 |
| W1\_HINT\_PIX\_1131 | Pixel | Mo-Knuddel-Puddi-Bärchen. Sag es der Tür. Sag es nie mir. | R11 Teil 1, Stufe 3 |
| W1\_HINT\_PIX\_1112 | Pixel | Drei Besen, drei Routen. Sie fegen, was sich bewegt. Am liebsten Haare. Ich habe Haare. Ich sehe, worauf das hinausläuft. | R11 Teil 2, Stufe 1 |
| W1\_HINT\_PIX\_1122 | Pixel | Wechsel zu mir und such die Stellen, wo sich die Fliesenwege kreuzen. Eine pro Route. Dort schüttle ich mich. Unter Protest. | R11 Teil 2, Stufe 2 |
| W1\_HINT\_PIX\_1132 | Pixel | Als ich auf die drei Kreuzungen klicken, die Besen rennen in die Kammer, du machst die Tür zu. Und du kaufst mir eine Bürste. | R11 Teil 2, Stufe 3 |
| W1\_HINT\_PIX\_1210 | Pixel | Smaugi gibt nichts her, außer jemand braucht es wirklich. Drei Leute stehen hier herum, die etwas brauchen. | R12, Stufe 1 |
| W1\_HINT\_PIX\_1220 | Pixel | Humbert sammelt Schwerter, Grimmzahn braucht Fackeln, Zeldina will einen Kronleuchter. Smaugis Haufen hat alle drei. | R12, Stufe 2 |
| W1\_HINT\_PIX\_1230 | Pixel | Schwerter zu Humbert, Fackeln zu Grimmzahn, Kronleuchter zu Zeldina. Dann gibt er das Ei. Und ich will es weich. | R12, Stufe 3 |
| W1\_HINT\_PIX\_1310 | Pixel | Er hat keine Nase und Heuschnupfen. Du hast eine Socke voller Pollen. Rechne. | R13, Stufe 1 |
| W1\_HINT\_PIX\_1320 | Pixel | Socke auf, er niest, der Stab fliegt. Dann braucht er Ersatz. Du hast einen Löffel, der mal Käse war. | R13, Stufe 2 |
| W1\_HINT\_PIX\_1330 | Pixel | Socke auf Moderwort, Kochlöffel auf Moderwort, dann sprich ihn mit dem Spitznamen an. Und sieh dabei nicht mich an. | R13, Stufe 3 |
| W1\_HINT\_PIX\_0010 | Pixel | Nichts offen. Geh irgendwohin, wo du noch nicht warst. Oder wo es etwas zu essen gibt. Beides zählt. | kein offener Schritt in Welt 1 |
