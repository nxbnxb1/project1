# DART ablation summary

Sweep: camspeedrate = 11530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 27% [11, 52] | 0.55 (0.63) | 101.34 (38.41) | 3.98 (1.36) | 186 (115) | 2.29 (0.38) | 226.4 (141.7) | 23.3 (2.4) | 8.6 (1.3) | 2.17 (0.36) | 46% | 2.32 (0.79) |
| FR_SAFE | 15 | 60% [36, 80] | 33% [15, 58] | 0.66 (0.61) | 115.55 (47.53) | 4.45 (1.57) | 248 (164) | 2.95 (0.01) | 302.3 (202.8) | 24.3 (1.9) | 9.7 (1.4) | 2.32 (0.29) | 47% | 2.62 (0.96) |


