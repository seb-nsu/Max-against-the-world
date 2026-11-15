extends RefCounted
## Gesten der Welt 2 (Aufbau und Arten wie in gesten_einsatz.gd, das diese Tabellen einliest):
##   ZEILE   Zeilen-ID → [Kürzel der Figur, Bewegung, Art (vor, mit, statt_talk, bleibt)]
##   RUHE    Figur-ID → [{geste, raum, abschnitt, nach, vor}]
##   WARTEN  Figur-ID → [{gesten, abstand: [min, max], halten, raum, abschnitt, nach, vor}]
## Max und Pixel über alle Welten stehen in gesten_einsatz.gd.

const ZEILE := {}

const RUHE := {}

const WARTEN := {}
