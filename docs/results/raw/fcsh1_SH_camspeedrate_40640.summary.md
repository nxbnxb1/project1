# DART ablation summary

Sweep: camspeedrate = 40640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.82 (0.36) | 88.33 (25.23) | 4.41 (0.66) | 168 (85) | 1.92 (0.42) | 809.1 (402.6) | 25.5 (0.9) | 11.7 (1.0) | 2.47 (0.17) | 29% | 2.08 (0.39) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.85 (0.31) | 93.52 (23.80) | 4.29 (0.67) | 271 (71) | 2.89 (0.03) | 1302.1 (329.1) | 25.5 (0.8) | 12.5 (0.8) | 2.46 (0.17) | 32% | 2.27 (0.39) |


