# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 93% [79, 98] | 7% [2, 21] | 0.73 (0.38) | 75.90 (13.99) | 4.76 (0.51) | 139 (61) | 1.91 (0.58) | 166.5 (74.6) | 25.0 (1.3) | 14.8 (1.7) | 2.35 (0.25) | 23% | 2.09 (0.36) |


