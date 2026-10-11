# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 33% [19, 51] | 67% [49, 81] | 0.10 (0.28) | 114.77 (40.29) | 4.45 (1.58) | 31 (23) | 0.50 (0.04) | 37.3 (27.3) | 25.5 (2.1) | 10.3 (2.1) | 2.51 (0.42) | 55% | 1.88 (0.63) |


