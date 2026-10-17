"""Figures of the manuscript (docs/paper), from stored results only (no new simulation).

Usage: python3 docs/paper/make_figures.py [vi|en]     (default: vi)
Writes vector PDF files docs/paper/figures/Fig3.pdf ... Fig7.pdf; Fig. 1-2 are TikZ drawings in the manuscript.
Data: the final grid logs (docs/results/raw, via final_tables.py), one representative mission
(docs/paper/data/case_SN_v10_s22_*.json: SN world 22, 10 m/s, f_max = 3 Hz, final algorithm 2a536b1, identical to
the grid runs) and one replayed collision (docs/results/raw/collisions).
Style: MATLAB-like line plots (box, grid, inward ticks), Arial-type lettering 8 pt, 84 / 174 mm wide.
"""
import contextlib
import io
import json
import math
import os
import runpy
import statistics as st
import sys

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt  # noqa: E402
import numpy as np  # noqa: E402
from matplotlib.patches import Circle, Polygon, Rectangle  # noqa: E402

LANG = sys.argv[1] if len(sys.argv) > 1 else 'vi'
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OUT = os.path.join(ROOT, 'docs', 'paper', 'figures')
os.makedirs(OUT, exist_ok=True)
MM = 1 / 25.4
W1, W2 = 84 * MM, 174 * MM

plt.rcParams.update({
    'font.family': 'Liberation Sans', 'font.size': 8, 'axes.labelsize': 8, 'xtick.labelsize': 7.5,
    'ytick.labelsize': 7.5, 'legend.fontsize': 7.2, 'axes.linewidth': 0.6, 'lines.linewidth': 1.2,
    'lines.markersize': 4, 'xtick.direction': 'in', 'ytick.direction': 'in', 'xtick.top': True,
    'ytick.right': True, 'xtick.major.width': 0.5, 'ytick.major.width': 0.5, 'xtick.major.size': 3,
    'ytick.major.size': 3, 'axes.grid': True, 'grid.color': '#e6e6e6', 'grid.linewidth': 0.5,
    'grid.linestyle': '-', 'axes.axisbelow': True, 'axes.edgecolor': '#262626',
    'legend.frameon': True, 'legend.framealpha': 0.95, 'legend.edgecolor': '#bdbdbd',
    'legend.fancybox': False, 'legend.borderpad': 0.4, 'legend.handlelength': 2.0, 'legend.labelspacing': 0.3,
    'lines.markeredgewidth': 0.7,
    'pdf.fonttype': 42, 'ps.fonttype': 42, 'savefig.bbox': 'tight', 'savefig.pad_inches': 0.02,
})
# MATLAB default colour order; colour = method throughout the paper:
# COV (proposed) orange-red, FR blue, RA green, COV-NC purple; black / grey = references, limits, obstacles
C1, C2, C3, C4, C5 = '#0072BD', '#D95319', '#EDB120', '#7E2F8E', '#77AC30'
K = '#000000'
COV_C, FR_C, RA_C, NC_C = C2, C1, C5, C4
REF = dict(color='#262626', ls='--', lw=0.8)
OB_HIT, OB_OFF, OB_EDGE = '#b3b3b3', '#e8e8e8', '#8c8c8c'

T = {
    'vi': dict(
        x='$x$ [m]', y='$y$ [m]', t='$t$ [s]', v='$\\|v\\|$ [m/s]', dt='$t_{k+1}-t_k$ [s]',
        clr='Khoảng cách tới vật cản [m]', fmax='Trần tần số chụp $f_{\\max}$ [Hz]',
        coll='Tỉ lệ va chạm [%]', fps='Tần số chụp thực tế [khung/s]', spd='Tốc độ trung bình [m/s]',
        dens='Số vật cản trong bán kính 15 m', bins=['0', '1–2', '3–5', '≥ 6'],
        alt='$z$ [m]', along='Khoảng cách ngang [m]', d='Khoảng cách [m]',
        nfr='Số lần suy luận tích luỹ', cov='COV', fr='FR', ra='RA', path='quỹ đạo đặt', trig='thời điểm chụp (COV)', vdes='$v_{\\mathrm{des}}$',
        fbound='$1/f_{\\max}$', margin='$d_s - r_b$',
        SN='SN', SH='SH', SE='SE', ident='FR: $f = f_{\\max}$',
        true='UAV – vật thật', bel='UAV – bộ nhớ', qmem='điểm chạm – bộ nhớ', frame='lần chụp',
        obst='vật thật', cyl='hình trụ trong bộ nhớ', uav='UAV', cpt='điểm chạm',
        cam={1: 'v2 (62°)', 2: 'Module 3 (66°)', 3: 'Module 3 Wide (102°)', 4: 'Wide (102°), mạng 640×360'},
        reff='$R$', f2obst='vật cản', f2free='vùng trống đã quan sát', f2unobs='chưa quan sát', f2path='đường đi dự kiến',
        f2a='đoạn cần nằm trong vùng đã quan sát:\nbỏ qua suy luận',
        f2b='đoạn cần ra khỏi vùng đã quan sát:\nchụp khung mới'),
    'en': dict(
        x='$x$ [m]', y='$y$ [m]', t='$t$ [s]', v='$\\|v\\|$ [m/s]', dt='$t_{k+1}-t_k$ [s]',
        clr='Clearance [m]', fmax='Maximum perception rate $f_{\\max}$ [Hz]',
        coll='Collision rate [%]', fps='Actual perception rate [frames/s]', spd='Mean speed [m/s]',
        dens='Obstacles within 15 m', bins=['0', '1–2', '3–5', '≥ 6'],
        alt='$z$ [m]', along='Horizontal distance [m]', d='Distance [m]',
        nfr='Cumulative inferences', cov='COV', fr='FR', ra='RA', path='set path', trig='frame instants (COV)', vdes='$v_{\\mathrm{des}}$',
        fbound='$1/f_{\\max}$', margin='$d_s - r_b$',
        SN='SN', SH='SH', SE='SE', ident='FR: $f = f_{\\max}$',
        true='UAV – true obstacle', bel='UAV – memory', qmem='contact point – memory', frame='frames',
        obst='true obstacle', cyl='cylinder in memory', uav='UAV', cpt='contact point',
        cam={1: 'v2 (62°)', 2: 'Module 3 (66°)', 3: 'Module 3 Wide (102°)', 4: 'Wide (102°), 640×360 net'},
        reff='$R$', f2obst='obstacle', f2free='observed free space', f2unobs='unobserved', f2path='planned path',
        f2a='needed stretch inside observed space:\ninference skipped',
        f2b='needed stretch leaves observed space:\nnew frame'),
}[LANG]


def save(fig, name):
    fig.savefig(os.path.join(OUT, name))
    plt.close(fig)
    print(os.path.join(OUT, name))


def panel(ax, s, loc='ul'):
    # Springer style: bold lower-case part label at the upper-left corner, outside the axes
    s = s.strip('()').split(')')[0].split(' ')[0]
    ax.text(-0.02, 1.02, s, transform=ax.transAxes, ha='right', va='bottom', fontweight='bold', fontsize=9)


def arr(x, rows=None):
    a = np.array(x if isinstance(x, list) else [x], dtype=float)
    if rows and a.ndim == 1:
        a = a.reshape(rows, -1) if a.size else np.zeros((rows, 0))
    return a


# ======================================================================== Fig. 2: coverage condition (schematic)
# One frame captured at c = 0 looking along +x (horizontal FOV 102 deg); the free space it observes reaches the
# measured surface minus d_s, at most R (schematic stand-in for R_eff); the space behind a surface and outside the
# field of view is unobserved. The vehicle, now at p, needs the planned path up to l(v) = v tau + v^2/(2 a_b) + d_s.
from matplotlib.path import Path as MPath  # noqa: E402

F2_R, F2_DS, F2_HF = 16.0, 0.5, math.radians(51)
F2_OB = [((7.0, 2.2), 1.2), ((9.0, -3.5), 1.5), ((15.0, -0.5), 1.0)]
F2_V, F2_TAU, F2_AB = 10.0, 0.14, 6.2
F2_L = [F2_V * F2_TAU, F2_V ** 2 / (2 * F2_AB), F2_DS]


def f2_free_polygon():
    th = np.linspace(-F2_HF, F2_HF, 721)
    pts = [(0.0, 0.0)]
    for a in th:
        u = np.array([math.cos(a), math.sin(a)])
        d = F2_R
        for (o, r) in F2_OB:
            o = np.array(o); b = u @ o; disc = r * r - (o @ o - b * b)
            if disc >= 0 and b > 0:
                d = min(d, b - math.sqrt(disc) - F2_DS)
        pts.append((d * u[0], d * u[1]))
    return np.array(pts)


def f2_spline(P, n=60):
    # Catmull-Rom through the control points
    P = np.array(P, float); P = np.vstack([2 * P[0] - P[1], P, 2 * P[-1] - P[-2]])
    out = []
    for i in range(1, len(P) - 2):
        p0, p1, p2, p3 = P[i - 1], P[i], P[i + 1], P[i + 2]
        for t in np.linspace(0, 1, n, endpoint=False):
            out.append(0.5 * ((2 * p1) + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t ** 2
                              + (-p0 + 3 * p1 - 3 * p2 + p3) * t ** 3))
    out.append(P[-2])
    return np.array(out)


def f2_cut(X, s0, s1):
    s = np.r_[0, np.cumsum(np.hypot(*np.diff(X, axis=0).T))]
    q = np.linspace(s0, min(s1, s[-1]), 120)
    return np.c_[np.interp(q, s, X[:, 0]), np.interp(q, s, X[:, 1])]


def f2_panel(ax, ctrl, lab, verdict):
    plt.rcParams['hatch.color'] = '#d0d0d0'
    plt.rcParams['hatch.linewidth'] = 0.5
    ax.add_patch(Rectangle((-1.5, -7.5), 21, 15, fc='white', ec='none', hatch='////', lw=0, zorder=0))
    poly = f2_free_polygon()
    ax.add_patch(Polygon(poly, closed=True, fc='#e3edf6', ec='none', zorder=1))
    for a in (-F2_HF, F2_HF):
        ax.plot([0, F2_R * math.cos(a)], [0, F2_R * math.sin(a)], color='#7f7f7f', lw=0.6, zorder=2)
    th = np.linspace(-F2_HF, F2_HF, 200)
    ax.plot(F2_R * np.cos(th), F2_R * np.sin(th), color='#7f7f7f', lw=0.6, ls='--', zorder=2)
    for (o, r) in F2_OB:
        ax.add_patch(Circle(o, r, fc=OB_HIT, ec=OB_EDGE, lw=0.5, zorder=3))
    X = f2_spline(ctrl)
    L = np.cumsum(F2_L)
    ax.plot(*f2_cut(X, L[-1], 99).T, color='#7f7f7f', ls=':', lw=1.0, zorder=4)
    ax.plot(*f2_cut(X, 0, L[0]).T, color=K, lw=2.2, solid_capstyle='butt', zorder=5)
    ax.plot(*f2_cut(X, L[0], L[1]).T, color=COV_C, lw=2.2, solid_capstyle='butt', zorder=5)
    ax.plot(*f2_cut(X, L[1], L[2]).T, color=K, lw=0.9, zorder=5)
    seg = f2_cut(X, 1.0, L[2])
    inside = MPath(poly).contains_points(seg)
    ax.plot(*ctrl[0], 'o', color=K, ms=4.5, zorder=6)
    ax.plot(0, 0, marker=(3, 0, -90), color='#404040', ms=6, ls='none', zorder=6)
    ax.text(-0.35, -0.5, '$c_k$', fontsize=7.5, ha='right', va='top', zorder=7)
    ax.text(ctrl[0][0] + 0.2, -0.6, '$p(t)$', fontsize=7.5, ha='left', va='top', zorder=7)
    if inside.all():
        e = seg[-1]
        ax.plot(*e, 'o', ms=5, mfc='white', mec=K, mew=1.0, zorder=7)
    else:
        e = seg[np.argmin(inside)]
        ax.plot(*e, 'x', ms=7, color='#A2142F', mew=1.6, zorder=7)
    ax.text(0.02, 0.97, verdict, transform=ax.transAxes, ha='left', va='top', fontsize=7.2,
            bbox=dict(fc='white', ec='#bdbdbd', lw=0.5, pad=2.0), zorder=8)
    ax.text(F2_R * math.cos(-0.36) + 0.3, F2_R * math.sin(-0.36), T['reff'], fontsize=7.5, color='#404040',
            ha='left', va='center')
    ax.set_xlim(-1.5, 19.5); ax.set_ylim(-7.5, 7.5); ax.set_aspect('equal')
    ax.set_xlabel(T['x']); ax.set_ylabel(T['y'])
    ax.grid(False)
    panel(ax, lab)


fig, axs = plt.subplots(1, 2, figsize=(W2, 66 * MM))
f2_panel(axs[0], [(1.5, 0.0), (6.0, 0.0), (11.0, 0.0), (16.0, 0.0)], 'a', T['f2a'])
f2_panel(axs[1], [(1.5, 0.0), (5.0, 0.3), (7.8, 0.55), (9.4, 1.6), (10.4, 3.0), (11.0, 4.5)], 'b', T['f2b'])
axs[1].set_ylabel('')
hd = [plt.Rectangle((0, 0), 1, 1, fc='#e3edf6', ec='none', label=T['f2free']),
      plt.Rectangle((0, 0), 1, 1, fc='white', ec='#d0d0d0', hatch='////', lw=0.5, label=T['f2unobs']),
      plt.Rectangle((0, 0), 1, 1, fc=OB_HIT, ec=OB_EDGE, lw=0.5, label=T['f2obst']),
      plt.Line2D([], [], color=K, lw=2.2, label='$v\\hat{\\tau}$'),
      plt.Line2D([], [], color=COV_C, lw=2.2, label='$v^2/(2a_b)$'),
      plt.Line2D([], [], color=K, lw=0.9, label='$d_s$'),
      plt.Line2D([], [], color='#7f7f7f', ls=':', lw=1.0, label=T['f2path'])]
fig.legend(handles=hd, loc='lower center', bbox_to_anchor=(0.5, 0.93), ncol=7, frameon=False, fontsize=7,
           handlelength=1.6, columnspacing=1.0)
fig.tight_layout(rect=(0, 0, 1, 0.93), w_pad=1.5)
save(fig, 'Fig2.pdf')

# ======================================================================== grid data
sys.argv = ['final_tables.py', os.path.join(ROOT, 'docs', 'results', 'raw')]
with contextlib.redirect_stdout(io.StringIO()):
    G = runpy.run_path(os.path.join(ROOT, 'docs', 'results', 'final_tables.py'))
R, F, D = G['R'], G['F'], G['D']
FS = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]


def keys(sc, v, cam=3, f=None):
    return [k for k in R if k[0] == sc and k[1] == v and k[2] == cam and (f is None or k[4] == f)]


def crate(ks):
    return 100 * sum(R[k]['out'] == 'collision' and F.get(k, {}).get('dyn') != '1' for k in ks) / len(ks)


# ======================================================================== Fig. 3: one mission, COV vs FR
def load_case(v):
    g = json.load(open(os.path.join(ROOT, 'docs', 'paper', 'data', f'case_SN_v10_s22_{v}.json')))
    lg = g['log']
    g['t'] = arr(lg['t']).ravel(); g['p'] = arr(lg['p'], 3); g['v'] = arr(lg['speed']).ravel()
    g['clr'] = arr(lg['clear']).ravel(); g['tr'] = arr(g['trig_t']).ravel()
    return g




def draw_obstacles(ax, w, z0):
    wc, wd, wt, wy = arr(w['c0'], 3), arr(w['dim'], 3), arr(w['type']).ravel(), arr(w['yaw']).ravel()
    for i in range(wt.size):
        c, typ, dim = wc[:, i], int(wt[i]), wd[:, i]
        if typ == 2:
            cy, sy = math.cos(wy[i]), math.sin(wy[i])
            Q = np.array([[cy, -sy], [sy, cy]]) @ np.array([[dim[0], -dim[0], -dim[0], dim[0]],
                                                             [dim[1], dim[1], -dim[1], -dim[1]]])
            hit = abs(z0 - c[2]) <= dim[2]
            ax.add_patch(Polygon(Q.T + c[:2], closed=True, fc=OB_HIT if hit else OB_OFF, ec=OB_EDGE, lw=0.3))
        else:
            hit = abs(z0 - c[2]) <= (dim[0] if typ == 1 else dim[1])
            ax.add_patch(Circle(c[:2], dim[0], fc=OB_HIT if hit else OB_OFF, ec=OB_EDGE, lw=0.3))


cv, fr = load_case('E_COV'), load_case('FR_SAFE')
w = cv['world']
ylo = min(cv['p'][1].min(), fr['p'][1].min()) - 3.5
yhi = max(cv['p'][1].max(), fr['p'][1].max()) + 3.5
fig = plt.figure(figsize=(W2, 86 * MM))
ax = fig.add_axes([0.065, 0.60, 0.925, 0.30])
ax.set_anchor('S')
draw_obstacles(ax, w, 2.6)
P = arr(w['path'], 3)
ax.plot(P[0], P[1], color='#595959', ls=':', lw=0.8, label=T['path'])
ax.plot(fr['p'][0], fr['p'][1], color=FR_C, lw=1.2, label=T['fr'])
ax.plot(cv['p'][0], cv['p'][1], color=COV_C, lw=1.2, label=T['cov'])
px = np.interp(cv['tr'], cv['t'], cv['p'][0]); py = np.interp(cv['tr'], cv['t'], cv['p'][1])
ax.plot(px, py, 'o', ms=2.6, color=COV_C, mec='white', mew=0.4, label=T['trig'])
ax.plot(P[0, 0], P[1, 0], marker='s', color=K, ms=4, ls='none')
ax.plot(P[0, -1], P[1, -1], marker='*', color=K, ms=7, ls='none')
ax.set_xlim(-5, 305); ax.set_ylim(ylo, yhi); ax.set_aspect('equal')
ax.set_xlabel(T['x'], labelpad=1); ax.set_ylabel(T['y'])
ax.legend(loc='lower center', bbox_to_anchor=(0.5, 1.02), ncol=4, frameon=False)
panel(ax, 'a')
axs = [fig.add_axes([0.065 + i * 0.335, 0.10, 0.26, 0.38]) for i in range(3)]
ax = axs[0]
ax.plot(fr['t'], fr['v'], color=FR_C, lw=1.1)
ax.plot(cv['t'], cv['v'], color=COV_C, lw=1.1)
ax.axhline(10, **REF)
ax.text(36.5, 10.3, T['vdes'], color='#262626', ha='right', va='bottom', fontsize=7.5)
ax.set_xlabel(T['t']); ax.set_ylabel(T['v']); ax.set_ylim(0, 12); ax.set_xlim(0, 37)
panel(ax, 'b')
ax = axs[1]
for g, col in [(fr, FR_C), (cv, COV_C)]:
    n = np.arange(1, g['tr'].size + 1)
    ax.step(np.r_[0, g['tr'], g['t'][-1]], np.r_[0, n, n[-1]], where='post', color=col, lw=1.1)
tt = np.array([0, 37])
ax.plot(tt, 3 * tt, **REF)
ax.text(24, 88, '$f_{\\max}\\, t$', color='#262626', ha='right', va='bottom', fontsize=7.5)
ax.set_xlabel(T['t']); ax.set_ylabel(T['nfr']); ax.set_xlim(0, 37); ax.set_ylim(0, 115)
panel(ax, 'c')
ax = axs[2]
ax.plot(fr['t'], fr['clr'], color=FR_C, lw=1.1)
ax.plot(cv['t'], cv['clr'], color=COV_C, lw=1.1)
ax.axhline(0.25, **REF)
ax.text(36.5, 0.4, T['margin'], color='#262626', ha='right', va='bottom', fontsize=7.5)
ax.set_xlabel(T['t']); ax.set_ylabel(T['clr']); ax.set_ylim(0, 8); ax.set_xlim(0, 37)
panel(ax, 'd')
save(fig, 'Fig3.pdf')

# ======================================================================== Fig. 4: sampling-rate study
# marker / line style = scenario; colour = method (black: all schedulers pooled)
SC = {'SN': ('o', '-'), 'SH': ('s', '--'), 'SE': ('^', ':')}
VAR4 = ['E_COV', 'FR_SAFE', 'E_DART', 'COV_NOCLUT']
fig, axs = plt.subplots(1, 2, figsize=(W2, 58 * MM))
ax = axs[0]
for sc, (mk, ls) in SC.items():
    y = [crate([k for v in VAR4 for k in keys(sc, v, 3, f)]) for f in FS]
    ax.plot(FS, y, color='#262626', marker=mk, ls=ls, mfc='white', ms=4, lw=1.1, label=T[sc])
ax.axvline(1.5, color='#8c8c8c', lw=0.7, ls='-.')
ax.set_xlim(0.3, 5.2); ax.set_ylim(0, 60); ax.set_xticks([0.5, 1, 2, 3, 4, 5])
ax.set_xlabel(T['fmax']); ax.set_ylabel(T['coll'])
ax.legend(loc='upper right')
panel(ax, 'a')
ax = axs[1]
ax.plot([0, 5.2], [0, 5.2], color=FR_C, lw=1.1, label=T['ident'])
for sc, (mk, ls) in SC.items():
    y = [st.mean(R[k]['inf'] / R[k]['t'] for k in keys(sc, 'E_COV', 3, f)) for f in FS]
    ax.plot(FS, y, color=COV_C, marker=mk, ls=ls, mfc='white', ms=4, lw=1.1, label=f"{T['cov']}, {T[sc]}")
ax.set_xlim(0.3, 5.2); ax.set_ylim(0, 5.2); ax.set_xticks([0.5, 1, 2, 3, 4, 5])
ax.set_xlabel(T['fmax']); ax.set_ylabel(T['fps'])
ax.legend(loc='upper left')
panel(ax, 'b')
fig.tight_layout(w_pad=2.0)
save(fig, 'Fig4.pdf')

# ======================================================================== Fig. 5: perception and speed vs clutter
fig, axs = plt.subplots(1, 2, figsize=(W2, 54 * MM))
xb = np.arange(4)
for v, col, mk, lab in [('FR_SAFE', FR_C, 's', T['fr']), ('E_DART', RA_C, '^', T['ra']),
                        ('E_COV', COV_C, 'o', T['cov'])]:
    ks = [k for k in D if k[0] == 'SN' and k[1] == v and k[2] == 3 and k[4] == 3.0 and k[3] == 15]
    Tt = np.array([sum(D[k][0][b] for k in ks) for b in range(4)])
    Dd = np.array([sum(D[k][1][b] for k in ks) for b in range(4)])
    Fr = np.array([sum(D[k][2][b] for k in ks) for b in range(4)])
    for ax, y in zip(axs, [Fr / Tt, Dd / Tt]):
        ax.plot(xb, y, color=col, marker=mk, ms=4.5, mec='white', mew=0.6, lw=1.2, label=lab)
for ax, lab, yl, ylim in zip(axs, 'ab', [T['fps'], T['spd']], [(0, 3.5), (0, 13)]):
    ax.set_xticks(xb); ax.set_xticklabels(T['bins']); ax.set_xlim(-0.3, 3.3); ax.set_ylim(*ylim)
    ax.set_xlabel(T['dens']); ax.set_ylabel(yl)
    panel(ax, lab)
axs[0].legend(loc='lower right')
axs[1].legend(loc='upper right')
fig.tight_layout(w_pad=2.0)
save(fig, 'Fig5.pdf')

# ======================================================================== Fig. 6: cameras (family of curves)
fig, ax = plt.subplots(figsize=(W1, 62 * MM))
for cam, col, mk in [(3, '#262626', 'o'), (4, '#7f7f7f', 's'), (1, '#A2142F', '^'), (2, '#4DBEEE', 'D')]:
    y = [crate([k for k in R if k[0] == 'SN' and k[2] == cam and k[4] == f and k[1] in ('E_COV', 'FR_SAFE')])
         for f in FS]
    ax.plot(FS, y, color=col, marker=mk, ms=3.8 if mk != 'D' else 3.2, mec='white', mew=0.5, lw=1.2,
            label=T['cam'][cam])
ax.set_xlim(0.3, 5.2); ax.set_ylim(0, 65); ax.set_xticks([0.5, 1, 2, 3, 4, 5])
ax.set_xlabel(T['fmax']); ax.set_ylabel(T['coll'])
ax.legend(loc='upper right')
save(fig, 'Fig6.pdf')

# ======================================================================== Fig. 7: failure mechanism (replayed case)
CD = os.path.join(ROOT, 'docs', 'results', 'raw', 'collisions')
tag = 'SH_E_COV_v6_s1'
case = json.load(open(os.path.join(CD, f'case_{tag}.json')))
dg = json.load(open(os.path.join(CD, f'diag_{tag}.json')))
q = np.array(dg['contact']['q'], float)


def cyl_dist(Pt, c, rho, zl, zh):
    dh = math.hypot(Pt[0] - c[0], Pt[1] - c[1]) - rho
    dz = max(zl - Pt[2], Pt[2] - zh)
    if dz <= 0:
        return dh if dh > 0 else max(dh, dz)
    return math.hypot(max(dh, 0), dz) if dh > 0 else dz


S = case['snaps']
for s in S:
    s['c'] = arr(s['c'], 3); s['rho'] = arr(s['rho']).ravel(); s['zl'] = arr(s['zl']).ravel()
    s['zh'] = arr(s['zh']).ravel(); s['p'] = arr(s['p']).ravel()
dq = np.array([min([cyl_dist(q, s['c'][:, k], s['rho'][k], s['zl'][k], s['zh'][k]) for k in range(s['rho'].size)],
                   default=np.inf) for s in S])
Ts = np.array([s['t'] for s in S])
i_last = np.where((dq <= 0.25)[:-1])[0][-1]
w = case['world']
w_c0, w_dim, w_type, w_yaw = arr(w['c0'], 3), arr(w['dim'], 3), arr(w['type']).ravel(), arr(w['yaw']).ravel()


def section(ax, s):
    p = s['p']; u = q[:2] - p[:2]; u = u / np.linalg.norm(u)
    xs = np.linspace(-1.5, 9, 421); zs = np.linspace(0, 8, 321)
    X, Z = np.meshgrid(xs, zs)
    occ = np.zeros_like(X, dtype=bool)
    for i in range(w_type.size):
        c, typ, dim = w_c0[:, i], int(w_type[i]), w_dim[:, i]
        Px, Py, Pz = p[0] + X * u[0] - c[0], p[1] + X * u[1] - c[1], Z - c[2]
        if typ == 1:
            occ |= Px ** 2 + Py ** 2 + Pz ** 2 <= dim[0] ** 2
        elif typ == 2:
            cy, sy = math.cos(w_yaw[i]), math.sin(w_yaw[i])
            occ |= (abs(cy * Px + sy * Py) <= dim[0]) & (abs(-sy * Px + cy * Py) <= dim[1]) & (abs(Pz) <= dim[2])
        else:
            occ |= (Px ** 2 + Py ** 2 <= dim[0] ** 2) & (abs(Pz) <= dim[1])
    ax.contourf(X, Z, occ.astype(float), levels=[0.5, 1.5], colors=[OB_HIT])
    ax.contour(X, Z, occ.astype(float), levels=[0.5], colors=[OB_EDGE], linewidths=0.4)
    for k in range(s['rho'].size):
        c, rho = s['c'][:, k], s['rho'][k]
        a = (c[0] - p[0]) * u[0] + (c[1] - p[1]) * u[1]
        b = abs(-(c[0] - p[0]) * u[1] + (c[1] - p[1]) * u[0])
        if b >= rho:
            continue
        h = math.sqrt(rho ** 2 - b ** 2)
        zl, zh = max(s['zl'][k], -0.5), min(s['zh'][k], 8.5)
        ax.add_patch(Rectangle((a - h, zl), 2 * h, zh - zl, fc=FR_C, alpha=0.10, ec='none', zorder=3))
        ax.add_patch(Rectangle((a - h, zl), 2 * h, zh - zl, fc='none', ec=FR_C, lw=1.1, zorder=4))
    ax.plot(0, p[2], 'o', color=K, ms=4.5, zorder=6)
    qa = (q[0] - p[0]) * u[0] + (q[1] - p[1]) * u[1]
    ax.plot(qa, q[2], 'x', color=COV_C, ms=6, mew=1.5, zorder=7)
    ax.set_xlim(-1.5, 9); ax.set_ylim(0, 8); ax.set_aspect('equal')
    ax.set_xlabel(T['along']); ax.set_ylabel(T['alt'])
    ax.text(0.03, 0.96, f"$t$ = {s['t']:.1f} s", transform=ax.transAxes, ha='left', va='top', fontsize=7.5)


fig = plt.figure(figsize=(W2, 64 * MM))
ax1 = fig.add_axes([0.06, 0.16, 0.26, 0.70]); ax2 = fig.add_axes([0.35, 0.16, 0.26, 0.70])
ax3 = fig.add_axes([0.69, 0.16, 0.30, 0.70])
section(ax1, S[i_last]); section(ax2, S[i_last + 1])
panel(ax1, 'a'); panel(ax2, 'b')
ax2.set_ylabel(''); ax2.set_yticklabels([])
rows = np.array(dg['rows'], float)
t_end = dg['t_end']
k = Ts >= t_end - 4
ax3.plot(rows[:, 0], rows[:, 1], color=K, lw=1.1, label=T['true'])
ax3.plot(rows[:, 0], rows[:, 2], color=FR_C, lw=1.1, label=T['bel'])
ax3.plot(Ts[k], np.clip(dq[k], -1.5, 4), color=COV_C, lw=1.1, label=T['qmem'])
trig = np.array(case['trig_t'], float)
tt = trig[trig >= t_end - 4]
ax3.plot(tt, np.full(tt.size, -1.45), '|', color='#595959', ms=6, mew=0.8, label=T['frame'])
ax3.axhline(0, color='#262626', lw=0.6, ls='--')
ax3.set_xlim(t_end - 4, t_end + 0.1); ax3.set_ylim(-1.6, 4.4)
ax3.set_xlabel(T['t']); ax3.set_ylabel(T['d'])
ax3.legend(loc='lower center', bbox_to_anchor=(0.5, 1.01), fontsize=6.6, ncol=2, columnspacing=0.8, frameon=False)
panel(ax3, 'c')
fig.legend(handles=[plt.Rectangle((0, 0), 1, 1, fc=OB_HIT, ec=OB_EDGE, lw=0.4, label=T['obst']),
                    plt.Rectangle((0, 0), 1, 1, fc=(0, 0.447, 0.741, 0.10), ec=FR_C, lw=1.1, label=T['cyl']),
                    plt.Line2D([], [], color=K, marker='o', ls='none', ms=4.5, label=T['uav']),
                    plt.Line2D([], [], color=COV_C, marker='x', ls='none', ms=6, mew=1.5, label=T['cpt'])],
           loc='lower center', bbox_to_anchor=(0.33, 0.88), ncol=4, frameon=False, fontsize=6.8)
save(fig, 'Fig7.pdf')
