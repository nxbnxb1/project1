# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.73 (0.48) | 82.42 (23.14) | 4.59 (0.83) | 220 (141) | 2.98 (1.33) | 263.1 (168.4) | 24.2 (1.7) | 15.6 (2.4) | 2.22 (0.31) | 21% | 1.92 (0.42) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.53 (0.42) | 67.26 (7.71) | 5.12 (0.30) | 286 (112) | 5.01 (0.01) | 341.7 (134.2) | 24.0 (2.1) | 16.3 (2.2) | 2.17 (0.37) | 18% | 2.27 (0.59) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.59 (0.46) | 75.55 (18.19) | 4.83 (0.59) | 178 (81) | 2.68 (0.30) | 212.1 (98.7) | 24.9 (1.8) | 16.6 (2.8) | 2.33 (0.34) | 23% | 2.04 (0.45) |


