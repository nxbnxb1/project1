# DART ablation summary

Sweep: camspeedrate = 21520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 53% [30, 75] | 0.18 (0.30) | 117.37 (61.66) | 4.61 (1.44) | 116 (111) | 1.66 (0.19) | 140.1 (133.1) | 24.3 (2.3) | 11.6 (2.5) | 2.29 (0.42) | 44% | 2.46 (0.60) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.31 (0.43) | 101.76 (21.64) | 4.46 (1.50) | 146 (77) | 2.02 (0.04) | 176.5 (94.2) | 24.4 (2.5) | 12.3 (2.6) | 2.34 (0.44) | 47% | 2.40 (0.49) |


