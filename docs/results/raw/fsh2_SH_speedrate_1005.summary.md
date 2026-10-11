# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 30% [11, 60] | 70% [40, 89] | 0.25 (0.48) | 105.08 (5.75) | 4.40 (1.04) | 32 (18) | 0.49 (0.02) | 39.2 (22.1) | 25.9 (1.2) | 14.4 (2.0) | 2.59 (0.21) | 51% | 2.00 (0.65) |
| FR_SAFE | 10 | 40% [17, 69] | 60% [31, 83] | 0.26 (0.46) | 123.15 (18.67) | 3.77 (1.26) | 40 (29) | 0.52 (0.03) | 48.6 (34.7) | 25.5 (1.7) | 14.7 (2.6) | 2.52 (0.32) | 43% | 2.10 (0.67) |
| E_DART | 10 | 20% [6, 51] | 70% [40, 89] | 0.36 (0.74) | 89.38 (10.10) | 4.18 (1.82) | 26 (16) | 0.52 (0.03) | 32.2 (20.5) | 25.9 (2.1) | 13.9 (3.5) | 2.59 (0.41) | 53% | 2.00 (0.48) |


