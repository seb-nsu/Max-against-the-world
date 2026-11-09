# Rätsel-Abhängigkeiten

Automatisch erzeugt aus den Welt-Tabellen (`docs/welten/*.yaml`) mit `python3 tools/diagramme.py`; nicht von Hand bearbeiten. Pfeil A → B: B braucht A oder einen Gegenstand, den A ergibt (beschriftet). Gestrichelter Pfeil: einer von mehreren Wegen. Gestrichelter Kasten: freiwilliges Rätsel. Doppelpfeil zu einem runden Kasten: das Rätsel öffnet diesen Raum. Gegenstände, die frei in Räumen liegen, sind nicht eingezeichnet; sie stehen in der Welt-Tabelle.

## Opas Dachboden (prolog)

```mermaid
flowchart TD
  P1["P1 Der schlafende Kater"]
  P2["P2 Nur Rauschen"]
  P3["P3 Der richtige Kanal"]
  P1 --> P2
  P2 --> P3
  classDef frei stroke-dasharray: 5 5
```

## Schwurbelstein (welt-1)

```mermaid
flowchart TD
  R1["R1 Der Taverne-Coup"]
  R1a["R1a Minka"]
  R1b["R1b Jahrgang Schicksalsberg"]
  R1c["R1c Das Rätselspiel"]
  R2["R2 Der Zauberstab wählt den Zauberer"]
  R3["R3 Drei Ziegenböcke"]
  R4["R4 Das Märchen an der Troll-Brücke"]
  R4a["R4a Die Reihenfolge"]
  R4b["R4b Ziegisch"]
  R4c["R4c Ins Wasser"]
  R5["R5 Der Brunnen der Wünsche"]
  R6["R6 Die sechs Flaschen"]
  R6a["R6a Die Zutaten"]
  R6b["R6b Die Flaschenwahl"]
  R7["R7 Die Niesrosen"]
  R8["R8 Die Bohnenranke"]
  R9["R9 Prinzessin Zeldina"]
  R10["R10 Die Goblin-Frage"]
  R10a["R10a Weg A, Tarifvertrag<br/>(freiwillig)"]:::frei
  R10b["R10b Weg B, Karriere<br/>(freiwillig)"]:::frei
  R11["R11 Der Dunkle Turm"]
  R11a["R11a Das Passwort"]
  R11b["R11b Die Besen"]
  R12["R12 Smaugi räumt auf"]
  R13["R13 Lord Moderwort"]
  R1a --> R1
  R1b --> R1
  R1c --> R1
  R1a --> R1c
  R1b --> R1c
  R1c -->|"Käsefondue"| R2
  R4a --> R4
  R4b --> R4
  R4c --> R4
  R3 --> R4a
  R3 --> R4b
  R4a --> R4c
  R4b --> R4c
  R1c -->|"Goldmünze"| R5
  R6a --> R6
  R6b --> R6
  R2 --> R6a
  R4 --> R6a
  R6a --> R6b
  R4 --> R7
  R2 -->|"Sortierende Socke"| R7
  R5 -->|"Zauberbohne"| R8
  R8 --> R9
  R10a -.-> R10
  R10b -.-> R10
  R6b -->|"Leuchttrank"| R10a
  R9 --> R10b
  R11a --> R11
  R11b --> R11
  R11b --> R11a
  R6b -->|"Moderworts Zeugnis"| R11a
  R8 --> R11a
  R9 --> R11a
  R10 --> R11a
  R10 --> R11b
  R11b --> R12
  R9 --> R12
  R10 --> R12
  R11a --> R13
  R12 --> R13
  R7 --> R13
  R9 --> R13
  R2 -->|"Sortierende Socke"| R13
  raum_wasserschloss(["Wasserschloss"])
  R4 ==> raum_wasserschloss
  raum_zauberwald(["Zauberwald"])
  R4 ==> raum_zauberwald
  raum_luftschloss(["Luftschloss"])
  R8 ==> raum_luftschloss
  raum_bergwerk(["Goblin-Bergwerk"])
  R4 ==> raum_bergwerk
  raum_turmkeller(["Dunkler Turm, Keller"])
  R10 ==> raum_turmkeller
  raum_abstellkammer_1(["Abstellkammer 1"])
  R11b ==> raum_abstellkammer_1
  raum_abstellkammern(["Smaugis Abstellkammern"])
  R11b ==> raum_abstellkammern
  raum_thronsaal(["Thronsaal"])
  R12 ==> raum_thronsaal
  classDef frei stroke-dasharray: 5 5
```

## Antikodonien (welt-2)

```mermaid
flowchart TD
  R1["R1 Die Krokodil-Fähre"]
  R2a["R2a Die Hieroglyphen-Botschaft"]
  R2b["R2b Das Götter-Duell"]
  R3a["R3a Das neue Rundschreiben<br/>(freiwillig)"]:::frei
  R3b["R3b Der Passierschein"]
  R4["R4 Das Olivenöl<br/>(freiwillig)"]:::frei
  R5["R5 Archimedes' Krone"]
  R12["R12 Wettkampftag 1"]
  R6a["R6a Das Zeichen der Sandale<br/>(freiwillig)"]:::frei
  R6b["R6b Frische Feigen für die Fächerwedler<br/>(freiwillig)"]:::frei
  R7["R7 Der Diskus-Diebstahl"]
  R8["R8 Die Sphinx mit Schreibblockade"]
  R9["R9 Konter sammeln"]
  R10a["R10a Ein Grab für Archimedes"]
  R10b["R10b Das Alter des Grabsteins"]
  R13["R13 Finaltag"]
  R11a["R11a Die Siegesparade"]
  R11b["R11b Wein für Ramses"]
  R1 --> R2b
  R2a --> R3a
  R2b --> R3a
  R2a --> R3b
  R2b --> R3b
  R3a -.->|"Rundschreiben"| R3b
  R8 -.->|"Empfehlungsschreiben"| R3b
  R1 --> R5
  R3b --> R12
  R5 --> R12
  R3b -->|"Startpass"| R12
  R3b -->|"Geflügelte Sandalen"| R12
  R12 --> R6a
  R6a --> R6b
  R6a -->|"Feigensetzling"| R6b
  R12 --> R7
  R8 --> R9
  R8 -->|"Schriftrolle"| R9
  R5 --> R10a
  R12 --> R10a
  R10a --> R10b
  R10a -->|"Grabstein"| R10b
  R7 --> R13
  R9 --> R13
  R10b --> R13
  R7 -.->|"Diskus"| R13
  R12 -.->|"Schallplatte"| R13
  R12 -.->|"Wurfscheibe"| R13
  R13 --> R11a
  R13 -->|"Olivenkranz"| R11a
  R11a --> R11b
  raum_faehrsteg_olympia(["Fährsteg Olympia"])
  R1 ==> raum_faehrsteg_olympia
  raum_agora(["Agora"])
  R1 ==> raum_agora
  raum_startbuero(["Startbüro"])
  R1 ==> raum_startbuero
  raum_stadion(["Stadion"])
  R1 ==> raum_stadion
  raum_hafen_syrakus(["Hafen Syrakus"])
  R1 ==> raum_hafen_syrakus
  raum_werkstatt(["Archimedes' Werkstatt"])
  R1 ==> raum_werkstatt
  raum_grabhuegel(["Grabhügel Syrakus"])
  R1 ==> raum_grabhuegel
  classDef frei stroke-dasharray: 5 5
```

## Neo-Neustadt 2099 (welt-3)

```mermaid
flowchart TD
  R1a["R1a Der Mensch-Test, Beobachtungen"]
  R1b["R1b Der Mensch-Test, die drei Fragen"]
  R2["R2 Die Nudelbude „Vier“"]
  R3a["R3a Der Pastillenautomat, Déjà-vu"]
  R3b["R3b Der Pastillenautomat, die Wahl"]
  R4["R4 Die Vase des Orakels"]
  R5["R5 Die gesprächige Tür"]
  R6a["R6a Die Agenten-Klone, Original und Kopie"]
  R6b["R6b Die Agenten-Klone, Mittagspause"]
  R7a["R7a Der Ausgang im 50. Stock, Farbcode"]
  R7b["R7b Der Ausgang im 50. Stock, Kabel"]
  R8["R8 Der Hausmeister Modell 08/15"]
  R9a["R9a Die Testkammern, die Leitung"]
  R9b["R9b Die Testkammern, Kammer 1"]
  R9c["R9c Die Testkammern, Kammer 2"]
  R9d["R9d Die Testkammern, Kammer 3"]
  R10["R10 Das M.U.T.T.I.-Paradoxon"]
  R11["R11 Der glühende Kern"]
  R12["R12 Die vierte Zutat"]
  R13["R13 Kalles Morse-Tabelle"]
  R1a --> R1b
  R1b --> R3a
  R2 --> R3a
  R3a --> R3b
  R3a -->|"Rote Pastille"| R3b
  R3b --> R4
  R3b --> R5
  R5 --> R6a
  R6a --> R6b
  R6b --> R7a
  R13 -->|"Morse-Tabelle"| R7a
  R7a --> R7b
  R8 --> R9a
  R12 -->|"Zugangskarte"| R9a
  R9a --> R9b
  R9b --> R9c
  R9c --> R9d
  R4 --> R10
  R6b -->|"Schmidts Akte"| R10
  R9c --> R10
  R9d --> R10
  R10 --> R11
  R3b -.->|"Omas Kekse"| R11
  R3b -.-> R11
  R4 -->|"Omas Rezeptkarte"| R12
  R3b --> R13
  raum_apothekengasse(["Apothekengasse mit Pastillenautomat"])
  R1b ==> raum_apothekengasse
  raum_widerstandsbasis(["Widerstandsbasis"])
  R3b ==> raum_widerstandsbasis
  raum_kuehlung(["Kühlung"])
  R3b ==> raum_kuehlung
  raum_stadtstrasse(["Stadtstraße"])
  R3b ==> raum_stadtstrasse
  raum_kueche_orakel(["Küche der Orakel-Oma"])
  R3b ==> raum_kueche_orakel
  raum_buero_50(["Büroturm, 50. Stock"])
  R5 ==> raum_buero_50
  raum_testkammer_1(["Testkammer 1"])
  R9a ==> raum_testkammer_1
  raum_testkammer_2(["Testkammer 2"])
  R9b ==> raum_testkammer_2
  raum_testkammer_3(["Testkammer 3"])
  R9c ==> raum_testkammer_3
  raum_kern(["Kern von M.U.T.T.I."])
  R9d ==> raum_kern
  classDef frei stroke-dasharray: 5 5
```

## Kanal 999 (welt-4)

```mermaid
flowchart TD
  R1["R1 Raus aus dem Testbild"]
  R2["R2 Glücksrad-Shopping"]
  R3["R3 Besuch in der Sitcom"]
  R4a["R4a Das Alibi der Hyäne prüfen"]
  R4b["R4b Das Alibi des Geparden prüfen"]
  R4c["R4c Das Alibi des Nashorns prüfen"]
  R4d["R4d Das Alibi des Geiers prüfen"]
  R4["R4 Tiertort Savanne"]
  R5a["R5a Zur Mitternachtssendung kommen"]
  R5b["R5b An den Zombies vorbei"]
  R5["R5 Das Zombie-Video"]
  R6["R6 Die Genre-Tür"]
  R7["R7 Die Lichterkette"]
  R8["R8 Die Wahrheit ist irgendwo da draußen"]
  R9["R9 Der Hauptgewinn"]
  R10a["R10a Den Käse zum Wunderkäse machen"]
  R10b["R10b Einen Superhelden-Anzug besorgen"]
  R10c["R10c Den Unfall in der Fondue-Fabrik erwischen"]
  R10["R10 Die Entstehung von Käsemann"]
  R11a["R11a Dr. Werbepauses Spot finden"]
  R11b["R11b Den Countdown brechen"]
  R11c["R11c Dr. Werbepause vertreiben"]
  R11d["R11d Die Comic-Panels ordnen"]
  R11["R11 Dr. Werbepause"]
  R12a["R12a Den versteckten Kanal finden"]
  R12b["R12b Mit dem Aufzug nach oben"]
  R12["R12 Die Senderzentrale"]
  R13["R13 Intendant Zappmann"]
  R1 --> R2
  R2 --> R3
  R2 -->|"Billig-Fernbedienung"| R3
  R2 -->|"Taste Umschalten"| R3
  R2 --> R4a
  R2 -->|"Programmzeitschrift"| R4a
  R2 -->|"Taste Umschalten"| R4a
  R2 --> R4b
  R2 --> R4c
  R2 --> R4d
  R2 -->|"Taste Umschalten"| R4d
  R4a --> R4
  R4b --> R4
  R4c --> R4
  R4d --> R4
  R2 -->|"Programmzeitschrift"| R4
  R2 -->|"Programmzeitschrift"| R5a
  R5a --> R5b
  R4 -->|"Taste Rückspulen"| R5b
  R5a --> R5
  R5b --> R5
  R5 --> R6
  R9 -->|"Splitscreen-Adapter"| R6
  R6 --> R7
  R6 --> R8
  R7 -.-> R8
  R3 --> R9
  R4 --> R9
  R11a --> R9
  R2 -->|"Programmzeitschrift"| R9
  R2 -->|"Taste Umschalten"| R9
  R2 -->|"Taste Umschalten"| R10a
  R2 --> R10b
  R10a --> R10c
  R10b --> R10c
  R10b -->|"Bettlaken"| R10c
  R4 -->|"Taste Rückspulen"| R10c
  R10a --> R10
  R10b --> R10
  R10c --> R10
  R2 -->|"Programmzeitschrift"| R11a
  R11a --> R11b
  R6 -->|"Taste Stumm"| R11b
  R11b --> R11c
  R10 --> R11c
  R11c --> R11d
  R11a --> R11
  R11b --> R11
  R11c --> R11
  R11d --> R11
  R11 -->|"Taste Sendersuchlauf"| R12a
  R12a --> R12b
  R7 --> R12b
  R8 -->|"Taste Untertitel"| R12b
  R3 -->|"Taste Pause"| R12b
  R12a --> R12
  R12b --> R12
  R7 --> R13
  R2 -->|"Billig-Fernbedienung"| R13
  R3 -->|"Taste Pause"| R13
  R9 -->|"Splitscreen-Adapter"| R13
  R6 -->|"Taste Stumm"| R13
  R8 -->|"Taste Untertitel"| R13
  R11 -->|"Taste Sendersuchlauf"| R13
  raum_rauschen(["Rauschen zwischen den Sendern"])
  R1 ==> raum_rauschen
  raum_gluecksrad(["Glücksrad-Studio"])
  R1 ==> raum_gluecksrad
  raum_sitcom_kueche(["Sitcom-Küche"])
  R2 ==> raum_sitcom_kueche
  raum_savanne(["Savanne"])
  R2 ==> raum_savanne
  raum_friedhof(["Musikvideo-Friedhof"])
  R2 ==> raum_friedhof
  raum_spukhaus_keller(["Spukhaus, Keller"])
  R5 ==> raum_spukhaus_keller
  raum_spukhaus_halle(["Spukhaus, Halle"])
  R6 ==> raum_spukhaus_halle
  raum_kapitolis(["Kapitolis"])
  R2 ==> raum_kapitolis
  raum_fondue_fabrik(["Fondue-Fabrik"])
  R2 ==> raum_fondue_fabrik
  raum_werbespot_set(["Werbespot-Set"])
  R2 ==> raum_werbespot_set
  raum_empfang(["Empfang"])
  R11 ==> raum_empfang
  raum_kellerarchiv(["Kellerarchiv"])
  R11 ==> raum_kellerarchiv
  raum_zappmanns_studio(["Zappmanns Studio"])
  R12 ==> raum_zappmanns_studio
  classDef frei stroke-dasharray: 5 5
```

## Zwischenspiele und Finale (finale)

```mermaid
flowchart TD
  F1["F1 Verriegelt (Luke erkennen)"]
  F1a["F1a Der Riegel (Zeldina)<br/>(freiwillig)"]:::frei
  F1b["F1b Die Ofentür halten"]
  F1c["F1c Die Zündkapsel"]
  F1d["F1d Die rote Taste"]
  F2["F2 Hundekuchen zum Geburtstag (Bonus-Gag)<br/>(freiwillig)"]:::frei
  F1 --> F1a
  F1 --> F1b
  F1 --> F1c
  F1b --> F1d
  F1c --> F1d
  raum_treppenhaus(["Treppenhaus"])
  F1d ==> raum_treppenhaus
  raum_wohnzimmer(["Wohnzimmer"])
  F1d ==> raum_wohnzimmer
  raum_supermarkt(["Supermarkt-Eingang"])
  F1d ==> raum_supermarkt
  classDef frei stroke-dasharray: 5 5
```
