"""Aggregate per-run lines printed by run_ablation (no sweep) into markdown tables.

Line format: [ k/ n] <scenario> <variant> seed <s> <outcome> clr <c> t <t> inf <i> N <N> mpc <m> ms [err <e>]
Usage: python3 parse_ablation.py <log>...   (runs printed twice are de-duplicated)
Rates are given with Wilson 95% intervals; time / inferences are over runs that reached the goal.
"""
import re, sys, math, statistics as st

PAT = re.compile(r'\]\s+(S\d)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+([-\d.]+)\s+t\s+([\d.]+)'
                 r'\s+inf\s+(\d+)\s+N\s+([\d.]+)\s+mpc\s+([\d.]+)\s+ms(?:\s+err\s+([\d.]+|NaN))?')
ORDER = ['A_FR_FN', 'B_AP_FN', 'C_FR_AN', 'D_AP_AN', 'E_DART', 'F_NODELAY', 'G_FR_LOW', 'Z_ZHUYI']


def wilson(k, n, z=1.96):
    if n == 0:
        return float('nan'), float('nan')
    c = (k + z * z / 2) / (n + z * z)
    h = z * math.sqrt(k * (n - k) / n + z * z / 4) / (n + z * z)
    return max(c - h, 0.0), min(c + h, 1.0)


def rate(k, n):
    lo, hi = wilson(k, n)
    return f'{k}/{n} ({100 * k / n:.0f}%) [{100 * lo:.0f}, {100 * hi:.0f}]'


def ms(x, f='{:.1f}'):
    if not x:
        return '–'
    s = st.stdev(x) if len(x) > 1 else 0.0
    return (f + ' ± ' + f).format(st.mean(x), s)


def load(paths):
    runs = {}
    for p in paths:
        for line in open(p, encoding='utf-8', errors='ignore'):
            m = PAT.search(line)
            if not m:
                continue
            g = m.groups()
            r = dict(s=g[0], v=g[1], seed=int(g[2]), out=g[3], clr=float(g[4]), t=float(g[5]),
                     inf=int(g[6]), N=float(g[7]), mpc=float(g[8]))
            runs[(r['s'], r['v'], r['seed'])] = r
    return list(runs.values())


def main(paths):
    rows = load(paths)
    print(f'{len(rows)} runs from {len(paths)} file(s)\n')
    for s in sorted({r['s'] for r in rows}):
        print(f'### {s}\n')
        print('| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] '
              '| t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |')
        print('|---|---|---|---|---|---|---|---|---|---|---|')
        variants = [v for v in ORDER if any(r['v'] == v and r['s'] == s for r in rows)]
        variants += sorted({r['v'] for r in rows if r['s'] == s} - set(variants))
        for v in variants:
            R = [r for r in rows if r['s'] == s and r['v'] == v]
            n = len(R)
            g = [r for r in R if r['out'] == 'goal']
            c = sum(r['out'] == 'collision' for r in R)
            to = sum(r['out'] == 'timeout' for r in R)
            name = f'**{v}**' if v == 'E_DART' else v
            print(f'| {name} | {rate(len(g), n)} | {rate(c, n)} | {to} | {min(r["clr"] for r in R):.2f} '
                  f'| {ms([r["clr"] for r in R], "{:.2f}")} | {ms([r["t"] for r in g])} '
                  f'| {ms([r["inf"] for r in g], "{:.0f}")} | {st.mean(r["inf"] / r["t"] for r in R):.2f} '
                  f'| {st.mean(r["N"] for r in R):.1f} | {st.mean(r["mpc"] for r in R):.1f} |')
        print()


if __name__ == '__main__':
    main(sys.argv[1:])
