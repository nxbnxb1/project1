# DART ablation summary

Sweep: camspeed = 406

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.50 (0.51) | 80.27 (28.59) | 4.82 (0.96) | 86 (42) | 1.05 (0.31) | 414.0 (202.9) | 18.0 (2.2) | 2.5 (0.8) | 1.17 (0.37) | 12% | 2.77 (0.91) |
| FR_SAFE_3 | 30 | 100% [89, 100] | 0% [0, 11] | 1.51 (0.46) | 72.65 (19.05) | 5.15 (0.57) | 195 (51) | 2.69 (0.02) | 938.2 (246.1) | 18.5 (2.5) | 2.8 (1.0) | 1.24 (0.43) | 14% | 3.15 (0.94) |


