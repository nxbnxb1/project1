# DART ablation summary

Sweep: camspeed = 110

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 13% [5, 30] | 1.44 (0.99) | 63.88 (40.72) | 5.70 (2.51) | 83 (43) | 1.29 (0.48) | 101.5 (52.6) | 20.1 (2.6) | 4.4 (1.1) | 1.48 (0.39) | 27% | 2.38 (1.00) |
| FR_SAFE_3 | 30 | 90% [74, 97] | 7% [2, 21] | 1.36 (0.87) | 60.60 (28.99) | 6.69 (1.62) | 172 (92) | 2.95 (0.01) | 211.1 (114.1) | 21.8 (1.5) | 4.9 (1.5) | 1.72 (0.31) | 30% | 2.95 (1.49) |


