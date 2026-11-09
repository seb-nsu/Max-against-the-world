# Prompt-Prüfung: Stil, Max und Pixel, Prolog und Finale

Stand 9. November 2026. Geprüft wurden 76 Prompts in drei Tabs, 66 davon geändert; dazu kommen 10 neue Prompts. Grundlage: Bausteine und Aufbau-Regeln im Tab Grafik, Steckbriefe, Rätsel Prolog, Skript Prolog, Skript Zwischenspiele und Finale, Konzept, Spielsysteme. Alle Prompts bleiben englisch, alle Erläuterungen deutsch. Nichts wurde gelöscht.

## Tab Grafik (Stil und Werkzeuge)

| Stelle | Änderung | Grund |
| --- | --- | --- |
| Baustein KONZEPT | Kamera auf Brusthöhe, kein Fluchtpunkt, keine Auf- oder Dreiviertelsicht, Bodenband in der Mitte frei, Licht oben links mit Schatten nach rechts unten, „no letters“ | Konzeptbilder kamen mit falscher Perspektive (Dachboden) |
| Baustein HINTERGRUND | Augenhöhe, kein Fluchtpunkt, Bodenband etwa 60 Pixel hoch, große Objekte nur an Rückwand oder Rand, Ausgänge lesbar, Schattenrichtung, keine Konturen | Laufweg und Bühnenansicht verbindlich machen; Regel „Hintergründe ohne Kontur“ |
| Baustein FIGUR | Strenge Seitenansicht nach rechts (sofern das Motiv nicht links sagt), 64×64-Leinwand, Füße an der Unterkante, Kontur nicht schwarz, Licht oben links, flache Farben, kein Bodenschatten | Einheitliche Größe und saubere Freistellung |
| Baustein FIGUR-KLEIN | Blickrichtung, 32×32-Leinwand, Größe aus dem Motiv, Licht, kein Schatten | wie oben |
| Baustein FIGUR-GROSS | Blickrichtung, Leinwand bis 128×128, Licht, kein Schatten | wie oben |
| Baustein PORTRÄT | Farben wie das Sprite, Licht oben links, keine Hände, kein Text | Porträt passt zur Spielfigur |
| Baustein KARTE | Senkrecht von oben, mindestens 16 Pixel Abstand zwischen Orten, keine Beschriftung | Klickbare Orte trennen |
| Baustein GEGENSTÄNDE | Raster genau wie im Motiv, Lesereihenfolge auch nach unten, leichte Vorderansicht, keine Überlappung, Licht, keine Zahlen | Sammelbilder sauber ausschneidbar |
| Baustein EFFEKT | Bildzahl und Bildgröße aus dem Motiv, alle Bilder gleich groß und zentriert, kein Text | Direkt in Godot nutzbar |
| Baustein ANIMATION (Schema) | Ausgangsbild an erster Stelle, gleiche Größe, Farben und Kontur wie das Eingabebild, Füße auf einer Grundlinie | Reihenfolge laut Aufbau-Regel |
| Verbotenes | Ergänzt um anti-aliasing, isometric, top-down, Fluchtpunkt, schräger Boden, schwarze Kontur, Schlagschatten, abgeschnittene Füße, Signatur; Hinweis zu Karte, Hintergründen und ChatGPT/Gemini | Häufigste Fehlerbilder ausschließen |
| Steckbrief Max | Hex-Farben aus Endesga 32 (Haare #733e39, Hoodie #3a4466, TV-Motiv #2ce8f5, Jeans #124e89, Sneaker #e43b44), Strähne über dem rechten Auge, Sommersprossen, Ärmel über den Händen, ungleiche Kordeln, offener Schnürsenkel | „dark charcoal grey“ widersprach dem Grundton #3a4466; Merkmale aus dem Steckbrief fehlten |
| Steckbrief Pixel | Hex-Farben (Fell #c0cbdc, Streifen #5a6988, Augen #feae34, Halsband #e43b44, Leuchte #2ce8f5), drei Streifen, kurze Beine, Ohrkerbe, „not orange, no tabby markings“ | Streifen und Augenfarbe fehlten; Abgrenzung zu Comic-Katern |
| Reisegepäck (3×3) | Etikett leer, Dose mit Lake, Käsekruste am Löffelkopf, Flügel an der Ferse | Kein Text; Skript sagt Thunfisch in Lake |
| Fernbedienungen (1×4 → 1×5) | Opas graue Fernbedienung mit Lauter, Leiser, Programm, Stumm und roter Taste oben; neu: dieselbe von hinten mit offenem, leerem Batteriefach | Finale: Zündkapsel ohne Zelle unter dem Ohrensessel |
| Animation Max Gehen, Stehen | Standbild als Eingabe, Hände bleiben in der Tasche, Grundlinie | Reihenfolge laut Aufbau-Regel |
| Animation Max auf dem Sofa | Neues Standbild A: liegend mit Handy über dem Gesicht (Prolog, Welt 3); Standbild B mit Fernbedienung (Welt 4) | Prolog-Szene 1 und Welt 3 verlangen das Handy, nicht die Fernbedienung |
| Animation Max vom Sofa aufstehen | Auch im Prolog (Handy in die Tasche); im Finale Ende in aufrechter Pose | Skript P0_WOHN_0070 und FI_WOHN_0300 |
| Animation Pixel Gehen, Stehen, Schlafen, Putzen, Schnuppern, Fauchen, Ohrfeige | Blickrichtung rechts, Größen (26 Pixel lang, 10×24 schlafend), Eingabebild | Blickrichtung fehlte |
| Animation Pixel Springen | Höhe etwa 30 Pixel, auch Prolog und Zwischenspiele (auf die Werkbank) | Skript P0_DACH_0360, ZS1_DACH_0210 |
| Animation Pixel Tragen | Fragment „Variante von Gehen“ durch vollständigen Prompt ersetzt; gilt auch für Rückkehr 3 und Finale (Zelle im Maul) | ZS3_DACH_0130, FI_RAET_0210 |
| Animation Pixel vom Schrank fallen | Hoher Schrank statt Regal, Fallhöhe, Blickrichtung, Ort Wohnzimmer | FI_WOHN_0280 |

Unverändert geprüft: Max Sprechen, Aufheben, Benutzen, Schulterzucken, Gähnen (vollständig).

## Tab Max und Pixel

| Stelle | Änderung | Grund |
| --- | --- | --- |
| 1. Konzeptbild Max | Hex-Farben, Kopf ein Viertel der Höhe, Strähne über dem rechten Auge, drei Ansichten in einer Reihe auf gleicher Höhe, Seitenansicht nach rechts, neutrale Pose, Ausdrücke genauer, „no text, no labels“ | „charcoal grey“ passte nicht zu #3a4466; Blickrichtung fürs Spiel |
| 1. Konzeptbild Pixel | Hex-Farben, kurze Beine, Ohrkerbe deutlich, Abgrenzung (kein Orange, keine Tabby-Zeichnung, keine schweren Lider), Ansichten nach rechts, Ausdrücke genauer | Abgrenzung aus dem Steckbrief fehlte im Prompt |
| 2. Spielfigur Max | Vollständiger Prompt aus Baustein FIGUR plus wortgleichem Steckbrief plus Pose; 64×64, Kopf 14 Pixel, Kontur #262b44 | Regel „Steckbrief wortgleich verwenden“ |
| 2. Spielfigur Pixel | Vollständiger Prompt aus FIGUR-KLEIN plus Steckbrief; 32×32, Kontur #3a4466 | wie oben |
| Neu: Aufrechte Fassung Max | Eigener Prompt für Rückkehr 3 und Finale, Hände aus der Tasche | Steckbrief „Entwicklung im Bild“ verlangte die Pose, es gab keinen Prompt |
| 3. Ansichten | Fragment „dasselbe Motiv mit front, side, back view“ durch zwei vollständige Turnaround-Prompts ersetzt (Max 56 Pixel, Pixel sitzend 18 und gehend 26 Pixel) | Nicht direkt nutzbar |
| Neu: 4. Porträts | Je ein Prompt für Max (sechs Ausdrücke) und Pixel (fünf Ausdrücke) mit Platzhalter für den Ausdruck | Mimik-Listen hatten keinen Prompt; Figurenwechsel braucht sie |

## Tab Prolog und Finale

| Stelle | Änderung | Grund |
| --- | --- | --- |
| Farb-Baustein | Gilt nicht für Max, Pixel und Werbeblock | Max und Pixel bleiben in den 32 Grundfarben (Tab Grafik) |
| Szene Dachboden, Zustände | Lichtstimmungen nach Skript: Nachmittag, später Nachmittag, früher Abend ohne Lampe, Abendrot mit Lampe; Kalenderkreis einfach, doppelt, mit Ausrufezeichen | Alte Liste (Abend mit Lampe, Nacht) passte nicht zu ZS1 bis ZS3 |
| Szene Dachboden, Muss sichtbar | Ergänzt um Werkbank-Ablage, Verlängerungskabel mit Steckdose, Ohrensessel, Dachfenster, Lampe, freie Plätze für Zapp-O-Mat und Deko | Hotspots aus Skript Prolog Abschnitt 7 und ZS3 (Lampe) |
| Szene Dachboden, Motiv | Neu in strenger Bühnenansicht: Giebelwand frontal, Dachschrägen nur als Sparren, Fenster oben links (Licht von links), Lampe, Ohrensessel an der Wand, Luke im Bodenband vorne rechts | S15: Konzeptbild hatte falsche Perspektive; „skylight“ widersprach der Seitenansicht |
| Neu: Dachboden neu erzeugen | Absatz mit vollständigem KONZEPT-Prompt (ChatGPT/Gemini, alle Dachboden-Objekte samt Deko zur Orientierung) und vollständigem Retro-Diffusion-Prompt (Baustein + Motiv + Farb-Baustein) plus Negativ-Feld | S15 |
| Szene Dachboden Finale | Lampe an, Mond; Maschine etwa 110 Pixel, Fassungen links Ei und rechts Mehl, Ofentür in Hüfthöhe, Lämpchen; Platz für den Zapp-O-Mat links; zweites Bild „Maschine steht, Ofentür offen mit Kuchen, Riegel zurück“ | FI_DACH_0080 (links, rechts), FI_AUFL (Stopp), Zustände als Paar |
| Szene Wohnzimmer | Nachmittag für Prolog und Welt 3, Abend als Paar; hoher Schrank links für Pixel; Staubrand auf dem Couchtisch; Bildschirm zum Betrachter; Platz für Familienfoto | Prolog-Szene 1 spielt nachmittags; FI_WOHN Pixel auf dem Schrank; P0_WOHN_0140 Staubrand |
| Szene Wohnzimmer Geburtstag | Abend, gleiche Bildaufteilung, Girlande an der Wand, schiefer dampfender Kuchen, Platz für den Zapp-O-Mat auf dem Rolltisch | FI_WOHN Regie und Ansehen-Zeilen |
| Szene Treppenhaus | Nachmittag als Grundbild, Abend als Paar; Treppe als Sägezahnlinie in Seitenansicht; freier Haken für den Propellerhut; Tür links zum Wohnzimmer | Prompt sagte nur „evening“, Prolog spielt nachmittags; Hut-Hotspot fehlte |
| Szene Supermarkt | Ladenfront parallel zur Bildebene, Gehweg als Bodenband, Platz für den Aufsteller | Bühnenansicht, Ansehen-Objekt FI_SUPM_0060 |
| Zapp-O-Mat | 1×7 statt 4: zusätzlich „bunter Schnee mit Antenne“ und zwei Rauschbilder für eine Flimmer-Schleife; Rolltisch und Kabel; 64×64 | P2 „Rauschen wird bunter“; Schnee muss flimmern |
| Einsaug-Effekt | 96×96, zentriert über dem Bildschirm, Blitz in den letzten zwei Bildern | Größe fehlte |
| Werkbank-Ablage | Eierkarton statt Tuch allein, Mehlsack mit leerem Siegel, fingergroße glühende Zelle | Skript ZS1 bis ZS3: Eierkarton „für Spezialzwecke“, Mehlsack mit Siegel 405, Zelle auf Fingergröße geschrumpft |
| Werbeblock | 320×180 je Bild, schwarz-weiße Kuh („not purple“), fünftes Störbild für den Abbruch im Finale, ohne Farb-Baustein | Abstand zu bekannter Werbe-Kuh; FI_DACH_0010 |
| Figur Max | Größe 56 Pixel, eindeutiger Verweis auf den Steckbrief, zweites Bild aufrechte Fassung | Verweis war mehrdeutig |
| Figur Pixel, Pixel schlafend | Größen, eindeutiger Verweis; schlafend ohne Kabel im Sprite, flache Unterseite | Kabel gehört zum Hintergrund |
| Opa Konrad | 60 Pixel, Hex-Farben, „No lab coat“ | Abstand zum Vorbild (Rechtscheck-Regel zwei Merkmale) |
| Opa auf dem Sofa | Teetasse statt Fernbedienung, Opa-Beschreibung ausgeschrieben statt „as above“, sitzend etwa 44 Pixel | Die Fernbedienung ist bis zum Finale verschwunden; Welt 3 Portal-Gag zeigt Opa mit Teetasse |
| Oma | 56 statt 48 Pixel, Hex-Farben | Regel „Erwachsene 56 bis 64 Pixel“ |
| Mutter | Offene Jacke, Schlüssel in der Hand statt Einkaufsliste im Standbild, Hex-Farben | FI_WOHN_0220: kommt mit Jacke und Schlüssel von der Spätschicht; die Liste hebt sie erst später auf |
| Gegenstände Prolog (2×2 → 1×5) | Opas Zettel für Welt 1 ergänzt | Stand in der Gegenstandsliste, fehlte im Sammelbild |
| Gegenstände Gegenwart (2×3 → 2×4) | Mehlsack statt Papiertüte, glühende Batterie, zerknitterter Zettel statt langer Liste, Zettel mit WLAN-Passwort und Keksdose mit Hundekuchen ergänzt | Skript ZS2, ZS3, FI_WOHN_0250, FI_WOHN_0280, FI_AUFL_0510 |
| Hinweis unter den Gegenständen | „405“ auf dem Siegel und „Spezialzwecke“ auf dem Eierkarton von Hand | Text nie generieren |
| Deko Opas Haus (2×5 → 3×4) | Maßstab Szene statt Inventar; Fernbedienungskiste in zwei Zuständen (halb zu, offen); Poster aufgehängt mit Pyramide und Neonstadt statt zusammengerollt; Kochbuch zu und aufgeschlagen; Hut am Haken | ZS3: Kiste ab jetzt offen, Kochbuch aufgeschlagen; Max beschreibt das Posterbild |
| Animation Pixel Aufwachen | Schlaf-Sprite als Eingabe, Halsband-Leuchte noch aus | Opa schaltet den Lautsprecher erst danach ein |
| Animation Oma Treppe | Seitenansicht, Blickrichtung, gleiche Größe wie Standbild | Blickrichtung fehlte |
| Animation Mutter Liste lesen | Zerknitterter Zettel, Jacke an, Blickrichtung | Passt zum Skript |
| Animation Roboter Ofentür | Ofentür in Hüfthöhe, Füße fest, Blickrichtung | Abgleich mit der Maschine |
| Neu: Effekte Maschine läuft, Teig-Schwall, Staubwolke | Drei Zeilen ergänzt | FI_DACH_0190, FI_RAET_0350, ZS2_DACH_0090 hatten keine Grafik |
| UI Inventarleiste und Dialogfenster | 320×32 mit acht 24×24-Plätzen und Pfeilen, Auswahlfeld 320×40 für vier Zeilen, Nahansicht-Rahmen 320×180 mit Schließen-Knopf | Maße aus Spielsysteme; Nahansichten verweisen auf diesen Rahmen |
| UI Mauszeiger | 16×16 je Symbol, Zuordnung zu den fünf Zeigerarten, Sprechblase ohne Text | Eindeutige Zuordnung |
| UI Figurenwechsel | Verweis auf die neuen Porträt-Prompts, inaktive Figur grau in Godot | Fragment ersetzt |
| UI Hilfe-Symbol | Drei Zustände: normal, leuchtend, ausgegraut | Spielsysteme: Pfote leuchtet bei neuem Hinweis, ist bis P1 ausgegraut |
| UI Reisetasche | 320×180, zentriert, leeres Vorhängeschloss-Schild, Licht | Größe fehlte |
| UI Abspann-Fotos | 320×180, leere Bildflächen, kein Text | Größe fehlte |
| UI Titelbild | 16:9, danach 320×180; Junge links, Kater rechts, von hinten; oberes Drittel frei; kein Text | Bildaufbau eindeutig |
| UI Hauptmenü | Fünf statt vier Kanalplatten, „Fortsetzen“ ergänzt | Spielsysteme nennt fünf Menüpunkte |
| UI Nahansichten Prolog | Kalender mit Platz für „K3 – Schwurbelstein“; dazu Notizbuch, aufgeschlagenes Kochbuch (ZS3) und zerknitterte Einkaufsliste (Finale) | Alles Lesbare braucht eine Nahansicht |

Unverändert geprüft: Opa Erklären, Opa Panik, Zeldina Zauberstab, Gegenwart-Effekt Verwandlung.

## Offene Punkte

1. **Strähne über welchem Auge:** Die Prompts sagen jetzt „right eye“, damit sie in der Seitenansicht nach rechts sichtbar ist. Das freigegebene Konzept `w0_concept_max.png` zeigt sie womöglich links; nach dem Spiegeln bitte prüfen.
2. **Oma 56 statt 48 Pixel:** Angepasst an die Regel für Erwachsene. Wenn Sebastian Oma bewusst kleiner will, die Regel im Tab Grafik um eine Ausnahme ergänzen.
3. **Dachboden-Motiv über 90 Wörter:** Bewusst länger wegen zwölf Hotspots; im Tab vermerkt. Retro Diffusion kann dabei Details weglassen, dann Variante B (Neural Pixelate aus dem neuen Konzeptbild) nehmen.
4. **Hex-Farben in Prompts:** Retro Diffusion setzt Hex-Werte nicht sicher um. Sie dienen als Orientierung; verbindlich bleibt Palettize mit Endesga 32.
5. **Bildschirm-Einblendungen des Zapp-O-Mat fehlen:** Kanal 3 (Turm, Zeldina mit Gardinen), Kanal 7 (Hermes winkt), Kanal 42 (Kalle, Modell 08/15), Kanal 999 (leeres Studio, goldenes Sofa), Tierdoku im Wohnzimmer und die winkenden Figuren beim Hilferuf haben noch keine Prompts.
6. **Posen mit Artefakten:** Max mit Drachenei, Sack, Zelle; Opa mit der „Zündkapsel“ hoch erhoben; Oma mit Gabel beim Anschneiden; Pixel sitzt auf dem Schrank. Bisher nur über die allgemeinen Animationen abgedeckt.
7. **Tab Welt 3 (nicht meiner):** Dort liegen die Hundekuchen auf einem Teller, das Skript ZS3 spricht von einer Keksdose. Im Tab Prolog und Finale steht jetzt die Dose; der Welt-3-Tab sollte angeglichen werden.
8. **Tab Welt 4 (nicht meiner):** Die Albtraum-Szene beschreibt Max als „in a grey hoodie“ statt mit dem Steckbrief; dort angleichen.
9. **Modellnamen von Retro Diffusion** (`rd_plus__environment`, `rd_pro__default`, Animationsmodelle) weiterhin vor dem ersten Auftrag prüfen.

## Nachtrag: zweite Runde (9. November 2026)

| Tab | Stelle | Änderung | Grund |
| --- | --- | --- | --- |
| Prolog und Finale | Neu: Abschnitt „Bildschirm-Einblendungen“ | Baustein für Bildschirmbilder (80×60, danach auf etwa 40×30 verkleinert) und 13 Motive: Tierdoku im Wohnzimmer, falscher Kanal (Testbild), Kanal 3 Turm mit Zeldina und Gardinen, Kanal 3 Hilferuf (Zeldina mit Zauberstab, Toadi), Kanal 7 Hermes winkt, Kanal 7 Hilferuf (Archimedes, Ramses mit Fächerwedlern, Hermes), Kanal 42 mit und ohne FREUND_0815 (Ansehen und Hilferuf), Kanal 999 leeres Studio mit goldenem Sofa und Zettel, Kanal 999 Hilferuf (Flimmer, Gerd Glück), Toadi in der Abspann-Szene | Offener Punkt 5; Skript P0_WOHN, P0_DACH_0680, ZS1 bis ZS3, FI_RIEG_0220, FI_RUF, FI_ABSP_0020. Figuren wie in ihren Welt-Tabs beschrieben, ohne Namen |
| Prolog und Finale | Figuren, sieben neue Zeilen | Max mit Drachenei, mit Pharaonenkorn, mit Energiezelle (nass, aufrechter), mit Goldener Fernbedienung (aufrecht); Opa hält die Zündkapsel wie ein Schwert hoch; Oma mit Kuchengabel; Pixel liegt auf dem Schrank | Offener Punkt 6; ZS1_0030, ZS2_0030, ZS3_0030, FI_DACH_0120, FI_WOHN, FI_WOHN_0280 |
| Prolog und Finale | Absatz unter den Figuren | Oma bleibt vorerst bei 56 Pixeln; Hinweis, dass sie als Ausnahme kleiner werden kann, wenn Sebastian das möchte | Auftrag Koordinator |
| Grafik | Animation Pixel Ohrfeige | „blaue Pille“ ersetzt durch „blaue Pastille aus der Apothekendose mit grünem Kreuz“ | Umbenennung Pillen in Pastillen; im Tab gab es nur diese eine Stelle |

Damit sind die offenen Punkte 5 und 6 erledigt und Punkt 2 im Tab vermerkt. Weiter offen: Punkte 1, 3, 4, 7, 8, 9. Neu offen: Ob der Welt-3-Tab die Pastillen-Dose schon als Gegenstand führt, habe ich nicht geprüft (nicht mein Tab). Die Bildschirmbilder sind sehr klein; ob Gesichter bei 40×30 lesbar bleiben, zeigt erst der Test in Godot. Sonst die 80×60-Einblendung auch beim Ansehen nutzen.

## Nachtrag: dritte Runde (9. November 2026)

| Tab | Stelle | Änderung | Grund |
| --- | --- | --- | --- |
| Prolog und Finale | Gegenstände Gegenwart (2×4), achtes Feld | „round tin cookie box“ ersetzt durch eine kleine braune Papiertüte, oben umgeschlagen, mit herausschauenden Hundekuchen | Laut Rätsel Welt 3 und Skript Welt 3 kommen Omas Kekse in einer Tüte. Weitere Kekse-Behälter gibt es in diesem Tab nicht. Damit ist auch offener Punkt 7 (Teller oder Dose) für diesen Tab erledigt; das Wort „Keksdose“ in ZS3_DACH_PIX_0530 im Skript sollte zur Tüte passen (nicht mein Tab) |

## Nachtrag: vierte Runde (9. November 2026)

| Tab | Stelle | Änderung | Grund |
| --- | --- | --- | --- |
| Grafik | Weltenübergreifende Gegenstände, Reisegepäck (3×3 → 2×5) | „small clay jar of olive oil“ ersetzt durch einen vollen Tonkrug mit Henkel und Korken; neues Zustandsfeld: derselbe Krug weniger voll (nach dem Schluck für die Sandalen in Welt 2, so reist er nach Welt 3) | Entscheidung 6: ein ganzer Krug Olivenöl |
