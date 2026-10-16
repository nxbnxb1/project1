# DART ablation summary

Sweep: camspeedrate = 41520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.63 (2.19) | 32.22 (21.53) | 8.25 (2.53) | 44 (42) | 1.22 (0.27) | 211.3 (203.0) | 23.2 (1.9) | 7.9 (5.3) | 2.01 (0.42) | 30% | 3.67 (2.81) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.49 (2.27) | 31.58 (21.30) | 8.25 (2.38) | 63 (42) | 2.01 (0.01) | 304.7 (205.1) | 23.0 (1.8) | 8.0 (5.2) | 1.96 (0.40) | 29% | 3.85 (2.60) |


