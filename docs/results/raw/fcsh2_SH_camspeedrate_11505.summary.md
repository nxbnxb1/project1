# DART ablation summary

Sweep: camspeedrate = 11505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 13% [4, 38] | 87% [62, 96] | 0.03 (0.14) | 62.05 (16.29) | 6.18 (2.21) | 17 (13) | 0.50 (0.05) | 20.3 (15.8) | 23.1 (1.5) | 4.6 (1.1) | 2.01 (0.28) | 35% | 2.10 (0.67) |
| FR_SAFE | 15 | 7% [1, 30] | 93% [70, 99] | -0.02 (0.03) | 103.44 (0.00) | 5.05 (2.74) | 26 (27) | 0.53 (0.03) | 31.9 (31.8) | 22.0 (1.9) | 4.8 (1.5) | 1.84 (0.36) | 36% | 2.13 (0.62) |


