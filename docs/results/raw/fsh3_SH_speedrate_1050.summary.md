# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.86 (0.29) | 62.96 (16.14) | 5.66 (1.10) | 198 (84) | 3.09 (0.90) | 236.1 (102.2) | 26.1 (1.0) | 12.6 (1.0) | 2.61 (0.17) | 43% | 2.21 (0.34) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.78 (0.37) | 54.84 (8.33) | 6.42 (0.60) | 253 (80) | 5.02 (0.02) | 301.2 (94.4) | 26.3 (1.0) | 12.8 (1.5) | 2.64 (0.20) | 44% | 2.35 (0.58) |
| E_DART | 10 | 60% [31, 83] | 40% [17, 69] | 0.56 (0.56) | 64.50 (10.57) | 6.21 (1.11) | 149 (98) | 3.42 (0.23) | 176.9 (116.4) | 25.6 (1.2) | 11.6 (1.5) | 2.51 (0.22) | 46% | 1.96 (0.39) |


