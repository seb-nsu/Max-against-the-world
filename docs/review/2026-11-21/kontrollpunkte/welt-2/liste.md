# Kontrollpunkte Welt 2 (pr-w2, Cloud-Lauf ab 25.11.2026)

Alle Stände stammen aus dem Lauf `pr-w2-haupt`: Anfang ist `kontrollpunkte/welt-1/welt1_ende.json` (echter Endstand von Welt 1), danach nur echte Klicks (Fernsteuerung ohne Testmodus). Befehlsfolge: `belege/pr-w2/loesungsweg.txt`. Benutzen: Datei nach `ORDNER/staende/` kopieren, `stand holen NAME`. Beim Zurückspringen die Fernsteuerung neu starten (siehe `../ACHTUNG-stand-holen.md`).

| Name | Raum | Gelöst / Zustand | Inventar Max | Entstanden |
| --- | --- | --- | --- | --- |
| `w2_00_anfang` | nil_delta | = `welt1_ende`, nichts gelöst | thunfischdose, PixelFeld, notizbuch, socke, kochloeffel, dosenoeffner, handy, kaugummi, kugelschreiber | `stand holen welt1_ende` |
| `w2_01_nach_R1` | nil_delta | R1 (Fähre frei), Fährmann ganz befragt (Baustein „stirbt“) | wie oben | Pixel: Klick Fähre |
| `w2_02_thron_anfang` | thronsaal_ramses | R1; alle 7 Bausteine aus dem Ansehen; Papyrusblatt; Steinmetz befragt; Thronsaal erstmals betreten | + papyrusblatt | Klickweg |
| `w2_03_vor_R2a` | thronsaal_ramses | Schreiber befragt, Inschrift gelesen, zwei falsche Sätze gelegt | + bildtafel | Klickweg |
| `w2_04_nach_R2a` | thronsaal_ramses | R1, R2a | – bildtafel | Mann, Katze, Pharao, Ohr |
| `w2_05_vor_duell` | thronsaal_ramses | R1, R2a, Sobek folgt (`W2_SOBEK_FOLGT`) | wie oben | Pixel: Klick Sobek im Nil-Delta |
| `w2_06_duell_gefolge` | thronsaal_ramses | Duell läuft, Gefolge gezeigt | wie oben | Pixel: Klick Hofkater |
| `w2_07_duell_vor_wunder` | thronsaal_ramses | Duell: Opfergabe und Gefolge | wie oben | Thunfischdose auf Hofkater |
| `w2_08_nach_audienz` | thronsaal_ramses | R1, R2a, R2b, Audienz; Baustein „sonne“ | – kaugummi | Kaugummi auf Kaugummi |
| `w2_09_kueche_anfang` | palastkueche | wie oben, Küche erstmals betreten | wie oben | Klickweg |
| `w2_10_kueche_zutaten` | palastkueche | Nebet befragt; Brot, Datteln, Zwiebel, Traubensaft genommen | + brot, datteln, zwiebel, traubensaft | Klickweg |
| `w2_11_fladen_fertig` | palastkueche | Fladen mit Kruste | – brot, datteln, zwiebel; + fladen | Datteln auf Brot, Zwiebel auf Fladen, Fladen in den Ofen |
| `w2_12_nach_R4` | palastkueche | R1, R2a, R2b, R4 | – fladen; + olivenoel | Fladen auf Nebet |
| `w2_13_sphinx_anfang` | sphinx | wie oben, Pharaonenteller genommen, Sphinx erstmals betreten | + pharaonenteller | Klickweg |
| `w2_14_nach_R8` | sphinx | + R8 (Wort Handy), Konter 1 bis 3 | + schriftrolle | Sphinx Option 0250 |
| `w2_15_vor_erster_fahrt` | nil_delta | wie oben, am Steg | wie oben | Klickweg |
| `w2_16_olympia_steg` | faehrsteg_olympia | erste Fahrt gemacht, Traubensaft ist Essig | wie oben | Flusskarte „Fährsteg Olympia“ |
| `w2_17_agora_anfang` | agora | Agora erstmals betreten, mit niemandem geredet | wie oben | Klickweg |
| `w2_18_nach_R9` | agora | + R9 (Konter 4, 5) | wie oben | Menge, Option 0420 |
| `w2_19_buero_anfang` | startbuero | + Cicero befragt (`W2_CICERO_FORDERUNG`), Baustein „blau“, Konter 6 und 7 (Tonne), Brian befragt; Büro erstmals betreten | wie oben | Klickweg |
| `w2_20_buero_formular` | startbuero | Beamte befragt, Hermes im Büro, leeres Formular | + leeres_formular | Klickweg |
| `w2_21_rundschreiben` | startbuero | + R3a (Weg A) | – kugelschreiber, leeres_formular; + rundschreiben | Kugelschreiber auf Formular |
| `w2_22_nach_R3` | startbuero | + R3b, Sandalen | – rundschreiben; + startpass, sandalen | Rundschreiben auf Beamter 1 |
