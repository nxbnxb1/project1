# DART ablation summary

Sweep: camspeedrate = 11015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.33 (0.41) | 112.23 (36.20) | 4.09 (1.79) | 103 (67) | 1.23 (0.22) | 126.6 (82.6) | 23.9 (2.5) | 6.4 (1.5) | 2.24 (0.44) | 44% | 1.93 (0.51) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.42 (0.49) | 102.14 (25.17) | 4.30 (1.54) | 125 (64) | 1.50 (0.01) | 154.3 (77.8) | 24.3 (1.4) | 6.7 (0.9) | 2.33 (0.21) | 46% | 2.05 (0.53) |


