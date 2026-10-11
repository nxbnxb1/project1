# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.80 (0.36) | 88.22 (18.55) | 4.18 (0.61) | 103 (32) | 1.15 (0.19) | 123.7 (38.7) | 25.6 (0.7) | 15.6 (0.9) | 2.49 (0.11) | 29% | 2.16 (0.82) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.67 (0.26) | 81.01 (18.28) | 4.41 (0.64) | 113 (37) | 1.50 (0.01) | 136.6 (43.9) | 25.6 (0.6) | 16.1 (0.8) | 2.49 (0.12) | 27% | 2.03 (0.39) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.85 (0.16) | 97.59 (18.61) | 3.84 (0.67) | 127 (23) | 1.31 (0.04) | 153.3 (28.0) | 25.2 (0.9) | 15.6 (0.9) | 2.45 (0.16) | 36% | 2.32 (0.38) |


