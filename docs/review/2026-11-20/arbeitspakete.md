# Arbeitspakete aus dem Review Welt 3 vom 20. November 2026

Grundlage: [`bericht.md`](bericht.md) (65 Spiel-Funde, Nachtrag mit 4 Funden aus Sebastians Prüfung, 16 Workflow-Funde, 31 Lessons-Vorschläge) und [`notizen/skript-ki-klang.md`](notizen/skript-ki-klang.md). Jeder Fund ist genau einem Paket zugeordnet; die Liste am Ende prüft das. Die Pakete sind so geschnitten, dass je Paket ein Thread arbeiten kann und zwei Threads möglichst nicht dieselben Dateien ändern. Wo das nicht geht, steht die Reihenfolge dabei.

**Ausgangslage:** Sebastian baut alle zwölf Hintergründe von Welt 3 neu, diesmal mit Skizze. Alles, was am gemalten Bild hängt (Raumaufbau, Größen gegen Möbel, Straße, Laser, Spalt, Farbcode, vereiste Zelle, Schrift auf Schild und Plakat), ist deshalb in AP-09 gesammelt und wartet auf die neuen Bilder. AP-09 enthält je Raum, was die Skizze zeigen muss. Alle übrigen Pakete hängen nicht an den Hintergründen und können sofort beginnen.

**Reihenfolge auf einen Blick**

| Welle | Pakete | warum |
| --- | --- | --- |
| 1 (sofort) | AP-01 | Zwei harte Sackgassen, Welt 3 ist sonst nicht durchspielbar |
| 2 (parallel möglich) | AP-02, AP-04, AP-08, AP-10 | getrennte Dateien: Code-Sicht (`welt_3.gd` Abschnitt Code-Sicht), Layout (`tools/layout/welt-3.yaml`), Nahansichten-Werkzeug, GitHub-Einstellungen |
| 3 | AP-03, danach AP-05 (ein Thread oder nacheinander) | beide ändern `welt_3.gd` und die Hinweisdaten bzw. Gesten-Tabellen |
| 3 parallel | AP-06 | Sheets in Aseprite, eigene Dateien unter `game/grafik/figuren` und `ambiente` |
| 4 (Entscheidung Sebastian) | AP-07 | Textarbeit; erst nach AP-02 und AP-03, weil beide Texte und Hinweise ändern |
| 5 (braucht Sebastians neue Hintergründe) | AP-09 | Einbau der neuen Räume und alles, was am Bild hängt |
| laufend | AP-11 | Pipeline, Prüfskripte, Doku, Lessons |

**Werkzeuge und Kosten:** Code-, Daten- und Textarbeit braucht nur Godot und Python. Aseprite (AP-06, AP-08, AP-09) und Blender (AP-09, optional für Skizzen) kosten nichts. Gemini über den eigenen MCP mit dem günstigen Modell `gemini-nano-banana-2.1` (etwa 0,07 $ je Bild laut KI-Protokoll) brauchen nur AP-06 (Frau mit geschlossenem Mund, Pixels Trab) und AP-09 (Zustandsvarianten der neuen Hintergründe). Meshy ist voraussichtlich nicht nötig: Pixel ist ein Tier und wird laut Lessons nicht gerigt, alle Menschenbewegungen für Welt 3 sind schon gebaut. Vor jedem bezahlten Aufruf Stückpreis und Kontostand nennen (Regel aus `CLAUDE.md`), Freigabe als wörtlichen Satz.

---

## AP-01 Sackgassen und echter Anspieltest (Welle 1)

- **Funde:** W3-01 (kritisch), W3-R01-01 (kritisch), W3-R08-02 (Entscheidung Sebastian).
- **Tun:**
  - Pixel-Klicks: In `welt_3.gd` `ereignis()` die Art `pixel` auf `benutzen_<id>` weiterleiten, wenn es kein `pixel_<id>` gibt; `cq_ausgang.gd` `_darf_gehen()` lässt Pixel durch den versteckten Ausgang in die Kühlung (W3-01).
  - Mensch-Test: Deckert 0090 im Skript mit „(bleibt)“ (eine Sichtbarkeitsregel greift nicht, weil `option_sichtbar()` zuerst `used` prüft), Abschiedsoption ergänzen, `deckert` aus `GESPRAECHE_OHNE_ABSCHIED` in `pruefen.py` nehmen (W3-R01-01).
  - Gleich mitprüfen, im Spiel ohne Testmodus: Herr Vier 0090 nach Abbruch der Bestellung mit Esc (gleiche Bauart), und ob „Max benutzt Pixel“ per Klick ankommt (Déjà-vu, R3a). Ist eins davon blockiert, hier mit beheben.
  - **Entscheidung Sebastian (W3-R08-02):** Nach dem Fix kann Pixel Max jederzeit aus dem Büroturm schütteln, dann sind R7 und R13 überspringbar (es fallen der Enten-Gag und Opas Hologramm weg). Entweder Schütteln im Büroturm sperren („Er liegt zu tief im Turm, da kommt mein Schütteln nicht hin“) oder R7/R13 als freiwillig führen und das Hologramm an eine Pflichtstelle hängen. Empfehlung: sperren, das ist ein Satz und eine Bedingung.
  - Anspieltest: `welt_3_anspiel.gd` löst jeden Schritt über den echten Weg aus (`on_click()` mit der richtigen Spielfigur, `d.waehlen()` im Gespräch, Ausgänge per Klick) statt `S.regel(...)`. Die Nachstellung aus dem Review (`werkzeuge/godot/_review_ev_w3_belege.gd`, Szenarien `nd01`, `sackgasse`) ist die Vorlage. Danach dasselbe für Welt 1 und 2 als eigenes Ticket in AP-11.
- **Dateien:** `game/skripte/welt_3.gd` (nur `ereignis()` und die Kapsel-Regel), `game/skripte/objekte/cq_ausgang.gd`, `docs/skript/welt-3.md` (Dialog Deckert, erzeugte Daten neu), `tools/pruefen.py`, `game/tests/welt_3_anspiel.gd`.
- **Werkzeuge:** Godot, Python.
- **Fertig, wenn:** Der neue Anspieltest spielt Welt 3 per Klick bis Zwischenspiel 3 durch, inklusive einmal Durchfallen im Mensch-Test, Pixels Kabel, Tasse, Fenster und Kapsel; die Nachstellung `sackgasse` zeigt R7b und R13 gelöst.
- **Aufwand:** klein bis mittel (Fixes unter einer Stunde, Anspieltest umbauen ein halber Tag).

## AP-02 Code-Sicht fertig machen (Welle 2)

- **Funde:** W3-02, W3-03 (Entscheidung Sebastian), W3-R06-01, W3-R08-01, W3-R10-02.
- **Tun:**
  - Bild an das Sprite des Hintergrunds hängen statt an den Prop-Knoten (`_code_sicht_zeigen()`), die sechs `_codesicht.png` neu aufnehmen (W3-02).
  - **Entscheidung Sebastian (W3-03):** Liste fertiger Tauschsätze behalten und Tutorial und Hinweise darauf umschreiben, oder zweistufige Wahl (erst ein Wort an einem Objekt anklicken, dann ein zweites aus allen Etiketten im Raum). Empfehlung: zweistufig, weil die Lösung sonst wörtlich in der Liste steht und die schweren Rätsel 6 und 9 durchprobierbar sind. Die Etiketten sind schon da und klickbar zu machen.
  - Freischalten an der ganzen Glastür: Ansehen des Ausgangs vor R5 auf `ansehen_tuer` umleiten, Sprechanlage anklickbar (W3-R06-01).
  - Budget leer in Büro und Kammer 1: eigene Zeilen, die den Weg nennen („Ich wechsle kurz zu Pixel, dann ist alles zurückgesetzt“), Fehltausche ohne Tasse nicht anbieten (W3-R08-01).
  - Etiketten weichen bei Überlappung nach oben aus (W3-R10-02).
- **Dateien:** `game/skripte/welt_3.gd` (Abschnitt „Code-Sicht und Tausche“), `docs/skript/welt-3.md` (Tutorial `W3_TUER_MAX_0180`, Budget-Zeilen), `tools/layout/welt-3.yaml` nur für die Tür-Figur in der Stadtstraße (mit AP-04 absprechen).
- **Werkzeuge:** Godot.
- **Fertig, wenn:** Code-Sicht-Bild deckt in allen sechs Räumen den Raum ab; zweimal Ansehen der Glasfläche schaltet frei; im Spiel per Maus ein Tausch und ein Fehltausch durchgespielt.
- **Aufwand:** klein (Fixes), mittel bis groß (zweistufige Wahl).

## AP-03 Hilfe-Pfote und Rätsellogik (Welle 3, vor AP-05)

- **Funde:** W3-04, W3-05, W3-R02-02, W3-R12-02, W3-R03-06, W3-R02-03, W3-R01-04, W3-R06-04, W3-N-01.
- **Tun:**
  - Pfote ortsbezogen: Schritte im aktuellen Raum bzw. auf der aktuellen Ebene vorziehen, `objekte` in `daten/hinweise/welt-3.json` (Quelle in `docs/raetsel/welt-3.md` bzw. der Hinweis-Quelle) für alle 20 Schritte füllen (W3-04).
  - Eigene „nichts offen“-Zeile `W3_HINT_PIX_0010` und Stufe-1-Zeilen, die den Ort nennen, für Pflichtschritte in unbesuchten Räumen (Apothekengasse, „leg dich in die Kapsel“) (W3-05).
  - Déjà-vu-Hinweis Stufe 2/3 auf „Sag mir, ich soll zweimal vorbeigehen“ (Max benutzt Pixel) oder den Pixel-Weg wirklich zählen lassen (W3-R02-02; hängt am Prüfergebnis aus AP-01).
  - Regel 1 beim Erhalt der Akte setzen, nicht erst beim Ansehen (W3-R12-02).
  - Lösung B (Fenster) auch direkt nach R10 prüfen, offenes Fenster nicht schließen, solange die Zelle glüht (W3-R03-06).
  - Blaue Pastille nach der roten Wahl abgeben (W3-R02-03); Kekse-Schlüssel `omas_kekse` bei Herrn Vier (W3-R01-04); Wecker-Countdown einmal je Traum statt je Betreten (W3-R06-04); `ansehen_inventar_morse_tabelle()` zeigt die Nahansicht, damit NEUGIER erreichbar ist (W3-N-01).
- **Dateien:** `game/skripte/welt_3.gd`, `game/skripte/hinweise.gd`, Hinweis-Quelle Welt 3 und erzeugte `daten/hinweise/welt-3.json`, `docs/skript/welt-3.md` (Hinweiszeilen).
- **Werkzeuge:** Godot, Python. Das Szenario-Skript `werkzeuge/godot/_review_gd_w3_szenarien.gd` als Gegenprobe.
- **Fertig, wenn:** Das Szenario `haupt` meldet in Büroturm und Kammer 1 einen Hinweis zum Raum, nirgends mehr die Prolog-Zeile; Errungenschaft NEUGIER im Testlauf erreichbar.
- **Aufwand:** mittel.

## AP-04 Layout: Klickflächen, Zustände, Platzhalter, Raumbreite (Welle 2)

- **Funde:** W3-12, W3-14, W3-19, W3-R02-01, W3-R03-01, W3-R03-02, W3-R03-03, W3-R03-04, W3-R05-01, W3-R05-03, W3-R06-05, W3-R09-01, W3-R12-04.
- **Tun:**
  - Platzhalter: `gegenstaende_einbau.py` nach dem Raumbau erneut laufen lassen (Telefonbuchseite, Kaffeetasse, Sonnenbrille, Akte, Gummihuhn), Energiezelle-Prop im Kern unsichtbar; Prüfung auf Platzhalterfarbe (228, 166, 114) in `pruefen.py` (W3-12).
  - Apothekengasse `width = 1280` in der Szene, Startmarker und Pixels Doppelgang prüfen; Prüfung „Szenenbreite = Hintergrundbreite“ in `alles_pruefen.py` (W3-R02-01).
  - Zustands-Klickflächen mit derselben Bedingung wie das Bild: Kaffeepfütze `nach: R13` und auf die gemalte Pfütze, Scherben `nach: R4`, Datenanschluss erst mit `W3_PANZERTUER_OFFEN` und Kalles Zeile an „nach R9a“ (W3-R03-01, W3-R05-01).
  - Szene der Basis nach Layout neu bauen (Rebellin x 380, Rebell an seinen Platz), Graubox-Streifen „Rebellen“ streichen, Lüftungsschacht oder Ausgang Kühlung einzeln (W3-R03-02, -03, -04).
  - Halterung in Kammer 1 erst nach `W3_PORTAL_GENOMMEN` (W3-R09-01); M.U.T.T.I.-Klickpolygon von Hand auf Kopf und Rührschüssel, Sockel aus dem Laufbereich (W3-R12-04); Radiowecker-Klickflächen auf dasselbe Rechteck (W3-R06-05).
  - Gehe-Punkte 40 bis 50 px neben die Figuren (Vordach, Pizza-Plakat, Steuerpult, Stromkasten, Plakat, Ofen, Tapete, Platz des Hausmeisters, Klone), Frau mit Schirm auf etwa x 750 (W3-14).
  - Ausgänge mindestens 50 px, Rechtecke unter y 24 und neben die Porträts (W3-19); Benutzen-Zeile für den Gang im Laboreingang, Hotspot „Eingang“ in Kammer 1 (W3-R05-03, Texte mit Zeilen-ID über AP-07 oder hier).
- **Dateien:** `tools/layout/welt-3.yaml`, Raumszenen über `godot_raeume.py`, `tools/pruefen.py`, `tools/alles_pruefen.py`; Screenshot-Referenzen der betroffenen Räume im selben PR erneuern.
- **Werkzeuge:** Godot, Python; Zeigerraster `werkzeuge/godot/_review_gs_w3_zeiger.gd` zur Gegenprobe.
- **Hinweis:** Sebastians neue Hintergründe ändern Laufbereiche und Positionen ohnehin. Darum hier nur, was nicht am Bild hängt; Positionen, die sich mit den neuen Bildern verschieben (z. B. Gehe-Punkte), nach AP-09 noch einmal mit dem Zeigerraster prüfen.
- **Fertig, wenn:** Raumaufnahmen ohne orange Kästen, Apothekengasse scrollt, Zeigerkarten ohne Zustands-Klickflächen vor ihrem Rätsel, Portalgerät mindestens 70 % anklickbar.
- **Aufwand:** mittel.

## AP-05 Fertige Bewegungen einhängen (Welle 3, nach AP-03)

- **Funde:** W3-07, W3-08, W3-09, W3-10, W3-17, W3-18, W3-R08-03, W3-R08-04, W3-R09-02, W3-R12-01.
- **Tun:**
  - Bild-Pointen einhängen, in dieser Reihenfolge: blaue Pastille (Wohnzimmer-Zwischenbild, `["PIX","ohrfeige","vor"]` bei `SOFA_PIX_0520` und `0540`), M.U.T.T.I. aus (Geste an `W3_KERN_NAR_0210`, dann `grafik_laden("mutti_aus")`, ab R10 in `_figuren_anwenden`), Ente, Opa-Hologramm über Piepsi, Portal, Kopierer, Hausmeister rollt davon, Fächer, Schnee in der Simulation (W3-07, W3-R12-01).
  - Sprechende Lautsprecher, Küchenradio, Tür in Kammer 3: `spricht:` im Layout (W3-08). Mit AP-04 absprechen, gleiche Datei.
  - `talk` bei Deckert, Schmidt, Orakel-Oma, Hausmeister zurück auf die Mund-Schleife, Armgeste als `rede_geste` (W3-09).
  - Kapsel-Bewegungen in `_aufwachen()` und vor dem Wechsel in die Simulation (W3-10).
  - Schmidt ohne Brille nach `W3_TURM_SCH_0430` und ab R6b, Sonnenbrille und Akte als Props `nach: R6b` (W3-R08-03).
  - Hinken mit eigenem Tempo (`walk_speed` 80 bis 90, Bilddauer etwa 80 ms) (W3-R08-04).
  - Klone gehen zur Treppe ab, Morphäus tritt aus dem Schatten, Gänge der Nebenfiguren 70 bis 95 px/s (W3-17); Bernd schwebt heran (W3-R09-02).
  - Wiederholbare Gesten „mit“ statt „vor“, Haltezeiten etwa 0,6 s (W3-18).
- **Dateien:** `game/skripte/welt_3.gd` (Szenen, `_figuren_anwenden`, `_aufwachen`, `_max_gang`), `game/skripte/gesten_welt_3.gd`, `tools/grafik_w3/figuren_einbau.py` (talk), `tools/layout/welt-3.yaml` (`spricht:`), erzeugte Figurendaten.
- **Werkzeuge:** Godot, Python; Animations-Aufnahme `werkzeuge/godot/_review_an_w3_anim.gd` zur Abnahme (GIF in Spieltempo, Regel aus `CLAUDE.md`). Keine neue Grafik nötig.
- **Werkzeug neu:** Prüfskript „Grafikdatei ohne Fundstelle“ (jede Datei unter `grafik/ambiente/w3_*` und jede Animation in den Welt-3-Sheets hat einen Aufruf) in `alles_pruefen.py`.
- **Fertig, wenn:** Das Prüfskript meldet keine ungenutzte Welt-3-Datei außer bewusst zurückgestellten; GIFs von Ohrfeige, M.U.T.T.I. aus, Hologramm, Kapsel und Hinken im Raum mit allen Figuren angesehen.
- **Aufwand:** mittel bis groß.

## AP-06 Sheets und Effekte nacharbeiten (Welle 3, Aseprite, etwas Gemini)

- **Funde:** W3-15, W3-16, W3-NS-01, W3-NS-02, W3-NS-03, W3-NS-04, W3-R05-02.
- **Tun:**
  - Autos im Takt: in `tools/grafik_w3/effekte_auto_takt.py` nach Z. 33 die frei werdende Zeile füllen (`if feder: b[rad_unten] = auto[rad_unten - 1]`), Effekt neu erzeugen (W3-NS-01).
  - Pixels Trab neu: 8 Bilder mit echtem Schritt (etwa 16 Sheet-px Pfotenweg je Bild bei 150 px/s). Weg: Posenbogen mit vier Schlüsselposen über Gemini (Konzeptblatt als Vorlage, Magenta-Hintergrund, „the tomcat“), Zwischenbilder in Aseprite; alternativ Schritt im bestehenden Sheet vergrößern und `walk_speed` auf etwa 110. Gilt für alle Welten. Dazu `skala` für die Kühlung im Layout (W3-NS-02).
  - Schmidt: Fußpartie im Stand ersetzen (Hausschuh-Zipfel und Ferse), auch `schmidt_ohne_brille`, danach `reden_ruhe.py` und `figuren_einbau.py` (W3-NS-03).
  - Frau mit Regenschirm: Stand mit geschlossenem Mund als Variante im selben Gemini-Chat aus dem Grundbild, nur den Mund einsetzen, Mund in `reden_ruhe.py` eintragen (W3-NS-04).
  - Nebenfiguren 2 px anheben (`tools/sheet_verschieben.py`), Prüfung „erstes Bild einer Geste pixelgleich zum Stand“ in `figuren_einbau.py` (W3-16).
  - Morphäus-Stand an die Posen angleichen (Brille auf der Stirn), Kelle, Laptop, Akte und Mopp in den Posen mitzeichnen (W3-15); Hausmeister: Mopp-Kopf an den Boden, gelbes Rundauge sichtbar (W3-R05-02).
- **Dateien:** `game/grafik/figuren/*.png` (Schmidt, Frau, Pixel, Morphäus, Herr Vier, Kalle, Hausmeister, Nebenfiguren), `game/grafik/ambiente/w3_auto_im_takt.png`, Quellen unter `E:\Game Engine\Grafiken\assets\welt3`, `tools/grafik_w3/*`.
- **Werkzeuge:** Aseprite (alles), Gemini über MCP für Pixels Posenbogen (etwa 2 bis 4 Bilder) und den Mund der Frau (1 bis 2 Bilder), zusammen grob unter 1 $. Kein Meshy (Pixel ist ein Tier).
- **Fertig, wenn:** Vor dem Zeigen gegen Stand-Sprite und im Raum mit allen Figuren geprüft, Einzelbilder vergrößert, GIF in Spieltempo; Pixel rutscht unter 15 %; keine Zeile im Auto-Sheet leer.
- **Aufwand:** mittel.

## AP-07 Texte, Ton und KI-Klang (Welle 4, Entscheidung Sebastian)

- **Funde:** W3-11, W3-13, W3-R01-02, W3-R03-05, W3-R07-02, W3-R12-05, W3-N-04, W3-N-05; die Ton-Muster aus Kapitel 18 (ND-13 bis ND-16); alle 50 Vorschläge aus `notizen/skript-ki-klang.md`; der Sachfehler `W3_KAM3_MAX_0070` („schwer“ und „nachtragend“, an Bernd steht nur „schwer“).
- **Tun:**
  - **Sebastian entscheidet**, welche der 50 KI-Klang-Vorschläge er übernimmt (Ton und Humor sind seine Sache). Vorschlag: zuerst die Muster mit der größten Häufung angehen (Kontrast „kein X, sondern Y“ 36-mal, Bilanzsätze 19-mal, Stockphrasen 17-mal), Max jünger und mündlicher, Hausmeister und Kalle eigener Satzbau, die M.U.T.T.I.-Geschichte nicht dreimal im selben Bau. Danach dieselbe Prüfung für Prolog, Welt 1 und 2.
  - Fehltausch-Formel und „Das ist kein X. Das ist Y.“ (ND-13, ND-14), erklärende Pixel-Kaskaden (ND-16), Stimmen von Hausmeister und Kalle (ND-15).
  - Längen: „Tausch: …“-Vorspann aus den NAR-Zeilen, NAR auf höchstens 100 Zeichen, Blasen über 140 Zeichen mit „//“ teilen, `pruefen.py` warnt für alle Abschnitte und die EN-Spalte (W3-11).
  - Fehlende Ansehen- und Ansprech-Zeilen schreiben (W3-13); lange Szenen kürzen (Ankunft, erstes Aufwachen, Piepsi) (W3-R01-02, W3-R03-05); Kuckuck mit Sprechblase (W3-R07-02); `W3_KERN_MAX_0590` kürzen (W3-R12-05); Englisch „Servus“ und „Put my back out“ (W3-N-04); kalte Zelle in Zwischenspiel 3 (W3-N-05); `W3_KAM3_MAX_0070` richtigstellen.
- **Dateien:** `docs/skript/welt-3.md`, `docs/skript/zwischenspiele-und-finale.md`, `game/lokalisierung/texte.csv` (über das Skript erzeugt, DE und EN), `tools/pruefen.py`.
- **Werkzeuge:** Python (Längenprüfung, Mustersuche wie in der Notiz).
- **Fertig, wenn:** `pruefen.py` ohne Längenwarnung für Welt 3; die von Sebastian gewählten Zeilen in DE und EN geändert; Zeilen mit Rätselinformation tragen sie weiter.
- **Aufwand:** mittel (Längen, fehlende Zeilen), groß (KI-Klang über alle Welten).

## AP-08 Nahansichten: Schrift (Welle 2)

- **Funde:** W3-N-02, W3-N-03.
- **Tun:** In `tools/nahansichten_welt3_schrift.py` die Schrift nach dem Verzerren mit fester Strichstärke nachsetzen; „Bericht“, „Care“, „47“, „E“ einzeln prüfen; Regel 3 dunkler und 1 bis 2 px größer; Morse-Tabelle: T ein Strich, kurze Zeichen als deutliche Pfote; Leuchtkante der Akte grün, falls sie nur in der Simulation erscheint.
- **Dateien:** `tools/nahansichten_welt3_schrift.py`, erzeugte `game/grafik/nahansichten/*` (DE und EN).
- **Werkzeuge:** Python, Aseprite zur Kontrolle (vergrößert ansehen).
- **Fertig, wenn:** Alle fünf Nahansichten in DE und EN in Spielgröße und 3-fach lesbar.
- **Aufwand:** klein.

## AP-09 Neue Hintergründe einbauen und Raumaufbau (Welle 5, Sebastian malt mit Skizze)

- **Funde:** W3-06, W3-R01-03, W3-R03-07, W3-R06-02, W3-R06-03, W3-R06-06, W3-R07-01, W3-R08-05, W3-R08-06, W3-R10-01, W3-R11-01, W3-R12-03.
- **Was die Skizze je Raum zeigen sollte** (Sebastian zeichnet, Claude kann auf Wunsch einen Blender-Rohbau mit Perspektive und Maßstab als Vorlage liefern):

| Raum | muss in der Skizze stehen | Fund |
| --- | --- | --- |
| Unterstadt | Origami-Einhorn klein (etwa handgroß) | W3-R01-03 |
| Apothekengasse | ganze 1280 px, Automat in der Mitte, Wandlampe, Container, Rattenloch | W3-R02-01 (Szene in AP-04) |
| Widerstandsbasis | rundes Fenster direkt über Max' Kapsel; M.U.T.T.I.-Plakat mit Fläche für Schrift; Platz für zwei Rebellen | W3-R03-07, W3-R03-02 |
| Stadtstraße | eine echte Fahrbahn für die Autos im Takt (keine geparkten Autos auf dem Rasen), Nachttisch mit Wecker vorn als eigenes Teil; Omas Haustür in Max-Größe; Sonne am Himmel oder bewusst keine; Türschild mit Fläche für Schrift | W3-R06-02, W3-R06-03, W3-R06-06 |
| Küche | Tisch auf Hüfthöhe eines Erwachsenen, Stuhl, Herd in passendem Maßstab | W3-R07-01 |
| Büro 50 | Türreihe, auf die das Rätsel zielt; Farbcode als drei getrennte Felder (Kreis auf Rot, Dreieck auf Grün, Quadrat auf Gelb); Flur in die Tiefe für viele Klone | W3-R08-05, W3-R08-06 |
| Testkammer 2 | Laser quer vor der Ausgangstür | W3-R10-01 |
| Testkammer 3 | schmaler Spalt genau vor der Tür, einen Würfel breit; großer runder Lautsprecher | W3-R11-01 |
| Kern | Zelle auf dem Sockel; vereiste Variante dunkelgrau bereift wie das Inventarbild | W3-R12-03 |

- **Tun (Claude, nach Lieferung):** Hintergründe pixelieren und auf die Raumpalette bringen (`raeume_pixelieren.py`), Zustandsvarianten im selben Gemini-Chat aus dem Grundbild, beim Einbau nur die geänderte Stelle einsetzen (Nacht, Schnee, Kaffee, getaut, Panzertür offen, Laser, Scherben, vereist, leer); Laufbereiche, Skala und Tiefe neu (Max am Tisch etwa 190 px), Klickflächen und Gehe-Punkte an die neuen Bilder; Schrift auf Schild und Plakat mit dem Nahansichten-Werkzeug (DE/EN); Raumlicht `licht:` je Raum und nachts über W3_NACHT (W3-06); Autos auf die Fahrbahn, Nachttisch als Vordergrund; Bernd in den Spalt, Laufbereich bis R9c/R9d vor den Türen sperren.
- **Dateien:** `game/grafik/hintergruende/w3_*`, `tools/layout/welt-3.yaml`, Raumszenen, Screenshot-Referenzen.
- **Werkzeuge:** Gemini (Sebastian im Chat für die Grundbilder; Varianten über den MCP mit dem günstigen Modell, grob 10 bis 15 Bilder, etwa 1 $), Aseprite (Einsetzen der geänderten Stelle, Palette), Blender optional (Rohbau als Skizzenvorlage, kostenlos).
- **Fertig, wenn:** Jeder Raum mit allen Figuren und Effekten aufgenommen (`_review_w3_raeume.gd` und ohne Testmodus), Zeigerraster und Lauftest neu, Text gegen Bild abgeglichen.
- **Aufwand:** groß (über alle zwölf Räume), danach je Raum klein.

## AP-10 Workflow, schnelle Gewinne (Welle 2, Sebastian klickt in GitHub)

- **Funde:** WF-01, WF-02, WF-03, WF-11, WF-14, WF-16.
- **Tun:** Branch-Schutz für main mit Pflicht-Checks (dokumente, godot, bildschirm) und Pflicht-PR; Auto-Merge für „mergen, wenn grün“; „Automatically delete head branches“ (Sebastian in den GitHub-Einstellungen). Referenzen im selben Grafik-PR erneuern, `referenzen.yml` lädt die Übersicht alt/neu als Artefakt hoch, der PR nennt die gewollt geänderten Räume. Gemini-MCP: Standard auf `gemini-nano-banana-2.1`. Prüfskripte als Werkzeug mit Welt-Parameter nach `game/tests/werkzeuge/`, `game/tests/_*` in `.gitignore`.
- **Dateien:** `.github/workflows/referenzen.yml`, `tools/gemini_bild_mcp.py`, `.gitignore`, `game/tests/werkzeuge/`.
- **Fertig, wenn:** Ein Test-PR mit absichtlich rotem Bildvergleich lässt sich nicht mergen.
- **Aufwand:** klein.

## AP-11 Pipeline, Prüfskripte, Doku, Lessons (laufend)

- **Funde:** WF-04, WF-05, WF-06, WF-07, WF-08, WF-09, WF-10, WF-12, WF-13, WF-15, GD-12, AN-17; die Lessons-Vorschläge L-S01 bis L-S18 und L-W01 bis L-W13.
- **Tun:**
  - Statusliste aus den Daten erzeugen (`--pruefen` in `alles_pruefen.py`), Welt-3-Zeilen auf den echten Stand, neue IDs zuerst in `grafik/welt-3.md` (WF-04).
  - KI-Protokoll um Seed, Status, Kosten, Nacharbeit, Ähnlichkeit erweitern, Chat-Bilder und Meshy-Aufträge nachtragen; Ist-Kosten Welt 3 mit Kontostand in `grafik/welt-3.md` (WF-05, WF-10).
  - Prüftor als Häkchenliste in `.github/pull_request_template.md` (Skizze, Raum mit allen Figuren, Zeigerraster, Klick-Durchlauf, Abnahme) (WF-07); Lauf-Rig, `bew.py`, Bein-Prüfung mit Grenzwerten ins Repo (WF-08, WF-09); PNG statt JPEG (WF-12); CI-Cache und Pfadfilter (WF-13); Besitzer-Thread je Grafik-Notiz (WF-06).
  - Doku: Rätseldoku Welt 3 auf Wecker statt Telefonzellen (GD-12), Welt-3-Tabelle in der Gesten-Regie oder Verweis auf `gesten_welt_3.gd` (AN-17).
  - Lessons Learned: die 31 Vorschläge mit Sebastian durchgehen und übernehmen, Werkzeug-Rezepte ins `liesmich.md` (WF-15). Anspieltest über den echten Klickweg auch für Welt 1 und 2 (L-S01).
- **Dateien:** `docs/grafik/status-alle-shots.md` (erzeugt), Erzeuger-Skript, `tools/gemini_bild_mcp.py`, `docs/lessons-learned.md`, `docs/raetsel/welt-3.md`, `docs/grafik/gesten-regie.md`, `.github/`.
- **Werkzeuge:** Python; Meshy nur `meshy_check_balance` (kostenlos) für den Kontostand.
- **Aufwand:** mittel, über mehrere Tage verteilt.

---

## Kontrolle: jeder Fund einem Paket zugeordnet

| Paket | Funde | Umsetzung (Stand 21. November 2026, Zweig `claude/project-thread-w7ya4x`) |
| --- | --- | --- |
| AP-01 | W3-01, W3-R01-01, W3-R08-02 | erledigt, `e4b87eb6`: Pixel-Klicks, Mensch-Test wiederholbar, Kapsel im Büroturm bis R7b gesperrt (Entscheidung Sebastian), Anspieltest über echte Klicks und Gesprächsmenüs. Offen: derselbe Klick-Anspieltest für Welt 1 und 2 (L-S01, `offene-punkte.md`) |
| AP-02 | W3-02, W3-03, W3-R06-01, W3-R08-01, W3-R10-02 | erledigt, `77f30279` (Sprechanlage als Klickfläche in `3c2e2fe4`): Code-Sicht zweistufig (Entscheidung Sebastian), Bild am Hintergrund, Glastür und Sprechanlage schalten frei, Budget-Zeilen, Etiketten weichen aus |
| AP-03 | W3-04, W3-05, W3-R01-04, W3-R02-02, W3-R02-03, W3-R03-06, W3-R06-04, W3-R12-02, W3-N-01 | erledigt, `e4b87eb6`: Pfote ortsbezogen, eigene Zeilen, Déjà-vu, Lösung B, blaue Pastille, Kekse, Wecker einmal je Traum, Morse-Tabelle zeigt die Nahansicht. Bewusst anders: Regel 1 gilt weiter erst beim Lesen der Akte (W3-R12-02), damit kein Rätsel leichter wird |
| AP-04 | W3-12, W3-14, W3-19, W3-R02-01, W3-R03-01, W3-R03-02, W3-R03-03, W3-R03-04, W3-R05-01, W3-R05-03, W3-R06-05, W3-R09-01, W3-R12-04 | erledigt, `3c2e2fe4` (zusammen mit AP-09): Layout aller zwölf Räume neu, Zustands-Klickflächen mit Bedingung, Platzhalter weg, Apothekengasse 1280, Ausgänge, Gehe-Punkte; Platz des Hausmeisters erst nach R8 (`ca6029ef`). Teilweise: Das Zeigerraster kommt in Welt 3 nicht über das Wohnzimmer hinaus, die Abnahme lief über eine Abdeckungsrechnung aus den Aufnahme-JSONs (`belege/umsetzung/ap04_abdeckung.tsv`) |
| AP-05 | W3-07, W3-08, W3-09, W3-10, W3-17, W3-18, W3-R08-03, W3-R08-04, W3-R09-02, W3-R12-01 | erledigt, `9658b867`; Kapsel der zweiten Fassung `b7fba515` und `35505a58`, Hausmeister rollt neu `63798fd8`: Bild-Pointen, mitsprechende Lautsprecher, talk mit Mund, Schmidt ohne Brille, Hinken, Gänge, Gesten „mit“, Prüfung `grafik_fundstellen.py` in der CI. Zurückgestellt mit Grund (Liste im Werkzeug): Morphäus hält den Kater, schmollender Lautsprecher in Kammer 3, Pixel `tragen`/`schieben`/`vom_schrank_fallen`, Gänge von Deckert und Schmidt |
| AP-06 | W3-15, W3-16, W3-R05-02, W3-NS-01, W3-NS-02, W3-NS-03, W3-NS-04 | erledigt, `41825190` (3 Gemini-Bilder, etwa 0,21 $) und `9a467e25`: Autos ohne Strich, Pixels Trab ohne Rutschen (alle Welten), Schmidt, Frau mit Mund, Fußlinie von 62 Bewegungen mit Prüfung, Morphäus-Stand, Mopp. Offen: Pixels Gang in der Kühlung im Lauftest (Testaufbau ohne Pixel im Raum) |
| AP-07 | W3-11, W3-13, W3-R01-02, W3-R03-05, W3-R07-02, W3-R12-05, W3-N-04, W3-N-05, ND-13 bis ND-16, 50 KI-Klang-Vorschläge, `W3_KAM3_MAX_0070` | teilweise, `ca6029ef` (Stufe 1: Bild-Texte, Längen Welt 3/ZS3, 35 Ansehen-Zeilen, Kuckuck, Englisch, Sachfehler 0070) und `818bc0a4` (Stufe 2: 123 Zeilen KI-Klang, Pointen erhalten). Offen: „Ich sage nichts“ sechsmal (Humanizer-Regel 6), KI-Klang-Prüfung für Prolog bis Welt 2, 259 Überlängen anderer Welten (nur Hinweis), W3-N-05 Pixels Handtuch (Bild, Grafik) |
| AP-08 | W3-N-02, W3-N-03 | erledigt, `f01f7d0b`: eigene Pixelschrift ohne Verzerrung, Morse-Tabelle mit Pfoten und richtigem T, Akte grünlich (DE und EN) |
| AP-09 | W3-06, W3-R01-03, W3-R03-07, W3-R06-02, W3-R06-03, W3-R06-06, W3-R07-01, W3-R08-05, W3-R08-06, W3-R10-01, W3-R11-01, W3-R12-03 | erledigt mit Rest, `3c2e2fe4` und `85071413`: 24 Hintergründe als `_v02`, 18 Effekte neu, Nachttisch vorn, Autos auf der Fahrbahn, Laser, Spalt, Farbfelder, vereiste Zelle, Raumlicht in den Räumen der Realität. Offen: Stadtstraße nachts ohne eigenes Raumlicht (W3-06), Zeigerraster neu (hängt), Mond- und Sonnen-Klickfläche unter den Porträts prüfen |
| AP-10 | WF-01, WF-02, WF-03, WF-11, WF-14, WF-16 | Werkzeugteil erledigt, `0ad7006f`: günstiges Gemini-Standardmodell, Referenzen auf dem PR-Zweig mit Alt/Neu-Übersicht, PR-Vorlage mit Prüftor, Raumaufnahme und Zeigerraster als Werkzeuge. Die GitHub-Einstellungen (Branch-Schutz, Auto-Merge, Zweige löschen) setzt Sebastian; ihr Stand ist von hier nicht prüfbar (kein `gh`) |
| AP-11 | WF-04 bis WF-10, WF-12, WF-13, WF-15, GD-12, AN-17, L-S01 bis L-S18, L-W01 bis L-W13 | teilweise (21.11.): Lessons ergänzt, Doku richtiggestellt (Audio, Entscheidungen, Rätseldoku, Gesten-Regie), Statusliste Welt 3 von Hand nachgeführt, Kontrolltabelle, offene Punkte, Raumaufnahme zeigt Max wieder. Offen: Statusliste aus den Daten erzeugen (WF-04), KI-Protokoll und Ist-Kosten (WF-05, WF-10), Lauf-Rig und Bein-Prüfung ins Repo (WF-08, WF-09), PNG statt JPEG (WF-12), CI-Cache (WF-13), Rezepte aus den Lessons ins `liesmich.md` (WF-15) |

Zählung: AP-01 bis AP-09 enthalten 65 Spiel-Funde aus den Tabellen des Berichts plus 4 aus dem Nachtrag (W3-NS-01 bis -04); AP-10 und AP-11 die 16 Workflow-Funde.
