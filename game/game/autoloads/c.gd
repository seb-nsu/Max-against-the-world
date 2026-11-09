@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMax := preload("res://game/characters/max/character_max.gd")
const PCPixel := preload("res://game/characters/pixel/character_pixel.gd")
const PCOpa := preload("res://game/characters/opa/character_opa.gd")
const PCToadi := preload("res://game/characters/toadi/character_toadi.gd")
const PCAlwin := preload("res://game/characters/alwin/character_alwin.gd")
const PCGollo := preload("res://game/characters/gollo/character_gollo.gd")
const PCHumbert := preload("res://game/characters/humbert/character_humbert.gd")
const PCSchmied := preload("res://game/characters/schmied/character_schmied.gd")
const PCWaldemar := preload("res://game/characters/waldemar/character_waldemar.gd")
const PCStabmacher := preload("res://game/characters/stabmacher/character_stabmacher.gd")
const PCRotkaeppchen := preload("res://game/characters/rotkaeppchen/character_rotkaeppchen.gd")
const PCGrimmzahn := preload("res://game/characters/grimmzahn/character_grimmzahn.gd")
const PCGoblin1 := preload("res://game/characters/goblin_1/character_goblin_1.gd")
const PCGoblin2 := preload("res://game/characters/goblin_2/character_goblin_2.gd")
const PCMinka := preload("res://game/characters/minka/character_minka.gd")
const PCHuhn := preload("res://game/characters/huhn/character_huhn.gd")
const PCSchmiedeZiege := preload("res://game/characters/schmiede_ziege/character_schmiede_ziege.gd")
const PCXxlZiege := preload("res://game/characters/xxl_ziege/character_xxl_ziege.gd")
const PCSchwan := preload("res://game/characters/schwan/character_schwan.gd")
# ---- classes

# nodes ----
var Max: PCMax : get = get_Max
var Pixel: PCPixel : get = get_Pixel
var Opa: PCOpa : get = get_Opa
var Toadi: PCToadi : get = get_Toadi
var Alwin: PCAlwin : get = get_Alwin
var Gollo: PCGollo : get = get_Gollo
var Humbert: PCHumbert : get = get_Humbert
var Schmied: PCSchmied : get = get_Schmied
var Waldemar: PCWaldemar : get = get_Waldemar
var Stabmacher: PCStabmacher : get = get_Stabmacher
var Rotkaeppchen: PCRotkaeppchen : get = get_Rotkaeppchen
var Grimmzahn: PCGrimmzahn : get = get_Grimmzahn
var Goblin1: PCGoblin1 : get = get_Goblin1
var Goblin2: PCGoblin2 : get = get_Goblin2
var Minka: PCMinka : get = get_Minka
var Huhn: PCHuhn : get = get_Huhn
var SchmiedeZiege: PCSchmiedeZiege : get = get_SchmiedeZiege
var XxlZiege: PCXxlZiege : get = get_XxlZiege
var Schwan: PCSchwan : get = get_Schwan
# ---- nodes

# functions ----
func get_Max() -> PCMax: return get_runtime_character("Max")
func get_Pixel() -> PCPixel: return get_runtime_character("Pixel")
func get_Opa() -> PCOpa: return get_runtime_character("Opa")
func get_Toadi() -> PCToadi: return get_runtime_character("Toadi")
func get_Alwin() -> PCAlwin: return get_runtime_character("Alwin")
func get_Gollo() -> PCGollo: return get_runtime_character("Gollo")
func get_Humbert() -> PCHumbert: return get_runtime_character("Humbert")
func get_Schmied() -> PCSchmied: return get_runtime_character("Schmied")
func get_Waldemar() -> PCWaldemar: return get_runtime_character("Waldemar")
func get_Stabmacher() -> PCStabmacher: return get_runtime_character("Stabmacher")
func get_Rotkaeppchen() -> PCRotkaeppchen: return get_runtime_character("Rotkaeppchen")
func get_Grimmzahn() -> PCGrimmzahn: return get_runtime_character("Grimmzahn")
func get_Goblin1() -> PCGoblin1: return get_runtime_character("Goblin1")
func get_Goblin2() -> PCGoblin2: return get_runtime_character("Goblin2")
func get_Minka() -> PCMinka: return get_runtime_character("Minka")
func get_Huhn() -> PCHuhn: return get_runtime_character("Huhn")
func get_SchmiedeZiege() -> PCSchmiedeZiege: return get_runtime_character("SchmiedeZiege")
func get_XxlZiege() -> PCXxlZiege: return get_runtime_character("XxlZiege")
func get_Schwan() -> PCSchwan: return get_runtime_character("Schwan")
# ---- functions

