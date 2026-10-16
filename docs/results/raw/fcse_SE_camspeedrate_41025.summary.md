# DART ablation summary

Sweep: camspeedrate = 41025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 3.02 (1.97) | 34.08 (18.65) | 7.36 (1.99) | 48 (48) | 1.20 (0.55) | 233.1 (230.8) | 22.0 (2.8) | 5.8 (4.0) | 1.74 (0.64) | 25% | 3.51 (2.87) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.88 (2.31) | 35.48 (22.30) | 7.19 (2.11) | 87 (53) | 2.43 (0.02) | 417.2 (255.7) | 22.4 (3.1) | 6.4 (4.4) | 1.80 (0.69) | 27% | 3.45 (2.44) |


