@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDOpa := preload("res://game/dialogs/opa/dialog_opa.gd")
const PDPixel := preload("res://game/dialogs/pixel/dialog_pixel.gd")
const PDToadi := preload("res://game/dialogs/toadi/dialog_toadi.gd")
const PDHumbert := preload("res://game/dialogs/humbert/dialog_humbert.gd")
const PDGollo := preload("res://game/dialogs/gollo/dialog_gollo.gd")
const PDSchmied := preload("res://game/dialogs/schmied/dialog_schmied.gd")
const PDStabmacher := preload("res://game/dialogs/stabmacher/dialog_stabmacher.gd")
const PDAlwin := preload("res://game/dialogs/alwin/dialog_alwin.gd")
const PDWaldemar := preload("res://game/dialogs/waldemar/dialog_waldemar.gd")
const PDRotkaeppchen := preload("res://game/dialogs/rotkaeppchen/dialog_rotkaeppchen.gd")
const PDGrimmzahn := preload("res://game/dialogs/grimmzahn/dialog_grimmzahn.gd")
const PDZeldina := preload("res://game/dialogs/zeldina/dialog_zeldina.gd")
const PDMaklerin := preload("res://game/dialogs/maklerin/dialog_maklerin.gd")
const PDSmaugi := preload("res://game/dialogs/smaugi/dialog_smaugi.gd")
# ---- classes

# nodes ----
var Opa: PDOpa : get = get_Opa
var Pixel: PDPixel : get = get_Pixel
var Toadi: PDToadi : get = get_Toadi
var Humbert: PDHumbert : get = get_Humbert
var Gollo: PDGollo : get = get_Gollo
var Schmied: PDSchmied : get = get_Schmied
var Stabmacher: PDStabmacher : get = get_Stabmacher
var Alwin: PDAlwin : get = get_Alwin
var Waldemar: PDWaldemar : get = get_Waldemar
var Rotkaeppchen: PDRotkaeppchen : get = get_Rotkaeppchen
var Grimmzahn: PDGrimmzahn : get = get_Grimmzahn
var Zeldina: PDZeldina : get = get_Zeldina
var Maklerin: PDMaklerin : get = get_Maklerin
var Smaugi: PDSmaugi : get = get_Smaugi
# ---- nodes

# functions ----
func get_Opa() -> PDOpa: return get_instance("Opa")
func get_Pixel() -> PDPixel: return get_instance("Pixel")
func get_Toadi() -> PDToadi: return get_instance("Toadi")
func get_Humbert() -> PDHumbert: return get_instance("Humbert")
func get_Gollo() -> PDGollo: return get_instance("Gollo")
func get_Schmied() -> PDSchmied: return get_instance("Schmied")
func get_Stabmacher() -> PDStabmacher: return get_instance("Stabmacher")
func get_Alwin() -> PDAlwin: return get_instance("Alwin")
func get_Waldemar() -> PDWaldemar: return get_instance("Waldemar")
func get_Rotkaeppchen() -> PDRotkaeppchen: return get_instance("Rotkaeppchen")
func get_Grimmzahn() -> PDGrimmzahn: return get_instance("Grimmzahn")
func get_Zeldina() -> PDZeldina: return get_instance("Zeldina")
func get_Maklerin() -> PDMaklerin: return get_instance("Maklerin")
func get_Smaugi() -> PDSmaugi: return get_instance("Smaugi")
# ---- functions

