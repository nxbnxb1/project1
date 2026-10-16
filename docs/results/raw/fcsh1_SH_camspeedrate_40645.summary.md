# DART ablation summary

Sweep: camspeedrate = 40645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.64 (0.42) | 84.18 (13.10) | 4.47 (0.45) | 144 (61) | 1.92 (0.41) | 690.4 (292.2) | 25.2 (0.9) | 15.5 (1.4) | 2.43 (0.18) | 30% | 2.10 (0.25) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.64 (0.52) | 88.71 (23.10) | 4.20 (0.83) | 270 (81) | 2.91 (0.03) | 1300.9 (394.7) | 25.4 (1.2) | 16.5 (1.4) | 2.46 (0.24) | 33% | 2.20 (0.47) |


