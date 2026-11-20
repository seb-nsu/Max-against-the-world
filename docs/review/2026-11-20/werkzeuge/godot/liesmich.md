# Aufnahme- und Prüfskripte des Welt-3-Reviews (20.11.2026)

Zum Benutzen in `game/tests/` eines eigenen Prüf-Checkouts kopieren (nicht ins Repo unter `game/tests/`, dort laufen sie sonst in den Tests mit) und mit Godot starten, z. B.
`--path game --position 6000,3000 -s res://tests/_review_w3_raeume.gd -- <ausgabeordner> [ende|varianten|code] [nur=<raum>]`.

- `_review_w3_raeume.gd`: Raum-Panoramen, Zustände, Code-Sicht, JSON aller Klickflächen
- `_review_ev_w3_belege.gd`: Nachstellung der Sackgassen (Szenarien `nd01`, `sackgasse`, `tuer`, `apo`, `mutti`)
- `_review_gs_w3_*.gd`: Zeigerraster, Klicktest, Zustände ohne Testmodus, Pixel-Klickweg, Kamera, Nehmen
- `_review_gd_w3_szenarien.gd`: abweichende Rätsel-Reihenfolgen, Laden mit getrennten Figuren (`haupt`, `laden`)
- `_review_ld_w3_laufwege.gd`: Lauftests mit echter Wegfindung
- `_review_an_w3_anim.gd`: Animations-GIFs aus dem Spiel
- `_review_nd_nar.gd`, `_review_nd_deckert.gd`: NAR-Anzeige, Mensch-Test über das Gespräch
- `_review_ta_bild.gd`, `_review_ta_groessen.gd`: Raumbild mit Effekten, Größen und Tönung je Figur
