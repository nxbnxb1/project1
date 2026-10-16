# DART ablation summary

Sweep: camspeedrate = 40625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.33 (0.69) | 67.37 (13.29) | 5.12 (0.63) | 83 (40) | 1.18 (0.38) | 397.8 (192.3) | 19.4 (2.7) | 8.7 (3.5) | 1.40 (0.48) | 14% | 2.31 (0.78) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.08 (0.50) | 70.13 (15.54) | 4.93 (0.70) | 166 (44) | 2.43 (0.02) | 797.8 (214.2) | 19.9 (3.0) | 9.6 (3.5) | 1.49 (0.52) | 17% | 2.83 (1.12) |


