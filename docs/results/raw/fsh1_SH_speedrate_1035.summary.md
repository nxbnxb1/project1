# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 10% [2, 40] | 0.90 (0.48) | 64.99 (18.63) | 5.16 (1.45) | 156 (81) | 2.43 (0.66) | 186.7 (98.5) | 26.1 (1.5) | 16.1 (1.0) | 2.61 (0.23) | 41% | 2.25 (0.45) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.87 (0.31) | 70.75 (27.23) | 5.41 (1.11) | 244 (94) | 3.45 (0.01) | 293.5 (110.2) | 26.7 (0.7) | 17.3 (1.0) | 2.72 (0.14) | 48% | 2.22 (0.33) |
| E_DART | 10 | 70% [40, 89] | 20% [6, 51] | 0.67 (0.49) | 57.02 (10.80) | 5.68 (1.33) | 144 (61) | 2.50 (0.19) | 174.2 (72.6) | 26.1 (1.1) | 16.0 (2.2) | 2.61 (0.22) | 46% | 2.34 (0.69) |


