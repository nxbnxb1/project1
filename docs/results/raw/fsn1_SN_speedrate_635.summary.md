# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.21 (0.35) | 65.59 (17.09) | 5.19 (0.74) | 119 (70) | 1.71 (0.59) | 143.0 (85.6) | 19.0 (3.1) | 8.4 (4.2) | 1.33 (0.55) | 12% | 2.76 (0.84) |
| FR_SAFE | 20 | 95% [76, 99] | 0% [0, 16] | 1.15 (0.32) | 62.57 (15.61) | 5.20 (0.88) | 221 (56) | 3.46 (0.00) | 265.3 (67.0) | 19.0 (3.5) | 8.9 (4.6) | 1.32 (0.61) | 13% | 2.93 (1.13) |
| E_DART | 20 | 95% [76, 99] | 0% [0, 16] | 1.21 (0.36) | 61.58 (11.34) | 5.20 (0.75) | 103 (47) | 1.54 (0.28) | 124.0 (56.5) | 18.7 (2.9) | 7.9 (3.8) | 1.27 (0.51) | 12% | 2.92 (1.05) |


