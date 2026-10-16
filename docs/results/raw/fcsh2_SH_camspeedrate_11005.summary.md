# DART ablation summary

Sweep: camspeedrate = 11005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 7% [1, 30] | 93% [70, 99] | -0.03 (0.04) | 102.16 (0.00) | 5.87 (2.82) | 20 (19) | 0.49 (0.03) | 24.4 (24.1) | 21.9 (2.5) | 4.0 (1.4) | 1.80 (0.44) | 32% | 2.46 (1.20) |
| FR_SAFE | 15 | 7% [1, 30] | 93% [70, 99] | -0.01 (0.10) | 217.26 (0.00) | 5.63 (2.41) | 23 (28) | 0.53 (0.03) | 28.5 (34.7) | 22.6 (1.6) | 4.3 (0.8) | 1.93 (0.30) | 36% | 2.25 (0.75) |


