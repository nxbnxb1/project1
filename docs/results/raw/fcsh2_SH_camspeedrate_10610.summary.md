# DART ablation summary

Sweep: camspeedrate = 10610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 40% [20, 64] | 0.40 (0.64) | 128.24 (36.30) | 3.26 (1.26) | 91 (64) | 0.79 (0.17) | 112.2 (79.2) | 21.8 (2.1) | 9.9 (1.6) | 1.90 (0.31) | 33% | 2.06 (0.51) |
| FR_SAFE | 15 | 53% [30, 75] | 33% [15, 58] | 0.40 (0.46) | 169.58 (40.95) | 2.57 (0.60) | 151 (76) | 1.00 (0.00) | 185.3 (91.4) | 22.8 (1.2) | 12.2 (1.5) | 2.09 (0.20) | 36% | 2.36 (0.86) |


