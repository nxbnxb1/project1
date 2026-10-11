# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 100% [94, 100] | 0% [0, 6] | 1.53 (0.76) | 42.91 (11.95) | 7.87 (1.30) | 69 (32) | 1.56 (0.32) | 83.6 (38.5) | 23.1 (1.6) | 9.2 (3.5) | 1.89 (0.38) | 26% | 2.57 (0.86) |


