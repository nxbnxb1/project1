# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 60% [31, 83] | 40% [17, 69] | 0.49 (0.49) | 81.98 (19.24) | 4.39 (0.80) | 167 (124) | 2.44 (0.91) | 198.5 (150.0) | 24.5 (2.0) | 10.5 (1.7) | 2.27 (0.36) | 23% | 2.25 (0.70) |
| FR_SAFE | 10 | 70% [40, 89] | 30% [11, 60] | 0.60 (0.47) | 74.34 (13.64) | 4.77 (0.52) | 269 (88) | 4.01 (0.02) | 321.4 (105.8) | 24.8 (1.8) | 11.3 (1.6) | 2.32 (0.34) | 25% | 2.43 (0.64) |
| E_DART | 10 | 60% [31, 83] | 40% [17, 69] | 0.58 (0.56) | 75.49 (28.22) | 4.99 (0.73) | 125 (94) | 2.33 (0.34) | 148.6 (109.9) | 24.3 (2.1) | 10.5 (1.8) | 2.22 (0.40) | 19% | 2.06 (0.44) |


