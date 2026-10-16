# DART ablation summary

Sweep: camspeedrate = 20610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 13% [5, 30] | 1.23 (0.86) | 90.31 (41.15) | 4.08 (1.32) | 66 (41) | 0.65 (0.18) | 78.6 (49.6) | 18.0 (2.4) | 4.6 (1.9) | 1.22 (0.43) | 19% | 2.30 (0.60) |
| FR_SAFE | 30 | 70% [52, 83] | 13% [5, 30] | 1.15 (0.83) | 75.84 (26.21) | 4.04 (1.46) | 82 (26) | 1.01 (0.00) | 98.5 (30.8) | 19.0 (2.6) | 5.5 (2.5) | 1.38 (0.49) | 21% | 2.67 (0.76) |


