# DART ablation summary

Sweep: camspeedrate = 21020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 53% [30, 75] | 0.33 (0.46) | 114.45 (67.39) | 4.55 (1.55) | 124 (112) | 1.61 (0.23) | 149.3 (134.9) | 24.0 (2.1) | 12.1 (2.9) | 2.26 (0.36) | 43% | 2.19 (0.77) |
| FR_SAFE | 15 | 47% [25, 70] | 53% [30, 75] | 0.28 (0.42) | 111.25 (42.25) | 3.63 (1.03) | 174 (82) | 2.01 (0.01) | 209.1 (97.1) | 24.8 (1.9) | 13.2 (1.7) | 2.43 (0.31) | 49% | 2.41 (0.61) |


