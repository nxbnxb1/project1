# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.31 (0.71) | 41.81 (6.91) | 7.95 (0.89) | 93 (34) | 2.16 (0.57) | 111.5 (40.5) | 22.9 (1.9) | 9.3 (3.7) | 1.86 (0.41) | 22% | 2.86 (0.91) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.32 (0.46) | 42.89 (9.57) | 7.82 (1.00) | 172 (38) | 4.01 (0.01) | 207.1 (45.7) | 23.2 (1.5) | 9.9 (3.7) | 1.90 (0.36) | 24% | 2.97 (0.99) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.11 (0.54) | 42.08 (8.56) | 7.77 (1.12) | 88 (32) | 2.11 (0.39) | 106.5 (38.2) | 23.0 (1.7) | 9.6 (3.8) | 1.88 (0.39) | 24% | 2.77 (0.97) |


