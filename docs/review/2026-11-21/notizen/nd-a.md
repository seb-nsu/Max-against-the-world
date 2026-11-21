# Review 21.11.2026: Narrative Design A (nd-a) – Prolog, Welt 1, Zwischenspiel 1

Rolle: Narrative Designer. Kürzel `nd-a`. Geprüfter Stand: Checkout `cq-r5`, `main` auf `04c5a79f`.
Umfang: Zeilen `P0_` (333), `SYS_` (108), `W1_` (1433), `ZS1_` (110), dazu `UI_` (965), Deutsch und Englisch, aus `game/lokalisierung/texte.csv`.

Arbeitsweise:
- Prüfkatalog: humanizer-de 5.28.4 (SKILL.md, alle 72 Muster in `references/patterns.md`, `de-naturalness.md`, `decision-tables.md`, `register-profiles.md`, `muster-katalog.md`, Checkliste) ganz gelesen, nur als Audit angewandt (Cluster-Regel, Carve-outs für Figurenstimmen). Keine Datei des Spiels geändert.
- Lesefassung je Gruppe mit Sprecher und Regie aus den Skripten: `werkzeuge/nd-a_auszug.py` (schreibt nach `cq-r5-lauf/nd-a-arbeit/`). Abgleich Skript gegen CSV: 1984 Skript-IDs, alle in der CSV, 0 Textabweichungen (Kaskaden „//“ = Folgeschlüssel `_2`, `_3`).
- Zählung per Skript `werkzeuge/nd-a_zaehlen.py`, danach jede Fundstelle gelesen.
- Gelesen wurden bisher: Konzept (`01-konzept.md` ganz), offene Punkte (P10, P11, W3-2), Review 17.11. (`narrative.md`, ND-22 bis ND-24), Review 14.11. (Abschnitt 4 „Witz und Text“, Funde 7, 9, 10, 19, 25, 28), Review 20.11. (`skript-ki-klang.md`, Aufbau).

Hinweis zum Ablauf: Die Arbeit wurde am 21.11. zweimal durch das Nutzungslimit unterbrochen. Ein Versuch, die Zeilenlesung auf vier parallele Helfer zu verteilen, ist daran gescheitert (keine Ergebnisse); alles unten stammt aus der eigenen Lesung.

## Stand und nächste Schritte

(wird nach jedem Block nachgeführt)

- [x] Auftrag, Werkzeug-Liesmich, Rollenbeschreibung, humanizer-de-Katalog gelesen
- [x] Lesefassungen erzeugt, Skript gegen CSV abgeglichen
- [ ] Zählung KI-Muster über `texte.csv` (Skript)
- [ ] KI-Klang Prolog: Zeile für Zeile
- [ ] KI-Klang Zwischenspiel 1
- [ ] KI-Klang Welt 1
- [ ] KI-Klang Systemzeilen
- [ ] Lokalisierung DE/EN (automatische Prüfung + Lesung)
- [ ] Humor, Anspielungen, Bild gegen Text
- [ ] Timing (Text, dann Messung im Spiel)
- [ ] Nahansichten DE/EN
- [ ] Frühere Funde nachprüfen

