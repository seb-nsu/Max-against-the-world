# Runde 5: Bestätigte Annahmen Welt 1, Zwischenspiele und Finale

Stand: 9. November 2026. Sebastian hat alle Annahmen der Skript-Autoren bestätigt. Diese Runde zieht sie in Rätsel-, Konzept- und Grafik-Tabs nach und entscheidet die offenen Grafikpunkte von Welt 1 zugunsten des Spielers. Es wurde nichts gestrichen; alle Änderungen sind Ergänzungen oder Präzisierungen.

## Rätsel Welt 1

| Stelle | Änderung |
| --- | --- |
| Rätsel 1 (Taverne-Coup) | Der Ring macht das Fondue zum besten Käse des Hauses; Humbert: „Das schmeckt nach Macht“, als versöhnter Wirt schenkt er Max ein Schälchen Käsefondue. |
| Rätsel 3 (Ziegen) | Die drei Ziegen folgen Max als kleine Herde zur Troll-Brücke (Begleiter-Schalter). |
| Rätsel 4 (Troll-Brücke) | Satzungstext und Paragrafen wie im Skript Welt 1 (Paragraf 1, 2, 3 und 14b) ausdrücklich genannt. |
| Rätsel 5 (Brunnen) | Pixels Nebenwirkung (redet doppelt so viel) endet beim nächsten Raumwechsel. |
| Rätsel 6 (Trank) | Milch nur mit dem Krug beim Kochgeschirr in der Schmiede; Melken erst nach Alwins Rezept. Ei direkt beim Taverne-Huhn nehmbar, das Huhn protestiert. |
| Rätsel 7 (Niesrosen) | Max spricht Waldemar an der Brücke an; Waldemar kommt in den Zauberwald und singt dort. Das Abspann-Versprechen folgt danach (wie im Skript). |
| Rätsel 10 (Goblins) | Weg B: Grimmzahn folgt Max in den Turm. |
| Rätsel 11 (Turm) | Teil 1: Der Spieler ordnet die vier Notizbuch-Teile an der Geheimtür an; „Unvollständig“ bei fehlenden Teilen. Teil 2: Die Besen landen in Abstellkammer 1, der ersten von Smaugis sechs Kammern; danach ist die Kammer betretbar. |
| Ortsnetz | Abstellkammer 1 als Ausgang des Kellers ergänzt, betretbar nach Rätsel 11 Teil 2. |
| Raumplan Ebene 1 | Abstellkammer 1 neu beschrieben: kleiner Raum hinter der Kammertür im Keller, Schild „Eigentum Smaugi, Kammer 1 von 6“, Ansehen-Raum ohne Rätsel, Ausgang nur zurück in den Keller. |
| Inventar | Neue Zeile „Krug“ (Schmiede, beim Kochgeschirr). Ziegenmilch und Ei mit den bestätigten Regeln ergänzt. |
| Hinweis-IDs | Der Rätsel-Tab nennt kein ID-Schema, also nichts zu ändern (Schema W1_HINT_PIX_RRSK pflegt der Koordinator in Spielsysteme). |

## Entscheidung: Abstellkammer 1

Problem: Die Kammer zählte als eine von Smaugis sechs Kammern, wurde im Skript aber nie betreten. Zudem fegen die Besen in Rätsel 12 Smaugis Haufen weiter oben, obwohl sie unten eingesperrt sind.

Entscheidung (zugunsten des Spielers): Abstellkammer 1 ist ein sichtbarer, betretbarer kleiner Raum hinter der Kammertür rechts im Keller (Ebene 1, ein paar Stufen hoch). Nach Rätsel 11 Teil 2 kann Max hinein: Die Besen fegen dort zufrieden Smaugis Kram zu Stapeln, ignorieren Max und arbeiten sich Kammer für Kammer nach oben. Ein Schild „Eigentum Smaugi, Kammer 1 von 6“ macht die Zählung eindeutig. Kein Rätsel, kein Risiko, nur Ansehen-Zeilen.

Umgesetzt in Rätsel Welt 1 (siehe oben), Grafik Welt 1 und Skript Welt 1.

## Skript Welt 1 (Abschnitt 12)

- Einleitung: Besen landen in Abstellkammer 1, der ersten von Smaugis sechs Kammern; die Kammer ist danach betretbar (Zeilen 0300 bis 0330).
- Neue Zeilen am Ende der Turm-Tabelle:
  - W1_TURM_MAX_0300 (Betreten Abstellkammer 1): „Abstellkammer 1. Schild: ‚Eigentum Smaugi, Kammer 1 von 6.‘ Sechs Kammern. Für Kram. Respekt.“
  - W1_TURM_MAX_0310 (Ansehen Besen): „Die Besen fegen Smaugis Kram zu Stapeln. Mich ignorieren sie. Ich bin kein Kram. Glaub ich.“
  - W1_TURM_PIX_0320 (Ansehen Besen, Pixel): „Sie fegen sich nach oben, Kammer für Kammer. Vollbeschäftigung. // Die Goblins wären neidisch.“
  - W1_TURM_MAX_0330 (Ansehen Kram): „Eimer, Fahnen, Lappen. Smaugis Einsteigerkram. Der richtige Kram wartet oben.“

## Skript Prolog

- P0_DACH_OPA_1140 neu: „Nicht am Knopf drehen, bevor das Bild da ist! Der Werbeblock ist für den Rückweg. // Fünf Sekunden Milchwerbung, dann bist du wieder hier. Keiner weiß, warum.“ Opa stellt den Werbeblock jetzt als Heimweg vor; der Witz bleibt, beide Kaskaden passen in drei Sprechblasenzeilen.

## Grafik Welt 1

| Stelle | Änderung |
| --- | --- |
| Orte, Dunkler Turm | Tür zur Abstellkammer 1 ergänzt (erste von Smaugis sechs Kammern, nach Rätsel 11 Teil 2 betretbar). |
| Szene Turmkeller | Kammertür als Ausgang nach Rätsel 11 Teil 2; bei Goblin-Weg B Grimmzahn als Sprite, weil er Max in den Turm folgt. |
| Szene Abstellkammer 1 | Muss-sichtbar: Schild „Eigentum Smaugi, Kammer 1 von 6“ (Text von Hand), Kram zum Teil zu Stapeln gefegt, Bodenfläche für die fegenden Besen, Tür zurück in den Keller. Prompt: zwei ordentliche Stapel und ein leeres Holzschild ergänzt. |
| Szene Zauberwald | Waldemar als Gast-Sprite bei Rätsel 7. |
| Gegenstände | Krug (leer, aus der Schmiede) und Ziegenmilch im Krug genannt; das Sammelbild „Zaubertrank“ enthielt den Krug schon. |
| Max als Pilz | Haare nach dem freigegebenen Konzeptbild: „messy shaggy dark brown hair (#733e39) with strands falling over his forehead and eyes“ statt der Strähne über dem rechten Auge. |

## Konzept (Welt 1, Zwischenspiele, Finale)

| Stelle | Änderung |
| --- | --- |
| Gegenstände zwischen den Welten, Omas Kekse | Regel zugunsten des Spielers: Die Tüte hängt an KEKSE_DABEI und kann nicht dauerhaft verloren gehen. Weggeben lehnt Max ab, der Tausch am Kern in Welt 3 ändert nur die Temperatur, und bleibt sie beim Packen zurück, liegt sie in Opas Fundkiste auf dem Dachboden. Im Finale holt Max sie dort mit einem Klick ins Inventar. Der Bonus-Gag ist damit immer erreichbar. |
| Zwischenspiele | Rückverwandlungs-Effekt beim Ablegen auf der Werkbank, Opa: „Rückverwandlungsschwund“. Nicht Eingepacktes landet in Opas „Fundkiste“, nichts geht verloren. Werbeblock: Opa kündigt ihn im Prolog als Rückweg an (vorher „warnt“). |
| Welt 1, Orte | Dunkler Turm: Kammern voller Smaugis Kram; in die erste sperrt Max die Besen und kann sie danach betreten. |
| Welt 1, Rätsel | Ziegen folgen als Herde; Waldemar prüft jeden Paragrafen bis 14b. Ring im Fondue: „schmeckt nach Macht“, Humbert schenkt ein Schälchen. |
| Finale, Verbündete | Kanal 999: leeres goldenes Sofa mit Zettel „Bin aufgestanden. Z.“ |
| Finale, letztes Rätsel | Luke bleibt nach Zeldinas Hebeln durch den Teig-Überdruck zu und geht erst beim Stopp auf. Die Ofentür muss vor dem Stopp gehalten werden; ein zu früher Stopp ist ein Fehlversuch mit Teig-Gag. Die Zelle rollt ganz nach hinten unter den Sessel, Pixel holt sie (Figurenwechsel). |
| Finale, Auflösung | Omas Vorname Hildegard („Hildegard. Du bist früh.“). |
| Abspann-Szene | Opa hat den Zapp-O-Mat auf dem Rolltisch für die Feier ins Wohnzimmer geschoben. Waldemars Musical-Text wie im Skript (Abschnitt 10). Goblin-Weg B: Foto „zwei Hausmeister“ (Grimmzahn und Modell 08/15, ohne den Roboter Pixel). |
| Sprecherkürzel HAU | Steht nur im Skript; das Konzept nennt keine Kürzel, daher keine Änderung. |

## Grafik Prolog und Finale

| Stelle | Änderung |
| --- | --- |
| Große Objekte | Neues Objekt „Fundkiste“ (zwei Zustände, ab Rückkehr 1 am Kistenstapel, im Finale anklickbar für Omas Kekse) mit Prompt. |
| Dachboden, Finale | Zustand nach Zeldinas Hebeln: Riegel zurück als Sprite-Wechsel, Luke bleibt durch den Teig-Überdruck zu. Sessel: Zündkapsel vorne, Zelle ganz hinten, nur für Pixel erreichbar, oranges Glühen als kleiner Effekt. |
| Gegenwart-Effekt | Beim Ablegen auf der Werkbank; Opa nennt ihn „Rückverwandlungsschwund“. |
| Figuren | Oma Hildegard. |
| Schon vorhanden, unverändert | Platz für den Zapp-O-Mat im Wohnzimmer (Geburtstag), goldenes Sofa mit Zettel auf Kanal 999, Teig-Schwall-Effekt. |

## Nicht angefasst

Rätsel-, Grafik- und Skript-Tabs von Welt 2 bis 4; im Konzept Rechtscheck, Titel und die Welten 2 bis 4; Produktion; Spielsysteme (Hinweis-ID-Schema, Sprecherkürzel).

## Hinweis für den Koordinator

- Im Skript Welt 1 steht noch an zwei Stellen „Annahme, siehe Abschluss“ bzw. „siehe Abschluss“ (Krug in Abschnitt 4, Ziegenherde in Abschnitt 2), im Skript Zwischenspiele und Finale an vier Stellen (Fundkiste, Kekse, Hildegard, Zapp-O-Mat im Wohnzimmer). Die Annahmen sind jetzt bestätigt; die Vermerke können gestrichen oder in „bestätigt“ geändert werden. Das liegt außerhalb meiner Tabs.
