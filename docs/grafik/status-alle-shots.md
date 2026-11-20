# Status aller Shot-IDs (Posen, Bewegungen, Effekte, lebendige Hintergründe)

Stand 15. November 2026, Zweig-Angaben am 17. November auf main nachgeführt (beide Zweige seit 16. November gemergt; Review 17.11., WF-09). Quelle der IDs: die Tabellenzeilen in docs/grafik/fertige-prompts/welt-1.md, welt-2.md, 02-prolog-und-finale.md und 00-weltenuebergreifend.md auf origin/main, genau 233 IDs (W1-P-IDs gibt es nicht). Bilder liegen in `E:\Game Engine\Grafiken\assets` (Pfade relativ dazu, verworfene Fassungen nicht gezählt), gebaute Bewegungen in `assets\runde2\bewegungen\<name>`.

## Zusammenfassung

| Status | Anzahl |
| --- | --- |
| eingebaut, in main (PR #30) | 164 |
| lebendiger Hintergrund: eingebaut, in main (PR #32) | 41 |
| fertig, in main | 11 |
| Effekt: eingebaut, in main (PR #32) | 6 |
| gebaut, wartet auf Sprite | 5 |
| abgedeckt durch andere Bewegung, eingebaut | 3 |
| Effekt: fertig, wartet auf Platz im Raum | 2 |
| lebendiger Hintergrund: fertig, wartet auf Platz im Raum | 1 |
| **gesamt** | **233** |

## Alle IDs

| ID | Titel | Art | Quelle (Bogen/Bild) | Bewegung gebaut | im Spiel | offen: Grund, wer erledigt |
| --- | --- | --- | --- | --- | --- | --- |
| PF-B01 | Pixel: Aufwachen vom Thunfisch | Bewegung | nacht/PF-B01_kater_aufwachen_thunfisch.png (+1 weitere) | pixel_aufwachen | eingebaut, in main (PR #30) |  |
| PF-B02 | Opa: Erklären | Bewegung | nacht/PF-B02_opa_erklaeren.png | opa_erklaeren | eingebaut, in main (PR #30) |  |
| PF-B03 | Opa: Panik | Bewegung | nacht/PF-B03_opa_panik.png | opa_panik | eingebaut, in main (PR #30) |  |
| PF-B04 | Oma: Treppe steigen | Bewegung | runde2/PF-B04_oma_treppe.png (+1 weitere) | oma_treppe_steigen | nicht eingebaut | Bewegung fertig; Oma hat noch kein Spiel-Sprite |
| PF-B05 | Mutter: Liste lesen | Bewegung | runde2/PF-B05_mutter_liste.png | mutter_liste_lesen | nicht eingebaut | Bewegung fertig; Mutter hat noch kein Spiel-Sprite |
| PF-B06 | Zeldina: Zauberstab einsetzen | Bewegung | runde2/PF-B06_zeldina_zauberstab.png | zeldina_zauberstab_einsetzen | nicht eingebaut | Bewegung fertig; Zeldina trägt im Finale einen Umhang, braucht ein eigenes Finale-Sprite |
| PF-B07 | Roboter-Hausmeister: Ofentür halten | Bewegung | runde2/PF-B07_roboter_ofentuer.png | hausmeister_ofentuer_halten | nicht eingebaut | Bewegung fertig; Roboter-Hausmeister hat noch kein Spiel-Sprite |
| PF-B08 | Gegenwart-Effekt: Verwandlung | Effekt | nacht/PF-B08_effekt_verwandlung.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| PF-B09 | Effekt: Maschine läuft | Effekt | runde2/ambiente/PF-B09_effekt_maschine.png | nein | nicht eingebaut | Streifen fertig; der Hintergrund Dachboden (Finale) mit der Maschine fehlt noch |
| PF-B10 | Effekt: Teig-Schwall | Effekt | runde2/ambiente/PF-B10_effekt_teig.png | nein | nicht eingebaut | Streifen fertig; der Hintergrund Dachboden (Finale) mit der Maschine fehlt noch |
| PF-B11 | Effekt: Staubwolke | Effekt | nacht/PF-B11_effekt_staubwolke.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| PF-B12 | Opa: Gehen | Bewegung | runde2/PF-B12_opa_gehen_c.png | nein | in main: opa: walk (Bein-Rig) |  |
| PF-B13 | Opa: Reden | Bewegung | runde2/PF-B13_opa_reden.png | opa_reden | eingebaut, in main (PR #30) |  |
| PF-B14 | Opa: An der Werkbank schrauben | Bewegung | runde2/PF-B14_opa_werkbank.png (+1 weitere) | opa_werkbank | eingebaut, in main (PR #30) |  |
| PF-B15 | Opa: Kopf kratzen | Bewegung | fehlt | opa_kopf_kratzen | eingebaut, in main (PR #30) |  |
| W1-B01 | Toadi: Rennen | Bewegung | nacht/W1-B01_toadi_rennen.png (+5 weitere) | nein | in main: toadi: walk (3D-Rig) |  |
| W1-B02 | Toadi: Keuchen | Bewegung | nacht/W1-B02_toadi_keuchen.png | toadi_keuchen | eingebaut, in main (PR #30) |  |
| W1-B03 | Toadi: Auf Max zeigen | Bewegung | nacht/W1-B03_toadi_zeigen.png | toadi_auf_max_zeigen | eingebaut, in main (PR #30) |  |
| W1-B04 | Pixel: Minka umgarnen | Bewegung | nacht/W1-B04_kater_minka_umgarnen.png (+3 weitere) | pixel_minka_umgarnen | eingebaut, in main (PR #30) |  |
| W1-B05 | Wirt Humbert: In den Keller gehen | Bewegung | nacht/W1-B05_humbert_keller.png (+3 weitere) | humbert_keller | eingebaut, in main (PR #30) |  |
| W1-B06 | Gollo: Ring werfen | Bewegung | nacht/W1-B06_gollo_ring_werfen.png (+2 weitere) | gollo_ring_werfen | eingebaut, in main (PR #30) |  |
| W1-B07 | Max: Kochlöffel schwingen | Bewegung | nacht/W1-B07_max_kochloeffel.png (+1 weitere) | max_kochloeffel | eingebaut, in main (PR #30) |  |
| W1-B08 | Max: Ziege melken | Bewegung | nacht/W1-B08_max_ziege_melken.png (+1 weitere) | max_melken | eingebaut, in main (PR #30) |  |
| W1-B09 | Max: Bohne pflanzen und gießen | Bewegung | nacht/W1-B09_max_bohne_pflanzen.png (+1 weitere) | max_bohne | eingebaut, in main (PR #30) |  |
| W1-B10 | Bohnenranke: Wachsen | Effekt | nacht/W1-B10_bohnenranke_wachsen.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B11 | Niesrosen: Aufgehen | Effekt | nacht/W1-B11_niesrosen_aufgehen.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B12 | Troll Waldemar: Musical-Nummer | Bewegung | nacht/W1-B12_waldemar_musical.png | waldemar_musical | eingebaut, in main (PR #30) |  |
| W1-B13 | Troll Waldemar: Fußbad | Bewegung | nacht/W1-B13_waldemar_fussbad.png | waldemar_fussbad | eingebaut, in main (PR #30) |  |
| W1-B14 | Zeldina: Gehen und Kiste tragen | Bewegung | nacht/W1-B14_zeldina_kiste_tragen.png (+2 weitere) | nein | in main: zeldina: walk (Bein-Rig) |  |
| W1-B15 | Pixel als Ziege: Brücke überqueren | Bewegung | nacht/W1-B15_kater_als_ziege.png (+1 weitere) | pixel_ziege_gehen | eingebaut, in main (PR #30) |  |
| W1-B16 | Ziegen: Gehen | Bewegung | nacht/W1-B16_ziege_gehen.png (+4 weitere) | schmiede_ziege_gehen, xxl_ziege_gehen | eingebaut, in main (PR #30) |  |
| W1-B17 | Zauberbesen: Fegen | Bewegung | nacht/W1-B17_zauberbesen_fegen.png | zauberbesen_fegen | eingebaut, in main (PR #30) |  |
| W1-B18 | Zauberbesen: Haarspur jagen | Bewegung | nacht/W1-B18_zauberbesen_haarspur.png | zauberbesen_haarspur | eingebaut, in main (PR #30) |  |
| W1-B19 | Pixel: Haare verlieren | Bewegung | nacht/W1-B19_kater_haare_verlieren.png (+1 weitere) | pixel_haare | eingebaut, in main (PR #30) |  |
| W1-B20 | Lord Moderwort: Zaubern | Bewegung | nacht/W1-B20_moderwort_zaubern.png | moderwort_zaubern | eingebaut, in main (PR #30) |  |
| W1-B21 | Lord Moderwort: Niesen | Bewegung | nacht/W1-B21_moderwort_niesen.png (+1 weitere) | moderwort_niesen | eingebaut, in main (PR #30) |  |
| W1-B22 | Fluch wird Käse: Effekt | Effekt | nacht/W1-B22_effekt_fluch_kaese.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B23 | Pilz-Verwandlung: Effekt | Effekt | nacht/W1-B23_effekt_pilz.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B24 | Smaugi: Kram hergeben | Bewegung | nacht/W1-B24_smaugi_kram_hergeben.png (+3 weitere) | smaugi_kram_hergeben | eingebaut, in main (PR #30) |  |
| W1-B25 | Smaugi: Gerührt schniefen | Bewegung | nacht/W1-B25_smaugi_schniefen.png | smaugi_schniefen | eingebaut, in main (PR #30) |  |
| W1-B26 | Alwin Grauwald: Rühren | Bewegung | nacht/W1-B26_alwin_ruehren.png (+8 weitere) | alwin_ruehren | in main: alwin: ruehren (ältere Fassung); neue Fassung auf claude/gesten-menschen |  |
| W1-B27 | Schmied: Hämmern | Bewegung | nacht/W1-B27_schmied_haemmern.png (+5 weitere) | schmied_haemmern | in main: schmied: haemmern (ältere Fassung); neue Fassung auf claude/gesten-menschen |  |
| W1-B28 | Übungsbesen: Pixel jagen | Bewegung | nacht/W1-B28_uebungsbesen_jagen.png | uebungsbesen_jagen | eingebaut, in main (PR #30) |  |
| W1-B29 | Zauberbesen: Max wegfegen | Bewegung | nacht/W1-B29_zauberbesen_max_wegfegen.png (+4 weitere) | zauberbesen_max_wegfegen | eingebaut, in main (PR #30) |  |
| W1-B30 | Wirt Humbert: Krug polieren | Bewegung | nacht/W1-B30_humbert_krug_polieren.png (+1 weitere) | humbert_polieren | eingebaut, in main (PR #30) |  |
| W1-B31 | Zauberstabmacher: Mustern | Bewegung | nacht/W1-B31_stabmacher_mustern.png | stabmacher_mustern | eingebaut, in main (PR #30) |  |
| W1-B32 | Rotkäppchen: Pakete balancieren | Bewegung | nacht/W1-B32_rotkaeppchen_pakete.png | rotkaeppchen_pakete | eingebaut, in main (PR #30) |  |
| W1-B33 | Maklerin: Notieren | Bewegung | nacht/W1-B33_maklerin_notieren.png | maklerin_notieren | eingebaut, in main (PR #30) |  |
| W1-B34 | Grimmzahn: Protestieren | Bewegung | nacht/W1-B34_grimmzahn_protestieren.png | grimmzahn_protest | eingebaut, in main (PR #30) |  |
| W1-B35 | Goblin-Arbeiter 1: Pickel schwingen | Bewegung | nacht/W1-B35_goblin1_pickel.png | goblin_1_pickel | eingebaut, in main (PR #30) |  |
| W1-B36 | Goblin-Arbeiter 2: Gähnen und strecken | Bewegung | nacht/W1-B36_goblin2_gaehnen.png (+2 weitere) | goblin_2_gaehnen | eingebaut, in main (PR #30) |  |
| W1-B37 | Wirtskatze Minka: Putzen | Bewegung | nacht/W1-B37_minka_putzen.png | minka_putzen | eingebaut, in main (PR #30) |  |
| W1-B38 | Taverne-Huhn: Aufplustern | Bewegung | nacht/W1-B38_huhn_aufplustern.png | huhn_plustern | eingebaut, in main (PR #30) |  |
| W1-B39 | Schmiede-Ziege: Im Kreis drehen | Bewegung | nacht/W1-B39_schmiedeziege_drehen.png | schmiede_ziege_drehen | eingebaut, in main (PR #30) |  |
| W1-B40 | XXL-Ziege: Wiederkäuen | Bewegung | nacht/W1-B40_xxlziege_wiederkaeuen.png | xxl_ziege_kauen | eingebaut, in main (PR #30) |  |
| W1-B41 | Schwan: Fauchen | Bewegung | nacht/W1-B41_schwan_fauchen.png | schwan_fauchen | eingebaut, in main (PR #30) |  |
| W1-B42 | Wirtskatze Minka: Gehen | Bewegung | runde2/W1-B42_minka_gehen_d.png (+6 weitere) | nein | in main: minka: walk |  |
| W1-B43 | Schmied: Hufeisen ins Feuer legen | Bewegung | runde2/W1-B43_schmied_ins_feuer.png (+2 weitere) | schmied_ins_feuer | eingebaut, in main (PR #30) |  |
| W1-B44 | Schmied: Blasebalg treten | Bewegung | runde2/W1-B44_schmied_blasebalg.png (+1 weitere) | schmied_blasebalg | eingebaut, in main (PR #30) |  |
| W1-B45 | Schmied: Glühendes Eisen zum Amboss | Bewegung | runde2/W1-B45_schmied_zum_amboss.png (+1 weitere) | schmied_zum_amboss | eingebaut, in main (PR #30) |  |
| W1-B46 | Schmied: Abschrecken | Bewegung | runde2/W1-B46_schmied_abschrecken.png (+1 weitere) | schmied_abschrecken | eingebaut, in main (PR #30) |  |
| W1-B47 | Schmied: Reden | Bewegung | runde2/W1-B47_schmied_reden.png | schmied_reden | eingebaut, in main (PR #30) |  |
| W1-B48 | Alwin Grauwald: Reden mit der Kelle | Bewegung | runde2/W1-B48_alwin_reden_kelle.png | alwin_reden_kelle | eingebaut, in main (PR #30) |  |
| W1-B49 | Toadi: Reden | Bewegung | runde2/W1-B49_toadi_reden.png (+2 weitere) | toadi_reden | eingebaut, in main (PR #30) |  |
| W1-B50 | Wirt Humbert: Reden | Bewegung | runde2/W1-B50_humbert_reden.png (+4 weitere) | humbert_reden | eingebaut, in main (PR #30) |  |
| W1-B51 | Gollo: Reden | Bewegung | runde2/W1-B51_gollo_reden.png (+2 weitere) | gollo_reden | eingebaut, in main (PR #30) |  |
| W1-B52 | Zauberstabmacher: Reden | Bewegung | runde2/W1-B52_zauberstabmacher_reden.png | stabmacher_reden | eingebaut, in main (PR #30) |  |
| W1-B53 | Rotkäppchen: Reden | Bewegung | runde2/W1-B53_rotkaeppchen_reden.png | rotkaeppchen_reden | eingebaut, in main (PR #30) |  |
| W1-B54 | Maklerin: Reden | Bewegung | runde2/W1-B54_maklerin_reden.png | maklerin_reden | eingebaut, in main (PR #30) |  |
| W1-B55 | Grimmzahn: Reden | Bewegung | runde2/W1-B55_grimmzahn_reden.png (+1 weitere) | grimmzahn_reden | eingebaut, in main (PR #30) |  |
| W1-B56 | Troll Waldemar: Reden | Bewegung | runde2/W1-B56_waldemar_reden.png (+2 weitere) | waldemar_reden | eingebaut, in main (PR #30) |  |
| W1-B57 | Zeldina: Reden | Bewegung | runde2/W1-B57_zeldina_reden.png | zeldina_reden | eingebaut, in main (PR #30) |  |
| W1-B58 | Lord Moderwort: Reden | Bewegung | runde2/W1-B58_moderwort_reden.png (+2 weitere) | moderwort_reden | eingebaut, in main (PR #30) |  |
| W1-B59 | Smaugi: Reden | Bewegung | runde2/W1-B59_smaugi_reden.png (+2 weitere) | smaugi_reden | eingebaut, in main (PR #30) |  |
| W1-B60 | Goblin-Arbeiter 1: Reden | Bewegung | runde2/W1-B60_goblin1_reden.png | goblin_1_reden | eingebaut, in main (PR #30) |  |
| W1-B61 | Taverne: Kaminfeuer | lebendiger Hintergrund | runde2/ambiente/W1-B61_kaminfeuer.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B62 | Taverne: Fondue blubbert | lebendiger Hintergrund | runde2/ambiente/W1-B62_fondue.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B63 | Schmiede: Esse glüht | lebendiger Hintergrund | runde2/ambiente/W1-B63_esse.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B64 | Schmiede: Funken beim Schlag | lebendiger Hintergrund | runde2/ambiente/W1-B64_funken.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B65 | Klassenzimmer: Kessel blubbert | lebendiger Hintergrund | runde2/ambiente/W1-B65_kessel.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B66 | Zauberstab-Laden: Schachtel ruckelt | lebendiger Hintergrund | runde2/ambiente/W1-B66_schachtel.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B67 | Troll-Brücke: Fisch springt | lebendiger Hintergrund | runde2/ambiente/W1-B67_fisch.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B68 | Troll-Brücke: Schmetterling | lebendiger Hintergrund | runde2/ambiente/W1-B68_schmetterling.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B69 | Zauberwald: Eule im hohlen Baum | lebendiger Hintergrund | runde2/ambiente/W1-B69_eule.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B70 | Fackel: Brennen | lebendiger Hintergrund | runde2/ambiente/W1-B70_fackel.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B71 | Luftschloss: Wimpel flattern | lebendiger Hintergrund | runde2/ambiente/W1-B71_wimpel.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B72 | Luftschloss: Brunnen plätschert | lebendiger Hintergrund | runde2/ambiente/W1-B72_brunnen.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B73 | Goblin-Bergwerk: Steinchen rieseln | lebendiger Hintergrund | runde2/ambiente/W1-B73_steinchen.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B74 | Glitzern: Funkeln | lebendiger Hintergrund | runde2/ambiente/W1-B74_glitzern.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B75 | Wasserschloss: Ente schwimmt | lebendiger Hintergrund | runde2/ambiente/W1-B75_ente.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B76 | Dorfplatz: Huhn pickt | lebendiger Hintergrund | runde2/ambiente/W1-B76_huhn.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B77 | Toadi: Hände ringen | Bewegung | fehlt | toadi_haende_ringen | eingebaut, in main (PR #30) |  |
| W1-B78 | Gollo: Ringschachtel streicheln | Bewegung | runde2/W1-B78_gollo_ringschachtel.png (+1 weitere) | gollo_ringschachtel | eingebaut, in main (PR #30) |  |
| W1-B79 | Zeldina: Kiste absetzen und Schwert prüfen | Bewegung | runde2/W1-B79_zeldina_kiste_schwert.png (+1 weitere) | zeldina_kiste_schwert | eingebaut, in main (PR #30) |  |
| W1-B80 | Troll Waldemar: Im Regelbuch blättern | Bewegung | runde2/W1-B80_waldemar_regelbuch.png | waldemar_regelbuch | eingebaut, in main (PR #30) |  |
| W1-B81 | Lord Moderwort: Nase putzen | Bewegung | runde2/W1-B81_moderwort_nase_putzen.png (+3 weitere) | moderwort_nase_putzen | eingebaut, in main (PR #30) |  |
| W1-B82 | Smaugi: Staubwedel | Bewegung | runde2/W1-B82_smaugi_staubwedel.png (+2 weitere) | smaugi_staubwedel | eingebaut, in main (PR #30) |  |
| W1-B83 | Alwin Grauwald: Lesebrille und Kochbuch | Bewegung | runde2/W1-B83_alwin_kochbuch.png (+2 weitere) | alwin_kochbuch | eingebaut, in main (PR #30) |  |
| W1-B84 | Schmied: Schweiß abwischen | Bewegung | runde2/W1-B84_schmied_schweiss.png | schmied_schweiss_abwischen | eingebaut, in main (PR #30) |  |
| W1-B85 | Goblin-Arbeiter 2: Reden | Bewegung | runde2/W1-B85_goblin2_reden.png | goblin_2_reden | eingebaut, in main (PR #30) |  |
| W1-B86 | Zauberwald: Eichhörnchen | lebendiger Hintergrund | runde2/ambiente/W1-B86_eichhoernchen.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B87 | Goblin-Bergwerk: Lore rollt | lebendiger Hintergrund | runde2/ambiente/W1-B87_lore.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W1-B88 | Kerze: Brennen | lebendiger Hintergrund | runde2/ambiente/W1-B88_kerze.png | nein | nicht eingebaut | Streifen fertig; in keinem Raum ist eine Kerze gemalt, braucht erst ein Kerzen-Prop |
| W2-B01 | Sobek, an Land: Kriechen | Bewegung | runde2/W2-B01_sobek_kriechen_a.png | sobek_land_kriechen | eingebaut, in main (PR #30) |  |
| W2-B02 | Hofkater: Beleidigt weggehen | Bewegung | runde2/W2-B02_hofkater_gehen_a.png | hofkater_weggehen | eingebaut, in main (PR #30) |  |
| W2-B03 | Schildkröte: Laufen | Bewegung | runde2/W2-B03_schildkroete_laufen_a.png | schildkroete_laufen | eingebaut, in main (PR #30) |  |
| W2-B04 | Sobek, im Wasser: Treiben | Bewegung | runde2/W2-B04_sobek_treiben.png (+3 weitere) | sobek_reden, sobek_treiben | eingebaut, in main (PR #30) |  |
| W2-B05 | Sobek, im Wasser: Fähre ziehen | Bewegung | runde2/W2-B05_sobek_faehre_ziehen.png (+3 weitere) | sobek_faehre_ziehen | eingebaut, in main (PR #30) |  |
| W2-B06 | Sobek, an Land: Verbeugen | Bewegung | runde2/W2-B06_sobek_verbeugen.png (+1 weitere) | sobek_land_verbeugen | eingebaut, in main (PR #30) |  |
| W2-B07 | Sobek, an Land: Gähnen | Bewegung | runde2/W2-B07_sobek_gaehnen.png (+2 weitere) | sobek_land_gaehnen | eingebaut, in main (PR #30) |  |
| W2-B08 | Hofkater: Putzen | Bewegung | runde2/W2-B08_hofkater_putzen.png | hofkater_putzen | eingebaut, in main (PR #30) |  |
| W2-B09 | Hofkater: Schwanz zucken | Bewegung | runde2/W2-B09_hofkater_schwanz.png | hofkater_schwanz_zucken | eingebaut, in main (PR #30) |  |
| W2-B10 | Schildkröte: Kopf einziehen | Bewegung | runde2/W2-B10_schildkroete_kopf.png | schildkroete_kopf_einziehen | eingebaut, in main (PR #30) |  |
| W2-B11 | Nil-Delta: Feluke segelt | lebendiger Hintergrund | runde2/ambiente/W2-B11_feluke.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B12 | Nil-Delta: Ibis stakst | lebendiger Hintergrund | runde2/ambiente/W2-B12_ibis.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B13 | Nil-Delta: Fischer wirft das Netz | lebendiger Hintergrund | runde2/ambiente/W2-B13_fischer_netz.png (+3 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B14 | Nil-Delta: Libelle | lebendiger Hintergrund | runde2/ambiente/W2-B14_libelle.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B15 | Hafen Syrakus: Segelschiff auf See | lebendiger Hintergrund | runde2/ambiente/W2-B15_segelschiff.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B16 | Hafen Syrakus: Möwe fliegt | lebendiger Hintergrund | runde2/ambiente/W2-B16_moewe_fliegt.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B17 | Hafen Syrakus: Möwe auf dem Pfahl | lebendiger Hintergrund | runde2/ambiente/W2-B17_moewe_pfahl.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B18 | Hafen Syrakus: Hafenarbeiter mit Amphore | lebendiger Hintergrund | runde2/ambiente/W2-B18_hafenarbeiter.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B19 | Hafen Syrakus: Tintenfisch zappelt | lebendiger Hintergrund | runde2/ambiente/W2-B19_tintenfisch.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B20 | Fährsteg Olympia: Ziege grast | lebendiger Hintergrund | runde2/ambiente/W2-B20_ziege_grast.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B21 | Sanduhr: Sand rieselt | lebendiger Hintergrund | runde2/ambiente/W2-B21_sanduhr.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B22 | Palastküche: Ofenfeuer | lebendiger Hintergrund | runde2/ambiente/W2-B22_ofenfeuer.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B23 | Sphinx: Geier kreist | lebendiger Hintergrund | runde2/ambiente/W2-B23_geier.png (+2 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B24 | Grabhügel Syrakus: Eidechse | lebendiger Hintergrund | runde2/ambiente/W2-B24_eidechse.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B25 | Archimedes' Werkstatt: Wasserorgel blubbert | lebendiger Hintergrund | runde2/ambiente/W2-B25_wasserorgel.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B26 | Stadion: Zuschauer jubeln | lebendiger Hintergrund | runde2/ambiente/W2-B26_zuschauer.png (+3 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B27 | Stadion: Wimpel flattern | lebendiger Hintergrund | runde2/ambiente/W2-B27_wimpel_stadion.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B28 | Agora: Tauben picken | lebendiger Hintergrund | runde2/ambiente/W2-B28_tauben_picken.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B29 | Agora: Taube fliegt auf | lebendiger Hintergrund | runde2/ambiente/W2-B29_taube_fliegt.png (+1 weitere) | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B30 | Agora: Menge im Hintergrund | lebendiger Hintergrund | runde2/ambiente/W2-B30_menge.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B31 | Startbüro: Wartende auf der Bank | lebendiger Hintergrund | runde2/ambiente/W2-B31_wartende.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B32 | Sobek, an Land: Schwanz wedeln | Bewegung | runde2/W2-B32_sobek_schwanz.png (+1 weitere) | sobek_land_schwanz_wedeln | eingebaut, in main (PR #30) |  |
| W2-B33 | Sobek, an Land: Hut zurechtrücken | Bewegung | runde2/W2-B33_sobek_hut.png (+1 weitere) | sobek_land_hut_zurechtruecken | eingebaut, in main (PR #30) |  |
| W2-B34 | Schildkröte: Rennen | Bewegung | runde2/W2-B34_schildkroete_rennen.png (+1 weitere) | schildkroete_rennen | eingebaut, in main (PR #30) |  |
| W2-B35 | Hafen Syrakus: Ruderboot mit Fässern | lebendiger Hintergrund | runde2/ambiente/W2-B35_ruderboot.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B36 | Nil-Delta: Wasserträgerin | lebendiger Hintergrund | runde2/ambiente/W2-B36_wassertraegerin.png | nein | eingebaut, in main (PR #32) (PR #32) |  |
| W2-B37 | Leonidas: Losrennen | Bewegung | runde2/W2-B37_leonidas_losrennen.png (+1 weitere) | leonidas_losrennen | eingebaut, in main (PR #30) |  |
| W2-P01 | Max Tag 1 | Figuren-Pose (Posenbogen) | nacht/W2-P01_max_tag1.png | max_heisser_sand, max_katapult | eingebaut, in main (PR #30) |  |
| W2-P02 | Max Finaltag | Figuren-Pose (Posenbogen) | nacht/W2-P02_max_finaltag.png | max_diskus, max_speer, max_wackeln | eingebaut, in main (PR #30) |  |
| W2-P03 | Ramses | Figuren-Pose (Posenbogen) | nacht/W2-P03_ramses.png (+2 weitere) | ramses_unentschlossen | eingebaut, in main (PR #30) |  |
| W2-P04 | Sobek | Figuren-Pose (Posenbogen) | nacht/W2-P04_sobek_land.png | sobek_land_kriechen, sobek_land_verbeugen | eingebaut, in main (PR #30) | abgedeckt durch sobek_land_kriechen, sobek_land_verbeugen (W2-B01, W2-B06) |
| W2-P05 | Hofkater | Figuren-Pose (Posenbogen) | nacht/W2-P05_hofkater.png | hofkater_abziehen | eingebaut, in main (PR #30) |  |
| W2-P06 | Schildkröte | Figuren-Pose (Posenbogen) | nacht/W2-P06_schildkroete.png | schildkroete_laufen | eingebaut, in main (PR #30) | abgedeckt durch schildkroete_laufen (W2-B03, gleiche Laufbewegung) |
| W2-P07 | Archimedes | Figuren-Pose (Posenbogen) | nacht/W2-P07_archimedes_heureka.png | archimedes_heureka | eingebaut, in main (PR #30) |  |
| W2-P08 | Hermes | Figuren-Pose (Posenbogen) | nacht/W2-P08_hermes.png (+2 weitere) | hermes_joggen | eingebaut, in main (PR #30) |  |
| W2-P09 | Leonidas | Figuren-Pose (Posenbogen) | nacht/W2-P09_leonidas.png | leonidas_bruellen | eingebaut, in main (PR #30) |  |
| W2-P10 | Cicero | Figuren-Pose (Posenbogen) | nacht/W2-P10_cicero.png | cicero_rede | eingebaut, in main (PR #30) |  |
| W2-P11 | Philosoph | Figuren-Pose (Posenbogen) | nacht/W2-P11_philosoph.png | philosoph_schimpfen | eingebaut, in main (PR #30) |  |
| W2-P12 | Fächerwedler | Figuren-Pose (Posenbogen) | nacht/W2-P12_faecherwedler.png | faecherwedler_faecheln | eingebaut, in main (PR #30) |  |
| W2-P13 | Nebet | Figuren-Pose (Posenbogen) | nacht/W2-P13_nebet.png | nebet_probieren, nebet_ruehren | eingebaut, in main (PR #30) |  |
| W2-P14 | Hieron | Figuren-Pose (Posenbogen) | nacht/W2-P14_hieron.png | hieron_ungeduld | eingebaut, in main (PR #30) |  |
| W2-P15 | Tiro | Figuren-Pose (Posenbogen) | nacht/W2-P15_tiro.png | tiro_schreiben | eingebaut, in main (PR #30) |  |
| W2-P16 | Palastschreiber | Figuren-Pose (Posenbogen) | nacht/W2-P16_palastschreiber.png | schreiber_schreiben, schreiber_strecken_gaehnen | eingebaut, in main (PR #30) |  |
| W2-P17 | Publikum | Figuren-Pose (Posenbogen) | nacht/W2-P17_publikum.png | publikum_einschlafen | nicht eingebaut | Bewegung fertig; Publikum hat noch kein Spiel-Sprite |
| W2-P18 | Fährmann | Figuren-Pose (Posenbogen) | nacht/W2-P18_faehrmann.png (+1 weitere) | faehrmann_muenze, faehrmann_staken | eingebaut, in main (PR #30) |  |
| W2-P19 | Steinmetz | Figuren-Pose (Posenbogen) | nacht/W2-P19_steinmetz.png | steinmetz_meisseln, steinmetz_stirn_wischen | eingebaut, in main (PR #30) |  |
| W2-P20 | Zeremonienmeister | Figuren-Pose (Posenbogen) | nacht/W2-P20_zeremonienmeister.png (+1 weitere) | zeremonienmeister_ankuendigen | eingebaut, in main (PR #30) |  |
| W2-P21 | Brian | Figuren-Pose (Posenbogen) | nacht/W2-P21_brian.png | brian_abwehren | eingebaut, in main (PR #30) |  |
| W2-P22 | Beamter 1 | Figuren-Pose (Posenbogen) | nacht/W2-P22_beamter1.png | beamter_1_eindoesen | eingebaut, in main (PR #30) |  |
| W2-P23 | Beamter 2 | Figuren-Pose (Posenbogen) | nacht/W2-P23_beamter2.png | beamter_2_stempeln | eingebaut, in main (PR #30) |  |
| W2-P24 | Römische Touristin | Figuren-Pose (Posenbogen) | nacht/W2-P24_touristin.png | touristin_faecheln_mustern | eingebaut, in main (PR #30) |  |
| W2-P25 | Ägypter aus dem Volk | Figuren-Pose (Posenbogen) | nacht/W2-P25_aegypter.png | aegypter_klatschen | eingebaut, in main (PR #30) |  |
| W2-P26 | Straßenmusiker | Figuren-Pose (Posenbogen) | nacht/W2-P26_strassenmusiker.png | strassenmusiker_lyra | eingebaut, in main (PR #30) |  |
| W2-P27 | Sobek im Wasser | Figuren-Pose (Posenbogen) | nacht/W2-P27_sobek_wasser.png | sobek_treiben, sobek_reden | eingebaut, in main (PR #30) | abgedeckt durch sobek_treiben, sobek_reden (neu gemalt als W2-B04/W2-P48 im Format des Sprites) |
| W2-P28 | Ramses | Figuren-Pose (Posenbogen) | runde2/W2-P28_ramses.png (+2 weitere) | ramses_kopftuch, ramses_reden, ramses_zepter_wiegen | eingebaut, in main (PR #30) |  |
| W2-P29 | Fährmann | Figuren-Pose (Posenbogen) | runde2/W2-P29_faehrmann.png (+3 weitere) | faehrmann_bart_kratzen, faehrmann_gaehnen, faehrmann_reden | eingebaut, in main (PR #30) |  |
| W2-P30 | Köchin Nebet | Figuren-Pose (Posenbogen) | runde2/W2-P30_nebet.png (+1 weitere) | nebet_abschmecken, nebet_mehl_wischen, nebet_reden | eingebaut, in main (PR #30) |  |
| W2-P31 | Palastschreiber | Figuren-Pose (Posenbogen) | runde2/W2-P31_schreiber.png (+3 weitere) | schreiber_einnicken, schreiber_reden, schreiber_stift_kauen | eingebaut, in main (PR #30) |  |
| W2-P32 | Archimedes | Figuren-Pose (Posenbogen) | runde2/W2-P32_archimedes.png | archimedes_gruebeln, archimedes_kopf_kratzen, archimedes_reden | eingebaut, in main (PR #30) |  |
| W2-P33 | König Hieron | Figuren-Pose (Posenbogen) | runde2/W2-P33_hieron.png (+1 weitere) | hieron_bart_streichen, hieron_finger_trommeln, hieron_reden | eingebaut, in main (PR #30) |  |
| W2-P34 | Cicero | Figuren-Pose (Posenbogen) | runde2/W2-P34_cicero.png | cicero_armreif, cicero_raeuspern, cicero_reden | eingebaut, in main (PR #30) |  |
| W2-P35 | Tiro | Figuren-Pose (Posenbogen) | runde2/W2-P35_tiro.png (+1 weitere) | tiro_kritzeln, tiro_reden, tiro_umsehen | eingebaut, in main (PR #30) |  |
| W2-P36 | Leonidas | Figuren-Pose (Posenbogen) | runde2/W2-P36_leonidas.png | leonidas_dehnen, leonidas_pfeife_drehen, leonidas_reden | eingebaut, in main (PR #30) |  |
| W2-P37 | Hermes | Figuren-Pose (Posenbogen) | runde2/W2-P37_hermes.png (+1 weitere) | hermes_reden, hermes_tasche | eingebaut, in main (PR #30) |  |
| W2-P38 | Brian | Figuren-Pose (Posenbogen) | runde2/W2-P38_brian.png | brian_reden, brian_schild_richten, brian_seufzen | eingebaut, in main (PR #30) |  |
| W2-P39 | Philosoph | Figuren-Pose (Posenbogen) | runde2/W2-P39_philosoph.png (+2 weitere) | philosoph_bart_kratzen, philosoph_laterne_spaehen, philosoph_reden | eingebaut, in main (PR #30) |  |
| W2-P40 | Römischer Tourist | Figuren-Pose (Posenbogen) | runde2/W2-P40_tourist.png (+1 weitere) | tourist_hut_faecheln, tourist_reden, tourist_stirn_wischen | eingebaut, in main (PR #30) |  |
| W2-P41 | Römische Touristin | Figuren-Pose (Posenbogen) | runde2/W2-P41_touristin.png (+2 weitere) | touristin_amphore, touristin_reden | eingebaut, in main (PR #30) |  |
| W2-P42 | Beamter 2 | Figuren-Pose (Posenbogen) | runde2/W2-P42_beamter2.png | beamter_2_brille_putzen, beamter_2_haare_richten, beamter_2_reden | eingebaut, in main (PR #30) |  |
| W2-P43 | Fächerwedler | Figuren-Pose (Posenbogen) | runde2/W2-P43_faecherwedler.png (+1 weitere) | faecherwedler_bauch, faecherwedler_reden | eingebaut, in main (PR #30) |  |
| W2-P44 | Zeremonienmeister | Figuren-Pose (Posenbogen) | runde2/W2-P44_zeremonienmeister.png (+2 weitere) | zeremonienmeister_federkrone, zeremonienmeister_reden | eingebaut, in main (PR #30) |  |
| W2-P45 | Steinmetz | Figuren-Pose (Posenbogen) | runde2/W2-P45_steinmetz.png (+2 weitere) | steinmetz_reden, steinmetz_staub_pusten | eingebaut, in main (PR #30) |  |
| W2-P46 | Ägypter aus dem Volk | Figuren-Pose (Posenbogen) | runde2/W2-P46_aegypter.png | aegypter_reden, aegypter_schulterzucken | eingebaut, in main (PR #30) |  |
| W2-P47 | Straßenmusiker | Figuren-Pose (Posenbogen) | runde2/W2-P47_strassenmusiker.png (+1 weitere) | strassenmusiker_reden, strassenmusiker_stimmen | eingebaut, in main (PR #30) |  |
| W2-P48 | Sobek im Wasser | Figuren-Pose (Posenbogen) | runde2/W2-P48_sobek_wasser.png (+1 weitere) | sobek_reden | eingebaut, in main (PR #30) |  |
| W2-P49 | Hofkater | Figuren-Pose (Posenbogen) | runde2/W2-P49_hofkater.png | hofkater_reden | eingebaut, in main (PR #30) |  |
| W2-P50 | Beamter 1 | Figuren-Pose (Posenbogen) | runde2/W2-P50_beamter1.png | beamter_1_gaehnen, beamter_1_reden | eingebaut, in main (PR #30) |  |
| W2-P51 | Ramses | Figuren-Pose (Posenbogen) | runde2/W2-P51_ramses.png (+2 weitere) | ramses_zepter_tauschen | eingebaut, in main (PR #30) |  |
| W2-P52 | Köchin Nebet | Figuren-Pose (Posenbogen) | runde2/W2-P52_nebet.png (+1 weitere) | nebet_teig_kneten | eingebaut, in main (PR #30) |  |
| W2-P53 | Archimedes | Figuren-Pose (Posenbogen) | runde2/W2-P53_archimedes.png | archimedes_zirkel | eingebaut, in main (PR #30) |  |
| W2-P54 | Fährmann | Figuren-Pose (Posenbogen) | runde2/W2-P54_faehrmann.png | faehrmann_gaehnen_stab | eingebaut, in main (PR #30) |  |
| W2-P55 | Cicero | Figuren-Pose (Posenbogen) | runde2/W2-P55_cicero.png | cicero_toga_zupfen | eingebaut, in main (PR #30) |  |
| W2-P56 | Tiro | Figuren-Pose (Posenbogen) | runde2/W2-P56_tiro.png | tiro_tafel_glaetten | eingebaut, in main (PR #30) |  |
| W2-P57 | Philosoph | Figuren-Pose (Posenbogen) | runde2/W2-P57_philosoph.png | philosoph_laterne_putzen | eingebaut, in main (PR #30) |  |
| W2-P58 | Römische Touristin | Figuren-Pose (Posenbogen) | runde2/W2-P58_touristin.png | touristin_brille_putzen | eingebaut, in main (PR #30) |  |
| W2-P59 | Beamter 2 | Figuren-Pose (Posenbogen) | runde2/W2-P59_beamter2.png | beamter_2_stempel_anhauchen | eingebaut, in main (PR #30) |  |
| W2-P60 | Fächerwedler | Figuren-Pose (Posenbogen) | runde2/W2-P60_faecherwedler.png | faecherwedler_arm_ausschuetteln | eingebaut, in main (PR #30) |  |
| W2-P61 | Ägypter aus dem Volk | Figuren-Pose (Posenbogen) | runde2/W2-P61_aegypter.png | aegypter_fuss_tippen | eingebaut, in main (PR #30) |  |
| WU-B01 | Max: Gehen | Bewegung | fehlt | nein | in main: max: walk |  |
| WU-B02 | Max: Gehen nach vorn und nach hinten | Bewegung | nacht/WU-B02_max_gehen_hinten.png (+1 weitere) | max_gehen_hinten, max_gehen_vorn | eingebaut, in main (PR #30) |  |
| WU-B03 | Max: Stehen | Bewegung | fehlt | nein | in main: max: idle |  |
| WU-B04 | Max: Sprechen | Bewegung | fehlt | nein | in main: max: talk |  |
| WU-B05 | Max: Aufheben | Bewegung | nacht/WU-B05_max_aufheben.png (+1 weitere) | max_aufheben | eingebaut, in main (PR #30) |  |
| WU-B06 | Max: Benutzen | Bewegung | nacht/WU-B06_max_benutzen.png (+1 weitere) | max_benutzen | eingebaut, in main (PR #30) |  |
| WU-B07 | Max: Schulterzucken | Bewegung | nacht/WU-B07_max_schulterzucken.png (+1 weitere) | max_schulterzucken | eingebaut, in main (PR #30) |  |
| WU-B08 | Max: Gähnen | Bewegung | nacht/WU-B08_max_gaehnen.png (+2 weitere) | max_gaehnen | eingebaut, in main (PR #30) |  |
| WU-B09 | Max: Auf dem Sofa | Bewegung | fehlt | nein | in main: max (Sofa) |  |
| WU-B10 | Max: Vom Sofa aufstehen | Bewegung | nacht/WU-B10_max_vom_sofa_aufstehen.png (+1 weitere) | max_vom_sofa_aufstehen | eingebaut, in main (PR #30) |  |
| WU-B11 | Pixel: Gehen | Bewegung | fehlt | nein | in main: pixel: walk |  |
| WU-B12 | Pixel: Gehen nach vorn und nach hinten | Bewegung | nacht/WU-B12_kater_gehen_vorn_hinten.png (+2 weitere) | pixel_gehen_hinten, pixel_gehen_vorn | eingebaut, in main (PR #30) |  |
| WU-B13 | Pixel: Stehen | Bewegung | fehlt | nein | in main: pixel: stehen |  |
| WU-B14 | Pixel: Schlafen | Bewegung | fehlt | nein | in main: pixel: schlafen |  |
| WU-B15 | Pixel: Putzen | Bewegung | nacht/WU-B15_kater_putzen.png (+3 weitere) | pixel_putzen | eingebaut, in main (PR #30) |  |
| WU-B16 | Pixel: Springen und Klettern | Bewegung | nacht/WU-B16_kater_springen_klettern.png (+3 weitere) | pixel_springen | eingebaut, in main (PR #30) |  |
| WU-B17 | Pixel: Schnuppern | Bewegung | nacht/WU-B17_kater_schnuppern.png (+3 weitere) | pixel_schnuppern | eingebaut, in main (PR #30) |  |
| WU-B18 | Pixel: Tragen | Bewegung | nacht/WU-B18_kater_tragen.png (+3 weitere) | pixel_tragen | eingebaut, in main (PR #30) |  |
| WU-B19 | Pixel: Fauchen | Bewegung | nacht/WU-B19_kater_fauchen.png (+3 weitere) | pixel_fauchen | eingebaut, in main (PR #30) |  |
| WU-B20 | Pixel: Ohrfeige | Bewegung | nacht/WU-B20_kater_ohrfeige.png (+1 weitere) | pixel_ohrfeige | eingebaut, in main (PR #30) |  |
| WU-B21 | Pixel: Vom Schrank fallen | Bewegung | nacht/WU-B21_kater_vom_schrank_fallen.png (+2 weitere) | pixel_vom_schrank_fallen | eingebaut, in main (PR #30) |  |
| WU-B22 | Max: Wenden | Bewegung | runde2/WU-B22_max_wenden.png (+1 weitere) | max_wenden | eingebaut, in main (PR #30) |  |
| WU-B23 | Max: Fallen und landen | Bewegung | runde2/WU-B23_max_fallen.png (+1 weitere) | max_fallen | eingebaut, in main (PR #30) |  |
| WU-B24 | Max: Vom Boden aufstehen | Bewegung | runde2/WU-B24_max_aufstehen.png (+1 weitere) | max_vom_boden_aufstehen | eingebaut, in main (PR #30) |  |
| WU-B25 | Pixel: Aufstehen | Bewegung | runde2/WU-B25_pixel_aufstehen.png (+2 weitere) | pixel_aufstehen | eingebaut, in main (PR #30) |  |
| WU-B26 | Pixel: Hinlegen | Bewegung | runde2/WU-B26_pixel_hinlegen.png (+3 weitere) | pixel_hinlegen | eingebaut, in main (PR #30) |  |
| WU-B27 | Max: Kopf kratzen | Bewegung | runde2/WU-B27_max_kopf_kratzen.png | max_kopf_kratzen | eingebaut, in main (PR #30) |  |
| WU-B28 | Max: Zeigen | Bewegung | runde2/WU-B28_max_zeigen.png | max_zeigen | eingebaut, in main (PR #30) |  |
| WU-B29 | Max: Hinsetzen | Bewegung | runde2/WU-B29_max_hinsetzen.png (+1 weitere) | max_hinsetzen | eingebaut, in main (PR #30) |  |
| WU-B30 | Max: Reden mit Gesten | Bewegung | runde2/WU-B30_max_reden.png (+1 weitere) | max_reden | eingebaut, in main (PR #30) |  |
| WU-B31 | Pixel: Reden | Bewegung | runde2/WU-B31_pixel_reden.png (+4 weitere) | pixel_reden | eingebaut, in main (PR #30) |  |
| WU-B32 | Pixel: Schwanz zucken | Bewegung | runde2/WU-B32_pixel_schwanz.png (+1 weitere) | pixel_schwanz_zucken | eingebaut, in main (PR #30) |  |

## Welt 3

Angelegt am 18. November 2026 aus `fertige-prompts/welt-3.md` (111 IDs). Noch kein Bild im Spiel. Stand 20. November 2026: alle 27 Konzeptblätter liegen unter `welt3/konzept/` (Name = Nummer), Phase 1 (Unterstadt) gebaut (Nachbesserung 20.11. nach Sebastians Rückmeldung: Halbposen als Zwischenbilder in allen Gesten, Katze neu gemalt statt gerendert): Stand-Sprites der Unterstadt-Figuren, Posenbögen W3-P01, P08, P09, P16 bis P18, P23 bis P25, Bewegungen W3-B01, B19 bis B21, dazu die Läufe von Morphäus und Deckert (Teile-Rig, `welt3/bewegungen/morphaeus_gehen` und `deckert_gehen`). Prüfbilder unter `welt3/pruefung/`. Phase 2 (20.11.): alle übrigen Stand-Sprites, Posenbögen W3-P02 bis P07, P10 bis P15, P19 bis P22, P26 bis P29 (57 Bewegungen, Halbposen wo brauchbar), Läufe Schmidt und Klon, Bildfolgen und Effekte W3-B02 bis B09, B11 bis B16, B22, B26, B30 bis B32. Danach (20.11.): Effekte auf Sebastians Räumen R01 bis R05 und R07 bis R11, Gegenstände G01 bis G07 und Nahansichten N01 bis N05 über die Gemini-API, Piepsi fahren (B37). Reden und Ruhe (Mund, Kopf, Atmen) für 17 Figuren per Code aus dem Stand-Sprite (`tools/grafik_w3/reden_ruhe.py`, Rigs in `tools/figuren/`, Streifen unter `welt3/reden_ruhe/`), dazu Morphäus nicken und Herr Vier Kopf schütteln. Nachbesserung 20.11. nach Sebastians Liste: Pixel-Posen auf die Farben seines Spiel-Sprites, Augen bernsteinfarben; Kalle mit angeglichener Kopfgröße und eigenem Stand ohne Laptop für Kabel, Entsetzt, Tabelle und Jubel; 15 fehlende Halbposen einzeln bestellt (Deckert, Morphäus, Frau, Max, Kalle, Hausmeister); Ratte (18 px) und Vogelschwarm (13 px je Vogel) größer. Vollständigkeitsprüfung 20.11. (jede Regie-Angabe im Skript gegen die Bewegungen, jede Zeile „Lebendige Hintergründe“ gegen die Effekte): neu W3-P30 Morphäus hält den Kater, W3-P31 Max mit Portalgerät, W3-B38 bis B45 (Küchenradio, Kuckucksuhr, Kartenleser, drei Lautsprecher, Tür in Kammer 3, Verwandlung in die Ente), M.U.T.T.I. Ruhe (Antennen wippen), Max auf Opas Sofa mit Handy (Standbild für die Blaue-Pastille-Szene, `welt3/stand/max_sofa_handy.png`). Meshy-Durchsicht 20.11.: eigene Gangarten aus Bibliotheks-Clips (12 Credits, Task 01a1f8c7…): Morphäus Thoughtful Walk, Deckert Casual Walk, Schmidt, Klon und Passant Proud Strut (alte Fassungen als *_gehen_maxgang), Max hinkt nach dem Hexenschuss (max_hexenschuss_gehen, Injured Walk), Klone steigen die Treppe (klon_treppe, Max' Treppen-Winkel, kostenlos); Winkel und Konfigurationen unter `3d/clips/` und `tools/grafik_w3/gang_*.json`. Offen bleiben die Räume R06 und R12 mit B29 und B34 sowie die Stadtstraßen-Kulisse, die erst mit dem Bild geht (Radiowecker spricht und klingelt, rote Autos im Takt), die Nahansichten von Sebastian (Schrift setzt Claude) und die Code-Sicht (Einbau). Arbeitsdateien und Befehlsliste unter `E:\Game Engine\Grafiken\3d\welt3\` (`liste_phase1.txt`). Reihenfolge der Grundlagenbilder steht oben in `fertige-prompts/welt-3.md`. Nachtrag 20.11.: Max' Zeitlupen-Ausweichen und der Locher-Wurf des Klons über Meshy Text zu Bewegung (2 × 10 Credits, Tasks 01a1f8cf-8e74…, 01a1f8cf-e050…) als Haltungsvorlage für 6 neue Zwischenposen (Gemini, 7 Bilder). Meshy Welt 3 gesamt: 36 Credits. Einbau 20.11. (PR #43): Figuren-Sheets mit Reden/Ruhe, Läufen und allen Gesten aus `welt3/bewegungen` über `tools/grafik_w3/figuren_einbau.py`, Gesten an Skriptzeilen in `game/skripte/gesten_welt_3.gd`, raumgebundene Effekte über `tools/grafik_w3/effekte_einbau.py`, Inventar-Icons und Props über `tools/grafik_w3/gegenstaende_einbau.py`. Noch nicht im Spiel: Effekte, die an Ereignisse gebunden sind (Kopieren, Portal, Verwandlung, Fächer öffnen, Hausmeister rollen, Hologramm, Lautsprecher und Radio beim Reden, Schnee), Max als Ente und in Pfütze, Kapsel und auf dem Sofa, Opa als Hologramm, Passant und Vogelschwarm (Stadtstraße).

| ID | Titel | Art | Quelle (Bogen/Bild) | Bewegung gebaut | im Spiel | offen: Grund, wer erledigt |
| --- | --- | --- | --- | --- | --- | --- |
| W3-R01 | Unterstadt, Straße | Raum | welt3/raeume/W3-R01_unterstadt.jpeg (Panorama 32:9) | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_unterstadt_strasse_v01 (1280 breit), Tresen der Nudelbude als Vordergrund | eingebaut (PR Welt-3-Einbau) |  |
| W3-R02 | Apothekengasse mit Pastillenautomat | Raum | welt3/raeume/W3-R02_apothekengasse.jpeg + W3-R02b_apothekengasse_offen.jpeg (32:9) | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_apothekengasse_v01 + _faecher_offen (1280 breit) | eingebaut (PR Welt-3-Einbau) |  |
| W3-R03 | Widerstandsbasis | Raum | welt3/raeume/W3-R03_widerstandsbasis.jpeg + R03b (Fenster offen) + R03c (Fenster offen, Kaffee am Boden) | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_widerstandsbasis_v01 + _schnee, _kaffee, _schnee_kaffee (1280 breit) | eingebaut (PR Welt-3-Einbau) |  |
| W3-R04 | Kühlung (Ende des Lüftungsschachts) | Raum | welt3/raeume/W3-R04_kuehlung.jpeg + W3-R04b_kuehlung_eimer_gekippt.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_kuehlung_v01 + _taut (nach dem Eimer) | eingebaut (PR Welt-3-Einbau) |  |
| W3-R05 | Laboreingang | Raum | welt3/raeume/W3-R05_laboreingang.jpeg + W3-R05b_laboreingang_offen.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_laboreingang_v01 + _offen | eingebaut (PR Welt-3-Einbau) |  |
| W3-R06 | Stadtstraße | Raum | fehlt | nein | nein | wartet auf das Konzeptbild, Sebastian (Gemini) |
| W3-R07 | Küche der Orakel-Oma | Raum | welt3/raeume/W3-R07_kueche_orakel.jpeg + W3-R07b_kueche_scherben.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_kueche_orakel_v01 + _scherben | eingebaut (PR Welt-3-Einbau) |  |
| W3-R08 | Büroturm, 50. Stock | Raum | welt3/raeume/W3-R08_buero_50.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_buero_50_v01 | eingebaut (PR Welt-3-Einbau) |  |
| W3-R09 | Testkammer 1 | Raum | welt3/raeume/W3-R09_testkammer_1.jpeg + W3-R09b_testkammer_1_offen.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_testkammer_1_v01 + _offen | eingebaut (PR Welt-3-Einbau) |  |
| W3-R10 | Testkammer 2 | Raum | welt3/raeume/W3-R10_testkammer_2.jpeg + W3-R10b_testkammer_2_laser_harmlos.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_testkammer_2_v01 + _laser_gestoert | eingebaut (PR Welt-3-Einbau) |  |
| W3-R11 | Testkammer 3 | Raum | welt3/raeume/W3-R11_testkammer_3.jpeg + W3-R11b_testkammer_3_offen.jpeg | gepixelt (`tools/grafik_w3/raeume_pixelieren.py`), w3_bg_testkammer_3_v01 + _offen | eingebaut (PR Welt-3-Einbau) |  |
| W3-R12 | Kern von M.U.T.T.I. | Raum | fehlt | nein | nein | wartet auf das Konzeptbild, Sebastian (Gemini) |
| W3-R13 | Code-Sicht | Raum | aus den Hintergründen (`tools/grafik_w3/code_sicht.py`) | grüne Umrisse für Büroturm und Testkammern 1 bis 3 | eingebaut (PR Welt-3-Einbau), Etiketten setzt `welt_3.gd` aus den Tausch-Texten | für R12 (Kern) nach dessen Bild nachziehen |
| W3-F01 | M.U.T.T.I. | Figur | welt3/konzept/W3-F01_mutti.jpeg (+ welt3/konzept/W3-F01b_mutti_aus.jpeg) | Stand-Sprite welt3/stand/mutti (+ mutti_aus).png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F02 | Morphäus | Figur | welt3/konzept/W3-F02_morphaeus.jpeg | Stand-Sprite welt3/stand/morphaeus.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F03 | Orakel-Oma | Figur | welt3/konzept/W3-F03_orakel_oma.jpeg | Stand-Sprite welt3/stand/orakel_oma.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F04 | Agent Schmidt | Figur | welt3/konzept/W3-F04_agent_schmidt.jpeg (+ welt3/konzept/W3-F04b_schmidt_ohne_brille.jpeg) | Stand-Sprite welt3/stand/schmidt (+ schmidt_ohne_brille).png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F05 | Schmidt-Klon | Figur | welt3/konzept/W3-F05_schmidt_klon.jpeg | Stand-Sprite welt3/stand/klon.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F06 | Roboter-Hausmeister | Figur | welt3/konzept/W3-F06_roboter_hausmeister.jpeg | Stand-Sprite welt3/stand/hausmeister.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F07 | Detektiv Deckert | Figur | welt3/konzept/W3-F07_deckert.jpeg | Stand-Sprite welt3/stand/deckert.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F08 | Herr Vier | Figur | welt3/konzept/W3-F08_herr_vier.jpeg | Stand-Sprite welt3/stand/herr_vier.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F09 | Kabel-Kalle | Figur | welt3/konzept/W3-F09_kabel_kalle.jpeg | Stand-Sprite welt3/stand/kalle.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F10 | Bernd | Figur | welt3/konzept/W3-F10_bernd.jpeg | Stand-Sprite welt3/stand/bernd.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F11 | Rebellin | Figur | welt3/konzept/W3-F11_rebellin.jpeg | Stand-Sprite welt3/stand/rebellin.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F12 | Rebell | Figur | welt3/konzept/W3-F12_rebell.jpeg | Stand-Sprite welt3/stand/rebell.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F13 | Piepsi | Figur | welt3/konzept/W3-F13_piepsi.jpeg (+ welt3/konzept/W3-F13b_piepsi_rostig.jpeg) | Stand-Sprite welt3/stand/piepsi (+ piepsi_rostig).png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F14 | Opa als Hologramm | Figur | welt3/konzept/W3-F14_opa_hologramm.jpeg | Stand-Sprite welt3/stand/opa_hologramm.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F15 | Weinender Mann | Figur | welt3/konzept/W3-F15_weinender_mann.jpeg | Stand-Sprite welt3/stand/weinender_mann.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F16 | Frau mit Regenschirm | Figur | welt3/konzept/W3-F16_frau_regenschirm.jpeg | Stand-Sprite welt3/stand/frau_regenschirm.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F17 | Straßenmusiker im Regen | Figur | welt3/konzept/W3-F17_strassenmusiker.jpeg | Stand-Sprite welt3/stand/strassenmusiker.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F18 | Schwarze Katze | Figur | welt3/konzept/W3-F18_schwarze_katze.jpeg | Stand-Sprite welt3/stand/schwarze_katze.png | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-F19 | Max als Ente | Figur | welt3/konzept/W3-F19_max_ente.jpeg | Stand-Sprite welt3/stand/max_ente.png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F20 | Max in der Kapsel | Figur | welt3/konzept/W3-F20_max_kapsel.jpeg (+ welt3/konzept/W3-F20b_max_kapsel_offen.jpeg) | Stand-Sprite welt3/stand/max_kapsel (+ max_kapsel_offen).png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F21 | Max in der Pfütze | Figur | welt3/konzept/W3-F21_max_pfuetze.jpeg (+ welt3/konzept/W3-F21b_max_pfuetze_kater_springt.jpeg) | Stand-Sprite welt3/stand/max_pfuetze (+ max_pfuetze_kater_springt).png | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-F22 | Passant der Simulation | Figur | welt3/konzept/W3-F22_passant.png | Stand-Sprite welt3/stand/passant.png, Lauf welt3/bewegungen/passant_gehen (Teile-Rig, 8 Bilder) | nein | gebaut (20.11., Zusätze), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau); Platzierung im Gleichschritt nach R06 |
| W3-P01 | Max Unterstadt | Posenbogen | welt3/posen/W3-P01_max_unterstadt_b.png | ja: welt3/bewegungen/max_regen_wischen, max_handy, max_stempel_ansehen, max_hexenschuss, max_ruecken_halten (gelegentliche Ruhe-Geste nach dem Hexenschuss) | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P02 | Max Büroturm | Posenbogen | welt3/posen/W3-P02_max_buero.png | ja: welt3/bewegungen/max_zeitlupe (4 Zwischenposen nach Meshy-Text-zu-Bewegung) | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P03 | Max Welt 3 | Posenbogen | welt3/posen/W3-P03_max_welt3.png | ja: welt3/bewegungen/max_pastille, _schlucken, _code_sicht, _gedankentrick | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P04 | Max Basis | Posenbogen | welt3/posen/W3-P04_max_basis.png (+ _zw) | ja: welt3/bewegungen/max_tasche, _nudeln, _tippen, _hochhalten | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P05 | Max als Ente | Posenbogen | welt3/posen/W3-P05_max_ente.png | ja: welt3/bewegungen/max_ente_watscheln (= W3-B02) | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P06 | Pixel Basis | Posenbogen | welt3/posen/W3-P06_pixel_basis.png | ja: welt3/bewegungen/pixel_kabel, pixel_morse | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P07 | Pixel Basis 2 | Posenbogen | welt3/posen/W3-P07_pixel_basis2.png | ja: welt3/bewegungen/pixel_tasse, _hebel, _schieben | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P08 | Morphäus | Posenbogen | welt3/posen/W3-P08_morphaeus.png + konzept/W3-P08_zusatz_morphaeus_schulterzucken.jpeg | ja: welt3/bewegungen/morphaeus_schild_zeigen, _brille_hochschieben, _haende_falten, _schulterzucken | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P09 | Morphäus 2 | Posenbogen | welt3/posen/W3-P09_morphaeus2.png | ja: welt3/bewegungen/morphaeus_schild_umdrehen, _leere_hand, _kekse_reichen, _fangen | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P10 | Orakel-Oma | Posenbogen | welt3/posen/W3-P10_orakel_oma.png (+ _zw) | ja: welt3/bewegungen/orakel_oma_reden, _zum_regal, _stirn, _sparschwein | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P11 | Orakel-Oma Küche | Posenbogen | welt3/posen/W3-P11_orakel_oma2.png (+ _zw) | ja: welt3/bewegungen/orakel_oma_kehren, _ofen, _haende_falten | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P12 | Agent Schmidt | Posenbogen | welt3/posen/W3-P12_schmidt.png (+ _zw) | ja: welt3/bewegungen/schmidt_reden, _stumm, _kopierer, _fliege | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P13 | Agent Schmidt 2 | Posenbogen | welt3/posen/W3-P13_schmidt2.png (+ _zw) | ja: welt3/bewegungen/schmidt_hausschuh, _brille_ab, _akte | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P14 | Schmidt-Klon | Posenbogen | welt3/posen/W3-P14_klon.png (+ _zw) | ja: welt3/bewegungen/klon_werfen (2 Zwischenposen nach Meshy-Text-zu-Bewegung), _umsehen, _hausschuh | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P15 | Roboter-Hausmeister | Posenbogen | welt3/posen/W3-P15_hausmeister.png (+ _zw) | ja: welt3/bewegungen/hausmeister_reden, _lesen, _verbeugen, _warten | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P16 | Detektiv Deckert | Posenbogen | welt3/posen/W3-P16_deckert.png | ja: welt3/bewegungen/deckert_reden, _notieren, _stempeln | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P17 | Herr Vier | Posenbogen | welt3/posen/W3-P17_herr_vier.png | ja: welt3/bewegungen/herr_vier_vier_finger, _haende_zeigen, _kochen_strahlend, _schale_hinstellen | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P18 | Herr Vier 2 | Posenbogen | welt3/posen/W3-P18_herr_vier2.png | ja: welt3/bewegungen/herr_vier_glueckskeks, _zettel_lesen, _kochen_weinend, _karte_reichen | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P19 | Kabel-Kalle | Posenbogen | welt3/posen/W3-P19_kalle.png | ja: welt3/bewegungen/kalle_fluestern, _lachen, _zeigen, _tippen | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P20 | Kabel-Kalle 2 | Posenbogen | welt3/posen/W3-P20_kalle2.png (+ _zw) | ja: welt3/bewegungen/kalle_kabel, _entsetzt, _tabelle, _jubel | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P21 | Rebellin | Posenbogen | welt3/posen/W3-P21_rebellin.png | ja: welt3/bewegungen/rebellin_karton, _essen | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P22 | Rebell | Posenbogen | welt3/posen/W3-P22_rebell.png | ja: welt3/bewegungen/rebell_essen | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P23 | Straßenmusiker | Posenbogen | welt3/posen/W3-P23_strassenmusiker.png | ja: welt3/bewegungen/strassenmusiker_spielen (= W3-B19) | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P24 | Weinender Mann | Posenbogen | welt3/posen/W3-P24_weinender_mann.png | ja: welt3/bewegungen/weinender_mann_weinen (= W3-B20) | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P25 | Frau mit Regenschirm | Posenbogen | welt3/posen/W3-P25_frau_regenschirm.png | ja: welt3/bewegungen/frau_regenschirm_schimpfen (= W3-B21) | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-P26 | M.U.T.T.I. | Posenbogen | welt3/posen/W3-P26_mutti.png | ja: welt3/bewegungen/mutti_sprechen, _beleidigt, _herunterfahren | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P27 | Bernd | Posenbogen | welt3/posen/W3-P27_bernd.png | ja: welt3/bewegungen/bernd_davonschweben | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P28 | Piepsi | Posenbogen | welt3/posen/W3-P28_piepsi.png | ja: welt3/bewegungen/piepsi_hochfahren, _piepen | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P29 | Opa als Hologramm | Posenbogen | welt3/posen/W3-P29_opa_hologramm.png | ja: welt3/bewegungen/opa_hologramm_flehen | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P30 | Morphäus 3 | Posenbogen | welt3/posen/zusatz/morphaeus_haelt_kater.png | ja: welt3/bewegungen/morphaeus_kater_halten | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P31 | Max Labor | Posenbogen | welt3/posen/zusatz/max_portalgeraet.png | ja: welt3/bewegungen/max_portalgeraet | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-P32 | Detektiv Deckert 2 | Posenbogen | welt3/posen/zusatz/W3-P32_deckert_regen_zaehlen.png | ja: welt3/bewegungen/deckert_regen_zaehlen (Ruhe-Schleife) | nein | gebaut (20.11., Zusätze), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B01 | Schwarze Katze: Zweimal vorbeilaufen | Bewegung | welt3/katze/W3-B01_katze_f1 bis f8 (Gemini gemalt, Beinstellung aus dem Blender-Render) | ja: welt3/bewegungen/schwarze_katze_gehen, 8 Bilder | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-B02 | Max als Ente: Watscheln | Bewegung | posen/W3-P05_max_ente.png | ja: welt3/bewegungen/max_ente_watscheln, 8 Bilder Schleife | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B03 | Pixel: Schacht kriechen | Bewegung | posen/W3-B03_pixel_kriechen.png | ja: welt3/bewegungen/pixel_kriechen, 4 Bilder Schleife | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B04 | Bernd: Beleidigt davonschweben | Bewegung | posen/W3-P27_bernd.png | ja: welt3/bewegungen/bernd_davonschweben, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B05 | Piepsi: Hochfahren | Bewegung | posen/W3-P28_piepsi.png | ja: welt3/bewegungen/piepsi_hochfahren, 8 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B06 | Piepsi: Piepen | Bewegung | posen/W3-P28_piepsi.png | ja: welt3/bewegungen/piepsi_piepen, 4 Bilder Schleife | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B07 | M.U.T.T.I.: Sprechen | Bewegung | posen/W3-P26_mutti.png | ja: welt3/bewegungen/mutti_sprechen, 4 Bilder Schleife | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B08 | M.U.T.T.I.: Herunterfahren | Bewegung | posen/W3-P26_mutti.png | ja: welt3/bewegungen/mutti_herunterfahren, 8 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B09 | Roboter-Hausmeister: Wischen | Bewegung | posen/W3-B09_hausmeister_wischen.png | ja: welt3/bewegungen/hausmeister_wischen, 4 Bilder Schleife | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B10 | Agent Schmidt: Kopieren | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum2.py) | ja: effekte/fertig/W3-B10_kopieren (Lage in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B11 | Verwandlung: Effekt | Bewegung | Code (tools/grafik_w3/effekte_code.py) | ja: effekte/fertig/W3-B11_verwandlung, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B12 | Portal: Effekt | Bewegung | effekte/W3-B12_portal_inhalt.png | ja: effekte/fertig/W3-B12_portal, 8 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B13 | Regen: Effekt | Bewegung | Code | ja: effekte/fertig/W3-B13_regen, 4 Bilder, 640×360 kachelbar | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B14 | Schnee: Effekt | Bewegung | Code | ja: effekte/fertig/W3-B14_schnee, 4 Bilder, 640×360 kachelbar | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B15 | Hologramm: Effekt | Bewegung | Code | ja: effekte/fertig/W3-B15_hologramm, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B16 | Unterstadt: Fliegende Autos | Bewegung | effekte/W3-B16_auto.png | ja: effekte/fertig/W3-B16_fliegendes_auto, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B17 | Unterstadt: Nudeltopf dampft | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum.py) | ja: effekte/fertig/W3-B17_nudeltopf_dampf (Lage im Raum in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; Lage gilt für die Probe-Pixelfassung, beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B18 | Unterstadt: Neonschild mit Wackelkontakt | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum.py) | ja: effekte/fertig/W3-B18_neonschild (Lage im Raum in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; Lage gilt für die Probe-Pixelfassung, beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B19 | Straßenmusiker: Spielen | Bewegung | posen/W3-P23_strassenmusiker.png | ja: welt3/bewegungen/strassenmusiker_spielen, 11 Bilder Schleife | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-B20 | Weinender Mann: Weinen | Bewegung | posen/W3-P24_weinender_mann.png | ja: welt3/bewegungen/weinender_mann_weinen, 12 Bilder Schleife | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-B21 | Frau mit Regenschirm: Schimpfen | Bewegung | posen/W3-P25_frau_regenschirm.png | ja: welt3/bewegungen/frau_regenschirm_schimpfen, 12 Bilder Schleife | nein | Phase 1 gebaut (20.11.), wartet auf Sebastians Abnahme, dann Einbau (Welt-3-Einbau) |
| W3-B22 | Apothekengasse: Ratte huscht | Bewegung | effekte/W3-B22_ratte.png | ja: effekte/fertig/W3-B22_ratte, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B23 | Apothekengasse: Automat scannt | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum.py) | ja: effekte/fertig/W3-B23_automat_scannt (Lage im Raum in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; Lage gilt für die Probe-Pixelfassung, beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B24 | Widerstandsbasis: Großrechner | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum.py) | ja: effekte/fertig/W3-B24_grossrechner (Lage im Raum in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; Lage gilt für die Probe-Pixelfassung, beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B25 | Kühlung: Ventilator | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum.py) | ja: effekte/fertig/W3-B25_ventilator (Lage im Raum in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; Lage gilt für die Probe-Pixelfassung, beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B26 | Stadtstraße: Vogelschwarm im Takt | Bewegung | effekte/W3-B26_vogel.png | ja: effekte/fertig/W3-B26_vogelschwarm, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B27 | Küche der Orakel-Oma: Eieruhr | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum2.py) | ja: effekte/fertig/W3-B27_eieruhr (Lage in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B28 | Büroturm, 50. Stock: Klone tippen | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum2.py) | ja: effekte/fertig/W3-B28_klone_tippen (hinter der Glasscheibe links) (Lage in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B29 | Kern von M.U.T.T.I.: Lichtband | Bewegung | fehlt | nein | nein | wartet auf den Hintergrund (Kern), Sebastian |
| W3-B30 | Roboter-Hausmeister: Rollen | Bewegung | Code aus dem Stand-Sprite | ja: effekte/fertig/W3-B30_hausmeister_rollen, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B31 | Roboter-Hausmeister: Arm drehen | Bewegung | posen/W3-B31_hausmeister_arm.png (Meshy) | ja: welt3/bewegungen/hausmeister_arm_drehen, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B32 | Piepsi: Drucken | Bewegung | posen/W3-B32_piepsi_drucken.png | ja: welt3/bewegungen/piepsi_drucken, 6 Bilder | nein | Phase 2 gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B33 | Pastillenautomat: Fächer öffnen | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum.py) | ja: effekte/fertig/W3-B33_faecher_oeffnen (Lage im Raum in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; Lage gilt für die Probe-Pixelfassung, beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B34 | Glastür Büroturm: Reden | Bewegung | fehlt | nein | nein | wartet auf den Hintergrund (Stadtstraße), Sebastian |
| W3-B35 | Bürokopierer: Rattern | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum2.py) | ja: effekte/fertig/W3-B35_kopierer (Lage in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B36 | Testkammer 3: Tür und Lautsprecher | Bewegung | Code aus dem pixelierten Raum (tools/grafik_w3/effekte_raum2.py) | ja: effekte/fertig/W3-B36_lautsprecher (Lage in der JSON) | nein | gebaut (20.11.), Abnahme durch Sebastian offen; beim Einbau mit dem endgültigen Hintergrund neu rechnen |
| W3-B37 | Piepsi: Fahren | Bewegung | Code aus dem Stand-Sprite | ja: welt3/bewegungen/piepsi_fahren, 4 Bilder Schleife | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B38 | Küche der Orakel-Oma: Küchenradio spricht | Bewegung | Code (effekte_raum3.py) | ja: effekte/fertig/W3-B38_kuechenradio | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B39 | Küche der Orakel-Oma: Kuckucksuhr ruft | Bewegung | Code | ja: effekte/fertig/W3-B39_kuckucksuhr | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B40 | Laboreingang: Kartenleser blinkt | Bewegung | Code | ja: effekte/fertig/W3-B40_kartenleser | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B41 | Testkammer 1: Lautsprecher spricht | Bewegung | Code | ja: effekte/fertig/W3-B41_lautsprecher_kammer1 | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B42 | Testkammer 2: Lautsprecher spricht | Bewegung | Code | ja: effekte/fertig/W3-B42_lautsprecher_kammer2 | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B43 | Testkammer 3: Lautsprecher spricht | Bewegung | Code | ja: effekte/fertig/W3-B43_lautsprecher_kammer3 | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B44 | Testkammer 3: Tür redet | Bewegung | Code | ja: effekte/fertig/W3-B44_tuer_kammer3_redet | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B45 | Max: Verwandlung in die Ente | Bewegung | Code | ja: effekte/fertig/W3-B45_verwandlung_figur | nein | gebaut (20.11., Vollständigkeitsprüfung), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-B46 | Büroturm, 50. Stock: Terminal spricht | Bewegung | Code (effekte_raum3.py) | ja: effekte/fertig/W3-B46_terminal_buero | nein | gebaut (20.11., Zusätze), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G01 | Verwandlung (2×4) | Gegenstände | welt3/gegenstaende/W3-G01_verwandlung.png (Gemini-API) | ja: welt3/gegenstaende/sprites/inventar: rezeptkarte(_glueckskeks), schmidts_akte(_ordner), zugangskarte(_code_schluessel), omas_kekse_hundekuchen | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G02 | Kekse-Zustände (1×2) | Gegenstände | welt3/gegenstaende/W3-G02_kekse.png (Gemini-API) | ja: welt3/gegenstaende/sprites/inventar: omas_kekse, omas_kekse_ofenwarm | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G03 | Unterstadt (2×3) | Gegenstände | welt3/gegenstaende/W3-G03_unterstadt.png (Gemini-API) | ja: welt3/gegenstaende/sprites/inventar: rote_/blaue_pastille, kaffeetasse, telefonbuchseite, farbcode_zettel, morse_tabelle | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G04 | Labor (1×5) | Gegenstände | welt3/gegenstaende/W3-G04_labor.png (Gemini-API) | ja: welt3/gegenstaende/sprites/inventar: portalgeraet, gummihuhn(_toedlich), energiezelle(_vereist) | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G05 | Omas Sparschwein (1×3, Szenen-Sprites für Rätsel 4, kein Inventar) | Gegenstände | welt3/gegenstaende/W3-G05_G06_sparschwein_locher.png (Gemini-API) | ja: welt3/gegenstaende/sprites/szene: sparschwein, rezeptrolle, scherben | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G06 | Locher (1×2, Szenen-Sprites für das Zeitlupen-Ausweichen im Büroturm, kein Inventar) | Gegenstände | welt3/gegenstaende/W3-G05_G06_sparschwein_locher.png (Gemini-API) | ja: welt3/gegenstaende/sprites/szene: locher, konfetti | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-G07 | Deko Welt 3 (3×3) | Gegenstände | welt3/gegenstaende/W3-G07_deko.png (Gemini-API) | ja: welt3/gegenstaende/sprites/szene: gabel, pizzakartons, kuchen, pinnwand, origami_einhorn, handtuch, synthesizer, grossrechner, kuckucksuhr | nein | gebaut (20.11.), Abnahme durch Sebastian offen, dann Einbau (Welt-3-Einbau) |
| W3-N01 | Telefonbuchseite (Rätsel 8) | Nahansicht | welt3/nahansichten/W3-N01_*.png (Gemini-API, Schrift tools/nahansichten_welt3_schrift.py) | ja: welt3/nahansichten/fertig/telefonbuchseite.png und _en.png | nein | Probefassung (20.11.) mit gesetzter Schrift; Sebastian malt das Bild selbst, danach setzt Claude die Schrift neu (Felder neu messen) |
| W3-N02 | Akte (Regel 1) | Nahansicht | welt3/nahansichten/W3-N02_*.png (Gemini-API, Schrift tools/nahansichten_welt3_schrift.py) | ja: welt3/nahansichten/fertig/schmidts_akte.png und _en.png | nein | Probefassung (20.11.) mit gesetzter Schrift; Sebastian malt das Bild selbst, danach setzt Claude die Schrift neu (Felder neu messen) |
| W3-N03 | Kochbuch (Regel 2) | Nahansicht | welt3/nahansichten/W3-N03_*.png (Gemini-API, Schrift tools/nahansichten_welt3_schrift.py) | ja: welt3/nahansichten/fertig/kochbuch.png und _en.png | nein | Probefassung (20.11.) mit gesetzter Schrift; Sebastian malt das Bild selbst, danach setzt Claude die Schrift neu (Felder neu messen) |
| W3-N04 | Kritzelei (Regel 3) | Nahansicht | welt3/nahansichten/W3-N04_*.png (Gemini-API, Schrift tools/nahansichten_welt3_schrift.py) | ja: welt3/nahansichten/fertig/kritzelei_kammer_2.png und _en.png | nein | Probefassung (20.11.) mit gesetzter Schrift; Sebastian malt das Bild selbst, danach setzt Claude die Schrift neu (Felder neu messen) |
| W3-N05 | Morse-Tabelle (Rätsel 13) | Nahansicht | welt3/nahansichten/W3-N05_*.png (Gemini-API, Schrift tools/nahansichten_welt3_schrift.py) | ja: welt3/nahansichten/fertig/morse_tabelle.png und _en.png | nein | Probefassung (20.11.) mit gesetzter Schrift; Sebastian malt das Bild selbst, danach setzt Claude die Schrift neu (Felder neu messen) |
