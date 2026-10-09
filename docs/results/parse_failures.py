"""Global failure analysis: aggregate FAILINFO / WORLD lines of run_ablation logs.

FAILINFO [<sweep>=<v> ]<scenario> <variant> seed <s> cls <c> shape <sh> dyn <d> tracked <t>
         infov <f> mode <m> speed <v> closing <c> static <s> prog10 <p> layout <l> vdes <v>
WORLD <scenario> seed <s> layout <l> nleg <n> dyn <f> nobj <n>      (random worlds 'SR')
Run lines ([k/n] ...) give the number of runs, so the tables show failure RATES with
Wilson 95% intervals, by cause and by stratum (swept value, layout, movers).
Usage: python3 parse_failures.py <logs>...
"""
import re, sys, collections
from parse_ablation import wilson

RUN = re.compile(r'\]\s+(?:(\w+)=([\d.]+)\s+)?(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)')
FAIL = re.compile(r'FAILINFO\s+(?:(\w+)=([\d.]+)\s+)?(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(.*)$')
WORLD = re.compile(r'WORLD\s+(S\w+)\s+seed\s+(\d+)\s+(.*)$')


def kv(s):
    t = s.split()
    return dict(zip(t[0::2], t[1::2]))


def load(paths):
    runs, fails, worlds = {}, {}, {}
    for p in paths:
        for line in open(p, encoding='utf-8', errors='ignore'):
            if 'FAILINFO' in line:
                m = FAIL.search(line)
                fails[(m[3], m[4], m[2] or '-', int(m[5]))] = kv(m[6])
            elif 'WORLD' in line:
                m = WORLD.search(line)
                worlds[(m[1], int(m[2]))] = kv(m[3])
            else:
                m = RUN.search(line)
                if m:
                    runs[(m[3], m[4], m[2] or '-', int(m[5]))] = m[6]
    return runs, fails, worlds


def rate(k, n):
    lo, hi = wilson(k, n)
    return f'{k}/{n} ({100 * k / max(n, 1):.1f}%) [{100 * lo:.1f}, {100 * hi:.1f}]'


def table(title, keys, F, key_fn):
    tot, bad = collections.Counter(), collections.Counter()
    for k in keys:
        tot[key_fn(k)] += 1
        if k in F:
            bad[key_fn(k)] += 1
    print(f'| {title} | runs failed [95% CI] |\n|---|---|')
    for v in sorted(tot, key=str):
        print(f'| {v} | {rate(bad[v], tot[v])} |')
    print()


def main(paths):
    runs, fails, worlds = load(paths)
    print(f'{len(runs)} runs, {sum(o != "goal" for o in runs.values())} failures\n')
    for sc, va in sorted({(k[0], k[1]) for k in runs}):
        keys = [k for k in runs if k[0] == sc and k[1] == va]
        F = {k: fails[k] for k in keys if k in fails}
        print(f'### {sc} {va}: {len(keys)} runs\n')
        c = collections.Counter(d['cls'] for d in F.values())
        print('| cause | rate [95% CI] |\n|---|---|')
        for cls in sorted(c):
            print(f'| {cls} | {rate(c[cls], len(keys))} |')
        print()
        table('swept value', keys, F, lambda k: k[2])
        if any((k[0], k[3]) in worlds for k in keys):
            table('layout', keys, F, lambda k: worlds.get((k[0], k[3]), {}).get('layout', '?'))
            table('movers', keys, F, lambda k: 'yes' if float(worlds.get((k[0], k[3]), {}).get('dyn', 0)) > 0 else 'no')
        for grp in ['collision', 'stuck', 'timeout']:
            G = [d for d in F.values() if d['cls'].startswith(grp)]
            if not G:
                continue
            print(f'| {grp}s by | count |\n|---|---|')
            for attr in ['cls', 'shape', 'dyn', 'tracked', 'infov', 'mode', 'static']:
                cc = collections.Counter(d[attr] for d in G)
                print(f'| {attr} | ' + ', '.join(f'{a}: {b}' for a, b in sorted(cc.items())) + ' |')
            print()


if __name__ == '__main__':
    main(sys.argv[1:])
