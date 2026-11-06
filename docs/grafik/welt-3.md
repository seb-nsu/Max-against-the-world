# Grafik: Welt 3, Neo-Neustadt 2099

## Konzept

Welt 3 hat drei klar unterscheidbare Looks, damit der Spieler beim Springen zwischen den Ebenen nie durcheinanderkommt: die echte Unterstadt nass und neonbunt, die Simulation zu sauber und leicht grünstichig, das Labor steril weiß.

**Farb-Bausteine:**

| Ebene | Baustein |
| --- | --- |
| Realität (Unterstadt) | rainy night cyberpunk palette of deep navy, neon magenta and cyan, wet reflective streets, steam |
| Simulation | overly clean daytime city palette with a faint green tint, perfect sky, slightly too symmetrical |
| Labor | sterile palette of white panels, light grey and soft orange warning stripes, cold even light |

**Code-Sicht:** Eine Überlagerung in leuchtendem Grün auf schwarzem Grund. Gegenstände zeigen ihre Eigenschaften als Wort-Etiketten, die Schrift wird von Hand gesetzt.

**Orte:**

| Ort | Ebene | Beschreibung | Rätsel |
| --- | --- | --- | --- |
| Unterstadt, Straße | Realität | Regen, Neonschilder ohne Text, Nudelbude mit Herrn Vier, klingelnde Telefonzelle, Detektiv Deckert unter einem Vordach | 1, 2 |
| Widerstandsbasis | Realität | Wrack eines Schwebeschiffs, Kapseln mit Kabeln, Terminal, Lüftungsschacht | 7, 13 |
| Pillenautomat | Realität | Leuchtender Automat in einer Gasse, Ausgabefach mit zwei Pillen | 3 |
| Laboreingang | Realität | Panzertür, Roboter-Hausmeister, Kartenleser | 8 |
| Stadtstraße | Simulation | Perfekte Stadt, schwarze Katze, Telefonzelle | 4, 5 |
| Küche der Orakel-Oma | Simulation | Gemütliche Küche, Ofen mit Keksen, Vase auf dem Regal | 4 |
| Büroturm, 50. Stock | Simulation | Endloser Flur mit gleichen Türen, Fenster ohne Ausgang, Farbcode an der Wand | 5, 6, 7 |
| Testkammern 1 bis 3 | Labor-Simulation | Weiße Kammer mit Bodenschalter, Lasersperre, Ausgangstür, Lautsprecher | 9 |
| Kern von M.U.T.T.I. | Labor-Simulation | Runde Halle, M.U.T.T.I. von der Decke, glühende Energiezelle | 10, 11 |

**Figuren:** M.U.T.T.I., Morphäus, die Orakel-Oma, Agent Schmidt mit Klonen, der Roboter-Hausmeister, Detektiv Deckert, Herr Vier, Kabel-Kalle, Begleitwürfel Bernd, Putzroboter Piepsi, zwei Rebellen.

**Gegenstände mit Verwandlung:** Rezeptkarte und Glückskeks, Akte als Datei und als Ordner, Zugangskarte als Code-Schlüssel und als Plastikkarte, Kekse und Hundekuchen.

**Weitere Gegenstände:** rote und blaue Pille, Kaffeetasse, Telefonbuchseite, Portalgerät mit leerer Batterie, Gummihuhn, Morse-Tabelle, Farbcode-Zettel, Energiezelle (glühend und abgekühlt).

## Prompts

Vorne den Baustein aus dem Tab „Grafik“, dann das Motiv, hinten den Farb-Baustein der jeweiligen Ebene. Figuren, die in mehreren Ebenen auftreten, einmal erzeugen und nur für die Simulation per Farbkorrektur grünstichiger machen.

### Szenen

Alle mit dem Baustein HINTERGRUND.

| Szene | Ebene | Zustände | Muss sichtbar sein | Motiv |
| --- | --- | --- | --- | --- |
| Unterstadt, Straße | Realität | – | Nudelbude, Telefonzelle, Vordach, Pizza-Plakat | Narrow rainy street in a future megacity at night. Left: a tiny noodle stall with a steaming pot, a counter and three stools under a paper lantern. Center: a glowing old-fashioned phone booth, puddles reflecting neon. Right: a shop awning dripping water, a giant blank neon billboard of a pizza slice above it. Background: stacked skyscrapers, flying cars as tiny lights, steam rising from street grates. A paper unicorn figure lies in a puddle |
| Pillenautomat | Realität | – | Automat mit zwei Ausgabefächern | Dark narrow alley behind a pharmacy at night. Center: a tall glowing medicine vending machine with a big round scanner lens, a cross symbol on top and two small output trays side by side, one lit red and one lit blue. Left: stacked crates and a dripping pipe. Right: a flickering wall lamp. Rain, wet cobblestones reflecting the machine's light |
| Widerstandsbasis | Realität | Fenster zu und offen | Kapseln, Terminal, Fenster über Max' Kapsel, Lüftungsschacht, Tisch mit Kalles Tasse, Ecke für Piepsi | Inside the rusty hull of a crashed hovercraft turned hideout. Left: a row of four sleeping pods with glass lids and tangled cables plugged into a patch panel, a round hatch window in the ceiling above the first pod. Center: an old bulky computer terminal with a green screen and a tiny keyboard. Right: an open ventilation shaft, stacked pizza boxes, a towel on a hook, a small table with a dirty coffee mug, an empty cluttered corner with oil stains on the floor (Platz für Piepsi als eigenes Sprite). Dim blue light with neon leaking through cracks. Second version: the ceiling window open with snow drifting in |
| Laboreingang | Realität | Tür zu und offen | Panzertür, Kartenleser, Pinnwand | A heavy round blast door set into a concrete wall at the end of an underground passage. Right of the door: a card reader with a small red light. Left: a mop bucket and a corkboard with pinned charts. Yellow-black warning stripes on the floor, a single ceiling lamp, dripping water. Second version: the blast door rolled open revealing a small room with a wall of glowing data ports and one thick cable plugged in |
| Stadtstraße | Simulation | – | Telefonzelle, Gehweg für die Katze, Eingang Büroturm | A suspiciously perfect city street on a sunny day. Rows of identical trees and identical white houses with identical red cars parked in front. Left: a phone booth. Center: a long clean sidewalk. Right: the glass entrance of a tall office tower. Perfect blue sky with one cloud repeated three times |
| Küche der Orakel-Oma | Simulation | Vase da und weg | Ofen, Vase auf dem Regal, Kochbuch, Radio | A homely retro kitchen. Left: an old oven with a tray of cookies inside and a warm glow. Center: a wooden table with a plate, a teapot and a thick open cookbook. Right: a high shelf with a blue flower vase, a radio and jars. Lace curtains, floral wallpaper, a cuckoo clock. Second version: the shelf without the vase |
| Büroturm, 50. Stock | Simulation | – | Farbcode an der Wand, Fenster, gleiche Türen | An endless office corridor seen from the side, identical grey doors repeating into the distance, potted plants all the same. Left: a window showing only more corridor outside. Center: three wide colored stripes painted on the wall, red, green and yellow. Right: a water cooler and a staircase that ends in the ceiling. Cold fluorescent lights |
| Testkammer 1 | Labor | – | Bodenschalter, Ausgangstür, Portalgerät-Halterung, Lautsprecher | A bright white test chamber made of square wall panels. Left: the entrance with a handheld device mounted on the wall. Center: a large round red floor button. Right: a closed exit door. A small round speaker on the ceiling. A cardboard cake standing in a corner |
| Testkammer 2 | Labor | Laser an und aus | Lasersperre, Gummihuhn-Sockel | The same white test chamber with a horizontal red laser barrier across the center and a small pedestal on the left, scribbled marker writing on one panel near the floor |
| Testkammer 3 | Labor | Tür zu und offen | Verschlossene Tür, Lautsprecher | The same white test chamber with a large locked exit door with a padlock symbol and a big wall speaker next to it, a narrow gap in front of the door |
| Kern von M.U.T.T.I. | Labor | Normal, Schnee | Sockel mit Energiezelle, Platz für M.U.T.T.I. | A round white hall seen from the side. Center: a pedestal with a glowing orange energy cell in a socket. Upper half kept empty for a huge machine hanging from the ceiling. Thick cables along the floor, soft orange stripes. Second version: snow falling gently across the hall |
| Code-Sicht | alle | – | gleiche Umrisse | Same scene drawn only as glowing green wireframe outlines on black, objects outlined with small blank label tags (als Überlagerung) |
| Opas Sofa (Blaue-Pille-Szene) | Gegenwart | – | – | Wiederverwendung aus dem Prolog: Wohnzimmer mit Max-Sofa-Pose, nur ein übertrieben gemütlicher Filter |

### Figuren

| Figur | Baustein | Motiv |
| --- | --- | --- |
| M.U.T.T.I. | FIGUR-GROSS, 120 Pixel | A huge ceiling-mounted AI machine shaped like a giant white kitchen stand mixer hanging upside down. A single round lens eye glowing soft orange, two curler-shaped antennas, a floral apron pattern painted on its casing, a whisk attachment as a chin |
| Morphäus | FIGUR, 60 Pixel | A calm tall bald man with dark skin, a neat grey beard, a long burgundy velvet coat, a turtleneck and small oval reading glasses, holding two empty pill blister packs and shrugging apologetically, facing left |
| Orakel-Oma | FIGUR, 50 Pixel | A cheerful plump old lady with grey curls, a flowery dress, fluffy slippers and oven mitts on both hands, holding a tray of cookies, a knowing smile, facing right |
| Agent Schmidt | FIGUR | A stiff man in a grey suit with a narrow grey tie, slicked side-parted hair, black sunglasses, a coiled earpiece wire, a folder under his arm and fuzzy pink slippers, facing left |
| Schmidt-Klon | FIGUR | The same stiff man in a grey suit, black sunglasses and fuzzy pink slippers, holding a coffee mug, facing right (identisch außer der Tasse) |
| Roboter-Hausmeister | FIGUR, 58 Pixel | A bulky boxy retro robot in blue janitor overalls, a mop in one hand, a small oil can in its chest pocket, one round yellow eye light, polite bowing posture, facing right |
| Detektiv Deckert | FIGUR | A weary detective in a long beige trench coat and a wide-brimmed hat with rain dripping off it, holding a notepad and a small flashlight, tired eyes, facing right |
| Herr Vier | FIGUR, 48 Pixel | A short serious noodle cook with a white cap, a white apron and gloves with four fingers each, holding a ladle, standing behind a counter, facing left |
| Kabel-Kalle | FIGUR | A skinny tech nerd with a headset, cables wrapped around his neck like scarves, a screwdriver in his mouth, thick glasses, a laptop under his arm, facing right |
| Bernd | FIGUR-KLEIN, 16 Pixel | A grey metal cube with a pair of googly eyes and a smiley face sticker, floating slightly above the ground |
| Rebellin | FIGUR | A scruffy resistance woman with short spiky hair, a patched black leather jacket and black sunglasses, eating noodles from a carton, facing right |
| Rebell | FIGUR | A scruffy resistance man with a beanie, a patched black leather jacket, black sunglasses and a toolbelt, facing left |
| Piepsi | FIGUR-KLEIN, 18 Pixel | A small round cleaning robot shaped like a dented white bucket on three little wheels, one big round blue lens eye, a tiny antenna and a crumpled bowler hat on top, cheeky look, facing right. Second version: rusty brown, eye dark, slumped to one side |
| Opa als Hologramm | FIGUR-KLEIN, 24 Pixel | A tiny translucent blue hologram of an old man in a cardigan with glasses, kneeling and pleading with raised hands, scanlines and flicker, standing on a beam of light |
| Weinender Mann | FIGUR | A middle-aged man in a rumpled raincoat sitting on a stool, crying loudly into a bowl of noodles, facing left |
| Frau mit Regenschirm | FIGUR | A woman in a yellow raincoat arguing angrily with her inside-out umbrella, rain dripping, facing right |
| Schwarze Katze | FIGUR-KLEIN, 14 Pixel | A sleek black cat walking calmly, tail up, facing right |
| Max als Ente | FIGUR, 30 Pixel | A yellow duck wearing a tiny grey hoodie and messy brown hair, looking confused, facing right |
| Max in der Kapsel | FIGUR-GROSS, 70 Pixel breit | Max in a grey hoodie lying asleep inside a sleeping pod with a glass lid, cables plugged into the pod, side view |
| Porträt M.U.T.T.I. | PORTRÄT | The round orange lens eye of a white kitchen-mixer machine, curler antennas, strict but caring look |

### Gegenstände

Alle mit dem Baustein GEGENSTÄNDE. Schmidts Sonnenbrille steht bei den weltenübergreifenden Gegenständen.

| Sammelbild | Motiv |
| --- | --- |
| Verwandlung (2×4) | 2x4 grid, each pair side by side: a handwritten recipe card and a fortune cookie with a paper slip; a glowing green digital file icon and a thick brown paper folder with a clip; a glowing green key made of code symbols and a white plastic key card; a plate of round cookies and the same plate with bone-shaped dog biscuits |
| Kekse-Zustände (1×2) | 1x2: a plate of cookies covered in frost; the same plate steaming hot |
| Unterstadt (2×3) | 2x3 grid: a small red pill; a small blue pill; a white coffee mug; a torn phone book page; a sheet with three colored stripes; a laminated table of cat paw symbols |
| Labor (2×2) | 2x2 grid: a handheld white science gadget with an orange tip and an empty battery light; a yellow rubber chicken; a glowing orange energy cell; the same energy cell dark and frosty |
| Omas Vase (1×2) | 1x2: a blue flower vase; a rolled recipe slip |

### Nur zum Ansehen

| Objekt | Ort | Anspielung | Kommentar-Idee |
| --- | --- | --- | --- |
| Schwarze Katze, die zweimal vorbeiläuft | Stadtstraße | *Matrix* (Déjà-vu) | Pixel: „Ich kenne die. Wir reden nicht miteinander.“ |
| Neon-Pizza-Plakat | Unterstadt | – | Max: „Echte Pizza. Was auch immer das 2099 heißt.“ |
| Origami-Einhorn in der Pfütze | Unterstadt | *Blade Runner* | Max: „Jemand war hier. Und hatte zu viel Zeit.“ |
| Straßenmusiker mit Synthesizer im Regen | Unterstadt | Vangelis | Pixel: „So klingt Regen, wenn er traurig ist.“ |
| Handtuch am Haken | Widerstandsbasis | *Per Anhalter durch die Galaxis* | Max: „Wenigstens weiß hier jemand, wo sein Handtuch ist.“ |
| Alter Großrechner, der ein Kinderlied summt | Widerstandsbasis | *2001* („HAL“ singt „Daisy“) | Max: „Er singt. Das ist entweder süß oder sehr beunruhigend.“ |
| Gabel, die sich nicht biegt | Küche der Oma | *Matrix* | Max starrt sie lange an. Nichts. Max: „Es gibt keinen Löffel. Nur Omas Gabel, und die biegt sich nicht.“ |
| Kuckucksuhr, die „Milch!“ statt „Kuckuck“ ruft | Küche der Oma | Running Gag Milch | Pixel: „Die Uhr weiß mehr als wir alle.“ |
| Kuchenattrappe aus Pappe | Testkammer 1 | *Portal* | Max: „Wenigstens ist sie ehrlich.“ |
| Pinnwand mit Testergebnissen | Laboreingang | *Portal* | Pixel: „Testperson 47: ‚Sehr gut, aber zu wenig Kuchen verlangt.‘“ |
| Endlos-Treppe ins Nichts | Büroturm | Escher | Max: „Wer sowas baut, hat zu viele Meetings.“ |
| Wasserspender mit Blubbern | Büroturm | – | Max: „Der einzige hier, der Gefühle zeigt.“ |
| Steuerpult des Schwebeschiff-Wracks | Widerstandsbasis | Star Wars (Kessel-Lauf) | Kalle: „Die alte Kiste hat den Kessel-Lauf in unter zwölf Parsec geschafft.“ Max: „Parsec ist eine Strecke, keine Zeit.“ Kalle: „Sag ich doch. Kurze Strecke.“ |

| Sammelbild | Motiv |
| --- | --- |
| Deko Welt 3 (3×3) | 3x3 grid: a perfectly straight silver fork; a stack of greasy pizza boxes; a fake cardboard cake; a corkboard with pinned charts; a paper origami unicorn; a towel on a wall hook; a small synthesizer keyboard; a bulky old computer cabinet with a round yellow lamp and tape reels; a cuckoo clock |

Pizza-Plakat, Treppe und Wasserspender sind Teil der Hintergründe. Der Großrechner bewusst ohne rotes Auge, damit er nicht zu nah an HAL kommt.

### Animationen

| Figur | Aktion | Rätsel | Bilder | Ablauf | Motiv |
| --- | --- | --- | --- | --- | --- |
| M.U.T.T.I. | Sprechen | 10, 11 | 4 | Schleife | The mixer machine's orange eye pulses and the whisk chin wobbles while it talks |
| M.U.T.T.I. | Herunterfahren | 11 | 8 | einmalig | The mixer machine's eye dims, antennas droop, it sinks slowly with a sigh of steam |
| Agent Schmidt | Klonen | 6 | 8 | einmalig | EFFEKT: a man in a grey suit splits into two identical copies with a green flicker, 48x64 |
| Max | Zeitlupen-Ausweichen | 6 | 10 | einmalig | Max bends far backwards in slow motion, arms flailing, then freezes holding his lower back in pain, facing right |
| Max | Pille schlucken | 3 | 6 | einmalig | Max holds up a small red pill, swallows it, eyes go wide, facing right |
| Max | Code-Sicht einschalten | alle | 4 | einmalig | Max squints hard with one hand at his temple while green lines flicker over him |
| Pixel | Kabel umstecken | 7 | 6 | einmalig | Pixel pulls a cable from a panel with his teeth and plugs it in elsewhere, facing right |
| Pixel | Miau-Morse | 7, 13 | 4 | Schleife | Pixel taps a keyboard with one paw, meowing with his mouth open |
| Pixel | Schacht kriechen | 7 | 6 | Schleife | Pixel crawls through a narrow metal vent, flat on his belly, facing right |
| Pixel | Ohrfeige | 3 | 6 | einmalig | Pixel leaps up and slaps Max across the face with a paw |
| Roboter-Hausmeister | Wischen | 8 | 6 | Schleife | The boxy robot mops the floor in slow circles, humming |
| Herr Vier | Weinend kochen | 12 | 6 | Schleife | The noodle cook stirs a big pot while crying streams of tears into it |
| Bernd | Beleidigt davonschweben | 9 | 6 | einmalig | The metal cube turns away and floats off to the right, googly eyes rolling |
| Schwarze Katze | Zweimal vorbeilaufen | 3 | 8 | Schleife | Ein normaler Lauf-Zyklus, im Spiel zweimal exakt gleich abgespielt |
| Verwandlung | Effekt | alle | 6 | einmalig | EFFEKT: a short green digital glitch with square pixels around an item, 32x32 |
| Portal | Effekt | 9 | 8 | einmalig | EFFEKT: a round shimmering white-green hole opens for one second showing a cozy living room and closes again, 48x64 |
| Max als Ente | Watscheln | 7 | 6 | Schleife | The duck in a grey hoodie waddles in place, quacking |
| Regen | Effekt | Unterstadt | 4 | Schleife | EFFEKT: diagonal rain streaks and small splashes on the ground, 320x180 tileable |
| Schnee | Effekt | 11 | 4 | Schleife | EFFEKT: soft white snowflakes falling slowly, 320x180 tileable |
| Pixel | Tasse vom Tisch werfen | 13 | 6 | einmalig | Pixel sits on a table, stares at the viewer and slowly pushes a coffee mug off the edge with one paw |
| Piepsi | Hochfahren | 13 | 8 | einmalig | The rusty bucket robot shakes, straightens up, its blue eye lights up and its hat pops up |
| Piepsi | Piepen | 13 | 4 | Schleife | The bucket robot wobbles from side to side, antenna blinking, eye flashing angrily |
| Hologramm | Effekt | 13 | 6 | Schleife | EFFEKT: a cone of flickering blue light with horizontal scanlines projected upward from a small lens, 32x48 |
| Max | Gedankentrick | 8 | 4 | einmalig | Max slowly waves one open hand in front of him with a serious mystical face, facing right |
