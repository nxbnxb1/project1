"""Round-5 tables (large obstacles, RPi camera presets, physical limits from the quadrotor model).
Usage: python3 parse_r5.py '<glob of run_ablation logs>'
Groups runs by scenario x variant x sweep value; 'camspeed=310' is decoded as camera preset 3,
requested speed 10 m/s. Columns: runs, goal (95 % Wilson CI), collisions, stuck, median time to
goal, median mean speed, median inferences per mission, mean inferences per second, median
minimum clearance."""
import sys, glob, re, collections, statistics as st
sys.path.insert(0, '/home/user/project1/docs/results')
from parse_ablation import wilson
from parse_failures import load, bucket
CAM = {1: 'v2 62x49', 2: 'cm3 66x41', 3: 'cm3w 102x67', 4: 'cm3w 640x360'}
files = sorted(glob.glob(sys.argv[1]))
runs, fails, worlds = load(files)
pat = re.compile(r'\]\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+([-\d.]+)\s+t\s+([\d.]+)'
                 r'\s+inf\s+(\d+)')
R = {}
for p in files:
    for line in open(p, encoding='utf-8', errors='ignore'):
        m = pat.search(line)
        if m:
            R[(m[3], m[4], m[1], float(m[2]), int(m[5]))] = dict(out=m[6], clr=float(m[7]), t=float(m[8]),
                                                               inf=int(m[9]))


def label(param, val):
    if param == 'camspeed':
        return f"{CAM.get(int(val // 100), int(val // 100))} @ {int(val % 100)} m/s"
    return f"{param}={val:g}"


order = ['E_COV', 'COVB1', 'COV_NOCLUT', 'FR_SAFE_3', 'FR_SAFE_1', 'E_DART']
for sc in sorted({k[0] for k in R}):
    print(f'### {sc}\n')
    print('| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] '
          '| inferences per mission (goal), median | inferences / s | min clearance, median [m] |')
    print('|---|---|---|---|---|---|---|---|---|---|')
    V = [v for v in order if any(k[0] == sc and k[1] == v for k in R)]
    V += sorted({k[1] for k in R if k[0] == sc} - set(V))
    for v in V:
        for (pa, va) in sorted({(k[2], k[3]) for k in R if k[0] == sc and k[1] == v}, key=lambda x: (x[0], x[1])):
            ks = [k for k in R if k[0] == sc and k[1] == v and k[2] == pa and k[3] == va]
            n = len(ks)
            c = collections.Counter(R[k]['out'] for k in ks)
            g = c['goal']; lo, hi = wilson(g, n)
            gk = [k for k in ks if R[k]['out'] == 'goal']
            tg = st.median(R[k]['t'] for k in gk) if gk else float('nan')
            im = st.median(R[k]['inf'] for k in gk) if gk else float('nan')
            ips = st.mean(R[k]['inf'] / max(R[k]['t'], 1e-6) for k in ks)
            mc = st.median(R[k]['clr'] for k in ks)
            print(f"| {v} | {label(pa, va)} | {n} | {g} ({100*g/n:.0f}% [{100*lo:.0f}, {100*hi:.0f}]) "
                  f"| {c['collision']} | {c['stuck']} | {tg:.1f} | {im:.0f} | {ips:.2f} | {mc:.2f} |")
    print()
    for v in V:
        C = [d for k, d in fails.items() if k[0].endswith(sc) and k[1] == v and d['cls'].startswith('collision')]
        if C:
            print(f'{v} collisions ({len(C)}):', '; '.join(
                f"{a} " + str(dict(collections.Counter(bucket(a, d.get(a, '-')) for d in C)))
                for a in ['cls', 'shape', 'dyn', 'infov', 'mode', 'speed', 'layout']))
    print()
