# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.59 (1.58) | 54.52 (50.48) | 6.03 (2.66) | 26 (25) | 0.46 (0.02) | 31.3 (29.3) | 21.8 (3.8) | 7.9 (6.3) | 1.73 (0.82) | 27% | 3.22 (2.46) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 3.10 (2.22) | 47.30 (46.88) | 6.35 (2.52) | 24 (23) | 0.51 (0.02) | 28.6 (27.4) | 21.6 (3.5) | 7.6 (6.0) | 1.68 (0.77) | 22% | 3.54 (2.66) |
| E_DART | 30 | 93% [79, 98] | 7% [2, 21] | 2.40 (1.62) | 50.48 (45.12) | 6.16 (2.40) | 25 (22) | 0.51 (0.01) | 29.5 (25.8) | 21.9 (3.8) | 7.8 (6.3) | 1.73 (0.83) | 27% | 3.35 (2.56) |


