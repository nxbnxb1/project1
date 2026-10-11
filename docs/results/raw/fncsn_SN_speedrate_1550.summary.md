# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 100% [94, 100] | 0% [0, 6] | 1.59 (0.79) | 34.96 (7.63) | 9.50 (1.45) | 105 (41) | 2.91 (0.55) | 125.8 (49.0) | 24.6 (0.9) | 5.2 (1.7) | 2.24 (0.19) | 33% | 2.56 (0.87) |


