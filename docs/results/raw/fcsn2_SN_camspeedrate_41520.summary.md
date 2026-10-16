# DART ablation summary

Sweep: camspeedrate = 41520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 1.54 (1.17) | 40.69 (10.25) | 8.40 (1.62) | 53 (21) | 1.41 (0.20) | 255.5 (103.2) | 24.8 (1.3) | 7.2 (2.4) | 2.27 (0.27) | 35% | 2.45 (0.77) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.41 (1.00) | 45.14 (17.32) | 7.96 (2.08) | 88 (36) | 2.00 (0.01) | 423.5 (173.4) | 24.7 (1.2) | 7.3 (2.6) | 2.27 (0.27) | 36% | 2.50 (0.91) |


