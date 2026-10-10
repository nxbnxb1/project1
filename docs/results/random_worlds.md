# Random worlds (scenario SR): global failure analysis

Each round: the same 120 random worlds (seeds 1-120) flown at 2, 4, 6, 8 m/s (480 runs, MATLAB engine, variant E_DART). Failures are classified automatically (experiments/dart_failure_info.m) and aggregated with parse_failures.py; only causes that are frequent across strata are fixed.

## Round 1 — commit 5f2b0b7 (CI runs 37886490177, 37886497009)

> **Status:** code 5f2b0b7 had a fixed 40 s limit and the old classes timeout-slow / timeout-stuck. Fix 1 below is in the code since ce6c4f4; fix 2 was replaced in d3ed301 by NO time limit + 'stuck' detection (no 1 m of progress along the set path in 60 s). These rates do not describe the current method; see round 2.

```
480 runs, 181 failures

### SR E_DART: 480 runs

| cause | rate [95% CI] |
|---|---|
| collision-tracked | 30/480 (6.2%) [4.4, 8.8] |
| collision-untracked | 28/480 (5.8%) [4.1, 8.3] |
| timeout-slow | 110/480 (22.9%) [19.4, 26.9] |
| timeout-stuck | 13/480 (2.7%) [1.6, 4.6] |

| swept value | runs failed [95% CI] |
|---|---|
| 2 | 83/120 (69.2%) [60.4, 76.7] |
| 4 | 34/120 (28.3%) [21.0, 37.0] |
| 6 | 29/120 (24.2%) [17.4, 32.6] |
| 8 | 35/120 (29.2%) [21.8, 37.8] |

| layout | runs failed [95% CI] |
|---|---|
| clusters | 20/116 (17.2%) [11.4, 25.1] |
| corridor | 38/100 (38.0%) [29.1, 47.8] |
| forest | 45/84 (53.6%) [43.0, 63.8] |
| mixed | 63/116 (54.3%) [45.3, 63.1] |
| uniform | 15/64 (23.4%) [14.7, 35.1] |

| movers | runs failed [95% CI] |
|---|---|
| no | 57/156 (36.5%) [29.4, 44.3] |
| yes | 124/324 (38.3%) [33.1, 43.7] |

| collisions by | count |
|---|---|
| cls | collision-tracked: 30, collision-untracked: 28 |
| shape | box: 17, cylinder: 31, sphere: 10 |
| dyn | 0: 57, 1: 1 |
| tracked | 0: 28, 1: 30 |
| infov | 0: 56, 1: 2 |
| mode | 2: 58 |
| static | 0: 26, 1: 4, NaN: 28 |

| timeouts by | count |
|---|---|
| cls | timeout-slow: 110, timeout-stuck: 13 |
| shape | box: 40, cylinder: 59, sphere: 24 |
| dyn | 0: 117, 1: 6 |
| tracked | 0: 9, 1: 114 |
| infov | 0: 85, 1: 38 |
| mode | 1: 1, 2: 122 |
| static | 0: 49, 1: 65, NaN: 9 |

```

Cross-tabulation (goal / collision-untracked / collision-tracked / timeout-slow / timeout-stuck):

| speed | n | goal | coll. untracked | coll. tracked | timeout slow | timeout stuck |
|---|---|---|---|---|---|---|
| 2 | 120 | 37 | 6 | 3 | 66 | 8 |
| 4 | 120 | 86 | 5 | 8 | 19 | 2 |
| 6 | 120 | 91 | 7 | 8 | 11 | 3 |
| 8 | 120 | 85 | 10 | 11 | 14 | 0 |

### Diagnosis (global, not per case)

1. **Collisions (58/480, 12 %) are with static obstacles OUTSIDE the field of view**
   (56/58), while moving towards them (closing speed > 0 in 52/58) at 2-5.5 m/s, all in the
   REJOIN mode, at every cruise speed. The safety layer only limited the speed *backwards*
   (blind row); sideways motion beyond the 90 deg field of view was free, and the camera
   followed the *current* velocity, so it lagged behind every turn of the planned detour.
   Whether the obstacle had been forgotten (26/30 tracked ones were not classified static)
   or never seen, the common cause is fast motion into unobserved space.
   Fix: CBF rows on the two lateral edges of the field of view (speed beyond each edge
   <= 1 m/s) and a yaw policy that looks at the MPC's predicted position 0.6 s ahead.
2. **Timeouts at 2 m/s (74/120)** are an artefact of the fixed 40 s limit: a 50-60 m path
   at 2 m/s plus detours does not fit. Fix: t_max = max(40, 2.5 L / v_des + 10) for SR.
   Timeouts at 4-8 m/s (39/360) remain to be re-checked after fix 1.
3. Movers do not change the failure rate (36.5 % without vs 38.3 % with movers); failures
   concentrate in pole forests / mixed layouts (54 %) and corridors (38 %).


## Round 2 — commit d3ed301 (previous algorithm: still tracked movers, two-model bank) (CI runs 37924654187, 37924662662, 37924670369, 37924678333)

Same 120 worlds (seeds 1-120; movers are re-timed with each run's cruise speed) × 2/4/6/8 m/s × kappa = 0 / 0.5 / 1
(variants K0, K50 = E_DART, K100) = 1440 runs, MATLAB engine, **no time limit** (a run ends at the goal, at a
collision, or as 'stuck': no 1 m of progress along the set path in 60 s). First round with the field-of-view
edge rows and the look-ahead yaw. Raw logs: `raw/r2{a,b,c,d}_SR_speed_*.log` (seeds 1-30 / 31-60 / 61-90 / 91-120).

| kappa | speed [m/s] | goal (of 120) | collisions (untracked / tracked) | stuck | time to goal, median [s] | min clearance, median [m] |
|---|---|---|---|---|---|---|
| 0 | 2 | 110 (92 % [85, 95]) | 1 (1/0) | 9 | 62.7 | 1.50 |
| 0 | 4 | 112 (93 % [87, 97]) | 4 (3/1) | 4 | 39.2 | 1.75 |
| 0 | 6 | 110 (92 % [85, 95]) | 2 (0/2) | 8 | 31.7 | 1.43 |
| 0 | 8 | 112 (93 % [87, 97]) | 3 (1/2) | 5 | 33.0 | 1.52 |
| 0.5 | 2 | 102 (85 % [78, 90]) | 18 (7/11) | 0 | 42.8 | 0.59 |
| 0.5 | 4 | 108 (90 % [83, 94]) | 12 (4/8) | 0 | 30.5 | 0.60 |
| 0.5 | 6 | 107 (89 % [82, 94]) | 13 (5/8) | 0 | 27.1 | 0.67 |
| 0.5 | 8 | 110 (92 % [85, 95]) | 10 (4/6) | 0 | 30.1 | 0.68 |
| 1 | 2 | 98 (82 % [74, 88]) | 22 (9/13) | 0 | 40.5 | 0.38 |
| 1 | 4 | 103 (86 % [78, 91]) | 17 (4/13) | 0 | 28.4 | 0.43 |
| 1 | 6 | 104 (87 % [79, 92]) | 16 (5/11) | 0 | 24.9 | 0.47 |
| 1 | 8 | 103 (86 % [78, 91]) | 17 (7/10) | 0 | 27.9 | 0.44 |

(Wilson 95 % intervals in brackets.)

### Diagnosis

1. **kappa behaves as intended**: lower kappa -> fewer collisions, larger clearance, longer time to the
   goal, and some 'stuck' runs (at kappa = 0, 2 (d_s + margin) = 2.3 m exceeds the 2 m gaps, closing
   passages by design).
2. **The FOV fix did not remove the dominant collision cause.** At kappa = 0.5: 53/480 collisions
   (round 1: 58/480 with a 40 s limit). 48/53 are still with static obstacles OUTSIDE the field of
   view, all in the REJOIN mode; 30/53 with poles (cylinders), 36/53 in forest / mixed layouts;
   closing speed mostly 0.1-1.5 m/s (side-swiping rather than flying into unseen space - the
   FOV-edge rows did lower it). 33/53 had a track near the obstacle, 27 of them NOT classified static.
   Common cause (hypothesis to check): the obstacle memory - a static obstacle whose track is not
   classified static (poles occluded / split, short observation) is extrapolated with a spurious
   constant velocity while out of view, or forgotten when its sigma exceeds sigma_forget; the vehicle
   then side-swipes it. Not fixed in d3ed301.

### Cause tables (parse_failures.py)

```
1440 runs, 161 failures

### SR K0: 480 runs

| cause | rate [95% CI] |
|---|---|
| collision-tracked | 5/480 (1.0%) [0.4, 2.4] |
| collision-untracked | 5/480 (1.0%) [0.4, 2.4] |
| stuck | 26/480 (5.4%) [3.7, 7.8] |

| swept value | runs failed [95% CI] |
|---|---|
| 2 | 10/120 (8.3%) [4.6, 14.7] |
| 4 | 8/120 (6.7%) [3.4, 12.6] |
| 6 | 10/120 (8.3%) [4.6, 14.7] |
| 8 | 8/120 (6.7%) [3.4, 12.6] |

| layout | runs failed [95% CI] |
|---|---|
| clusters | 1/116 (0.9%) [0.2, 4.7] |
| corridor | 22/100 (22.0%) [15.0, 31.1] |
| forest | 3/84 (3.6%) [1.2, 10.0] |
| mixed | 6/116 (5.2%) [2.4, 10.8] |
| uniform | 4/64 (6.2%) [2.5, 15.0] |

| movers | runs failed [95% CI] |
|---|---|
| no | 11/156 (7.1%) [4.0, 12.2] |
| yes | 25/324 (7.7%) [5.3, 11.1] |

| collisions by | count |
|---|---|
| cls | collision-tracked: 5, collision-untracked: 5 |
| shape | box: 4, cylinder: 4, sphere: 2 |
| dyn | 0: 10 |
| tracked | 0: 5, 1: 5 |
| infov | 0: 9, 1: 1 |
| mode | 2: 10 |
| static | 0: 5, NaN: 5 |

| stucks by | count |
|---|---|
| cls | stuck: 26 |
| shape | box: 20, cylinder: 2, sphere: 4 |
| dyn | 0: 26 |
| tracked | 1: 26 |
| infov | 0: 16, 1: 10 |
| mode | 2: 26 |
| static | 0: 10, 1: 16 |

### SR K100: 480 runs

| cause | rate [95% CI] |
|---|---|
| collision-tracked | 47/480 (9.8%) [7.4, 12.8] |
| collision-untracked | 25/480 (5.2%) [3.6, 7.6] |

| swept value | runs failed [95% CI] |
|---|---|
| 2 | 22/120 (18.3%) [12.4, 26.2] |
| 4 | 17/120 (14.2%) [9.0, 21.5] |
| 6 | 16/120 (13.3%) [8.4, 20.6] |
| 8 | 17/120 (14.2%) [9.0, 21.5] |

| layout | runs failed [95% CI] |
|---|---|
| clusters | 6/116 (5.2%) [2.4, 10.8] |
| corridor | 5/100 (5.0%) [2.2, 11.2] |
| forest | 36/84 (42.9%) [32.8, 53.5] |
| mixed | 22/116 (19.0%) [12.9, 27.0] |
| uniform | 3/64 (4.7%) [1.6, 12.9] |

| movers | runs failed [95% CI] |
|---|---|
| no | 22/156 (14.1%) [9.5, 20.4] |
| yes | 50/324 (15.4%) [11.9, 19.8] |

| collisions by | count |
|---|---|
| cls | collision-tracked: 47, collision-untracked: 25 |
| shape | box: 17, cylinder: 50, sphere: 5 |
| dyn | 0: 68, 1: 4 |
| tracked | 0: 25, 1: 47 |
| infov | 0: 65, 1: 7 |
| mode | 2: 72 |
| static | 0: 34, 1: 13, NaN: 25 |

### SR K50: 480 runs

| cause | rate [95% CI] |
|---|---|
| collision-tracked | 33/480 (6.9%) [4.9, 9.5] |
| collision-untracked | 20/480 (4.2%) [2.7, 6.3] |

| swept value | runs failed [95% CI] |
|---|---|
| 2 | 18/120 (15.0%) [9.7, 22.5] |
| 4 | 12/120 (10.0%) [5.8, 16.7] |
| 6 | 13/120 (10.8%) [6.4, 17.7] |
| 8 | 10/120 (8.3%) [4.6, 14.7] |

| layout | runs failed [95% CI] |
|---|---|
| clusters | 3/116 (2.6%) [0.9, 7.3] |
| corridor | 10/100 (10.0%) [5.5, 17.4] |
| forest | 17/84 (20.2%) [13.0, 30.0] |
| mixed | 19/116 (16.4%) [10.7, 24.2] |
| uniform | 4/64 (6.2%) [2.5, 15.0] |

| movers | runs failed [95% CI] |
|---|---|
| no | 22/156 (14.1%) [9.5, 20.4] |
| yes | 31/324 (9.6%) [6.8, 13.3] |

| collisions by | count |
|---|---|
| cls | collision-tracked: 33, collision-untracked: 20 |
| shape | box: 11, cylinder: 30, sphere: 12 |
| dyn | 0: 49, 1: 4 |
| tracked | 0: 20, 1: 33 |
| infov | 0: 48, 1: 5 |
| mode | 2: 53 |
| static | 0: 27, 1: 6, NaN: 20 |

```


## Round 3 — commit b377220: static-only algorithm (CI runs 37960562670, 37960572524, 37960582125, 37960591610)

Algorithm: obstacles assumed static (tracks are static landmarks, no velocity), obstacle memory 10 m
(MEM10 = default = E_DART), kappa = 0.5, no time limit. Same 120 worlds as rounds 1-2 (MATLAB
generator) x 2/4/6/8 m/s x 5 variants = 2400 runs: memory 10 / 3 / 0 m, and fixed perception rates
3 Hz and 10 Hz with the same safety layers and memory. The worlds are split with the WORLD lines of
the logs: 39 static-only worlds (in scope) and 81 worlds with movers (test only; the algorithm is not
told). Tables: `python3 parse_r3.py 'raw/r3[abcd]_SR_speed_*.log'`.

Note: GNU Octave has no RandStream, so worlds and noise generated in Octave differ from MATLAB;
all reported results use the MATLAB engine.

2400 runs; 81 of 120 worlds with movers

### static-only worlds

| variant | speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s |
|---|---|---|---|---|---|---|---|---|
| MEM10 | 2 | 39 | 39 (100% [91, 100]) | 0 | 0 | 31.6 | 106 | 3.25 |
| MEM10 | 4 | 39 | 39 (100% [91, 100]) | 0 | 0 | 18.6 | 105 | 5.61 |
| MEM10 | 6 | 39 | 39 (100% [91, 100]) | 0 | 0 | 17.5 | 120 | 6.49 |
| MEM10 | 8 | 39 | 38 (97% [87, 100]) | 1 | 0 | 15.9 | 108 | 6.55 |
| MEM3 | 2 | 39 | 37 (95% [83, 99]) | 1 | 1 | 30.4 | 105 | 3.41 |
| MEM3 | 4 | 39 | 38 (97% [87, 100]) | 1 | 0 | 18.4 | 107 | 5.66 |
| MEM3 | 6 | 39 | 36 (92% [80, 97]) | 3 | 0 | 16.9 | 114 | 6.47 |
| MEM3 | 8 | 39 | 36 (92% [80, 97]) | 3 | 0 | 18.2 | 114 | 6.36 |
| MEM0 | 2 | 39 | 32 (82% [67, 91]) | 7 | 0 | 28.4 | 86 | 3.51 |
| MEM0 | 4 | 39 | 36 (92% [80, 97]) | 3 | 0 | 17.8 | 102 | 5.77 |
| MEM0 | 6 | 39 | 32 (82% [67, 91]) | 7 | 0 | 15.8 | 106 | 6.64 |
| MEM0 | 8 | 39 | 29 (74% [59, 85]) | 10 | 0 | 14.3 | 94 | 6.86 |
| FR_SAFE_3 | 2 | 39 | 39 (100% [91, 100]) | 0 | 0 | 33.3 | 99 | 2.96 |
| FR_SAFE_3 | 4 | 39 | 38 (97% [87, 100]) | 0 | 1 | 19.1 | 57 | 2.96 |
| FR_SAFE_3 | 6 | 39 | 39 (100% [91, 100]) | 0 | 0 | 19.5 | 58 | 2.97 |
| FR_SAFE_3 | 8 | 39 | 39 (100% [91, 100]) | 0 | 0 | 19.1 | 57 | 2.97 |
| FR_SAFE_10 | 2 | 39 | 38 (97% [87, 100]) | 1 | 0 | 33.5 | 310 | 9.28 |
| FR_SAFE_10 | 4 | 39 | 39 (100% [91, 100]) | 0 | 0 | 18.0 | 167 | 9.29 |
| FR_SAFE_10 | 6 | 39 | 39 (100% [91, 100]) | 0 | 0 | 17.0 | 160 | 9.29 |
| FR_SAFE_10 | 8 | 39 | 39 (100% [91, 100]) | 0 | 0 | 16.0 | 145 | 9.30 |

MEM10 collisions (1): dyn {'0': 1}; infov {'0': 1}; shape {'cylinder': 1}; nupd {'>5': 1}; seen {'<1 s': 1}
MEM3 collisions (8): dyn {'0': 8}; infov {'0': 6, '1': 2}; shape {'cylinder': 8}; nupd {'-': 3, '1': 2, '2-5': 3}; seen {'<1 s': 7, '>5 s': 1}
MEM0 collisions (27): dyn {'0': 27}; infov {'0': 25, '1': 2}; shape {'box': 4, 'cylinder': 21, 'sphere': 2}; nupd {'-': 9, '1': 8, '2-5': 9, '>5': 1}; seen {'<1 s': 23, '1-5 s': 4}
FR_SAFE_10 collisions (1): dyn {'0': 1}; infov {'0': 1}; shape {'cylinder': 1}; nupd {'>5': 1}; seen {'<1 s': 1}

### worlds with movers

| variant | speed | n | goal [95% CI] | collision | stuck | time to goal, median [s] | inferences per mission (goal), median | inferences / s |
|---|---|---|---|---|---|---|---|---|
| MEM10 | 2 | 81 | 57 (70% [60, 79]) | 24 | 0 | 38.4 | 122 | 3.36 |
| MEM10 | 4 | 81 | 55 (68% [57, 77]) | 26 | 0 | 23.0 | 126 | 5.70 |
| MEM10 | 6 | 81 | 59 (73% [62, 81]) | 22 | 0 | 19.5 | 119 | 6.52 |
| MEM10 | 8 | 81 | 67 (83% [73, 89]) | 14 | 0 | 19.6 | 129 | 6.52 |
| MEM3 | 2 | 81 | 50 (62% [51, 72]) | 29 | 2 | 36.2 | 132 | 3.85 |
| MEM3 | 4 | 81 | 60 (74% [64, 82]) | 19 | 2 | 23.9 | 137 | 5.84 |
| MEM3 | 6 | 81 | 62 (77% [66, 84]) | 19 | 0 | 20.8 | 126 | 6.59 |
| MEM3 | 8 | 81 | 68 (84% [74, 90]) | 13 | 0 | 20.4 | 131 | 6.56 |
| MEM0 | 2 | 81 | 47 (58% [47, 68]) | 34 | 0 | 33.3 | 125 | 3.92 |
| MEM0 | 4 | 81 | 42 (52% [41, 62]) | 39 | 0 | 20.8 | 116 | 6.24 |
| MEM0 | 6 | 81 | 55 (68% [57, 77]) | 26 | 0 | 18.1 | 119 | 6.53 |
| MEM0 | 8 | 81 | 57 (70% [60, 79]) | 24 | 0 | 16.5 | 103 | 6.76 |
| FR_SAFE_3 | 2 | 81 | 53 (65% [55, 75]) | 28 | 0 | 36.9 | 109 | 2.96 |
| FR_SAFE_3 | 4 | 81 | 64 (79% [69, 86]) | 17 | 0 | 24.2 | 72 | 2.97 |
| FR_SAFE_3 | 6 | 81 | 66 (81% [72, 88]) | 15 | 0 | 21.6 | 64 | 2.97 |
| FR_SAFE_3 | 8 | 81 | 64 (79% [69, 86]) | 16 | 1 | 19.9 | 59 | 2.98 |
| FR_SAFE_10 | 2 | 81 | 52 (64% [53, 74]) | 29 | 0 | 37.2 | 345 | 9.31 |
| FR_SAFE_10 | 4 | 81 | 54 (67% [56, 76]) | 27 | 0 | 21.9 | 202 | 9.32 |
| FR_SAFE_10 | 6 | 81 | 57 (70% [60, 79]) | 24 | 0 | 19.0 | 178 | 9.32 |
| FR_SAFE_10 | 8 | 81 | 67 (83% [73, 89]) | 14 | 0 | 18.1 | 168 | 9.32 |

MEM10 collisions (86): dyn {'1': 86}; infov {'0': 67, '1': 19}; shape {'cylinder': 30, 'sphere': 29, 'box': 27}; nupd {'2-5': 36, '>5': 44, '-': 1, '1': 5}; seen {'<1 s': 77, '1-5 s': 7, '>5 s': 2}
MEM3 collisions (80): dyn {'1': 59, '0': 21}; infov {'1': 13, '0': 67}; shape {'sphere': 23, 'box': 28, 'cylinder': 29}; nupd {'1': 12, '2-5': 30, '>5': 34, '-': 4}; seen {'1-5 s': 8, '<1 s': 70, '>5 s': 1, 'never': 1}
MEM0 collisions (123): dyn {'1': 65, '0': 58}; infov {'1': 18, '0': 105}; shape {'sphere': 31, 'cylinder': 50, 'box': 42}; nupd {'-': 45, '2-5': 47, '1': 17, '>5': 14}; seen {'<1 s': 103, '1-5 s': 17, '>5 s': 2, 'never': 1}
FR_SAFE_3 collisions (76): dyn {'1': 73, '0': 3}; infov {'0': 62, '1': 14}; shape {'sphere': 23, 'box': 39, 'cylinder': 14}; nupd {'1': 14, '>5': 18, '2-5': 43, '-': 1}; seen {'<1 s': 72, '>5 s': 1, '1-5 s': 3}
FR_SAFE_10 collisions (94): dyn {'1': 94}; infov {'0': 81, '1': 13}; shape {'cylinder': 25, 'sphere': 28, 'box': 41}; nupd {'>5': 46, '2-5': 33, '1': 14, '-': 1}; seen {'<1 s': 86, '1-5 s': 6, '>5 s': 1, 'never': 1}


### Findings

1. **Static-only worlds (the scope): the default is safe.** MEM10: 155/156 runs reach the goal,
   1 collision (a pole, out of view). The memory is needed: 3 m -> 8 collisions, no memory -> 27
   collisions (mostly poles out of view, tracks lost when they left the view).
2. **The adaptive scheduler is NOT compute-minimal.** A fixed 3 Hz rate with the same safety layers
   and memory is as safe (155/156, 0 collisions, 1 stuck) with about HALF the inferences at 4-8 m/s
   (57-58 vs 105-120 per mission; 2.97 vs 5.6-6.6 inferences/s), at the cost of 0-3 s longer
   missions. At 2 m/s both need ~100 per mission (3 Hz: 99; adaptive: 106). The scheduler fires far
   more often than the static problem requires - this is the core gap for the research question
   (minimal computation for static-obstacle avoidance).
3. **Worlds with movers (out of scope):** 52-83 % success for every variant; the collisions are with
   moving obstacles (MEM10: 86/86), as expected for a static-only algorithm.
