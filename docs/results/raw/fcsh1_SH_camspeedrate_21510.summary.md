# DART ablation summary

Sweep: camspeedrate = 21510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 100% [80, 100] | -0.03 (0.03) | NaN (NaN) | 5.97 (1.87) | 23 (29) | 0.96 (0.14) | 27.3 (35.2) | 21.9 (3.1) | 8.0 (3.5) | 1.81 (0.59) | 32% | 2.40 (0.95) |
| FR_SAFE | 15 | 13% [4, 38] | 80% [55, 93] | 0.06 (0.18) | 120.88 (42.01) | 5.45 (2.11) | 40 (44) | 1.06 (0.06) | 47.8 (53.3) | 22.2 (2.4) | 8.9 (3.2) | 1.91 (0.44) | 36% | 2.19 (0.87) |


