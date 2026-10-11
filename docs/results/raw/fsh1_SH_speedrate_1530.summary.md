# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.65 (0.42) | 73.84 (32.73) | 5.35 (1.47) | 163 (93) | 2.15 (0.43) | 195.2 (111.3) | 26.5 (1.3) | 16.0 (1.5) | 2.70 (0.21) | 47% | 2.16 (0.62) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.88 (0.20) | 70.61 (14.95) | 5.18 (0.89) | 208 (44) | 2.95 (0.00) | 250.1 (50.1) | 27.0 (0.7) | 17.0 (0.6) | 2.78 (0.12) | 55% | 2.23 (0.40) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.73 (0.44) | 68.77 (23.03) | 5.43 (1.30) | 155 (54) | 2.26 (0.16) | 186.6 (66.3) | 26.5 (0.6) | 16.1 (0.8) | 2.69 (0.11) | 50% | 2.19 (0.46) |


