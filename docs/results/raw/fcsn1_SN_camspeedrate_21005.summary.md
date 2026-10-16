# DART ablation summary

Sweep: camspeedrate = 21005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 27% [14, 44] | 73% [56, 86] | 0.06 (0.21) | 43.59 (25.48) | 8.40 (1.59) | 12 (10) | 0.51 (0.07) | 14.1 (11.9) | 21.0 (1.6) | 2.5 (1.2) | 1.44 (0.34) | 15% | 2.81 (1.33) |
| FR_SAFE | 30 | 27% [14, 44] | 73% [56, 86] | 0.28 (0.78) | 43.83 (27.73) | 8.42 (1.70) | 13 (10) | 0.53 (0.05) | 16.2 (13.2) | 20.9 (1.8) | 2.3 (1.0) | 1.40 (0.34) | 14% | 3.04 (1.64) |


