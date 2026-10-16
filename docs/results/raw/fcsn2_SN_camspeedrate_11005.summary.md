# DART ablation summary

Sweep: camspeedrate = 11005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 33% [19, 51] | 63% [46, 78] | 0.41 (1.02) | 37.12 (5.69) | 7.88 (2.37) | 14 (8) | 0.50 (0.06) | 16.3 (10.0) | 21.5 (1.6) | 5.0 (2.7) | 1.57 (0.37) | 19% | 2.64 (1.31) |
| FR_SAFE | 30 | 23% [12, 41] | 73% [56, 86] | 0.05 (0.17) | 54.30 (32.47) | 7.41 (2.73) | 16 (13) | 0.53 (0.02) | 19.9 (15.3) | 21.4 (1.6) | 5.4 (2.6) | 1.57 (0.33) | 21% | 2.50 (1.54) |


