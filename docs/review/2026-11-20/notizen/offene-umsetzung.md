# Offene Umsetzung (Stand 20.11. abends)

Fertig: AP-01, AP-03, AP-06, AP-08, AP-10, Prompts und Rohbau. AP-04 halb fertig (lokaler Stash in cq-r4 und Patch cq-r4-ap04-zwischenstand.patch). Offen: AP-04 Rest, AP-09 Einbau der 24 neuen Hintergründe (siehe hintergruende-pruefung.md), AP-02, AP-05, AP-07, AP-11.

## Für AP-07 (Texte)
- Texte nach neuen Hintergründen: W3_SIM_MAX_0140 (keine geparkten Autos), W3_SIM_MAX_0320 (nachts Mond), W3_TERM_MAX_0010 (Felder statt Streifen), W3_BAS_MAX_0580 (Fenster oben in der Wand), W3_KAM2_MAX_0020 (vier Strahlen)

## Für AP-11 (Lessons, Doku)
- AP-08: Pixelify 12 hat mehrdeutige Versalien (B, C, E, T, R, Z) und abstehendes a/t; Schrift auf Nahansichten mit eigenen Glyphen setzen, auf schrägen Flächen nicht verzerren sondern Zeilen kursiv verschieben und Buchstaben treppen (Lessons Z. 419 überholt). status-alle-shots W3-N02 Fassung 3.
- AP-06: Gesten-Streifen enthalten den Stand; Stand-Korrektur mit stelle_uebertragen.py in alle Streifen, gemeinsame Lage je Bild. Gehaltene Gegenstände in allen Posen gleich herum.
- AP-06b: beste_lage() suchte ±6 um die Zellunterkante statt um die Fußlinie -> 2 px Versatz; jetzt Prüfung erstes_bild_pruefen(). Pixel-Trab: Schrittweite und Tempo zusammen rechnen (11 px/Zyklus bei 160 px/s = 86 % Rutschen). Quellen-Überlagerung korrektur_20-11/quelle beim Einbau immer mitgeben. Effekt-Sheets auf leere Zeilen prüfen (pruefen.py).
