# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.63 (0.46) | 89.05 (20.69) | 4.03 (1.21) | 114 (56) | 1.51 (0.37) | 134.9 (67.2) | 25.0 (1.9) | 11.5 (1.8) | 2.40 (0.36) | 31% | 2.12 (0.71) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.57 (0.34) | 91.97 (21.00) | 4.37 (0.84) | 154 (74) | 2.01 (0.01) | 183.8 (89.4) | 24.8 (2.2) | 11.7 (1.9) | 2.34 (0.41) | 28% | 2.28 (0.68) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.59 (0.48) | 77.26 (14.91) | 4.45 (0.89) | 110 (38) | 1.56 (0.11) | 131.4 (45.5) | 25.0 (1.9) | 11.4 (1.6) | 2.38 (0.36) | 29% | 2.16 (0.52) |


