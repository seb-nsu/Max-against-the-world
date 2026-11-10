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
const PCZeldina := preload("res://game/characters/zeldina/character_zeldina.gd")
const PCMaklerin := preload("res://game/characters/maklerin/character_maklerin.gd")
const PCModerwort := preload("res://game/characters/moderwort/character_moderwort.gd")
const PCSmaugi := preload("res://game/characters/smaugi/character_smaugi.gd")
const PCFaehrmann := preload("res://game/characters/faehrmann/character_faehrmann.gd")
const PCSobek := preload("res://game/characters/sobek/character_sobek.gd")
const PCSteinmetz := preload("res://game/characters/steinmetz/character_steinmetz.gd")
const PCHermes := preload("res://game/characters/hermes/character_hermes.gd")
const PCRamses := preload("res://game/characters/ramses/character_ramses.gd")
const PCHofkater := preload("res://game/characters/hofkater/character_hofkater.gd")
const PCSchreiber := preload("res://game/characters/schreiber/character_schreiber.gd")
const PCFaecherwedler := preload("res://game/characters/faecherwedler/character_faecherwedler.gd")
const PCNebet := preload("res://game/characters/nebet/character_nebet.gd")
const PCSphinxFigur := preload("res://game/characters/sphinx_figur/character_sphinx_figur.gd")
const PCArchimedes := preload("res://game/characters/archimedes/character_archimedes.gd")
const PCHieron := preload("res://game/characters/hieron/character_hieron.gd")
const PCCicero := preload("res://game/characters/cicero/character_cicero.gd")
const PCTiro := preload("res://game/characters/tiro/character_tiro.gd")
const PCGrieche := preload("res://game/characters/grieche/character_grieche.gd")
const PCTourist := preload("res://game/characters/tourist/character_tourist.gd")
const PCTouristin := preload("res://game/characters/touristin/character_touristin.gd")
const PCPhilosoph := preload("res://game/characters/philosoph/character_philosoph.gd")
const PCBrian := preload("res://game/characters/brian/character_brian.gd")
const PCStrassenmusiker := preload("res://game/characters/strassenmusiker/character_strassenmusiker.gd")
const PCBeamter1 := preload("res://game/characters/beamter_1/character_beamter_1.gd")
const PCBeamter2 := preload("res://game/characters/beamter_2/character_beamter_2.gd")
const PCLeonidas := preload("res://game/characters/leonidas/character_leonidas.gd")
const PCSchildkroete := preload("res://game/characters/schildkroete/character_schildkroete.gd")
const PCZeremonienmeister := preload("res://game/characters/zeremonienmeister/character_zeremonienmeister.gd")
const PCAegypter := preload("res://game/characters/aegypter/character_aegypter.gd")
const PCMorphaeus := preload("res://game/characters/morphaeus/character_morphaeus.gd")
const PCDeckert := preload("res://game/characters/deckert/character_deckert.gd")
const PCHerrVier := preload("res://game/characters/herr_vier/character_herr_vier.gd")
const PCWeinenderMann := preload("res://game/characters/weinender_mann/character_weinender_mann.gd")
const PCFrauRegenschirm := preload("res://game/characters/frau_regenschirm/character_frau_regenschirm.gd")
const PCPastillenautomat := preload("res://game/characters/pastillenautomat/character_pastillenautomat.gd")
const PCKalle := preload("res://game/characters/kalle/character_kalle.gd")
const PCRebellin := preload("res://game/characters/rebellin/character_rebellin.gd")
const PCPiepsi := preload("res://game/characters/piepsi/character_piepsi.gd")
const PCHausmeister := preload("res://game/characters/hausmeister/character_hausmeister.gd")
const PCOrakelOma := preload("res://game/characters/orakel_oma/character_orakel_oma.gd")
const PCRadio := preload("res://game/characters/radio/character_radio.gd")
const PCSchmidt := preload("res://game/characters/schmidt/character_schmidt.gd")
const PCKlon := preload("res://game/characters/klon/character_klon.gd")
const PCTuer := preload("res://game/characters/tuer/character_tuer.gd")
const PCSchwarzeKatze := preload("res://game/characters/schwarze_katze/character_schwarze_katze.gd")
const PCMutti := preload("res://game/characters/mutti/character_mutti.gd")
const PCBernd := preload("res://game/characters/bernd/character_bernd.gd")
const PCPortalgeraetStimme := preload("res://game/characters/portalgeraet_stimme/character_portalgeraet_stimme.gd")
const PCFlimmer := preload("res://game/characters/flimmer/character_flimmer.gd")
const PCNachrichtensprecher := preload("res://game/characters/nachrichtensprecher/character_nachrichtensprecher.gd")
const PCGerdGlueck := preload("res://game/characters/gerd_glueck/character_gerd_glueck.gd")
const PCTroedelExperte := preload("res://game/characters/troedel_experte/character_troedel_experte.gd")
const PCSitcomVater := preload("res://game/characters/sitcom_vater/character_sitcom_vater.gd")
const PCSitcomMutter := preload("res://game/characters/sitcom_mutter/character_sitcom_mutter.gd")
const PCSitcomSohn := preload("res://game/characters/sitcom_sohn/character_sitcom_sohn.gd")
const PCKommissar := preload("res://game/characters/kommissar/character_kommissar.gd")
const PCErzaehler := preload("res://game/characters/erzaehler/character_erzaehler.gd")
const PCLoewe := preload("res://game/characters/loewe/character_loewe.gd")
const PCHyaene := preload("res://game/characters/hyaene/character_hyaene.gd")
const PCGepard := preload("res://game/characters/gepard/character_gepard.gd")
const PCGeier := preload("res://game/characters/geier/character_geier.gd")
const PCNashorn := preload("res://game/characters/nashorn/character_nashorn.gd")
const PCFlamingos := preload("res://game/characters/flamingos/character_flamingos.gd")
const PCZombie := preload("res://game/characters/zombie/character_zombie.gd")
const PCGeist := preload("res://game/characters/geist/character_geist.gd")
const PCFbiAgent := preload("res://game/characters/fbi_agent/character_fbi_agent.gd")
const PCSuperSiegfried := preload("res://game/characters/super_siegfried/character_super_siegfried.gd")
const PCFledermann := preload("res://game/characters/fledermann/character_fledermann.gd")
const PCWonderWilma := preload("res://game/characters/wonder_wilma/character_wonder_wilma.gd")
const PCFabrikarbeiter := preload("res://game/characters/fabrikarbeiter/character_fabrikarbeiter.gd")
const PCDrWerbepause := preload("res://game/characters/dr_werbepause/character_dr_werbepause.gd")
const PCEmpfangsdame := preload("res://game/characters/empfangsdame/character_empfangsdame.gd")
const PCSicherheitsmann := preload("res://game/characters/sicherheitsmann/character_sicherheitsmann.gd")
const PCZappmann := preload("res://game/characters/zappmann/character_zappmann.gd")
const PCJungerZappmann := preload("res://game/characters/junger_zappmann/character_junger_zappmann.gd")
const PCWettkandidat := preload("res://game/characters/wettkandidat/character_wettkandidat.gd")
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
var Zeldina: PCZeldina : get = get_Zeldina
var Maklerin: PCMaklerin : get = get_Maklerin
var Moderwort: PCModerwort : get = get_Moderwort
var Smaugi: PCSmaugi : get = get_Smaugi
var Faehrmann: PCFaehrmann : get = get_Faehrmann
var Sobek: PCSobek : get = get_Sobek
var Steinmetz: PCSteinmetz : get = get_Steinmetz
var Hermes: PCHermes : get = get_Hermes
var Ramses: PCRamses : get = get_Ramses
var Hofkater: PCHofkater : get = get_Hofkater
var Schreiber: PCSchreiber : get = get_Schreiber
var Faecherwedler: PCFaecherwedler : get = get_Faecherwedler
var Nebet: PCNebet : get = get_Nebet
var SphinxFigur: PCSphinxFigur : get = get_SphinxFigur
var Archimedes: PCArchimedes : get = get_Archimedes
var Hieron: PCHieron : get = get_Hieron
var Cicero: PCCicero : get = get_Cicero
var Tiro: PCTiro : get = get_Tiro
var Grieche: PCGrieche : get = get_Grieche
var Tourist: PCTourist : get = get_Tourist
var Touristin: PCTouristin : get = get_Touristin
var Philosoph: PCPhilosoph : get = get_Philosoph
var Brian: PCBrian : get = get_Brian
var Strassenmusiker: PCStrassenmusiker : get = get_Strassenmusiker
var Beamter1: PCBeamter1 : get = get_Beamter1
var Beamter2: PCBeamter2 : get = get_Beamter2
var Leonidas: PCLeonidas : get = get_Leonidas
var Schildkroete: PCSchildkroete : get = get_Schildkroete
var Zeremonienmeister: PCZeremonienmeister : get = get_Zeremonienmeister
var Aegypter: PCAegypter : get = get_Aegypter
var Morphaeus: PCMorphaeus : get = get_Morphaeus
var Deckert: PCDeckert : get = get_Deckert
var HerrVier: PCHerrVier : get = get_HerrVier
var WeinenderMann: PCWeinenderMann : get = get_WeinenderMann
var FrauRegenschirm: PCFrauRegenschirm : get = get_FrauRegenschirm
var Pastillenautomat: PCPastillenautomat : get = get_Pastillenautomat
var Kalle: PCKalle : get = get_Kalle
var Rebellin: PCRebellin : get = get_Rebellin
var Piepsi: PCPiepsi : get = get_Piepsi
var Hausmeister: PCHausmeister : get = get_Hausmeister
var OrakelOma: PCOrakelOma : get = get_OrakelOma
var Radio: PCRadio : get = get_Radio
var Schmidt: PCSchmidt : get = get_Schmidt
var Klon: PCKlon : get = get_Klon
var Tuer: PCTuer : get = get_Tuer
var SchwarzeKatze: PCSchwarzeKatze : get = get_SchwarzeKatze
var Mutti: PCMutti : get = get_Mutti
var Bernd: PCBernd : get = get_Bernd
var PortalgeraetStimme: PCPortalgeraetStimme : get = get_PortalgeraetStimme
var Flimmer: PCFlimmer : get = get_Flimmer
var Nachrichtensprecher: PCNachrichtensprecher : get = get_Nachrichtensprecher
var GerdGlueck: PCGerdGlueck : get = get_GerdGlueck
var TroedelExperte: PCTroedelExperte : get = get_TroedelExperte
var SitcomVater: PCSitcomVater : get = get_SitcomVater
var SitcomMutter: PCSitcomMutter : get = get_SitcomMutter
var SitcomSohn: PCSitcomSohn : get = get_SitcomSohn
var Kommissar: PCKommissar : get = get_Kommissar
var Erzaehler: PCErzaehler : get = get_Erzaehler
var Loewe: PCLoewe : get = get_Loewe
var Hyaene: PCHyaene : get = get_Hyaene
var Gepard: PCGepard : get = get_Gepard
var Geier: PCGeier : get = get_Geier
var Nashorn: PCNashorn : get = get_Nashorn
var Flamingos: PCFlamingos : get = get_Flamingos
var Zombie: PCZombie : get = get_Zombie
var Geist: PCGeist : get = get_Geist
var FbiAgent: PCFbiAgent : get = get_FbiAgent
var SuperSiegfried: PCSuperSiegfried : get = get_SuperSiegfried
var Fledermann: PCFledermann : get = get_Fledermann
var WonderWilma: PCWonderWilma : get = get_WonderWilma
var Fabrikarbeiter: PCFabrikarbeiter : get = get_Fabrikarbeiter
var DrWerbepause: PCDrWerbepause : get = get_DrWerbepause
var Empfangsdame: PCEmpfangsdame : get = get_Empfangsdame
var Sicherheitsmann: PCSicherheitsmann : get = get_Sicherheitsmann
var Zappmann: PCZappmann : get = get_Zappmann
var JungerZappmann: PCJungerZappmann : get = get_JungerZappmann
var Wettkandidat: PCWettkandidat : get = get_Wettkandidat
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
func get_Zeldina() -> PCZeldina: return get_runtime_character("Zeldina")
func get_Maklerin() -> PCMaklerin: return get_runtime_character("Maklerin")
func get_Moderwort() -> PCModerwort: return get_runtime_character("Moderwort")
func get_Smaugi() -> PCSmaugi: return get_runtime_character("Smaugi")
func get_Faehrmann() -> PCFaehrmann: return get_runtime_character("Faehrmann")
func get_Sobek() -> PCSobek: return get_runtime_character("Sobek")
func get_Steinmetz() -> PCSteinmetz: return get_runtime_character("Steinmetz")
func get_Hermes() -> PCHermes: return get_runtime_character("Hermes")
func get_Ramses() -> PCRamses: return get_runtime_character("Ramses")
func get_Hofkater() -> PCHofkater: return get_runtime_character("Hofkater")
func get_Schreiber() -> PCSchreiber: return get_runtime_character("Schreiber")
func get_Faecherwedler() -> PCFaecherwedler: return get_runtime_character("Faecherwedler")
func get_Nebet() -> PCNebet: return get_runtime_character("Nebet")
func get_SphinxFigur() -> PCSphinxFigur: return get_runtime_character("SphinxFigur")
func get_Archimedes() -> PCArchimedes: return get_runtime_character("Archimedes")
func get_Hieron() -> PCHieron: return get_runtime_character("Hieron")
func get_Cicero() -> PCCicero: return get_runtime_character("Cicero")
func get_Tiro() -> PCTiro: return get_runtime_character("Tiro")
func get_Grieche() -> PCGrieche: return get_runtime_character("Grieche")
func get_Tourist() -> PCTourist: return get_runtime_character("Tourist")
func get_Touristin() -> PCTouristin: return get_runtime_character("Touristin")
func get_Philosoph() -> PCPhilosoph: return get_runtime_character("Philosoph")
func get_Brian() -> PCBrian: return get_runtime_character("Brian")
func get_Strassenmusiker() -> PCStrassenmusiker: return get_runtime_character("Strassenmusiker")
func get_Beamter1() -> PCBeamter1: return get_runtime_character("Beamter1")
func get_Beamter2() -> PCBeamter2: return get_runtime_character("Beamter2")
func get_Leonidas() -> PCLeonidas: return get_runtime_character("Leonidas")
func get_Schildkroete() -> PCSchildkroete: return get_runtime_character("Schildkroete")
func get_Zeremonienmeister() -> PCZeremonienmeister: return get_runtime_character("Zeremonienmeister")
func get_Aegypter() -> PCAegypter: return get_runtime_character("Aegypter")
func get_Morphaeus() -> PCMorphaeus: return get_runtime_character("Morphaeus")
func get_Deckert() -> PCDeckert: return get_runtime_character("Deckert")
func get_HerrVier() -> PCHerrVier: return get_runtime_character("HerrVier")
func get_WeinenderMann() -> PCWeinenderMann: return get_runtime_character("WeinenderMann")
func get_FrauRegenschirm() -> PCFrauRegenschirm: return get_runtime_character("FrauRegenschirm")
func get_Pastillenautomat() -> PCPastillenautomat: return get_runtime_character("Pastillenautomat")
func get_Kalle() -> PCKalle: return get_runtime_character("Kalle")
func get_Rebellin() -> PCRebellin: return get_runtime_character("Rebellin")
func get_Piepsi() -> PCPiepsi: return get_runtime_character("Piepsi")
func get_Hausmeister() -> PCHausmeister: return get_runtime_character("Hausmeister")
func get_OrakelOma() -> PCOrakelOma: return get_runtime_character("OrakelOma")
func get_Radio() -> PCRadio: return get_runtime_character("Radio")
func get_Schmidt() -> PCSchmidt: return get_runtime_character("Schmidt")
func get_Klon() -> PCKlon: return get_runtime_character("Klon")
func get_Tuer() -> PCTuer: return get_runtime_character("Tuer")
func get_SchwarzeKatze() -> PCSchwarzeKatze: return get_runtime_character("SchwarzeKatze")
func get_Mutti() -> PCMutti: return get_runtime_character("Mutti")
func get_Bernd() -> PCBernd: return get_runtime_character("Bernd")
func get_PortalgeraetStimme() -> PCPortalgeraetStimme: return get_runtime_character("PortalgeraetStimme")
func get_Flimmer() -> PCFlimmer: return get_runtime_character("Flimmer")
func get_Nachrichtensprecher() -> PCNachrichtensprecher: return get_runtime_character("Nachrichtensprecher")
func get_GerdGlueck() -> PCGerdGlueck: return get_runtime_character("GerdGlueck")
func get_TroedelExperte() -> PCTroedelExperte: return get_runtime_character("TroedelExperte")
func get_SitcomVater() -> PCSitcomVater: return get_runtime_character("SitcomVater")
func get_SitcomMutter() -> PCSitcomMutter: return get_runtime_character("SitcomMutter")
func get_SitcomSohn() -> PCSitcomSohn: return get_runtime_character("SitcomSohn")
func get_Kommissar() -> PCKommissar: return get_runtime_character("Kommissar")
func get_Erzaehler() -> PCErzaehler: return get_runtime_character("Erzaehler")
func get_Loewe() -> PCLoewe: return get_runtime_character("Loewe")
func get_Hyaene() -> PCHyaene: return get_runtime_character("Hyaene")
func get_Gepard() -> PCGepard: return get_runtime_character("Gepard")
func get_Geier() -> PCGeier: return get_runtime_character("Geier")
func get_Nashorn() -> PCNashorn: return get_runtime_character("Nashorn")
func get_Flamingos() -> PCFlamingos: return get_runtime_character("Flamingos")
func get_Zombie() -> PCZombie: return get_runtime_character("Zombie")
func get_Geist() -> PCGeist: return get_runtime_character("Geist")
func get_FbiAgent() -> PCFbiAgent: return get_runtime_character("FbiAgent")
func get_SuperSiegfried() -> PCSuperSiegfried: return get_runtime_character("SuperSiegfried")
func get_Fledermann() -> PCFledermann: return get_runtime_character("Fledermann")
func get_WonderWilma() -> PCWonderWilma: return get_runtime_character("WonderWilma")
func get_Fabrikarbeiter() -> PCFabrikarbeiter: return get_runtime_character("Fabrikarbeiter")
func get_DrWerbepause() -> PCDrWerbepause: return get_runtime_character("DrWerbepause")
func get_Empfangsdame() -> PCEmpfangsdame: return get_runtime_character("Empfangsdame")
func get_Sicherheitsmann() -> PCSicherheitsmann: return get_runtime_character("Sicherheitsmann")
func get_Zappmann() -> PCZappmann: return get_runtime_character("Zappmann")
func get_JungerZappmann() -> PCJungerZappmann: return get_runtime_character("JungerZappmann")
func get_Wettkandidat() -> PCWettkandidat: return get_runtime_character("Wettkandidat")
# ---- functions

