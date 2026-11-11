# Prompt: Funde der 360-Grad-Prüfung nachprüfen und umsetzen

Empfohlene Einstellung: Opus 5.5, mittlere Denkstufe. Den Text unter der Linie als erste Nachricht in eine neue Sitzung im Repository `seb-nsu/Max-against-the-world` geben. Die Zeile „Umfang“ kann man ändern, wenn nur ein Teil laufen soll.

---

**Umfang:** alle Arbeitspakete 1 bis 9, in dieser Reihenfolge.

## Deine Aufgabe

Du arbeitest am Adventure „Couch Quest – Max against the worlds“ von Sebastian. Es gibt einen Prüfbericht mit 111 Funden und vielen Einzelbewertungen. Du gehst jeden Punkt durch, prüfst ihn am Material nach und setzt ihn um, wenn er stimmt. Alles, was der Bericht als gut bewertet oder gar nicht erwähnt, bleibt unverändert.

Am Ende soll das Spiel weniger Fehler haben und genauso klingen wie vorher, nur ohne die Stellen, die der Bericht als schwach benennt.

## Ausgangslage

- Der Bericht liegt in `pruefung/360-pruefung.md`. Lies ihn zuerst ganz, er ist lang (rund 1.900 Zeilen). Wenn die Datei auf `main` fehlt, liegt sie auf dem Zweig `claude/project-thread-769z6c` (Pull Request 15). Setze dann auf diesem Zweig auf.
- Aufbau des Berichts: 1 Zusammenfassung, 2 Fundliste (nummeriert, mit Schwere und Vorschlag), 3 Abschnitte A bis N mit Einzelheiten, 4 „Was auf keinen Fall verloren gehen darf“, 5 bereits korrigierte Kleinigkeiten, 6 empfohlene Reihenfolge.
- Lies außerdem `docs/00-aufbau.md` (welche Datei welche Information besitzt und in welcher Reihenfolge man ändert), die Dialogregeln in `docs/01-konzept.md`, `docs/entscheidungen.md` und die Story-Bibel im Bericht (Abschnitt 3, „Vorab“). Daraus ergeben sich Ton und Sprachregel jeder Figur.
- Der Wortlaut steht nur in `docs/skript/*.md`. Dateien unter `game/daten/`, `game/lokalisierung/texte.csv` und `docs/grafik/fertige-prompts/` werden von den Werkzeugen in `tools/` erzeugt. Bearbeite sie nie von Hand, sondern ändere die Quelle und lass das Werkzeug neu laufen.

## Grundsätze

**1. Erst nachprüfen, dann ändern.** Der Bericht kann sich irren oder überholt sein. Öffne zu jedem Fund die genannte Stelle und prüfe, ob das Problem dort wirklich besteht. Stimmt der Fund nicht, änderst du nichts und vermerkst „nicht bestätigt“ mit einem Satz Begründung.

**2. Was gut ist, bleibt.** Geschützt sind:

- alles aus Abschnitt 4 des Berichts,
- jede Zeile, die in den Tabellen von Abschnitt C mit „zündet“ bewertet ist,
- jede Anspielung, die laut Abschnitt D zur Szene beiträgt und nicht auf der Streichliste steht,
- alles unter „Was funktioniert“ und „Was bleiben soll“ in den Abschnitten,
- jede Zeile, jedes Rätsel und jeder Prompt, die der Bericht nicht erwähnt.

Eine geschützte Zeile fasst du nur an, wenn ein anderer Fund es erzwingt, etwa ein Logikfehler, ein Widerspruch oder übernommener Originalwortlaut. Dann behebst du genau das und lässt die Pointe stehen. Um eine Zielzahl bei den Wiederholungsmustern zu erreichen, opferst du keine „zündet“-Zeile. Nenne lieber die Zahl, die übrig bleibt.

**3. Der kleinste Eingriff, der den Fund behebt.** Kein Umformulieren nebenbei, keine neuen Gags an Stellen ohne Fund, kein Aufräumen von Code, den kein Fund betrifft. Zeilen-IDs werden nie umnummeriert, weil Übersetzung, Vertonung und Spieldaten daran hängen.

**4. Ton und Humor gehören Sebastian.** Die Alternativen im Bericht sind der erste Griff. Nimm die, die am besten zur Szene, zur Figur und zur Zeile danach passt. Passt keine, schreib eine eigene im selben Stil. Prüfe jede neue Zeile gegen die Mustertabelle in Abschnitt C und gegen Abschnitt E, damit kein neues „Das ist kein X, das ist Y“, kein „entweder oder“, kein Füllwort, kein Schulvergleich und kein Sich-klein-Machen hineinkommt. Eine neue Zeile ist lieber kürzer als die alte.

**5. Entscheide und halte es fest, statt zu fragen.** Sebastian liest das Ergebnis später. Wo der Bericht einen klaren Vorschlag macht, setzt du ihn um. Wo er zwei Wege offen lässt („eine Fassung wählen“, „je Paar entscheiden“), nimmst du den Weg, der weniger bestehende Zeilen ändert und zu `docs/entscheidungen.md` passt, und markierst ihn als „Entscheidung, bitte prüfen“. Wo der Bericht schreibt, etwas könne Absicht sein, änderst du nichts und setzt den Punkt auf die Liste für Sebastian.

## Umgang mit den einzelnen Bereichen

- **Code und Werkzeuge (Abschnitt N).** Behebe die Ursache und nicht nur das Symptom. Für die drei kritischen Fehler schreibst du je einen Test, der über die echte Bedienung läuft und vor deiner Änderung fehlschlägt. Ändern sich Bildschirme absichtlich, erneuerst du nur die betroffenen Referenzbilder.
- **Rätseltexte (Abschnitt J).** Nach jeder Änderung prüfst du, ob Rätsel-Datei, Hinweise aller drei Stufen und Skript noch dasselbe sagen.
- **Humor, Anspielungen, KI-Klang (Abschnitte C, D, E).** Bearbeite nur Tabellenzeilen mit „mittel“ oder „zündet nicht“, die Streichliste in D, die Liste der doppelten Gags und die Zitate in E. Zähle die Muster aus der Tabelle in C vorher und nachher und nenne beide Zahlen.
- **Recht (Abschnitt M).** Ersetze die Zeilen mit Originalwortlaut durch eigene Sätze. Figuren benennst du nicht um. Fernere Namen und alles, was eine Fachperson prüfen muss, kommen auf die Liste für Sebastian.
- **Grafik (Abschnitt G).** Du erzeugst keine Bilder. Du berichtigst Prompts, Bausteine, Größenangaben und das Werkzeug `tools/prompts_zusammensetzen.py` und übernimmst die verbesserten Prompts aus dem Bericht. Gestalterische Festlegungen ohne fertigen Vorschlag, etwa die gemeinsame Palette, bereitest du nur vor.
- **Ton (Abschnitt H).** Es gibt keine Audiodateien. Du berichtigst die Prompts und Angaben in `docs/04-audio.md`.
- **Dokumente (Abschnitt I).** Veraltete Angaben ziehst du auf den heutigen Stand. Erfinde keine Termine, Kosten oder Stundenzahlen.
- **Englisch.** Für jede geänderte deutsche Zeile ziehst du die englische Fassung über `tools/en_eintragen.py` nach. Eine Prüfung der ganzen englischen Fassung gehört nicht zum Auftrag.

## Arbeitspakete

1. Die drei kritischen Fehler (Fundliste 1 bis 3) mit Tests.
2. Werkzeuge, damit solche Fehler nicht wiederkommen (Abschnitt N, dazu `zeilen_einfuegen.py` und `prompts_zusammensetzen.py`). Dieses Paket kommt vor allen Textpaketen, weil du die Werkzeuge danach brauchst.
3. Rätseltexte und Hinweis-Lücken (Abschnitt J und K).
4. Widersprüche (Tabelle in der Story-Bibel, Abschnitte A, B und L).
5. Zeilen mit Originalwortlaut (Abschnitt M).
6. Humor, Anspielungen und KI-Klang (Abschnitte C, D, E), eine Skriptdatei nach der anderen, beginnend mit Prolog und Welt 1.
7. Grafik-Dokumente und Prompts (Abschnitte F und G).
8. Audio-Dokument (Abschnitt H).
9. Übrige Dokumente, Bedienung und Oberflächentexte (Abschnitte I, K, N).

Jeder Fund der Fundliste gehört zu genau einem Paket. Funde mit der Schwere „offen“ kannst du nicht bearbeiten, sie kommen auf die Liste für Sebastian.

## Prüfen, sichern, abgeben

- Vor jedem Commit laufen `python3 tools/pruefen.py` und alle Läufe aus `.github/workflows/pruefen.yml`. Vorher erzeugst du die abgeleiteten Dateien neu, indem du dieselben Werkzeuge ohne `--pruefen` startest. Nach Änderungen am Code laufen auch die Godot-Tests aus derselben Datei. Du gibst nichts ab, was rot ist, und du schaltest keinen Test ab, um grün zu werden.
- Ein Commit je Arbeitspaket, bei Paket 6 einer je Skriptdatei. Schieb nach jedem Paket auf deinen Arbeitszweig. Am Ende öffnest du einen Pull Request gegen `main` und führst ihn nicht selbst zusammen.
- Führe das Protokoll `pruefung/umsetzung.md` von Anfang an mit, mit einem kurzen Stand ganz oben, damit die Arbeit nach einer Unterbrechung weitergehen kann. Es enthält:
  1. eine Tabelle über alle 111 Funde: Nr. | Status (umgesetzt, nicht bestätigt, Entscheidung bitte prüfen, offen für Sebastian) | was geändert wurde und wo,
  2. je Skriptdatei eine Tabelle aller geänderten Zeilen: Zeilen-ID | vorher | nachher | Grund mit Verweis auf den Bericht,
  3. die Musterzahlen vorher und nachher,
  4. die Liste für Sebastian: alles, was nur er entscheiden oder tun kann (Bilder neu erzeugen, Handskizzen, Palette, Ton, rechtliche Prüfung, Test mit fremden Spielern).
- Schlusskontrolle: Geh den gesamten Unterschied zum Ausgangsstand durch. Jede geänderte Skriptzeile muss im Protokoll mit einem Fund stehen. Eine Änderung ohne Fund nimmst du zurück. Prüfe auch, dass jede Stelle aus Abschnitt 4 des Berichts noch wortgleich im Skript steht. Wo ein Fund eine dieser Stellen berührt hat, nennst du das ausdrücklich.

Arbeite den vereinbarten Umfang ganz durch. Wenn etwas nicht geht, such einen anderen Weg und vermerke es. Frag nur, wenn du wirklich nicht weiterkommst. Schreib Protokoll und Abschlussmeldung auf Deutsch, in kurzen klaren Sätzen, das Wichtigste zuerst.
