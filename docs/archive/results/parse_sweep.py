"""Aggregate per-run lines printed by run_ablation in sweep mode.

Line format: [ k/ n] <param>=<value> <scenario> <variant> seed <s> <outcome> clr <c> t <t> inf <i> N <N> mpc <m> ms  err <e>
Usage: python3 parse_sweep.py <log>...    -> tables per scenario, rows = variant, columns = sweep value
"""
import re, sys, math, statistics as st
from collections import defaultdict

PAT = re.compile(r'\]\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+([-\d.]+)\s+t\s+([\d.]+)'
                 r'\s+inf\s+(\d+)\s+N\s+([\d.]+)\s+mpc\s+([\d.]+)\s+ms\s+err\s+([\d.]+|NaN)')

def wilson(k, n, z=1.96):
    if n == 0:
        return (float('nan'),) * 2
    c = (k + z * z / 2) / (n + z * z)
    h = z * math.sqrt(k * (n - k) / n + z * z / 4) / (n + z * z)
    return max(c - h, 0), min(c + h, 1)

def load(paths):
    rows = []
    for p in paths:
        for line in open(p, encoding='utf-8', errors='ignore'):
            m = PAT.search(line)
            if m:
                g = m.groups()
                rows.append(dict(param=g[0], val=float(g[1]), s=g[2], v=g[3], seed=int(g[4]), out=g[5],
                                 clr=float(g[6]), t=float(g[7]), inf=int(g[8]), N=float(g[9]),
                                 mpc=float(g[10]), err=float(g[11]) if g[11] != 'NaN' else float('nan')))
    # de-duplicate (same run printed twice if logs overlap)
    uniq = {(r['param'], r['val'], r['s'], r['v'], r['seed']): r for r in rows}
    return list(uniq.values())

def table(rows, metric):
    vals = sorted({r['val'] for r in rows})
    variants = sorted({r['v'] for r in rows}, key=lambda v: (v != 'E_DART', v))
    for s in sorted({r['s'] for r in rows}):
        print(f'\n### {s} — {metric}  ({rows[0]["param"]} = ' + ', '.join(f'{v:g}' for v in vals) + ')')
        print('| variant | ' + ' | '.join(f'{v:g}' for v in vals) + ' |')
        print('|---|' + '---|' * len(vals))
        for var in variants:
            cells = []
            for val in vals:
                R = [r for r in rows if r['s'] == s and r['v'] == var and r['val'] == val]
                n = len(R)
                if n == 0:
                    cells.append('–'); continue
                if metric == 'collision':
                    k = sum(r['out'] == 'collision' for r in R); lo, hi = wilson(k, n)
                    cells.append(f'{k}/{n} [{100*lo:.0f},{100*hi:.0f}]%')
                elif metric == 'failure':
                    k = sum(r['out'] != 'goal' for r in R); lo, hi = wilson(k, n)
                    cells.append(f'{k}/{n}')
                elif metric == 'inf_rate':
                    cells.append(f'{st.mean(r["inf"] / r["t"] for r in R):.2f}')
                elif metric == 'inferences':
                    g = [r['inf'] for r in R if r['out'] == 'goal']
                    cells.append(f'{st.mean(g):.0f}' if g else '–')
                elif metric == 'time':
                    g = [r['t'] for r in R if r['out'] == 'goal']
                    cells.append(f'{st.mean(g):.1f}' if g else '–')
                elif metric == 'clr_min':
                    cells.append(f'{min(r["clr"] for r in R):.2f}')
                elif metric == 'clr_p10':
                    c = sorted(r['clr'] for r in R); cells.append(f'{c[max(0, int(0.1 * len(c)) - 1)]:.2f}')
                elif metric == 'N':
                    cells.append(f'{st.mean(r["N"] for r in R):.1f}')
                elif metric == 'mpc':
                    cells.append(f'{st.mean(r["mpc"] for r in R):.1f}')
                elif metric == 'err':
                    e = [r['err'] for r in R if not math.isnan(r['err'])]
                    cells.append(f'{st.mean(e):.2f}' if e else '–')
            print(f'| {var} | ' + ' | '.join(cells) + ' |')

if __name__ == '__main__':
    rows = load(sys.argv[1:])
    print(f'{len(rows)} runs')
    for m in ['collision', 'failure', 'clr_min', 'inferences', 'inf_rate', 'time', 'N', 'err']:
        table(rows, m)
