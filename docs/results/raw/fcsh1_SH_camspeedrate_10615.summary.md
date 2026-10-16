# DART ablation summary

Sweep: camspeedrate = 10615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 40% [20, 64] | 0.33 (0.45) | 126.45 (11.53) | 2.72 (0.65) | 140 (58) | 1.20 (0.14) | 169.5 (71.1) | 22.1 (2.3) | 11.8 (2.0) | 1.98 (0.36) | 36% | 2.26 (0.68) |
| FR_SAFE | 15 | 47% [25, 70] | 47% [25, 70] | 0.35 (0.52) | 142.36 (37.65) | 2.96 (0.83) | 160 (86) | 1.50 (0.01) | 195.5 (106.0) | 23.1 (1.7) | 13.4 (1.5) | 2.13 (0.27) | 40% | 2.25 (0.70) |


