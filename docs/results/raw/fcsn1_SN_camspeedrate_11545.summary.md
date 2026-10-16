# DART ablation summary

Sweep: camspeedrate = 11545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 20% [10, 37] | 1.14 (0.89) | 47.73 (24.08) | 7.86 (2.21) | 111 (92) | 2.42 (0.71) | 135.6 (112.2) | 23.9 (1.2) | 7.3 (3.0) | 2.08 (0.28) | 31% | 2.68 (0.68) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.53 (0.71) | 44.11 (16.39) | 8.08 (1.82) | 191 (70) | 4.36 (0.01) | 233.3 (84.9) | 23.6 (1.2) | 7.3 (2.7) | 2.02 (0.26) | 30% | 2.81 (0.95) |


