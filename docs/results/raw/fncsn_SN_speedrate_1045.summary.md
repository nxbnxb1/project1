# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.50 (0.59) | 39.94 (9.52) | 8.27 (1.02) | 95 (38) | 2.36 (0.59) | 113.7 (46.5) | 23.0 (1.5) | 5.3 (2.0) | 1.86 (0.35) | 25% | 2.77 (0.92) |


