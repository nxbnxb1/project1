# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.59 (0.43) | 60.50 (9.99) | 5.52 (1.04) | 159 (63) | 2.64 (0.77) | 189.7 (76.5) | 26.5 (1.2) | 16.7 (2.0) | 2.69 (0.24) | 48% | 2.19 (0.36) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.87 (0.51) | 58.95 (13.06) | 6.12 (0.86) | 202 (87) | 4.01 (0.01) | 240.1 (102.8) | 26.3 (0.9) | 16.7 (1.7) | 2.64 (0.18) | 45% | 2.11 (0.31) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.40) | 62.50 (14.53) | 5.78 (0.91) | 171 (47) | 2.88 (0.15) | 203.5 (56.8) | 26.5 (0.6) | 17.1 (1.3) | 2.68 (0.11) | 47% | 2.21 (0.35) |


