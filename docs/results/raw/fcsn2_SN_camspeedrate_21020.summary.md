# DART ablation summary

Sweep: camspeedrate = 21020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 20% [10, 37] | 0.85 (0.80) | 54.75 (19.60) | 6.89 (1.79) | 66 (42) | 1.35 (0.34) | 79.3 (49.8) | 22.2 (1.6) | 7.1 (2.5) | 1.77 (0.34) | 25% | 2.24 (0.75) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 1.12 (0.91) | 60.97 (27.92) | 5.96 (2.24) | 114 (56) | 2.01 (0.01) | 137.0 (68.3) | 22.7 (1.9) | 8.7 (3.7) | 1.89 (0.41) | 32% | 2.50 (1.39) |


