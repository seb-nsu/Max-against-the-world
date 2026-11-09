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
const PRLuftschloss := preload("res://game/rooms/luftschloss/room_luftschloss.gd")
const PRTurmkeller := preload("res://game/rooms/turmkeller/room_turmkeller.gd")
const PRAbstellkammer1 := preload("res://game/rooms/abstellkammer_1/room_abstellkammer_1.gd")
const PRAbstellkammern := preload("res://game/rooms/abstellkammern/room_abstellkammern.gd")
const PRThronsaal := preload("res://game/rooms/thronsaal/room_thronsaal.gd")
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
var Luftschloss: PRLuftschloss : get = get_Luftschloss
var Turmkeller: PRTurmkeller : get = get_Turmkeller
var Abstellkammer1: PRAbstellkammer1 : get = get_Abstellkammer1
var Abstellkammern: PRAbstellkammern : get = get_Abstellkammern
var Thronsaal: PRThronsaal : get = get_Thronsaal
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
func get_Luftschloss() -> PRLuftschloss: return get_runtime_room("Luftschloss")
func get_Turmkeller() -> PRTurmkeller: return get_runtime_room("Turmkeller")
func get_Abstellkammer1() -> PRAbstellkammer1: return get_runtime_room("Abstellkammer1")
func get_Abstellkammern() -> PRAbstellkammern: return get_runtime_room("Abstellkammern")
func get_Thronsaal() -> PRThronsaal: return get_runtime_room("Thronsaal")
# ---- functions

