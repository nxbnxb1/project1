# DART ablation summary

Sweep: camspeed = 406

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 0% [0, 20] | 1.19 (0.47) | 136.86 (53.14) | 3.38 (1.26) | 182 (76) | 1.41 (0.46) | 876.5 (368.2) | 21.2 (3.4) | 7.1 (1.4) | 1.79 (0.53) | 29% | 2.44 (0.35) |
| FR_SAFE_3 | 15 | 87% [62, 96] | 7% [1, 30] | 1.00 (0.39) | 108.78 (23.44) | 4.15 (0.74) | 306 (70) | 2.69 (0.02) | 1472.9 (334.1) | 24.1 (0.8) | 8.5 (0.7) | 2.24 (0.17) | 34% | 2.41 (0.48) |


