# DART ablation summary

Sweep: camspeedrate = 21025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 47% [25, 70] | 0.38 (0.47) | 102.32 (20.83) | 4.66 (1.70) | 154 (104) | 1.93 (0.38) | 184.5 (126.3) | 24.5 (1.4) | 10.9 (2.3) | 2.33 (0.28) | 46% | 1.91 (0.50) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.71 (0.61) | 90.72 (21.84) | 4.25 (1.22) | 208 (92) | 2.51 (0.02) | 248.1 (110.7) | 24.7 (1.3) | 11.9 (1.7) | 2.39 (0.21) | 50% | 2.03 (0.50) |


