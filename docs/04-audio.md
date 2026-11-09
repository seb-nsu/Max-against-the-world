# Audio: Musik, Geräusche, Sprachausgabe

Aufgebaut wie die Grafik-Tabs: erst die Werkzeuge, dann Regeln für Prompts, dann pro Welt die Stücke und Geräusche mit fertigen Prompts. Prompts auf Englisch, weil die Modelle damit am verlässlichsten arbeiten.

## Werkzeuge

| Aufgabe | Empfehlung | Kosten | Warum |
| --- | --- | --- | --- |
| Sprachausgabe (Dialoge) | ElevenLabs, Voice Design | Starter 6 $/Monat zum Testen, für die Gesamtproduktion etwa 3 Monate Pro (rund 300 $) | Beste deutsche Betonung, Stimmen per Beschreibung erfinden, kommerzielle Rechte ab Starter |
| Geräusche (SFX) | ElevenLabs Sound Effects | im selben Abo | Geräusch per Satz beschreiben, mehrere Varianten pro Klick |
| Musik, Cloud | ElevenLabs Music | im selben Abo | Mit lizenzierter Musik trainiert, Spiele ausdrücklich erlaubt; verbietet Künstlernamen im Prompt, passt also zur Parodie-Regel |
| Musik, lokal | ACE-Step 1.5 in ComfyUI Desktop | kostenlos | Apache-2.0-Lizenz (beim Download prüfen und so in die Credits eintragen), laut AMD läuft es unter Windows auf Radeon über ComfyUI Desktop (Vorlage „ACE Step 1.5 Turbo AIO“); ideal zum Ausprobieren vieler Varianten |
| Nachbearbeitung | Audacity | kostenlos | Loops schneiden, Lautstärke angleichen, Stille entfernen, Effekte wie Telefon- oder Radio-Klang |
| Ergänzung | CC0-Sammlungen (z. B. Kenney, freesound.org mit CC0-Filter) | kostenlos | Klicks, Schritte und UI-Geräusche gibt es fertig und in guter Qualität |

**Mein Vorschlag:** Ein ElevenLabs-Abo deckt Stimmen, Geräusche und Musik ab. ACE-Step lokal nimmst du für Musik-Experimente, die viele Versuche brauchen. Suno nicht verwenden: Dort laufen noch Klagen der Plattenfirmen, und Udio erlaubt keine Downloads mehr.

**Regeln:**

- Nur bezahlte Tarife verwenden; die kostenlosen Stufen erlauben keine kommerzielle Nutzung. Rechnungen aus der Zeit der Erzeugung aufheben.
- Keine echten Stimmen klonen, auch nicht „klingt wie“ ein bekannter Sprecher. Alle Stimmen per Voice Design neu erfinden.
- Steam verlangt die Offenlegung von KI-Stimmen und KI-Musik im selben Formular wie bei der Grafik.
- Sprachausgabe erst erzeugen, wenn das Skript fertig ist. Jede Änderung danach kostet erneut.

## Prompt-Regeln

| Art | Aufbau | Länge |
| --- | --- | --- |
| Musik | Genre, Instrumente, Tempo in BPM, Stimmung, Einsatz im Spiel, „instrumental, seamless loop“, Dauer | 25–45 Wörter |
| Geräusch | Was, woraus, wie nah, wie lang, Nachhall | 8–20 Wörter |
| Stimme (Voice Design) | Alter, Geschlecht, Stimmfarbe, Tempo, Haltung, Akzent | 20–40 Wörter |

**Musik-Baustein (immer anhängen):** `instrumental, no vocals, seamless loop, retro game soundtrack, warm and clean mix, 90 seconds`

**Leitmotiv:** Das Titelthema ist eine kurze, pfeifbare Melodie. Jede Welt spielt sie in ihrem Stil an, damit alles zusammengehört. Bei ACE-Step lässt sich die Melodie als Referenz-Audio mitgeben. ElevenLabs Music kennt keine Melodie-Referenz; deshalb bekommt jedes Welt-Stück hinter dem Prompt den Zusatz „quotes the short cheerful five-note whistled motif of the main theme once“. Der Zusatz steht vor dem Musik-Baustein.

## Musik

| Stück | Einsatz | Prompt |
| --- | --- | --- |
| Titelthema | Hauptmenü, Abspann-Variante | Playful adventure main theme, whistled melody over plucked guitar, upright bass and light brushed drums, 110 BPM, curious and mischievous, a short cheerful five-note motif repeated |
| Opas Wohnzimmer | Prolog, Rückkehr in die Gegenwart | Cozy lo-fi living room music, warm electric piano, soft vinyl crackle, slow bass, 80 BPM, lazy Sunday afternoon, slightly sleepy |
| Zapp-O-Mat | Übergang in jede Welt | Short sci-fi transition sting, rising analog synth sweep, TV static and a bright chime at the end, 4 seconds, not a loop |
| Schwurbelstein Dorf | Welt 1 | Medieval village tune, lute, recorder and tambourine, 100 BPM, cheerful and slightly silly, like a bard who knows only one song |
| Zauberschule | Welt 1 | Whimsical magical school music, celesta, pizzicato strings and bassoon, 95 BPM, mysterious but funny, sparkling |
| Taverne | Welt 1 | Rowdy tavern jig, fiddle, accordion and stomping feet, 125 BPM, crowded and drunk |
| Turm und Prinzessin | Welt 1 | Heroic but clumsy fantasy theme, brass, timpani and harp, 90 BPM, epic that keeps tripping over itself |
| Zauberwald | Welt 1 | Enchanted forest music, soft harp, wooden flute and bird calls, 85 BPM, dreamy with a mischievous undertone, something is watching from the bushes |
| Luftschloss | Welt 1 | Airy cloud castle music, glass harmonica, soft choir pads and gentle wind chimes, 75 BPM, weightless and slightly absurd, like an estate agent humming |
| Goblin-Bergwerk | Welt 1 (Instrumentalfassung des Goblin-Arbeitslieds) | Instrumental version of the goblin work song, deep tuba, anvil hits on every beat, bass drum and a grumpy bassoon, 96 BPM, same melody, no vocals |
| Ägypten | Welt 2 | Ancient Egyptian court music, oud, ney flute, frame drum and sistrum, 95 BPM, sunny and pompous with a comic undertone |
| Olympia | Welt 2 | Ancient Greek sports festival music, lyre, aulos double flute and marching drums, 115 BPM, proud and energetic |
| Syrakus | Welt 2 | Calm Mediterranean harbor music, lyre, soft hand drums and seagull ambience, 85 BPM, thoughtful, an inventor at work |
| Fünfkampf | Welt 2, Minispiele | Fast comic sports music, brass stabs, galloping drums and aulos, 140 BPM, tense and funny |
| Unterstadt | Welt 3, Realität | Melancholic synthwave in the rain, warm analog pads, slow arpeggio, deep bass, 80 BPM, lonely neon night |
| Widerstandsbasis | Welt 3, Realität (Variante von Unterstadt) | Tense but hopeful underground hideout music, muted synth bass, dripping water, soft radio static and a hesitant piano, 90 BPM, same key as the rain theme |
| Simulation | Welt 3 | Cheerful too-perfect elevator muzak, bright electric piano and soft bossa nova drums, 105 BPM, slightly unsettling in its perfection |
| Labor | Welt 3 | Sterile minimal electronic music, soft bleeps, glassy pads and a ticking pulse, 90 BPM, polite and passive-aggressive |
| M.U.T.T.I. Kern | Welt 3 | Ominous lullaby, music box melody over deep synth drones, 70 BPM, caring and threatening at the same time |
| Testbild und Rauschen | Welt 4 | Ambient TV static drone with a faint sine test tone and distant fragments of melodies, eerie and empty |
| Glücksrad-Shopping | Welt 4 | Flashy 1980s game show music, brass fanfares, funky bass and synth stabs, 120 BPM, over the top |
| Küchen-Sitcom | Welt 4 | 1990s sitcom theme, slap bass, saxophone and bright drums, 110 BPM, upbeat and cheesy |
| Tiertort Savanne | Welt 4 | Nature documentary meets crime drama, warm strings, marimba and a suspicious bass clarinet, 85 BPM |
| Mitternachts-TV | Welt 4, Rhythmus-Minispiel | Spooky 1980s disco funk, synth bass, gated snare, creepy organ and wolf howls, 118 BPM, steady beat for a rhythm game |
| Comic-Kanal | Welt 4 | Retro superhero cartoon theme, big brass, snare rolls and choir „aah“ pads, 130 BPM, heroic and silly |
| Spukhaus | Welt 4, Halle und Keller (Rätsel 5 bis 7); das Rhythmus-Minispiel behält Mitternachts-TV | Creaky haunted house music, detuned harpsichord, theremin, slow heartbeat drum and a distant music box, 72 BPM, spooky but cozy, a ghost who enjoys company |
| Senderzentrale, Empfang | Welt 4, Kanal 999 vom Empfang bis zum Aufzug und Kellerarchiv (Rätsel 12); die Zappmann-Show beginnt erst im Studio | Smooth corporate lobby jazz, muted trumpet, vibraphone and brushed drums, 92 BPM, polished and slightly sinister, elevator music that watches you |
| Zappmann-Show | Welt 4, Finale | Glitzy late-night talk show band, big band brass, piano and drums, 120 BPM, smug and shiny |
| Werbeblock-Spot | Zwischenspiele (Rückkehr auf den Dachboden), 5 Sekunden, kein Loop | Overly cheerful 1990s milk commercial sting, bright synth brass, cowbell and a sparkle, 5 seconds, not a loop, cut off by TV static at the end |
| Abspann | Ende | Warm variation of the main theme, acoustic guitar, piano and strings, 95 BPM, heartfelt with a wink, ends on a cheerful cadence |

**Jingles (je 2–5 Sekunden, kein Loop):** Gegenstand aufgehoben, Rätsel gelöst, Welt geschafft, falscher Versuch (komische Posaune), Lachkonserve, Glücksrad-Gewinn. Prompt-Schema: `short [Stimmung] sting, [Instrument], [Dauer] seconds, not a loop`.

**Gesungene Stücke mit Rätselfunktion:** Diese drei brauchen Gesang und weichen deshalb vom Musik-Baustein ab. Am besten mit ElevenLabs Music oder ACE-Step (beide können Gesang), Text von mir, auf Deutsch. Jedes Lied im Spiel bekommt Untertitel, nicht nur diese drei: Liedzeilen erscheinen kursiv mit einem Notenzeichen davor und laufen synchron zum Gesang. Sie haben eigene Zeilen-IDs wie Dialog (Schema LIED\_Welt\_Stück\_Nummer) und werden mit übersetzt. Bei den drei Stücken mit Rätselfunktion sind die Untertitel immer an, auch wenn der Spieler Untertitel ausgeschaltet hat, damit kein Rätsel daran hängt, ob die KI-Stimme eine Silbe verschluckt.

| Stück | Rätsel | Muss hörbar sein | Prompt |
| --- | --- | --- | --- |
| Goblin-Arbeitslied | Welt 1, Rätsel 10 und 11 | Der Passwort-Teil, klar artikuliert und als Untertitel eingeblendet; die Reihenfolge der vier Teile zeigen die Goblins mit Schildern, der Rhythmus trägt sie nur zusätzlich. Gesang früh testen, bevor das Rätsel darauf gebaut wird | Grumpy work song of a choir of goblin miners, deep gruff male voices, pickaxe hits on every beat, 4/4 at 96 BPM, call and response, 30 seconds, loopable, German lyrics |
| Waldemars Musical-Nummer | Welt 1, Rätsel 7; Abspann | Großer Schlusston, bei dem die Niesrosen aufgehen | Big Broadway-style show tune sung by a deep bass troll voice, piano, strings and brass, dramatic key change before the final long note, 60 seconds, German lyrics |
| Dr. Werbepauses Jingle | Welt 4, Rätsel 11 | Eingängige Hook, die beim Stummschalten abrupt abbricht | Catchy hypnotic 1980s TV commercial jingle, bright synths and cheerful choir, 120 BPM, 12 seconds, repeating hook, German lyrics |

## Geräusche

Alle mit ElevenLabs Sound Effects oder aus CC0-Sammlungen. Immer mehrere Varianten erzeugen und die beste behalten.

| Bereich | Geräusche (Prompt) |
| --- | --- |
| Bedienung | soft wooden UI click; inventory bag rustle; paper page turn; item combine pop with a sparkle; error buzz, soft and funny |
| Spielsysteme | character switch: short whoosh with a tiny cat bell; hint ready: soft paw tap and a light bulb ping; save game: quick pencil scribble and a page flip; close-up open: paper unfolding close to the ear; notebook entry: pencil scratching two words; time ferry departure: hourglass flip and a deep wooden bell; code view toggle: digital shimmer rising then falling; remote channel change: heavy plastic click and a short static burst; portal device battery: three rising electronic beeps; commercial break start: cheerful TV sting cut off by static |
| Max und Pixel | sneakers walking on carpet; sneakers on stone floor; cat paws on wood; cat meow annoyed; cat purr close; cat hiss short; manual can opener cranking around a tin lid, then a soft hiss |
| Prolog | old CRT television turning on with a high whine; TV channel switching static burst; clock ticking in a quiet living room; old man snoring softly on a sofa |
| Zapp-O-Mat | rising electric hum and a whoosh as someone is sucked into a TV screen, 3 seconds |
| Welt 1 | magic wand sparkle; potion bottle uncorked; goat bleat comical; chicken cluck; anvil hammer strike; tavern crowd murmur loop; frog croak |
| Welt 2 | sand footsteps; crocodile splash; hourglass sand trickling; stone grinding; bronze discus whoosh; crowd cheering in a stadium; bathtub splash |
| Welt 3 | heavy rain on neon street loop; phone booth ringing old-fashioned; hydraulic blast door opening; computer terminal beeps; laser barrier hum; rubber chicken squeak; digital glitch; small robot beeping and whistling in fast rude tones (Piepsi, 6–8 Varianten); hologram flicker hum with crackle |
| Welt 4 | TV static loop; tape rewind squeal; pause click with a tape stop; game show wheel ticking slowing down; studio audience laughter; zombie groan; comic punch impact; fluorescent tube buzzing and swooshing when swung; rusty trash compactor walls grinding with crunching video tapes |

## Sprachausgabe

**Umfang (grob geschätzt):** Ein Adventure dieser Größe hat etwa 3.500 Zeilen, weil Max und Pixel fast jeden Gegenstand kommentieren; mit Pixel-auf-Mensch-Zeilen und Zwischenspielen eher 4.000. Bei rund 60 Zeichen pro Zeile und drei bis fünf Versuchen pro Pointe sind das 800.000 bis 1.000.000 Zeichen, Voice-Design-Vorschauen eingerechnet. Das sind etwa drei Monate ElevenLabs Pro (rund 300 $). Der echte Faktor wird mit den 450 Zeilen des Vertical Slice gemessen.

**Drei Möglichkeiten:**

| Variante | Vorteil | Nachteil |
| --- | --- | --- |
| Vollvertonung | Wirkt wie ein großes Adventure, wichtig für Humor und Timing | Teuer bei Änderungen, viel Arbeit beim Anhören |
| Nur Zwischenszenen und Hauptfiguren | Ein Viertel der Kosten, Kommentare bleiben Text | Bruch zwischen vertonten und stummen Zeilen |
| Keine Stimmen, nur „Brabbel“-Laute pro Figur | Billig, charmant, keine KI-Offenlegung für Stimmen. Technik: je Silbe der Zeile ein kurzer Blip, Grundtonhöhe und Tempo je Figur aus der Stimmen-Tabelle (Max tief und langsam, Toadi hoch und schnell); das Grundgerüst sieht den Haken dafür von Anfang an vor | Weniger Witz bei Pointen |

Empfehlung: erst ohne Stimmen entwickeln, am Ende Variante 1 oder 2 entscheiden. Popochiu kann zu jeder Zeile eine Audiodatei abspielen; die Zeilen-IDs plane ich beim Skript von Anfang an mit ein.

**Stimmen (Voice Design, Sprache Deutsch):**

| Figur | Prompt |
| --- | --- |
| Max | A 16-year-old German boy, slightly hoarse voice, slow and lazy delivery, dry sarcastic humor, mumbles a little, sounds like he just woke up |
| Pixel | A middle-aged man with a deep smooth voice, very arrogant and theatrical, slightly nasal, speaks slowly as if bored by everyone |
| Opa Konrad | An old German man around 75, warm raspy voice, cheerful and a bit absent-minded, speaks with pauses |
| Ramses | A man in his 30s with a high, hesitant voice, constantly unsure, voice cracks when he has to decide |
| Archimedes | An excited old man, fast and breathless speech, high-pitched when enthusiastic |
| Cicero | A pompous middle-aged man with a booming orator's voice, very long sentences, loves the sound of his own voice |
| Leonidas | A young man shouting everything, loud and rough, very short sentences |
| M.U.T.T.I. | A calm synthetic female voice, caring like a strict mother, slightly metallic, passive-aggressive sweetness |
| Agent Schmidt | A flat monotone male voice, precise and emotionless, slightly echoing |
| Orakel-Oma | A cheerful old woman with a soft crackling voice, knowing and amused |
| Gerd Glück | A game show host with an overexcited radio voice, big smile in every word |
| Erzähler | An elderly man with a calm soft whispering nature documentary voice, very gentle and slow |
| Zappmann | A smooth showman with a velvety voice, charming but cold, later small and lonely |
| Zeldina | A young woman around 20, bright confident voice, fast and practical, a little bossy, laughs easily |
| Toadi | A small nervous man with a squeaky high voice, out of breath, always slightly panicked |
| Alwin Grauwald | A very old wizard with a warm wobbly voice, slow and distracted, mixes up words, kindly |
| Gollo | A thin raspy whispering voice, switches between sly and whiny, hisses on s sounds |
| Lord Moderwort | A middle-aged man trying to sound menacing, nasal stuffed-up voice from hay fever, cracks into whining when embarrassed |
| Smaugi | A huge dragon with a deep soft voice, gentle and sentimental, sniffles, speaks slowly |
| Wirt Humbert | A jolly heavyset innkeeper, loud warm voice, talks lovingly about his swords |
| Troll Waldemar | A huge troll with a deep rumbling bass voice, pedantic and formal, secretly theatrical |
| Nachrichtensprecher im Rauschen | A calm formal news anchor voice, very neutral, slightly distorted as if from far away (Funk-Filter in Audacity) |
| Oma | An old German woman around 75, firm clear voice, warm but strict, short sentences, never needs to raise her voice |
| Mutter | A tired woman in her 40s after a late shift, soft warm voice, speaks quickly, affectionate sigh at the end of sentences |
| 08/15 (Roboter-Hausmeister) | A tinny robotic male voice, exaggeratedly polite, flat and even, no regional accent (the Austrian flavour comes only from the written words), metallic echo added in Audacity |
| Kalle | A nervous young man from the resistance, quick and cheeky, whispers as if constantly hiding, laughs at his own jokes |
| Herr Vier | A precise friendly man with a counting rhythm in his speech, sing-song, pauses before every number, delighted by order |
| Morphäus | A calm deep male voice speaking in riddles with long pauses, slightly amused, with the softness of a man in a cardigan |
| Deckert | A gravelly tired detective voice, slow, narrates his own life, sounds like rain on a window |
| Kommissar (Tiertort) | A gruff middle-aged German police inspector, dry and nasal, sighs between sentences, chews on every word |
| Dr. Werbepause | A hyperactive TV salesman, fast and loud, every sentence an exclamation, slightly hoarse from shouting prices |
| Hyäne | A sly giggling female voice, breaks into cackles mid-sentence, stretches vowels, pretends to be innocent |
| Hermes | A smooth fast-talking young messenger, breathless from running, salesman charm, always in a hurry |
| Sphinx | A deep ancient female voice with a slow echo, bored and mysterious, sighs audibly at wrong answers |
| Flimmer | A small cheerful voice made of TV static, crackly and bright, speaks in short bursts, pitch jumps like a bad signal, glitchy stutter added in Audacity |
| Köchin Nebet | A busy middle-aged cook, warm husky voice, talks fast while chopping, proud of every dish, tastes words like food |
| Sobek (Fährkrokodil) | No words, only sounds: low contented crocodile rumbles, a happy snort and a slow yawn, like a big friendly dog; generated as sound effects, not speech |
| Tiro | A quiet overworked scribe, thin precise voice, mumbles abbreviations, speeds up when nervous, clears his throat before lying |
| Brian | An exhausted ordinary young man, flat tired voice, relieved sighs, every sentence sounds like the end of a very long day |

Nebenfiguren bekommen Varianten dieser Stimmen (Tonhöhe und Tempo verändert) oder Brabbel-Laute. Opas Hologramm in Welt 3 ist Opas Stimme mit Funk-Filter und leichtem Rauschen in Audacity; Piepsi bekommt keine Stimme, nur Pieptöne. Pixels Kaskaden (zwei kurze Sprechblasen hintereinander, Tab Spielsysteme) werden als zwei Dateien erzeugt, damit die Pause dazwischen sitzt.
