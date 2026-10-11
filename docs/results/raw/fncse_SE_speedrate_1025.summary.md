# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 100% [89, 100] | 0% [0, 11] | 2.76 (1.44) | 30.33 (15.10) | 7.61 (1.82) | 48 (42) | 1.40 (0.55) | 56.8 (49.6) | 22.4 (3.0) | 8.6 (5.8) | 1.82 (0.68) | 29% | 3.36 (2.51) |


