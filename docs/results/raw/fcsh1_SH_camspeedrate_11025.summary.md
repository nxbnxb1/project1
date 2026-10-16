# DART ablation summary

Sweep: camspeedrate = 11025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 53% [30, 75] | 0.36 (0.53) | 88.65 (40.25) | 4.13 (1.94) | 130 (79) | 1.91 (0.39) | 158.8 (95.1) | 23.1 (2.6) | 11.1 (2.4) | 2.11 (0.39) | 43% | 2.08 (0.58) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.72 (0.51) | 117.56 (33.21) | 4.00 (1.50) | 252 (115) | 2.51 (0.01) | 309.1 (140.5) | 24.8 (1.5) | 13.9 (1.5) | 2.41 (0.24) | 46% | 2.26 (0.51) |


