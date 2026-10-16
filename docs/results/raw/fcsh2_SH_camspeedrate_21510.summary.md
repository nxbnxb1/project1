# DART ablation summary

Sweep: camspeedrate = 21510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 100% [80, 100] | -0.02 (0.03) | NaN (NaN) | 6.41 (1.65) | 24 (24) | 0.91 (0.12) | 29.1 (28.6) | 22.7 (2.0) | 6.8 (2.1) | 1.95 (0.40) | 33% | 2.29 (1.09) |
| FR_SAFE | 15 | 7% [1, 30] | 87% [62, 96] | 0.01 (0.12) | 56.25 (0.00) | 4.82 (2.30) | 56 (49) | 1.04 (0.07) | 65.7 (57.5) | 22.8 (2.5) | 7.2 (2.5) | 2.03 (0.42) | 44% | 2.29 (0.81) |


