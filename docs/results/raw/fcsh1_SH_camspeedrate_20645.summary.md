# DART ablation summary

Sweep: camspeedrate = 20645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.61 (0.49) | 103.50 (26.54) | 4.02 (0.71) | 240 (138) | 2.40 (0.68) | 287.2 (164.2) | 23.2 (1.9) | 12.7 (2.3) | 2.10 (0.33) | 33% | 2.49 (0.55) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.73 (0.42) | 105.67 (42.29) | 3.91 (0.93) | 439 (202) | 4.35 (0.00) | 526.6 (240.4) | 24.3 (1.5) | 15.0 (1.3) | 2.27 (0.25) | 32% | 2.30 (0.43) |


