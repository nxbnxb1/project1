"""LEGACY parser for logs up to commit cc7650d (S1-S3, variants A-G, 40 s limit -> timeout).
Current logs: use parse_ablation.py / parse_sweep.py / parse_failures.py."""
import re, sys, statistics as st
rows=[]
pat=re.compile(r'\]\s+(S\d)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+([-\d.]+)\s+t\s+([\d.]+)\s+inf\s+(\d+)\s+N\s+([\d.]+)\s+mpc\s+([\d.]+)')
for line in open(sys.argv[1]):
    m=pat.search(line)
    if m:
        s,v,seed,out,clr,t,inf,N,mpc=m.groups()
        rows.append(dict(s=s,v=v,seed=int(seed),out=out,clr=float(clr),t=float(t),inf=int(inf),N=float(N),mpc=float(mpc)))
print(len(rows),'runs')
def ms(x): 
    return (st.mean(x), st.stdev(x) if len(x)>1 else 0) if x else (float('nan'),0)
for s in ['S1','S2','S3']:
    print(f'\n== {s} ==')
    print(f'{"variant":10s} {"succ":>5s} {"coll":>5s} {"tout":>5s} {"clr_min":>8s} {"clr_mean":>13s} {"t(goal)":>13s} {"inf/run(goal)":>14s} {"inf/s":>6s} {"N":>5s} {"mpc ms":>7s}')
    for v in ['A_FR_FN','B_AP_FN','C_FR_AN','D_AP_AN','E_DART','F_NODELAY','G_FR_LOW']:
        R=[r for r in rows if r['s']==s and r['v']==v]
        if not R: continue
        n=len(R); g=[r for r in R if r['out']=='goal']; c=[r for r in R if r['out']=='collision']; to=[r for r in R if r['out']=='timeout']
        cm=ms([r['clr'] for r in R]); tg=ms([r['t'] for r in g]); ig=ms([r['inf'] for r in g])
        rate=st.mean([r['inf']/r['t'] for r in R])
        print(f'{v:10s} {100*len(g)/n:4.0f}% {100*len(c)/n:4.0f}% {100*len(to)/n:4.0f}% {min(r["clr"] for r in R):8.2f} {cm[0]:6.2f}±{cm[1]:4.2f} {tg[0]:6.1f}±{tg[1]:4.1f} {ig[0]:7.0f}±{ig[1]:4.0f} {rate:6.2f} {st.mean([r["N"] for r in R]):5.1f} {st.mean([r["mpc"] for r in R]):7.1f}')
