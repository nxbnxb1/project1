# DART ablation summary

Sweep: camspeedrate = 11010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 27% [14, 44] | 1.79 (1.75) | 31.82 (27.74) | 6.85 (2.62) | 29 (33) | 0.68 (0.19) | 35.4 (40.4) | 21.5 (2.7) | 6.4 (4.8) | 1.63 (0.62) | 20% | 4.13 (2.92) |
| FR_SAFE | 30 | 80% [63, 90] | 17% [7, 34] | 2.10 (1.67) | 37.39 (33.29) | 7.09 (2.54) | 38 (36) | 1.02 (0.02) | 46.9 (45.0) | 21.5 (2.5) | 6.4 (4.9) | 1.63 (0.60) | 22% | 4.10 (3.04) |


