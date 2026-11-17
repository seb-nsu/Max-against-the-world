# Review 17.11.2026 – Godot Gameplay Scripter (GS)

Sicht: Szenenaufbau, Hotspots, Klickflächen, Z-Sortierung, Trigger. Geprüft `main` auf `ae6619c1` im Checkout `cq-r3`.

**Wie geprüft (Stand: läuft):**
- Klickflächen aller 28 Räume statisch aus `belege/raeume/*_anfang.json` gegen den Bauplan `game/daten/raeume/*.json` (Größe, Lage, Daten gegen Szene).
- Eigenes Prüfskript `game/tests/_review_gs_zeiger.gd` (nicht committet): fährt in jedem Raum mit simulierten Mausbewegungen (echte Physik-Auswahl von Godot, echte Hover-Regel von Popochiu plus `Spiel.zeiger_betritt`) ein 6-px-Raster ab und schreibt auf, welches Objekt an jeder Stelle „hovered“ ist bzw. ob die Oberfläche die Maus schluckt. Auswertung: Anteil der Klickfläche, auf dem das Objekt wirklich gewinnt. Belege `belege/godot/<raum>_anfang_zeiger.png` (Farbe = gewinnendes Objekt, weiß = Oberfläche, Rahmen = Klickpolygon mit Prozentwert).
- Trigger und Szenen aus dem Code gelesen (`welt_2.gd`, `welt_1.gd`, Raumskripte, `cq_raum.gd`, `spiel.gd`).

## Funde

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
|----|------|------|-----------|-----------|--------------|-------|-----------|
