# DART ablation summary

Sweep: camspeedrate = 20635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.17 (0.72) | 69.94 (20.60) | 4.93 (0.89) | 115 (83) | 1.48 (0.63) | 139.2 (98.3) | 18.8 (2.5) | 7.1 (2.9) | 1.30 (0.44) | 14% | 2.37 (0.92) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.06 (0.52) | 69.25 (18.89) | 4.98 (0.79) | 235 (72) | 3.46 (0.01) | 282.0 (89.2) | 19.3 (2.7) | 8.2 (3.2) | 1.39 (0.47) | 17% | 2.87 (0.97) |


