# DART ablation summary

Sweep: camspeedrate = 20630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 3% [1, 17] | 1.08 (0.54) | 78.51 (29.34) | 4.49 (1.09) | 126 (86) | 1.46 (0.55) | 151.5 (103.4) | 19.0 (2.5) | 7.6 (2.9) | 1.37 (0.44) | 17% | 2.39 (0.74) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.16 (0.56) | 70.53 (16.01) | 4.81 (0.86) | 214 (57) | 2.95 (0.00) | 256.5 (69.3) | 19.1 (2.4) | 7.8 (2.8) | 1.36 (0.42) | 15% | 2.87 (1.09) |


