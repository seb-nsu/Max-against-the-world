# Kontrollpunkte Welt 1 (pr-w1, Cloud-Lauf ab 25.11.2026)

Alle Stände stammen aus dem Lauf `pr-w1-haupt`: Anfang ist `kontrollpunkte/prolog/prolog_ende.json` (echter Prolog-Endstand von `pr-p`), danach nur echte Klicks (Fernsteuerung ohne Testmodus). Befehlsfolge: `belege/pr-w1/loesungsweg.txt`. Benutzen: Datei nach `ORDNER/staende/` kopieren, `stand holen NAME`.

| Name | Raum | Gelöst / Zustand | Inventar Max (zusätzlich zu thunfischdose, PixelFeld, reisetasche, notizbuch, opas_zettel) | Entstanden |
| --- | --- | --- | --- | --- |
| `w00_anfang` | dorfplatz | = `prolog_ende`, nichts gelöst | – | `stand holen prolog_ende` |
| `w01_taverne_anfang` | taverne | Toadi befragt, Eimer, Bestellzettel, Steckbrief genommen; Taverne betreten, Wechsel frei | eimer, bestellzettel, steckbrief | Klickweg |
| `w02_vor_R1` | taverne | Humbert befragt (ohne Wein) | wie oben | Klickweg |
| `w03_nach_R1a` | taverne | R1a (Minka draußen), Pixel hat Berta übersetzt (`W1_BERTA_MUSIK`) | wie oben | Pixel: Klick Huhn, Klick Minka |
| `w04_vor_R1b` | taverne | R1a; Gollo befragt | wie oben | Klickweg |
| `w05_vor_R1c` | taverne | R1a, R1b (Humbert im Keller) | wie oben | Humbert: Wein, Schicksalsberg |
| `w06_nach_R1` | taverne | R1 ganz | + goldmuenze, kaesefondue | Thunfischdose auf Gollo |
| `w07_dorf_nach_R1` | dorfplatz | R1; Berta weg, Ei und Ziegenfell genommen | + ziegenfell_vorleger, ei | Laute, Ei, Vorleger |
| `w08_vor_R2` | zauberstabladen | Stabmacher befragt, Kochlöffel genommen | + kochloeffel | Klickweg |
| `w09_nach_R2` | zauberstabladen | R1, R2 | – kaesefondue, + socke | Fondue auf Kochlöffel |
| `w10_nach_R5` | dorfplatz | R1, R2, R5 | – goldmuenze, + zauberbohne | zwei falsche Wünsche, dann richtiger |
| `w11_bohne_gepflanzt` | dorfplatz | Bohne im Erdfleck, Eimer voll | – zauberbohne | Klickweg |
| `w12_nach_R8` | dorfplatz | R1, R2, R5, R8 | Eimer leer | Eimer auf Erdfleck |
| `w13_vor_bestellung` | dorfplatz | Schmiede-Ziege folgt, Krug genommen | + krug | Schmiede |
| `w14_nach_lieferung` | dorfplatz | XXL-Ziege geliefert (Rotkäppchen danach bei (1270,290), siehe GD-W1-K1) | – bestellzettel | Bestellzettel aufs Dorfbrett |
| `w15_bruecke_erstmals` | trollbruecke | erste Ankunft an der Brücke mit zwei Ziegen | wie oben | Waldweg |
| `w16_vor_R3_fell` | trollbruecke | Satzung gelesen, Waldemar befragt | wie oben | Klickweg |
| `w17_nach_R3` | trollbruecke | R3 (Pixel im Fell) | – ziegenfell_vorleger | Fell auf Pixel (Figur) |
| `w18_nach_R4a` | trollbruecke | R4a | wie oben | Pixel, Schmiede-Ziege, XXL-Ziege |
| `w19_nach_R4b` | trollbruecke | R4a, R4b | wie oben | Schild (Max), dann Pixel: je 2× beide Ziegen |
| `w20_vor_R4c` | trollbruecke | wie w19, Eimer voll | wie oben | Wasser vom Brunnen |
| `w21_nach_R4` | trollbruecke | R1–R5, R8 | + ziegenfell_vorleger, Eimer leer | Eimer auf Waldemar |
| `w22_wald_erstmals` | zauberwald | erste Ankunft, Wasserschloss besucht | wie oben | Klickweg |
| `w23_wald_pilz` | zauberwald | Leuchtpilz genommen | + leuchtpilz | Klick Leuchtpilze |
| `w24_waldemar_singt` | trollbruecke | Bergwerk besucht, Grimmzahn befragt, Waldemar zugesagt (`W1_WALDEMAR_SINGT`) | wie oben | Option 0290 |
| `w25_nach_R7` | zauberwald | R7 (Waldemar hat gesungen, Socke voller Pollen) | Socke jetzt mit Pollen | Zauberwald betreten |
| `w26_klasse_anfang` | klassenzimmer | Alwin befragt (`W1_REZEPT_BEKANNT`), Hinweiszettel | + hinweiszettel | Gespräch Alwin |
| `w27_kessel_ei_pilz` | klassenzimmer | Ei und Leuchtpilz im Kessel | – ei, – leuchtpilz | Ei, Pilz auf Kessel |
| `w28_milch` | schmiede | Krug mit Ziegenmilch (`W1_MELK_SCHWUR`) | Krug voll | Krug auf Schmiede-Ziege |
| `w29_nach_R6a` | klassenzimmer | R6a | – krug | Krug auf Kessel |
| `w30_nach_R6b` | klassenzimmer | R6b, Zeugnis-Nahansicht gesehen | + leuchttrank, + zeugnis, – hinweiszettel | Flasche 3 auf Kessel |
| `w31_luft_maklerin_frei` | luftschloss | Zeldina nach der Maklerin gefragt (`W1_MAKLERIN_FREI`) | wie oben | Option 0280 |
| `w32_nach_R9` | luftschloss | R9, Kritzelei angesehen, Zeldina folgt | – steckbrief | Maklerin Option 0470 |
| `w33_bergwerk_vor_R10` | bergwerk | wie w32, zusätzlich `W1_PASSWORT_MO` | wie oben | Klickweg |
| `w34_nach_R10b` | bergwerk | Leuchttrank abgegeben (`W1_GOBLIN_LICHT`), R10 über Weg B, Goblin-Lied gehört | – leuchttrank, + tarifvertrag | Leuchttrank auf Grimmzahn, Option 0390 |
| `w35_nach_R11b` | turmkeller | R11b (Besen in Kammer 1) | wie oben | Pixel: drei Kreuzungen; Max: Kammertür |
| `w36_kammern_anfang` | abstellkammern | Ankunft bei Smaugi | wie oben | Wendeltreppe |
| `w37_R12_mitte` | abstellkammern | Schwerter und Fackeln vergeben | wie oben | Schwerter→Humbert, Fackeln→Grimmzahn |
| `w38_nach_R12` | abstellkammern | R12 | + drachenei | Kronleuchter→Zeldina |
| `w39_nach_R11a` | abstellkammern | R11a (Geheimtür offen) | wie oben | Mo, Knuddel, Puddi, Bärchen |
| `w40_thronsaal_anfang` | thronsaal | Ankunftsszene vorbei | wie oben | Geheimtür |
| `w41_R13_geniest` | thronsaal | `W1_MOD_GENIEST` | wie oben | Socke auf Moderwort |
| `w42_R13_kaese` | thronsaal | `W1_MOD_KAESE` | – kochloeffel | Kochlöffel auf Moderwort |
| `w43_zs1_dachboden` | dachboden | Welt 1 fertig, Zwischenspiel 1, vor dem Packen | – drachenei, + kochloeffel | Klick Moderwort |
| `w44_zs1_gepackt` | dachboden | gepackt: Socke und Dosenöffner | – reisetasche, eimer, ziegenfell_vorleger, zeugnis; + dosenoeffner | Drehknopf, Packen, „Fertig gepackt“ |
| **`welt1_ende`** | nil_delta | **erster freier Moment in Welt 2**, echter Durchlauf ab `prolog_ende` (R10 über Weg B, Leuchttrank vorher abgegeben) | thunfischdose, PixelFeld, notizbuch, socke, kochloeffel, dosenoeffner, handy, kaugummi, kugelschreiber | Drehknopf |

Hinweise zu `welt1_ende`: Wahlfächer Socke und Dosenöffner; in der Fundkiste liegen Reisetasche, Eimer, Ziegenfell-Vorleger, Zeugnis. Weg A von Rätsel 10 ist wegen GD-W1-K1 nicht spielbar, daher Weg B. Beim Zurückspringen auf frühere Stände die Fernsteuerung neu starten (siehe `../ACHTUNG-stand-holen.md`).
