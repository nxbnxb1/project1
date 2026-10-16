# DART ablation summary

Sweep: camspeedrate = 11530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 1.23 (0.88) | 48.44 (24.92) | 7.68 (2.17) | 98 (82) | 1.86 (0.42) | 120.0 (100.0) | 23.4 (1.2) | 6.0 (2.3) | 2.00 (0.26) | 28% | 2.46 (0.67) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 1.11 (0.87) | 43.52 (14.24) | 8.05 (2.05) | 120 (46) | 2.95 (0.02) | 147.3 (56.3) | 23.3 (1.6) | 5.9 (2.3) | 1.97 (0.30) | 28% | 2.95 (0.80) |


