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

## Dritte Falle: Gespräche hängen nach Neustart und Laden (Fund R5-W1-34, pr-w1, 25.11.2026)

Lädt man in einem **frisch gestarteten** Programm einen Stand, in dem ein Gespräch schon einmal geöffnet war, hat dieses Gespräch keine Optionen mehr: Das Spiel bleibt mit leerem Menü stehen (`STEHT … G.blocked=true dialog=<Figur>`), Esc hilft nicht. Das ist ein Fehler des Spiels (`_has_done_init` steht im Speicherstand), kein Fehler der Kontrollpunkte; siehe `notizen/pr-w1.md`, R5-W1-34.

Für die Prüfung heißt das: Nach `fs start` + `stand holen` lassen sich nur Figuren ansprechen, mit denen im gespeicherten Stand noch **nie** geredet wurde. Wer mit einer schon angesprochenen Figur weiterreden muss, lädt den Stand ohne Neustart (dann gilt die erste Falle für aufgehobene Gegenstände) oder spielt von einem früheren Stand bis dorthin.
