# DART ablation summary

Sweep: camspeedrate = 10640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.74 (0.41) | 97.65 (17.90) | 4.08 (0.86) | 205 (102) | 2.29 (0.78) | 250.7 (122.5) | 22.6 (2.1) | 7.1 (1.4) | 1.99 (0.37) | 25% | 2.01 (0.50) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.67 (0.49) | 109.95 (28.11) | 3.76 (1.04) | 361 (169) | 4.01 (0.01) | 441.3 (206.9) | 23.6 (2.1) | 8.4 (1.1) | 2.16 (0.34) | 32% | 2.48 (0.53) |


