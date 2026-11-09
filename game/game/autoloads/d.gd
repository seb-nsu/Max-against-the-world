@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDOpa := preload("res://game/dialogs/opa/dialog_opa.gd")
const PDPixel := preload("res://game/dialogs/pixel/dialog_pixel.gd")
# ---- classes

# nodes ----
var Opa: PDOpa : get = get_Opa
var Pixel: PDPixel : get = get_Pixel
# ---- nodes

# functions ----
func get_Opa() -> PDOpa: return get_instance("Opa")
func get_Pixel() -> PDPixel: return get_instance("Pixel")
# ---- functions

