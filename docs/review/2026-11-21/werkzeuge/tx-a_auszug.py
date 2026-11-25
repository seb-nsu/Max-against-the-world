# Review 21.11.2026 (Cloud), Rolle tx-a: Lesefassung der Texte.
# Aufruf: python3 tx-a_auszug.py ZIELORDNER
# Schreibt je Gruppe (Präfix + Raumkürzel) eine Datei "Schlüssel | Sprecher | DE | EN" mit Regie aus den Skripten
# und einer Marke, in welchen früheren Review-Notizen die Zeilen-ID schon vorkommt. Ändert nichts im Repo.
# Grundlage: nd-a_auszug.py (Vorgänger), erweitert um ZS2/ZS3 und die Marken.
import csv, re, sys, os, collections

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', '..'))
ziel = sys.argv[1]
os.makedirs(ziel, exist_ok=True)
BS = chr(92)
rows = list(csv.reader(open(os.path.join(REPO, 'game/lokalisierung/texte.csv'), encoding='utf-8')))
skripte = ['docs/skript/prolog.md', 'docs/skript/welt-1.md', 'docs/skript/zwischenspiele-und-finale.md', 'docs/05-spielsysteme.md']
PRAEFIXE = ('P0', 'W1', 'ZS1', 'ZS2', 'ZS3', 'SYS', 'UI')
info = {}
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
        if not re.match(r'^(P0|W1|ZS1|ZS2|ZS3|SYS|UI)_[A-Z0-9_]+$', kid):
            continue
        sprecher, text = zellen[1], zellen[2]
        regie = zellen[3] if len(zellen) > 3 else ''
        teile = [t.strip() for t in text.split('//')]
        for n, t in enumerate(teile):
            k = kid if n == 0 else f'{kid}_{n+1}'
            info[k] = (sprecher, regie if n == 0 else '(Folgeblase)', abschnitt, t)

# frühere Reviews: in welcher Notiz kommt die ID vor?
frueher = {
    'A': 'docs/review/2026-11-17/notizen/narrative.md',
    'B': 'docs/review/2026-11-17/bericht.md',
    'C': 'docs/review/2026-11-20/notizen/skript-ki-klang.md',
    'D': 'docs/review/2026-11-20/notizen/skript-humanizer.md',
    'E': 'docs/review/2026-11-20/notizen/texte-ki-klang-umgesetzt.md',
    'F': 'docs/review/2026-11-20/notizen/texte-stufe-1.md',
    'G': 'docs/pruefung/review-prolog-welt-1-ergebnis.md',
}
marken = collections.defaultdict(str)
for m, pfad in frueher.items():
    p = os.path.join(REPO, pfad)
    if not os.path.exists(p):
        continue
    t = open(p, encoding='utf-8').read().replace(BS + '_', '_')
    for kid in set(re.findall(r'\b(?:P0|W1|ZS1|ZS2|ZS3|SYS|UI)_[A-Z0-9_]+\b', t)):
        marken[kid] += m

gruppen = collections.OrderedDict()
for nr, r in enumerate(rows[1:], start=2):
    if not r:
        continue
    k = r[0]
    p = k.split('_')
    if p[0] not in PRAEFIXE:
        continue
    g = '_'.join(p[:2])
    gruppen.setdefault(g, []).append((nr, r))
ueb = []
for g, l in gruppen.items():
    with open(os.path.join(ziel, g + '.txt'), 'w', encoding='utf-8') as f:
        letzter = None
        for nr, r in l:
            k, de, en = r[0], r[1], r[2]
            i = info.get(k)
            if i and i[2] != letzter:
                f.write(f'\n=== {i[2]} ===\n')
                letzter = i[2]
            sp = i[0] if i else '?'
            rg = f' <{i[1][:110]}>' if i and i[1] and i[1] != '(Folgeblase)' else ''
            mk = f' [{marken[k]}]' if marken.get(k) else ''
            f.write(f'{k} | {sp}{rg}{mk}\n  {de}\n  {en}\n')
    ueb.append((g, len(l)))
with open(os.path.join(ziel, '_uebersicht.txt'), 'w', encoding='utf-8') as f:
    for g, n in ueb:
        f.write(f'{g}\t{n}\n')
print('Gruppen', len(gruppen), 'Skript-IDs', len(info), 'Zeilen', sum(n for g, n in ueb))
