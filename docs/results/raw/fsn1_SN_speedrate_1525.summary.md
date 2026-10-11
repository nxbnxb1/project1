# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.30 (0.76) | 42.52 (21.21) | 8.60 (2.16) | 78 (51) | 1.76 (0.22) | 95.1 (62.4) | 24.8 (1.1) | 10.2 (4.2) | 2.27 (0.26) | 30% | 2.59 (0.73) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.42 (0.56) | 42.04 (17.38) | 8.31 (1.80) | 106 (44) | 2.51 (0.01) | 127.0 (53.6) | 25.1 (1.2) | 10.6 (4.0) | 2.35 (0.26) | 35% | 2.70 (1.09) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.35 (0.44) | 42.60 (18.19) | 8.36 (2.08) | 80 (36) | 1.94 (0.09) | 96.4 (43.2) | 24.8 (1.2) | 10.2 (4.3) | 2.29 (0.26) | 32% | 2.51 (0.78) |


