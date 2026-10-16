# DART ablation summary

Sweep: camspeedrate = 40610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 13% [4, 38] | 0.88 (0.56) | 163.69 (60.17) | 2.65 (0.90) | 140 (57) | 0.90 (0.07) | 672.8 (273.0) | 26.0 (1.1) | 16.4 (1.8) | 2.62 (0.22) | 50% | 2.55 (0.88) |
| FR_SAFE | 15 | 87% [62, 96] | 7% [1, 30] | 0.93 (0.55) | 137.46 (39.77) | 3.00 (0.95) | 126 (49) | 1.00 (0.00) | 604.2 (236.8) | 25.4 (1.9) | 15.8 (1.7) | 2.51 (0.33) | 43% | 2.11 (0.55) |


