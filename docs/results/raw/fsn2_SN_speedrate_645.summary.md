# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.06 (0.47) | 61.19 (8.84) | 5.33 (0.47) | 124 (55) | 1.98 (0.64) | 147.4 (63.9) | 18.3 (2.4) | 8.2 (3.5) | 1.20 (0.41) | 8% | 2.52 (0.74) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 0.96 (0.28) | 57.09 (4.57) | 5.61 (0.21) | 249 (20) | 4.36 (0.00) | 295.8 (22.9) | 18.2 (2.3) | 8.5 (3.4) | 1.17 (0.39) | 7% | 2.52 (0.78) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 0.96 (0.38) | 58.80 (6.75) | 5.50 (0.29) | 95 (28) | 1.59 (0.30) | 113.0 (32.6) | 18.1 (2.3) | 7.6 (3.3) | 1.16 (0.40) | 8% | 2.01 (0.66) |


