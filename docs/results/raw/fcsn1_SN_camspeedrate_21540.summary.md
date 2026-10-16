# DART ablation summary

Sweep: camspeedrate = 21540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 3% [1, 17] | 1.13 (0.67) | 55.34 (32.03) | 6.95 (2.01) | 143 (132) | 2.23 (0.69) | 172.0 (158.8) | 22.4 (1.8) | 7.7 (3.3) | 1.79 (0.38) | 27% | 2.62 (0.95) |
| FR_SAFE | 30 | 77% [59, 88] | 23% [12, 41] | 1.01 (0.86) | 45.48 (14.41) | 7.12 (1.74) | 174 (65) | 4.01 (0.01) | 209.3 (78.4) | 23.0 (2.0) | 8.8 (3.6) | 1.90 (0.45) | 29% | 2.88 (0.74) |


