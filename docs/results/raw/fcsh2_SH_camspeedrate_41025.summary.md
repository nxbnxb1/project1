# DART ablation summary

Sweep: camspeedrate = 41025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 0.94 (0.61) | 71.48 (17.46) | 5.31 (1.21) | 121 (60) | 1.78 (0.33) | 584.9 (286.0) | 26.3 (1.0) | 11.7 (0.9) | 2.66 (0.17) | 48% | 2.50 (0.51) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.85 (0.43) | 67.24 (13.68) | 5.57 (0.97) | 155 (48) | 2.43 (0.02) | 742.0 (225.1) | 26.4 (1.2) | 11.9 (1.5) | 2.67 (0.22) | 48% | 2.08 (0.49) |


