"""Figure of one collision: how the obstacle memory lost the part that was hit.

Usage: python3 docs/figures/plot_collision.py <case_*.json> <diag_*.json> <out.png>
(files from ci/ci_collision_cases.m, e.g. docs/results/raw/collisions). Top views at the flight
altitude just before and after the contact point left the memory and at the impact, vertical
sections through the contact point, and the distances over time.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import plot_stuck as ps  # noqa: E402
import matplotlib.pyplot as plt  # noqa: E402
import numpy as np  # noqa: E402
from matplotlib.patches import Rectangle  # noqa: E402


def cyl_dist(P, c, rho, zl, zh):
    dh = np.hypot(P[0] - c[0], P[1] - c[1]) - rho
    dz = max(zl - P[2], P[2] - zh)
    if dz <= 0:
        return dh if dh > 0 else max(dh, dz)
    return np.hypot(max(dh, 0), dz) if dh > 0 else dz


def dq_of(s, q):
    return min([cyl_dist(q, s['c'][:, k], s['rho'][k], s['zl'][k], s['zh'][k]) for k in range(s['rho'].size)],
               default=np.inf)


def side_view(ax, d, s, q, title):
    """vertical section through the contact point, along the horizontal direction vehicle -> contact point"""
    p = s['p']
    u = q[:2] - p[:2]
    u = u / max(np.linalg.norm(u), 1e-9)
    w = d['world']
    xs = np.linspace(-4, 10, 281)
    zs = np.linspace(0, 9, 181)
    X, Z = np.meshgrid(xs, zs)
    occ = np.zeros_like(X, dtype=bool)
    for i in range(w['type'].size):
        c, typ, dim = w['c0'][:, i], int(w['type'][i]), w['dim'][:, i]
        Px = p[0] + X * u[0] - c[0]
        Py = p[1] + X * u[1] - c[1]
        Pz = Z - c[2]
        if typ == 1:
            occ |= Px ** 2 + Py ** 2 + Pz ** 2 <= dim[0] ** 2
        elif typ == 2:
            cy, sy = np.cos(w['yaw'][i]), np.sin(w['yaw'][i])
            lx, ly = cy * Px + sy * Py, -sy * Px + cy * Py
            occ |= (abs(lx) <= dim[0]) & (abs(ly) <= dim[1]) & (abs(Pz) <= dim[2])
        else:
            occ |= (Px ** 2 + Py ** 2 <= dim[0] ** 2) & (abs(Pz) <= dim[1])
    ax.contourf(X, Z, occ.astype(float), levels=[0.5, 1.5], colors=[ps.OBST])
    for k in range(s['rho'].size):              # remembered cylinders cut by the same vertical plane
        c, rho = s['c'][:, k], s['rho'][k]
        a = (c[0] - p[0]) * u[0] + (c[1] - p[1]) * u[1]
        b = abs(-(c[0] - p[0]) * u[1] + (c[1] - p[1]) * u[0])
        if b >= rho:
            continue
        h = np.sqrt(rho ** 2 - b ** 2)
        zl, zh = max(s['zl'][k], -1), min(s['zh'][k], 12)
        ax.add_patch(Rectangle((a - h, zl), 2 * h, zh - zl, fc='none', ec=ps.BLUE, lw=1.2, zorder=4))
    ax.plot(0, p[2], 'o', ms=7, color=ps.BLUE, mec='white', zorder=6)
    qa = (q[0] - p[0]) * u[0] + (q[1] - p[1]) * u[1]
    ax.plot(qa, q[2], 'x', color=ps.RED, ms=9, mew=2, zorder=7)
    ax.set_xlim(-4, 10); ax.set_ylim(0, 9); ax.set_aspect('equal')
    ax.set_xlabel('theo hướng UAV → điểm chạm [m]'); ax.set_ylabel('độ cao [m]')
    ax.grid(color=ps.GRID, lw=0.5)
    ax.set_title(title, loc='left')


def main(cf, gf, out):
    d = ps.load(cf)
    g = json.load(open(gf))
    q = np.array(g['contact']['q'], float)
    S = d['snaps']
    dq = np.array([dq_of(s, q) for s in S])
    T = np.array([s['t'] for s in S])
    cov = dq <= 0.25
    t_end = d['log']['t'][-1]
    i_last = np.where(cov[:-1])[0][-1] if cov[:-1].any() else len(S) - 2
    sA, sB, sC = S[i_last], S[i_last + 1], S[-1]
    box = (q[0] - 12, q[0] + 12, q[1] - 9, q[1] + 9)
    fig = plt.figure(figsize=(15, 9))
    for j, (s, ttl) in enumerate([(sA, 'trước: điểm chạm còn trong bộ nhớ'), (sB, 'sau một lần chụp: mất'),
                                  (sC, 'lúc va chạm')]):
        ax = fig.add_subplot(2, 3, j + 1)
        ps.top_view(ax, d, None, s, box, f'{ttl} (t = {s["t"]:.1f} s)', d['cam'])
        ax.plot(q[0], q[1], 'x', color=ps.RED, ms=10, mew=2.2, zorder=10)
    side_view(fig.add_subplot(2, 3, 4), d, sA, q, f'cắt đứng, t = {sA["t"]:.1f} s (trước)')
    side_view(fig.add_subplot(2, 3, 5), d, sB, q, f'cắt đứng, t = {sB["t"]:.1f} s (sau)')
    ax = fig.add_subplot(2, 3, 6)
    k = T >= t_end - 8
    ax.plot(T[k], np.clip(dq[k], -3, 6), color=ps.BLUE, lw=1.6, label='điểm chạm → hình trụ gần nhất trong bộ nhớ')
    st = g['steps']
    rows = np.array(g['rows'], float)
    ax.plot(rows[:, 0], np.clip(rows[:, 1], -3, 6), color=ps.INK, lw=1.2, label='UAV → vật thật (khoảng cách thật)')
    ax.plot(rows[:, 0], np.clip(rows[:, 2], -3, 6), color=ps.ORANGE, lw=1.2, label='UAV → bộ nhớ (UAV tưởng)')
    ax.axhline(0.25, color=ps.MUTED, lw=0.8, ls='--')
    for tt in d['trig_t'][d['trig_t'] >= t_end - 8]:
        ax.axvline(tt, color=ps.YELLOW, lw=0.6)
    ax.set_xlim(t_end - 8, t_end + 0.2); ax.set_ylim(-3, 6)
    ax.set_xlabel('t [s] (vạch vàng: lần chụp)'); ax.set_ylabel('[m]')
    ax.legend(fontsize=7, loc='upper left'); ax.grid(color=ps.GRID, lw=0.5)
    ax.set_title('khoảng cách theo thời gian', loc='left')
    fig.suptitle(f"{g['variant']} {g['sc']} seed {g['seed']}, {g['sp']} m/s, trần 3 Hz: va chạm lúc {t_end:.1f} s "
                 f"(vật: {['cầu', 'hộp', 'trụ'][g['prim']['type'] - 1]})", x=0.01, ha='left', fontweight='bold')
    fig.tight_layout()
    fig.savefig(out, dpi=105)
    print(out)


if __name__ == '__main__':
    main(*sys.argv[1:4])
