# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 90% [70, 97] | 10% [3, 30] | 1.30 (0.75) | 46.42 (15.85) | 7.48 (1.59) | 50 (25) | 1.06 (0.17) | 58.9 (29.8) | 22.8 (1.6) | 8.7 (3.6) | 1.83 (0.38) | 24% | 2.25 (0.67) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.15 (0.46) | 48.94 (21.01) | 7.33 (1.69) | 74 (31) | 1.50 (0.01) | 87.3 (36.4) | 23.1 (1.8) | 8.6 (3.6) | 1.91 (0.42) | 27% | 2.02 (0.61) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.13 (0.52) | 51.27 (17.11) | 6.95 (1.76) | 65 (24) | 1.26 (0.06) | 77.3 (27.5) | 23.4 (1.8) | 9.3 (4.3) | 1.97 (0.42) | 30% | 2.34 (0.81) |


