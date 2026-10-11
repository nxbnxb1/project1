# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 63% [46, 78] | 37% [22, 54] | 0.50 (0.51) | 81.64 (37.58) | 4.95 (1.86) | 64 (42) | 0.91 (0.07) | 77.4 (50.7) | 26.4 (1.2) | 11.7 (1.6) | 2.67 (0.22) | 59% | 2.09 (0.69) |


