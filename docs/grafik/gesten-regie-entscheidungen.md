# Gesten-Regie: Entscheidungen zu den offenen Fragen (15. November 2026)

Sebastian hat das Einbinden freigegeben und die offenen Fragen an Claude delegiert. Diese Entscheidungen gelten für die Umsetzung; sie stehen auch im Bericht.

1. **Mechanik:** `geste()`, `geste_halten()` und `rede_geste()` in `cq_figur.gd` wie in `gesten-regie.md` vorgeschlagen. Ein-Tabellen-Ansatz mit `game/skripte/gesten_einsatz.gd` (ZEILE, RUHE, WARTEN); Welt 1 und Welt 2 bekommen eigene Tabellen-Dateien (`gesten_welt_1.gd`, `gesten_welt_2.gd`), die `gesten_einsatz.gd` einliest, damit parallel gearbeitet werden kann. Im Testmodus und bei übersprungenen Szenen: keine Warte-Gesten, Gesten werden übersprungen (deterministisch).
2. **Max:** `aufheben` bei jedem Aufheben vom Boden (Hotspot-Aktion „nehmen“ an Gegenständen am Boden), `benutzen` beim Benutzen eines Gegenstands auf etwas, `schulterzucken` bei jeder zweiten „geht nicht“-Rückfallzeile (deterministisch abwechselnd, nicht zufällig), `kopf_kratzen` bei Rückfallzeilen zum Ansehen ohne Treffer in jeder vierten, `zeigen` bei Hinweis-Zeilen, die auf etwas im Raum verweisen. Pixel bekommt beim Ansehen keine Extra-Geste.
3. **Schmied:** `haemmern` als Ruhe-Schleife wieder an (`HAEMMERN_AN = true`); `ins_feuer`, `blasebalg`, `zum_amboss`, `abschrecken`, `schweiss_abwischen` als Warte-Gesten im Wechsel. Ein Gespräch unterbricht den Ablauf (zurück auf idle/talk). Funken: Aufschlag-Bild an die neue JSON anpassen. Alwin `ruehren` ebenfalls als Ruhe-Schleife an.
4. **Waldemar Fußbad:** läuft an der Troll-Brücke an seinem Platz als Ruhe-Schleife bis `W1_BRUE_WAL_1000`, danach normales idle.
5. **Moderwort:** keine Sprite-Variante. `zaubern` und `niesen` nur vor Zeile `MOD_0290`; danach nur `nase_putzen` und Reden.
6. **Humbert Keller:** der Krug bleibt als Prop auf der Theke (Höhe wie im Spiel geprüft); nach R1c kommt er mit der rückwärts abgespielten Keller-Animation wieder.
7. **Minka umgarnen:** Während `pixel_minka_umgarnen` wird die Minka-Figur ausgeblendet und danach wieder eingeblendet.
8. **Ziegen:** die neuen Gänge (`gehen`) ersetzen `walk`. **Hermes:** `joggen` (Rig) ist die Haupt-Animation; `joggen_posen` bewusst nicht eingebunden (doppelt).
9. **Sobek:** `verbeugen`/`gaehnen` nur an Land; im Wasser `treiben` (idle) und `reden`.
10. **Fährfahrt und Tag-1-Rennen:** keine Szene/Marker vorhanden → bewusst nicht eingebunden (Grund in der Tabelle), Animationen liegen bereit.
11. **W2_BUER_BE1_0550:** die Stempel-Geste geht an Beamter 2 (`stempeln`), wenn er im Raum ist; sonst keine.
12. **Max Bohne:** die ganze Animation bei `1140` (Pflanzen und Gießen in einem).
13. **Pixel springen:** Steckt die Höhe in den Bildern, wird sie im Tween nicht doppelt addiert (die Umsetzung prüft das und passt `springen_zu()` an).
14. **Fehlende Gesten** (Minka/Hofkater fauchen, Toadi auf der Stelle rennen, Fährmann verbeugen): nicht neu erzeugt; in der Tabelle als „fehlt, bewusst nicht“ vermerkt.
15. **Besen in Abstellkammer 1:** nein.
16. **Figuren ohne `walk`** (Hermes, Leonidas, Hofkater, Schildkröte, Sobek an Land, Archimedes mit Handtuch): `laufen_zu()` nutzt die passende Spezial-Gangart (`joggen`, `losrennen`, `weggehen`, `laufen`, `kriechen`, `heureka`) über `walk_animation`; wo keine passt, gleitet die Figur nicht, sondern bleibt stehen.
