# DART ablation summary

Sweep: camspeedrate = 20640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.09 (0.55) | 72.00 (18.84) | 4.83 (0.87) | 135 (83) | 1.76 (0.66) | 163.3 (99.1) | 18.8 (2.2) | 7.4 (2.9) | 1.32 (0.39) | 16% | 2.40 (0.81) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.00 (0.45) | 66.86 (17.07) | 5.08 (0.69) | 258 (78) | 4.01 (0.01) | 309.3 (94.8) | 19.2 (2.6) | 8.6 (3.3) | 1.35 (0.46) | 13% | 2.97 (1.10) |


