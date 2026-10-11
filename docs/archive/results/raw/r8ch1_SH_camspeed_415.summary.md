# DART ablation summary

Sweep: camspeed = 415

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 1.08 (0.81) | 76.47 (21.24) | 5.36 (1.58) | 122 (43) | 1.73 (0.41) | 587.7 (205.1) | 24.1 (3.1) | 8.3 (1.2) | 2.26 (0.48) | 42% | 2.62 (0.64) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 7% [1, 30] | 1.18 (0.60) | 63.18 (8.89) | 6.32 (0.64) | 162 (36) | 2.68 (0.02) | 785.9 (174.8) | 24.9 (0.8) | 8.2 (0.6) | 2.37 (0.16) | 44% | 2.56 (0.42) |


