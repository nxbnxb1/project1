# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 30% [11, 60] | 0.52 (0.48) | 80.46 (17.12) | 4.43 (1.07) | 122 (74) | 2.00 (0.56) | 144.8 (87.6) | 24.6 (2.2) | 11.8 (2.0) | 2.30 (0.41) | 27% | 2.22 (0.56) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.82 (0.37) | 73.51 (10.10) | 4.89 (0.45) | 199 (62) | 2.95 (0.02) | 237.9 (74.0) | 24.4 (1.6) | 12.2 (1.4) | 2.25 (0.29) | 19% | 2.20 (0.56) |
| E_DART | 10 | 70% [40, 89] | 20% [6, 51] | 0.63 (0.52) | 80.28 (24.47) | 4.50 (1.14) | 150 (91) | 1.97 (0.21) | 177.4 (107.1) | 24.4 (2.1) | 11.7 (2.0) | 2.27 (0.40) | 26% | 2.15 (0.45) |


