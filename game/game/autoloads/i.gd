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
const PIILeuchtpilz := preload("res://game/inventory_items/leuchtpilz/inventory_item_leuchtpilz.gd")
const PIIHinweiszettel := preload("res://game/inventory_items/hinweiszettel/inventory_item_hinweiszettel.gd")
const PIIFlasche := preload("res://game/inventory_items/flasche/inventory_item_flasche.gd")
const PIILeuchttrank := preload("res://game/inventory_items/leuchttrank/inventory_item_leuchttrank.gd")
const PIIZeugnis := preload("res://game/inventory_items/zeugnis/inventory_item_zeugnis.gd")
const PIIZauberbohne := preload("res://game/inventory_items/zauberbohne/inventory_item_zauberbohne.gd")
const PIIKetchup := preload("res://game/inventory_items/ketchup/inventory_item_ketchup.gd")
const PIITarifvertrag := preload("res://game/inventory_items/tarifvertrag/inventory_item_tarifvertrag.gd")
const PIISchwerterBuendel := preload("res://game/inventory_items/schwerter_buendel/inventory_item_schwerter_buendel.gd")
const PIIFackelBuendel := preload("res://game/inventory_items/fackel_buendel/inventory_item_fackel_buendel.gd")
const PIIKronleuchter := preload("res://game/inventory_items/kronleuchter/inventory_item_kronleuchter.gd")
const PIIDrachenei := preload("res://game/inventory_items/drachenei/inventory_item_drachenei.gd")
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
var Leuchtpilz: PIILeuchtpilz : get = get_Leuchtpilz
var Hinweiszettel: PIIHinweiszettel : get = get_Hinweiszettel
var Flasche: PIIFlasche : get = get_Flasche
var Leuchttrank: PIILeuchttrank : get = get_Leuchttrank
var Zeugnis: PIIZeugnis : get = get_Zeugnis
var Zauberbohne: PIIZauberbohne : get = get_Zauberbohne
var Ketchup: PIIKetchup : get = get_Ketchup
var Tarifvertrag: PIITarifvertrag : get = get_Tarifvertrag
var SchwerterBuendel: PIISchwerterBuendel : get = get_SchwerterBuendel
var FackelBuendel: PIIFackelBuendel : get = get_FackelBuendel
var Kronleuchter: PIIKronleuchter : get = get_Kronleuchter
var Drachenei: PIIDrachenei : get = get_Drachenei
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
func get_Leuchtpilz() -> PIILeuchtpilz: return get_item_instance("Leuchtpilz")
func get_Hinweiszettel() -> PIIHinweiszettel: return get_item_instance("Hinweiszettel")
func get_Flasche() -> PIIFlasche: return get_item_instance("Flasche")
func get_Leuchttrank() -> PIILeuchttrank: return get_item_instance("Leuchttrank")
func get_Zeugnis() -> PIIZeugnis: return get_item_instance("Zeugnis")
func get_Zauberbohne() -> PIIZauberbohne: return get_item_instance("Zauberbohne")
func get_Ketchup() -> PIIKetchup: return get_item_instance("Ketchup")
func get_Tarifvertrag() -> PIITarifvertrag: return get_item_instance("Tarifvertrag")
func get_SchwerterBuendel() -> PIISchwerterBuendel: return get_item_instance("SchwerterBuendel")
func get_FackelBuendel() -> PIIFackelBuendel: return get_item_instance("FackelBuendel")
func get_Kronleuchter() -> PIIKronleuchter: return get_item_instance("Kronleuchter")
func get_Drachenei() -> PIIDrachenei: return get_item_instance("Drachenei")
# ---- functions

