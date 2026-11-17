# Review 17.11.2026: Narrative Design (ND)

Rolle: Narrative Designer. Geprüft: Dialoge, Humor, Ton, Verzahnung mit dem Spiel, Timing im Text.
Stand: `main` auf `ae6619c1`, Checkout `C:\Users\sebgr\AppData\Local\Temp\cq-r3`.
Maßgeblich: `game/lokalisierung/texte.csv` (Spalte de), Gesprächsbäume aus `game/daten/raeume/<abschnitt>.json`, Szenen aus `game/skripte/welt_2.gd` und den Raumskripten.

## Messverfahren

- Zählung je Sprechblase (CSV-Zeile; „//“ im Skript ergibt eigene Zeilen `_2`, `_3`).
- Redezeit wie im Spiel: `cq_figur.gd` `redezeit()` = max(0,6 s; Zeichen / 14). NAR-Einblendung: `spiel.gd` `_erzaehlen()` = clamp(Zeichen / 15; 1,6 s; 5,0 s) plus 0,4 s Ein- und Ausblenden.
- Sekundenangaben für Szenen sind Schätzungen allein aus dem Text (ohne Laufwege, Animationen, Klicks zum Weiterschalten).
- Hilfsskript (nicht im Repo): Scratchpad `ana.py`.

### Grundzahlen

| Abschnitt | Zeilen (Blasen) | Ø Zeichen | über 120 | über 140 | NAR-Zeilen |
| --- | --- | --- | --- | --- | --- |
| Prolog (P0) | 333 | 85 | 24 | 0 | 1 |
| Welt 1 (W1) | 1432 | 74 | 65 | 0 | 11 |
| Welt 2 (W2) | 1429 | 80 | 144 | 26 | 31 |

## Funde

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
