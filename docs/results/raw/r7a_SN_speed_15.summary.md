# DART ablation summary

Sweep: speed = 15

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 100% [80, 100] | 0% [0, 20] | 2.00 (1.47) | 42.53 (13.76) | 8.48 (1.92) | 79 (30) | 1.83 (0.29) | 94.9 (36.0) | 23.8 (1.1) | 4.3 (1.3) | 2.10 (0.21) | 27% | 2.74 (1.44) |
| COV_NOCLUT | 15 | 100% [80, 100] | 0% [0, 20] | 2.39 (2.59) | 39.10 (11.50) | 9.03 (1.89) | 74 (32) | 1.84 (0.29) | 89.9 (37.0) | 24.3 (1.3) | 4.4 (1.5) | 2.18 (0.28) | 33% | 3.10 (2.47) |


