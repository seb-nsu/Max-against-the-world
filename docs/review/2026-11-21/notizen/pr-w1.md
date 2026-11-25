# pr-w1: Welt-Prüfer Welt 1 „Schwurbelstein“ (Fortsetzung in der Cloud, ab 25.11.2026)

**Stand: in Arbeit. Wird nach jedem Block ergänzt und gesichert.**

- Rolle: Welt-Prüfer (Durchspieler, Level-, Game-Designer, Technical Artist, Gameplay-Scripter in einem Durchgang). Kürzel `pr-w1`.
- Umfang: Welt 1 vollständig, vom ersten freien Moment auf dem Dorfplatz bis zum ersten freien Moment in Welt 2 (einschließlich Welt-Ende, Übergang, Zwischenspiel 1).
- Geprüfter Commit: `04c5a79f` (Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`).
- Wie geprüft: Fernsteuerung (`werkzeuge/cloud/fs`) ohne Testmodus, echte Klicks. Läufe unter `/home/user/lauf/pr-w1-*`.
- Vorgänger: `gd-w1.md` (Zwischenstand nach R1, R2, R3, R4, R5, R8). Funde werden mit alter ID übernommen und nachgestellt.

(Abschnitte folgen.)

## Zwischenstand (wird am Ende durch die fertigen Abschnitte ersetzt)

Stand: gerader Durchlauf vom echten Prolog-Endstand (`kontrollpunkte/prolog/prolog_ende.json`) bis nach R7 gespielt (R1, R2, R5, R8, R3, R4, R7 gelöst, Wasserschloss und Bergwerk besucht). Kontrollpunkte `w00` bis `w24` liegen unter `kontrollpunkte/welt-1/`.

Stichworte der bisherigen Beobachtungen (Belege folgen in den Tabellen):

- GD-W1-K1 mit echtem Stand bestätigt: nach der Lieferung `C.get_character("Rotkaeppchen").position` = (1270, 290), im Zauberwald (Breite 1066) steht sie dort; `belege/pr-w1/GD-W1-K1_wald_rechter_rand_ohne_rotkaeppchen.png`; Klick auf Ketchup → `W1_WALD_MAX_0730`.
- GD-W1-01 in Tempo 1 bestätigt (5 und 3 Optionen: letzte halb abgeschnitten; 1 Option: Feld zu hoch). GD-W1-03 verschärft: ab 12 Gegenständen liegt das Pixel-Feld unter dem Pixel-Porträt, Klick darauf wechselt die Figur statt den Gegenstand auf Pixel anzuwenden.
- GD-W1-04, -07, -08, -09, -10, -11, -12, -13, -14 bestätigt.
- Neu: XXL-Ziege nur auf einem 29 px breiten Streifen anklickbar; Max und Pixel nach R1c am selben Punkt (247, 264); Ansehen des Eis vor Bertas Flucht sagt „Berta zetert vom Dachbalken“; Leuchtpilz vor Alwin: „Alwin hat … gesagt“; Bestellung vor dem ersten Brückenbesuch: „Der Troll will aber drei“; Waldemar sagt „Ich lese es dir nicht vor“ und liest dann vor; R7-Szene spielt, während die Kamera am Waldeingang steht (in Tempo 1 nachprüfen); Fußbad hinter der XXL-Ziege (nachprüfen).
- Werkzeug: Beim ersten Gespräch eines Prozesses in Tempo 4 lag das Gesprächsmenü außerhalb des Bildes (y −85); in Tempo 1 geöffnet lag es richtig. Erstes Gespräch daher immer in Tempo 1 öffnen.
