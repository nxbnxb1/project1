# DART ablation summary

Sweep: camspeedrate = 11005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 57% [39, 73] | 43% [27, 61] | 1.71 (2.14) | 23.23 (1.38) | 7.53 (2.19) | 11 (6) | 0.47 (0.05) | 13.7 (7.2) | 21.1 (2.6) | 5.4 (4.5) | 1.52 (0.59) | 21% | 4.04 (3.10) |
| FR_SAFE | 30 | 70% [52, 83] | 30% [17, 48] | 1.93 (1.92) | 24.54 (4.80) | 7.73 (1.98) | 13 (9) | 0.53 (0.05) | 15.6 (10.4) | 20.7 (2.2) | 4.8 (3.7) | 1.44 (0.51) | 17% | 3.89 (2.89) |


