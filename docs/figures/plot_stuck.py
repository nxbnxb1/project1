"""Figures of single runs, made to see why a run gets stuck.

Usage: python3 docs/figures/plot_stuck.py <dir with case_*.json> <out dir>
The JSON files come from ci/ci_stuck_cases.m (Debug case workflow, input 'cases'): for every case
(scenario, requested speed, seed) one file per variant, e.g. E_COV and FR_SAFE_3 on the same world.
One PNG per case: two top views around the place where E_COV stops (when the stall starts and at
the end), the speed with every perception frame, and the progress along the set path of both variants.
"""
import glob
import json
import math
import os
import re
import sys

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt  # noqa: E402
import numpy as np  # noqa: E402
from matplotlib.patches import Circle, Polygon, Wedge  # noqa: E402

# reference palette (dataviz skill), light mode
BLUE, ORANGE, AQUA, YELLOW, MAGENTA, GREEN, VIOLET, RED = (
    '#2a78d6', '#eb6834', '#1baf7a', '#eda100', '#e87ba4', '#008300', '#4a3aa7', '#e34948')
INK, INK2, MUTED, GRID = '#0b0b0b', '#52514e', '#8a8984', '#e4e3df'
OBST, OBST_EDGE, OBST_OFF = '#cfcdc6', '#8a8984', '#efeee9'
plt.rcParams.update({'font.size': 9, 'axes.edgecolor': MUTED, 'axes.labelcolor': INK2,
                     'xtick.color': INK2, 'ytick.color': INK2, 'axes.titlesize': 10,
                     'axes.titleweight': 'bold', 'axes.titlecolor': INK, 'figure.facecolor': 'white'})


def arr(x, rows=None):
    """JSON (jsonencode) matrix -> float array; vectors come flat, NaN as null."""
    if x is None:
        return np.full((rows, 0) if rows else (0,), np.nan)
    if not isinstance(x, list):
        x = [x]
    a = np.array(x, dtype=object)
    a = np.where(a == None, np.nan, a).astype(float)  # noqa: E711
    if rows is not None:
        if a.size == 0:
            return np.zeros((rows, 0))
        if a.ndim == 1:
            a = a.reshape(rows, -1) if a.size % rows == 0 and a.size != rows else a.reshape(rows, 1)
    return a


def load(path):
    d = json.load(open(path))
    sn = d['snaps']
    d['snaps'] = sn if isinstance(sn, list) else [sn]
    for s in d['snaps']:
        s['p'] = arr(s['p']).ravel()
        s['c'] = arr(s['c'], 3)
        s['rho'] = arr(s['rho']).ravel()
        s['infl'] = arr(s['infl']).ravel()
        s['W'] = arr(s['W'], 3)
        s['Pm'] = arr(s['Pm'], 3)
        s['q_r'] = arr(s['q_r']).ravel()
    w = d['world']
    for k in ('c0', 'v', 'dim'):
        w[k] = arr(w[k], 3)
    for k in ('type', 'yaw', 'obj'):
        w[k] = arr(w[k]).ravel()
    w['path'] = arr(w['path'], 3)
    lg = d['log']
    lg['p'] = arr(lg['p'], 3)
    for k in ('t', 'speed', 'psi', 's_prog', 'clear'):
        lg[k] = arr(lg[k]).ravel()
    d['trig_t'] = arr(d['trig_t']).ravel()
    return d


def section(w, i, z, t):
    """Horizontal cross-section of primitive i at altitude z: ('circle', c, r) / ('poly', P) / None."""
    c = w['c0'][:, i] + w['v'][:, i] * t
    typ, dim = int(w['type'][i]), w['dim'][:, i]
    if typ == 1:                                   # sphere
        h = z - c[2]
        return ('circle', c[:2], math.sqrt(dim[0] ** 2 - h ** 2)) if abs(h) < dim[0] else None
    if typ == 2:                                   # box, yaw about z
        if abs(z - c[2]) > dim[2]:
            return None
        cy, sy = math.cos(w['yaw'][i]), math.sin(w['yaw'][i])
        Q = np.array([[cy, -sy], [sy, cy]]) @ np.array([[dim[0], -dim[0], -dim[0], dim[0]],
                                                         [dim[1], dim[1], -dim[1], -dim[1]]])
        return ('poly', (Q.T + c[:2]))
    if abs(z - c[2]) > dim[1]:                     # vertical cylinder
        return None
    return ('circle', c[:2], dim[0])


def footprint(w, i, t):
    c = w['c0'][:, i] + w['v'][:, i] * t
    typ, dim = int(w['type'][i]), w['dim'][:, i]
    if typ == 2:
        cy, sy = math.cos(w['yaw'][i]), math.sin(w['yaw'][i])
        Q = np.array([[cy, -sy], [sy, cy]]) @ np.array([[dim[0], -dim[0], -dim[0], dim[0]],
                                                         [dim[1], dim[1], -dim[1], -dim[1]]])
        return ('poly', Q.T + c[:2])
    return ('circle', c[:2], dim[0])


def draw_world(ax, w, z, t):
    for i in range(w['type'].size):
        f = footprint(w, i, t)                     # whole footprint, faint (not at flight altitude)
        if f[0] == 'circle':
            ax.add_patch(Circle(f[1], f[2], fc=OBST_OFF, ec='none', zorder=1))
        else:
            ax.add_patch(Polygon(f[1], closed=True, fc=OBST_OFF, ec='none', zorder=1))
    for i in range(w['type'].size):
        s = section(w, i, z, t)                    # cross-section at the flight altitude
        if s is None:
            continue
        if s[0] == 'circle':
            ax.add_patch(Circle(s[1], s[2], fc=OBST, ec=OBST_EDGE, lw=0.6, zorder=2))
        else:
            ax.add_patch(Polygon(s[1], closed=True, fc=OBST, ec=OBST_EDGE, lw=0.6, zorder=2))


def draw_tracks(ax, s, z):
    for k in range(s['rho'].size):
        c = s['c'][:, k]
        h = z - c[2]
        for r, kw in ((s['infl'][k], dict(fc=BLUE, alpha=0.08, ec=BLUE, ls='--', lw=0.7)),
                      (s['rho'][k], dict(fc='none', ec=BLUE, lw=1.0))):
            if abs(h) < r:
                ax.add_patch(Circle(c[:2], math.sqrt(r ** 2 - h ** 2), zorder=4, **kw))


VI = {'goal': 'tới đích', 'stuck': 'kẹt', 'collision': 'va chạm', 'timeout': 'hết giờ', 'cap': 'quá giới hạn'}


def stall(lg, dist=1.0):
    """Longest interval [t_a, t_b] in which the progress along the set path grew by less than dist."""
    t, s = lg['t'], lg['s_prog']
    best, t_best = s[0], t[0]
    span = (t[0], t[0])
    for ti, si in zip(t, s):
        if si > best + dist:
            if ti - t_best > span[1] - span[0]:
                span = (t_best, ti)
            best, t_best = si, ti
    if t[-1] - t_best > span[1] - span[0]:
        span = (t_best, t[-1])
    return span


def snap_at(d, t):
    S = d['snaps']
    return min(S, key=lambda s: abs(s['t'] - t))


def top_view(ax, d, ref, s, box, title, cam):
    w, lg = d['world'], d['log']
    z = s['p'][2]
    draw_world(ax, w, z, s['t'])
    draw_tracks(ax, s, z)
    ax.plot(w['path'][0], w['path'][1], '--', color=INK, lw=0.8, zorder=3)
    if ref is not None:
        rl = ref['log']
        ax.plot(rl['p'][0], rl['p'][1], color=AQUA, lw=1.4, zorder=5)
    k = lg['t'] <= s['t'] + 1e-6
    ax.plot(lg['p'][0, k], lg['p'][1, k], color=BLUE, lw=1.6, zorder=6)
    tt = d['trig_t'][d['trig_t'] <= s['t'] + 1e-6]
    if tt.size:
        px = np.interp(tt, lg['t'], lg['p'][0])
        py = np.interp(tt, lg['t'], lg['p'][1])
        ax.plot(px, py, 'o', ms=3.2, color=ORANGE, mec='white', mew=0.4, zorder=7)
    if s['W'].shape[1]:
        W = np.column_stack([s['p'], s['W']])
        ax.plot(W[0], W[1], color=MAGENTA, lw=1.4, ls='-', zorder=6)
    if np.all(np.isfinite(s['q_r'])):
        ax.plot(s['q_r'][0], s['q_r'][1], '*', ms=9, color=MAGENTA, mec=INK, mew=0.4, zorder=8)
    if s['Pm'].shape[1]:
        ax.plot(s['Pm'][0], s['Pm'][1], color=VIOLET, lw=1.0, zorder=6)
    # camera field of view at this instant (horizontal, out to the reliable range)
    psi = math.degrees(s['psi'])
    hf = math.degrees(cam['hfov']) / 2
    ax.add_patch(Wedge(s['p'][:2], cam['R_eff'], psi - hf, psi + hf, fc=YELLOW, alpha=0.10, ec=YELLOW,
                       lw=0.8, zorder=3))
    ax.plot(s['p'][0], s['p'][1], 'o', ms=7, color=BLUE, mec='white', mew=1.0, zorder=9)
    ax.set_xlim(box[0], box[1]); ax.set_ylim(box[2], box[3]); ax.set_aspect('equal')
    ax.grid(color=GRID, lw=0.5); ax.set_axisbelow(True)
    ax.set_xlabel('x [m]'); ax.set_ylabel('y [m]')
    ax.set_title(title, loc='left')


def case_figure(cov, ref, out):
    lg = cov['log']
    t_end = lg['t'][-1]
    t_a, t_b = stall(lg)                           # longest stretch with < 1 m progress
    s0, s1 = snap_at(cov, t_a), snap_at(cov, t_b)
    k = (lg['t'] >= t_a - 8) & (lg['t'] <= t_b)
    P = np.column_stack([lg['p'][:2, k], s1['p'][:2, None]])
    cx, cy = P.mean(axis=1)
    half = max(14.0, 0.5 * np.ptp(P[0]) + 8, 0.5 * np.ptp(P[1]) + 8)
    box = (cx - half, cx + half, cy - half, cy + half)

    fig = plt.figure(figsize=(13, 9.6))
    gs = fig.add_gridspec(2, 2, height_ratios=[1.55, 1], hspace=0.28, wspace=0.18)
    a1, a2 = fig.add_subplot(gs[0, 0]), fig.add_subplot(gs[0, 1])
    a3, a4 = fig.add_subplot(gs[1, 0]), fig.add_subplot(gs[1, 1])
    end_txt = 'kết thúc' if cov['outcome'] == 'stuck' and t_b >= t_end - 1e-6 else 'đi tiếp được'
    top_view(a1, cov, ref, s0, box, f'Lúc bắt đầu đứng (t = {s0["t"]:.0f} s)', cov['cam'])
    top_view(a2, cov, ref, s1, box, f'Lúc {end_txt} (t = {s1["t"]:.0f} s, sau {t_b - t_a:.0f} s gần như '
             f'không tiến)', cov['cam'])

    # speed and every perception frame (E_COV)
    a3.plot(lg['t'], lg['speed'], color=BLUE, lw=1.2)
    ymax = max(1.0, float(np.nanmax(lg['speed']))) * 1.15
    a3.vlines(cov['trig_t'], ymax * 0.93, ymax, color=ORANGE, lw=0.7)
    a3.axvspan(t_a, t_b, color=RED, alpha=0.06, lw=0)
    a3.set_ylim(0, ymax); a3.set_xlim(0, t_end)
    a3.set_xlabel('t [s]'); a3.set_ylabel('tốc độ [m/s]')
    n_stall = int(np.sum((cov['trig_t'] >= t_a) & (cov['trig_t'] <= t_b)))
    a3.set_title(f'E_COV: tốc độ và các lần chụp (vạch cam); {n_stall} khung trong {t_b - t_a:.0f} s đứng (nền đỏ)',
                 loc='left')
    a3.grid(color=GRID, lw=0.5)

    # progress along the set path, both variants
    a4.plot(lg['t'], lg['s_prog'], color=BLUE, lw=1.4, label=f"E_COV ({VI[cov['outcome']]})")
    if ref is not None:
        rl = ref['log']
        a4.plot(rl['t'], rl['s_prog'], color=AQUA, lw=1.4, label=f"FR_SAFE_3 ({VI[ref['outcome']]})")
        a4.set_xlim(0, max(t_end, rl['t'][-1]))
    a4.axvspan(t_a, t_b, color=RED, alpha=0.06, lw=0)
    a4.set_xlabel('t [s]'); a4.set_ylabel('tiến độ dọc quỹ đạo đặt [m]')
    a4.set_title('Tiến độ trên cùng thế giới', loc='left')
    a4.legend(frameon=False, loc='lower right')
    a4.grid(color=GRID, lw=0.5)

    # legend of the map symbols
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch
    h = [Patch(fc=OBST, ec=OBST_EDGE, label='vật cản thật (mặt cắt ở độ cao bay)'),
         Patch(fc=OBST_OFF, ec='none', label='vật cản thật, không chạm độ cao bay'),
         Line2D([], [], color=BLUE, lw=1.0, label='vật UAV đang nhớ (ước lượng)'),
         Patch(fc=BLUE, alpha=0.15, ec=BLUE, ls='--', label='… phình theo bất định (MPC phải tránh)'),
         Line2D([], [], color=BLUE, lw=1.6, label='đường bay E_COV'),
         Line2D([], [], color=ORANGE, marker='o', ls='none', ms=4, label='nơi chụp ảnh'),
         Line2D([], [], color=AQUA, lw=1.4, label='đường bay FR_SAFE_3 (3 Hz)'),
         Line2D([], [], color=INK, lw=0.8, ls='--', label='quỹ đạo đặt'),
         Line2D([], [], color=MAGENTA, lw=1.4, label='đường vòng đã lập + điểm quay về (*)'),
         Line2D([], [], color=VIOLET, lw=1.0, label='quỹ đạo MPC dự kiến'),
         Patch(fc=YELLOW, alpha=0.25, ec=YELLOW, label='trường nhìn camera (tới tầm tin cậy)')]
    fig.subplots_adjust(top=0.84)
    fig.legend(handles=h, loc='upper center', ncol=4, frameon=False, bbox_to_anchor=(0.5, 0.955), fontsize=8)
    name = {'SN': 'bay thường SN', 'SH': 'kịch bản khó SH'}.get(cov['scenario'], cov['scenario'])
    fig.suptitle(f"{name}, yêu cầu {cov['v_des']:g} m/s, thế giới {cov['seed']}: "
                 f"E_COV {VI[cov['outcome']]}, FR_SAFE_3 {VI[ref['outcome']] if ref else '(không chạy)'}",
                 x=0.06, y=0.995, ha='left', fontsize=12, fontweight='bold', color=INK)
    fig.savefig(out, dpi=130, bbox_inches='tight')
    plt.close(fig)


def main(src, dst):
    os.makedirs(dst, exist_ok=True)
    for f in sorted(glob.glob(os.path.join(src, 'case_*_E_COV.json'))):
        m = re.search(r'case_(\w+?)_v([\d.]+)_s(\d+)_E_COV\.json$', f)
        cov = load(f)
        rf = f.replace('_E_COV.json', '_FR_SAFE_3.json')
        ref = load(rf) if os.path.exists(rf) else None
        out = os.path.join(dst, f'stuck_{m[1]}_v{m[2]}_s{m[3]}.png')
        case_figure(cov, ref, out)
        print(out)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
