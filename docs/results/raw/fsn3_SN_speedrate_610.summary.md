# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 85% [64, 95] | 10% [3, 30] | 1.12 (0.54) | 72.21 (19.88) | 4.36 (1.34) | 64 (38) | 0.73 (0.17) | 77.6 (45.7) | 20.1 (3.1) | 9.4 (3.8) | 1.55 (0.57) | 21% | 2.44 (0.63) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.19 (0.49) | 73.02 (19.87) | 4.76 (0.81) | 72 (21) | 1.01 (0.01) | 86.6 (26.2) | 20.5 (2.5) | 9.6 (3.3) | 1.60 (0.44) | 18% | 2.63 (1.12) |
| E_DART | 20 | 95% [76, 99] | 0% [0, 16] | 1.18 (0.53) | 81.04 (33.33) | 4.53 (1.20) | 83 (33) | 1.01 (0.00) | 100.8 (40.3) | 20.2 (2.8) | 9.3 (3.4) | 1.55 (0.51) | 21% | 2.53 (0.89) |


