# DART ablation summary

Sweep: camspeedrate = 11050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.35 (0.36) | 103.17 (26.91) | 4.22 (0.93) | 295 (148) | 3.62 (0.50) | 360.3 (180.5) | 24.5 (2.5) | 13.8 (2.2) | 2.37 (0.41) | 50% | 2.05 (0.43) |
| FR_SAFE | 15 | 87% [62, 96] | 7% [1, 30] | 0.81 (0.43) | 91.59 (20.63) | 4.31 (0.98) | 481 (170) | 5.01 (0.00) | 589.0 (211.7) | 25.1 (1.8) | 15.3 (1.6) | 2.47 (0.30) | 52% | 2.32 (0.43) |


