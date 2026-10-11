# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.39 (0.42) | 49.84 (21.96) | 7.35 (1.87) | 85 (57) | 1.58 (0.38) | 103.3 (69.1) | 23.5 (2.0) | 9.8 (4.5) | 1.97 (0.48) | 26% | 2.73 (0.87) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.37 (0.33) | 46.30 (15.35) | 7.44 (1.53) | 116 (38) | 2.51 (0.01) | 139.1 (45.4) | 23.2 (1.8) | 9.8 (4.1) | 1.92 (0.43) | 26% | 2.74 (1.03) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.20 (0.50) | 52.53 (23.34) | 6.87 (1.90) | 88 (45) | 1.63 (0.20) | 106.5 (55.9) | 23.3 (1.7) | 10.0 (4.1) | 1.94 (0.42) | 28% | 2.80 (1.14) |


