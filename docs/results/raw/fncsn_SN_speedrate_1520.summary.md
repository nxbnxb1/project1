# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.77 (1.38) | 40.13 (15.39) | 8.72 (2.14) | 62 (30) | 1.51 (0.16) | 74.8 (36.0) | 24.5 (1.4) | 9.2 (3.6) | 2.23 (0.28) | 35% | 2.50 (1.06) |


