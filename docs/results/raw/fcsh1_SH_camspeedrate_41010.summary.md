# DART ablation summary

Sweep: camspeedrate = 41010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.34 (0.40) | 101.00 (32.77) | 4.22 (1.63) | 74 (39) | 0.90 (0.08) | 355.4 (188.7) | 25.8 (1.4) | 15.2 (2.4) | 2.58 (0.28) | 49% | 1.87 (0.53) |
| FR_SAFE | 15 | 60% [36, 80] | 33% [15, 58] | 0.41 (0.51) | 99.23 (22.19) | 4.54 (1.36) | 91 (46) | 1.01 (0.00) | 438.5 (221.2) | 26.3 (1.1) | 15.6 (1.6) | 2.65 (0.23) | 50% | 1.85 (0.44) |


