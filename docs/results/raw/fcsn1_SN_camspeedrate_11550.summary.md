# DART ablation summary

Sweep: camspeedrate = 11550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.35 (0.79) | 44.22 (15.79) | 7.96 (1.97) | 128 (85) | 2.69 (0.76) | 156.3 (103.3) | 23.8 (1.2) | 6.5 (2.4) | 2.06 (0.27) | 29% | 2.56 (0.76) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.41 (0.54) | 43.16 (14.40) | 8.09 (1.74) | 215 (71) | 5.01 (0.01) | 262.6 (84.8) | 23.5 (1.2) | 6.8 (2.3) | 2.01 (0.25) | 29% | 2.91 (0.78) |


