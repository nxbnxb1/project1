# DART ablation summary

Sweep: camspeedrate = 20625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.03 (0.73) | 79.71 (33.37) | 4.59 (1.07) | 110 (86) | 1.24 (0.44) | 132.4 (103.2) | 18.7 (2.9) | 7.3 (3.5) | 1.32 (0.52) | 17% | 2.59 (0.81) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.15 (0.37) | 71.37 (26.93) | 4.94 (0.96) | 181 (66) | 2.51 (0.00) | 216.5 (77.3) | 18.8 (2.7) | 7.6 (3.4) | 1.31 (0.47) | 15% | 3.23 (0.88) |


