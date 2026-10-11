# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.75 (1.49) | 30.70 (15.39) | 7.61 (1.61) | 70 (66) | 1.97 (0.95) | 83.0 (78.3) | 22.3 (3.0) | 6.1 (4.0) | 1.80 (0.67) | 23% | 3.53 (2.48) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.44 (1.11) | 29.88 (15.48) | 7.61 (1.59) | 120 (62) | 4.02 (0.01) | 144.0 (74.4) | 22.5 (2.9) | 6.5 (4.1) | 1.84 (0.68) | 27% | 3.62 (2.46) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.30 (1.24) | 29.70 (10.23) | 7.55 (1.47) | 64 (36) | 2.04 (0.60) | 77.0 (42.5) | 22.2 (2.6) | 6.0 (3.8) | 1.77 (0.60) | 23% | 3.57 (2.79) |


