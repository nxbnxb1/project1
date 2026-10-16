# DART ablation summary

Sweep: camspeedrate = 40630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 7% [1, 30] | 0.74 (0.38) | 87.43 (17.24) | 4.25 (0.86) | 162 (56) | 1.81 (0.40) | 780.1 (268.4) | 25.4 (1.4) | 15.7 (1.8) | 2.46 (0.26) | 33% | 2.15 (0.52) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.55 (0.35) | 91.99 (15.64) | 4.19 (0.51) | 223 (75) | 2.69 (0.02) | 1073.6 (357.4) | 25.2 (0.9) | 16.7 (0.9) | 2.43 (0.15) | 35% | 2.35 (0.31) |


