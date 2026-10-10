# DART ablation summary

Sweep: camspeed = 210

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 53% [30, 75] | 0.87 (1.21) | 48.24 (15.01) | 7.48 (2.43) | 233 (147) | 5.84 (2.02) | 278.9 (177.0) | 21.1 (2.9) | 4.4 (2.0) | 1.52 (0.48) | 22% | 4.03 (1.82) |
| FR_SAFE_3 | 15 | 53% [30, 75] | 40% [20, 64] | 0.73 (0.81) | 46.46 (13.53) | 6.89 (2.19) | 124 (54) | 2.96 (0.01) | 149.5 (65.5) | 20.8 (2.1) | 4.3 (1.4) | 1.53 (0.36) | 25% | 3.27 (0.98) |


