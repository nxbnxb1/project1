# DART ablation summary

Sweep: camspeedrate = 11015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 2.46 (2.05) | 36.89 (26.13) | 6.84 (2.75) | 50 (68) | 0.85 (0.35) | 61.5 (84.6) | 21.6 (2.7) | 4.3 (3.2) | 1.67 (0.63) | 22% | 3.90 (2.78) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 2.77 (2.17) | 34.55 (23.85) | 7.11 (2.39) | 50 (34) | 1.51 (0.01) | 61.7 (41.9) | 21.6 (2.5) | 4.3 (3.0) | 1.67 (0.59) | 23% | 3.90 (2.78) |


