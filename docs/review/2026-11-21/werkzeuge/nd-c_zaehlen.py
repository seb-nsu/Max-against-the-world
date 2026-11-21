# -*- coding: utf-8 -*-
"""nd-c: Zählt Schablonen und Wiederholungen in den deutschen (oder englischen) Zeilen
eines Abschnitts von texte.csv. Aufruf: nd-c_zaehlen.py CSV [Präfixe] [de|en] [liste=MUSTERNAME]
Nur lesen. Ergebnis sind Verdachtsstellen, kein Urteil."""
import csv, sys, io, re, statistics
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
pfad = sys.argv[1]
pre = tuple((sys.argv[2] if len(sys.argv) > 2 else "W3_,ZS3_").split(","))
sp = 2 if (len(sys.argv) > 3 and sys.argv[3] == "en") else 1
liste = None
for a in sys.argv[4:]:
    if a.startswith("liste="): liste = a[6:]
zeilen = []
with open(pfad, encoding="utf-8", newline="") as f:
    r = csv.reader(f); next(r)
    for z in r:
        if z and z[0].startswith(pre): zeilen.append((z[0], z[sp] if len(z) > sp else ""))
MUSTER_DE = {
 "ich_sag_nichts": r"\bIch sage? nichts\b|\bIch sag'? nichts\b|sage ich (auch )?nichts",
 "entweder_oder": r"\b[Ee]ntweder\b",
 "kein_X_das_ist_Y (M8)": r"(Das|Dies) (ist|war|sind) (kein|keine|nicht)[^.!?]*[.!?] (Das|Es) (ist|war|sind)\b|\b[A-ZÄÖÜ]\w+ (ist|sind) kein[e]? \w+\. \w+ (ist|sind) ",
 "nicht_X_sondern_Y (M8)": r"\bnicht\b[^.!?]{0,60}\bsondern\b|\bkein[e]?\b[^.!?]{0,60}\bsondern\b",
 "nachgestellt_nicht_Y (M8)": r", nicht [^.!?,]{1,30}[.!?]$|\. Nicht [^.!?]{1,40}[.!?]",
 "abgehackte_Verneinung (M8)": r"(^|[.!?] )(Kein|Keine|Keiner|Nichts|Niemand|Nie)\b[^.!?]{0,25}[.!?]",
 "und_zwar": r"\bund zwar\b|\bUnd zwar\b",
 "pixel_einschub": r"falls es dir entgangen|falls dich das interessiert|wenn ich das so|wenn man es genau nimmt|[Gg]enau genommen|[Mm]it Verlaub|bei allem Respekt|das darf man ruhig|gewissermaßen|dem \w+ nach zu urteilen|falls jemand fragt|wie Sie sicher|wie sich zeigt",
 "catch_zu_deinem_besten": r"[Zz]u deinem Besten|[Zz]u meinem Besten",
 "catch_zu_ihrem_schutz": r"[Zz]u Ihrem Schutz|[Zz]u seinem Schutz",
 "catch_meintest_du": r"Meintest du",
 "closer_zweimal_dreimal": r"[.,] (Zweimal|Dreimal|Viermal|Einmal)( nicht| sogar)?[.!]",
 "natuerlich": r"\b[Nn]atürlich\b",
 "typisch": r"\bTypisch\b|\btypisch\b",
 "die_zukunft_hat": r"Die Zukunft (hat|ist|riecht)|[Dd]as ist die Zukunft",
 "sollten_nicht": r"sollten? nicht \w+\.",
 "jemand_irgendwer": r"\b(Jemand|Irgendwer|Irgendjemand) (hat|war|will|ruft|muss)\b",
 "endlich": r"\bEndlich\b",
 "aus_prinzip": r"[Aa]us Prinzip|hat Prinzipien|Ich habe (Grundsätze|Regeln)|hat Prioritäten|hat ein System",
 "als_haette (Vergleich)": r"\bals (hätte|wäre|wär|würde|wüsste|könnte|dürfte|ginge|ob)\b",
 "sieht_aus_wie": r"sieht (\w+ )?aus wie|siehst? aus wie|wie ein[e]?[rnm]? \w+, (der|die|das)\b",
 "trotzdem": r"\b[Tt]rotzdem\b",
 "thunfisch": r"Thunfisch",
 "nass": r"\b[Nn]ass(e[rnms]?)?\b|Nasssein",
 "strickjacke": r"Strickjacke",
 "hausschuh": r"Hausschuh",
 "siebenundvierzig": r"[Ss]iebenundvierzig|\b47\b",
 "neunzehn_jahre": r"neunzehn Jahre",
 "bursche": r"\bBursche\b",
 "kalle_also": r"\balso,|, also\b|[Aa]lso:",
 "fueller_okay_moment": r"\bOkay\b|\bMoment\b",
 "fueller_weich": r"\bNun ja\b|\bTatsächlich\b|\btatsächlich\b|\bLass uns\b|\bna ja\b|\bNa ja\b|\beigentlich\b|\bEhrlich gesagt\b|\bquasi\b|\birgendwie\b",
 "offenbar_wohl_bestimmt": r"\boffenbar\b|\bwahrscheinlich\b|\bbestimmt\b|\bvermutlich\b",
 "im_fernsehen": r"Im Fernsehen",
 "ich_mag_ihn": r"Ich mag (ihn|diesen|sie)",
 "ich_habe_es_gesehen": r"Ich hab[e]? es gesehen",
 "mitgezaehlt": r"mitgezählt|zähle mit",
 "das_kenn_ich": r"[Dd]as kenn[e]? ich|Ich kenne das",
 "einwort_schluss": r"[.!?] (Respekt|Talent|Fair|Klar|Endlich|Ups|Nö|Ehrlich|Praktisch|Schade)[.!]$",
 "gedankenstrich (M16)": r" [–—] | - ",
 "semikolon (M16)": r";",
 "doppelpunkt": r": ",
 "auslassung": r"…",
 "trikolon_komma": r"\b\w+, \w+ und \w+\b",
 "trikolon_punkt": r"(^|[.!?] )[A-ZÄÖÜ]\w*[.] [A-ZÄÖÜ]\w*[.] [A-ZÄÖÜ]\w*[.]",
 "ich_dachte_wette": r"[Ii]ch wette|wetten\?",
 "wer_das_gebaut": r"Wer (das|die|hier|so was|immer)[^.]{0,30}(gebaut|baut|arbeitet)",
 "das_ist_das_Xste": r"Das ist (das|der|die) \w+ste\b",
}
MUSTER_EN = {
 "i_say_nothing": r"\bI('m| am) saying nothing|I say nothing|I shall say nothing|I will say nothing|I'm not saying",
 "either_or": r"\b[Ee]ither\b",
 "not_X_its_Y": r"(That|This|It)('s| is) not? [^.!?]*[.!?] (That|It)('s| is)\b",
 "as_if": r"\bas if\b|\bas though\b|\blike (it|he|she|someone|somebody)('s| has| had| was| were)\b",
 "for_your_own_good": r"[Ff]or your own good",
 "for_your_protection": r"[Ff]or your (own )?protection|[Ff]or your safety",
 "did_you_mean": r"Did you mean",
 "of_course": r"\b[Oo]f course\b",
 "shall": r"\bshall\b",
 "indeed_rather_quite": r"\bindeed\b|\brather\b|\bquite\b|\bfurthermore\b|\bmoreover\b|\bhowever\b",
 "no_contraction": r"\b(do not|does not|did not|is not|are not|was not|cannot|will not|would not|I am|I have|I will|it is|that is|you are|he is|she is|they are|we are)\b",
 "contraction": r"\b\w+('s|'m|'re|'ve|'ll|'d|n't)\b",
 "lad": r"\blad\b",
 "tuna": r"[Tt]una",
 "wet": r"\bwet\b",
}
M = MUSTER_EN if sp == 2 else MUSTER_DE
def sprecher(k):
    t = k.split("_")
    return t[2] if len(t) > 2 else "?"
if liste:
    rx = re.compile(M[liste])
    for k, t in zeilen:
        if rx.search(t): print(f"{k} | {t}")
    sys.exit()
print(f"Zeilen: {len(zeilen)}; Zeichen: {sum(len(t) for _, t in zeilen)}; Mittel {statistics.mean(len(t) for _, t in zeilen):.1f}; Median {statistics.median(len(t) for _, t in zeilen)}")
for n in (100, 120, 140, 160):
    print(f"  länger als {n} Zeichen: {sum(1 for _, t in zeilen if len(t) > n)}")
print("Muster | Zeilen mit Treffer | davon je Sprecher")
for name, rx in M.items():
    rx = re.compile(rx)
    tr = [(k, t) for k, t in zeilen if rx.search(t)]
    je = {}
    for k, _ in tr: je[sprecher(k)] = je.get(sprecher(k), 0) + 1
    print(f"{name} | {len(tr)} | " + ", ".join(f"{s} {n}" for s, n in sorted(je.items(), key=lambda x: -x[1])))
je = {}
for k, t in zeilen:
    s = sprecher(k); je.setdefault(s, []).append(len(t))
print("Sprecher | Zeilen | Zeichen | Mittel")
for s, l in sorted(je.items(), key=lambda x: -len(x[1])):
    print(f"{s} | {len(l)} | {sum(l)} | {statistics.mean(l):.0f}")
