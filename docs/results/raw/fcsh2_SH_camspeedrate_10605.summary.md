# DART ablation summary

Sweep: camspeedrate = 10605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 7% [1, 30] | 87% [62, 96] | 0.12 (0.36) | 258.70 (0.00) | 3.12 (1.48) | 30 (31) | 0.47 (0.05) | 36.0 (36.4) | 20.9 (1.3) | 6.3 (1.2) | 1.74 (0.20) | 30% | 2.43 (0.70) |
| FR_SAFE | 15 | 7% [1, 30] | 93% [70, 99] | -0.00 (0.05) | 234.16 (0.00) | 2.94 (1.37) | 44 (32) | 0.52 (0.04) | 53.0 (38.8) | 20.7 (2.6) | 6.6 (1.4) | 1.72 (0.42) | 32% | 2.18 (0.43) |


