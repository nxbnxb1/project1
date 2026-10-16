# DART ablation summary

Sweep: camspeedrate = 41540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 3.68 (2.72) | 27.78 (14.48) | 8.32 (2.54) | 56 (67) | 1.53 (0.51) | 268.5 (316.0) | 23.4 (1.9) | 8.0 (5.5) | 2.03 (0.43) | 28% | 3.60 (2.71) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.67 (2.29) | 28.38 (15.14) | 8.44 (2.22) | 83 (44) | 2.92 (0.07) | 396.4 (210.3) | 23.1 (1.8) | 8.1 (5.1) | 1.98 (0.39) | 27% | 3.87 (2.63) |


