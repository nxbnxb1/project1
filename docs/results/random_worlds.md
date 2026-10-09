# Random worlds (scenario SR): global failure analysis

Each round: the same 120 random worlds (seeds 1-120) flown at 2, 4, 6, 8 m/s (480 runs, MATLAB engine, variant E_DART). Failures are classified automatically (experiments/dart_failure_info.m) and aggregated with parse_failures.py; only causes that are frequent across strata are fixed.

## Round 1 — commit 5f2b0b7 (CI runs 37886490177, 37886497009)

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
