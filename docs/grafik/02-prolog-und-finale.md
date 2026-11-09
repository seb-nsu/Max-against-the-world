# Grafik: Prolog und Finale

## Konzept

Opas Haus ist der ruhende Pol des Spiels: warm, staubig, voller Erfindungen und Gerümpel. Jeder Gegenstand auf dem Dachboden könnte ein Hinweis auf die Welten oder das Finale sein.

**Farb-Baustein** (hinter jeden Prompt dieses Tabs):

```text
warm palette of dusty browns, orange lamp light and pale yellow, cozy and cluttered
```

**Orte:**

| Ort | Beschreibung | Wichtig für |
| --- | --- | --- |
| Dachboden | Schräges Dach mit Dachfenster, Werkbank, Kleiderschrank, Kisten, alter Sessel, der Zapp-O-Mat 3000 auf einem Rolltisch, Wandkalender mit rot eingekreistem Tag | Prolog, Rätsel P1 bis P3 |
| Dachboden, Finale | Gleicher Raum am Abend, in der Mitte Opas große Maschine mit zwei Fassungen und Empfänger für die Fernbedienung, Rauch, blinkende Lämpchen, verriegelte Luke | Finale, Stufe 1 |
| Wohnzimmer | Opas Sofa, Couchtisch, Stehlampe, Röhrenfernseher; im Finale mit Geburtstagsgirlande und Kuchen | Portal-Gag in Welt 3, Finale |
| Treppenhaus | Schmale Holztreppe zum Dachboden | Prolog: Durchgang zwischen Wohnzimmer und Dachboden mit zwei Objekten zum Ansehen (Hut, Fenster); Finale: Oma kommt die Treppe hoch |
| Supermarkt-Eingang | Automatische Tür, Einkaufswagen, Milchregal im Hintergrund | Letztes Bild vor dem Abspann |

**Figuren:** Max, Pixel, Opa Konrad, Oma, Mutter.

**Gegenstände:** Thunfischdose, Dosenöffner, Drahtkleiderbügel, Antenne aus dem Bügel, Einkaufsliste, Milchflasche, Fernbedienung, Geburtstagskuchen, Notizbuch, Opas Reisetasche mit zwei Wahlfächern und einem Pflichtfach, Opas Zettel für Welt 1.

**Benutzeroberfläche:** Mauszeiger (Standard, Ansehen, Benutzen, Reden, Ausgang), Inventarleiste, Dialogfenster, Pixels Hilfe-Symbol, Titelbild.

## Prompts

Vorne den Baustein aus dem Tab „Grafik“, dann das Motiv, hinten den Farb-Baustein dieses Tabs. Max, Pixel, die weltenübergreifenden Gegenstände und ihre Grundanimationen stehen im Tab „Grafik“.

### Szenen

Alle mit dem Baustein HINTERGRUND.

| Szene | Zustände | Muss sichtbar sein | Motiv |
| --- | --- | --- | --- |
| Dachboden | Tag (Prolog); drei Rückkehr-Varianten: später Nachmittag, Abend mit Lampe, Nacht mit Mond; auf der Werkbank wächst die Reihe der Artefakte (Objekt Werkbank-Ablage) | Kalender mit rotem Kreis, Stromkabel, Werkzeugkiste, Kleiderschrank, Bodenluke | Attic of an eccentric inventor grandfather in late afternoon. Left: a cluttered workbench with tools, copper wire and half-built gadgets, an open red metal toolbox under it. Center back: an empty wheeled cart where the old TV stands (TV is a separate sprite), its black power cord snaking across the floor to the left. Right: a tall wooden wardrobe with one door ajar, next to it a paper wall calendar with one day circled in thick red. Foreground: stacked cardboard boxes at the left edge, a worn green armchair at the right edge. Slanted wooden roof with a small skylight casting a dusty beam onto the floor. Exit: floor hatch at the front right |
| Dachboden, Finale | Nacht | Maschine mit zwei Fassungen (Ei, Mehl) und Empfänger für die Fernbedienung, verriegelte Luke, Ofentür | The same attic at night, same layout. Center: a huge homemade baking machine of copper pipes and riveted metal with two round empty sockets side by side (egg and flour) and a small antenna dish that receives the remote control, a pressure gauge with the needle in the red, a small oven door with a round window showing rising chocolate dough. Steam and smoke curl upward. Front right: the floor hatch closed with a heavy iron bolt and a red blinking lamp. Strong orange glow from the machine, cold blue moonlight through the skylight |
| Wohnzimmer | Abend, wird auch für den Portal-Gag (Welt 3) und die Lichterkette (Welt 4) genutzt | Leerer Platz auf dem Couchtisch, Fernseher | Old-fashioned living room in the evening. Left: a saggy brown corduroy sofa facing right with a knitted orange blanket. Center: a low wooden coffee table with newspapers, a cold cup of tea and an empty spot. Right: an old tube television on a wooden cabinet. Back wall: floral green wallpaper, framed family photos, a standing lamp with a yellow fabric shade. Exit: open door to the hallway at the far right. Warm, slightly dim lamp light |
| Wohnzimmer, Geburtstag | Variante | Kuchen auf dem Couchtisch | The same living room decorated for a birthday party: colorful paper garlands across the ceiling, balloons tied to the sofa, a chocolate birthday cake with lit candles on the coffee table, a small pile of wrapped presents next to it, confetti on the carpet. Warm golden light |
| Treppenhaus | Nachmittag (Prolog) und Abend (Finale); nur das Fensterlicht wechselt | Treppe nach oben, Luke | Narrow wooden staircase in an old house in the evening. The stairs rise from the lower left to the upper right, ending at an open attic hatch top right. Left: coats and an umbrella on wall hooks, a small window with orange evening light. Walkable landing in the lower left. Creaky dark wooden steps, faded striped wallpaper |
| Supermarkt | Dämmerung | Milchregal im Inneren | Front of a small neighborhood supermarket at dusk, seen from the sidewalk. Left: a row of red shopping carts. Center: automatic glass sliding doors, behind them a brightly lit aisle leading to a glowing milk fridge at the back. Right: a bicycle rack and a flower stand with buckets of tulips. Blank sign above the door. Purple-orange sky, warm light spilling out onto the sidewalk |

### Große Objekte mit Zuständen

| Objekt | Baustein | Motiv |
| --- | --- | --- |
| Zapp-O-Mat 3000 | EFFEKT, 4 Bilder, je etwa 64×56 | An old wooden tube television with a big round channel dial and rabbit-ear sockets on top. Four states in a row: screen dark; screen full of grey static snow; static snow with a bent wire coat hanger as antenna on top; a swirling colorful vortex on the screen pulling inward |
| Einsaug-Effekt | EFFEKT, 8 Bilder | Swirl of colorful light streaks spiraling into a TV screen, growing stronger and ending in a white flash |
| Werkbank-Ablage | GEGENSTÄNDE, 3 Zustände, je etwa 48×24 | The same corner of a wooden workbench in three states side by side: a folded grey cloth with one white egg on it; the cloth with the egg and a small paper flour bag; the cloth with egg, flour bag and a glowing orange battery cell (same cell as in Grafik Welt 3) (Rückkehr nach Welt 1, 2 und 3) |
| Werbeblock | EFFEKT, 4 Bilder, 320×180 | Full-screen TV commercial frames: a tall glass of milk with a sparkle, a smiling cartoon cow, a big blank price tag, then a white flash; cheap 1990s studio look (Zwischenspiele, 5 Sekunden, Text von Hand) |

### Figuren

| Figur | Baustein | Motiv |
| --- | --- | --- |
| Max | FIGUR | (Steckbrief Max) standing relaxed with both hands in his hoodie pocket, weight on one leg, bored half-smile, facing right |
| Pixel | FIGUR-KLEIN | (Steckbrief Pixel) sitting upright, tail wrapped around his paws, looking bored to the right |
| Pixel, schlafend | FIGUR-KLEIN, 10 Pixel hoch, 24 lang | (Steckbrief Pixel) curled up asleep lying on a black power cord, one paw over his nose |
| Opa Konrad | FIGUR, etwa 60 Pixel | Grandpa Konrad, tall, thin and slightly stooped. Wild white hair standing up, bushy eyebrows, round brass goggles pushed up on his forehead. Brown knitted cardigan with many bulging tool pockets, beige trousers, red-and-white checkered slippers, a screwdriver behind his ear. Standing with one finger raised, enthusiastic grin, facing left |
| Opa auf dem Sofa | FIGUR | Grandpa Konrad (as above) slumped on a sofa watching TV, remote in his right hand, slippers on the coffee table, surprised raised eyebrows, facing right |
| Oma | FIGUR, etwa 48 Pixel | Grandma, small and sturdy. Grey hair in a tight bun, round glasses, rosy cheeks. Purple cardigan over a dark green dress, black handbag on her left arm, sensible brown shoes. Standing straight, eyebrows raised, a stern but loving look, facing right |
| Mutter | FIGUR, etwa 58 Pixel | Max's mother, slim, brown ponytail, tired but friendly eyes. Green sweater, blue jeans, white sneakers. Holding a long paper shopping list in both hands and reading it with a slight frown, facing left |

Zeldina und der Roboter-Hausmeister im Finale verwenden ihre Sprites aus Welt 1 und Welt 3; dazu nur die Animationen unten.

### Gegenstände

Alle mit dem Baustein GEGENSTÄNDE. Thunfischdose, Notizbuch, Kochlöffel und Opas echte Fernbedienung stehen bei den weltenübergreifenden Gegenständen.

| Sammelbild | Motiv |
| --- | --- |
| Prolog (2×2) | 2x2 grid: a manual can opener with red plastic handles; a plain silver wire coat hanger; the same coat hanger bent into a V-shaped TV antenna; a vintage brown leather travel bag with three front pockets and brass buckles |
| Gegenwart (2×3) | 2x3 grid: a plain white hen's egg; a paper flour bag with a blank white label; a single AA battery with a copper top; a long handwritten shopping list with blank lines; a glass milk bottle with a red cap; a slice of chocolate birthday cake with a candle |

Das Etikett „Type 405“ auf der Mehltüte von Hand setzen.

### Nur zum Ansehen

| Objekt | Ort | Kommentar-Idee |
| --- | --- | --- |
| Ausgestopfter Fisch mit Taucherbrille | Dachboden | Max: „Opas erster Versuch einer Unterwasser-Zeitmaschine. Der Fisch hat's nicht geschafft.“ |
| Kiste mit kaputten Fernbedienungen | Dachboden | Pixel: „Siebzehn Fernbedienungen, und die richtige ist nie dabei.“ (Hinweis aufs Finale) |
| Poster einer Pyramide und einer Neonstadt | Dachboden | Max: „Opa hat einen sehr breiten Geschmack. Oder Reisepläne.“ |
| Alter Toaster mit Propeller | Dachboden | Max: „Fliegendes Frühstück. Nie wieder.“ |
| Opas erster Staubsauger-Prototyp | Dachboden | Pixel: „Wir haben uns geeinigt. Er bleibt aus, ich behalte das andere Ohr.“ (erklärt die Ohrkerbe) |
| Kochbuch mit Eselsohr | Dachboden | Pixel: „Ein Eselsohr bei Schokokuchen. Interessant.“ (Hinweis aufs Finale) |
| Plattenspieler mit Opas Lieblingsplatte | Dachboden | Max: „‚Schlager für Erfinder, Folge 3‘. Es gibt also noch zwei schlimmere.“ |
| Familienfoto mit Oma | Wohnzimmer | Max: „Oma guckt auf jedem Foto, als hätte jemand ihren Geburtstag vergessen.“ |
| Hut mit Propeller an der Garderobe | Treppenhaus | Pixel: „Opas Sonntagshut. Für besondere Anlässe und Stromausfälle.“ |
| Aufsteller mit Milch-Sonderangebot | Supermarkt | Max: „Ein Zeichen. Ein sehr deutliches Zeichen.“ |

| Sammelbild | Motiv |
| --- | --- |
| Deko Opas Haus (2×5) | 2x5 grid: a stuffed fish wearing round diving goggles; a cardboard box overflowing with broken TV remotes; a rolled-up poster tied with string; a chrome toaster with a small propeller on top; a thick old cookbook with a folded page corner and a blank cover; a small record player with a vinyl record; a framed photo of an old woman in a purple cardigan; a beanie hat with a tiny propeller; a cardboard store display with a milk bottle picture and a blank price tag; a bulky 1950s vacuum cleaner prototype with a cracked glass dome, a bent nozzle and a tuft of grey cat fur stuck in it |

### Animationen

Grundanimationen von Max und Pixel stehen im Tab „Grafik“.

| Figur | Aktion | Bilder | Ablauf | Motiv |
| --- | --- | --- | --- | --- |
| Pixel | Aufwachen vom Thunfisch | 6 | einmalig | Pixel asleep on the cord, nose twitches, eyes snap open, he jumps up onto all fours with fur standing up, facing right |
| Opa | Erklären | 4 | Schleife | Grandpa talks excitedly, both hands waving, goggles bouncing on his forehead, feet stay still, facing left |
| Opa | Panik | 6 | Schleife | Grandpa flails both arms, hair stands up even more, sweat drops fly, he hops from foot to foot, facing left |
| Oma | Treppe steigen | 8 | Schleife | Grandma climbs stairs diagonally up to the right, one hand on her handbag, steady determined steps |
| Mutter | Liste lesen | 4 | Schleife | Mother scans the shopping list, eyes moving down, list lowers slightly, then rises again |
| Zeldina | Zauberstab einsetzen | 6 | einmalig | Zeldina jams a black crooked wand into a door bolt and twists it, sparks fly, the bolt springs open, facing right |
| Roboter-Hausmeister | Ofentür halten | 4 | Schleife | The boxy robot presses both hands against an oven door, leaning in, small sparks from his joints, steam escaping at the edges |
| Gegenwart-Effekt | Verwandlung | 6 | einmalig | EFFEKT: a puff of glitter and a soft pop, 32x32, when a legendary artifact turns into an everyday object |

### Benutzeroberfläche

| Asset | Werkzeug | Motiv |
| --- | --- | --- |
| Inventarleiste und Dialogfenster | `rd_pro__ui_panel` | A wooden inventory bar with eight square slots and brass corner fittings, plus a matching dialog box frame with a slightly darker inner panel, warm brown tones, no text |
| Mauszeiger | `rd_pro__inventory_items`, 16×16 | Five small cursor icons in a row: a white pointing hand; a magnifying glass; an open grabbing hand; a white speech bubble; a green arrow pointing to a doorway |
| Figurenwechsel | PORTRÄT | (Steckbrief Max) portrait with a bored half-smile; dazu ein zweites Bild: (Steckbrief Pixel) portrait with smug half-lidded eyes. Beide auch auf 24×24 verkleinern |
| Hilfe-Symbol | `rd_pro__inventory_items`, 24×24 | A round button showing a grey cat paw holding a small glowing light bulb |
| Reisetasche packen | `rd_pro__ui_panel` | An open vintage leather travel bag seen from above with two empty compartments and a third compartment marked with a small padlock tag, lying on wooden attic floorboards with room around it to lay out items |
| Abspann-Fotos | `rd_pro__ui_panel` | A sheet of five instant photo frames with white borders and blank captions, slightly tilted, held by small strips of tape |
| Titelbild | KONZEPT | Title screen: an old wooden tube television glowing in a dark attic, its screen showing a swirl of a fairy tale castle, a pyramid, a rainy neon city and a TV studio; a boy and a fat cat silhouetted in front of it; empty space at the top for a logo |
| Hauptmenü | rd\_pro\_\_ui\_panel | Menu overlay for the title screen: a big round wooden channel dial on the right with four blank channel plates around it, a small brass pointer, slight glow on the selected plate, no text (Beschriftungen Neues Spiel, Laden, Optionen, Beenden von Hand; Maus klickt eine Platte, Controller dreht den Knopf) |
| Nahansichten Prolog | HINTERGRUND, 320×180, je ein Bild | Close-up of a paper wall calendar page filling the screen, one day circled in thick red marker, blank number cells; close-up of a handwritten note on lined paper held by a hand, blank lines (Zahlen, „K3“ und Opas Schrift von Hand in Aseprite; Rahmen mit Schließen-Knopf aus dem Dialogfenster) |

Die Abspann-Fotos werden in Aseprite aus fertigen Sprites zusammengesetzt (alle Freunde beim Kuchenessen). Foto vier gibt es in zwei Fassungen je nach Goblin-Weg (singende Goblins oder Grimmzahn als Hausmeister), deshalb fünf Rahmen auf dem Bogen. Das Spiel-Logo und alle Schriften von Hand gestalten.
