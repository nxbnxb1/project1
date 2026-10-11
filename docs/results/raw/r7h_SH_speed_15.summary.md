# DART ablation summary

Sweep: speed = 15

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.95 (0.54) | 80.59 (22.71) | 5.21 (1.12) | 150 (55) | 1.90 (0.42) | 180.1 (66.4) | 24.4 (1.9) | 7.9 (1.1) | 2.32 (0.32) | 47% | 2.06 (0.49) |
| COV_NOCLUT | 15 | 67% [42, 85] | 27% [11, 52] | 1.10 (0.91) | 69.37 (23.62) | 5.71 (2.40) | 102 (53) | 1.71 (0.54) | 123.3 (63.5) | 23.4 (3.5) | 7.5 (1.2) | 2.15 (0.54) | 48% | 2.07 (0.47) |


