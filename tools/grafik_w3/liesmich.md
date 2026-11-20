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
