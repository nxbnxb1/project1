# DART ablation summary

Sweep: camspeedrate = 40605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 2.49 (1.54) | 69.24 (65.16) | 4.45 (1.70) | 30 (34) | 0.36 (0.10) | 144.6 (162.7) | 19.2 (5.2) | 7.9 (6.3) | 1.42 (0.95) | 21% | 3.18 (2.52) |
| FR_SAFE | 30 | 83% [66, 93] | 7% [2, 21] | 2.70 (1.75) | 52.89 (33.92) | 4.42 (1.74) | 30 (18) | 0.51 (0.01) | 141.3 (85.4) | 19.9 (5.5) | 8.4 (6.8) | 1.53 (1.00) | 20% | 3.37 (2.57) |


