# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 85% [64, 95] | 10% [3, 30] | 1.04 (0.59) | 62.66 (10.45) | 5.06 (1.00) | 117 (56) | 1.93 (0.58) | 141.7 (68.4) | 19.8 (3.0) | 9.1 (3.8) | 1.45 (0.54) | 13% | 2.58 (0.71) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.05 (0.47) | 60.12 (8.32) | 5.39 (0.42) | 208 (29) | 3.46 (0.01) | 249.8 (35.0) | 19.3 (2.6) | 8.7 (3.0) | 1.37 (0.45) | 11% | 2.94 (1.20) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.00 (0.43) | 64.90 (16.56) | 5.18 (0.70) | 108 (46) | 1.61 (0.26) | 129.9 (55.5) | 19.5 (2.4) | 8.3 (3.0) | 1.39 (0.44) | 12% | 2.60 (0.92) |


