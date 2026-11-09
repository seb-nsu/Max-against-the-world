@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRWohnzimmer := preload("res://game/rooms/wohnzimmer/room_wohnzimmer.gd")
const PRTreppenhaus := preload("res://game/rooms/treppenhaus/room_treppenhaus.gd")
const PRDachboden := preload("res://game/rooms/dachboden/room_dachboden.gd")
# ---- classes

# nodes ----
var Wohnzimmer: PRWohnzimmer : get = get_Wohnzimmer
var Treppenhaus: PRTreppenhaus : get = get_Treppenhaus
var Dachboden: PRDachboden : get = get_Dachboden
# ---- nodes

# functions ----
func get_Wohnzimmer() -> PRWohnzimmer: return get_runtime_room("Wohnzimmer")
func get_Treppenhaus() -> PRTreppenhaus: return get_runtime_room("Treppenhaus")
func get_Dachboden() -> PRDachboden: return get_runtime_room("Dachboden")
# ---- functions

