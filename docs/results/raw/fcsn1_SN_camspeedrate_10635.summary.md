# DART ablation summary

Sweep: camspeedrate = 10635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.08 (0.65) | 72.13 (22.82) | 4.72 (1.00) | 123 (84) | 1.55 (0.60) | 150.7 (103.0) | 18.8 (2.7) | 7.7 (3.7) | 1.32 (0.49) | 17% | 2.70 (0.89) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.17 (0.54) | 67.45 (17.87) | 5.11 (0.68) | 231 (63) | 3.46 (0.01) | 281.7 (76.8) | 18.7 (2.8) | 7.9 (3.5) | 1.28 (0.49) | 15% | 2.87 (0.70) |


