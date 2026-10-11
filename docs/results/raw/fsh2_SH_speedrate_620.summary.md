# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.88 (0.15) | 97.85 (35.58) | 4.05 (0.93) | 148 (62) | 1.51 (0.29) | 177.5 (74.7) | 25.5 (0.8) | 15.7 (1.4) | 2.47 (0.16) | 31% | 2.24 (0.50) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.90 (0.32) | 74.46 (18.63) | 4.85 (0.69) | 149 (37) | 2.01 (0.01) | 178.6 (43.0) | 25.3 (0.8) | 15.7 (1.1) | 2.42 (0.18) | 22% | 2.26 (0.60) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.80 (0.31) | 81.65 (18.77) | 4.33 (0.81) | 132 (33) | 1.57 (0.06) | 159.4 (39.5) | 25.4 (0.8) | 15.6 (0.8) | 2.44 (0.16) | 29% | 2.14 (0.52) |


