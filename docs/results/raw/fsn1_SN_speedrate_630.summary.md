# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.17 (0.48) | 64.28 (12.60) | 5.21 (0.66) | 101 (52) | 1.54 (0.51) | 121.5 (62.6) | 18.8 (3.2) | 5.1 (2.6) | 1.29 (0.57) | 12% | 2.87 (1.34) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 0.96 (0.55) | 64.67 (12.19) | 5.12 (0.66) | 193 (36) | 2.95 (0.01) | 232.1 (42.2) | 19.3 (3.2) | 5.9 (2.6) | 1.38 (0.57) | 15% | 2.92 (0.72) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.00 (0.39) | 69.05 (19.21) | 5.01 (0.86) | 106 (47) | 1.48 (0.28) | 127.2 (56.5) | 19.4 (3.4) | 5.6 (2.7) | 1.40 (0.60) | 15% | 2.68 (0.87) |


