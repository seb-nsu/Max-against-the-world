extends SceneTree
## Lädt die Regeln aller Abschnitte (skripte/welt_N.gd, skripte/finale.gd) und meldet Skripte, die nicht kompilieren.
## Die Durchläufe betreten nicht jede Welt; ein Parse-Fehler fiele sonst erst beim Spielen auf.
## Aufruf: godot --headless --path game -s res://tests/regeln_laden.gd


func _initialize() -> void:
	await process_frame  # Autoloads (Spiel, Zustand, Bauplan …) sind jetzt da
	var fehler := 0
	var dir := DirAccess.open("res://skripte")
	for datei in dir.get_files():
		if not ((datei.begins_with("welt_") or datei == "finale.gd") and datei.ends_with(".gd")):
			continue
		var pfad := "res://skripte/" + datei
		var skript: GDScript = load(pfad)
		if skript == null or not skript.can_instantiate():
			print("  FEHLER %s kompiliert nicht" % pfad)
			fehler += 1
			continue
		var r = skript.new()
		if not (r.has_method("ereignis") or r.has_method("figuren_anwenden")):
			print("  FEHLER %s hat weder ereignis() noch figuren_anwenden()" % pfad)
			fehler += 1
			continue
		print("  ok    %s" % pfad)
	print("Regeln: Fehler: %d" % fehler)
	quit(1 if fehler else 0)
