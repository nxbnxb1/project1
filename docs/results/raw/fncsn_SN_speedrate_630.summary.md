# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 95% [86, 98] | 5% [2, 14] | 1.14 (0.44) | 62.43 (12.28) | 5.29 (0.56) | 96 (42) | 1.53 (0.46) | 115.3 (50.1) | 19.0 (2.8) | 5.2 (2.2) | 1.31 (0.48) | 10% | 2.67 (1.01) |


