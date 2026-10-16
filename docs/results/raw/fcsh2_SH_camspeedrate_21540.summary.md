# DART ablation summary

Sweep: camspeedrate = 21540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.35 (0.38) | 76.02 (23.14) | 5.42 (1.11) | 172 (96) | 2.87 (0.62) | 204.4 (115.5) | 24.8 (1.0) | 6.5 (1.1) | 2.37 (0.21) | 46% | 2.27 (0.69) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.41 (0.49) | 72.66 (14.41) | 5.44 (1.50) | 201 (139) | 4.02 (0.02) | 240.8 (166.8) | 24.7 (1.0) | 6.8 (1.3) | 2.36 (0.20) | 44% | 2.22 (0.80) |


