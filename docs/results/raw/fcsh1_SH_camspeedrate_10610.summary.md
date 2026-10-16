# DART ablation summary

Sweep: camspeedrate = 10610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 40% [20, 64] | 0.46 (0.81) | 147.39 (30.14) | 3.08 (1.19) | 107 (80) | 0.83 (0.12) | 131.5 (100.2) | 21.3 (2.9) | 7.4 (1.6) | 1.84 (0.46) | 35% | 2.10 (0.49) |
| FR_SAFE | 15 | 40% [20, 64] | 47% [25, 70] | 0.59 (0.87) | 169.08 (14.39) | 2.76 (1.02) | 123 (62) | 1.01 (0.01) | 150.2 (75.2) | 22.1 (2.8) | 8.4 (1.4) | 1.98 (0.43) | 37% | 2.08 (0.41) |


