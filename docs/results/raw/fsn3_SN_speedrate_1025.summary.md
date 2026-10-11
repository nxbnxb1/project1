# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.34 (0.86) | 43.89 (9.30) | 7.64 (1.12) | 71 (24) | 1.59 (0.27) | 86.4 (27.9) | 23.5 (1.5) | 9.8 (2.7) | 1.98 (0.34) | 23% | 2.64 (0.82) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.32 (1.14) | 48.89 (18.82) | 7.20 (1.60) | 123 (46) | 2.51 (0.01) | 147.9 (53.9) | 24.0 (1.6) | 11.1 (3.5) | 2.09 (0.37) | 32% | 2.62 (0.80) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.18 (0.72) | 46.91 (12.21) | 7.24 (1.30) | 82 (28) | 1.71 (0.17) | 98.6 (34.2) | 23.8 (1.5) | 10.3 (2.8) | 2.05 (0.33) | 30% | 2.49 (1.30) |


