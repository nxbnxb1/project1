# DART ablation summary

Sweep: camspeed = 110

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 47% [25, 70] | 0.74 (0.97) | 44.47 (20.01) | 6.68 (3.02) | 95 (62) | 2.19 (1.06) | 114.6 (74.3) | 19.8 (2.8) | 2.0 (0.8) | 1.34 (0.38) | 20% | 2.88 (1.58) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 7% [1, 30] | 1.61 (0.87) | 57.98 (37.88) | 6.35 (2.53) | 180 (110) | 2.95 (0.01) | 218.5 (134.7) | 20.6 (2.0) | 2.5 (0.7) | 1.50 (0.29) | 23% | 3.18 (0.99) |


