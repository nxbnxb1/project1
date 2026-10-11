# DART ablation summary

Sweep: speed = 15

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 100% [80, 100] | 0% [0, 20] | 1.68 (0.52) | 53.07 (20.21) | 7.21 (2.03) | 102 (50) | 1.88 (0.27) | 123.0 (59.6) | 24.2 (1.8) | 6.3 (1.6) | 2.19 (0.35) | 35% | 2.63 (0.71) |
| COV_NOCLUT | 15 | 100% [80, 100] | 0% [0, 20] | 1.75 (0.57) | 38.79 (5.04) | 8.84 (1.03) | 74 (15) | 1.90 (0.18) | 89.8 (18.0) | 23.9 (0.9) | 5.6 (1.0) | 2.11 (0.18) | 34% | 2.66 (0.62) |


