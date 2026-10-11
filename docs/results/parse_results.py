"""Result tables of the current benchmark (large obstacles, RPi camera presets, physical limits from
the quadrotor model; rounds 5-6 and later). Usage: python3 parse_results.py '<glob of sweep logs>'
Groups runs by scenario x variant x sweep value; 'camspeed=310' is decoded as camera preset 3,
requested speed 10 m/s. Columns: runs, goal (95 % Wilson CI), collisions, stuck, median time to
goal, median mean speed, median inferences per mission, mean inferences per second, median
minimum clearance. If the logs contain DENS lines (run_ablation), also a table of time share, mean
speed and frames per second by local obstacle density."""
import os, sys, glob, re, collections, statistics as st
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from parse_ablation import wilson
from parse_failures import load, bucket
CAM = {1: 'v2 62x49', 2: 'cm3 66x41', 3: 'cm3w 102x67', 4: 'cm3w 640x360'}
files = sorted(glob.glob(sys.argv[1]))
runs, fails, worlds = load(files)
pat = re.compile(r'\]\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+(-?Inf|[-\d.]+)\s+t\s+([\d.]+)'
                 r'\s+inf\s+(\d+)(?:.*?gap\s+(Inf|[\d.]+))?')
R = {}
for p in files:
    for line in open(p, encoding='utf-8', errors='ignore'):
        m = pat.search(line)
        if m:
            R[(m[3], m[4], m[1], float(m[2]), int(m[5]))] = dict(out=m[6], clr=float(m[7]), t=float(m[8]),
                                                               inf=int(m[9]),
                                                               gap=float(m[10]) if m[10] else float('nan'))
# DENS lines (dart_density_profile): time / distance / frames by objects within 15 m (0, 1-2, 3-5, >=6)
dpat = re.compile(r'^DENS\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+t\s+([\d.\s]+?)\s+d\s+([\d.\s]+?)'
                  r'\s+f\s+([\d\s]+)$')
DN = {}
for p in files:
    for line in open(p, encoding='utf-8', errors='ignore'):
        m = dpat.search(line.strip())
        if m:
            DN[(m[3], m[4], m[1], float(m[2]), int(m[5]))] = tuple(
                [float(x) for x in g.split()] for g in (m[6], m[7], m[8]))


def rate_of(param, val):
    """maximum perception rate of a sweep setting (speedrate = 100 x speed + 10 x rate,
    camspeedrate = 10000 x camera + speedrate), else None"""
    return round(val % 100) / 10 if param in ('speedrate', 'camspeedrate') else None


def cam_of(param, val):
    """camera preset of a sweep setting (default camera = 3)"""
    if param == 'camspeedrate':
        return int(val // 10000)
    if param == 'camspeed':
        return int(val // 100)
    return 3


def label(param, val):
    if param == 'speedrate':
        return f"{int(val // 100)} m/s, {rate_of(param, val):g} Hz"
    if param == 'camspeedrate':
        return f"{CAM.get(cam_of(param, val))} @ {int((val % 10000) // 100)} m/s, {rate_of(param, val):g} Hz"
    if param == 'camspeed':
        return f"{CAM.get(int(val // 100), int(val // 100))} @ {int(val % 100)} m/s"
    return f"{param}={val:g}"


order = ['E_COV', 'FR_SAFE', 'E_DART', 'COV_NOCLUT', 'COVB1', 'FR_SAFE_3', 'FR_SAFE_1']
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

# pooled camera summary: camspeed rows (presets 1, 2, 4) plus the speed rows of the same variants
# (default camera = preset 3), pooled over the requested speeds
camsc = sorted({k[0] for k in R if k[2] == 'camspeed'})
if camsc:
    print('### Camera summary (pooled over requested speeds; preset 3 = the speed rows)\n')
    print('| scenario | variant | camera | n | goal | collision | stuck | inferences per mission (goal), median '
          '| time to goal, median [s] |')
    print('|---|---|---|---|---|---|---|---|---|')
    for sc in camsc:
        vs = sorted({k[1] for k in R if k[0] == sc and k[2] == 'camspeed'}, key=lambda v: order.index(v) if v in order else 99)
        sp = sorted({int(k[3] % 100) for k in R if k[0] == sc and k[2] == 'camspeed'})
        for v in vs:
            for cam in (1, 2, 3, 4):
                if cam == 3:
                    ks = [k for k in R if k[0] == sc and k[1] == v and k[2] == 'speed' and int(k[3]) in sp]
                else:
                    ks = [k for k in R if k[0] == sc and k[1] == v and k[2] == 'camspeed' and int(k[3] // 100) == cam]
                if not ks:
                    continue
                c = collections.Counter(R[k]['out'] for k in ks)
                gk = [k for k in ks if R[k]['out'] == 'goal']
                im = st.median(R[k]['inf'] for k in gk) if gk else float('nan')
                tg = st.median(R[k]['t'] for k in gk) if gk else float('nan')
                print(f"| {sc} | {v} | {CAM[cam]} | {len(ks)} | {c['goal']} | {c['collision']} | {c['stuck']} "
                      f"| {im:.0f} | {tg:.1f} |")
    print()

if DN:
    BINS = ['0', '1-2', '3-5', '>=6']
    print('### Speed and perception rate by local obstacle density (objects within 15 m)\n')
    print('| scenario | variant | setting | ' + ' | '.join(f'{b}: time share, speed [m/s], frames/s' for b in BINS) + ' |')
    print('|---|---|---|' + '---|' * len(BINS))
    for sc in sorted({k[0] for k in DN}):
        V = [v for v in order if any(k[0] == sc and k[1] == v for k in DN)]
        V += sorted({k[1] for k in DN if k[0] == sc} - set(V))
        for v in V:
            for (pa, va) in sorted({(k[2], k[3]) for k in DN if k[0] == sc and k[1] == v}):
                ks = [k for k in DN if k[0] == sc and k[1] == v and k[2] == pa and k[3] == va]
                T = [sum(DN[k][0][b] for k in ks) for b in range(4)]
                Dd = [sum(DN[k][1][b] for k in ks) for b in range(4)]
                F = [sum(DN[k][2][b] for k in ks) for b in range(4)]
                tot = max(sum(T), 1e-9)
                cells = [f"{100 * T[b] / tot:.0f}%, {Dd[b] / T[b]:.1f}, {F[b] / T[b]:.2f}" if T[b] > 0 else '-'
                         for b in range(4)]
                print(f"| {sc} | {v} | {label(pa, va)} | " + ' | '.join(cells) + ' |')
    print()

# rate sweep: pooled over the requested speeds, per scenario x variant x maximum rate
RS = {k for k in R if k[2] in ('speedrate', 'camspeedrate')}
if RS:
    print('### Maximum perception rate (pooled over the requested speeds)\n')
    print('| scenario | variant | f_max [Hz] | n | goal | collision | stuck | inferences per mission (goal), median '
          '| frames / s, mean | time to goal, median [s] | shortest frame interval [s] |')
    print('|---|---|---|---|---|---|---|---|---|---|---|')
    viol = 0
    for sc in sorted({k[0] for k in RS}):
        V = [v for v in order if any(k[0] == sc and k[1] == v for k in RS)]
        V += sorted({k[1] for k in RS if k[0] == sc} - set(V))
        for v, cam in sorted({(k[1], cam_of(k[2], k[3])) for k in RS if k[0] == sc},
                             key=lambda x: (V.index(x[0]), x[1] != 3, x[1])):
            for f in sorted({rate_of(k[2], k[3]) for k in RS if k[0] == sc and k[1] == v and cam_of(k[2], k[3]) == cam}):
                ks = [k for k in RS if k[0] == sc and k[1] == v and cam_of(k[2], k[3]) == cam
                      and rate_of(k[2], k[3]) == f]
                c = collections.Counter(R[k]['out'] for k in ks)
                gk = [k for k in ks if R[k]['out'] == 'goal']
                im = st.median(R[k]['inf'] for k in gk) if gk else float('nan')
                tg = st.median(R[k]['t'] for k in gk) if gk else float('nan')
                fps = st.mean(R[k]['inf'] / max(R[k]['t'], 1e-6) for k in ks)
                gaps = [R[k]['gap'] for k in ks if R[k]['gap'] == R[k]['gap']]
                g = min(gaps) if gaps else float('nan')
                viol += sum(1 for x in gaps if x < 1 / f - 0.011)
                vname = v if cam == 3 else f"{v}, {CAM[cam]}"
                print(f"| {sc} | {vname} | {f:g} | {len(ks)} | {c['goal']} | {c['collision']} | {c['stuck']} | {im:.0f} "
                      f"| {fps:.2f} | {tg:.1f} | {g:.2f} |")
    print(f'\nRuns with two frames closer than 1/f_max (one control step tolerance): {viol}\n')
