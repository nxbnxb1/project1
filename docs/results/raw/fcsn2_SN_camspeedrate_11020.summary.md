# DART ablation summary

Sweep: camspeedrate = 11020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 13% [5, 30] | 1.33 (0.92) | 52.93 (18.94) | 6.60 (2.24) | 72 (43) | 1.29 (0.33) | 87.4 (52.7) | 22.4 (1.5) | 8.0 (2.7) | 1.81 (0.32) | 26% | 2.43 (0.97) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.24 (0.77) | 58.06 (25.20) | 6.25 (2.10) | 124 (56) | 2.01 (0.01) | 151.6 (69.5) | 22.6 (1.4) | 8.4 (2.9) | 1.87 (0.35) | 29% | 2.52 (1.29) |


