# DART ablation summary

Sweep: camspeedrate = 21020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.25 (0.30) | 90.31 (32.01) | 4.79 (1.30) | 113 (69) | 1.56 (0.26) | 134.7 (83.8) | 24.0 (1.8) | 6.2 (1.1) | 2.25 (0.31) | 43% | 1.95 (0.42) |
| FR_SAFE | 15 | 40% [20, 64] | 47% [25, 70] | 0.33 (0.44) | 109.02 (23.89) | 3.93 (1.35) | 159 (101) | 2.01 (0.02) | 189.9 (120.6) | 23.7 (2.3) | 7.7 (1.1) | 2.24 (0.36) | 47% | 2.47 (0.86) |


