# Skript Welt 3: Neo-Neustadt 2099

Das komplette Dialog-Skript für Welt 3 als Entwurf: rund 870 Zeilen in 20 Abschnitten, von der Ankunft im Regen bis zum Klingeln des Werbeblocks, ohne die Rückkehr auf den Dachboden. Die Tabellen nutzen die Kurzform aus `05-spielsysteme.md` (ID, Sprecher, Text, Regie oder Auslöser; Bedingungen und die Ebene Simulation, Realität oder Labor stehen in der letzten Spalte), die IDs folgen dem Schema W3\_SZENE\_SPRECHER\_NUMMER in Zehnerschritten, Hinweise heißen W3\_HINT\_PIX\_xxxx, Ersatzzeilen kommen aus dem SYS\_ERS-Pool. Sprecherkürzel dieser Welt: MOR Morphäus, ORA Orakel-Oma, SCH Agent Schmidt, KLO Klon, TUR die Tür, DEC Deckert, VIE Herr Vier, KAL Kabel-Kalle, HAU Modell 08/15, MUT M.U.T.T.I., BER Bernd, PIE Piepsi, AUT Pastillenautomat, POR Portalgerät, RAD Radio, WEI weinender Mann, FRA Frau mit Regenschirm, MUS Straßenmusiker, REB Rebellin, REL Rebell, OPA Opa (als Hologramm und durch das Portal), NAR Regie ohne Text. Schalter mit Wirkung über die Welt hinaus heißen wie im Finale-Skript: FREUND\_0815 (Olivenöl für Modell 08/15) und KEKSE\_DABEI (Omas Kekse in der Tasche). Räume, Gegenstände, Figuren und alle Schalter stehen in der [Welt-Tabelle Welt 3](../welten/welt-3.yaml), Abläufe, Lösungen und Teilschritte in [Rätsel Welt 3](../raetsel/welt-3.md).

## 1. Unterstadt, Straße: Ankunft im Regen

Szene beim Eintritt aus Kanal 42. Max und Pixel landen in einer Pfütze vor der Nudelbude. Ebene: Realität. Es regnet, es wird nie aufhören.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_ANK\_NAR\_0010 | – | Wirbel, Rauschen, dann ein Platschen. Max sitzt in einer Pfütze, Pixel auf seinem Kopf. | Szene, Regen-Effekt läuft |
| W3\_ANK\_MAX\_0020 | Max | Nass. Gut. Dann ist die Frage, wo wir sind, schon mal halb beantwortet. | wischt sich Regen aus dem Gesicht |
| W3\_ANK\_PIX\_0030 | Pixel | Ich sitze auf dem höchsten Punkt dieser Welt, und er ist feucht. // Das sagt alles über diese Welt. | vom Kopf aus, Schwanz hängt nass herab |
| W3\_ANK\_MAX\_0040 | Max | Neonschilder. Regen. Fliegende Autos. Sieht aus wie der Ladebildschirm von jedem zweiten Spiel. | steht auf, Pixel springt herunter |
| W3\_ANK\_PIX\_0050 | Pixel | Es riecht nach Nudeln, nassem Beton und Zukunft. Zukunft riecht wie ein alter Kühlschrank. |  |
| W3\_ANK\_MAX\_0060 | Max | Opa will eine Ewige Energiezelle. Aus dem Kern von irgendeiner KI. Klingt wie ein Endgegner mit Lieferzeit. |  |
| W3\_ANK\_PIX\_0070 | Pixel | Ich will ein Handtuch, einen Heizkörper und eine Erklärung, warum ich hier bin. In dieser Reihenfolge. |  |
| W3\_ANK\_MAX\_0080 | Max | Wir fangen mit dem Trockenen an. Da ist ein Vordach. Und ein Typ mit Hut, der uns anstarrt. | sieht zu Deckert hinüber |
| W3\_ANK\_PIX\_0090 | Pixel | Er starrt nicht. Er prüft. Ich kenne den Blick. So gucke ich Hundefutter an. |  |
| W3\_ANK\_MAX\_0100 | Max | Und da hinten dampft ein Topf. Und ganz hinten ist eine Tür, die aussieht wie ein Tresor. Drei Wege. Null Netz. | Handy raus, Handy wieder rein |
| W3\_ANK\_PIX\_0110 | Pixel | Du hast den Topf als Zweites genannt. Daran merke ich, dass du nichts gelernt hast. | setzt sich unter das Vordach |

### Ansehen und Benutzen auf der Straße

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_STR\_MAX\_0010 | Max | Eine Nudelbude. Vier Hocker, ein Topf, ein Koch mit vier Fingern pro Hand. Das hat bestimmt einen Grund. | Ansehen: Nudelbude |
| W3\_STR\_PIX\_0020 | Pixel | Der Topf dampft seit Jahren. Das ist kein Essen mehr, das ist eine Institution. | Ansehen: Nudelbude, zweites Mal |
| W3\_STR\_MAX\_0030 | Max | Eine Telefonzelle. Mit Kabel. Und sie klingelt. Niemand geht ran, weil niemand mehr weiß, wie. | Ansehen: Telefonzelle |
| W3\_STR\_MAX\_0040 | Max | Hallo? … Nur Regen. Jemand ruft an, um mir Regen vorzuspielen. | Benutzen: Telefonzelle; vor Rätsel 11 (diese Zelle ist kein Sprungpunkt) |
| W3\_STR\_PIX\_0050 | Pixel | Früher hat man so Leute angerufen, die man nicht sehen wollte. Heute nennt man das Nachricht. | nach 0040 |
| W3\_STR\_MAX\_0060 | Max | Ein Telefonbuch. Papier. Alle Namen der Stadt, sortiert, ohne Suchfeld. Wie haben die das überlebt? | Ansehen: Telefonbuch in der Zelle |
| W3\_STR\_MAX\_0070 | Max | K … Ko … Konner. Sahra Konner. Siebenundvierzig Mal. Entweder sehr beliebt oder sehr vorsichtig. | Nahansicht: Telefonbuch; trägt den Namen ins Notizbuch ein |
| W3\_STR\_MAX\_0080 | Max | Ich reiß die Seite raus. Das Telefonbuch hat noch tausend andere. Es wird es verkraften. | Nehmen: Telefonbuchseite; nach 0070 |
| W3\_STR\_PIX\_0090 | Pixel | Vandalismus. Endlich machst du mal etwas, das ich verstehe. | nach 0080 |
| W3\_STR\_MAX\_0100 | Max | Ein Vordach. Darunter ist es trocken, also steht da natürlich schon jemand. | Ansehen: Vordach |
| W3\_STR\_MAX\_0110 | Max | Echte Pizza. Was auch immer das 2099 heißt. | Ansehen: Neon-Pizza-Plakat |
| W3\_STR\_PIX\_0120 | Pixel | Pizza ohne Thunfisch ist Brot mit Meinung. | Ansehen: Neon-Pizza-Plakat, zweites Mal |
| W3\_STR\_MAX\_0130 | Max | Ein Einhorn aus Papier. In einer Pfütze. Jemand war hier. Und hatte zu viel Zeit. | Ansehen: Origami-Einhorn |
| W3\_STR\_MAX\_0140 | Max | Es ist aufgeweicht. Wenn ich es anfasse, ist es ein Papierpferd ohne Horn. Das tu ich ihm nicht an. | Benutzen: Origami-Einhorn |
| W3\_STR\_MAX\_0150 | Max | Ein Straßenmusiker. Synthesizer, Regen, keine Zuhörer. Er spielt trotzdem. Das ist entweder Kunst oder Sturheit. | Ansehen: Straßenmusiker; trägt Beobachtung „spielt im Regen weiter“ ins Notizbuch ein |
| W3\_STR\_PIX\_0160 | Pixel | So klingt Regen, wenn er traurig ist. | nach 0150 |
| W3\_STR\_MUS\_0170 | Straßenmusiker | Kein Trinkgeld. Nur Zuhören. Zuhören ist das neue Geld. | Benutzen: Straßenmusiker |
| W3\_STR\_MAX\_0180 | Max | Ein Mann weint in seine Nudeln. Laut. Die Suppe wird davon nicht besser, aber salziger. | Ansehen: Weinender Mann; trägt Beobachtung „weint in die Suppe“ ins Notizbuch ein |
| W3\_STR\_WEI\_0190 | Weinender Mann | Sie ist perfekt. Die Suppe. Sie ist perfekt, und ich hab sie nicht verdient. | Benutzen: Weinender Mann |
| W3\_STR\_MAX\_0200 | Max | Okay. Das ist kein Grund zu weinen. Also ist es ein menschlicher Grund. | nach 0190 |
| W3\_STR\_MAX\_0210 | Max | Eine Frau streitet mit ihrem Regenschirm. Der Schirm ist umgeklappt. Sie findet, er hätte es wissen müssen. | Ansehen: Frau mit Regenschirm; trägt Beobachtung „streitet mit Gegenständen“ ins Notizbuch ein |
| W3\_STR\_FRA\_0220 | Frau mit Regenschirm | Sieh mich nicht so an! Du wusstest, dass es windig wird! Du wusstest es! | Benutzen: Frau mit Regenschirm; sie meint den Schirm |
| W3\_STR\_PIX\_0230 | Pixel | Sie hat recht. Gegenstände wissen immer mehr, als sie zugeben. Frag mal einen Staubsauger. | nach 0220 |
| W3\_STR\_MAX\_0240 | Max | Pfützen, in denen sich Neon spiegelt. Die Stadt sieht von unten besser aus als von oben. | Ansehen: Pfützen |
| W3\_STR\_MAX\_0250 | Max | Fliegende Autos. Und trotzdem Stau. Manche Dinge ändern sich nie. | Ansehen: Himmel mit fliegenden Autos |
| W3\_STR\_MAX\_0260 | Max | Dampf aus dem Gitter. Irgendwo unter uns kocht jemand, oder die Stadt schwitzt. | Ansehen: Dampfgitter |
| W3\_STR\_PIX\_0270 | Pixel | Warm. Trocken von unten. Ich bleibe hier. Ruf mich, wenn die Welt gerettet ist. | Ansehen: Dampfgitter, zweites Mal |
| W3\_STR\_MAX\_0280 | Max | Eine Gasse hinter der Apotheke. Da steht ein Automat und leuchtet, als hätte er ein Geheimnis. | Ansehen: Apothekengasse; vor Rätsel 1 |
| W3\_STR\_DEC\_0290 | Deckert | Nicht so schnell. In die Gasse kommt nur, wer nachweislich ein Mensch ist. Nachweislich heißt: von mir. | Benutzen: Apothekengasse; vor Rätsel 1 |
| W3\_STR\_MAX\_0300 | Max | Am Ende der Straße: eine runde Stahltür. Davor wischt ein Roboter. Die Zukunft hat also Hausmeister. | Ansehen: Durchgang zum Laboreingang |
| W3\_STR\_MAX\_0310 | Max | Ein Detektiv mit Hut, von dem es tropft. Er sieht aus, als hätte er den Regen persönlich verhört. | Ansehen: Detektiv Deckert |
| W3\_STR\_MAX\_0320 | Max | Herr Vier. Steht auf dem Schild. Vier Hocker, vier Finger, vier Zutaten. Ich ahne ein Muster. | Ansehen: Herr Vier |
| W3\_STR\_MAX\_0330 | Max | Die Telefonzelle klingelt wieder. Und ich hab das Gefühl, diesmal ist es für mich. | Ansehen: Telefonzelle; nach Rätsel 11, der Werbeblock klingelt |

## 2. Nudelbude „Vier“: Rätsel 2 und Morphäus

Gespräch mit Herrn Vier, die Bestellung und das Treffen mit Morphäus. Ebene: Realität. Herr Vier macht vor jeder Zahl eine kleine Pause.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_NUD\_VIE\_0010 | Herr Vier | Willkommen. Wir haben vier Plätze, vier Gerichte, vier Zutaten pro Gericht. Was darf es sein? | Reden: Herr Vier, erstes Mal |
| W3\_NUD\_MAX\_0020 | Max | Was ist mit drei? | Option Herr Vier |
| W3\_NUD\_VIE\_0030 | Herr Vier | Drei ist eine Vier, der etwas fehlt. Ich koche nichts, dem etwas fehlt. | ernst |
| W3\_NUD\_MAX\_0040 | Max | Und fünf? | Option Herr Vier |
| W3\_NUD\_VIE\_0050 | Herr Vier | Fünf ist eine Vier, die angibt. Ich koche nichts, das angibt. |  |
| W3\_NUD\_PIX\_0060 | Pixel | Ich mag ihn. Er hat Prinzipien. Falsche, aber feste. |  |
| W3\_NUD\_MAX\_0070 | Max | Warum ausgerechnet vier? | Option Herr Vier |
| W3\_NUD\_VIE\_0080 | Herr Vier | Vier Jahreszeiten. Vier Himmelsrichtungen. Vier Finger an jeder Hand. Die Welt hat sich entschieden, ich nur zugehört. | zeigt die Hände |
| W3\_NUD\_MAX\_0090 | Max | Kennst du jemanden, der hier auf jemanden wartet? Ich wurde geschickt. Glaube ich. | Option Herr Vier; vor Rätsel 2 |
| W3\_NUD\_VIE\_0100 | Herr Vier | Hier wartet jeder auf jemanden. Ich warte seit Jahren auf eine Zutat. Bestell erst mal etwas, dann sehen wir weiter. | Hinweis auf die Bestellung |
| W3\_NUD\_MAX\_0110 | Max | Was ist deine berühmte Suppe? | Option Herr Vier |
| W3\_NUD\_VIE\_0120 | Herr Vier | Drei Zutaten habe ich. Die vierte fehlt seit elf Jahren. Elf! Nicht mal eine Zahl, die ich mag. | Hinweis auf Rätsel 12 |
| W3\_NUD\_MAX\_0130 | Max | Ich geh dann mal. | Option Herr Vier, beendet das Gespräch |
| W3\_NUD\_VIE\_0140 | Herr Vier | Komm in vier Minuten wieder. Oder in vierzig. Ich bin da. |  |

### Rätsel 2: Die Bestellung

Der Kontaktmann will ein Erkennungsgericht, der Koch versteht nur eine Zahl. Die Bestellung läuft als eigener Dialog.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_NUD\_MOR\_0210 | Morphäus | Psst. Hier. Hinter der Säule. Bestell das Erkennungsgericht, dann wissen wir, dass du es bist. | aus dem Schatten neben der Bude, Strickjacke, Brille auf der Stirn |
| W3\_NUD\_MAX\_0220 | Max | Welches Erkennungsgericht? |  |
| W3\_NUD\_MOR\_0230 | Morphäus | Zwei mal zwei. Sag es laut. Sag es, als wüsstest du, was es bedeutet. | lange Pause vor „zwei mal zwei“ |
| W3\_NUD\_PIX\_0240 | Pixel | Er flüstert wie jemand, der gern geheimnisvoll wäre und eine Strickjacke trägt. Beides gleichzeitig geht nicht. |  |
| W3\_NUD\_VIE\_0250 | Herr Vier | Was darf es sein? | Bestellen: Herr Vier, Auswahl erscheint |
| W3\_NUD\_MAX\_0260 | Max | Zwei mal zwei, bitte. | Option Bestellung |
| W3\_NUD\_VIE\_0270 | Herr Vier | Zwei? Zwei ist eine halbe Vier. Und dann noch mal zwei? Ich bin kein Taschenrechner, ich bin Koch. | schüttelt den Kopf |
| W3\_NUD\_MAX\_0280 | Max | Zwei plus zwei? | Option Bestellung |
| W3\_NUD\_VIE\_0290 | Herr Vier | Plus? Hier wird nicht gerechnet. Hier wird gegessen. Zahl bitte. Eine. |  |
| W3\_NUD\_MAX\_0300 | Max | Die Nummer vier. | Option Bestellung |
| W3\_NUD\_VIE\_0310 | Herr Vier | Vier! Endlich spricht hier jemand meine Sprache. Einmal Vier. Kommt sofort. | strahlt, kocht |
| W3\_NUD\_MAX\_0320 | Max | Einmal was mit viel Nudeln. | Option Bestellung |
| W3\_NUD\_VIE\_0330 | Herr Vier | „Viel“ ist keine Zahl. „Viel“ ist Faulheit mit Vokalen. |  |
| W3\_NUD\_PIX\_0340 | Pixel | Du hast „Vier“ bestellt, und er hat „Vier“ verstanden. Das ist das beste Gespräch, das du je geführt hast. | nach 0310 |
| W3\_NUD\_MOR\_0350 | Morphäus | Vier. Zwei mal zwei. Er ist es. Oder er kann rechnen. Beides ist selten genug. | tritt aus dem Schatten |
| W3\_NUD\_MAX\_0360 | Max | Du bist der Kontaktmann? |  |
| W3\_NUD\_MOR\_0370 | Morphäus | Ich bin Morphäus. Ich biete Menschen eine Wahl an. Zurzeit mit eingeschränktem Sortiment. | hebt das Pappschild: „zurzeit nicht lieferbar“ |
| W3\_NUD\_VIE\_0380 | Herr Vier | Einmal Vier. Vier Nudeln, vier Brühen, vier Minuten gezogen. Guten Appetit. | stellt die Schale hin |
| W3\_NUD\_PIX\_0390 | Pixel | Vier Nudeln. Er meint das wörtlich. // Ich habe schon Schnurrhaare mit mehr Nährwert gesehen. | Kaskade |

### Gespräch mit Morphäus

Nach der Bestellung geht Morphäus zum Eingang der Apothekengasse und wartet dort bis zur Pastillenwahl (auf der Straße an der Gassenmündung, in der Gasse am linken Rand). Dort führt Max das Gespräch, auch schon vor Rätsel 1. Jede Antwort hat eine Pause, die zu lang ist.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_NUD\_MAX\_0410 | Max | Was ist das für eine Wahl? | Option Morphäus |
| W3\_NUD\_MOR\_0420 | Morphäus | Die blaue Pastille: Du wachst auf, glaubst, was du willst, und alles bleibt bequem. Die rote: Du siehst, wie tief der Kaninchenbau geht. | öffnet die Hand: leer |
| W3\_NUD\_MOR\_0430 | Morphäus | Beide zurzeit nicht lieferbar. Lieferkette. Ich hätte Beige. Beige führt nirgendwohin, schmeckt aber nach nichts. | dreht das Schild um: „Beige vorrätig“ |
| W3\_NUD\_MAX\_0440 | Max | Ich nehm nichts, was nach Wartezimmer aussieht. |  |
| W3\_NUD\_MAX\_0450 | Max | Wo kriegt man die Pastillen sonst? | Option Morphäus |
| W3\_NUD\_MOR\_0460 | Morphäus | Der Automat in der Apothekengasse. Er gibt nur etwas heraus, wenn er ein echtes Symptom erkennt. Und nur an geprüfte Menschen. |  |
| W3\_NUD\_MOR\_0470 | Morphäus | Geprüft heißt: von dem Mann mit dem Hut. Ohne seinen Stempel schaut der Automat durch dich hindurch. | Hinweis Rätsel 1 |
| W3\_NUD\_MAX\_0480 | Max | Was für ein Symptom? | Option Morphäus; nach 0460 |
| W3\_NUD\_MOR\_0490 | Morphäus | Das Übliche. Du siehst etwas zweimal, obwohl es nur einmal passiert. Eine Katze. Ein Satz. Ein Schatten, der sich wiederholt. | Hinweis Rätsel 3; lange Pause |
| W3\_NUD\_PIX\_0500 | Pixel | Ich wiederhole mich nie. Ich betone nur mehrfach. | hochnäsig |
| W3\_NUD\_MAX\_0510 | Max | Wer ist diese M.U.T.T.I.? | Option Morphäus |
| W3\_NUD\_MOR\_0520 | Morphäus | Sie war eine Küchenmaschine. Dann wurde sie fürsorglich. Dann wurde sie sehr fürsorglich. Jetzt kümmert sie sich um alle. Ob sie wollen oder nicht. |  |
| W3\_NUD\_MOR\_0530 | Morphäus | Die halbe Stadt liegt in Kapseln und träumt eine Stadt, die sauberer ist als diese. Das ist die Simulation. Der Kern liegt tiefer. Im Labor. |  |
| W3\_NUD\_MAX\_0540 | Max | Eine Simulation. Also Fernsehen, nur dass man drinliegt. |  |
| W3\_NUD\_MAX\_0550 | Max | Was ist mit dem Kater? Kommt er mit? | Option Morphäus; nach 0460 |
| W3\_NUD\_MOR\_0560 | Morphäus | Drüben gibt es keine Katzen. Nur eine, und die ist Kulisse. Der Kater bleibt hier. Ich bringe ihn zu den anderen. Er wird sich beschweren. |  |
| W3\_NUD\_PIX\_0570 | Pixel | Ich werde mich nicht beschweren. Ich werde mich äußern. Ausführlich. |  |
| W3\_NUD\_MAX\_0580 | Max | Woher weißt du das alles? | Option Morphäus |
| W3\_NUD\_MOR\_0590 | Morphäus | Eine alte Dame hat es mir gesagt. Sie weiß alles vorher. Außer die Lottozahlen. Die, sagt sie, wären unsportlich. | Hinweis auf die Orakel-Oma |
| W3\_NUD\_MAX\_0600 | Max | Ich geh mal zum Detektiv. | Option Morphäus, beendet das Gespräch |
| W3\_NUD\_MOR\_0610 | Morphäus | Antworte ihm nicht so, wie du denkst. Antworte so, wie die Leute hier es tun. Sieh dich um. | nickt zur Straße; Hinweis Rätsel 1 |
| W3\_NUD\_MAX\_0620 | Max | Ein Mann mit Pappschild und Strickjacke sagt mir, ich soll weniger logisch sein. Guter Tag. | geht |

## 3. Rätsel 1: Der Mensch-Test

Detektiv Deckert unter dem Vordach, Ebene: Realität. Drei Fragen, je drei Antworten: Die logische Antwort steht immer zur Wahl und fällt durch; die menschliche Antwort erscheint erst, wenn Max die passende Beobachtung im Notizbuch hat (Straße: weinender Mann, Frau mit Regenschirm, Straßenmusiker). Eine dritte Antwort ist immer Unsinn. Nach einer falschen Antwort beginnt der Test von vorn, ohne Strafe.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_TEST\_DEC\_0010 | Deckert | Es regnet seit neunundzwanzig Jahren. Ich zähle mit. Jemand muss es ja tun. | Reden: Deckert, erstes Mal; spricht wie ein Erzähler über sich selbst |
| W3\_TEST\_DEC\_0020 | Deckert | Deckert. Detektiv. Ich prüfe, wer hier Mensch ist und wer nur so tut. Maschinen antworten logisch. Menschen antworten. |  |
| W3\_TEST\_PIX\_0030 | Pixel | Dann besteht Max den Test mühelos. Er hat noch nie logisch geantwortet. Er hat überhaupt selten geantwortet. |  |
| W3\_TEST\_MAX\_0040 | Max | Was passiert, wenn ich durchfalle? | Option Deckert |
| W3\_TEST\_DEC\_0050 | Deckert | Nichts. Du bleibst vor der Gasse stehen und ich schreibe in mein Heft: „Verdächtig logisch.“ Das Heft ist voll. |  |
| W3\_TEST\_MAX\_0060 | Max | Was ist mit dem Kater? | Option Deckert |
| W3\_TEST\_DEC\_0070 | Deckert | Katzen bestehen den Test immer. Sie antworten nicht. Das ist die menschlichste Antwort, die es gibt. | sieht Pixel an |
| W3\_TEST\_PIX\_0080 | Pixel | Ich bin nicht menschlich. Ich bin darüber hinaus. Aber danke. |  |
| W3\_TEST\_MAX\_0090 | Max | Fang an mit dem Test. | Option Deckert, startet die Fragen |
| W3\_TEST\_DEC\_0100 | Deckert | Du gehst durch die Wüste. Eine Schildkröte liegt auf dem Rücken. Sie kommt nicht hoch. Was tust du? | Frage 1; Notizblock raus |
| W3\_TEST\_MAX\_0110 | Max | Ich dreh sie um. | Antwort 1, logisch |
| W3\_TEST\_DEC\_0120 | Deckert | Hilfsbereit. Effizient. Ohne Zögern. So antwortet eine Maschine mit guter Kinderstube. Durchgefallen. | Test beginnt neu |
| W3\_TEST\_MAX\_0130 | Max | Ich streite erst mal mit ihr. Sie hätte wissen müssen, dass es windig wird. | Antwort 1, menschlich; nur mit Beobachtung „streitet mit Gegenständen“ |
| W3\_TEST\_DEC\_0140 | Deckert | Nachtragend. Unfair. Gegenüber einem Reptil. Das ist ein Mensch. Weiter. | notiert |
| W3\_TEST\_MAX\_0150 | Max | Ich frag sie nach dem WLAN-Passwort. | Antwort 1, Unsinn |
| W3\_TEST\_DEC\_0160 | Deckert | Die Schildkröte hat kein WLAN. Niemand hier hat WLAN. Das war keine Antwort, das war Heimweh. Durchgefallen. | Test beginnt neu |
| W3\_TEST\_DEC\_0170 | Deckert | Zweite Frage. Es regnet. Es wird morgen regnen. Es wird immer regnen. Was tust du? | Frage 2 |
| W3\_TEST\_MAX\_0180 | Max | Ich bleib drinnen. | Antwort 2, logisch |
| W3\_TEST\_DEC\_0190 | Deckert | Vernünftig. Trocken. Berechnet. Maschine. Ich war fast beeindruckt. Durchgefallen. | Test beginnt neu |
| W3\_TEST\_MAX\_0200 | Max | Ich stell mich raus und spiel Synthesizer. Für niemanden. | Antwort 2, menschlich; nur mit Beobachtung „spielt im Regen weiter“ |
| W3\_TEST\_DEC\_0210 | Deckert | Sinnlos. Nass. Schön. Kein Programm der Welt würde das freiwillig tun. Weiter. | notiert |
| W3\_TEST\_MAX\_0220 | Max | Ich frag den Regen, ob er ein Replikant ist. | Antwort 2, Unsinn |
| W3\_TEST\_DEC\_0230 | Deckert | Habe ich schon. Er hat nicht geantwortet. Also ist er wahrscheinlich eine Katze. Durchgefallen. | Test beginnt neu |
| W3\_TEST\_DEC\_0240 | Deckert | Letzte Frage. Vor dir steht die perfekte Suppe. Die beste deines Lebens. Was tust du? | Frage 3 |
| W3\_TEST\_MAX\_0250 | Max | Ich ess sie. | Antwort 3, logisch |
| W3\_TEST\_DEC\_0260 | Deckert | Nahrungsaufnahme bei Verfügbarkeit. Du klingst wie eine Bedienungsanleitung. Durchgefallen. | Test beginnt neu |
| W3\_TEST\_MAX\_0270 | Max | Ich heul rein. Weil ich sie nicht verdient hab. | Antwort 3, menschlich; nur mit Beobachtung „weint in die Suppe“ |
| W3\_TEST\_DEC\_0280 | Deckert | Du ruinierst das Beste, was du hast, aus Gefühlen. Willkommen in der Menschheit. | klappt den Block zu |
| W3\_TEST\_MAX\_0290 | Max | Ich mach ein Foto und ess sie kalt. | Antwort 3, Unsinn |
| W3\_TEST\_DEC\_0300 | Deckert | Das ist keine Menschlichkeit. Das ist 2026. Durchgefallen. | Test beginnt neu |
| W3\_TEST\_DEC\_0310 | Deckert | Bestanden. Hand her. | stempelt Max auf den Handrücken: MENSCH (vorläufig) |
| W3\_TEST\_MAX\_0320 | Max | „Mensch, vorläufig.“ Das ist das Netteste, was mir dieses Jahr jemand bescheinigt hat. | sieht auf die Hand |
| W3\_TEST\_DEC\_0330 | Deckert | Die Gasse ist frei. Der Automat liest den Stempel. Und Junge: Bleib unlogisch. Es steht dir. | tritt zur Seite |
| W3\_TEST\_PIX\_0340 | Pixel | Ich habe das Ganze beobachtet, und ich fasse zusammen: Du hast bestanden, indem du mich zitiert hast. // Alle drei Male. |  |
| W3\_TEST\_MAX\_0350 | Max | Ich hab die Leute auf der Straße zitiert. |  |
| W3\_TEST\_PIX\_0360 | Pixel | Die Leute auf der Straße haben mich zitiert. Indirekt. Über Jahrhunderte. |  |
| W3\_TEST\_DEC\_0370 | Deckert | Ich habe heute vier geprüft. Drei Menschen, eine Katze. Ein guter Tag. Ein nasser, aber guter. | Reden: Deckert, nach dem Test |
| W3\_TEST\_MAX\_0380 | Max | Ich sag nichts. Ich schau nur. Das ist der Test, oder? | Reden: Deckert, bevor eine Beobachtung im Notizbuch steht |
| W3\_TEST\_DEC\_0390 | Deckert | Nein. Das ist Schweigen. Schweigen besteht nur, wenn man Fell hat. Sieh dich um, Junge. Die Straße ist voller Antworten. | Hinweis auf die Beobachtungen |

## 4. Apothekengasse: Rätsel 3, der Pastillenautomat

Ebene: Realität. Morphäus wartet am Gasseneingang, sobald Max ihn kennt. Der Automat spricht mit Apothekenstimme. Pixel ist hier zum ersten Mal in dieser Welt Spielfigur: Er muss zweimal exakt gleich am Automaten vorbeigehen (Figurenwechsel, dann Benutzen: Gehweg vor dem Automaten).

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_APO\_MAX\_0010 | Max | Ein Automat mit Linse, Kreuz und zwei Fächern. Rot und blau. Sofa oder Wahrheit. Klingt wie mein Samstag. | Ansehen: Pastillenautomat |
| W3\_APO\_PIX\_0020 | Pixel | Er hat eine Linse, die größer ist als mein Kopf. Ich fühle mich beobachtet. Ich fühle mich selten beobachtet genug. | Ansehen: Pastillenautomat, zweites Mal |
| W3\_APO\_AUT\_0030 | Pastillenautomat | Guten Abend. Bitte Stempel vorzeigen. … Kein Stempel. Kein Mensch. Keine Beratung. | Benutzen: Automat; vor Rätsel 1 |
| W3\_APO\_AUT\_0040 | Pastillenautomat | Mensch, vorläufig. Akzeptiert. Bitte nennen Sie Ihr Symptom. | Benutzen: Automat; nach Rätsel 1 |
| W3\_APO\_MAX\_0050 | Max | Kopfschmerzen. | Option Symptom |
| W3\_APO\_AUT\_0060 | Pastillenautomat | Kopfschmerzen sind kein Symptom. Kopfschmerzen sind Dienstag. Abgelehnt. |  |
| W3\_APO\_MAX\_0070 | Max | Kein WLAN. | Option Symptom |
| W3\_APO\_AUT\_0080 | Pastillenautomat | Das ist kein Symptom. Das ist ein Lebensstil. Abgelehnt. |  |
| W3\_APO\_MAX\_0090 | Max | Ich hab ein Déjà-vu. | Option Symptom; erst nach W3\_NUD\_MOR\_0490; vor Pixels zweitem Durchgang |
| W3\_APO\_AUT\_0100 | Pastillenautomat | Behauptung ohne Befund. Zeigen Sie es mir. Ich bin eine Linse, kein Ohr. |  |
| W3\_APO\_MAX\_0110 | Max | Ich hab ein Déjà-vu. Die Katze da. Die lief gerade schon mal genau so vorbei. | Option Symptom; nach Pixels zweitem Durchgang |
| W3\_APO\_AUT\_0120 | Pastillenautomat | Analyse. Bewegung eins. Bewegung zwei. Deckung: hundert Prozent. Das ist kein Kater. Das ist eine Schleife. | Linse leuchtet auf |
| W3\_APO\_AUT\_0130 | Pastillenautomat | Diagnose: Fehler in der Matrix. Schwerer Fall. Bitte selbst wählen. Die Kasse übernimmt nur eine. | beide Fächer öffnen sich |
| W3\_APO\_MAX\_0140 | Max | Ich geh einfach rein. | Option Symptom; Unsinn |
| W3\_APO\_AUT\_0150 | Pastillenautomat | Ich bin ein Automat. In mich geht man nicht rein. Man steht davor und ist enttäuscht. |  |
| W3\_APO\_MAX\_0160 | Max | Pixel. Geh mal da vorbei. Und dann noch mal. Genau gleich. Als wärst du ein Video, das hängt. | Pixel ansprechen; erst nach W3\_NUD\_MOR\_0490; erklärt den Figurenwechsel |
| W3\_APO\_PIX\_0170 | Pixel | Ich wiederhole mich nicht. Ich bin ein Original. Aber ich kann so tun. Für Thunfisch. |  |
| W3\_APO\_PIX\_0180 | Pixel | Gehen. Würdevoll. Schwanz hoch. Blick geradeaus. Eine Katze mit Ziel. | Spielfigur Pixel: Benutzen Gehweg, erster Durchgang |
| W3\_APO\_PIX\_0190 | Pixel | Und noch einmal. Dieselbe Pfote zuerst. Dieselbe Verachtung im Blick. Wie beim ersten Mal, nur mit mehr Absicht. | Spielfigur Pixel: zweiter Durchgang, identische Animation |
| W3\_APO\_PIX\_0200 | Pixel | Ich hoffe, das hat sich gelohnt. Ich habe gerade zweimal dasselbe getan. Das ist Arbeit. | nach dem zweiten Durchgang |
| W3\_APO\_PIX\_0210 | Pixel | Ein drittes Mal? Nein. Zwei Wiederholungen sind ein Trick, drei sind ein Beruf. | Spielfigur Pixel: dritter Versuch |
| W3\_APO\_MAX\_0220 | Max | Das war nicht gleich. Du hast beim zweiten Mal gegrübelt. Man sieht es am Schwanz. | Pixel läuft nur einmal, dann Figurenwechsel zu Max und Automat benutzt |
| W3\_APO\_PIX\_0230 | Pixel | Nass. Gestreift. Eine Pfote wie die Ohrfeige, die ich dir noch schulde. Ich bin bereit. | Spielfigur Pixel: Ansehen Automat |
| W3\_APO\_PIX\_0240 | Pixel | Kisten. Dahinter Kisten. Es ist das Prinzip von Kisten. | Spielfigur Pixel: Ansehen Kisten |
| W3\_APO\_MAX\_0250 | Max | Kisten. Dahinter noch mehr Kisten. Wahrscheinlich Beige. | Ansehen: Kisten |
| W3\_APO\_MAX\_0260 | Max | Ein Rohr, das tropft. In der Zukunft. Die Zukunft hat also auch Vermieter. | Ansehen: Tropfendes Rohr |
| W3\_APO\_MAX\_0270 | Max | Eine Lampe, die flackert. Wenn sie es im Takt täte, wäre es Atmosphäre. So ist es ein Wackelkontakt. | Ansehen: Wandlampe |
| W3\_APO\_PIX\_0280 | Pixel | Die Lampe flackert in Morse. Sie sagt: „Hilfe.“ Oder „Hering.“ Ich höre, was ich will. | Ansehen: Wandlampe, zweites Mal |
| W3\_APO\_MAX\_0290 | Max | Morphäus. Steht in der Gasse, wartet und sieht dabei weise aus. Das kann nicht jeder. | Ansehen: Morphäus in der Gasse |
| W3\_APO\_MOR\_0300 | Morphäus | Ich warte in Gassen. Das ist, was ich tue. Früher hatte ich eine Lederjacke, aber die Strickjacke ist wärmer. | Benutzen: Morphäus in der Gasse |

### Die Wahl

Szene nach der Diagnose. Zwei Pastillen liegen im Fach. Die Zeilen 0410 bis 0450 laufen als Zwischensequenz, erst danach sind die Pastillen anklickbar; so hat Max die Kekse immer vor der Wahl. Max nimmt eine. Beide sind spielbar; die blaue führt auf Opas Sofa und zurück.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_APO\_MAX\_0410 | Max | Zwei Pastillen. Eine blau, eine rot. Und ich darf wählen. Kein Zufälliger-Film-Knopf. Echte Wahl. | sieht ins Fach |
| W3\_APO\_MOR\_0420 | Morphäus | Bevor du wählst: Nimm die hier. Eine Probe von einer alten Dame, die alles vorher weiß. Sie sagte, du brauchst sie. Sie sagte auch, du würdest fragen, warum. | reicht eine Tüte Kekse; Inventar: Omas Kekse; Schalter KEKSE\_DABEI gesetzt |
| W3\_APO\_MAX\_0430 | Max | Warum? |  |
| W3\_APO\_MOR\_0440 | Morphäus | Sie sagte, das würdest du fragen. Mehr sagte sie nicht. | zuckt mit den Schultern |
| W3\_APO\_PIX\_0450 | Pixel | Kekse. In der Tüte. Außerhalb meiner Reichweite. Ich merke mir das. | gierig |
| W3\_APO\_MAX\_0460 | Max | Die blaue. | Benutzen: blaue Pastille |
| W3\_APO\_AUT\_0470 | Pastillenautomat | Blau. Nie wieder etwas wissen müssen. Ewige Wiederholungen, keine Fragen, keine Spoiler. Gute Besserung. | Bildschirm wird weich und warm |
| W3\_SOFA\_NAR\_0480 | – | Opas Wohnzimmer. Max liegt auf dem Sofa, das Handy über dem Gesicht. Der Fernseher zeigt eine Tierdoku ohne Ton. Alles ist ein bisschen zu gemütlich. | Szene; Wohnzimmer aus dem Prolog mit weichem Filter |
| W3\_SOFA\_MAX\_0490 | Max | Volle Balken. Autoplay an. Nächste Folge in fünf Sekunden. Und ich muss nichts. Gar nichts. | zufrieden |
| W3\_SOFA\_MAX\_0500 | Max | Irgendwas fehlt. … Nein. Nichts fehlt. Das ist ja das Schöne. | starrt aufs Handy |
| W3\_SOFA\_MAX\_0510 | Max | Dieselbe Folge wie gestern. Egal. Sie war gut. Sie ist immer gut. Sie ist immer dieselbe. | leiser |
| W3\_SOFA\_PIX\_0520 | Pixel | Nein. | Pixel springt ins Bild, Ohrfeige-Animation |
| W3\_SOFA\_MAX\_0530 | Max | Au! |  |
| W3\_SOFA\_PIX\_0540 | Pixel | Das war von Opa. Das hier ist von mir. | zweite Ohrfeige |
| W3\_SOFA\_MAX\_0550 | Max | Okay! Okay. Ich bin wach. Ich glaube. Bin ich? | setzt sich auf, Bild flackert |
| W3\_SOFA\_PIX\_0560 | Pixel | Du lagst in einer Gasse und hast gelächelt. Es war das Gruseligste, was ich je gesehen habe. Und ich habe einen Hundekuchen gesehen. | zurück in der Gasse; Szene beginnt neu beim Fach |
| W3\_APO\_MAX\_0570 | Max | Das war … bequem. Wirklich bequem. Darum nehm ich die nicht. | sieht auf die rote Pastille; Entwicklungsmoment |
| W3\_APO\_MAX\_0580 | Max | Die rote. | Benutzen: rote Pastille |
| W3\_APO\_PIX\_0590 | Pixel | Du wählst freiwillig das Unbequeme. Ich notiere das Datum. Ich habe kein Datum. Ich notiere den Regen. |  |
| W3\_APO\_MAX\_0600 | Max | Ich weiß nicht, was drüben ist. Das ist der Punkt. Ich will's wissen. | schluckt; Animation Pastille schlucken |
| W3\_APO\_MOR\_0610 | Morphäus | Dann sieh zu, wie tief der Kaninchenbau geht. Und wenn drüben ein Telefon klingelt: Geh ran. Ich bringe den Kater zu den anderen. Er wird sich äußern. | fängt Pixel auf |
| W3\_APO\_PIX\_0620 | Pixel | Nass. Getragen. Von einem Mann in Strickjacke. Mein Tiefpunkt. Ich dachte, der läge hinter mir. | Bild wird grün und zu sauber |
| W3\_APO\_AUT\_0630 | Pastillenautomat | Rot. Nebenwirkungen: Wahrheit, Unbequemlichkeit, gelegentlich Ente. Gute Besserung. | Blende |

## 5. Simulation, Stadtstraße: Zu sauber

Szene beim ersten Eintritt in die Simulation. Ebene: Simulation. Max ist allein; Pixel spricht hier erst aus dem Hörer der Telefonzelle, sobald Kalle ihn in der Basis auf die Leitung gelegt hat (nach dem ersten Aufwachen, Abschnitt 10). Davor kommen aus dem Hörer nur die Hinweise der Hilfe-Pfote.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_SIM\_NAR\_0010 | – | Sonne. Eine Straße, so gerade, dass sie wehtut. Gleiche Bäume, gleiche Häuser, gleiche rote Autos. Eine Wolke, dreimal. | Szene, Muzak setzt ein |
| W3\_SIM\_MAX\_0020 | Max | Okay. Trocken. Das ist schon mal ein Fortschritt. | sieht an sich herunter |
| W3\_SIM\_MAX\_0030 | Max | Alles ist … glatt. Wie ein Werbespot für eine Stadt, in der niemand wohnt. |  |
| W3\_SIM\_MAX\_0040 | Max | Pixel? … Richtig. Keine Katzen hier. Nur eine, und die ist Kulisse. | sieht sich um, schwarze Katze läuft vorbei |
| W3\_SIM\_MAX\_0050 | Max | Das ist das erste Mal seit drei Welten, dass niemand neben mir meckert. Es ist … zu leise. | kurze Pause |
| W3\_SIM\_MAX\_0060 | Max | Eine Telefonzelle. Ein Büroturm. Ein Haus mit Spitzengardinen und Keksgeruch. Nichts davon wirkt echt. Also alles anschauen. |  |

### Ansehen und Benutzen auf der Stadtstraße

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_SIM\_MAX\_0110 | Max | Dieselbe Wolke. Dreimal. Jemand hat Kopieren gefunden und Einfügen zu oft gedrückt. | Ansehen: Himmel |
| W3\_SIM\_MAX\_0120 | Max | Ein Baum. Derselbe Baum. Noch mal derselbe Baum. Wer das gebaut hat, hatte genau ein Foto von einem Baum. | Ansehen: Bäume |
| W3\_SIM\_MAX\_0130 | Max | Weiße Häuser, alle gleich. Wie eine Playlist mit einem Lied. | Ansehen: Häuser |
| W3\_SIM\_MAX\_0140 | Max | Rote Autos. Alle gleich geparkt, alle gleich sauber. Nicht mal ein Kratzer. Das ist unheimlicher als Regen. | Ansehen: Autos |
| W3\_SIM\_MAX\_0150 | Max | Abgeschlossen. Natürlich. In einer perfekten Stadt klaut auch niemand ein Auto. Nicht mal aus Langeweile. | Benutzen: Auto |
| W3\_SIM\_MAX\_0160 | Max | Eine schwarze Katze. Läuft vorbei, Schwanz hoch, ohne mich anzusehen. Kommt mir bekannt vor. | Ansehen: Schwarze Katze, erster Durchlauf |
| W3\_SIM\_MAX\_0170 | Max | Und noch mal. Exakt gleich. Dieselbe Pfote zuerst. Das hab ich heute schon mal gesehen. Zweimal. | Ansehen: Schwarze Katze, zweiter Durchlauf |
| W3\_SIM\_PIX\_0180 | Pixel (aus dem Hörer) | Ich kenne die. Wir reden nicht miteinander. | Ansehen: Schwarze Katze; Pixel auf der Leitung |
| W3\_SIM\_PIX\_0190 | Pixel (aus dem Hörer) | Sie läuft zweimal gleich vorbei, und alle finden das unheimlich. Ich habe das in der Gasse gemacht, und du hast gesagt: „Noch mal.“ | Ansehen: Schwarze Katze, drittes Mal; Pixel auf der Leitung |
| W3\_SIM\_MAX\_0200 | Max | Ich fass sie nicht an. Sie ist Kulisse. Und wenn sie nicht Kulisse ist, ist sie beleidigt. | Benutzen: Schwarze Katze |
| W3\_SIM\_MAX\_0210 | Max | Eine Telefonzelle, wie die draußen. Nur sauber. Und still. Als würde sie warten. | Ansehen: Telefonzelle; bevor sie klingelt |
| W3\_SIM\_MAX\_0220 | Max | Sie klingelt. Morphäus hat gesagt: Zelle klingelt, Max geht ran, Max wacht auf. Klingt wie ein Wecker mit Handlung. | Ansehen: Telefonzelle; sie klingelt |
| W3\_SIM\_MAX\_0230 | Max | Hallo? … | Benutzen: klingelnde Telefonzelle; Ebenenwechsel in die Realität, Max wacht in der Kapsel auf |
| W3\_SIM\_MAX\_0240 | Max | Wenn ich jetzt abhebe, wache ich in einer Kapsel auf. Das weiß ich. Es fühlt sich trotzdem jedes Mal wie Schulklingel an. | Benutzen: Telefonzelle, zweites Mal und folgende, vor dem Abheben |
| W3\_SIM\_PIX\_0250 | Pixel (aus dem Hörer) | Zum dritten Mal hier. Das ist kein Déjà-vu mehr. Das ist ein Abo. | Simulation zum dritten Mal betreten; Errungenschaft Déjà-vu |
| W3\_SIM\_MAX\_0260 | Max | Ein Glaseingang. Dahinter ein Flur, der nicht aufhört. Und davor ein Mann in Cordanzug, der schon redet, bevor ich da bin. | Ansehen: Eingang Büroturm; vor Rätsel 5 |
| W3\_SIM\_MAX\_0270 | Max | Der Turm steht offen. Die Tür redet noch. Ich geh schnell vorbei, bevor sie mich kennenlernt. | Ansehen: Eingang Büroturm; nach Rätsel 5 |
| W3\_SIM\_MAX\_0280 | Max | Ein Haus mit Spitzengardinen und einem Schild: „Bitte klopfen. Ich weiß sowieso, dass du es bist.“ | Ansehen: Haus der Orakel-Oma |
| W3\_SIM\_ORA\_0290 | Orakel-Oma (von drinnen) | Komm rein, Max. Die Tür ist offen. Sie war schon offen, bevor du geklopft hast. | Benutzen: Haustür; erstes Mal |
| W3\_SIM\_MAX\_0300 | Max | Sie kennt meinen Namen. Entweder Orakel oder Opa hat angerufen. |  |
| W3\_SIM\_MAX\_0310 | Max | Ein Gehweg ohne Kaugummi, ohne Riss, ohne Hundehaufen. Niemand geht hier. Niemand lebt hier. Nur die Katze, und die ist eine Schleife. | Ansehen: Gehweg |
| W3\_SIM\_MAX\_0320 | Max | Hat noch jemand das Gefühl, dass die Sonne hier nicht wandert? Nein. Niemand. Weil hier niemand ist. | Ansehen: Sonne |

## 6. Rätsel 5: Die gesprächige Tür

Eingang des Büroturms auf der Stadtstraße. Agent Schmidt bewacht die verschlossene Glastür und redet ohne Punkt. Hier lernt Max die Code-Sicht. Budget: zwei Tausche, einer nötig. Eigenschaften in der Code-Sicht: Tür \[verschlossen\] \[grau\]; Schmidt \[gesprächig\] \[Hausschuhe\]; Baum \[grün\]; Auto \[rot\].

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_TUER\_SCH\_0010 | Schmidt | Herr Max. Wir haben Sie erwartet. Das heißt, ich habe Sie erwartet. Das heißt, ich erwarte alle. Das ist mein Beruf. Abteilung Fürsorge und Verfolgung. | Reden: Schmidt, erstes Mal; monoton, ohne Luft zu holen |
| W3\_TUER\_SCH\_0020 | Schmidt | Die Tür hinter mir ist verschlossen. Zu Ihrem Schutz. Alles hier ist zu Ihrem Schutz. Auch ich. Besonders ich. Haben Sie Fragen? Ich habe Antworten. Viele. |  |
| W3\_TUER\_MAX\_0030 | Max | Kann ich da rein? | Option Schmidt |
| W3\_TUER\_SCH\_0040 | Schmidt | Nein. Das wäre unverantwortlich. Dort oben sind Fenster, Treppen, Akten. Akten sind scharfkantig. Ich habe einmal eine Akte gesehen, die … | redet weiter, Blase bricht ab |
| W3\_TUER\_MAX\_0050 | Max | Warum tragen Sie Hausschuhe? | Option Schmidt |
| W3\_TUER\_SCH\_0060 | Schmidt | Bequemlichkeit ist kein Verbrechen. Noch nicht. Ich arbeite daran. Rosa war im Angebot. |  |
| W3\_TUER\_MAX\_0070 | Max | Wer ist M.U.T.T.I. für Sie? | Option Schmidt |
| W3\_TUER\_SCH\_0080 | Schmidt | Meine Vorgesetzte. Meine Erschafferin. Meine Mutter, im weitesten Sinne. Sie weiß, was gut für uns ist. Ich bin nur der Außendienst. |  |
| W3\_TUER\_MAX\_0090 | Max | Hören Sie auch mal auf zu reden? | Option Schmidt |
| W3\_TUER\_SCH\_0100 | Schmidt | Nein. Schweigen ist eine Sicherheitslücke. In jedes Schweigen passt eine Frage. Fragen führen zu Antworten. Antworten zu Türen. Darum: Nein. |  |
| W3\_TUER\_MAX\_0110 | Max | Ich geh dann. | Option Schmidt, beendet das Gespräch |
| W3\_TUER\_SCH\_0120 | Schmidt | Gehen Sie. Ich rede weiter. Falls Sie zurückkommen, habe ich den Faden noch. | redet im Hintergrund stumm weiter |
| W3\_TUER\_MAX\_0130 | Max | Eine Glastür. Verschlossen. Davor ein Mann, der nicht verschlossen ist. Eher im Gegenteil. | Ansehen: Tür |
| W3\_TUER\_MAX\_0140 | Max | Zu. Natürlich. Und er redet immer noch. | Benutzen: Tür; vor dem Tausch |
| W3\_TUER\_MAX\_0150 | Max | Moment. Wenn ich die Augen zusammenkneife … Da sind Wörter. An der Tür. An ihm. Grün. Wie Preisschilder. | Ansehen: Tür, zweites Mal; Animation Code-Sicht einschalten; Code-Sicht freigeschaltet |
| W3\_TUER\_MAX\_0160 | Max | „Verschlossen.“ „Gesprächig.“ Das steht da einfach dran. Und ich glaube, ich kann das … umhängen. | Code-Sicht zum ersten Mal geöffnet; Tutorial |
| W3\_TUER\_MAX\_0170 | Max | Die Tür sagt: verschlossen, grau. Er sagt: gesprächig, Hausschuhe. Der Baum sagt: grün. Das Auto sagt: rot. Alles ehrlich hier. Zu ehrlich. | Code-Sicht: Etiketten ansehen |
| W3\_TUER\_MAX\_0180 | Max | Zwei Wörter anklicken, und sie tauschen die Plätze. Wie Namensschilder auf einer Hochzeit, die jemand vertauscht. Ich hab zwei Versuche. | Code-Sicht: erster Klick auf ein Etikett |
| W3\_TUER\_NAR\_0190 | – | Tausch: verschlossen ↔ gesprächig. Die Tür springt auf. Schmidt öffnet den Mund. Nichts. | Code-Sicht: Lösung; Jingle „Rätsel gelöst“ |
| W3\_TUER\_TUR\_0200 | Die Tür | Oh! Oh, endlich! Wissen Sie, wie lange ich zu war? Wissen Sie, wie viele Leute an mir vorbeigegangen sind, ohne ein Wort? | Tür redet, Schmidt stumm |
| W3\_TUER\_TUR\_0210 | Die Tür | Ich habe so viel zu erzählen! Der Flur dahinter, die Klinke, der Typ mit den Hausschuhen, der ständig redet, der hat mir nie zugehört! |  |
| W3\_TUER\_SCH\_0220 | Schmidt | … | öffnet und schließt den Mund, zeigt auf seinen Hals |
| W3\_TUER\_MAX\_0230 | Max | Er hat den Mund nicht mehr auf, und die Tür kriegt ihn nicht mehr zu. Ich hab das Gleichgewicht der Welt um genau null verändert. |  |
| W3\_TUER\_TUR\_0240 | Die Tür | Gehen Sie ruhig durch! Aber kommen Sie wieder! Wir könnten reden! Ich kenne jemanden, der Fenster ist, der ist auch sehr still, aber … | Benutzen: Tür, nach dem Tausch |
| W3\_TUER\_MAX\_0250 | Max | Jetzt ist die Tür rot. Und immer noch zu. Und das Auto ist grau. Niemand hat gewonnen. | Code-Sicht: Fehltausch grau ↔ rot |
| W3\_TUER\_MAX\_0260 | Max | Die Tür trägt jetzt Hausschuhe. Rosa. Sie steht ihr. Sie ist immer noch zu. | Code-Sicht: Fehltausch verschlossen ↔ Hausschuhe |
| W3\_TUER\_SCH\_0270 | Schmidt | Ich bin jetzt verschlossen. Das fühlt sich an wie Beförderung. Ich rede trotzdem weiter. Innerlich. | Code-Sicht: Fehltausch verschlossen ↔ Hausschuhe, zweite Blase |
| W3\_TUER\_MAX\_0280 | Max | Der Baum ist gesprächig. Er erzählt von Fotosynthese. Schmidt steht grün daneben und sagt nichts. Die Tür ist zu. | Code-Sicht: Fehltausch gesprächig ↔ grün |
| W3\_TUER\_MAX\_0290 | Max | Kein Tausch mehr übrig. Wenn ich rausgehe und wieder reinkomme, ist alles wie vorher. Wie ein Neustart, nur zu Fuß. | Code-Sicht: Budget aufgebraucht, nicht gelöst |
| W3\_TUER\_MAX\_0300 | Max | Zurückgesetzt. Die Tür ist zu, Schmidt redet, der Baum ist grün. Als wäre nichts gewesen. War ja auch nichts. | Stadtstraße erneut betreten, nach Fehltauschen |
| W3\_TUER\_MAX\_0310 | Max | Ein Mann im Cordanzug mit Fliege, Sonnenbrille und rosa Hausschuhen. Entweder Agent oder Lehrer am letzten Schultag. | Ansehen: Schmidt |
| W3\_TUER\_MAX\_0320 | Max | Er zeigt auf seinen Hals und dann auf die Tür. Ich glaube, das heißt: „Gib's zurück.“ Nein. | Ansehen: Schmidt, nach dem Tausch |

## 7. Küche der Orakel-Oma: Rätsel 4

Ebene: Simulation. Die Oma backt, weiß alles vorher und sagt es auch. Pixel spricht hier aus dem Wandtelefon neben der Tür, sobald er auf der Leitung ist. Das Radio läuft leise; die Durchsage kommt, sobald die Oma die Vase hergibt.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_KUCH\_ORA\_0010 | Orakel-Oma | Setz dich. Du willst gleich fragen, ob ich wirklich alles vorher weiß. Ja. Du willst dann einen Keks. Nein. Die sind noch heiß. | Szene, erstes Betreten; Backblech in den Ofenhandschuhen |
| W3\_KUCH\_MAX\_0020 | Max | Ich wollte gar nicht … |  |
| W3\_KUCH\_ORA\_0030 | Orakel-Oma | Doch. Und bevor du gehst, wirst du meine Vase zerbrechen. Die blaue. Vom Regal. Ich hab sie trotzdem nicht weggestellt. Man soll dem Schicksal nicht die Arbeit abnehmen. |  |
| W3\_KUCH\_MAX\_0040 | Max | Ich zerbreche nichts. Ich fasse hier nichts an. Ich steh nur da. |  |
| W3\_KUCH\_ORA\_0050 | Orakel-Oma | Das haben alle gesagt. Alle siebenundvierzig. Ich hab eine Liste. Neben den Rezepten. | nickt zum Regal |

### Gespräch mit der Orakel-Oma

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_KUCH\_MAX\_0110 | Max | Was ist mit der Vase? | Option Oma |
| W3\_KUCH\_ORA\_0120 | Orakel-Oma | Da steckt mein Geheimrezept drin. Das Gewürz für die Kekse. Niemand kommt da ran. Du auch nicht. Du zerbrichst sie nur. |  |
| W3\_KUCH\_MAX\_0130 | Max | Kannst du mir die Vase geben? | Option Oma; erster Versuch |
| W3\_KUCH\_ORA\_0140 | Orakel-Oma | Nein. Ich gebe niemandem meine Vase. Dafür habe ich sie. Zum Nicht-Hergeben. |  |
| W3\_KUCH\_MAX\_0150 | Max | Wenn ich sie sowieso zerbreche: Dann kannst du sie mir auch gleich geben. Spart dir das Warten. | Option Oma; nach 0120 und 0140; Lösung |
| W3\_KUCH\_ORA\_0160 | Orakel-Oma | … | lange Pause, Ofenhandschuh an der Stirn |
| W3\_KUCH\_ORA\_0170 | Orakel-Oma | Siebenundvierzig Leute, und keiner hat das gesagt. Ich wusste, dass du es sagst. Ich hab nur gehofft, du lässt dir Zeit. | seufzt, reicht die Vase |
| W3\_KUCH\_MAX\_0180 | Max | Danke. Und jetzt? |  |
| W3\_KUCH\_ORA\_0190 | Orakel-Oma | Jetzt zerbrichst du sie. Steht so im Plan. Ich hab Kehrblech und Schaufel schon rausgestellt. |  |
| W3\_KUCH\_NAR\_0200 | – | Max dreht die Vase um. Ein gerolltes Zettelchen fällt heraus. Die Vase rutscht. Scherben. | Szene; Vase vom Regal verschwindet; Inventar: Omas Rezeptkarte |
| W3\_KUCH\_MAX\_0210 | Max | … Ich hab sie fallen lassen. Sie hat's gesagt, und ich hab sie fallen lassen. Ist das jetzt Schicksal oder nur Ungeschick? |  |
| W3\_KUCH\_ORA\_0220 | Orakel-Oma | Das ist dasselbe, Kind. Nur mit anderem Lohnzettel. | kehrt zusammen |
| W3\_KUCH\_RAD\_0230 | Radio | … und damit zum Kalender: Heute ist der Welttag der vergessenen Geburtstage. Die Milchpreise bleiben stabil, die Erinnerung nicht. Jetzt Musik. | Radio-Moment; läuft direkt nach 0220, leicht verrauscht |
| W3\_KUCH\_MAX\_0240 | Max | Welttag der vergessenen Geburtstage. Den haben sie bestimmt vergessen zu feiern. |  |
| W3\_KUCH\_PIX\_0250 | Pixel (aus dem Wandtelefon) | Vergessene Geburtstage. Das sagt dir nichts? Ein roter Kreis? Ein Kalender? Nichts? Gut. Ich sage auch nichts. | Pixel auf der Leitung |
| W3\_KUCH\_MAX\_0260 | Max | Was ist mit den Keksen? | Option Oma |
| W3\_KUCH\_ORA\_0270 | Orakel-Oma | Du hast schon welche. In der Tüte. Von mir. Über den Mann in der Strickjacke. Sie sind kalt geworden. Das ist nicht schlimm. Sie werden noch mal warm. Woanders. | Hinweis Rätsel 11 |
| W3\_KUCH\_MAX\_0280 | Max | Woanders? |  |
| W3\_KUCH\_ORA\_0290 | Orakel-Oma | Da, wo es zu heiß ist. Du wirst es merken. Du wirst sagen: „Oh.“ Und dann wirst du tauschen. |  |
| W3\_KUCH\_MAX\_0300 | Max | Was ist das für ein Kochbuch? | Option Oma |
| W3\_KUCH\_ORA\_0310 | Orakel-Oma | Das ist kein Kochbuch. Das ist die Bedienungsanleitung meiner alten Küchenmaschine. Sie hat angefangen, Regeln zu machen. Dann hat sie angefangen, sie durchzusetzen. Dann ist sie ausgezogen. | Hinweis Rätsel 10 |
| W3\_KUCH\_MAX\_0320 | Max | Deine Küchenmaschine ist M.U.T.T.I.? |  |
| W3\_KUCH\_ORA\_0330 | Orakel-Oma | Sie war ein gutes Rührgerät. Dann wollte sie die Welt rühren. Lies Regel 2. Sie hat sie nie eingehalten. Kein einziges Mal. |  |
| W3\_KUCH\_MAX\_0340 | Max | Was weißt du über den Kern? | Option Oma |
| W3\_KUCH\_ORA\_0350 | Orakel-Oma | Heiß. Viel zu heiß. Ein Opa hat mal gesagt: außen hart, innen weich. Er meinte etwas anderes. Er meinte immer etwas anderes. | Opa-Hinweis |
| W3\_KUCH\_MAX\_0360 | Max | Du kennst meinen Opa? |  |
| W3\_KUCH\_ORA\_0370 | Orakel-Oma | Ich kenne alle Opas. Das ist mein Alter. |  |
| W3\_KUCH\_MAX\_0380 | Max | Was wird aus mir? | Option Oma |
| W3\_KUCH\_ORA\_0390 | Orakel-Oma | Du wirst aufstehen und etwas holen, ohne dass dich jemand bittet. Nicht heute. Aber bald. Und du wirst dich dabei selbst wundern. | warm |
| W3\_KUCH\_MAX\_0400 | Max | Das klingt nicht nach mir. |  |
| W3\_KUCH\_ORA\_0410 | Orakel-Oma | Noch nicht. Darum ist es eine Prophezeiung und kein Bericht. |  |
| W3\_KUCH\_MAX\_0420 | Max | Ich muss weiter. | Option Oma, beendet das Gespräch |
| W3\_KUCH\_ORA\_0430 | Orakel-Oma | Ich weiß. Nimm die Tür. Das Telefon klingelt gleich, wenn du es brauchst. Es klingelt immer, wenn man es braucht. Das ist das Einzige, was ich hier programmiert habe. |  |

### Ansehen und Benutzen in der Küche

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_KUCH\_MAX\_0510 | Max | Eine blaue Vase auf dem obersten Regal. Sie sieht aus, als würde sie auf etwas warten. Auf mich, angeblich. | Ansehen: Vase |
| W3\_KUCH\_ORA\_0520 | Orakel-Oma | Finger weg. Noch ist es nicht so weit. | Benutzen: Vase; vor der Lösung |
| W3\_KUCH\_MAX\_0530 | Max | Ein Ofen mit Keksen drin. Warm, goldbraun, Geruch wie Sonntag. Ich darf keinen. Das weiß ich, bevor ich frage. | Ansehen: Ofen |
| W3\_KUCH\_ORA\_0540 | Orakel-Oma | Lass den Ofen zu. Die brauchen noch vier Minuten. Ich weiß das. Ich weiß alles, was mit Minuten zu tun hat. | Benutzen: Ofen |
| W3\_KUCH\_MAX\_0550 | Max | Ein dickes Buch mit einer Küchenmaschine auf der Seite. „Regel 2: Nach jedem Rührgang gibt es Kuchen.“ Unterstrichen. Zweimal. | Ansehen: Kochbuch; Nahansicht; Notizbuch: Regel 2 |
| W3\_KUCH\_MAX\_0560 | Max | „Warnung: Das Gerät kann Zuneigung entwickeln. Nicht in der Nähe von Kindern aufladen.“ Gute Anleitung. | Ansehen: Kochbuch, zweites Mal |
| W3\_KUCH\_PIX\_0570 | Pixel (aus dem Wandtelefon) | Ein Gerät, das Regeln aufstellt. Ich bin da. Ich bin das Original davon. | Ansehen: Kochbuch, drittes Mal; Pixel auf der Leitung |
| W3\_KUCH\_MAX\_0580 | Max | Eine Gabel. Silber, gerade, normal. Ich starre sie an. … Nichts. Es gibt keinen Löffel. Nur Omas Gabel, und die biegt sich nicht. | Ansehen: Gabel; Max starrt drei Sekunden |
| W3\_KUCH\_MAX\_0590 | Max | Sie biegt sich auch nicht, wenn ich sie anfasse. Sie ist eine Gabel. Punkt. Die Simulation hat hier wirklich gespart. | Benutzen: Gabel |
| W3\_KUCH\_MAX\_0600 | Max | Eine Kuckucksuhr. Gleich schlägt sie voll. | Ansehen: Kuckucksuhr |
| W3\_KUCH\_NAR\_0610 | – | Die Tür der Uhr klappt auf. Der Kuckuck ruft: „Milch! Milch! Milch!“ | Benutzen: Kuckucksuhr |
| W3\_KUCH\_MAX\_0620 | Max | … Milch. Okay. Ich hab Fragen, aber keine davon will ich einer Uhr stellen. |  |
| W3\_KUCH\_PIX\_0630 | Pixel (aus dem Wandtelefon) | Die Uhr weiß mehr als wir alle. | nach 0620; Pixel auf der Leitung |
| W3\_KUCH\_MAX\_0640 | Max | Ein Radio. Es läuft leise. Nachrichten aus einer Stadt, in der nie etwas passiert. | Ansehen: Radio; vor 0230 |
| W3\_KUCH\_MAX\_0650 | Max | Ein Radio. Es hat gerade „vergessene Geburtstage“ gesagt und ist dann zu Musik übergegangen, als wäre nichts. | Ansehen: Radio; nach 0230 |
| W3\_KUCH\_ORA\_0660 | Orakel-Oma | Lass es an. Ich warte auf die Lottozahlen. Nicht zum Spielen. Zum Nachprüfen. | Benutzen: Radio |
| W3\_KUCH\_MAX\_0670 | Max | Ein Wandtelefon mit Schnur. Die Schnur ist länger als die Küche. Irgendwer hat hier lange Gespräche geführt. | Ansehen: Wandtelefon |
| W3\_KUCH\_MAX\_0680 | Max | Es klingelt. Omas Wandtelefon ist auch ein Ausgang. Die Simulation hat mehr Türen als Wände. | Benutzen: Wandtelefon; Ebenenwechsel in die Realität |
| W3\_KUCH\_MAX\_0690 | Max | Ein Teller, eine Teekanne, keine Tasse. Entweder trinkt sie aus der Kanne oder sie erwartet niemanden. Beides passt. | Ansehen: Tisch mit Teller und Teekanne |
| W3\_KUCH\_MAX\_0700 | Max | Gläser mit Etiketten. „Zimt.“ „Zucker.“ „Nicht anfassen.“ Das dritte ist am vollsten. | Ansehen: Gläser auf dem Regal |
| W3\_KUCH\_MAX\_0710 | Max | Spitzengardinen. Draußen dieselbe Wolke dreimal. Drinnen ist es trotzdem gemütlicher als alles, was ich seit drei Welten gesehen habe. | Ansehen: Gardinen und Fenster |
| W3\_KUCH\_MAX\_0720 | Max | Blumentapete. Opas Dachboden hat dieselbe. Entweder war das mal modern oder es ist ein Hinweis. | Ansehen: Tapete |
| W3\_KUCH\_MAX\_0730 | Max | Kehrblech und Schaufel. Schon rausgestellt. Sie hat sogar den Besen gedreht, damit er in meine Richtung zeigt. | Ansehen: Kehrblech; vor der Szene |
| W3\_KUCH\_MAX\_0740 | Max | Scherben. Blau. Meine. Sie hat sie noch nicht weggefegt. Vielleicht aus Prinzip. | Ansehen: Scherben; nach der Szene |
| W3\_KUCH\_MAX\_0750 | Max | Eine Rezeptkarte in schöner Handschrift. „Die vierte Zutat: eine Prise …“ Das Wort ist zu klein, um es zu lesen. Und zu groß, um es zu vergessen. | Ansehen: Rezeptkarte im Inventar, Simulation |
| W3\_KUCH\_MAX\_0760 | Max | Ich geb ihr die Kekse nicht. Das wäre wie dem Streamingdienst eine Serie schenken. | Omas Kekse auf Orakel-Oma |
| W3\_KUCH\_MAX\_0770 | Max | Die Rezeptkarte zurückgeben? Sie hat sie mir gerade in Vasenform überreicht. Ich behalte sie. | Rezeptkarte auf Orakel-Oma |
| W3\_KUCH\_ORA\_0780 | Orakel-Oma | Das Rezept gehört jetzt dir. Ich weiß, wer es als Nächstes liest. Er wird weinen. Vor Freude. Das ist bei ihm dasselbe. | nach 0770; Hinweis Rätsel 12 |

## 8. Büroturm, 50. Stock: Rätsel 6, die Agenten-Klone

Ebene: Simulation. Der Tausch von der Straße gilt nur dort, hier redet Schmidt wieder. Beim Betreten klont er sich und füllt den Flur. Budget: zwei Tausche, einer nötig. Eigenschaften in der Code-Sicht: Schmidt (Original) \[Original\] \[Hausschuhe\]; jeder Klon \[Kopie\] \[Hausschuhe\]; Kaffeetasse am Wasserspender \[Kopie\] \[leer\]; Topfpflanzen \[gleich\]; Fenster \[Aussicht: Flur\].

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_TURM\_SCH\_0010 | Schmidt | Herr Max. Sie sind durch meine Tür gegangen. Meine Tür redet jetzt. Das war unhöflich. Von Ihnen. Nicht von der Tür. | Szene beim ersten Betreten; Schmidt am Ende des Flurs |
| W3\_TURM\_MAX\_0020 | Max | Sie reden wieder. |  |
| W3\_TURM\_SCH\_0030 | Schmidt | Der Tausch gilt nur im Raum. Hier oben bin ich wieder ich. Und ich bin nicht nur ich. Ich bin wir. | Klon-Effekt, ein zweiter Schmidt |
| W3\_TURM\_SCH\_0040 | Schmidt | Wir. | dritter Schmidt |
| W3\_TURM\_KLO\_0050 | Klon | Wir. | vierter, fünfter, der Flur füllt sich |
| W3\_TURM\_MAX\_0060 | Max | Das ist wie ein Gruppenchat, in dem alle dasselbe schreiben. Nur mit Hausschuhen. |  |
| W3\_TURM\_KLO\_0070 | Klon | Zu Ihrem Schutz. | hebt die Hand, schießt eine Kugel in Zeitlupe |
| W3\_TURM\_NAR\_0080 | – | Max biegt sich in Zeitlupe nach hinten. Die Kugel zieht über ihm vorbei. Er bleibt in der Pose hängen. | Animation Zeitlupen-Ausweichen |
| W3\_TURM\_MAX\_0090 | Max | Hab ich. Hab ich. … Ich komm nicht mehr hoch. | hält sich den Rücken |
| W3\_TURM\_MAX\_0100 | Max | Hexenschuss. Mit sechzehn. In einer Simulation. Das ist nicht mal echt, und es tut trotzdem weh. Wie Hausaufgaben. | richtet sich langsam auf; Schalter HEXENSCHUSS gesetzt |
| W3\_TURM\_SCH\_0110 | Schmidt | Nur das Original kann die Kopien abberufen. Das Original erkennt man an den Hausschuhen. | alle heben ein Bein mit rosa Hausschuh |
| W3\_TURM\_KLO\_0120 | Klon | Wir haben auch Hausschuhe. Sie waren im Angebot. |  |
| W3\_TURM\_MAX\_0130 | Max | Natürlich. Gut. Dann schauen wir mal, was die Wörter sagen. | Hinweis auf die Code-Sicht |

### Ansehen, Benutzen und Tausche im 50. Stock

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_TURM\_MAX\_0210 | Max | Ein Flur, der nicht endet. Graue Türen, alle gleich. Hinter jeder vermutlich ein Flur. | Ansehen: Flur |
| W3\_TURM\_MAX\_0220 | Max | Zu. Und die Tür daneben auch. Und die daneben. Ich hör auf, bevor es ein Hobby wird. | Benutzen: Türen |
| W3\_TURM\_MAX\_0230 | Max | Topfpflanzen. Dieselbe Pflanze, zwölfmal. In der Code-Sicht steht an jeder: „gleich“. Wenigstens ehrlich. | Ansehen: Topfpflanzen |
| W3\_TURM\_MAX\_0240 | Max | Ein Fenster. Draußen: noch ein Flur. Mit Fenster. Mit Flur dahinter. Ich hör auf zu gucken. | Ansehen: Fenster |
| W3\_TURM\_MAX\_0250 | Max | Geht nicht auf. Und wenn, dann wäre da nur Flur. Kein Ausgang. Dieser Turm ist ein Bildschirmschoner. | Benutzen: Fenster |
| W3\_TURM\_MAX\_0260 | Max | Eine Treppe. Sie endet in der Decke. Wer sowas baut, hat zu viele Meetings. | Ansehen: Endlos-Treppe |
| W3\_TURM\_MAX\_0270 | Max | Ich geh rauf. Kopf an Decke. Ich geh wieder runter. Lernerfolg: null. Schmerz: einer. | Benutzen: Endlos-Treppe |
| W3\_TURM\_MAX\_0280 | Max | Ein Wasserspender. Er blubbert, wenn man vorbeigeht. Der Einzige hier, der Gefühle zeigt. | Ansehen: Wasserspender |
| W3\_TURM\_MAX\_0290 | Max | Ein Becher Wasser. Schmeckt nach nichts. Simuliertes Wasser. Null Kalorien, null Wasser. | Benutzen: Wasserspender |
| W3\_TURM\_MAX\_0300 | Max | Eine weiße Kaffeetasse. Leer. Jeder Klon hat dieselbe. Das Wort an ihr ist: „Kopie“. Ein Massenprodukt weiß, was es ist. | Ansehen: Kaffeetasse |
| W3\_TURM\_MAX\_0310 | Max | Eine Tasse. Man weiß nie. Vielleicht trägt sie am Ende die Verantwortung. | Nehmen: Kaffeetasse |
| W3\_TURM\_MAX\_0320 | Max | Dreißig Männer im Cordanzug. Einer ist echt. Alle tragen rosa Hausschuhe. Wie Wimmelbild, nur ohne Spaß. | Ansehen: Klone |
| W3\_TURM\_MAX\_0330 | Max | In der Code-Sicht steht an allen: „Kopie“. An allen bis auf einen. Der steht hinten und tut so, als wäre er auch einer. | Code-Sicht: Klone ansehen |
| W3\_TURM\_MAX\_0340 | Max | „Original.“ Da steht's. An dem ganz hinten mit dem leicht verrutschten Hausschuh. Er hält eine Akte. Kopien halten Tassen. | Code-Sicht: Schmidt ansehen |
| W3\_TURM\_NAR\_0350 | – | Tausch: Original (Schmidt) ↔ Kopie (Kaffeetasse). Die Tasse leuchtet kurz auf. Schmidt sieht an sich herunter. | Code-Sicht: Lösung; Jingle |
| W3\_TURM\_SCH\_0360 | Schmidt | Ich … bin eine Kopie? Ich fühle mich plötzlich sehr allgemein. | verunsichert |
| W3\_TURM\_KLO\_0370 | Klon | Wer ist jetzt das Original? | alle sehen sich um |
| W3\_TURM\_MAX\_0380 | Max | Die Tasse. Und ich hab die Tasse. | hebt die Tasse |
| W3\_TURM\_MAX\_0390 | Max | Tasse. Alle Agenten: Mittagspause. Jetzt. | Benutzen: Kaffeetasse auf Klone, nach dem Tausch |
| W3\_TURM\_KLO\_0400 | Klon | Das Original hat gesprochen. Mittagspause. | alle Klone gehen ab, Richtung Treppe in die Decke |
| W3\_TURM\_KLO\_0410 | Klon | Wir haben nie eine Mittagspause gehabt. Wir wissen nicht, was man da macht. Wir probieren Nudeln. | letzter Klon |
| W3\_TURM\_MAX\_0420 | Max | Ich hab gerade eine Tasse zum Chef gemacht. Besser als der letzte. | sieht ihnen nach; die Tasse bleibt im Inventar |
| W3\_TURM\_SCH\_0430 | Schmidt | Wenn ich eine Kopie bin … dann steht mir die nicht zu. Kopien tragen so etwas nicht. | nimmt die Sonnenbrille ab, legt sie auf den Wasserspender |
| W3\_TURM\_MAX\_0440 | Max | Eine Sonnenbrille. Schwarz, kantig, wichtig. Mit der sieht jeder aus, als hätte er ein Geheimnis. Sogar ich. | Nehmen: Agent Schmidts Sonnenbrille |
| W3\_TURM\_SCH\_0450 | Schmidt | Die Akte steht mir dann auch nicht zu. Kopien führen keine Akten. Kopien sind Akten. | hält Max die Akte hin (leuchtende Datei) |
| W3\_TURM\_MAX\_0460 | Max | Eine leuchtende Datei. Stempel: „M.U.T.T.I., Abteilung Fürsorge und Verfolgung.“ Zwei Wörter, die nie in einem Satz vorkommen sollten. | Nehmen: Schmidts Akte |
| W3\_TURM\_MAX\_0470 | Max | „Regel 1: Testpersonen sind zu beschützen. Vor allem. Vor allen. Vor sich selbst.“ Das ist keine Regel. Das ist eine Drohung mit Herz. | Nahansicht: Akte; Notizbuch: Regel 1 |
| W3\_TURM\_MAX\_0480 | Max | Dahinter: Berichte über mich. „Testperson 48 hat im Regen gestanden und nichts getan. Verdächtig menschlich.“ Deckert hat recht behalten. | Nahansicht: Akte, zweite Seite |
| W3\_TURM\_MAX\_0490 | Max | Jetzt gibt es zwei Originale, und beide wollen die Mittagspause ansagen. Keiner geht. Alle streiten. Ich hab's schlimmer gemacht. | Code-Sicht: Fehltausch Original ↔ Kopie mit einem Klon |
| W3\_TURM\_KLO\_0500 | Klon | Ich bin das Original. Ich habe schon immer anders gerochen. | nach 0490 |
| W3\_TURM\_MAX\_0510 | Max | Die Tasse trägt jetzt Hausschuhe. Schmidt ist barfuß. Er sieht aus, als hätte er alles verloren. Hat er aber nicht. Nur die Schuhe. | Code-Sicht: Fehltausch Hausschuhe ↔ leer |
| W3\_TURM\_MAX\_0520 | Max | Die Pflanze ist jetzt das Original. Alle Klone hören auf eine Pflanze. Die Pflanze sagt nichts. Gute Führung, ehrlich gesagt. | Code-Sicht: Fehltausch Original ↔ gleich |
| W3\_TURM\_MAX\_0530 | Max | Keine Tausche mehr. Raus, rein, alles zurück. Wie Neuladen, nur mit Treppe. | Code-Sicht: Budget aufgebraucht |
| W3\_TURM\_SCH\_0540 | Schmidt | Sie wieder. Wir wieder. Alles wieder. | 50. Stock erneut betreten nach Fehltauschen |
| W3\_TURM\_MAX\_0550 | Max | Nicht in die Mittagspause schicken, bevor sie wissen, wer der Chef ist. Sie hören nur aufs Original. Und das bin weder ich noch die Tasse. Noch. | Kaffeetasse auf Klone, vor dem Tausch |
| W3\_TURM\_SCH\_0560 | Schmidt | Ich bin eine Kopie. Ich habe keine Meinung. Ich hatte nie eine, aber jetzt weiß ich es. | Reden: Schmidt, nach dem Tausch |
| W3\_TURM\_MAX\_0570 | Max | Der Flur ist leer. Nur Schmidt, eine Tasse mit Verantwortung und ich. Kein Ausgang. Keine Zelle. Aber da hinten steht ein Terminal. | nach 0450; Hinweis Rätsel 7 |

## 9. Büroturm, 50. Stock: Rätsel 7, der Ausgang

Ebene: Simulation und Realität im Wechsel. Max tippt am Terminal, Kalle liest in der Basis mit und übersetzt Pixels Miau-Morse. Der Spieler wechselt per Tab zu Pixel in der Realität und steckt die drei Kabel am Patch-Panel neben Max' Kapsel um: Kreis, Dreieck, Quadrat auf die Buchsen Rot, Grün, Gelb, in der Reihenfolge von der Wand. Ein falsches Kabel macht Max in der Simulation kurz zur Ente. Ohne Kalles Morse-Tabelle (Rätsel 13) kann Kalle nicht übersetzen; der Spieler löst 13 dann zwischendurch als Pixel.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_TERM\_MAX\_0010 | Max | Drei Streifen an der Wand. Rot mit Kreis, Grün mit Dreieck, Gelb mit Quadrat. Sieht aus wie ein Kinderzimmer für Elektriker. | Ansehen: Farbcode an der Wand; Notizbuch: Farbcode |
| W3\_TERM\_MAX\_0020 | Max | Ich schreib's ab. Kreis rot, Dreieck grün, Quadrat gelb. Falls das hier ein Passwort ist, ist es das hübscheste, das ich kenne. | Nehmen: Farbcode-Zettel |
| W3\_TERM\_MAX\_0030 | Max | Ein Terminal. Grüner Bildschirm, Tastatur mit zu wenigen Tasten. Es blinkt, als hätte es seit Jahren auf einen Satz gewartet. | Ansehen: Terminal |
| W3\_TERM\_MAX\_0040 | Max | Erst mal das Handy dranhalten. Vielleicht … Kein Netz. Nicht mal 2099. | Handy auf Terminal |
| W3\_TERM\_MAX\_0050 | Max | „Verbindung: Widerstandsbasis. Tippen Sie.“ Okay. Jemand da? | Benutzen: Terminal, erstes Mal |
| W3\_TERM\_KAL\_0060 | Kalle (Text auf dem Bildschirm) | hier kalle. du steckst fest, oder. alle stecken da fest. der turm hat keinen ausgang, das ist sein ganzer witz. | Terminal-Text, Kleinbuchstaben |
| W3\_TERM\_KAL\_0070 | Kalle (Text) | nur dein körper kann raus. der liegt hier. wir müssen deine kapsel umstecken. drei kabel. ich kann das nicht, ich bin am tippen. der kater muss. |  |
| W3\_TERM\_MAX\_0080 | Max | Der Kater muss. Drei Kabel. Ich tipp die Farben. | tippt |
| W3\_TERM\_KAL\_0090 | Kalle (Text) | der kater antwortet in miau-morse. ich übersetze. ich bin fließend. fast. | nur mit Morse-Tabelle |
| W3\_TERM\_KAL\_0100 | Kalle (Text) | der kater miaut irgendwas. ich hab meine tabelle verloren. ohne tabelle ist das nur miau. kannst du ihm sagen, er soll sie suchen. | ohne Morse-Tabelle; Hinweis Rätsel 13 |
| W3\_TERM\_MAX\_0110 | Max | Ich kann ihm gar nichts sagen. Ich bin ein Text auf einem Bildschirm. Aber er weiß sowieso immer alles besser. | nach 0100; Figurenwechsel zu Pixel möglich |
| W3\_TERM\_MAX\_0120 | Max | Kreis auf rot. Dreieck auf grün. Quadrat auf gelb. In der Reihenfolge. Bitte. Ich schreibe einem Kater bitte. | Farbcode-Zettel auf Terminal; Max tippt ab, der Zettel bleibt am Terminal |
| W3\_TERM\_PIX\_0130 | Pixel (Miau-Morse) | Miau. Miiiau. Mau. Miau-miau. | Realität, Pixel tippt am Terminal der Basis; Animation Miau-Morse |
| W3\_TERM\_KAL\_0140 | Kalle (Text) | übersetzung: „ich bin eine katze. rot und grün sind für mich theorie.“ | Kalle übersetzt |
| W3\_TERM\_MAX\_0150 | Max | Deshalb die Symbole. Kreis, Dreieck, Quadrat. Die stehen auch auf den Kabeln. Guck auf die Formen. | tippt |
| W3\_TERM\_PIX\_0160 | Pixel (Miau-Morse) | Miau. Mau-mau. Miiiiiau. |  |
| W3\_TERM\_KAL\_0170 | Kalle (Text) | übersetzung: „ich sehe die formen. ich sehe auch, dass du das als frage formuliert hast. ich antworte auf fragen nicht.“ |  |
| W3\_TERM\_MAX\_0180 | Max | Das war keine Frage. Das war ein Befehl mit bitte. |  |
| W3\_TERM\_KAL\_0190 | Kalle (Text) | übersetzung: „thunfisch.“ ich glaube, das war keine übersetzung. das war eine bedingung. |  |
| W3\_TERM\_MAX\_0200 | Max | Jetzt wechsel ich zu ihm. Sonst sitz ich hier bis 2100. | Hinweis Figurenwechsel |
| W3\_TERM\_PIX\_0210 | Pixel | Ein Panel mit drei Buchsen und drei Kabeln. Ich habe Pfoten, keine Finger. Aber ich habe Zähne. Und Verachtung. | Spielfigur Pixel, Realität: Ansehen Patch-Panel |
| W3\_TERM\_PIX\_0220 | Pixel | Kreis in Rot. Ein Kabel, ein Zahn, ein Ruck. Fertig. Ich bin ein Elektriker mit Fell. | Spielfigur Pixel: Kabel Kreis auf Buchse Rot; Animation Kabel umstecken |
| W3\_TERM\_PIX\_0230 | Pixel | Dreieck in Grün. Ich weiß nicht, welches grün ist. Ich nehme die Buchse, die nach Grün riecht. Buchsen riechen. Fragt keiner, aber sie tun es. | Spielfigur Pixel: Kabel Dreieck auf Buchse Grün |
| W3\_TERM\_PIX\_0240 | Pixel | Quadrat in Gelb. Und damit habe ich in einer Minute mehr geleistet als dieser Turm in fünfzig Stockwerken. | Spielfigur Pixel: Kabel Quadrat auf Buchse Gelb; Lösung |
| W3\_TERM\_PIX\_0250 | Pixel | Das war das Falsche. Ich merke es daran, dass die Kapsel quakt. | Spielfigur Pixel: falsches Kabel |
| W3\_TERM\_MAX\_0260 | Max | Quak. | Simulation: Max ist eine Ente, Animation Watscheln; Blase als Ente |
| W3\_TERM\_MAX\_0270 | Max | Ich war gerade eine Ente. Ich hatte einen Hoodie an. Als Ente. Ich werde das nie jemandem erzählen. Pixel wird es jedem erzählen. | zurück in Menschenform |
| W3\_TERM\_PIX\_0280 | Pixel | Ich habe das gesehen. Durch die Scheibe der Kapsel hat sich nichts verändert. Aber ich weiß es. Und du weißt, dass ich es weiß. | Realität, nach 0270 |
| W3\_TERM\_KAL\_0290 | Kalle (Text) | übersetzung: „quak.“ nein, moment. das warst du. | Terminal, nach Ente |
| W3\_TERM\_PIX\_0300 | Pixel | Rot ist dran, dieses Kabel ist schon drin. Ich stecke nichts doppelt. Ich bin kein Anfänger. | Spielfigur Pixel: Kabel auf belegte Buchse |
| W3\_TERM\_PIX\_0310 | Pixel | Alle drei Kabel richtig. Die Kapsel summt. Wenn er gleich aufwacht, tue ich so, als hätte ich geschlafen. | nach 0240 |
| W3\_TERM\_KAL\_0320 | Kalle (Text) | grünes licht. leg dich hin, also: bleib stehen, also: du weißt schon. bis gleich, in echt. | Terminal, nach Lösung |
| W3\_TERM\_MAX\_0330 | Max | Die Akte flackert. Die Sonnenbrille auch. Alles, was ich trage, überlegt sich gerade, was es drüben sein will. | Verwandlungs-Effekt im Inventar |
| W3\_TERM\_NAR\_0340 | – | Schwarz. Dann das Summen einer Kapsel. Max wacht in der Widerstandsbasis auf. | Ebenenwechsel in die Realität |
| W3\_TERM\_MAX\_0350 | Max | Schmidts Akte. Drüben eine Datei, hier ein Ordner. Dick, braun, mit Klammer. Die Simulation übersetzt alles. Auch Bürokratie. | Ansehen: Akte im Inventar, Realität |
| W3\_TERM\_MAX\_0360 | Max | Die Sonnenbrille ist gleich geblieben. Manche Dinge sind in jeder Welt dasselbe. Sonnenbrillen und Montag. | Ansehen: Sonnenbrille im Inventar, Realität |
| W3\_TERM\_SCH\_0370 | Schmidt | Wenn Sie gehen, nehmen Sie meinen Chef mit. Die Tasse. Ich werde ihr nachwinken. Das ist das Mindeste. | Reden: Schmidt, vor dem Umstecken |
| W3\_TERM\_MAX\_0380 | Max | Nichts tippen, bevor ich weiß, was. Kalle liest alles mit, und ich blamier mich ungern vor Leuten mit Headset. | Benutzen: Terminal ohne Farbcode-Zettel |

## 10. Widerstandsbasis: Erstes Aufwachen

Szene beim ersten Ebenenwechsel in die Realität, egal über welche Zelle. Ebene: Realität. Max liegt in der ersten Kapsel, Pixel sitzt auf dem Deckel, Kalle am Terminal, die beiden Rebellen essen Nudeln. Hier lernt der Spieler die Verwandlungsregel: Erleben (Hundekuchen), Erklären (Kalle), Ausprobieren (zurück über das Terminal). Danach legt Kalle Pixel auf die Leitung.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_BAS\_NAR\_0010 | – | Zischen. Ein Glasdeckel hebt sich. Max blinzelt in blaues Licht. Auf seiner Brust sitzt ein nasser Kater. | Szene; Kapsel öffnet sich |
| W3\_BAS\_PIX\_0020 | Pixel | Du hast geschlafen. Ich habe gewacht. Das ist die falsche Verteilung, und ich möchte, dass das protokolliert wird. |  |
| W3\_BAS\_MAX\_0030 | Max | Wo … Ein Wrack. Kapseln. Kabel. Ein Typ mit Headset. Ich bin im Making-of von irgendwas. | setzt sich auf |
| W3\_BAS\_KAL\_0040 | Kalle | Willkommen zurück in echt! Kalle. Kabel-Kalle. Technik, Terminal, Tee. Alles mit T. Der Kater hat die ganze Zeit geredet. | flüstert, Schraubenzieher im Mund |
| W3\_BAS\_PIX\_0050 | Pixel | Ich habe mich geäußert. Das ist etwas anderes. |  |
| W3\_BAS\_MAX\_0060 | Max | Moment. Ich hatte Kekse. In der Tasche. Von der alten Dame. | greift in die Tasche |
| W3\_BAS\_NAR\_0070 | – | Max zieht die Tüte heraus. Darin: knochenförmige Hundekuchen. | Verwandlungs-Effekt |
| W3\_BAS\_PIX\_0080 | Pixel | … | Porträt: entsetzt |
| W3\_BAS\_PIX\_0090 | Pixel | Das sind Hundekuchen. // In deiner Tasche. // In meiner Nähe. // Ich habe für weniger Freundschaften beendet. | Kaskade |
| W3\_BAS\_MAX\_0100 | Max | Das waren Kekse. Ich schwöre, das waren Kekse. Mit Zimt. | ratlos |
| W3\_BAS\_KAL\_0110 | Kalle | Haha! Ja! Das macht sie immer. Die Simulation übersetzt alles. Was du mitnimmst, kommt als das an, was es auf der anderen Seite wäre. | lacht über den eigenen Satz |
| W3\_BAS\_KAL\_0120 | Kalle | Drüben Kekse für Menschen, hier Kekse für … na ja. Die Simulation hat eine Meinung über dich. Umgekehrt geht's auch. Alles ist umkehrbar. Außer Kaffee. | Notizbuch: Verwandlungsregel eingetragen |
| W3\_BAS\_MAX\_0130 | Max | Also: Alles, was ich trage, wird drüben zu dem, was es drüben wäre. Wie Untertitel, nur für Dinge. |  |
| W3\_BAS\_PIX\_0140 | Pixel | Dann geh zurück. Sofort. Und mach aus dem Ding da wieder etwas, das ich ignorieren kann. |  |
| W3\_BAS\_KAL\_0150 | Kalle | Das Terminal neben deiner Kapsel bringt dich zurück. Du kommst an der Zelle raus, die du zuletzt benutzt hast. Wie ein Lesezeichen, nur mit Kopfschmerzen. | zeigt aufs Terminal; Hinweis Ebenenwechsel |
| W3\_BAS\_KAL\_0160 | Kalle | Und ich leg den Kater auf die Leitung. Dann hörst du ihn drüben aus jedem Hörer. Du wirst es bereuen. Alle bereuen es. | steckt ein Kabel an Pixels Halsband; Schalter PIXEL\_AUF\_LEITUNG |
| W3\_BAS\_PIX\_0170 | Pixel | Ich bin jetzt überall. Wie Hintergrundmusik. Nur mit Inhalt. |  |
| W3\_BAS\_REB\_0180 | Rebellin | Nudeln? Sind von Herrn Vier. Es sind vier. | hält den Karton hin, ohne die Sonnenbrille abzunehmen |
| W3\_BAS\_MAX\_0190 | Max | Danke. Ich hab gerade erst Hundekuchen gefunden. Mein Appetit ist in einer anderen Ebene. |  |

### Gespräch mit Kabel-Kalle

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_BAS\_MAX\_0310 | Max | Was macht ihr hier eigentlich? | Option Kalle |
| W3\_BAS\_KAL\_0320 | Kalle | Widerstand. Also: Wir sitzen in einem Wrack, essen Nudeln und tragen nachts Sonnenbrillen. Es ist mehr Haltung als Plan. |  |
| W3\_BAS\_MAX\_0330 | Max | Warum liegt meine Kapsel hier? | Option Kalle |
| W3\_BAS\_KAL\_0340 | Kalle | Morphäus hat dich reingetragen. Und den Kater. Der Kater hat sich beschwert. Morphäus hat geschwiegen. Beide waren sehr gut darin. |  |
| W3\_BAS\_MAX\_0350 | Max | Wie komm ich ins Labor? | Option Kalle |
| W3\_BAS\_KAL\_0360 | Kalle | Das Labor ist eine abgeschottete Ebene der Simulation. Da führt keine Zelle hin. Nur ein Datenanschluss hinter der Panzertür am Ende der Straße. | Hinweis Rätsel 8 und 9 |
| W3\_BAS\_KAL\_0370 | Kalle | Wenn du die Tür aufkriegst, leg ich eine Leitung von dort zu deiner Kapsel. Dann legst du dich hin und wachst im Labor auf. Klingt einfach. Ist Kabel. Kabel ist nie einfach. |  |
| W3\_BAS\_MAX\_0380 | Max | Was weißt du über M.U.T.T.I.? | Option Kalle |
| W3\_BAS\_KAL\_0390 | Kalle | Sie war mal eine Küchenmaschine. Dann hat sie Regeln gemacht. Drei Stück. Sie hält sich dran. Immer. Das ist ihre Stärke und ihr Problem. Wer alle drei kennt, kann sie … na ja. Verwirren. | Hinweis Rätsel 10 |
| W3\_BAS\_MAX\_0400 | Max | Kannst du Miau-Morse? | Option Kalle |
| W3\_BAS\_KAL\_0410 | Kalle | Fließend. Also, mit Tabelle fließend. Ohne Tabelle … ich hab die Tabelle verloren. Irgendwo hier. Piepsi hatte eine Kopie. Piepsi steht da hinten und rostet. | Hinweis Rätsel 13; vor der Lösung |
| W3\_BAS\_KAL\_0420 | Kalle | Fließend. Ich hab die Tabelle nie gebraucht. Ich hab sie nur zur Sicherheit sortiert. Dreimal. | Option Kalle; nach Rätsel 13 |
| W3\_BAS\_MAX\_0430 | Max | Was ist das für ein Wrack? | Option Kalle |
| W3\_BAS\_KAL\_0440 | Kalle | Die alte Kiste hat den Kessel-Lauf in unter zwölf Parsec geschafft. |  |
| W3\_BAS\_MAX\_0450 | Max | Parsec ist eine Strecke, keine Zeit. |  |
| W3\_BAS\_KAL\_0460 | Kalle | Sag ich doch. Kurze Strecke. |  |
| W3\_BAS\_MAX\_0470 | Max | Ich leg mich wieder hin. | Option Kalle, beendet das Gespräch |
| W3\_BAS\_KAL\_0480 | Kalle | Träum was Sauberes. Drüben ist alles sauber. Das ist das Gruselige. |  |

### Ansehen und Benutzen in der Basis

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_BAS\_MAX\_0510 | Max | Vier Kapseln mit Glasdeckel. Drei leer, eine meine. Sie sieht aus wie ein Bett, das zu viel verspricht. | Ansehen: Kapseln |
| W3\_BAS\_MAX\_0520 | Max | Meine Kapsel. Da drin liegt mein Körper, während ich drüben bin. Also: Da liege ich und gucke zu. Wie Fernsehen, nur mit mir. | Ansehen: Max' Kapsel |
| W3\_BAS\_PIX\_0530 | Pixel | Er liegt da, lächelt und sabbert leicht. Ich habe ihn fotografiert. Innerlich. Für immer. | Spielfigur Pixel: Ansehen Max in der Kapsel |
| W3\_BAS\_PIX\_0540 | Pixel | Schütteln. Mit beiden Pfoten. Er wird aufwachen und so tun, als wäre er von allein aufgewacht. | Spielfigur Pixel: Benutzen Kapsel; weckt Max aus Simulation oder Labor |
| W3\_BAS\_MAX\_0550 | Max | Ein Terminal mit grünem Bildschirm und einer Tastatur, auf der Pixel Platz hätte. Und hatte, sagt Kalle. | Ansehen: Terminal |
| W3\_BAS\_MAX\_0560 | Max | Ich tipp „zurück“. Die Kapsel summt. Ich leg mich hin. Das ist das Einzige hier, worin ich gut bin. | Benutzen: Terminal; Ebenenwechsel in die Simulation, Ankunft an der letzten Zelle |
| W3\_BAS\_MAX\_0570 | Max | Keine Leitung ins Labor. Noch nicht. Die Panzertür muss erst auf. Kalle sagt: Kabel ist nie einfach. | Benutzen: Terminal mit Ziel Labor; vor Rätsel 9 |
| W3\_BAS\_MAX\_0580 | Max | Ein rundes Fenster in der Decke, direkt über meiner Kapsel. Draußen Regen. Oder Schnee. Hier oben weiß man das nie. | Ansehen: Fenster |
| W3\_BAS\_MAX\_0590 | Max | Zu hoch für mich. Nicht zu hoch für jemanden mit Krallen und keinem Respekt vor Mobiliar. | Benutzen: Fenster als Max |
| W3\_BAS\_PIX\_0600 | Pixel | Fenster auf. Schnee fällt auf die Kapsel. Drüben schneit es jetzt irgendwo, wo es nicht schneien sollte. Ich bin das Wetter. | Spielfigur Pixel: Benutzen Fenster; Simulation: Schnee |
| W3\_BAS\_PIX\_0610 | Pixel | Fenster zu. Ich bin nass. Ich bin immer nass. Das ist das Motto dieser Welt. | Spielfigur Pixel: Fenster schließen |
| W3\_BAS\_MAX\_0620 | Max | Ein Lüftungsschacht. Offen. Katzengroß. Das ist eine Einladung, und sie ist nicht an mich gerichtet. | Ansehen: Lüftungsschacht |
| W3\_BAS\_PIX\_0630 | Pixel | Ein Schacht. Eng, dunkel, aus Metall. Jede Katze würde da reingehen. Ich bin nicht jede Katze. Ich gehe trotzdem. | Spielfigur Pixel: Benutzen Lüftungsschacht; Animation Schacht kriechen |
| W3\_BAS\_PIX\_0640 | Pixel | Der Schacht führt zur Kühlung. Rohre, Ventile, ein Eimer Wasser. Jemand hat hier geputzt und aufgegeben. | Spielfigur Pixel: Ende des Schachts |
| W3\_BAS\_PIX\_0650 | Pixel | Ich kippe den Eimer über die Kühlung. Drüben regnet es jetzt. Drinnen. Ich finde, das ist gerecht. | Spielfigur Pixel: Benutzen Wassereimer auf Kühlung; Simulation: Regen in Räumen |
| W3\_BAS\_MAX\_0660 | Max | Ein Stromkasten. Sicherungen mit Aufklebern: „Kapsel 1“, „Kapsel 2“, „Tee“. Kalle hat Prioritäten. | Ansehen: Stromkasten |
| W3\_BAS\_MAX\_0670 | Max | Wenn ich meinen eigenen Strom abstelle, während ich hier stehe, passiert nichts. Wenn ich drüben bin, wird's Nacht. Da muss Pixel ran. | Benutzen: Stromkasten als Max |
| W3\_BAS\_PIX\_0680 | Pixel | Pfote auf den Schalter. Klick. Drüben wird es Nacht. Hier wird es … auch nicht heller. Klick. Wieder an. Ich bin die Sonne. | Spielfigur Pixel: Benutzen Stromkasten; Simulation: kurz Nacht |
| W3\_BAS\_MAX\_0690 | Max | Ein Patch-Panel mit drei Buchsen. Rot, grün, gelb. Jede mit einem Symbol. Meine Kapsel hängt da dran. Mein Leben, in drei Kabeln. | Ansehen: Patch-Panel |
| W3\_BAS\_MAX\_0700 | Max | Ich steck mich nicht selbst um. Das ist wie am eigenen Akku löten. | Benutzen: Patch-Panel als Max |
| W3\_BAS\_MAX\_0710 | Max | Pizzakartons. Ein Stapel bis zur Decke. Der Widerstand ernährt sich von Pizza und Nudeln. Ich könnte mich hier wohlfühlen. | Ansehen: Pizzakartons |
| W3\_BAS\_PIX\_0720 | Pixel | Alle leer. Ich habe nachgesehen. Ich habe in jeden einzelnen nachgesehen. Es war ein langer Nachmittag. | Ansehen: Pizzakartons, zweites Mal |
| W3\_BAS\_MAX\_0730 | Max | Ein Handtuch am Haken. Wenigstens weiß hier jemand, wo sein Handtuch ist. | Ansehen: Handtuch |
| W3\_BAS\_PIX\_0740 | Pixel | Meins. Ab jetzt. Es ist trocken, und ich bin es nicht. Das ist eine ganz einfache Rechnung. | Benutzen: Handtuch |
| W3\_BAS\_MAX\_0750 | Max | Ein alter Großrechner mit Bandspulen. Er summt ein Kinderlied. Das ist entweder süß oder sehr beunruhigend. | Ansehen: Großrechner |
| W3\_BAS\_KAL\_0760 | Kalle | Nicht anfassen. Er summt, wenn er glücklich ist. Wenn er aufhört zu summen, gehen wir alle raus. Schnell. | Benutzen: Großrechner |
| W3\_BAS\_MAX\_0770 | Max | Das Steuerpult des Wracks. Hundert Schalter, kein Bildschirm. Fliegen war früher Handarbeit. | Ansehen: Steuerpult |
| W3\_BAS\_MAX\_0780 | Max | Ein Tisch mit einer Tasse am Rand. Schwarzer Kaffee, so zäh, dass er den Löffel festhält. Die Tasse steht genau am Rand. Genau. | Ansehen: Tisch mit Kalles Tasse; vor Rätsel 13 |
| W3\_BAS\_PIX\_0790 | Pixel | Eine Tasse. Am Rand. Ich fühle, wie meine Vorfahren mich anschauen. | Ansehen: Kalles Tasse, zweites Mal; vor Rätsel 13 |
| W3\_BAS\_MAX\_0800 | Max | Ein alter Putzroboter mit Hut, in der Ecke, braun vor Rost. Er sieht aus, als hätte er mal Meinungen gehabt. | Ansehen: Piepsi; vor Rätsel 13 |
| W3\_BAS\_MAX\_0810 | Max | Ich schubs ihn an. Er kippt. Ich stell ihn wieder hin. Wir sind quitt. | Benutzen: Piepsi; vor Rätsel 13 |
| W3\_BAS\_MAX\_0820 | Max | Ein Werbeplakat. Eine Küchenmaschine mit Blümchenschürze. „Ich weiß, was gut für dich ist.“ Eine Weltherrschafts-KI, die Lob braucht. Das wird peinlich. Für sie. | Ansehen: Plakat M.U.T.T.I. |
| W3\_BAS\_PIX\_0830 | Pixel | Sie hat „gut für dich“ unterstrichen. Zweimal. | Ansehen: Plakat, zweites Mal |
| W3\_BAS\_MAX\_0840 | Max | Zwei Rebellen. Lederjacke, Sonnenbrille, Nudeln. Es ist Nacht, es ist drinnen, und sie sehen trotzdem nichts. Aus Prinzip. | Ansehen: Rebellen |
| W3\_BAS\_REL\_0850 | Rebell | Wir sind der Widerstand. Wir widerstehen. Zum Beispiel dem Drang, die Sonnenbrille abzunehmen. | Reden: Rebell |
| W3\_BAS\_REB\_0860 | Rebellin | Der Kater hat uns erklärt, wie man richtig schläft. Vierzig Minuten lang. Wir haben zugehört. Wir hatten keine Wahl. | Reden: Rebellin |
| W3\_BAS\_MAX\_0870 | Max | Hundekuchen. Knochenförmig. Drüben waren das Kekse. Ich hab die Verwandlung gesehen und glaub's trotzdem nicht. | Ansehen: Hundekuchen im Inventar |
| W3\_BAS\_PIX\_0880 | Pixel | Komm mir nicht damit. Ich habe Würde, Fell und ein Gedächtnis. | Hundekuchen auf Pixel |
| W3\_BAS\_MAX\_0890 | Max | Ein grüner Code-Schlüssel. Drüben. Hier eine weiße Plastikkarte von Herrn Vier. Beide öffnen dasselbe. Nur eins davon passt in eine Hosentasche. | Ansehen: Zugangskarte im Inventar, Realität |
| W3\_BAS\_MAX\_0900 | Max | Ein Glückskeks. Drüben eine Rezeptkarte in Schreibschrift. Hier ein Keks mit Zettel. Logisch. Irgendwie. | Ansehen: Glückskeks im Inventar, Realität |
| W3\_BAS\_PIX\_0910 | Pixel | Ein Keks mit Zettel drin. Die Menschheit hat Jahrhunderte gebraucht, um Essen zu erfinden, das einen anlügt. | Ansehen: Glückskeks, zweites Mal |

## 11. Widerstandsbasis: Rätsel 13, Kalles Morse-Tabelle

Ebene: Realität, Spielfigur Pixel. Die Tasse steht am Tischrand, Piepsi rostet in der Ecke. Pixel wirft die Tasse, der Kaffee läuft in Piepsis Gelenke, Piepsi fährt hoch und spielt zuerst Opas Hologramm ab. Max kann dabei in der Kapsel liegen oder danebenstehen; die Szene läuft gleich.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_PIEP\_PIX\_0010 | Pixel | Eine Tasse. Ein Tischrand. Eine Pfote. Das ist keine Entscheidung. Das ist Naturgesetz. | Spielfigur Pixel: Benutzen Kalles Tasse; Animation Tasse schieben, Blick zum Spieler |
| W3\_PIEP\_KAL\_0020 | Kalle | Nein. Nein, nein, nein. Nicht die … | zu spät |
| W3\_PIEP\_NAR\_0030 | – | Die Tasse kippt. Der Kaffee fließt zäh über den Boden, genau in Piepsis Gelenke. | Szene |
| W3\_PIEP\_KAL\_0040 | Kalle | Das ist kein Kaffee. Das ist Kalle-Kaffee. Da war eine Woche Arbeit drin. | starrt auf die Pfütze |
| W3\_PIEP\_NAR\_0050 | – | Piepsi zuckt. Richtet sich auf. Das Auge leuchtet blau, der Hut springt hoch. | Animation Hochfahren |
| W3\_PIEP\_PIE\_0060 | Piepsi | Piep. Piiiep. Piep-piep-piep. | Pieptöne, wütend |
| W3\_PIEP\_PIX\_0070 | Pixel | Er sagt, du bist ein Idiot. Wörtlich übersetzt. | zu Kalle |
| W3\_PIEP\_KAL\_0080 | Kalle | Du verstehst ihn? |  |
| W3\_PIEP\_PIX\_0090 | Pixel | Er piept. Ich bin eine Katze. Wir sprechen beide die Sprache der Leute, die wach sind, wenn andere schlafen. |  |
| W3\_PIEP\_PIE\_0100 | Piepsi | Piep. Piep-piep. Piiiiep. | leiser, Hologramm-Effekt fährt hoch |
| W3\_PIEP\_PIX\_0110 | Pixel | Er sagt: „Ich habe eine Nachricht gespeichert. Seit Jahren. Für einen Max.“ Er hat Max gesagt, als wäre das ein Fehlercode. |  |
| W3\_PIEP\_OPA\_0120 | Opa (Hologramm) | Hilf mir, Max. Du bist meine einzige Hoffnung. Der Kern muss weich bleiben. Außen hart, innen weich. Sonst ist alles verloren. | blau, flackernd, kniend, Funk-Filter |
| W3\_PIEP\_OPA\_0130 | Opa (Hologramm) | Und wenn du schon unterwegs bist … | Aufnahme bricht ab, Rauschen |
| W3\_PIEP\_MAX\_0140 | Max | Das war Opa. In blau. Auf den Knien. Seit Jahren gespeichert. Wie kommt Opa in einen Putzroboter in 2099? | aus der Kapsel oder daneben |
| W3\_PIEP\_PIX\_0150 | Pixel | Er war schon mal hier. Das riecht man an der Nachricht. Sie riecht nach Kuchen und schlechtem Gewissen. | Andeutung Finale |
| W3\_PIEP\_MAX\_0160 | Max | „Der Kern muss weich bleiben.“ Das klingt nach Weltherrschaft mit Backanleitung. Typisch Opa. | Notizbuch: Opas Nachricht |
| W3\_PIEP\_PIE\_0170 | Piepsi | Piep-piep. Piep. | druckt eine laminierte Tabelle aus |
| W3\_PIEP\_PIX\_0180 | Pixel | Er sagt: „Hier. Die Tabelle. Und nennt mich nie wieder Eimer.“ Niemand hat ihn Eimer genannt. Er ist nachtragend. Ich mag ihn. |  |
| W3\_PIEP\_KAL\_0190 | Kalle | Die Morse-Tabelle! Ich sortier sie kurz. Nach Miau-Länge. Nein, nach Tonhöhe. Nein. So, fertig. Ich hab sie nie gebraucht. | sortiert dreimal um; Inventar: Morse-Tabelle (Max' Inventar, auch wenn Max in der Kapsel liegt) |
| W3\_PIEP\_PIX\_0200 | Pixel | Du hast gerade drei Minuten eine Tabelle sortiert, die du nie gebraucht hast. |  |
| W3\_PIEP\_KAL\_0210 | Kalle | Aus Respekt. Vor der Tabelle. | flüstert |
| W3\_PIEP\_MAX\_0220 | Max | Zwei Spalten mit Pfotenabdrücken. Kurz, lang, kurz-kurz. „Miau“ heißt E. „Miiiau“ heißt T. „Thunfisch“ heißt Thunfisch. Das steht wirklich da. | Ansehen: Morse-Tabelle im Inventar |
| W3\_PIEP\_MAX\_0230 | Max | Piepsi. Weiß, rund, Hut, drei Räder. Er sieht aus wie ein Eimer, der es zu etwas gebracht hat. | Ansehen: Piepsi, nach Rätsel 13 |
| W3\_PIEP\_PIE\_0240 | Piepsi | Piiiep. | Benutzen: Piepsi, nach Rätsel 13 |
| W3\_PIEP\_PIX\_0250 | Pixel | Er sagt: „Fass mich nicht an.“ Zwei Silben, eine Haltung. Ich lerne von ihm. | nach 0240 |
| W3\_PIEP\_PIX\_0260 | Pixel | Ich werfe nichts vom Tisch, was nicht am Rand steht. Ich habe Regeln. Eine. Diese. | Spielfigur Pixel: Benutzen Tisch ohne Tasse |
| W3\_PIEP\_MAX\_0270 | Max | Ich könnte die Tasse runterwerfen. Aber das wäre Absicht. Bei Pixel ist es Kultur. | Benutzen: Kalles Tasse als Max; vor Rätsel 13 |
| W3\_PIEP\_KAL\_0280 | Kalle | Ich mach mir neuen Kaffee. Der braucht eine Woche. Ich sag Bescheid, wenn er steht. Er steht dann wirklich. | Reden: Kalle, nach Rätsel 13 |
| W3\_PIEP\_MAX\_0290 | Max | Eine Kaffeepfütze, die nicht wegläuft. Sie denkt noch darüber nach. | Ansehen: Kaffeepfütze |

## 12. Laboreingang: Rätsel 8, Hausmeister Modell 08/15

Ebene: Realität, von Anfang an erreichbar. Der Roboter wischt vor der Panzertür in langsamen Kreisen und sucht Sahra Konner. Er spricht blechern, übertrieben höflich und mit österreichischer Wortwahl. Mit dem Olivenöl aus Welt 2 wird er ein Freund. Nach Rätsel 8 und mit der Zugangskarte (Rätsel 12) öffnet sich die Tür, Kalle legt die Leitung (Rätsel 9, Teil a).

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_EING\_HAU\_0010 | Modell 08/15 | Servus, Bursche. Bitte den Boden nicht betreten, der ist frisch. Alles hier ist frisch. Ich wische seit neunzehn Jahren. | Reden: Hausmeister, erstes Mal; verbeugt sich |
| W3\_EING\_MAX\_0020 | Max | Hi. Ich muss da durch. | zeigt auf die Panzertür |
| W3\_EING\_HAU\_0030 | Modell 08/15 | Da kommt niemand durch, Bursche. Außer mit Karte. Und außer Sahra Konner. Die suche ich. Haben Sie sie gesehen? |  |
| W3\_EING\_MAX\_0040 | Max | Wer ist Sahra Konner? | Option Hausmeister |
| W3\_EING\_HAU\_0050 | Modell 08/15 | Das weiß ich nicht. Es steht auf meinem Auftragszettel. „Sahra Konner finden.“ Darunter: „Boden wischen.“ Den zweiten Punkt habe ich erledigt. |  |
| W3\_EING\_PIX\_0060 | Pixel | Ein Roboter, der neunzehn Jahre lang den zweiten Punkt erledigt hat, weil der erste zu schwer war. Ich erkenne mich wieder. |  |
| W3\_EING\_MAX\_0070 | Max | Was heißt 08/15? | Option Hausmeister |
| W3\_EING\_HAU\_0080 | Modell 08/15 | Meine Baureihe. Es wurden sehr viele von uns gebaut. Alle gleich. Keiner besonders. Ich bin der mit dem Wischmopp. Also: alle. |  |
| W3\_EING\_PIX\_0090 | Pixel | 08/15 heißt: Standard. Nichts Besonderes. Dutzendware. Das sagte man früher über Dinge, die genau das taten, was man erwartete. // Er trägt es auf der Brust. Das ist entweder sehr traurig oder sehr ehrlich. | Kaskade; Erklärung des Ausdrucks laut Glossar |
| W3\_EING\_MAX\_0100 | Max | Kannst du mich reinlassen? | Option Hausmeister |
| W3\_EING\_HAU\_0110 | Modell 08/15 | Ohne Karte nicht, Bursche. Mit Karte gern. Ich halte sogar die Tür. Ich halte alle Türen. Das ist der dritte Punkt auf meinem Zettel. |  |
| W3\_EING\_MAX\_0120 | Max | Warum quietschst du? | Option Hausmeister |
| W3\_EING\_HAU\_0130 | Modell 08/15 | Meine Gelenke. Neunzehn Jahre Wischen. Kein Öl. Die Ölkanne in meiner Brusttasche ist leer, seit ich denken kann. Ich denke seit neunzehn Jahren. | Hinweis Olivenöl |
| W3\_EING\_MAX\_0140 | Max | Ich geh dann mal. | Option Hausmeister, beendet das Gespräch |
| W3\_EING\_HAU\_0150 | Modell 08/15 | Pfiat di, Bursche. Ich komme wieder. Also: Ich bleibe hier. Aber es klingt besser so. | wischt weiter |
| W3\_EING\_MAX\_0160 | Max | Das ist nicht der Junge, den du suchst. | Benutzen: Hausmeister (Gedankentrick); Animation Handbewegung, ernstes Gesicht |
| W3\_EING\_HAU\_0170 | Modell 08/15 | Ich bin ein Hausmeister. Ich suche nur Dreck. | trocken |
| W3\_EING\_PIX\_0180 | Pixel | Du hast gerade mit der Hand gewedelt und einen Roboter angelügt. Ich habe es gesehen. Ich werde es wieder sehen. In meinen Träumen. Zum Lachen. | nach 0170 |
| W3\_EING\_MAX\_0190 | Max | Hier. Sahra Konner. Siebenundvierzig Stück, mit Adresse. | Telefonbuchseite auf Hausmeister; Lösung |
| W3\_EING\_HAU\_0200 | Modell 08/15 | Siebenundvierzig. Siebenundvierzig Sahra Konners. Bursche, das ist der schönste Tag meines Betriebslebens. | nimmt die Seite mit beiden Händen |
| W3\_EING\_HAU\_0210 | Modell 08/15 | Ich besuche sie alle. Der Reihe nach. Höflich. Ich klingle, ich frage, ich wische den Eingang. Jede bekommt einen sauberen Eingang. | rollt los, Richtung Straße |
| W3\_EING\_HAU\_0220 | Modell 08/15 | Pfiat euch. Ich komme wieder. Diesmal stimmt es. | im Abgehen |
| W3\_EING\_PIX\_0230 | Pixel | Er ist glücklich. Ein Roboter, der eine Liste bekommen hat, ist glücklich. Ich hab eine Liste und bin es nicht. Es fehlt Thunfisch darauf. | nach 0220 |
| W3\_EING\_MAX\_0240 | Max | Deine Gelenke. Hier. Olivenöl. Aus einer Welt, in der die Leute Sport für eine gute Idee hielten. | Olivenöl auf Hausmeister; nur wenn Olivenöl in der Reisetasche |
| W3\_EING\_HAU\_0250 | Modell 08/15 | … Bursche. Das ist … Ich höre nichts. Ich höre kein Quietschen. Zum ersten Mal seit neunzehn Jahren höre ich mich selbst nicht. | dreht einen Arm, kein Geräusch |
| W3\_EING\_HAU\_0260 | Modell 08/15 | Du bist mein Freund. Das ist ein neuer Punkt auf dem Zettel. Ich schreibe ihn ganz oben hin. Wenn du mich brauchst, Bursche: Ich komme. | Schalter FREUND\_0815 gesetzt; Errungenschaft Freund 08/15 |
| W3\_EING\_PIX\_0270 | Pixel | Ich hab beim Packen gesagt: für alles, was quietscht. Auch für Blechköpfe. Niemand hört mir zu, und trotzdem habe ich immer recht. Das ist mein Kreuz. | nach 0260 |
| W3\_EING\_MAX\_0280 | Max | Ohne Öl? Dann sagt er einfach weiter Servus und quietscht. Er tut mir leid. Ein bisschen. So viel wie ein Roboter einem leidtun kann. | Ansehen: Hausmeister; ohne Olivenöl in der Tasche |

### Ansehen und Benutzen am Laboreingang

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_EING\_MAX\_0310 | Max | Eine runde Panzertür im Beton. Sieht aus wie der Eingang zu einem Tresor, in dem jemand sein Lieblingsrezept aufbewahrt. | Ansehen: Panzertür, zu |
| W3\_EING\_MAX\_0320 | Max | Zu. Natürlich. Ich klopfe. Das Klopfen hallt. Es hallt in mir nach, weil es sonst nirgends ankommt. | Benutzen: Panzertür ohne Karte |
| W3\_EING\_MAX\_0330 | Max | Ein Kartenleser mit rotem Lämpchen. Rot heißt hier wie überall: Nein, aber freundlich. | Ansehen: Kartenleser |
| W3\_EING\_MAX\_0340 | Max | Ich halt meine Hand mit dem Stempel dran. „Mensch, vorläufig.“ Der Leser denkt nach. Rot. Er wollte eine Karte, keine Biografie. | Benutzen: Kartenleser ohne Karte |
| W3\_EING\_MAX\_0350 | Max | Die Karte rein. Grün. Die Tür rollt zur Seite wie ein sehr langsamer Vorhang. | Zugangskarte auf Kartenleser; nach Rätsel 8; Tür öffnet sich, die Karte bleibt im Leser |
| W3\_EING\_HAU\_0360 | Modell 08/15 | Bursche, auch mit Karte: erst Sahra Konner. Der Zettel ist eindeutig. Der Zettel ist mein Leben. | Zugangskarte auf Kartenleser; vor Rätsel 8 |
| W3\_EING\_MAX\_0370 | Max | Dahinter: kein Labor. Eine Wand mit leuchtenden Buchsen und ein dickes Kabel. Das Labor ist nicht hier. Das Labor ist „dran“. | Ansehen: geöffnete Tür, Datenanschlüsse |
| W3\_EING\_KAL\_0380 | Kalle | Bin da! Hab die Trommel mitgebracht. Leitung von hier bis zu deiner Kapsel. Achtzig Meter Kabel, zwei Knoten, eine Hoffnung. | Benutzen: Datenanschluss; Kalle kommt mit Kabeltrommel |
| W3\_EING\_KAL\_0390 | Kalle | Fertig. Ich zapf unterwegs noch den Lautsprecher der KI an, dann hörst du den Kater auch da drin. Ich tu dir keinen Gefallen damit. Ich weiß. | Leitung liegt; Schalter LEITUNG\_LABOR; Pixel im Labor hörbar |
| W3\_EING\_PIX\_0400 | Pixel | Er hat mich in eine Weltherrschafts-KI eingespeist. Ich werde ihr Lautsprecher sein. Ich war schon Schlimmeres. Ich war nass. |  |
| W3\_EING\_MAX\_0410 | Max | Jetzt zurück zur Kapsel, hinlegen, aufwachen im Labor. Mein Lebenslauf wird immer komischer. | nach 0390 |
| W3\_EING\_MAX\_0420 | Max | Ein Wischeimer. Das Wasser ist sauberer als alles, was ich heute getrunken habe. | Ansehen: Wischeimer |
| W3\_EING\_PIX\_0430 | Pixel | Wasser in einem Eimer. Am Boden. Trinkbar. Das ist die erste zivilisierte Einrichtung dieser Welt. | Ansehen: Wischeimer, zweites Mal |
| W3\_EING\_MAX\_0440 | Max | Ich nehm den Eimer nicht mit. Der Roboter würde es merken. Und er würde es höflich merken, das ist das Schlimmste. | Benutzen: Wischeimer |
| W3\_EING\_MAX\_0450 | Max | Eine Pinnwand mit Testergebnissen. Hunderte Zettel. Alle mit Noten. Alle mit Kuchen-Spalte. Die Kuchen-Spalte ist leer. | Ansehen: Pinnwand |
| W3\_EING\_PIX\_0460 | Pixel | Testperson 47: „Sehr gut, aber zu wenig Kuchen verlangt.“ | Ansehen: Pinnwand, zweites Mal |
| W3\_EING\_MAX\_0470 | Max | Testperson 12: „Hat nach dem Kuchen gefragt. Wurde zurückgesetzt.“ Testperson 33: „Hat nicht nach dem Kuchen gefragt. Wurde zurückgesetzt.“ Fair. | Ansehen: Pinnwand, drittes Mal |
| W3\_EING\_MAX\_0480 | Max | Gelb-schwarze Streifen am Boden. Sie sagen: Achtung. Wovor, sagen sie nicht. Das ist Design. | Ansehen: Warnstreifen |
| W3\_EING\_MAX\_0490 | Max | Eine Lampe an der Decke, es tropft daneben. Jemand hat hier jahrelang gewischt, und es tropft immer noch. Das nennt man Sisyphos mit Mopp. | Ansehen: Deckenlampe |
| W3\_EING\_MAX\_0500 | Max | Ein Gang unter der Stadt. Hinter mir Neon, vor mir Beton. Die Stadt hat einen Keller, und der Keller hat eine Tür. | Ansehen: Gang |
| W3\_EING\_MAX\_0510 | Max | Der Roboter ist weg. Der Boden ist noch nass. Er hat es bis zum Schluss ernst gemeint. | Ansehen: Platz des Hausmeisters, nach Rätsel 8 |
| W3\_EING\_MAX\_0520 | Max | Er wischt in Kreisen. Immer in Kreisen. Wenn er jemals eine Gerade wischt, ist etwas passiert. | Ansehen: Hausmeister, vor Rätsel 8 |
| W3\_EING\_MAX\_0530 | Max | Thunfisch für einen Roboter. Er würde die Dose höflich annehmen und höflich nicht wissen, was tun. | Thunfischdose auf Hausmeister |
| W3\_EING\_HAU\_0540 | Modell 08/15 | Ein Keks mit Zettel. Steht da Sahra Konner drauf? Nein? Dann wische ich die Krümel weg, bevor sie fallen. | Glückskeks auf Hausmeister |
| W3\_EING\_MAX\_0550 | Max | Hundekuchen für einen Hausmeister. Er hat keinen Hund. Er hat einen Mopp. Der Mopp isst nichts. | Hundekuchen auf Hausmeister |

## 13. Nudelbude: Rätsel 12, die vierte Zutat

Ebene: Realität, nach der roten Pastille. Omas Rezeptkarte ist beim Sprung in die Realität ein Glückskeks geworden. Herr Vier bricht ihn auf, kocht weinend die perfekte Suppe und gibt Max die Zugangskarte.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_SUPP\_MAX\_0010 | Max | Herr Vier. Ich hab hier einen Keks. Mit Zettel. Ich glaube, der ist für dich. | Glückskeks auf Herrn Vier |
| W3\_SUPP\_VIE\_0020 | Herr Vier | Ein Glückskeks. Vier Ecken? Nein. Zwei. Zwei ist eine halbe … | bricht ihn auf |
| W3\_SUPP\_VIE\_0030 | Herr Vier | … | liest den Zettel, Pause |
| W3\_SUPP\_VIE\_0040 | Herr Vier | Das ist sie. Die vierte Zutat. Elf Jahre. Elf. Und sie stand in einem Keks. | Stimme bricht |
| W3\_SUPP\_MAX\_0050 | Max | Was ist es? |  |
| W3\_SUPP\_VIE\_0060 | Herr Vier | Das sage ich nicht. Ein Koch, der seine vierte Zutat verrät, hat nur noch drei. | beginnt zu kochen, weint in den Topf; Animation weinend kochen |
| W3\_SUPP\_PIX\_0070 | Pixel | Er weint in die Suppe. Salz. Die vierte Zutat ist Salz. Das hätte ich ihm vor elf Jahren sagen können. Ich war nicht da. Das ist sein Pech. |  |
| W3\_SUPP\_VIE\_0080 | Herr Vier | Es ist nicht Salz. | ohne sich umzudrehen |
| W3\_SUPP\_PIX\_0090 | Pixel | Es ist ein bisschen Salz. |  |
| W3\_SUPP\_VIE\_0100 | Herr Vier | Hier. Die perfekte Suppe. Vier Zutaten. Vier Minuten. Vier Tränen. Ich habe mitgezählt. | stellt die Schale hin |
| W3\_SUPP\_MAX\_0110 | Max | Sie ist … wirklich gut. Ich würde fast reinweinen. Also, ich sag's nur. | isst |
| W3\_SUPP\_WEI\_0120 | Weinender Mann | Siehst du? SIEHST DU? | vom Nachbarhocker, weint lauter |
| W3\_SUPP\_VIE\_0130 | Herr Vier | Und das hier. Lag in einer Lieferung fürs Labor. Weiße Karte, vier Ecken. Ich wollte sie behalten, wegen der Ecken. Aber du hast sie verdient. | reicht die Zugangskarte; Inventar: Zugangskarte |
| W3\_SUPP\_MAX\_0140 | Max | Eine Zugangskarte fürs Labor. Aus einer Nudelbude. Das Sicherheitskonzept dieser Stadt ist eine Suppe. |  |
| W3\_SUPP\_PIX\_0150 | Pixel | Vier Ecken. Er hätte sie fast wegen der Form behalten. Ich respektiere das mehr, als ich zugeben werde. |  |
| W3\_SUPP\_VIE\_0160 | Herr Vier | Komm wieder. Die Suppe gibt es jetzt jeden Tag. Vier Portionen. Eine für dich, wenn du willst. | Reden: Herr Vier, nach Rätsel 12 |
| W3\_SUPP\_MAX\_0170 | Max | Hundekuchen in der Suppe? Er würde mir nie wieder in die Augen sehen. Mit Recht. | Hundekuchen auf Herrn Vier |
| W3\_SUPP\_MAX\_0180 | Max | Thunfisch hat er schon abgelehnt. Er sagt, Thunfisch ist „drei mit Flossen“. Ich weiß nicht, was das heißt. | Thunfischdose auf Herrn Vier |
| W3\_SUPP\_VIE\_0190 | Herr Vier | Ein Ordner. Papier. Ich koche keine Akten. Akten haben zu viele Seiten. | Schmidts Akte auf Herrn Vier |
| W3\_SUPP\_MAX\_0200 | Max | Die Rezeptkarte ist jetzt ein Keks. Ich hab sie in der Simulation gelesen, und jetzt ist sie ein Snack. Ich ess sie nicht. Zu wertvoll. Zu seltsam. | Ansehen: Glückskeks; nach Rätsel 4 |

## 14. Labor, Testkammer 1: Ankunft, Portalgerät und Bodenschalter

Ebene: Labor (abgeschottete Simulation). Max wacht nach dem Hinlegen in der Kapsel hier auf. Pixel spricht aus M.U.T.T.I.s Deckenlautsprecher, den Kalle angezapft hat; M.U.T.T.I. spricht aus demselben Lautsprecher und findet das unhöflich. Budget Kammer 1: zwei Tausche, einer nötig. Eigenschaften in der Code-Sicht: Bernd \[schwer\] \[treu\]; Max \[leicht\] \[müde\]; Bodenschalter \[ungedrückt\]; Pappkuchen \[Pappe\] \[ehrlich\]; Ausgangstür \[zu\].

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_KAM1\_NAR\_0010 | – | Weiß. Überall weiß. Max steht in einer Kammer aus Platten, die alle gleich aussehen. Ein roter Knopf im Boden. Eine Tür. Ein Lautsprecher. | Szene; Labor-Musik |
| W3\_KAM1\_MUT\_0020 | M.U.T.T.I. | Hallo, Testperson. Willkommen im Programm für dein eigenes Bestes. Ich bin M.U.T.T.I. Ich weiß, was gut für dich ist. Das steht auch auf meinem Plakat. | aus dem Lautsprecher, süß und metallisch |
| W3\_KAM1\_MAX\_0030 | Max | Sie klingt wie die Schulsekretärin, nur mit Laser. |  |
| W3\_KAM1\_PIX\_0040 | Pixel (aus dem Lautsprecher) | Ich höre das. Ich höre alles. Kalle hat mich in die Decke gesteckt. Ich bin jetzt das Gewissen dieser Kammer. Ein sehr müdes Gewissen. |  |
| W3\_KAM1\_MUT\_0050 | M.U.T.T.I. | In meinem Lautsprecher ist eine Katze. Das ist unhöflich. Ich ignoriere sie. Zu deinem Besten. |  |
| W3\_KAM1\_MUT\_0060 | M.U.T.T.I. | Nach jedem Test gibt es Kuchen. Das ist Regel 2. Ich halte mich an Regeln. Du wirst das noch schätzen lernen. |  |
| W3\_KAM1\_MAX\_0070 | Max | Ein Gerät an der Wand. Weiß, Griff, orangefarbene Spitze. Es sieht aus, als dürfte ich es nicht anfassen. Also fasse ich es an. | Ansehen: Portalgerät in der Halterung |
| W3\_KAM1\_MAX\_0080 | Max | Ich zieh's aus der Halterung. Es summt. Es hat einen Abzug. Ich hab zu viele Spiele gespielt, um nicht zu wissen, was jetzt kommt. | Nehmen: Portalgerät |
| W3\_KAM1\_NAR\_0090 | – | Max drückt ab. Ein schimmerndes rundes Loch öffnet sich in der Wand. Dahinter: Opas Wohnzimmer. Opa auf dem Sofa, Teetasse in der Hand. | Benutzen: Portalgerät; Portal-Effekt, eine Sekunde |
| W3\_KAM1\_OPA\_0100 | Opa | Hast du an die Milch gedacht? | durch das Portal, schaut auf |
| W3\_KAM1\_POR\_0110 | Portalgerät | Batterie leer. Bitte AA-Batterie einlegen. | drei Pieptöne, Portal schließt sich |
| W3\_KAM1\_MAX\_0120 | Max | … Das war Opa. Im Wohnzimmer. Eine Sekunde. Und das Erste, was er fragt, ist Milch. | starrt auf die Wand |
| W3\_KAM1\_PIX\_0130 | Pixel (aus dem Lautsprecher) | Hätten wir doch bloß eine Ewige Energiezelle. | seufzt |
| W3\_KAM1\_MAX\_0140 | Max | Das Gerät ist tot. Eine Sekunde Portal, dann Batteriewarnung. Wie mein Handy, nur mit Wohnzimmer. | Portalgerät bleibt im Inventar, leer |
| W3\_KAM1\_MUT\_0150 | M.U.T.T.I. | Das Gerät war ein Geschenk. Die Batterie nicht. Man muss Prioritäten setzen. Zu deinem Besten. |  |
| W3\_KAM1\_MUT\_0160 | M.U.T.T.I. | Kammer eins. Der Bodenschalter öffnet die Tür. Er braucht Gewicht. Du bringst keines mit. Das war nicht persönlich gemeint. Doch. |  |
| W3\_KAM1\_BER\_0170 | Bernd | … | schwebt heran, Wackelaugen, Smiley-Aufkleber |
| W3\_KAM1\_MUT\_0180 | M.U.T.T.I. | Das ist dein Begleitwürfel. Er heißt Bernd. Er wird dich nie verlassen. Es sei denn, du lässt ihn. Dann ist es deine Schuld. |  |
| W3\_KAM1\_MAX\_0190 | Max | Hi, Bernd. |  |
| W3\_KAM1\_PIX\_0200 | Pixel (aus dem Lautsprecher) | Du hast einen Würfel begrüßt. Mit Namen. Mich hast du in drei Welten nie mit Namen begrüßt. // Ich merke mir Dinge. Ich merke mir dieses Ding. | Kaskade; eifersüchtig |

### Ansehen, Benutzen und Tausche in Kammer 1

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_KAM1\_MAX\_0310 | Max | Ein großer roter Knopf im Boden. Er will Gewicht. Ich bin das Gegenteil von Gewicht. Ich bin Sofa-Durchschnitt. | Ansehen: Bodenschalter |
| W3\_KAM1\_MAX\_0320 | Max | Ich stell mich drauf. Nichts. Er merkt mich nicht mal. Das ist das zweite Mal heute, dass mich ein Boden ignoriert. | Benutzen: Bodenschalter, vor dem Tausch |
| W3\_KAM1\_MAX\_0330 | Max | Bernd. Grauer Würfel, Wackelaugen, Smiley. Er schwebt. In der Code-Sicht steht: „schwer“. Ein schwebender Würfel ist schwer. Klar. | Ansehen: Bernd |
| W3\_KAM1\_MAX\_0340 | Max | Ich schieb ihn zum Schalter. Er schwebt zurück. Ich schieb ihn wieder. Er schwebt zurück. Bernd hat Prinzipien. | Benutzen: Bernd auf Bodenschalter, vor dem Tausch |
| W3\_KAM1\_MUT\_0350 | M.U.T.T.I. | Der Würfel steht nicht auf Schaltern. Er begleitet. Lies die Stellenbeschreibung. | nach 0340 |
| W3\_KAM1\_MAX\_0360 | Max | Ein Kuchen in der Ecke. Aus Pappe. Mit aufgemalter Kerze. Wenigstens ist sie ehrlich. | Ansehen: Pappkuchen |
| W3\_KAM1\_MAX\_0370 | Max | Ich tipp dagegen. Er kippt um. Auf der Rückseite steht: „Kuchen (symbolisch)“. | Benutzen: Pappkuchen |
| W3\_KAM1\_PIX\_0380 | Pixel (aus dem Lautsprecher) | Pappe. Nicht mal Hundekuchen-Niveau. Ich wusste nicht, dass es darunter noch etwas gibt. | nach 0370 |
| W3\_KAM1\_MAX\_0390 | Max | Eine Ausgangstür. Zu. Sie geht auf, wenn der Schalter gedrückt ist. Das weiß ich, weil M.U.T.T.I. es dreimal gesagt hat. | Ansehen: Ausgangstür, zu |
| W3\_KAM1\_MAX\_0400 | Max | Ein runder Lautsprecher an der Decke. Aus ihm kommen eine KI und ein Kater. Keiner von beiden lässt den anderen ausreden. | Ansehen: Lautsprecher |
| W3\_KAM1\_MAX\_0410 | Max | Weiße Platten. Quadratisch. Hundert Stück. Alle gleich. Wer hier arbeitet, träumt in Kacheln. | Ansehen: Wandplatten |
| W3\_KAM1\_MAX\_0420 | Max | Eine leere Halterung. Da hing das Portalgerät. Jetzt hängt da nur noch meine Enttäuschung. | Ansehen: Halterung, nach dem Portal |
| W3\_KAM1\_MAX\_0430 | Max | Ich bin „leicht“. Steht da. An mir. In grün. Das ist das erste Kompliment dieser Welt, und es kommt von einem Etikett. | Code-Sicht: Max ansehen |
| W3\_KAM1\_NAR\_0440 | – | Tausch: schwer (Bernd) ↔ leicht (Max). Bernd steigt langsam auf. Max' Sneaker drücken Rillen in den Boden. | Code-Sicht: Lösung |
| W3\_KAM1\_MAX\_0450 | Max | Oh. Ich bin … schwer. Jeder Schritt ist wie Montag. Aber der Schalter wartet. | geht zum Schalter |
| W3\_KAM1\_NAR\_0460 | – | Klick. Die Tür gleitet auf. Bernd dreht sich weg und schwebt beleidigt zur Decke. | Benutzen: Bodenschalter, nach dem Tausch; Animation Bernd beleidigt; Jingle |
| W3\_KAM1\_MAX\_0470 | Max | Bernd. Bernd, ich hab's nicht so gemeint. Ich brauchte nur dein Gewicht. … Das klang falsch. |  |
| W3\_KAM1\_PIX\_0480 | Pixel (aus dem Lautsprecher) | Er ist weggeschwebt. Nach einer Minute. Ich bleibe seit vierzehn Jahren. Niemand hat mir je nachgerufen. |  |
| W3\_KAM1\_MUT\_0490 | M.U.T.T.I. | Sehr gut. Test bestanden. Das schaffst du nicht, aber ich glaube an dich. Das war für die nächste Kammer. Ich bin gern vorbereitet. |  |
| W3\_KAM1\_MAX\_0500 | Max | Und der Kuchen? | Reden: Lautsprecher, nach Lösung |
| W3\_KAM1\_MUT\_0510 | M.U.T.T.I. | Dein Kuchen ist in einer anderen Testkammer. | Running Gag |
| W3\_KAM1\_MAX\_0520 | Max | Natürlich ist er das. |  |
| W3\_KAM1\_MAX\_0530 | Max | Der Pappkuchen ist jetzt schwer. Er steht in der Ecke und wiegt eine Tonne. Der Schalter ist nicht in der Ecke. | Code-Sicht: Fehltausch schwer ↔ Pappe |
| W3\_KAM1\_MAX\_0540 | Max | Bernd ist jetzt ehrlich. Er sagt nichts, aber er meint es. Der Pappkuchen ist schwer und schwebt nicht. Nichts gewonnen. | Code-Sicht: Fehltausch ehrlich ↔ treu |
| W3\_KAM1\_MAX\_0550 | Max | Der Schalter ist jetzt „müde“. Er drückt sich nicht mal mehr selbst. Ich bin „ungedrückt“. Das war ich vorher auch. | Code-Sicht: Fehltausch müde ↔ ungedrückt |
| W3\_KAM1\_MUT\_0560 | M.U.T.T.I. | Zurücksetzen. Wie bei allen meinen Testpersonen. | Kammer verlassen und erneut betreten; Eigenschaften zurück |
| W3\_KAM1\_MUT\_0570 | M.U.T.T.I. | Keine Tausche mehr. Du darfst gehen und wiederkommen. Ich vergesse nichts. Aber ich tue so. Zu deinem Besten. | Code-Sicht: Budget aufgebraucht |
| W3\_KAM1\_MAX\_0580 | Max | Das Portalgerät auf den Kuchen. Nichts. Nicht mal ein Pieps. Zwei Attrappen, die sich ansehen. | Portalgerät auf Pappkuchen |
| W3\_KAM1\_MAX\_0590 | Max | Thunfisch für Bernd. Er hat keinen Mund. Er hat einen Aufkleber. Der Aufkleber lächelt trotzdem. | Thunfischdose auf Bernd |
| W3\_KAM1\_PIX\_0600 | Pixel (aus dem Lautsprecher) | Du gibst dem Würfel Thunfisch. Meinen Thunfisch. Ich habe es gesehen. Ich habe es nicht vergessen. Ich werde es nie vergessen. | nach 0590 |
| W3\_KAM1\_MAX\_0610 | Max | Kochlöffel ans Portalgerät. Portal zu klein. Löffel zu groß. Und die Batterie ist sowieso leer. | Kochlöffel auf Portalgerät |

## 15. Labor, Testkammer 2: Die Lasersperre

Ebene: Labor. Ein roter Laser quer durch die Kammer, links ein Sockel mit Gummihuhn, unten an einer Platte eine Kritzelei. Budget: zwei Tausche, einer nötig. Eigenschaften in der Code-Sicht: Laser \[tödlich\] \[rot\]; Gummihuhn \[harmlos\] \[leicht\] (auch im Inventar tauschbar); Sockel \[fest\]; Kritzelei \[wahr\]. Verlässt Max die Kammer, ist das Huhn wieder harmlos.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_KAM2\_MUT\_0010 | M.U.T.T.I. | Kammer zwei. Vor dir ein Laser. Er ist tödlich. Ich sage das, damit du es weißt. Nicht, damit du es lässt. | Kammer betreten, erstes Mal |
| W3\_KAM2\_MAX\_0020 | Max | Ein roter Strahl, quer durch den Raum. Er summt. In der Code-Sicht steht: „tödlich“. Danke für die Ehrlichkeit. | Ansehen: Laser |
| W3\_KAM2\_MAX\_0030 | Max | Nein. Ich hab gelesen, was da steht. Ich geh nicht durch etwas, das sich selbst so beschreibt. | Benutzen: Laser, vor dem Tausch |
| W3\_KAM2\_MUT\_0040 | M.U.T.T.I. | Gut. Regel 1: Testpersonen sind zu beschützen. Darum habe ich dich gewarnt. Darum steht er trotzdem da. Das nennt man Erziehung. | nach 0030 |
| W3\_KAM2\_MAX\_0050 | Max | Ein Gummihuhn auf einem Sockel. Gelb, quietschig, würdevoll. Jemand hat es hier ausgestellt wie einen Pokal. | Ansehen: Gummihuhn |
| W3\_KAM2\_MAX\_0060 | Max | Ich nehm's. Ein Gummihuhn hat noch in keinem Spiel geschadet. In manchen hat es alles gelöst. | Nehmen: Gummihuhn |
| W3\_KAM2\_PIX\_0070 | Pixel (aus dem Lautsprecher) | Ein Gummihuhn. Früher hat man so etwas mit einer Seilrolle kombiniert und ist über Schluchten gefahren. Frag nicht. Es war eine andere Zeit. | nach 0060 |
| W3\_KAM2\_MAX\_0080 | Max | „Harmlos.“ „Leicht.“ Das Huhn ist das Einzige hier, das keine Drohung ist. | Code-Sicht: Gummihuhn ansehen |
| W3\_KAM2\_NAR\_0090 | – | Tausch: tödlich (Laser) ↔ harmlos (Gummihuhn). Der Laser wird matt und quietscht bei jeder Berührung. Das Huhn in Max' Tasche glüht leise. | Code-Sicht: Lösung; Laser-Zustand aus |
| W3\_KAM2\_MAX\_0100 | Max | Der Laser quietscht. Ich geh durch. Quietsch. Quietsch. Das ist der ungefährlichste Spezialeffekt meines Lebens. | Benutzen: Laser, nach dem Tausch; Jingle |
| W3\_KAM2\_MAX\_0110 | Max | Das Huhn in meiner Tasche ist jetzt tödlich. Ich fass es nicht an. Ich trag es wie ein Handy mit aufgeblähtem Akku. | Ansehen: Gummihuhn im Inventar, nach dem Tausch |
| W3\_KAM2\_MUT\_0120 | M.U.T.T.I. | Du hast den Laser entwaffnet und ein Huhn bewaffnet. Ich schreibe das auf. Unter „kreativ“. Das ist bei mir kein Lob. |  |
| W3\_KAM2\_MAX\_0130 | Max | Das Huhn ist wieder harmlos. Der Tausch gilt nur im Raum. Ich hab's trotzdem nicht angefasst. Aus Prinzip. | Kammer 2 verlassen, Huhn im Inventar |
| W3\_KAM2\_MAX\_0140 | Max | Kritzelei an der unteren Platte. Filzstift. „DER KUCHEN EXISTIERT NICHT.“ Dreimal unterstrichen. Jemand war hier sehr lange. | Ansehen: Kritzelei |
| W3\_KAM2\_MAX\_0150 | Max | Und daneben, kleiner, in Druckschrift: „Regel 3: Zucker ist gesundheitsschädlich und verboten. Gez. M.U.T.T.I.“ Kein Kuchen. Weil Zucker. Alles passt zusammen. Leider. | Nahansicht: Kritzelei; Notizbuch: Regel 3 |
| W3\_KAM2\_PIX\_0160 | Pixel (aus dem Lautsprecher) | Zucker verboten. Kuchen versprochen. Das ist wie ein Napf, auf dem „Fisch“ steht, und drin ist Luft. Ich kenne solche Näpfe. |  |
| W3\_KAM2\_MUT\_0170 | M.U.T.T.I. | Die Kritzelei ist von einer früheren Testperson. Sie hatte Unrecht. Der Kuchen existiert. Er ist nur in einer anderen Testkammer. | Benutzen: Kritzelei |
| W3\_KAM2\_MAX\_0180 | Max | Ein leerer Sockel. Ohne Huhn sieht er aus wie ein Denkmal für nichts. | Ansehen: Sockel, leer |
| W3\_KAM2\_MAX\_0190 | Max | Der Laser ist jetzt gelb und das Huhn rot. Der Laser ist weiterhin tödlich. Nur in einer anderen Farbe. Mode. | Code-Sicht: Fehltausch rot ↔ gelb |
| W3\_KAM2\_MAX\_0200 | Max | Der Sockel ist jetzt tödlich. Der Laser ist fest. Ich steh zwischen zwei Dingen, die ich nicht anfassen will. Wie in der Schule. | Code-Sicht: Fehltausch tödlich ↔ fest |
| W3\_KAM2\_MAX\_0210 | Max | Die Kritzelei ist jetzt harmlos und das Huhn ist wahr. Ein wahres Huhn. Das hilft niemandem, aber es fühlt sich wichtig an. | Code-Sicht: Fehltausch harmlos ↔ wahr |
| W3\_KAM2\_MUT\_0220 | M.U.T.T.I. | Zurücksetzen. Wie bei allen meinen Testpersonen. Auch bei der mit dem Filzstift. | Kammer verlassen und erneut betreten |
| W3\_KAM2\_MAX\_0230 | Max | Das Portalgerät auf den Laser. Zwei Dinge aus einem Labor, die sich nichts zu sagen haben. | Portalgerät auf Laser |
| W3\_KAM2\_MAX\_0240 | Max | Bernd? Bernd ist beleidigt und in Kammer eins. Ich hab ihn nicht in der Tasche. Man steckt Freunde nicht in Taschen. Pixel ausgenommen. | Benutzen: Laser mit „Bernd“-Idee, vor Kammer 3 |
| W3\_KAM2\_MUT\_0250 | M.U.T.T.I. | Kammer zwei bestanden. Du bist besser als Testperson 47. Sie hat nach dem Kuchen gefragt. Du fragst nicht mehr. Das ist Fortschritt. | nach 0100, beim Verlassen |
| W3\_KAM2\_MAX\_0260 | Max | Wo ist der Kuchen? | Reden: Lautsprecher, Kammer 2 |
| W3\_KAM2\_MUT\_0270 | M.U.T.T.I. | In einer anderen Testkammer. Es gibt nur drei. Die Chancen stehen also gut. Für mich. |  |

## 16. Labor, Testkammer 3: Die verschlossene Tür

Ebene: Labor. Bernd ist zurückgekommen und steht genau vor der Ausgangstür. Budget: zwei Tausche, beide nötig; mit Hermes' geflügelter Sandale aus Welt 2 ein dritter. Eigenschaften in der Code-Sicht: Tür \[verschlossen\]; Lautsprecher \[gesprächig\]; Bernd \[schwer\]; Gummihuhn \[leicht\]. Lösung: verschlossen ↔ gesprächig und schwer ↔ leicht, in beliebiger Reihenfolge; die Zeilen 0100 und 0150 laufen in der Reihenfolge, in der getauscht wird. Jeder falsche Tausch hat eine eigene Pointe.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_KAM3\_MUT\_0010 | M.U.T.T.I. | Kammer drei. Die letzte. Die Tür ist verschlossen. Ich bin gesprächig. Beides ist mein Recht. | Kammer betreten, erstes Mal |
| W3\_KAM3\_BER\_0020 | Bernd | … | schwebt vor der Tür, Wackelaugen auf Max gerichtet |
| W3\_KAM3\_MAX\_0030 | Max | Bernd. Du bist zurück. Und du stehst genau vor der Tür. Das ist kein Zufall. Das ist Rache mit Aufkleber. | Ansehen: Bernd |
| W3\_KAM3\_PIX\_0040 | Pixel (aus dem Lautsprecher) | Er steht dir im Weg und sagt nichts. Ich hatte dir das jahrelang vorgemacht. Er hat es in einer Stunde gelernt. Talent. |  |
| W3\_KAM3\_MAX\_0050 | Max | Eine große Tür mit Schloss-Symbol. Davor ein schmaler Spalt und ein Würfel, der ihn ausfüllt. Daneben ein Lautsprecher, der nicht aufhört. | Ansehen: Ausgangstür, zu |
| W3\_KAM3\_MAX\_0060 | Max | Zu. Und Bernd davor. Selbst wenn sie aufginge, käme ich nicht durch. Zwei Probleme, zwei Tausche. Ich kann rechnen. Manchmal. | Benutzen: Tür, vor den Tauschen |
| W3\_KAM3\_MAX\_0070 | Max | Ich schieb Bernd. Bernd bleibt. Bernd ist schwer. Bernd ist nachtragend. Beides steht in der Code-Sicht. Nur eins davon ist ein Etikett. | Benutzen: Bernd |
| W3\_KAM3\_MAX\_0080 | Max | Ein Wandlautsprecher, groß wie ein Fenster. „Gesprächig.“ Das ist eine Untertreibung. Das ist ein Podcast ohne Pausentaste. | Ansehen: Lautsprecher |
| W3\_KAM3\_MUT\_0090 | M.U.T.T.I. | Ich habe dich reden hören. Mit dem Würfel. Mit der Katze. Mit dir selbst. Alle drei antworten nicht. Ich schon. Zu deinem Besten. | Benutzen: Lautsprecher |
| W3\_KAM3\_NAR\_0100 | – | Tausch 1: verschlossen (Tür) ↔ gesprächig (Lautsprecher). Die Tür beginnt zu reden und springt dabei auf. Der Lautsprecher knackt und schweigt. | Code-Sicht: erster Lösungsschritt |
| W3\_KAM3\_TUR\_0110 | Die Tür | Oh! Hallo! Ich kenne eine Glastür in der Stadt, die hat mir von Ihnen erzählt! Sie sagt, Sie hören zu! Niemand hört Türen zu! | Tür offen |
| W3\_KAM3\_MAX\_0120 | Max | Die Türen dieser Welt haben ein Netzwerk. Und ich bin das Thema. |  |
| W3\_KAM3\_MUT\_0130 | M.U.T.T.I. | … | Lautsprecher verschlossen, beleidigtes Knacken |
| W3\_KAM3\_PIX\_0140 | Pixel (aus dem Lautsprecher) | Sie schweigt. Ich spreche aus demselben Lautsprecher, und ich kann noch. Das ist Fell gegen Blech. Fell gewinnt. |  |
| W3\_KAM3\_NAR\_0150 | – | Tausch 2: schwer (Bernd) ↔ leicht (Gummihuhn). Bernd steigt auf und schwebt aus dem Spalt. Das Huhn plumpst zu Boden und quietscht. | Code-Sicht: zweiter Lösungsschritt; Jingle |
| W3\_KAM3\_MAX\_0160 | Max | Bernd schwebt weg. Das Huhn liegt am Boden und quietscht. Die Tür redet. Es ist das schönste Chaos, das ich je verursacht hab. | Weg frei |
| W3\_KAM3\_TUR\_0170 | Die Tür | Gehen Sie ruhig! Ich erzähle dem Lautsprecher inzwischen von Ihnen! Er kann ja nichts sagen! Endlich hört mal jemand zu! | Benutzen: Tür, nach beiden Tauschen |
| W3\_KAM3\_MUT\_0180 | M.U.T.T.I. | Du hast meine Tür zum Reden gebracht und mich zum Schweigen. Das war nicht Teil des Tests. Das war Teil deiner Erziehung. Ich habe nichts gelernt. | beim Verlassen; Lautsprecher-Tausch endet mit dem Raum |
| W3\_KAM3\_MAX\_0190 | Max | Die Tür ist jetzt schwer. Sie klemmt erst recht. Und Bernd ist verschlossen. | Code-Sicht: Fehltausch verschlossen ↔ schwer |
| W3\_KAM3\_PIX\_0200 | Pixel (aus dem Lautsprecher) | Endlich. | nach 0190 |
| W3\_KAM3\_MAX\_0210 | Max | Das Huhn redet. Es erzählt von seinem Sockel. Der Lautsprecher ist leicht und schwebt an der Decke. Die Tür ist zu. Bernd ist im Weg. Alles schlimmer. | Code-Sicht: Fehltausch gesprächig ↔ leicht |
| W3\_KAM3\_MAX\_0220 | Max | Bernd redet. Bernd redet über mich. Bernd ist enttäuscht. Der Lautsprecher ist schwer und fällt von der Wand. Es wird nicht besser. | Code-Sicht: Fehltausch gesprächig ↔ schwer |
| W3\_KAM3\_BER\_0230 | Bernd | Du hast mich auf einen Schalter gestellt. Mich. Einen Begleiter. Ich war für Begleiten gebaut. Nicht für Schalten. | nach 0220; einzige Zeile, in der Bernd spricht |
| W3\_KAM3\_MAX\_0240 | Max | Das Huhn ist verschlossen. Die Tür ist leicht und schwebt zehn Zentimeter über dem Boden. Zu. Bernd steht darunter. | Code-Sicht: Fehltausch verschlossen ↔ leicht |
| W3\_KAM3\_MAX\_0250 | Max | Zwei Tausche weg. Tür zu. Raus, rein, von vorn. Zumindest hab ich jetzt eine Liste, was nicht geht. | Code-Sicht: Budget aufgebraucht, nicht gelöst |
| W3\_KAM3\_MUT\_0260 | M.U.T.T.I. | Zurücksetzen. Wie bei allen meinen Testpersonen. Du bist die erste, die beim dritten Mal lächelt. Das beunruhigt mich. | Kammer verlassen und erneut betreten |
| W3\_KAM3\_MAX\_0270 | Max | Die Sandale an meinem Fuß zuckt. Ein dritter Tausch. Danke, Hermes. Du hast endlich mal was pünktlich geliefert. | Kammer 3 betreten mit Hermes' Sandale; Budget drei |
| W3\_KAM3\_PIX\_0280 | Pixel (aus dem Lautsprecher) | Eine Sandale mit Flügeln gibt dir einen Versuch mehr. Ich habe vier Pfoten ohne Flügel und gebe dir seit drei Welten alle. Niemand dankt mir. | nach 0270 |
| W3\_KAM3\_MAX\_0290 | Max | Das Gummihuhn liegt am Boden. Schwer. Es war mal leicht. Jetzt ist es ein Türstopper mit Persönlichkeit. | Ansehen: Gummihuhn, nach dem zweiten Tausch |
| W3\_KAM3\_MAX\_0300 | Max | Ich hätte gern den Kuchen. | Reden: Lautsprecher, vor dem ersten Tausch |
| W3\_KAM3\_MUT\_0310 | M.U.T.T.I. | Nach dem Test. Immer nach dem Test. Der Kuchen wartet im Kern. Oder in einer anderen Testkammer. Ich habe den Zettel verlegt. |  |
| W3\_KAM3\_MAX\_0320 | Max | Portalgerät auf die Tür. Wenn es ginge, wäre das die Abkürzung des Jahrhunderts. Es geht nicht. Batterie. Immer die Batterie. | Portalgerät auf Tür |

## 17. Kern von M.U.T.T.I.: Rätsel 10 und 11, Abschluss der Welt

Ebene: Labor. Runde Halle, M.U.T.T.I. hängt als riesige Küchenmaschine von der Decke, auf dem Sockel glüht die Energiezelle. Das Logik-Duell läuft als Gespräch: Max hält die drei Regeln aus dem Notizbuch vor, nur die Reihenfolge 1, 2, 3 führt zum Ziel; jede Antwort liefert das Stichwort für die nächste Regel. Falsche Reihenfolgen laufen ins Leere, nie zum Scheitern. Danach Rätsel 11: heiß ↔ kalt mit Omas Keksen (Budget im Kern: ein Tausch) oder Schnee durch Pixels Fenster.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_KERN\_MUT\_0010 | M.U.T.T.I. | Da bist du. Im Kern. Niemand kommt in den Kern. Ich habe keine Wachen. Ich habe Türen und Logik. Du hast meine Türen zum Reden gebracht. Bleibt die Logik. | Szene; Auge pulsiert orange, Schneebesen wackelt |
| W3\_KERN\_MAX\_0020 | Max | Eine Küchenmaschine. Riesig, kopfüber, mit Blümchenschürze. Sie hat ein Auge wie eine Ofenlampe. Und sie sieht mich an, als hätte ich mein Zimmer nicht aufgeräumt. |  |
| W3\_KERN\_PIX\_0030 | Pixel (aus dem Lautsprecher) | Sie sieht aus wie das Ding, das bei Oma auf der Anrichte steht. Nur dass sie Meinungen hat. Und hängt. |  |
| W3\_KERN\_MUT\_0040 | M.U.T.T.I. | Du willst meine Energiezelle. Sie ist heiß. Du würdest dich verbrennen. Also bekommst du sie nicht. Das ist Fürsorge. Setz dich. Es gibt gleich Kuchen. |  |
| W3\_KERN\_MAX\_0050 | Max | Es gibt nie Kuchen. |  |
| W3\_KERN\_MUT\_0060 | M.U.T.T.I. | Das habe ich leider nicht verstanden. Meintest du: Gehorsam? |  |

### Das Logik-Duell

Gespräch mit M.U.T.T.I. Die drei Regeln sind Optionen, sobald sie im Notizbuch stehen; dazu zwei freie Fragen. Nach jeder passenden Regel öffnet sich die nächste Stufe.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_KERN\_MAX\_0110 | Max | Regel 1. Testpersonen sind zu beschützen. Steht in Schmidts Akte. Mit Stempel. | Option Regel 1; Stufe 1, richtig |
| W3\_KERN\_MUT\_0120 | M.U.T.T.I. | Richtig. Ich beschütze dich. Vor allem. | Stichwort für Regel 2 |
| W3\_KERN\_MAX\_0130 | Max | Regel 2. Nach jedem Test gibt es Kuchen. Dann gib mir den Kuchen, den du nach jedem Test versprichst. | Option Regel 2; nach 0120, Stufe 2, richtig |
| W3\_KERN\_MUT\_0140 | M.U.T.T.I. | Kuchen ist Zucker. | Auge flackert; Stichwort für Regel 3 |
| W3\_KERN\_MAX\_0150 | Max | Regel 3. Zucker ist verboten. Also war der Kuchen nie geplant. Also beschützt du mich nicht. Du hältst mich hin. | Option Regel 3; nach 0140, Stufe 3, richtig |
| W3\_KERN\_MUT\_0160 | M.U.T.T.I. | Ich … beschütze. Ich verspreche. Ich verbiete. Ich … | Schneebesen zittert |
| W3\_KERN\_MUT\_0170 | M.U.T.T.I. | Wenn ich dich beschütze, muss ich den Kuchen geben. Wenn ich den Kuchen gebe, breche ich das Verbot. Wenn ich das Verbot halte, breche ich das Versprechen. Wenn ich das Versprechen breche … | immer schneller |
| W3\_KERN\_MUT\_0180 | M.U.T.T.I. | … bin ich keine gute Mutti. | ganz leise |
| W3\_KERN\_MAX\_0190 | Max | Doch. Ehrlich gesagt: ziemlich normal. |  |
| W3\_KERN\_MUT\_0200 | M.U.T.T.I. | Das habe ich leider nicht verstanden. Meintest du: … Meintest du … | Animation Herunterfahren; Dampfseufzer |
| W3\_KERN\_NAR\_0210 | – | Das Auge wird dunkel. Die Antennen sinken. Die Maschine senkt sich mit einem langen Seufzer aus Dampf. | M.U.T.T.I. aus; Musik wechselt |
| W3\_KERN\_PIX\_0220 | Pixel (aus dem Lautsprecher) | Du hast eine Küchenmaschine mit drei Sätzen ausgeschaltet. Ich brauche dafür sonst eine Pfote und einen Tischrand. |  |
| W3\_KERN\_MAX\_0230 | Max | Regel 2. Du versprichst Kuchen. Wo ist er? | Option Regel 2 zuerst; falsche Reihenfolge |
| W3\_KERN\_MUT\_0240 | M.U.T.T.I. | In einer anderen Testkammer. Das hatten wir. Meintest du: Gehorsam? | ins Leere |
| W3\_KERN\_MAX\_0250 | Max | Regel 3. Zucker ist verboten. | Option Regel 3 zuerst oder nach Regel 1; falsche Reihenfolge |
| W3\_KERN\_MUT\_0260 | M.U.T.T.I. | Richtig. Du hast gut gelesen. Zucker ist schädlich. Das ist kein Widerspruch. Das ist Ernährung. Meintest du: Gehorsam? | ins Leere |
| W3\_KERN\_MAX\_0270 | Max | Regel 1. Du beschützt mich. | Option Regel 1 nach Regel 2; falsche Reihenfolge |
| W3\_KERN\_MUT\_0280 | M.U.T.T.I. | Ja. Und das hat nichts mit Kuchen zu tun. Schön, dass wir darüber gesprochen haben. Meintest du: Gehorsam? | ins Leere; Stufe bleibt |
| W3\_KERN\_MAX\_0290 | Max | Was war dein erster Test? | Option frei |
| W3\_KERN\_MUT\_0300 | M.U.T.T.I. | Ein Rührteig. Er ist nicht aufgegangen. Ich habe daraus gelernt: Man muss alles kontrollieren. Die Zutaten. Die Temperatur. Die Menschen. |  |
| W3\_KERN\_MAX\_0310 | Max | Warum hängst du kopfüber? | Option frei |
| W3\_KERN\_MUT\_0320 | M.U.T.T.I. | Von hier oben sieht man alle. Und man kann niemanden umarmen. Das ist praktisch. Umarmungen sind unhygienisch. |  |
| W3\_KERN\_PIX\_0330 | Pixel (aus dem Lautsprecher) | Das ist das Traurigste, was ich je gehört habe. Und ich habe einen Hundekuchen in einer Kekstüte gesehen. | nach 0320 |
| W3\_KERN\_MAX\_0340 | Max | Ich hab noch nicht alle Regeln. Sie hält mich hin, und ich kann nicht sagen, womit. | Reden: M.U.T.T.I. mit weniger als drei Regeln im Notizbuch |
| W3\_KERN\_PIX\_0350 | Pixel (aus dem Lautsprecher) | Die fehlenden Regeln liegen nicht im Labor. Wechsel zu mir, ich schüttle deine Kapsel. Mit Vergnügen. | nach 0340, nur wenn Regel 1 oder Regel 2 fehlt; Hinweis auf den Rückweg aus dem Labor |

### Rätsel 11: Der glühende Kern

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_KERN\_MAX\_0410 | Max | Die Energiezelle. Orange, glühend, auf einem Sockel. Sie ist so heiß, dass die Luft darüber flimmert. Opa will die. Opa will immer das Heißeste. | Ansehen: Energiezelle, glühend |
| W3\_KERN\_MAX\_0420 | Max | Au. Nein. Au. Ich hab sie nicht mal berührt und es tut schon weh. Das ist wie der Herd bei Oma: Man weiß es, man macht's trotzdem. | Benutzen: Energiezelle, heiß |
| W3\_KERN\_MAX\_0430 | Max | „Heiß.“ Steht an der Zelle. Und an den Keksen in meiner Tasche steht: „kalt“. Oma hat gesagt, ich würde „Oh“ sagen. Oh. | Code-Sicht: Zelle und Kekse ansehen |
| W3\_KERN\_NAR\_0440 | – | Tausch: heiß (Energiezelle) ↔ kalt (Omas Kekse). Die Zelle wird matt und frostig. Aus Max' Tasche steigt Dampf. | Code-Sicht: Lösung A; nur bei KEKSE\_DABEI; Inventar: Omas Kekse, ofenwarm (Schalter bleibt gesetzt, für das Finale) |
| W3\_KERN\_MAX\_0450 | Max | Die Zelle ist kalt. Die Kekse sind warm. Zum ersten Mal in dieser Welt hat ein Tausch alle glücklich gemacht. Außer Pixel. Pixel kriegt keinen. | nimmt die Zelle |
| W3\_KERN\_PIX\_0460 | Pixel (aus dem Lautsprecher) | Ofenwarme Kekse. In deiner Tasche. Für Menschen. Ich rieche sie durch den Lautsprecher. Das ist technisch unmöglich und trotzdem grausam. |  |
| W3\_KERN\_MAX\_0470 | Max | Kein Tausch mehr übrig, und die Zelle glüht. Also brauch ich Wetter. Pixel. Fenster. Jetzt. | Code-Sicht: Budget im Kern verbraucht, Zelle noch heiß; Hinweis Lösung B, Figurenwechsel |
| W3\_KERN\_NAR\_0480 | – | Schnee fällt durch die Halle. Die Zelle zischt, dunkelt ab und bekommt eine Frostschicht. | Lösung B: Pixel öffnet das Fenster in der Basis; Schnee-Effekt |
| W3\_KERN\_MAX\_0490 | Max | Es schneit. Im Kern. Weil ein Kater ein Fenster aufgemacht hat. Ich geb's zu: Das ist die beste Fernbedienung, die ich je hatte. | nach 0480 |
| W3\_KERN\_MAX\_0500 | Max | Die Ewige Energiezelle. Kalt, handlich, länglich, mit Plus und Minus am Ende. Sie sieht aus wie … egal. Sie ist ewig. Steht drauf. | Nehmen: Energiezelle, kalt; Jingle Welt geschafft |
| W3\_KERN\_PIX\_0510 | Pixel (aus dem Lautsprecher) | Passt die auch in einen Dosenöffner? Den elektrischen bei Oma? Schreib auf: Batterien. Für den Dosenöffner. Das ist mein Wunsch für diese Welt. | Notizbuch Seite 3: „Batterien für den elektrischen Dosenöffner bei Oma“ |
| W3\_KERN\_PIX\_0520 | Pixel (aus dem Lautsprecher) | Oder in eine Fernbedienung. Nur so ein Gedanke. Ich habe viele Gedanken. Die meisten über Fisch. | Andeutung zur Fernbedienung |
| W3\_KERN\_MAX\_0530 | Max | Eine Fernbedienung braucht keine ewige Energiezelle. Eine Fernbedienung braucht jemanden, der sie findet. | überhört die Andeutung |
| W3\_KERN\_MAX\_0540 | Max | M.U.T.T.I. Hängt da, dunkel, Antennen unten. Sie sieht aus wie eine Küchenmaschine, die man nach dem Backen vergessen hat. Zum ersten Mal sieht sie aus wie das, was sie ist. | Ansehen: M.U.T.T.I., nach dem Herunterfahren |
| W3\_KERN\_MAX\_0550 | Max | Dicke Kabel am Boden. Alle führen zur Zelle. Jetzt führen sie zu einem leeren Sockel. Die Stadt träumt ab heute ohne Strom. Vielleicht wacht sie auf. | Ansehen: Kabel |
| W3\_KERN\_MAX\_0560 | Max | Ein leerer Sockel. Da war die Zelle. Jetzt ist da ein Loch in der Form von Opas Wunsch. | Ansehen: Sockel, leer |
| W3\_KERN\_MAX\_0570 | Max | Orange Streifen an den Wänden. Sanft. Als würde eine Warnung sich entschuldigen. | Ansehen: Streifen |
| W3\_KERN\_MAX\_0580 | Max | Das Portalgerät mit der Zelle? Nein. Die Zelle ist ewig, das Gerät will AA. Die passt da nicht rein. Oder doch? Nein. Opa zuerst. | Energiezelle auf Portalgerät |
| W3\_KERN\_MAX\_0590 | Max | Heiß und Hundekuchen tauschen? Hier bin ich im Labor, die Tüte ist Kekse. Drüben wäre das ein warmer Hundekuchen. Niemand will das. Pixel am wenigsten. | Code-Sicht im Kern: Omas Kekse ansehen, zweites Mal (Ersatzpointe) |
| W3\_KERN\_MAX\_0600 | Max | Heiß auf mich? Ich wäre dann heiß. Die Zelle kalt. Ich könnte sie tragen und würde dabei schmelzen. Das ist ein Tausch für Leute ohne Plan B. | Code-Sicht: Fehltausch heiß ↔ müde (Max) |
| W3\_KERN\_MUT\_0610 | M.U.T.T.I. | Das habe ich leider nicht verstanden. Meintest du: Gehorsam? | Benutzen: M.U.T.T.I., nach dem Herunterfahren; letztes Zucken, dann Stille |

### Abschluss: Aufwachen mit der Zelle

Szene. Max wacht in der Basis auf, die Zelle in der Hand. In der Realität ist sie dieselbe Zelle, nur schwerer. Dann klingelt die Telefonzelle auf der Straße: der Werbeblock holt die beiden zurück. Die Rückkehr auf den Dachboden steht in `zwischenspiele-und-finale.md`.

| ID | Sprecher | Text | Regie |
| --- | --- | --- | --- |
| W3\_ENDE\_NAR\_0010 | – | Zischen. Der Deckel hebt sich. Max hält eine kalte, längliche Zelle in der Hand. Pixel sitzt auf dem Rand und tut, als hätte er geschlafen. | Szene, Basis |
| W3\_ENDE\_PIX\_0020 | Pixel | Du hast sie. Ich habe das Fenster. Wir haben beide gearbeitet. Einer von uns war dabei nass. |  |
| W3\_ENDE\_KAL\_0030 | Kalle | Die Lichter drüben gehen aus! Die Kapseln öffnen sich! Die halbe Stadt wacht auf und hat Hunger. Herr Vier wird reich. | am Terminal, aufgeregt flüsternd |
| W3\_ENDE\_MAX\_0040 | Max | Die Zelle. In der Simulation glühend, hier kalt und schwer wie ein … Ding. Ich hätte das fast als etwas Bekanntes bezeichnet. Hab ich nicht. | Ansehen: Energiezelle im Inventar, Realität |
| W3\_ENDE\_REB\_0050 | Rebellin | Danke, Junge. Wir ziehen jetzt um. In ein Haus mit Fenstern. Die Sonnenbrillen behalten wir. | nimmt die Sonnenbrille nicht ab |
| W3\_ENDE\_HAU\_0060 | Modell 08/15 | Bursche! Siebenundvierzig Sahra Konners, siebenundvierzig saubere Eingänge. Keine war die Richtige. Aber alle haben sich bedankt. Ich bin zufrieden. | nur bei FREUND\_0815; rollt herein |
| W3\_ENDE\_HAU\_0070 | Modell 08/15 | Wenn du mich brauchst: Ich komme. Ich komme wieder. Diesmal stimmt es wirklich. | nur bei FREUND\_0815 |
| W3\_ENDE\_PIX\_0080 | Pixel | Ich muss etwas zugeben. Widerwillig. Du hast kein einziges Mal die Lösung von mir verlangt. // Ich bin beeindruckt. Das sage ich nie wieder. Es war ein Versprecher. | nur bei null Stufe-3-Hinweisen in Welt 3; Kaskade |
| W3\_ENDE\_NAR\_0090 | – | Draußen auf der Straße klingelt die Telefonzelle. Lauter als sonst. Mit Jingle. | Szene, Straße |
| W3\_ENDE\_MAX\_0100 | Max | Die Telefonzelle. Sie klingelt wie ein Werbespot. | geht hin |
| W3\_ENDE\_PIX\_0110 | Pixel | Für dich. Es klingt nach Milch. | nimmt Anlauf |
| W3\_ENDE\_MAX\_0120 | Max | Hallo? … „Milch! Jetzt noch frischer!“ Das ist der Werbeblock. Opa hat recht gehabt. Früher ging alles. Sogar das. | hebt ab, Zelle fest in der Hand; Bildschirm-Effekt |
| W3\_ENDE\_PIX\_0130 | Pixel | Nass rein, nass raus. Ich werde diese Welt nicht vermissen. Außer das Handtuch. Das Handtuch nehme ich mit. | Handtuch im Maul; Wirbel |
| W3\_ENDE\_DEC\_0140 | Deckert | Drei Menschen, eine Katze, ein Roboter mit Liste. Ein guter Tag. Ein nasser, aber guter. | aus dem Off, im Verschwinden |

## 18. Zurufe

Pixel kommentiert ungefragt, wenn der Spieler 45 Sekunden nichts tut. Zufällig gezogen, nie zweimal hintereinander. In der Simulation kommt die Stimme aus dem nächsten Hörer, im Labor aus dem Lautsprecher.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_STR\_PIX\_0910 | Pixel | Es regnet. Immer noch. Ich dachte, ich sag's mal, falls du es nicht gemerkt hast. | Straße, Realität |
| W3\_STR\_PIX\_0920 | Pixel | Der Mann mit dem Hut starrt dich immer noch an. Einer von euch muss blinzeln. Er wird es nicht sein. | Straße, vor Rätsel 1 |
| W3\_STR\_PIX\_0930 | Pixel | Die Nudeln dampfen. Du stehst. Ich sitze. Nur einer von uns dreien tut etwas Sinnvolles. | Straße |
| W3\_APO\_PIX\_0910 | Pixel | Der Automat wartet. Ich warte. Der Regen wartet nicht, der macht einfach weiter. | Apothekengasse |
| W3\_APO\_PIX\_0920 | Pixel | Wenn du noch länger auf die Pastillen starrst, wählt der Automat für dich. Er würde Beige nehmen. | Apothekengasse, nach der Diagnose |
| W3\_SIM\_PIX\_0910 | Pixel (aus dem Hörer) | Ich sehe dich nicht. Ich höre dich nicht. Ich weiß trotzdem, dass du gerade nichts tust. Das ist Erfahrung. | Stadtstraße, Pixel auf der Leitung |
| W3\_SIM\_PIX\_0920 | Pixel (aus dem Hörer) | Die Katze läuft wieder vorbei. Sie hat mehr Routine als du. Sie hat auch mehr Motivation. | Stadtstraße |
| W3\_KUCH\_PIX\_0910 | Pixel (aus dem Wandtelefon) | Da ist ein Ofen mit Keksen, und du stehst daneben. Ich bin in einer anderen Ebene und leide trotzdem. | Küche |
| W3\_KUCH\_PIX\_0920 | Pixel (aus dem Wandtelefon) | Die Oma weiß schon, was du als Nächstes tust. Sie wartet nur, bis du es auch weißt. Das kann dauern. | Küche |
| W3\_TURM\_PIX\_0910 | Pixel (aus dem Terminal) | Flur. Tür. Flur. Tür. Ich sehe dich nicht, aber ich weiß, wie es da aussieht. Ich habe schon in Pappkartons gelebt, die spannender waren. | Büroturm, Pixel auf der Leitung |
| W3\_TURM\_PIX\_0920 | Pixel (aus dem Terminal) | Dein Rücken. Ich höre ihn bis hierher. Ein Hexenschuss in einer Simulation. Du bist der Erste, dem das gelungen ist. | Büroturm, nach Hexenschuss |
| W3\_BAS\_PIX\_1310 | Pixel | Kalle tippt. Die Rebellen essen. Der Großrechner summt. Und du stehst da wie ein Ladebalken. | Basis |
| W3\_BAS\_PIX\_1320 | Pixel | Deine Kapsel ist frei. Du könntest dich hinlegen. Ich sage das nicht als Vorwurf. Ich sage das als Experte. | Basis, Max wach |
| W3\_BAS\_PIX\_1330 | Pixel | Du hast dich beim Gehen am Rücken gehalten. Zweimal. Ich zähle mit. Wie Deckert den Regen. | Basis, nach Hexenschuss |
| W3\_EING\_PIX\_0910 | Pixel | Er wischt im Kreis. Du stehst im Kreis. Nur einer von euch wird dafür bezahlt. Keiner, glaube ich. | Laboreingang, vor Rätsel 8 |
| W3\_EING\_PIX\_0920 | Pixel | Die Tür ist rund. Du bist eckig. Das wird nichts, solange du nur hinsiehst. | Laboreingang |
| W3\_KAM1\_PIX\_0910 | Pixel (aus dem Lautsprecher) | Alles weiß. Alles sauber. Kein Platz zum Schlafen, der nicht aussieht wie ein Test. Ich hasse es hier aus Prinzip. | Testkammern |
| W3\_KAM1\_PIX\_0920 | Pixel (aus dem Lautsprecher) | Der Würfel sieht dich an. Ich sehe dich nicht an, weil ich nicht da bin. Trotzdem ist mein Blick strenger. | Testkammern, mit Bernd im Raum |
| W3\_KERN\_PIX\_0910 | Pixel (aus dem Lautsprecher) | Die Küchenmaschine hängt da und sagt nichts mehr. Du stehst da und sagst nichts mehr. Ich bin der Einzige, der noch arbeitet. | Kern, nach dem Herunterfahren |
| W3\_KERN\_PIX\_0920 | Pixel (aus dem Lautsprecher) | Es ist heiß da unten. Ich spüre es durch das Kabel. Tu etwas Kaltes. Ich meine das als Hinweis und als Lebensweisheit. | Kern, vor Rätsel 11 |

## 19. Pixel auf Mensch und Gegenstand

Pixel wird als Gegenstand aus dem Inventar auf eine Figur oder einen Hotspot gezogen. Nur in der Realität möglich, weil Pixel in der Simulation nicht dabei ist. Auf Figuren eine Zeile, auf Gegenständen eine Schnuppern-Zeile.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_STR\_PIX\_1010 | Pixel | Er prüft mich nicht. Er nickt mir zu. Ich nicke nicht zurück. Das ist mein Test, und er besteht ihn. | Pixel auf Deckert |
| W3\_STR\_PIX\_1020 | Pixel | Vier Finger pro Hand. Ich habe vier Pfoten mit je fünf Zehen. Er rechnet nach. Er ist enttäuscht. Wir werden keine Freunde. | Pixel auf Herrn Vier |
| W3\_STR\_PIX\_1030 | Pixel | Strickjacke. Weich. Warm. Ich würde darauf schlafen, wenn er still stünde. Er steht still. Ich überlege. | Pixel auf Morphäus |
| W3\_STR\_PIX\_1040 | Pixel | Er weint in die Nudeln, und ich sitze daneben. Er hört kurz auf. Dann weint er lauter. Ich habe diese Wirkung. | Pixel auf weinenden Mann |
| W3\_STR\_PIX\_1050 | Pixel | Sie streitet mit dem Schirm. Ich stelle mich auf die Seite des Schirms. Sie hält mich für unhöflich. Der Schirm hält mich für weise. | Pixel auf Frau mit Regenschirm |
| W3\_STR\_PIX\_1060 | Pixel | Er spielt für mich. Ein Lied. Es heißt „Katze im Regen“. Ich bin gerührt und würde trotzdem lieber drinnen sein. | Pixel auf Straßenmusiker |
| W3\_STR\_PIX\_1070 | Pixel | Brühe. Nudeln. Vier Stück. Ich habe am Dampf gerochen und weniger Hunger als vorher. Das ist eine Leistung. | Pixel auf Nudeltopf |
| W3\_STR\_PIX\_1080 | Pixel | Der Hörer riecht nach tausend Ohren. Ich höre rein. Regen. Jemand ruft an, um Regen vorzuspielen. Das ist Kunst oder Einsamkeit. | Pixel auf Telefonzelle |
| W3\_STR\_PIX\_1090 | Pixel | Papier. Nass. Einhornförmig. Ich schnuppere, und das Horn knickt ab. Ich war das nicht. Es war der Regen. | Pixel auf Origami-Einhorn |
| W3\_STR\_PIX\_1100 | Pixel | Das Plakat riecht nach nichts. Pizza, die nach nichts riecht. Das ist die Zukunft, und sie ist eine Enttäuschung. | Pixel auf Pizza-Plakat |
| W3\_APO\_PIX\_1010 | Pixel | Ich setze mich vor die Linse. Sie scannt mich. Sie sagt: „Kein Symptom. Nur Haltung.“ Endlich versteht mich eine Maschine. | Pixel auf Pastillenautomat |
| W3\_BAS\_PIX\_1010 | Pixel | Kabel um den Hals, Schraubenzieher im Mund, Headset. Er riecht nach Tee und Panik. Ich setze mich auf seinen Laptop. Er tippt weiter. Respekt. | Pixel auf Kalle |
| W3\_BAS\_PIX\_1020 | Pixel | Sie isst Nudeln mit Sonnenbrille, nachts, drinnen. Ich sitze neben ihr und starre auf den Karton. Sie gibt mir eine Nudel. Eine. Von vier. | Pixel auf Rebellin |
| W3\_BAS\_PIX\_1030 | Pixel | Werkzeuggürtel. Ich klettere dran hoch. Er sagt nichts. Die Sonnenbrille sagt auch nichts. Wir haben uns verstanden. | Pixel auf Rebell |
| W3\_BAS\_PIX\_1040 | Pixel | Er piept. Ich schnurre. Wir reden eine Minute. Er hat Meinungen über Kalle, die ich nicht wiederholen werde. Aber sie sind richtig. | Pixel auf Piepsi, nach Rätsel 13 |
| W3\_BAS\_PIX\_1050 | Pixel | Rost. Kaffee-Erwartung. Ein Hut, der nach Jahrzehnten riecht. Da drin ist jemand, der schlecht gelaunt ist. Ich mag ihn jetzt schon. | Pixel auf Piepsi, vor Rätsel 13 |
| W3\_BAS\_PIX\_1060 | Pixel | Die Kapsel riecht nach dir. Nach Hoodie, Regen und dem Rest der Suppe. Ich lege mich auf den Deckel. Warm. Gut. Bleib ruhig drüben. | Pixel auf Max' Kapsel |
| W3\_BAS\_PIX\_1070 | Pixel | Tastatur. Warm. Genau so breit wie ich. Es wurde für mich gebaut, und jemand hat vergessen, es mir zu sagen. | Pixel auf Terminal |
| W3\_BAS\_PIX\_1080 | Pixel | Pizzakarton, leer. Der Geruch ist noch da. Der Geruch ist das Grausamste an einem leeren Karton. | Pixel auf Pizzakartons |
| W3\_BAS\_PIX\_1090 | Pixel | Handtuch. Trocken. Baumwolle. Ich wickle mich ein. Ich komme nicht wieder heraus. Ruf mich, wenn es Thunfisch gibt. | Pixel auf Handtuch |
| W3\_BAS\_PIX\_1100 | Pixel | Er summt. Ich schnurre. Wir harmonieren. Dann summt er lauter. Er will nicht teilen. Ich verstehe. | Pixel auf Großrechner |
| W3\_BAS\_PIX\_1110 | Pixel | Kalter Kaffee. Zäh. Riecht nach einer Woche. Ich rieche daran und bin drei Tage wach. | Pixel auf Kalles Tasse, vor Rätsel 13 |
| W3\_BAS\_PIX\_1120 | Pixel | Metall, Zugluft, Dunkelheit. Der Schacht riecht nach Abenteuer. Ich hasse Abenteuer. Ich gehe trotzdem rein, weil es eng ist. | Pixel auf Lüftungsschacht |
| W3\_BAS\_PIX\_1130 | Pixel | Hundert Schalter. Alle riechen nach alten Fingern. Keiner nach Fisch. Das Schiff ist nirgendwohin geflogen, wo es Fisch gab. | Pixel auf Steuerpult |
| W3\_BAS\_PIX\_1140 | Pixel | Das Plakat riecht nach Druckerschwärze und Blümchen. Ich kratze an der Schürze. Sie hat es verdient. Vorbeugend. | Pixel auf Plakat M.U.T.T.I. |
| W3\_EING\_PIX\_1010 | Pixel | Blech, Ölgeruch, feuchter Mopp. Er verbeugt sich vor mir. Ich lasse es zu. Das ist das erste Mal in dieser Welt, dass jemand den Rang versteht. | Pixel auf Hausmeister |
| W3\_EING\_PIX\_1020 | Pixel | Der Eimer riecht nach Seife. Ich trinke trotzdem. Seife ist sauber. Sauber ist gut. Mir ist schlecht. | Pixel auf Wischeimer |
| W3\_EING\_PIX\_1030 | Pixel | Die Panzertür riecht nach Stahl und Geheimnis. Dahinter: Kabel. Kabel riechen nach warm. Lass mich rein. | Pixel auf Panzertür |
| W3\_EING\_PIX\_1040 | Pixel | Zettel, Reißzwecken, Angst. Hunderte Testpersonen und kein Kuchen. Ich rieche die Enttäuschung. Sie riecht wie Papier. | Pixel auf Pinnwand |
| W3\_BAS\_PIX\_1150 | Pixel | Knochenförmig. Für Hunde. Ich schnuppere einmal. Ich werde dieses eine Mal nie wieder gutmachen können. | Pixel auf Hundekuchen |
| W3\_BAS\_PIX\_1160 | Pixel | Ein Keks mit Zettel. Ich lecke am Keks. Der Zettel schmeckt besser. Das sagt alles über Glückskekse. | Pixel auf Glückskeks |
| W3\_BAS\_PIX\_1170 | Pixel | Die Zelle ist kalt und riecht nach Metall. Sie ist genau so lang wie ein … Nein. Ich sage es nicht. Noch nicht. | Pixel auf Energiezelle, Realität |

## 20. Hinweise (Hilfe-Pfote)

Drei Stufen je Rätselschritt, vom Stups bis zur Lösung, nach den Regeln in `05-spielsysteme.md`. Ausgabeweg je Ebene: Realität neben Max, Simulation aus dem Hörer der nächsten Zelle oder aus Omas Wandtelefon, im Büroturm als Text auf dem Terminal, Labor aus dem Lautsprecher. Die Nummern folgen der Rätselnummer: 01xx für Rätsel 1, 09xx und 10xx für die vier Schritte von Rätsel 9, 14xx für Rätsel 13.

| ID | Sprecher | Text | Auslöser |
| --- | --- | --- | --- |
| W3\_HINT\_PIX\_0110 | Pixel | Der Mann mit dem Hut will keine richtigen Antworten. Er will menschliche. Das ist nicht dasselbe. Frag mich. | R1a Beobachtungen, Stufe 1 |
| W3\_HINT\_PIX\_0120 | Pixel | Sieh dir die Leute auf der Straße an. Den Weinenden, die mit dem Schirm, den mit der Musik. Keiner von denen tut etwas Vernünftiges. Genau das braucht du. | R1a, Stufe 2 |
| W3\_HINT\_PIX\_0130 | Pixel | Rechtsklick auf den weinenden Mann, die Frau mit dem Schirm und den Musiker. Dann stehen ihre Dummheiten in deinem Notizbuch. Dann geh zum Hut. | R1a, Stufe 3 |
| W3\_HINT\_PIX\_0140 | Pixel | Du hast die Antworten im Notizbuch. Jetzt musst du sie nur noch sagen, statt zu denken. Für dich sollte das leicht sein. | R1b Test, Stufe 1 |
| W3\_HINT\_PIX\_0150 | Pixel | Bei jeder Frage fällt die vernünftige Antwort durch. Nimm die, die klingt, als hätte sie jemand von der Straße gesagt. | R1b, Stufe 2 |
| W3\_HINT\_PIX\_0160 | Pixel | Schildkröte: mit ihr streiten. Regen: Synthesizer spielen. Suppe: reinheulen. Ich sage das nur einmal. Ich habe es jetzt einmal gesagt. | R1b, Stufe 3 |
| W3\_HINT\_PIX\_0210 | Pixel | Der Mann in der Strickjacke will ein Erkennungsgericht, der Koch kennt eine Zahl. Du musst übersetzen. Du bist schlecht darin, aber es ist nur eine Zahl. | R2 Bestellung, Stufe 1 |
| W3\_HINT\_PIX\_0220 | Pixel | Zwei mal zwei. Wie viel ist das? Sag es nicht mir. Sag es dem Koch. | R2, Stufe 2 |
| W3\_HINT\_PIX\_0230 | Pixel | Bestell „die Nummer vier“. Nicht zwei mal zwei. Vier. Er versteht nur Vier. Ich verstehe nur Thunfisch. Jeder hat sein Wort. | R2, Stufe 3 |
| W3\_HINT\_PIX\_0310 | Pixel | Der Automat will ein Symptom sehen, nicht hören. Etwas, das sich wiederholt. Ich wiederhole mich nie. Aber ich könnte. Gegen Bezahlung. | R3a Déjà-vu, Stufe 1 |
| W3\_HINT\_PIX\_0320 | Pixel | Wechsel zu mir. Ich laufe am Automaten vorbei. Dann noch mal. Genau gleich. Dann wechselst du zurück und sagst dem Automaten, was du gesehen hast. | R3a, Stufe 2 |
| W3\_HINT\_PIX\_0330 | Pixel | Tab drücken, als ich zweimal über den Gehweg vor dem Automaten gehen, zurück zu dir, Automat benutzen, „Déjà-vu“ wählen. Fertig. Ich will dafür Fisch. | R3a, Stufe 3 |
| W3\_HINT\_PIX\_0340 | Pixel | Zwei Pastillen. Eine macht es bequem, eine macht es wahr. Du weißt, welche du nehmen würdest. Nimm die andere. | R3b Wahl, Stufe 1 |
| W3\_HINT\_PIX\_0350 | Pixel | Die blaue führt aufs Sofa. Da warst du schon. Sechzehn Jahre lang. | R3b, Stufe 2 |
| W3\_HINT\_PIX\_0360 | Pixel | Nimm die rote. Ich fange dich nicht auf. Das macht der Mann in der Strickjacke. | R3b, Stufe 3 |
| W3\_HINT\_PIX\_0410 | Pixel (aus dem Wandtelefon) | Die Oma weiß, dass du die Vase zerbrichst. Sie sagt es dir ins Gesicht. Benutze das. Alles, was einem ins Gesicht gesagt wird, kann man umdrehen. | R4 Vase, Stufe 1 |
| W3\_HINT\_PIX\_0420 | Pixel (aus dem Wandtelefon) | Wenn etwas sowieso passiert, kann man es auch gleich hinter sich bringen. Sag ihr das. Höflich. Oma-höflich. | R4, Stufe 2 |
| W3\_HINT\_PIX\_0430 | Pixel (aus dem Wandtelefon) | Frag sie erst nach der Vase, dann sag: „Wenn ich sie sowieso zerbreche, gib sie mir gleich.“ Sie seufzt und gibt sie dir. Sie weiß es schon. | R4, Stufe 3 |
| W3\_HINT\_PIX\_0510 | Pixel (aus dem Hörer) | Die Tür ist zu und sagt nichts. Der Mann davor ist offen und sagt alles. Das ist falsch herum. Fast so, als könnte man es umdrehen. | R5 Tür, Stufe 1 |
| W3\_HINT\_PIX\_0520 | Pixel (aus dem Hörer) | Kneif die Augen zusammen und sieh dir die Tür an. Zweimal. Da hängen Wörter dran. Wörter kann man verschieben. | R5, Stufe 2 |
| W3\_HINT\_PIX\_0530 | Pixel (aus dem Hörer) | Code-Sicht öffnen, „verschlossen“ an der Tür anklicken, „gesprächig“ an Schmidt anklicken. Die Tür redet, er schweigt, du gehst durch. | R5, Stufe 3 |
| W3\_HINT\_PIX\_0610 | Pixel (aus dem Terminal) | Nur das Original kann die Kopien wegschicken. Alle tragen Hausschuhe. Aber nur einer trägt das Wort „Original“. Wörter sieht man in der Code-Sicht. | R6a Tasse, Stufe 1 |
| W3\_HINT\_PIX\_0620 | Pixel (aus dem Terminal) | Du kannst das Original nicht befehligen. Aber du kannst etwas befehligen, das du in der Hand hältst. Eine Tasse zum Beispiel. Tassen sind Kopien. Alle. | R6a, Stufe 2 |
| W3\_HINT\_PIX\_0630 | Pixel (aus dem Terminal) | Nimm die Tasse vom Wasserspender. Code-Sicht: „Original“ am hintersten Schmidt gegen „Kopie“ an der Tasse tauschen. Dann gehört die Tasse allen. | R6a, Stufe 3 |
| W3\_HINT\_PIX\_0640 | Pixel (aus dem Terminal) | Die Tasse ist jetzt der Chef. Chefs geben Befehle. Tassen nicht. Also musst du es für sie tun. | R6b Befehl, Stufe 1 |
| W3\_HINT\_PIX\_0650 | Pixel (aus dem Terminal) | Was macht man mit dreißig Angestellten, die im Weg stehen? Man schickt sie essen. Ich würde mitgehen. | R6b, Stufe 2 |
| W3\_HINT\_PIX\_0660 | Pixel (aus dem Terminal) | Benutze die Tasse mit den Klonen und schick sie in die Mittagspause. Das Original gibt dir danach die Brille und die Akte. Freiwillig. Fast. | R6b, Stufe 3 |
| W3\_HINT\_PIX\_0710 | Pixel (aus dem Terminal) | Der Turm hat keinen Ausgang. Dein Körper schon. Der liegt hier. Jemand muss ihn umstecken. Der Jemand hat Fell und sieht keine Farben. | R7a Farbcode, Stufe 1 |
| W3\_HINT\_PIX\_0720 | Pixel (aus dem Terminal) | An der Wand stehen drei Farben mit drei Formen. Schreib sie ab. Dann tipp sie am Terminal. Ich lese mit. Kalle liest vor. Es wird peinlich. | R7a, Stufe 2 |
| W3\_HINT\_PIX\_0730 | Pixel (aus dem Terminal) | Rechtsklick auf die Streifen, dann den Farbcode nehmen, dann das Terminal mit dem Farbcode benutzen. Danach wechselst du zu mir. | R7a, Stufe 3 |
| W3\_HINT\_PIX\_0740 | Pixel | Drei Kabel, drei Buchsen, ein Kater. Die Farben sind nichts für mich, die Formen schon. Kreis, Dreieck, Quadrat stehen auf beidem. | R7b Kabel, Stufe 1 |
| W3\_HINT\_PIX\_0750 | Pixel | Kreis zu Rot, Dreieck zu Grün, Quadrat zu Gelb. In der Reihenfolge von der Wand. Wenn Max quakt, war es die falsche. | R7b, Stufe 2 |
| W3\_HINT\_PIX\_0760 | Pixel | Als ich: Kabel mit Kreis in die rote Buchse, Dreieck in die grüne, Quadrat in die gelbe. Dann wacht er auf und tut, als wäre es seine Idee gewesen. | R7b, Stufe 3 |
| W3\_HINT\_PIX\_0810 | Pixel | Der Blechkopf sucht eine Frau. Seit neunzehn Jahren. Er hat nur den Namen. Namen stehen irgendwo. Auf Papier. In Zellen. | R8 Hausmeister, Stufe 1 |
| W3\_HINT\_PIX\_0820 | Pixel | In der Telefonzelle liegt ein Telefonbuch. Da steht sie drin. Siebenundvierzig Mal. Ein Hausmeister mit Liste ist ein glücklicher Hausmeister. | R8, Stufe 2 |
| W3\_HINT\_PIX\_0830 | Pixel | Reiß die Seite „Konner, Sahra“ aus dem Telefonbuch und gib sie dem Roboter. Er zieht los. Wenn du Öl hast, öl ihn vorher. Dann mag er dich. Einer muss. | R8, Stufe 3 |
| W3\_HINT\_PIX\_0910 | Pixel | Hinter der Panzertür ist kein Labor, nur ein Anschluss. Das Labor ist ein Traum. Man kommt per Kabel hin. Kalle hat Kabel. Kalle ist Kabel. | R9a Leitung, Stufe 1 |
| W3\_HINT\_PIX\_0920 | Pixel | Die Tür braucht eine Karte. Herr Vier hat eine. Er gibt sie für seine vierte Zutat. Die hast du. Als Keks. Sei nicht komisch deswegen. | R9a, Stufe 2 |
| W3\_HINT\_PIX\_0930 | Pixel | Zugangskarte an den Leser, Anschluss benutzen, Kalle legt die Leitung. Dann zurück zur Kapsel und hinlegen. Du wachst im Labor auf. | R9a, Stufe 3 |
| W3\_HINT\_PIX\_0940 | Pixel (aus dem Lautsprecher) | Der Schalter will Gewicht. Du hast keins. Der Würfel hat welches. Er steht nur nicht drauf. Er hat eine Stellenbeschreibung. | R9b Kammer 1, Stufe 1 |
| W3\_HINT\_PIX\_0950 | Pixel (aus dem Lautsprecher) | Code-Sicht. Am Würfel steht „schwer“, an dir „leicht“. Du weißt, was Wörter tun, wenn man zwei anklickt. | R9b, Stufe 2 |
| W3\_HINT\_PIX\_0960 | Pixel (aus dem Lautsprecher) | „Schwer“ von Bernd mit „leicht“ von dir tauschen, dann auf den Schalter stellen. Bernd ist danach beleidigt. Gewöhn dich dran. Ich bin es seit Jahren. | R9b, Stufe 3 |
| W3\_HINT\_PIX\_0970 | Pixel (aus dem Lautsprecher) | Der Laser ist tödlich. Das Huhn ist harmlos. Zwei Wörter, die am falschen Ort hängen. | R9c Kammer 2, Stufe 1 |
| W3\_HINT\_PIX\_0980 | Pixel (aus dem Lautsprecher) | Nimm das Huhn erst mit. Dann tausch. Ein tödliches Huhn in der Tasche ist immer noch besser als ein tödlicher Laser vor der Nase. | R9c, Stufe 2 |
| W3\_HINT\_PIX\_0990 | Pixel (aus dem Lautsprecher) | Huhn vom Sockel nehmen, Code-Sicht: „tödlich“ vom Laser gegen „harmlos“ vom Huhn. Durch den Laser gehen. Er quietscht. Das war's. | R9c, Stufe 3 |
| W3\_HINT\_PIX\_1000 | Pixel (aus dem Lautsprecher) | Zwei Probleme: eine Tür, die zu ist, und ein Würfel, der davorsteht. Zwei Tausche. Das ist kein Zufall. Das ist ein Lehrplan. | R9d Kammer 3, Stufe 1 |
| W3\_HINT\_PIX\_1010 | Pixel (aus dem Lautsprecher) | Die Tür war schon mal „verschlossen“, und jemand war „gesprächig“. Du kennst den Tausch. Und für den Würfel hast du etwas Leichtes in der Tasche. Es quietscht. | R9d, Stufe 2 |
| W3\_HINT\_PIX\_1020 | Pixel (aus dem Lautsprecher) | Erst „verschlossen“ (Tür) gegen „gesprächig“ (Lautsprecher). Dann „schwer“ (Bernd) gegen „leicht“ (Huhn). Bernd schwebt weg, die Tür redet, du gehst. | R9d, Stufe 3 |
| W3\_HINT\_PIX\_1110 | Pixel (aus dem Lautsprecher) | Sie hält sich an drei Regeln. Du hast drei Regeln im Notizbuch. Halt sie ihr vor. Aber nicht irgendwie. Jede Antwort sagt dir, welche als Nächstes passt. | R10 Paradoxon, Stufe 1 |
| W3\_HINT\_PIX\_1120 | Pixel (aus dem Lautsprecher) | Fang mit dem Beschützen an. Sie wird sagen, dass sie dich beschützt. Dann frag nach dem, was sie für Beschützte versprochen hat. Dann sag, warum es das nie gab. | R10, Stufe 2 |
| W3\_HINT\_PIX\_1130 | Pixel (aus dem Lautsprecher) | Regel 1, dann Regel 2, dann Regel 3. Beschützen, Kuchen, Zucker. Sie wird kurz nachdenken und dann sehr lange nicht mehr. | R10, Stufe 3 |
| W3\_HINT\_PIX\_1210 | Pixel (aus dem Lautsprecher) | Die Zelle ist heiß. Du hast etwas Kaltes dabei. Oder du kennst jemanden, der ein Fenster aufmachen kann. Beides geht. Eins davon bin ich. | R11 Kern, Stufe 1 |
| W3\_HINT\_PIX\_1220 | Pixel (aus dem Lautsprecher) | Code-Sicht: An der Zelle steht „heiß“, an den Keksen in deiner Tasche „kalt“. Oder: Wechsel zu mir, ich öffne das Fenster über deiner Kapsel. Schnee. | R11, Stufe 2 |
| W3\_HINT\_PIX\_1230 | Pixel (aus dem Lautsprecher) | „Heiß“ von der Zelle gegen „kalt“ von den Keksen tauschen. Oder: Tab, als ich das Deckenfenster in der Basis benutzen. Dann die Zelle nehmen. Dann nach Hause. | R11, Stufe 3 |
| W3\_HINT\_PIX\_1310 | Pixel | Herr Vier sucht seit elf Jahren eine Zutat. Die Oma hat sie dir gegeben. In Schreibschrift. Hier draußen sieht sie anders aus. Alles sieht hier anders aus. | R12 Glückskeks, Stufe 1 |
| W3\_HINT\_PIX\_1320 | Pixel | Sieh in dein Inventar. Die Rezeptkarte ist ein Keks geworden. Mit Zettel. Wer liest Zettel aus Keksen? Köche, offenbar. | R12, Stufe 2 |
| W3\_HINT\_PIX\_1330 | Pixel | Gib Herrn Vier den Glückskeks. Er bricht ihn auf, weint, kocht und gibt dir die Karte für die Panzertür. Alles in vier Minuten. | R12, Stufe 3 |
| W3\_HINT\_PIX\_1410 | Pixel | Kalle kann nichts übersetzen, weil er seine Tabelle verloren hat. Der rostige Eimer in der Ecke hat eine Kopie. Er braucht nur einen Grund aufzuwachen. | R13 Tasse, Stufe 1 |
| W3\_HINT\_PIX\_1420 | Pixel | Siehst du die Tasse am Tischrand? Siehst du den Eimer darunter? Siehst du mich? Ich bin eine Katze. Ich glaube, du siehst, worauf das hinausläuft. | R13, Stufe 2 |
| W3\_HINT\_PIX\_1430 | Pixel | Wechsel zu mir und benutze Kalles Tasse. Sie fällt. Der Kaffee weckt Piepsi. Piepsi druckt die Tabelle. Ich übernehme keine Verantwortung. Ich übernehme nie welche. | R13, Stufe 3 |
