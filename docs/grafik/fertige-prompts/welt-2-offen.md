# Offene Prompts Welt 2

Stand 15. November 2026. Alles, was für Welt 2 aus Gemini kommen muss, in der Reihenfolge, in der es sich anbietet. Die Prompts selbst stehen in [`welt-2.md`](welt-2.md) (erzeugt aus `../welt-2.md`); hier steht nur die Reihenfolge, was anzuhängen ist und worauf man achten sollte. Abhaken, was erledigt ist.

**Stand:** Alle Räume, Figuren, Gegenstände, großen Objekte und Deko-Sprites sind geliefert und im Spiel. Noch offen: die Nahansichten. Die Posenbögen führt die Gesamtliste.

**Die vollständige Arbeitsliste mit fertigen Prompts** für Prolog, Welt 1 und Welt 2 ist [`00-offen-prolog-welt-1-welt-2.md`](00-offen-prolog-welt-1-welt-2.md). Sie geht vor, wenn sich etwas widerspricht; diese Datei hält nur den Überblick für Welt 2.

**Allgemein:**

- Räume: Layout-Skizze anhängen (Link steht beim Raum). Zweite und dritte Fassungen stehen als eigener Block unter dem Raum und werden im selben Chat aus dem fertigen Bild abgeleitet.
- Figuren, Gegenstände, große Objekte: Max' Figurenblatt anhängen. Hintergrund muss einfarbig Magenta sein; malt Gemini ein Schachbrett oder Kästchen, im selben Chat „solid flat magenta background, no checkerboard, no boxes“ nachschieben.
- Nahansichten und Tafeln: nichts anhängen.
- Eigene Sprites (Figuren, Fähre, Wurfhebel, Deko) dürfen nicht im Raum mitgemalt sein. Gegenstände, die man mitnimmt, dürfen im Raum stehen; die schneidet Claude aus.
- Breite Räume (1280×360: Nil-Delta, Thronsaal, Stadion, Agora): erst die linke Hälfte erzeugen, dann im selben Chat die rechte, die nahtlos anschließt. Zweitfassungen jeweils für die Hälfte, in der sich etwas ändert. Seit 14. November abends sind Nil-Delta, Thronsaal und Stadion breit, weil dort bis zu neun Figuren gleichzeitig stehen; ältere Prompts für diese drei Räume nicht mehr verwenden. Am selben Abend wurden außerdem die Motive von Fährsteg Olympia, Hafen Syrakus, Archimedes' Werkstatt, Startbüro und Agora an die Anordnung im Spiel angeglichen; auch hier nur noch die aktuellen Prompts nehmen.
- Als PNG herunterladen und in `E:\Game Engine\Grafiken` ablegen, Name wie `Welt2-Thronsaal.png`.

## 1. Räume in Ägypten (Einstieg der Welt)

- [x] Nil-Delta mit Fährsteg, **breit**: linke Hälfte, dann rechte Hälfte (keine Fähre, kein Krokodil im Bild; das Papyrusblatt im Schilf darf drin sein)
- [x] Thronsaal, **breit**: linke Hälfte, dann rechte Hälfte (Kissen leer, kein Kater, kein Ramses auf dem Thron)
- [x] Palastküche (keine Köchin)
- [x] Sphinx, zwei Fassungen: mit Nase, dann ohne Nase (Nase liegt im Sand)

## 2. Figuren in Ägypten

- [x] Ramses
- [x] Hofkater
- [x] Sobek, im Wasser
- [x] Sobek, an Land
- [x] Fährmann
- [x] Köchin Nebet
- [x] Palastschreiber
- [x] Fächerwedler (zweite Fassung mit gelbem Kopftuch)
- [x] Steinmetz
- [x] Zeremonienmeister
- [x] Ägypter aus dem Volk
- [x] Ägypter aus dem Volk, zweite und dritte Fassung für die Menge (im selben Chat aus dem fertigen Bild, die Prompts stehen in welt-2.md unter „Ägypter aus dem Volk“)
- [x] Krokodil-Fähre (großes Objekt)

## 3. Räume in Griechenland

- [x] Fährsteg Olympia
- [x] Agora, breit: linke Hälfte, dann rechte Hälfte; danach zweite Fassung (Sandale auf der Säule) und dritte Fassung (Statue ohne Arme)
- [x] Startbüro (Schalter leer, Wartende auf der Bank dürfen bleiben)
- [x] Stadion, normale Fassung (als ein Panorama)
- [x] Stadion, Parade-Fassung mit schiefem Glockenturm (im selben Chat aus dem Panorama: „Same image, only change: garlands, banners and flower petals everywhere, the bell tower now visibly leaning. Everything else exactly the same.“)
- [x] Hafen Syrakus
- [x] Archimedes' Werkstatt
- [x] Grabhügel Syrakus, zwei Fassungen: leerer Sockel, dann mit verwittertem Grabstein
- [x] Flusskarte

## 4. Figuren in Griechenland

- [x] Archimedes (zweite Fassung im Handtuch)
- [x] König Hieron
- [x] Cicero
- [x] Tiro
- [x] Leonidas
- [x] Hermes
- [x] Brian
- [x] Philosoph
- [x] Römischer Tourist
- [x] Römische Touristin
- [x] Beamter 1
- [x] Beamter 2
- [x] Schildkröte
- [x] Straßenmusiker
- [x] Wurfhebel (großes Objekt)

## 5. Gegenstände

- [x] Ägypten (3×4)
- [x] Olympia (3×3)
- [x] Feigen-Zustände (1×4)
- [x] Syrakus (2×3)
- [x] Schriftstücke (1×4)
- [x] Getränke-Zustände (1×3)
- [x] Grabstein-Zustände (1×4)
- [x] Wunderdinge (1×3; das Kaugummi bleibt hellrosa, nicht knallpink wie der Hintergrund)
- [x] Hieroglyphen (4×4; liegen in `game/grafik/hieroglyphen/`, im Rätsel noch Textauswahl; auf dem Bogen steht Brot statt Schlange)
- [x] Deko Welt 2 (3×3)

## 6. Nahansichten und Tafeln

- [ ] Hieroglyphen-Grammatik
- [ ] Fährtafel
- [ ] Aushang im Startbüro
- [ ] Sandgrube
- [ ] Konter-Auswahl
- [ ] Paraden-Plan

## 7. Posenbögen

Die Posenbögen arbeitet der Thread „Offene Grafik-Prompts optimieren“ ab; Prompts und Stand stehen in [`00-offen-prolog-welt-1-welt-2.md`](00-offen-prolog-welt-1-welt-2.md) und [`01-figurenboegen.md`](01-figurenboegen.md). Hier werden sie nicht mehr geführt.

Effekte (Kaugummi-Sonne, Brennspiegel, Zeitfähre, Altern des Grabsteins) und Pixel als Gott baut Claude ohne neue Bilder.

## 8. Vorlagen für die 3D-Modelle

Für das 3D-Modell braucht Meshy eine stehende Figur, am besten von vorn mit ausgestreckten Armen (T-Pose). Wer im Spiel nur sitzt oder in etwas steckt, bekommt dafür eine eigene Fassung. Diese Bilder kommen nicht ins Spiel, sie sind nur die Vorlage für Modell und Rig. Jeweils das fertige Konzeptblatt der Figur anhängen, Hintergrund diesmal weiß. Die Blöcke folgen dem Raster aus `../00-stil-und-werkzeuge.md` (Baustein 3D-VORLAGE); für weitere sitzende Figuren STYLE, POSE, CAMERA und NEGATIVE unverändert übernehmen und nur SUBJECT und CHARACTER tauschen.

- [x] Beamter 1 stehend
- [x] Philosoph stehend, ohne Tonne

Der Palastschreiber ist schon erledigt, seine stehende Fassung hat Meshy gemacht. Neue Figuren, die nur sitzen, kommen hier mit dazu.

### Beamter 1 stehend

```text
STYLE: Character reference for a 3D model, in exactly the same style, colors and proportions as the attached character sheet: same line weight, same flat cel shading, light from upper left. The model only needs the body, so draw the character once, standing, complete from head to feet. Plain flat white (#ffffff) background filling the whole image.
SUBJECT: the same bored bald Greek official as on the attached sheet, standing instead of sitting, without the stool and without the scroll.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Bored Greek official, about 78 percent of the boy Max's height when seated. Bald head, droopy eyelids. Plain grey tunic, sandals.
POSE: strict front view facing the viewer, standing upright in a T-pose: arms stretched out straight to the sides at shoulder height, palms down, fingers together, legs slightly apart, feet flat on the ground and fully visible, head straight, neutral face.
CAMERA: static, straight on at chest height, no perspective distortion, the whole figure centered with empty space around it.
NEGATIVE: no second character, no props, no furniture, no seat, no barrel, no environment, no floor, no ground shadow, no checkerboard, no frames, no text, labels or numbers, no side or three-quarter view, no bent arms, no hands in front of the body, no clothing covering the hands, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```

### Philosoph stehend, ohne Tonne

```text
STYLE: Character reference for a 3D model, in exactly the same style, colors and proportions as the attached character sheet: same line weight, same flat cel shading, light from upper left. The model only needs the body, so draw the character once, standing, complete from head to feet. Plain flat white (#ffffff) background filling the whole image.
SUBJECT: the same scruffy old Greek philosopher as on the attached sheet, standing upright outside the barrel, without the barrel and without the lantern, barefoot.
CHARACTER (appearance only, word for word from its sheet; ignore the pose in it): Scruffy old Greek philosopher with wild grey hair and beard and a torn grey cloak.
POSE: strict front view facing the viewer, standing upright in a T-pose: arms stretched out straight to the sides at shoulder height, palms down, fingers together, legs slightly apart, feet flat on the ground and fully visible, head straight, neutral face.
CAMERA: static, straight on at chest height, no perspective distortion, the whole figure centered with empty space around it.
NEGATIVE: no second character, no props, no furniture, no seat, no barrel, no environment, no floor, no ground shadow, no checkerboard, no frames, no text, labels or numbers, no side or three-quarter view, no bent arms, no hands in front of the body, no clothing covering the hands, no change to face, proportions, clothing or colors, no photorealism, no 3D render, no watermark
```
