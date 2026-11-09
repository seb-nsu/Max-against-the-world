extends Node
## Popochius Globals: hier hängt der Couch-Quest-Zustand am Spielstand.
## Popochiu ruft on_save()/on_load() beim Speichern und Laden (CQSaveLoad, PopochiuSaveLoad).


func on_save() -> Dictionary:
	return Zustand.speichern()


func on_load(data: Dictionary) -> void:
	Zustand.laden(data)
