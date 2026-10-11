> **LƯU TRỮ — không áp dụng cho phương pháp hiện tại.** Kết quả hiện tại: [`docs/results/round7.md`](../../results/round7.md). Vì sao tài liệu này lỗi thời: [`docs/archive/README.md`](../README.md).

# Round 6 — large obstacles, RPi cameras, coverage scheduler with ray-carved free space (commit 4a1fcfa)

Same scope and benchmark as round 5 (large objects only: trees with low canopies, bushes, buildings,
vehicles / containers, rocks; 300 m route in zones of 40-80 m, SN 35 % open / 40 % sparse / 25 % dense;
physical limits from the quadrotor model: T/W 2.4, thrust reserve 40 %, tilt 46 deg, braking 6.2 m/s^2,
terminal speed 16.7 m/s, v_max = min(0.9 v_term, camera-view limit)). Default camera: Raspberry Pi
Camera Module 3 Wide, 102 x 67 deg, depth network at 320 x 180, 80 ms inference.

What changed since round 5 (commits 1dafc02, 4a1fcfa), only the coverage scheduler (E_COV, COVB1,
COV_NOCLUT). FR_SAFE_* and E_DART reproduce round 5 run by run, except in one CI job (SN seeds 11-20
at 10 m/s) where 20 of their 30 runs diverge slightly (same outcome class but one FR_SAFE_1 run,
different times) - probably floating-point differences between runner machines, not investigated:

1. **Observed space = ray-carved free space.** Each perception message carries a coarse 18 x 32 depth
   grid (low 20 % quantile of the network depths per cell, `dart_depth_grid.m`); when the result
   arrives the grid is registered with the camera pose at capture time (3 x 3 minimum, capped at
   R_eff, last 8 frames, `dart_scheduler_observed.m`). A point of the planned path counts as observed
   only if it lies at least d_s in front of the first measured surface through its cell. Round 5
   counted the whole view frustum up to R_eff as observed, including the space hidden behind
   obstacles: the main cause of its collisions (a global flaw, not a rare case).
2. **At most f_budget frames per second** (3 Hz; COVB1: 1 Hz), the rate the perception speed cap
   already assumes. With (1) alone, space occluded by a known obstacle cannot be observed before the
   vehicle has moved, so frames were fired back to back (165-216 inferences per mission, 4-5 Hz, in
   Octave smoke runs, SN seeds 1-3 at 12 m/s) without new information.

MATLAB engine. CI runs 38076683249, 38076685074, 38076686396 (SN seeds 1-10 / 11-20 / 21-30),
38076687678 (camera study), 38076689499 (SH). Tables (from `docs/archive/results`): `python3 ../../results/parse_results.py 'raw/r6[abch]_*.log'` and
`python3 ../../results/parse_results.py 'raw/r6cam_*.log'`. Raw logs of round 5 (before the fix) are archived:
`raw/r5*` (`python3 ../../results/parse_results.py 'raw/r5[abch]_*.log'`).

### SH (hard set: dense everywhere, fog in odd seeds, crossing vehicles in seeds divisible by 3), 15 worlds at 10 m/s

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | speed=10 | 15 | 14 (93% [70, 99]) | 0 | 1 | 95.5 | 158 | 1.59 | 1.25 |
| FR_SAFE_3 | speed=10 | 15 | 15 (100% [80, 100]) | 0 | 0 | 81.3 | 240 | 2.95 | 1.01 |
| E_DART | speed=10 | 15 | 14 (93% [70, 99]) | 1 | 0 | 65.1 | 328 | 4.89 | 0.88 |

### SN (normal flight), 30 worlds x requested speed

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | speed=6 | 30 | 29 (97% [83, 99]) | 0 | 1 | 64.3 | 93 | 1.39 | 1.39 |
| E_COV | speed=10 | 30 | 27 (90% [74, 97]) | 0 | 3 | 43.6 | 75 | 1.58 | 1.63 |
| E_COV | speed=15 | 30 | 28 (93% [79, 98]) | 1 | 1 | 37.4 | 71 | 1.78 | 1.79 |
| COVB1 | speed=6 | 30 | 27 (90% [74, 97]) | 0 | 3 | 70.3 | 46 | 0.61 | 1.62 |
| COVB1 | speed=10 | 30 | 29 (97% [83, 99]) | 0 | 1 | 47.2 | 37 | 0.72 | 1.75 |
| COVB1 | speed=15 | 30 | 24 (80% [63, 90]) | 4 | 2 | 39.5 | 34 | 0.75 | 1.66 |
| COV_NOCLUT | speed=6 | 30 | 28 (93% [79, 98]) | 0 | 2 | 64.2 | 93 | 1.36 | 1.38 |
| COV_NOCLUT | speed=10 | 30 | 30 (100% [89, 100]) | 0 | 0 | 42.8 | 71 | 1.57 | 1.64 |
| COV_NOCLUT | speed=15 | 30 | 30 (100% [89, 100]) | 0 | 0 | 35.0 | 66 | 1.81 | 2.18 |
| FR_SAFE_3 | speed=6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 61.7 | 182 | 2.95 | 1.33 |
| FR_SAFE_3 | speed=10 | 30 | 29 (97% [83, 99]) | 0 | 1 | 43.1 | 127 | 2.95 | 1.65 |
| FR_SAFE_3 | speed=15 | 30 | 30 (100% [89, 100]) | 0 | 0 | 37.8 | 112 | 2.95 | 1.83 |
| FR_SAFE_1 | speed=6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 68.7 | 69 | 1.01 | 1.68 |
| FR_SAFE_1 | speed=10 | 30 | 26 (87% [70, 95]) | 2 | 2 | 48.3 | 48 | 1.01 | 1.79 |
| FR_SAFE_1 | speed=15 | 30 | 26 (87% [70, 95]) | 1 | 3 | 45.5 | 46 | 1.01 | 1.63 |
| E_DART | speed=6 | 30 | 30 (100% [89, 100]) | 0 | 0 | 59.4 | 126 | 2.19 | 1.23 |
| E_DART | speed=10 | 30 | 30 (100% [89, 100]) | 0 | 0 | 40.2 | 140 | 3.31 | 1.27 |
| E_DART | speed=15 | 30 | 29 (97% [83, 99]) | 1 | 0 | 36.6 | 175 | 4.50 | 1.40 |

### Coverage scheduler before / after the fix (SN, 30 worlds per speed)

| | collisions 6 / 10 / 15 m/s | goal 6 / 10 / 15 m/s | inferences per mission (median) | min clearance, median [m] |
|---|---|---|---|---|
| E_COV round 5 (frustum = observed) | 12 / 11 / 3 | 16 / 19 / 25 | 60 / 69 / 100 | 0.61 / 0.41 / 1.33 |
| E_COV round 6 (ray-carved, <= 3 Hz) | 0 / 0 / 1 | 29 / 27 / 28 | 93 / 75 / 71 | 1.39 / 1.63 / 1.79 |
| FR_SAFE_3 (fixed 3 Hz, reference) | 0 / 0 / 0 | 30 / 29 / 30 | 182 / 127 / 112 | 1.33 / 1.65 / 1.83 |

Collisions 26/90 -> 1/90 (Fisher exact p < 1e-7).

### Camera study (SN, 15 worlds per cell)

Hardware presets (`src/config/dart_camera_preset.m`; sensor specs from retailer pages, the network
input is the sensor image down-scaled; inference time proportional to the number of pixels):

| preset | camera | FOV h x v [deg] | network input | inference [ms] | uptilt [deg] | R_eff [m] | v_max [m/s] (limited by) |
|---|---|---|---|---|---|---|---|
| 1 | Camera Module v2 (IMX219) | 62.2 x 48.8 | 280 x 210 | 82 | 14.3 | 30.4 | 13.1 (view) |
| 2 | Camera Module 3 (IMX708) | 66 x 41 | 320 x 180 | 80 | 10.1 | 30.4 | 10.7 (view) |
| 3 | Camera Module 3 Wide (IMX708) | 102 x 67 | 320 x 180 | 80 | 15.0 | 26.1 | 15.0 (thrust) |
| 4 | Camera Module 3 Wide, network at 640 x 360 | 102 x 67 | 640 x 360 | 320 | 15.0 | 30.4 | 15.0 (thrust) |

v_max (view): at speed v the vehicle pitches forward by atan((k_d v + c_q v^2) / (m g)); the camera
must still see the path (pitch <= uptilt + vfov/2 - 5 deg). R_eff: range at which an object of 1 m
radius is detected in >= 90 % of frames, divided by 1.15 (range bias).

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | v2 62x49 @ 10 m/s | 15 | 12 (80% [55, 93]) | 2 | 1 | 40.3 | 52 | 1.19 | 1.65 |
| E_COV | v2 62x49 @ 15 m/s | 15 | 9 (60% [36, 80]) | 3 | 3 | 38.5 | 60 | 1.39 | 1.16 |
| E_COV | cm3 66x41 @ 10 m/s | 15 | 10 (67% [42, 85]) | 3 | 2 | 49.7 | 78 | 1.40 | 1.02 |
| E_COV | cm3 66x41 @ 15 m/s | 15 | 12 (80% [55, 93]) | 2 | 1 | 47.8 | 72 | 1.44 | 1.21 |
| E_COV | cm3w 102x67 @ 10 m/s | 15 | 15 (100% [80, 100]) | 0 | 0 | 43.6 | 74 | 1.53 | 1.67 |
| E_COV | cm3w 102x67 @ 15 m/s | 15 | 14 (93% [70, 99]) | 1 | 0 | 34.4 | 66 | 1.77 | 1.79 |
| E_COV | cm3w 640x360 @ 10 m/s | 15 | 14 (93% [70, 99]) | 0 | 1 | 45.8 | 56 | 1.19 | 2.12 |
| E_COV | cm3w 640x360 @ 15 m/s | 15 | 14 (93% [70, 99]) | 0 | 1 | 40.1 | 63 | 1.55 | 1.86 |
| FR_SAFE_3 | v2 62x49 @ 10 m/s | 15 | 12 (80% [55, 93]) | 1 | 2 | 42.7 | 126 | 2.95 | 1.79 |
| FR_SAFE_3 | v2 62x49 @ 15 m/s | 15 | 12 (80% [55, 93]) | 3 | 0 | 39.5 | 116 | 2.96 | 1.62 |
| FR_SAFE_3 | cm3 66x41 @ 10 m/s | 15 | 8 (53% [30, 75]) | 6 | 1 | 45.1 | 133 | 2.96 | 0.74 |
| FR_SAFE_3 | cm3 66x41 @ 15 m/s | 15 | 14 (93% [70, 99]) | 0 | 1 | 46.1 | 136 | 2.95 | 1.47 |
| FR_SAFE_3 | cm3w 102x67 @ 10 m/s | 15 | 14 (93% [70, 99]) | 0 | 1 | 42.0 | 124 | 2.95 | 1.76 |
| FR_SAFE_3 | cm3w 102x67 @ 15 m/s | 15 | 15 (100% [80, 100]) | 0 | 0 | 36.2 | 107 | 2.96 | 1.83 |
| FR_SAFE_3 | cm3w 640x360 @ 10 m/s | 15 | 15 (100% [80, 100]) | 0 | 0 | 40.4 | 110 | 2.69 | 1.55 |
| FR_SAFE_3 | cm3w 640x360 @ 15 m/s | 15 | 14 (93% [70, 99]) | 1 | 0 | 42.3 | 114 | 2.70 | 1.73 |

Collisions, all presets together: wide FOV (presets 3 + 4) 2 / 120 runs, narrow FOV (presets 1 + 2)
20 / 120 runs (Fisher exact p = 6e-5). All 22 collisions are with an obstacle that WAS tracked, in
the detour / rejoin mode, 20 of 22 with the obstacle outside the field of view at the time of contact:
during the detour the narrow camera loses the obstacle it is passing and the vehicle relies on the
memory of an estimate taken from far away.

### Speed versus obstacle density (Octave, SN seeds 1-2, requested 15 m/s)

Flown speed and perception rate binned by the number of distinct objects within 15 m of the vehicle
(`experiments/dart_eval_speed_density.m`; Octave worlds differ from the MATLAB ones):

| variant, seed | 0 objects | 1-2 objects | 3-5 objects |
|---|---|---|---|
| E_COV, 1 | 9.4 m/s, 1.2 frames/s | 7.9 m/s, 2.2 frames/s | 6.8 m/s, 2.0 frames/s |
| E_COV, 2 | 6.7 m/s, 0.5 frames/s | 8.8 m/s, 2.3 frames/s | 2.2 m/s, 1.0 frames/s (60 s in one cluster) |
| COV_NOCLUT, 1 | 9.9 m/s, 1.4 frames/s | 8.1 m/s, 1.6 frames/s | 6.7 m/s, 1.7 frames/s |
| COV_NOCLUT, 2 | 8.5 m/s, 1.0 frames/s | 10.0 m/s, 1.8 frames/s | 7.6 m/s, 2.6 frames/s |

### Check of the clutter speed limit on new worlds (SN seeds 31-60)

E_COV (clutter speed limit on) against COV_NOCLUT (off), 30 new worlds per speed. CI runs
38105342423, 38105343772; `python3 ../../results/parse_results.py 'raw/r7[ab]_*.log'`.

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | speed=6 | 30 | 28 (93% [79, 98]) | 0 | 2 | 65.0 | 103 | 1.47 | 1.36 |
| E_COV | speed=10 | 30 | 29 (97% [83, 99]) | 0 | 1 | 44.1 | 75 | 1.61 | 1.56 |
| E_COV | speed=15 | 30 | 30 (100% [89, 100]) | 0 | 0 | 41.4 | 75 | 1.86 | 1.71 |
| COV_NOCLUT | speed=6 | 30 | 29 (97% [83, 99]) | 0 | 1 | 67.8 | 103 | 1.35 | 1.30 |
| COV_NOCLUT | speed=10 | 30 | 30 (100% [89, 100]) | 0 | 0 | 43.8 | 78 | 1.64 | 1.68 |
| COV_NOCLUT | speed=15 | 30 | 30 (100% [89, 100]) | 0 | 0 | 40.0 | 76 | 1.87 | 1.73 |

Together with the table above (seeds 1-30), 180 runs per variant: E_COV 1 collision, 8 stuck;
COV_NOCLUT 0 collisions, 3 stuck.

The same check on the hard set SH (15 worlds at 10 and 15 m/s, CI run 38105345554,
`python3 ../../results/parse_results.py 'raw/r7h_*.log'`; E_COV at 10 m/s reproduces the SH table above exactly):

| variant | setting | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s | min clearance, median [m] |
|---|---|---|---|---|---|---|---|---|---|
| E_COV | speed=10 | 15 | 14 (93% [70, 99]) | 0 | 1 | 95.5 | 158 | 1.59 | 1.25 |
| E_COV | speed=15 | 15 | 13 (87% [62, 96]) | 2 | 0 | 75.2 | 123 | 1.90 | 1.06 |
| COV_NOCLUT | speed=10 | 15 | 12 (80% [55, 93]) | 1 | 2 | 84.3 | 152 | 1.84 | 1.10 |
| COV_NOCLUT | speed=15 | 15 | 10 (67% [42, 85]) | 4 | 1 | 62.3 | 126 | 1.71 | 1.12 |

In dense worlds the limit points the other way: with it 27/30 goal, 2 collisions, 1 stuck; without it
22/30 goal, 5 collisions, 3 stuck (failures 3/30 against 8/30, Fisher exact p = 0.18; not significant).
All 7 collisions: tracked boxes / spheres, detour / rejoin mode.

### Findings

1. **The coverage scheduler is now safe.** SN: 1 collision in 90 runs (FR_SAFE_3: 0, E_DART: 1),
   with 37-49 % fewer inferences than the fixed 3 Hz rate at the same speed (93 / 75 / 71 against
   182 / 127 / 112 per mission; 1.4-1.8 against 2.95 frames/s). SH: 14/15 goal, 0 collisions,
   158 inferences per mission against 240 (FR_SAFE_3) and 328 (E_DART, 1 collision). In the
   speed / density runs below it takes ~0.5-1.4 frames/s with no object within 15 m and ~1-2.6
   frames/s near objects.
2. **1 Hz is not enough at these speeds**: COVB1 4 collisions at 15 m/s, FR_SAFE_1 3 collisions in
   90 runs; both also get stuck more often.
3. **Stuck runs** (no progress, no collision): E_COV 5/90, COVB1 6/90, COV_NOCLUT 2/90, FR_SAFE_3
   1/90, E_DART 0/90. All in the detour / rejoin mode next to a tracked obstacle (E_COV: all five
   at < 1 m/s), in different worlds: a local minimum of the local planner. Not significant between
   E_COV and FR_SAFE_3 (p = 0.21). Recorded, not optimised (rare, local).
4. **The explicit clutter speed limit matters only in dense worlds.** In normal flight it adds
   nothing measurable: over 180 SN runs each (seeds 1-60), COV_NOCLUT 0 collisions and 3 stuck
   against 1 and 8 with the limit, at the same time to goal and the same number of inferences. On
   SH it points the other way (failures 3/30 with the limit, 8/30 without, p = 0.18), so it stays
   on by default. The speed adapts to the density anyway
   (table above: ~9-10 m/s with no object within 15 m, ~7-8 m/s with 3-5): the braking CBF and the
   coverage test already slow the vehicle where the free space ahead is short.
5. **Requested 15 m/s is not reached on average**: median time to goal 37 s on a 300 m route
   (~8 m/s), because the zones are short (40-80 m) and every detour slows the vehicle.
6. **Cameras** (questions: better / sharper / farther — is it worth it?):
   - *Wider is what matters.* The two wide presets have 2 collisions in 120 runs, the two narrow
     ones 20 (p = 6e-5). The narrow cameras lose the obstacle being passed during the detour; the
     standard Module 3 (41 deg vertical) is also limited to 10.7 m/s because the path leaves the
     image when the vehicle pitches forward.
   - *Sharper is not safer.* The same wide camera with the network at 640 x 360 (4x pixels, 4x
     inference time and energy per frame) detects small objects farther (0.5 m: 15 m instead of
     10 m; R_eff 30 m instead of 26 m) but gives the same closed-loop result (1 collision in 60
     runs each, p = 1). For large obstacles 320 x 180 is enough.
   - *Seeing farther does not help by itself.* The narrow cameras see a 1 m object farther (35 m
     against 30 m) and still crash 10x more often.
   - Recommendation: Camera Module 3 Wide at 320 x 180 network input.
