# DART ablation summary

Sweep: camspeed = 110

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 33% [15, 58] | 0.95 (1.19) | 132.13 (30.33) | 3.68 (2.02) | 112 (72) | 1.34 (0.50) | 137.9 (89.7) | 19.2 (3.1) | 3.1 (0.7) | 1.47 (0.45) | 38% | 2.37 (0.77) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 0% [0, 20] | 1.20 (0.59) | 101.94 (31.64) | 4.15 (1.43) | 302 (94) | 2.95 (0.00) | 368.8 (113.9) | 22.5 (2.6) | 4.2 (0.7) | 2.01 (0.40) | 48% | 2.26 (0.53) |


