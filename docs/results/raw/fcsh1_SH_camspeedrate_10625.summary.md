# DART ablation summary

Sweep: camspeedrate = 10625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.52 (0.45) | 116.37 (28.94) | 3.65 (0.68) | 158 (95) | 1.61 (0.35) | 193.4 (117.4) | 23.2 (1.7) | 12.5 (2.3) | 2.12 (0.28) | 39% | 2.39 (1.07) |
| FR_SAFE | 15 | 93% [70, 99] | 0% [0, 20] | 0.88 (0.33) | 127.68 (49.86) | 3.44 (1.02) | 326 (122) | 2.51 (0.00) | 398.1 (152.8) | 24.5 (1.5) | 14.8 (1.5) | 2.33 (0.24) | 40% | 2.31 (0.43) |


