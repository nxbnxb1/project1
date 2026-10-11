# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.71 (0.43) | 57.32 (9.29) | 6.26 (0.93) | 128 (73) | 2.61 (0.81) | 151.8 (87.5) | 25.9 (1.1) | 15.1 (1.8) | 2.56 (0.21) | 41% | 2.20 (0.34) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.64 (0.51) | 59.48 (18.70) | 6.16 (1.10) | 221 (108) | 4.36 (0.01) | 264.3 (127.8) | 26.5 (0.6) | 16.1 (1.6) | 2.66 (0.12) | 45% | 2.24 (0.53) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.66 (0.50) | 62.23 (21.18) | 6.32 (1.36) | 153 (83) | 3.06 (0.20) | 182.8 (101.1) | 26.4 (0.7) | 15.9 (1.3) | 2.65 (0.16) | 44% | 2.06 (0.29) |


