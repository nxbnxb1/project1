# DART ablation summary

Sweep: camspeedrate = 21535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.34 (0.35) | 86.67 (33.55) | 4.96 (1.63) | 214 (136) | 2.49 (0.51) | 256.0 (163.4) | 24.6 (1.3) | 12.4 (2.3) | 2.35 (0.23) | 44% | 2.37 (0.65) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.53 (0.50) | 77.50 (17.93) | 5.19 (1.58) | 231 (115) | 3.46 (0.01) | 276.8 (137.1) | 25.1 (0.9) | 13.3 (2.3) | 2.44 (0.18) | 47% | 2.30 (0.60) |


