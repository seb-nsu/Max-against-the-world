class_name CQZombieTanz
extends RefCounted
## Regeln des Zombie-Tanzes (raetsel/welt-4.md, Rätsel 5: Das Zombie-Video), ohne Oberfläche:
## Die Zombies treten auf jeden Schlag. Max tritt dazwischen auf, also gegen den Takt. Jeder
## Gegenschritt bringt einen Punkt Durcheinander, jeder Schritt im Takt nimmt einen weg. Je
## Schlagabstand zählt nur der erste Schritt, damit wildes Klicken nichts bringt. Mit ZIEL Punkten
## liegen die Zombies übereinander. Ist die Runde vorher um, war es ein Fehlversuch.
## Die Oberfläche steht in oberflaeche/minispiel_tanz.gd.
##
## Mit der echten Musik (w4_mitternacht): Tempo nach dem Erzeugen messen und hier als BPM
## eintragen, den Abstand vom Dateianfang bis zum ersten Schlag als VERSATZ (04-audio.md, Tempo
## im Rhythmus-Minispiel). Die Runde startet das Stück dann von vorn.

const BPM := 118.0
## Sekunden vom Anfang des Musikstücks bis zum ersten Schlag
const VERSATZ := 0.0
## Schläge zum Einzählen (zählen nicht), danach die Runde
const EINZAEHLEN := 4
const SCHLAEGE := 24
const ZIEL := 8
## „Gegen den Takt“ ist die Mitte zwischen zwei Schlägen, so weit nach beiden Seiten
## (Anteil des Schlagabstands; 0,25 heißt: die mittlere Hälfte zählt)
const FENSTER := 0.25

var abstand := 60.0 / BPM
var punkte := 0
var gegen := 0
var im_takt := 0
var _letzter := -1


## Dauer der Runde ohne Einzählen (Sekunden)
func dauer() -> float:
	return SCHLAEGE * abstand


## Wo im Schlagabstand liegt der Zeitpunkt t (Sekunden seit dem ersten Schlag der Runde)?
## 0 = auf dem Schlag, 0,5 = genau dazwischen.
func phase(t: float) -> float:
	return fposmod(t / abstand, 1.0)


func ist_gegen(t: float) -> bool:
	return absf(phase(t) - 0.5) <= FENSTER


## Max tritt zur Zeit t auf. "gegen" (Punkt), "takt" (Punkt weg), "doppelt" (zweiter Schritt im
## selben Schlagabstand, zählt nicht) oder "vorbei" (Runde entschieden oder um).
func schritt(t: float) -> String:
	if fertig() or vorbei(t) or t < 0.0:
		return "vorbei"
	var nr := floori(t / abstand)
	if nr == _letzter:
		return "doppelt"
	_letzter = nr
	if ist_gegen(t):
		punkte += 1
		gegen += 1
		return "gegen"
	punkte = maxi(0, punkte - 1)
	im_takt += 1
	return "takt"


func fertig() -> bool:
	return punkte >= ZIEL


func vorbei(t: float) -> bool:
	return t >= dauer()
