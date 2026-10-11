# DART ablation summary

Sweep: camspeed = 210

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 13% [5, 30] | 1.25 (1.04) | 57.70 (26.05) | 6.39 (2.33) | 90 (54) | 1.48 (0.46) | 108.0 (64.0) | 20.6 (2.3) | 4.2 (1.5) | 1.52 (0.37) | 26% | 2.56 (0.71) |
| FR_SAFE_3 | 30 | 70% [52, 83] | 27% [14, 44] | 1.10 (1.01) | 49.79 (13.47) | 7.06 (1.77) | 134 (51) | 2.96 (0.01) | 160.7 (60.7) | 21.1 (1.7) | 4.2 (1.2) | 1.58 (0.30) | 26% | 2.95 (0.88) |


