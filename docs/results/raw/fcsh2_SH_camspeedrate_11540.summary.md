# DART ablation summary

Sweep: camspeedrate = 11540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.60 (0.53) | 67.41 (17.34) | 5.10 (1.31) | 181 (75) | 2.77 (0.59) | 221.7 (91.2) | 24.7 (1.5) | 12.5 (1.7) | 2.37 (0.24) | 46% | 2.11 (0.71) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.79 (0.56) | 84.23 (20.71) | 4.83 (0.94) | 306 (113) | 4.01 (0.01) | 374.4 (137.6) | 25.1 (1.5) | 14.4 (1.7) | 2.45 (0.24) | 50% | 2.39 (0.60) |


