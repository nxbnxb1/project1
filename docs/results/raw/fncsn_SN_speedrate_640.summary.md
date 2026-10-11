# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 97% [89, 99] | 3% [1, 11] | 1.08 (0.39) | 61.71 (10.85) | 5.31 (0.53) | 124 (54) | 2.02 (0.64) | 148.9 (64.2) | 18.9 (2.6) | 8.2 (3.4) | 1.29 (0.45) | 10% | 2.45 (0.78) |


