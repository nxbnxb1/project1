# DART ablation summary

Sweep: camspeed = 415

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 2.22 (1.26) | 44.90 (16.49) | 8.13 (2.28) | 75 (36) | 1.57 (0.29) | 361.9 (174.8) | 23.3 (2.2) | 5.3 (1.7) | 2.04 (0.35) | 29% | 2.90 (1.11) |
| FR_SAFE_3 | 30 | 97% [83, 99] | 3% [1, 17] | 1.84 (1.12) | 45.67 (15.03) | 8.23 (1.78) | 122 (39) | 2.69 (0.03) | 588.6 (195.0) | 23.7 (1.5) | 5.6 (1.5) | 2.09 (0.27) | 33% | 3.00 (0.98) |


