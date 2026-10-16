# DART ablation summary

Sweep: camspeedrate = 41030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.73 (0.53) | 67.94 (14.10) | 5.74 (1.05) | 105 (63) | 1.96 (0.34) | 508.9 (302.1) | 26.1 (1.5) | 8.0 (1.1) | 2.60 (0.30) | 49% | 2.05 (0.57) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.89 (0.45) | 70.68 (21.97) | 5.56 (1.19) | 170 (74) | 2.69 (0.03) | 822.0 (361.0) | 26.3 (0.8) | 8.3 (1.0) | 2.63 (0.16) | 48% | 2.00 (0.49) |


