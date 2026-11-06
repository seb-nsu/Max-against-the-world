# Grafik: Welt 4, Kanal 999

## Konzept

In Welt 4 darf jeder Sender anders aussehen, das ist der Witz der Welt. Damit es trotzdem zusammenpasst, bleiben Auflösung, Palette und Figurengrößen gleich; nur Farbstimmung und Zeichenstil wechseln. Ein leichter Röhrenfernseher-Effekt mit Bildschirmrand und Streifen liegt über allen Sendern und wird in Godot per Shader erzeugt, nicht gezeichnet.

**Farb-Bausteine je Sender:**

| Sender | Baustein |
| --- | --- |
| Testbild und Rauschen | grey static noise and bold color bars, flickering |
| Glücksrad-Shopping | flashy game show palette of gold, hot pink and spotlight white, glitter |
| Küchen-Sitcom | bright 1990s sitcom palette of pastel yellow, mint and peach, flat studio lighting |
| Tiertort Savanne | golden savanna palette of ochre grass, acacia green and orange evening sky, documentary feel |
| Mitternachts-TV | 1980s music video palette of deep purple, toxic green and fog, spooky disco lights |
| Comic-Kanal | bold comic book palette of primary red, blue and yellow, thick outlines, halftone dots |
| Senderzentrale | glossy corporate palette of black marble, gold and glowing monitor blue |

**Orte:**

| Ort | Sender | Beschreibung | Rätsel |
| --- | --- | --- | --- |
| Testbild | Testbild | Große Farbbalken, in denen Max steht | 1 |
| Rauschen zwischen den Sendern | – | Grauer Schneesturm, durch den Pixel mit Flimmer kriecht | Pixel-Ausflüge |
| Glücksrad-Studio | Glücksrad-Shopping | Glücksrad, Moderationspult, Preis-Podest, Telefonnummern-Leuchtschrift ohne Text | 2, 9 |
| Sitcom-Küche | Küchen-Sitcom | Offene Küche mit Durchreiche, Keksdose, Küchentür, Publikum im Dunkeln | 3, 6 |
| Savanne mit Wasserloch | Tiertort Savanne | Akazien, Wasserloch mit Flamingos, Felsen mit Löwenthron, Absperrband | 4 |
| Musikvideo-Friedhof | Mitternachts-TV | Friedhof mit Tanzfläche aus Leuchtfliesen, Gräber, Nebel | 5 |
| Spukhaus, Halle und Keller | Mitternachts-TV | Verschlossene Tür, Lichterkette mit Buchstaben, Keller mit Gerümpel | 6, 7, 8 |
| Kapitolis, Straße | Comic-Kanal | Comic-Stadt mit Wolkenkratzern, Sprechblasen-Schildern ohne Text | 10, 11 |
| Fondue-Fabrik | Comic-Kanal | Käsebottiche, Laufband, Warnschilder | 10 |
| Werbespot-Set | Comic-Kanal | Kulisse mit grellem Produktpodest, Kamera, Scheinwerfer | 11 |
| Senderzentrale, Empfang und Aufzug | Senderzentrale | Empfangstresen, Sicherheitsleute, Aufzugstür mit Zahlenfeld | 12 |
| Zappmanns Studio | Senderzentrale | Talkshow-Bühne, goldenes Sofa, Applaus-Schild, Wand aus Monitoren | 13 |
| Kellerarchiv | Senderzentrale | Müllpresse für Bänder abgesetzter Serien, Durchgang zum Aufzug | 12 (nur Gag) |

**Figuren:** Gerd Glück, Flimmer, die Sitcom-Familie (Vater, Mutter, Sohn), der Kommissar, Löwe, Hyäne, Gepard, Geier, Nashorn, Flamingos, Zombies, der FBI-Agent, Superhelden (Super-Siegfried, Fledermann, Wonder-Wilma; laut Punkt 28 der Überarbeitung vorerst nur diese drei), Dr. Werbepause, die Empfangsdame, zwei Sicherheitsleute, Intendant Zappmann, Max als Käsemann.

**Gegenstände:** Billig-Fernbedienung, sechs Tasten-Symbole, Splitscreen-Adapter, Programmzeitschrift, Bananenschale (frisch, faulig, als Stinkbombe), Fondue-Käse (normal, leuchtend, Wunderkäse), Küchentür, Keksdose, Amboss, Lichterkette, Lichtröhre Deluxe, Superhelden-Anzug, Comic-Panels, Drehbuch des Erzählers, Goldene Fernbedienung.

**Nur zum Ansehen:** Objekte ohne Rätselfunktion, die nur Kommentare von Max und Pixel auslösen. Sie machen die Sender glaubwürdig und tragen viele der Anspielungen. Die vollständige Liste steht unten bei den Prompts.

## Prompts

Vorne den Baustein aus dem Tab „Grafik“, dann das Motiv, hinten den Farb-Baustein des jeweiligen Senders. Superhelden und Schurken bewusst eigenständig halten: keine bekannten Embleme, Masken oder Farbkombinationen.

### Szenen

Alle mit dem Baustein HINTERGRUND.

| Szene | Sender | Zustände | Muss sichtbar sein | Motiv |
| --- | --- | --- | --- | --- |
| Testbild | Testbild | Balken verschoben und geordnet | Sieben Balken als Wand, Testkreis | An empty space inside a giant old television test pattern. Seven huge vertical color bars stand like walls across the scene: white, yellow, cyan, green, magenta, red, blue, some shifted out of line. A big round test circle with a crosshair floats in the background. Flickering grey static at the edges. Second version: the bars neatly in order. Third version: the same scene in shades of grey only (Pixels Sicht für Rätsel 1) |
| Rauschen | – | – | Kriechweg für Pixel | A tunnel of grey television static and drifting white snow, seen from the side, a faint path along the bottom, faint ghost images of other shows flickering in the walls |
| Glücksrad-Studio | Glücksrad-Shopping | – | Rad, Pult, Preis-Podest, Telefon-Leuchtschrift | A flashy game show studio. Left: a huge colorful prize wheel with twelve segments and a pointer on top. Center: a glittering host podium. Right: a rotating platform stacked with prizes: toasters and a cruise ship model. Rows of light bulbs, a blank glowing phone number sign, a dark audience area |
| Sitcom-Küche | Küchen-Sitcom | – | Durchreiche, Keksdose, Küchentür, Publikum | A bright 1990s sitcom kitchen set seen from the audience side. Left: a pass-through window to a living room. Center: a counter with a big cookie jar shaped like a chicken and a laugh track machine. Right: a wooden kitchen door with a round window. Top edge: studio lights and the end of the set wall visible. A row of cardboard audience cutouts in the dark foreground |
| Savanne | Tiertort Savanne | – | Wasserloch, Felsenthron, Absperrband, Mikrofonangel | African savanna at golden hour. Left: acacia trees and a watering hole with three pink flamingos. Center: a rocky outcrop shaped like a throne with an empty spot on top. Right: yellow crime scene tape around a bush. A boom microphone on a pole sticking in from the top edge. Orange evening sky |
| Musikvideo-Friedhof | Mitternachts-TV | Gräber zu und offen | Leuchtfliesen, Gräber, Mond | A foggy graveyard turned into a dance floor. Center: a square of glowing colored floor tiles among crooked gravestones. Left and right: six closed graves with mounds of earth. Full moon, purple spotlights, a disco ball hanging from a dead tree. Second version: the graves broken open with hands sticking out |
| Spukhaus, Halle | Mitternachts-TV | Tür zu, Sitcom-Tür eingesetzt | Türrahmen, Lichterkette, Treppe | A creepy old mansion hall. Left: a heavy locked front door covered in chains. Center: a string of colored light bulbs running along faded wallpaper. Right: a grand staircase with cobwebs. Green fog on the floor. Second version: the locked door replaced by a bright cheerful wooden kitchen door with a round window, warm light spilling out |
| Spukhaus, Keller | Mitternachts-TV | – | Röhrenfernseher, Gerümpel | A dusty basement full of boxes and old furniture under sheets, an old tube TV on a crate showing static, a single hanging light bulb, a small window high up |
| Kapitolis | Comic-Kanal | – | Straße, Wolkenkratzer, Laterne | A comic book city street with thick black outlines and halftone dots. Tall skyscrapers, blank speech-bubble-shaped signs, a water tower on a roof, a street lamp in the foreground, a newspaper kiosk |
| Fondue-Fabrik | Comic-Kanal | – | Bottiche, Laufband, Warnschilder | A comic book cheese factory. Left: huge bubbling vats of yellow melted cheese with a catwalk above them. Center: a conveyor belt with cheese blocks. Right: blank warning signs and a big lever. A cheese-shaped searchlight on the roof shining into the sky through a window |
| Werbespot-Set | Comic-Kanal | – | Podest, Kamera, Scheinwerfer, Klappe | A garish TV commercial set. Center: a glowing round product podium under a spotlight. Left: a camera on a tripod and a director's chair. Right: a second spotlight and a fake palm tree in a pot. A clapperboard on the floor. Bright backdrop of rainbow stripes |
| Empfang | Senderzentrale | – | Tresen, Aufzug mit Zahlenfeld | A sleek TV network lobby. Left: a black marble reception desk with a monitor. Center: polished floor and two velvet ropes. Right: a golden elevator door with a number pad. A blank golden logo on the wall, a wall of gold records |
| Zappmanns Studio | Senderzentrale | – | Goldsofa, Applaus-Schild, Monitorwand | A talk show stage. Center: a shiny golden sofa. Left: a host desk with a coffee mug. Right: a lit blank applause sign. Background: a wall of small monitors each showing a different show in different colors |
| Zappmanns erste Kindersendung | – | – | Puppenbühne, junger Zappmann | A shabby 1970s children's TV set in faded colors. A small puppet theater, a cardboard sun, a felt rainbow, a stool. Grainy, washed-out film look |
| Bild-in-Bild | – | – | – | Keine eigene Grafik: zwei Szenen nebeneinander in Godot mit dünnem weißem Rahmen |
| Max auf der Couch | Senderzentrale | – | – | Max in a grey hoodie sitting on a golden sofa, half grown into the cushions, sofa springs and fabric creeping up his legs, a remote in his limp hand, dead tired eyes. Albtraum-Szene, FIGUR-GROSS |
| Opa vor flackernden Lampen | Gegenwart | – | – | Wiederverwendung des Prolog-Wohnzimmers, Lampen-Flackern als Effekt |
| Kellerarchiv | Senderzentrale | – | Müllpresse, Auge auf dem Stiel, Durchgang zum Aufzug | HINTERGRUND: A dim basement corridor below a TV network building. Center: a huge rusty trash compactor pit with heavy steel walls, filled with tangled video tapes and film reels, a small eye on a stalk peeking out from the tapes. Left: shelves of dusty tape boxes with blank labels. Right: a service door to an elevator. Flickering neon tube on the ceiling, black marble and gold trim fading into bare concrete |

### Figuren

| Figur | Baustein | Motiv |
| --- | --- | --- |
| Gerd Glück | FIGUR | A slick game show host with a shiny sequined purple jacket, huge white teeth, a microphone in his right hand and a price tag hanging from his own sleeve, beaming smile, facing right |
| Flimmer | FIGUR-KLEIN, 16 Pixel | A small round creature made of grey TV static with two bright white eyes and a wobbly outline, floating, facing right |
| Sitcom-Vater | FIGUR | A chubby sitcom dad in a brown sweater vest and slippers, hugging a chicken-shaped cookie jar, suspicious look, facing right |
| Sitcom-Mutter | FIGUR | A sitcom mom with big curly red hair and a flowery apron, hands on her hips, facing left |
| Sitcom-Sohn | FIGUR | A cheeky teenage sitcom son with a backwards cap, baggy jeans and a skateboard under his arm, smirking, facing left |
| Kommissar | FIGUR | An old police detective in a crumpled beige raincoat with a cigar, one finger raised as if asking one more question, facing right |
| Erzähler | FIGUR | An elderly gentle nature documentary narrator with white hair, a safari shirt and khaki shorts, crouching behind a bush with a microphone and a thick script, whispering, facing right |
| Löwe | FIGUR-GROSS, 60 Pixel | A dramatic male lion with a big fluffy mane and no crown, sulking on a rock with his chin on his paws, facing left |
| Hyäne | FIGUR, 34 Pixel | A shifty spotted hyena sitting upright with a perfectly straight serious face, lips pressed together to hold back a laugh, facing right |
| Gepard | FIGUR, 30 Pixel | A thin cheetah with a sweatband on its head, sitting with a stopwatch around its neck, panting, facing left. Second pose: lying flat on its belly, tongue out, exhausted |
| Geier | FIGUR, 30 Pixel | A vain vulture perched on a branch, rubbing shiny lotion onto its bald head, a small mirror in one claw, facing right |
| Nashorn | FIGUR-GROSS, 60 Pixel | A big grey rhinoceros sleeping while standing, eyes closed, head drooping, a small bird on its horn, facing right |
| Flamingo | FIGUR-KLEIN, 24 Pixel | A pink flamingo standing on one leg, gossiping look, facing left |
| Zombie | FIGUR | A dancing 1980s zombie with green skin, a torn mustard-yellow suit with big shoulder pads and a skinny tie, one arm raised in a disco pose, facing right |
| Zombie im Grab | FIGUR | A zombie hand and head with green skin rising from a mound of earth |
| Geist | FIGUR-KLEIN, 24 Pixel | A round white bedsheet ghost with two black eye holes and a frightened expression, floating |
| FBI-Agent | FIGUR | A paranoid government agent in a dark suit and a long trench coat, a flashlight in one hand and a small glowing gadget in the other, nervous eyes, facing left |
| Super-Siegfried | FIGUR, 64 Pixel | A muscular sleepy hero in a green onesie with an orange round pretzel emblem on the chest and an orange bath towel tied as a cape, messy blond hair, yawning, facing right, no diamond shield, no S shape |
| Fledermann | FIGUR | A rich old man in a homemade costume made from black umbrellas sewn together, a monocle, a top hat instead of a mask, hanging upside down from a lamp post, facing right, no pointed ears, no bat emblem |
| Wonder-Wilma | FIGUR | A middle-aged woman in a pink gym outfit, leg warmers and a headband, swinging a glowing jump rope like a lasso, confident smile, facing left |
| Dr. Werbepause | FIGUR | A grinning villain in a suit covered in colorful product stickers, slicked hair, holding a megaphone and a blank cardboard sign, facing left |
| Empfangsdame | FIGUR | A bored receptionist with a headset, a high ponytail and long pink fake nails, chewing gum, sitting behind a desk, facing right |
| Sicherheitsmann | FIGUR, 64 Pixel | A large security guard in a black suit with an earpiece and sunglasses, arms crossed, facing left (zweimal verwenden, Farbvariante) |
| Zappmann | FIGUR | A flamboyant TV executive in a glittering golden jacket, slicked back silver hair, tinted sunglasses and a remote control in a hip holster, arms spread like a showman, facing left |
| Junger Zappmann | FIGUR | A shy young man with a bowl haircut, a knitted sweater and a hand puppet on one arm, nervous smile, faded colors, facing right |
| Käsemann | FIGUR | Steckbrief Max, plus: a white bedsheet cape, a yellow cheese-colored eye mask, both fists on his hips, a grey and white tomcat on his shoulder, facing right |

### Gegenstände

Alle mit dem Baustein GEGENSTÄNDE. Die Fernbedienungen stehen bei den weltenübergreifenden Gegenständen.

| Sammelbild | Motiv |
| --- | --- |
| Tasten-Symbole (2×3, 16×16) | 2x3 grid of round plastic buttons: double arrow channel switch; pause bars; rewind arrows; crossed-out speaker; speech bubble with lines; radio wave magnifier |
| Splitscreen-Adapter (1×1) | A small plastic TV adapter box with two cables and a split screen symbol |
| Genre-Ketten (2×3) | 2x3 grid: a fresh yellow banana peel; a rotten black banana peel; a green banana-shaped stink bomb with a fuse; a block of fondue cheese; the same cheese glowing yellow; a cheese wedge glowing radioactive green with a sparkle |
| Sender (2×3) | 2x3 grid: a TV guide magazine with a blank cover; a chicken-shaped cookie jar; a wooden kitchen door with a round window; a bedsheet with a cheese-colored eye mask; a heavy black anvil; a string of colored light bulbs |
| Comic-Panels (1×4) | 1x4 single comic panels with thick black borders and halftone dots: a hero leaping; a jagged empty explosion burst; a villain laughing; a vat of bubbling cheese |
| Drehbuch (1×1) | A thick stapled script with a coffee stain and a pencil clipped to it |
| Lichtröhre Deluxe (1×1) | A long fluorescent tube glowing pale blue, still in a flashy blister pack with a gold sticker |

Krone des Löwen und Alien-Gerät sind keine Inventar-Gegenstände: Die Krone fällt nur in der Hyänen-Animation aus dem Fell, das Gerät ist Requisite des FBI-Agenten.

### Nur zum Ansehen

| Objekt | Ort | Anspielung | Kommentar-Idee |
| --- | --- | --- | --- |
| Kaputtes Radio mit Kratzern | Empfang | „Video Killed the Radio Star“ | Max: „Das Fernsehen hat ihn erwischt. Klassischer Fall.“ |
| Wand mit goldenen Schallplatten | Empfang | – | Pixel: „Lauter Hits, die keiner mehr kennt. Wie bei deinem Opa.“ |
| Kassetten-Sammlung „Hits der 80er“ | Spukhaus-Keller | Mixtapes | Pixel: „Band-Salat in vier Teilen. Hatte dein Opa auch mal.“ |
| Regenwolke über einem Schlagzeug | Savanne | „Africa“ (Toto) | Max: „Es regnet auf das Schlagzeug. Irgendwer hat das bestimmt so gewollt.“ |
| Käse-Suchscheinwerfer am Himmel | Fondue-Fabrik | Bat-Signal | Pixel: „Wenn es hier nach Käse riecht, ist der Held nicht weit.“ |
| Lachkonserven-Maschine | Sitcom-Küche | Sitcoms | Max: „Die lacht über alles. Sogar über mich.“ |
| Ersatz-Publikum aus Pappe | Sitcom-Küche | – | Pixel: „Endlich ein Publikum auf meinem Niveau.“ |
| Mikrofonangel über dem Löwen | Savanne | Tierdokus | Max: „Der Löwe kriegt ein Mikro. Ich krieg nicht mal WLAN.“ |
| Gestapelte Preise | Glücksrad-Studio | Teleshopping | Max: „Ein Toaster, eine Kreuzfahrt und ein Toaster. Die Auswahl ist erschlagend.“ |
| Discokugel im toten Baum | Musikvideo-Friedhof | „Thriller“ | Pixel: „Untot und trotzdem besser angezogen als du.“ |
| Röhrenfernseher mit Rauschen | Spukhaus-Keller | *Poltergeist* | Max: „Fernsehen im Fernsehen. Das ist mir zu meta.“ |
| Umhänge-Schild „Nicht der Fledermann“ | Kapitolis | Superhelden-Tarnung | Max: „Also definitiv der Fledermann.“ |
| Wasserturm mit Spinnennetz | Kapitolis | Spinnen-Held | Pixel: „Da wohnt jemand Freundliches aus der Nachbarschaft.“ |
| Monitorwand mit allen Sendern | Zappmanns Studio | – | Pixel: „So sieht also dein Wochenende aus.“ |
| Gong-Schlag im Rauschen | Rauschen zwischen den Sendern | Nachrichten-Gong | Pixel: „Acht Uhr. Abendessen. Immer.“ |
| Trödel-Experte mit Lupe | Glücksrad-Studio | Trödel-Shows | Der Experte schätzt Max' Sneaker auf „zwölf Euro, aus Mitleid“. |
| Kiste mit Krabbeltieren und Sternchen-Schild | Savanne | Dschungel-Shows | Max: „Da greif ich nicht rein, nicht mal für Follower.“ Pixel: „Ich schon.“ |
| Wettkandidat, der Buntstifte am Geschmack erkennt | Zappmanns Studio | Samstagabend-Wettshows | Max: „Und ich dachte, mein Hobby ist peinlich.“ |
| Lichtröhre Deluxe als Teleshopping-Produkt | Glücksrad-Studio, später Inventar | Star Wars (Lichtschwert) | Gerd Glück: „Jetzt mit Original-Summgeräusch!“ Im Comic-Kanal: WRRUMM-Blase, Pixel: „Die Macht ist nicht mit dir. Aber das Marketing.“ |
| Müllpresse für abgesetzte Serien | Kellerarchiv | Star Wars (Müllpresse) | Max: „Hier landen also alle Serien nach der ersten Staffel.“ Pixel, beim Blick auf das Auge: „Der guckt seit 1977 nur noch Wiederholungen.“ |

| Sammelbild | Motiv |
| --- | --- |
| Deko Welt 4 (3×3) | 3x3 grid: a broken old radio with scratches; a golden vinyl record in a frame; a stack of cassette tapes; a small rain cloud above a drum kit; a laugh track machine with a big red button; a cardboard audience cutout; a toaster on a podium; a disco ball; a cardboard sign hanging on a string |

Suchscheinwerfer, Monitorwand, Mikrofonangel und Wasserturm sind Teil der Hintergründe. Das Umhänge-Schild von Hand beschriften.

### Animationen

| Figur | Aktion | Rätsel | Bilder | Ablauf | Motiv |
| --- | --- | --- | --- | --- | --- |
| Gerd Glück | Rad drehen | 2, 9 | 6 | einmalig | The host spins a big prize wheel with a dramatic flourish, grinning at the camera |
| Gerd Glück | Selbstwerbung | 9 | 4 | Schleife | The host points at himself and holds up his own price tag, winking |
| Flimmer | Flackern | alle | 4 | Schleife | The static creature flickers and wobbles, eyes blinking |
| Hyäne | Lachen, Krone fällt | 4 | 8 | einmalig | The serious hyena bursts out laughing, rolls on its back, and a small golden crown falls out of its fur |
| Gepard | Sprinten und umfallen | 4 | 8 | einmalig | The cheetah dashes to the right in a blur, then flops onto its belly exhausted |
| Zombies | Aufstehen | 5 | 8 | einmalig | A zombie in a mustard suit climbs out of a grave and brushes off dirt |
| Zombies | Tanzen | 5 | 8 | Schleife | A zombie in a mustard suit dances a stiff disco routine, arms swinging |
| Geister | Fliehen | 6 | 6 | einmalig | Bedsheet ghosts flee in panic from a bright doorway, flapping |
| Super-Siegfried | Gähnen | 10 | 4 | Schleife | The hero in a green onesie stretches and yawns, towel cape drooping |
| Fledermann | Schaukeln | 10 | 4 | Schleife | The umbrella-costumed man swings gently upside down from a lamp post |
| Dr. Werbepause | Ausrutschen | 11 | 8 | einmalig | The sticker-covered villain steps on a banana peel and falls flat on his back |
| Dr. Werbepause | Flucht vor Gestank | 11 | 6 | einmalig | The villain holds his nose and runs off to the right, green fumes around him |
| Zappmann | Aufgeben | 13 | 8 | einmalig | The showman lowers his arms, sits down on the golden sofa and buries his face in his hands |
| Max | Fernbedienung | alle | 4 | einmalig | Max points a remote control forward and presses a button, facing right |
| Max | In den Käsebottich | 10 | 8 | einmalig | Max slips off a catwalk and falls into a vat of glowing cheese, splash |
| Max | Käsemann-Pose | 10 | 4 | einmalig | Max in a bedsheet cape strikes a hero pose, cat on his shoulder copies it |
| Umschalten | Effekt | alle | 6 | einmalig | EFFEKT: a burst of TV static that wipes across the screen, 320x180 |
| Pause | Effekt | alle | 2 | Schleife | EFFEKT: two white pause bars blinking in a corner, 32x32 |
| Rückspulen | Effekt | 4, 5 | 4 | Schleife | EFFEKT: horizontal VHS tracking lines rolling down the screen, 320x180 |
| Lampenflackern | Effekt | 7 | 4 | einmalig | EFFEKT: a light bulb flickering on and off with a warm glow, 16x32 |
| Max | Röhre schwingen | – | 6 | einmalig | Max swings a pale blue glowing fluorescent tube like a sword in two dramatic arcs, then nearly drops it, facing right |
| WRRUMM-Blase | Effekt | – | 4 | einmalig | EFFEKT: a jagged comic sound effect burst with thick outline and halftone dots pops up and shakes, empty inside, 64x48 (Schrift von Hand) |
| Müllpresse | Wände rücken, Auge blinzelt | 12 | 6 | Schleife | EFFEKT: the steel walls of a trash compactor creep inward a few pixels and back, a small eye on a stalk blinks among video tapes, 96x64 |

### Minispiele und Benutzeroberfläche

| Asset | Werkzeug | Motiv |
| --- | --- | --- |
| Testbild-Balken (Graustufen-Rätsel) | Von Hand | Sieben senkrechte Farbbalken, je 32×120, in der Testbild-Palette; einfacher als jede KI; dazu dieselben sieben Balken als Grautöne von hell nach dunkel für Pixels Sicht |
| Quiz-Panel | `rd_pro__ui_panel` | A glittering game show quiz panel with a question bar on top and three answer buttons, gold frame with light bulbs, no text |
| Rhythmus-Leiste | `rd_pro__ui_panel` | A neon dance-game bar with four arrow lanes and a glowing hit zone at the bottom, purple and green, no text |
| Lichterketten-Alphabet | Von Hand | 26 Glühbirnen mit Buchstaben an die Hintergrundwand setzen; Buchstaben nicht per KI |
| Autoplay-Countdown | rd\_pro\_\_ui\_panel | A glossy TV overlay panel in the lower right corner with a big circular countdown ring and an empty thumbnail slot, no text (Ziffern von Hand) |
