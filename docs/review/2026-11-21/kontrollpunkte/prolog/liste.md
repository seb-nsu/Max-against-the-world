# Kontrollpunkte Prolog (pr-p)

Alle Stände sind **echte Spielstände vom Klickweg** (Lauf `pr-p-haupt`, 25.11.2026, frischer Lauf ab „Neues Spiel“, Tempo 4, Textmodus `klick`, Sprache DE), entstanden mit der Befehlsfolge in `belege/pr-p/loesungsweg.txt`. Kein Zustand wurde im Code gesetzt. Benutzen: Datei nach `ORDNER/staende/` kopieren, dann `stand holen NAME`.

| Name | Raum | Was gelöst ist | Inventar Max | Entstanden |
| --- | --- | --- | --- | --- |
| `p00_wohn_anfang` | Wohnzimmer | nichts; Eröffnung „Kein WLAN“ gespielt, erster freier Moment | – | Lösungsweg bis Zeile `stand sichern p00_wohn_anfang` |
| `p01_tasse` | Wohnzimmer | Teetasse genommen | teetasse | wie oben, `klick @teetasse` |
| `p02_dose` | Treppenhaus | Thunfischdose genommen | teetasse, thunfischdose | `klick @thunfischdose` |
| `p03_dach_nach_auftrag` | Dachboden | Szene „Opas Auftrag“ gespielt, P1 offen | teetasse, thunfischdose | `klick @ausgang_dachboden`, `warte` |
| `p04_oeffner` | Dachboden | Dosenöffner genommen | + dosenoeffner | `klick @dosenoeffner` |
| `p05_dose_offen` | Dachboden | `P0_DOSE_OFFEN` | teetasse, thunfischdose (offen), dosenoeffner | Öffner mit Dose kombiniert |
| `p06_pixel_geweckt` | Dachboden | `P0_PIXEL_GEWECKT` (Pixel lehnt die Dose ab) | wie p05 | offene Dose auf Pixel |
| `p07_tasse_gefuellt` | Dachboden | `P0_TASSE_GEFUELLT` | wie p05 (Tasse gefüllt) | Dose mit Tasse kombiniert |
| `p08_p1_geloest` | Dachboden | P1 gelöst, Pfote aktiv, Zapp-O-Mat rauscht | thunfischdose, dosenoeffner, PixelFeld | gefüllte Tasse auf Pixel |
| `p09_buegel` | Dachboden | Kleiderbügel genommen | + drahtkleiderbuegel | `klick @drahtkleiderbuegel` |
| `p10_p2_geloest` | Dachboden | P2 gelöst (Antenne sitzt) | thunfischdose, dosenoeffner, PixelFeld | Bügel auf Zapp-O-Mat |
| `p11_kalender_gesehen` | Dachboden | Nahansicht Kalender gesehen (Max kennt Kanal 3), P3 offen | wie p10 | `rklick @kalender`, `knopf X` |
| **`prolog_ende`** | **Dorfplatz (Welt 1)** | **Prolog ganz gelöst (P1–P3), Reisetaschen-Szene, Ankunft und Toadi-Szene gespielt, Opas Zettel gelesen (`W1_ANK_NACHTRAG`), erster freier Moment in Welt 1** | **thunfischdose, PixelFeld, reisetasche, notizbuch, opas_zettel** (Dosenöffner bleibt laut Bauplan auf dem Dachboden) | **ganzer Lösungsweg; Abschnitt `welt-1`, Max bei Raum (430,320), Pixel (365,320), Toadi (720,300)** |

Schalter in `prolog_ende`: `P0_DOSE_OFFEN`, `P0_P1_GELOEST`, `P0_P2_GELOEST`, `P0_P3_GELOEST`, `P0_PIXEL_GEWECKT`, `P0_TASSE_GEFUELLT`, `W1_ANK_NACHTRAG`, dazu `BESUCHT_*` und `NAHANSICHT_kalender`, `NAHANSICHT_opas_zettel`.
