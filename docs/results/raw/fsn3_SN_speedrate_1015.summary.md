# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.44 (0.95) | 55.48 (20.13) | 6.61 (1.80) | 65 (31) | 1.12 (0.16) | 78.7 (37.3) | 24.2 (1.9) | 6.4 (2.0) | 2.15 (0.42) | 34% | 2.51 (0.62) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.20 (0.66) | 46.56 (13.97) | 7.24 (1.39) | 70 (20) | 1.51 (0.01) | 84.8 (24.8) | 23.8 (1.6) | 5.9 (1.8) | 2.05 (0.37) | 30% | 2.60 (0.91) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.43 (0.75) | 50.61 (17.85) | 6.96 (1.60) | 65 (24) | 1.27 (0.05) | 78.7 (30.2) | 24.0 (1.7) | 6.4 (2.2) | 2.10 (0.39) | 32% | 2.40 (0.64) |


