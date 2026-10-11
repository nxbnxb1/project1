# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 90% [70, 97] | 5% [1, 24] | 1.12 (0.76) | 64.35 (11.14) | 4.79 (1.23) | 62 (23) | 0.97 (0.25) | 75.3 (27.6) | 19.7 (2.8) | 4.8 (1.9) | 1.46 (0.51) | 16% | 2.50 (0.78) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.15 (0.43) | 78.82 (31.30) | 4.68 (1.05) | 118 (47) | 1.50 (0.00) | 142.0 (55.8) | 20.3 (2.9) | 5.1 (2.0) | 1.57 (0.53) | 19% | 2.64 (0.87) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.02 (0.45) | 70.43 (13.88) | 4.78 (0.68) | 83 (19) | 1.18 (0.06) | 100.1 (23.4) | 20.0 (2.4) | 4.9 (1.4) | 1.51 (0.43) | 17% | 2.44 (0.89) |


