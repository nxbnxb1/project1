"""Compare DART with the best per-condition fixed perception rate ("oracle").

For every (scenario, swept value) the oracle is the LOWEST fixed rate among
the FR_SAFE_<f> variants (same safety layers as DART, fixed f Hz) that had
no failure (collision, stuck, cap or, in old logs, timeout) over all seeds. A fixed rate would have to be
tuned per condition to reach it; DART uses one configuration everywhere.

Usage: python3 parse_oracle.py <sweep logs>...   (sweep line format, see parse_sweep.py)
"""
import sys, statistics as st
from parse_sweep import load, wilson


def main(paths):
    rows = load(paths)
    param = rows[0]['param']
    print(f'{len(rows)} runs; swept parameter: {param}\n')
    print(f'| Scenario | {param} | DART collisions | DART inferences | DART time [s] | oracle fixed rate '
          f'| oracle inferences | oracle time [s] | DART / oracle inferences | fixed rates that failed |')
    print('|---|---|---|---|---|---|---|---|---|---|')
    for s in sorted({r['s'] for r in rows}):
        for val in sorted({r['val'] for r in rows if r['s'] == s}):
            R = [r for r in rows if r['s'] == s and r['val'] == val]
            E = [r for r in R if r['v'] == 'E_DART']
            if not E:
                continue
            kE = sum(r['out'] == 'collision' for r in E)
            gE = [r for r in E if r['out'] == 'goal']
            rates = sorted({int(r['v'].split('_')[-1]) for r in R if r['v'].startswith('FR_SAFE_')})
            oracle, failed = None, []
            for f in rates:
                F = [r for r in R if r['v'] == f'FR_SAFE_{f}']
                bad = sum(r['out'] != 'goal' for r in F)
                if bad == 0 and oracle is None:
                    oracle = (f, F)
                elif bad > 0:
                    k = sum(r['out'] == 'collision' for r in F)
                    failed.append(f'{f} Hz: {k} coll./{bad} fail')
            lo, hi = wilson(kE, len(E))
            eI = st.mean(r['inf'] for r in gE) if gE else float('nan')
            eT = st.mean(r['t'] for r in gE) if gE else float('nan')
            if oracle:
                f, F = oracle
                oI = st.mean(r['inf'] for r in F)
                oT = st.mean(r['t'] for r in F)
                cells = f'{f} Hz | {oI:.0f} | {oT:.1f} | {eI / oI:.2f}'
            else:
                cells = 'none safe | – | – | –'
            print(f'| {s} | {val:g} | {kE}/{len(E)} [{100*lo:.0f},{100*hi:.0f}]% | {eI:.0f} | {eT:.1f} | {cells} '
                  f'| {"; ".join(failed) or "–"} |')


if __name__ == '__main__':
    main(sys.argv[1:])
