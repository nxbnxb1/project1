# DART ablation summary

Sweep: camspeed = 110

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 27% [11, 52] | 0.70 (0.72) | 118.06 (35.61) | 3.93 (1.90) | 120 (76) | 1.46 (0.50) | 148.3 (93.0) | 20.0 (2.3) | 5.6 (0.8) | 1.59 (0.33) | 40% | 1.95 (0.53) |
| FR_SAFE_3 | 15 | 60% [36, 80] | 20% [7, 45] | 1.08 (0.76) | 89.47 (24.31) | 4.35 (1.93) | 244 (140) | 2.95 (0.01) | 298.5 (172.4) | 21.6 (2.9) | 6.6 (0.9) | 1.86 (0.43) | 44% | 2.59 (0.56) |


