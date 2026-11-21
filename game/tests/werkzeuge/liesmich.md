# Aufnahme- und Prüfwerkzeuge (keine CI-Tests)

Feste Fassungen der Review-Skripte vom 20.11. mit dem Abschnitt als Parameter. Sie laufen nicht in der CI: `pruefen.yml` und `testbuild.yml` rufen ihre Tests einzeln mit Namen auf, und der Export schließt `tests/*` aus. Persönliche Arbeitskopien heißen `game/tests/_*.gd` und sind in `.gitignore`.

Beide brauchen ein Fenster (nicht `--headless`); aus dem Checkout starten, das Fenster liegt außerhalb des Bildschirms:

```
godot --path game --position 6000,3000 -s res://tests/werkzeuge/raumaufnahme.gd -- welt-3 [AUSGABE] [ende|varianten|code] [nur=raum,raum]
godot --path game --position 6000,3000 -s res://tests/werkzeuge/zeigerraster.gd -- welt-3 [AUSGABE] [ende] [nur=raum,raum] [setze=SCHALTER+R..] [tag=name] [pixel]
```

Abschnitt: `prolog`, `welt-1` … `welt-4`, `finale` (Räume aus dem Bauplan). Ohne AUSGABE landen die Dateien unter `user://raumaufnahme/<abschnitt>/` bzw. `user://zeigerraster/<abschnitt>/`; der Pfad steht am Ende der Ausgabe.

- `raumaufnahme.gd`: je Raum ein Bild mit Max an der Startstelle (`_mitmax.png`), ein Panorama über die ganze Breite und ein JSON mit Klickflächen, Props, Figuren, Laufbereichen und Markern. `ende`: alle Rätsel gelöst, `varianten`: Zustandsbilder (Tabelle `VARIANTEN` im Skript, je Welt ergänzen), `code`: Code-Sicht (Welt 3).
- `zeigerraster.gd`: tastet jeden Raum mit simulierten Mausbewegungen im 6-px-Raster ab und schreibt, welches Objekt an jeder Stelle unter dem Zeiger liegt (`_zeiger.json`) und ob die Oberfläche die Maus schluckt (`#UI`). `pixel`: Pixel ist die Spielfigur.

Beide sind Schritte des Prüftors vor jedem Grafik-Einbau-PR (Häkchenliste in `.github/pull_request_template.md`). Weitere Review-Skripte (Sackgassen-Nachstellung, Laufwege, Animations-GIFs) liegen unter `docs/review/2026-11-20/werkzeuge/godot/`.
