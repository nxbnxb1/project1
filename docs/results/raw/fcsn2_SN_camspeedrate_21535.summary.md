# DART ablation summary

Sweep: camspeedrate = 21535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.05 (0.94) | 51.49 (17.93) | 7.05 (1.60) | 102 (64) | 2.05 (0.58) | 123.2 (77.2) | 22.9 (1.6) | 8.2 (2.8) | 1.89 (0.35) | 28% | 2.33 (0.77) |
| FR_SAFE | 30 | 90% [74, 97] | 7% [2, 21] | 1.22 (0.81) | 52.17 (18.42) | 6.86 (1.86) | 182 (93) | 3.46 (0.02) | 218.1 (111.7) | 22.8 (1.6) | 8.8 (3.2) | 1.88 (0.35) | 29% | 2.62 (1.14) |


