# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 93% [79, 98] | 7% [2, 21] | 2.54 (2.01) | 45.75 (45.18) | 6.39 (2.35) | 22 (22) | 0.46 (0.03) | 26.4 (26.9) | 22.0 (3.8) | 8.0 (6.4) | 1.74 (0.83) | 29% | 3.38 (2.64) |


