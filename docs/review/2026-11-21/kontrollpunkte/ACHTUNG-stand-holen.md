# Achtung bei `stand holen` (Fund R5-P-01, pr-p, 25.11.2026)

Lädt man **in einer laufenden Sitzung** einen Stand, der **älter** ist als der gerade gespielte, bleiben alle Props unsichtbar, die man seit jenem Stand aufgehoben hat, und im Inventar fehlen sie auch (Fehler des Spiels: `ever_collected` wird beim Laden nicht zurückgesetzt; siehe `notizen/pr-p.md`, R5-P-01).

Für die Prüfung heißt das:

- Vor dem Zurückspringen auf einen früheren Kontrollpunkt die Fernsteuerung **neu starten** (`fs stop ORDNER`, `fs start ORDNER tempo=4` ohne `frisch`) und den Stand **im Hauptmenü** holen (`stand holen NAME`). Dann stimmt alles.
- Vorwärts springen (ein späterer Stand, in dem die Gegenstände schon im Inventar oder verbraucht sind) geht ohne Neustart.
- Wer nach einem Rücksprung ohne Neustart „fehlende Gegenstände“ oder „unlösbare Rätsel“ sieht, hat diesen Fund vor sich, keinen neuen.

## Zweite Falle: erstes Gesprächsmenü bei Tempo 4 (Fund R5-P-09, pr-p)

Bei `tempo 4` kann das **erste** Gesprächsmenü einer Programmsitzung über dem oberen Bildrand liegen (unsichtbar; `option N` meldet dann eine Klickstelle mit negativem y und nichts passiert, Esc geht nicht). Abhilfe: vor dem ersten Gespräch einer Sitzung `tempo 1` stellen, Gespräch öffnen, danach wieder `tempo 4`. Ab dem zweiten Gespräch der Sitzung stimmt die Lage. Einzelheiten: `notizen/pr-p.md`, R5-P-09.

## Nachtrag 25.11. (pr-p): verbrauchte Gegenstände tauchen nach dem Laden wieder auf (R5-P-19)

Nach `fs start` und `stand holen` in einem frischen Prozess sind Props von Gegenständen, die schon verbraucht wurden, wieder sichtbar und lassen sich erneut nehmen (gesehen: Drahtkleiderbügel im Schrank trotz Antenne, Teetasse im Wohnzimmer). Das ist ein Spielfehler, kein Fehler der Fernsteuerung. Wer einen Kontrollpunkt holt, sollte solche Gegenstände nicht noch einmal einsammeln, sonst stimmt der weitere Lauf nicht mit einem durchgehenden Spiel überein.
