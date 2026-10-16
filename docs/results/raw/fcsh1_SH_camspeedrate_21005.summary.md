# DART ablation summary

Sweep: camspeedrate = 21005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 100% [80, 100] | -0.03 (0.02) | NaN (NaN) | 6.84 (1.87) | 8 (11) | 0.60 (0.08) | 9.2 (13.0) | 21.5 (2.7) | 5.8 (2.8) | 1.71 (0.50) | 31% | 2.30 (1.20) |
| FR_SAFE | 15 | 0% [0, 20] | 100% [80, 100] | -0.04 (0.03) | NaN (NaN) | 6.33 (2.06) | 9 (13) | 0.60 (0.10) | 10.4 (14.3) | 20.6 (2.4) | 4.9 (2.0) | 1.57 (0.44) | 25% | 2.58 (1.52) |


