# DART ablation summary

Sweep: camspeedrate = 11520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 20% [10, 37] | 0.90 (0.99) | 55.91 (20.85) | 6.41 (2.46) | 84 (45) | 1.50 (0.31) | 102.5 (55.3) | 23.0 (2.1) | 8.2 (2.9) | 2.00 (0.38) | 31% | 2.44 (1.04) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 0.92 (1.04) | 48.12 (22.37) | 7.62 (2.66) | 92 (54) | 2.01 (0.01) | 112.9 (65.6) | 23.5 (1.1) | 7.9 (2.9) | 2.03 (0.21) | 32% | 2.93 (1.17) |


