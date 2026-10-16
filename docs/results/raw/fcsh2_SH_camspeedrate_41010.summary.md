# DART ablation summary

Sweep: camspeedrate = 41010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 53% [30, 75] | 0.45 (0.61) | 95.00 (30.04) | 4.91 (1.42) | 55 (38) | 0.92 (0.07) | 267.9 (181.9) | 25.9 (1.3) | 11.4 (1.8) | 2.58 (0.24) | 47% | 1.84 (0.51) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.64 (0.49) | 95.66 (38.41) | 4.86 (1.56) | 80 (48) | 1.01 (0.02) | 386.1 (232.5) | 25.5 (1.6) | 11.4 (1.8) | 2.52 (0.32) | 47% | 1.97 (0.54) |


