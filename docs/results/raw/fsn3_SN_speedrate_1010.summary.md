# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.55 (1.29) | 51.27 (18.12) | 6.75 (1.72) | 43 (18) | 0.84 (0.07) | 52.0 (22.5) | 23.6 (1.6) | 5.5 (1.7) | 2.03 (0.36) | 28% | 1.96 (0.41) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 1.46 (1.56) | 53.40 (17.45) | 6.69 (1.87) | 51 (19) | 1.01 (0.01) | 62.1 (23.0) | 24.1 (1.7) | 6.0 (2.1) | 2.12 (0.40) | 32% | 2.28 (0.82) |
| E_DART | 20 | 75% [53, 89] | 20% [8, 42] | 0.93 (0.71) | 54.40 (13.73) | 6.09 (1.40) | 55 (18) | 1.01 (0.01) | 66.9 (22.3) | 24.6 (1.7) | 6.5 (2.0) | 2.24 (0.38) | 39% | 2.34 (0.71) |


