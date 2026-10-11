# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.42 (0.72) | 41.93 (16.23) | 8.27 (1.79) | 90 (48) | 2.07 (0.30) | 108.5 (56.7) | 25.3 (1.1) | 10.6 (3.0) | 2.38 (0.24) | 36% | 2.70 (1.10) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.35 (0.73) | 42.89 (15.15) | 8.11 (1.91) | 127 (45) | 2.95 (0.01) | 152.1 (53.1) | 25.2 (1.0) | 10.7 (3.1) | 2.36 (0.23) | 37% | 2.74 (0.68) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.24 (0.52) | 42.79 (12.58) | 7.98 (1.72) | 95 (30) | 2.23 (0.13) | 115.2 (34.7) | 25.0 (1.0) | 10.6 (2.5) | 2.33 (0.21) | 38% | 2.59 (1.05) |


