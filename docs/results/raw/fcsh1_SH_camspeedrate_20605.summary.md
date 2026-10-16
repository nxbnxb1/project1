# DART ablation summary

Sweep: camspeedrate = 20605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 13% [4, 38] | 87% [62, 96] | 0.00 (0.05) | 195.32 (4.59) | 3.67 (1.25) | 30 (28) | 0.46 (0.05) | 36.2 (34.0) | 20.8 (2.5) | 8.4 (2.2) | 1.73 (0.45) | 36% | 2.33 (0.71) |
| FR_SAFE | 15 | 7% [1, 30] | 87% [62, 96] | 0.15 (0.47) | 209.19 (0.00) | 3.18 (1.47) | 40 (31) | 0.52 (0.04) | 47.7 (37.0) | 21.4 (2.2) | 9.4 (2.8) | 1.83 (0.39) | 32% | 2.04 (0.49) |


