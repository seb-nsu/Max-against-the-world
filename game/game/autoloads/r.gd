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
const PRNilDelta := preload("res://game/rooms/nil_delta/room_nil_delta.gd")
const PRThronsaalRamses := preload("res://game/rooms/thronsaal_ramses/room_thronsaal_ramses.gd")
const PRPalastkueche := preload("res://game/rooms/palastkueche/room_palastkueche.gd")
const PRSphinx := preload("res://game/rooms/sphinx/room_sphinx.gd")
const PRFaehrstegOlympia := preload("res://game/rooms/faehrsteg_olympia/room_faehrsteg_olympia.gd")
const PRAgora := preload("res://game/rooms/agora/room_agora.gd")
const PRStartbuero := preload("res://game/rooms/startbuero/room_startbuero.gd")
const PRStadion := preload("res://game/rooms/stadion/room_stadion.gd")
const PRHafenSyrakus := preload("res://game/rooms/hafen_syrakus/room_hafen_syrakus.gd")
const PRWerkstatt := preload("res://game/rooms/werkstatt/room_werkstatt.gd")
const PRGrabhuegel := preload("res://game/rooms/grabhuegel/room_grabhuegel.gd")
const PRUnterstadtStrasse := preload("res://game/rooms/unterstadt_strasse/room_unterstadt_strasse.gd")
const PRApothekengasse := preload("res://game/rooms/apothekengasse/room_apothekengasse.gd")
const PRWiderstandsbasis := preload("res://game/rooms/widerstandsbasis/room_widerstandsbasis.gd")
const PRKuehlung := preload("res://game/rooms/kuehlung/room_kuehlung.gd")
const PRLaboreingang := preload("res://game/rooms/laboreingang/room_laboreingang.gd")
const PRStadtstrasse := preload("res://game/rooms/stadtstrasse/room_stadtstrasse.gd")
const PRKuecheOrakel := preload("res://game/rooms/kueche_orakel/room_kueche_orakel.gd")
const PRBuero50 := preload("res://game/rooms/buero_50/room_buero_50.gd")
const PRTestkammer1 := preload("res://game/rooms/testkammer_1/room_testkammer_1.gd")
const PRTestkammer2 := preload("res://game/rooms/testkammer_2/room_testkammer_2.gd")
const PRTestkammer3 := preload("res://game/rooms/testkammer_3/room_testkammer_3.gd")
const PRKern := preload("res://game/rooms/kern/room_kern.gd")
const PRTestbild := preload("res://game/rooms/testbild/room_testbild.gd")
const PRRauschen := preload("res://game/rooms/rauschen/room_rauschen.gd")
const PRGluecksrad := preload("res://game/rooms/gluecksrad/room_gluecksrad.gd")
const PRSitcomKueche := preload("res://game/rooms/sitcom_kueche/room_sitcom_kueche.gd")
const PRSavanne := preload("res://game/rooms/savanne/room_savanne.gd")
const PRFriedhof := preload("res://game/rooms/friedhof/room_friedhof.gd")
const PRSpukhausKeller := preload("res://game/rooms/spukhaus_keller/room_spukhaus_keller.gd")
const PRSpukhausHalle := preload("res://game/rooms/spukhaus_halle/room_spukhaus_halle.gd")
const PRKapitolis := preload("res://game/rooms/kapitolis/room_kapitolis.gd")
const PRFondueFabrik := preload("res://game/rooms/fondue_fabrik/room_fondue_fabrik.gd")
const PRWerbespotSet := preload("res://game/rooms/werbespot_set/room_werbespot_set.gd")
const PREmpfang := preload("res://game/rooms/empfang/room_empfang.gd")
const PRKellerarchiv := preload("res://game/rooms/kellerarchiv/room_kellerarchiv.gd")
const PRZappmannsStudio := preload("res://game/rooms/zappmanns_studio/room_zappmanns_studio.gd")
const PRSupermarkt := preload("res://game/rooms/supermarkt/room_supermarkt.gd")
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
var NilDelta: PRNilDelta : get = get_NilDelta
var ThronsaalRamses: PRThronsaalRamses : get = get_ThronsaalRamses
var Palastkueche: PRPalastkueche : get = get_Palastkueche
var Sphinx: PRSphinx : get = get_Sphinx
var FaehrstegOlympia: PRFaehrstegOlympia : get = get_FaehrstegOlympia
var Agora: PRAgora : get = get_Agora
var Startbuero: PRStartbuero : get = get_Startbuero
var Stadion: PRStadion : get = get_Stadion
var HafenSyrakus: PRHafenSyrakus : get = get_HafenSyrakus
var Werkstatt: PRWerkstatt : get = get_Werkstatt
var Grabhuegel: PRGrabhuegel : get = get_Grabhuegel
var UnterstadtStrasse: PRUnterstadtStrasse : get = get_UnterstadtStrasse
var Apothekengasse: PRApothekengasse : get = get_Apothekengasse
var Widerstandsbasis: PRWiderstandsbasis : get = get_Widerstandsbasis
var Kuehlung: PRKuehlung : get = get_Kuehlung
var Laboreingang: PRLaboreingang : get = get_Laboreingang
var Stadtstrasse: PRStadtstrasse : get = get_Stadtstrasse
var KuecheOrakel: PRKuecheOrakel : get = get_KuecheOrakel
var Buero50: PRBuero50 : get = get_Buero50
var Testkammer1: PRTestkammer1 : get = get_Testkammer1
var Testkammer2: PRTestkammer2 : get = get_Testkammer2
var Testkammer3: PRTestkammer3 : get = get_Testkammer3
var Kern: PRKern : get = get_Kern
var Testbild: PRTestbild : get = get_Testbild
var Rauschen: PRRauschen : get = get_Rauschen
var Gluecksrad: PRGluecksrad : get = get_Gluecksrad
var SitcomKueche: PRSitcomKueche : get = get_SitcomKueche
var Savanne: PRSavanne : get = get_Savanne
var Friedhof: PRFriedhof : get = get_Friedhof
var SpukhausKeller: PRSpukhausKeller : get = get_SpukhausKeller
var SpukhausHalle: PRSpukhausHalle : get = get_SpukhausHalle
var Kapitolis: PRKapitolis : get = get_Kapitolis
var FondueFabrik: PRFondueFabrik : get = get_FondueFabrik
var WerbespotSet: PRWerbespotSet : get = get_WerbespotSet
var Empfang: PREmpfang : get = get_Empfang
var Kellerarchiv: PRKellerarchiv : get = get_Kellerarchiv
var ZappmannsStudio: PRZappmannsStudio : get = get_ZappmannsStudio
var Supermarkt: PRSupermarkt : get = get_Supermarkt
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
func get_NilDelta() -> PRNilDelta: return get_runtime_room("NilDelta")
func get_ThronsaalRamses() -> PRThronsaalRamses: return get_runtime_room("ThronsaalRamses")
func get_Palastkueche() -> PRPalastkueche: return get_runtime_room("Palastkueche")
func get_Sphinx() -> PRSphinx: return get_runtime_room("Sphinx")
func get_FaehrstegOlympia() -> PRFaehrstegOlympia: return get_runtime_room("FaehrstegOlympia")
func get_Agora() -> PRAgora: return get_runtime_room("Agora")
func get_Startbuero() -> PRStartbuero: return get_runtime_room("Startbuero")
func get_Stadion() -> PRStadion: return get_runtime_room("Stadion")
func get_HafenSyrakus() -> PRHafenSyrakus: return get_runtime_room("HafenSyrakus")
func get_Werkstatt() -> PRWerkstatt: return get_runtime_room("Werkstatt")
func get_Grabhuegel() -> PRGrabhuegel: return get_runtime_room("Grabhuegel")
func get_UnterstadtStrasse() -> PRUnterstadtStrasse: return get_runtime_room("UnterstadtStrasse")
func get_Apothekengasse() -> PRApothekengasse: return get_runtime_room("Apothekengasse")
func get_Widerstandsbasis() -> PRWiderstandsbasis: return get_runtime_room("Widerstandsbasis")
func get_Kuehlung() -> PRKuehlung: return get_runtime_room("Kuehlung")
func get_Laboreingang() -> PRLaboreingang: return get_runtime_room("Laboreingang")
func get_Stadtstrasse() -> PRStadtstrasse: return get_runtime_room("Stadtstrasse")
func get_KuecheOrakel() -> PRKuecheOrakel: return get_runtime_room("KuecheOrakel")
func get_Buero50() -> PRBuero50: return get_runtime_room("Buero50")
func get_Testkammer1() -> PRTestkammer1: return get_runtime_room("Testkammer1")
func get_Testkammer2() -> PRTestkammer2: return get_runtime_room("Testkammer2")
func get_Testkammer3() -> PRTestkammer3: return get_runtime_room("Testkammer3")
func get_Kern() -> PRKern: return get_runtime_room("Kern")
func get_Testbild() -> PRTestbild: return get_runtime_room("Testbild")
func get_Rauschen() -> PRRauschen: return get_runtime_room("Rauschen")
func get_Gluecksrad() -> PRGluecksrad: return get_runtime_room("Gluecksrad")
func get_SitcomKueche() -> PRSitcomKueche: return get_runtime_room("SitcomKueche")
func get_Savanne() -> PRSavanne: return get_runtime_room("Savanne")
func get_Friedhof() -> PRFriedhof: return get_runtime_room("Friedhof")
func get_SpukhausKeller() -> PRSpukhausKeller: return get_runtime_room("SpukhausKeller")
func get_SpukhausHalle() -> PRSpukhausHalle: return get_runtime_room("SpukhausHalle")
func get_Kapitolis() -> PRKapitolis: return get_runtime_room("Kapitolis")
func get_FondueFabrik() -> PRFondueFabrik: return get_runtime_room("FondueFabrik")
func get_WerbespotSet() -> PRWerbespotSet: return get_runtime_room("WerbespotSet")
func get_Empfang() -> PREmpfang: return get_runtime_room("Empfang")
func get_Kellerarchiv() -> PRKellerarchiv: return get_runtime_room("Kellerarchiv")
func get_ZappmannsStudio() -> PRZappmannsStudio: return get_runtime_room("ZappmannsStudio")
func get_Supermarkt() -> PRSupermarkt: return get_runtime_room("Supermarkt")
# ---- functions

