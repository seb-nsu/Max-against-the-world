# Achtung bei `stand holen` (Fund R5-P-01, pr-p, 25.11.2026)

Lädt man **in einer laufenden Sitzung** einen Stand, der **älter** ist als der gerade gespielte, bleiben alle Props unsichtbar, die man seit jenem Stand aufgehoben hat, und im Inventar fehlen sie auch (Fehler des Spiels: `ever_collected` wird beim Laden nicht zurückgesetzt; siehe `notizen/pr-p.md`, R5-P-01).

Für die Prüfung heißt das:

- Vor dem Zurückspringen auf einen früheren Kontrollpunkt die Fernsteuerung **neu starten** (`fs stop ORDNER`, `fs start ORDNER tempo=4` ohne `frisch`) und den Stand **im Hauptmenü** holen (`stand holen NAME`). Dann stimmt alles.
- Vorwärts springen (ein späterer Stand, in dem die Gegenstände schon im Inventar oder verbraucht sind) geht ohne Neustart.
- Wer nach einem Rücksprung ohne Neustart „fehlende Gegenstände“ oder „unlösbare Rätsel“ sieht, hat diesen Fund vor sich, keinen neuen.
