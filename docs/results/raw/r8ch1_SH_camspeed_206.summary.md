# DART ablation summary

Sweep: camspeed = 206

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 7% [1, 30] | 1.20 (0.88) | 153.81 (51.35) | 2.36 (1.03) | 140 (66) | 1.03 (0.36) | 169.6 (79.1) | 17.8 (2.4) | 5.2 (0.9) | 1.28 (0.36) | 30% | 2.50 (0.85) |
| FR_SAFE_3 | 15 | 73% [48, 89] | 7% [1, 30] | 1.26 (0.52) | 132.62 (42.27) | 3.52 (0.77) | 382 (128) | 2.95 (0.00) | 460.2 (156.1) | 22.9 (1.8) | 7.7 (1.1) | 2.07 (0.29) | 45% | 2.53 (0.34) |


