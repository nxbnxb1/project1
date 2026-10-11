# DART ablation summary

Sweep: camspeed = 215

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 40% [20, 64] | 0.49 (0.53) | 92.23 (37.68) | 4.77 (1.91) | 99 (59) | 1.63 (0.52) | 117.8 (69.9) | 20.4 (2.9) | 5.1 (0.9) | 1.65 (0.42) | 39% | 2.62 (1.39) |
| FR_SAFE_3 | 15 | 60% [36, 80] | 33% [15, 58] | 0.70 (0.65) | 88.72 (25.66) | 5.22 (1.46) | 225 (117) | 2.96 (0.04) | 270.2 (139.7) | 22.0 (2.4) | 6.0 (1.2) | 1.90 (0.41) | 44% | 2.55 (0.76) |


