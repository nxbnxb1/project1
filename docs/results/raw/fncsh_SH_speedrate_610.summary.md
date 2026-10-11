# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 73% [56, 86] | 13% [5, 30] | 0.74 (0.44) | 120.27 (45.86) | 3.42 (1.04) | 102 (47) | 0.88 (0.07) | 123.2 (57.3) | 25.5 (1.9) | 8.4 (1.2) | 2.50 (0.33) | 41% | 2.01 (0.41) |


