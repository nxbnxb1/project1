# DART ablation summary

Sweep: camspeedrate = 41020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.76 (0.49) | 88.65 (24.10) | 4.42 (1.10) | 123 (64) | 1.60 (0.22) | 592.8 (307.0) | 25.8 (2.2) | 16.0 (2.0) | 2.58 (0.36) | 49% | 2.11 (0.38) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.94 (0.24) | 81.23 (24.63) | 4.98 (1.17) | 162 (49) | 2.00 (0.01) | 782.3 (239.3) | 26.6 (1.1) | 16.8 (1.4) | 2.70 (0.20) | 52% | 2.20 (0.53) |


