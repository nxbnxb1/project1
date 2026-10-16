# DART ablation summary

Sweep: camspeedrate = 21545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.22 (0.80) | 51.64 (21.96) | 7.16 (1.65) | 126 (93) | 2.43 (0.76) | 152.5 (112.0) | 22.7 (1.6) | 8.3 (3.0) | 1.86 (0.36) | 27% | 2.27 (0.63) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.14 (0.83) | 48.39 (14.57) | 7.22 (1.37) | 188 (83) | 4.37 (0.04) | 226.3 (100.5) | 22.9 (1.4) | 8.9 (2.9) | 1.90 (0.32) | 28% | 2.72 (0.82) |


