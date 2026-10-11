# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.76 (0.35) | 63.39 (20.89) | 5.74 (1.01) | 205 (122) | 3.07 (0.96) | 245.7 (143.1) | 26.9 (0.7) | 16.4 (1.1) | 2.74 (0.15) | 46% | 2.26 (0.62) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.59 (0.47) | 53.43 (7.14) | 6.22 (0.91) | 234 (78) | 5.01 (0.01) | 281.2 (92.9) | 26.1 (1.0) | 16.9 (1.2) | 2.59 (0.18) | 45% | 2.26 (0.42) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.92 (0.26) | 54.95 (8.00) | 6.19 (0.69) | 190 (25) | 3.47 (0.25) | 228.8 (30.3) | 26.6 (1.1) | 16.5 (1.0) | 2.70 (0.20) | 46% | 2.17 (0.36) |


