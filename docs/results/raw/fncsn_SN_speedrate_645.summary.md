# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 95% [86, 98] | 5% [2, 14] | 1.02 (0.53) | 62.04 (9.95) | 5.30 (0.53) | 131 (55) | 2.11 (0.65) | 157.0 (66.3) | 18.9 (2.6) | 8.1 (3.3) | 1.29 (0.46) | 11% | 2.61 (0.78) |


