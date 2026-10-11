# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 100% [94, 100] | 0% [0, 6] | 1.54 (0.78) | 39.70 (16.98) | 8.98 (2.00) | 83 (49) | 1.99 (0.28) | 99.1 (58.2) | 24.8 (1.2) | 9.8 (3.6) | 2.28 (0.26) | 37% | 2.60 (0.85) |


