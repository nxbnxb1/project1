# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.63 (0.39) | 82.15 (12.98) | 4.42 (0.47) | 194 (67) | 2.34 (0.63) | 233.3 (81.4) | 25.5 (1.0) | 11.3 (1.1) | 2.45 (0.20) | 27% | 2.18 (0.28) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.45) | 74.50 (10.10) | 4.68 (0.55) | 254 (35) | 3.46 (0.00) | 304.2 (40.7) | 25.0 (1.1) | 11.3 (0.8) | 2.35 (0.21) | 23% | 2.28 (0.28) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.78 (0.32) | 68.72 (9.60) | 4.85 (0.55) | 152 (34) | 2.14 (0.19) | 183.0 (42.2) | 25.0 (1.1) | 10.9 (1.0) | 2.35 (0.22) | 21% | 2.00 (0.44) |


