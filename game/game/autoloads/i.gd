@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIThunfischdose := preload("res://game/inventory_items/thunfischdose/inventory_item_thunfischdose.gd")
const PIIDosenoeffner := preload("res://game/inventory_items/dosenoeffner/inventory_item_dosenoeffner.gd")
const PIIDrahtkleiderbuegel := preload("res://game/inventory_items/drahtkleiderbuegel/inventory_item_drahtkleiderbuegel.gd")
const PIIReisetasche := preload("res://game/inventory_items/reisetasche/inventory_item_reisetasche.gd")
const PIINotizbuch := preload("res://game/inventory_items/notizbuch/inventory_item_notizbuch.gd")
const PIIOpasZettel := preload("res://game/inventory_items/opas_zettel/inventory_item_opas_zettel.gd")
# ---- classes

# nodes ----
var Thunfischdose: PIIThunfischdose : get = get_Thunfischdose
var Dosenoeffner: PIIDosenoeffner : get = get_Dosenoeffner
var Drahtkleiderbuegel: PIIDrahtkleiderbuegel : get = get_Drahtkleiderbuegel
var Reisetasche: PIIReisetasche : get = get_Reisetasche
var Notizbuch: PIINotizbuch : get = get_Notizbuch
var OpasZettel: PIIOpasZettel : get = get_OpasZettel
# ---- nodes

# functions ----
func get_Thunfischdose() -> PIIThunfischdose: return get_item_instance("Thunfischdose")
func get_Dosenoeffner() -> PIIDosenoeffner: return get_item_instance("Dosenoeffner")
func get_Drahtkleiderbuegel() -> PIIDrahtkleiderbuegel: return get_item_instance("Drahtkleiderbuegel")
func get_Reisetasche() -> PIIReisetasche: return get_item_instance("Reisetasche")
func get_Notizbuch() -> PIINotizbuch: return get_item_instance("Notizbuch")
func get_OpasZettel() -> PIIOpasZettel: return get_item_instance("OpasZettel")
# ---- functions

