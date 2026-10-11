# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 30% [11, 60] | 0.45 (0.47) | 82.45 (40.27) | 5.10 (1.13) | 84 (55) | 1.21 (0.18) | 100.8 (67.0) | 26.3 (0.7) | 15.9 (1.4) | 2.66 (0.13) | 50% | 2.25 (0.46) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.91 (0.47) | 67.45 (17.67) | 5.47 (0.87) | 96 (30) | 1.50 (0.00) | 113.3 (36.3) | 26.5 (0.9) | 16.0 (1.2) | 2.68 (0.18) | 50% | 2.23 (0.33) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.64 (0.58) | 78.70 (28.50) | 5.64 (1.77) | 82 (48) | 1.36 (0.05) | 97.6 (58.1) | 26.5 (0.7) | 15.8 (1.5) | 2.70 (0.12) | 53% | 2.09 (0.46) |


