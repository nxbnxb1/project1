# DART ablation summary

Sweep: camspeedrate = 40620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 3% [1, 17] | 2.58 (1.40) | 43.97 (13.97) | 4.93 (1.09) | 47 (42) | 0.92 (0.54) | 225.5 (200.3) | 19.4 (5.2) | 5.2 (3.9) | 1.43 (0.92) | 15% | 3.55 (2.67) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.80 (1.97) | 48.06 (20.01) | 5.04 (0.96) | 96 (40) | 2.00 (0.01) | 462.6 (191.5) | 19.4 (5.1) | 5.5 (3.8) | 1.44 (0.91) | 15% | 3.65 (2.46) |


