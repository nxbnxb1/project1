# DART ablation summary

Sweep: camspeedrate = 20640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.47 (0.43) | 107.61 (32.57) | 3.96 (0.96) | 231 (143) | 2.48 (0.69) | 276.8 (172.5) | 23.3 (2.1) | 12.2 (2.7) | 2.11 (0.38) | 30% | 2.10 (0.39) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.63 (0.44) | 105.45 (34.12) | 3.91 (0.96) | 390 (169) | 4.01 (0.01) | 468.1 (204.8) | 24.2 (1.5) | 14.7 (2.2) | 2.27 (0.27) | 34% | 2.49 (0.61) |


