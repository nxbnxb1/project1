# DART ablation summary

Sweep: camspeedrate = 40610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 2.42 (1.27) | 56.83 (36.23) | 4.65 (1.45) | 40 (41) | 0.58 (0.26) | 191.0 (194.9) | 19.5 (5.5) | 4.7 (3.8) | 1.47 (0.98) | 20% | 3.14 (2.37) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 2.70 (1.50) | 48.48 (19.90) | 4.81 (1.24) | 50 (24) | 1.01 (0.01) | 242.6 (116.2) | 19.5 (5.3) | 4.9 (3.7) | 1.45 (0.95) | 17% | 3.55 (2.28) |


