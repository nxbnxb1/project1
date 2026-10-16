# DART ablation summary

Sweep: camspeedrate = 20610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 67% [42, 85] | 0.16 (0.33) | 175.40 (87.49) | 3.24 (0.88) | 83 (80) | 0.81 (0.12) | 99.2 (93.4) | 21.8 (2.0) | 10.8 (2.0) | 1.92 (0.33) | 37% | 2.44 (0.74) |
| FR_SAFE | 15 | 40% [20, 64] | 40% [20, 64] | 0.49 (0.59) | 160.49 (60.23) | 2.73 (0.96) | 113 (62) | 1.01 (0.00) | 136.1 (73.7) | 22.5 (2.0) | 12.2 (1.6) | 2.04 (0.31) | 36% | 2.29 (0.65) |


