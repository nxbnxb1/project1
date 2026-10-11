# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 80% [58, 92] | 15% [5, 36] | 0.97 (0.93) | 90.09 (39.01) | 4.05 (1.28) | 41 (22) | 0.44 (0.05) | 50.0 (26.8) | 20.7 (2.8) | 8.9 (3.3) | 1.66 (0.52) | 27% | 2.10 (0.69) |
| FR_SAFE | 20 | 65% [43, 82] | 20% [8, 42] | 1.08 (0.85) | 70.16 (20.15) | 4.21 (1.44) | 41 (16) | 0.51 (0.01) | 49.7 (19.0) | 20.9 (3.4) | 9.0 (3.9) | 1.69 (0.63) | 23% | 2.43 (0.76) |
| E_DART | 20 | 70% [48, 85] | 15% [5, 36] | 0.77 (0.61) | 77.62 (21.77) | 4.20 (1.43) | 41 (17) | 0.51 (0.01) | 50.0 (19.9) | 20.7 (2.7) | 8.7 (3.3) | 1.66 (0.51) | 26% | 2.19 (0.87) |


