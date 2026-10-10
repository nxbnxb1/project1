# Round 4 — realistic cheap-UAV camera, normal-flight benchmark (commit 7d96e58)

Camera / depth network: 128x96 output, scene rendered on 3x3 sub-rays per pixel and averaged in
disparity, range-dependent network blur (0.5 px near -> 2 px at 15 m), per-frame scale and
inverse-depth shift, correlated error field, per-pixel noise, outliers; flying-pixel filter and
rim-fragment removal in the segmentation. Measured detection range (>= 90 % of frames,
`experiments/dart_eval_detection_range.m`): poles of radius 8-12 cm ~4 m, trunks 20-30 cm 6-8 m,
canopies (spheres 1-2 m) 12-14 m; thin far objects read up to ~30 % too far.

Algorithm additions: perception speed cap v T_r + v^2/(2 a_b) + d_s <= R_eff (R_eff = 3.08 m for
r_min = 8 cm), compute budget f_budget (cap 1.89 / 3.05 / 3.41 m/s at 1 / 3 / 5 Hz), coverage
scheduler (E_COV = budget 3 Hz, COVB1, COVB5; COV_NOCAP without the cap).

Scenarios: SN normal flight (120 m route, 4-10 far-apart static objects: trees with canopies,
small trees, lamp posts, overhanging canopies, buildings beside the path), seeds 1-30 x requested
speed 2/4/6 m/s; SH hard cases (dense layouts, movers, fog in odd seeds), seeds 1-10 at 4 m/s.
MATLAB engine, CI runs 38050381178, 38050383188, 38050385325 (SN), 38050387193 (SH).
Tables: `python3 parse_r4.py 'raw/r4[abch]_S*_speed_*.log'`.

### SH

| variant | requested speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | 4 | 10 | 9 (90% [60, 98]) | 0 | 1 | 42.2 | 188 | 4.36 | 0.61 |
| FR_SAFE_3 | 4 | 10 | 8 (80% [49, 94]) | 2 | 0 | 63.2 | 186 | 2.96 | 0.62 |
| E_DART | 4 | 10 | 10 (100% [72, 100]) | 0 | 0 | 40.0 | 201 | 5.77 | 0.67 |

FR_SAFE_3 collisions (2): cls {'collision-tracked': 2}; shape {'sphere': 1, 'box': 1}; infov {'1': 1, '0': 1}; mode {'2': 2}; nupd {'2-5': 1, '1': 1}; seen {'<1 s': 2}; vdes {'4': 2}

### SN

| variant | requested speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.5 | 106 | 1.68 | 1.47 |
| E_COV | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 43.8 | 130 | 2.90 | 1.56 |
| E_COV | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 43.8 | 120 | 2.81 | 1.50 |
| COVB1 | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 69.2 | 111 | 1.62 | 1.42 |
| COVB1 | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 69.2 | 111 | 1.62 | 1.42 |
| COVB1 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 68.9 | 114 | 1.62 | 1.44 |
| COVB5 | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.5 | 106 | 1.68 | 1.47 |
| COVB5 | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 38.5 | 142 | 3.81 | 1.38 |
| COVB5 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 38.9 | 144 | 3.76 | 1.46 |
| FR_SAFE_1 | 2 | 30 | 29 (97% [83, 99]) | 0 | 1 | 73.2 | 74 | 1.01 | 1.74 |
| FR_SAFE_1 | 4 | 30 | 29 (97% [83, 99]) | 0 | 1 | 73.2 | 74 | 1.01 | 1.74 |
| FR_SAFE_1 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 71.2 | 72 | 1.01 | 1.62 |
| FR_SAFE_3 | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.2 | 192 | 2.95 | 1.29 |
| FR_SAFE_3 | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 45.0 | 133 | 2.95 | 1.44 |
| FR_SAFE_3 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 44.8 | 132 | 2.95 | 1.46 |
| E_DART | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 63.9 | 176 | 2.74 | 1.40 |
| E_DART | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 43.1 | 264 | 6.14 | 1.26 |
| E_DART | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 42.8 | 266 | 6.16 | 1.27 |
| COV_NOCAP | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.5 | 106 | 1.68 | 1.47 |
| COV_NOCAP | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 33.2 | 276 | 8.28 | 1.40 |
| COV_NOCAP | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 24.6 | 220 | 8.97 | 1.62 |


### Findings

1. **SN (normal flight) is safe for every variant**: 0 collisions in 630 runs (FR_SAFE_1: 1 stuck).
   Even without the speed cap at 6 m/s (COV_NOCAP, ~9 inferences/s) there is no collision: the
   braking-based cap is conservative for sparse worlds (the vehicle passes thin objects sideways).
2. **Compute at equal speed**: coverage (budget 3 Hz) 130 inferences per mission vs fixed 3 Hz 133
   (both ~3 m/s, 44-45 s). At ~1.85 m/s the fixed 1 Hz rate needs 74, the coverage scheduler with a
   1 Hz budget 111: it also re-images known obstacles (local trigger count, SN seed 1: 79 coverage,
   27 uncertainty, 11 emergency triggers). The old adaptive scheduler needs twice as many (264).
3. **Speed sets the compute**: inferences per mission ~ L / (R_eff - v tau - v^2/(2 a_b) - d_s);
   at 2 m/s requested, coverage needs 106 vs fixed 3 Hz 192 (the fixed rate does not slow down
   its inference when the vehicle flies slower).
4. **SH (hard, 10 worlds)**: coverage 9/10 (1 stuck), fixed 3 Hz 8/10 (2 collisions with tracked
   obstacles while rejoining), adaptive 10/10.

Next (round 4b): coverage scheduler without re-imaging known obstacles (sched.cov_events = false),
fixed 1 / 3 Hz without the speed cap (FRNC1, FRNC3), fixed 2 Hz; more SH worlds.

## Round 4b (commit 5d5bd60, same camera and SN/SH worlds as round 4; CI runs 38064766247, 38064768125)

Coverage scheduler without re-imaging known obstacles (E_COV), old behaviour (COV_EV), fixed 2 Hz, fixed 1 / 3 Hz WITHOUT the speed cap (FRNC1, FRNC3); SH with 20 worlds.

### SH

| variant | requested speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | 4 | 20 | 18 (90% [70, 97]) | 0 | 2 | 38.2 | 117 | 3.05 | 0.68 |
| COVB1 | 4 | 20 | 12 (60% [39, 78]) | 2 | 6 | 81.7 | 140 | 1.64 | 0.82 |
| FR_SAFE_1 | 4 | 20 | 16 (80% [58, 92]) | 3 | 1 | 99.0 | 100 | 1.01 | 0.59 |
| FR_SAFE_3 | 4 | 20 | 17 (85% [64, 95]) | 3 | 0 | 60.4 | 178 | 2.96 | 0.57 |
| E_DART | 4 | 20 | 20 (100% [84, 100]) | 0 | 0 | 33.1 | 200 | 5.90 | 0.61 |
| FRNC3 | 4 | 20 | 19 (95% [76, 99]) | 1 | 0 | 44.9 | 132 | 2.95 | 0.52 |

COVB1 collisions (2): cls {'collision-untracked': 1, 'collision-tracked': 1}; shape {'sphere': 2}; infov {'0': 2}; mode {'2': 2}; nupd {'-': 1, '2-5': 1}; seen {'1-5 s': 1, '<1 s': 1}; vdes {'4': 2}
FR_SAFE_1 collisions (3): cls {'collision-tracked': 3}; shape {'box': 1, 'cylinder': 1, 'sphere': 1}; infov {'0': 2, '1': 1}; mode {'2': 3}; nupd {'>5': 2, '2-5': 1}; seen {'<1 s': 3}; vdes {'4': 3}
FR_SAFE_3 collisions (3): cls {'collision-tracked': 3}; shape {'sphere': 1, 'box': 2}; infov {'1': 1, '0': 2}; mode {'2': 3}; nupd {'2-5': 1, '1': 1, '>5': 1}; seen {'<1 s': 3}; vdes {'4': 3}
FRNC3 collisions (1): cls {'collision-tracked': 1}; shape {'box': 1}; infov {'0': 1}; mode {'2': 1}; nupd {'>5': 1}; seen {'<1 s': 1}; vdes {'4': 1}

### SN

| variant | requested speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | 2 | 30 | 28 (93% [79, 98]) | 0 | 2 | 66.6 | 89 | 1.22 | 1.50 |
| E_COV | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 44.9 | 109 | 2.46 | 1.60 |
| E_COV | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 44.5 | 110 | 2.48 | 1.58 |
| COVB1 | 2 | 30 | 29 (97% [83, 99]) | 0 | 1 | 71.0 | 91 | 1.22 | 1.64 |
| COVB1 | 4 | 30 | 29 (97% [83, 99]) | 0 | 1 | 70.9 | 92 | 1.25 | 1.66 |
| COVB1 | 6 | 30 | 29 (97% [83, 99]) | 0 | 1 | 70.1 | 89 | 1.22 | 1.56 |
| COV_EV | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.5 | 106 | 1.68 | 1.47 |
| COV_EV | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 43.5 | 120 | 2.83 | 1.54 |
| COV_EV | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 43.8 | 120 | 2.81 | 1.50 |
| FRNC1 | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 68.0 | 68 | 1.01 | 1.77 |
| FRNC1 | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 38.2 | 38 | 1.01 | 2.20 |
| FRNC1 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 28.8 | 29 | 1.02 | 1.90 |
| FRNC3 | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.2 | 192 | 2.95 | 1.29 |
| FRNC3 | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 34.8 | 103 | 2.96 | 1.71 |
| FRNC3 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 26.5 | 78 | 2.96 | 2.05 |
| FR_SAFE_2 | 2 | 30 | 30 (100% [89, 100]) | 0 | 0 | 65.7 | 132 | 2.01 | 1.42 |
| FR_SAFE_2 | 4 | 30 | 30 (100% [89, 100]) | 0 | 0 | 50.8 | 102 | 2.01 | 1.62 |
| FR_SAFE_2 | 6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 51.0 | 103 | 2.01 | 1.56 |


Findings: in sparse normal flight a fixed 1 Hz rate WITHOUT the speed cap was safe in all 90 runs and
needs only 29-68 inferences per mission (it flies at the requested speed); the braking-based cap is
conservative for sparse worlds. Not re-imaging known obstacles cut the coverage scheduler from 120 to
110 inferences at 4-6 m/s but caused 2 stuck runs at 2 m/s. These results belong to the earlier scope
(thin poles, 15 m range); round 5 changes the scope to large obstacles and a real camera model.
