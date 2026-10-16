# DART ablation summary

Sweep: camspeedrate = 40630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.49 (1.44) | 45.59 (14.54) | 5.04 (0.87) | 57 (53) | 1.07 (0.72) | 276.4 (257.4) | 19.2 (5.1) | 5.7 (4.2) | 1.41 (0.92) | 14% | 3.30 (2.50) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.51 (1.11) | 43.86 (15.75) | 5.11 (0.90) | 118 (43) | 2.69 (0.03) | 568.8 (202.7) | 19.5 (5.1) | 6.2 (4.3) | 1.45 (0.91) | 13% | 3.67 (2.51) |


