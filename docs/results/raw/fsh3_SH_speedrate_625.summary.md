# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.68 (0.47) | 98.71 (22.32) | 3.98 (0.89) | 168 (79) | 1.83 (0.43) | 199.7 (94.5) | 24.9 (1.9) | 11.0 (1.7) | 2.38 (0.36) | 30% | 2.10 (0.59) |
| FR_SAFE | 10 | 70% [40, 89] | 30% [11, 60] | 0.50 (0.43) | 83.88 (13.45) | 4.42 (0.59) | 175 (69) | 2.51 (0.01) | 207.7 (82.2) | 25.2 (1.9) | 11.3 (1.8) | 2.40 (0.35) | 28% | 2.23 (0.50) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.72 (0.38) | 81.88 (22.49) | 4.65 (0.69) | 135 (58) | 1.76 (0.11) | 161.0 (71.1) | 24.9 (1.8) | 11.0 (1.7) | 2.35 (0.31) | 24% | 2.02 (0.51) |


