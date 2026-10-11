# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.11 (0.32) | 61.69 (14.56) | 5.39 (0.60) | 106 (54) | 1.66 (0.49) | 125.9 (62.7) | 18.4 (2.5) | 7.2 (3.2) | 1.22 (0.43) | 8% | 2.57 (0.52) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.03 (0.23) | 58.91 (5.92) | 5.44 (0.33) | 204 (21) | 3.45 (0.00) | 241.9 (23.2) | 18.4 (2.4) | 7.5 (3.1) | 1.21 (0.41) | 9% | 2.48 (0.80) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.12 (0.33) | 64.17 (20.43) | 5.27 (0.78) | 102 (60) | 1.51 (0.32) | 121.3 (71.5) | 18.5 (2.8) | 6.9 (3.5) | 1.23 (0.49) | 10% | 2.33 (0.79) |


