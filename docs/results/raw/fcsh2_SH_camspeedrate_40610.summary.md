# DART ablation summary

Sweep: camspeedrate = 40610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.70 (0.53) | 100.91 (18.14) | 4.01 (0.60) | 72 (28) | 0.85 (0.10) | 349.9 (137.5) | 25.0 (1.4) | 8.2 (1.1) | 2.41 (0.25) | 33% | 2.04 (0.55) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.71 (0.49) | 124.23 (35.35) | 3.65 (0.89) | 111 (45) | 1.01 (0.01) | 532.3 (216.1) | 25.7 (1.4) | 8.4 (1.3) | 2.55 (0.27) | 40% | 2.17 (0.54) |


