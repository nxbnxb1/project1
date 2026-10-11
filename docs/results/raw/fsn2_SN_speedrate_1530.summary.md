# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.40 (0.93) | 35.90 (6.42) | 8.78 (1.82) | 72 (21) | 1.96 (0.31) | 85.6 (24.3) | 24.6 (1.0) | 9.1 (3.5) | 2.23 (0.24) | 31% | 2.20 (0.66) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.26 (0.50) | 35.60 (6.21) | 9.00 (1.38) | 105 (18) | 2.96 (0.01) | 124.5 (21.4) | 24.5 (1.1) | 9.1 (3.3) | 2.21 (0.25) | 32% | 2.40 (0.77) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.25 (0.40) | 36.98 (6.87) | 8.84 (1.44) | 80 (17) | 2.15 (0.13) | 94.8 (19.7) | 24.6 (1.3) | 9.1 (3.6) | 2.24 (0.28) | 32% | 2.53 (0.75) |


