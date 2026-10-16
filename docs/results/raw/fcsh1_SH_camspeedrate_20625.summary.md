# DART ablation summary

Sweep: camspeedrate = 20625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 40% [20, 64] | 0.49 (0.49) | 135.41 (45.42) | 3.11 (1.13) | 196 (118) | 1.89 (0.30) | 236.0 (142.0) | 22.6 (1.4) | 7.2 (0.8) | 2.05 (0.22) | 37% | 2.81 (1.39) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.67 (0.34) | 116.41 (29.99) | 3.55 (0.76) | 277 (92) | 2.50 (0.01) | 331.9 (109.3) | 24.1 (1.3) | 8.5 (0.5) | 2.28 (0.21) | 37% | 2.27 (0.28) |


