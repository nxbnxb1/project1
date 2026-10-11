# DART ablation summary

Sweep: speed = 10

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 100% [80, 100] | 0% [0, 20] | 1.37 (0.38) | 47.94 (11.97) | 7.30 (1.10) | 84 (31) | 1.72 (0.21) | 101.2 (35.4) | 22.8 (1.1) | 4.5 (0.9) | 1.86 (0.25) | 23% | 2.70 (0.54) |
| COV_NOCLUT | 15 | 100% [80, 100] | 0% [0, 20] | 1.32 (0.35) | 54.69 (21.80) | 6.97 (1.71) | 89 (29) | 1.69 (0.38) | 106.7 (35.0) | 22.1 (2.1) | 4.4 (0.9) | 1.79 (0.35) | 27% | 2.66 (0.77) |


