"""Round-4 tables (realistic cheap-UAV camera, normal-flight benchmark SN, hard set SH):
per scenario x variant x requested speed. Usage: python3 parse_r4.py 'raw/r4*_speed_*.log'
Columns: runs, goal (95 % Wilson CI), collisions, stuck, median time to goal, median
inferences per mission (successful runs), mean inferences per second, mean flown speed."""
import sys, glob, re, collections, statistics as st
sys.path.insert(0, '/home/user/project1/docs/results')
from parse_ablation import wilson
from parse_failures import load, bucket
files = sorted(glob.glob(sys.argv[1]))
runs, fails, worlds = load(files)
R = {}
pat = re.compile(r'\]\s+speed=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+([-\d.]+)\s+t\s+([\d.]+)\s+inf\s+(\d+)')
for p in files:
    for line in open(p):
        m = pat.search(line)
        if m:
            R[(m[2], m[3], m[1], int(m[4]))] = dict(out=m[5], clr=float(m[6]), t=float(m[7]), inf=int(m[8]))
order = ['E_COV', 'COVB1', 'COVB5', 'FR_SAFE_1', 'FR_SAFE_3', 'E_DART', 'COV_NOCAP']
for sc in sorted({k[0] for k in R}):
    print(f'### {sc}\n')
    print('| variant | requested speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] '
          '| inferences per mission (goal), median | inferences / s | min clearance, median [m] |')
    print('|---|---|---|---|---|---|---|---|---|---|')
    V = [v for v in order if any(k[0] == sc and k[1] == v for k in R)]
    V += sorted({k[1] for k in R if k[0] == sc} - set(V))
    for v in V:
        for sp in sorted({k[2] for k in R if k[0] == sc and k[1] == v}, key=float):
            ks = [k for k in R if k[0] == sc and k[1] == v and k[2] == sp]
            n = len(ks)
            c = collections.Counter(R[k]['out'] for k in ks)
            g = c['goal']; lo, hi = wilson(g, n)
            gk = [k for k in ks if R[k]['out'] == 'goal']
            tg = st.median(R[k]['t'] for k in gk) if gk else float('nan')
            im = st.median(R[k]['inf'] for k in gk) if gk else float('nan')
            ips = st.mean(R[k]['inf'] / R[k]['t'] for k in ks)
            mc = st.median(R[k]['clr'] for k in ks)
            print(f"| {v} | {sp} | {n} | {g} ({100*g/n:.0f}% [{100*lo:.0f}, {100*hi:.0f}]) | {c['collision']} "
                  f"| {c['stuck']} | {tg:.1f} | {im:.0f} | {ips:.2f} | {mc:.2f} |")
    print()
    for v in V:
        C = [d for k, d in fails.items() if k[0].endswith(sc) and k[1] == v and d['cls'].startswith('collision')]
        if not C:
            continue
        print(f'{v} collisions ({len(C)}):', '; '.join(
            f"{a} " + str(dict(collections.Counter(bucket(a, d.get(a, '-')) for d in C)))
            for a in ['cls', 'shape', 'infov', 'mode', 'nupd', 'seen', 'vdes']))
    print()
