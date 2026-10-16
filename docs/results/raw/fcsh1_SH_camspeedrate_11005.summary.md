# DART ablation summary

Sweep: camspeedrate = 11005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 93% [70, 99] | -0.02 (0.05) | NaN (NaN) | 5.86 (2.20) | 17 (20) | 0.50 (0.04) | 20.8 (25.3) | 22.0 (2.4) | 4.8 (1.1) | 1.83 (0.40) | 37% | 2.18 (1.10) |
| FR_SAFE | 15 | 0% [0, 20] | 100% [80, 100] | -0.03 (0.02) | NaN (NaN) | 4.83 (2.77) | 18 (18) | 0.55 (0.08) | 21.6 (21.3) | 22.0 (2.3) | 5.6 (1.9) | 1.86 (0.42) | 32% | 2.26 (1.17) |


