# DART ablation summary

Sweep: camspeedrate = 41025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.45 (0.48) | 50.28 (17.48) | 7.17 (1.54) | 76 (44) | 1.41 (0.34) | 363.5 (214.7) | 23.2 (1.9) | 9.3 (3.9) | 1.93 (0.44) | 28% | 2.62 (0.87) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.38 (0.49) | 49.44 (19.23) | 7.36 (1.70) | 120 (47) | 2.43 (0.02) | 577.8 (222.6) | 23.2 (1.8) | 9.7 (4.1) | 1.92 (0.42) | 28% | 2.67 (0.83) |


