# DART ablation summary

Sweep: camspeedrate = 41530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 100% [80, 100] | 0% [0, 20] | 0.86 (0.42) | 62.88 (11.33) | 5.77 (0.77) | 121 (31) | 1.92 (0.28) | 584.0 (147.1) | 26.6 (0.5) | 11.7 (1.0) | 2.70 (0.12) | 47% | 2.05 (0.29) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.92 (0.29) | 63.12 (16.38) | 5.80 (0.82) | 170 (44) | 2.69 (0.03) | 816.6 (209.5) | 26.6 (0.7) | 12.1 (0.9) | 2.70 (0.14) | 50% | 1.94 (0.37) |


