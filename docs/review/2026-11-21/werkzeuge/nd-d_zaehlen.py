# -*- coding: utf-8 -*-
"""nd-d: Zaehlungen fuer Welt 4 (nur lesen).
Aufruf: py -3 docs/review/2026-11-21/werkzeuge/nd-d_zaehlen.py <teil> [arg]
  abgleich           Skript welt-4.md gegen texte.csv (IDs, Text)
  szenen             Zeilen/Zeichen je Abschnitt, lange Blasen
  figuren            Zeilen, Satzlaengen, Kurzsatzanteil je Sprecher
  muster [voll]      Regex-Zaehlung der KI-Klang-Muster (W4, de), mit IDs
  quer               wiederkehrende Formeln ueber alle Welten
  liste KUERZEL [de|en|beide]  alle Zeilen eines Sprecher- oder Abschnittskuerzels
  suche REGEX [PRAEFIX]        Zeilen (de) mit Treffer, Standard-Praefix W4_
"""
import csv, io, re, sys, collections
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
CSV = "game/lokalisierung/texte.csv"
SKRIPT = "docs/skript/welt-4.md"


def lade():
    z = collections.OrderedDict()
    with open(CSV, encoding="utf-8", newline="") as f:
        r = csv.reader(f)
        next(r)
        for row in r:
            if row and row[0]:
                z[row[0]] = (row[1], row[2] if len(row) > 2 else "")
    return z


ALLE = lade()
W4 = collections.OrderedDict((k, v) for k, v in ALLE.items() if k.startswith("W4_"))
TEIL_RE = re.compile(r"^(W4_[A-Z0-9]+_[A-Z]+_\d{4})(?:_(\d))?$")


def basis(k):
    m = TEIL_RE.match(k)
    return m.group(1) if m else k


def spr(k):
    return k.split("_")[2]


def absch(k):
    return k.split("_")[1]


def saetze(t):
    return [s for s in re.split(r"(?<=[.!?…])[“\"]?\s+", t.strip()) if s.strip()]


def woerter(s):
    return re.findall(r"[A-Za-zÄÖÜäöüß0-9'’-]+", s)


def skript():
    out = collections.OrderedDict()
    for zeile in open(SKRIPT, encoding="utf-8"):
        if not zeile.startswith("| W4"):
            continue
        zellen = [c.strip() for c in zeile.strip().strip("|").split("|")]
        k = zellen[0].replace("\\_", "_")
        out[k] = (zellen[1], zellen[2].replace("\\_", "_"), zellen[3] if len(zellen) > 3 else "")
    return out


def abgleich():
    s = skript()
    gruppen = collections.OrderedDict()
    for k, (de, en) in W4.items():
        gruppen.setdefault(basis(k), []).append(de)
    print("Skript-IDs:", len(s), " CSV-Basis-IDs:", len(gruppen), " CSV-Schluessel:", len(W4))
    print("nur im Skript:", [k for k in s if k not in gruppen])
    print("nur in CSV:", [k for k in gruppen if k not in s])
    n = 0
    for k, (sp, text, regie) in s.items():
        if k not in gruppen:
            continue
        a = " // ".join(gruppen[k])
        b = re.sub(r"\s*//\s*", " // ", text)
        if a != b:
            n += 1
            print("ABW", k, "\n  S:", b, "\n  C:", a)
    print("Textabweichungen:", n)
    leer_en = [k for k, (de, en) in W4.items() if not en.strip()]
    print("ohne Englisch:", len(leer_en), leer_en[:10])


REIHENFOLGE = ["TEST", "RAU", "GLUE", "FERN", "SIT", "SAV", "VERH", "FRIE", "KELL", "HALL", "BONU", "KAPI",
               "FABR", "WERB", "EMPF", "ARCH", "STUD", "TAST", "PIXM", "INV", "ABS", "ZURF", "HINT"]


def szenen():
    print("Abschnitt | Basis-IDs | Blasen | Zeichen de | Zeichen en | Blasen >140 de | >140 en | NAR >100 | laengste Blase")
    ges = [0, 0, 0, 0, 0, 0, 0]
    for a in REIHENFOLGE:
        ks = [k for k in W4 if absch(k) == a]
        if not ks:
            continue
        b = len({basis(k) for k in ks})
        zde = sum(len(W4[k][0]) for k in ks)
        zen = sum(len(W4[k][1]) for k in ks)
        lang = [k for k in ks if spr(k) != "NAR" and len(W4[k][0]) > 140]
        langen = [k for k in ks if spr(k) != "NAR" and len(W4[k][1]) > 140]
        nar = [k for k in ks if spr(k) == "NAR" and len(W4[k][0]) > 100]
        mx = max(ks, key=lambda k: len(W4[k][0]))
        print(f"{a} | {b} | {len(ks)} | {zde} | {zen} | {len(lang)} | {len(langen)} | {len(nar)} | {mx} ({len(W4[mx][0])})")
        for i, v in enumerate([b, len(ks), zde, zen, len(lang), len(langen), len(nar)]):
            ges[i] += v
    print("SUMME |", " | ".join(str(v) for v in ges))
    andere = sorted({absch(k) for k in W4} - set(REIHENFOLGE))
    print("nicht in Reihenfolge:", andere)
    print("\nBlasen ueber 140 Zeichen (de):")
    for k in W4:
        if spr(k) != "NAR" and len(W4[k][0]) > 140:
            print(f"  {k} ({len(W4[k][0])}): {W4[k][0]}")
    print("\nBlasen ueber 140 Zeichen (en), nur IDs:")
    print("  " + ", ".join(f"{k[3:]} ({len(W4[k][1])})" for k in W4 if spr(k) != "NAR" and len(W4[k][1]) > 140))
    print("\nNAR ueber 100 Zeichen (de):")
    print("  " + ", ".join(f"{k[3:]} ({len(W4[k][0])})" for k in W4 if spr(k) == "NAR" and len(W4[k][0]) > 100))
    print("\nSaetze ueber 120 Zeichen (de):")
    for k in W4:
        for s_ in saetze(W4[k][0]):
            if len(s_) > 120:
                print(f"  {k} ({len(s_)}): {s_}")


def figuren():
    d = collections.defaultdict(list)
    for k in W4:
        d[spr(k)].append(k)
    print("Sprecher | Blasen | Basis-IDs | Zeichen/Blase | Woerter/Satz | Anteil Saetze <=3 W. | Anteil Blasen mit '!' | Blasen >140")
    for sp, ks in sorted(d.items(), key=lambda x: -len(x[1])):
        ss = [s_ for k in ks for s_ in saetze(W4[k][0])]
        wl = [len(woerter(s_)) for s_ in ss] or [0]
        kurz = sum(1 for w in wl if w <= 3) / max(1, len(wl))
        ausr = sum(1 for k in ks if "!" in W4[k][0]) / len(ks)
        zb = sum(len(W4[k][0]) for k in ks) / len(ks)
        print(f"{sp} | {len(ks)} | {len({basis(k) for k in ks})} | {zb:.0f} | {sum(wl)/len(wl):.1f} | {kurz:.0%} | {ausr:.0%} | {sum(1 for k in ks if len(W4[k][0]) > 140)}")


MUSTER = [
    ("M8a Kontrast 'Das ist kein X(.|,) Das ist Y'", r"\b(?:[Dd]as|[Ee]s|[Dd]ie|[Dd]er) (?:ist|war|sind) (?:kein|keine|keinen|nicht)\b[^.!?]*[.,;:] ?(?:[Dd]as|[Ee]s|[Dd]ie|[Dd]er|[Ss]ondern) (?:ist|war|sind)?"),
    ("M8b 'nicht/kein X, sondern Y'", r"\b(?:nicht|kein|keine|keinen)\b[^.!?]{0,60}\bsondern\b"),
    ("M8c Kontrast-Schwanz ', nicht/kein X.'", r", (?:nicht|kein|keine|keinen) [^.,!?]{1,40}[.!]"),
    ("M8d 'Ich bin X, kein Y'", r"\b[Ii]ch bin [^.!?,]{1,40}, (?:kein|keine|nicht)\b"),
    ("M8e 'X ist nicht das Problem, Y ist es' / 'nicht X, (das ist) Y'", r"\bnicht das Problem\b|\bkeine Frage von\b"),
    ("Entweder-oder", r"\b[Ee]ntweder\b[^.!?]*\boder\b"),
    ("'. Oder Y.' Zweideutung als Schluss", r"[.!?] Oder [^.!?]{1,60}[.!?]"),
    ("Bilanz/Superlativ ('meines Lebens', 'das X-ste, was', 'je', 'zum ersten Mal')", r"\b(?:meines Lebens|[Dd]as ist das \w+ste\b|[Dd]as \w+ste, was|was ich je\b|die ich je\b|den ich je\b|[Dd]as erste Mal|[Zz]um ersten Mal|das Einzige)"),
    ("Schlusssatz 'Das ist/war X.' am Blasenende", r"[.!?] Das (?:ist|war|nennt man|sind|sagt) [^.!?]{3,60}[.!]\s*$"),
    ("'Das nennt man' / 'Ich nenne'", r"\b(?:[Dd]as nennt man|[Ii]ch nenne|nennt das|[Mm]an nennt)\b"),
    ("Kurz-Nachklapp (1-2 Woerter) am Blasenende", r"[.!?] (?:[A-ZÄÖÜ][\wäöüß]+|[A-ZÄÖÜ][\wäöüß]+ [\wäöüß]+)\.\s*$"),
    ("Dreierreihe 'A, B und C'", r"\b[\wäöüÄÖÜß-]+, [\wäöüÄÖÜß -]{2,25} und [\wäöüÄÖÜß-]+"),
    ("Dreier-Stakkato (3 Saetze <=3 Woerter in Folge)", None),
    ("Fuellwoerter", r"\b(?:[Ee]hrlich gesagt|[Ee]hrlich,|irgendwie|eigentlich|[Ii]m Grunde|quasi|offenbar|wohlgemerkt|sozusagen|tatsächlich|übrigens|[Nn]un ja|[Ll]ass uns|vermutlich|bestimmt|wahrscheinlich)\b"),
    ("'und zwar'", r"\bund zwar\b"),
    ("'natürlich'", r"\b[Nn]atürlich\b"),
    ("'Sogar/Selbst X ...' als Schlusssatz", r"(?:^|[.!?] )(?:Sogar|Selbst) [^.!?]+[.!]\s*$"),
    ("'Hier ...' Weltregel-Satz", r"(?:^|[.!?] )Hier (?:ist|wird|hat|geht|fragt|rutscht|steht|stand|landen|wohnt) [^.!?]+[.!]"),
    ("'Wer X, (der) Y' Sentenz", r"(?:^|[.!?/] )Wer [^.!?]{5,70}, [^.!?]{3,60}[.!]"),
    ("'als hätte/wäre/würde'", r"\bals (?:hätte|wäre|würde|wollte|hätten|wären)\b"),
    ("'wie'-Vergleich", r"\bwie (?:ein|eine|einen|einem|einer|auf|bei|in|durch|nach|vor|frisch|der|die|das|meine|Wäsche|Statisten|Faschingskostüme)\b"),
    ("'sieht aus wie/als'", r"\b[Ss]ieht (?:[\w ,]{0,25})?aus,? (?:wie|als)\b|\b[Ss]ehen aus wie\b|\b[Ss]ieht aus wie\b"),
    ("Selbstkorrektur 'Also, ...'", r"\b[Aa]lso[,:]? "),
    ("Gefuehl benannt", r"\b(?:[Ii]ch (?:fühl|fühle) mich|[Ii]ch bin (?:gerührt|beeindruckt|erleichtert|erschüttert|fasziniert|beunruhigt|gleichzeitig)|tut mir leid|Mitleid|[Rr]espekt\b)"),
    ("Max erklaert Mechanik/Lösung", r"\b(?:hab ich eine Taste|[Ii]ch brauch(?:e)? |[Ii]ch muss |[Dd]as ist meine Chance|[Ee]rst muss|muss erst|[Ee]rst \w+, dann)\b"),
    ("Opa-Bezug", r"\bOpa(?:s)?\b"),
    ("Handy/Streaming/Chat-Vergleich", r"\b(?:Handy\w*|Akku|Follower|WLAN|Gruppenchat|Klassenchat|Gruppenanruf|Startseite|Pop-up|GIF|Recaps|Autoplay|googeln|Netz|Social Media|\w*[Ff]ilter|Bildschirmschoner|Ladesymbol|Snooze|Hotline|weggeklickt|wegklicken|Admin|Chatten)\b"),
    ("'früher'", r"\b[Ff]rüher\b"),
    ("'junger Mann/Herr'", r"\bjunger (?:Mann|Herr)\b"),
    ("Pixel-Einschub ('wenn ich das anmerken darf' u. ae.)", r"wenn ich das anmerken darf|wenn du mich fragst|um genau zu sein|versteht sich|wie man so sagt|das muss man \w+ zugeben|wenn ich bitten darf|wenn es recht ist|falls dir das entgangen ist|wie dir vielleicht aufgefallen ist|das solltest du wissen"),
    ("'grundsätzlich' / 'Prinzip'", r"\b(?:grundsätzlich|aus Prinzip|Prinzipien|Prinzip)\b"),
    ("Pixel-Anekdote 'Ich habe einmal/schon ...'", r"\bIch habe (?:einmal|schon|mein|genug|das einmal|zugesehen|mich schon)\b"),
    ("'in meiner Familie' / 'Vorfahren'", r"\b(?:[Ii]n meiner Familie|Vorfahren|bei uns in der Familie)\b"),
    ("Meta-Gag Vertrag/Budget/Staffel/Drehbuch/bezahlt", r"\b(?:Vertrag|Budget|bezahlt|Staffel\w*|Drehbuch|Statisten|Hauptrolle|Text\b)"),
    ("Gedankenstrich als Satzzeichen", r" [–—-] "),
    ("Semikolon", r";"),
    ("Anglizismen-Kandidaten", r"\b(?:Sinn machen|macht Sinn|am Ende des Tages|nicht wirklich|[Dd]as ist,? was ich|einmal mehr|[Ii]ch bin durch|Wir sind durch|hat geliefert|einen Blick drauf)\b"),
    ("'Ich sage nichts/es nicht' (Pixel schweigt demonstrativ)", r"Ich sage (?:nichts|es nicht|jetzt nichts|das ungern|das sehr ungern)|Ich schweige|Sag es ihm nicht|bleibt unter uns|nie wieder erwähnen"),
    ("'Endlich ...'", r"(?:^|[.!?] )Endlich\b"),
    ("'Ich mag/respektiere ...' Pixel-Geständnis", r"\bIch (?:mag|respektiere) "),
]


def stakkato(t):
    ss = saetze(t)
    for i in range(len(ss) - 2):
        if all(len(woerter(x)) <= 3 for x in ss[i:i + 3]):
            return True
    return False


def muster():
    ohne_nar = [(k, v[0]) for k, v in W4.items() if spr(k) != "NAR"]
    print("Blasen ohne NAR:", len(ohne_nar))
    voll = len(sys.argv) > 2 and sys.argv[2] == "voll"
    for name, rx in MUSTER:
        if rx is None:
            tr = [k for k, t in ohne_nar if stakkato(t)]
        else:
            r = re.compile(rx)
            tr = [k for k, t in ohne_nar if r.search(t)]
        nach = collections.Counter(spr(k) for k in tr)
        print(f"\n## {name}: {len(tr)}  ({', '.join(f'{a} {b}' for a, b in nach.most_common(8))})")
        if voll:
            for k in tr:
                print(f"  {k[3:]} | {W4[k][0]}")
        else:
            print("  " + ", ".join(k[3:] for k in tr[:80]))


QUER = [
    ("in einer/einem anderen (Schloss-Formel)", r"ist in eine[mr] anderen"),
    ("Frage hätte ich noch / hätte da noch eine Frage", r"[Ff]rage hätte ich noch|hätte da (?:nur |noch )?eine Frage"),
    ("Folge 87", r"Folge 87"),
    ("Nur für kurze Zeit", r"[Nn]ur für kurze Zeit"),
    ("1988", r"1988"), ("1977", r"1977"),
    ("Milch", r"\bMilch"), ("Thunfisch", r"Thunfisch"), ("Napf", r"\bNapf"), ("Nickerchen", r"Nickerchen"),
    ("junger Mann", r"junger Mann"), ("wenn ich das anmerken darf", r"wenn ich das anmerken darf"),
    ("Opa würde", r"Opa würde"), ("Opa (alle)", r"\bOpas?\b"), ("Sofa", r"\bSofa"), ("Akku", r"\bAkku"), ("Handy", r"\bHandy"), ("WLAN", r"WLAN"),
    ("meines Lebens", r"meines Lebens"), ("zum ersten Mal / das erste Mal", r"[Zz]um ersten Mal|[Dd]as erste Mal"),
    ("entweder … oder", r"[Ee]ntweder[^.!?]*oder"),
    ("Das ist kein X(.|,) Das ist Y", r"[Dd]as ist kein\w* [^.!?,]+[.,] [Dd]as ist"),
    ("nicht/kein … sondern", r"\b(?:nicht|kein\w*)\b[^.!?]{0,60}\bsondern\b"),
    ("früher", r"\b[Ff]rüher\b"), ("Vorfahren", r"Vorfahren"), ("in meiner Familie", r"in meiner Familie"),
    ("grundsätzlich", r"grundsätzlich"), ("Prinzip", r"Prinzip"), ("Respekt", r"\bRespekt"),
    ("Vorheizen", r"[Vv]orheizen|VORHEIZEN"), ("Weltuntergang", r"Weltuntergang"), ("Passwort", r"Passwort"),
    ("Lange Geschichte", r"[Ll]ange Geschichte|LANGE GESCHICHTE"), ("Budget", r"\bBudget"), ("Vertrag", r"\bVertrag"),
    ("Profi", r"\bProfi"), ("Karma", r"Karma"), ("Endgegner", r"Endgegner"), ("Seelentier", r"Seelentier"),
    ("ehrlich gesagt", r"[Ee]hrlich gesagt"), ("und zwar", r"und zwar"), ("irgendwie", r"irgendwie"),
    ("im Grunde", r"[Ii]m Grunde"), ("offenbar", r"offenbar"), ("natürlich", r"\b[Nn]atürlich\b"), ("eigentlich", r"\beigentlich\b"),
    ("Gruppenchat/Klassenchat/Gruppenanruf", r"Gruppenchat|Klassenchat|Gruppenanruf"), ("Follower", r"Follower"),
    ("Ich sage nichts / schweige", r"Ich sage (?:nichts|es nicht|jetzt nichts)|Ich schweige"),
    ("beschweren / Beschwerde / Klage / Brief", r"beschweren|Beschwerde|Klage erheben|einen Brief schreiben"),
    ("Kissen", r"\bKissen"), ("Würde", r"\bWürde\b"), ("Endlich am Satzanfang", r"(?:^|[.!?] )Endlich\b"),
    ("als hätte/wäre/würde", r"\bals (?:hätte|wäre|würde|wollte)\b"),
    ("Wer …, (der) … (Sentenz)", r"(?:^|[.!?] )Wer [^.!?]{5,70}, [^.!?]{3,60}[.!]"),
    ("Sogar/Selbst … als Schlusssatz", r"(?:^|[.!?] )(?:Sogar|Selbst) [^.!?]+[.!]\s*$"),
]


def welt(k):
    p = k.split("_")[0]
    return {"P0": "Prolog", "W1": "W1", "W2": "W2", "W3": "W3", "W4": "W4", "ZS1": "ZS", "ZS2": "ZS", "ZS3": "ZS", "FI": "Finale"}.get(p)


def quer():
    spalten = ["Prolog", "W1", "W2", "W3", "W4", "ZS", "Finale"]
    n = collections.Counter(welt(k) for k in ALLE if welt(k) and "_NAR_" not in k)
    print("Blasen ohne NAR | " + " | ".join(str(n[s]) for s in spalten))
    print("Formel | " + " | ".join(spalten))
    for name, rx in QUER:
        r = re.compile(rx)
        c = collections.Counter()
        for k, (de, en) in ALLE.items():
            w = welt(k)
            if w and "_NAR_" not in k and r.search(de):
                c[w] += 1
        print(f"{name} | " + " | ".join(str(c[s]) for s in spalten))


def liste():
    sp = sys.argv[2]
    col = sys.argv[3] if len(sys.argv) > 3 else "de"
    for k, (de, en) in W4.items():
        if spr(k) == sp or absch(k) == sp:
            if col == "beide":
                print(f"{k[3:]}\n  DE: {de}\n  EN: {en}")
            else:
                print(f"{k[3:]} | {de if col == 'de' else en}")


def suche():
    r = re.compile(sys.argv[2])
    pr = sys.argv[3] if len(sys.argv) > 3 else "W4_"
    n = 0
    for k, (de, en) in ALLE.items():
        if k.startswith(pr) and r.search(de):
            n += 1
            print(f"{k} | {de}")
    print("Treffer:", n)


{"abgleich": abgleich, "szenen": szenen, "figuren": figuren, "muster": muster, "quer": quer, "liste": liste, "suche": suche}[sys.argv[1]]()
