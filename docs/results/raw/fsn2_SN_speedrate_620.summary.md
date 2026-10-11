# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.15 (0.45) | 63.40 (13.14) | 5.21 (0.67) | 73 (33) | 1.11 (0.30) | 86.7 (38.3) | 18.8 (2.7) | 4.0 (1.8) | 1.29 (0.48) | 11% | 2.78 (0.67) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.20 (0.29) | 60.28 (11.54) | 5.43 (0.52) | 121 (23) | 2.01 (0.01) | 143.9 (26.1) | 18.7 (2.6) | 4.0 (1.8) | 1.26 (0.46) | 9% | 2.48 (0.75) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.13 (0.45) | 60.55 (8.70) | 5.29 (0.56) | 73 (20) | 1.23 (0.13) | 86.5 (24.5) | 18.1 (2.3) | 3.6 (1.5) | 1.16 (0.40) | 9% | 2.19 (0.82) |


