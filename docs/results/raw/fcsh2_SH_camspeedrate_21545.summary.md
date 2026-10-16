# DART ablation summary

Sweep: camspeedrate = 21545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.49 (0.47) | 70.21 (15.03) | 5.05 (1.11) | 184 (97) | 2.96 (0.66) | 220.2 (115.9) | 24.5 (1.5) | 9.3 (1.1) | 2.32 (0.22) | 44% | 2.33 (0.61) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.51 (0.45) | 72.99 (16.22) | 5.44 (1.26) | 260 (119) | 4.37 (0.03) | 310.9 (142.4) | 25.0 (1.6) | 10.5 (2.0) | 2.39 (0.32) | 47% | 2.29 (0.64) |


