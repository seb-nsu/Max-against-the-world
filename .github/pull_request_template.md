## Was ändert sich

<!-- Kurz: Welt, Räume, Shot-IDs, Werkzeuge. Bei reinen Doku- oder Code-PRs den Abschnitt „Prüftor“ löschen. -->

## Prüftor (Grafik- und Einbau-PRs)

<!-- Nicht Zutreffendes durchstreichen (~~…~~) und kurz begründen, statt es leer zu lassen. -->

- [ ] **Skizze/Rohbau:** Handskizze bzw. Rohbau je Raum liegt unter `docs/grafik/skizzen/<welt>/`, der Raum passt zum Rätsel (Prüftor 0)
- [ ] **Raumaufnahme mit allen Figuren** je Raum angesehen (`game/tests/werkzeuge/raumaufnahme.gd -- <welt>`), Figuren auch redend im Raum
- [ ] **Zeigerraster** ohne Lücken und Überdeckungen (`game/tests/werkzeuge/zeigerraster.gd -- <welt>`)
- [ ] **Klick-Durchlauf** über die echten Klickflächen und Ausgänge gemacht (nicht nur Testmodus)
- [ ] **Screenshot-Referenzen im selben PR** erneuert (Label `referenzen` setzen), Artefakt „referenzen-alt-neu“ angesehen; gewollt geänderte Räume:
  <!-- z. B. welt-3/kuehlung, welt-3/kern. Räume außerhalb der eigenen Welt begründen. -->
- [ ] **Statusliste** der Shot-IDs nachgeführt (eingebaute IDs mit PR-Nummer)
- [ ] **Kosten:** Stückpreis vorher genannt; tatsächlich verbraucht (Gemini-Bilder, Meshy-Credits, Kontostand vorher/nachher):
- [ ] **Abnahme Sebastian** (Satz „mergen, wenn grün“ oder Abnahme im Thread)

## Prüfungen

- [ ] `python3 tools/alles_pruefen.py` lokal grün
- [ ] Pflicht-Checks `dokumente`, `godot`, `bildschirm` grün auf dem Endstand (erst dann mergen bzw. Auto-Merge)
