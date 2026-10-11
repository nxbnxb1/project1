# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.56 (0.75) | 38.77 (12.09) | 8.68 (1.91) | 67 (30) | 1.74 (0.25) | 79.5 (35.6) | 24.5 (1.0) | 8.9 (3.6) | 2.21 (0.23) | 30% | 2.18 (0.64) |
| FR_SAFE | 20 | 95% [76, 99] | 0% [0, 16] | 1.41 (0.41) | 39.58 (11.29) | 8.25 (2.40) | 103 (32) | 2.52 (0.01) | 122.4 (36.5) | 25.0 (1.6) | 9.7 (4.2) | 2.32 (0.35) | 36% | 2.60 (1.14) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.51 (0.66) | 39.61 (12.86) | 8.61 (1.80) | 77 (28) | 1.94 (0.11) | 91.6 (32.1) | 24.7 (1.3) | 8.9 (3.5) | 2.26 (0.27) | 33% | 2.48 (0.73) |


