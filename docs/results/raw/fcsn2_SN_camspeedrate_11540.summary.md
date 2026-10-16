# DART ablation summary

Sweep: camspeedrate = 11540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 20% [10, 37] | 1.08 (0.89) | 44.24 (19.18) | 7.40 (2.20) | 113 (78) | 2.48 (0.66) | 137.3 (94.4) | 23.6 (1.0) | 8.9 (2.9) | 2.06 (0.22) | 30% | 2.48 (1.36) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.38 (0.82) | 46.24 (17.61) | 7.84 (1.93) | 177 (76) | 4.01 (0.01) | 216.2 (92.6) | 23.9 (1.2) | 8.9 (3.2) | 2.08 (0.28) | 32% | 2.82 (1.43) |


