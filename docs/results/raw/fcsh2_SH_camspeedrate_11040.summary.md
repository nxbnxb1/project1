# DART ablation summary

Sweep: camspeedrate = 11040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.74 (0.41) | 98.08 (34.52) | 4.34 (1.22) | 263 (138) | 2.70 (0.46) | 322.0 (170.1) | 24.5 (1.6) | 13.2 (1.5) | 2.36 (0.26) | 46% | 2.31 (0.54) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.58 (0.59) | 91.24 (23.43) | 5.18 (1.33) | 286 (142) | 4.01 (0.02) | 350.2 (173.7) | 25.3 (1.6) | 14.6 (1.7) | 2.48 (0.26) | 47% | 2.32 (0.62) |


