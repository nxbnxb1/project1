# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.98 (1.88) | 38.46 (32.46) | 7.52 (2.88) | 33 (32) | 0.80 (0.09) | 39.8 (37.5) | 23.5 (2.7) | 8.8 (6.3) | 2.04 (0.61) | 33% | 3.40 (2.33) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.98 (2.09) | 40.86 (39.38) | 7.55 (2.87) | 41 (39) | 1.02 (0.02) | 49.4 (45.4) | 23.2 (2.5) | 8.6 (6.0) | 1.98 (0.56) | 31% | 3.29 (2.37) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.60 (1.48) | 40.02 (32.53) | 7.34 (2.83) | 40 (33) | 1.02 (0.02) | 48.4 (38.0) | 23.6 (2.5) | 8.9 (6.0) | 2.07 (0.58) | 34% | 3.10 (2.44) |


