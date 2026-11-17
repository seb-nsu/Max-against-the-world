# Arbeitspakete aus dem Review vom 17. November 2026

Grundlage: [`bericht.md`](bericht.md) (90 Spiel-Funde, 17 Workflow-Funde, 27 Lessons-Vorschläge). Jeder Fund ist genau einem Paket zugeordnet; die Liste am Ende prüft das. Die Pakete sind so geschnitten, dass je Paket ein Thread arbeiten kann und zwei Threads möglichst nicht dieselben Dateien ändern. Wo das nicht geht, steht die Reihenfolge dabei.

**Reihenfolge auf einen Blick**

| Welle | Pakete | warum zuerst |
| --- | --- | --- |
| 1 (sofort, klein) | AP-01 | Spiel hängt |
| 2 (parallel möglich) | AP-02, AP-05, AP-12, AP-13 | getrennte Dateien: Zeiger-Logik (`spiel.gd`), Hinweise, Lauftempo, CI |
| 3 | AP-06 (nach Sebastians Entscheidung), danach AP-07 | Rätsel-Umbau ändert Texte; Text-Paket danach, damit `docs/skript/welt-2.md` nicht doppelt angefasst wird |
| 3 parallel | AP-03 → AP-04 (ein Thread, nacheinander) | beide ändern `tools/layout/*.yaml` |
| 4 | AP-08, AP-09 | Szenen-Ablauf und Animationen einbauen; beide in `welt_2.gd`, daher nacheinander oder klar nach Funktionen getrennt |
| 5 (braucht Bilder) | AP-10, AP-11 | Aseprite/Meshy/Gemini, Abnahme durch Sebastian |
| laufend | AP-14, AP-15 | Werkzeuge, Doku |

Kosten: Nur AP-10 und AP-11 können Meshy- oder Gemini-Credits brauchen. Vor jedem Aufruf Stückpreis und Kontostand nennen (Regel aus `CLAUDE.md`); die anderen Pakete sind reine Code-, Daten- und Textarbeit.

---

## AP-01 Hermes-Hänger und Gesprächs-Prüfung (Welle 1)

- **Funde:** W2-29 (kritisch).
- **Tun:** Im Dialog `hermes` (Welt 2) eine Abschiedsoption mit `beendet` ergänzen. In `CQDialog` das Gespräch beenden, wenn nach einer Wahl keine Option mehr sichtbar ist (Sicherheitsnetz für alle Dialoge). In `tools/pruefen.py` jedes Gespräch ohne beendende Option als Fehler melden.
- **Dateien:** `docs/skript/welt-2.md` (Dialog), erzeugte Daten neu, `game/skripte/objekte/cq_dialog.gd`, `tools/pruefen.py`.
- **Fertig, wenn:** Im Spiel (ohne Testmodus) das Hermes-Gespräch beendet werden kann und Max danach läuft; `pruefen.py` meldet einen absichtlich kaputten Testdialog.
- **Aufwand:** klein (unter einer Stunde).

## AP-02 Klick-Auswahl bei Überdeckung (Welle 2)

- **Funde:** X-01, P-02, W1-03, W1-04, W1-07, W1-18, W1-22, W2-17, W2-21, W2-27, W2-42; die Klick-Anteile in W1-08, W2-10, W2-32, W2-39.
- **Tun:** `Spiel.zeiger_betritt()` und `_zeiger_flaeche()` so umbauen, dass bei jeder Mausbewegung unter allen Objekten am Punkt entschieden wird: Figur vor Prop vor Hotspot, bei Gleichstand das kleinere, unabhängig von der Eintrittsreihenfolge. Figuren bekommen ihr Rechteck aus dem Sprite. Sonderfälle: Traubensaft-Hotspot entfernen oder nur zeigen, wenn der Saft genommen ist (W2-17); Sphinx-Klickpolygon über Kopf und Brust, „Nase“ darin (W2-21).
- **Werkzeug:** Das Zeigerraster aus dem Review (`_review_gs_zeiger2.gd`, beide Richtungen) als `tools/`-Prüfung übernehmen: jede Figur muss an mindestens 70 % ihrer Fläche gewinnen.
- **Dateien:** `game/skripte/spiel.gd`, Sphinx-Figur/Layout-Eintrag, `tools/layout/welt-2.yaml` nur für Traubensaft und Sphinx (mit AP-03 absprechen).
- **Fertig, wenn:** Zeigerkarten aller 28 Räume neu erzeugt, keine Figur unter 70 %, Fischsuppe aus beiden Richtungen 100 %, Traubensaft nehmbar.
- **Aufwand:** mittel.

## AP-03 Klickflächen und Laufbereiche im Layout (Welle 3, vor AP-04)

- **Funde:** X-04, X-06, X-07, W1-02, W1-11, W1-12, W1-20, W1-21, W2-26, W2-33, W2-40, W2-44.
- **Tun:**
  - Die 20 × 20-Vergrößerungen (Ei, Zahnstocher, Okarina, Dosenöffner, Schwerterbündel) aus den `.tscn` ins Layout übernehmen, Daten neu erzeugen; Prüfung „Klickpolygon der Szene gleich Rechteck im Bauplan“ in `pruefen.py` (X-04).
  - Alle Ausgänge auf mindestens 50 px, Rechtecke aus dem Bereich unter Porträts, Pfote und Leistenrand (X-06, X-07).
  - Boden-Hotspots ohne Benutzen-Zeile beim Linksklick wie Boden behandeln (Code in `cq_hotspot.gd`); Laufbahn und Startlinie im Stadion verkleinern, Alter Baum nicht klickbar, Besen-Hotspot der Abstellkammer 1 auf die neuen Besen-Sprites (W1-11, W1-12, W1-20, W2-33).
  - Grabhügel: Ausgang auf den Pfad, Brombeeren kleiner (W2-44). Hafen: Laufbereich in die Gasse (W2-40).
  - Sandale-Hotspot nur zwischen R12 und R6a (W2-26, Hintergrundfassung ohne Sandale ab R6a kommt aus AP-11).
  - Eigene Zeilen für Ringladen-Tür und Rundbogen (W1-02, W1-21; Texte über AP-07 oder hier mit Zeilen-ID).
- **Dateien:** `tools/layout/*.yaml`, `game/skripte/objekte/cq_hotspot.gd`, `tools/pruefen.py`; danach `godot_raeume.py`, `--cq-layout=<räume>`, Screenshot-Referenzen der betroffenen Räume unter Linux.
- **Aufwand:** mittel.

## AP-04 Figurenplätze, Ankünfte, Laufbereiche um Figuren (Welle 3, nach AP-03 im selben Thread)

- **Funde:** W1-08 (Platz), W1-10, W1-13, W1-14, W1-17, W1-23, W2-10 (Platz), W2-16, W2-24, W2-25 (Tonne und Philosoph verschieben), W2-28, W2-32 (Bank), W2-39 (Platz), W2-41.
- **Tun:**
  - Toadi weg von der Tür (W1-08); Zeldina und XXL-Ziege getrennt zählen in `welt_1.gd` `_platz()` (W1-10); Waldemar auf die Lauffläche oder Brüstung als Vordergrund (W1-23).
  - Brunnen aus dem Laufbereich (W1-13); Startmarker Luftschloss (W1-14); Goblins und Agora-Figuren in der Tiefe staffeln, Laufbereich an gemalten Teilen einbuchten (W1-17, W2-28, auch LD-17-Stellen Stadion und Grabhügel).
  - Fährmann neben die Tafel (W2-10), Ankünfte Fährsteg und Hafen eine Figurbreite neben den Fährmann (W2-24, W2-39), Hieron zur Waage (W2-41), Bank im Startbüro an die Wand (W2-32), Tonne und Philosoph 60 bis 80 px nach rechts (W2-25).
  - Sobek beim Folgen an der Raumkante ausrichten (W2-16, `welt_2.gd` `_figuren_anwenden()`).
- **Werkzeug:** Prüfung in `pruefen.py` oder als Godot-Test: kein Ankunftsmarker näher als eine Figurbreite an einer Figur, keine zwei Figuren am selben Platz, keine Figur außerhalb von 0 bis Raumbreite.
- **Fertig, wenn:** Raumaufnahmen (`_review_raeume.gd`) mit Max an der Startstelle ohne Überlappung; Lauftest Werkstatt und Luftschloss ohne Durchqueren.
- **Aufwand:** mittel.

## AP-05 Hinweissystem und Notizbuch Welt 2 (Welle 2)

- **Funde:** W2-01, W2-02.
- **Tun:** Eigene „nichts offen“-Zeile `W2_HINT_PIX_0010`. Pflichtschritte in noch nicht besuchten Räumen bekommen eine Stufe-1-Zeile, die nur den Ort nennt (Startbüro nach der Audienz, Grabhügel mit dem Grabstein). Freiwillige Schritte (`optional: true`) nur wählen, wenn kein Pflichtschritt offen ist; R4 nach Tag 1 und R6a/R6b nach dem Finaltag als verpasst schließen (auch im Notizbuch). Dieselbe Regel für Welt 3 und 4 vorsehen.
- **Dateien:** `game/skripte/hinweise.gd`, `game/skripte/zustand.gd`, `game/daten/hinweise/welt-2.json` (über die Quelle in `docs/`), neue Zeilen im Skript.
- **Fertig, wenn:** Szenario A2 bis A9 aus `belege/game-design/_review_gd_w2.gd.txt` bringt überall einen sinnvollen nächsten Schritt.
- **Aufwand:** klein bis mittel.

## AP-06 Rätsel-Umbau für mehr Fairness (Welle 3, Entscheidung Sebastian)

- **Funde:** W2-15, W2-22, W2-30, W2-34, W2-35, W2-36, W2-45; dazu die in der Rätsel-Übersicht als „mittel“ oder „schwach“ bewerteten Rätsel W2 R6b und W1 R7.
- **Fertig, wenn:** Rätseldoku, Skript und Code stimmen überein, `welt_2_anspiel.gd` und das Review-Szenario laufen grün, die Pfote kennt die neuen Schritte.
- **Aufwand:** mittel. Vorschläge unten; jeder ist einzeln wählbar.

### Vorschläge zum Umbau der schwachen Rätsel

**W2 R7 Diskus-Diebstahl (heute „schwach“).** Das einzige echte Logikrätsel der Welt; Problem ist nicht die Logik, sondern dass man die Aussagen nicht nachlesen kann und Aufgeben nichts kostet.
1. **Verhörprotokoll im Notizbuch:** Jede gehörte Aussage wird mit Sprecher eingetragen (Seite „Wer war's?“), vier Zeilen mit je zwei Sätzen. Das ist die eigentliche Fairness-Lücke.
2. **„Was hast du noch mal gesagt?“** als Option bei jedem Verdächtigen, solange R7 offen ist.
3. **Tiro als lebender Hinweis:** Tiro schreibt mit (er hat Tafeln, `tafel_glaetten`). Max kann seine Wachstafel ansehen; darauf steht das Protokoll als Nahansicht. Das passt zur Figur und macht das Notizbuch-Feature zum Gag („Ich brauchte eine Unterlage“).
4. **Aufgeben mit Preis:** Der Ersatz bei Leonidas kommt erst nach einer falschen Anklage. Die Wurfscheibe fliegt „fast so weit“: Max bekommt den Wettkampf, aber nicht die Bestleistung im Diskus und nicht „Fünfkampf“. So lohnt sich das Lösen, ohne dass jemand festhängt.

**W2 R8 Sphinx (heute „mittel“).**
1. Bausteine beim **ersten** Ansehen der Wunderdinge (die Zweitzeile direkt anhängen, wie beim Kalender im Prolog).
2. Die Sphinx antwortet bei weniger als drei Bausteinen mit einer eigenen Zeile: „Ein Rätsel braucht drei Hinweise. Du hast {n}. Sieh dir deine Wunderdinge genauer an.“
3. Gesammelte Bausteine im Notizbuch sichtbar (gleiche Seite wie die Konter).
4. „leuchtet“ nicht nur über das Handy auf den Hofkater: auch Handy auf die Sphinx selbst oder beim zweiten Ansehen des Handys.

**W2 R6b Feigen (heute „mittel“).** Die Zeitfähren-Idee ist schön, nur das Pflücken (Feigenbaum im Inventar benutzen) muss man erraten.
1. Wird der Setzling in Syrakus zum Baum, pflückt Max die Feigen beim ersten Ansehen von selbst („Die sind reif. Die nehm ich.“), oder Pixel sagt: „Pflück die, bevor du wieder einsteigst.“
2. Stufe 2 der Pfote nennt den Fluss ausdrücklich („Pflanzen wachsen flussabwärts.“), Stufe 3 das Pflücken.
3. Der Feigenbaum im Inventar bekommt beim Ansehen den Satz „Benutzen zum Pflücken“ nicht als Anweisung, sondern als Max-Zeile („Die Feigen wollen gepflückt werden. Ich auch, manchmal.“).

**W2 R10b Alter des Grabsteins (heute ein Botengang).** Zwei Möglichkeiten:
- **Klein:** So lassen, aber Stufe 3 ohne „ohne Umweg“ (keine Scheingefahr) und die Zeile für den zu jungen Stein streichen.
- **Echtes Rätsel:** Cicero will das Grab zuerst in Olympia (dort ist der Stein nur 112 Jahre alt, „zu frisch für einen Klassiker“). Max muss erkennen, dass der Stein erst in Syrakus 137 Jahre hat, und Cicero dorthin umlenken (Gespräch mit Hinweis auf die Fährtafel). Damit trägt die Zeitfähre zwei Rätsel statt einem.

**W2 R2b Bonus der Wunderdinge (W2-15).** Bedingung `not _hat("kaugummi")` streichen: Der Brennspiegel ist immer ein gültiges Wunder. Pixel kommentiert den sparsamen Weg („Der teurere Trick. Aber du hast noch Kaugummi. Klug.“). Erst dann ist der Parade-Bonus erreichbar.

**W2 R3a, R13, R11a (W2-30, W2-36):** Kugelschreiber und Tinte nach dem Startpass sperren; Startlinie nennt das erste fehlende Teil; Archimedes sagt beim Paradenplan, dass sein Spiegel noch in der Werkstatt liegt.

**W1 R7 Niesrosen (heute „mittel“).** Waldemar geht nach dem Gespräch sichtbar los (Gang ist gebaut), statt erst beim nächsten Betreten des Waldes dort zu stehen; Pixel sagt „Der singt nicht hier. Der will Publikum. Im Wald.“ So weiß der Spieler, wohin.

## AP-07 Texte: Text gegen Bild, Längen, Humor (Welle 3, nach AP-06)

- **Funde:** P-03, W1-01, W2-03, W2-08, W2-09, W2-11, W2-12, W2-13, W2-14, W2-20, W2-23, W2-31, W2-43 (Textteil), X-05 (Kürzen der NAR-Zeilen).
- **Tun:** Wo billiger, Text ans Bild anpassen (Thronsaal, Bauplan, Pult, Bart, Modell, Traubensaft „wird Wein“). „[Satz]“ durch den gelegten Satz oder eine Restfall-Pointe ersetzen (W2-12). „an der Wand“ statt „an der Säule“ (W2-13). Die 26 Blasen über 140 Zeichen teilen, NAR-Zeilen auf etwa 75 Zeichen; Warnung in `pruefen.py` für alle Abschnitte. Humor-Wiederholungen nach Liste in W2-08 und W2-09. Ankunft Welt 1 um vier bis fünf Zeilen kürzen, Zwischenspiel-1-Szene teilen. Englisch nachziehen.
- **Dateien:** `docs/skript/*.md`, daraus `texte.csv` und Daten neu erzeugen; `tools/pruefen.py`; Raumcode nur für P-03 (Szene teilen).
- **Aufwand:** mittel.

## AP-08 Szenen-Ablauf und Erzähltext in Welt 2 (Welle 4)

- **Funde:** P-01, X-05 (Anzeigedauer), X-08, W2-05, W2-06, AN-09, AN-10.
- **Tun:** Läufe zwischen Szenen (Hermes, Archimedes, Max barfuß, Fährmann) in die Szene holen oder Oberfläche sperren; vorher W2-05 einmal mit Ausgangsklick nachspielen (könnte kritisch sein). Zusammengehörige Abläufe in eine Szene, damit Esc einmal reicht. NAR-Anzeigedauer an die Länge koppeln (Obergrenze 8 s, Klick schaltet weiter). Bedingung „vor dem Training“ in `_bedingung_text()`; Standardzeile für Rechtsklick auf Ausgänge. Hover-Beschriftung im schwarzen Prolog-Einstieg aus. Archimedes' Heureka-Lauf am Endpunkt der Posen beginnen; Hermes-Tempo auf etwa 125 px/s.
- **Dateien:** `game/skripte/welt_2.gd`, `game/skripte/spiel.gd` (nur `_erzaehlen`, mit AP-02 absprechen), `room_wohnzimmer.gd`.
- **Aufwand:** mittel.

## AP-09 Gebaute Animationen einbauen und Gesten-Regie (Welle 4)

- **Funde:** W1-06, W1-19, W2-04, W2-38, AN-17; Regie-Empfehlung zu Max' Redegesten (Kapitel 7.3).
- **Tun:** Melken, Pixels Haare (mit Haarhäufchen-Prop), Tag-1-Rennen von Leonidas und Schildkröte, Sobeks Verbeugung im Wasser (Versatz aus `idle`) aufrufen. Für die Pointen aus W2-04 (Duell-Wunder, Sandale, Rednerpult, Socke im Aktenberg) je einen Bildwechsel, eine Pose oder einen kurzen Lauf. Regel für Max' Redegesten in `docs/grafik/gesten-regie.md` festschreiben (Mund und Nicken als Standard, Gesten bei Pointen, Ärger, Staunen, Zeigen) und die Tabelle `ZEILE` danach ausdünnen oder ergänzen.
- **Dateien:** `game/skripte/gesten_*.gd`, `welt_2.gd` (nur Tag 1 und Duell, mit AP-08 absprechen), `room_turmkeller.gd`, `character_schmiede_ziege.gd`, `docs/grafik/gesten-regie.md`.
- **Aufwand:** klein bis mittel, ohne neue Bilder.

## AP-10 Animations-Sheets nacharbeiten (Welle 5, Aseprite, evtl. Meshy)

- **Funde:** P-04, W1-05, W1-09, W1-16, A-01, A-03, A-04, A-05, A-06, A-07.
- **Tun:** Max' Mund in den Posen liegt, sitzt, kniet (P-04); Talk von Gollo und Grimmzahn aus der Standpose, XXL-Ziege `kauen` in Seitenansicht (W1-05, W1-16, A-01); Max als Pilz mit echtem Gang und Pilzkappe (W1-09); Fußlinien angleichen (A-03), Größenabweichungen über 8 % prüfen (A-04), Atem-Schleifen glätten (A-05), Flatterbilder für Berta (A-06), Sheets ohne `_alt` neu packen (A-07). Danach Pflicht nach `CLAUDE.md`: gegen Stand-Sprite und im Raum mit allen Figuren prüfen, Einzelbilder vergrößert, GIF in Spieltempo.
- **Kosten:** Max als Pilz kann einen Meshy-Lauf brauchen (Stückpreis vorher nennen); der Rest ist Aseprite.
- **Aufwand:** mittel bis groß.

## AP-11 Grafik-Nacharbeit Hintergründe und Props (Welle 5)

- **Funde:** X-02, W1-15, W2-18, W2-19, W2-37, W2-43 (Bildteil); Bildteile von W2-11, W2-13, W2-23, W2-26, W2-31, falls Sebastian dort lieber das Bild als den Text ändert.
- **Tun:** Raumlicht für 23 Räume im Layout (X-02, reine Daten); Luftschloss-Naht (W1-15); Topf vor Nebet oder Nebet hinter den Tisch (W2-18); rechte Küchenwand (W2-19); Wurfhebel als Prop ab dem Training (W2-37); Modell im Werkstattregal (W2-43); Agora-Hintergrund ohne Sandale ab R6a (W2-26); Bauplan-Kontur (W2-11).
- **Kosten:** Gemini nur, wenn Sebastian Bildänderungen statt Textänderungen will.
- **Aufwand:** mittel.

## AP-12 Laufzeit (Welle 2)

- **Funde:** X-03, W2-07.
- **Tun:** Lauftempo von der Tiefenskala entkoppeln (`cq_raum.gd` `tiefe_anwenden()`); Doppelklick auf Ausgänge auch, wenn sie außerhalb des Bildes liegen (Randpfeil in `cq_ausgang.gd`); in den vier breiten Welt-2-Räumen prüfen, ob ein Ausgang näher rücken kann (dann über AP-03).
- **Fertig, wenn:** Lauftest Dorfplatz quer unter 8 s, Fähre Olympia bis Wurfhebel deutlich unter 19 s.
- **Aufwand:** klein bis mittel.

## AP-13 Workflow, schnelle Gewinne (Welle 2, Sebastian muss in GitHub-Einstellungen klicken)

- **Funde:** WF-07, WF-08, WF-10, WF-11, WF-12, WF-14, WF-15, WF-16, WF-18.
- **Tun:** Branch-Schutz für main mit Pflicht-Checks, „Automatically delete head branches“, Auto-Merge (Sebastian, Einstellungen); `web.yml` per `workflow_run` erst nach grünem „Prüfen“; `tools/alles_pruefen.py` mit genau den CI-Schritten, `CLAUDE.md` darauf umstellen; Pfadfilter und Godot-Cache in der CI; `gemini_bild_mcp.py` ohne Schlüssel committen, Aufnahme-Skripte (auch die `_review_*.gd`) als Werkzeuge committen oder ignorieren; `gh` installieren; Testbuild einmal starten und wöchentlich planen; Datumszeilen in Dokumenten weglassen.
- **Aufwand:** klein.

## AP-14 Pipeline und Tests absichern (laufend)

- **Funde:** WF-01, WF-02, WF-03, WF-04, WF-05, WF-06, WF-09, WF-13, A-08.
- **Tun:** Grafik-Skripte aus `E:\Game Engine\Grafiken` (gültige Fassungen) nach `tools/grafik/`, Pfade über `CQ_ASSETS`, Prüfskript „zwei Beine, keine Löcher, ±5 %“; Originale sichern (Asset-Repo mit LFS oder tägliche Sicherung); Leerlauf-Sperre im Screenshot-Test auf Ambiente und Tweens ausweiten, CI-Knopf „Referenzen erneuern“, Panorama statt Ausschnitt; Klick-Durchlauf Welt 2 (`--echt`) mit Gesprächen, Hotspots, Zeigerraster aus AP-02 und Figurenplatz-Prüfung aus AP-04; Browser-Rauchtest für die Webseite und Liste der Popochiu-Patches; Statusliste und Animations-Inventar (gebaut gegen aufgerufen) erzeugen; Ablageschema und PNG-Eingangsprüfung.
- **Aufwand:** mittel bis groß, in Teilen.

## AP-15 Lessons Learned und Doku (laufend, Sebastian gibt frei)

- **Inhalt:** Die 27 Vorschläge aus Kapitel 8 des Berichts in `docs/lessons-learned.md` übernehmen (Sebastian entscheidet, welche); `quellen.md` ergänzen (Codixel, Endesga 32, Popochiu 2.2.1, Web-Export-Doku); `.import`-Widerspruch klären; Dauern in `gesten-regie.md` aus den JSONs erzeugen (mit A-08).
- **Aufwand:** klein.

---

## Kontrolle: jeder Fund einem Paket zugeordnet

| Paket | Funde |
| --- | --- |
| AP-01 | W2-29 |
| AP-02 | X-01, P-02, W1-03, W1-04, W1-07, W1-18, W1-22, W2-17, W2-21, W2-27, W2-42 |
| AP-03 | X-04, X-06, X-07, W1-02, W1-11, W1-12, W1-20, W1-21, W2-26, W2-33, W2-40, W2-44 |
| AP-04 | W1-08, W1-10, W1-13, W1-14, W1-17, W1-23, W2-10, W2-16, W2-24, W2-25, W2-28, W2-32, W2-39, W2-41 |
| AP-05 | W2-01, W2-02 |
| AP-06 | W2-15, W2-22, W2-30, W2-34, W2-35, W2-36, W2-45 (dazu R6b, W1 R7) |
| AP-07 | P-03, W1-01, W2-03, W2-08, W2-09, W2-11, W2-12, W2-13, W2-14, W2-20, W2-23, W2-31 |
| AP-08 | P-01, X-05, X-08, W2-05, W2-06, AN-09, AN-10 |
| AP-09 | W1-06, W1-19, W2-04, W2-38, AN-17 |
| AP-10 | P-04, W1-05, W1-09, W1-16, A-01, A-03, A-04, A-05, A-06, A-07 |
| AP-11 | X-02, W1-15, W2-18, W2-19, W2-37, W2-43 |
| AP-12 | X-03, W2-07 |
| AP-13 | WF-07, WF-08, WF-10, WF-11, WF-12, WF-14, WF-15, WF-16, WF-18 |
| AP-14 | WF-01, WF-02, WF-03, WF-04, WF-05, WF-06, WF-09, WF-13, A-08 |
| AP-15 | Lessons-Vorschläge (Kapitel 8) |

Fund-Teile, die zwei Pakete berühren (Klickanteil und Platz einer Figur, Text und Bild), stehen beim Hauptpaket; das andere Paket ist im Text genannt. Gezählt: 90 Spiel-Funde und 17 Workflow-Funde, keiner fehlt, keiner doppelt.
