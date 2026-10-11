# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.72 (0.42) | 56.60 (17.25) | 6.22 (1.18) | 168 (71) | 3.10 (0.95) | 199.1 (85.8) | 26.2 (1.6) | 15.9 (1.9) | 2.62 (0.27) | 47% | 2.26 (0.43) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.90 (0.31) | 53.18 (5.64) | 6.50 (0.47) | 266 (28) | 5.01 (0.01) | 317.4 (35.7) | 26.3 (0.7) | 16.5 (0.9) | 2.64 (0.14) | 48% | 2.23 (0.58) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.99 (0.32) | 58.70 (14.22) | 6.02 (1.06) | 199 (45) | 3.42 (0.35) | 236.5 (54.4) | 26.4 (1.3) | 16.2 (1.3) | 2.66 (0.25) | 51% | 2.00 (0.41) |


