# DART ablation summary

Sweep: camspeedrate = 11035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.45 (0.54) | 92.10 (28.53) | 4.71 (1.04) | 210 (101) | 2.46 (0.43) | 255.8 (123.2) | 24.5 (1.1) | 12.5 (1.2) | 2.33 (0.18) | 46% | 2.24 (0.55) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.72 (0.46) | 102.96 (35.74) | 4.15 (1.20) | 320 (148) | 3.45 (0.01) | 391.6 (183.1) | 25.1 (1.5) | 14.6 (1.6) | 2.47 (0.24) | 49% | 2.29 (0.79) |


