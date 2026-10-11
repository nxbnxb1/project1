# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.39) | 76.05 (19.58) | 4.80 (1.13) | 119 (32) | 1.60 (0.20) | 143.0 (39.7) | 26.2 (1.4) | 16.4 (1.2) | 2.64 (0.24) | 48% | 2.13 (0.60) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.81 (0.60) | 66.27 (16.24) | 5.54 (0.98) | 133 (32) | 2.01 (0.00) | 159.3 (39.9) | 26.6 (0.7) | 16.3 (1.2) | 2.71 (0.14) | 52% | 1.98 (0.28) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.71 (0.43) | 70.75 (27.79) | 5.72 (1.48) | 106 (59) | 1.68 (0.09) | 128.1 (71.1) | 26.5 (1.9) | 15.9 (2.3) | 2.67 (0.39) | 50% | 2.38 (0.62) |


