@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIThunfischdose := preload("res://game/inventory_items/thunfischdose/inventory_item_thunfischdose.gd")
const PIIDosenoeffner := preload("res://game/inventory_items/dosenoeffner/inventory_item_dosenoeffner.gd")
const PIIDrahtkleiderbuegel := preload("res://game/inventory_items/drahtkleiderbuegel/inventory_item_drahtkleiderbuegel.gd")
const PIIReisetasche := preload("res://game/inventory_items/reisetasche/inventory_item_reisetasche.gd")
const PIINotizbuch := preload("res://game/inventory_items/notizbuch/inventory_item_notizbuch.gd")
const PIIOpasZettel := preload("res://game/inventory_items/opas_zettel/inventory_item_opas_zettel.gd")
const PIIGoldmuenze := preload("res://game/inventory_items/goldmuenze/inventory_item_goldmuenze.gd")
const PIIKaesefondue := preload("res://game/inventory_items/kaesefondue/inventory_item_kaesefondue.gd")
const PIIKochloeffel := preload("res://game/inventory_items/kochloeffel/inventory_item_kochloeffel.gd")
const PIISocke := preload("res://game/inventory_items/socke/inventory_item_socke.gd")
const PIIZiegenfellVorleger := preload("res://game/inventory_items/ziegenfell_vorleger/inventory_item_ziegenfell_vorleger.gd")
const PIIBestellzettel := preload("res://game/inventory_items/bestellzettel/inventory_item_bestellzettel.gd")
const PIISteckbrief := preload("res://game/inventory_items/steckbrief/inventory_item_steckbrief.gd")
const PIIEimer := preload("res://game/inventory_items/eimer/inventory_item_eimer.gd")
const PIIKrug := preload("res://game/inventory_items/krug/inventory_item_krug.gd")
const PIIPixelFeld := preload("res://game/inventory_items/pixel_feld/inventory_item_pixel_feld.gd")
# ---- classes

# nodes ----
var Thunfischdose: PIIThunfischdose : get = get_Thunfischdose
var Dosenoeffner: PIIDosenoeffner : get = get_Dosenoeffner
var Drahtkleiderbuegel: PIIDrahtkleiderbuegel : get = get_Drahtkleiderbuegel
var Reisetasche: PIIReisetasche : get = get_Reisetasche
var Notizbuch: PIINotizbuch : get = get_Notizbuch
var OpasZettel: PIIOpasZettel : get = get_OpasZettel
var Goldmuenze: PIIGoldmuenze : get = get_Goldmuenze
var Kaesefondue: PIIKaesefondue : get = get_Kaesefondue
var Kochloeffel: PIIKochloeffel : get = get_Kochloeffel
var Socke: PIISocke : get = get_Socke
var ZiegenfellVorleger: PIIZiegenfellVorleger : get = get_ZiegenfellVorleger
var Bestellzettel: PIIBestellzettel : get = get_Bestellzettel
var Steckbrief: PIISteckbrief : get = get_Steckbrief
var Eimer: PIIEimer : get = get_Eimer
var Krug: PIIKrug : get = get_Krug
var PixelFeld: PIIPixelFeld : get = get_PixelFeld
# ---- nodes

# functions ----
func get_Thunfischdose() -> PIIThunfischdose: return get_item_instance("Thunfischdose")
func get_Dosenoeffner() -> PIIDosenoeffner: return get_item_instance("Dosenoeffner")
func get_Drahtkleiderbuegel() -> PIIDrahtkleiderbuegel: return get_item_instance("Drahtkleiderbuegel")
func get_Reisetasche() -> PIIReisetasche: return get_item_instance("Reisetasche")
func get_Notizbuch() -> PIINotizbuch: return get_item_instance("Notizbuch")
func get_OpasZettel() -> PIIOpasZettel: return get_item_instance("OpasZettel")
func get_Goldmuenze() -> PIIGoldmuenze: return get_item_instance("Goldmuenze")
func get_Kaesefondue() -> PIIKaesefondue: return get_item_instance("Kaesefondue")
func get_Kochloeffel() -> PIIKochloeffel: return get_item_instance("Kochloeffel")
func get_Socke() -> PIISocke: return get_item_instance("Socke")
func get_ZiegenfellVorleger() -> PIIZiegenfellVorleger: return get_item_instance("ZiegenfellVorleger")
func get_Bestellzettel() -> PIIBestellzettel: return get_item_instance("Bestellzettel")
func get_Steckbrief() -> PIISteckbrief: return get_item_instance("Steckbrief")
func get_Eimer() -> PIIEimer: return get_item_instance("Eimer")
func get_Krug() -> PIIKrug: return get_item_instance("Krug")
func get_PixelFeld() -> PIIPixelFeld: return get_item_instance("PixelFeld")
# ---- functions

