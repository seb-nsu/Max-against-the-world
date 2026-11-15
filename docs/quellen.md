# Externe Quellen und Wissen

Links, die uns weitergebracht haben, jeweils mit dem, was wir daraus übernommen haben. Damit gute Fundstücke nicht in einem Thread verloren gehen: Jeder neue Link, der eine Arbeitsweise ändert, kommt hier hinein (Link, Datum, Kernaussage, was wir daraus machen).

## Animation und Pixel-Art

### Slynyrd: Pixelblog 8, Intro to Animation
https://www.slynyrd.com/blog/2018/8/19/pixelblog-8-intro-to-animation (von Sebastian am 15.11.2026 geteilt)

Kernaussagen, die wir übernommen haben:
- **Lauf mit 8 Bildern** zu je etwa 80 ms: Aufsetzen, Abfedern, Durchschwung, Hochpunkt, dann dasselbe mit der anderen Seite.
- **Durchschwung-Bild nicht vergessen:** Arme und Beine nah am Körper verbinden die beiden Schrittstellungen. Ohne dieses Bild springt der Lauf zwischen „Bein vorn“ und „anderes Bein vorn“ (Toadi-Problem).
- **Wippen:** Körper beim Abfedern unten, beim Hochpunkt oben.
- **Starke Schlüsselbilder statt vieler Zwischenbilder.** Zu viele Zwischenbilder machen einen Lauf zäh. Langsame Gänge (Minka) dürfen mehr haben.
- **Sauberkeit:** Einzelne verirrte Pixel fallen in einer Schleife sofort auf. Jedes Bild prüfen.

Umgesetzt in: Teile-Rig-Läufe aller Menschen (PR #28), `docs/lessons-learned.md` Abschnitt 1.

## Werkzeuge und Dienste

### Meshy
- MCP-Server: https://github.com/meshy-dev/meshy-mcp-server
- Rigging und Bewegungsbibliothek: https://docs.meshy.ai/api/rigging.md

Bild zu 3D, automatisches Rig für Zweibeiner, über 500 Bewegungen. Kosten bei uns: Modell mit Rig etwa 20 Credits, Bibliotheks-Clip 3, Bewegung nach Text 13, Bild mit Nano Banana 2.1 4 Credits. Keine Vierbeiner.

### Blender-MCP
https://github.com/ahujasid/blender-mcp (Paket heißt inzwischen `mcp-for-blender`)

Damit steuert Claude Blender: Clips abspielen, Knochenwinkel auslesen, rendern. Blender muss auf dem PC laufen. Kann selbst Bild zu 3D über Hunyuan3D oder Hyper3D, aber ohne Rig und Bewegungen.

### Mixamo
Inoffizielles MCP: https://glama.ai/mcp/servers/V1xel/mixamo-mcp

Kostenlose Bewegungsbibliothek. Das MCP fernsteuert nur die Webseite, deshalb nicht genutzt. Meshy deckt dasselbe ab.

### Higgsfield, PixelLab (Vergleich)
- Techsy-Vergleich Meshy, Higgsfield, PixelLab: https://techsy.io/en/blog/meshy-vs-higgsfield-vs-pixellab
- Higgsfield-MCP-Anleitung: https://mcp.directory/blog/higgsfield-mcp-guide
- Higgsfield-Test mit Preisen: https://justbeingresourceful.com/2026/09/28/higgsfield-ai-review-one-subscription-for-15-video-models-a-production-stack-and-a-valuation-that-says-its-not-messing-around/

Higgsfield bündelt Bild- und Videomodelle, macht aber keine 3D-Modelle, Rigs oder Sprite-Sheets. Lohnt sich erst für Intro, Outro oder Trailer. PixelLab liefert laut Test Sprites zu etwa 80 % fertig (von uns nicht getestet).

## Gemini (Nano Banana)

- Preisliste: https://ai.google.dev/gemini-api/docs/pricing (war im November 2026 veraltet, Preise im AI Studio gegenprüfen)
- Nano Banana 2.1: https://felloai.com/nano-banana-2-1/ und https://www.toolcolumn.com/learn/nano-banana-2-1-vs-nano-banana-pro
- Bekannter Fehler im Stapelmodus (zu viele abgerechnete Bilder): https://discuss.ai.google.dev/t/gemini-3-pro-image-batch-api-returns-up-to-35-billed-images-for-single-image-requests-since-8-oct-2026/196940

Eigene Erfahrungen mit Gemini (Magenta statt transparent, „the tomcat“ statt „Pixel“, PNG statt JPEG, höchstens vier Posen) stehen in `docs/lessons-learned.md` und `docs/grafik/00-stil-und-werkzeuge.md`.

## Agenten-Sammlungen

### agency-agents (msitarzewski)
https://github.com/msitarzewski/agency-agents (von Sebastian am 15.11.2026 geteilt)

Über 100 fertige Rollenbeschreibungen für Claude-Code-Subagenten (Markdown-Dateien für `.claude/agents/`), unter anderem Game Designer, Narrative Designer, Level Designer, Technical Artist, Godot Gameplay Scripter, Game Audio Engineer, Image Prompt Engineer, Reality Checker und Persona Walkthrough. Allgemein gehalten, ohne Wissen über unser Projekt.

Unsere Einschätzung: nicht alles installieren. Brauchbar als zusätzliche Prüf-Blickwinkel (Reality Checker oder Persona Walkthrough vor einem Playtest, Narrative Designer für Dialoge, Game Audio Engineer für die Audio-Phase). Mehr bringen eigene, projektbezogene Agenten oder Skills, die auf `docs/lessons-learned.md` aufbauen (zum Beispiel „Sprite- und Animationsprüfer“, „Raum-Einbau prüfen“). Subagenten kosten zusätzliche Tokens und nur auf Wunsch einsetzen.

Übernommen haben wir die Arbeitsstruktur aus `strategy/nexus-strategy.md` und `strategy/coordination/handoff-templates.md`: Phasen mit Prüftor, Bauen-Prüfen-Schleife mit höchstens drei Versuchen und Nachweis, feste Übergabe-Vorlage zwischen Threads. Unsere Fassung steht in `docs/lessons-learned.md`, Abschnitt 9.
