# DART ablation summary

Sweep: camspeedrate = 20610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.77 (1.36) | 64.44 (62.89) | 4.38 (1.83) | 49 (63) | 0.55 (0.28) | 58.7 (75.3) | 18.1 (4.2) | 4.8 (3.6) | 1.25 (0.77) | 15% | 3.33 (2.42) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.18 (1.57) | 61.87 (47.60) | 4.68 (1.45) | 61 (47) | 1.01 (0.01) | 73.6 (56.8) | 19.0 (4.5) | 5.1 (3.5) | 1.37 (0.81) | 14% | 3.91 (2.88) |


