# DART ablation summary

Sweep: camspeedrate = 41030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.34 (0.57) | 44.42 (11.45) | 7.62 (1.33) | 67 (32) | 1.47 (0.37) | 324.8 (157.1) | 23.1 (1.6) | 9.0 (3.7) | 1.90 (0.37) | 25% | 2.68 (0.87) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 1.36 (0.45) | 43.07 (10.02) | 7.67 (1.40) | 120 (37) | 2.69 (0.03) | 580.6 (177.2) | 23.0 (1.5) | 9.1 (3.5) | 1.88 (0.36) | 24% | 2.70 (0.75) |


