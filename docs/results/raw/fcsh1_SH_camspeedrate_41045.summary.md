# DART ablation summary

Sweep: camspeedrate = 41045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.60 (0.42) | 71.15 (15.54) | 5.52 (0.99) | 131 (68) | 2.10 (0.34) | 630.7 (328.9) | 26.6 (0.6) | 15.9 (1.2) | 2.71 (0.12) | 48% | 2.36 (0.67) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.74 (0.41) | 75.12 (17.62) | 5.15 (1.06) | 218 (70) | 2.90 (0.04) | 1051.1 (333.6) | 26.5 (1.0) | 16.9 (1.0) | 2.69 (0.17) | 52% | 2.34 (0.54) |


