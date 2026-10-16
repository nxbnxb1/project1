"""Tables of the final grid (docs/results/results.md).

Usage: python3 docs/results/final_tables.py [raw dir]   (default: docs/results/raw)

Reads every run line, FAILINFO and DENS line of the final grid logs (fsn*, fsh*, fse*: E_COV / FR_SAFE /
E_DART; fnc*: COV_NOCLUT; fcs*: camera presets 1, 2, 4 for E_COV / FR_SAFE). A collision is split into
'static' (the obstacle hit does not move: in scope) and 'mover' (a vehicle crossing the route in SH seeds
divisible by 3: outside the scope of the method, which assumes static obstacles).
"""
import collections
import glob
import math
import os
import re
import statistics as st
import sys

RAW = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), 'raw')
RUN = re.compile(r'\]\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(\w+)\s+clr\s+(-?Inf|[-\d.]+)\s+t\s+([\d.]+)'
                 r'\s+inf\s+(\d+)(?:.*?gap\s+(Inf|[\d.]+))?')
FAIL = re.compile(r'^FAILINFO\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+(.*)$')
DENS = re.compile(r'^DENS\s+(\w+)=([\d.]+)\s+(S\w+)\s+(\w+)\s+seed\s+(\d+)\s+t\s+([\d.\s]+?)\s+d\s+([\d.\s]+?)'
                  r'\s+f\s+([\d\s]+)$')
CAM = {1: 'Camera Module v2 (62×49°)', 2: 'Camera Module 3 (66×41°)', 3: 'Camera Module 3 Wide (102×67°)',
       4: 'Camera Module 3 Wide, mạng 640×360'}
VAR = ['E_COV', 'FR_SAFE', 'E_DART', 'COV_NOCLUT']
SCN = {'SN': 'Bay thường SN', 'SH': 'Kịch bản khó SH', 'SE': 'Bối cảnh siêu dễ SE'}


def decode(param, val):
    """(camera, speed, rate) of a sweep setting"""
    if param == 'camspeedrate':
        return int(val // 10000), int((val % 10000) // 100), round(val % 100) / 10
    if param == 'speedrate':
        return 3, int(val // 100), round(val % 100) / 10
    raise ValueError(param)


R, F, D = {}, {}, {}
for p in sorted(glob.glob(os.path.join(RAW, 'f*_*.log'))):
    for line in open(p, encoding='utf-8', errors='ignore'):
        line = line.strip()
        m = RUN.search(line)
        if m:
            cam, sp, f = decode(m[1], float(m[2]))
            R[(m[3], m[4], cam, sp, f, int(m[5]))] = dict(
                out=m[6], clr=float(m[7]), t=float(m[8]), inf=int(m[9]),
                gap=float(m[10]) if m[10] else float('nan'))
            continue
        m = FAIL.search(line)
        if m:
            cam, sp, f = decode(m[1], float(m[2]))
            t = m[6].split()
            F[(m[3], m[4], cam, sp, f, int(m[5]))] = {t[i]: t[i + 1] for i in range(0, len(t) - 1, 2)}
            continue
        m = DENS.search(line)
        if m:
            cam, sp, f = decode(m[1], float(m[2]))
            D[(m[3], m[4], cam, sp, f, int(m[5]))] = tuple([float(x) for x in g.split()] for g in (m[6], m[7], m[8]))


def cell(sc, v, cam=3, f=None, sp=None):
    ks = [k for k in R if k[0] == sc and k[1] == v and k[2] == cam and (f is None or k[4] == f)
          and (sp is None or k[3] == sp)]
    c = collections.Counter(R[k]['out'] for k in ks)
    mov = sum(1 for k in ks if R[k]['out'] == 'collision' and F.get(k, {}).get('dyn') == '1')
    gk = [k for k in ks if R[k]['out'] == 'goal']
    return dict(n=len(ks), goal=c['goal'], coll_static=c['collision'] - mov, coll_mover=mov, stuck=c['stuck'],
                inf=st.median(R[k]['inf'] for k in gk) if gk else float('nan'),
                fps=st.mean(R[k]['inf'] / max(R[k]['t'], 1e-6) for k in ks) if ks else float('nan'),
                t=st.median(R[k]['t'] for k in gk) if gk else float('nan'),
                gap=min((R[k]['gap'] for k in ks if R[k]['gap'] == R[k]['gap']), default=float('nan')))


def rates(sc, v, cam=3):
    return sorted({k[4] for k in R if k[0] == sc and k[1] == v and k[2] == cam})


def pct(a, n):
    return f'{100 * a / n:.1f} %' if n else '-'


def fisher(a, n1, b, n2):
    """two-sided Fisher exact test of a / n1 against b / n2"""
    K, N = a + b, n1 + n2
    pr = lambda x: math.comb(K, x) * math.comb(N - K, n1 - x) / math.comb(N, n1)
    p0 = pr(a)
    return min(1.0, sum(pr(x) for x in range(max(0, K - n2), min(K, n1) + 1) if pr(x) <= p0 * (1 + 1e-9)))


def pooled(sc, v, cam=3, fmin=1.5, sp=None):
    cs = [cell(sc, v, cam, f, sp) for f in rates(sc, v, cam) if f >= fmin]
    return sum(c['n'] for c in cs), sum(c['coll_static'] for c in cs), sum(c['stuck'] for c in cs)


out = []
P = out.append
n_runs = len(R)
viol = sum(1 for k, r in R.items() if r['gap'] == r['gap'] and r['gap'] < 1 / k[4] - 0.011)
P(f'Số lượt đọc được: {n_runs}. Lượt có hai lần chụp gần nhau hơn 1/f_max (dung sai một bước điều khiển 10 ms): {viol}.\n')

# ---- main rate sweep: one table per scenario
for sc in ['SN', 'SH', 'SE']:
    vs = [v for v in VAR if any(k[0] == sc and k[1] == v and k[2] == 3 for k in R)]
    if not vs:
        continue
    n0 = cell(sc, vs[0], 3, rates(sc, vs[0])[0])['n']
    P(f'### {SCN[sc]} ({n0} lượt mỗi ô: thế giới × 3 tốc độ 6 / 10 / 15 m/s)\n')
    P('Mỗi ô: va chạm với vật tĩnh / kẹt / suy luận mỗi nhiệm vụ (trung vị, lượt tới đích).'
      + (' Va chạm với xe đang chạy (ngoài phạm vi) ghi riêng ở cột cuối.' if sc == 'SH' else '') + '\n')
    head = '| f_max [Hz] | ' + ' | '.join(vs) + (' | xe đang chạy (' + ' / '.join(vs) + ')' if sc == 'SH' else '') + ' |'
    P(head)
    P('|---|' + '---|' * (len(vs) + (1 if sc == 'SH' else 0)))
    for f in rates(sc, vs[0]):
        cs = [cell(sc, v, 3, f) for v in vs]
        row = f'| {f:g} | ' + ' | '.join(f"{c['coll_static']} / {c['stuck']} / {c['inf']:.0f}" for c in cs)
        if sc == 'SH':
            row += ' | ' + ' / '.join(str(c['coll_mover']) for c in cs)
        P(row + ' |')
    P('')

# ---- pooled over 1.5-5 Hz (the useful range) and the 3 Hz default
P('### Tổng hợp theo phương án\n')
P('| kịch bản | phương án | 3 Hz: va chạm tĩnh / kẹt / suy luận | 1.5–5 Hz gộp: va chạm tĩnh | 1.5–5 Hz gộp: kẹt '
  '| 1.5–5 Hz gộp: khung/s trung bình |')
P('|---|---|---|---|---|---|')
for sc in ['SN', 'SH', 'SE']:
    for v in VAR:
        if not any(k[0] == sc and k[1] == v and k[2] == 3 for k in R):
            continue
        c3 = cell(sc, v, 3, 3.0)
        cs = [cell(sc, v, 3, f) for f in rates(sc, v) if f >= 1.5]
        n = sum(c['n'] for c in cs)
        cst = sum(c['coll_static'] for c in cs)
        stk = sum(c['stuck'] for c in cs)
        fps = sum(c['fps'] * c['n'] for c in cs) / max(n, 1)
        P(f"| {sc} | {v} | {c3['coll_static']} / {c3['stuck']} / {c3['inf']:.0f} (của {c3['n']}) "
          f"| {cst} / {n} ({pct(cst, n)}) | {stk} / {n} ({pct(stk, n)}) | {fps:.2f} |")
P('')

# ---- pairwise comparisons (Fisher exact test), pooled over 1.5-5 Hz
P('### So sánh từng cặp (1.5–5 Hz gộp, kiểm định Fisher hai phía)\n')
P('| kịch bản | so sánh | va chạm tĩnh | p | kẹt | p | suy luận E_COV / phương án kia (lượt cả hai tới đích, 3 Hz) |')
P('|---|---|---|---|---|---|---|')
for sc in ['SN', 'SH', 'SE']:
    for w in ['FR_SAFE', 'E_DART', 'COV_NOCLUT']:
        if not any(k[0] == sc and k[1] == w for k in R):
            continue
        n1, c1, s1 = pooled(sc, 'E_COV')
        n2, c2, s2 = pooled(sc, w)
        a = b = 0
        for k in R:
            if k[0] == sc and k[1] == 'E_COV' and k[2] == 3 and k[4] == 3.0:
                k2 = (sc, w, 3, k[3], 3.0, k[5])
                if k2 in R and R[k]['out'] == 'goal' and R[k2]['out'] == 'goal':
                    a += R[k]['inf']; b += R[k2]['inf']
        P(f'| {sc} | E_COV – {w} | {pct(c1, n1)} – {pct(c2, n2)} | {fisher(c1, n1, c2, n2):.2g} '
          f'| {pct(s1, n1)} – {pct(s2, n2)} | {fisher(s1, n1, s2, n2):.2g} | {a / max(b, 1):.2f} |')
P('')

# ---- inferences of E_COV relative to FR_SAFE, per maximum rate
P('### Suy luận của E_COV so với FR_SAFE theo trần tần số\n')
P('Tổng số suy luận của E_COV chia cho của FR_SAFE, trên các lượt mà cả hai cùng tới đích (cùng thế giới, tốc độ, trần).\n')
P('| kịch bản | ' + ' | '.join(f'{f:g} Hz' for f in rates('SN', 'E_COV')) + ' |')
P('|---|' + '---|' * len(rates('SN', 'E_COV')))
for sc in ['SN', 'SH', 'SE']:
    row = []
    for f in rates(sc, 'E_COV'):
        a = b = 0
        for k in R:
            if k[:3] == (sc, 'E_COV', 3) and k[4] == f:
                k2 = (sc, 'FR_SAFE', 3, k[3], f, k[5])
                if k2 in R and R[k]['out'] == 'goal' and R[k2]['out'] == 'goal':
                    a += R[k]['inf']; b += R[k2]['inf']
        row.append(f'{a / max(b, 1):.2f}')
    P(f'| {sc} | ' + ' | '.join(row) + ' |')
P('')

# ---- about the same compute: E_COV at f_max = 2 f against FR_SAFE at f
P('### Cùng ngân sách tính toán xấp xỉ: E_COV ở trần 2f so với FR_SAFE ở f\n')
P('Mỗi ô: suy luận mỗi nhiệm vụ (trung bình, lượt tới đích) / va chạm tĩnh / kẹt. Dòng cuối mỗi kịch bản gộp bốn cặp; '
  'p: Fisher hai phía trên số lượt thất bại (va chạm tĩnh + kẹt).\n')
P('| kịch bản | E_COV trần | FR_SAFE trần | E_COV | FR_SAFE | p |')
P('|---|---|---|---|---|---|')
for sc in ['SN', 'SH', 'SE']:
    tot = [0] * 6
    for fa, fb in [(2, 1), (3, 1.5), (4, 2), (5, 2.5)]:
        ca, cb = cell(sc, 'E_COV', 3, fa), cell(sc, 'FR_SAFE', 3, fb)
        ia = [R[k]['inf'] for k in R if k[:3] == (sc, 'E_COV', 3) and k[4] == fa and R[k]['out'] == 'goal']
        ib = [R[k]['inf'] for k in R if k[:3] == (sc, 'FR_SAFE', 3) and k[4] == fb and R[k]['out'] == 'goal']
        P(f"| {sc} | {fa:g} Hz | {fb:g} Hz | {st.mean(ia):.0f} / {ca['coll_static']} / {ca['stuck']} (của {ca['n']}) "
          f"| {st.mean(ib):.0f} / {cb['coll_static']} / {cb['stuck']} (của {cb['n']}) "
          f"| {fisher(ca['coll_static'] + ca['stuck'], ca['n'], cb['coll_static'] + cb['stuck'], cb['n']):.2g} |")
        tot = [tot[0] + ca['coll_static'], tot[1] + ca['stuck'], tot[2] + ca['n'],
               tot[3] + cb['coll_static'], tot[4] + cb['stuck'], tot[5] + cb['n']]
    P(f'| {sc} | gộp | gộp | {tot[0]} / {tot[1]} (của {tot[2]}) | {tot[3]} / {tot[4]} (của {tot[5]}) '
      f'| {fisher(tot[0] + tot[1], tot[2], tot[3] + tot[4], tot[5]):.2g} |')
P('')

# ---- requested speed, pooled over 1.5-5 Hz
P('### Theo tốc độ yêu cầu (1.5–5 Hz gộp)\n')
P('Mỗi ô: va chạm tĩnh (tỉ lệ) / kẹt / thời gian tới đích trung vị [s].\n')
P('| kịch bản | phương án | 6 m/s | 10 m/s | 15 m/s |')
P('|---|---|---|---|---|')
for sc in ['SN', 'SH', 'SE']:
    for v in VAR:
        if not any(k[0] == sc and k[1] == v and k[2] == 3 for k in R):
            continue
        row = []
        for sp in [6, 10, 15]:
            n, c, s_ = pooled(sc, v, sp=sp)
            tg = [R[k]['t'] for k in R if k[0] == sc and k[1] == v and k[2] == 3 and k[3] == sp and k[4] >= 1.5
                  and R[k]['out'] == 'goal']
            row.append(f'{pct(c, n)} / {s_} / {st.median(tg):.1f}' if tg else '-')
        P(f'| {sc} | {v} | ' + ' | '.join(row) + ' |')
P('')

# ---- where the static collisions are: number of worlds involved
P('### Va chạm tĩnh trải trên bao nhiêu thế giới (f_max ≥ 1.5 Hz, camera mặc định, mọi phương án)\n')
P('| kịch bản | số thế giới | thế giới có ≥ 1 va chạm tĩnh | 5 thế giới nhiều nhất (seed: số va chạm) |')
P('|---|---|---|---|')
for sc in ['SN', 'SH', 'SE']:
    ks = [k for k in R if k[0] == sc and k[2] == 3 and k[4] >= 1.5]
    cc = collections.Counter(k[5] for k in ks if R[k]['out'] == 'collision' and F.get(k, {}).get('dyn') != '1')
    P(f"| {sc} | {len({k[5] for k in ks})} | {len(cc)} | " + ', '.join(f'{a}: {b}' for a, b in cc.most_common(5)) + ' |')
P('')

# ---- speed and frame rate by local density, 3 Hz, requested 15 m/s
if D:
    P('### Tốc độ và tần số chụp theo mật độ vật cản (3 Hz, yêu cầu 15 m/s, mọi lượt gộp)\n')
    P('Mỗi ô: tỉ lệ thời gian, tốc độ trung bình [m/s], khung/s, theo số vật trong bán kính 15 m.\n')
    P('| kịch bản | phương án | 0 vật | 1–2 vật | 3–5 vật | ≥ 6 vật |')
    P('|---|---|---|---|---|---|')
    for sc in ['SE', 'SN', 'SH']:
        for v in ['E_COV', 'FR_SAFE', 'E_DART', 'COV_NOCLUT']:
            ks = [k for k in D if k[0] == sc and k[1] == v and k[2] == 3 and k[4] == 3.0 and k[3] == 15]
            if not ks:
                continue
            T = [sum(D[k][0][b] for k in ks) for b in range(4)]
            Dd = [sum(D[k][1][b] for k in ks) for b in range(4)]
            Fr = [sum(D[k][2][b] for k in ks) for b in range(4)]
            tot = max(sum(T), 1e-9)
            P(f'| {sc} | {v} | ' + ' | '.join(
                f'{100 * T[b] / tot:.0f} %, {Dd[b] / T[b]:.1f}, {Fr[b] / T[b]:.2f}' if T[b] > 0 else '-'
                for b in range(4)) + ' |')
    P('')

# ---- collisions: what was hit
P('### Va chạm: với vật gì, ở đâu (f_max ≥ 1.5 Hz, mọi phương án, camera mặc định)\n')
P('| kịch bản | va chạm | vật tĩnh | xe đang chạy | vật tĩnh: khối hộp / khối cầu / khối trụ '
  '| vật tĩnh: có trong ảnh chụp gần nhất | vật tĩnh: lúc đang vòng tránh '
  '| vật tĩnh: tốc độ / tốc độ lao vào vật lúc va chạm (trung vị) [m/s] |')
P('|---|---|---|---|---|---|---|---|')
for sc in ['SN', 'SH', 'SE']:
    ks = [k for k in F if k[0] == sc and k[2] == 3 and k[4] >= 1.5 and R.get(k, {}).get('out') == 'collision']
    inlast = sum(1 for k in ks if F[k].get('dyn') == '0' and float(F[k]['seen']) <= 1 / k[4] + 0.1)
    stt = [F[k] for k in ks if F[k].get('dyn') == '0']
    mov = len(ks) - len(stt)
    shp = collections.Counter(d.get('shape') for d in stt)
    P(f"| {sc} | {len(ks)} | {len(stt)} | {mov} | {shp['box']} / {shp['sphere']} / {shp['cylinder']} "
      f"| {inlast} | {sum(d.get('mode') == '2' for d in stt)} "
      f"| {st.median(float(d['speed']) for d in stt):.1f} / {st.median(float(d['closing']) for d in stt):.1f} |")
P('')

# ---- cameras on the rate grid
cams = sorted({k[2] for k in R if k[2] != 3})
if cams:
    P('### Camera (E_COV và FR_SAFE gộp; 1.5–5 Hz gộp và riêng 3 Hz)\n')
    P('| kịch bản | camera | 1.5–5 Hz: va chạm tĩnh | 1.5–5 Hz: kẹt | 1.5–5 Hz: tới đích | 3 Hz: va chạm tĩnh / kẹt '
      '| suy luận mỗi nhiệm vụ (3 Hz, E_COV) | thời gian tới đích (3 Hz, E_COV) [s] |')
    P('|---|---|---|---|---|---|---|---|')
    for sc in ['SN', 'SH', 'SE']:
        for cam in [1, 2, 3, 4]:
            cs = [cell(sc, v, cam, f) for v in ['E_COV', 'FR_SAFE'] for f in rates(sc, v, cam) if f >= 1.5]
            if not cs or not sum(c['n'] for c in cs):
                continue
            n = sum(c['n'] for c in cs)
            c3 = [cell(sc, v, cam, 3.0) for v in ['E_COV', 'FR_SAFE']]
            e3 = cell(sc, 'E_COV', cam, 3.0)
            P(f"| {sc} | {CAM[cam]} | {sum(c['coll_static'] for c in cs)} / {n} ({pct(sum(c['coll_static'] for c in cs), n)}) "
              f"| {sum(c['stuck'] for c in cs)} | {sum(c['goal'] for c in cs)} / {n} "
              f"| {sum(c['coll_static'] for c in c3)} / {sum(c['stuck'] for c in c3)} (của {sum(c['n'] for c in c3)}) "
              f"| {e3['inf']:.0f} | {e3['t']:.1f} |")
    P('')

# ---- cameras: by maximum rate, E_COV against FR_SAFE, by requested speed
if cams:
    def cpool(sc, cam, vs=('E_COV', 'FR_SAFE'), fs=None, sp=None):
        ks = [k for k in R if k[0] == sc and k[2] == cam and k[1] in vs and (fs is None or k[4] in fs)
              and (sp is None or k[3] == sp)]
        cs = sum(R[k]['out'] == 'collision' and F.get(k, {}).get('dyn') != '1' for k in ks)
        stk = sum(R[k]['out'] == 'stuck' for k in ks)
        gi = [R[k]['inf'] for k in ks if R[k]['out'] == 'goal']
        tg = [R[k]['t'] for k in ks if R[k]['out'] == 'goal']
        fps = st.mean(R[k]['inf'] / max(R[k]['t'], 1e-6) for k in ks) if ks else float('nan')
        return len(ks), cs, stk, (st.median(gi) if gi else float('nan')), (st.median(tg) if tg else float('nan')), fps
    FS = [f for f in rates('SN', 'E_COV') if f >= 1.5]
    ALL = rates('SN', 'E_COV')
    P('### Camera theo trần tần số (E_COV và FR_SAFE gộp): tỉ lệ va chạm tĩnh\n')
    P('| kịch bản | camera | ' + ' | '.join(f'{f:g} Hz' for f in ALL) + ' | FR_SAFE ở 5 Hz: khung/s thật |')
    P('|---|---|' + '---|' * (len(ALL) + 1))
    for sc in ['SN', 'SH', 'SE']:
        for cam in [1, 2, 3, 4]:
            row = []
            for f in ALL:
                n, cs, *_ = cpool(sc, cam, fs=[f])
                row.append(pct(cs, n))
            P(f'| {sc} | {CAM[cam]} | ' + ' | '.join(row) + f' | {cpool(sc, cam, ("FR_SAFE",), [5.0])[5]:.2f} |')
    P('')
    P('### Camera: E_COV so với FR_SAFE (1.5–5 Hz gộp)\n')
    P('Mỗi ô: va chạm tĩnh (tỉ lệ) / kẹt / suy luận mỗi nhiệm vụ (trung vị, lượt tới đích) / khung/s trung bình. '
      'p: Fisher hai phía trên va chạm tĩnh.\n')
    P('| kịch bản | camera | E_COV | FR_SAFE | p | thời gian tới đích E_COV / FR_SAFE (trung vị) [s] |')
    P('|---|---|---|---|---|---|')
    for sc in ['SN', 'SH', 'SE']:
        for cam in [1, 2, 3, 4]:
            a_ = cpool(sc, cam, ('E_COV',), FS); b_ = cpool(sc, cam, ('FR_SAFE',), FS)
            P(f'| {sc} | {CAM[cam]} | {pct(a_[1], a_[0])} / {a_[2]} / {a_[3]:.0f} / {a_[5]:.2f} '
              f'| {pct(b_[1], b_[0])} / {b_[2]} / {b_[3]:.0f} / {b_[5]:.2f} | {fisher(a_[1], a_[0], b_[1], b_[0]):.2g} '
              f'| {a_[4]:.1f} / {b_[4]:.1f} |')
    P('')
    P('### Camera theo tốc độ yêu cầu (E_COV và FR_SAFE gộp, 1.5–5 Hz)\n')
    P('Mỗi ô: va chạm tĩnh (tỉ lệ) / kẹt / thời gian tới đích trung vị [s].\n')
    P('| kịch bản | camera | 6 m/s | 10 m/s | 15 m/s | so với Module 3 Wide: p (va chạm tĩnh, mọi tốc độ) |')
    P('|---|---|---|---|---|---|')
    for sc in ['SN', 'SH', 'SE']:
        d_ = cpool(sc, 3, fs=FS)
        for cam in [1, 2, 3, 4]:
            row = []
            for sp in [6, 10, 15]:
                n, cs, stk, _, tg, _ = cpool(sc, cam, fs=FS, sp=sp)
                row.append(f'{pct(cs, n)} / {stk} / {tg:.1f}')
            c_ = cpool(sc, cam, fs=FS)
            pv = '-' if cam == 3 else f'{fisher(c_[1], c_[0], d_[1], d_[0]):.2g}'
            P(f'| {sc} | {CAM[cam]} | ' + ' | '.join(row) + f' | {pv} |')
    P('')

# ---- SE: which everyday scene, by camera
SEL = ['bãi trống', 'một cây', 'đại lộ hàng cây', 'xe đỗ + xe tải', 'dãy nhà ven đường', 'khe phố']
if any(k[0] == 'SE' for k in R):
    P('### SE theo loại cảnh và camera (E_COV và FR_SAFE gộp, 1.5–5 Hz)\n')
    P('Mỗi ô: va chạm / kẹt (của 240 lượt: 5 thế giới × 3 tốc độ × 8 trần tần số × 2 phương án).\n')
    P('| camera | ' + ' | '.join(SEL) + ' |')
    P('|---|' + '---|' * len(SEL))
    for cam in [1, 2, 3, 4]:
        row = []
        for L in range(6):
            ks = [k for k in R if k[0] == 'SE' and k[2] == cam and k[4] >= 1.5 and k[1] in ('E_COV', 'FR_SAFE')
                  and (k[5] - 1) % 6 == L]
            row.append(f"{sum(R[k]['out'] == 'collision' for k in ks)} / {sum(R[k]['out'] == 'stuck' for k in ks)}")
        P(f'| {CAM[cam]} | ' + ' | '.join(row) + ' |')
    P('')

print('\n'.join(out))
