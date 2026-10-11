# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 60% [31, 83] | 40% [17, 69] | 0.47 (0.52) | 114.93 (61.52) | 4.02 (0.95) | 100 (89) | 1.17 (0.18) | 119.9 (108.0) | 24.9 (1.7) | 7.8 (1.3) | 2.38 (0.29) | 30% | 1.94 (0.47) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.70 (0.50) | 84.73 (21.30) | 4.59 (0.87) | 106 (52) | 1.50 (0.02) | 125.8 (61.8) | 24.5 (2.0) | 7.5 (1.3) | 2.27 (0.39) | 23% | 2.32 (0.62) |
| E_DART | 10 | 50% [24, 76] | 50% [24, 76] | 0.38 (0.52) | 99.38 (24.26) | 4.16 (1.27) | 84 (57) | 1.29 (0.06) | 99.0 (69.1) | 25.0 (2.3) | 7.7 (1.6) | 2.38 (0.43) | 31% | 2.02 (0.70) |


