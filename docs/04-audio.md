# Audio: Musik, Geräusche, Sprachausgabe

Aufgebaut wie die Grafik-Dateien: erst die Werkzeuge, dann Regeln für Prompts, dann pro Welt die Stücke und Geräusche mit fertigen Prompts. Prompts auf Englisch, weil die Modelle damit am verlässlichsten arbeiten.

## Werkzeuge

| Aufgabe | Empfehlung | Kosten | Warum |
| --- | --- | --- | --- |
| Sprachausgabe (Dialoge) | ElevenLabs, Voice Design | Starter 6 $/Monat zum Testen, für die Gesamtproduktion etwa vier Monate Pro (rund 400 $, Rechnung unter „Sprachausgabe“) | Beste deutsche Betonung, Stimmen per Beschreibung erfinden, kommerzielle Rechte ab Starter |
| Geräusche (SFX) | ElevenLabs Sound Effects | im selben Abo | Geräusch per Satz beschreiben, mehrere Varianten pro Klick |
| Musik, Cloud | ElevenLabs Music | im selben Abo | Mit lizenzierter Musik trainiert, Spiele ausdrücklich erlaubt; verbietet Künstlernamen im Prompt, passt also zur Parodie-Regel |
| Musik, lokal | ACE-Step 1.5 in ComfyUI Desktop | kostenlos | Apache-2.0-Lizenz (beim Download prüfen und so in die Credits eintragen), laut AMD läuft es unter Windows auf Radeon über ComfyUI Desktop (Vorlage „ACE Step 1.5 Turbo AIO“); ideal zum Ausprobieren vieler Varianten |
| Nachbearbeitung | Audacity | kostenlos | Loops schneiden, Lautstärke angleichen, Stille entfernen, Effekte wie Telefon- oder Radio-Klang |
| Ergänzung | CC0-Sammlungen (z. B. Kenney, freesound.org mit CC0-Filter) | kostenlos | Klicks, Schritte und UI-Geräusche gibt es fertig und in guter Qualität |

**Mein Vorschlag:** Ein ElevenLabs-Abo deckt Stimmen, Geräusche und Musik ab. ACE-Step lokal nimmst du für Musik-Experimente, die viele Versuche brauchen. Suno nicht verwenden: Dort laufen noch Klagen der Plattenfirmen, und Udio erlaubt keine Downloads mehr (Stand November 2026; vor der Steam-Seite neu prüfen und das Datum hier nachtragen).

**Regeln:**

- Nur bezahlte Tarife verwenden; die kostenlosen Stufen erlauben keine kommerzielle Nutzung. Rechnungen aus der Zeit der Erzeugung aufheben.
- Keine echten Stimmen klonen, auch nicht „klingt wie“ ein bekannter Sprecher. Alle Stimmen per Voice Design neu erfinden.
- Steam verlangt die Offenlegung von KI-Stimmen und KI-Musik im selben Formular wie bei der Grafik.
- Sprachausgabe erst erzeugen, wenn das Skript fertig ist. Jede Änderung danach kostet erneut.

## Im Spiel: Dateien und IDs

Das Audio-Gerüst steht (`game/skripte/klang.gd`, Autoload „Klang“): Jede Stelle, an der später ein Klang kommt, ruft ihn schon über eine ID auf. Liegt die Datei im Ordner, spielt sie; fehlt sie, bleibt es still. So wird Audio einfach in die Ordner gelegt, ohne Code anzufassen.

| Art | Ordner (unter `game/`) | ID | Woher |
| --- | --- | --- | --- |
| Musik | `audio/musik/<id>.ogg` | `titel`, `zappomat`, `werbeblock` und die Raum-Stücke | Raum-Stücke aus der Welt-Tabelle (`musik: <ID>`); wechselt mit einer Sekunde Überblendung, dasselbe Stück läuft weiter |
| Jingles | `audio/jingles/<id>.ogg` | `aufgehoben`, `geloest`, `welt_geschafft`, `falsch`, `lachkonserve`, `gluecksrad` | Gegenstand bekommen, Rätselschritt gelöst, Welt geschafft, Ersatzzeile |
| Geräusche | `audio/geraeusche/<id>.ogg` | `ui_klick`, `inventar`, `seite`, `kombinieren`, `fehler`, `wechsel`, `hinweis`, `speichern`, `nahansicht`, `notiz`, `zappomat_sog`, `werbeblock_start`, `umschalten` (Fernbedienung), `gong` (Welt 4, Rauschen um acht) | Bedienung und Spielsysteme (Tabelle Geräusche). Diese 14 ruft der Code schon auf; die übrigen Kennungen der Tabelle Geräusche sind vergeben, aber noch nicht verdrahtet |
| Stimmen | `audio/stimmen/<sprache>/<ZEILEN_ID>.ogg` | Zeilen-ID der Sprechblase, Kaskaden mit `_2`, `_3` | `export/audio-zeilen.csv` aus `tools/skript_export.py`; NAR bleibt stumm |

`.wav` und `.mp3` gehen auch. `python3 tools/audio_liste.py` schreibt `export/audio-stand.csv` (welche ID gebraucht wird, wo, und ob die Datei schon da ist); mit `--pruefen` meldet es Dateien, deren Name zu keiner ID passt (läuft in GitHub Actions). Lautstärken kommen aus den Optionen über die Busse Musik, Geraeusche und Stimmen.

**Brabbel-Laute und Platzhalter-Töne (bis die echten Dateien da sind):** Ohne Stimmdatei brabbelt jede Figur: je Silbe des angezeigten Textes ein kurzer Ton, Tonhöhe und Tempo je Figur aus `game/skripte/klang.gd` (rund 30 Hauptfiguren eingestellt, alle übrigen bekommen Werte aus ihrem Kürzel, damit jede anders klingt; Erzähler, Toilette, Schrank und Berater bleiben stumm). Fehlt eine Datei für ein Geräusch oder einen Jingle, erzeugt `game/skripte/platzhalter_klang.gd` einen kurzen Ton aus Sinus, Rechteck, Rauschen oder Glocke (eigenes Rezept für jede ID der Tabelle oben, unbekannte IDs bekommen einen Ton, dessen Höhe aus der ID folgt). Beides steht in den Optionen („Brabbel-Laute“, „Platzhalter-Töne“) und ist standardmäßig an; eine echte Datei hat immer Vorrang. Im Headless-Test bleibt beides aus. Die Entscheidung über die Sprachausgabe (Tabelle unten) bleibt offen; Brabbel ist bis dahin der Platzhalter.

## Prompt-Regeln

| Art | Aufbau | Länge |
| --- | --- | --- |
| Musik | Genre, Instrumente, Tempo in BPM, Stimmung, Einsatz im Spiel, dahinter der Musik-Baustein (Ausnahmen unten) | 25–45 Wörter |
| Geräusch | Was, woraus, wie nah, wie lang, Nachhall | 8–20 Wörter |
| Stimme (Voice Design) | Alter, Geschlecht, Stimmfarbe, Tempo, Haltung, Akzent | 20–40 Wörter |

**Musik-Baustein (an jedes Raum-Stück anhängen):** `instrumental, no vocals, seamless loop, retro game soundtrack, warm and clean mix, 90 seconds`

**Ausnahmen:** Nicht anhängen bei Stücken, die kein Loop sind: `zappomat` (4 Sekunden), `werbeblock` (5 Sekunden), `abspann` (endet auf einer Kadenz) und alle Jingles. Dort steht die Dauer im Prompt, dahinter nur `instrumental, no vocals, retro game soundtrack, warm and clean mix`.

**Leitmotiv:** Das Titelthema ist eine kurze, pfeifbare Melodie. Jede Welt spielt sie in ihrem Stil an, damit alles zusammengehört. Ein Text-Prompt kann eine Melodie nicht weitergeben: Jedes Stück würde fünf andere Töne erfinden. Deshalb sind die fünf Töne hier festgelegt und kommen nachträglich in jedes Stück.

- **Die fünf Töne (Vorschlag, bitte prüfen):** g′ – c″ – e″ – d″ – c″ in C-Dur, also Quinte von unten, Grundton, Terz, Sekunde, Grundton. Rhythmus: kurz, kurz, lang, kurz, lang (zwei Achtel, Viertel, Achtel, Halbe). Bei 110 BPM dauert das rund zwei Sekunden.
- **Ablegen:** einmal als Pfeif-Aufnahme und einmal als MIDI-Datei speichern, beide neben den Musikdateien.
- **Einsetzen:** Das Titelthema wird um diese Töne gebaut (bei ACE-Step die Aufnahme als Referenz-Audio mitgeben, sonst so lange erzeugen, bis ein Stück die Töne trägt, oder sie in Audacity darüberlegen). In jedes Welt-Stück kommen die fünf Töne einmal nachträglich in Audacity, an einer ruhigen Stelle und im Instrument der Welt (MIDI mit passendem Klang oder neu eingespielt).
- **Tonart:** Damit das ohne Umstimmen passt, bekommt jedes Welt-Stück hinter dem Prompt den Zusatz „in C major“, die düsteren Stücke „in A minor“. Der Zusatz steht vor dem Musik-Baustein. Der frühere Zusatz „quotes the short cheerful five-note whistled motif of the main theme once“ entfällt.

## Musik

Welcher Raum welches Stück spielt, steht beim Raum in der Welt-Tabelle (`musik: <ID>` in `welten/*.yaml`); hier stehen nur ID, Beschreibung und Prompt. Die IDs sind klein und ohne Umlaute, Welt-Stücke beginnen mit dem Abschnitt (`w1_`, `w2_` …). Ein gesungenes Stück (Tabelle unten) darf ebenfalls Raum-Stück sein, wenn es im Raum durchgehend läuft (Dr. Werbepauses Spot).

| ID | Stück | Einsatz | Prompt |
| --- | --- | --- | --- |
| titel | Titelthema | Hauptmenü, Abspann-Variante; kein Raum-Stück | Playful adventure main theme, whistled melody over plucked guitar, upright bass and light brushed drums, 110 BPM, curious and mischievous, a short cheerful five-note motif repeated |
| gegenwart | Opas Wohnzimmer | Prolog, Rückkehr in die Gegenwart (Zwischenspiele); im Finale nur noch, bis die beiden Finale-Stücke zugewiesen sind | Cozy lo-fi living room music, warm electric piano, soft vinyl crackle, slow bass, 80 BPM, lazy Sunday afternoon, slightly sleepy |
| zappomat | Zapp-O-Mat | Übergang in jede Welt; kein Raum-Stück | Short sci-fi transition sting, rising analog synth sweep, TV static and a bright chime at the end, 4 seconds, not a loop |
| w1_dorf | Schwurbelstein Dorf | Welt 1 | Medieval village tune, lute, recorder and tambourine, 100 BPM, cheerful and slightly silly, like a bard who knows only one song |
| w1_schule | Zauberschule | Welt 1 | Whimsical magical school music, celesta, pizzicato strings and bassoon, 95 BPM, mysterious but funny, sparkling |
| w1_taverne | Taverne | Welt 1 | Rowdy tavern jig, fiddle, accordion and stomping feet, 125 BPM, crowded and drunk |
| w1_turm | Turm und Prinzessin | Welt 1 | Heroic but clumsy fantasy theme, brass, timpani and harp, 90 BPM, epic that keeps tripping over itself |
| w1_wald | Zauberwald | Welt 1 | Enchanted forest music, soft harp, wooden flute and bird calls, 85 BPM, dreamy with a mischievous undertone, something is watching from the bushes |
| w1_luftschloss | Luftschloss | Welt 1 | Airy cloud castle music, glass harmonica, soft choir pads and gentle wind chimes, 75 BPM, weightless and slightly absurd, like an estate agent humming |
| w1_bergwerk | Goblin-Bergwerk | Welt 1 (Instrumentalfassung des Goblin-Arbeitslieds) | Instrumental version of the goblin work song, deep tuba, anvil hits on every beat, bass drum and a grumpy bassoon, 96 BPM, same melody, no vocals |
| w2_aegypten | Ägypten | Welt 2 | Ancient Egyptian court music, oud, ney flute, frame drum and sistrum, 95 BPM, sunny and pompous with a comic undertone |
| w2_olympia | Olympia | Welt 2 | Ancient Greek sports festival music, lyre, aulos double flute and marching drums, 115 BPM, proud and energetic |
| w2_syrakus | Syrakus | Welt 2 | Calm Mediterranean harbor music, lyre, soft hand drums and seagull ambience, 85 BPM, thoughtful, an inventor at work |
| w2_fuenfkampf | Fünfkampf | Welt 2, Minispiele; kein Raum-Stück | Fast comic sports music, brass stabs, galloping drums and aulos, 140 BPM, tense and funny |
| w3_unterstadt | Unterstadt | Welt 3, Realität | Melancholic synthwave in the rain, warm analog pads, slow arpeggio, deep bass, 80 BPM, lonely neon night |
| w3_basis | Widerstandsbasis | Welt 3, Realität (Variante von Unterstadt) | Tense but hopeful underground hideout music, muted synth bass, dripping water, soft radio static and a hesitant piano, 90 BPM, same key as the rain theme |
| w3_simulation | Simulation | Welt 3 | Cheerful too-perfect elevator muzak, bright electric piano and soft bossa nova drums, 105 BPM, slightly unsettling in its perfection |
| w3_labor | Labor | Welt 3 | Sterile minimal electronic music, soft bleeps, glassy pads and a ticking pulse, 90 BPM, polite and passive-aggressive |
| w3_kern | M.U.T.T.I. Kern | Welt 3 | Ominous lullaby, music box melody over deep synth drones, 70 BPM, caring and threatening at the same time |
| w4_testbild | Testbild und Rauschen | Welt 4 | Ambient TV static drone with a faint sine test tone and distant fragments of melodies, eerie and empty |
| w4_gluecksrad | Glücksrad-Shopping | Welt 4 | Flashy 1980s game show music, brass fanfares, funky bass and synth stabs, 120 BPM, over the top |
| w4_sitcom | Küchen-Sitcom | Welt 4 | 1990s sitcom theme, slap bass, saxophone and bright drums, 110 BPM, upbeat and cheesy |
| w4_savanne | Tiertort Savanne | Welt 4 | Nature documentary meets crime drama, warm strings, marimba and a suspicious bass clarinet, 85 BPM |
| w4_mitternacht | Mitternachts-TV | Welt 4, Mitternachtssendung mit dem Rhythmus-Minispiel | Spooky 1980s disco funk, synth bass, gated snare, creepy organ and wolf howls, 118 BPM, steady beat for a rhythm game |
| w4_comic | Comic-Kanal | Welt 4 | Retro superhero cartoon theme, big brass, snare rolls and choir „aah“ pads, 130 BPM, heroic and silly |
| w4_spukhaus | Spukhaus | Welt 4, Spukhaus; das Rhythmus-Minispiel behält Mitternachts-TV | Creaky haunted house music, detuned harpsichord, theremin, slow heartbeat drum and a distant music box, 72 BPM, spooky but cozy, a ghost who enjoys company |
| w4_zentrale | Senderzentrale, Empfang | Welt 4, Senderzentrale auf Kanal 999 bis vor das Studio; die Zappmann-Show beginnt erst im Studio | Smooth corporate lobby jazz, muted trumpet, vibraphone and brushed drums, 92 BPM, polished and slightly sinister, elevator music that watches you |
| w4_zappmann | Zappmann-Show | Welt 4, Begegnung mit Zappmann | Glitzy late-night talk show band, big band brass, piano and drums, 120 BPM, smug and shiny |
| finale_maschine | Finale, Maschine läuft | Finale auf dem Dachboden, vom Start der Maschine bis zur roten Taste; auch der Schnitt ins Treppenhaus. Noch keinem Raum zugewiesen (siehe unten) | The main theme played faster and tighter, ticking percussion like a kitchen timer, low brass pulses, a steam whistle rising every eight bars, 126 BPM, tense but comic, never scary |
| finale_geburtstag | Finale, Geburtstag | Finale im Wohnzimmer, ab der Auflösung. Noch keinem Raum zugewiesen (siehe unten) | A warm, slightly clumsy living-room version of the main theme on upright piano, accordion and brushed drums, 92 BPM, like a family playing it themselves |
| werbeblock | Werbeblock-Spot | Zwischenspiele (Rückkehr auf den Dachboden), 5 Sekunden, kein Loop; kein Raum-Stück | Overly cheerful 1990s milk commercial sting, bright synth brass, cowbell and a sparkle, 5 seconds, not a loop, cut off by TV static at the end |
| abspann | Abspann | Ende; kein Raum-Stück | Warm variation of the main theme, acoustic guitar, piano and strings, 95 BPM, heartfelt with a wink, ends on a cheerful cadence |

**Finale (Prüfbericht, Fund 36):** Das Finale spielte bisher überall `gegenwart`, das schläfrige Wohnzimmer-Stück, obwohl eine Maschine heiß läuft und Oma vor der Luke steht. Dafür gibt es jetzt `finale_maschine` und `finale_geburtstag`. Am Supermarkt läuft kein Stück, nur Kühlregal-Brummen und Türgong (Tabelle Geräusche), mit der Schwarzblende setzt das Titelthema ein. Zugewiesen ist das noch nicht: In `welten/finale.yaml` steht für alle vier Räume weiter `gegenwart`. Der Dachboden ist dort derselbe Raum wie in den Zwischenspielen, deshalb reicht das Feld `musik` nicht. Es braucht einen Aufruf im Code, sobald die Maschine startet, und eine Kennung für „kein Stück“ am Supermarkt.

**Tempo im Rhythmus-Minispiel:** Erzeugte Musik hält ein Tempo nicht taktgenau. Bei `w4_mitternacht` deshalb das Tempo nach dem Erzeugen messen (Audacity, „Beat Finder“ oder von Hand) und die Taktmarken für das Minispiel von Hand setzen. Die 118 BPM im Prompt sind nur der Zielwert.

**Jingles (je 2–5 Sekunden, kein Loop):** Gegenstand aufgehoben, Rätsel gelöst, Welt geschafft, falscher Versuch (komische Posaune), Lachkonserve, Glücksrad-Gewinn. Prompt-Schema: `short [Stimmung] sting, [Instrument], [Dauer] seconds, not a loop`.

**Gesungene Stücke mit Rätselfunktion:** Diese drei brauchen Gesang und weichen deshalb vom Musik-Baustein ab. Die Spalte Rätsel nennt Abschnitt und Rätsel-IDs aus der Welt-Tabelle (`tools/pruefen.py` prüft sie). Am besten mit ElevenLabs Music oder ACE-Step (beide können Gesang), Text von mir, auf Deutsch. Jedes Lied im Spiel bekommt Untertitel, nicht nur diese drei: Liedzeilen erscheinen kursiv mit einem Notenzeichen davor und laufen synchron zum Gesang. Sie haben eigene Zeilen-IDs wie Dialog (Schema LIED\_Welt\_Stück\_Nummer) und werden mit übersetzt. Bei den drei Stücken mit Rätselfunktion sind die Untertitel immer an, auch wenn der Spieler Untertitel ausgeschaltet hat, damit kein Rätsel daran hängt, ob die KI-Stimme eine Silbe verschluckt.

| ID | Stück | Rätsel | Muss hörbar sein | Prompt |
| --- | --- | --- | --- | --- |
| lied_goblin | Goblin-Arbeitslied | welt-1 R10, R11 (Passwort-Teil R11a) | Der Passwort-Teil, klar artikuliert und als Untertitel eingeblendet; die Reihenfolge der vier Teile zeigen die Goblins mit Schildern, der Rhythmus trägt sie nur zusätzlich. Gesang früh testen, bevor das Rätsel darauf gebaut wird | Grumpy work song of a choir of goblin miners, deep gruff male voices, pickaxe hits on every beat, 4/4 at 96 BPM, call and response, 30 seconds, loopable, German lyrics |
| lied_waldemar | Waldemars Musical-Nummer | welt-1 R7; Abspann im Finale | Großer Schlusston, bei dem die Niesrosen aufgehen | Big Broadway-style show tune sung by a deep bass troll voice, piano, strings and brass, dramatic key change before the final long note, 60 seconds, German lyrics |
| lied_werbepause | Dr. Werbepauses Jingle | welt-4 R11, R11b (Stumm bricht ihn ab) | Eingängige Hook, die beim Stummschalten abrupt abbricht | Catchy hypnotic 1980s TV commercial jingle, bright synths and cheerful choir, 120 BPM, 12 seconds, repeating hook, German lyrics |

## Geräusche

Alle mit ElevenLabs Sound Effects oder aus CC0-Sammlungen. Immer mehrere Varianten erzeugen und die beste behalten.

Jedes Geräusch hat eine Kennung; die Datei heißt `audio/geraeusche/<Kennung>.ogg`. **Verdrahtet** heißt: Der Code ruft die Kennung schon auf (die 14 aus der Tabelle „Im Spiel: Dateien und IDs“). Alle anderen Kennungen sind vergeben, aber noch nicht im Code; sie kommen mit dem jeweiligen Abschnitt nach `Klang.GERAEUSCHE` in `game/skripte/klang.gd`. Wo der Einsatz noch nicht feststeht, steht „Einsatz noch festlegen“.

**Bedienung und Spielsysteme**

| Kennung | Geräusch (Prompt) | Einsatz |
| --- | --- | --- |
| ui_klick | soft wooden UI click | Menüs und Knöpfe (verdrahtet) |
| inventar | inventory bag rustle | Inventar auf und zu (verdrahtet) |
| seite | paper page turn | Notizbuch blättern (verdrahtet) |
| kombinieren | item combine pop with a sparkle | zwei Gegenstände kombiniert (verdrahtet) |
| fehler | error buzz, soft and funny | Aktion geht nicht (verdrahtet) |
| wechsel | character switch: short whoosh with a tiny cat bell | Wechsel zwischen Max und Pixel (verdrahtet) |
| hinweis | hint ready: soft paw tap and a light bulb ping | Hilfe-Pfote hat einen Hinweis (verdrahtet) |
| speichern | save game: quick pencil scribble and a page flip | Spielstand gespeichert (verdrahtet) |
| nahansicht | close-up open: paper unfolding close to the ear | Nahansicht geht auf (verdrahtet) |
| notiz | notebook entry: pencil scratching two words | neuer Eintrag im Notizbuch (verdrahtet) |
| zappomat_sog | rising electric hum and a whoosh as someone is sucked into a TV screen, 3 seconds | Zapp-O-Mat, Übergang in jede Welt (verdrahtet) |
| werbeblock_start | commercial break start: cheerful TV sting cut off by static | Zwischenspiele, Beginn des Werbeblocks (verdrahtet) |
| umschalten | remote channel change: heavy plastic click and a short static burst | Welt 4, Fernbedienung, jeder Kanalwechsel (verdrahtet) |
| zeitfaehre | time ferry departure: hourglass flip and a deep wooden bell | Welt 2, Abfahrt der Zeitfähre an den drei Fährstegen (Nil-Delta, Olympia, Syrakus) |
| code_sicht | code view toggle: digital shimmer rising then falling | Welt 3, Code-Sicht an und aus |
| portalgeraet | portal device battery: three rising electronic beeps | Welt 3, Portalgerät in den Testkammern |

**Max und Pixel, Gegenwart**

| Kennung | Geräusch (Prompt) | Einsatz |
| --- | --- | --- |
| schritt_teppich | sneakers walking on carpet | Max, Wohnzimmer |
| schritt_stein | sneakers on stone floor | Max, Räume mit Steinboden (Welt 1 Turm, Welt 2) |
| pfoten_holz | cat paws on wood | Pixel, Dachboden und Treppenhaus |
| pixel_miau | cat meow annoyed | Pixel, Einsatz noch festlegen |
| pixel_schnurren | cat purr close | Pixel, Einsatz noch festlegen; auch Minka (Welt 1) |
| pixel_fauchen | cat hiss short | Pixel, Einsatz noch festlegen; auch Minka und Schwan (Welt 1), Hofkater (Welt 2) |
| dosenoeffner | manual can opener cranking around a tin lid, then a soft hiss | Prolog und Finale, Dosenöffner |
| fernseher_an | old CRT television turning on with a high whine | Prolog, Fernseher im Wohnzimmer |
| kanal_rauschen | TV channel switching static burst | Prolog und Zwischenspiele, Kanäle am Fernseher |
| uhr_ticken | clock ticking in a quiet living room | Wohnzimmer, Grundatmosphäre der Gegenwart (Schleife) |
| opa_schnarchen | old man snoring softly on a sofa | Prolog, Wohnzimmer, solange Opa schläft |
| kuehlregal | supermarket refrigerated shelf hum, low and steady, loop | Finale, Supermarkt-Eingang (statt Musik, Schleife) |
| tuergong | supermarket entrance door chime, two soft electronic notes | Finale, Supermarkt-Eingang |

**Welt 1**

| Kennung | Geräusch (Prompt) | Einsatz |
| --- | --- | --- |
| zauberfunken | magic wand sparkle | Zauberstab-Laden und Klassenzimmer, jeder Zauber |
| korken | potion bottle uncorked | Klassenzimmer, Tränke |
| ziege | goat bleat comical | Schmiede (Schmiede-Ziege); tiefer und länger für die XXL-Ziege |
| huhn | chicken cluck | Huhn, Einsatz noch festlegen |
| amboss | anvil hammer strike | Schmiede |
| taverne_stimmen | tavern crowd murmur loop | Taverne, Raum-Atmosphäre (Schleife) |
| frosch | frog croak | Einsatz noch festlegen |
| w1_atmo | quiet village ambience, distant birds, a light breeze and a far-off cart, very soft, loop | Grundatmosphäre Welt 1, alle Außenräume (Schleife) |

**Welt 2**

| Kennung | Geräusch (Prompt) | Einsatz |
| --- | --- | --- |
| sand_schritte | sand footsteps | Ägypten, Außenräume (Nil-Delta, Sphinx) |
| krokodil_platschen | crocodile splash | Nil-Delta, Sobek |
| sanduhr | hourglass sand trickling | Zeitfähre, während der Überfahrt |
| stein_schleifen | stone grinding | Einsatz noch festlegen (Sphinx oder Grabhügel) |
| diskus | bronze discus whoosh | Stadion, Diskuswurf |
| stadion_jubel | crowd cheering in a stadium | Stadion, Raum-Atmosphäre und Fünfkampf |
| badewanne | bathtub splash | Archimedes' Werkstatt |
| w2_atmo | quiet warm ambience, soft wind over water, distant gulls and cicadas, very soft, loop | Grundatmosphäre Welt 2, alle Außenräume (Schleife) |

**Welt 3**

| Kennung | Geräusch (Prompt) | Einsatz |
| --- | --- | --- |
| regen_strasse | heavy rain on neon street loop | Unterstadt, Straße und Apothekengasse, Raum-Atmosphäre (Schleife) |
| telefonzelle | phone booth ringing old-fashioned | Stadtstraße (Simulation), Telefonzelle |
| schleusentor | hydraulic blast door opening | Laboreingang |
| terminal | computer terminal beeps | Terminals (Apothekengasse, Widerstandsbasis, Laboreingang, Büroturm) |
| laser | laser barrier hum | Testkammern, Einsatz noch festlegen |
| gummihuhn | rubber chicken squeak | Testkammern 1 bis 3, Gummihuhn |
| glitch | digital glitch | Simulation, Fehler im Bild |
| piepsi | small robot beeping and whistling in fast rude tones (Piepsi, 6–8 Varianten) | Piepsi, statt einer Stimme |
| hologramm | hologram flicker hum with crackle | Opas Hologramm (Widerstandsbasis, Testkammer 1) |
| w3_atmo | quiet low electrical hum with distant ventilation and a faint drip, very soft, loop | Grundatmosphäre Welt 3, Innenräume der Realität und Labor (Schleife) |

**Welt 4**

| Kennung | Geräusch (Prompt) | Einsatz |
| --- | --- | --- |
| rauschen | TV static loop | Rauschen zwischen den Sendern, Raum-Atmosphäre (Schleife) |
| rueckspulen | tape rewind squeal | Fernbedienung, Taste Zurückspulen |
| pause | pause click with a tape stop | Fernbedienung, Taste Pause |
| gluecksrad_ticken | game show wheel ticking slowing down | Glücksrad-Studio, das Rad dreht sich |
| lachkonserve | studio audience laughter | Sitcom-Küche; ist der Jingle `lachkonserve` aus `audio/jingles/` |
| zombie | zombie groan | Musikvideo-Friedhof |
| comic_schlag | comic punch impact | Kapitolis |
| lichtroehre | fluorescent tube buzzing and swooshing when swung | Lichtröhre Deluxe, jede Benutzung |
| muellpresse | rusty trash compactor walls grinding with crunching video tapes | Kellerarchiv, Müllpresse |
| gong | deep evening news gong echoing through TV static, 3 seconds | Rauschen zwischen den Sendern, um acht (verdrahtet) |
| w4_atmo | quiet television hum with a faint high whine and soft studio air conditioning, very soft, loop | Grundatmosphäre Welt 4, alle Studioräume (Schleife) |

**Grundatmosphäre:** Je Welt läuft eine leise Schleife unter der Musik (`w1_atmo` bis `w4_atmo`, in der Gegenwart `uhr_ticken`), damit kein Raum tot klingt. Räume mit eigener Atmosphäre (Taverne, Regen, Stadion, Rauschen) nehmen ihre statt der Grundatmosphäre. Das ist noch nicht verdrahtet: Es braucht ein Feld je Raum oder je Abschnitt und einen eigenen Abspieler in `klang.gd`.

## Sprachausgabe

**Umfang (grob geschätzt):** Das Skript hat 5.435 Zeilen, daraus werden 6.180 gesprochene Sprechblasen mit zusammen rund 504.000 Zeichen, im Schnitt 82 Zeichen je Sprechblase (Stand November 2026; die aktuellen Zahlen druckt `python3 tools/skript_export.py`, die Liste steht in `export/audio-zeilen.csv`). Es sind so viele, weil Max und Pixel fast jeden Gegenstand zweimal kommentieren, dazu Pixel-auf-Mensch-Zeilen, Pools und Zwischenspiele. Bei drei bis fünf Versuchen pro Pointe sind das 1,5 bis 2,5 Millionen Zeichen, Voice-Design-Vorschauen nicht eingerechnet. Die Kostenangabe oben (etwa vier Monate ElevenLabs Pro, rund 400 $) stammt aus der früheren Schätzung mit 5.000 Zeilen zu je 60 Zeichen und ist damit eher zu niedrig. Neu gerechnet wird, wenn der echte Faktor mit den 450 Zeilen des Vertical Slice gemessen ist.

**Drei Möglichkeiten:**

| Variante | Vorteil | Nachteil |
| --- | --- | --- |
| Vollvertonung | Wirkt wie ein großes Adventure, wichtig für Humor und Timing | Teuer bei Änderungen, viel Arbeit beim Anhören |
| Nur Zwischenszenen und Hauptfiguren | Ein Viertel der Kosten, Kommentare bleiben Text | Bruch zwischen vertonten und stummen Zeilen |
| Keine Stimmen, nur „Brabbel“-Laute pro Figur | Billig, charmant, keine KI-Offenlegung für Stimmen. Technik: je Silbe der Zeile ein kurzer Blip, zur Laufzeit aus dem angezeigten Text der gewählten Sprache erzeugt (keine fertigen Audiodateien, daher passt die Länge auch in der englischen Fassung), Grundtonhöhe und Tempo je Figur aus der Stimmen-Tabelle (Max tief und langsam, Toadi hoch und schnell); das Grundgerüst sieht den Haken dafür von Anfang an vor | Weniger Witz bei Pointen |

Empfehlung: erst ohne Stimmen entwickeln. Entschieden wird spätestens zu Beginn von Stufe 5 (Produktion, Meilensteine): ab etwa 10.000 Wunschlisten Vollvertonung, darunter Variante 2 mit Brabbel-Lauten für den Rest. Popochiu kann zu jeder Zeile eine Audiodatei abspielen; die Zeilen-IDs plane ich beim Skript von Anfang an mit ein.

**Stimmen (Voice Design, Sprache Deutsch):** Die Spalte „Figur“ nennt den Namen aus der Welt-Tabelle (in Klammern nur eine Erläuterung), „Kürzel“ das Sprecherkürzel der Zeilen-IDs. Dasselbe Kürzel kann in verschiedenen Abschnitten verschiedene Figuren meinen (MUT, SCH, GRI, MUS); dann entscheidet der Name. `NAR` steht für Regie- und Animationszeilen ohne Sprecher und wird nicht vertont.

| Figur | Kürzel | Prompt |
| --- | --- | --- |
| Max | MAX | A 16-year-old German boy, slightly hoarse voice, slow and lazy delivery, dry sarcastic humor, mumbles a little, sounds like he just woke up |
| Pixel | PIX | A middle-aged man with a deep smooth voice, very arrogant and theatrical, slightly nasal, speaks slowly as if bored by everyone, with a rarely shown, dry warmth underneath |
| Opa (Konrad) | OPA | An old German man around 75, warm raspy voice, cheerful and a bit absent-minded, speaks with pauses |
| Ramses | RAM | A man in his 30s with a high, hesitant voice, constantly unsure, voice cracks when he has to decide |
| Archimedes | ARC | An excited old man, fast and breathless speech, high-pitched when enthusiastic |
| Cicero | CIC | A pompous middle-aged man with a booming orator's voice, very long sentences, loves the sound of his own voice |
| Leonidas | LEO | A young man shouting everything, loud and rough, very short sentences |
| M.U.T.T.I. | MUT | A calm synthetic female voice, caring like a strict mother, slightly metallic, passive-aggressive sweetness |
| Schmidt (Agent) | SCH | A flat monotone male voice, precise and emotionless, slightly echoing |
| Orakel-Oma | ORA | A cheerful old woman with a soft crackling voice, knowing and amused |
| Gerd Glück | GER | A game show host with an overexcited radio voice, big smile in every word |
| Erzähler (Tiertort Savanne) | ERZ | An elderly man with a calm soft whispering nature documentary voice, very gentle and slow |
| Zappmann | ZAP | A smooth showman with a velvety voice, charming but cold, later small and lonely |
| Zeldina | ZEL | A young woman around 20, bright confident voice, fast and practical, a little bossy, laughs easily |
| Toadi | TOA | A small nervous man with a squeaky high voice, out of breath, always slightly panicked |
| Alwin (Grauwald) | ALW | A very old wizard with a warm wobbly voice, slow and distracted, mixes up words, kindly |
| Gollo | GOL | A thin raspy whispering voice, switches between sly and whiny, hisses on s sounds |
| Moderwort (Lord) | MOD | A middle-aged man trying to sound menacing, nasal stuffed-up voice from hay fever, cracks into whining when embarrassed |
| Smaugi | SMA | A huge dragon with a deep soft voice, gentle and sentimental, sniffles, speaks slowly |
| Humbert (Wirt) | HUM | A jolly heavyset innkeeper, loud warm voice, talks lovingly about his swords |
| Waldemar (Troll) | WAL | A huge troll with a deep rumbling bass voice, pedantic and formal, secretly theatrical |
| Nachrichtensprecher (im Rauschen) | NSP | A calm formal news anchor voice, very neutral, slightly distorted as if from far away (Funk-Filter in Audacity) |
| Oma | OMA | An old German woman around 75, firm clear voice, warm but strict, short sentences, never needs to raise her voice |
| Mutter | MUT | A tired woman in her 40s after a late shift, soft warm voice, speaks quickly, affectionate sigh at the end of sentences |
| Modell 08/15 (Roboter-Hausmeister) | HAU | A tinny robotic male voice, exaggeratedly polite, flat and even, no regional accent (the Austrian flavour comes only from the written words), metallic echo added in Audacity |
| Kalle | KAL | A nervous young man from the resistance, quick and cheeky, whispers as if constantly hiding, laughs at his own jokes |
| Herr Vier | VIE | A precise friendly man with a counting rhythm in his speech, sing-song, pauses before every number, delighted by order |
| Morphäus | MOR | A calm deep male voice speaking in riddles with long pauses, slightly amused, with the softness of a man in a cardigan |
| Deckert | DEC | A gravelly tired detective voice, slow, narrates his own life, sounds like rain on a window |
| Kommissar (Tiertort) | KOM | A gruff middle-aged German police inspector, dry and nasal, sighs between sentences, chews on every word |
| Dr. Werbepause | WER | A hyperactive TV salesman, fast and loud, every sentence an exclamation, slightly hoarse from shouting prices |
| Hyäne | HYA | A female voice held unnaturally flat and serious, lips pressed, tiny suppressed squeaks between words; bursts into wild cackling only in the marked lines |
| Hermes | HER | A smooth fast-talking young messenger, breathless from running, salesman charm, always in a hurry |
| Sphinx | SPH | A deep ancient female voice with a slow echo, bored and mysterious, sighs audibly at wrong answers |
| Flimmer | FLI | A small cheerful voice made of TV static, crackly and bright, speaks in short bursts, pitch jumps like a bad signal, glitchy stutter added in Audacity |
| Nebet (Köchin) | NEB | A busy middle-aged cook, warm husky voice, talks fast while chopping, proud of every dish, tastes words like food |
| Sobek (Fährkrokodil) | SOB | No words, only sounds: low contented crocodile rumbles, a happy snort and a slow yawn, like a big friendly dog; generated as sound effects, not speech |
| Tiro | TIR | A quiet overworked scribe, thin precise voice, mumbles abbreviations, speeds up when nervous, clears his throat before lying |
| Brian | BRI | An exhausted ordinary young man, flat tired voice, relieved sighs, every sentence sounds like the end of a very long day |

**Nebenstimmen:** Alle übrigen Figuren mit Sprecherkürzel bekommen keinen eigenen Voice-Design-Prompt, sondern eine Variante einer Stimme oben (Tonhöhe und Tempo verändert, Filter in Audacity), Laute als Geräusch oder Brabbel-Laute. Abschnitt wie in den Welt-Tabellen.

| Kürzel | Figur | Abschnitt | Lösung |
| --- | --- | --- | --- |
| SCH | Schmied | welt-1 | Variante von Humbert (HUM), tiefer und langsamer |
| STA | Stabmacher | welt-1 | Variante von Alwin (ALW), schneller und weniger zittrig |
| ROT | Rotkäppchen | welt-1 | Variante von Zeldina (ZEL), höher und schneller |
| MAK | Maklerin | welt-1 | Variante von Zeldina (ZEL), tiefer, im Verkaufston |
| GRI | Grimmzahn | welt-1 | Variante von Gollo (GOL), tiefer und grimmiger, ohne Zischen |
| GO1 | Goblin 1 | welt-1 | Variante von Gollo (GOL), tiefer |
| GO2 | Goblin 2 | welt-1 | Variante von Gollo (GOL), tiefer und langsamer |
| MIN | Minka | welt-1 | Laute als Geräusch (Katzenfauchen und Schnurren wie bei Pixel), keine Worte |
| HUH | Huhn | welt-1 | Laute als Geräusch (Gackern, siehe Geräusche Welt 1) |
| ZIE | Schmiede-Ziege | welt-1 | Laute als Geräusch (Meckern, siehe Geräusche Welt 1) |
| XXL | XXL-Ziege | welt-1 | Laute als Geräusch (tieferes, langes Meckern) |
| SWA | Schwan | welt-1 | Laute als Geräusch (Fauchen) |
| BRU | Brunnen | welt-1 | Variante von Smaugi (SMA), mit Hall wie aus einem Schacht |
| GRA | Grammophon | welt-1 | Variante von Humbert (HUM), mit Trichter-Filter in Audacity |
| SPI | Spiegel | welt-1 | Variante von Moderwort (MOD), ohne Schnupfen, mit Glas-Hall |
| TUE | Geheimtür | welt-1 | Brabbel-Laute mit Kichern |
| FAE | Fährmann | welt-2 | Variante von Tiro (TIR), tiefer und langsamer |
| STM | Steinmetz | welt-2 | Variante von Leonidas (LEO), ruhiger |
| HOF | Hofkater | welt-2 | Laute als Geräusch (Fauchen, siehe Geräusche Max und Pixel), keine Worte |
| SCH | Schreiber | welt-2 | Variante von Tiro (TIR), höher |
| FAW | Fächerwedler | welt-2 | Variante von Ramses (RAM), tiefer |
| HIE | Hieron | welt-2 | Variante von Cicero (CIC), langsamer und königlich |
| GRI | Grieche | welt-2 | Variante von Leonidas (LEO), leiser |
| TOU | Tourist | welt-2 | Variante von Cicero (CIC), höher und schneller |
| TOI | Römische Touristin | welt-2 | stumm (spricht nicht), keine Stimme |
| PHI | Philosoph | welt-2 | Variante von Archimedes (ARC), langsamer |
| MUS | Straßenmusiker | welt-2 | stumm (spricht nicht), keine Stimme |
| BE1 | Beamter 1 | welt-2 | Variante von Tiro (TIR), monoton |
| BE2 | Beamter 2 | welt-2 | Variante von Tiro (TIR), tiefer und monoton |
| SKR | Schildkröte | welt-2 | stumm (spricht nicht), keine Stimme |
| ZER | Zeremonienmeister | welt-2 | Variante von Cicero (CIC), feierlich |
| VOL | Ägypter | welt-2 | Brabbel-Laute (Menge) |
| WEI | Weinender Mann | welt-3 | Variante von Deckert (DEC), schluchzend |
| FRA | Frau mit Regenschirm | welt-3 | Variante von Orakel-Oma (ORA), jünger und schneller |
| MUS | Straßenmusiker | welt-3 | Variante von Morphäus (MOR), heller |
| AUT | Pastillenautomat | welt-3 | Variante von M.U.T.T.I. (MUT), blechern und kühler |
| REB | Rebellin | welt-3 | Variante von Kalle (KAL), weiblich und tiefer |
| REL | Rebell | welt-3 | Variante von Kalle (KAL), tiefer |
| PIE | Piepsi | welt-3 | keine Stimme, nur Pieptöne (siehe Geräusche Welt 3) |
| RAD | Radio | welt-3 | Variante von Nachrichtensprecher (NSP), mit Radio-Filter |
| KLO | Klon | welt-3 | Variante von Schmidt (SCH), etwas höher |
| TUR | Die Tür | welt-3 | Variante von Herr Vier (VIE), aufgeregt |
| BER | Bernd | welt-3 | stumm (seine Zeilen sind „…“), keine Stimme |
| POR | Portalgerät | welt-3 | Variante von M.U.T.T.I. (MUT), Ansagestimme mit Elektronik-Filter |
| EXP | Trödel-Experte | welt-4 | Variante von Deckert (DEC), freundlicher |
| VAT | Sitcom-Vater | welt-4 | Variante von Humbert (HUM), mit Lachkonserve |
| SMU | Sitcom-Mutter | welt-4 | Variante von Mutter (MUT im Finale), lauter und fröhlicher |
| SOH | Sitcom-Sohn | welt-4 | Variante von Max (MAX), höher und frecher |
| LOE | Löwe | welt-4 | Laute als Geräusch (Brüllen), keine Worte |
| GEP | Gepard | welt-4 | Variante von Hermes (HER), noch schneller |
| GEI | Geier | welt-4 | Variante von Hyäne (HYA), eitel und langsamer |
| NAS | Nashorn | welt-4 | Variante von Waldemar (WAL), schläfrig |
| FLA | Flamingos | welt-4 | Variante von Hyäne (HYA), höher, als Tratsch |
| ZOM | Zombie | welt-4 | Laute als Geräusch (Stöhnen, siehe Geräusche Welt 4) |
| GST | Geist | welt-4 | Brabbel-Laute („Buuh“), hoch und ängstlich |
| AGE | FBI-Agent | welt-4 | Variante von Kalle (KAL), paranoid und flüsternd |
| SIE | Super-Siegfried | welt-4 | Variante von Leonidas (LEO), schläfrig |
| FLE | Fledermann | welt-4 | Variante von Alwin (ALW), vornehm |
| WIL | Wonder-Wilma | welt-4 | Variante von Oma (OMA), energischer |
| EMP | Empfangsdame | welt-4 | Variante von M.U.T.T.I. (MUT), gelangweilt |
| SIC | Sicherheitsmann | welt-4 | Variante von Waldemar (WAL), knapp |
| WET | Wettkandidat | welt-4 | Variante von Toadi (TOA), etwas tiefer |

Opas Hologramm in Welt 3 ist Opas Stimme mit Funk-Filter und leichtem Rauschen in Audacity; Piepsi bekommt keine Stimme, nur Pieptöne. Pixels Kaskaden (zwei kurze Sprechblasen hintereinander, `05-spielsysteme.md`) werden als zwei Dateien erzeugt, damit die Pause dazwischen sitzt. Die Hyäne lacht nur in `W4_VERH_HYA_0350` und `W4_VERH_HYA_0400` (das sind die „marked lines“ ihres Prompts); alle anderen Zeilen bleiben flach und ernst, sonst verrät die Stimme das Rätsel.
