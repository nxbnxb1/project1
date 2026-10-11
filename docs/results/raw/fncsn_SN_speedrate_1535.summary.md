# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.67 (1.10) | 35.56 (8.76) | 9.35 (1.59) | 79 (30) | 2.21 (0.34) | 95.2 (36.1) | 24.6 (1.1) | 7.0 (2.5) | 2.23 (0.25) | 34% | 2.61 (1.00) |


