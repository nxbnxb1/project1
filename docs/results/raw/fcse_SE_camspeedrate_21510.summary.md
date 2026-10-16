# DART ablation summary

Sweep: camspeedrate = 21510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 27% [14, 44] | 1.26 (1.29) | 31.88 (22.90) | 6.83 (2.63) | 29 (29) | 0.71 (0.20) | 33.9 (34.6) | 21.5 (2.5) | 6.4 (4.8) | 1.63 (0.60) | 22% | 3.35 (2.44) |
| FR_SAFE | 30 | 73% [56, 86] | 20% [10, 37] | 2.20 (2.00) | 27.36 (13.80) | 6.86 (2.75) | 36 (26) | 1.02 (0.01) | 43.2 (30.7) | 21.7 (2.8) | 6.6 (5.4) | 1.67 (0.66) | 22% | 3.59 (2.31) |


