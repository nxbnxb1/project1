# DART ablation summary

Sweep: camspeedrate = 11545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.76 (1.64) | 30.31 (14.37) | 7.94 (2.35) | 68 (58) | 1.86 (0.83) | 83.0 (72.0) | 22.5 (1.8) | 7.0 (4.9) | 1.83 (0.44) | 24% | 3.91 (2.69) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 2.86 (1.79) | 31.94 (18.87) | 7.81 (2.70) | 150 (92) | 4.36 (0.01) | 183.5 (112.8) | 22.3 (2.2) | 7.6 (5.4) | 1.81 (0.47) | 26% | 3.89 (2.51) |


