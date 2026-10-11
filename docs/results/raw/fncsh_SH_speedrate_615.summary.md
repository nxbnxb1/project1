# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 70% [52, 83] | 17% [7, 34] | 0.67 (0.42) | 85.79 (20.16) | 4.06 (0.99) | 99 (47) | 1.18 (0.19) | 119.4 (57.6) | 25.0 (1.4) | 11.0 (1.4) | 2.39 (0.26) | 31% | 2.21 (0.78) |


