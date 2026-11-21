# -*- coding: utf-8 -*-
"""Review 21.11.2026, Rolle nd-b: Zaehlungen ueber texte.csv fuer Welt 2 und Zwischenspiel 2.

Aufruf (im Pruef-Checkout):  py -3 docs/review/2026-11-21/werkzeuge/nd-b_zaehlen.py [teil] [--ids]
teil: grund | muster | sprecher | laenge | en | anfang | alle (Standard)
Nur lesend. Gibt Text auf der Konsole aus.
"""
import csv
import collections
import re
import statistics
import sys

CSV = 'game/lokalisierung/texte.csv'
rows = [r for r in csv.reader(open(CSV, encoding='utf-8')) if r and len(r) >= 3][1:]
ABSCHNITTE = ['P0', 'W1', 'ZS1', 'W2', 'ZS2', 'W3', 'ZS3']


def abschnitt(key):
    return key.split('_')[0]


def sprecher(key):
    p = key.split('_')
    return p[2] if len(p) > 3 else '?'


def saetze(text):
    t = re.sub(r'[„“”"‚‘]', '', text)
    teile = re.split(r'(?<=[.!?…])\s+', t.strip())
    return [s for s in teile if s.strip()]


def woerter(s):
    return re.findall(r"[A-Za-zÄÖÜäöüß0-9'’-]+", s)


daten = collections.defaultdict(list)
for k, de, en in [(r[0], r[1], r[2]) for r in rows]:
    a = abschnitt(k)
    if a in ABSCHNITTE:
        daten[a].append((k, de, en))

MUSTER = [
    ('und zwar', r'\bund zwar\b'),
    ('M8 kein X. Das ist Y (Satzpaar)', r'\b[Kk]eine?[nmrs]? [^.!?]{1,40}[.,] (Das|Dieser|Diese|Es|Sie|Er|Hier) (ist|wird|sind|war)\b'),
    ('M8 nicht X, sondern Y', r'\bnicht\b[^.!?]{0,40}, sondern\b|\bkein[e]?[nmrs]?\b[^.!?]{0,40}, sondern\b'),
    ('M8 Kontrast-Schwanz ", nicht X." / ", kein X."', r', (nicht|kein[e]?[nmrs]?) [^,.!?]{1,25}[.!]$'),
    ('Das nennt man / Ich nenne (es|das)', r'\b[Nn]ennt man\b|\b[Ii]ch nenn[e]? (es|das)\b|\bnenn(t|e)? das\b'),
    ('Das ist + Abstraktum (Kurzsatz, <=4 Woerter)', r'(^|[.!?] )Das ist (\w+[ ]?){1,3}[.!]'),
    ('Ein-/Zwei-Wort-Nachklapp am Zeilenende', None),
    ('Trikolon Adjektive "a, b und c"', r'\b[A-ZÄÖÜa-zäöüß]{3,}, [a-zäöüß]{3,}(,)? und [a-zäöüß]{3,}'),
    ('Dreier-Fragmentliste "X. Y. Z."', None),
    ('entweder ... oder', r'\b[Ee]ntweder\b'),
    ('Ablehn-Schablone "...? Dann ..."', r'\? Dann\b'),
    ('seit N Jahren/Jahrtausenden', r'\bseit [^.,!?]{1,30}(Jahren|Jahrtausenden|Jahrhunderten)\b'),
    ('trotzdem', r'\b[Tt]rotzdem\b'),
    ('Endlich (Satzanfang)', r'(^|[.!?] )Endlich\b'),
    ('junger Mann', r'\bjunger Mann\b'),
    ('wenn ich das anmerken/bitten/ergaenzen darf, mit Verlaub', r'wenn ich (das )?(anmerken|bitten|ergänzen) darf|mit Verlaub'),
    ('selbstverstaendlich / ausgesprochen / vollkommen', r'\b[Ss]elbstverständlich\b|\b[Aa]usgesprochen\b|\b[Vv]ollkommen\w*\b'),
    ('als haette/waere/wuerde/wuesste (Vergleich)', r'\bals (hätte|wäre|wär|würde|wüsste|ob)\b'),
    ('wie-Vergleich (so ... wie / wie ein)', r'\b(so|genau so|genauso) [^.!?]{0,30}\bwie\b|\bwie (ein|eine|einen|einer|der|die|das|bei|in|im|alle)\b'),
    ('Fuellwoerter: eindeutig/offenbar/vermutlich/quasi/sozusagen', r'\b(eindeutig|offenbar|vermutlich|quasi|sozusagen|anscheinend)\b'),
    ('Fuellwoerter: echt/ehrlich/einfach/bestimmt/ziemlich', r'\b(echt|[Ee]hrlich|einfach|bestimmt|ziemlich|wahrscheinlich|garantiert)\b'),
    ('Nachklapp ", und das ist/war/..."', r', und das (ist|war|will|kann|zählt|beruhigt|überlebt|tut|macht|reicht|sage|meine|hat)\b'),
    ('Selbstkorrektur "Also, ..." / "Ich meine, ..."', r'(^|[.!?…] )Also[,:] |\bIch meine,|\bMoment\.'),
    ('Meta-Rede Pixel: Ich sage/erwaehne/moechte betonen/muss gestehen', r'\bIch (sage|erwähne|möchte|muss (gestehen|zugeben|sagen|dir))\b|\bich muss (zugeben|sagen|gestehen)\b'),
    ('nicht (ein)mal', r'\bnicht (ein)?mal\b|\b[Nn]icht einmal\b'),
    ('Tautologie "X ist/sind X"', r'\b(\w{4,}) (ist|sind) \1\b'),
    ('Okay (Zeilenanfang)', r'^Okay\b'),
    ('Moment (Zeilenanfang)', r'^Moment\b'),
    ('Nun ja / Tatsaechlich / Lass uns / interessant', r'\bNun ja\b|(^|[.!?] )Tatsächlich\b|\bLass uns\b|\binteressant\b'),
    ('Gedankenstrich als Satzzeichen', r' [–—-] '),
    ('Auslassungspunkte', r'…|\.\.\.'),
    ('Semikolon', r';'),
    ('Ich kenne das / Ich verstehe', r'\bIch kenne (das|dieses|es)\b|\bIch verstehe (ihn|sie|es|die|das)\b'),
    ('Ich (habe) ... (noch) nie', r'\bnoch nie\b|\bnie wieder\b|\bniemals\b'),
    ('freiwillig', r'\b[Ff]reiwillig\b'),
    ('genau (Verstaerker)', r'\bgenau\b'),
    ('Das ist/war kein X, das ist/war Y (ein Satz)', r'\b[Dd]as (ist|war|wär|wird) kein[e]?[nmrs]? [^.!?]{1,30}, das (ist|war|wär|wird)\b'),
]


def nachklapp(text):
    s = saetze(text)
    if len(s) < 2:
        return False
    letzter = woerter(s[-1])
    return 1 <= len(letzter) <= 2 and not text.isupper()


def dreier_fragment(text):
    s = saetze(text)
    kurz = [len(woerter(x)) <= 3 for x in s]
    for i in range(len(kurz) - 2):
        if kurz[i] and kurz[i + 1] and kurz[i + 2]:
            return True
    return False


def treffer(name, rx, text):
    if name.startswith('Ein-/Zwei-Wort-Nachklapp'):
        return nachklapp(text)
    if name.startswith('Dreier-Fragmentliste'):
        return dreier_fragment(text)
    return re.search(rx, text) is not None


def grund():
    print('== Grundzahlen (Blase = CSV-Zeile) ==')
    print('Abschnitt | Zeilen | Zeichen | Ø | >120 | >140 | NAR | NAR>75')
    for a in ABSCHNITTE:
        z = daten[a]
        l = [len(d) for _, d, _ in z]
        nar = [(k, d) for k, d, _ in z if sprecher(k) == 'NAR']
        print(a, '|', len(z), '|', sum(l), '|', round(statistics.mean(l), 1), '|', sum(1 for x in l if x > 120), '|',
              sum(1 for x in l if x > 140), '|', len(nar), '|', sum(1 for k, d in nar if len(d) > 75))


def muster(mit_ids=False):
    print('== Muster: Zeilen mit Treffer, in Klammern je 1000 Zeilen ==')
    print('Muster | W1 | W2 | W3 | ZS2 | W2 Max | W2 Pixel | W2 andere')
    for name, rx in MUSTER:
        zeile = [name]
        for a in ['W1', 'W2', 'W3', 'ZS2']:
            n = sum(1 for k, d, _ in daten[a] if treffer(name, rx, d))
            zeile.append('%d (%d)' % (n, round(1000 * n / max(1, len(daten[a])))))
        for gruppe in ['MAX', 'PIX', None]:
            n = 0
            for k, d, _ in daten['W2']:
                sp = sprecher(k)
                if (gruppe and sp == gruppe) or (gruppe is None and sp not in ('MAX', 'PIX')):
                    if treffer(name, rx, d):
                        n += 1
            zeile.append(str(n))
        print(' | '.join(zeile))
        if mit_ids:
            for a in ['W2', 'ZS2']:
                for k, d, _ in daten[a]:
                    if treffer(name, rx, d):
                        print('    ', k, '|', d)


def sprecher_tabelle():
    print('== Sprecher in W2+ZS2: Blasen, Ø Zeichen/Blase, Ø Woerter/Satz, Saetze/Blase, Anteil Saetze <=3 Woerter, Anteil Zeilen mit "Ich" am Satzanfang, "!"-Anteil ==')
    sp = collections.defaultdict(list)
    for a in ['W2', 'ZS2']:
        for k, d, _ in daten[a]:
            sp[sprecher(k)].append(d)
    for s, zeilen in sorted(sp.items(), key=lambda x: -len(x[1])):
        alle = [x for z in zeilen for x in saetze(z)]
        wl = [len(woerter(x)) for x in alle if woerter(x)]
        kurz = sum(1 for w in wl if w <= 3) / max(1, len(wl))
        ich = sum(1 for z in zeilen if re.search(r'(^|[.!?] )Ich\b', z)) / len(zeilen)
        ruf = sum(1 for x in alle if x.endswith('!')) / max(1, len(alle))
        print('%s | %d | %.0f | %.1f | %.1f | %.0f%% | %.0f%% | %.0f%%' % (
            s, len(zeilen), statistics.mean(len(z) for z in zeilen), statistics.mean(wl) if wl else 0,
            len(alle) / len(zeilen), 100 * kurz, 100 * ich, 100 * ruf))


def laenge():
    print('== Blasen ueber 140 Zeichen (W2, ZS2), DE ==')
    for a in ['W2', 'ZS2']:
        for k, d, e in daten[a]:
            if len(d) > 140:
                print(len(d), len(e), k, '|', d)
    print('== NAR-Zeilen (W2, ZS2) mit Laenge ==')
    for a in ['W2', 'ZS2']:
        for k, d, e in daten[a]:
            if sprecher(k) == 'NAR':
                print(len(d), k, '|', d)


def anfang():
    print('== Haeufigste Zeilenanfaenge (erstes Wort) je Gruppe, W2 ==')
    for gruppe in ['MAX', 'PIX']:
        c = collections.Counter()
        for k, d, _ in daten['W2']:
            if sprecher(k) == gruppe:
                w = woerter(d)
                if w:
                    c[w[0]] += 1
        n = sum(c.values())
        print(gruppe, n, [(w, x, '%.0f%%' % (100 * x / n)) for w, x in c.most_common(14)])
    print('== Haeufigste Zeilenenden (letzter Satz, wenn <= 3 Woerter), W2 ==')
    c = collections.Counter()
    for k, d, _ in daten['W2']:
        s = saetze(d)
        if len(s) > 1 and len(woerter(s[-1])) <= 3:
            c[s[-1]] += 1
    print(c.most_common(40))


def en():
    print('== EN: leer, gleich DE, Schluessel statt Text, Laengenverhaeltnis ==')
    for a in ['W2', 'ZS2']:
        for k, d, e in daten[a]:
            if not e.strip():
                print('LEER', k)
            elif e.strip() == d.strip() and len(d) > 12 and not d.isupper():
                print('GLEICH', k, '|', d)
            elif re.search(r'\b(W2|ZS2|UI)_[A-Z0-9_]+', e):
                print('SCHLUESSEL', k, '|', e)
            elif re.search(r'[äöüßÄÖÜ]', e):
                print('UMLAUT', k, '|', e)
            elif len(d) > 30 and (len(e) > 1.35 * len(d) or len(e) < 0.6 * len(d)):
                print('LAENGE %d/%d' % (len(d), len(e)), k, '|', d, '||', e)
            if len(e) > 140:
                print('EN>140 (%d)' % len(e), k)
    ui = [(r[0], r[1], r[2]) for r in rows if r[0].startswith('UI_') and ('W2_' in r[0] or 'ZS2_' in r[0])]
    print('UI-Schluessel mit W2/ZS2:', len(ui))
    for k, d, e in ui:
        if not e.strip() or re.search(r'[äöüßÄÖÜ]', e) or (e == d and len(d) > 8):
            print('UI', k, '|', d, '||', e)
        if len(e) > 60 or len(d) > 60:
            print('UI lang %d/%d' % (len(d), len(e)), k, '|', d, '||', e)


if __name__ == '__main__':
    teil = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith('--') else 'alle'
    ids = '--ids' in sys.argv
    if teil in ('grund', 'alle'):
        grund()
    if teil in ('muster', 'alle'):
        muster(ids)
    if teil in ('sprecher', 'alle'):
        sprecher_tabelle()
    if teil in ('anfang', 'alle'):
        anfang()
    if teil in ('laenge',):
        laenge()
    if teil in ('en',):
        en()
