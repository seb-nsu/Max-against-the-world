# Welt-Tabellen

Je eine Datei pro Spielabschnitt: `prolog.yaml`, `welt-1.yaml` bis `welt-4.yaml`, `finale.yaml` (mit den drei Zwischenspielen). Sie sind der Besitzer aller Fakten zu Räumen, Gegenständen, Figuren und Rätseln (siehe `../00-aufbau.md`). `tools/pruefen.py` prüft sie gegen Rätsel, Skript, Grafik und Audio: Verweise, Lösbarkeit vom Start aus, Zeilen-IDs und Sprecher im Skript, Namen in Rätsel- und Grafik-Datei, Sprecherkürzel und Musik-IDs in `04-audio.md`, dazu die Gesamtzahl der Nahansichten.

## Format

```yaml
abschnitt: welt-1            # prolog, welt-1 … welt-4, finale
name: Schwurbelstein
skript_praefix: W1           # Präfix der Zeilen-IDs, einzeln oder als Liste (Prolog [P0, SYS], Finale [ZS1, ZS2, ZS3, FI])
sonder_codes: [HINT]         # Szenen-Codes ohne eigenen Raum (Hinweise, Ersatzpool SYS_ERS, Zurufe …)
sonder_sprecher: [NAR]       # optional: Sprecherkürzel ohne Figur (NAR = Regie- und Animationszeilen, nicht vertont)
werte:                       # optional: gespeicherte Werte, die keine Schalter sind
  W2_FAEHRE_STEG: [nil_delta, faehrsteg_olympia, hafen_syrakus]   # Beispiel aus Welt 2
weitere_schalter: []         # optional: Schalter, die zu keinem Rätsel gehören

raeume:
  - id: taverne              # klein, ohne Umlaute, eindeutig im Abschnitt
    name: Taverne „Zum tänzelnden Pony-Express“
    skript_code: [TAV]       # Szenen-Codes der Zeilen-IDs für diesen Raum (mehrere möglich)
    groesse: 320x180         # oder 640x180
    ausgaenge: [dorfplatz]   # Raum-IDs; Wege gelten in beide Richtungen
    erreichbar_ab: start     # start oder Rätsel-ID (z. B. R3)
    zustaende: [Mittag, Abend]   # optionale Zustandsvarianten des Hintergrunds
    musik: w1_taverne        # ID eines Stücks aus der Musik-Tabelle in 04-audio.md

figuren:
  - id: humbert
    name: Humbert            # so, wie er in der Sprecher-Spalte des Skripts heißt
    kuerzel: HUM             # Sprecherkürzel in den Zeilen-IDs; null, wenn die Figur nie spricht
    raum: taverne            # oder Liste
    groesse_px: 60
    spielbar: false

gegenstaende:
  - id: ring
    name: Ring der Macht-Probe   # Name im Inventar
    herkunft: taverne        # Raum-ID (frei liegend), Rätsel-ID (Belohnung), Figur-ID (übergeben) oder Name eines früheren Abschnitts (mitgebracht)
    zustaende: [normal]      # alle Zustände, die eine Grafik brauchen
    verwendet_in: [R1]       # Rätsel-IDs
    reist_mit: false         # true, wenn er in der Reisetasche in andere Abschnitte mitkann
    nahansicht: false        # true, wenn der Gegenstand eine eigene Nahansicht hat

nahansichten:                # optional: Nahansichten, die kein Inventar-Gegenstand sind (Schilder, Tafeln, Kalender …)
  - id: maerchen_satzung
    name: Märchen-Satzung
    raum: trollbruecke       # Raum-ID, in dem man sie ansieht

raetsel:
  - id: R1
    name: Der versöhnte Wirt
    raum: taverne
    benoetigt: [ring]        # Gegenstand-IDs und/oder Rätsel-IDs, die vorher gelöst sein müssen
    benoetigt_eins_von: []   # optional: mindestens eins davon (alternative Lösungswege)
    ergibt: [fondue]         # Gegenstand-IDs, freigeschaltete Räume stehen bei raeume.erreichbar_ab
    schalter: [WIRT_VERSOEHNT]
    optional: false
```

Die Felder im Einzelnen, soweit sie nicht selbsterklärend sind:

| Feld | Ebene | Bedeutung |
| --- | --- | --- |
| `skript_praefix` | oben | Präfix der Zeilen-IDs; eine Liste, wenn das Skript mehrere nutzt (Prolog `[P0, SYS]`, Finale `[ZS1, ZS2, ZS3, FI]`) |
| `sonder_codes` | oben | Szenen-Codes, die zu keinem Raum gehören (`HINT`, `ERS`, Zurufe, Fernbedienung …) |
| `sonder_sprecher` | oben | Sprecherkürzel ohne Figur; bisher nur `NAR` für Regie- und Animationszeilen (Sprecher „–“), die nicht vertont werden |
| `werte` | oben | Gespeicherte Werte, die keine Schalter sind, mit ihren möglichen Werten (`NAME: [wert, …]`), etwa Fährsteg und Feigenzustand in Welt 2 |
| `weitere_schalter` | oben | Schalter, die zu keinem Rätsel gehören (etwa `PIXEL_AUF_LEITUNG` in Welt 3) |
| `musik` | Raum | ID des Stücks, das im Raum läuft; die ID steht in der Spalte „ID“ der Musik-Tabelle in `04-audio.md` (oder der Tabelle der gesungenen Stücke, wenn ein Lied im Raum durchläuft). Die Zuordnung Raum → Stück gehört der Welt-Tabelle, Prompt und Beschreibung des Stücks gehören `04-audio.md`. Minispiele und Szenen mit eigenem Stück (etwa Fünfkampf, Mitternachts-TV) stehen in der Audio-Tabelle, nicht beim Raum |
| `kuerzel` | Figur | Sprecherkürzel; `null` für Figuren, die nie sprechen. Jedes Kürzel steht in `04-audio.md` in einer Kürzel-Spalte (Stimmen oder Nebenstimmen), unter demselben Namen wie hier |
| `herkunft` | Gegenstand | Raum-, Rätsel- oder Figur-ID; für Gegenstände, die Max aus einem früheren Abschnitt mitbringt, der Name des Abschnitts (`prolog`, `welt-1` …); das Ursprungsrätsel steht im Kommentar |
| `nahansicht` | Gegenstand | `true`, wenn der Gegenstand eine eigene Nahansicht (Bildschirm 320×180) hat. Ein mitgebrachter Gegenstand zählt nur in dem Abschnitt, dessen Grafik das Bild liefert (Opas Zettel: Prolog), in späteren Tabellen steht `false` mit Kommentar |
| `nahansichten` | oben | Nahansichten, die kein Inventar-Gegenstand sind, je Eintrag `id`, `name`, `raum`. Zusammen mit allen `nahansicht: true` ist das die einzige Liste der Nahansichten; `tools/pruefen.py` prüft, dass es im ganzen Spiel genau 14 sind (`entscheidungen.md`) |
| `benoetigt_eins_von` | Rätsel | Alternative Lösungswege: Mindestens eins der genannten Gegenstände oder Rätsel muss da sein; zusätzlich zu `benoetigt` |

Regeln: IDs nur mit Kleinbuchstaben, Ziffern und Unterstrich; Rätsel-IDs wie in den Rätsel-Dateien (R1 … R13, Teilschritte R1a, R1b; Prolog P1 … P3, Finale F1 …). Feste Etappen ohne eigenes Rätsel (etwa die Wettkampftage in Welt 2, R12 und R13) bekommen die nächsten freien Nummern und werden in der Rätsel-Datei unter „Teilschritte und Schalter“ erklärt. Max, Pixel und Opa stehen in jeder Datei, in der sie sprechen, mit den Kürzeln MAX, PIX, OPA.
