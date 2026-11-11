# Skript Welt 1: Schwurbelstein

Das ganze Skript für Welt 1 als Entwurf: rund 870 Zeilen in 16 Abschnitten, ein Abschnitt pro Raum oder Szene, in der Kurzform aus `05-spielsysteme.md` (ID, Sprecher, Text, Regie oder Auslöser; Bedingungen nach Semikolon, „//“ trennt Pixels Kaskaden). Die Nummern laufen pro Szene in Zehnerschritten, jeder Tabellenblock beginnt bei einem neuen Hunderter. Sprecherkürzel der Nebenfiguren: TOA Toadi, ALW Alwin Grauwald, ZEL Zeldina, GOL Gollo, HUM Humbert, WAL Waldemar, STA Stabmacher, SCH Schmied, ROT Rotkäppchen, MAK Maklerin, GRI Grimmzahn, GO1 und GO2 Goblin-Arbeiter, MOD Moderwort, SMA Smaugi, MIN Minka, HUH Huhn, ZIE Schmiede-Ziege, XXL XXL-Ziege, SWA Schwan, BRU Brunnen, GRA Grammophon, SPI Spiegel, TUE Geheimtür; NAR steht für Erzähl- und Szenentext ohne Sprecher (Spalte „–“). Räume mit ihren Szenen-Codes, Figuren mit Kürzel und Größe sowie alle Gegenstände stehen in der Welt-Tabelle [`welten/welt-1.yaml`](../welten/welt-1.yaml); WECH und HINT sind Sonder-Codes ohne eigenen Raum. Ersatzzeilen kommen aus dem Pool SYS\_ERS im Prolog-Skript; die Hinweis-IDs folgen dem Schema W1\_HINT\_PIX\_RRSK (Abschnitt 16).

## 1. Dorfplatz Unterbrösel: Ankunft

Szene. Der Wirbel spuckt Max auf das Kopfsteinpflaster, Pixel landet auf allen vieren daneben. Mittag, Dorfmusik, das Luftschloss hängt am Himmel. Nach der Szene ist Pixels Porträt noch grau; der Wechsel wird erst in der Taverne freigeschaltet (Rätsel 1a).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_ANK\_MAX\_0010 | Max | Au. | liegt auf dem Rücken, Hoodie über dem Gesicht |
| W1\_ANK\_PIX\_0020 | Pixel | Ich bin, wie es sich für einen Kater gehört, auf allen vier Pfoten gelandet. Du bist auf dem Gesicht gelandet. // Jeder, wie er kann, junger Mann. Ich urteile nicht, ich stelle nur fest. | sitzt kerzengerade |
| W1\_ANK\_MAX\_0030 | Max | Wo sind wir überhaupt? Und warum riecht es hier so nach Stall? | setzt sich auf, sieht sich um |
| W1\_ANK\_PIX\_0040 | Pixel | Auf Kanal 3, wenn ich die Fernbedienung richtig gelesen habe, und ich lese Fernbedienungen grundsätzlich richtig. // Es riecht nach Stroh, nach Bier und nach Leuten, die „Wohlan“ sagen, ohne dabei rot zu werden. | schnuppert |
| W1\_ANK\_MAX\_0050 | Max | Fantasy also. Die Staffel hab ich übersprungen, weil die erste Folge fast nur aus Landkarten bestand. | steht auf, Hände in die Bauchtasche |
| W1\_ANK\_PIX\_0051 | Pixel | Dann holst du sie eben jetzt nach, und zwar live. Außerdem wollte dein Großvater, dass du seinen Zettel liest. // Er sagte ausdrücklich: erst, wenn ihr drüben seid. Ich sehe mich um und stelle fest: Wir sind drüben. |  |
| W1\_ANK\_MAX\_0060 | Max | Stimmt. Dann darf ich ihn jetzt ja ganz offiziell lesen. | zieht den Zettel aus der Reisetasche |
| W1\_ANK\_OPA\_0070 | Opa (Zettel, Max liest vor) | „Das Ei muss ganz bleiben. Alles hängt davon ab.“ | Nahansicht Zettel, Opas Handschrift |
| W1\_ANK\_MAX\_0080 | Max | Alles hängt von einem Ei ab. Na super, dann ist ja überhaupt kein Druck dabei. | steckt den Zettel weg |
| W1\_ANK\_PIX\_0090 | Pixel | Er hat es zweimal unterstrichen. Das tut dein Großvater nur, wenn er Angst hat. // Oder Hunger. Nach meiner Erfahrung meistens beides, und meistens kurz vor dem Abendessen. |  |
| W1\_ANK\_TOA\_0100 | Toadi (aus dem Off) | Hilfe! Hilfe! Ein Held! Da ist ein Held! | Rennen-Animation von rechts |
| W1\_ANK\_MAX\_0110 | Max | Wo? Ich seh keinen. | dreht sich um |
| W1\_ANK\_TOA\_0120 | Toadi | Du! Du siehst aus wie einer! Also, fast. An der Haltung arbeiten wir noch, aber die Grundform stimmt! | Keuchen-Animation |
| W1\_ANK\_MAX\_0121 | Max | Ich hab keine Haltung. Ich hab einen Hoodie. |  |
| W1\_ANK\_TOA\_0130 | Toadi | Egal! Prinzessin Zeldina ist entführt worden! Vom Dunklen Lord! Auf Burg Brösel ist sie nicht, da hab ich schon nachgesehen! |  |
| W1\_ANK\_MAX\_0140 | Max | Tut mir leid, ich bin wegen eines Eis hier. Prinzessinnen sind ehrlich gesagt nicht so mein Bereich. |  |
| W1\_ANK\_TOA\_0150 | Toadi | Ein Ei? Der Dunkle Lord hat alles, was es gibt. Dein Ei bestimmt auch. Er wohnt im Dunklen Turm, da hinten, wo es violett wird. | zeigt nach rechts hinten |
| W1\_ANK\_PIX\_0160 | Pixel | Ein Turm, der sich selbst Dunkler Turm nennt. Das ist ungefähr so unauffällig wie mein Napf, auf dem groß „Napf“ steht. // Ich habe den Napf trotzdem gern. Den Turm vermutlich nicht. |  |
| W1\_ANK\_MAX\_0161 | Max | Und wie kommt man da hin? Am liebsten ohne viel Laufen. |  |
| W1\_ANK\_TOA\_0170 | Toadi | Über die Trollbrücke, durch den Zauberwald, dann durchs Bergwerk. Ich weiß das so genau, weil ich dreimal umkehren musste. |  |
| W1\_ANK\_MAX\_0180 | Max | Und wie komm ich an dem Troll vorbei? Ich frag nur, weil Trolle in Spielen immer ziemlich viele Lebenspunkte haben. |  |
| W1\_ANK\_TOA\_0190 | Toadi | Mit Regeln. Der Troll liebt Regeln. Ich hatte keine dabei, nur Panik. | sieht zum Luftschloss hoch, seufzt |
| W1\_ANK\_TOA\_0200 | Toadi | Vielleicht ist sie auch da oben im Luftschloss. Aber da kommt man nur mit einer Bohnenranke hin. Und wer hat schon eine Bohnenranke. |  |
| W1\_ANK\_MAX\_0210 | Max | Müssen wir da wirklich mitmachen? Ich wollte eigentlich nur ein Ei holen und wieder heim. | an Pixel, leise |
| W1\_ANK\_PIX\_0220 | Pixel | Du hast beim Einsaugen zugestimmt, ich war dabei und habe es gesehen. // Und die Reihenfolge ist ganz einfach: erst das Ei, dann das Sofa. Alles andere ist Beiwerk. | geht los Richtung Taverne |
| W1\_ANK\_MAX\_0230 | Max | Und warum gehst du dann als Erstes in die Kneipe? | folgt |
| W1\_ANK\_PIX\_0240 | Pixel | Ich gehe dorthin, wo es nach Käse riecht. Dass das zufällig die Kneipe ist, ist nicht meine Schuld, sondern die der Kneipe. |  |

## 2. Dorfplatz Unterbrösel: Brunnen, Dorfbrett, Bohnenranke

Der Dorfplatz ist die Drehscheibe der Welt: Rätsel 3 (Bestellung), 5 (Brunnen) und 8 (Ranke) spielen hier. Zuerst die Ansehen-Zeilen für alle Hotspots, dann Toadis Gesprächsbaum, dann die drei Rätsel.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_0110 | Max | Ein Wunschbrunnen. Auf dem Schild steht: „Wünsche nur gegen Gold.“ Immerhin sagt er das vorher, das machen die meisten Apps nicht. | Ansehen: Brunnen |
| W1\_DORF\_MAX\_0115 | Max | Ganz unten glitzert eine Münze. Da hat sich jemand was gewünscht und brav bezahlt. Ich frag mich, ob er's gekriegt hat. | Ansehen: Brunnen, zweites Mal |
| W1\_DORF\_PIX\_0120 | Pixel | Wasser. Es rauscht. Fische sind keine drin, ich habe nachgefragt. // Der Brunnen hat nicht geantwortet, was ich als Unhöflichkeit werte, aber auch als Bestätigung. | Ansehen: Brunnen, Pixel |
| W1\_DORF\_PIX\_0125 | Pixel | Ich habe noch einmal hineingesehen, nur zur Sicherheit. Immer noch keine Fische. // Ich werde eine Beschwerde schreiben, und zwar an den Brunnen persönlich. | Ansehen: Brunnen, Pixel, zweites Mal |
| W1\_DORF\_MAX\_0130 | Max | Esel, Hund, Katze und Hahn, übereinandergestapelt. Das ist eine Boyband, die sich nie auf einen Sänger einigen konnte. | Ansehen: Statue |
| W1\_DORF\_MAX\_0135 | Max | Wenn die vier jetzt anfangen zu singen, renn ich weg. Ich hab gehört, die Räuber haben das damals genauso gemacht. | Ansehen: Statue, zweites Mal |
| W1\_DORF\_PIX\_0140 | Pixel | Eine Katze, fast ganz oben. Endlich ein Denkmal, das die Verhältnisse realistisch darstellt. // Der Hahn obendrauf ist selbstverständlich ein Druckfehler. Ich würde das dem Bildhauer mitteilen, falls er noch lebt. | Ansehen: Statue, Pixel |
| W1\_DORF\_PIX\_0145 | Pixel | Die Katze auf der Statue schaut nach links. Also habe ich auch nach links geschaut, und da ist nichts. // Sie lügt. Das tun alle Statuen, sie haben ja den ganzen Tag sonst nichts zu tun. | Ansehen: Statue, Pixel, zweites Mal |
| W1\_DORF\_MAX\_0150 | Max | Ein Dorfbrett. Das ist hier wohl das Internet: Alle pinnen was dran, und keiner liest es. | Ansehen: Dorfbrett |
| W1\_DORF\_MAX\_0155 | Max | Ein Zettel sucht einen Helden, ein anderer sucht einen Hund. Der Hund hat deutlich mehr Rückmeldungen. | Ansehen: Dorfbrett, zweites Mal |
| W1\_DORF\_MAX\_0160 | Max | „Rotkäppchens Lieferdienst. Alles, was Oma nicht mehr trägt. In zehn Minuten da oder der Korb ist gratis.“ | Ansehen: Bestellzettel am Dorfbrett |
| W1\_DORF\_MAX\_0165 | Max | Unten klein: „Achtung, Wolf im Lieferbereich. Nicht füttern, nicht reden, nicht Oma nennen.“ | Ansehen: Bestellzettel am Dorfbrett, zweites Mal |
| W1\_DORF\_MAX\_0170 | Max | Ein Bestellzettel. Den nehm ich mit, man weiß ja nie, wann man mal dringend eine Lieferung braucht. | Nehmen: Bestellzettel |
| W1\_DORF\_MAX\_0180 | Max | „Gesucht wegen Weltherrschaft. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ | Ansehen: Moderworts Steckbrief am Dorfbrett (keine Nahansicht) |
| W1\_DORF\_MAX\_0185 | Max | Unter das Bild hat jemand „Gesundheit!“ gekritzelt. Mehrmals, und jedes Mal ein bisschen verzweifelter. | Ansehen: Moderworts Steckbrief am Dorfbrett (keine Nahansicht), zweites Mal |
| W1\_DORF\_MAX\_0190 | Max | Da hat jemand eine ziemlich große Lücke im Lebenslauf, und die hängt jetzt am Dorfbrett. | Ansehen Steckbrief, Fortsetzung |
| W1\_DORF\_PIX\_0200 | Pixel | Kein Gesicht auf dem Bild, nur zwei rote Nasenlöcher. // Entweder ist dieser Mann sehr böse, oder der Zeichner war sehr schlecht. Aus Erfahrung tippe ich auf beides. | Ansehen Steckbrief, Pixel |
| W1\_DORF\_MAX\_0210 | Max | Den nehm ich mit. Als Lesezeichen, oder falls ich mal jemandem drohen muss. | Nehmen: Steckbrief |
| W1\_DORF\_MAX\_0220 | Max | Ein Schloss auf einer Wolke. Da oben ist der Empfang bestimmt auch nicht besser, nur die Aussicht. | Ansehen: Luftschloss am Himmel |
| W1\_DORF\_MAX\_0225 | Max | Das Schloss schaukelt ein bisschen im Wind. Wer da oben wohnt, braucht jedenfalls keine Hängematte mehr. | Ansehen: Luftschloss am Himmel, zweites Mal |
| W1\_DORF\_PIX\_0230 | Pixel | Hoch oben, sonnenwarm und garantiert hundefrei. Ich möchte dort wohnen, und zwar sofort. // Und das sage ich, obwohl ich Wolken hasse. Daran siehst du, wie ernst es mir ist. | Ansehen: Luftschloss, Pixel |
| W1\_DORF\_PIX\_0235 | Pixel | Ich habe soeben beschlossen, Wolken doch zu mögen, unter einer einzigen Bedingung: // Ich wohne oben, und die Wolke wohnt unten. So herum hat die Natur das, wie ich finde, auch gemeint. | Ansehen: Luftschloss, Pixel, zweites Mal |
| W1\_DORF\_MAX\_0240 | Max | „Einer für alles. Ausverkauf.“ Ein Ring, sie alle zu … nein, danke. | Ansehen: Ring-Laden |
| W1\_DORF\_MAX\_0245 | Max | Im Schaufenster liegt ein Zettel: „Ringe bitte nicht ins Feuer werfen. Rückgabe ausgeschlossen.“ | Ansehen: Ring-Laden, zweites Mal |
| W1\_DORF\_MAX\_0250 | Max | Ein Stall, aber kein Pferd weit und breit, nur zwei Kokosnusshälften. Trotzdem hab ich sofort das Geräusch im Ohr. | Ansehen: Stall mit Kokosnüssen |
| W1\_DORF\_MAX\_0255 | Max | Ich hab die zwei Hälften aneinandergeklopft. Klapp-klapp. Jetzt will ich auf einem unsichtbaren Pferd losreiten, und keiner hält mich auf. | Ansehen: Stall mit Kokosnüssen, zweites Mal |
| W1\_DORF\_MAX\_0260 | Max | „Zum tänzelnden Pony-Express.“ Klingt nach einem Lieferdienst, bei dem man vorher noch was trinken kann. | Ansehen: Taverne von außen |
| W1\_DORF\_MAX\_0265 | Max | Ein Schild im Fenster: „Kein Zutritt für Ringträger mit Begleitung.“ Die hatten hier schon Ärger. | Ansehen: Taverne von außen, zweites Mal |
| W1\_DORF\_MAX\_0270 | Max | Da drin hämmert jemand, und da drin meckert jemand. Ich hoffe sehr, dass das zwei verschiedene sind. | Ansehen: Schmiede von außen |
| W1\_DORF\_MAX\_0275 | Max | Hammer, meckern, Hammer, meckern. Das ist der langsamste Song, den ich je gehört hab, und er hat nicht mal einen Refrain. | Ansehen: Schmiede von außen, zweites Mal |
| W1\_DORF\_MAX\_0280 | Max | Ein Laden, der nur Zauberstäbe verkauft. Da muss man richtig reingehen und mit jemandem reden. Gruselig. | Ansehen: Zauberstab-Laden von außen |
| W1\_DORF\_MAX\_0285 | Max | Im Fenster liegen Stäbe aus Holz, aus Knochen und aus etwas, das nach Lakritz aussieht. Der Lakritzstab ist ausverkauft. | Ansehen: Zauberstab-Laden von außen, zweites Mal |
| W1\_DORF\_MAX\_0290 | Max | Ein Wegweiser: „Hoggelwarz für Durchgefallene“. Endlich mal eine Schule mit realistischen Zielen. | Ansehen: Weg nach Hoggelwarz |
| W1\_DORF\_MAX\_0295 | Max | Unter dem Wegweiser steht in Kreide: „Gleis neundreiviertel ist woanders.“ Gut zu wissen. | Ansehen: Weg nach Hoggelwarz, zweites Mal |
| W1\_DORF\_MAX\_0300 | Max | Der Weg zur Brücke. Toadi sagt, da sitzt ein Troll. Aber Toadi sagt auch sonst ziemlich viel. | Ansehen: Waldweg |
| W1\_DORF\_MAX\_0305 | Max | Auf einem Stein am Weg ist ein Smiley eingeritzt, mit Hauern. Ich nehm das jetzt einfach mal als freundliches Willkommen. | Ansehen: Waldweg, zweites Mal |
| W1\_DORF\_MAX\_0310 | Max | Runde Häuser mit schiefen Dächern. Als hätte ein Kind sie gebaut, ein sehr begabtes Kind mit sehr viel Zeit. | Ansehen: Häuser |
| W1\_DORF\_MAX\_0315 | Max | Aus einem Schornstein kommt Rauch in Herzform. Ich finde, das Dorf übertreibt da ein bisschen. | Ansehen: Häuser, zweites Mal |
| W1\_DORF\_MAX\_0320 | Max | Ein Fleck Erde zwischen den Pflastersteinen. Der sieht aus, als würde er auf irgendwas warten. | Ansehen: Erdfleck links vom Brunnen; vor R8 |
| W1\_DORF\_MAX\_0325 | Max | Der Erdfleck ist genau bohnengroß. Ich sag ja nur. | Ansehen: Erdfleck links vom Brunnen, zweites Mal; vor R8 |
| W1\_DORF\_MAX\_0330 | Max | Eine Bohnenranke bis in die Wolken. Eine Treppe hätte es ehrlich gesagt auch getan. | Ansehen: Bohnenranke; nach R8 |
| W1\_DORF\_MAX\_0335 | Max | Ganz oben bewegt sich was. Hoffentlich nur ein Riese, der kurz Hallo sagen will und dann wieder geht. | Ansehen: Bohnenranke, zweites Mal; nach R8 |
| W1\_DORF\_PIX\_0340 | Pixel | Ich klettere nicht. Ich werde getragen. Das ist eine alte Tradition meiner Vorfahren, und ich halte sie hoch. // Genauer gesagt: Ich lasse sie hochhalten. Von dir. | Ansehen: Bohnenranke, Pixel; nach R8 |
| W1\_DORF\_PIX\_0345 | Pixel | Ich habe gründlich nachgedacht und bin zu folgendem Ergebnis gekommen: Ich klettere immer noch nicht. // Aber ich zeige dir gern, wie man elegant zusieht, während andere klettern. Auch das ist eine Kunst. | Ansehen: Bohnenranke, Pixel, zweites Mal; nach R8 |
| W1\_DORF\_MAX\_0350 | Max | Ein Eimer am Brunnen. Den leih ich mir mal aus. Das ist kein Diebstahl, das ist Teilen. | Nehmen: Eimer |
| W1\_DORF\_MAX\_0360 | Max | Eimer voll. Wasser aus einem Wunschbrunnen. Ich frag mich, ob das jetzt so was wie Premium-Wasser ist. | Eimer auf Brunnen |
| W1\_DORF\_PIX\_0370 | Pixel | Wunschwasser. Ich wünsche mir hiermit, dass du es nicht über mich kippst. // Und sieh an, es funktioniert. Ich werde diesen Brunnen weiterempfehlen. | nach 0360 |
| W1\_DORF\_MAX\_0380 | Max | Gollos letzte Goldmünze. Die fühlt sich viel schwerer an, als so ein kleines Ding eigentlich sein dürfte. | Ansehen: Goldmünze im Inventar |
| W1\_DORF\_MAX\_0385 | Max | Die Münze ist noch warm, weil Gollo sie die ganze Zeit in der Faust hatte. Ich fühl mich wie ein Bankräuber mit Gewissen. | Ansehen: Goldmünze im Inventar, zweites Mal |
| W1\_DORF\_MAX\_0390 | Max | Eine Zauberbohne. Sie glitzert, und Pixel wollte sie fressen, bevor ich sie überhaupt richtig angeguckt hab. | Ansehen: Zauberbohne im Inventar |
| W1\_DORF\_MAX\_0395 | Max | Ich hab sie mir ans Ohr gehalten, und sie flüstert. Ich glaube, sie will in die Erde. Oder in Pixel. | Ansehen: Zauberbohne im Inventar, zweites Mal |
| W1\_DORF\_PIX\_0400 | Pixel | Ich wollte sie lediglich probieren. Unter Fachleuten nennt man das Qualitätskontrolle. // Es ist ein anstrengender Beruf, und keiner dankt es einem. | nach 0390 |
| W1\_DORF\_PIX\_0410 | Pixel | Pergament, Pilzgeruch und Panikschweiß. Toadi hat dieses Brett heute schon mindestens viermal gelesen. // Vermutlich in der Hoffnung, dass irgendwann etwas anderes draufsteht. | Pixel schnuppert: Dorfbrett |
| W1\_DORF\_PIX\_0420 | Pixel | Es riecht nach Kokos und kein bisschen nach Pferd. Das Pferd ist eine Lüge, // und das sage ich dir als jemand, der sich mit Lügen auskennt. Beruflich, gewissermaßen. | Pixel schnuppert: Stall |
| W1\_DORF\_TOA\_0430 | Toadi | Eine Katze! Ist sie gefährlich? Sie sieht aus, als hätte sie Meinungen! | Pixel auf Toadi |

Gespräch mit Toadi. Max fragt, Toadi antwortet; gelesene Optionen werden grau. Toadi folgt Max auf dem Dorfplatz und in Hoggelwarz, sonst wartet er; zu den Szenen im Wasserschloss, im Zauberwald (Rätsel 7), im Luftschloss und im Thronsaal rennt er herbei.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_0510 | Max | Wer ist dieser Dunkle Lord? | Option Toadi |
| W1\_DORF\_TOA\_0520 | Toadi | Lord Moderwort! Er hat Hoggelwarz im ersten Jahr abgebrochen und hasst seitdem alle Zauberer. Und Blumen. | hüpft nervös |
| W1\_DORF\_MAX\_0521 | Max | Warum denn Blumen? |  |
| W1\_DORF\_TOA\_0522 | Toadi | Er niest bei Blumen. Und wenn er niest, gehen Flüche los. Der Bäcker ist seitdem ein Brot. Ein gutes Brot, aber sehr still. | flüstert |
| W1\_DORF\_MAX\_0530 | Max | Wo hast du schon überall nachgesehen? | Option Toadi |
| W1\_DORF\_TOA\_0540 | Toadi | Burg Brösel, Schloss Steinbeiß, die Villa hinterm Mühlbach. Überall standen Umzugskartons, nirgends die Prinzessin. |  |
| W1\_DORF\_MAX\_0541 | Max | Kartons? Wird sie entführt, oder zieht sie um? |  |
| W1\_DORF\_TOA\_0542 | Toadi | Bei ihr ist das schwer auseinanderzuhalten. Sie hinterlässt immer Kartons. Ich halte das für ein Zeichen. |  |
| W1\_DORF\_MAX\_0550 | Max | Und das Schloss da oben? | Option Toadi (bleibt) |
| W1\_DORF\_TOA\_0560 | Toadi | Da kommt man nur mit einer Bohnenranke hin. Bohnen gibt der Brunnen, aber nur gegen Gold. Ich hab nur Pilzgeld, und das nimmt keiner. | Hinweis R5 |
| W1\_DORF\_MAX\_0561 | Max | Und wer hat hier Gold? |  |
| W1\_DORF\_TOA\_0562 | Toadi | Gollo in der Taverne hatte mal welches. Aber Gollo hat vor allem Sorgen. Und einen Ring, über den keiner redet. | Hinweis R5 |
| W1\_DORF\_MAX\_0570 | Max | Warum rennst du mir eigentlich hinterher? | Option Toadi |
| W1\_DORF\_TOA\_0580 | Toadi | Ich bin der Diener der Prinzessin! Wenn sie weg ist, diene ich dem, der sie sucht. Steht in meinem Vertrag, Seite vierzig. |  |
| W1\_DORF\_MAX\_0590 | Max | Ich such aber ein Ei, keine Prinzessin. | Antwort auf 0580 |
| W1\_DORF\_TOA\_0600 | Toadi | Dann diene ich dem Ei. Bis auf Weiteres. | ernst, salutiert |
| W1\_DORF\_MAX\_0603 | Max | Das Ei weiß davon aber noch nichts. |  |
| W1\_DORF\_TOA\_0606 | Toadi | Ich sag's ihm, sobald wir es gefunden haben! Ankündigen kann ich sehr gut, nur das Finden übe ich noch! |  |
| W1\_DORF\_MAX\_0610 | Max | Ich muss weiter. | Option Toadi, beendet das Gespräch |
| W1\_DORF\_TOA\_0620 | Toadi | Ich warte hier! Oder ich renne dir nach! Ich kann auch beides! | rennt auf der Stelle |

Rätsel 5, der Brunnen der Wünsche. Max wirft die Goldmünze ein, dann stehen drei Wünsche zur Wahl. Der Brunnen spricht mit Hall (Sprecher BRU). Falsche Wünsche gehen schief und geben die Münze zurück.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_BRU\_0710 | Brunnen | Wünsche nur gegen Gold. Keine Karten. Keine Pilze. Kein Vertrauen. | Benutzen: Brunnen ohne Münze |
| W1\_DORF\_MAX\_0720 | Max | Pling. | Goldmünze auf Brunnen |
| W1\_DORF\_BRU\_0730 | Brunnen | Gold erkannt. Ein Wunsch. Bitte deutlich sprechen, ich habe Wasser in den Ohren. | Dialogauswahl erscheint |
| W1\_DORF\_MAX\_0740 | Max | Unendlich Pizza. | Option 1, falsch |
| W1\_DORF\_BRU\_0750 | Brunnen | Unendlich Pizza. Wird bearbeitet. | Blubbern, eine Pizzascheibe plumpst auf den Rand |
| W1\_DORF\_MAX\_0760 | Max | Eine Scheibe, und kalt ist sie auch. Unendlich heißt hier wohl, dass man unendlich oft reklamieren darf. |  |
| W1\_DORF\_PIX\_0770 | Pixel | Mit Ananas. Natürlich mit Ananas. // Dieser Brunnen hasst dich, und ich muss zugeben, dass ich allmählich verstehe, warum. |  |
| W1\_DORF\_BRU\_0780 | Brunnen | Reklamation anerkannt. Münze zurück. Bitte nicht weitersagen. | Münze springt ins Inventar |
| W1\_DORF\_MAX\_0790 | Max | Dass Pixel mal still ist. | Option 2, falsch |
| W1\_DORF\_BRU\_0800 | Brunnen | Stille. Wird bearbeitet. | Blubbern. Pixel schweigt zwei Sekunden |
| W1\_DORF\_PIX\_0810 | Pixel | … und deshalb ist Thunfisch in Lake eine Beleidigung, das war Punkt eins von vierzig, Punkt zwei: Heizungen. // Punkt drei: Wer ist dieser Toadi überhaupt, und warum hat er einen Hut, der aussieht wie ein Frühstück? // Punkt vier … | redet doppelt so schnell, Halsband blinkt ohne Pause |
| W1\_DORF\_MAX\_0820 | Max | Er redet jetzt doppelt so viel. Das ist ziemlich genau das Gegenteil von dem, was ich mir gewünscht hab. |  |
| W1\_DORF\_BRU\_0830 | Brunnen | Bekannte Nebenwirkung. Reklamation anerkannt. Münze zurück. | Münze springt ins Inventar; Pixel wird nach dem Raumwechsel wieder normal |
| W1\_DORF\_MAX\_0840 | Max | Etwas, das hoch hinaus will. | Option 3, richtig |
| W1\_DORF\_BRU\_0850 | Brunnen | Etwas, das hoch hinaus will. Gewährt. Nicht zurückgeben, nicht umtauschen. | Blubbern, eine Bohne springt heraus |
| W1\_DORF\_MAX\_0860 | Max | Eine Bohne. Ich wünsch mir was Großes, und dann krieg ich Gemüse. | nimmt die Bohne |
| W1\_DORF\_PIX\_0870 | Pixel | Hoch hinaus will sie durchaus. Pflanzen haben bloß einen sehr langsamen Humor. // Ich spreche da aus Erfahrung mit der Zimmerpalme deines Großvaters. Sie lacht seit Jahren über irgendwas. |  |
| W1\_DORF\_TOA\_0880 | Toadi | Eine Bohne! Eine echte! Einpflanzen! Gießen! Ich hole … ich habe nichts zum Holen. Ich hole Luft. | hüpft |

Rätsel 3, zweite Ziege: Max heftet den Bestellzettel ans Dorfbrett, Rotkäppchen liefert eine XXL-Ziege. Die Ziegen folgen Max danach wie eine kleine Herde (Begleiter-Schalter).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_0910 | Max | „Eine Ziege, Größe: mittel.“ Abschicken. | Bestellzettel auf Dorfbrett; pinnt ihn an |
| W1\_DORF\_NAR\_0920 | – | Ein Fahrradhupen-Geräusch. Rotkäppchen rollt mit dem Lieferkarren heran, hinter ihr trottet etwas Großes. | Szene ohne Text |
| W1\_DORF\_ROT\_0930 | Rotkäppchen | Lieferung für … Max? Eine Ziege, Größe mittel. Mittel war leider aus, ich hab dir XXL mitgebracht. Da wächst du schon noch rein. | winkt |
| W1\_DORF\_XXL\_0940 | XXL-Ziege | Mäh. | sehr tief |
| W1\_DORF\_MAX\_0950 | Max | Das ist keine Ziege. Das ist ein Sofa mit Hörnern. |  |
| W1\_DORF\_ROT\_0960 | Rotkäppchen | Unterschrift hier. Und hier. Rückgabe ausgeschlossen, die passt nicht mehr in den Karren. | hält ein Klemmbrett hin |
| W1\_DORF\_PIX\_0970 | Pixel | Zehn Minuten Lieferzeit, und das aus einem anderen Wald. // Dein Pizzadienst schafft das nicht einmal mit Rückenwind, und der muss bloß zwei Straßen weit fahren. |  |
| W1\_DORF\_ROT\_0980 | Rotkäppchen | Trinkgeld wäre lieb. Oma hat große Zähne, das heißt gar nichts, aber die Zahnarztrechnung ist echt. | fährt weg Richtung Wald |
| W1\_DORF\_XXL\_0990 | XXL-Ziege | Määäh. | Pixel redet mit XXL-Ziege |
| W1\_DORF\_PIX\_1000 | Pixel | Sie sagt, sie hatte Lieferstress und möchte jetzt bitte nicht angefasst werden. // Außerdem findet sie, du hast ein ehrliches Gesicht. Ziegen sind, das muss man leider sagen, miserable Menschenkenner. | Übersetzung |
| W1\_DORF\_MAX\_1010 | Max | Zwei Ziegen. Der Troll will aber drei, und ich hab so ein Gefühl, dass der dritte Teil unangenehm wird. | nach Lieferung, wenn die Schmiede-Ziege schon dabei ist |

Rätsel 8, die Bohnenranke. Max pflanzt die Bohne in den Erdfleck und gießt mit dem Eimer Brunnenwasser.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_DORF\_MAX\_1110 | Max | Bohne rein, Erde drauf. Ich war mal richtig gut in Bio, ungefähr eine Stunde lang. | Zauberbohne auf Erdfleck; Pflanz-Animation |
| W1\_DORF\_PIX\_1120 | Pixel | Sie wartet auf Wasser, nicht auf Applaus. Ich weiß das, weil ich morgens vor meinem Napf genauso daliege. | Benutzen: gepflanzte Bohne ohne Wasser |
| W1\_DORF\_MAX\_1130 | Max | Die soll wachsen, nicht schwimmen. | Zauberbohne auf Brunnen |
| W1\_DORF\_MAX\_1140 | Max | Gießen. Und jetzt warten wir drei Wochen, oder – | Eimer mit Wasser auf gepflanzte Bohne; Gieß-Animation |
| W1\_DORF\_NAR\_1150 | – | Die Ranke schießt aus dem Boden, schraubt sich am Brunnen vorbei und verschwindet in den Wolken. | Wachsen-Animation, Kamera folgt kurz nach oben |
| W1\_DORF\_MAX\_1160 | Max | Okay. Das ging schneller als jeder Download bei Opa, und der hat immerhin Glasfaser bestellt. Vor drei Jahren. |  |
| W1\_DORF\_PIX\_1170 | Pixel | Bis in die Wolken, und das ganz ohne Dünger. Dein Großvater würde sofort ein Patent anmelden. // Und er würde es Bohn-O-Mat nennen. Ich kenne ihn, er kann nicht anders. |  |
| W1\_DORF\_TOA\_1180 | Toadi | Eine Bohnenranke! Sie ist da oben! Ganz bestimmt da oben! |  |
| W1\_DORF\_MAX\_1190 | Max | Und wenn nicht? |  |
| W1\_DORF\_TOA\_1200 | Toadi | Dann ist sie in einem anderen Schloss. Das sage ich dann. Das sage ich immer. | kleinlaut |
| W1\_DORF\_MAX\_1210 | Max | Leer. Dann muss ich wohl noch mal zum Brunnen. | Eimer leer auf Bohne oder Ranke |

Zurufe auf dem Dorfplatz (Pixel, nach 45 Sekunden ohne Eingabe):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_DORF\_PIX\_1310 | Pixel | Der Brunnen gurgelt. Ich glaube, er hat Hunger, denn ich kenne dieses Geräusch sehr gut, und zwar von innen. | Zuruf |
| W1\_DORF\_PIX\_1320 | Pixel | Das Schloss da oben bewegt sich nicht. Entweder ist es gut festgemacht oder sehr faul. // Ich respektiere beides, das Zweite allerdings ein wenig mehr. | Zuruf |
| W1\_DORF\_PIX\_1330 | Pixel | Toadi hat dich in zwei Minuten dreimal angesehen, voller Hoffnung. Er erwartet Heldentum. // Enttäusch ihn bitte sanft. Er ist ein Pilz, und Pilze sind empfindlich. | Zuruf; solange Toadi im Raum ist |

## 3. Taverne „Zum tänzelnden Pony-Express“: Der Taverne-Coup

Szene beim ersten Betreten. Humbert poliert einen Krug, Gollo kauert in der Ecke, Minka sitzt neben dem Fondue-Topf. Pixel springt auf den Dachbalken, sein Porträt blinkt: Hier lernt der Spieler den Figurenwechsel (Rätsel 1a).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_HUM\_0010 | Humbert | Willkommen im Pony-Express! Setz dich, trink was, mach's dir gemütlich. Nur fass Gerhard nicht an. | poliert weiter |
| W1\_TAV\_MAX\_0020 | Max | Wer ist Gerhard? Dein Sohn? |  |
| W1\_TAV\_HUM\_0030 | Humbert | Das Schwert über dem Kamin. Das, was so glänzt. Er mag keine Fremden, und ehrlich gesagt mag er die meisten Bekannten auch nicht. | liebevoller Blick zum Kamin |
| W1\_TAV\_NAR\_0040 | – | Pixel springt in einem Satz auf den Dachbalken. Sein Porträt oben links beginnt zu blinken. | Szene ohne Text |
| W1\_TAV\_PIX\_0050 | Pixel | Max. Hier oben. Klick mich an, dann zeige ich dir die Welt einmal von oben, so wie sie gemeint ist. // Ich beiße nur manchmal. Und meistens nur Leute, die es verdient haben. | von oben, Halsband blinkt |
| W1\_TAV\_MAX\_0060 | Max | Er sitzt auf einem Balken und gibt von da oben Anweisungen. Ich glaube, genau so hat er sich sein Leben immer vorgestellt. |  |
| W1\_TAV\_GOL\_0070 | Gollo | Pssst. Die Katze da oben soll leise sein. Der Vulkan hört zu. | aus der Ecke, zischelnd |
| W1\_TAV\_PIX\_0080 | Pixel | Endlich sitzt jemand mit Übersicht am Steuer. Von hier oben sieht man einfach alles. // Vor allem den Käse. Ich möchte betonen, dass ich ihn nur beobachte. Vorerst. | erster Wechsel zu Pixel |
| W1\_TAV\_MAX\_0090 | Max | Und zurück zu dem, der Taschen hat und nicht auf Balken schläft. | erster Wechsel zurück zu Max |

Ansehen in der Taverne:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_0110 | Max | Ein Tresen voller Krüge und Flecken. Jeder Fleck sieht aus, als hätte er eine Geschichte, und keine davon will ich hören. | Tresen |
| W1\_TAV\_MAX\_0120 | Max | Ein Topf voll blubberndem Käse. Gollo nennt das Vulkan. Ich nenne das Abendessen. | Fondue-Topf |
| W1\_TAV\_PIX\_0130 | Pixel | Käse. Heiß und flüssig. Ich würde hineinsteigen, wenn ich schwimmen könnte. // Ich kann es nicht, und zwar aus Prinzip. Meine Vorfahren haben das Wasser schon immer den Fischen überlassen. | Fondue-Topf, Pixel |
| W1\_TAV\_MAX\_0140 | Max | Die Wirtskatze. Sie sitzt neben dem Topf wie ein Türsteher mit Schleife, und ich steh nicht auf der Liste. | Minka |
| W1\_TAV\_PIX\_0150 | Pixel | Sie ist weiß. Sie ist elegant. Sie trägt eine Schleife. // Ich bin verloren, junger Mann, vollkommen verloren. Und wenn du das irgendjemandem erzählst, bist du es auch. | Minka, Pixel |
| W1\_TAV\_MAX\_0160 | Max | Die Kellertür. Da unten liegt der Wein, und Humbert geht nur runter, wenn es wirklich sein muss. | Kellertür |
| W1\_TAV\_MAX\_0170 | Max | „Gesucht: Drache. Belohnung: fünf Goldmünzen.“ Da ist jemand ziemlich optimistisch, was Drachen angeht. | Steckbrief-Plakat Drache |
| W1\_TAV\_MAX\_0180 | Max | Ein Huhn im Korb. Es guckt mich an, als würde ich ihm noch Geld schulden. | Huhn |
| W1\_TAV\_PIX\_0190 | Pixel | Ein Huhn. Ich verspüre gerade einen sehr natürlichen, sehr alten Impuls. // Ich unterdrücke ihn, und zwar einzig und allein für den Thunfisch. Merk dir das, falls ich je Dankbarkeit verlange. | Huhn, Pixel |
| W1\_TAV\_MAX\_0200 | Max | Ein Kamin, in dem das Feuer knistert. Da könnte ich stundenlang reingucken, und genau deshalb guck ich lieber weg. | Kamin |
| W1\_TAV\_MAX\_0210 | Max | Rostige Schwerter mit Namensschildern: Gerhard, Birgit, Gerhard der Zweite. Humbert hat eindeutig Lieblinge. | Schwerter-Sammlung |
| W1\_TAV\_MAX\_0220 | Max | Leere Namensschilder. Entweder wartet Humbert auf neue Schwerter, oder er hat die Namen schon und wartet nur noch auf die Schwerter. | Leere Schilder |
| W1\_TAV\_MAX\_0230 | Max | Eine Laute mit einem Becher davor. Soll ich dem Barden eine Münze reinwerfen? Ich hab genau eine, und die brauch ich noch. | Laute mit Münzbecher; mit Goldmünze |
| W1\_TAV\_MAX\_0240 | Max | Eine Laute mit Becher, aber kein Barde weit und breit. Der Becher sammelt trotzdem, ganz von allein. | Laute mit Münzbecher; ohne Goldmünze |
| W1\_TAV\_MAX\_0250 | Max | Ein Ziegenfell-Vorleger, sehr flauschig. Pixel guckt ihn an, als hätte das Fell ihm persönlich was getan. | Ziegenfell-Vorleger |
| W1\_TAV\_MAX\_0260 | Max | Dachbalken. Perfekt für Katzen und Spinnen. Also für Pixel und seine Mitbewohner. | Dachbalken |
| W1\_TAV\_MAX\_0270 | Max | Die Weinkarte: Hauswein, Hauswein rot, Hauswein noch röter. Und ganz unten: „Jahrgang Schicksalsberg, auf Anfrage.“ | Weinkarte am Tresen |
| W1\_TAV\_PIX\_0280 | Pixel | „Auf Anfrage“ heißt in jeder Taverne der Welt: ganz hinten im Keller, hinter den Rüben, unter den Spinnweben. // Wer das bestellt, schickt den Wirt auf eine lange Reise. Ich erwähne das nur, falls jemand einen Wirt loswerden möchte. | Weinkarte, Pixel; Hinweis R1b |
| W1\_TAV\_MAX\_0290 | Max | „Vielsaft-Limo. Schmeckt wie jemand anderes.“ Ich bleib lieber bei Wasser, ich bin mit mir gerade ganz zufrieden. | Flasche Vielsaft-Limo |
| W1\_TAV\_PIX\_0300 | Pixel | Trink das, und du siehst eine Stunde lang aus wie Toadi. // Ich würde dafür bezahlen, und ich bezahle nie für etwas, das kein Fisch ist. | Vielsaft-Limo, Pixel |
| W1\_TAV\_MAX\_0310 | Max | Humberts Fischsuppe. Die riecht nach Hafen, und zwar nach dem Teil vom Hafen, wo keiner freiwillig hingeht. | Fischsuppe |
| W1\_TAV\_PIX\_0320 | Pixel | Hühnerbrühe. | Fischsuppe, Pixel schnuppert |
| W1\_TAV\_MAX\_0330 | Max | Deine Nase lügt bei Fisch. Das ist eindeutig Fisch. | nach 0320 |
| W1\_TAV\_PIX\_0340 | Pixel | Meine Nase lügt nie. Sie interpretiert. // Das ist ein feiner Unterschied, und ich erwarte nicht, dass jemand mit so einer kleinen Nase ihn versteht. | nach 0330; führt die Regel für R6 ein |
| W1\_TAV\_MAX\_0350 | Max | Der Wirt. Er poliert denselben Krug, seit wir hier sind. Vielleicht ist das einfach der einzige, den er hat. | Humbert |
| W1\_TAV\_MAX\_0360 | Max | Ein kleiner Mann in einem viel zu großen Mantel. Er hält sein Kästchen fest wie ein Handy bei einem Prozent. | Gollo |
| W1\_TAV\_PIX\_0370 | Pixel | Ziege. Alte Ziege. Nass gewordene alte Ziege. // Mein schlimmster Albtraum hat soeben eine Oberfläche bekommen, und man legt sie hier auch noch vor die Tür. | Pixel schnuppert: Vorleger |
| W1\_TAV\_PIX\_0380 | Pixel | Kälte, Staub und Rüben. Und irgendwo ganz unten ein Etikett, an dem keine Flasche hängt. // Ich rieche so etwas. Fehlende Dinge haben einen ganz eigenen, enttäuschten Geruch. | Pixel schnuppert: Kellertür |
| W1\_TAV\_PIX\_0390 | Pixel | Rost und Zuneigung. Humbert poliert mit Gefühl, das rieche ich deutlich. // Ich finde es, offen gesagt, ein wenig unangenehm. So hat mich noch nie jemand poliert. | Pixel schnuppert: Schwerter |
| W1\_TAV\_HUM\_0400 | Humbert | Eine Katze! Hallo, Kleiner. Minka hat einen Freund? Minka hat sonst nur Feinde. | Pixel auf Humbert |
| W1\_TAV\_GOL\_0410 | Gollo | Eine Katze. Katzen mögen keine Ringe. Katzen mögen gar nichts. Wir sind uns ähnlich. | Pixel auf Gollo |

Gespräch mit Humbert:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_0510 | Max | Was blubbert da? | Option Humbert |
| W1\_TAV\_HUM\_0520 | Humbert | Mein Käsefondue! Seit dreihundert Jahren in der Familie. Also der Topf. Den Käse wechsle ich alle zwei Wochen. | stolz |
| W1\_TAV\_MAX\_0521 | Max | Darf ich mal probieren? Nur ganz kurz? |  |
| W1\_TAV\_HUM\_0522 | Humbert | Nicht, solange Minka danebensitzt. Die lässt nicht mal mich ran. Ich rühre mit dem langen Löffel, von hier aus. | Hinweis R1a |
| W1\_TAV\_MAX\_0530 | Max | Erzähl mir von den Schwertern. | Option Humbert |
| W1\_TAV\_HUM\_0540 | Humbert | Das ist Gerhard, mein Liebling. Daneben Birgit, Gerhard der Zweite und Klaus-Dieter. Klaus-Dieter rostet aus Prinzip. | zeigt nacheinander |
| W1\_TAV\_MAX\_0550 | Max | Du nennst deine Schwerter beim Vornamen? | Antwort auf 0540 |
| W1\_TAV\_HUM\_0560 | Humbert | Und du nennst dein Handy nicht beim Vornamen? Was bist du denn für ein Mensch? | ehrlich entsetzt |
| W1\_TAV\_MAX\_0565 | Max | Es heißt Handy. Mehr hat es sich bei dem Akku ehrlich gesagt noch nicht verdient. |  |
| W1\_TAV\_MAX\_0570 | Max | Habt ihr Wein? | Option Humbert (bleibt) |
| W1\_TAV\_HUM\_0580 | Humbert | Hauswein, Hauswein rot, Hauswein noch röter. Auf der Karte steht noch der Jahrgang Schicksalsberg. Den hat noch nie jemand bestellt. Liegt ganz hinten im Keller, hinter den Rüben. | Hinweis R1b; schaltet Option 0590 frei |
| W1\_TAV\_MAX\_0581 | Max | Hinter den Rüben. Das klingt nach einem längeren Ausflug. |  |
| W1\_TAV\_HUM\_0582 | Humbert | Eine halbe Stunde, wenn die Rüben friedlich sind. Sonst länger. |  |
| W1\_TAV\_MAX\_0590 | Max | Dann nehm ich den Schicksalsberg. | Option Humbert; nach 0580; löst R1b |
| W1\_TAV\_HUM\_0600 | Humbert | Den Schicksalsberg. Wirklich? Jetzt? … Gut. Das dauert. Fass nichts an. Vor allem nicht Gerhard. | In-den-Keller-Animation |
| W1\_TAV\_PIX\_0610 | Pixel | Er ist weg, und der Topf ist unbewacht. Also, halb unbewacht. // Madame sitzt noch daneben, und an Madame kommt niemand vorbei. Ich spreche da als Bewunderer. | nach 0600, wenn Minka noch da ist |
| W1\_TAV\_MAX\_0620 | Max | Was ist mit der Katze? | Option Humbert |
| W1\_TAV\_HUM\_0630 | Humbert | Minka? Bewacht den Topf. Seit der Sache mit dem Barden. Der hat den Käse als Haargel benutzt. | schüttelt sich |
| W1\_TAV\_MAX\_0631 | Max | Als Haargel? |  |
| W1\_TAV\_HUM\_0632 | Humbert | Er wollte Locken. Er kam zwei Wochen nicht mehr durch die Tür, weil er überall kleben blieb. |  |
| W1\_TAV\_MAX\_0640 | Max | Nichts weiter. | Option Humbert, beendet das Gespräch |
| W1\_TAV\_HUM\_0650 | Humbert | Dann trink was. Oder guck Gerhard an. Das machen die meisten. |  |

Gespräch mit Gollo:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_0710 | Max | Was hast du da? | Option Gollo |
| W1\_TAV\_GOL\_0720 | Gollo | Nichtsss. Ein Kästchen. Ein Ring darin. Mein Ssschätzchen. Mein Ausverkaufsartikel. Niemand will ihn. Nicht mal im Sonderangebot. | drückt das Kästchen an sich |
| W1\_TAV\_MAX\_0721 | Max | Und warum willst du ihn loswerden? |  |
| W1\_TAV\_GOL\_0722 | Gollo | Er ist schwer. Nicht in der Hand, im Kopf. Er flüstert. Meistens Preise. | flüstert |
| W1\_TAV\_MAX\_0730 | Max | Warum wirfst du ihn nicht einfach in den Topf? | Option Gollo (bleibt) |
| W1\_TAV\_GOL\_0740 | Gollo | Der Vulkan! Ja! Nein! Der Wirt guckt. Die Katze guckt. Und wenn keiner guckt, gucke ich. Ich traue mich nicht. | Hinweis R1a und R1b |
| W1\_TAV\_MAX\_1640 | Max | Ich kann auch weggucken, wenn das hilft. Darin bin ich ziemlich gut. |  |
| W1\_TAV\_GOL\_1650 | Gollo | Dann guckt immer noch der Ring. Er hat kein Auge, aber er guckt. Glaub mir. |  |
| W1\_TAV\_MAX\_0750 | Max | Du spielst gern Rätselspiele? | Option Gollo (bleibt) |
| W1\_TAV\_GOL\_0760 | Gollo | Rätsel! Ja! Ich gewinne immer! Was hat Wurzeln, die keiner sieht, und ist höher als Bäume? | kichert |
| W1\_TAV\_MAX\_0770 | Max | Ein Berg. Das steht in jedem Rätselbuch auf der ersten Seite. | Antwort auf 0760 |
| W1\_TAV\_GOL\_0780 | Gollo | Siehst du! Alle wissen alles! Ich verliere nur, wenn jemand etwas fragt, das niemand wissen kann. Und das passiert nie. | Hinweis R1c |
| W1\_TAV\_MAX\_0790 | Max | Tschüss, Gollo. | Option Gollo, beendet das Gespräch |
| W1\_TAV\_GOL\_0800 | Gollo | Geh nur. Alle gehen. Der Ring bleibt. Der Ring bleibt immer. |  |

Rätsel 1a: Pixel umgarnt Minka. Der Spieler wechselt zu Pixel und redet mit der Wirtskatze; Max versteht nur Miau.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_MIN\_0910 | Minka | Chhh! | Max benutzt Minka oder Fondue-Topf; Minka faucht |
| W1\_TAV\_MAX\_0920 | Max | Sie faucht. Ich glaube, das war ein Nein, und zwar ein sehr deutliches. | nach 0910 |
| W1\_TAV\_PIX\_0930 | Pixel | An den Topf komme ich nicht, solange Madame dort sitzt. Und ich würde es auch niemals wagen. // Noch nicht, jedenfalls. Ein Kater weiß, wann er warten muss. | Pixel benutzt Fondue-Topf, Minka da |
| W1\_TAV\_MIN\_0940 | Minka | Miau? | Pixel redet mit Minka |
| W1\_TAV\_PIX\_0950 | Pixel | Madame. Ihr Fell hat die Farbe von Sahne, die noch nie etwas Falsches getan hat. | Umgarnen-Animation beginnt |
| W1\_TAV\_MIN\_0960 | Minka | Mrrr. | neigt den Kopf |
| W1\_TAV\_PIX\_0970 | Pixel | Draußen steht ein Stall. Zwei Kokosnüsse, ein Platz an der Sonne, kein Wirt. // Darf ich vorausgehen? Nein. Darf ich hinterhergehen? Unbedingt. |  |
| W1\_TAV\_MIN\_0980 | Minka | Miau. | steht auf, folgt Pixel nach draußen |
| W1\_TAV\_MAX\_0990 | Max | Ich versteh nur Miau, aber das war ein sehr überzeugtes Miau. | Minka verlässt den Raum; R1a gelöst |
| W1\_TAV\_PIX\_1000 | Pixel | Sie sitzt jetzt im Stall und bewundert die Kokosnüsse. Sie hält sie für Pferde, und ich habe nicht widersprochen. // Ich habe einen Charme, der anderer Leute Hausaufgaben erledigt. | Pixel kommt zurück |

Rätsel 1c: Das Rätselspiel. Max zieht die Thunfischdose auf Gollo. Funktioniert erst, wenn Minka und Humbert weg sind; vorher weicht Gollo aus.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_TAV\_GOL\_1110 | Gollo | Nicht jetzt! Der Wirt! Die Katze! Alle gucken! Frag mich, wenn keiner guckt. | Thunfischdose auf Gollo vor R1a oder R1b |
| W1\_TAV\_MAX\_1120 | Max | Gollo. Ich hab ein Rätsel für dich: Was hab ich in meiner Tasche? | Thunfischdose auf Gollo; nach R1a und R1b |
| W1\_TAV\_GOL\_1130 | Gollo | Das ist keine Frage! Das ist … gemein. Ich rate. Dreimal. Das sind die Regeln. | kneift die Augen zu |
| W1\_TAV\_GOL\_1140 | Gollo | Ein Ring? |  |
| W1\_TAV\_MAX\_1150 | Max | Nein. |  |
| W1\_TAV\_GOL\_1160 | Gollo | Ein zweiter Ring? Ein besserer? |  |
| W1\_TAV\_MAX\_1170 | Max | Auch nicht. |  |
| W1\_TAV\_GOL\_1180 | Gollo | Hände! Du hast Hände in der Tasche! Das zählt! |  |
| W1\_TAV\_MAX\_1190 | Max | Eine Dose Thunfisch. In Lake. | zeigt die Dose |
| W1\_TAV\_PIX\_1200 | Pixel | Barbarisch. Aber zielführend. | von oben |
| W1\_TAV\_GOL\_1210 | Gollo | Niemand hat eine Dose Thunfisch! Das kann man nicht wissen! Das ist Betrug! // Ich liebe es. Ich habe verloren. Endlich. | Ring-werfen-Animation; Zischen aus dem Topf |
| W1\_TAV\_GOL\_1220 | Gollo | Er ist weg. Ich fühle mich … leicht. Hier, meine letzte Goldmünze. Ich brauche nichts mehr. Nur Schlaf. Jahrelang. | gibt die Münze, rollt sich auf der Bank zusammen |
| W1\_TAV\_MAX\_1230 | Max | Ein Ring im Käse. In Serien dauert so was drei Staffeln, und am Ende sind trotzdem alle traurig. |  |
| W1\_TAV\_NAR\_1240 | – | Humbert kommt staubig und ohne Flasche aus dem Keller. | Szene ohne Text |
| W1\_TAV\_HUM\_1250 | Humbert | Da war nur ein Etikett. Da war nie ein Wein. Dreihundert Jahre lang ein Etikett. | staubig, fassungslos |
| W1\_TAV\_HUM\_1260 | Humbert | Moment. Was ist in meinem Topf? | riecht, probiert mit dem Finger |
| W1\_TAV\_HUM\_1270 | Humbert | … Das schmeckt nach Macht. Und nach Gruyère. Das ist der beste Käse meines Lebens. | Träne im Auge |
| W1\_TAV\_HUM\_1280 | Humbert | Nimm ein Schälchen für den Weg. Und sag es niemandem, sonst kommen die Elfen und wollen Reservierungen. | gibt das Käsefondue |
| W1\_TAV\_MAX\_1290 | Max | Käsefondue zum Mitnehmen. Ich wusste gar nicht, dass das geht. | Inventar: Käsefondue |
| W1\_TAV\_PIX\_1300 | Pixel | Gib. Her. Ein Pfötchen voll, mehr verlange ich nicht. // Ich habe die Katze weggelockt, unter Einsatz meines Herzens, und daraus ergibt sich ein Anspruch. |  |
| W1\_TAV\_MAX\_1310 | Max | Nein. Das brauchen wir bestimmt noch. |  |
| W1\_TAV\_PIX\_1320 | Pixel | Du weißt doch noch gar nicht, wofür. |  |
| W1\_TAV\_MAX\_1330 | Max | In Serien braucht man irgendwann alles. Vor allem das, was man vorher weggefuttert hat. | R1 gelöst |

Weitere Gegenstände und Fehlversuche in der Taverne:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_TAV\_MAX\_1410 | Max | Den nehm ich mit. Humbert sieht's nicht, der poliert. | Nehmen: Ziegenfell-Vorleger |
| W1\_TAV\_PIX\_1420 | Pixel | Du nimmst einen Teppich mit. Ich will nicht wissen, warum. // Das heißt, ich ahne es bereits, und ich hasse alles, was ich ahne. | nach 1410 |
| W1\_TAV\_MAX\_1430 | Max | Ein Ei. Das Huhn protestiert leise, und ich ehrlich gesagt auch, innerlich. | Nehmen: Ei unter dem Huhn |
| W1\_TAV\_HUH\_1440 | Huhn | Gaaack. | nach 1430 |
| W1\_TAV\_PIX\_1450 | Pixel | Ein Ei. Weich gekocht. Zum Frühstück. Das kommt auf meine Liste. // Nicht dieses hier, wohlgemerkt, sondern ein eigenes. Ich teile meine Eier nicht mit Kesseln. | nach 1430; Pixels Wunsch Welt 1 |
| W1\_TAV\_HUH\_1460 | Huhn | Gack gack. Gaack. | Pixel redet mit Huhn |
| W1\_TAV\_PIX\_1470 | Pixel | Sie heißt Hilde. Sie legt, seit sie denken kann, und sie denkt nicht viel. // Sie sagt, das Ei riecht nach Schule, was auch immer das heißen soll. Hühner sind keine großen Erklärer. | Übersetzung |
| W1\_TAV\_MAX\_1480 | Max | Thunfisch in Käse. Auch ich hab irgendwo Grenzen. | Thunfischdose auf Fondue-Topf |
| W1\_TAV\_PIX\_1490 | Pixel | Es gibt keine Grenzen. Aber es gibt meine Dose, und die bleibt draußen. | nach 1480 |
| W1\_TAV\_MAX\_1500 | Max | Ein Eimer voll Käse wäre schon verlockend. Aber Humbert hat eine Schwertersammlung, und ich will keins davon näher kennenlernen. | Eimer auf Fondue-Topf |
| W1\_TAV\_MAX\_1510 | Max | Humbert guckt. Ich warte lieber, bis ich ein eigenes Schälchen kriege. | Kochlöffel auf Fondue-Topf |
| W1\_TAV\_MAX\_1520 | Max | Gerhard bleibt, wo er ist. Ich mag meine Hände, und zwar beide. | Benutzen: Schwerter |
| W1\_TAV\_HUM\_1530 | Humbert | Finger weg von Gerhard! | nach 1520 |
| W1\_TAV\_MAX\_1540 | Max | Seit Gollos Ring in dem Topf liegt? Ich leg's lieber nicht drauf an. | Thunfischdose auf Fondue; nach R1 |
| W1\_TAV\_MAX\_1550 | Max | Die Limo bleibt zu. Ich will heute nicht aussehen wie jemand anderes, ich hab mit mir schon genug zu tun. | Benutzen: Vielsaft-Limo |
| W1\_TAV\_MAX\_1560 | Max | Ich hab einmal über die Saiten geschrammelt. Klingt ungefähr wie mein Handy, wenn es in der Tasche aus Versehen Musik abspielt. | Benutzen: Laute |
| W1\_TAV\_GOL\_1570 | Gollo | Zzzz. Mein Ssschätzchen … nein, weg damit … zzz. | Reden mit Gollo; nach R1 |

Zurufe in der Taverne (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_TAV\_PIX\_1610 | Pixel | Der Käse blubbert seit zehn Minuten vor sich hin. Er will gegessen werden, ich höre so etwas. // Es ist eine Gabe. Eine schwere Gabe, wenn man sie nicht nutzen darf. | Zuruf |
| W1\_TAV\_PIX\_1620 | Pixel | Humbert poliert, Gollo zittert, Minka starrt, und du stehst. // Das ist eine Taverne, kein Wachsfigurenkabinett. Irgendwer sollte irgendetwas tun. | Zuruf; vor R1 |
| W1\_TAV\_PIX\_1630 | Pixel | Von hier oben sehe ich alles, und vor allem sehe ich, dass du nichts tust. // Es ist ein schöner Ausblick. Nur die Handlung fehlt. | Zuruf; Pixel auf dem Balken |

## 4. Schmiede: Die erste Ziege und die Milch

Der Schmied schmiedet nur noch Kochgeschirr, seit die Ziege bei ihm wohnt. Hier gibt es Ziege 1 (Rätsel 3) und später die Ziegenmilch (Rätsel 6, Teil 1). Der Krug für die Milch hängt beim Kochgeschirr. Melken geht überall, wo die Schmiede-Ziege gerade ist; vor Rätsel 4 folgt sie Max, danach steht sie wieder in der Schmiede.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_SCHM\_MAX\_0010 | Max | Eine Esse. Die ist ungefähr so heiß wie mein Handy, wenn ich drei Stunden am Stück Videos gucke. | Ansehen: Esse |
| W1\_SCHM\_MAX\_0015 | Max | Die Glut flackert jedes Mal, wenn ich atme. Also atme ich jetzt nicht mehr, weil ich keine beleidigte Esse will. | Ansehen: Esse, zweites Mal |
| W1\_SCHM\_PIX\_0020 | Pixel | Warm. Sehr warm. Zu warm, um ehrlich zu sein. // Die perfekte Temperatur liegt genau zwei Schritte weiter links. Ich habe das mit meinem gesamten Körper ausgemessen. | Ansehen: Esse, Pixel |
| W1\_SCHM\_PIX\_0025 | Pixel | Zwei Schritte links, ich habe es soeben noch einmal nachgemessen. Es bleibt bei zwei. // Die Wissenschaft hat gesprochen, junger Mann, und die Wissenschaft legt sich jetzt dorthin. | Ansehen: Esse, Pixel, zweites Mal |
| W1\_SCHM\_MAX\_0030 | Max | Ein Amboss. Schwer, schwarz und schweigsam. Wir zwei hätten uns bestimmt gut verstanden. | Ansehen: Amboss |
| W1\_SCHM\_MAX\_0035 | Max | Ich hab draufgeklopft, und er klingt wie ein Gong. Irgendwo verbeugt sich jetzt bestimmt jemand. | Ansehen: Amboss, zweites Mal |
| W1\_SCHM\_MAX\_0040 | Max | Pfannen, Töpfe, Kellen, und alle haben ein Namensschild. Das mit den Namen ist hier im Dorf wohl ansteckend. | Ansehen: Kochgeschirr |
| W1\_SCHM\_MAX\_0045 | Max | Die Pfanne heißt „Brutzelbart“, der Topf heißt „Tiefgang“. Wie die Kelle heißt, will ich gar nicht wissen. | Ansehen: Kochgeschirr, zweites Mal |
| W1\_SCHM\_MAX\_0050 | Max | Eine weiße Ziege mit Glöckchen. Sie hat ein Schwert im Maul und kaut darauf rum wie auf einem Kaugummi. | Ansehen: Schmiede-Ziege |
| W1\_SCHM\_MAX\_0055 | Max | Das Glöckchen bimmelt, wenn sie kaut. Sie kaut eigentlich immer, also bimmelt es eigentlich immer. | Ansehen: Schmiede-Ziege, zweites Mal |
| W1\_SCHM\_PIX\_0060 | Pixel | Sie frisst Eisen. Ich fresse Thunfisch. Wir sind beide Spezialisten, // aber nur einer von uns beweist dabei Geschmack, und ich möchte niemanden beschämen, indem ich sage, wer. | Ansehen: Schmiede-Ziege, Pixel |
| W1\_SCHM\_PIX\_0065 | Pixel | Sie hat mir gerade zugezwinkert. Ich zwinkere nicht zurück, denn wir sind Rivalen. // Worum wir konkurrieren, weiß ich nicht genau. Aber ich werde gewinnen, und zwar aus Prinzip. | Ansehen: Schmiede-Ziege, Pixel, zweites Mal |
| W1\_SCHM\_MAX\_0070 | Max | Der Schmied. Roter Bart, Ruß im Gesicht und der Blick von einem Mann, der seine Ziege nicht mehr liebt. | Ansehen: Schmied |
| W1\_SCHM\_MAX\_0075 | Max | Er streichelt der Ziege über den Kopf und zieht die Hand ganz schnell zurück. Er liebt sie doch noch, nur sehr vorsichtig. | Ansehen: Schmied, zweites Mal |
| W1\_SCHM\_MAX\_0080 | Max | Ein leerer Krug, und auf seinem Namensschild steht auch nichts. Da war der Schmied wohl noch nicht so weit. | Ansehen: Krug beim Kochgeschirr |
| W1\_SCHM\_MAX\_0085 | Max | Ich hab reingerufen, und er klingt hohl. Der Krug weiß noch nicht, wer er ist. Das kenn ich irgendwoher. | Ansehen: Krug beim Kochgeschirr, zweites Mal |
| W1\_SCHM\_MAX\_0090 | Max | Den Krug leih ich mir mal aus. | Nehmen: Krug |
| W1\_SCHM\_SCH\_0100 | Schmied | Nimm. Nimm alles. Nur nicht die Hoffnung, die habe ich selbst nicht mehr. | nach 0090 |
| W1\_SCHM\_MAX\_0110 | Max | Klong. Ich hab auf einen Amboss gehauen. Damit hab ich für heute eigentlich genug geleistet. | Benutzen: Amboss |
| W1\_SCHM\_MAX\_0120 | Max | Zu heiß. Ich hab noch nicht mal hingefasst und hab trotzdem schon Brandblasen, und zwar im Kopf. | Benutzen: Esse |
| W1\_SCHM\_PIX\_0130 | Pixel | Pfannen, die noch nie benutzt wurden. Eine Tragödie in Blech. // Was man in ihnen alles hätte braten können. Fisch. Mehr Fisch. Und zum Nachtisch Fisch. | Pixel schnuppert: Kochgeschirr |
| W1\_SCHM\_SCH\_0140 | Schmied | Eine Katze. Frisst sie Eisen? Nein? Dann darf sie bleiben. Sie darf sogar wohnen. | Pixel auf Schmied |

Gespräch mit dem Schmied:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SCHM\_MAX\_0210 | Max | Warum schmiedest du Pfannen? | Option Schmied |
| W1\_SCHM\_SCH\_0220 | Schmied | Seit die Ziege hier wohnt, frisst sie jede Klinge. Pfannen frisst sie nicht. Also Pfannen. Das ist Marktwirtschaft. | seufzt |
| W1\_SCHM\_MAX\_0221 | Max | Hast du mal versucht, sie wegzuschicken? |  |
| W1\_SCHM\_SCH\_0222 | Schmied | Dreimal. Sie kam jedes Mal zurück. Mit einem Schwert im Maul. Mit meinem. |  |
| W1\_SCHM\_MAX\_0230 | Max | Gehört die Ziege dir? | Option Schmied |
| W1\_SCHM\_SCH\_0240 | Schmied | Die Ziege gehört niemandem. Sie ist eines Morgens aufgetaucht. Wie Schulden. |  |
| W1\_SCHM\_MAX\_0750 | Max | Und warum jagst du sie nicht weg? |  |
| W1\_SCHM\_SCH\_0760 | Schmied | Hab ich versucht. Sie war schneller wieder da als ich. Seitdem nenne ich sie Kollegin. |  |
| W1\_SCHM\_MAX\_0250 | Max | Was ist das für ein Schwert in ihrem Maul? | Option Schmied |
| W1\_SCHM\_SCH\_0260 | Schmied | Das war Ingrid. Humbert wollte sie für seine Sammlung. Jetzt ist sie Ziegenfutter. Sag ihm nichts, er hängt an Namen. |  |
| W1\_SCHM\_MAX\_0770 | Max | Du hast deinen Schwertern Namen gegeben? |  |
| W1\_SCHM\_SCH\_0780 | Schmied | Jedes Schwert hat einen Namen. Ingrid, Helga, Kurt. Kurt war ein Missverständnis. |  |
| W1\_SCHM\_MAX\_0270 | Max | Kann ich die Ziege haben? | Option Schmied; auch bei Benutzen: Ziege |
| W1\_SCHM\_SCH\_0280 | Schmied | Du willst sie? Nimm sie! Nimm sie mit! Ich schmiede dir ein Denkmal! Aus Blech, aber ein Denkmal! | fällt fast auf die Knie; Ziege folgt Max ab jetzt |
| W1\_SCHM\_ZIE\_0290 | Schmiede-Ziege | Mäh. | kaut weiter, trottet zu Max |
| W1\_SCHM\_PIX\_0300 | Pixel | Eine Ziege, und sie folgt uns. Ich habe ein ganzes Jahr gebraucht, um deinem Großvater freiwillig zu folgen. // Sie schafft das in einer Sekunde. Das ist keine Treue, das ist Anbiederung. |  |
| W1\_SCHM\_MAX\_0310 | Max | Bis dann. | Option Schmied, beendet das Gespräch |
| W1\_SCHM\_SCH\_0320 | Schmied | Geh mit Gott. Oder mit der Ziege. Hauptsache, sie geht. |  |

Pixel redet mit der Ziege, und Rätsel 6, Teil 1: die Milch. Melken geht erst, wenn Alwin sein Rezept genannt hat.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SCHM\_ZIE\_0410 | Schmiede-Ziege | Mäh. Mäh-mäh. | Pixel redet mit Ziege |
| W1\_SCHM\_PIX\_0420 | Pixel | Sie sagt, Eisen schmeckt nach Abenteuer, und deshalb frisst sie es. // Außerdem sagt sie, sie wurde noch nie gemolken und möchte, dass das so bleibt. Ich habe ihr nichts versprochen. | Übersetzung |
| W1\_SCHM\_MAX\_0430 | Max | Warum sollte ich eine Ziege melken? Ich hab dafür nicht mal einen Grund. Also, noch nicht. | Krug auf Ziege; vor Alwins Rezept |
| W1\_SCHM\_MAX\_0440 | Max | Okay. Milch. Von einer Ziege, mit meinen eigenen Händen. Ich hab immer gedacht, so was passiert nur anderen Leuten. | Krug auf Ziege; nach Alwins Rezept; Melk-Animation |
| W1\_SCHM\_ZIE\_0450 | Schmiede-Ziege | MÄÄÄH. | während der Animation |
| W1\_SCHM\_MAX\_0460 | Max | Fertig, ein ganzer Krug. Ich schwöre hiermit feierlich, diese Ziege nie wieder zu melken. Nie, nie wieder. | Inventar: Ziegenmilch; Schwur-Schalter |
| W1\_SCHM\_PIX\_0470 | Pixel | Sie schwört dasselbe, allerdings mit deutlich mehr Schimpfwörtern. // Ziegisch hat erstaunlich viele davon. Ich habe drei neue gelernt und hebe sie für deinen Großvater auf. |  |
| W1\_SCHM\_SCH\_0480 | Schmied | Ich habe das gesehen. Ich werde es nie vergessen. Leider. | aus dem Hintergrund; nur wenn in der Schmiede gemolken wird |
| W1\_SCHM\_MAX\_0490 | Max | Nein. Ich hab's geschworen, und ich halte meine Schwüre. Vor allem die bequemen. | Krug auf Ziege; nach 0460 |
| W1\_SCHM\_MAX\_0500 | Max | Ziegen fressen Eisen, aber keinen Fisch. Zum Glück, sonst hätte Pixel jetzt eine Rivalin mehr. | Thunfischdose auf Ziege |
| W1\_SCHM\_MAX\_0510 | Max | Pfannen kann man nicht melken. Ich hab's nicht ausprobiert, nur im Kopf, aber das hat schon gereicht. | Krug auf Kochgeschirr |

Szene beim ersten Betreten der Schmiede (vor dem Gespräch, einmalig):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SCHM\_SCH\_0710 | Schmied | Kundschaft! Pfannen, Töpfe, Kellen. Schwerter hab ich keine mehr. Frag die Ziege. | Szene, erstes Betreten; hämmert auf eine Pfanne |
| W1\_SCHM\_MAX\_0720 | Max | Die Ziege hat deine Schwerter? |  |
| W1\_SCHM\_SCH\_0730 | Schmied | Im Bauch. Frag nicht weiter, sonst werd ich traurig. Ich bin eh schon kurz davor. |  |
| W1\_SCHM\_ZIE\_0740 | Schmiede-Ziege | Mäh. | kaut zufrieden auf einer Klinge |

Zurufe in der Schmiede (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_SCHM\_PIX\_0610 | Pixel | Die Ziege kaut, der Schmied seufzt. Das ist hier das ganze Programm, // und es gibt keinen anderen Kanal. Ich habe nachgesehen, sogar hinter der Esse. | Zuruf |
| W1\_SCHM\_PIX\_0620 | Pixel | Die Esse ist so schön warm. Ich wäre längst eingeschlafen, // wenn du nicht so laut denken würdest. Man hört es bis hier herüber, und es klingt nach Zögern. | Zuruf |

## 5. Zauberstab-Laden: Der Stab wählt den Zauberer

Rätsel 2. Drei Kandidaten auf dem Samtkissen: Zahnstocher, Zollstock, Kochlöffel. Max darf alle anfassen, aber nur der Käse macht aus dem Löffel einen Zauberstab.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_STAB\_MAX\_0010 | Max | Regale bis zur Decke, voller schmaler Schachteln. Wie ein Schuhladen für sehr dünne Leute. | Ansehen: Regale |
| W1\_STAB\_MAX\_0015 | Max | Eine Schachtel ist offen und leer. Der Stab hat sich wohl schon seinen Zauberer ausgesucht. Hoffentlich nicht mich. | Ansehen: Regale, zweites Mal |
| W1\_STAB\_MAX\_0020 | Max | Eine Rollleiter. In Filmen rollt damit immer jemand total elegant durchs Bild. Ich würde eher durchs Fenster rollen. | Ansehen: Leiter |
| W1\_STAB\_MAX\_0025 | Max | Ich hab sie angeschubst, und sie rollt, ohne mich. Sie hatte schon immer mehr Talent als ich. | Ansehen: Leiter, zweites Mal |
| W1\_STAB\_MAX\_0030 | Max | Ein lila Samtkissen mit drei Dingen drauf. Das ist das Sortiment. Das ganze Sortiment. | Ansehen: Theke mit Kissen |
| W1\_STAB\_MAX\_0035 | Max | Auf dem Kissen sind Abdrücke, da lagen mal mehr Stäbe. Oder sehr dicke Würste, das kann ich nicht ausschließen. | Ansehen: Theke mit Kissen, zweites Mal |
| W1\_STAB\_MAX\_0040 | Max | Ein Zahnstocher. Für Zauberer mit sehr kleinen Problemen. | Ansehen: Zahnstocher |
| W1\_STAB\_MAX\_0045 | Max | Er hat einen kleinen Zettel: „Für Zahnfeen und Präzisionszauber.“ Das ist mehr Selbstbewusstsein, als ich habe. | Ansehen: Zahnstocher, zweites Mal |
| W1\_STAB\_MAX\_0050 | Max | Ein Zollstock. Zwei Meter Magie, und man kann ihn sogar zusammenklappen. | Ansehen: Zollstock |
| W1\_STAB\_MAX\_0055 | Max | Ich klapp ihn auf und zu, klack, klack. Das ist ungefähr der einzige Zauber, den ich gerade draufhab. | Ansehen: Zollstock, zweites Mal |
| W1\_STAB\_MAX\_0060 | Max | Ein Kochlöffel aus Holz. Der hat bestimmt schon mehr Eintöpfe gesehen als Zaubersprüche. | Ansehen: Kochlöffel auf dem Kissen |
| W1\_STAB\_MAX\_0065 | Max | Der Löffel hat eine Kerbe. Da hat jemand mal sehr, sehr wütend umgerührt. | Ansehen: Kochlöffel auf dem Kissen, zweites Mal |
| W1\_STAB\_PIX\_0070 | Pixel | Holz und alter Eintopf. Mit diesem Löffel hat jemand wirklich gekocht, und zwar mit Hingabe. // Ich respektiere ihn. Er hat mehr für die Ernährung getan als die meisten Zauberer. | Ansehen: Kochlöffel, Pixel; auch Schnuppern |
| W1\_STAB\_PIX\_0075 | Pixel | Linseneintopf mit Speck, ich habe noch einmal sehr gründlich gerochen. // Dieser Löffel hat eine Geschichte. Und, was noch wichtiger ist, er hat Speck. | Ansehen: Kochlöffel, Pixel, zweites Mal; auch Schnuppern |
| W1\_STAB\_MAX\_0080 | Max | Ein rundes Fenster, und im Licht tanzt der Staub. Das Licht macht hier mehr Show als die ganze Ware. | Ansehen: Fenster |
| W1\_STAB\_MAX\_0085 | Max | Eine Fliege tanzt im Licht. Sie ist der einzige Kunde, den ich hier bisher gesehen hab. | Ansehen: Fenster, zweites Mal |
| W1\_STAB\_MAX\_0090 | Max | Der Stabmacher. Sein Monokel ist so groß, dass er mich wahrscheinlich in 4K sieht. | Ansehen: Stabmacher |
| W1\_STAB\_MAX\_0095 | Max | Er nickt, als hätte er mich schon erwartet. Hoffentlich hat er nicht auch meinen Stab erwartet, ich hab nämlich keinen. | Ansehen: Stabmacher, zweites Mal |
| W1\_STAB\_MAX\_0100 | Max | Leer. Aber sehr schön leer. | Benutzen: Schachtel im Regal |
| W1\_STAB\_STA\_0110 | Stabmacher | Oho, ein Kater. Schnurrhaare in Stabqualität. Darf ich eins? Nur eins? Nein? Schade. | Pixel auf Stabmacher |
| W1\_STAB\_PIX\_0120 | Pixel | Staub, Samt und Hoffnung. Hauptsächlich Staub. // Die Hoffnung riecht schon ein wenig abgestanden, aber das sage ich ihm lieber nicht. | Pixel schnuppert: Theke |

Gespräch mit dem Stabmacher:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_STAB\_MAX\_0210 | Max | Ich brauche einen Zauberstab. | Option Stabmacher |
| W1\_STAB\_STA\_0220 | Stabmacher | Der Stab wählt den Zauberer. Nicht umgekehrt. Ich habe noch drei. // Zahnstocher, Zollstock, Kochlöffel. Der Rest ist ausverkauft, seit die Schule jeden nimmt. | beugt sich vor |
| W1\_STAB\_MAX\_0221 | Max | Ein Kochlöffel ist doch kein Zauberstab. |  |
| W1\_STAB\_STA\_0222 | Stabmacher | Das sagst du. Der Löffel hat sich dazu noch nicht geäußert. | tätschelt das Kissen |
| W1\_STAB\_MAX\_0224 | Max | Und woran merk ich, wenn er sich äußert? |  |
| W1\_STAB\_STA\_0226 | Stabmacher | Er bleibt bei dir. Ein Löffel ist treu, wenn man ihm einen Grund dazu gibt. Mehr verlangt er nicht. |  |
| W1\_STAB\_MAX\_0230 | Max | Wie wählt ein Stab denn? | Option Stabmacher (bleibt) |
| W1\_STAB\_STA\_0240 | Stabmacher | Mein letzter Stab hat seinen Zauberer gewählt, indem er an ihm kleben blieb. Honigfinger. Drei Tage ließ er nicht los. // Das nenne ich Berufung. | Hinweis R2 |
| W1\_STAB\_MAX\_0750 | Max | Und wenn mich keiner wählt? |  |
| W1\_STAB\_STA\_0760 | Stabmacher | Dann wählst du einen. Der Stab merkt das nicht. Die meisten merken gar nichts. Es ist Holz. |  |
| W1\_STAB\_MAX\_0250 | Max | Was ist in den ganzen Schachteln? | Option Stabmacher |
| W1\_STAB\_STA\_0260 | Stabmacher | Nichts. Aber sie sehen gut aus. Ein Laden braucht Schachteln. Ohne Schachteln ist es ein Flur. |  |
| W1\_STAB\_MAX\_0770 | Max | Und wenn jemand eine kauft? |  |
| W1\_STAB\_STA\_0780 | Stabmacher | Dann verkaufe ich ihm eine leere Schachtel mit Würde. Das ist mein bestes Produkt. |  |
| W1\_STAB\_MAX\_0270 | Max | Was ist mit der Socke da? | Option Stabmacher |
| W1\_STAB\_STA\_0280 | Stabmacher | Ein Probestück. Der Sortierhut von Hoggelwarz ist in Rente, die Schule hat kein Geld, ich habe Socken. Das ist der Prototyp. |  |
| W1\_STAB\_MAX\_0281 | Max | Eine Socke sortiert Schüler? |  |
| W1\_STAB\_STA\_0282 | Stabmacher | Nach Charakter. Bisher nur nach Farbe. Aber sie lernt jeden Tag dazu. |  |
| W1\_STAB\_MAX\_0290 | Max | Ich schau mich noch mal um. | Option Stabmacher, beendet das Gespräch |
| W1\_STAB\_STA\_0300 | Stabmacher | Fass alles an. Nur nicht zu lange. Sonst denkt der Stab, du meinst es ernst. |  |

Lösung und Fehlversuche von Rätsel 2:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_STAB\_MAX\_0410 | Max | Ein Zahnstocher. Er wählt mich nicht, er pikst mich nur. | Nehmen: Zahnstocher |
| W1\_STAB\_STA\_0420 | Stabmacher | Nicht gewählt. Das sehe ich an deinem Gesicht. Und an dem Blutstropfen. | nach 0410 |
| W1\_STAB\_MAX\_0430 | Max | Zwei Meter ausgeklappt. Ich fühl mich nicht gewählt, ich fühl mich bloß vermessen. | Nehmen: Zollstock |
| W1\_STAB\_MAX\_0440 | Max | Ein Kochlöffel. Er liegt in meiner Hand, und dann fällt er raus. Nicht gewählt, würde ich sagen. | Nehmen: Kochlöffel, kommt ins Inventar |
| W1\_STAB\_STA\_0450 | Stabmacher | Er muss an dir hängen bleiben. Von selbst. Oder fast von selbst, ich schaue nicht so genau hin. | nach 0440 |
| W1\_STAB\_MAX\_0460 | Max | Zahnstocher mit Käse. Das ist ein Partysnack, kein Zauberstab. | Käsefondue auf Zahnstocher |
| W1\_STAB\_MAX\_0470 | Max | Käse auf den Zollstock? Dann hätte ich zwei Meter Snack. Klingt gar nicht schlecht, aber nein. | Käsefondue auf Zollstock |
| W1\_STAB\_MAX\_0480 | Max | Thunfisch klebt nicht, Thunfisch stinkt. Das ist laut Pixel ein wichtiger Unterschied. | Thunfischdose auf Kochlöffel |
| W1\_STAB\_PIX\_0490 | Pixel | Thunfisch stinkt nicht. Thunfisch duftet, junger Mann. // Noch so eine Beleidigung, und ich wechsle die Seite. Ich weiß noch nicht, auf welche, aber es wird nicht deine sein. | nach 0480 |
| W1\_STAB\_MAX\_0500 | Max | Käse auf den Löffel. Jetzt klebt er an meiner Hand, und zwar richtig fest. | Käsefondue auf Kochlöffel im Inventar; Lösung R2 |
| W1\_STAB\_STA\_0510 | Stabmacher | Er hängt an dir! Siehst du, wie er hängt! Er hat dich gewählt! | Träne unterm Monokel |
| W1\_STAB\_MAX\_0520 | Max | Er hängt nur, weil Käse dran ist. |  |
| W1\_STAB\_STA\_0530 | Stabmacher | Alle großen Berufungen haben einen Grund. Honig, Käse, Schicksal. Nimm ihn. Und nimm die Socke, als Probestück für die Schule. | gibt die Sortierende Socke |
| W1\_STAB\_PIX\_0540 | Pixel | Eine Socke, die sortiert. Und ich kenne eine Nase, die interpretiert. // Die beiden hätten sich viel zu sagen, und ich wäre gern dabei, wenn sie es tun. |  |
| W1\_STAB\_MAX\_0550 | Max | Klebt. Ich nenne das eine Bindung. | Ansehen: Kochlöffel-Zauberstab im Inventar |
| W1\_STAB\_MAX\_0555 | Max | Mein Zauberstab, gemacht aus Holz, Käse und Hoffnung. Zwei davon sind haltbar. | Ansehen: Kochlöffel-Zauberstab im Inventar, zweites Mal |
| W1\_STAB\_MAX\_0560 | Max | Eine rot-weiß gestreifte Socke. Sie sortiert, aber wonach, weiß keiner so genau. | Ansehen: Sortierende Socke |
| W1\_STAB\_MAX\_0565 | Max | Sie hat sich gerade selbst nach Farbe sortiert, rot zu rot und weiß zu weiß. Für eine Socke ist sie erstaunlich ordentlich. | Ansehen: Sortierende Socke, zweites Mal |
| W1\_STAB\_PIX\_0570 | Pixel | Sie hat mich soeben einsortiert, und zwar unter „Edel“. // Ich mag sie. Endlich jemand in diesem Königreich, der einen Blick für Qualität hat. | Ansehen: Socke, Pixel |
| W1\_STAB\_PIX\_0575 | Pixel | Sie hat mich ein zweites Mal einsortiert, diesmal unter „Unbezahlbar“. // Ich werde ihr ewig treu sein. Oder wenigstens bis zum nächsten Thunfisch. | Ansehen: Socke, Pixel, zweites Mal |
| W1\_STAB\_MAX\_0580 | Max | Hm. Hm. Hmm. Sie denkt nach, und zwar über mich. Das macht sonst eigentlich keiner. | Benutzen: Socke im Inventar |
| W1\_STAB\_MAX\_0590 | Max | Schwing. Nichts. Noch nichts. Aber es hat sich schon ziemlich dramatisch angefühlt. | Benutzen: Kochlöffel-Zauberstab ohne Ziel; Schwing-Animation |
| W1\_STAB\_MAX\_0600 | Max | Nicht hier. Wenn mich schon ein Löffel wählt, soll der Stabmacher wenigstens zusehen. Der weint dann bestimmt. | Käsefondue auf Kochlöffel; außerhalb des Zauberstab-Ladens, R2 bleibt offen |

Szene beim ersten Betreten des Ladens (einmalig):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_STAB\_STA\_0710 | Stabmacher | Ein Kunde! Oder ein Verirrter? Bei mir ist das oft dasselbe. | Szene, erstes Betreten; späht über das Monokel |
| W1\_STAB\_MAX\_0720 | Max | Ich schau mich nur um. |  |
| W1\_STAB\_STA\_0730 | Stabmacher | Das sagen alle. Dann wählt sie ein Stab, und sie kommen nie wieder los. |  |
| W1\_STAB\_PIX\_0740 | Pixel | Er redet über Zauberstäbe genau so, wie dein Großvater über Fernbedienungen redet: mit Andacht und ohne Ende. // Ich schlafe bei beiden zuverlässig ein, und das meine ich als Kompliment. |  |

Zurufe im Zauberstab-Laden (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_STAB\_PIX\_0610 | Pixel | Der Mann starrt dich durch sein Monokel an, und darin bist du gerade sehr groß. // Nutz das. So groß wirst du so bald nicht wieder. | Zuruf |
| W1\_STAB\_PIX\_0620 | Pixel | Drei Dinge auf einem Kissen, und eins davon ist die Antwort. // Das ist eine Quizshow für sehr geduldige Leute, und ich bin, wie du weißt, kein geduldiger Kater. | Zuruf; vor R2 |

## 6. Hoggelwarz, Klassenzimmer: Die Aufnahmeprüfung

Szene beim ersten Betreten: Ein Übungsbesen erwacht und jagt Pixels Haaren hinterher, bis er in den Schrank kracht. Alwin beginnt die Prüfung erst, wenn Max den Kochlöffel-Zauberstab hat (Rätsel 2). Toadi steht in der Tür und sieht zu.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_HOGG\_NAR\_0010 | – | Ein kleiner Besen in der Ecke zuckt, richtet sich auf und rast einem Büschel grauer Katzenhaare hinterher. Krach. Schrank. | Übungsbesen-Animation |
| W1\_HOGG\_PIX\_0020 | Pixel | Ich verliere Haare, das ist Fellpflege und keine Einladung! // Dieser Besen hat offensichtlich keine Kinderstube, und ich werde mich bei seinem Hersteller beschweren. | empört |
| W1\_HOGG\_ALW\_0030 | Alwin | Besen und Katzenhaare, das endet immer in der Abstellkammer. | seufzt, Kelle in der Hand; Hinweis auf Rätsel 11 |
| W1\_HOGG\_MAX\_0040 | Max | Ein Besen mit Verfolgungswahn. Wenn den einer filmt, hat er morgen eine Million Follower. |  |
| W1\_HOGG\_ALW\_0050 | Alwin | Ah, ein neuer Durchgefallener! Willkommen in Hoggelwarz! Zeig mir deinen Stab, Junge. | rückt die Brille zurecht |
| W1\_HOGG\_ALW\_0060 | Alwin | Keinen Stab? Dann komm wieder, wenn dich etwas gewählt hat. Ein Stab, ein Löffel, ein Schicksal. Alles wird genommen. | ohne Kochlöffel-Zauberstab |
| W1\_HOGG\_ALW\_0070 | Alwin | Ein Kochlöffel! Endlich einer mit Sinn für das Wesentliche. Die Prüfung kann beginnen. | mit Kochlöffel-Zauberstab; schaltet die Prüfung frei |

Ansehen im Klassenzimmer:

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_MAX\_0110 | Max | Schiefe Schulbänke, und unter jeder klebt Kaugummi, wette ich. Manche Sachen sind in jeder Welt gleich. | Schulbank |
| W1\_HOGG\_MAX\_0120 | Max | Eine leere Tafel. Entweder hat Alwin nichts zu sagen, oder er hat schon wieder alles vergessen. | Tafel |
| W1\_HOGG\_MAX\_0130 | Max | Ein Kessel, der leer vor sich hin blubbert. Er hat nichts zu sagen und sagt es trotzdem die ganze Zeit. | Kessel; vor dem Brauen |
| W1\_HOGG\_MAX\_0140 | Max | Sechs braune Flaschen ohne Etikett, und zwei davon sind doppelt so groß. Das ist entweder Magie oder Marketing. | Flaschenregal |
| W1\_HOGG\_PIX\_0150 | Pixel | Sechs Flaschen, kein Etikett. Ich rieche sie von hier aus, alle sechs. // Aber ich lasse mich bitten. Mindestens zweimal, und beim zweiten Mal bitte mit mehr Gefühl. | Flaschenregal, Pixel |
| W1\_HOGG\_MAX\_0160 | Max | Hohe Fenster, kühles Licht. Schulen sehen in jeder Welt so aus, als wäre gerade Montag. | Fenster |
| W1\_HOGG\_MAX\_0170 | Max | Der Schulleiter. Sternenrobe, Kochschürze, Kelle. Er weiß selbst nicht, was er gerade unterrichtet. | Alwin |
| W1\_HOGG\_MAX\_0180 | Max | Eine Socke mit Löchern, die auf einem Hocker liegt wie ein Ehrengast. | Durchgelöcherte zweite Socke |
| W1\_HOGG\_PIX\_0190 | Pixel | Die ist nach dem dritten Jahrgang in Rente gegangen, weil die Schüler sie durchgetragen haben. // Man sollte ihr ein Kissen geben. Wer so viel ertragen hat, verdient ein Kissen. | Zweite Socke, Pixel |
| W1\_HOGG\_MAX\_0200 | Max | Der Übungsbesen liegt im Schrank und zuckt. Ich glaube, er träumt von Katzenhaaren. | Besen im Schrank |
| W1\_HOGG\_MAX\_0210 | Max | Toadi steht in der Tür und drückt die Daumen, und zwar beide. Mehr hat er auch nicht. | Toadi |
| W1\_HOGG\_PIX\_0220 | Pixel | Kreide, Ruß und alter Pfannkuchen. Diese Schule hat Geschichte. // Und zwar frittierte. Ich rieche mindestens dreihundert Jahre Bratfett, und ich bin beeindruckt. | Pixel schnuppert: Kessel |
| W1\_HOGG\_ALW\_0230 | Alwin | Ein Kater! Hast du Haare? Natürlich hast du Haare. Weg vom Besen! Weg! … Zu spät. | Pixel auf Alwin; Besen zuckt im Schrank |

Gespräch mit Alwin (ab Prüfungsbeginn):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_HOGG\_MAX\_0310 | Max | Was muss ich für die Prüfung tun? | Option Alwin (bleibt) |
| W1\_HOGG\_ALW\_0320 | Alwin | Den Trank des Leuchtens brauen. Das Rezept: ein Ei, ein Krug Milch, ein Leuchtpilz. Zum Schluss die geheime Zutat aus dem Regal. | liest von der Kelle ab; Rezept bekannt |
| W1\_HOGG\_MAX\_0330 | Max | Das ist ein Pfannkuchenrezept. | Antwort auf 0320 |
| W1\_HOGG\_ALW\_0340 | Alwin | Ist es? Ist es nicht? Die Grenzen sind fließend. Wie Teig. |  |
| W1\_HOGG\_MAX\_0341 | Max | Und was macht aus einem Pfannkuchen einen Leuchttrank? |  |
| W1\_HOGG\_ALW\_0342 | Alwin | Der Pilz. Ohne Pilz ist es Frühstück, mit Pilz ist es Bildung. Leuchtpilze wachsen im Zauberwald, hinter der Trollbrücke. | Hinweis R6, Teil 1 |
| W1\_HOGG\_MAX\_0350 | Max | Wo gibt es hier Milch? | Option Alwin (bleibt); nach 0320 |
| W1\_HOGG\_ALW\_0360 | Alwin | Milch? Milch gibt es im ganzen Reich nicht mehr. Die Milch ist in einem anderen Schloss. // Aber Ziegen. Ziegen haben Milch, sagt man. Ich habe nie nachgesehen. | Hinweis R6, Teil 1 |
| W1\_HOGG\_MAX\_0950 | Max | In welchem Schloss? |  |
| W1\_HOGG\_ALW\_0960 | Alwin | In dem, das schwebt. Die Milch hat jetzt einen schöneren Ausblick als ich. |  |
| W1\_HOGG\_MAX\_0370 | Max | Was hat es mit dem Regal auf sich? | Option Alwin (bleibt) |
| W1\_HOGG\_ALW\_0380 | Alwin | Sechs Flaschen. Die Etiketten hat jemand vertauscht. Vermutlich ich. Mein Zettel sagt dir, welche die richtige ist. In Reimen. Ich war mal Barde. | gibt Alwins Hinweiszettel |
| W1\_HOGG\_MAX\_0970 | Max | Kannst du mir nicht einfach sagen, welche es ist? |  |
| W1\_HOGG\_ALW\_0980 | Alwin | Könnte ich. Aber dann hätte ich den Reim umsonst geschrieben. Ich habe vier Tage an „Schleim“ gesessen. |  |
| W1\_HOGG\_MAX\_0985 | Max | Was reimt sich denn auf „Schleim“? |  |
| W1\_HOGG\_ALW\_0987 | Alwin | Eben. Nichts Anständiges. Am vierten Tag habe ich ihn wieder gestrichen und bin ins Bett gegangen. |  |
| W1\_HOGG\_MAX\_0390 | Max | Wer ist eigentlich dieser Moderwort? | Option Alwin |
| W1\_HOGG\_ALW\_0400 | Alwin | Ein Schüler. Erstes Jahr. Er nieste in Kräuterkunde, alle lachten, er ging. Sehr empfindlich. // Sein Zeugnis liegt noch im Archiv. Nie abgeholt. | Hinweis auf das Zeugnis |
| W1\_HOGG\_MAX\_0401 | Max | Er ist gegangen, nur weil alle gelacht haben? |  |
| W1\_HOGG\_ALW\_0402 | Alwin | Ich habe auch gelacht. Er hat sehr laut geniest. Ich denke oft an ihn, meistens, wenn es blüht. | putzt die Brille |
| W1\_HOGG\_MAX\_0410 | Max | Was ist mit dem Besen los? | Option Alwin |
| W1\_HOGG\_ALW\_0420 | Alwin | Verzaubert. Alle Besen hier sind verzaubert. Sie fegen, was sich bewegt. Katzenhaare bewegen sich am schönsten. Frag mich nicht, warum. | Hinweis auf Rätsel 11 |
| W1\_HOGG\_PIX\_0990 | Pixel | Ich bewege mich nicht. Ich bin Dekoration, und zwar die hochwertigste in diesem Raum. |  |
| W1\_HOGG\_ALW\_1000 | Alwin | Das sagen sie alle. Der Besen glaubt es keinem. |  |
| W1\_HOGG\_MAX\_0430 | Max | Bis später. | Option Alwin, beendet das Gespräch |
| W1\_HOGG\_ALW\_0440 | Alwin | Geh nur. Der Kessel läuft nicht weg. Also, einmal schon. Lange Geschichte. |  |

Rätsel 6, Teil 1: die Zutaten. Reihenfolge egal. Nach der dritten Zutat verlangt Alwin die letzte aus dem Regal.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_MAX\_0510 | Max | Ei rein. Es blubbert gelb, so wie bei jedem Pfannkuchen. | Ei auf Kessel |
| W1\_HOGG\_MAX\_0520 | Max | Milch rein, und zwar alles. Der ganze Krug. | Ziegenmilch auf Kessel |
| W1\_HOGG\_PIX\_0530 | Pixel | Du hast die ganze Milch in einen Kessel gekippt, ohne einen einzigen Tropfen für den Kater. // Ich merke mir das. Lebenslang. Und Katzen haben, wie du weißt, neun davon. | nach 0520 |
| W1\_HOGG\_MAX\_0540 | Max | Pilz rein, und jetzt leuchtet es. Ich hab einen Pfannkuchen mit eingebauter Beleuchtung gemacht. | Leuchtpilz auf Kessel |
| W1\_HOGG\_ALW\_0550 | Alwin | Nicht den Fisch! Das wäre eine Quiche! | Thunfischdose auf Kessel |
| W1\_HOGG\_MAX\_0560 | Max | Käse rein, und es wird ein Auflauf. Alwin hat bestimmt Regeln dagegen. Glaube ich zumindest. | Käsefondue auf Kessel |
| W1\_HOGG\_MAX\_0570 | Max | Den Löffel zum Rühren nehmen? Nein, der ist jetzt ein Zauberstab, da kleben Erwartungen dran. Und Käse. | Kochlöffel-Zauberstab auf Kessel |
| W1\_HOGG\_ALW\_0580 | Alwin | Drei Zutaten. Jetzt die letzte: eine der sechs Flaschen. Wähle weise. Oder schnell. Beides ergibt eine Geschichte. | nach der dritten Zutat |
| W1\_HOGG\_MAX\_0590 | Max | Erst Ei, Milch und Pilz. Alwin ist da streng, also beim Rezept. Beim Rest eher nicht. | Flasche auf Kessel vor den drei Zutaten |

Rätsel 6, Teil 2: die sechs Flaschen. Alwins Zettel als Nahansicht, Pixels zwei Schnupperproben, Fehlwahl und Lösung (Flasche 3).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_ALW\_0610 | Alwin (Zettel) | Sechs Flaschen im Regal, so lautet die Zahl: ein Trank, ein Öl, zweimal Gift, zweimal Saft. Mehr hat mein Regal nie geschafft. | Nahansicht Hinweiszettel, Strophe 1 |
| W1\_HOGG\_ALW\_0620 | Alwin (Zettel) | Das Fischöl, das stinkt, steht gleich rechts neben dem Trank. Die zwei Riesen sind gleich bis zum Rand. Und am Rand des Regals steht nie, was du suchst. | Nahansicht Hinweiszettel, Strophe 2; Notizbuch trägt die drei Regeln ein |
| W1\_HOGG\_MAX\_0630 | Max | Rechts daneben. Hoffentlich von mir aus gesehen, sonst werd ich gleich ein Pilz. | Nahansicht, Max |
| W1\_HOGG\_PIX\_0640 | Pixel | Brennnessel. So riechen Pflanzen, wenn sie beleidigt sind, und diese hier ist sehr beleidigt. | Pixel schnuppert: Flasche 1 |
| W1\_HOGG\_PIX\_0650 | Pixel | Pilz, und zwar bitter. Wer das trinkt, wird selbst einer. // Ich habe das soeben erfunden, junger Mann, und bin mir trotzdem vollkommen sicher. | Pixel schnuppert: Flasche 2 |
| W1\_HOGG\_PIX\_0660 | Pixel | Zitrone, Honig und ein Hauch von Ärger. Das könnte alles Mögliche sein. // Ich lege mich nicht fest. Das ist keine Unsicherheit, das ist Stil. | Pixel schnuppert: Flasche 3 |
| W1\_HOGG\_PIX\_0670 | Pixel | Der Trank! Ganz sicher! Er riecht nach Erfolg und Zitrone und … Meer. // Erfolg riecht nach Meer, das weiß doch jeder. Meine Nase bürgt dafür. | Pixel schnuppert: Flasche 4 (Fischöl); die Nase lügt |
| W1\_HOGG\_PIX\_0680 | Pixel | Pilzgift, genau wie in der anderen Großen. Die beiden Riesen sind Zwillinge, und keiner von beiden ist nett. | Pixel schnuppert: Flasche 5 |
| W1\_HOGG\_PIX\_0690 | Pixel | Brennnessel, am Rand des Regals. Da steht nie, was man sucht. Das weiß sogar der Zettel, und der ist aus Papier. | Pixel schnuppert: Flasche 6 |
| W1\_HOGG\_PIX\_0700 | Pixel | Zwei Flaschen, mehr schnuppere ich nicht. Meine Nase ist ein Instrument, // und kein Werkzeug. Man spielt nicht einfach so darauf herum. | dritter Schnupperversuch |
| W1\_HOGG\_MAX\_0710 | Max | Rein damit. | falsche Flasche auf Kessel; grüner Rauch, Pilz-Verwandlung |
| W1\_HOGG\_MAX\_0720 | Max | Ich bin ein Pilz. Ich fühl mich irgendwie … bodenständig. | Max als Pilz |
| W1\_HOGG\_TOA\_0730 | Toadi | Familie? | aus der Tür, hoffnungsvoll |
| W1\_HOGG\_PIX\_0740 | Pixel | Ein Pilz mit Hoodie. Ich mache kein Foto davon, weil ich keine Hände habe. // Das ist mein einziger Grund. Merk dir das. |  |
| W1\_HOGG\_ALW\_0750 | Alwin | Falsche Flasche. Keine Sorge, das wächst sich raus. Meistens nach oben. | Verwandlung endet; Flasche steht wieder im Regal |
| W1\_HOGG\_PIX\_0760 | Pixel | Das war das Fischöl. Ich sagte Trank, und meine Nase sagte Trank. // Wir stehen beide zu unseren Fehlern, aber nicht laut, und vor allem nicht vor Zeugen. | nach Fehlwahl Flasche 4 |
| W1\_HOGG\_MAX\_0770 | Max | Flasche drei. Nicht am Rand, nicht groß, und das Fischöl steht rechts daneben. Pixel, du hast gelogen. | Flasche 3 auf Kessel; Lösung |
| W1\_HOGG\_PIX\_0780 | Pixel | Interpretiert. |  |
| W1\_HOGG\_NAR\_0790 | – | Der Kessel leuchtet gelb auf und beleuchtet das ganze Klassenzimmer. | Effekt |
| W1\_HOGG\_ALW\_0800 | Alwin | Bestanden! Der Trank des Leuchtens! Abfüllen, mitnehmen, nicht trinken. Er schmeckt nach Pfannkuchen, und das verwirrt. | gibt den Leuchttrank |
| W1\_HOGG\_MAX\_0810 | Max | Ein Trank, der leuchtet. Die Taschenlampe in meinem Handy kann das auch. Konnte das. Bis der Akku leer war. | Inventar: Leuchttrank |
| W1\_HOGG\_ALW\_0820 | Alwin | Und weil du bestanden hast, zeige ich dir, wie es nicht geht. Moderworts Zeugnis. Aus dem Archiv. Als Abschreckung. | holt das Zeugnis |
| W1\_HOGG\_MAX\_0830 | Max | „Kräuterkunde: ungenügend. Zaubertränke: ungenügend. Bosheit: befriedigend.“ Und eine Notiz: „Für meinen Mo-Knuddel, stolz!“ | Szene nach 0820, öffnet die Nahansicht; Notizbuch trägt „Mo-Knuddel“ ein |
| W1\_HOGG\_PIX\_0840 | Pixel | Mo-Knuddel. Das schreibt man sich auf. // Das schreibt man sich unter die Pfote und liest es sich in schweren Stunden vor. |  |
| W1\_HOGG\_ALW\_0850 | Alwin | Seine Mutti hat es unterschrieben. Er hat es nie abgeholt. Ich glaube, genau deswegen. |  |
| W1\_HOGG\_MAX\_0860 | Max | Ein Zeugnis mit Kosenamen drauf. Das ist schlimmer als jedes Klassenfoto, auf dem man blinzelt. | Ansehen: Zeugnis im Inventar, zweites Mal (nach 0890); öffnet die Nahansicht |
| W1\_HOGG\_MAX\_0870 | Max | Leuchtet im Dunkeln, steht jedenfalls drauf. | Ansehen: Leuchttrank im Inventar |
| W1\_HOGG\_MAX\_0875 | Max | Ich halt die Hand drüber, und es wird ein bisschen hell. Für ein Nachtlicht reicht's, für einen Dunklen Lord eher nicht. | Ansehen: Leuchttrank im Inventar, zweites Mal |
| W1\_HOGG\_MAX\_0880 | Max | Die Prüfung hab ich schon bestanden. Noch ein Trank, und Alwin stellt mich am Ende noch als Lehrer ein. | Flasche auf Kessel; nach R6 |
| W1\_HOGG\_MAX\_0890 | Max | Unten rechts steht: „Betragen: herausragend böse.“ Mit Sternchen. Das hat er sich bestimmt eingerahmt. | Ansehen: Zeugnis im Inventar, öffnet die Nahansicht (erstes Ansehen nach der Szene) |
| W1\_HOGG\_MAX\_0930 | Max | Eine Flasche ohne Etikett. Ob das mutig ist oder dumm, entscheidet gleich der Kessel. | Max nimmt eine der sechs Flaschen aus dem Regal; vor R6b |
| W1\_HOGG\_MAX\_0940 | Max | Eine Flasche pro Versuch. Wenn ich zwei auf einmal reinkippe, kommt bestimmt kein Trank raus, sondern Chaos. | Max greift zur zweiten Flasche, während er eine trägt |

Zurufe im Klassenzimmer (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_HOGG\_PIX\_0910 | Pixel | Der Kessel blubbert, die Flaschen schweigen, und Alwin summt ein Rezept. // Du könntest ruhig mitmachen. Wenigstens beim Summen. | Zuruf |
| W1\_HOGG\_PIX\_0920 | Pixel | Der Besen im Schrank zuckt immer noch, er träumt von meinen Haaren. // Ich fühle mich gleichzeitig geschmeichelt und bedroht, und das ist bei mir ein seltener Zustand. | Zuruf |

## 7. Troll-Brücke: Das Märchen nach Satzung

Rätsel 3 (dritte Ziege) und Rätsel 4 (a, b, c). Waldemar steht kerzengerade neben dem Schild, unter der Brücke läuft leise ein Grammophon. Die Ziegen warten am Dorfende der Brücke, sobald sie Max folgen. Nach Rätsel 4 endet der Begleiter-Schalter: Die XXL-Ziege grast an der Brücke, die Schmiede-Ziege trottet zurück in die Schmiede.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BRUE\_MAX\_0010 | Max | Eine Steinbrücke. Darunter ist genug Platz für einen Troll und seine Hobbys. | Ansehen: Brücke |
| W1\_BRUE\_MAX\_0015 | Max | In den Steinen sind lauter kleine Striche eingeritzt. Da hat wohl jemand die Leute gezählt, die nicht vorbeigekommen sind. | Ansehen: Brücke, zweites Mal |
| W1\_BRUE\_MAX\_0020 | Max | Ein Bach, ungefähr knietief. Für einen Troll ist das knöcheltief, aber er guckt trotzdem, als wäre es das Meer. | Ansehen: Bach |
| W1\_BRUE\_MAX\_0025 | Max | Ein Fisch springt raus, sieht mich, sieht die Brücke und taucht sofort wieder ab. Kluges Tier. | Ansehen: Bach, zweites Mal |
| W1\_BRUE\_MAX\_0030 | Max | Ein Schild mit mehr Paragrafen als mein Handyvertrag. Die Märchen-Satzung. | Ansehen: Schild, öffnet die Nahansicht |
| W1\_BRUE\_MAX\_0035 | Max | Paragraf zwölf: „Trolle dürfen nicht nass werden, ohne vorher Bescheid zu sagen.“ Okay. Merk ich mir. | Ansehen: Schild, öffnet die Nahansicht, zweites Mal |
| W1\_BRUE\_WAL\_0040 | Waldemar (Schild) | Paragraf 1: Drei Ziegenböcke überqueren die Brücke, der kleine zuerst, dann der mittlere, dann der große. | Nahansicht Satzung; Notizbuch trägt die Regel ein |
| W1\_BRUE\_WAL\_0050 | Waldemar (Schild) | Paragraf 2: Jeder Bock spricht seinen Satz. Der Kleine: „Friss mich nicht, mein Bruder ist fetter.“ Der Mittlere: „Friss mich nicht, mein Bruder ist noch fetter.“ Der Große: „Friss mich doch, wenn du dich traust.“ | Nahansicht Satzung |
| W1\_BRUE\_WAL\_0060 | Waldemar (Schild) | Paragraf 3: Der Troll geht ins Wasser. Paragraf 14b: Leihgaben sind zurückzugeben. | Nahansicht Satzung |
| W1\_BRUE\_MAX\_0070 | Max | „Der Troll geht ins Wasser.“ Steht da wirklich so. Von Reinfallen steht da nichts, und von einem Fluss auch nicht. | Nahansicht, Max; Hinweis R4c |
| W1\_BRUE\_PIX\_0080 | Pixel | Holz, Farbe und Pedanterie. Jemand hat jeden Paragrafen einzeln poliert, // und zwar, wenn ich mich nicht irre, mit einem Taschentuch und sehr viel Liebe. | Schild, Pixel schnuppert |
| W1\_BRUE\_MAX\_0090 | Max | Ein Grammophon unter der Brücke. Der Troll hört heimlich Musicals, und ich werde das keinem erzählen. | Ansehen: Grammophon |
| W1\_BRUE\_MAX\_0095 | Max | Die Platte heißt „Troll-Musicals, Folge 2“. Folge 1 liegt völlig zerkratzt daneben, die wurde offensichtlich sehr geliebt. | Ansehen: Grammophon, zweites Mal |
| W1\_BRUE\_MAX\_0100 | Max | Notenblätter. „Der Troll und ich, eine Ballade in drei Paragrafen.“ Eigenkomposition. | Ansehen: Notenblätter |
| W1\_BRUE\_MAX\_0105 | Max | Am Rand steht mit Bleistift: „Hier lauter singen. Mehr Gefühl. Weniger Brücke.“ | Ansehen: Notenblätter, zweites Mal |
| W1\_BRUE\_GRA\_0110 | Grammophon | … und zwischen zwei Liedern: Milch im Angebot. Nur heute. Nur für Vergessliche. | Benutzen: Grammophon; Radio-Moment, quäkend |
| W1\_BRUE\_MAX\_0120 | Max | Werbung auf einem Grammophon. Ich dachte echt, wenigstens hier wäre man davor sicher. | nach 0110 |
| W1\_BRUE\_PIX\_0130 | Pixel | „Nur für Vergessliche.“ Eine sehr spezielle Zielgruppe. // Ich kenne genau einen, der dazugehört. Er trägt Hut und riecht nach Lötzinn. | nach 0120 |
| W1\_BRUE\_MAX\_0140 | Max | Wildblumen. Hübsch, und voller Pollen. Das merk ich mir mal, für niemanden Bestimmten. | Ansehen: Wildblumen |
| W1\_BRUE\_MAX\_0145 | Max | Eine Blume hat ein Blatt in Herzform. Die hat der Troll bestimmt mit Absicht stehen lassen, der ist ein Romantiker. | Ansehen: Wildblumen, zweites Mal |
| W1\_BRUE\_MAX\_0150 | Max | Der Troll. Er steht so gerade, als hätte er ein Lineal verschluckt, und dazu trägt er eine Fliege. | Ansehen: Waldemar |
| W1\_BRUE\_MAX\_0155 | Max | Er rückt seine Fliege zurecht, zweimal, obwohl keiner guckt. Außer mir. Der Mann ist ein Profi. | Ansehen: Waldemar, zweites Mal |
| W1\_BRUE\_PIX\_0160 | Pixel | Moos, Regelbuch und Lampenfieber. Dieser Troll riecht nach einer zweiten Karriere. // Und zwar nach einer, von der er seiner Mutter noch nichts erzählt hat. | Waldemar, Pixel |
| W1\_BRUE\_MAX\_0170 | Max | Da geht's in den Wald, aber nur am Troll vorbei. Also eher noch nicht. | Ansehen: Waldweg; vor R4 |
| W1\_BRUE\_MAX\_0175 | Max | Der Weg zeigt auf mich, und der Troll auch. Beide sagen „noch nicht“, nur einer davon lauter. | Ansehen: Waldweg, zweites Mal; vor R4 |
| W1\_BRUE\_WAL\_0180 | Waldemar | Eine Katze. Paragraf 9: Katzen queren die Brücke jederzeit. Keine hat es je getan. Alle wollten das Ziegenritual sehen. | Pixel auf Waldemar |
| W1\_BRUE\_MAX\_0190 | Max | Da sitzt ein Troll mit Regelbuch. Da geh ich nicht einfach drüber, das endet bestimmt mit einem Paragrafen. | Benutzen: Brücke; vor R4 |

Gespräch mit Waldemar:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_MAX\_0210 | Max | Lass mich rüber. | Option Waldemar (bleibt) |
| W1\_BRUE\_WAL\_0220 | Waldemar | Regel eins: Niemand überquert die Brücke, bevor das Märchen abgelaufen ist. Regel zwei: siehe Regel eins. Regel drei: Lies das Schild. | tippt aufs Regelbuch |
| W1\_BRUE\_MAX\_0221 | Max | Und wenn ich einfach rüberlaufe? |  |
| W1\_BRUE\_WAL\_0222 | Waldemar | Dann stelle ich mich in den Weg. Sehr höflich, aber sehr breit. | macht sich breit |
| W1\_BRUE\_MAX\_0230 | Max | Welches Märchen? | Option Waldemar (bleibt) |
| W1\_BRUE\_WAL\_0240 | Waldemar | Das mit den drei Ziegenböcken. Klein, mittel, groß, jeder sagt seinen Satz, und am Ende gehe ich ins Wasser. // Das ist der Teil, den ich … nun. Ich kann nicht schwimmen. Aber Regel ist Regel. | räuspert sich |
| W1\_BRUE\_MAX\_1240 | Max | Und das findest du gut? |  |
| W1\_BRUE\_WAL\_1250 | Waldemar | Gut nicht. Aber es steht so in der Satzung. Ohne Satzung wäre ich nur ein großer Mann unter einer Brücke. |  |
| W1\_BRUE\_MAX\_0250 | Max | Was läuft da unten? | Option Waldemar |
| W1\_BRUE\_WAL\_0260 | Waldemar | Nichts! Schlager! Marschmusik! Trollmusik! // … Musicals. Sag es niemandem. Trolle hören keine Musicals. Es steht in keiner Satzung, aber in jedem Blick. | Fliege zittert |
| W1\_BRUE\_MAX\_0261 | Max | Welches Musical denn? |  |
| W1\_BRUE\_WAL\_0262 | Waldemar | Alle. Am liebsten das mit der Katze, die auf dem Dach singt. Ich weine jedes Mal. Laut Satzung nur innerlich. | flüstert |
| W1\_BRUE\_MAX\_0264 | Max | Die Satzung regelt sogar, wo du weinen darfst? |  |
| W1\_BRUE\_WAL\_0266 | Waldemar | Paragraf acht: Gefühle sind vorher anzumelden. Ich melde sie jedes Mal an, und jedes Mal lehne ich sie ab. |  |
| W1\_BRUE\_MAX\_0270 | Max | Du kannst wirklich nicht schwimmen? | Option Waldemar (bleibt) |
| W1\_BRUE\_WAL\_0280 | Waldemar | Ich sinke wie ein Paragraf. Aber die Satzung sagt Wasser, also Wasser. Ich bin Troll, kein Anwalt. Leider. | Hinweis R4c |
| W1\_BRUE\_MAX\_1260 | Max | Dann ändere doch die Satzung. |  |
| W1\_BRUE\_WAL\_1270 | Waldemar | Dafür brauche ich eine Versammlung. Die Versammlung bin ich. Ich bin nie beschlussfähig. |  |
| W1\_BRUE\_MAX\_0290 | Max | Würdest du für mich singen? | Option Waldemar; nach R4, mit Socke, Zauberwald betreten |
| W1\_BRUE\_WAL\_0300 | Waldemar | Hier? Vor der Brücke? Niemals. Die Akustik. Im Wald, zwischen den Pilzen, da trägt der Ton. // Komm. Bevor ich es mir anders überlege. | geht Richtung Wald; weiter in Abschnitt 9, Rätsel 7 |
| W1\_BRUE\_MAX\_1280 | Max | Also im Wald schon? |  |
| W1\_BRUE\_WAL\_1290 | Waldemar | Vielleicht. Wenn keiner zuhört. Und wenn doch, dann bitte mit Applaus. |  |
| W1\_BRUE\_MAX\_0310 | Max | Bis dann. | Option Waldemar, beendet das Gespräch |
| W1\_BRUE\_WAL\_0320 | Waldemar | Auf Wiedersehen. Paragraf 7: Höflichkeit ist Pflicht. Ich halte mich daran. Auch wenn es schwerfällt. |  |

Rätsel 3, dritte Ziege: Der Ziegenfell-Vorleger kommt auf Pixel. Danach Rätsel 4a, die Reihenfolge: Benutzen einer Ziege schickt sie auf die Brücke.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_PIX\_0410 | Pixel | Nein. // Nein. // … Gut. Aber ich will das Fell danach brennen sehen. | Ziegenfell-Vorleger auf Pixel |
| W1\_BRUE\_MAX\_0420 | Max | Du bist die kleine Ziege. |  |
| W1\_BRUE\_PIX\_0430 | Pixel | Ich bin die kleine Ziege. Sag es niemandem, nicht einmal deinem Großvater. // Besonders nicht deinem Großvater. Er würde es aufschreiben, und er schreibt alles in Großbuchstaben. | Pixel-als-Ziege-Sprite |
| W1\_BRUE\_WAL\_0440 | Waldemar | Das ist eine Katze in einem Teppich. | mustert Pixel |
| W1\_BRUE\_MAX\_0450 | Max | Steht irgendwo, dass es keine sein darf? |  |
| W1\_BRUE\_WAL\_0460 | Waldemar | … Ich prüfe. // Nein. Steht nirgends. Zugelassen. Mit Bauchschmerzen. | blättert im Regelbuch |
| W1\_BRUE\_MAX\_0470 | Max | Ich hab zwei Ziegen und einen Kater. Der Troll will aber drei Ziegen, also fehlt mir entweder eine Ziege oder ein Teppich. | Benutzen: Ziege, bevor alle drei da sind |
| W1\_BRUE\_WAL\_0480 | Waldemar | HALT! Paragraf eins! Der Kleine zuerst! Alle zurück auf Anfang! | falsche Ziege zuerst; Ziegen kehren um |
| W1\_BRUE\_WAL\_0490 | Waldemar | HALT! Nach dem Kleinen der Mittlere! Nicht der Große! Das ist ein Märchen, keine Horde! | falsche Reihenfolge an zweiter Stelle |
| W1\_BRUE\_PIX\_0500 | Pixel | Ich gehe. Auf allen vieren. In einem Teppich. // Wenn das irgendjemand filmt, junger Mann, wechsle ich den Haushalt, und zwar noch heute. | Pixel-Ziege betritt die Brücke |
| W1\_BRUE\_WAL\_0510 | Waldemar | Der Kleine. Korrekt. Und der Satz? | Pixel-Ziege auf der Brücke |
| W1\_BRUE\_WAL\_0520 | Waldemar | Der Mittlere. Korrekt. Und der Satz? | Schmiede-Ziege auf der Brücke, nach dem Kleinen |
| W1\_BRUE\_WAL\_0530 | Waldemar | Der Große. Korrekt. Ich werde ein wenig nervös. Und der Satz? | XXL-Ziege auf der Brücke, nach dem Mittleren |

Rätsel 4b, Ziegisch: Max liest den Text aus der Satzung vor (Benutzen: Schild), dann wechselt der Spieler zu Pixel und redet mit den Ziegen. Der erste Versuch geht schief, der zweite sitzt. Pixel sagt seinen eigenen Satz selbst. Redet Pixel vor dem Vorlesen mit den Ziegen, kommen die allgemeinen Ziegisch-Zeilen (SCHM 0410/0420, DORF 0990/1000).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_ZIE\_0610 | Schmiede-Ziege | Mäh. | auf der Brücke, statt Satz |
| W1\_BRUE\_WAL\_0620 | Waldemar | Das ist kein Satz. Das ist ein Laut. Paragraf zwei verlangt den Satz. Auf Ziegisch meinetwegen, aber den Satz. |  |
| W1\_BRUE\_MAX\_0630 | Max | Die sprechen aber nur Ziegisch. Und für Ziegisch hab ich nicht mal eine App. |  |
| W1\_BRUE\_PIX\_0640 | Pixel | Ich spreche fließend Ziegisch. Das hat mir meine Großmutter beigebracht, eine Stallkatze von hohem Rang. // Lies den Text vor, ich übersetze. Meistens richtig. | Hinweis R4b |
| W1\_BRUE\_MAX\_0650 | Max | „Friss mich nicht, mein Bruder ist fetter.“ „Friss mich nicht, mein Bruder ist noch fetter.“ „Friss mich doch, wenn du dich traust.“ Vorgelesen. Zufrieden? | Benutzen: Schild, Vorlesen; schaltet Pixels Übersetzung frei |
| W1\_BRUE\_PIX\_0660 | Pixel | Mäh. Friss mich nicht, mein Bruder ist fetter. // Ich sage das als Katze, und es war trotzdem zutiefst demütigend. Ich habe nicht einmal einen Bruder. | Pixel-Ziege spricht ihren Satz selbst |
| W1\_BRUE\_WAL\_0670 | Waldemar | Akzeptiert. Mit Vorbehalt. Weiter. | nach 0660 |
| W1\_BRUE\_PIX\_0680 | Pixel | Mä-mäh, määh mäh. | Pixel redet mit Schmiede-Ziege, erster Versuch |
| W1\_BRUE\_ZIE\_0690 | Schmiede-Ziege | MÄH! | stürmt auf Waldemar zu, beißt ins Regelbuch |
| W1\_BRUE\_WAL\_0700 | Waldemar | Sie sagte: „Friss das Buch, der Troll ist fetter!“ Das ist nicht der Text! Und das ist mein Buch! | rettet das Regelbuch |
| W1\_BRUE\_PIX\_0710 | Pixel | Ziegisch hat Dialekte. Ich spreche Hochziegisch, sie offenbar Schmiedeziegisch, und ein Vokal macht den ganzen Unterschied. // Noch einmal. Langsam, und diesmal mit weniger Buch. |  |
| W1\_BRUE\_PIX\_0720 | Pixel | Mä-mäh, määh mä-äh. | Pixel redet mit Schmiede-Ziege, zweiter Versuch |
| W1\_BRUE\_ZIE\_0730 | Schmiede-Ziege | Mäh mäh, määh mäh mäh. | würdevoll |
| W1\_BRUE\_WAL\_0740 | Waldemar | „Friss mich nicht, mein Bruder ist noch fetter.“ Korrekt. Wortlaut eingehalten. | nickt |
| W1\_BRUE\_PIX\_0750 | Pixel | Määh. Mäh mäh määäh. | Pixel redet mit XXL-Ziege, erster Versuch |
| W1\_BRUE\_XXL\_0760 | XXL-Ziege | Määäh. | legt sich mitten auf die Brücke und schläft |
| W1\_BRUE\_WAL\_0770 | Waldemar | Sie sagte: „Friss mich doch, ich mach ein Nickerchen.“ Das ist keine Drohung! Das ist eine Mittagspause! |  |
| W1\_BRUE\_PIX\_0780 | Pixel | Lieferziegisch. Da klingt alles nach Feierabend. // Noch einmal, und diesmal mit Betonung. Ich gebe ihr den Ton vor. |  |
| W1\_BRUE\_PIX\_0790 | Pixel | MÄÄH. Mäh mäh mäh MÄH. | Pixel redet mit XXL-Ziege, zweiter Versuch |
| W1\_BRUE\_XXL\_0800 | XXL-Ziege | MÄÄÄÄH. | steht auf, senkt die Hörner |
| W1\_BRUE\_WAL\_0810 | Waldemar | „Friss mich doch, wenn du dich traust.“ Korrekt. Und ich traue mich nicht. Das steht nicht im Text, das ist privat. | weicht einen Schritt zurück |
| W1\_BRUE\_MAX\_0820 | Max | Drei Ziegen, drei Sätze. Das war mehr Textarbeit als in meiner ganzen bisherigen Schulzeit zusammen. |  |

Rätsel 4c, ins Wasser: Waldemar muss laut Paragraf 3 ins Wasser. Der Eimer vom Brunnen macht ein Fußbad daraus.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_WAL\_0910 | Waldemar | Und nun … Paragraf drei. Der Troll geht ins Wasser. | sieht in den Bach, zittert |
| W1\_BRUE\_WAL\_0920 | Waldemar | Ich … kann nicht. Ich stehe hier seit vierzig Jahren und ich kann nicht. | Fliege hängt schief |
| W1\_BRUE\_MAX\_0930 | Max | Ich schubs keinen Troll in einen Bach, nicht mal für ein Ei. Da muss es noch eine andere Lösung geben. | Benutzen: Bach; nach 0920, vor der Lösung von R4c |
| W1\_BRUE\_WAL\_0940 | Waldemar | Ein leerer Eimer ist kein Wasser. Paragraf drei kennt keine Symbolik. | leerer Eimer auf Waldemar |
| W1\_BRUE\_MAX\_0950 | Max | Waldemar. Da steht „Wasser“. Nicht Fluss, nicht Bach, einfach nur Wasser. | Eimer mit Wasser auf Waldemar |
| W1\_BRUE\_WAL\_0960 | Waldemar | Ein Eimer. Mit Wasser. … Das ist Wasser im Sinne der Satzung. Ich gehe hinein. Mit den Füßen. | setzt sich, Fußbad-Animation |
| W1\_BRUE\_WAL\_0970 | Waldemar | Regel erfüllt. Ahhh. | wackelt mit den Zehen |
| W1\_BRUE\_MAX\_0980 | Max | Fußbad. Zählt. |  |
| W1\_BRUE\_PIX\_0990 | Pixel | Die Füße im Eimer und das Gesicht eines Mannes, der zum ersten Mal seit vierzig Jahren Urlaub hat. // Ich kenne diesen Blick. Ich sehe ihn jeden Morgen im Spiegel, kurz nach dem Frühstück. |  |
| W1\_BRUE\_WAL\_1000 | Waldemar | Die Brücke ist frei. Und: Regel 14b. Leihgaben sind zurückzugeben. | gibt den leeren Eimer zurück; R4 gelöst, Zauberwald und Wasserschloss offen |
| W1\_BRUE\_PIX\_1010 | Pixel | Darf ich den Teppich jetzt bitte ausziehen? | Pixel-Ziege |
| W1\_BRUE\_MAX\_1020 | Max | Behalt ihn noch kurz an. Vielleicht gibt's ja eine Fortsetzung. |  |
| W1\_BRUE\_PIX\_1030 | Pixel | Ich hasse Fortsetzungen. | Pixel legt das Fell ab; Vorleger zurück ins Inventar |
| W1\_BRUE\_MAX\_1040 | Max | Der Troll badet, und die Brücke ist frei. Ich geh jetzt einfach drüber, wie ein ganz normaler Mensch. | Ansehen: Brücke; nach R4 |
| W1\_BRUE\_MAX\_1045 | Max | Er planscht und singt dabei leise vor sich hin. Ich glaube, er ist glücklich. Ich geh trotzdem lieber schnell. | Ansehen: Brücke, zweites Mal; nach R4 |
| W1\_BRUE\_WAL\_1050 | Waldemar | Noch ein Eimer? Paragraf drei ist erfüllt. Mehr Wasser wäre Luxus. Ich nehme ihn trotzdem. Nein. Regel ist Regel. | Eimer mit Wasser auf Waldemar; nach R4 |
| W1\_BRUE\_WAL\_1060 | Waldemar | Wasser? Jetzt schon? Paragraf eins: Erst das Märchen, dann das Bad. Und keine deiner Ziegen hat bisher einen ganzen Satz gesagt. | Eimer mit Wasser auf Waldemar; vor R4b |
| W1\_BRUE\_WAL\_1070 | Waldemar | Finger weg von meinem Bach. Paragraf elf: Wasser bleibt, wo es wohnt. Hol dir eigenes. | leerer Eimer auf Bach |

Szene beim ersten Betreten der Troll-Brücke (einmalig):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BRUE\_WAL\_1210 | Waldemar | Halt. Laut Satzung wird hier jeder angehalten. Du bist angehalten. | Szene, erstes Betreten; hebt die Hand |
| W1\_BRUE\_MAX\_1220 | Max | Ich hab die Brücke doch noch gar nicht betreten. |  |
| W1\_BRUE\_WAL\_1230 | Waldemar | Dann bist du vorsorglich angehalten. Das Schild dort erklärt alles. Ich lese es dir nicht vor, ich bin Troll, kein Vorleser. | zeigt auf das Schild; Hinweis R4 |

Zurufe an der Troll-Brücke (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BRUE\_PIX\_1110 | Pixel | Der Troll steht so gerade, dass mir vom bloßen Zusehen der Rücken wehtut. // Ich lege mich gleich hin, um das auszugleichen. Aus medizinischen Gründen. | Zuruf |
| W1\_BRUE\_PIX\_1120 | Pixel | Unter der Brücke läuft Musik. Sehr leise, sehr heimlich und sehr schlecht versteckt. // Wer heimlich Musik hört, der singt auch heimlich. Das ist bei Trollen nicht anders als bei Katern. | Zuruf |
| W1\_BRUE\_PIX\_1130 | Pixel | Die Ziegen warten, ich warte, und der Troll wartet auch. // Das ist kein Abenteuer mehr, das ist ein Wartezimmer. Es fehlen nur noch die Zeitschriften. | Zuruf; wenn Ziegen dabei sind, vor R4 |

## 8. Wasserschloss: Ein anderes Schloss

Gag-Szene ohne Rätsel, erreichbar nach Rätsel 4. Zeldinas frühere Wohnung: Umzugskartons, ein Schild „Zu vermieten“, ein misstrauischer Schwan. Toadi kommt angerannt, sobald Max das Tor erreicht.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_WASS\_MAX\_0010 | Max | Ein Schloss mitten im See, mit Steg und Schild. Von hier aus sieht das schon nach Wasserschaden aus. | Szene, Ankunft |
| W1\_WASS\_TOA\_0020 | Toadi | Danke, Max! Aber die Prinzessin ist in einem anderen Schloss! | rennt heran, Keuchen-Animation |
| W1\_WASS\_MAX\_0030 | Max | Ich hab sie doch gar nicht gesucht. |  |
| W1\_WASS\_TOA\_0040 | Toadi | Trotzdem danke! Das sagt man so! |  |
| W1\_WASS\_PIX\_0050 | Pixel | Er hat das geübt. Vor dem Spiegel, mit Betonung auf „anderen“. // Ich höre so etwas. Ein Satz klingt anders, wenn man ihn zum hundertsten Mal sagt. |  |
| W1\_WASS\_MAX\_0060 | Max | „Zu vermieten. Zwei Zimmer, Seeblick, feucht.“ So viel Ehrlichkeit bin ich von Anzeigen gar nicht gewohnt. | Ansehen: Schild am Tor |
| W1\_WASS\_MAX\_0065 | Max | Darunter, kleiner: „Haustiere erlaubt. Außer Fische. Fische sind Vormieter.“ | Ansehen: Schild am Tor, zweites Mal |
| W1\_WASS\_MAX\_0070 | Max | Umzugskartons, beschriftet mit „Kronen“, „Kronen, Ersatz“ und „Kram“. Sie ist also weg, aber freiwillig und ziemlich ordentlich. | Ansehen: Umzugskartons |
| W1\_WASS\_MAX\_0075 | Max | Ein Karton heißt „Prinzessin, Notfall“. Ich will unbedingt wissen, was drin ist, und gleichzeitig auf keinen Fall. | Ansehen: Umzugskartons, zweites Mal |
| W1\_WASS\_PIX\_0080 | Pixel | Kartons. Katzen lieben Kartons, das ist allgemein bekannt. // Und diese hier sind zugeklebt. Das ist Grausamkeit mit Klebeband, junger Mann, und ich nehme es persönlich. | Ansehen: Kartons, Pixel |
| W1\_WASS\_PIX\_0085 | Pixel | Ich habe an jedem einzelnen Karton gekratzt, und keiner hat sich geöffnet. // Das ist meine schlimmste Niederlage seit dem Staubsauger, und über den Staubsauger reden wir nicht. | Ansehen: Kartons, Pixel, zweites Mal |
| W1\_WASS\_MAX\_0090 | Max | Zugeklebt, und außerdem nicht meins. Das sind zwei Gründe, und eigentlich reicht schon der erste. | Benutzen: Kartons |
| W1\_WASS\_MAX\_0100 | Max | Ein zusammengerollter Teppich. Den lass ich liegen, ein Kater im Teppich reicht mir für heute. | Ansehen: Teppich |
| W1\_WASS\_MAX\_0105 | Max | Der Teppich hat eine Beule. Ich frag lieber nicht nach, ich hab genug Filme gesehen. | Ansehen: Teppich, zweites Mal |
| W1\_WASS\_MAX\_0110 | Max | Ein Ruderboot ohne Ruder. Damit ist es eigentlich nur noch ein Boot, das ein bisschen rumliegt. | Ansehen: Ruderboot |
| W1\_WASS\_MAX\_0115 | Max | Am Bug steht „Seerose II“. Wo die Seerose I ist, will ich lieber nicht wissen. | Ansehen: Ruderboot, zweites Mal |
| W1\_WASS\_MAX\_0120 | Max | Ein Schwan. Er guckt, als wäre ich an irgendetwas schuld. | Ansehen: Schwan |
| W1\_WASS\_MAX\_0125 | Max | Er guckt immer noch. Ich hab drüber nachgedacht, und vielleicht bin ich wirklich an irgendwas schuld. Ich weiß bloß nicht, woran. | Ansehen: Schwan, zweites Mal |
| W1\_WASS\_SWA\_0130 | Schwan | Fauch. | Pixel redet mit Schwan |
| W1\_WASS\_PIX\_0140 | Pixel | Er sagt, die Prinzessin ist vor drei Wochen ausgezogen. Nach oben. Mit allen Kartons. // Und er sagt, ich soll aufhören, ihn anzusehen. Ich höre nicht auf, denn ich war zuerst hier. Also, fast. | Übersetzung; Hinweis auf das Luftschloss |
| W1\_WASS\_MAX\_0150 | Max | Schilf. Es raschelt, aber da ist nichts drin. Ich hab nachgeguckt, Pixel nicht. | Ansehen: Schilf |
| W1\_WASS\_PIX\_0155 | Pixel | Im Schilf raschelt es. Das war ich. // Ich wollte nur, dass du dich erschreckst, und ich sage mit einer gewissen Befriedigung: Es hat geklappt. | Ansehen: Schilf, zweites Mal |
| W1\_WASS\_TOA\_0160 | Toadi | Die Katze! Sie ist mir gefolgt! Oder ich ihr! Es ist kompliziert! | Pixel auf Toadi, Wasserschloss |
| W1\_WASS\_PIX\_0170 | Pixel | Ein Schloss ohne Prinzessin, ein See ohne Fische und ein Schwan mit Haltung. // Ich würde hier sofort einziehen. Unter der Bedingung, dass der Schwan auszieht. | Zuruf |

## 9. Zauberwald: Niesrosen und Lieferdienst

Hier liegen der Leuchtpilz (Rätsel 6), der Ketchup (Rätsel 10, Weg A) und die Niesrosen (Rätsel 7). Rotkäppchen steht am Lieferkarren, der Stolleneingang führt zum Goblin-Bergwerk.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_WALD\_MAX\_0010 | Max | Riesenpilze, rot mit weißen Punkten. Jedes Spiel aus meiner Kindheit hat mich davor gewarnt. Oder mich dazu überredet. | Ansehen: Riesenpilze |
| W1\_WALD\_MAX\_0015 | Max | Wenn ich da draufspringe, werde ich größer. Oder ich krieg Bauchschmerzen. Ich probier's lieber nicht aus. | Ansehen: Riesenpilze, zweites Mal |
| W1\_WALD\_MAX\_0020 | Max | Kleine blaue Pilze, die leuchten. Nachtlicht für Zwerge. | Ansehen: Leuchtpilze |
| W1\_WALD\_MAX\_0025 | Max | Sie leuchten heller, wenn ich flüstere. Ich hab „Hallo“ geflüstert, und jetzt hab ich Freunde. | Ansehen: Leuchtpilze, zweites Mal |
| W1\_WALD\_MAX\_0030 | Max | Einer reicht. Alwin hat „ein Leuchtpilz“ gesagt und nicht „eine Lichterkette“. | Nehmen: Leuchtpilz |
| W1\_WALD\_PIX\_0040 | Pixel | Nicht essen. Ich sage das zu mir selbst, und zwar laut. // Es hilft ein bisschen. Nicht viel, aber ein bisschen. | nach 0030 |
| W1\_WALD\_MAX\_0050 | Max | Ein Busch voller rosa Rosen. Alle zu. Wie ein Chat, in dem keiner zuerst schreibt. | Ansehen: Niesrosen, geschlossen |
| W1\_WALD\_MAX\_0055 | Max | Eine Rose zuckt, wenn ich hingucke. Sie ist kurz davor, so wie ich kurz vor einem Niesen. | Ansehen: Niesrosen, geschlossen, zweites Mal |
| W1\_WALD\_PIX\_0060 | Pixel | Niesrosen. Ich rieche sie nicht, weil sie zu sind. // Und das ist ehrlich gesagt das Einzige, was ich an ihnen mag. Blumen gehören in Vasen, nicht in Nasen. | Ansehen: Niesrosen, Pixel |
| W1\_WALD\_PIX\_0065 | Pixel | Ich sehe sie an, und sie sehen mich an. Wir haben einen Pakt geschlossen: // Sie bleiben zu, und ich bleibe hübsch. Bisher halten sich beide Seiten daran. | Ansehen: Niesrosen, Pixel, zweites Mal |
| W1\_WALD\_MAX\_0070 | Max | Offen. Und voller Pollen. Jemand mit Heuschnupfen würde hier sofort umdrehen. | Ansehen: Niesrosen, offen; nach R7 |
| W1\_WALD\_MAX\_0075 | Max | Die Luft ist gelb. Ich halte die Luft an und sehe trotzdem gelb. Das ist kein Busch mehr, das ist eine Waffe. | Ansehen: Niesrosen, offen, zweites Mal; nach R7 |
| W1\_WALD\_MAX\_0080 | Max | Ein Lieferkarren voller Kisten: „Zerbrechlich“, „Oma“ und „Ziege, Ersatz“. | Ansehen: Lieferkarren |
| W1\_WALD\_MAX\_0085 | Max | Eine Kiste heißt „Wolf, Rücksendung“. Dieses Märchen hat ein ernsthaftes Retourenproblem. | Ansehen: Lieferkarren, zweites Mal |
| W1\_WALD\_MAX\_0090 | Max | „Rotkäppchens Ketchup. Rot wie Omas Mütze.“ Immerhin kein Blut. | Ansehen: Ketchup am Karren |
| W1\_WALD\_MAX\_0095 | Max | Auf der Rückseite steht: „Bei Wolfsbiss zweimal auftragen.“ Das ist sehr praktisch und gleichzeitig sehr beunruhigend. | Ansehen: Ketchup am Karren, zweites Mal |
| W1\_WALD\_PIX\_0100 | Pixel | Rot und dickflüssig. Es sieht aus wie Blut, solange man nicht daran riecht. // Und Goblins riechen nicht daran. Goblins riechen an gar nichts, das sieht man ihnen an. | Ansehen: Ketchup, Pixel; Hinweis R10 A |
| W1\_WALD\_PIX\_0105 | Pixel | Ich habe noch einmal geschnuppert: Tomate, Zucker und Lüge. // Perfekt für alle, die nicht nachdenken, und davon gibt es in diesem Königreich erfreulich viele. | Ansehen: Ketchup, Pixel, zweites Mal; Hinweis R10 A |
| W1\_WALD\_MAX\_0110 | Max | Eine Flasche Ketchup. Falls ich irgendwo unterschreiben muss. Oder irgendwo Pommes finde. | Nehmen: Ketchup; nach Rotkäppchens Erlaubnis |
| W1\_WALD\_MAX\_0120 | Max | Ein Kürbis auf einem Kürbis auf einem Kürbis. Und daneben ein Glasschuh, Größe 38, würde ich schätzen. | Ansehen: Kürbisturm und Glasschuh |
| W1\_WALD\_MAX\_0125 | Max | Der Schuh hat einen Absatz und eine Mitternachts-Garantie. Eine Kutsche ist leider nicht dabei. | Ansehen: Kürbisturm und Glasschuh, zweites Mal |
| W1\_WALD\_PIX\_0130 | Pixel | Da hatte es jemand um Mitternacht sehr eilig. // Ich kenne das. Um Mitternacht gibt es bei deinem Großvater manchmal Reste, und dann bin auch ich sehr schnell. | Ansehen: Glasschuh, Pixel |
| W1\_WALD\_PIX\_0135 | Pixel | Ein Schuh aus Glas. Man sieht die Zehen. // Das ist keine Mode, das ist ein Röntgenbild, und ich wollte niemandes Zehen so genau kennen. | Ansehen: Glasschuh, Pixel, zweites Mal |
| W1\_WALD\_MAX\_0140 | Max | Glühwürmchen. Die blinken genau wie die Lämpchen am Router, und deshalb tut mir das hier ein bisschen weh. | Ansehen: Glühwürmchen |
| W1\_WALD\_MAX\_0145 | Max | Eins blinkt anders als die anderen. Ich glaube, es hat Verbindungsprobleme. Ich kann das gut verstehen. | Ansehen: Glühwürmchen, zweites Mal |
| W1\_WALD\_MAX\_0150 | Max | Ein Stolleneingang mit Plakaten davor. Die Goblins streiken. Ich dachte immer, Goblins arbeiten sowieso nicht. | Ansehen: Stolleneingang |
| W1\_WALD\_MAX\_0155 | Max | Auf einem Plakat steht: „Kein Gold ohne Pausen!“ Auf einem anderen: „Mehr Pausen!“ Da ist eine Bewegung entstanden. | Ansehen: Stolleneingang, zweites Mal |
| W1\_WALD\_MAX\_0160 | Max | Rotkäppchen. Rote Jacke, rote Kappe, Sneaker. Der Korb ist inzwischen ein Karren, die Zeiten ändern sich eben. | Ansehen: Rotkäppchen |
| W1\_WALD\_MAX\_0165 | Max | Sie hakt eine Liste ab: ein Haken bei „Oma“, ein Fragezeichen bei „Wolf“ und ein Smiley bei „Trinkgeld“. | Ansehen: Rotkäppchen, zweites Mal |
| W1\_WALD\_MAX\_0170 | Max | Verdrehte Bäume. Als hätte jemand den Wald beim Wachsen gestört. | Ansehen: Bäume |
| W1\_WALD\_MAX\_0175 | Max | Ein Baum hat ein Gesicht in der Rinde, und er sieht genervt aus. Ich auch. Wir sind quasi Kollegen. | Ansehen: Bäume, zweites Mal |
| W1\_WALD\_PIX\_0180 | Pixel | Pappe, Ketchup und ein Hauch von Oma. Dieser Karren hat mehr erlebt als ich, // und ich war immerhin schon im Fernseher. Von innen, was nicht jeder Kater behaupten kann. | Pixel schnuppert: Lieferkarren |
| W1\_WALD\_ROT\_0190 | Rotkäppchen | Eine Katze! Hallo! Ich hab Katzenfutter dabei. Nein, hab ich nicht. Das war ein Lieferdienst-Reflex. | Pixel auf Rotkäppchen |
| W1\_WALD\_MAX\_0730 | Max | Das gehört Rotkäppchen, da frag ich lieber. Wer im Wald einfach was nimmt, kriegt am Ende eine Moral. | Nehmen: Ketchup; vor Rotkäppchens Erlaubnis |

Gespräch mit Rotkäppchen:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_WALD\_MAX\_0210 | Max | Was lieferst du so? | Option Rotkäppchen |
| W1\_WALD\_ROT\_0220 | Rotkäppchen | Alles. Kuchen, Wein, Ziegen, Omas. Omas sind am schwersten zu verpacken. | zählt an den Fingern |
| W1\_WALD\_MAX\_0221 | Max | Omas? Mehrere? |  |
| W1\_WALD\_ROT\_0222 | Rotkäppchen | Meine. Sie zieht dauernd um, immer tiefer in den Wald. Wegen der Ruhe, sagt sie. | zuckt mit den Schultern |
| W1\_WALD\_MAX\_0230 | Max | Kann ich eine Flasche Ketchup haben? | Option Rotkäppchen (bleibt) |
| W1\_WALD\_ROT\_0240 | Rotkäppchen | Der ist für die Goblins. Die bestellen jede Woche Ketchup und nie Pommes. Nimm eine, die merken's nicht. Die zählen in Fackeln. | gibt den Ketchup frei |
| W1\_WALD\_MAX\_0241 | Max | Die Goblins zählen in Fackeln? |  |
| W1\_WALD\_ROT\_0242 | Rotkäppchen | Sie haben nur eine. Also zählen sie bis eins, dann ist es dunkel, und sie fangen von vorne an. | Hinweis R10 |
| W1\_WALD\_MAX\_0250 | Max | Hast du keine Angst vor dem Wolf? | Option Rotkäppchen |
| W1\_WALD\_ROT\_0260 | Rotkäppchen | Welcher Wolf? Ach, der. Der ist Kunde. Bestellt immer Nachthemden in Oma-Größe. Ich frag nicht. Trinkgeld stimmt. |  |
| W1\_WALD\_MAX\_0770 | Max | Und die Großmutter? |  |
| W1\_WALD\_ROT\_0780 | Rotkäppchen | Ist in Rente. Wohnt auf Mallorca. Der Wolf gießt ihre Blumen. |  |
| W1\_WALD\_MAX\_0270 | Max | Was ist mit den Rosen? | Option Rotkäppchen (bleibt) |
| W1\_WALD\_ROT\_0280 | Rotkäppchen | Niesrosen. Gehen nur auf, wenn einer singt. Richtig singt. Ich hab's probiert. Sie sind zugegangen. Fester. | Hinweis R7 |
| W1\_WALD\_MAX\_0281 | Max | Und wer singt hier richtig? |  |
| W1\_WALD\_ROT\_0282 | Rotkäppchen | Im Wald? Keiner. Aber an der Brücke summt manchmal jemand. Sehr tief, sehr falsch, sehr schön. | Hinweis R7 |
| W1\_WALD\_MAX\_0290 | Max | Bis dann. | Option Rotkäppchen, beendet das Gespräch |
| W1\_WALD\_ROT\_0300 | Rotkäppchen | Bewertung nicht vergessen! Fünf Körbe! |  |

Rätsel 7, die Niesrosen. Fehlversuche, dann Waldemars Musical-Nummer (ausgelöst im Gespräch an der Brücke, Abschnitt 7). Max fängt die Pollen in der Sortierenden Socke.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_WALD\_MAX\_0410 | Max | Die Rosen sind zu, und die Socke ist leer. Keiner will hier den ersten Schritt machen. | Socke auf Rosen; vor R7 |
| W1\_WALD\_MAX\_0420 | Max | La. … Nein. Die Rosen haben sich noch fester zugemacht, und ehrlich gesagt hab ich das verdient. | Benutzen: Rosen, Max singt |
| W1\_WALD\_PIX\_0430 | Pixel | Du singst wie ein Modem, junger Mann. Ich meine das als Kompliment. // An das Modem. Die Dinger hatten wenigstens Rhythmus. | nach 0420 |
| W1\_WALD\_PIX\_0440 | Pixel | Miaaau. … Sie bleiben zu. Banausen. // Im Hinterhof war ich legendär. Die Nachbarn haben jede Nacht Schuhe nach mir geworfen, aus reiner Begeisterung. | Pixel benutzt Rosen |
| W1\_WALD\_MAX\_0450 | Max | Wasser hilft Rosen beim Wachsen, aber nicht beim Aufgehen. Hab ich irgendwo gelesen. Oder gerade erfunden. | Eimer auf Rosen |
| W1\_WALD\_WAL\_0460 | Waldemar | Hier. Zwischen den Pilzen. Sieht jemand zu? | Szene: Waldemar kommt in den Wald, Toadi rennt hinterher und bleibt für die Nummer |
| W1\_WALD\_MAX\_0470 | Max | Nur ich, ein Kater, ein Pilzdiener, eine Lieferantin und ein Busch voller Rosen. |  |
| W1\_WALD\_WAL\_0480 | Waldemar | Also niemand. Gut. | legt das Regelbuch ab, Fliege gerade |
| W1\_WALD\_WAL\_0490 | Waldemar | Ich steh an meiner Brücke, seit vierzig Jahren schon … ich prüfe jede Lücke, in jedem Paragraf-o-on … | Musical-Nummer, Gesang; Text als Untertitel |
| W1\_WALD\_WAL\_0500 | Waldemar | … doch heute Nacht, da sag ich: WAAASSEEER! | Schlusston, lang; Niesrosen gehen auf |
| W1\_WALD\_NAR\_0510 | – | Die Rosen öffnen sich eine nach der anderen. Eine rosa Wolke steigt auf. | Aufgehen-Animation |
| W1\_WALD\_MAX\_0520 | Max | Socke auf, Pollen rein. | hält die Socke in die Wolke; Inventar: Socke voller Pollen |
| W1\_WALD\_MAX\_0530 | Max | Die Socke sortiert schon: „Pollen, Kategorie: Niesen.“ Danke, Socke. |  |
| W1\_WALD\_PIX\_0540 | Pixel | Hatschi. // Das war nicht ich. Das war die Natur. Durch mich. | niest |
| W1\_WALD\_WAL\_0550 | Waldemar | War es … gut? Sei ehrlich. Paragraf 12: Kritik muss konstruktiv sein. | außer Atem, hoffnungsvoll |
| W1\_WALD\_MAX\_0560 | Max | Die Rosen sind aufgegangen, Rotkäppchen klatscht, und Toadi weint. Das ist mehr Reaktion, als ich je auf irgendwas gekriegt hab. |  |
| W1\_WALD\_MAX\_0570 | Max | Und du kriegst deinen Auftritt, ganz am Ende. Ich hab gute Beziehungen zum Abspann. | Versprechen; Schalter Abspann |
| W1\_WALD\_WAL\_0580 | Waldemar | Im Abspann! Mit Scheinwerfer? … Ich nehme auch eine Fackel. | geht zurück zur Brücke, summt |
| W1\_WALD\_PIX\_0590 | Pixel | Du hast einem Troll einen Auftritt versprochen, über den du nicht das Geringste zu bestimmen hast. // Das ist entweder sehr mutig, oder es ist Fernsehen. Meistens ist es Fernsehen. |  |
| W1\_WALD\_MAX\_0600 | Max | Eine Socke voller Pollen. Wer das anfasst, niest sich die Nase weg. Wer eine hat. | Ansehen: Socke voller Pollen |
| W1\_WALD\_MAX\_0605 | Max | Ich halte sie mit ausgestrecktem Arm von mir weg, und trotzdem juckt mein Arm schon. Diese Socke hat Macht. | Ansehen: Socke voller Pollen, zweites Mal |

Szene beim ersten Betreten des Zauberwalds (einmalig):

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_WALD\_ROT\_0740 | Rotkäppchen | Lieferung? Nein? Schade. Ich steh hier, bis die Goblins ihren Ketchup abholen. Das kann dauern, die streiken. | Szene, erstes Betreten; lehnt am Karren |
| W1\_WALD\_MAX\_0750 | Max | Die Goblins streiken? |  |
| W1\_WALD\_ROT\_0760 | Rotkäppchen | Unten im Bergwerk. Sie wollen Licht und einen Vertrag. Ich will nur meine Kisten loswerden. | Hinweis R10 |

Zurufe im Zauberwald (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_WALD\_PIX\_0710 | Pixel | Die Pilze leuchten, die Rosen schmollen, und der ganze Wald hat Stimmung. // Nur du nicht. Du stehst da wie ein Baum, der auf den Herbst wartet. | Zuruf |
| W1\_WALD\_PIX\_0720 | Pixel | Irgendetwas beobachtet uns aus dem Gebüsch. // Ich bin es nicht, falls du fragst. Ich beobachte dich von hier aus, und das ist etwas völlig anderes. | Zuruf |

## 10. Luftschloss: Prinzessin Zeldina

Rätsel 9 und Max' Entwicklungsmoment dieser Welt. Oben stehen die Maklerin mit Klemmbrett und Zeldina mit Umzugskarton. Die Kritzelei neben dem Torbogen ist eine Nahansicht und liefert den letzten Passwort-Teil.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_LUFT\_MAX\_0010 | Max | Ich bin oben und steh auf einer Wolke. Mein Physiklehrer würde jetzt weinen, und zwar zu Recht. | Szene, Ankunft |
| W1\_LUFT\_PIX\_0020 | Pixel | Weich, kühl, und sie trägt. Ich bleibe hier, bis mich jemand wieder hinunterträgt. // Und damit das klar ist: Mit jemand meine ich dich. | auf Max' Schulter, springt ab |
| W1\_LUFT\_MAK\_0030 | Maklerin | Besichtigung läuft! Drei Monatsmieten Provision, in Drachengold, sonst keine Schlüssel. Nächster! | ohne aufzusehen |
| W1\_LUFT\_MAX\_0040 | Max | Das Ende der Ranke. Runter geht's hoffentlich leichter als rauf. | Ansehen: Rankenende |
| W1\_LUFT\_MAX\_0045 | Max | Ich hab runtergeguckt, und das Dorf ist da unten winzig. Ich guck jetzt wieder nach oben, oben ist gesünder. | Ansehen: Rankenende, zweites Mal |
| W1\_LUFT\_MAX\_0050 | Max | Ein Torbogen in Pastell, und dahinter das Schloss. Zwei Zimmer, Wolkenblick, sehr luftig. | Ansehen: Torbogen |
| W1\_LUFT\_MAX\_0055 | Max | In den Bogen sind Wolken geschnitzt, und zwar aus Wolke. Das ist für einen Torbogen ganz schön viel Nachdenken. | Ansehen: Torbogen, zweites Mal |
| W1\_LUFT\_MAX\_0060 | Max | Kinderschrift mit Kreide: „…-Bärchen war hier.“ Der Anfang ist weggewischt. | Ansehen: Kritzelei, öffnet die Nahansicht; Notizbuch trägt „…-Bärchen“ ein |
| W1\_LUFT\_MAX\_0065 | Max | Daneben ein kleines Kreideherz und ein Strichmännchen ohne Nase. Das ist Kunst, und zwar mit Hintergedanken. | Ansehen: Kritzelei, öffnet die Nahansicht, zweites Mal; Notizbuch trägt „…-Bärchen“ ein |
| W1\_LUFT\_PIX\_0070 | Pixel | Bärchen. Jemand wurde hier Bärchen genannt und hat es überlebt. // Knapp, sehr knapp. Mich hat einmal jemand „Mausi“ genannt, und ich habe drei Tage nicht gegessen. | Nahansicht Kritzelei, Pixel |
| W1\_LUFT\_PIX\_0080 | Pixel | Alte Kreide, und Tränen. Jemand hat beim Schreiben geweint. // Bei so einem Namen hätte ich das an seiner Stelle auch getan, und zwar öffentlich. | Pixel schnuppert: Kritzelei, zweites Mal |
| W1\_LUFT\_MAX\_0090 | Max | Ein Balkon mit Aussicht auf alles. Das Geländer hat bestimmt noch nie einen Prüfer von innen gesehen. | Ansehen: Balkon |
| W1\_LUFT\_MAX\_0095 | Max | Ich lehn mich nicht ans Geländer. Ich hab gesehen, wie es wackelt, wenn bloß eine Wolke vorbeizieht. | Ansehen: Balkon, zweites Mal |
| W1\_LUFT\_SPI\_0100 | Spiegel | Spiegel, Spiegel … ach, du bist's. Sehr schöne Haare. Sehr lebendig. Sehr mutig. | Ansehen oder Benutzen: Spiegel |
| W1\_LUFT\_MAX\_0110 | Max | Endlich mal jemand, der mich versteht. | nach 0100 |
| W1\_LUFT\_SPI\_0120 | Spiegel | Ein prachtvoller Kater! Die Statur eines Löwen! Das Ohr: ein Charakterzug! | Pixel benutzt Spiegel |
| W1\_LUFT\_PIX\_0130 | Pixel | Endlich jemand mit Augen im Kopf. Wir nehmen ihn mit, junger Mann. // Nein? Dann komme ich eben jeden Tag hierher. Ich habe nichts gegen lange Wege, solange man mich trägt. | nach 0120 |
| W1\_LUFT\_MAX\_0140 | Max | Wolken, auf denen man laufen kann. Ich frag lieber nicht nach, wie das funktioniert. | Ansehen: Wolken |
| W1\_LUFT\_MAX\_0145 | Max | Ich bin auf eine draufgetreten, und sie hat leise gequietscht. Wie ein Sofakissen mit Höhenangst. | Ansehen: Wolken, zweites Mal |
| W1\_LUFT\_MAX\_0150 | Max | Die Maklerin. Dutt, Klemmbrett und ein Lächeln, unter dem noch Kleingedrucktes steht. | Ansehen: Maklerin |
| W1\_LUFT\_MAX\_0155 | Max | Sie lächelt, wenn sie „Wolkenblick“ sagt. Wenn sie „Kaution“ sagt, lächelt sie noch mehr. | Ansehen: Maklerin, zweites Mal |
| W1\_LUFT\_MAX\_0160 | Max | Kurze Haare, die Krone mit einer Schnur festgebunden, ein Umzugskarton unterm Arm. Entführt sieht ehrlich gesagt anders aus. | Ansehen: Zeldina |
| W1\_LUFT\_MAX\_0165 | Max | Sie trägt das Schwert über dem Karton. Das ist keine Prinzessin, die gerettet werden will, das ist eine, die umzieht. | Ansehen: Zeldina, zweites Mal |
| W1\_LUFT\_PIX\_0170 | Pixel | Karton, Kronenpolitur und Entschlossenheit. Diese Frau riecht nach einem Plan. // Das ist selten. Die meisten Menschen riechen nach Mittagessen, und das meine ich nicht als Kritik. | Ansehen: Zeldina, Pixel |
| W1\_LUFT\_PIX\_0175 | Pixel | Sie hat mich gestreichelt, ohne hinzusehen, aber mit großem Respekt. // Und mit einer Hand, die sonst Kronen hält. Dafür vergebe ich ihr sogar die zugeklebten Kartons. | Ansehen: Zeldina, Pixel, zweites Mal |
| W1\_LUFT\_MAK\_0180 | Maklerin | Ein Haustier. Zuschlag. Pro Haar. | Pixel auf Maklerin |
| W1\_LUFT\_ZEL\_0190 | Zeldina | Ein Kater! Komm her. Nein? Gut. Katzen, die nicht kommen, sind die ehrlichen. | Pixel auf Zeldina |

Gespräch mit Zeldina, vor dem Team:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_LUFT\_MAX\_0210 | Max | Du bist die Prinzessin? | Option Zeldina |
| W1\_LUFT\_ZEL\_0220 | Zeldina | Zeldina. Ohne Prinzessin, bitte. Ich suche eine Wohnung, keinen Retter. | stellt den Karton ab |
| W1\_LUFT\_MAX\_0830 | Max | Und der Drache? Der Turm? Das ganze Entführungsding? |  |
| W1\_LUFT\_ZEL\_0840 | Zeldina | Der Drache war der Vermieter. Der Turm war zu teuer. Und entführt hat mich nur die Nebenkostenabrechnung. |  |
| W1\_LUFT\_MAX\_0230 | Max | Toadi sucht dich überall. | Option Zeldina |
| W1\_LUFT\_ZEL\_0240 | Zeldina | Toadi sucht mich seit drei Jahren. Er ist sehr gut im Suchen und sehr schlecht im Finden. Ich hab ihm dreimal die Adresse geschickt. |  |
| W1\_LUFT\_MAX\_0850 | Max | Und er hat sie nie gelesen? |  |
| W1\_LUFT\_ZEL\_0860 | Zeldina | Er hat sie gelesen. Dann ist er in ein Rohr gesprungen, um schneller da zu sein. Rohre führen nie dahin, wo man hinwill. |  |
| W1\_LUFT\_MAX\_0250 | Max | Wurdest du jetzt entführt oder nicht? | Option Zeldina |
| W1\_LUFT\_ZEL\_0260 | Zeldina | Umzugsfirmen kosten. Dunkle Lords tragen Kisten umsonst. // Man lässt sich entführen, wartet die Rettung ab, und schon wohnt man woanders. Kostenlos. |  |
| W1\_LUFT\_PIX\_0270 | Pixel | Das ist die klügste Person dieser Welt. // Ich sage so etwas ungern über Menschen, und noch weniger gern laut. | nach 0260 |
| W1\_LUFT\_MAX\_0280 | Max | Was ist mit der Maklerin? | Option Zeldina |
| W1\_LUFT\_ZEL\_0290 | Zeldina | Will Provision in Drachengold. Ich hab Kronen, keine Drachen. Und sie lässt nicht mit sich reden. Glaub mir, ich bin bei sechs Monatsmieten. |  |
| W1\_LUFT\_PIX\_0300 | Pixel | Das geht uns nichts an. Wir wollen ein Ei, und zwar nur ein Ei. // Die Wohnungssuche fremder Leute ist das Langweiligste, was ich kenne, und ich kenne Regen. | nach 0290 |
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
| W1\_LUFT\_PIX\_0590 | Pixel | Ich habe mich wieder gefasst. Das war ein Schock, ein echter Schock. // Ich brauche Thunfisch, und zwar sofort. Ausschließlich zur Stabilisierung meines Kreislaufs. | erste Zeile nach der Sprachlosigkeit |
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
| W1\_LUFT\_MAX\_0870 | Max | Vier Teile? Wie lang ist das denn? |  |
| W1\_LUFT\_ZEL\_0880 | Zeldina | Lang genug, dass seine Mutter mittendrin Luft holen musste. Vor der ganzen Schulklasse. |  |
| W1\_LUFT\_MAX\_0730 | Max | Was willst du mit dem Turm? | Option Zeldina; nach R9 |
| W1\_LUFT\_ZEL\_0740 | Zeldina | Wohnen. Einziehen. Nie wieder umziehen. Vielleicht einen Kronleuchter. Ich träume groß, aber mit Festpreis. | Hinweis R12 |
| W1\_LUFT\_MAX\_0741 | Max | Und wenn Moderwort nicht auszieht? |  |
| W1\_LUFT\_ZEL\_0742 | Zeldina | Dann wohnen wir eben zusammen. Er niest, ich räume auf. Ich hatte schon schlimmere Mitbewohner. |  |
| W1\_LUFT\_MAX\_0750 | Max | Kennst du die Goblins? | Option Zeldina; nach R9, vor R10 |
| W1\_LUFT\_ZEL\_0760 | Zeldina | Grimmzahn? Streikt seit Jahren. Will eigentlich nur einen Posten mit Schlüsselbund. Ein Turm bräuchte einen Hausmeister. Nur so ein Gedanke. | Hinweis R10, Weg B |
| W1\_LUFT\_MAX\_0890 | Max | Du meinst, ich soll ihm einen Job anbieten? |  |
| W1\_LUFT\_ZEL\_0900 | Zeldina | Ich meine gar nichts. Ich mache nur Andeutungen. Das ist billiger als Meinungen. |  |
| W1\_LUFT\_MAX\_0770 | Max | Gehen wir. | Option Zeldina, beendet das Gespräch |
| W1\_LUFT\_ZEL\_0780 | Zeldina | Du vorne. Ich trage. |  |

Zurufe im Luftschloss (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_LUFT\_PIX\_0810 | Pixel | Wir stehen auf einer Wolke. Ich habe aufgehört, Fragen zu stellen, // und ich empfehle dir dasselbe. Fragen machen schwer, und auf Wolken ist das gefährlich. | Zuruf |
| W1\_LUFT\_PIX\_0820 | Pixel | Die Maklerin hat dich zweimal von oben bis unten taxiert. // Für sie bist du ein Objekt mit Sanierungsbedarf. Ich widerspreche ihr ungern. | Zuruf; vor R9 |

## 11. Goblin-Bergwerk: Die Goblin-Frage

Rätsel 10 mit zwei Lösungswegen. Weg A: Leuchttrank als Fackel, Tarifvertrag mit Ketchup unterschrieben. Weg B: Hausmeisterposten für Grimmzahn, Zeldina bürgt. Beide Wege enden mit dem Arbeitslied (dritter Passwort-Teil) und der offenen Rune-Tür.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BERG\_GRI\_0010 | Grimmzahn | STREIK! Keiner kommt durch! Nicht mal du, Langer! | Szene, erstes Betreten |
| W1\_BERG\_MAX\_0020 | Max | Sieht aus wie Montagmorgen, nur grüner. | Ansehen: Streikposten |
| W1\_BERG\_MAX\_0025 | Max | Einer hat ein Schild „Wir sind Goblins, keine Maschinen“. Darunter: „Okay, Maschinen auch nicht.“ | Ansehen: Streikposten, zweites Mal |
| W1\_BERG\_MAX\_0030 | Max | Streikschilder ohne Text. Die Forderung ist so klar, dass sie keiner aufschreiben musste. | Ansehen: Streikschilder |
| W1\_BERG\_MAX\_0035 | Max | Auf der Rückseite von einem Schild steht eine Einkaufsliste: Pilze, Kaffee, Würde. | Ansehen: Streikschilder, zweites Mal |
| W1\_BERG\_MAX\_0040 | Max | Loren auf Schienen, und die Schienen enden direkt im Streikposten. Sehr konsequent, muss man sagen. | Ansehen: Loren |
| W1\_BERG\_MAX\_0045 | Max | In einer Lore schläft eine Fledermaus. Ich glaube, die streikt auch, aus Solidarität. | Ansehen: Loren, zweites Mal |
| W1\_BERG\_MAX\_0050 | Max | Sogar die Kaffeemaschine streikt. Die meint das wahrscheinlich ernster als alle anderen hier. | Ansehen: Kaffeemaschine |
| W1\_BERG\_MAX\_0055 | Max | Ein Zettel klebt dran: „Kaffee nur für Gewerkschaftsmitglieder.“ Darunter: „Und auch nicht.“ | Ansehen: Kaffeemaschine, zweites Mal |
| W1\_BERG\_PIX\_0060 | Pixel | Kaffee von vorgestern. Das ist kein Streik mehr, junger Mann, das ist Resignation mit Filter. // Ich erkenne sie am Geruch. Dein Großvater kocht seinen Kaffee genauso, wenn er nicht weiterweiß. | Ansehen: Kaffeemaschine, Pixel |
| W1\_BERG\_PIX\_0065 | Pixel | Ich habe den Kaffee noch einmal gerochen, und er hat zurückgerochen. // Wir respektieren uns nicht, der Kaffee und ich, und wir werden es auch nie tun. | Ansehen: Kaffeemaschine, Pixel, zweites Mal |
| W1\_BERG\_MAX\_0070 | Max | Fackeln, die so schwach leuchten, dass sie praktisch im Nachtmodus sind. | Ansehen: Fackeln |
| W1\_BERG\_MAX\_0075 | Max | Eine Fackel geht aus, als ich hingucke. Ich hab sie nicht angefasst, das schwör ich beim Streik. | Ansehen: Fackeln, zweites Mal |
| W1\_BERG\_MAX\_0080 | Max | Eine Steinwand mit einer Rune drauf. Das sieht nach einer Tür aus, aber auch sehr nach „noch nicht“. | Ansehen: Rune-Tür; vor R10 |
| W1\_BERG\_MAX\_0085 | Max | Ich hab gegen die Rune geklopft. Es klingt hohl und irgendwie ein bisschen beleidigt. | Ansehen: Rune-Tür, zweites Mal; vor R10 |
| W1\_BERG\_MAX\_0090 | Max | Die Rune leuchtet. Das ist der Kellereingang zum Turm, also geht's nach oben erst mal nach unten. | Ansehen: Rune-Tür; nach R10 |
| W1\_BERG\_MAX\_0095 | Max | Die Rune pulsiert, als hätte sie Herzklopfen. Ich glaube, sie freut sich auf Besuch. | Ansehen: Rune-Tür, zweites Mal; nach R10 |
| W1\_BERG\_MAX\_0100 | Max | Der Gewerkschaftsboss. Gelber Helm, Trillerpfeife, Unterbiss. Der verhandelt um jeden Stein. | Ansehen: Grimmzahn |
| W1\_BERG\_MAX\_0105 | Max | Er pfeift, wenn er nachdenkt, und er denkt ziemlich oft nach. Seine Gewerkschaft hat bestimmt Kopfschmerzen. | Ansehen: Grimmzahn, zweites Mal |
| W1\_BERG\_MAX\_0110 | Max | Ein dünner Goblin mit Spitzhacke und Stirnlampe. Die Lampe ist aus, und das ist der ganze Streik. | Ansehen: Goblin-Arbeiter 1 |
| W1\_BERG\_MAX\_0115 | Max | Er poliert während des Streiks seine Spitzhacke, für den Tag danach. Der Mann ist ein Optimist. | Ansehen: Goblin-Arbeiter 1, zweites Mal |
| W1\_BERG\_MAX\_0120 | Max | Ein runder Goblin mit Becher, der im Stehen schläft. Respekt, das schaff ich nur im Liegen. | Ansehen: Goblin-Arbeiter 2 |
| W1\_BERG\_MAX\_0125 | Max | Er hat im Schlaf „mehr Urlaub“ gemurmelt. Manche Träume muss man einfach laut sagen. | Ansehen: Goblin-Arbeiter 2, zweites Mal |
| W1\_BERG\_PIX\_0130 | Pixel | Schlaf, Kaffee und Schweinsleder. Dieser Goblin hat sein Leben im Griff. // Er hat begriffen, worauf es ankommt, und das ist mehr, als ich von den meisten Menschen sagen kann. | Ansehen: Goblin 2, Pixel |
| W1\_BERG\_PIX\_0135 | Pixel | Er hat sich im Schlaf umgedreht und einfach weitergeschlafen, ganz ohne Kissen. // Das ist wahre Größe. Ich bin beeindruckt, und ich bin selten beeindruckt. | Ansehen: Goblin 2, Pixel, zweites Mal |
| W1\_BERG\_MAX\_0140 | Max | Ich puste nicht in fremde Fackeln. Die haben's schon schwer genug. | Benutzen: Fackeln |
| W1\_BERG\_MAX\_0150 | Max | Sie zischt mich an. Ich glaube, das ist Solidarität. | Benutzen: Kaffeemaschine |
| W1\_BERG\_MAX\_0160 | Max | Eine Lorenfahrt? Bis zum Streikposten sind es zehn Meter, die geh ich lieber zu Fuß. | Benutzen: Lore |
| W1\_BERG\_MAX\_0170 | Max | Zu. Eine Rune ist halt kein Klingelknopf. | Benutzen: Rune-Tür; vor R10 |
| W1\_BERG\_GRI\_0180 | Grimmzahn | Eine Katze. Gewerkschaft der Katzen? Gibt's nicht? Und das lasst ihr euch gefallen? | Pixel auf Grimmzahn |
| W1\_BERG\_GO2\_0190 | Goblin 2 | Mmh. Weich. Darf ich … nein? Okay. | Pixel auf Goblin 2 |
| W1\_BERG\_GO1\_0200 | Goblin 1 | Haare. Ich hab Spitzhacke, keine Bürste. Weg. | Pixel auf Goblin 1 |

Gespräch mit Grimmzahn:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_BERG\_MAX\_0310 | Max | Warum streikt ihr? | Option Grimmzahn |
| W1\_BERG\_GRI\_0320 | Grimmzahn | Bessere Fackeln! Unsere leuchten wie nasse Kerzen! Weißt du, wie oft ich im Dunkeln den Daumen getroffen habe? // Ich habe keinen mehr! | hält die Hand hoch |
| W1\_BERG\_MAX\_0321 | Max | Und warum besorgt ihr euch keine besseren? |  |
| W1\_BERG\_GRI\_0322 | Grimmzahn | Der Herr vom Turm liefert keine. Er sagt, Dunkelheit gehört zum Konzept. Er selbst wohnt ganz oben, wo die Sonne scheint. | spuckt aus |
| W1\_BERG\_MAX\_0330 | Max | Was wollt ihr genau? | Option Grimmzahn (bleibt) |
| W1\_BERG\_GRI\_0340 | Grimmzahn | Licht. Und einen Tarifvertrag. Schriftlich. Unterschrieben mit Blut. Wir sind traditionell. | Hinweis R10 A |
| W1\_BERG\_MAX\_0350 | Max | Blut. | Antwort auf 0340 |
| W1\_BERG\_GRI\_0360 | Grimmzahn | Oder etwas, das so aussieht. Wir sind traditionell, nicht genau. |  |
| W1\_BERG\_MAX\_0370 | Max | Wie komm ich durch? | Option Grimmzahn |
| W1\_BERG\_GRI\_0380 | Grimmzahn | Gar nicht. Oder du gibst uns Licht und unterschreibst. Oder du machst mir ein besseres Angebot. Ich bin Gewerkschafter, keine Mauer. |  |
| W1\_BERG\_MAX\_0830 | Max | Was für ein Angebot? |  |
| W1\_BERG\_GRI\_0840 | Grimmzahn | Eins mit Zukunft. Und mit Schlüsseln. Ein Goblin ohne Schlüssel ist nur ein grüner Mann im Dunkeln. |  |
| W1\_BERG\_MAX\_0390 | Max | Wie wär's mit einem Posten als Hausmeister im Dunklen Turm? | Option Grimmzahn; nur mit Zeldina im Team; Weg B |
| W1\_BERG\_GRI\_0400 | Grimmzahn | Hausmeister? Mit Schlüsselbund? Eigenem Keller? … Wer bürgt? | misstrauisch |
| W1\_BERG\_ZEL\_0410 | Zeldina | Ich. Der Turm wird demnächst neu vergeben. Ich hätte gern jemanden, der sich über alles beschwert. Das hält die Mieter wach. |  |
| W1\_BERG\_GRI\_0420 | Grimmzahn | Angenommen! Streik ausgesetzt! Für mich. Die anderen streiken weiter, aber leiser. | Weg B gewählt; weiter mit 0610 |
| W1\_BERG\_MAX\_0430 | Max | Bis dann. | Option Grimmzahn, beendet das Gespräch |
| W1\_BERG\_GRI\_0440 | Grimmzahn | Geh. Der Streik bleibt. Der Streik bleibt immer. Außer, jemand bringt Licht. |  |

Weg A: Leuchttrank und Ketchup. Fehlversuche inklusive.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BERG\_MAX\_0510 | Max | Hier. Ein Trank, der leuchtet. Damit könnt ihr eure Fackeln füllen. | Leuchttrank auf Grimmzahn oder Fackeln |
| W1\_BERG\_GRI\_0520 | Grimmzahn | Das … das ist Licht. Richtiges Licht. Ich sehe meinen Daumen. Ich habe doch noch einen! | Fackeln leuchten gelb |
| W1\_BERG\_GO1\_0530 | Goblin 1 | Hell! |  |
| W1\_BERG\_GO2\_0540 | Goblin 2 | Zu hell. | kneift die Augen zu |
| W1\_BERG\_GRI\_0550 | Grimmzahn | Jetzt der Vertrag. Blut. Hier unten, neben dem Kreuz. | hält den Tarifvertrag hin |
| W1\_BERG\_GRI\_0560 | Grimmzahn | Erst Licht, dann Blut. Wir sind traditionell. | Ketchup auf Grimmzahn vor dem Leuchttrank |
| W1\_BERG\_MAX\_0570 | Max | Unterschrift. In Rot, schön dickflüssig. Solange keiner dran riecht, passt das. | Ketchup auf Tarifvertrag |
| W1\_BERG\_GRI\_0580 | Grimmzahn | Riecht nach … Sieg. Angenommen! | schnuppert, unterschreibt selbst mit dem Daumen, den er nicht hat |
| W1\_BERG\_PIX\_0590 | Pixel | Er hat Ketchup als Blut akzeptiert. // Ich habe gerade mehr Respekt vor Goblins verloren, als ich jemals hatte, und das ist eine beachtliche Leistung. | Weg A gewählt; weiter mit 0610 |
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
| W1\_BERG\_PIX\_0660 | Pixel | Mo-Knuddel. Knuddel-Puddi. Das Puzzle setzt sich zusammen, // und es ist noch peinlicher, als ich zu hoffen gewagt hatte. | wenn das Zeugnis schon im Notizbuch steht |
| W1\_BERG\_MAX\_0670 | Max | Das ist kein Passwort mehr. Das ist eine ganze Kindheit. |  |
| W1\_BERG\_GRI\_0680 | Grimmzahn | Die Rune-Tür. Führt in den Keller des Turms. Wir haben sie nie benutzt. Zu dunkel. | Rune leuchtet auf, Tür öffnet sich |
| W1\_BERG\_MAX\_0690 | Max | Jetzt nicht mehr. | R10 gelöst |
| W1\_BERG\_ZEL\_0700 | Zeldina | Ein Keller. Trocken? Dann nehme ich ihn. | wenn Zeldina im Team |
| W1\_BERG\_MAX\_0710 | Max | Ein Tarifvertrag mit Ketchup-Unterschrift. Rechtlich ist das wackelig, aber geschmacklich okay. | Ansehen: Tarifvertrag, unterschrieben; Weg A |
| W1\_BERG\_MAX\_0715 | Max | Unten mit Ketchup unterschrieben, oben mit dem Daumen gestempelt. Vor einem Goblin-Gericht hält das bestimmt. | Ansehen: Tarifvertrag, unterschrieben, zweites Mal; Weg A |

Zurufe im Bergwerk (Pixel):

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_BERG\_PIX\_0810 | Pixel | Zwei Goblins, ein Boss und null Licht. // Das ist weniger ein Streik als ein Keller mit Meinung, und Keller mit Meinung kenne ich. Ich habe in einem gewohnt. | Zuruf |
| W1\_BERG\_PIX\_0820 | Pixel | Der runde Goblin hat seit fünf Minuten nicht geblinzelt. // Entweder schläft er mit offenen Augen, oder er ist eine Fackel. Bei diesem Licht kann ich das nicht unterscheiden. | Zuruf |

## 12. Dunkler Turm, Keller und Abstellkammer 1: Die Besen

Rätsel 11, Teil 2. Drei verzauberte Besen fegen feste Routen (gerade, Zickzack, Schleife). Max beobachtet, dann wechselt der Spieler zu Pixel und klickt die drei Kreuzungen im Fliesenmuster an; die Besen jagen den Haaren in Abstellkammer 1, die erste von Smaugis sechs Kammern, Max schließt die Tür. Danach ist Abstellkammer 1 betretbar (Ansehen-Raum ohne Rätsel, Zeilen 0300 bis 0330): Die Besen fegen dort zufrieden und arbeiten sich Kammer für Kammer nach oben.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_TURM\_MAX\_0010 | Max | Der Keller vom Dunklen Turm, violett und feucht, und drei Besen fegen hier in Mustern rum. Ein Bildschirmschoner mit Aggressionen. | Szene, Ankunft |
| W1\_TURM\_PIX\_0020 | Pixel | Besen. Drei Stück, und alle verzaubert. Ich kenne diesen Blick. // Der Besen in der Schule hatte ihn auch, kurz bevor er mich durch das halbe Klassenzimmer gejagt hat. |  |
| W1\_TURM\_ZEL\_0030 | Zeldina | Ein Hausmeister hätte hier nicht geschadet. | wenn Zeldina folgt |
| W1\_TURM\_GRI\_0040 | Grimmzahn | Ich fange an, wenn die Besen weg sind. Steht im Vertrag. Den ich mir gerade ausdenke. | nur Weg B; Grimmzahn folgt |
| W1\_TURM\_MAX\_0050 | Max | Eine gerade Linie aus roten Fliesen, und ein Besen fegt sie rauf und runter, immer gleich. Das kommt mir ziemlich bekannt vor. | Ansehen: gerade Route |
| W1\_TURM\_MAX\_0055 | Max | Der Besen auf der geraden Strecke pfeift dabei. Er hat einen Ohrwurm, und ich ahne, welchen. | Ansehen: gerade Route, zweites Mal |
| W1\_TURM\_MAX\_0060 | Max | Zickzack-Fliesen. Der Besen hält sich so genau dran, als gäbe es Punkte dafür. | Ansehen: Zickzack-Route |
| W1\_TURM\_MAX\_0065 | Max | Zick, zack, zick. Wenn dieser Besen einmal geradeaus fegen müsste, würde er wahrscheinlich umfallen. | Ansehen: Zickzack-Route, zweites Mal |
| W1\_TURM\_MAX\_0070 | Max | Eine Schleife aus Fliesen, und der dritte Besen dreht darauf seine Runden. Autoplay für Besen. | Ansehen: Schleifen-Route |
| W1\_TURM\_MAX\_0075 | Max | Er dreht und dreht. Ich krieg vom Zugucken einen Drehwurm, und er sieht dabei total entspannt aus. | Ansehen: Schleifen-Route, zweites Mal |
| W1\_TURM\_MAX\_0080 | Max | Hier kreuzen sich zwei Wege. Ein guter Platz, um etwas fallen zu lassen. Etwas Haariges. | Ansehen: Kreuzung (jede der drei) |
| W1\_TURM\_MAX\_0085 | Max | Auf der Kreuzung ist ein Fleck, da ist schon mal was runtergefallen. Etwas Klebriges. Ich tippe auf Zufall. | Ansehen: Kreuzung (jede der drei), zweites Mal |
| W1\_TURM\_MAX\_0090 | Max | Ein Besen mit Gesicht, und zwar einem wütenden. Er fegt alles, was sich bewegt, also beweg ich mich lieber nicht. | Ansehen: Besen |
| W1\_TURM\_MAX\_0095 | Max | Die Besen sind verzaubert. Ich bräuchte jetzt einen alten Meister mit Hut, der „Halt“ ruft, aber so einer kommt nur in Filmen. | Ansehen: Besen, zweites Mal |
| W1\_TURM\_PIX\_0100 | Pixel | Er sieht mich an. Genauer gesagt sieht er mein Fell an. // Ich fühle mich gleichzeitig wie Beute und wie Werkzeug, und keins von beidem steht mir. | Ansehen: Besen, Pixel |
| W1\_TURM\_PIX\_0105 | Pixel | Er hat schon wieder mein Fell angesehen. Wenn er mich erwischt, bin ich danach sehr glatt. // Und sehr wütend. Ich weiß nicht, welches von beiden ihm mehr Sorgen machen sollte. | Ansehen: Besen, Pixel, zweites Mal |
| W1\_TURM\_MAX\_0110 | Max | Eine Wendeltreppe nach oben. Die Besen lassen keinen durch, nicht mal Zeldina mit ihrem Karton. | Ansehen: Treppe nach oben; vor Lösung |
| W1\_TURM\_MAX\_0115 | Max | Auf der dritten Stufe sitzt ein Besen und guckt runter. Er hält Wache, mit Borsten. | Ansehen: Treppe nach oben, zweites Mal; vor Lösung |
| W1\_TURM\_MAX\_0120 | Max | Eine Tür, einen Spalt offen. Eine Abstellkammer, also genau da, wo Gerümpel hingehört. Oder Besen. | Ansehen: Kammertür |
| W1\_TURM\_MAX\_0125 | Max | Durch den Spalt seh ich Staub, sehr viel Staub. Die Kammer ist eine einzige Einladung für alles, was fegt. | Ansehen: Kammertür, zweites Mal |
| W1\_TURM\_MAX\_0130 | Max | Die Treppe zurück ins Bergwerk. Da unten singen sie immer noch. | Ansehen: Kellertreppe |
| W1\_TURM\_MAX\_0135 | Max | Von unten hört man ein leises, aber eindeutiges „Hei-ho“. Die singen jetzt bezahlt. | Ansehen: Kellertreppe, zweites Mal |
| W1\_TURM\_MAX\_0140 | Max | Ich hab keine Haare zum Verlieren. Also schon, aber nicht so viele, und nicht so freiwillig. | Max benutzt Kreuzung |
| W1\_TURM\_PIX\_0150 | Pixel | Wechsel zu mir. Ich habe Haare, ich habe Würde, // und für diese Aufgabe opfere ich genau eines von beiden. Rate, welches. Kleiner Hinweis: Es ist nicht die Würde. | nach 0140; Hinweis |
| W1\_TURM\_NAR\_0160 | – | Ein Besen erwischt Max und fegt ihn in einem Schwung zurück zur Treppe. | Besen trifft Max |
| W1\_TURM\_PIX\_0170 | Pixel | Du wurdest gefegt, junger Mann. Wie Staub. // Ich habe nichts dagegen unternommen, weil es sehr lehrreich war. Für mich. | nach 0160, erstes Mal |
| W1\_TURM\_PIX\_0180 | Pixel | Schon wieder. Du bist der am häufigsten gefegte Mensch dieser Welt. // Das ist ein Titel. Kein schöner, aber immerhin einer. | nach 0160, ab dem zweiten Mal |
| W1\_TURM\_PIX\_0190 | Pixel | Hier? Hier fegt keiner. Haare auf dem falschen Boden sind bloß Haare, // und davon habe ich zu Hause auf dem Sofa schon genug verteilt. | Pixel benutzt Boden außerhalb der Kreuzungen |
| W1\_TURM\_PIX\_0200 | Pixel | Schüttel. // Das war ein Pfund Fell. Ich fühle mich nackt und gleichzeitig sehr produktiv. | Pixel benutzt erste Kreuzung; Haare-Animation; Besen jagt der Spur hinterher |
| W1\_TURM\_PIX\_0210 | Pixel | Noch einmal. Mein Winterfell geht für diese Aufgabe komplett drauf, // und ich hatte für den Winter große Pläne mit ihm. Hauptsächlich auf der Heizung. | zweite Kreuzung |
| W1\_TURM\_PIX\_0220 | Pixel | Die letzte Spur. Wenn dein Großvater fragt, warum ich kahl bin, // dann sagst du ihm: Weltrettung. Und dass er mir dafür einen Lachs schuldet. | dritte Kreuzung; alle Besen rasen in die Kammer |
| W1\_TURM\_PIX\_0230 | Pixel | Pfoten und Türen. Das Thema hatten wir schon, und es ist nicht besser geworden. | Pixel benutzt Kammertür |
| W1\_TURM\_MAX\_0240 | Max | Tür zu. Drei Besen in einer Kammer voller Staub, die kommen da so schnell nicht wieder raus. Wollen sie auch gar nicht. | Max benutzt Kammertür, Besen drin; R11 Teil 2 gelöst |
| W1\_TURM\_PIX\_0250 | Pixel | Ich höre sie fegen, und sie fegen glücklich. // Es ist das Einzige, was sie können, und sie dürfen es den ganzen Tag tun. Ich beneide sie ein wenig. |  |
| W1\_TURM\_ZEL\_0260 | Zeldina | Treppe frei. Ich geh vor, ich hab den Karton. | wenn Zeldina folgt |
| W1\_TURM\_MAX\_0270 | Max | Die Tür ist noch offen. Erst müssen alle drei drin sein, sonst kommt einer zurück und fegt mich. | Max benutzt Kammertür, bevor alle Besen drin sind |
| W1\_TURM\_PIX\_0280 | Pixel | Die Besen fegen, und du schaust zu. Einer von uns muss sich jetzt bewegen, // und ich lehne das hiermit förmlich ab. | Zuruf |
| W1\_TURM\_PIX\_0290 | Pixel | Drei Muster, drei Besen, drei Kreuzungen. Ich erkenne da ein Muster, // und ich hasse Muster. Muster bedeuten Arbeit, und Arbeit bedeutet, dass jemand mich weckt. | Zuruf |
| W1\_TURM\_MAX\_0300 | Max | Abstellkammer 1. Auf dem Schild steht: „Eigentum Smaugi, Kammer 1 von 6.“ Sechs Kammern, nur für Kram. Respekt. | Betreten: Abstellkammer 1 über die Kammertür im Keller; nach R11 Teil 2 |
| W1\_TURM\_MAX\_0310 | Max | Die Besen fegen Smaugis Kram zu Stapeln und ignorieren mich komplett. Ich bin also kein Kram. Glaub ich. | Ansehen: Besen in Abstellkammer 1 |
| W1\_TURM\_MAX\_0315 | Max | Ein Besen hat sich einen Lappen um den Stiel gewickelt, wie einen Schal. Der macht hier Karriere. | Ansehen: Besen in Abstellkammer 1, zweites Mal |
| W1\_TURM\_PIX\_0320 | Pixel | Sie fegen sich nach oben, Kammer für Kammer. Vollbeschäftigung. // Die Goblins wären neidisch, wenn sie davon wüssten, und ich werde es ihnen nicht erzählen. | Ansehen: Besen in Abstellkammer 1, Pixel |
| W1\_TURM\_PIX\_0325 | Pixel | Wenn die Besen fertig sind, möchte ich einen davon als Kratzbaum haben. // Den mit dem Schal. Er hat Stil, und ich kratze nur an Dingen mit Stil. | Ansehen: Besen in Abstellkammer 1, Pixel, zweites Mal |
| W1\_TURM\_MAX\_0330 | Max | Eimer, Fahnen, Lappen. Das ist Smaugis Einsteigerkram, der richtige Kram wartet bestimmt weiter oben. | Ansehen: Kram in Abstellkammer 1; Ausgang nur zurück in den Keller |
| W1\_TURM\_MAX\_0335 | Max | Eine Fahne hat ein Drachenwappen, das ziemlich schief gestickt ist. Das hat Smaugi selbst gemacht, man sieht die Mühe. | Ansehen: Kram in Abstellkammer 1, zweites Mal; Ausgang nur zurück in den Keller |

## 13. Smaugis Abstellkammern: Aufräumen und die Geheimtür

Rätsel 12 und Rätsel 11, Teil 1, in der obersten Kammer (Ebene 6). Smaugi sitzt auf seinem Kram, die Besen fegen die Haufen zu Stapeln; nach Rätsel 12 ist aufgeräumt. Humbert, Grimmzahn und Zeldina sind schon da. Die kichernde Geheimtür steht am Fuß der Treppe zum Thronsaal; hindurch geht Max erst nach Rätsel 12.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_SMAU\_SMA\_0010 | Smaugi | Nicht anfassen! Das … das ist alles noch gut. | Szene, Ankunft; Staubwedel erhoben |
| W1\_SMAU\_MAX\_0020 | Max | Ein Drache mit Kopftuch, der auf einem Haufen Gerümpel sitzt. Das hab ich mir irgendwie anders vorgestellt. |  |
| W1\_SMAU\_SMA\_0030 | Smaugi | Seit die Besen da sind, finde ich alles. Das ist noch schlimmer. | seufzt, Rauchwölkchen |
| W1\_SMAU\_HUM\_0040 | Humbert | Fondue-Lieferung für eine Einweihung! Wer hat bestellt? | kommt die Treppe hoch, Topf in den Armen |
| W1\_SMAU\_ZEL\_0050 | Zeldina | Ich. Vorsichtshalber. |  |
| W1\_SMAU\_GRI\_0060 | Grimmzahn | Ich besichtige meinen Arbeitsplatz. Es ist eine Katastrophe. Ich liebe sie. | Weg B |
| W1\_SMAU\_GRI\_0070 | Grimmzahn | Keiner hat mich gefragt! Ich beschwere mich trotzdem. Formal. Schriftlich. Mit Ketchup. | Weg A |
| W1\_SMAU\_MAX\_0080 | Max | Größer als Ostern. Kleiner als mein Problem. | Ansehen: Drachenei im Nest |
| W1\_SMAU\_MAX\_0085 | Max | Das Ei hat ein leises Schuppenmuster, und wenn ich die Hand drüberhalte, ist es warm. Es ist wichtig, ich weiß nur noch nicht, wofür. | Ansehen: Drachenei im Nest, zweites Mal |
| W1\_SMAU\_PIX\_0090 | Pixel | Ein Drache bewacht ein Ei, als wäre es aus Bio-Freilandhaltung. Wozu? Es ist ein Ei, und es gehört in einen Topf. // Drei Minuten. Weich. Zum Frühstück. Ich habe eine Liste, und sie lügt nicht. | Ansehen: Drachenei, Pixel; Andeutung Finale |
| W1\_SMAU\_PIX\_0095 | Pixel | Ich habe darüber nachgedacht. Drei Minuten sind zu lang, zweieinhalb sind richtig. // Ich bin Feinschmecker, und Feinschmecker irren sich nur beim Essen anderer Leute. | Ansehen: Drachenei, Pixel, zweites Mal; Andeutung Finale |
| W1\_SMAU\_MAX\_0100 | Max | Gold, haufenweise. Und er sitzt darauf, als wäre es ein Sitzsack. | Ansehen: Goldhaufen |
| W1\_SMAU\_MAX\_0105 | Max | Eine Münze rollt den Haufen runter, und Smaugi zuckt. Ich wette, er zählt sie sogar im Schlaf. | Ansehen: Goldhaufen, zweites Mal |
| W1\_SMAU\_MAX\_0110 | Max | Ein schiefer Kronleuchter. Zeldina guckt ihn an wie ich ein neues Handy. | Ansehen: Kronleuchter |
| W1\_SMAU\_MAX\_0115 | Max | Eine Kerze ist schief. Zeldina hat sie schon zweimal angeguckt, ich glaube, sie plant eine Renovierung. | Ansehen: Kronleuchter, zweites Mal |
| W1\_SMAU\_MAX\_0120 | Max | Ein Bündel rostiger Schwerter ohne Namen. Für Humbert wäre das ein Tierheim voller Welpen. | Ansehen: Schwerter-Bündel |
| W1\_SMAU\_MAX\_0125 | Max | An einem Schwert hängt noch ein Preisschild: „Wie neu.“ Es ist nicht wie neu, es ist wie alt. | Ansehen: Schwerter-Bündel, zweites Mal |
| W1\_SMAU\_MAX\_0130 | Max | Alte Fackeln, ausgebrannt. Für die Goblins sind die trotzdem noch besser als ihre eigenen. | Ansehen: Fackel-Bündel |
| W1\_SMAU\_MAX\_0135 | Max | Ich hab an einer gerochen: Rauch und Ruß. Für einen Goblin ist das wahrscheinlich das Parfüm des Sieges. | Ansehen: Fackel-Bündel, zweites Mal |
| W1\_SMAU\_MAX\_0140 | Max | Wenn ich da reinblase, fängt's bestimmt an zu regnen. | Ansehen: Okarina |
| W1\_SMAU\_MAX\_0145 | Max | Sie hat sieben Löcher. Ich weiß nicht, welche Melodie man darauf spielt, aber irgendwie kenn ich sie trotzdem. | Ansehen: Okarina, zweites Mal |
| W1\_SMAU\_MAX\_0150 | Max | Töööt. Es regnet nicht, aber Smaugi hat kurz hochgeguckt. Das reicht mir als Erfolg. | Benutzen: Okarina |
| W1\_SMAU\_PIX\_0160 | Pixel | Wer das herauszieht, wird König. // Oder er bekommt Rücken, junger Mann. Nach allem, was ich über Könige weiß, ist das ungefähr dasselbe. | Ansehen: Schwert im Stein, Pixel |
| W1\_SMAU\_PIX\_0165 | Pixel | Ich habe daran gezogen, mit einer Kralle, und es hat sich nichts getan. Ich bin also kein König. // Ich bin etwas Besseres, nämlich eine Katze. Das wusste ich schon, aber es ist schön, es bestätigt zu bekommen. | Ansehen: Schwert im Stein, Pixel, zweites Mal |
| W1\_SMAU\_MAX\_0170 | Max | Steckt fest. Ich bin also kein König, aber das weiß ich eigentlich schon seit der Grundschule. | Benutzen: Schwert im Stein |
| W1\_SMAU\_MAX\_0180 | Max | Ein rostiger Helm, ein kaputter Spiegel, eine Socke und eine Teekanne. Ein Flohmarkt, auf den nie jemand gekommen ist. | Ansehen: Deko-Kram |
| W1\_SMAU\_MAX\_0185 | Max | Im kaputten Spiegel sehe ich mich siebenmal. Keiner davon hat eine Ahnung, was er hier tut. | Ansehen: Deko-Kram, zweites Mal |
| W1\_SMAU\_PIX\_0190 | Pixel | Staub, Gold und Drachenschweiß. Und irgendwo da drin eine einzelne Socke, // die nach Abenteuer riecht. Ich möchte nicht wissen, wo die andere ist. Doch, eigentlich schon. | Pixel schnuppert: Haufen |
| W1\_SMAU\_MAX\_0200 | Max | Eine Treppe zum obersten Stockwerk. Davor eine Tür, die … kichert? | Ansehen: Geheimtür |
| W1\_SMAU\_MAX\_0205 | Max | Die Tür kichert schon wieder. Wenn eine Tür über mich lacht, will ich wenigstens wissen, worüber. | Ansehen: Geheimtür, zweites Mal |
| W1\_SMAU\_MAX\_0210 | Max | Ein Drache mit Kopftuch und Staubwedel. Er sieht aus, als bräuchte er Urlaub und einen Container. | Ansehen: Smaugi |
| W1\_SMAU\_MAX\_0215 | Max | Er staubt sein Gold ab, Münze für Münze. Ein Drache mit Putzfimmel, und mit Rücken. | Ansehen: Smaugi, zweites Mal |
| W1\_SMAU\_SMA\_0220 | Smaugi | Eine Katze! Die kann ich nicht behalten. Oder? Nein. Ich habe schon genug Fell im Haufen. | Pixel auf Smaugi |
| W1\_SMAU\_MAX\_0230 | Max | Ordentliche Stapel, die Besen haben gefegt. Smaugi sieht zum ersten Mal seit Jahren den Boden, und er leidet. | Ansehen: Stapel; nach R12, aufgeräumte Fassung |
| W1\_SMAU\_MAX\_0235 | Max | Ein Stapel ist so gerade, dass er schon fast schief aussieht. Die Besen haben echt übertrieben. | Ansehen: Stapel, zweites Mal; nach R12, aufgeräumte Fassung |

Gespräch mit Smaugi:

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W1\_SMAU\_MAX\_0310 | Max | Wem gehört das alles? | Option Smaugi |
| W1\_SMAU\_SMA\_0320 | Smaugi | Mir. Alles. Jeder Löffel. Ich könnte es brauchen. Irgendwann. Man weiß nie, wann man dreihundert Teekannen braucht. | streichelt eine Teekanne |
| W1\_SMAU\_MAX\_0830 | Max | Dreihundert Teekannen? Du trinkst doch gar keinen Tee. |  |
| W1\_SMAU\_SMA\_0840 | Smaugi | Noch nicht. Aber wenn ich anfange, bin ich vorbereitet. |  |
| W1\_SMAU\_MAX\_0330 | Max | Gibst du mir das Ei? | Option Smaugi |
| W1\_SMAU\_SMA\_0340 | Smaugi | Das Ei? Das EI? Es ist das Einzige hier, das keinen Staub ansetzt. Ich gebe nichts her. // Außer, jemand braucht es wirklich. Wirklich wirklich. | Hinweis R12 |
| W1\_SMAU\_MAX\_0341 | Max | Und was heißt „wirklich wirklich“? |  |
| W1\_SMAU\_SMA\_0342 | Smaugi | Wenn mir jemand zeigt, dass mein Kram woanders glücklicher ist als hier. Dann vielleicht. Ganz vielleicht. | Hinweis R12 |
| W1\_SMAU\_MAX\_0350 | Max | Was ist mit der Tür da oben? | Option Smaugi |
| W1\_SMAU\_SMA\_0360 | Smaugi | Moderworts Geheimtür. Sie kichert, wenn man falsch rät. Sie kichert viel. Ich halte mir die Ohren zu, aber ich habe nur Krallen dafür. |  |
| W1\_SMAU\_MAX\_0850 | Max | Was muss man denn sagen? |  |
| W1\_SMAU\_SMA\_0860 | Smaugi | Das Passwort. Es hat mehrere Teile, und keiner hier kennt alle. Ich kenne keinen. Ich höre nur das Kichern. |  |
| W1\_SMAU\_MAX\_0370 | Max | Warum sammelst du das alles? | Option Smaugi |
| W1\_SMAU\_SMA\_0380 | Smaugi | Ich sammle nicht. Ich bewahre. Für den Fall. Welchen Fall? Den Fall! Irgendeinen Fall! | schnieft |
| W1\_SMAU\_PIX\_0870 | Pixel | Ich kenne das. Ich bewahre auch, und zwar unter dem Sofa. // Was genau, verrate ich nicht. Aber es ist sehr gut sortiert, und ein Teil davon ist eine Olive. |  |
| W1\_SMAU\_SMA\_0880 | Smaugi | Eine Kollegin! Was bewahrst du? Nein, sag es nicht. Ich will es auch haben. |  |
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
| W1\_SMAU\_MAX\_0630 | Max | Ich pass drauf auf. Opa sagt, es muss ganz bleiben, alles hängt davon ab. Ich weiß bloß immer noch nicht, was eigentlich. | Inventar: Drachenei |
| W1\_SMAU\_PIX\_0640 | Pixel | Ein Ei, von einem Drachen gewärmt. // Wenn das nicht weich wird, dann wird überhaupt nichts mehr weich auf dieser Welt. |  |
| W1\_SMAU\_GRI\_0650 | Grimmzahn | Schwerter? Wir hauen Steine, keine Ritter. | Schwerter auf Grimmzahn |
| W1\_SMAU\_ZEL\_0660 | Zeldina | Fackeln in einem Turm voller Holz? Nein danke. Ich hab Pläne mit dem Turm. | Fackeln auf Zeldina |
| W1\_SMAU\_HUM\_0670 | Humbert | Zu fein für den Pony-Express. Bei mir hängen Schinken von der Decke. | Kronleuchter auf Humbert |
| W1\_SMAU\_SMA\_0680 | Smaugi | Fisch? Ich bin ein Drache. Ich esse … auch Fisch. Aber nicht jetzt. Ich habe Kummer. | Thunfischdose auf Smaugi |
| W1\_SMAU\_MAX\_0690 | Max | Das Gold bleibt da. Ich will nicht der sein, der einen Drachen beklaut, in keiner einzigen Staffel. | Benutzen: Goldhaufen |

Rätsel 11, Teil 1: die Geheimtür. Benutzen öffnet die Eingabe: Der Spieler ordnet die vier Teile aus dem Notizbuch. Falsche Reihenfolgen bringen Gekicher.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_SMAU\_TUE\_0710 | Geheimtür | Passwort, bitte. Kicher. | Benutzen: Geheimtür; danach wählt Max die vier Teile aus dem Notizbuch nacheinander (Auswahl wie im Gespräch, gewählte Teile verschwinden) |
| W1\_SMAU\_TUE\_0720 | Geheimtür | Unvollständig. Kicher. Such weiter. | weniger als vier Teile im Notizbuch |
| W1\_SMAU\_TUE\_0730 | Geheimtür | Kicher! Nein! Kicherkicher! | falsche Reihenfolge |
| W1\_SMAU\_MAX\_0740 | Max | Die Tür lacht mich aus. Das macht sonst nur die Autokorrektur. | nach 0730 |
| W1\_SMAU\_TUE\_0750 | Geheimtür | Puddi-Bärchen-Mo? Das ist ja nicht mal ein Name. Kicher. | falsche Reihenfolge, die mit Puddi, Bärchen, Mo beginnt (statt 0730) |
| W1\_SMAU\_MAX\_0760 | Max | Mo-Knuddel-Puddi-Bärchen. | richtige Reihenfolge |
| W1\_SMAU\_TUE\_0770 | Geheimtür | … Kicher. Richtig. Mama? | öffnet sich; R11 Teil 1 gelöst |
| W1\_SMAU\_PIX\_0780 | Pixel | Die Tür hat „Mama“ gesagt. // Ich brauche einen Moment. Vielleicht auch zwei. |  |
| W1\_SMAU\_ZEL\_0790 | Zeldina | Sieben Stockwerke, und die Tür hat einen Mutterkomplex. Ich nehme ihn trotzdem. |  |
| W1\_SMAU\_PIX\_0800 | Pixel | Der Drache seufzt alle dreißig Sekunden, ich habe mitgezählt. // Ich hatte sonst nichts zu tun, und du offenbar auch nicht. | Zuruf |
| W1\_SMAU\_PIX\_0810 | Pixel | Die Besen fegen Smaugis Haufen zu Stapeln. Ordnung durch Terror. // Ich kenne das von deiner Großmutter, wenn sich Besuch angekündigt hat. | Zuruf; vor R12 |
| W1\_SMAU\_MAX\_0820 | Max | Erst das Ei. Von einem Dunklen Lord stand auf Opas Zettel nichts drauf. | Benutzen: offene Geheimtür; nach R11 Teil 1, vor R12 |

## 14. Thronsaal: Lord Moderwort und Abschluss der Welt

Rätsel 13, das Bossduell, und die letzten Zeilen in Schwurbelstein. Die Rückkehr auf den Dachboden steht im Skript der Zwischenspiele.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_THRO\_MOD\_0010 | Moderwort | Wer wagt es … hatschi … meinen Thronsaal zu betreten? | Szene, Ankunft; Taschentuch |
| W1\_THRO\_MAX\_0020 | Max | Ich. Wegen eines Eis. Das hab ich aber schon. |  |
| W1\_THRO\_MOD\_0030 | Moderwort | Dann … warum bist du hier? | verwirrt |
| W1\_THRO\_ZEL\_0040 | Zeldina | Wegen der Wohnung. |  |
| W1\_THRO\_MOD\_0050 | Moderwort | DIE MAKLERIN! Sie war schon hier! Sie hat Fotos gemacht! Vom Schlafzimmer! | Zaubern-Animation, violetter Funke an die Decke |
| W1\_THRO\_MAX\_0060 | Max | Er zaubert, und ich hab einen Kochlöffel. Das ist kein fairer Kampf. Für ihn. | Duell beginnt |
| W1\_THRO\_MAX\_0110 | Max | Ein riesiger schwarzer Thron mit einem winzigen Kissen. Gestickt: „Für meinen Mo“. | Ansehen: Thron |
| W1\_THRO\_MAX\_0115 | Max | Das Kissen hat Kuhlen, er sitzt immer genau auf der Stickerei. Für seinen Mo, also für sich selbst. | Ansehen: Thron, zweites Mal |
| W1\_THRO\_MAX\_0120 | Max | Taschentücher, stapelweise. Entweder hat hier jemand Heuschnupfen, oder sehr viele Gefühle. | Ansehen: Taschentuchstapel |
| W1\_THRO\_MAX\_0125 | Max | Auf einem Taschentuch sind Initialen: „L. M.“ Lord Moderwort hat Monogramme, extra für seine Tränen. | Ansehen: Taschentuchstapel, zweites Mal |
| W1\_THRO\_MAX\_0130 | Max | Blumen, im Thronsaal von einem Dunklen Lord mit Heuschnupfen. Das ist entweder Mut, oder es war die Maklerin. | Ansehen: Blumenvasen |
| W1\_THRO\_MAX\_0135 | Max | An einem Strauß hängt eine Karte: „Gute Besserung. Deine Maklerin.“ Die macht also auch Hausbesuche. | Ansehen: Blumenvasen, zweites Mal |
| W1\_THRO\_PIX\_0140 | Pixel | Seite 1: „Heute böse sein.“ Seite 2 bis 300: leer. // Ich kenne diese Art von Tagebuch. Dein Großvater führt eins über seine Diät. | Ansehen: Moderworts Lerntagebuch, Pixel |
| W1\_THRO\_PIX\_0145 | Pixel | Ich habe weitergeblättert. Auf Seite 301 ist ein Kringel. // Er hat also wenigstens gezeichnet. Das ist nicht viel, aber für einen Dunklen Lord ist es Fleiß. | Ansehen: Moderworts Lerntagebuch, Pixel, zweites Mal |
| W1\_THRO\_MAX\_0150 | Max | Ein Lerntagebuch mit Totenkopf. Innen steht ein Vorsatz, und dann kommt ganz viel Platz. | Ansehen: Lerntagebuch |
| W1\_THRO\_MAX\_0155 | Max | Auf der letzten Seite steht ganz klein „Morgen.“ Und auf der davor auch. Das Gefühl kenne ich. | Ansehen: Lerntagebuch, zweites Mal |
| W1\_THRO\_MAX\_0160 | Max | Buntglas mit Mondlicht. Sehr dramatisch, und bestimmt sehr teuer in der Reinigung. | Ansehen: Fenster |
| W1\_THRO\_MAX\_0165 | Max | Im Buntglas ist ein Bild von Moderwort, wie er gewinnt. Das war wohl das einzige Mal, und er hat es verglasen lassen. | Ansehen: Fenster, zweites Mal |
| W1\_THRO\_MAX\_0170 | Max | Lord Moderwort. Keine Nase, aber zwei rote Löcher, die aussehen, als hätten sie gerade geweint. | Ansehen: Moderwort |
| W1\_THRO\_MAX\_0175 | Max | Er schnieft und guckt sich dann um, ob es jemand gehört hat. Ich hab's gehört, aber ich sag nichts. | Ansehen: Moderwort, zweites Mal |
| W1\_THRO\_PIX\_0180 | Pixel | Pollenstaub, Taschentücher und Selbstmitleid. // Das ist weniger ein Dunkler Lord, als ein Dunkler Schnupfen. Mit Thron. | Ansehen: Moderwort, Pixel |
| W1\_THRO\_PIX\_0185 | Pixel | Er niest leiser, wenn man ihn ansieht. Das ist entweder Höflichkeit oder Angst, // und bei Lords ist das, nach allem, was ich gehört habe, ein und dasselbe. | Ansehen: Moderwort, Pixel, zweites Mal |
| W1\_THRO\_MOD\_0190 | Moderwort | Eine Katze! Katzenhaare! Hatschi! Weg mit … hatschi … dem Vieh! | Pixel auf Moderwort |

Das Duell. Reihenfolge: Pollen-Socke, dann Kochlöffel, dann der Spitzname im Gespräch.

| ID | Sprecher | Text | Regie oder Auslöser |
| --- | --- | --- | --- |
| W1\_THRO\_MOD\_0210 | Moderwort | Ein Kochlöffel? Ich habe einen echten Stab! Zittere! Hat… hatschi. | Kochlöffel auf Moderwort; vor dem Niesen |
| W1\_THRO\_MOD\_0220 | Moderwort | Fisch? Ich bin allergisch. Gegen alles. Hatschi. | Thunfischdose auf Moderwort |
| W1\_THRO\_MAX\_0230 | Max | Wasser hilft nicht gegen Dunkle Lords. Gegen Trolle schon, aber das ist eine andere Geschichte. | Eimer auf Moderwort |
| W1\_THRO\_MAX\_0240 | Max | Socke auf. | Socke voller Pollen auf Moderwort; rosa Wolke |
| W1\_THRO\_MOD\_0250 | Moderwort | Was … was ist das … nein … NEIN … HAAATSCHIIII! | Niesen-Animation; der Stab fliegt |
| W1\_THRO\_ZEL\_0260 | Zeldina | Gefangen! Toadi wirft mir ständig Sachen zu, ich hab Übung. | fängt den Stab |
| W1\_THRO\_MOD\_0270 | Moderwort | Mein Stab! Gib ihn … hatschi … zurück! Ich bin wehrlos! Ich bin ein Dunkler Lord und ich bin WEHRLOS! | tastet nach dem Stab |
| W1\_THRO\_MAX\_0280 | Max | Hier. Ersatz. | Kochlöffel auf Moderwort; nach dem Niesen |
| W1\_THRO\_MOD\_0290 | Moderwort | Du wagst es … FLUCH DER EWIGEN FINSTERNIS! | Zaubern-Animation; eine Käsescheibe fällt zu Boden |
| W1\_THRO\_MOD\_0300 | Moderwort | Käse? |  |
| W1\_THRO\_MAX\_0310 | Max | Fondue-Rückstände. Ich nenne das eine Bindung. |  |
| W1\_THRO\_MOD\_0320 | Moderwort | FLUCH DER TAUSEND … | zweiter Versuch; Käse |
| W1\_THRO\_PIX\_0330 | Pixel | Er flucht Käse. Ich wechsle die Seite, junger Mann, ich stehe jetzt neben ihm. // Nur wegen des Käses, wohlgemerkt. Meine Loyalität ist unerschütterlich, aber sie hat Hunger. | geht zu den Käsescheiben |
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
| W1\_THRO\_PIX\_0560 | Pixel | Du hast diese ganze Welt geschafft, ohne eine einzige meiner Lösungen. Ich bin … beeindruckt. // Das sage ich nie wieder. Streich es aus dem Protokoll, und zwar sofort. | nur wenn Stufe-3-Zähler Welt 1 gleich null |
| W1\_THRO\_PIX\_0570 | Pixel | Du hast es geschafft. Mit Hilfe, und zwar mit meiner Hilfe. // Deshalb gehört das Ei zu einem Drittel mir. Ich nehme den weichen Teil. | wenn Stufe-3-Zähler größer als null |
| W1\_THRO\_MAX\_0580 | Max | Ich hab das Ei, und auf dem Zettel steht: „Alles hängt davon ab.“ Also nichts wie zurück. | hält das Ei hoch |
| W1\_THRO\_PIX\_0590 | Pixel | Zurück durch den Fernseher. Ich hasse Fernsehreisen. // Ich habe es gesagt, ich sage es wieder, und ich werde es immer sagen, auch wenn keiner zuhört. Gerade dann. |  |
| W1\_THRO\_MAX\_0600 | Max | Opa hat gesagt, zurück holt uns der Werbeblock. |  |
| W1\_THRO\_PIX\_0610 | Pixel | Dann bitte einen mit Essen. | Bild flimmert; Übergang zum Zwischenspiel |
| W1\_THRO\_ZEL\_0620 | Zeldina | Wenn ihr oben Hilfe braucht: Ich hab jetzt einen Zauberstab und keinen Umzug mehr. Ruft an. | nach 0550; bereitet das Finale vor |
| W1\_THRO\_MOD\_0630 | Moderwort | Erstes Jahr, zweiter Anlauf. Hatschi. Diesmal mit Taschentüchern. | nach 0620; danach 0560 oder 0570 |
| W1\_THRO\_PIX\_0710 | Pixel | Er sitzt auf einem Thron für drei und benutzt ein Kissen für einen. // Das ist das Traurigste, was ich heute gesehen habe, und ich habe Toadi gesehen. | Zuruf |
| W1\_THRO\_PIX\_0720 | Pixel | Blumen, Taschentücher und Heuschnupfen. // Dieser Raum ist ein Rätsel, das sich praktisch selbst löst. Man muss nur hinsehen und notfalls niesen. | Zuruf; vor dem Duell |

## 15. Figurenwechsel und Pixel als Spielfigur

Zeilen, die in jedem Raum von Welt 1 gelten: beim Wechsel zwischen Max und Pixel (zufällig gezogen, nie zweimal hintereinander) und bei Dingen, die nur die jeweils andere Figur kann.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_WECH\_PIX\_0010 | Pixel | Ich übernehme. Versuch, in der Zwischenzeit nichts Wichtiges zu verpassen. | Wechsel zu Pixel |
| W1\_WECH\_PIX\_0020 | Pixel | Vier Pfoten, ein Gehirn und kein Inventar. Ich bin bereit, und zwar schon immer. | Wechsel zu Pixel |
| W1\_WECH\_PIX\_0030 | Pixel | Pfoten statt Hände. Du wirst merken, dass das ein Aufstieg ist. | Wechsel zu Pixel |
| W1\_WECH\_MAX\_0040 | Max | Zurück zu dem mit den Taschen. | Wechsel zu Max |
| W1\_WECH\_MAX\_0050 | Max | Okay, Hände. Die hab ich vermisst. | Wechsel zu Max |
| W1\_WECH\_MAX\_0060 | Max | Ich hab mich ohne mich irgendwie komisch gefühlt. | Wechsel zu Max |
| W1\_WECH\_PIX\_0070 | Pixel | Ich trage genau einen Gegenstand, und zwar im Maul und mit Würde. // Das hier ist zu groß für beides. Für das Maul und für die Würde. | Pixel versucht, einen großen Gegenstand zu nehmen |
| W1\_WECH\_PIX\_0080 | Pixel | Türen und Pfoten. Du weißt, wie das endet, und ich weiß es auch. | Pixel benutzt eine Tür oder einen Hebel |
| W1\_WECH\_MAX\_0090 | Max | Das ist Pixels Revier. Ich hab keine Krallen, nur Sneaker, und bei einem ist der Senkel offen. | Max benutzt Dachbalken, Regal oder Katzenklappe |
| W1\_WECH\_MAX\_0100 | Max | Miau? Miau. Ich glaube, es hat Nein gesagt. Oder es hat Hunger. | Max redet mit einem Tier |
| W1\_WECH\_PIX\_0110 | Pixel | Ich rede nicht mit Menschen, ich lasse mich von ihnen kommentieren. // Wechsel zu Max, wenn du Wörter brauchst. Er hat welche, wenn auch keine besonders schönen. | Pixel redet mit einer Figur ohne eigene Pixel-Zeile |

## 15b. Inventar ansehen (INV)

Rechtsklick auf einen Gegenstand in der Inventarleiste. Erstes Mal die erste Zeile, zweites Mal die Zweitzeile, danach der Wiederholungs-Pool (siehe `05-spielsysteme.md`). Gegenstände, die hier fehlen, haben ihre Ansehen-Zeile schon in ihrem Abschnitt oder im Abschnitt, aus dem sie mitreisen.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_INV\_MAX\_0010 | Max | Käsefondue in einer Schale. Es blubbert immer noch, und zwar in meiner Tasche. Ich frag lieber nicht, wie. | Ansehen: Käsefondue |
| W1\_INV\_PIX\_0015 | Pixel | Geschmolzener Käse. Er klebt an allem, was er liebt. // Ich halte Abstand. Für diese Art von Beziehung bin ich noch nicht bereit. | Ansehen: Käsefondue, zweites Mal |
| W1\_INV\_MAX\_0020 | Max | Ein Kochlöffel aus Holz. Der Stabmacher sagt, der Stab wählt den Zauberer. Dieser hier hat Eintopf gewählt. | Ansehen: Kochlöffel, ohne_kaese |
| W1\_INV\_MAX\_0025 | Max | Ich hab damit in der Luft rumgefuchtelt, aber da kam kein einziger Funke. Ich glaube, er braucht was, das ihn zusammenhält. | Ansehen: Kochlöffel, ohne_kaese, zweites Mal |
| W1\_INV\_MAX\_0030 | Max | Ein Ziegenfell-Vorleger. Er riecht nach Taverne, Bier und Ziege, genau in dieser Reihenfolge. | Ansehen: Ziegenfell-Vorleger |
| W1\_INV\_PIX\_0035 | Pixel | Ein Fell ohne Ziege. Das ist die beste Form von Ziege, die es gibt. // Ich lege mich gleich darauf, sobald du nicht hinsiehst. Aus Rache, sozusagen. | Ansehen: Ziegenfell-Vorleger, zweites Mal |
| W1\_INV\_MAX\_0040 | Max | Rotkäppchens Bestellzettel. Ein Kästchen für „Oma“, eins für „Wolf“ und eins für „Sonstiges“. Ich bin Sonstiges. | Ansehen: Bestellzettel |
| W1\_INV\_MAX\_0045 | Max | Kleingedruckt steht da: „Lieferung nur bis zum Waldrand, danach auf eigene Gefahr.“ Ehrlich, aber ganz schön unheimlich. | Ansehen: Bestellzettel, zweites Mal |
| W1\_INV\_MAX\_0050 | Max | Moderworts Steckbrief. Er sieht aus wie jemand, der beim Klassenfoto nie lächeln durfte. | Ansehen: Moderworts Steckbrief |
| W1\_INV\_MAX\_0055 | Max | „Belohnung: ein warmes Wort.“ Wer hat das ausgesetzt? Und warum rührt mich das? | Ansehen: Moderworts Steckbrief, zweites Mal |
| W1\_INV\_MAX\_0060 | Max | Ein leerer Eimer. Wenn ich reinspreche, hallt es. Der hat mehr Echo als meine Klasse, wenn der Lehrer was fragt. | Ansehen: Eimer, leer |
| W1\_INV\_MAX\_0065 | Max | Am Boden steht „Brunnen-Eigentum“. Ich bring ihn zurück, irgendwann. Versprochen. Fast versprochen. | Ansehen: Eimer, leer, zweites Mal |
| W1\_INV\_MAX\_0070 | Max | Ein Eimer voll Wasser, der bei jedem Schritt schwappt. Ich lauf rum wie ein Kellner auf Glatteis. | Ansehen: Eimer, mit_wasser |
| W1\_INV\_PIX\_0075 | Pixel | Wasser in einem Eimer. Das ist eine Waffe, junger Mann. // Ich weiß es, und du weißt es. Wir reden nicht darüber, und du richtest ihn nicht auf mich. | Ansehen: Eimer, mit_wasser, zweites Mal |
| W1\_INV\_MAX\_0080 | Max | Ein leerer Krug aus der Schmiede. Er hat noch kein Namensschild, also ist er bereit für ein Schicksal. | Ansehen: Krug, leer |
| W1\_INV\_MAX\_0085 | Max | Ich hab „Hallo“ reingesagt, und er hat „Hallo“ zurückgesagt. Das ist immerhin ein Anfang. | Ansehen: Krug, leer, zweites Mal |
| W1\_INV\_MAX\_0090 | Max | Ein Krug Ziegenmilch. Frisch, warm und ein bisschen vorwurfsvoll. Die Ziege hat zugesehen. | Ansehen: Krug, mit_ziegenmilch |
| W1\_INV\_PIX\_0095 | Pixel | Milch. Ich bin nicht stolz darauf, aber für diesen Krug würde ich Dinge tun. // Schlimme Dinge. Dinge, nach denen man nicht mehr aufs Sofa darf. | Ansehen: Krug, mit_ziegenmilch, zweites Mal |
| W1\_INV\_MAX\_0100 | Max | Ein Ei vom Huhn, noch warm. Das Huhn hat mich sehr lange angeguckt, ich glaube, ich schulde ihm was. | Ansehen: Ei |
| W1\_INV\_PIX\_0105 | Pixel | Ein Ei. Drei Minuten. Ich sage es nur, // für den Fall, dass du irgendwann einen Plan brauchst. Ich habe immer einen, und er hat immer mit Essen zu tun. | Ansehen: Ei, zweites Mal |
| W1\_INV\_MAX\_0110 | Max | Ein Leuchtpilz. Ich halt ihn wie eine Taschenlampe, und das Beste ist: Er muss nie geladen werden. | Ansehen: Leuchtpilz |
| W1\_INV\_MAX\_0115 | Max | Er leuchtet heller, wenn ich ihn lobe. Ich hab „Guter Pilz“ gesagt, und er strahlt. Wir sind jetzt Freunde. | Ansehen: Leuchtpilz, zweites Mal |
| W1\_INV\_MAX\_0120 | Max | Alwins Hinweiszettel. Seine Handschrift wandert schräg nach oben, als würde der Zettel gleich abheben. | Ansehen: Alwins Hinweiszettel |
| W1\_INV\_MAX\_0125 | Max | Unten hat er einen Stern mit Hut gemalt. Ein Zauberer, der Sterne mit Hut malt, kann kein schlechter Mensch sein. | Ansehen: Alwins Hinweiszettel, zweites Mal |
| W1\_INV\_MAX\_0130 | Max | Ein winziges Fläschchen. Es passt kaum ein Tropfen rein. Für Tränke mit schlechtem Selbstbewusstsein. | Ansehen: Fläschchen, klein |
| W1\_INV\_MAX\_0135 | Max | Auf dem Etikett steht „Trink mich“. Mach ich nicht, ich hab in Büchern gelesen, was danach passiert. | Ansehen: Fläschchen, klein, zweites Mal |
| W1\_INV\_MAX\_0140 | Max | Jetzt ist das Fläschchen groß. Es ist gewachsen, und zwar mehr, als ich in dem Alter geschafft hab. | Ansehen: Fläschchen, gross |
| W1\_INV\_PIX\_0145 | Pixel | Eine Flasche, die wächst. Mir wäre eine Dose lieber gewesen, die wächst, // aber mich fragt ja keiner. Ich sage es nur als Anregung für den Hersteller. | Ansehen: Fläschchen, gross, zweites Mal |
| W1\_INV\_MAX\_0150 | Max | Rotkäppchens Ketchup. Auf dem Etikett lacht eine Tomate. Sie weiß nicht, was mit ihren Freunden passiert ist. | Ansehen: Ketchup |
| W1\_INV\_MAX\_0155 | Max | Ich hab ein bisschen gedrückt, und es hat ein unanständiges Geräusch gemacht. Rotkäppchen hätte mich echt warnen können. | Ansehen: Ketchup, zweites Mal |
| W1\_INV\_MAX\_0160 | Max | Ein Tarifvertrag, noch leer. Eine Zeile für die Unterschrift und eine für den Kaffee. Die Goblins haben Prioritäten. | Ansehen: Tarifvertrag, leer |
| W1\_INV\_MAX\_0165 | Max | Paragraf eins: „Pausen.“ Paragraf zwei: „Mehr Pausen.“ Paragraf drei fehlt. Da wollten sie wohl eine Pause machen. | Ansehen: Tarifvertrag, leer, zweites Mal |
| W1\_INV\_MAX\_0170 | Max | Das Drachenei. Smaugi hat es gewärmt, und jetzt trag ich es weiter. Ich bin offiziell Babysitter, für ein Ei. | Ansehen: Drachenei |
| W1\_INV\_PIX\_0175 | Pixel | Ich habe es noch einmal angesehen. Es ist ein Ei, und zwar ein großes. // Ich bleibe bei meiner Meinung zur Zubereitung: zweieinhalb Minuten, und keine Sekunde länger. | Ansehen: Drachenei, zweites Mal |

## 15c. Gespräch erschöpft (ABS)

Ein Klick auf die Figur, wenn im Gesprächsmenü nur noch „Tschüss“ übrig wäre: Das Menü öffnet sich nicht, die Figur sagt abwechselnd eine dieser beiden Zeilen. Kommt ein neues Thema dazu, öffnet sich das Menü wieder (Regel in `05-spielsysteme.md`).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W1\_ABS\_ZEL\_0010 | Zeldina | Wir haben alles besprochen. Ich muss packen. Eine Prinzessin zieht nicht einfach um. Sie zieht mit Stil um. | Reden: Zeldina, Gespräch erschöpft |
| W1\_ABS\_ZEL\_0020 | Zeldina | Wenn du mich retten willst: Trag einen Karton. Sonst: später. | Reden: Zeldina, Gespräch erschöpft |
| W1\_ABS\_WAL\_0030 | Waldemar | Paragraf neunzehn: Ein Gespräch endet, wenn alles gesagt ist. Es ist alles gesagt. Bitte weitergehen. | Reden: Waldemar, Gespräch erschöpft |
| W1\_ABS\_WAL\_0040 | Waldemar | Ich habe keine Fragen und keine Antworten mehr. Nur noch Musicals. Die singe ich allein. | Reden: Waldemar, Gespräch erschöpft |
| W1\_ABS\_HUM\_0050 | Humbert | Mehr weiß ich nicht, Junge. Und was ich weiß, hat schon einen Namen. Wie meine Schwerter. | Reden: Humbert, Gespräch erschöpft |
| W1\_ABS\_HUM\_0060 | Humbert | Setz dich, trink was, oder geh. Aber frag nicht noch mal. Gerhard wird eifersüchtig. | Reden: Humbert, Gespräch erschöpft |
| W1\_ABS\_ALW\_0070 | Alwin Grauwald | Ich habe dir alles gesagt, was ein Zauberer sagen darf. Den Rest musst du selbst herausfinden. Das ist pädagogisch. | Reden: Alwin, Gespräch erschöpft |
| W1\_ABS\_ALW\_0080 | Alwin Grauwald | Du wirst nicht vorbeikommen. An mir. Ich meine: an weiteren Antworten. | Reden: Alwin, Gespräch erschöpft |
| W1\_ABS\_TOA\_0090 | Toadi | Danke fürs Zuhören! Aber die Antworten, die du suchst, sind in einem anderen Gespräch! | Reden: Toadi, Gespräch erschöpft |
| W1\_ABS\_TOA\_0100 | Toadi | Ich hab dir alles erzählt! Zweimal! Einmal davon mit Hut! | Reden: Toadi, Gespräch erschöpft |
| W1\_ABS\_STA\_0110 | Stabmacher | Der Kunde wählt den Stab nicht. Und das Gespräch wählt den Kunden nicht. Wir sind fertig. | Reden: Stabmacher, Gespräch erschöpft |
| W1\_ABS\_STA\_0120 | Stabmacher | Kommen Sie wieder, wenn Sie einen Stab brauchen. Oder eine Erklärung. Ich habe keine von beiden. | Reden: Stabmacher, Gespräch erschöpft |
| W1\_ABS\_SMA\_0130 | Smaugi | Ich habe dir alles erzählt. Jetzt muss ich abstauben. Gold staubt so schnell ein. | Reden: Smaugi, Gespräch erschöpft |
| W1\_ABS\_SMA\_0140 | Smaugi | Kein Wort mehr. Mein Rücken braucht Ruhe. Und mein Hort braucht Ordnung. | Reden: Smaugi, Gespräch erschöpft |
| W1\_ABS\_SCH\_0150 | Schmied | Ich hab dir alles erzählt. Jetzt schmiede ich. Die Ziege meckert. So ist die Arbeitsteilung. | Reden: Schmied, Gespräch erschöpft |
| W1\_ABS\_SCH\_0160 | Schmied | Mehr hab ich nicht. Und wenn doch, hat es schon einen Namen. | Reden: Schmied, Gespräch erschöpft |
| W1\_ABS\_ROT\_0170 | Rotkäppchen | Alles gesagt, alles geliefert. Wenn du noch was willst: Bestellzettel. Zehn Minuten oder gratis. | Reden: Rotkäppchen, Gespräch erschöpft |
| W1\_ABS\_ROT\_0180 | Rotkäppchen | Ich muss weiter. Oma wartet. Der Wolf auch. Beide nicht gern. | Reden: Rotkäppchen, Gespräch erschöpft |
| W1\_ABS\_GRI\_0190 | Grimmzahn | Die Verhandlungen sind abgeschlossen. Weitere Gespräche nur mit Tagesordnung und Kaffee. | Reden: Grimmzahn, Gespräch erschöpft |
| W1\_ABS\_GRI\_0200 | Grimmzahn | Kein Kommentar. Das ist nicht unhöflich. Das ist Gewerkschaft. | Reden: Grimmzahn, Gespräch erschöpft |
| W1\_ABS\_GOL\_0210 | Gollo | Alles gesagt, alles. Jetzt schweigen wirsss. Wir und unser Kummer. | Reden: Gollo, Gespräch erschöpft |
| W1\_ABS\_GOL\_0220 | Gollo | Geh, geh. Unser Gold ist weg, unsere Worte auch. Nur das Ssschätzchen bleibt. Niemand will es. | Reden: Gollo, Gespräch erschöpft |
| W1\_ABS\_MAK\_0230 | Maklerin | Für weitere Fragen vereinbaren Sie bitte einen Besichtigungstermin. Den nächsten habe ich in drei Jahren. | Reden: Maklerin, Gespräch erschöpft |
| W1\_ABS\_MAK\_0240 | Maklerin | Ich habe Ihnen alles gezeigt. Alles andere steht im Kleingedruckten. Das ist sehr klein. | Reden: Maklerin, Gespräch erschöpft |

## 16. Hinweise der Hilfe-Pfote

Drei Stufen je Rätselschritt. Die Texte zu Rätsel 1 bis 4 sind die Slice-Hinweise aus `05-spielsysteme.md`, hier mit IDs. ID-Schema: W1\_HINT\_PIX\_RRSK, RR Rätselnummer, S Stufe 1 bis 3, K Teilschritt (0 ohne Teilschritte, 1 bis 3 für a bis c oder Teil 1 und 2).

| ID | Sprecher | Text | Schritt |
| --- | --- | --- | --- |
| W1\_HINT\_PIX\_0111 | Pixel | Die Wirtskatze lässt dich nicht an den Topf. Sie braucht Ablenkung, // und zwar charmante Ablenkung. Ich nenne keine Namen, aber einer davon fängt mit P an. | R1a, Stufe 1 |
| W1\_HINT\_PIX\_0121 | Pixel | Ich könnte mit Minka reden, unter Katzen sozusagen. Wechsel zu mir, falls du dich traust. | R1a, Stufe 2 |
| W1\_HINT\_PIX\_0131 | Pixel | Wechsel zu mir und sprich mit Minka. Ich locke sie raus. Mein Charme ist eine Naturgewalt. | R1a, Stufe 3 |
| W1\_HINT\_PIX\_0112 | Pixel | Der Wirt klebt am Topf wie ich an der Heizung. Er braucht einen Grund zu gehen, // und zwar einen, der möglichst weit weg liegt. Möglichst tief unten. | R1b, Stufe 1 |
| W1\_HINT\_PIX\_0122 | Pixel | Wirf einen Blick auf die Weinkarte. Da steht etwas, das ganz hinten im Keller liegt. | R1b, Stufe 2 |
| W1\_HINT\_PIX\_0132 | Pixel | Bestell den Jahrgang Schicksalsberg. Den holt er aus dem Keller, und das dauert. | R1b, Stufe 3 |
| W1\_HINT\_PIX\_0113 | Pixel | Gollo traut sich nicht. Er will vorher spielen, und zwar Rätselspiele, was sonst. // Wer ihm seinen Ring abnehmen will, muss ihn erst einmal besiegen. | R1c, Stufe 1 |
| W1\_HINT\_PIX\_0123 | Pixel | Er verliert nur bei einer Frage, deren Antwort nur du kennen kannst. Etwas, das du bei dir trägst, zum Beispiel. | R1c, Stufe 2 |
| W1\_HINT\_PIX\_0133 | Pixel | Zieh die Thunfischdose auf Gollo. Dann fragst du ihn, was in deiner Tasche ist. Da kommt er nie drauf. | R1c, Stufe 3 |
| W1\_HINT\_PIX\_0210 | Pixel | Der Stabmacher sagt, der Stab wählt den Zauberer. // Klingt für mich, als bräuchte der Stab einen guten Grund, an dir hängen zu bleiben. Einen klebrigen Grund. | R2, Stufe 1 |
| W1\_HINT\_PIX\_0220 | Pixel | In der Taverne gibt es etwas Klebriges. Es blubbert, und ich träume nachts davon. | R2, Stufe 2 |
| W1\_HINT\_PIX\_0230 | Pixel | Schmier Käse auf den Löffel. Ich bin ein Kater, kein Lösungsbuch. | R2, Stufe 3 |
| W1\_HINT\_PIX\_0310 | Pixel | Der Troll will drei Ziegen, und wir haben null. Das ist, wenn ich das anmerken darf, ein schlechter Start. | R3, Stufe 1 |
| W1\_HINT\_PIX\_0320 | Pixel | Eine Ziege frisst gerade beim Schmied, eine zweite kann man am Dorfbrett bestellen. Die dritte … bitte nicht. | R3, Stufe 2 |
| W1\_HINT\_PIX\_0330 | Pixel | Hol die Schmiede-Ziege. Bestell die zweite mit dem Zettel am Dorfbrett und gib mir den Ziegenfell-Vorleger aus der Taverne. Ich hasse alles daran. | R3, Stufe 3 |
| W1\_HINT\_PIX\_0411 | Pixel | Der Troll ist ein Paragrafenreiter. Lies das Brückenschild, und zwar ganz. | R4a, Stufe 1 |
| W1\_HINT\_PIX\_0421 | Pixel | Im Märchen läuft immer erst die Kleine, dann die Mittlere, dann die Große. | R4a, Stufe 2 |
| W1\_HINT\_PIX\_0431 | Pixel | Schick die Ziegen klein, mittel, groß über die Brücke. Ich bin die Kleine. Sag's niemandem. | R4a, Stufe 3 |
| W1\_HINT\_PIX\_0412 | Pixel | Die Ziegen müssen ihren Text sagen. Sie sprechen nur Ziegisch. Ich übrigens fließend. | R4b, Stufe 1 |
| W1\_HINT\_PIX\_0422 | Pixel | Lies den Text aus der Satzung vor, ich übersetze. Meistens richtig. | R4b, Stufe 2 |
| W1\_HINT\_PIX\_0432 | Pixel | Lies die Satzung vor, dann wechsel zu mir und rede mit den Ziegen. Beim zweiten Mal übersetze ich ordentlich. | R4b, Stufe 3 |
| W1\_HINT\_PIX\_0413 | Pixel | Laut Satzung muss der Troll ins Wasser. Er kann nicht schwimmen. Lies genau, was da steht. | R4c, Stufe 1 |
| W1\_HINT\_PIX\_0423 | Pixel | Da steht „Wasser“, nicht „Fluss“. Wasser gibt es auch woanders. | R4c, Stufe 2 |
| W1\_HINT\_PIX\_0433 | Pixel | Hol mit dem Eimer Wasser aus dem Brunnen und stell es dem Troll hin. Fußbad. Regel erfüllt. | R4c, Stufe 3 |
| W1\_HINT\_PIX\_0510 | Pixel | Der Brunnen will Gold. Toadi hat nur Pilzgeld, und du? // Was hast du eigentlich in deinen Taschen, außer Krümeln und einem Handy ohne Netz? | R5, Stufe 1 |
| W1\_HINT\_PIX\_0520 | Pixel | Gollos Münze gehört in den Brunnen. Und dann wünsch dir nichts, was ich bereuen würde. | R5, Stufe 2 |
| W1\_HINT\_PIX\_0530 | Pixel | Münze rein, „etwas, das hoch hinaus will“ wünschen. Nicht Pizza. Ich sage das unter Schmerzen. | R5, Stufe 3 |
| W1\_HINT\_PIX\_0611 | Pixel | Alwin will Ei, Milch und einen Leuchtpilz, also einen Pfannkuchen, der leuchtet. // Zutaten muss man sammeln, junger Mann. Sie kommen nicht von allein, das weiß ich vom Thunfisch. | R6 Teil 1, Stufe 1 |
| W1\_HINT\_PIX\_0621 | Pixel | Ei beim Huhn in der Taverne, Pilz im Zauberwald, und Milch gibt es hier nicht. Außer bei Tieren mit Glöckchen. | R6 Teil 1, Stufe 2 |
| W1\_HINT\_PIX\_0631 | Pixel | Nimm den Krug aus der Schmiede, melk die Ziege, wirf Ei, Milch und Pilz in den Kessel. Ich sehe weg. | R6 Teil 1, Stufe 3 |
| W1\_HINT\_PIX\_0612 | Pixel | Sechs Flaschen, ein Zettel. Lies den Zettel, und zwar zweimal. // Er reimt sich, aber er lügt nicht. Im Gegensatz zu gewissen Nasen, die ich nicht näher bezeichnen möchte. | R6 Teil 2, Stufe 1 |
| W1\_HINT\_PIX\_0622 | Pixel | Nicht am Rand. Nicht die Großen, die sind Zwillinge. Und das Fischöl steht rechts neben dem Trank. Rechts von dir aus. | R6 Teil 2, Stufe 2 |
| W1\_HINT\_PIX\_0632 | Pixel | Flasche drei. Die dritte von links. Ich hätte vier gesagt, und ich hätte gelogen. Nimm drei. | R6 Teil 2, Stufe 3 |
| W1\_HINT\_PIX\_0710 | Pixel | Die Rosen öffnen sich nur bei Gesang. Du singst nicht, und ich singe nicht öffentlich. // Wer singt hier also heimlich? | R7, Stufe 1 |
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
| W1\_HINT\_PIX\_1132 | Pixel | Wechsel zu mir und klick die drei Kreuzungen an. Die Besen rennen in die Kammer, du machst die Tür zu. Und du kaufst mir eine Bürste. | R11 Teil 2, Stufe 3 |
| W1\_HINT\_PIX\_1210 | Pixel | Smaugi gibt nichts her, außer jemand braucht es wirklich. // Und hier stehen drei Leute herum, die ziemlich dringend etwas brauchen. Mich ausgenommen, ich brauche nur Fisch. | R12, Stufe 1 |
| W1\_HINT\_PIX\_1220 | Pixel | Humbert sammelt Schwerter, Grimmzahn braucht Fackeln, Zeldina will einen Kronleuchter. Smaugis Haufen hat alle drei. | R12, Stufe 2 |
| W1\_HINT\_PIX\_1230 | Pixel | Schwerter zu Humbert, Fackeln zu Grimmzahn, Kronleuchter zu Zeldina. Dann gibt er das Ei. Und ich will es weich. | R12, Stufe 3 |
| W1\_HINT\_PIX\_1310 | Pixel | Er hat keine Nase, aber Heuschnupfen. Und du hast eine Socke voller Pollen. // Ich bin kein Mathematiker, aber das kann sogar ich ausrechnen. | R13, Stufe 1 |
| W1\_HINT\_PIX\_1320 | Pixel | Socke auf, er niest, der Stab fliegt. Dann braucht er Ersatz. Du hast einen Löffel, der mal Käse war. | R13, Stufe 2 |
| W1\_HINT\_PIX\_1330 | Pixel | Socke auf Moderwort, Kochlöffel auf Moderwort, dann sprich ihn mit dem Spitznamen an. Und sieh dabei nicht mich an. | R13, Stufe 3 |
| W1\_HINT\_PIX\_0010 | Pixel | Gerade ist nichts offen. Geh irgendwohin, wo du noch nicht warst, // oder dorthin, wo es etwas zu essen gibt. Beides zählt, aber das Zweite zählt mehr. | kein offener Schritt in Welt 1 |
| W1\_HINT\_PIX\_9995 | Pixel | Ich überlege noch. Hier hat sogar das Nachdenken eine Satzung. Paragraf eins: nicht drängeln. | Wartezeile, nächste Stufe noch gesperrt |
