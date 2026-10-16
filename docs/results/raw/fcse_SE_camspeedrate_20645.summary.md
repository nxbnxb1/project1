# DART ablation summary

Sweep: camspeedrate = 20645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.91 (1.22) | 47.14 (25.87) | 4.95 (1.17) | 92 (126) | 1.43 (1.12) | 110.3 (152.3) | 18.6 (4.5) | 4.0 (3.0) | 1.31 (0.80) | 12% | 3.45 (2.24) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.10 (1.17) | 44.80 (17.93) | 4.95 (1.15) | 203 (83) | 4.36 (0.01) | 244.1 (99.2) | 19.0 (4.5) | 4.5 (3.0) | 1.36 (0.80) | 13% | 3.95 (2.55) |


