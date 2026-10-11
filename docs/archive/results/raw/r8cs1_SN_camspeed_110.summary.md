# DART ablation summary

Sweep: camspeed = 110

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 10% [3, 26] | 1.62 (1.10) | 56.58 (32.79) | 6.77 (2.43) | 75 (50) | 1.31 (0.45) | 91.1 (59.8) | 20.3 (2.0) | 4.0 (1.1) | 1.44 (0.30) | 23% | 2.48 (0.80) |
| FR_SAFE_3 | 30 | 90% [74, 97] | 3% [1, 17] | 1.70 (0.77) | 53.85 (27.55) | 6.79 (2.02) | 165 (85) | 2.95 (0.01) | 200.9 (102.8) | 21.1 (1.7) | 4.5 (1.1) | 1.58 (0.27) | 24% | 2.98 (0.88) |


