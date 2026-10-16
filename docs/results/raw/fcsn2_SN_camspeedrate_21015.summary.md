# DART ablation summary

Sweep: camspeedrate = 21015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 0.76 (0.79) | 57.41 (22.08) | 6.43 (2.08) | 60 (35) | 1.07 (0.22) | 72.1 (41.0) | 22.4 (1.7) | 4.1 (1.5) | 1.83 (0.36) | 29% | 2.36 (0.87) |
| FR_SAFE | 30 | 67% [49, 81] | 27% [14, 44] | 0.83 (0.95) | 58.97 (25.77) | 6.26 (2.16) | 77 (43) | 1.51 (0.03) | 93.1 (52.8) | 22.2 (1.9) | 4.0 (1.5) | 1.80 (0.37) | 28% | 2.49 (1.46) |


