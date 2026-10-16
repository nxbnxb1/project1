"""Why the remaining collisions happen (docs/results/results.md, Section 4.1).

Usage: python3 docs/results/collision_trace.py [dir]   (default: docs/results/raw/collisions)

Reads, for the static collisions at f_max = 3 Hz with the default camera, the diagnosis of
ci/ci_collision_cases.m (diag_*.json: true contact point, what the vehicle believed) and the memory
trace of ci/ci_collision_trace.m (trace_*.json: every change of the obstacle memory). For each case it
replays the memory and finds the last moment the true contact point stopped being inside a remembered
cylinder (inflated by d_s - r_body = 0.25 m), and which memory event caused it.
"""
import collections
import glob
import json
import os
import sys

import numpy as np

SRC = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), 'raw', 'collisions')
NET = 0.25   # d_s - r_body: the vehicle body may come this close to a remembered cylinder


def cyl_dist(P, c, rho, zl, zh):
    dh = np.hypot(P[0] - c[0], P[1] - c[1]) - rho
    dz = max(zl - P[2], P[2] - zh)
    if dz <= 0:
        return dh if dh > 0 else max(dh, dz)
    return np.hypot(max(dh, 0), dz) if dh > 0 else dz


def covers(st, q):
    """st = [x y z rho zl zh active]"""
    return st[6] > 0.5 and cyl_dist(q, st[0:3], st[3], st[4], st[5]) <= NET


def cause(kind, s0, s1, q):
    if kind == 3:
        return 'loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist)'
    if kind in (2, 4):
        return 'loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss)'
    if s1[4] > q[2] - NET >= s0[4]:
        return 'cập nhật từ quan sát một phần: đáy nâng lên trên độ cao điểm chạm'
    if s1[5] < q[2] + NET <= s0[5]:
        return 'cập nhật từ quan sát một phần: đỉnh hạ xuống dưới độ cao điểm chạm'
    return 'cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển'


def main():
    rows, tally = [], collections.Counter()
    for f in sorted(glob.glob(os.path.join(SRC, 'trace_*.json'))):
        g = json.load(open(f))
        dg = json.load(open(f.replace('trace_', 'diag_')))
        tag = f"{g['variant']} {g['sc']} {g['sp']:g} m/s seed {g['seed']}"
        q = np.array(dg['contact']['q'], float)
        ev = np.atleast_2d(np.array(g['ev'], float))
        det = np.atleast_2d(np.array(g['det'], float)) if len(g['det']) else np.zeros((0, 12))
        state, cov, losses = {}, set(), []
        for t in np.unique(ev[:, 0]):
            before, changed = set(cov), []
            for r in ev[ev[:, 0] == t]:
                slot, kind, s0, s1 = int(r[1]), int(r[2]), r[3:10], r[10:17]
                state[slot] = s1
                if covers(s0, q) and not covers(s1, q):
                    changed.append((kind, s0, s1))
            cov = {s for s, st in state.items() if covers(st, q)}
            if before and not cov:
                losses.append((t, changed))
        if not losses:
            c = 'đưa vào bộ nhớ lần đầu 0.1 s trước va chạm' if cov else 'không có trong bộ nhớ trước va chạm'
            rows.append((tag, c, '-', '-', '-'))
            tally[c] += 1
            continue
        t, changed = losses[-1]
        kind, s0, s1 = changed[0]
        c = cause(kind, s0, s1, q)
        d = ''
        if kind == 1:
            dd = det[det[:, 0] == t]
            if dd.size:
                j = int(np.argmin(np.hypot(dd[:, 2] - s1[0], dd[:, 3] - s1[1])))
                d = f'{dd[j, 11]:.0f} px, rho {dd[j, 5]:.1f} m, cao {dd[j, 6]:.1f}–{dd[j, 7]:.1f} m'
        rows.append((tag, c, f'{g["t_end"] - t:.1f}', 'có' if cov else 'không', d or '-'))
        tally[c] += 1
    print(f'{len(rows)} trường hợp va chạm tái hiện được.\n')
    print('| trường hợp | cơ chế loại điểm chạm khỏi bộ nhớ | thời điểm, trước va chạm [s] | bổ sung lại trước va chạm '
          '| phát hiện gần nhất khi cập nhật |')
    print('|---|---|---|---|---|')
    for r in rows:
        print('| ' + ' | '.join(r) + ' |')
    print('\n| cơ chế | số trường hợp |\n|---|---|')
    for k, v in tally.most_common():
        print(f'| {k} | {v} |')


if __name__ == '__main__':
    main()
