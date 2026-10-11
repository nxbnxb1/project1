# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.59 (1.26) | 31.53 (17.11) | 7.53 (1.83) | 49 (45) | 1.37 (0.53) | 58.5 (53.7) | 22.4 (2.9) | 6.1 (4.0) | 1.81 (0.66) | 24% | 3.21 (2.40) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.53 (1.20) | 30.90 (16.01) | 7.49 (1.62) | 78 (40) | 2.52 (0.01) | 93.4 (48.3) | 22.5 (2.9) | 6.4 (4.1) | 1.84 (0.67) | 28% | 3.60 (2.43) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.44 (1.49) | 35.08 (21.90) | 7.25 (2.07) | 59 (47) | 1.57 (0.33) | 70.6 (55.8) | 22.2 (2.8) | 6.1 (4.1) | 1.76 (0.64) | 25% | 3.40 (2.71) |


