# DART ablation summary

Sweep: camspeedrate = 21545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.22 (0.84) | 50.26 (17.09) | 7.03 (1.75) | 121 (71) | 2.34 (0.72) | 144.7 (85.3) | 22.4 (1.6) | 7.7 (3.0) | 1.79 (0.34) | 25% | 2.63 (0.80) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.22 (0.57) | 48.74 (17.54) | 7.37 (1.56) | 210 (76) | 4.36 (0.01) | 252.1 (91.1) | 22.6 (1.9) | 8.6 (3.4) | 1.82 (0.40) | 26% | 2.89 (1.01) |


