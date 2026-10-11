# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.33 (0.64) | 38.36 (9.27) | 8.41 (1.76) | 119 (44) | 3.08 (0.53) | 143.8 (54.5) | 24.9 (1.1) | 10.8 (3.2) | 2.30 (0.23) | 34% | 2.60 (1.08) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.33 (0.83) | 38.69 (11.63) | 8.51 (1.66) | 186 (67) | 5.02 (0.02) | 223.5 (80.0) | 24.9 (1.2) | 11.4 (3.0) | 2.30 (0.26) | 34% | 2.59 (0.99) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.21 (0.42) | 37.07 (6.48) | 8.73 (1.33) | 118 (22) | 3.19 (0.33) | 141.8 (27.3) | 24.9 (1.1) | 10.5 (2.7) | 2.30 (0.23) | 34% | 2.62 (1.11) |


