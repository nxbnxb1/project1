# DART ablation summary

Sweep: camspeedrate = 11530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.51 (1.58) | 33.96 (19.62) | 7.95 (2.57) | 56 (53) | 1.43 (0.57) | 68.7 (65.9) | 22.4 (1.9) | 6.6 (5.0) | 1.81 (0.45) | 24% | 3.82 (2.80) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 3.05 (1.80) | 35.16 (26.38) | 7.76 (2.92) | 106 (80) | 2.96 (0.01) | 130.0 (98.5) | 22.0 (1.9) | 6.6 (4.9) | 1.74 (0.44) | 25% | 4.18 (2.52) |


