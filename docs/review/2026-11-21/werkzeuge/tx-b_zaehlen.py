# -*- coding: utf-8 -*-
"""Review 21.11.2026 (Cloud), Rolle tx-b: Zählungen (aus tx-b_zaehlen.py, Präfixe W2 und W3 ergänzt) über texte.csv (nur lesend).
Aufruf: python3 docs/review/2026-11-21/werkzeuge/tx-b_zaehlen.py [muster|laenge|sprecher|en] [--ids] [ABSCHNITT ...]
Abschnitte: W2 W3 (Standard), zum Vergleich auch P0 ZS1 ZS2 ZS3 W1 SYS UI.
Zählungen sind Rohtreffer; ob ein Treffer ein Fund ist, entscheidet erst die Lesung (siehe Notiz tx-b.md).
"""
import csv, collections, re, statistics, sys, os

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', '..'))
rows = [r for r in csv.reader(open(os.path.join(REPO, 'game/lokalisierung/texte.csv'), encoding='utf-8')) if r and len(r) >= 3][1:]
ALLE = ['P0', 'ZS1', 'ZS2', 'ZS3', 'W1', 'SYS', 'UI', 'W2', 'W3']
args = [a for a in sys.argv[1:] if not a.startswith('--')]
teil = args[0] if args and args[0] in ('muster', 'laenge', 'sprecher', 'en') else 'muster'
absch = [a for a in args if a in ALLE] or ['W2', 'W3']
IDS = '--ids' in sys.argv

def ab(k): return k.split('_')[0]
def sp(k):
    p = k.split('_')
    return p[2] if len(p) > 3 else '?'
def saetze(t):
    t = re.sub(r'[„“”"‚‘]', '', t)
    return [s for s in re.split(r'(?<=[.!?…])\s+', t.strip()) if s.strip()]
def woerter(s): return re.findall(r"[A-Za-zÄÖÜäöüß0-9'’-]+", s)

daten = collections.defaultdict(list)
for k, de, en in [(r[0], r[1], r[2]) for r in rows]:
    if ab(k) in absch:
        daten[ab(k)].append((k, de, en))

def nachklapp(t):
    s = saetze(t)
    return len(s) >= 2 and len(woerter(s[-1])) <= 2
def fragmentreihe(t):
    s = saetze(t)
    n = 0
    for x in s:
        n = n + 1 if len(woerter(x)) <= 3 else 0
        if n >= 3: return True
    return False

MUSTER = [
    ('Kontrast: kein/nicht X, sondern Y', r'\b(nicht|kein\w*)\b[^.!?]{0,45}, sondern\b'),
    ('Kontrast: Das ist/war kein X. Das/Es ist Y', r'\b(ist|war|sind) (kein\w*|nicht) [^.!?]{1,40}[.!] (Das|Es|Er|Sie|Dies\w*) (ist|war|sind)\b'),
    ('Kontrast-Schwanz ", nicht/kein X." am Zeilenende', r', (nicht|kein\w*) [^,.!?]{1,30}[.!]$'),
    ('Kontrast: "X und kein(e) Y" / "X, kein Y"', r'\bund kein\w* \w+[.!]'),
    ('Entweder-oder', r'\b[Ee]ntweder\b'),
    ('"Oder ..." als eigener Kurzsatz', r'[.!?] Oder [^.!?]{1,30}[.!]'),
    ('Das nennt man / Ich nenne (das|es) / nennt das', r'\b[Nn]ennt man\b|\b[Ii]ch nenn\w* (es|das)\b|\bnennt (das|es|ihn|sie)\b'),
    ('wenigstens / immerhin', r'\b[Ww]enigstens\b|\b[Ii]mmerhin\b'),
    ('ehrlich (gesagt)', r'\b[Ee]hrlich\b'),
    ('Anlauf: Okay / Na gut / Gut. / Also gut am Zeilenanfang', r'^(Okay|Na gut|Gut[.,]|Also gut|Schon gut|Na schön)'),
    ('und zwar', r'\bund zwar\b'),
    ('ziemlich sicher', r'ziemlich sicher'),
    ('seit ich denken kann', r'seit ich denken kann'),
    ('Bei Opa ...', r'\b[Bb]ei Opa\b'),
    ('Respekt. (Ein-Wort-Urteil)', r'\bRespekt[.!]'),
    ('Wie X, nur Y', r'\b[Ww]ie [^.!?,]{1,40}, nur\b'),
    ('Gedankenstrich als Satzzeichen', r' [–—] |[–—]$'),
    ('Prinzip(ien)', r'Prinzip'),
    ('trotzdem', r'\b[Tt]rotzdem\b'),
    ('freiwillig', r'freiwillig'),
    ('tatsächlich', r'\b[Tt]atsächlich\b'),
    ('Nun ja / Nun,', r'\bNun ja\b|^Nun,|[.!?] Nun,'),
    ('Lass uns', r'\b[Ll]ass uns\b'),
    ('interessant', r'[Ii]nteressant'),
    ('junger Mann', r'\bjunger Mann\b'),
    ('wenn ich das anmerken darf / mit Verlaub', r'wenn ich (das )?(anmerken|bitten|ergänzen|sagen) darf|mit Verlaub'),
    ('Ich sage nichts / sage es nicht (Pixel)', r'[Ii]ch sage (es )?(nur )?(nichts|nicht)\b|sage ich nicht'),
    ('Medien: Staffel/Serie/Folge/Autoplay/Stream/App/Download/Update/Akku/Handy/WLAN/Level/Tutorial', r'Staffel|\bSerie[n]?\b|Autoplay|[Ss]tream|\bApp[s]?\b|Download|Update|Akku|Handy|WLAN|Level|Tutorial|Ladebildschirm|Spoiler|Abo\b|Follower|Chat\b|4K|Bildschirmschoner|Standby|Nachtmodus|Autokorrektur'),
    ('Superlativ-Bilanz: ... der Welt / meines Lebens / je(mals)', r'der Welt[.!]|meines Lebens|den es gibt|die es gibt|das es gibt|was ich je\b|den ich je\b|die ich je\b'),
    ('Benutzen-Schablone Max: "Ich <Verb> ... nicht/kein ..." als erster Satz', None),
    ('Zeile beginnt mit "Ich hab"', r'^Ich hab(e)?\b'),
    ('Ein-/Zwei-Wort-Nachklapp am Zeilenende', None),
    ('Fragmentreihe (3+ Sätze mit <=3 Wörtern in Folge)', None),
    ('Doppelpunkt-Pointe "...: X." am Zeilenende', r': [^:„“]{1,25}[.!]$'),
    ('"(Das ist) ein Unterschied"', r'ein Unterschied'),
    ('Meinung(en) haben', r'Meinung(en)? (zu|über)|hat (eine )?Meinung'),
]

def treffer(name, rx, k, de):
    if name.startswith('Benutzen-Schablone'):
        if sp(k) != 'MAX': return False
        s = saetze(de)
        return bool(s) and re.match(r'^Ich \w+', s[0]) and re.search(r'\b(nicht|nichts|kein\w*|nie)\b', s[0]) and len(woerter(s[0])) <= 9
    if name.startswith('Ein-/Zwei-Wort'): return nachklapp(de)
    if name.startswith('Fragmentreihe'): return fragmentreihe(de)
    return bool(re.search(rx, de))

if teil == 'muster':
    print('Muster'.ljust(78), ' '.join(a.rjust(5) for a in absch))
    print('Zeilen'.ljust(78), ' '.join(str(len(daten[a])).rjust(5) for a in absch))
    for name, rx in MUSTER:
        z = {a: [k for k, de, en in daten[a] if '_NAR_' not in k and treffer(name, rx, k, de)] for a in absch}
        print(name[:78].ljust(78), ' '.join(str(len(z[a])).rjust(5) for a in absch))
        if IDS:
            for a in absch:
                if z[a]: print('     ', a, ', '.join(x.replace(a + '_', '', 1) for x in z[a]))
elif teil == 'sprecher':
    for a in absch:
        d = collections.defaultdict(list)
        for k, de, en in daten[a]:
            d[sp(k)].append(de)
        print('==', a)
        for s, l in sorted(d.items(), key=lambda x: -len(x[1])):
            if len(l) < 8: continue
            ss = [x for t in l for x in saetze(t)]
            wl = [len(woerter(x)) for x in ss]
            kurz = sum(1 for w in wl if w <= 3) / max(1, len(wl))
            print(f'  {s:5} Zeilen {len(l):4}  Wörter/Satz {statistics.mean(wl):4.1f}  Kurzsätze(<=3) {kurz*100:3.0f} %  Zeichen/Zeile {statistics.mean(len(t) for t in l):5.1f}')
elif teil == 'laenge':
    for a in absch:
        l = daten[a]
        de = [len(x[1]) for x in l]; en = [len(x[2]) for x in l]
        print(f'== {a}: {len(l)} Zeilen; DE Ø {statistics.mean(de):.0f}, max {max(de)}; EN Ø {statistics.mean(en):.0f}, max {max(en)}; DE>140: {sum(1 for x in de if x>140)}, EN>140: {sum(1 for x in en if x>140)}, DE>120: {sum(1 for x in de if x>120)}, EN>120: {sum(1 for x in en if x>120)}')
        if IDS:
            for k, d, e in l:
                if len(e) > 140 or len(d) > 140: print('   ', k, len(d), len(e))
elif teil == 'en':
    for a in absch:
        for k, d, e in daten[a]:
            p = []
            if not e.strip(): p.append('EN leer')
            if e.strip() == d.strip() and len(d) > 3 and not re.match(r'^[\W\d…]+$', d): p.append('EN = DE')
            if d.strip() and not d.strip().endswith(('…',)) and len(d) >= 12 and len(e) > 1.45 * len(d) + 6: p.append(f'EN deutlich länger ({len(d)} -> {len(e)})')
            if re.search(r'[äöüßÄÖÜ]', e): p.append('Umlaut in EN')
            if d.count('//') != e.count('//'): p.append('// ungleich')
            if d.count('[') != e.count('[') or d.count('%') != e.count('%') or d.count('{') != e.count('{'): p.append('Platzhalter ungleich')
            if d.strip()[-1:] in '.!?' and e.strip()[-1:] not in '.!?…"”\'’)' : p.append('Satzende fehlt in EN')
            if p: print(k, '|', '; '.join(p), '|', d[:70], '|', e[:90])
