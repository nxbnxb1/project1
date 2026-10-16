# DART ablation summary

Sweep: camspeedrate = 21020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 2.36 (1.77) | 31.14 (16.32) | 7.30 (1.87) | 34 (31) | 1.04 (0.45) | 40.3 (36.7) | 21.2 (2.3) | 4.5 (3.2) | 1.57 (0.54) | 21% | 3.31 (2.47) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.35 (1.78) | 48.71 (49.22) | 6.88 (2.57) | 98 (98) | 2.02 (0.02) | 117.5 (118.2) | 21.6 (2.7) | 5.3 (3.9) | 1.67 (0.63) | 24% | 3.51 (2.30) |


