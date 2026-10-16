# DART ablation summary

Sweep: camspeedrate = 40605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 53% [30, 75] | 0.33 (0.47) | 166.68 (53.15) | 2.44 (1.16) | 62 (43) | 0.49 (0.02) | 297.4 (211.9) | 24.9 (3.3) | 15.1 (3.6) | 2.44 (0.62) | 53% | 1.93 (0.74) |
| FR_SAFE | 15 | 33% [15, 58] | 33% [15, 58] | 0.65 (0.83) | 171.45 (54.60) | 2.63 (1.17) | 56 (30) | 0.51 (0.04) | 267.9 (147.0) | 24.6 (1.8) | 14.0 (2.6) | 2.37 (0.32) | 43% | 1.83 (0.44) |


