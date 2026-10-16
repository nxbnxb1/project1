# DART ablation summary

Sweep: camspeedrate = 21525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 27% [14, 44] | 0.93 (0.97) | 50.62 (21.59) | 6.99 (1.79) | 84 (54) | 1.61 (0.42) | 100.6 (65.4) | 22.6 (1.6) | 7.6 (2.6) | 1.85 (0.34) | 28% | 2.30 (0.78) |
| FR_SAFE | 30 | 73% [56, 86] | 27% [14, 44] | 1.01 (0.98) | 49.99 (17.18) | 7.05 (1.75) | 107 (55) | 2.52 (0.03) | 128.4 (65.8) | 22.7 (1.4) | 8.0 (2.7) | 1.87 (0.32) | 28% | 2.75 (1.38) |


