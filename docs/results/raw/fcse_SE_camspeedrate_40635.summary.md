# DART ablation summary

Sweep: camspeedrate = 40635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.51 (1.22) | 44.67 (18.22) | 5.17 (0.67) | 57 (58) | 1.10 (0.71) | 275.6 (279.8) | 19.2 (4.9) | 5.6 (4.1) | 1.40 (0.87) | 11% | 3.20 (2.56) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.54 (1.32) | 47.75 (26.54) | 4.99 (1.08) | 136 (76) | 2.84 (0.05) | 652.6 (361.1) | 19.7 (5.3) | 6.2 (4.4) | 1.49 (0.95) | 14% | 3.67 (2.40) |


