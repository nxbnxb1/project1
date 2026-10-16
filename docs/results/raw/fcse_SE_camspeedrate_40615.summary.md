# DART ablation summary

Sweep: camspeedrate = 40615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.58 (1.41) | 52.97 (32.57) | 4.85 (1.22) | 49 (55) | 0.75 (0.41) | 235.0 (262.9) | 19.6 (5.5) | 6.4 (4.8) | 1.48 (0.98) | 17% | 3.31 (2.44) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.81 (1.59) | 47.40 (19.45) | 4.93 (1.05) | 71 (29) | 1.51 (0.01) | 342.3 (139.6) | 19.5 (5.2) | 6.0 (4.4) | 1.45 (0.92) | 14% | 3.61 (2.53) |


