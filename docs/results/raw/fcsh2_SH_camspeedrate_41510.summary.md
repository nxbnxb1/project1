# DART ablation summary

Sweep: camspeedrate = 41510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 33% [15, 58] | 0.55 (0.58) | 83.36 (29.07) | 4.89 (1.74) | 58 (33) | 0.91 (0.07) | 284.0 (157.9) | 26.1 (1.7) | 8.3 (1.5) | 2.62 (0.32) | 53% | 1.85 (0.51) |
| FR_SAFE | 15 | 53% [30, 75] | 40% [20, 64] | 0.50 (0.54) | 90.62 (46.54) | 4.88 (2.10) | 67 (49) | 1.02 (0.03) | 324.9 (233.2) | 25.8 (2.5) | 8.2 (1.9) | 2.57 (0.45) | 50% | 2.50 (0.84) |


