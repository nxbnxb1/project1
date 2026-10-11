# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 75% [53, 89] | 25% [11, 47] | 0.78 (0.64) | 63.54 (31.22) | 6.26 (1.61) | 25 (16) | 0.48 (0.03) | 30.5 (20.4) | 22.6 (1.7) | 8.4 (2.8) | 1.86 (0.37) | 27% | 2.28 (0.88) |
| FR_SAFE | 20 | 70% [48, 85] | 30% [15, 52] | 1.04 (1.62) | 56.85 (18.69) | 5.93 (1.96) | 28 (14) | 0.51 (0.02) | 34.0 (15.6) | 23.3 (2.2) | 9.4 (4.2) | 1.98 (0.49) | 30% | 2.08 (0.63) |
| E_DART | 20 | 65% [43, 82] | 30% [15, 52] | 0.63 (1.16) | 70.36 (30.24) | 5.31 (2.04) | 33 (17) | 0.52 (0.02) | 39.8 (21.3) | 23.5 (2.0) | 9.5 (3.6) | 2.05 (0.46) | 38% | 2.17 (0.82) |


