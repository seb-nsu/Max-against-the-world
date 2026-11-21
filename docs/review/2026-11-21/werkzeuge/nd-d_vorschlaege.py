# -*- coding: utf-8 -*-
"""nd-d: baut die Tabelle der KI-Klang-Vorschlaege (Original aus texte.csv, Laengen geprueft).
Aufruf: py -3 docs/review/2026-11-21/werkzeuge/nd-d_vorschlaege.py
Schreibt belege/nd-d/vorschlaege.md und setzt die Tabelle in notizen/nd-d.md an der Marke <<KI_TABELLE>> ein
(nur wenn die Marke vorhanden ist). Liest texte.csv nur."""
import csv, io, sys
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
CSV = "game/lokalisierung/texte.csv"
A = {r[0]: r for r in csv.reader(open(CSV, encoding="utf-8", newline="")) if r and r[0]}

# (ID ohne W4_, weitere Blasen der Kaskade die mit ersetzt werden, [R]?, Grund, Vorschlag)
V = [
 ("SIT_MAX_0240", [], False, "M8 Kontrastformel „Das ist kein X, das ist Y“ (eine von fünf bei Max)",
  "Eine Bananenschale auf dem Boden, mitten in einer Sitcom. Die wartet da auf ihr Stichwort, und ich wette, es kommt gleich."),
 ("SAV_MAX_0220", [], False, "M8 dieselbe Formel („keine Faulheit, das ist Recherche“)",
  "Ich leg mich kurz in die Sonne. Zur Recherche. Guckt nicht so."),
 ("KAPI_MAX_0620", [], True, "M8 dieselbe Formel, dazu abstraktes Schlusswort („ein Argument“)",
  "Die faule Banane hat sich verändert: grün, mit Zündschnur. Mit der gewinnt man jede Diskussion, bevor sie anfängt."),
 ("KELL_MAX_0410", [], True, "M8 und M56: Max sagt den Lehrsatz des Rätsels auf („Die Zeit ist nicht das Problem, das Genre ist es“); derselbe Satz steht schon bei Pixel (`KELL_PIX_0160`)",
  "Pause im Keller. Die Geister hängen in der Luft wie Wäsche, aber die Tür bleibt zu. Der ist egal, wie spät es ist."),
 ("HALL_MAX_0270", [], False, "M8 Spiegelsatz mit abstraktem Schlusswort („da oben wohnt nur Dramatik“)",
  "Eine große Treppe nach oben, mit Spinnweben als Geländer. Da geht keiner hoch. Die ist nur da, damit jemand langsam runterkommt."),
 ("KAPI_MAX_0615", [], False, "M8 Spiegelsatz („Hier rutscht man nicht aus, hier hebt man ab“)",
  "Die Schale glänzt wie frisch gewachst. Wer da drauftritt, landet erst zwei Straßen weiter."),
 ("TAST_MAX_0010", [], False, "M8 und M62: Schlusssatz erklärt den Witz als Weltregel („gehört nicht zur Szene, die gehört zum Universum“)",
  "Pause in der Küche. Alle stehen still, nur das Band lacht weiter. Über wen denn jetzt? Es bewegt sich doch gar keiner mehr."),
 ("FRIE_MAX_0090", [], False, "M2/M62 Superlativ-Bilanz „… meines Lebens“ (viermal in Welt 4)",
  "Sie schieben mich zurück, im Takt. So höflich bin ich noch nie irgendwo rausgeflogen."),
 ("HALL_MAX_0040", [], False, "M2/M62 dieselbe Bilanz („das langsamste Chatten meines Lebens“)",
  "Ich tippe. Also, ich berühre Glühbirnen. Bis ich „Hallo“ fertig hab, ist mein Akku dreimal leer."),
 ("KELL_MAX_0030", [], False, "M62 Bilanzsatz „Das ist das Netteste, was …“ (dieselbe Formel wurde in Welt 3 bei `W3_TEST_MAX_0320` ersetzt)",
  "Der Geist hat sich vor mir erschreckt. Vor mir. Ich lass das mal kurz wirken."),
 ("FRIE_MAX_0280", [], True, "M5/M62: der zweite Satz wiederholt den ersten, dazu „das erste Mal in meinem Leben“ (achtmal „zum ersten Mal“ in Welt 4)",
  "Ich war im Takt, und genau das ist hier falsch. Da trifft man einmal den Takt, und dann zählt es nicht."),
 ("VERH_MAX_0230", [], False, "M62 Bilanz „Das ist das erste Mal, dass …“",
  "Ein Alibi aus einem Drehbuch. Dann stimmt im Fernsehen ja doch mal was."),
 ("STUD_PIX_0440_2", [], False, "Running-Formel zum dritten Mal: widerwilliges Lob plus Rücknahme („wird nicht wieder vorkommen“ wie `W2_RING_PIX_0290`, „gebe ich ungern zu“ wie `W3_ENDE_PIX_0080`)",
  "Ich war also eine ganze Welt lang überflüssig. So erholsam war noch keine Reise mit dir."),
 ("GLUE_MAX_0040", [], False, "Entweder-oder-Schluss (elfmal in Welt 4, dies ist der erste)",
  "Er verkauft die Preise, während er sie verlost. Ob das erlaubt ist, weiß ich nicht, aber es spart ihm einen Kollegen."),
 ("HALL_MAX_0210", [], False, "Entweder-oder-Schluss, der Opas wärmsten Satz erklärt und zerredet (Witz wird gedeutet)",
  "Ich bin das eine. So was sagt er sonst nie. Dafür braucht er anscheinend eine Lichterkette und ein Spukhaus."),
 ("PIXM_PIX_0070_2", [], True, "Entweder-oder-Schluss; trägt den Hinweis, dass die Hyäne etwas verbirgt",
  "Nichts, nicht mal ein Zucken. So ernst sitzt niemand da, der nichts zu verbergen hat."),
 ("GLUE_MAX_0455", [], False, "M66/M62 Fake-Analyse als Schlusssatz („Das sagt viel über diese Sendung.“)",
  "Die Kreuzfahrt ist nur ein Foto von einem Schiff, auf Pappe geklebt. Der Toaster dagegen ist echt. Und warm ist er auch noch."),
 ("GLUE_MAX_0470", [], False, "M62 wertender Schluss; „ehrlich“ ist in Welt 4 viermal die Pointe (`GLUE_MAX_0425`, `SAV_MAX_0410`, `WERB_MAX_0480`)",
  "Eine Leuchtschrift ohne Nummer. Man soll anrufen, aber keiner sagt, wo. Ich hätte eh kein Netz."),
 ("TEST_MAX_0250", [], False, "M62 erklärender Schluss („Das ist Wetter, das es nur im Fernsehen gibt.“)",
  "Am Rand schneit es, und zwar nach innen. Und nichts davon bleibt liegen."),
 ("STUD_MAX_0620", [], False, "M56 Urteilssatz („Das ist das Publikum, das er verdient hat.“); Max richtet, statt zu beobachten",
  "Ein Applaus-Schild. Wenn es leuchtet, klatscht ein Band. Echte Hände hab ich hier oben noch keine gehört."),
 ("SAV_MAX_0265", [], False, "M62: „Selbst das Wetter macht hier Pointen“ erklärt das Ba-dum-tss; Schablone „Sogar/Selbst X …“ (zehnmal, nur Max)",
  "Ein Tropfen landet auf der Snare. Ba-dum-tss. Keiner lacht. Nicht mal das Band von drüben."),
 ("SAV_MAX_0240", [], True, "M62: dritter Satz erklärt die Pointe der ersten beiden („Hier ist nichts echt, nicht mal die Natur.“)",
  "Er hat ein Drehbuch. Der Erzähler einer Naturdoku hat ein Drehbuch! Ich wette, der Löwe hat auch eins und kann seinen Text besser."),
 ("FRIE_MAX_0075", [], False, "M62 Schablone „Selbst X ist hier Y“",
  "Das Tor knarrt im Takt der Musik. Zwei, drei, vier, knarr. Ich hab mitgezählt."),
 ("FRIE_MAX_0125", [], False, "M62 dieselbe Schablone plus Absicherung „offenbar“",
  "Aus einem Grab guckt ein Kopfkissen raus. Mit Bezug. Da hat sich jemand auf länger eingerichtet."),
 ("EMPF_MAX_0255", [], False, "M62 dieselbe Schablone („Selbst sein Porträt ist für Scheinwerfer gemacht.“)",
  "Die Sonnenbrille auf dem Bild glänzt mehr als das Gold. Der Maler hat beim Malen garantiert selbst eine gebraucht."),
 ("GLUE_MAX_0575", [], False, "M7/M62 „trotzdem“-Pointe (28-mal in Welt 4) mit Ein-Wort-Schwanz „Respekt.“",
  "Eine Birne flackert, und keiner wechselt sie aus. Sie macht einfach weiter. Feierabend kriegt hier wohl keiner."),
 ("FABR_MAX_0410", [], True, "M7 „trotzdem“-Pointe; trägt den Hinweis, dass Max selbst in den Bottich muss",
  "Der Amboss fällt in den Bottich, platsch. Jetzt ist der Amboss ein Held, und ich steh immer noch hier oben."),
 ("EMPF_MAX_0250", [], True, "M56 Sentenz „Wer seine Vergangenheit in den Keller schreibt, hat Angst vor ihr“: Kalenderspruch statt Sechzehnjähriger; die Blase hat 179 Zeichen. Folgezeile `EMPF_PIX_0260` dann: „Und wer das Band dazu findet, gewinnt.“",
  "Ein Porträt in Gold: Zappmann mit Sonnenbrille. Messingschild: „Intendant seit 1988. Davor: siehe Kellerarchiv.“ // Davor liegt also im Keller. Da würd ich meine Zeugnisse auch hintun."),
 ("FERN_MAX_0220", [], True, "M56 Sentenz „Wer sich nicht ins Programm schreibt, will nicht gefunden werden“ (17 „Wer …, …“-Sätze in Welt 4)",
  "Kanal 999: nicht gelistet. Nur ein leeres Feld mit Goldrand. Da will einer nicht gefunden werden und gibt sich auch noch Mühe damit."),
 ("STUD_MAX_0660", [], False, "M56 symmetrischer Aphorismus („aussieht wie eine Show und sich anfühlt wie eine Wiederholung“), davor Dreierreihe",
  "Zappmann. Glitzersakko, Silberhaare, drinnen Sonnenbrille. Sieht aus wie eine große Show. Und irgendwie kenn ich jede Folge davon schon."),
 ("GLUE_PIX_0460", ["GLUE_PIX_0460_2"], False, "M56 Lebensweisheit („So ist das Leben: Das Große ist Kulisse …“); wiederholt außerdem `GLUE_MAX_0455`",
  "Die Kreuzfahrt ist aus Pappe, aber der Toaster macht Krümel. // Ich nehme den Toaster. Krümel kann man auflecken."),
 ("FERN_PIX_0040_2", [], False, "M56 Lehrsatz („Jede Technik hat eine Lücke …“)",
  "Sechs Tasten, und nicht eine davon hat an mich gedacht."),
 ("ARCH_MAX_0040", [], False, "M9 Dreierreihe („abgesetzt, vergessen, unbenannt“) plus M56 („Das Archiv ist eine Warteliste für nichts.“)",
  "Regale voller Bänder, und auf keinem steht was drauf. Die warten hier alle auf eine zweite Chance, und die Presse wartet mit."),
 ("HALL_MAX_0290", [], False, "Zeugma konkret/abstrakt als Pointe („jetzt ist es eher Angst“; in Welt 4 rund zehnmal: Käse und Angst, Teppichreiniger und Macht, Dramatik, Stimmung)",
  "Vergilbte Tapete mit Muster. Das waren mal Blumen. Die sind hier drin als Erstes eingegangen."),
 ("SIT_MAX_0270", [], False, "lyrischer Schlusssatz („und damit hat die ganze Welt eine Kante“); Max wird zum Erzähler",
  "Scheinwerfer von oben, und da hinten hört das Set einfach auf. Die Wand hat eine Kante. Dahinter ist nichts, nicht mal Tapete."),
 ("WERB_MAX_0090", [], True, "M33: Max kündigt die Lösung an („ich hab eine Taste für Ruhe“); gleiche Art wie Fund 10 der 360-Prüfung",
  "Der Jingle. Solange der dudelt, kleb ich hier fest. Meine Beine hören lieber auf den als auf mich."),
 ("EMPF_MAX_0190", [], True, "M33: Max sagt die Lösung („Also muss ich sie anhalten, und dafür hab ich eine Taste“)",
  "Zwei Schränke mit Ohrstöpseln. Die bewegen sich erst, wenn ich mich bewege. Wenn die mal kurz stillhalten würden, wär ich durch."),
 ("FRIE_MAX_0210", [], True, "M33 Ankündigung („Das ist meine Chance.“)",
  "Kurz vor dem Refrain. Alle liegen, und gleich stehen alle gleichzeitig auf. Jetzt bloß nicht mitwippen."),
 ("VERH_MAX_0320", [], True, "Max fasst den Widerspruch für den Spieler zusammen („Da passt was nicht zusammen.“)",
  "Eine Hyäne, die nie lacht, guckt freiwillig eine Sitcom, in der jeder Satz einen Lacher kriegt. Muss ein toller Abend gewesen sein."),
 ("STUD_MAX_0350", [], True, "vier glatte Hauptsätze als Plan (M51); der Schritt ist nach dem Mitgefühl in `STUD_MAX_0310` nicht motiviert (ND-D-07)",
  "Solange da oben eine Zahl steht, bleibt er sitzen. Also alle Sender auf einmal, dann guckt keiner mehr richtig hin. Sendersuchlauf."),
 ("STUD_MAX_0160", [], False, "M69 Registerbruch im Schlüsselsatz: dreimal „Ich habe“ und „Dinge getan“ (Max sagt sonst 34-mal „hab“, fünfmal „habe“)",
  "Nein. Ich hab zwei Wochen lang Sachen gemacht. Ich hab eine Hyäne überführt und vor Zombies getanzt."),
 ("STUD_ZAP_0050", [], True, "M51/M55: acht Kurzsätze im selben Stakkato wie Sohn, Siegfried, Agent; ein Verführer redet weich und am Stück. 160 Zeichen in einer Blase",
  "Hör mir zu, Max. Du wärst die Show, und alle schauen dir zu, während du gar nichts tust. // Du stehst nie wieder auf, du holst nie wieder Milch. Du sitzt einfach da und wirst gesehen."),
 ("STUD_ZAP_0210", [], True, "M8/M9: „Weil ich der Einzige bin, der das darf. Der Einzige, der alles darf.“ klingt gebaut; 177 Zeichen in einer Blase. Die Prahlerei mit der Karriere (Auslöser für Schritt 2) bleibt",
  "Du hast meine Show angehalten? Das hat sich seit 1988 keiner getraut, Junge, und weißt du, warum? // Weil man das mit einem Mann wie mir nicht macht. Sieh dir die Wand an: eine Karriere, und zwar eine goldene!"),
 ("KAPI_SIE_0290", [], False, "M55: fünf Kurzsätze; der müde Held klingt wie alle anderen Nebenfiguren. Müdigkeit hört man an Sätzen, die auslaufen",
  "Der dreht seit drei Jahren einen Film über sich, und wir … gaaahn … wir sind das, was übrig ist. Die Staffel ohne Hauptdarsteller."),
 ("SIT_MAX_0300", [], False, "Schablone „Name. Drei Merkmale. Urteil.“ (neunmal bei Figuren, in der Sitcom dreimal hintereinander); beschreibt, was man sieht",
  "Der Vater hält die Keksdose fest, als wär sie das Letzte, was er hat. In Pantoffeln. Wahrscheinlich ist sie das auch."),
 ("SAV_MAX_0360", [], False, "dieselbe Schablone plus „trotzdem“-Pointe",
  "Der Gepard hechelt, mit Stirnband und Stoppuhr. Schnellstes Tier der Welt, und er guckt, als wär ihm der Bus vor der Nase weggefahren."),
 ("FERN_MAX_0080", [], False, "M45-nah: „einiges ungesagt machen, was ich … von mir gegeben hab“ ist Schriftdeutsch mit Lehnprägung (unsay)",
  "Rückspulen. Alles noch mal, schneller und rückwärts. Damit würd ich gern ein paar Sätze von heute wieder einsammeln."),
 ("FERN_MAX_0200", [], True, "M41 Absicherung „offenbar“ (neunmal; mit „bestimmt“ und „vermutlich“ 28 Zeilen) als Pointenstütze",
  "„Tiertort: Der Fall der fehlenden Krone“. Läuft seit 20:15 in Dauerschleife. Kein Wunder, dass der Fall nie gelöst wird."),
 ("FRIE_MAX_0190", [], False, "M41 „offenbar“ plus Regelsatz „Jedes Musikvideo endet …“",
  "Hinter dem Tor geht ein Weg runter zu einem Haus. So ein Haus, bei dem im Kino alle „Geh da nicht rein“ rufen."),
 ("HINT_PIX_0140_2", [], True, "Doppelung: „Ich sage das ungern so deutlich“ steht fast wortgleich in `FABR_PIX_0250_2`; Pixel kommentiert sein eigenes Hinweisgeben",
  "Ich bin eine Katze, wie dir vielleicht aufgefallen ist. Mit mir redet er. Du darfst danebenstehen und so tun, als verstündest du etwas."),
]

zeilen = ["| Nr. | Zeilen-ID | Sprecher | Zeile wörtlich | Grund (Muster nach humanizer-de) | Vorschlag in der Stimme der Figur | Zeichen alt/neu |",
          "| --- | --- | --- | --- | --- | --- | --- |"]
NAMEN = {"MAX": "Max", "PIX": "Pixel", "ZAP": "Zappmann", "SIE": "Siegfried"}
ok = True
for i, (kid, mehr, r, grund, neu) in enumerate(V, 1):
    ks = ["W4_" + kid] + ["W4_" + m for m in mehr]
    for k in ks:
        if k not in A:
            print("FEHLT", k); ok = False
    alt = " // ".join(A[k][1] for k in ks if k in A)
    la, ln = len(alt.replace(" // ", " ")), len(neu.replace(" // ", " "))
    q = ln / la
    marke = "" if 0.8 <= q <= 1.2 else " (!)"
    if marke:
        ok = False
        print(f"LAENGE {kid}: {la}/{ln} = {q:.2f}")
    for teil in neu.split(" // "):
        if len(teil) > 140:
            print(f"BLASE >140 {kid}: {len(teil)}"); ok = False
    sp = NAMEN.get(kid.split("_")[1], kid.split("_")[1])
    zeilen.append(f"| {i} | `{kid}`{' **[R]**' if r else ''} | {sp} | {alt} | {grund} | {neu} | {la}/{ln}{marke} |")
tab = "\n".join(zeilen)
open("docs/review/2026-11-21/belege/nd-d/vorschlaege.md", "w", encoding="utf-8", newline="\n").write(tab + "\n")
print("Zeilen:", len(V), "mit [R]:", sum(1 for v in V if v[2]), "ok:", ok)
if ok:
    p = "docs/review/2026-11-21/notizen/nd-d.md"
    t = open(p, encoding="utf-8").read()
    if "<<KI_TABELLE>>" in t:
        open(p, "w", encoding="utf-8", newline="\n").write(t.replace("<<KI_TABELLE>>", tab))
        print("Tabelle in die Notiz eingesetzt")
