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
const PDFaehrmann := preload("res://game/dialogs/faehrmann/dialog_faehrmann.gd")
const PDSteinmetz := preload("res://game/dialogs/steinmetz/dialog_steinmetz.gd")
const PDSchreiber := preload("res://game/dialogs/schreiber/dialog_schreiber.gd")
const PDRamses := preload("res://game/dialogs/ramses/dialog_ramses.gd")
const PDNebet := preload("res://game/dialogs/nebet/dialog_nebet.gd")
const PDSphinxFigur := preload("res://game/dialogs/sphinx_figur/dialog_sphinx_figur.gd")
const PDArchimedes := preload("res://game/dialogs/archimedes/dialog_archimedes.gd")
const PDHieron := preload("res://game/dialogs/hieron/dialog_hieron.gd")
const PDBeamter1 := preload("res://game/dialogs/beamter_1/dialog_beamter_1.gd")
const PDBeamter2 := preload("res://game/dialogs/beamter_2/dialog_beamter_2.gd")
const PDHermes := preload("res://game/dialogs/hermes/dialog_hermes.gd")
const PDCicero := preload("res://game/dialogs/cicero/dialog_cicero.gd")
const PDGrieche := preload("res://game/dialogs/grieche/dialog_grieche.gd")
const PDBrian := preload("res://game/dialogs/brian/dialog_brian.gd")
const PDLeonidas := preload("res://game/dialogs/leonidas/dialog_leonidas.gd")
const PDHerrVier := preload("res://game/dialogs/herr_vier/dialog_herr_vier.gd")
const PDMorphaeus := preload("res://game/dialogs/morphaeus/dialog_morphaeus.gd")
const PDDeckert := preload("res://game/dialogs/deckert/dialog_deckert.gd")
const PDSchmidt := preload("res://game/dialogs/schmidt/dialog_schmidt.gd")
const PDOrakelOma := preload("res://game/dialogs/orakel_oma/dialog_orakel_oma.gd")
const PDKalle := preload("res://game/dialogs/kalle/dialog_kalle.gd")
const PDHausmeister := preload("res://game/dialogs/hausmeister/dialog_hausmeister.gd")
const PDGerdGlueck := preload("res://game/dialogs/gerd_glueck/dialog_gerd_glueck.gd")
const PDSitcomMutter := preload("res://game/dialogs/sitcom_mutter/dialog_sitcom_mutter.gd")
const PDSitcomVater := preload("res://game/dialogs/sitcom_vater/dialog_sitcom_vater.gd")
const PDSitcomSohn := preload("res://game/dialogs/sitcom_sohn/dialog_sitcom_sohn.gd")
const PDKommissar := preload("res://game/dialogs/kommissar/dialog_kommissar.gd")
const PDFbiAgent := preload("res://game/dialogs/fbi_agent/dialog_fbi_agent.gd")
const PDSuperSiegfried := preload("res://game/dialogs/super_siegfried/dialog_super_siegfried.gd")
const PDFledermann := preload("res://game/dialogs/fledermann/dialog_fledermann.gd")
const PDWonderWilma := preload("res://game/dialogs/wonder_wilma/dialog_wonder_wilma.gd")
const PDEmpfangsdame := preload("res://game/dialogs/empfangsdame/dialog_empfangsdame.gd")
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
var Faehrmann: PDFaehrmann : get = get_Faehrmann
var Steinmetz: PDSteinmetz : get = get_Steinmetz
var Schreiber: PDSchreiber : get = get_Schreiber
var Ramses: PDRamses : get = get_Ramses
var Nebet: PDNebet : get = get_Nebet
var SphinxFigur: PDSphinxFigur : get = get_SphinxFigur
var Archimedes: PDArchimedes : get = get_Archimedes
var Hieron: PDHieron : get = get_Hieron
var Beamter1: PDBeamter1 : get = get_Beamter1
var Beamter2: PDBeamter2 : get = get_Beamter2
var Hermes: PDHermes : get = get_Hermes
var Cicero: PDCicero : get = get_Cicero
var Grieche: PDGrieche : get = get_Grieche
var Brian: PDBrian : get = get_Brian
var Leonidas: PDLeonidas : get = get_Leonidas
var HerrVier: PDHerrVier : get = get_HerrVier
var Morphaeus: PDMorphaeus : get = get_Morphaeus
var Deckert: PDDeckert : get = get_Deckert
var Schmidt: PDSchmidt : get = get_Schmidt
var OrakelOma: PDOrakelOma : get = get_OrakelOma
var Kalle: PDKalle : get = get_Kalle
var Hausmeister: PDHausmeister : get = get_Hausmeister
var GerdGlueck: PDGerdGlueck : get = get_GerdGlueck
var SitcomMutter: PDSitcomMutter : get = get_SitcomMutter
var SitcomVater: PDSitcomVater : get = get_SitcomVater
var SitcomSohn: PDSitcomSohn : get = get_SitcomSohn
var Kommissar: PDKommissar : get = get_Kommissar
var FbiAgent: PDFbiAgent : get = get_FbiAgent
var SuperSiegfried: PDSuperSiegfried : get = get_SuperSiegfried
var Fledermann: PDFledermann : get = get_Fledermann
var WonderWilma: PDWonderWilma : get = get_WonderWilma
var Empfangsdame: PDEmpfangsdame : get = get_Empfangsdame
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
func get_Faehrmann() -> PDFaehrmann: return get_instance("Faehrmann")
func get_Steinmetz() -> PDSteinmetz: return get_instance("Steinmetz")
func get_Schreiber() -> PDSchreiber: return get_instance("Schreiber")
func get_Ramses() -> PDRamses: return get_instance("Ramses")
func get_Nebet() -> PDNebet: return get_instance("Nebet")
func get_SphinxFigur() -> PDSphinxFigur: return get_instance("SphinxFigur")
func get_Archimedes() -> PDArchimedes: return get_instance("Archimedes")
func get_Hieron() -> PDHieron: return get_instance("Hieron")
func get_Beamter1() -> PDBeamter1: return get_instance("Beamter1")
func get_Beamter2() -> PDBeamter2: return get_instance("Beamter2")
func get_Hermes() -> PDHermes: return get_instance("Hermes")
func get_Cicero() -> PDCicero: return get_instance("Cicero")
func get_Grieche() -> PDGrieche: return get_instance("Grieche")
func get_Brian() -> PDBrian: return get_instance("Brian")
func get_Leonidas() -> PDLeonidas: return get_instance("Leonidas")
func get_HerrVier() -> PDHerrVier: return get_instance("HerrVier")
func get_Morphaeus() -> PDMorphaeus: return get_instance("Morphaeus")
func get_Deckert() -> PDDeckert: return get_instance("Deckert")
func get_Schmidt() -> PDSchmidt: return get_instance("Schmidt")
func get_OrakelOma() -> PDOrakelOma: return get_instance("OrakelOma")
func get_Kalle() -> PDKalle: return get_instance("Kalle")
func get_Hausmeister() -> PDHausmeister: return get_instance("Hausmeister")
func get_GerdGlueck() -> PDGerdGlueck: return get_instance("GerdGlueck")
func get_SitcomMutter() -> PDSitcomMutter: return get_instance("SitcomMutter")
func get_SitcomVater() -> PDSitcomVater: return get_instance("SitcomVater")
func get_SitcomSohn() -> PDSitcomSohn: return get_instance("SitcomSohn")
func get_Kommissar() -> PDKommissar: return get_instance("Kommissar")
func get_FbiAgent() -> PDFbiAgent: return get_instance("FbiAgent")
func get_SuperSiegfried() -> PDSuperSiegfried: return get_instance("SuperSiegfried")
func get_Fledermann() -> PDFledermann: return get_instance("Fledermann")
func get_WonderWilma() -> PDWonderWilma: return get_instance("WonderWilma")
func get_Empfangsdame() -> PDEmpfangsdame: return get_instance("Empfangsdame")
# ---- functions

