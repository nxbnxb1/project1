# DART ablation summary

Sweep: camspeedrate = 11025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 20% [10, 37] | 1.14 (0.98) | 46.96 (15.81) | 6.81 (2.20) | 73 (48) | 1.47 (0.48) | 89.2 (57.8) | 22.5 (1.8) | 5.8 (2.6) | 1.82 (0.42) | 27% | 2.44 (0.68) |
| FR_SAFE | 30 | 87% [70, 95] | 7% [2, 21] | 1.24 (0.65) | 54.85 (22.28) | 6.47 (2.18) | 137 (64) | 2.51 (0.01) | 167.4 (77.1) | 22.4 (1.7) | 6.8 (2.7) | 1.81 (0.37) | 27% | 2.54 (0.77) |


