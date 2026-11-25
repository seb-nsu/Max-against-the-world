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
