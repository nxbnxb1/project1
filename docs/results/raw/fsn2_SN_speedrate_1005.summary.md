# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 70% [48, 85] | 30% [15, 52] | 0.86 (1.02) | 50.99 (15.45) | 6.60 (1.85) | 22 (8) | 0.47 (0.02) | 26.4 (9.5) | 22.5 (2.4) | 7.9 (4.2) | 1.80 (0.53) | 26% | 1.85 (0.53) |
| FR_SAFE | 20 | 65% [43, 82] | 35% [18, 57] | 0.95 (1.03) | 51.77 (22.13) | 6.77 (1.93) | 24 (11) | 0.51 (0.01) | 28.4 (13.0) | 22.3 (2.7) | 7.5 (4.4) | 1.76 (0.57) | 23% | 2.01 (0.83) |
| E_DART | 20 | 60% [39, 78] | 40% [22, 61] | 0.78 (0.97) | 53.92 (23.20) | 6.41 (1.89) | 25 (12) | 0.51 (0.01) | 29.6 (13.5) | 22.6 (2.7) | 7.7 (4.0) | 1.83 (0.59) | 28% | 1.96 (0.74) |


