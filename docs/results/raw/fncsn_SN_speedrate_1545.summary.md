# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 100% [94, 100] | 0% [0, 6] | 1.68 (0.94) | 34.16 (7.45) | 9.64 (1.42) | 90 (29) | 2.59 (0.40) | 108.2 (35.6) | 24.6 (0.8) | 6.9 (2.3) | 2.23 (0.19) | 32% | 2.50 (0.92) |


