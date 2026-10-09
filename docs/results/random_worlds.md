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


## Round 2 — commit d3ed301 (CI runs 37924654187, 37924662662, 37924670369, 37924678333)

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
