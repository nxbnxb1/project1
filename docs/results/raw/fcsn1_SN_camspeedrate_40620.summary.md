# DART ablation summary

Sweep: camspeedrate = 40620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.29 (0.34) | 68.64 (19.59) | 5.14 (0.68) | 71 (44) | 0.97 (0.32) | 342.8 (213.2) | 18.9 (3.1) | 7.5 (3.8) | 1.32 (0.55) | 13% | 2.44 (0.73) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.27 (0.63) | 69.23 (16.04) | 4.96 (0.71) | 139 (31) | 2.00 (0.01) | 670.3 (155.2) | 19.3 (3.1) | 8.5 (4.0) | 1.39 (0.55) | 15% | 2.75 (0.88) |


