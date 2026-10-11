# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.33 (0.88) | 42.51 (13.54) | 8.23 (1.94) | 51 (19) | 1.20 (0.11) | 61.5 (22.6) | 25.1 (1.2) | 7.3 (2.9) | 2.33 (0.25) | 34% | 2.58 (1.21) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.33 (0.76) | 40.70 (12.06) | 8.43 (1.83) | 60 (19) | 1.51 (0.01) | 72.4 (22.2) | 25.1 (1.1) | 7.1 (2.6) | 2.33 (0.24) | 34% | 2.49 (0.74) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.22 (0.48) | 44.21 (16.27) | 7.98 (2.02) | 59 (22) | 1.34 (0.03) | 71.0 (26.3) | 25.0 (1.3) | 7.5 (3.1) | 2.33 (0.28) | 36% | 2.51 (0.76) |


