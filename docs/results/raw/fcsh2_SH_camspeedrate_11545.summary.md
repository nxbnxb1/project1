# DART ablation summary

Sweep: camspeedrate = 11545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.65 (0.33) | 75.46 (16.68) | 5.14 (0.86) | 215 (83) | 2.85 (0.54) | 263.2 (100.3) | 24.6 (1.0) | 12.4 (1.1) | 2.34 (0.15) | 44% | 2.10 (0.42) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.99 (0.59) | 70.15 (16.70) | 5.59 (1.11) | 292 (88) | 4.36 (0.01) | 356.6 (106.9) | 25.1 (1.0) | 13.7 (1.5) | 2.44 (0.17) | 48% | 2.22 (0.43) |


