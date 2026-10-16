# DART ablation summary

Sweep: camspeedrate = 41040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.74 (0.53) | 70.63 (20.56) | 5.10 (1.12) | 148 (64) | 2.09 (0.32) | 709.3 (308.2) | 26.4 (0.8) | 9.0 (0.8) | 2.66 (0.15) | 47% | 2.31 (0.58) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.73 (0.54) | 69.40 (13.55) | 5.05 (1.22) | 185 (57) | 2.90 (0.03) | 890.1 (272.4) | 26.8 (1.0) | 9.8 (0.8) | 2.74 (0.19) | 54% | 2.28 (0.44) |


