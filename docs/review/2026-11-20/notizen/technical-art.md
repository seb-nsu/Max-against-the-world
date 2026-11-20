# Review Welt 3, Technical Artist (Grafik, statisch) – Notiz

Rolle: Technical Artist, Teil Grafik (Kürzel TA). Geprüft: `main` auf `a65f55e0` im Prüf-Checkout cq-r4. Belege relativ zu `docs/review/2026-11-20/`.

Stand: in Arbeit.

## Funde

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| TA-01 | R02 Apothekengasse | kritisch | Technik, Positionierung | **Raum ist 1280 px breit gemalt, die Szene aber nur 640 px breit.** `room_apothekengasse.tscn` Z. 20 `width = 640`, obwohl `docs/welten/welt-3.yaml` Z. 23 „1280x360 (Entscheidung 20.11.2026)“ und Laufbereich bis x 1180 reichen. Die Kamera bleibt immer bei x 320: der Pastillenautomat (Rätsel 3, Hotspot x 545–745) ist nur zur Hälfte zu sehen, Wandlampe (Hotspot x 900–955), Gully-Dampf und Ratte (x 1040–1180) nie. Max startet auf dem Startmarker (640, 322) genau am rechten Bildrand und läuft bei Klicks rechts aus dem Bild. | belege/technical-art/r02_apothekengasse_breite_640.png (Spielbild mit Max auf x 1000, Kamera 320); belege/raeume/apothekengasse_anfang.json `breite: 640`, `kamera_max [320,180]` | Szene neu bauen (`tools/godot_raeume.py` bzw. Layout-Bau) mit `width = 1280`; danach Startmarker und Morphäus' Platz im Bild prüfen. In `pruefen.py` prüfen: `width` der Szene = Breite des Hintergrunds. |
| TA-02 | R06, R08, R09–R12 (alle 6 Code-Sicht-Räume) | wichtig | Grafik, Technik | **Code-Sicht sitzt in allen sechs Räumen 180 px zu hoch, nicht nur in der Stadtstraße.** `welt_3.gd` `_code_sicht_zeigen()` Z. 980–985 hängt das Bild als `centered`-Sprite an `Props/Background` und setzt es auf `bg.global_position`. Der Background-Prop liegt zur Laufzeit aber auf y 0 (Mitte x), sein Sprite reicht von y 0 bis 360 (siehe `*_code.json`: Background `pos [320,0]`, `rect [0,0,640,360]`). Ergebnis: Bild von y −180 bis 180; oben sieht man die untere Hälfte des Drahtgitters (Boden, Sockel), die untere Bildhälfte bleibt ohne Code-Sicht. Etiketten und grüne Figuren stimmen, nur das Bild nicht. | belege/raeume/stadtstrasse_codesicht.png, kern_codesicht.png, buero_50_codesicht.png, testkammer_2_codesicht.png; `welt_3.gd` Z. 980–985 | `bild.centered = false` und `bild.global_position = Vector2.ZERO` (Hintergründe beginnen immer bei 0,0), oder Offset vom Sprite des Backgrounds übernehmen. Danach die sechs `_codesicht.png` neu aufnehmen. |

## Gut gelöst

## Nicht geprüft

## Vorschläge für die Lessons Learned
