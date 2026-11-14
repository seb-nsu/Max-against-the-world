extends "dialog_overhead.gd"
## Sprechblase über der Figur. Mit der Farbenblind-Hilfe (Optionen, Barrierefreiheit) steht der
## Name der Figur vor dem Text: Wer spricht, zeigt sonst nur die Farbe der Schrift. Der Verlauf
## nennt den Namen ohnehin und bekommt den Text deshalb unverändert (Popochiu.add_history).


func _show_dialogue(chr: PopochiuCharacter, msg := "") -> void:
	super(chr, CQEffekte.mit_sprecher(tr(chr.description), msg))


## Oben stehen die Porträts von Max und Pixel: Eine Blase beginnt nie höher als OBEN_MIN, sonst
## sind die ersten Wörter verdeckt (Review Prolog und Welt 1, Fund 10).
const OBEN_MIN := 48.0

func _modify_size(msg: String, target_position: Vector2) -> void:
	await super(msg, target_position)
	if rich_text_label.position.y < OBEN_MIN:
		rich_text_label.position.y = minf(OBEN_MIN, maxf(limit_margin, _y_limit - limit_margin - rich_text_label.size.y))
