# DART ablation summary

Sweep: camspeedrate = 10640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.09 (0.57) | 75.06 (27.01) | 4.72 (1.12) | 142 (110) | 1.80 (0.76) | 173.9 (136.1) | 18.9 (2.3) | 7.3 (3.0) | 1.34 (0.41) | 17% | 2.55 (0.74) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.01 (0.66) | 78.39 (30.29) | 4.71 (1.11) | 311 (120) | 4.01 (0.00) | 381.9 (147.7) | 18.8 (2.4) | 8.2 (3.0) | 1.33 (0.42) | 16% | 3.12 (1.08) |


