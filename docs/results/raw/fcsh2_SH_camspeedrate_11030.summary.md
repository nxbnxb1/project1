# DART ablation summary

Sweep: camspeedrate = 11030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 40% [20, 64] | 0.43 (0.48) | 97.98 (36.61) | 4.14 (1.65) | 171 (107) | 2.25 (0.45) | 209.2 (130.6) | 23.7 (2.1) | 12.6 (2.1) | 2.21 (0.32) | 45% | 2.07 (0.48) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.70 (0.55) | 86.10 (25.90) | 4.68 (1.33) | 226 (93) | 2.95 (0.01) | 276.2 (113.0) | 24.5 (1.6) | 13.1 (1.8) | 2.36 (0.26) | 44% | 2.09 (0.50) |


