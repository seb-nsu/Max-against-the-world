# Aufnahme- und Prüfskripte aus den Prüf-Checkouts (gesichert am 20.11.2026)

Diese Godot-Skripte lagen nur ungetrackt in den Prüf-Checkouts (`cq-r3`, `cq-kvz`, `cq-review` unter `%TEMP%`)
und im gemeinsamen Ordner. Sie sind hier gesichert, damit die Checkouts aufgeräumt werden können.
Zum Benutzen in `game/tests/` eines eigenen Prüf-Checkouts kopieren (nicht ins Repo unter `game/tests/`,
dort laufen sie sonst in den Tests mit) und headless starten, wie in den Lessons Learned beschrieben.

- `_review_raeume.gd`: Raum-Panoramen mit JSON aller Klickflächen
- `_review_gs_zeiger*.gd`, `_review_gs_klicks.gd`, `_review_gs_eingabe.gd`, `_review_gs_sobek.gd`: Zeigerraster, welches Objekt gewinnt, Eingabe
- `_review_ld_laufwege*.gd`: Lauftests
- `_review_ta_anim.gd`: Animations-GIFs
- `_review_ev_w2.gd`, `_review_gd_w2.gd`, `_review_nd_hermes.gd`: Welt-2-Ereignisse, Gespräche, Hermes-Hänger
- `_film_kvz.gd`, `_film_review.gd`: Bildfolgen aus dem laufenden Spiel (zwei Fassungen)
- `_animationen_w2.gd`, `_gesten_blick.gd`, `_positionen_w2.gd`: Welt-2-Prüfungen aus dem gemeinsamen Ordner
