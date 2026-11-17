# Gemeinsamer Auftrag für alle Prüf-Rollen (Review 17.11.2026)

Spiel: „Couch Quest“, Godot 4.7 + Popochiu, Pixel-Art 640×360. Geprüft wird `main` auf Commit `ae6619c1`.
Prüf-Checkout (nur lesen): `C:\Users\sebgr\AppData\Local\Temp\cq-r3`. Im gemeinsamen Ordner `E:\Claude\Couch Quest` nichts anfassen.
Godot: `"E:/Game Engine/Godot_v4.7.2-stable_win64.exe/Godot_v4.7.2-stable_win64_console.exe"`, Aufruf aus dem Checkout mit `--path game --position 6000,3000 -s res://tests/<skript>.gd -- <ausgabeordner>`. Eigene Aufnahme-Skripte nur als `game/tests/_review_<name>.gd` (werden nicht committet). Vorlagen: `game/tests/_review_raeume.gd`, `E:/Claude/Couch Quest/game/tests/_animationen_w2.gd`, `_gesten_blick.gd`, `game/tests/prolog_durchlauf.gd`, `welt_2_anspiel.gd`. Python: `py -3` (Pillow vorhanden).

**Regeln:** Nur prüfen und dokumentieren. Nichts an Code, Grafiken, Daten oder Doku ändern. Einzige Schreibziele: deine Notizdatei unter `docs/review/2026-11-17/notizen/` und Belegbilder unter `docs/review/2026-11-17/belege/<rolle>/`. Antworten und Notizen auf Deutsch, schlicht.

**Umfang:** Prolog (wohnzimmer, treppenhaus, dachboden), Welt 1 (dorfplatz, taverne, schmiede, zauberstabladen, klassenzimmer, trollbruecke, wasserschloss, zauberwald, luftschloss, bergwerk, turmkeller, abstellkammer_1, abstellkammern, thronsaal), Welt 2 (nil_delta, thronsaal_ramses, palastkueche, sphinx, faehrsteg_olympia, agora, startbuero, stadion, hafen_syrakus, werkstatt, grabhuegel).

**Belege, die schon da sind:** `docs/review/2026-11-17/belege/raeume/`:
- `<raum>_anfang.png` Panorama in ganzer Raumbreite (Weltkoordinaten = Pixel), ohne Max, Zustand beim ersten Betreten.
- `<raum>_anfang_mitmax.png` Kameraausschnitt mit Max an der Startstelle (Größenvergleich).
- `<raum>_anfang.json` Hotspots, Props, Figuren (Position, Skala, Rechteck, Klickpolygon, Animationen, walk_speed), Laufbereiche, Marker.
- `<raum>_anfang_klick.png` Panorama 2-fach mit Overlay: gelb Hotspot, cyan Prop, magenta Figur, grün Laufbereich.
- Dasselbe mit `_ende` für den Zustand nach Lösung aller Rätsel der Welt (falls vorhanden).
Achtung: Aufnahmen liefen im Testmodus; Figuren stehen dort, wo der Raum sie beim Betreten hinstellt.

**Quellen im Repo:** Konzept `docs/01-konzept.md`, Skripte `docs/skript/{prolog,welt-1,welt-2}.md`, Rätsel `docs/raetsel/{prolog-und-welt-1,welt-2,abhaengigkeiten}.md`, Grafik `docs/grafik/*.md` (Gesten-Regie `gesten-regie.md`, Status `status-alle-shots.md`), gültige Prompts nur `docs/grafik/fertige-prompts/`, Entscheidungen `docs/entscheidungen.md`, offene Punkte `docs/offene-punkte.md`, Lessons Learned `docs/lessons-learned.md`. Spieldaten `game/daten/`, Texte `game/lokalisierung/texte.csv`, Raumskripte `game/game/rooms/<raum>/`, Weltlogik `game/skripte/welt_1.gd`, `welt_2.gd`, Gesten `game/skripte/gesten_*.gd`, Figur-Basis `game/skripte/objekte/cq_figur.gd`, Layout-Startwerte `tools/layout/*.yaml`.

**Frühere Reviews (bereits behobene Funde NICHT erneut melden):**
- `docs/pruefung/review-prolog-welt-1-ergebnis.md` (14.11., 36 Funde, laut Commit d9f766f7 alle umgesetzt; Belege in `docs/pruefung/review-prolog-welt-1/`).
- `pruefung/360-pruefung.md` (10./11.11., 111 Funde, Umsetzung in `pruefung/umsetzung.md`).
- Status-Vermerke in `docs/offene-punkte.md` („Review-Umsetzung 14. November“, „Aseprite-Durchgang 15. November“).
Wenn ein früherer Fund NICHT oder nur halb behoben ist, darfst du ihn melden, mit Verweis „früher Fund Nr. X, noch offen“ und Beleg.
Welt 2 wurde bisher nie im Spiel reviewt.

**Format deiner Notizdatei** (`docs/review/2026-11-17/notizen/<rolle>.md`): Schreibe sie schrittweise (nach jedem Raum oder Block speichern, der Rechner kann ausfallen). Je Fund eine Zeile in einer Tabelle:

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |

- ID: Rollenkürzel + Nummer (z. B. LD-07).
- Priorität: kritisch (blockiert/zerstört Spielerlebnis, Sackgasse, Absturz, unlösbar), wichtig (fällt jedem Spieler negativ auf), kosmetisch.
- Kategorie: Grafik, Perspektive, Größen, Positionierung, Laufwege, Klickflächen, Rätsel, Humor, Timing, Animation, Technik, Workflow, Sonstiges.
- Beleg: Pfad zu Bild/GIF (relativ zu `docs/review/2026-11-17/`) und/oder Datei:Zeile, Zeilen-ID, Messwert. Kein Fund ohne Beleg. Was du nicht prüfen konntest, als „nicht geprüft“ aufführen, nicht als Fehler.
- Ehrlich bewerten: nicht übertreiben, nichts schönreden. Auch Gelungenes kurz notieren (eigener Abschnitt „Gut gelöst“).
