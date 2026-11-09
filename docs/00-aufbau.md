# Aufbau der Dokumente: wer besitzt welche Information

Stand 9. November 2026. Ab heute ist dieses Repo die Hauptfassung. Das Online-Dokument ist eingefroren und dient nur noch zum Lesen; Änderungen passieren hier und laufen durch die Prüfung (`tools/pruefen.py`).

Jede Information hat genau einen Besitzer. Andere Dateien dürfen sie nennen, aber nur so, wie der Besitzer sie festlegt; bei einem Widerspruch gilt der Besitzer, und der Fehler wird in der anderen Datei korrigiert.

| Information | Besitzer | Andere Dateien |
| --- | --- | --- |
| Geschichte, Ton, Figurencharakter, Welt-Idee, Running Gags, Finale-Ablauf als Erzählung, Rechtscheck der Namen | `01-konzept.md` | verweisen nur |
| Räume, Wege und Ausgänge, Raumgröße | `welten/<welt>.yaml` | Rätsel beschreibt, Grafik zeichnet, Skript nutzt den Raum-Code |
| Gegenstände: Name, Fundort, Zustände, Herkunft, Verwendung, Mitnahme in andere Welten | `welten/<welt>.yaml` | Rätsel erklärt, Grafik zeichnet jeden Zustand, Skript kommentiert |
| Figuren: Name, Sprecherkürzel, Raum, Größe in Pixeln | `welten/<welt>.yaml` | Grafik beschreibt das Aussehen, Skript nutzt das Kürzel, Audio die Stimme |
| Rätsel: Nummer, Raum, benötigt, ergibt, Schalter | `welten/<welt>.yaml` | Rätsel-Datei beschreibt Ablauf, Lösung und Hinweise |
| Rätsel-Ablauf, Lösungen, Fehlversuche, Hinweisstufen | `raetsel/<welt>.md` (Prolog in `prolog-und-welt-1.md`, Zwischenspiele und Finale in `finale.md`) | Skript enthält den Wortlaut |
| Wortlaut aller Zeilen, Zeilen-IDs, Regie | `skript/<welt>.md` | – |
| Englischer Wortlaut je Schlüssel; Menü- und Systemtexte (de, en) | `uebersetzung/en.csv`, `uebersetzung/ui.csv` | – |
| Spieldaten für Godot (`game/daten/`, `game/lokalisierung/texte.csv`) | werden erzeugt (`tools/spieldaten.py`, `tools/skript_export.py`), nie von Hand bearbeitet | – |
| Aussehen, Prompts, Zustandsbilder, Animationen | `grafik/*.md` | – |
| Musik, Geräusche, Stimmen | `04-audio.md` | – |
| Dialogsystem, Schrift, UI, Hinweissystem, Speichern, ID-Schemata | `05-spielsysteme.md` | – |
| Technik, Werkzeuge, Kosten, Meilensteine, Recht und Markt | `03-produktion.md` | – |
| Entscheidungen mit Begründung (Kurzfassung) | `entscheidungen.md` | – |
| Was noch offen ist | `offene-punkte.md` | – |
| Ablauf eines Playtests, Beobachtungsbogen je Tester | `test/beobachtungsbogen.md` | Zielwerte aus `03-produktion.md`; Telemetrie-Format in `game/skripte/telemetrie.gd`, Auswertung `tools/telemetrie_auswertung.py` |

## Regeln für Änderungen

1. Erst den Besitzer ändern, dann die abhängigen Dateien.
2. Neue Räume, Gegenstände, Figuren oder Rätsel zuerst in die Welt-Tabelle (`welten/*.yaml`) eintragen.
3. Vor jedem Commit `python3 tools/pruefen.py` laufen lassen. Fehler werden behoben, Warnungen geprüft.
4. Erledigtes wird nicht als Protokoll gesammelt; die Historie steht in Git. Offenes steht nur in `offene-punkte.md`.
