@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRWohnzimmer := preload("res://game/rooms/wohnzimmer/room_wohnzimmer.gd")
const PRTreppenhaus := preload("res://game/rooms/treppenhaus/room_treppenhaus.gd")
const PRDachboden := preload("res://game/rooms/dachboden/room_dachboden.gd")
const PRDorfplatz := preload("res://game/rooms/dorfplatz/room_dorfplatz.gd")
const PRTaverne := preload("res://game/rooms/taverne/room_taverne.gd")
const PRSchmiede := preload("res://game/rooms/schmiede/room_schmiede.gd")
const PRZauberstabladen := preload("res://game/rooms/zauberstabladen/room_zauberstabladen.gd")
const PRKlassenzimmer := preload("res://game/rooms/klassenzimmer/room_klassenzimmer.gd")
const PRTrollbruecke := preload("res://game/rooms/trollbruecke/room_trollbruecke.gd")
const PRWasserschloss := preload("res://game/rooms/wasserschloss/room_wasserschloss.gd")
const PRZauberwald := preload("res://game/rooms/zauberwald/room_zauberwald.gd")
const PRBergwerk := preload("res://game/rooms/bergwerk/room_bergwerk.gd")
# ---- classes

# nodes ----
var Wohnzimmer: PRWohnzimmer : get = get_Wohnzimmer
var Treppenhaus: PRTreppenhaus : get = get_Treppenhaus
var Dachboden: PRDachboden : get = get_Dachboden
var Dorfplatz: PRDorfplatz : get = get_Dorfplatz
var Taverne: PRTaverne : get = get_Taverne
var Schmiede: PRSchmiede : get = get_Schmiede
var Zauberstabladen: PRZauberstabladen : get = get_Zauberstabladen
var Klassenzimmer: PRKlassenzimmer : get = get_Klassenzimmer
var Trollbruecke: PRTrollbruecke : get = get_Trollbruecke
var Wasserschloss: PRWasserschloss : get = get_Wasserschloss
var Zauberwald: PRZauberwald : get = get_Zauberwald
var Bergwerk: PRBergwerk : get = get_Bergwerk
# ---- nodes

# functions ----
func get_Wohnzimmer() -> PRWohnzimmer: return get_runtime_room("Wohnzimmer")
func get_Treppenhaus() -> PRTreppenhaus: return get_runtime_room("Treppenhaus")
func get_Dachboden() -> PRDachboden: return get_runtime_room("Dachboden")
func get_Dorfplatz() -> PRDorfplatz: return get_runtime_room("Dorfplatz")
func get_Taverne() -> PRTaverne: return get_runtime_room("Taverne")
func get_Schmiede() -> PRSchmiede: return get_runtime_room("Schmiede")
func get_Zauberstabladen() -> PRZauberstabladen: return get_runtime_room("Zauberstabladen")
func get_Klassenzimmer() -> PRKlassenzimmer: return get_runtime_room("Klassenzimmer")
func get_Trollbruecke() -> PRTrollbruecke: return get_runtime_room("Trollbruecke")
func get_Wasserschloss() -> PRWasserschloss: return get_runtime_room("Wasserschloss")
func get_Zauberwald() -> PRZauberwald: return get_runtime_room("Zauberwald")
func get_Bergwerk() -> PRBergwerk: return get_runtime_room("Bergwerk")
# ---- functions

