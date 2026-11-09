@tool
extends "simple_click_settings_popup.gd"
## Couch Quest: Im Testbuild zwei Einträge für die Telemetrie (03-produktion.md, A9): ein
## Schalter für die Zustimmung und „Telemetrie-Ordner öffnen“, damit Tester die Datei schicken.


func _ready() -> void:
	super()
	if Engine.is_editor_hint() or not Telemetrie.testbuild:
		return
	var links := get_node_or_null("Overlay/PanelContainer/VBoxContainer/BodyContainer/LeftContainer")
	if not links:
		return
	var an := CheckButton.new()
	an.text = tr("UI_TELEMETRIE_SCHALTER")
	an.button_pressed = Telemetrie.einwilligung() == 1
	an.toggled.connect(Telemetrie.einwilligung_setzen)
	links.add_child(an)
	var ordner := Button.new()
	ordner.text = tr("UI_TELEMETRIE_ORDNER")
	ordner.pressed.connect(Telemetrie.ordner_oeffnen)
	links.add_child(ordner)
