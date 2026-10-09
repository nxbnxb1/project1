"""Scene figures: obstacle layout (top view) and one perception frame.
Usage: python3 docs/figures/plot_scene.py <dir with CSVs from experiments/dart_export_scene.m> <out dir>"""
import sys, numpy as np, matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Circle
from matplotlib.lines import Line2D
from matplotlib.colors import LinearSegmentedColormap

d, out = sys.argv[1], sys.argv[2]
INK, INK2, MUTED, GRID, SURF = '#0b0b0b', '#52514e', '#8d8c86', '#e4e3df', '#fcfcfb'
S1C, S2C = '#2a78d6', '#eb6834'          # categorical slots 1 (static) and 2 (dynamic)
VDES = 4.0                               # cfg.ref.v_des: dynamic obstacles are drawn when the UAV passes
plt.rcParams.update({'font.size': 9, 'axes.edgecolor': MUTED, 'axes.labelcolor': INK2,
                     'xtick.color': INK2, 'ytick.color': INK2, 'figure.facecolor': SURF, 'axes.facecolor': SURF})

# ---- top view
fig = plt.figure(figsize=(9.5, 6.6))
fig.text(0.01, 0.975, 'Cách đặt vật cản (nhìn từ trên xuống, đúng tỉ lệ, seed 1)', color=INK, fontsize=12, va='top')
handles = [Line2D([], [], marker='o', ls='', ms=9, color=S1C, alpha=0.8), Line2D([], [], marker='o', ls='', ms=9, color=S2C)]
fig.legend(handles, ['vật cản tĩnh: hình cầu, bán kính 0.35–0.9 m, tâm ở độ cao 1.2–2.8 m; khe giữa hai bề mặt ≥ 2 m',
                     'vật cản động: hình cầu bán kính 0.4–0.7 m, đi thẳng theo trục y, vận tốc hằng 0.6–1.5 m/s'],
           loc='upper left', bbox_to_anchor=(0.005, 0.94), frameon=False, fontsize=8)
axs = [fig.add_axes([0.07, 0.50, 0.9, 0.30]), fig.add_axes([0.07, 0.10, 0.9, 0.30])]
for ax, s, title in [(axs[0], 'S1', 'S1 (và S3, cùng hình học): 28 cầu tĩnh trong 3 cụm, xen vùng thoáng'),
                     (axs[1], 'S2', 'S2: 14 cầu tĩnh thưa + 6 cầu động cắt ngang hành lang (vẽ tại lúc UAV đi qua)')]:
    W = np.loadtxt(f'{d}/world_{s}.csv', delimiter=',', ndmin=2)
    for x, y, z, vx, vy, vz, r in W:
        if abs(vy) > 0:
            yc = y + vy * x / VDES
            ax.plot([x, x], [yc - vy * 1.5, yc + vy * 1.5], color=S2C, lw=1, ls=(0, (2, 2)), zorder=2)
            ax.add_patch(Circle((x, yc), r, facecolor=S2C, edgecolor=SURF, lw=1, zorder=3))
            ax.annotate('', xy=(x, yc + np.sign(vy) * (r + 1.3)), xytext=(x, yc + np.sign(vy) * r), zorder=4,
                        arrowprops=dict(arrowstyle='-|>', color=S2C, lw=1.6))
            ax.text(x + r + 0.25, yc - np.sign(vy) * 0.9, f'{abs(vy):.1f} m/s', color=INK2, fontsize=7.5, va='center', zorder=5)
        else:
            ax.add_patch(Circle((x, y), r, facecolor=S1C, alpha=0.8, edgecolor=SURF, lw=1, zorder=3))
    ax.plot([0, 50], [0, 0], color=MUTED, lw=1, ls=(0, (4, 3)), zorder=1)
    ax.plot(0, 0, marker='o', ms=7, color=INK, zorder=5); ax.text(0.4, 0.6, 'xuất phát', color=INK, fontsize=8)
    ax.plot(50, 0, marker='*', ms=11, color=INK, zorder=5); ax.text(48.4, 0.7, 'đích', color=INK, fontsize=8)
    ax.set_xlim(-1, 51); ax.set_ylim(-8.5, 8.5); ax.set_aspect('equal', adjustable='box', anchor='W')
    ax.set_ylabel('y [m]'); ax.set_title(title, loc='left', color=INK, fontsize=9.5)
    ax.grid(color=GRID, lw=0.6, zorder=0)
    for sp in ['top', 'right']: ax.spines[sp].set_visible(False)
axs[1].set_xlabel('x [m]  — hành lang 50 m; UAV bay ở độ cao 2 m, tốc độ hành trình mặc định 4 m/s')
fig.savefig(f'{out}/scene_topview.png', dpi=160)

# ---- one perception frame
Dt = np.loadtxt(f'{d}/depth_true.csv', delimiter=','); Dh = np.loadtxt(f'{d}/depth_hat.csv', delimiter=',')
I = np.loadtxt(f'{d}/inst.csv', delimiter=',').astype(int)
det = np.loadtxt(f'{d}/detections.csv', delimiter=',', ndmin=2)
W1 = np.loadtxt(f'{d}/world_S1.csv', delimiter=',', ndmin=2)
cam = np.array([4.1, 0.0, 2.0])          # camera position (UAV at x = 4 m + 0.1 m lever arm)
cmap = LinearSegmentedColormap.from_list('seq', ['#0b2f5c', '#2a78d6', '#9cc3ee', '#eef5fd'])
fig = plt.figure(figsize=(10, 6.6))
fig.text(0.01, 0.98, 'Perception nhận được gì: UAV ở x = 4 m (S1, seed 1); ảnh 80 × 60 px, FOV ngang 90°, tầm tối đa 15 m',
         color=INK, fontsize=11, va='top')
a1 = fig.add_axes([0.03, 0.45, 0.45, 0.45]); a2 = fig.add_axes([0.52, 0.45, 0.45, 0.45])
for ax, D, title in [(a1, Dt, 'a) depth thật (ray-casting)'), (a2, Dh, 'b) "đầu ra mạng depth" mô phỏng + phân đoạn instance')]:
    im = ax.imshow(np.ma.masked_invalid(np.where(np.isfinite(D), D, np.nan)), cmap=cmap, vmin=0, vmax=15,
                   interpolation='nearest')
    ax.set_title(title, loc='left', color=INK, fontsize=9.5); ax.set_xticks([]); ax.set_yticks([])
    for sp in ax.spines.values(): sp.set_color(GRID)
for k in [k for k in np.unique(I) if k > 0]:
    a2.contour((I == k).astype(float), levels=[0.5], colors=[INK], linewidths=0.8)
    ys, xs = np.nonzero(I == k)
    a2.text(xs.mean(), ys.max() + 2.0, f'#{k}', color=INK, fontsize=8, ha='center', va='top')
cax = fig.add_axes([0.03, 0.40, 0.45, 0.025])
cb = fig.colorbar(im, cax=cax, orientation='horizontal'); cb.outline.set_edgecolor(GRID)
cb.set_label('độ sâu [m] — trắng: không có gì trong 15 m', color=INK2)
rows = []
for row in det:
    k = int(row[0])
    rows.append([f'#{k}', f'{np.linalg.norm(W1[k - 1, :3] - cam):.1f}', f'{np.linalg.norm(row[1:4] - cam):.1f}',
                 f'{W1[k - 1, 6]:.2f}', f'{row[4]:.2f}', f'{int(row[5])}'])
rows.sort(key=lambda r: float(r[1]))
ta = fig.add_axes([0.52, 0.04, 0.45, 0.34]); ta.axis('off')
tb = ta.table(cellText=rows, colLabels=['cầu', 'k/c tâm\nthật [m]', 'k/c tâm\nđo [m]', 'bán kính\nthật [m]', 'bán kính\nđo [m]', 'số\npixel'],
              loc='upper center', cellLoc='center', bbox=[0, 0, 1, 1])
tb.auto_set_font_size(False); tb.set_fontsize(8)
for (r, c), cell in tb.get_celld().items():
    cell.set_edgecolor(GRID); cell.set_facecolor(SURF); cell.get_text().set_color(INK if r else INK2)
fig.text(0.03, 0.30, 'Các bước (mỗi lần suy luận):\n'
         '1. Ray-casting ảnh depth từ pose thật tại lúc chụp,\n    kèm nhãn instance cho từng pixel (lý tưởng).\n'
         '2. "Mạng depth" = mô hình sai số: thang đo ±4%/frame,\n    nhiễu pixel log-normal 3% + 0.4%/m, 2% outlier.\n'
         '3. Mỗi vùng instance ≥ 3 px → một hình cầu:\n    hướng trung bình, bán kính góc, trung vị khoảng cách,\n    + hiệp phương sai đo.\n'
         '4. Gắn track theo nhãn instance → Kalman tại lúc chụp.',
         color=INK2, fontsize=8, va='top', linespacing=1.4)
fig.savefig(f'{out}/perception_frame.png', dpi=160)
