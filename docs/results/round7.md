# Round 7 — synchronized test grid (commit 95e551f)

**Current results.** One grid for every case: the same worlds, requested speeds and variants, all
runs on one commit. The algorithm is the one of round 6 (commit 4a1fcfa: coverage scheduler with
ray-carved free space and a 3 Hz budget); 95e551f only adds the per-run density profile (DENS lines,
`experiments/dart_density_profile.m`). Round 6 and the first clutter-limit checks are archived in
[`../archive/results/round6.md`](../archive/results/round6.md); they agree with this round.

Scope and benchmark: large static obstacles only (trees with low canopies, bushes, buildings,
vehicles / containers, rocks); physical limits from the quadrotor model (T/W 2.4, thrust reserve
40 %, tilt 46 deg, braking 6.2 m/s^2, terminal speed 16.7 m/s, v_max 15 m/s or the camera-view
limit). Default camera: Raspberry Pi Camera Module 3 Wide, 102 x 67 deg, network input 320 x 180,
80 ms inference. MATLAB engine, no time limit (a run ends at the goal, in a collision, or stuck =
less than 1 m of progress along the set path in 60 s).

| part | scenario | worlds (seeds) | requested speed [m/s] | variants | camera | runs |
|---|---|---|---|---|---|---|
| main | SN normal flight | 1-60 | 6, 10, 15 | E_COV, COVB1, COV_NOCLUT, FR_SAFE_3, FR_SAFE_1, E_DART | Module 3 Wide | 1080 |
| main | SH hard set | 1-30 | 6, 10, 15 | same 6 | Module 3 Wide | 540 |
| camera | SN | 1-60 | 6, 10, 15 | E_COV, FR_SAFE_3 | v2, Module 3, Module 3 Wide 640x360 | 1080 |
| camera | SH | 1-30 | 6, 10, 15 | E_COV, FR_SAFE_3 | same 3 | 540 |

The Module 3 Wide rows of the camera study are the main-grid runs (same worlds, speeds, variants).
SN: 300 m route in zones of 40-80 m, 35 % open / 40 % sparse (1-3 objects) / 25 % dense (6-12
objects), gaps >= 3.5 m. SH: every zone dense, fog (visibility 200 m) in odd seeds, two vehicles
crossing the path in seeds divisible by 3 (movers are outside the method's scope).

Variants: **E_COV** coverage scheduler (frame when the planned path up to the stopping distance is
not inside the observed free space; at most 3 frames/s) — the proposed method; COVB1 the same with a
1 Hz budget; COV_NOCLUT without the clutter speed limit; FR_SAFE_3 / FR_SAFE_1 fixed 3 / 1 Hz with
the same safety layers; E_DART the risk-adaptive scheduler.

CI runs: 38107567934, 38107571259, 38107574445 (SN), 38107577670, 38107580521, 38107583318 (SH),
38107586127, 38107588967 (camera SN), 38107591575, 38107594285 (camera SH). Raw logs: `raw/r8*`.
Tables: `python3 parse_results.py 'raw/r8[abc]_*.log'` (SN), `'raw/r8h[123]_*.log'` (SH),
`'raw/r8*_*.log'` (camera summary), `'raw/r8c[sh]*_*.log'` (camera details). Significance:
two-sided Fisher exact test.

## Main grid

### Normal flight SN (60 worlds per cell)

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | speed=6 | 60 | 57 (95% [86, 98]) | 0 | 3 | 64.3 | 100 | 1.43 | 1.38 |
| E_COV | speed=10 | 60 | 56 (93% [84, 97]) | 0 | 4 | 44.0 | 75 | 1.60 | 1.60 |
| E_COV | speed=15 | 60 | 58 (97% [89, 99]) | 1 | 1 | 40.0 | 74 | 1.82 | 1.74 |
| COVB1 | speed=6 | 60 | 55 (92% [82, 96]) | 0 | 5 | 76.9 | 51 | 0.62 | 1.56 |
| COVB1 | speed=10 | 60 | 55 (92% [82, 96]) | 0 | 5 | 52.2 | 40 | 0.71 | 1.67 |
| COVB1 | speed=15 | 60 | 50 (83% [72, 91]) | 7 | 3 | 46.2 | 39 | 0.80 | 1.57 |
| COV_NOCLUT | speed=6 | 60 | 57 (95% [86, 98]) | 0 | 3 | 65.6 | 97 | 1.35 | 1.33 |
| COV_NOCLUT | speed=10 | 60 | 60 (100% [94, 100]) | 0 | 0 | 43.4 | 72 | 1.60 | 1.64 |
| COV_NOCLUT | speed=15 | 60 | 59 (98% [91, 100]) | 1 | 0 | 37.5 | 70 | 1.83 | 2.04 |
| FR_SAFE_3 | speed=6 | 60 | 60 (100% [94, 100]) | 0 | 0 | 63.9 | 188 | 2.95 | 1.22 |
| FR_SAFE_3 | speed=10 | 60 | 59 (98% [91, 100]) | 0 | 1 | 44.8 | 132 | 2.95 | 1.60 |
| FR_SAFE_3 | speed=15 | 60 | 60 (100% [94, 100]) | 0 | 0 | 39.5 | 116 | 2.95 | 1.80 |
| FR_SAFE_1 | speed=6 | 60 | 57 (95% [86, 98]) | 0 | 3 | 72.7 | 73 | 1.01 | 1.59 |
| FR_SAFE_1 | speed=10 | 60 | 52 (87% [76, 93]) | 4 | 4 | 51.6 | 52 | 1.01 | 1.67 |
| FR_SAFE_1 | speed=15 | 60 | 55 (92% [82, 96]) | 3 | 2 | 47.4 | 48 | 1.01 | 1.60 |
| E_DART | speed=6 | 60 | 58 (97% [89, 99]) | 0 | 2 | 60.2 | 130 | 2.22 | 1.27 |
| E_DART | speed=10 | 60 | 60 (100% [94, 100]) | 0 | 0 | 40.8 | 145 | 3.37 | 1.33 |
| E_DART | speed=15 | 60 | 56 (93% [84, 97]) | 4 | 0 | 36.0 | 172 | 4.54 | 1.40 |

#### SN: flown speed and perception rate by local obstacle density

Each cell: share of the flight time, mean speed [m/s], frames per second, for the time spent with 0 / 1-2 / 3-5 / >= 6 distinct objects within 15 m of the vehicle (all runs of the cell pooled).

| scenario | variant | setting | 0: time share, speed [m/s], frames/s | 1-2: time share, speed [m/s], frames/s | 3-5: time share, speed [m/s], frames/s | >=6: time share, speed [m/s], frames/s |
|---|---|---|---|---|---|---|
| SN | E_COV | speed=6 | 29%, 5.7, 1.01 | 30%, 5.3, 1.49 | 30%, 3.2, 1.83 | 11%, 2.1, 1.70 |
| SN | E_COV | speed=10 | 26%, 9.2, 1.35 | 31%, 7.8, 1.66 | 30%, 4.0, 1.95 | 13%, 1.8, 1.32 |
| SN | E_COV | speed=15 | 27%, 11.0, 1.75 | 38%, 7.8, 1.67 | 30%, 4.1, 1.94 | 6%, 2.7, 1.83 |
| SN | COVB1 | speed=6 | 24%, 5.7, 0.49 | 30%, 4.8, 0.63 | 33%, 2.7, 0.72 | 13%, 1.3, 0.71 |
| SN | COVB1 | speed=10 | 20%, 9.2, 0.75 | 30%, 6.4, 0.70 | 40%, 2.6, 0.68 | 10%, 1.7, 0.64 |
| SN | COVB1 | speed=15 | 22%, 10.6, 0.87 | 29%, 7.7, 0.74 | 37%, 3.2, 0.75 | 12%, 1.8, 0.67 |
| SN | COV_NOCLUT | speed=6 | 30%, 5.7, 1.00 | 32%, 5.3, 1.45 | 28%, 3.3, 1.59 | 9%, 2.1, 1.45 |
| SN | COV_NOCLUT | speed=10 | 28%, 9.2, 1.32 | 36%, 7.2, 1.61 | 28%, 4.7, 1.79 | 8%, 2.3, 1.87 |
| SN | COV_NOCLUT | speed=15 | 33%, 11.0, 1.69 | 41%, 8.7, 1.70 | 23%, 5.7, 2.25 | 4%, 4.2, 2.27 |
| SN | FR_SAFE_3 | speed=6 | 34%, 5.7, 2.96 | 37%, 5.4, 2.94 | 22%, 4.6, 2.95 | 6%, 3.2, 2.95 |
| SN | FR_SAFE_3 | speed=10 | 31%, 9.2, 2.98 | 36%, 7.7, 2.93 | 28%, 4.8, 2.96 | 6%, 3.2, 2.91 |
| SN | FR_SAFE_3 | speed=15 | 30%, 11.0, 2.98 | 39%, 8.4, 2.94 | 26%, 5.4, 2.95 | 5%, 3.1, 2.94 |
| SN | FR_SAFE_1 | speed=6 | 27%, 5.7, 1.02 | 31%, 5.1, 1.00 | 34%, 2.9, 1.00 | 8%, 2.0, 0.99 |
| SN | FR_SAFE_1 | speed=10 | 23%, 9.1, 1.03 | 29%, 7.3, 1.00 | 40%, 3.0, 1.00 | 9%, 2.5, 0.99 |
| SN | FR_SAFE_1 | speed=15 | 23%, 10.4, 1.03 | 31%, 7.6, 1.01 | 38%, 3.1, 1.00 | 8%, 1.9, 1.02 |
| SN | E_DART | speed=6 | 34%, 5.7, 1.04 | 35%, 5.5, 2.44 | 27%, 3.8, 3.42 | 4%, 3.8, 5.02 |
| SN | E_DART | speed=10 | 32%, 9.2, 1.54 | 37%, 7.8, 3.77 | 27%, 5.6, 5.05 | 5%, 3.9, 6.32 |
| SN | E_DART | speed=15 | 31%, 11.2, 3.87 | 38%, 8.5, 4.61 | 26%, 5.8, 5.10 | 5%, 5.1, 5.99 |

### Hard set SH (30 worlds per cell)

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | speed=6 | 30 | 27 (90% [74, 97]) | 1 | 2 | 128.3 | 199 | 1.60 | 1.10 |
| E_COV | speed=10 | 30 | 26 (87% [70, 95]) | 0 | 4 | 95.4 | 142 | 1.53 | 1.25 |
| E_COV | speed=15 | 30 | 27 (90% [74, 97]) | 2 | 1 | 67.9 | 123 | 1.85 | 1.16 |
| COVB1 | speed=6 | 30 | 17 (57% [39, 73]) | 3 | 10 | 139.9 | 89 | 0.68 | 0.89 |
| COVB1 | speed=10 | 30 | 22 (73% [56, 86]) | 4 | 4 | 107.0 | 80 | 0.75 | 0.92 |
| COVB1 | speed=15 | 30 | 19 (63% [46, 78]) | 6 | 5 | 114.8 | 75 | 0.74 | 0.87 |
| COV_NOCLUT | speed=6 | 30 | 23 (77% [59, 88]) | 3 | 4 | 113.7 | 185 | 1.62 | 0.93 |
| COV_NOCLUT | speed=10 | 30 | 25 (83% [66, 93]) | 3 | 2 | 70.4 | 136 | 1.77 | 1.10 |
| COV_NOCLUT | speed=15 | 30 | 23 (77% [59, 88]) | 6 | 1 | 61.6 | 112 | 1.79 | 1.12 |
| FR_SAFE_3 | speed=6 | 30 | 29 (97% [83, 99]) | 1 | 0 | 98.7 | 291 | 2.94 | 1.00 |
| FR_SAFE_3 | speed=10 | 30 | 30 (100% [89, 100]) | 0 | 0 | 79.3 | 234 | 2.95 | 1.05 |
| FR_SAFE_3 | speed=15 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.5 | 193 | 2.95 | 1.23 |
| FR_SAFE_1 | speed=6 | 30 | 24 (80% [63, 90]) | 2 | 4 | 145.7 | 146 | 1.00 | 1.03 |
| FR_SAFE_1 | speed=10 | 30 | 24 (80% [63, 90]) | 4 | 2 | 107.0 | 108 | 1.01 | 0.95 |
| FR_SAFE_1 | speed=15 | 30 | 22 (73% [56, 86]) | 6 | 2 | 122.9 | 124 | 1.01 | 0.60 |
| E_DART | speed=6 | 30 | 27 (90% [74, 97]) | 2 | 1 | 92.0 | 314 | 3.68 | 0.92 |
| E_DART | speed=10 | 30 | 26 (87% [70, 95]) | 4 | 0 | 60.5 | 308 | 5.01 | 1.00 |
| E_DART | speed=15 | 30 | 27 (90% [74, 97]) | 3 | 0 | 58.3 | 297 | 5.16 | 1.07 |

#### SH: flown speed and perception rate by local obstacle density

| scenario | variant | setting | 0: time share, speed [m/s], frames/s | 1-2: time share, speed [m/s], frames/s | 3-5: time share, speed [m/s], frames/s | >=6: time share, speed [m/s], frames/s |
|---|---|---|---|---|---|---|
| SH | E_COV | speed=6 | 2%, 4.3, 1.23 | 13%, 4.8, 1.24 | 60%, 3.4, 1.64 | 24%, 2.7, 1.44 |
| SH | E_COV | speed=10 | 3%, 5.9, 1.52 | 18%, 6.9, 1.49 | 62%, 3.7, 1.49 | 18%, 2.6, 1.32 |
| SH | E_COV | speed=15 | 3%, 6.1, 1.65 | 22%, 7.3, 1.73 | 59%, 4.5, 1.88 | 16%, 3.2, 1.98 |
| SH | COVB1 | speed=6 | 2%, 4.2, 0.86 | 9%, 5.0, 0.69 | 61%, 2.6, 0.68 | 29%, 1.7, 0.65 |
| SH | COVB1 | speed=10 | 2%, 5.3, 0.91 | 13%, 6.2, 0.70 | 62%, 3.3, 0.71 | 23%, 2.0, 0.71 |
| SH | COVB1 | speed=15 | 2%, 5.6, 0.90 | 13%, 7.2, 0.75 | 62%, 3.3, 0.71 | 23%, 2.0, 0.68 |
| SH | COV_NOCLUT | speed=6 | 2%, 4.0, 1.44 | 12%, 5.3, 1.28 | 65%, 3.2, 1.47 | 21%, 3.3, 1.92 |
| SH | COV_NOCLUT | speed=10 | 3%, 5.6, 1.63 | 19%, 6.6, 1.47 | 58%, 4.8, 1.86 | 21%, 3.1, 1.71 |
| SH | COV_NOCLUT | speed=15 | 4%, 6.9, 1.69 | 26%, 8.6, 1.71 | 51%, 4.9, 1.80 | 20%, 2.5, 1.55 |
| SH | FR_SAFE_3 | speed=6 | 3%, 4.2, 3.11 | 16%, 5.4, 2.95 | 58%, 4.2, 2.94 | 23%, 3.1, 2.93 |
| SH | FR_SAFE_3 | speed=10 | 3%, 5.7, 3.15 | 21%, 6.2, 2.93 | 59%, 4.8, 2.95 | 17%, 3.6, 2.94 |
| SH | FR_SAFE_3 | speed=15 | 3%, 6.9, 3.15 | 23%, 7.4, 2.93 | 55%, 4.8, 2.95 | 19%, 3.5, 2.93 |
| SH | FR_SAFE_1 | speed=6 | 2%, 4.2, 1.16 | 15%, 4.1, 1.00 | 64%, 2.6, 1.00 | 19%, 2.4, 0.99 |
| SH | FR_SAFE_1 | speed=10 | 2%, 5.6, 1.28 | 12%, 6.9, 0.96 | 65%, 3.2, 1.01 | 21%, 2.3, 1.00 |
| SH | FR_SAFE_1 | speed=15 | 2%, 5.8, 1.27 | 15%, 6.3, 0.99 | 57%, 3.2, 1.01 | 26%, 1.8, 0.99 |
| SH | E_DART | speed=6 | 3%, 4.3, 1.26 | 14%, 5.2, 2.61 | 59%, 4.4, 4.06 | 25%, 3.3, 4.14 |
| SH | E_DART | speed=10 | 4%, 6.0, 2.24 | 19%, 7.6, 4.18 | 60%, 5.7, 5.13 | 18%, 5.1, 5.70 |
| SH | E_DART | speed=15 | 3%, 5.7, 2.55 | 20%, 7.7, 4.65 | 60%, 5.6, 5.00 | 17%, 5.3, 6.24 |

## Camera study

Pooled over the requested speeds 6 / 10 / 15 m/s (Module 3 Wide = the main-grid runs of the same variants):

| scenario | variant | camera | n | goal | collision | stuck | inferences per mission (goal), median | time to goal, median [s] |
|---|---|---|---|---|---|---|---|---|
| SH | E_COV | v2 62x49 | 90 | 38 | 24 | 28 | 187 | 125.0 |
| SH | E_COV | cm3 66x41 | 90 | 39 | 26 | 25 | 175 | 117.0 |
| SH | E_COV | cm3w 102x67 | 90 | 80 | 3 | 7 | 159 | 91.5 |
| SH | E_COV | cm3w 640x360 | 90 | 72 | 7 | 11 | 152 | 85.2 |
| SH | FR_SAFE_3 | v2 62x49 | 90 | 61 | 13 | 16 | 325 | 110.4 |
| SH | FR_SAFE_3 | cm3 66x41 | 90 | 60 | 22 | 8 | 312 | 106.2 |
| SH | FR_SAFE_3 | cm3w 102x67 | 90 | 89 | 1 | 0 | 242 | 82.1 |
| SH | FR_SAFE_3 | cm3w 640x360 | 90 | 86 | 2 | 2 | 202 | 75.0 |
| SN | E_COV | v2 62x49 | 180 | 137 | 20 | 23 | 79 | 55.2 |
| SN | E_COV | cm3 66x41 | 180 | 134 | 24 | 22 | 82 | 61.9 |
| SN | E_COV | cm3w 102x67 | 180 | 171 | 1 | 8 | 83 | 51.6 |
| SN | E_COV | cm3w 640x360 | 180 | 170 | 3 | 7 | 74 | 53.4 |
| SN | FR_SAFE_3 | v2 62x49 | 180 | 165 | 10 | 5 | 162 | 55.0 |
| SN | FR_SAFE_3 | cm3 66x41 | 180 | 142 | 27 | 11 | 174 | 58.8 |
| SN | FR_SAFE_3 | cm3w 102x67 | 180 | 179 | 0 | 1 | 147 | 49.8 |
| SN | FR_SAFE_3 | cm3w 640x360 | 180 | 178 | 2 | 0 | 147 | 55.0 |

#### SH, per requested speed

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | v2 62x49 @ 6 m/s | 30 | 12 (40% [25, 58]) | 5 | 13 | 192.4 | 210 | 1.06 | 1.22 |
| E_COV | v2 62x49 @ 10 m/s | 30 | 12 (40% [25, 58]) | 9 | 9 | 122.3 | 176 | 1.40 | 0.60 |
| E_COV | v2 62x49 @ 15 m/s | 30 | 14 (47% [30, 64]) | 10 | 6 | 92.4 | 154 | 1.74 | 0.32 |
| E_COV | cm3 66x41 @ 6 m/s | 30 | 14 (47% [30, 64]) | 6 | 10 | 175.7 | 212 | 1.11 | 0.68 |
| E_COV | cm3 66x41 @ 10 m/s | 30 | 12 (40% [25, 58]) | 10 | 8 | 112.1 | 178 | 1.64 | 0.39 |
| E_COV | cm3 66x41 @ 15 m/s | 30 | 13 (43% [27, 61]) | 10 | 7 | 86.8 | 150 | 1.63 | 0.21 |
| E_COV | cm3w 640x360 @ 6 m/s | 30 | 24 (80% [63, 90]) | 0 | 6 | 108.8 | 177 | 1.52 | 1.04 |
| E_COV | cm3w 640x360 @ 10 m/s | 30 | 22 (73% [56, 86]) | 4 | 4 | 83.7 | 156 | 1.68 | 1.00 |
| E_COV | cm3w 640x360 @ 15 m/s | 30 | 26 (87% [70, 95]) | 3 | 1 | 78.8 | 130 | 1.67 | 0.98 |
| FR_SAFE_3 | v2 62x49 @ 6 m/s | 30 | 23 (77% [59, 88]) | 1 | 6 | 146.6 | 432 | 2.95 | 1.33 |
| FR_SAFE_3 | v2 62x49 @ 10 m/s | 30 | 21 (70% [52, 83]) | 3 | 6 | 90.3 | 266 | 2.95 | 1.24 |
| FR_SAFE_3 | v2 62x49 @ 15 m/s | 30 | 17 (57% [39, 73]) | 9 | 4 | 74.9 | 221 | 2.96 | 0.55 |
| FR_SAFE_3 | cm3 66x41 @ 6 m/s | 30 | 23 (77% [59, 88]) | 2 | 5 | 130.7 | 385 | 2.95 | 1.16 |
| FR_SAFE_3 | cm3 66x41 @ 10 m/s | 30 | 21 (70% [52, 83]) | 8 | 1 | 102.1 | 301 | 2.95 | 0.79 |
| FR_SAFE_3 | cm3 66x41 @ 15 m/s | 30 | 16 (53% [36, 70]) | 12 | 2 | 84.1 | 248 | 2.96 | 0.60 |
| FR_SAFE_3 | cm3w 640x360 @ 6 m/s | 30 | 27 (90% [74, 97]) | 1 | 2 | 106.5 | 287 | 2.69 | 1.02 |
| FR_SAFE_3 | cm3w 640x360 @ 10 m/s | 30 | 30 (100% [89, 100]) | 0 | 0 | 73.7 | 196 | 2.69 | 1.18 |
| FR_SAFE_3 | cm3w 640x360 @ 15 m/s | 30 | 29 (97% [83, 99]) | 1 | 0 | 63.2 | 171 | 2.69 | 1.08 |

#### SN, per requested speed

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | v2 62x49 @ 6 m/s | 60 | 51 (85% [74, 92]) | 1 | 8 | 77.7 | 95 | 0.99 | 1.56 |
| E_COV | v2 62x49 @ 10 m/s | 60 | 45 (75% [63, 84]) | 7 | 8 | 44.8 | 68 | 1.30 | 1.77 |
| E_COV | v2 62x49 @ 15 m/s | 60 | 41 (68% [56, 79]) | 12 | 7 | 39.7 | 66 | 1.55 | 1.15 |
| E_COV | cm3 66x41 @ 6 m/s | 60 | 51 (85% [74, 92]) | 1 | 8 | 71.8 | 83 | 1.02 | 1.54 |
| E_COV | cm3 66x41 @ 10 m/s | 60 | 46 (77% [65, 86]) | 8 | 6 | 55.1 | 88 | 1.42 | 1.23 |
| E_COV | cm3 66x41 @ 15 m/s | 60 | 37 (62% [49, 73]) | 15 | 8 | 46.2 | 78 | 1.51 | 0.84 |
| E_COV | cm3w 640x360 @ 6 m/s | 60 | 57 (95% [86, 98]) | 0 | 3 | 69.0 | 76 | 1.06 | 1.52 |
| E_COV | cm3w 640x360 @ 10 m/s | 60 | 57 (95% [86, 98]) | 1 | 2 | 47.6 | 73 | 1.37 | 1.76 |
| E_COV | cm3w 640x360 @ 15 m/s | 60 | 56 (93% [84, 97]) | 2 | 2 | 43.0 | 70 | 1.56 | 1.86 |
| FR_SAFE_3 | v2 62x49 @ 6 m/s | 60 | 58 (97% [89, 99]) | 1 | 1 | 73.9 | 218 | 2.95 | 1.58 |
| FR_SAFE_3 | v2 62x49 @ 10 m/s | 60 | 54 (90% [80, 95]) | 3 | 3 | 47.8 | 142 | 2.95 | 1.52 |
| FR_SAFE_3 | v2 62x49 @ 15 m/s | 60 | 53 (88% [78, 94]) | 6 | 1 | 45.1 | 133 | 2.95 | 1.42 |
| FR_SAFE_3 | cm3 66x41 @ 6 m/s | 60 | 53 (88% [78, 94]) | 0 | 7 | 69.8 | 206 | 2.95 | 1.81 |
| FR_SAFE_3 | cm3 66x41 @ 10 m/s | 60 | 42 (70% [57, 80]) | 15 | 3 | 47.8 | 141 | 2.95 | 1.18 |
| FR_SAFE_3 | cm3 66x41 @ 15 m/s | 60 | 47 (78% [66, 87]) | 12 | 1 | 52.0 | 154 | 2.95 | 1.36 |
| FR_SAFE_3 | cm3w 640x360 @ 6 m/s | 60 | 60 (100% [94, 100]) | 0 | 0 | 67.1 | 182 | 2.69 | 1.47 |
| FR_SAFE_3 | cm3w 640x360 @ 10 m/s | 60 | 60 (100% [94, 100]) | 0 | 0 | 49.1 | 132 | 2.69 | 1.54 |
| FR_SAFE_3 | cm3w 640x360 @ 15 m/s | 60 | 58 (97% [89, 99]) | 2 | 0 | 41.4 | 110 | 2.70 | 1.62 |

### Findings

1. **Normal flight: the coverage scheduler halves the compute at the same collision rate, but gets
   stuck more often.** E_COV 1 collision in 180 runs (FR_SAFE_3 0, E_DART 4) with 36-47 % fewer
   inferences than the fixed 3 Hz rate (100 / 75 / 74 against 188 / 132 / 116 per mission at
   6 / 10 / 15 m/s) at the same time to goal. Stuck: 8/180 against 1/180 (p = 0.037).
2. **Hard set: E_COV is clearly less reliable than the fixed 3 Hz rate.** Failures 10/90 (3
   collisions, 7 stuck) against 1/90 (one collision with a crossing vehicle), p = 0.009, with 32-39 %
   fewer inferences (199 / 142 / 123 against 291 / 234 / 193) and longer missions (128 / 95 / 68 s
   against 99 / 79 / 66 s).
3. **Stuck runs are a global failure of the coverage scheduler, not a rare local one.** Of the 15
   E_COV stuck runs of the main grid, 13 have the blocking obstacle outside the field of view, 12 end
   at < 1 m/s, 8 with the obstacle unseen for > 3 s. When the vehicle (nearly) stops, the distance
   that must be observed shrinks to about d_s, the path counts as covered and no frame is taken; the
   planner gets no new information to find a way around. FR_SAFE_3 keeps 3 frames/s and is stuck once
   in 270 runs. Candidate fix (not implemented): take frames at the budget rate while progress stalls.
4. **1 Hz is not enough at these speeds.** FR_SAFE_1: 7/180 collisions in SN (FR_SAFE_3: 0,
   p = 0.015) and 12/90 in SH; COVB1: 7/180 in SN and 13/90 in SH (E_COV: 3/90, p = 0.016).
5. **The risk-adaptive scheduler E_DART is the most expensive and not the safest**: 13/270
   collisions against 1/270 for FR_SAFE_3 (p = 0.002) and 4/270 for E_COV (p = 0.046); 130-172
   inferences per mission in SN, about 300 in SH.
6. **The clutter speed limit matters in dense worlds only.** SN: 1 against 1 collision, stuck 8
   against 3 (p = 0.22). SH: collisions 3/90 with the limit against 12/90 without (p = 0.028). It
   stays on.
7. **Speed adapts to the density** (tables above). E_COV at a requested 15 m/s: 11.0 m/s with no
   object within 15 m, 7.8 m/s with 1-2, 4.1 m/s with 3-5, 2.7 m/s with >= 6. Its frame rate depends
   on the speed more than on the density: at 6 m/s 1.0 frames/s in the open and 1.5-1.8 near objects;
   at 15 m/s 1.7-1.9 frames/s everywhere, because the distance that must be observed grows with the
   speed. FR_SAFE_3: 2.95 frames/s everywhere; E_DART: 3.9-6.0 frames/s at 15 m/s.
8. **Cameras.** Narrow field of view (v2, standard Module 3): 166 collisions in 1080 runs; Module 3
   Wide: 5 in 540 (p ~ 1e-24). The 640 x 360 network input on the wide camera (4x pixels, 4x
   inference time and energy per frame) brings no gain: 14 collisions in 540 runs against 5
   (p = 0.06), failures 34 against 21 (p = 0.10); in SH it finishes faster (E_COV 85 against 92 s,
   FR_SAFE_3 75 against 82 s) but fails more. Recommendation unchanged: Module 3 Wide at 320 x 180.
9. **Collisions** (main grid): all 70 in the detour / rejoin mode, all with an obstacle that was
   tracked except 4 untracked ones of FR_SAFE_1. E_COV: SN 1 (static, out of view); SH 1 crossing vehicle and
   2 static obstacles out of view. FR_SAFE_3: SH 1 crossing vehicle.
10. **Consistency with round 6** (seeds 1-30, same algorithm): E_COV 1 collision / 5 stuck in 90 SN
    runs then, 1 / 8 in 180 now; FR_SAFE_3 0 / 1 then and now. The SH numbers of round 6 (15 worlds,
    10 m/s) were optimistic for E_COV (0 collisions, 1 stuck): with 30 worlds and three speeds the
    stuck problem shows.

### Stuck cases (figures)

The 15 E_COV stuck runs of the main grid were re-run with controller snapshots, together with
FR_SAFE_3 on the same worlds (Debug case workflow with input `cases`, CI runs 38129830388,
38129835055, 38129839601; `ci/ci_stuck_cases.m`, `experiments/dart_export_run.m`; figures by
`python3 docs/figures/plot_stuck.py <json dir> <out dir>`): [`figures/stuck/`](figures/stuck/).
12 of the 15 are stuck again (3 reach the goal this time, slowly: runner-dependent divergence);
FR_SAFE_3 reaches the goal in 14 of the 15 worlds. In the 12 stuck runs, at the start of the stall
the remembered spheres within 12 m have a radius of 1.13 x (median; 75 %: 1.37 x, max 3.9 x) the
radius of the nearest true primitive, the region the planner keeps out of (radius + d_s + 2 sigma)
1.9 x (75 %: 2.4 x), and their centres are 1.3 m (median) from it. These enlarged spheres close
the gaps between objects (>= 3.5 m in the worlds); while the vehicle stands, E_COV takes few frames
(6-21 in 44-61 s in the cases shown), so they are not measured again from close range.
