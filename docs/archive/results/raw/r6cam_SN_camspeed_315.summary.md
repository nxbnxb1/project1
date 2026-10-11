# DART ablation summary

Sweep: camspeed = 315

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 1.97 (1.21) | 44.76 (27.20) | 8.73 (2.21) | 71 (26) | 1.77 (0.36) | 85.7 (30.7) | 23.5 (1.6) | 5.2 (1.4) | 2.03 (0.24) | 23% | 2.98 (0.87) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 1.69 (0.44) | 40.11 (9.99) | 8.67 (1.54) | 118 (29) | 2.95 (0.01) | 142.6 (36.8) | 24.2 (1.0) | 5.7 (1.6) | 2.16 (0.21) | 30% | 3.37 (0.99) |


