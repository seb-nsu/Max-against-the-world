# Review 21.11.2026, Rolle nd-a: Lesefassung der Texte (CSV + Sprecher/Regie aus den Skripten).
# Aufruf: py -3 nd-a_auszug.py ZIELORDNER   (schreibt je Gruppe eine Textdatei; aendert nichts im Repo)
import csv, re, sys, os, collections

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', '..'))
ziel = sys.argv[1]
os.makedirs(ziel, exist_ok=True)
BS = chr(92)
rows = list(csv.reader(open(os.path.join(REPO, 'game/lokalisierung/texte.csv'), encoding='utf-8')))
skripte = ['docs/skript/prolog.md', 'docs/skript/welt-1.md', 'docs/skript/zwischenspiele-und-finale.md', 'docs/05-spielsysteme.md']
info = {}  # id -> (sprecher, regie, abschnitt, text)
for s in skripte:
    abschnitt = ''
    for z in open(os.path.join(REPO, s), encoding='utf-8'):
        z = z.rstrip('\n')
        if z.startswith('#'):
            abschnitt = z.lstrip('# ').strip()
            continue
        if not z.startswith('|'):
            continue
        zellen = [c.strip() for c in re.split(r'(?<!' + BS + BS + r')\|', z)[1:-1]]
        if len(zellen) < 3:
            continue
        kid = zellen[0].replace(BS + '_', '_').replace('`', '')
        if not re.match(r'^(P0|W1|ZS1|SYS|UI)_[A-Z0-9_]+$', kid):
            continue
        sprecher = zellen[1]
        text = zellen[2]
        regie = zellen[3] if len(zellen) > 3 else ''
        teile = [t.strip() for t in text.split('//')]
        for n, t in enumerate(teile):
            k = kid if n == 0 else f'{kid}_{n+1}'
            info[k] = (sprecher, regie if n == 0 else '(Folgeblase)', abschnitt, t)


def norm(s):
    return re.sub(r'\s+', ' ', s.replace(BS, '')).strip()


gruppen = collections.OrderedDict()
for nr, r in enumerate(rows[1:], start=2):
    if not r:
        continue
    k = r[0]
    p = k.split('_')
    if p[0] in ('P0', 'SYS', 'W1', 'ZS1'):
        g = '_'.join(p[:2])
    elif p[0] == 'UI':
        g = 'UI'
    else:
        continue
    gruppen.setdefault(g, []).append((nr, r))
abw = []
for g, l in gruppen.items():
    with open(os.path.join(ziel, g + '.txt'), 'w', encoding='utf-8') as f:
        letzter = None
        for nr, r in l:
            k, de, en = r[0], r[1], r[2]
            i = info.get(k)
            if i and i[2] != letzter:
                f.write(f'\n=== {i[2]} ===\n')
                letzter = i[2]
            kopf = k
            if i:
                kopf += f'  [{i[0]}]' + (f'  <{i[1]}>' if i[1] else '')
                if norm(i[3]) != norm(de):
                    abw.append((k, i[3], de))
            elif g != 'UI':
                kopf += '  [nicht im Skript gefunden]'
            f.write(f'{kopf}\n  DE({len(de)}): {de}\n  EN({len(en)}): {en}\n')
with open(os.path.join(ziel, '_abweichungen_skript_csv.txt'), 'w', encoding='utf-8') as f:
    for k, a, b in abw:
        f.write(f'{k}\n  Skript: {a}\n  CSV:    {b}\n')
print('Gruppen', len(gruppen), 'Abweichungen Skript/CSV', len(abw), 'Skript-IDs', len(info))
