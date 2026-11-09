# Couch Quest – Max against the worlds

2D-Point-and-Click-Adventure mit **Max**, einem 16-jährigen Couch-Potato, und **Pixel**, dem sprechenden Kater seines Opas. Über Opas Röhrenfernseher „Zapp-O-Mat 3000“ reisen die beiden durch vier Welten – Fantasy, Antike, Zukunft und eine Fernsehwelt –, um vier legendäre Gegenstände zu holen. Am Ende stellt sich heraus, wofür Opa sie wirklich braucht.

**Technik:** Godot 4 mit Popochiu, Pixel-Art in 320×180, Grafik mit Retro Diffusion und Aseprite, Audio mit ElevenLabs und ACE-Step.

## Inhalt

Jede Information hat genau einen Besitzer; welche Datei was besitzt, steht in [docs/00-aufbau.md](docs/00-aufbau.md). Dieses Repo ist die Hauptfassung, das Online-Dokument ist seit 9. November 2026 eingefroren.

| Ordner / Datei | Inhalt |
| --- | --- |
| [docs/00-aufbau.md](docs/00-aufbau.md) | Wer besitzt welche Information, Regeln für Änderungen |
| [docs/01-konzept.md](docs/01-konzept.md) | Geschichte, Ton, Figuren, Welt-Ideen, Finale als Erzählung, Rechtscheck |
| [docs/welten/](docs/welten/) | Welt-Tabellen (YAML): Räume, Wege, Gegenstände, Figuren, Rätsel-Abhängigkeiten |
| [docs/raetsel/](docs/raetsel/) | Rätsel-Abläufe, Lösungen, Fehlversuche, Hinweise; [Abhängigkeitsdiagramme](docs/raetsel/abhaengigkeiten.md) |
| [docs/skript/](docs/skript/) | Dialog-Skripte für Prolog, Welt 1 bis 4, Zwischenspiele und Finale |
| [docs/grafik/](docs/grafik/) | Stil, Steckbriefe Max und Pixel, Szenen-, Figuren- und Gegenstands-Prompts je Welt |
| [docs/04-audio.md](docs/04-audio.md) | Musik, Geräusche, Stimmen mit Prompts |
| [docs/05-spielsysteme.md](docs/05-spielsysteme.md) | Dialogsystem, Schrift, UI, Hinweissystem, Speichern, ID-Schemata |
| [docs/03-produktion.md](docs/03-produktion.md) | Technik, Werkzeuge, Kosten, Meilensteine, Recht und Markt |
| [docs/entscheidungen.md](docs/entscheidungen.md) | Alle geltenden Entscheidungen mit Begründung |
| [docs/offene-punkte.md](docs/offene-punkte.md) | Alles, was noch offen ist |
| [concepts/](concepts/) | Freigegebene Konzeptbilder (Referenz für Retro Diffusion) |

## Werkzeuge

- `python3 tools/pruefen.py` prüft vor jedem Commit Welt-Tabellen, Lösbarkeit, Skript-IDs, Sprecher, Stimmen und Musik gegeneinander. Fehler werden behoben, Warnungen geprüft.
- `python3 tools/diagramme.py` erzeugt die Abhängigkeitsdiagramme aus den Welt-Tabellen neu.
- `python3 tools/export.py [Ordner]` fasst alles in sieben Dateien zusammen (Konzept, Grafik, Rätsel, Skript, Audio, Produktion, offene Punkte), Standardordner `export/`.

Frühere Gutachten, Review-Runden und Umsetzungsberichte stehen in der Git-Historie (bis Commit 7fea2a1).
