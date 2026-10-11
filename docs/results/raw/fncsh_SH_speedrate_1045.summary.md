# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 97% [83, 99] | 3% [1, 17] | 0.98 (0.39) | 53.60 (7.82) | 6.40 (0.70) | 146 (54) | 2.77 (0.77) | 175.5 (65.2) | 26.5 (0.7) | 15.8 (1.2) | 2.67 (0.14) | 51% | 2.00 (0.32) |


