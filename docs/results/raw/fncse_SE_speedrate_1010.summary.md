# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 100% [89, 100] | 0% [0, 11] | 2.96 (1.76) | 36.51 (22.70) | 7.19 (2.32) | 30 (23) | 0.75 (0.12) | 35.0 (27.2) | 22.6 (3.3) | 6.2 (4.4) | 1.84 (0.74) | 30% | 3.41 (2.42) |


