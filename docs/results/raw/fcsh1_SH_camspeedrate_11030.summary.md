# DART ablation summary

Sweep: camspeedrate = 11030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.35 (0.47) | 85.18 (24.25) | 4.65 (0.93) | 155 (81) | 2.10 (0.40) | 189.5 (100.9) | 24.7 (1.4) | 7.2 (0.7) | 2.38 (0.22) | 50% | 2.28 (0.45) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.77 (0.45) | 92.26 (25.97) | 4.73 (1.21) | 232 (110) | 2.96 (0.03) | 283.3 (135.2) | 24.9 (1.5) | 7.8 (0.8) | 2.42 (0.25) | 46% | 2.07 (0.34) |


