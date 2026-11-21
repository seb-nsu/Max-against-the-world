# AP-09 Fortschritt (Einbau der neuen Welt-3-Hintergründe, 21.11.)

- Stash „AP-04 Zwischenstand 20.11. abends“ in cq-r4 übernommen (Basis); Prüfungen grün.
- Bilder: `tools/grafik_w3/raeume_pixelieren.py` auf die 24 neuen Originale umgestellt (Median 3×3 gegen JPEG-Ränder, Palette je Raum 32–40 Farben, Ausgabe `_v02`). Nacharbeit im Skript: Einhorn klein, Türrahmen Basis weg, Tasse an der Tischkante, Kaffeespur gemalt, Schnee nur Fenster/Haube/Flocken, drittes Glas Küche (Regal verlängert), Krakel statt Schein-Schrift Kammer 2, Weckeranzeige schwarz, Nachttisch Tag/Nacht als `game/grafik/props/w3_nachttisch[_nacht]_v02.png`.
- Effekte: `tools/grafik_w3/effekte_raum_v02.py` baut die 18 raumabhängigen Streifen neu (`w3_*_v02.png`), Klone tippen jetzt hinter dem Fenster im Büro; Nudeltopf-Dampf, Regen, Autos, Ratte, Passanten, Vögel bleiben (frei gezeichnet), nur neue Bahnen.
- Layout `tools/layout/welt-3.yaml` für alle zwölf Räume neu (Skala 1,0 vorn, Tiefe aus dem Rohbau, Kühlung 0,8), Büro 50 1280 breit (`docs/welten/welt-3.yaml`), Szenen mit `--cq-layout` gebaut.
- Unterstadt: Laufbereich Gehweg+Straße, Gasse und Luke erreichbar, Tresen v02 als Vordergrund; aufgenommen.
- Apothekengasse: ganze Breite, Automat unter den Porträts; aufgenommen.
- Basis: Rebellin vor den Kapseln, Rebell am Tisch, Kalle am Pult, Kaffeepfütze/Tasse mit Bedingung; aufgenommen.
- Kühlung, Laboreingang, Stadtstraße (Zebrastreifen bis zur Glastür, Nachttisch Tag/Nacht), Küche (Tisch/Stuhl ausgespart, Oma links), Büro 50 (Schmidt hinten im Flur, tiefe_oben_y 200), Kammer 1 und 2 aufgenommen; Kammer 2: Laser wieder rot (Palette).
- Kammer 3, Kern aufgenommen; Varianten (R3a, Schnee, R13, Schnee+R13, Eimer, Panzertür, Nacht, Wecker, R4, R9b–R9d, Zelle kalt) aufgenommen, Klickflächen mit Bedingung schalten (Tasse bis R13, Pfütze ab R13). Kern: vereist/leer als ganzes Rechteck (Glühen weg).
- Ohne Testmodus (Effekte) alle Räume mit Max vorn und hinten: `ap09_<raum>_mitmax.png`. Wecker zeigt 5:59 über dem Nachttisch.
- Tests: welt_3_anspiel 129/0, regeln_laden, ansehen_zustand, hinweise_welten, schalter grün; alles_pruefen grün.
- Abdeckung (aus den Aufnahme-JSONs, Figuren und kleinere Flächen davor): Handtuch/Tisch (Rebell) und Klone/Flur korrigiert; bewusst verdeckt bleiben Platz des Hausmeisters (er steht dort), Ausgang Kammer 3 hinter dem Laser, Kabel im Kern hinter Sockel und M.U.T.T.I.
- Lauftest `ap09_lauftest.txt`: alle Wege ohne Abweichung (Kühlung nur Testaufbau). Zeigerraster: mit dem Werkzeug kommt Welt 3 nicht über das Wohnzimmer hinaus (unbegrenzte FPS), ohne diese Einstellung zu langsam; ersetzt durch die Abdeckungsrechnung.
- Sprechanlage-Hotspot (AP-02) im Layout vorbereitet, auskommentiert bis UI_OBJ_SPRECHANLAGE in ui.csv steht.
