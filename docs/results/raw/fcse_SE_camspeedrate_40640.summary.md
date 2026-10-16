# DART ablation summary

Sweep: camspeedrate = 40640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.26 (0.99) | 43.50 (14.03) | 5.16 (0.74) | 55 (53) | 1.11 (0.74) | 265.3 (254.2) | 19.1 (5.1) | 5.5 (4.1) | 1.38 (0.90) | 11% | 3.19 (2.49) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.65 (1.52) | 42.44 (12.43) | 5.23 (0.69) | 123 (36) | 2.89 (0.05) | 591.8 (172.5) | 19.5 (5.1) | 6.0 (4.1) | 1.45 (0.89) | 11% | 3.84 (2.75) |


