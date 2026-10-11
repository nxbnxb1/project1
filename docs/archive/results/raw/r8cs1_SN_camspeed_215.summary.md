# DART ablation summary

Sweep: camspeed = 215

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 13% [5, 30] | 1.13 (0.74) | 60.28 (27.50) | 6.32 (2.22) | 92 (56) | 1.48 (0.49) | 110.7 (67.1) | 20.5 (2.6) | 4.3 (1.8) | 1.50 (0.43) | 28% | 2.56 (0.62) |
| FR_SAFE_3 | 30 | 80% [63, 90] | 17% [7, 34] | 1.32 (0.92) | 50.57 (16.58) | 6.92 (1.75) | 149 (52) | 2.95 (0.01) | 178.3 (62.9) | 21.3 (1.7) | 4.4 (1.4) | 1.61 (0.35) | 28% | 2.96 (0.99) |


