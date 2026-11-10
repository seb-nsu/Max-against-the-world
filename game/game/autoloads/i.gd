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
const PIIHandy := preload("res://game/inventory_items/handy/inventory_item_handy.gd")
const PIIKaugummi := preload("res://game/inventory_items/kaugummi/inventory_item_kaugummi.gd")
const PIIKugelschreiber := preload("res://game/inventory_items/kugelschreiber/inventory_item_kugelschreiber.gd")
const PIIPapyrusblatt := preload("res://game/inventory_items/papyrusblatt/inventory_item_papyrusblatt.gd")
const PIIOpasPapyrus := preload("res://game/inventory_items/opas_papyrus/inventory_item_opas_papyrus.gd")
const PIIBildtafel := preload("res://game/inventory_items/bildtafel/inventory_item_bildtafel.gd")
const PIIPharaonenteller := preload("res://game/inventory_items/pharaonenteller/inventory_item_pharaonenteller.gd")
const PIIBrot := preload("res://game/inventory_items/brot/inventory_item_brot.gd")
const PIIDatteln := preload("res://game/inventory_items/datteln/inventory_item_datteln.gd")
const PIIZwiebel := preload("res://game/inventory_items/zwiebel/inventory_item_zwiebel.gd")
const PIIFladen := preload("res://game/inventory_items/fladen/inventory_item_fladen.gd")
const PIIOlivenoel := preload("res://game/inventory_items/olivenoel/inventory_item_olivenoel.gd")
const PIITraubensaft := preload("res://game/inventory_items/traubensaft/inventory_item_traubensaft.gd")
const PIITintenfass := preload("res://game/inventory_items/tintenfass/inventory_item_tintenfass.gd")
const PIIWaage := preload("res://game/inventory_items/waage/inventory_item_waage.gd")
const PIIMessbecher := preload("res://game/inventory_items/messbecher/inventory_item_messbecher.gd")
const PIIKrone := preload("res://game/inventory_items/krone/inventory_item_krone.gd")
const PIIGoldbarren := preload("res://game/inventory_items/goldbarren/inventory_item_goldbarren.gd")
const PIIBrennspiegel := preload("res://game/inventory_items/brennspiegel/inventory_item_brennspiegel.gd")
const PIIEssigkrug := preload("res://game/inventory_items/essigkrug/inventory_item_essigkrug.gd")
const PIIEntwurf := preload("res://game/inventory_items/entwurf/inventory_item_entwurf.gd")
const PIIGrabstein := preload("res://game/inventory_items/grabstein/inventory_item_grabstein.gd")
const PIIHaufen := preload("res://game/inventory_items/haufen/inventory_item_haufen.gd")
const PIILeeresFormular := preload("res://game/inventory_items/leeres_formular/inventory_item_leeres_formular.gd")
const PIIRundschreiben := preload("res://game/inventory_items/rundschreiben/inventory_item_rundschreiben.gd")
const PIIEmpfehlungsschreiben := preload("res://game/inventory_items/empfehlungsschreiben/inventory_item_empfehlungsschreiben.gd")
const PIIStartpass := preload("res://game/inventory_items/startpass/inventory_item_startpass.gd")
const PIISandalen := preload("res://game/inventory_items/sandalen/inventory_item_sandalen.gd")
const PIIBriansSchild := preload("res://game/inventory_items/brians_schild/inventory_item_brians_schild.gd")
const PIIFeigensetzling := preload("res://game/inventory_items/feigensetzling/inventory_item_feigensetzling.gd")
const PIISchallplatte := preload("res://game/inventory_items/schallplatte/inventory_item_schallplatte.gd")
const PIIWurfscheibe := preload("res://game/inventory_items/wurfscheibe/inventory_item_wurfscheibe.gd")
const PIIDiskus := preload("res://game/inventory_items/diskus/inventory_item_diskus.gd")
const PIISchriftrolle := preload("res://game/inventory_items/schriftrolle/inventory_item_schriftrolle.gd")
const PIIOlivenkranz := preload("res://game/inventory_items/olivenkranz/inventory_item_olivenkranz.gd")
const PIIParadenPlan := preload("res://game/inventory_items/paraden_plan/inventory_item_paraden_plan.gd")
const PIIGoldenerSack := preload("res://game/inventory_items/goldener_sack/inventory_item_goldener_sack.gd")
const PIITelefonbuchseite := preload("res://game/inventory_items/telefonbuchseite/inventory_item_telefonbuchseite.gd")
const PIIRotePastille := preload("res://game/inventory_items/rote_pastille/inventory_item_rote_pastille.gd")
const PIIBlauePastille := preload("res://game/inventory_items/blaue_pastille/inventory_item_blaue_pastille.gd")
const PIIOmasKekse := preload("res://game/inventory_items/omas_kekse/inventory_item_omas_kekse.gd")
const PIIRezeptkarte := preload("res://game/inventory_items/rezeptkarte/inventory_item_rezeptkarte.gd")
const PIIKaffeetasse := preload("res://game/inventory_items/kaffeetasse/inventory_item_kaffeetasse.gd")
const PIISonnenbrille := preload("res://game/inventory_items/sonnenbrille/inventory_item_sonnenbrille.gd")
const PIISchmidtsAkte := preload("res://game/inventory_items/schmidts_akte/inventory_item_schmidts_akte.gd")
const PIIFarbcodeZettel := preload("res://game/inventory_items/farbcode_zettel/inventory_item_farbcode_zettel.gd")
const PIIMorseTabelle := preload("res://game/inventory_items/morse_tabelle/inventory_item_morse_tabelle.gd")
const PIIZugangskarte := preload("res://game/inventory_items/zugangskarte/inventory_item_zugangskarte.gd")
const PIIGummihuhn := preload("res://game/inventory_items/gummihuhn/inventory_item_gummihuhn.gd")
const PIIEnergiezelle := preload("res://game/inventory_items/energiezelle/inventory_item_energiezelle.gd")
const PIIBilligFernbedienung := preload("res://game/inventory_items/billig_fernbedienung/inventory_item_billig_fernbedienung.gd")
const PIITasteUmschalten := preload("res://game/inventory_items/taste_umschalten/inventory_item_taste_umschalten.gd")
const PIITastePause := preload("res://game/inventory_items/taste_pause/inventory_item_taste_pause.gd")
const PIITasteRueckspulen := preload("res://game/inventory_items/taste_rueckspulen/inventory_item_taste_rueckspulen.gd")
const PIITasteStumm := preload("res://game/inventory_items/taste_stumm/inventory_item_taste_stumm.gd")
const PIITasteUntertitel := preload("res://game/inventory_items/taste_untertitel/inventory_item_taste_untertitel.gd")
const PIITasteSendersuchlauf := preload("res://game/inventory_items/taste_sendersuchlauf/inventory_item_taste_sendersuchlauf.gd")
const PIISplitscreenAdapter := preload("res://game/inventory_items/splitscreen_adapter/inventory_item_splitscreen_adapter.gd")
const PIIProgrammzeitschrift := preload("res://game/inventory_items/programmzeitschrift/inventory_item_programmzeitschrift.gd")
const PIIBananenschale := preload("res://game/inventory_items/bananenschale/inventory_item_bananenschale.gd")
const PIIFondueKaese := preload("res://game/inventory_items/fondue_kaese/inventory_item_fondue_kaese.gd")
const PIIBettlaken := preload("res://game/inventory_items/bettlaken/inventory_item_bettlaken.gd")
const PIIDrehbuch := preload("res://game/inventory_items/drehbuch/inventory_item_drehbuch.gd")
const PIIArchivband := preload("res://game/inventory_items/archivband/inventory_item_archivband.gd")
const PIIAmboss := preload("res://game/inventory_items/amboss/inventory_item_amboss.gd")
const PIILichtroehreDeluxe := preload("res://game/inventory_items/lichtroehre_deluxe/inventory_item_lichtroehre_deluxe.gd")
const PIIGoldeneFernbedienung := preload("res://game/inventory_items/goldene_fernbedienung/inventory_item_goldene_fernbedienung.gd")
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
var Handy: PIIHandy : get = get_Handy
var Kaugummi: PIIKaugummi : get = get_Kaugummi
var Kugelschreiber: PIIKugelschreiber : get = get_Kugelschreiber
var Papyrusblatt: PIIPapyrusblatt : get = get_Papyrusblatt
var OpasPapyrus: PIIOpasPapyrus : get = get_OpasPapyrus
var Bildtafel: PIIBildtafel : get = get_Bildtafel
var Pharaonenteller: PIIPharaonenteller : get = get_Pharaonenteller
var Brot: PIIBrot : get = get_Brot
var Datteln: PIIDatteln : get = get_Datteln
var Zwiebel: PIIZwiebel : get = get_Zwiebel
var Fladen: PIIFladen : get = get_Fladen
var Olivenoel: PIIOlivenoel : get = get_Olivenoel
var Traubensaft: PIITraubensaft : get = get_Traubensaft
var Tintenfass: PIITintenfass : get = get_Tintenfass
var Waage: PIIWaage : get = get_Waage
var Messbecher: PIIMessbecher : get = get_Messbecher
var Krone: PIIKrone : get = get_Krone
var Goldbarren: PIIGoldbarren : get = get_Goldbarren
var Brennspiegel: PIIBrennspiegel : get = get_Brennspiegel
var Essigkrug: PIIEssigkrug : get = get_Essigkrug
var Entwurf: PIIEntwurf : get = get_Entwurf
var Grabstein: PIIGrabstein : get = get_Grabstein
var Haufen: PIIHaufen : get = get_Haufen
var LeeresFormular: PIILeeresFormular : get = get_LeeresFormular
var Rundschreiben: PIIRundschreiben : get = get_Rundschreiben
var Empfehlungsschreiben: PIIEmpfehlungsschreiben : get = get_Empfehlungsschreiben
var Startpass: PIIStartpass : get = get_Startpass
var Sandalen: PIISandalen : get = get_Sandalen
var BriansSchild: PIIBriansSchild : get = get_BriansSchild
var Feigensetzling: PIIFeigensetzling : get = get_Feigensetzling
var Schallplatte: PIISchallplatte : get = get_Schallplatte
var Wurfscheibe: PIIWurfscheibe : get = get_Wurfscheibe
var Diskus: PIIDiskus : get = get_Diskus
var Schriftrolle: PIISchriftrolle : get = get_Schriftrolle
var Olivenkranz: PIIOlivenkranz : get = get_Olivenkranz
var ParadenPlan: PIIParadenPlan : get = get_ParadenPlan
var GoldenerSack: PIIGoldenerSack : get = get_GoldenerSack
var Telefonbuchseite: PIITelefonbuchseite : get = get_Telefonbuchseite
var RotePastille: PIIRotePastille : get = get_RotePastille
var BlauePastille: PIIBlauePastille : get = get_BlauePastille
var OmasKekse: PIIOmasKekse : get = get_OmasKekse
var Rezeptkarte: PIIRezeptkarte : get = get_Rezeptkarte
var Kaffeetasse: PIIKaffeetasse : get = get_Kaffeetasse
var Sonnenbrille: PIISonnenbrille : get = get_Sonnenbrille
var SchmidtsAkte: PIISchmidtsAkte : get = get_SchmidtsAkte
var FarbcodeZettel: PIIFarbcodeZettel : get = get_FarbcodeZettel
var MorseTabelle: PIIMorseTabelle : get = get_MorseTabelle
var Zugangskarte: PIIZugangskarte : get = get_Zugangskarte
var Gummihuhn: PIIGummihuhn : get = get_Gummihuhn
var Energiezelle: PIIEnergiezelle : get = get_Energiezelle
var BilligFernbedienung: PIIBilligFernbedienung : get = get_BilligFernbedienung
var TasteUmschalten: PIITasteUmschalten : get = get_TasteUmschalten
var TastePause: PIITastePause : get = get_TastePause
var TasteRueckspulen: PIITasteRueckspulen : get = get_TasteRueckspulen
var TasteStumm: PIITasteStumm : get = get_TasteStumm
var TasteUntertitel: PIITasteUntertitel : get = get_TasteUntertitel
var TasteSendersuchlauf: PIITasteSendersuchlauf : get = get_TasteSendersuchlauf
var SplitscreenAdapter: PIISplitscreenAdapter : get = get_SplitscreenAdapter
var Programmzeitschrift: PIIProgrammzeitschrift : get = get_Programmzeitschrift
var Bananenschale: PIIBananenschale : get = get_Bananenschale
var FondueKaese: PIIFondueKaese : get = get_FondueKaese
var Bettlaken: PIIBettlaken : get = get_Bettlaken
var Drehbuch: PIIDrehbuch : get = get_Drehbuch
var Archivband: PIIArchivband : get = get_Archivband
var Amboss: PIIAmboss : get = get_Amboss
var LichtroehreDeluxe: PIILichtroehreDeluxe : get = get_LichtroehreDeluxe
var GoldeneFernbedienung: PIIGoldeneFernbedienung : get = get_GoldeneFernbedienung
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
func get_Handy() -> PIIHandy: return get_item_instance("Handy")
func get_Kaugummi() -> PIIKaugummi: return get_item_instance("Kaugummi")
func get_Kugelschreiber() -> PIIKugelschreiber: return get_item_instance("Kugelschreiber")
func get_Papyrusblatt() -> PIIPapyrusblatt: return get_item_instance("Papyrusblatt")
func get_OpasPapyrus() -> PIIOpasPapyrus: return get_item_instance("OpasPapyrus")
func get_Bildtafel() -> PIIBildtafel: return get_item_instance("Bildtafel")
func get_Pharaonenteller() -> PIIPharaonenteller: return get_item_instance("Pharaonenteller")
func get_Brot() -> PIIBrot: return get_item_instance("Brot")
func get_Datteln() -> PIIDatteln: return get_item_instance("Datteln")
func get_Zwiebel() -> PIIZwiebel: return get_item_instance("Zwiebel")
func get_Fladen() -> PIIFladen: return get_item_instance("Fladen")
func get_Olivenoel() -> PIIOlivenoel: return get_item_instance("Olivenoel")
func get_Traubensaft() -> PIITraubensaft: return get_item_instance("Traubensaft")
func get_Tintenfass() -> PIITintenfass: return get_item_instance("Tintenfass")
func get_Waage() -> PIIWaage: return get_item_instance("Waage")
func get_Messbecher() -> PIIMessbecher: return get_item_instance("Messbecher")
func get_Krone() -> PIIKrone: return get_item_instance("Krone")
func get_Goldbarren() -> PIIGoldbarren: return get_item_instance("Goldbarren")
func get_Brennspiegel() -> PIIBrennspiegel: return get_item_instance("Brennspiegel")
func get_Essigkrug() -> PIIEssigkrug: return get_item_instance("Essigkrug")
func get_Entwurf() -> PIIEntwurf: return get_item_instance("Entwurf")
func get_Grabstein() -> PIIGrabstein: return get_item_instance("Grabstein")
func get_Haufen() -> PIIHaufen: return get_item_instance("Haufen")
func get_LeeresFormular() -> PIILeeresFormular: return get_item_instance("LeeresFormular")
func get_Rundschreiben() -> PIIRundschreiben: return get_item_instance("Rundschreiben")
func get_Empfehlungsschreiben() -> PIIEmpfehlungsschreiben: return get_item_instance("Empfehlungsschreiben")
func get_Startpass() -> PIIStartpass: return get_item_instance("Startpass")
func get_Sandalen() -> PIISandalen: return get_item_instance("Sandalen")
func get_BriansSchild() -> PIIBriansSchild: return get_item_instance("BriansSchild")
func get_Feigensetzling() -> PIIFeigensetzling: return get_item_instance("Feigensetzling")
func get_Schallplatte() -> PIISchallplatte: return get_item_instance("Schallplatte")
func get_Wurfscheibe() -> PIIWurfscheibe: return get_item_instance("Wurfscheibe")
func get_Diskus() -> PIIDiskus: return get_item_instance("Diskus")
func get_Schriftrolle() -> PIISchriftrolle: return get_item_instance("Schriftrolle")
func get_Olivenkranz() -> PIIOlivenkranz: return get_item_instance("Olivenkranz")
func get_ParadenPlan() -> PIIParadenPlan: return get_item_instance("ParadenPlan")
func get_GoldenerSack() -> PIIGoldenerSack: return get_item_instance("GoldenerSack")
func get_Telefonbuchseite() -> PIITelefonbuchseite: return get_item_instance("Telefonbuchseite")
func get_RotePastille() -> PIIRotePastille: return get_item_instance("RotePastille")
func get_BlauePastille() -> PIIBlauePastille: return get_item_instance("BlauePastille")
func get_OmasKekse() -> PIIOmasKekse: return get_item_instance("OmasKekse")
func get_Rezeptkarte() -> PIIRezeptkarte: return get_item_instance("Rezeptkarte")
func get_Kaffeetasse() -> PIIKaffeetasse: return get_item_instance("Kaffeetasse")
func get_Sonnenbrille() -> PIISonnenbrille: return get_item_instance("Sonnenbrille")
func get_SchmidtsAkte() -> PIISchmidtsAkte: return get_item_instance("SchmidtsAkte")
func get_FarbcodeZettel() -> PIIFarbcodeZettel: return get_item_instance("FarbcodeZettel")
func get_MorseTabelle() -> PIIMorseTabelle: return get_item_instance("MorseTabelle")
func get_Zugangskarte() -> PIIZugangskarte: return get_item_instance("Zugangskarte")
func get_Gummihuhn() -> PIIGummihuhn: return get_item_instance("Gummihuhn")
func get_Energiezelle() -> PIIEnergiezelle: return get_item_instance("Energiezelle")
func get_BilligFernbedienung() -> PIIBilligFernbedienung: return get_item_instance("BilligFernbedienung")
func get_TasteUmschalten() -> PIITasteUmschalten: return get_item_instance("TasteUmschalten")
func get_TastePause() -> PIITastePause: return get_item_instance("TastePause")
func get_TasteRueckspulen() -> PIITasteRueckspulen: return get_item_instance("TasteRueckspulen")
func get_TasteStumm() -> PIITasteStumm: return get_item_instance("TasteStumm")
func get_TasteUntertitel() -> PIITasteUntertitel: return get_item_instance("TasteUntertitel")
func get_TasteSendersuchlauf() -> PIITasteSendersuchlauf: return get_item_instance("TasteSendersuchlauf")
func get_SplitscreenAdapter() -> PIISplitscreenAdapter: return get_item_instance("SplitscreenAdapter")
func get_Programmzeitschrift() -> PIIProgrammzeitschrift: return get_item_instance("Programmzeitschrift")
func get_Bananenschale() -> PIIBananenschale: return get_item_instance("Bananenschale")
func get_FondueKaese() -> PIIFondueKaese: return get_item_instance("FondueKaese")
func get_Bettlaken() -> PIIBettlaken: return get_item_instance("Bettlaken")
func get_Drehbuch() -> PIIDrehbuch: return get_item_instance("Drehbuch")
func get_Archivband() -> PIIArchivband: return get_item_instance("Archivband")
func get_Amboss() -> PIIAmboss: return get_item_instance("Amboss")
func get_LichtroehreDeluxe() -> PIILichtroehreDeluxe: return get_item_instance("LichtroehreDeluxe")
func get_GoldeneFernbedienung() -> PIIGoldeneFernbedienung: return get_item_instance("GoldeneFernbedienung")
# ---- functions

