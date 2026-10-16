# DART ablation summary

Sweep: camspeedrate = 41525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.25 (0.73) | 40.55 (13.04) | 8.61 (1.78) | 64 (31) | 1.63 (0.21) | 306.0 (151.2) | 24.4 (1.0) | 5.6 (2.1) | 2.20 (0.23) | 31% | 2.49 (0.67) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.43 (0.65) | 42.82 (14.09) | 8.26 (1.71) | 104 (34) | 2.43 (0.02) | 500.6 (164.0) | 24.5 (1.3) | 6.0 (2.2) | 2.22 (0.27) | 34% | 2.44 (0.81) |


