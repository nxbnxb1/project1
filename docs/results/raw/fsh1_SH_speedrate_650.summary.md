# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.63 (0.34) | 72.47 (7.17) | 4.81 (0.29) | 201 (70) | 2.80 (1.00) | 242.5 (85.0) | 24.8 (1.4) | 14.9 (1.5) | 2.31 (0.27) | 21% | 2.23 (0.47) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.37) | 77.05 (19.85) | 4.61 (0.65) | 351 (144) | 5.00 (0.00) | 420.6 (172.0) | 25.1 (1.4) | 16.2 (1.1) | 2.38 (0.25) | 24% | 2.18 (0.44) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.75 (0.33) | 81.02 (20.71) | 4.39 (0.93) | 197 (87) | 2.68 (0.42) | 237.0 (105.5) | 24.0 (2.9) | 14.4 (2.3) | 2.20 (0.46) | 26% | 2.08 (0.55) |


