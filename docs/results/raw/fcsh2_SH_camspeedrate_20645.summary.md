# DART ablation summary

Sweep: camspeedrate = 20645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.35 (0.44) | 113.32 (27.32) | 3.94 (1.08) | 259 (166) | 2.57 (0.90) | 309.7 (199.7) | 22.4 (2.4) | 8.7 (2.3) | 1.97 (0.43) | 26% | 2.09 (0.78) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.59 (0.48) | 92.34 (28.81) | 4.16 (1.15) | 357 (189) | 4.36 (0.02) | 428.6 (228.3) | 24.5 (1.5) | 10.7 (1.7) | 2.30 (0.29) | 33% | 2.14 (0.47) |


