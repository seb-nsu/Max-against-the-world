# Sprechanweisungen je Zeile

Eine CSV-Datei je Abschnitt (`P0.csv`, `W1.csv` … `FI.csv`, `SYS.csv`) mit den Spalten
`ID,Betonung,Versuche`. `tools/vertonung.py` liest sie beim Erzeugen; die Prüfung meldet IDs,
die es im Skript nicht mehr gibt.

- **ID:** Zeilen-ID aus dem Skript (gilt für alle Blasen einer Kaskade) oder der Dateiname einer
  einzelnen Blase mit `_2`, `_3`.
- **Betonung:** kurze englische Anweisungen mit Komma, so wie man sie einem Sprecher sagt:
  `bored, sighs`, `whispering`, `triumphant, fast`, `deadpan`, `cracks up at the end`. Englisch,
  weil die Modelle damit am verlässlichsten arbeiten (Prompt-Regel in `04-audio.md`). Leer heißt:
  neutral, auch wenn die Regie-Spalte etwas sagt.
- **Versuche:** wie viele Fassungen erzeugt werden (leer = Standard 1). Pointen bekommen 3, damit
  auf der Hörseite gewählt werden kann.

Zeilen ohne Eintrag bekommen eine Anweisung aus der Regie-Spalte, wenn dort ein bekanntes Wort
steht (flüstert, ruft, seufzt, lacht …, Liste `REGIE_TON` im Werkzeug).

Die Anweisungen entstehen je Abschnitt erst, wenn dessen Review abgeschlossen ist. Ändert sich
eine Zeile danach, meldet `python3 tools/vertonung.py` die Aufnahme als veraltet.
