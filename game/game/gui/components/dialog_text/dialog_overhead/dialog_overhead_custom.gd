extends "dialog_overhead.gd"
## Sprechblase über der Figur. Mit der Farbenblind-Hilfe (Optionen, Barrierefreiheit) steht der
## Name der Figur vor dem Text: Wer spricht, zeigt sonst nur die Farbe der Schrift. Der Verlauf
## nennt den Namen ohnehin und bekommt den Text deshalb unverändert (Popochiu.add_history).


func _show_dialogue(chr: PopochiuCharacter, msg := "") -> void:
	super(chr, CQEffekte.mit_sprecher(tr(chr.description), msg))
