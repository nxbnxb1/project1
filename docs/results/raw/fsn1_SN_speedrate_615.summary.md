# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.13 (0.50) | 74.71 (22.09) | 4.66 (0.96) | 76 (38) | 0.94 (0.24) | 91.9 (46.1) | 19.4 (3.4) | 8.4 (4.1) | 1.41 (0.60) | 16% | 2.59 (0.78) |
| FR_SAFE | 20 | 95% [76, 99] | 0% [0, 16] | 1.08 (0.48) | 73.74 (28.33) | 4.78 (1.03) | 114 (43) | 1.50 (0.01) | 136.5 (52.9) | 19.6 (3.4) | 8.7 (4.2) | 1.44 (0.60) | 18% | 2.84 (1.06) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.13 (0.56) | 63.54 (10.97) | 5.19 (0.57) | 71 (18) | 1.14 (0.07) | 85.2 (21.2) | 18.8 (3.2) | 7.6 (3.8) | 1.29 (0.57) | 11% | 2.83 (1.25) |


