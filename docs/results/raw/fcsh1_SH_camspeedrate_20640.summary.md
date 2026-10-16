# DART ablation summary

Sweep: camspeedrate = 20640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 27% [11, 52] | 0.55 (0.43) | 100.04 (25.07) | 3.68 (0.81) | 239 (152) | 2.47 (0.53) | 287.6 (184.8) | 23.2 (1.2) | 9.2 (1.2) | 2.11 (0.18) | 35% | 2.32 (0.36) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.69 (0.47) | 100.08 (28.38) | 4.03 (0.73) | 379 (124) | 4.01 (0.00) | 455.1 (146.9) | 24.7 (1.3) | 11.1 (0.7) | 2.33 (0.21) | 34% | 2.39 (0.43) |


