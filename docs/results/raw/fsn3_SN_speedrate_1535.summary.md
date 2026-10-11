# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.28 (0.38) | 40.84 (13.45) | 8.49 (1.81) | 97 (43) | 2.31 (0.31) | 117.5 (51.9) | 24.8 (0.8) | 6.3 (1.6) | 2.29 (0.18) | 34% | 2.52 (1.11) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.29 (0.74) | 39.42 (7.21) | 8.42 (1.30) | 136 (25) | 3.46 (0.01) | 164.2 (30.7) | 24.6 (1.0) | 6.4 (1.6) | 2.25 (0.20) | 34% | 2.59 (0.79) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.07 (0.79) | 40.68 (10.28) | 8.23 (1.67) | 98 (27) | 2.49 (0.17) | 117.9 (31.7) | 25.1 (1.1) | 6.7 (1.7) | 2.36 (0.22) | 37% | 2.83 (1.25) |


