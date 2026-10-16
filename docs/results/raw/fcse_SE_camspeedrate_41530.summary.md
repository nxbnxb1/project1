# DART ablation summary

Sweep: camspeedrate = 41530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.81 (2.47) | 28.12 (13.95) | 8.49 (2.26) | 44 (38) | 1.41 (0.44) | 213.6 (183.3) | 23.2 (1.9) | 8.1 (5.4) | 2.01 (0.41) | 29% | 3.64 (2.83) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 3.32 (2.45) | 28.87 (13.01) | 8.19 (2.44) | 82 (42) | 2.69 (0.04) | 395.4 (202.7) | 23.0 (2.0) | 8.4 (5.6) | 1.97 (0.44) | 28% | 3.59 (2.76) |


