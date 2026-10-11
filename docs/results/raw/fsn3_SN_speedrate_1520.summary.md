# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.50 (0.98) | 41.80 (11.51) | 8.14 (1.71) | 64 (22) | 1.51 (0.14) | 77.4 (27.0) | 24.8 (1.1) | 7.6 (2.0) | 2.30 (0.23) | 33% | 2.41 (0.61) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.36 (1.26) | 48.95 (20.35) | 7.38 (2.57) | 96 (41) | 2.01 (0.01) | 116.5 (48.3) | 25.5 (1.2) | 8.7 (2.9) | 2.44 (0.28) | 42% | 2.69 (1.08) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.20 (0.70) | 46.23 (17.79) | 7.62 (2.03) | 74 (31) | 1.67 (0.05) | 90.0 (36.3) | 25.4 (1.0) | 8.2 (2.2) | 2.42 (0.23) | 40% | 2.59 (0.62) |


