# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.70 (0.32) | 68.46 (8.21) | 5.00 (0.36) | 193 (77) | 2.81 (1.12) | 232.7 (92.8) | 24.8 (0.6) | 14.8 (0.6) | 2.32 (0.12) | 18% | 2.24 (0.53) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.73 (0.34) | 72.65 (13.74) | 4.73 (0.66) | 364 (69) | 5.01 (0.00) | 438.0 (82.7) | 25.1 (0.8) | 16.4 (0.9) | 2.38 (0.17) | 24% | 2.24 (0.48) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.51 (0.38) | 68.49 (16.25) | 4.85 (0.76) | 165 (69) | 2.80 (0.43) | 199.0 (81.6) | 25.4 (0.9) | 15.8 (1.2) | 2.41 (0.20) | 22% | 2.26 (0.70) |


