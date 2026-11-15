# Umfärben auf die Spielpalette: Moderwort, Zeldina, Maklerin

Getestet am 15. November 2026 (P15, Aseprite-Durchgang) an Kopien der Sheets; noch nicht auf die Spiel-Sheets angewendet.

- `moderwort.csv`, `zeldina.csv`, `maklerin.csv`: je Zeile alte Farbe, neue Farbe, Notiz. Hauttöne bleiben warm; Moderworts blasses Hautgrün (#bac8af, #969f91) bleibt bewusst außerhalb der Palette.
- Anwenden mit Aseprite: `Aseprite.exe -b --script-param bild=game/grafik/figuren/<figur>.png --script-param karte=tools/palette_figuren/<figur>.csv --script tools/palette_figuren/umfaerben.lua`
- Ohne Aseprite (z. B. in der Cloud) geht dasselbe mit einem kurzen Python-Skript: jede Pixelfarbe, die in der Tabelle steht, durch die neue ersetzen (exakter RGB-Vergleich, Alpha unverändert).
- Nach dem Umfärben die Gesten dieser Figuren nicht neu bauen: die Tabellen gelten für alle Bilder im Sheet.
