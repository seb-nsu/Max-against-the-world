@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMax := preload("res://game/characters/max/character_max.gd")
const PCPixel := preload("res://game/characters/pixel/character_pixel.gd")
const PCOpa := preload("res://game/characters/opa/character_opa.gd")
# ---- classes

# nodes ----
var Max: PCMax : get = get_Max
var Pixel: PCPixel : get = get_Pixel
var Opa: PCOpa : get = get_Opa
# ---- nodes

# functions ----
func get_Max() -> PCMax: return get_runtime_character("Max")
func get_Pixel() -> PCPixel: return get_runtime_character("Pixel")
func get_Opa() -> PCOpa: return get_runtime_character("Opa")
# ---- functions

