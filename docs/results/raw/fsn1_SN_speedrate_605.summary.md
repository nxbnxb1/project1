# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 80% [58, 92] | 20% [8, 42] | 0.86 (0.76) | 83.95 (34.11) | 4.59 (1.11) | 32 (18) | 0.41 (0.06) | 39.2 (21.3) | 19.0 (3.4) | 7.2 (4.0) | 1.35 (0.63) | 19% | 2.23 (0.62) |
| FR_SAFE | 20 | 80% [58, 92] | 10% [3, 30] | 1.28 (0.68) | 85.72 (42.26) | 4.26 (1.39) | 43 (21) | 0.51 (0.01) | 51.6 (26.0) | 19.5 (3.5) | 7.7 (4.3) | 1.45 (0.63) | 22% | 2.10 (0.67) |
| E_DART | 20 | 80% [58, 92] | 15% [5, 36] | 1.01 (0.77) | 76.66 (23.27) | 4.31 (1.11) | 45 (19) | 0.51 (0.00) | 55.1 (22.1) | 20.1 (3.2) | 8.0 (3.8) | 1.55 (0.58) | 26% | 2.08 (0.43) |


