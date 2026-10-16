# DART ablation summary

Sweep: camspeedrate = 11020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.33 (0.90) | 49.36 (21.43) | 7.24 (1.78) | 61 (42) | 1.20 (0.31) | 73.9 (49.9) | 22.4 (1.7) | 7.3 (3.2) | 1.79 (0.39) | 25% | 2.44 (0.74) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.39 (0.72) | 57.40 (32.87) | 7.08 (2.05) | 112 (65) | 2.01 (0.01) | 136.0 (78.0) | 22.7 (2.0) | 8.1 (3.8) | 1.84 (0.44) | 26% | 2.69 (0.80) |


