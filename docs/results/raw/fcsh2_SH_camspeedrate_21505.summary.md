# DART ablation summary

Sweep: camspeedrate = 21505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 100% [80, 100] | -0.02 (0.03) | NaN (NaN) | 7.42 (1.72) | 10 (12) | 0.52 (0.09) | 12.0 (14.6) | 21.8 (1.9) | 4.5 (1.8) | 1.70 (0.33) | 27% | 2.32 (1.07) |
| FR_SAFE | 15 | 0% [0, 20] | 100% [80, 100] | -0.04 (0.03) | NaN (NaN) | 7.21 (1.34) | 8 (6) | 0.58 (0.09) | 9.6 (7.2) | 21.9 (2.4) | 4.5 (1.5) | 1.74 (0.46) | 31% | 2.30 (1.02) |


