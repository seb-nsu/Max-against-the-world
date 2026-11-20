# Werkzeuge Welt-3-Grafik (Posen, Bewegungen, Katze)

Stand 20. November 2026, Phase 1 (Unterstadt). Bilder und Arbeitsdateien liegen außerhalb des Repos unter
`E:\Game Engine\Grafiken\assets\welt3\` (konzept, stand, posen, bewegungen, pruefung) und `E:\Game Engine\Grafiken\3d\welt3\`.

| Datei | Zweck |
| --- | --- |
| `magenta_frei.py` | Konzeptblatt oder Posenbogen freistellen (Magenta-Verlauf, durchscheinender Poncho), seitlich polstern |
| `groesse_pruefen.py` | jede Pose gegen das Standbild: Höhe, Kopf- und Beinbreite (5-%-Regel); Rumpfbreite nur als Hinweis, weil Arme davor sie verfälschen |
| `katze_lauf.py` | Blender im Hintergrund: schwarze Katze aus Grundkörpern, Bein-Gelenke, 8 Bilder Gang, flacher Seiten-Render |
| `katze_pixel.py` | Renderbilder auf 47 px, Farben nah/fern aus dem Stand-Sprite, Kontur, gelbgrünes Auge |
| `folgen_mit_zwischenbildern.py`, `zwischenbilder_phase1.txt` | Gesten neu zusammensetzen: Stand, Halbpose (Zwischenbogen), Pose, fußgenau ausgerichtet |
| `katze_gemalt.py` | gemalte Lauf-Einzelbilder an der Rumpflänge auf einen Maßstab, Auge gelbgrün (Katze W3-B01) |
| `posen_liste_phase1.txt` | alle Aufrufe von `bew.py` (Kopie mit Welt-3-Pfaden: `3d\welt3\bew_w3.py`) mit Posen, Folge und Zusatzschaltern |

Ablauf: Stand-Sprite mit `magenta_frei.py` (rand 1000) und `tools/figur.py sprite --palette keine --kontur 262b44`;
Posenbogen mit `magenta_frei.py` (rand 0) und `bew_w3.py ... --dick 0 --linien 0.4 --saett 1.3`;
Läufe mit `3d\skripte\bein_rig2.py` und Max' Gang-Winkeln `3d\max\teile\gang2_arme.json` (Zyklus 5 bis 32, `zentrieren: true`).
Katze: `blender -b --python katze_lauf.py -- <render>` liefert die Beinstellungen, Gemini malt jedes Bild nach (nur Konzeptblatt und Posenvorlage anhängen), dann `magenta_frei.py` und `katze_gemalt.py`. `katze_pixel.py` (direkt aus dem Render) wirkte zu steif und ist nur noch Ersatzweg.

Phase 2: `quellen_phase2.txt` (welche Bögen mit welchen Schaltern von `bew_w3.py --probe` umgerechnet werden),
`folgen_phase2.txt` und `folgen_aus_quellen.py` (Bewegungen aus Pose, Halbpose und Zusatzbogen; hängende Figuren mit Anker „oben“),
`effekte_code.py` (Regen, Schnee, Hologramm, Verwandlung) und `effekte_bild.py` (Portal, Auto, Ratte, Vogelschwarm, Hausmeister rollen).
`bew_w3.py` kennt zusätzlich `--farbtausch VON:NACH:-N` (nur die untersten N Zeilen).

`t2m_seite_rendern.py`: Blender im Hintergrund, rendert einen Meshy-Text-zu-Bewegung-Clip (FBX) als graue Seitenansicht; die Bilder dienen als Haltungsvorlage für gemalte Zwischenposen (`blender -b --python t2m_seite_rendern.py -- clip.fbx ziel schritt`).
`t2m_bvh_strich.py`: Swift-Clips (BVH) als Strichmännchen in der Seitenansicht (Blender-Schritt und Zeichenschritt). `kapsel_folgen.py`: Kapsel-Bildfolgen für Aufstehen und Hinlegen samt Fußpunkt für die freie Max-Figur.
`zustand_einsetzen.py`: Raumzustand nur an der geänderten Stelle einsetzen (8×8-Felder, eigene Paletten). `effekte_raum4.py`: Stadtstraße und Kern (Glastür, Radiowecker, Lichtband, Hitzeflimmern, Kabelpuls, Platzierung). `effekte_auto_takt.py`: rotes Auto in Seitenansicht für die Autos im Takt.

Korrekturen 20.11. (Review W3-NS-03, W3-NS-04, W3-R05-02): `stand_korrektur.py` setzt aus Gemini-Varianten
(`welt3\korrektur_20-11\`) nur die geänderte Stelle in die Stand-Sprites (Mund der Frau, Schmidts Füße, Mopp und
gelbes Auge des Hausmeisters). `stelle_uebertragen.py` überträgt die Stelle in alle Gesten-Streifen (gemeinsame Lage
je Bild, nur Pixel, die noch dem alten Stand gleichen; „form“ für Posen mit den Beinen des Stands).
`hausmeister_mopp.py` dreht den Mopp in den Hausmeister-Posen (Kopf oben weg, Stiel über der Faust, Mopp-Kopf am
Boden) und färbt das Auge. Danach `reden_ruhe.py <stand> <aus> figur …` und `figuren_einbau.py <quelle> figur …`
mit `welt3\korrektur_20-11\quelle` als Übergabeordner.

Korrekturen 20.11., Teil 2 (Review W3-15, W3-16, W3-NS-01, W3-NS-02):
- `figuren_einbau.py` sucht die Lage der Gesten um die Fußlinie des Stands statt um die Zellunterkante (vorher lagen
  62 Bewegungen von 15 Figuren 2 px zu tief) und bricht ab, wenn das erste Bild einer neu eingebauten Geste nicht auf
  der Fußlinie des Stands steht oder der Stand nur verschoben darin liegt. Quelle für alle Welt-3-Figuren ist der
  Welt-3-Ordner (reden_ruhe, bewegungen, stand) mit `korrektur_20-11\quelle` darüber.
- `kopf_aus_pose.py`: Morphäus' Stand bekommt den Kopf aus `morphaeus_schild_umdrehen` P1 (Brille auf der Stirn,
  Schnitt 36 Zeilen). Danach `reden_ruhe.py … morphaeus` (Mund jetzt bei 40, 31) und
  `stelle_uebertragen.py <alter Stand> <neuer Stand> <bewegungen> <ziel> morphaeus weit` („weit“ findet den Kopf auch
  im Gang mit seinem großen oberen Rand).
- `pixel_trab.py`: Pixels Trab (8 Bilder, 30 ms) aus Bild 4 des alten Gangs mit gescherten Beinen, 3 Sheet-px je
  Bild am Boden; dazu `walk_speed` 110 in `character_pixel.tscn` (Rutschen 9 % statt 86 %). Ergebnis
  `pixel_gehen.png/.json` in den Bewegungsordner, `figuren_einbau.py … pixel` (der Trab wird nicht verkleinert).
- `effekte_auto_takt.py` füllt beim Federn die frei werdende Zeile (Vorlage `effekte\frei\W3-B54_auto_seite.png`);
  das Ergebnis `W3-B54_auto_im_takt.png` kommt unverändert nach `game/grafik/ambiente/w3_auto_im_takt.png`.
