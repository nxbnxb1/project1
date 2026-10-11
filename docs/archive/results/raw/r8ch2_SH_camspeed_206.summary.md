# DART ablation summary

Sweep: camspeed = 206

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 33% [15, 58] | 0.74 (1.18) | 200.17 (58.76) | 3.16 (1.44) | 165 (132) | 1.20 (0.50) | 197.5 (159.0) | 19.1 (2.7) | 5.2 (1.5) | 1.46 (0.44) | 31% | 2.65 (0.81) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 7% [1, 30] | 0.96 (0.46) | 133.22 (27.23) | 3.65 (0.79) | 364 (115) | 2.95 (0.01) | 437.1 (138.7) | 22.5 (1.8) | 7.1 (1.2) | 1.99 (0.32) | 40% | 2.57 (0.66) |


