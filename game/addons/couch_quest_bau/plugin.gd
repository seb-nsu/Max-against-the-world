@tool
extends EditorPlugin
## Couch Quest Bau: legt Popochiu-Objekte aus den Bauplänen an.
##
## Tut im normalen Editor nichts. Nur mit dem Benutzer-Argument „--cq-bauen“ baut es nach dem
## Laden des Editors alle Baupläne (res://daten/raeume/*.json, erzeugt von
## tools/godot_raeume.py) und beendet den Editor wieder:
##
##   godot --headless --editor --path game -- --cq-bauen
##
## Es benutzt Popochius eigene Factories (addons/popochiu/editor/factories), also entstehen
## dieselben Dateien wie beim Anlegen über das Popochiu-Dock. Bestehende Objekte werden nie
## überschrieben (siehe bauer.gd).


func _enter_tree() -> void:
	if "--cq-bauen" in OS.get_cmdline_user_args():
		_starten.call_deferred()


func _starten() -> void:
	var tree := get_tree()
	# Popochiu richtet sein Dock und die Autoloads in den ersten Frames ein.
	for i in 30:
		await tree.process_frame
	while EditorInterface.get_resource_filesystem().is_scanning():
		await tree.process_frame

	var bauer = preload("res://addons/couch_quest_bau/bauer.gd").new()
	var fehler: int = await bauer.bauen()

	# Dateisystem neu einlesen, damit Uids und Importe für neue Dateien entstehen.
	EditorInterface.get_resource_filesystem().scan()
	for i in 10:
		await tree.process_frame
	while EditorInterface.get_resource_filesystem().is_scanning():
		await tree.process_frame

	print("[CQ-Bau] fertig, %d Fehler" % fehler)
	tree.quit(1 if fehler > 0 else 0)
