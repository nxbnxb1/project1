"""Round-3 tables: per variant x speed, split by world group using the WORLD lines of the logs
(dyn > 0 = world with movers). Usage: python3 parse_r3.py 'raw/r3[abcd]_SR_speed_*.log'"""
import sys, glob, re, collections, statistics as st
sys.path.insert(0, '/home/user/project1/docs/results')
from parse_ablation import wilson
from parse_failures import load, bucket
files = sorted(glob.glob(sys.argv[1]))
runs, fails, worlds = load(files)
mov = {s: float(d['dyn']) > 0 for (sc, s), d in worlds.items()}
R = {}
pat = re.compile(r'\]\s+speed=([\d.]+)\s+SR\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+([-\d.]+)\s+t\s+([\d.]+)\s+inf\s+(\d+)')
for p in files:
    for line in open(p):
        m = pat.search(line)
        if m: R[(m[2], m[1], int(m[3]))] = dict(out=m[4], clr=float(m[5]), t=float(m[6]), inf=int(m[7]))
V = [v for v in ['K50', 'MEM10', 'MEM3', 'MEM0', 'FR_SAFE_3', 'FR_SAFE_10', 'K0', 'K100'] if any(k[0] == v for k in R)]
print(len(R), 'runs;', sum(mov.values()), 'of', len(mov), 'worlds with movers\n')
for grp, sel in [('static-only worlds', False), ('worlds with movers', True)]:
    print(f'### {grp}\n')
    print('| variant | speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s |')
    print('|---|---|---|---|---|---|---|---|---|')
    for v in V:
        for sp in ['2', '4', '6', '8']:
            ks = [k for k in R if k[0] == v and k[1] == sp and mov.get(k[2]) == sel]
            n = len(ks)
            if not n: continue
            c = collections.Counter(R[k]['out'] for k in ks)
            g = c['goal']; lo, hi = wilson(g, n)
            gk = [k for k in ks if R[k]['out'] == 'goal']
            tg = st.median(R[k]['t'] for k in gk) if gk else float('nan')
            im = st.median(R[k]['inf'] for k in gk) if gk else float('nan')
            ips = st.mean(R[k]['inf'] / R[k]['t'] for k in ks)
            print(f"| {v} | {sp} | {n} | {g} ({100*g/n:.0f}% [{100*lo:.0f}, {100*hi:.0f}]) | {c['collision']} | {c['stuck']} | {tg:.1f} | {im:.0f} | {ips:.2f} |")
    print()
    for v in V:
        C = [d for k, d in fails.items() if k[1] == v and d['cls'].startswith('collision') and mov.get(k[3]) == sel]
        if not C: continue
        print(f'{v} collisions ({len(C)}):', '; '.join(f"{a} " + str(dict(collections.Counter(bucket(a, d.get(a, '-')) for d in C))) for a in ['dyn', 'infov', 'shape', 'nupd', 'seen']))
    print()
