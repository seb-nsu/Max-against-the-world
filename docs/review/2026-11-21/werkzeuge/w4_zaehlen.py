# w4_zaehlen.py: zaehlt Bauplaene und Wortticks in den W4_-Zeilen (Review 21.11., Pruefer w4).
# Aufruf aus dem Repo-Stamm: python3 docs/review/2026-11-21/werkzeuge/w4_zaehlen.py ["Muster1|Muster2"]
# Mit Argument werden die Treffer der genannten Muster aufgelistet. Liest nur, schreibt nichts.
import csv,re,sys,collections
rows=[r for r in csv.reader(open('game/lokalisierung/texte.csv',encoding='utf-8')) if r and r[0].startswith('W4_')]
print('W4-Zeilen',len(rows))
def sp(k):
    m=re.match(r'W4_[A-Z0-9]+_([A-Z]+)_',k); return m.group(1) if m else '?'
pats={
 'trotzdem':r'\btrotzdem\b','entweder':r'\b[Ee]ntweder\b','junger Mann':r'junger Mann','Ich sage nichts':r'Ich sage (jetzt |es )?nicht',
 'freiwillig':r'freiwillig','Endlich':r'\bEndlich\b','M8 kein-das ist':r'(ist|sind) kein[a-z]* [^.!?]{1,45}, (das|sondern|hier|da)\b|[Kk]eine? [^.!?,]{1,30}, (das ist|sondern)|nicht [^.!?,]{1,30}, sondern',
 'Superlativ':r'meines Lebens|seines Lebens|die ich je|das ich je|den ich je|[Zz]um ersten Mal|das erste Mal|Niemand (hat|ist) je',
 'Wer-Sentenz':r'(^|[.!?/] )Wer [^.!?]{3,60}, ','Prinzip':r'Prinzip','im Grunde':r'im Grunde','ehrlich':r'ehrlich','beides':r'\b[Bb]eides\b|beidem',
 'nennt das':r'nennt (das|man)|nenne es|nennst du','Natürlich':r'[Nn]atürlich','offenbar':r'offenbar','grundsätzlich':r'grundsätzlich',
 'Denk mal':r'Denk mal dr','Das sagt':r'Das sagt (viel|alles)','Gefühl':r'das Gefühl','Nase':r'Meine Nase','andere Sendung':r'in einer anderen Sendung|IN EINER ANDEREN',
 'Opa würde/nennt':r'Opa (würde|nennt|sagt)','Dein Großvater':r'[Dd]ein(e[mn])? (Großvater|Opa)','Sogar/Selbst':r'(^|[.!?] )(Sogar|Selbst) ','Also':r', also |\. Also[ ,]','und zwar':r'und zwar','Vertrag':r'Vertrag','Riecht nach':r'[Rr]iecht nach|riecht es nach'}
for n,p in pats.items():
    hits=[(r[0][3:],r[1]) for r in rows if re.search(p,r[1])]
    bysp=collections.Counter(sp('W4_'+k) for k,_ in hits)
    print(f'\n== {n}: {len(hits)} {dict(bysp)}')
    if len(sys.argv)>1 and n in sys.argv[1].split('|'):
        for k,t in hits: print('  ',k,'|',t[:150])
# Wörter je Satz
for s in ('MAX','PIX'):
    txt=' '.join(r[1] for r in rows if sp(r[0])==s and '_HINT_' not in r[0])
    saetze=[x for x in re.split(r'[.!?…]+',txt) if x.strip()]
    w=sum(len(x.split()) for x in saetze)
    print(s,'Zeilen',sum(1 for r in rows if sp(r[0])==s),'Wörter/Satz',round(w/len(saetze),1))
# Blasen > 140
lang=[(r[0],max(len(b) for b in r[1].split('//'))) for r in rows]
print('DE-Blasen>140:',sum(1 for r in rows for b in r[1].split('//') if len(b.strip())>140),'EN>140:',sum(1 for r in rows for b in r[2].split('//') if len(b.strip())>140))
print(collections.Counter(sp(r[0]) for r in rows).most_common(40))
