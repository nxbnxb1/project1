# DART ablation summary

Sweep: camspeedrate = 21525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.42 (2.00) | 35.75 (25.63) | 7.20 (2.29) | 59 (79) | 1.18 (0.59) | 70.3 (94.1) | 21.6 (2.4) | 6.9 (5.1) | 1.65 (0.57) | 23% | 3.45 (2.36) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.86 (1.91) | 33.51 (19.91) | 7.21 (2.24) | 86 (54) | 2.52 (0.02) | 103.3 (64.5) | 21.7 (2.6) | 7.5 (5.3) | 1.69 (0.62) | 23% | 3.87 (2.51) |


