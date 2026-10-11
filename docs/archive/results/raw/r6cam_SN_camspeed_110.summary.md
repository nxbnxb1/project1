# DART ablation summary

Sweep: camspeed = 110

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 1.34 (1.07) | 51.46 (29.42) | 6.77 (2.62) | 70 (54) | 1.19 (0.34) | 85.1 (64.4) | 20.0 (2.2) | 3.9 (1.3) | 1.37 (0.31) | 21% | 2.35 (0.89) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 7% [1, 30] | 1.61 (0.87) | 57.98 (37.88) | 6.35 (2.53) | 180 (110) | 2.95 (0.01) | 218.5 (134.7) | 20.6 (2.0) | 4.6 (1.2) | 1.50 (0.29) | 23% | 3.18 (0.99) |


