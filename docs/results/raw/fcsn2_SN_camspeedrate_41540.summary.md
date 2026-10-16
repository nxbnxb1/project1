# DART ablation summary

Sweep: camspeedrate = 41540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.60 (1.31) | 42.27 (10.09) | 8.15 (1.64) | 80 (28) | 1.83 (0.26) | 381.1 (135.8) | 24.7 (1.1) | 9.6 (3.1) | 2.26 (0.24) | 33% | 2.37 (0.97) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.33 (1.03) | 41.65 (12.18) | 8.22 (1.76) | 118 (36) | 2.91 (0.06) | 565.9 (173.3) | 25.0 (1.2) | 10.2 (3.5) | 2.32 (0.26) | 36% | 2.46 (0.83) |


