# DART ablation summary

Sweep: camspeedrate = 10625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 2.24 (1.43) | 50.86 (30.72) | 4.70 (1.46) | 83 (120) | 1.05 (0.73) | 102.3 (147.7) | 19.1 (4.7) | 7.9 (5.7) | 1.38 (0.84) | 15% | 3.68 (2.66) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.42 (1.63) | 50.31 (23.57) | 4.81 (1.16) | 130 (62) | 2.51 (0.01) | 159.4 (75.5) | 19.0 (4.5) | 7.9 (5.3) | 1.37 (0.80) | 15% | 4.03 (2.89) |


