# DART ablation summary

Sweep: camspeedrate = 10625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 40% [20, 64] | 0.38 (0.36) | 138.34 (23.48) | 3.26 (0.88) | 208 (117) | 1.81 (0.31) | 253.9 (140.4) | 23.0 (1.8) | 12.0 (2.5) | 2.10 (0.31) | 36% | 1.92 (0.45) |
| FR_SAFE | 15 | 47% [25, 70] | 47% [25, 70] | 0.39 (0.48) | 117.04 (30.08) | 3.52 (1.02) | 243 (137) | 2.51 (0.02) | 297.0 (166.5) | 23.6 (2.8) | 14.1 (2.9) | 2.17 (0.47) | 35% | 2.38 (0.77) |


