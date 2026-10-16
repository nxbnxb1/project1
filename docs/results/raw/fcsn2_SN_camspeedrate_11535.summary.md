# DART ablation summary

Sweep: camspeedrate = 11535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 17% [7, 34] | 1.11 (0.88) | 51.51 (19.23) | 6.61 (2.37) | 130 (75) | 2.32 (0.64) | 159.0 (93.3) | 23.1 (1.9) | 9.0 (3.0) | 2.00 (0.34) | 33% | 2.74 (1.08) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 1.29 (0.89) | 51.61 (22.07) | 6.94 (2.42) | 177 (81) | 3.46 (0.01) | 217.0 (100.5) | 23.3 (1.9) | 9.3 (3.1) | 2.02 (0.32) | 32% | 2.68 (1.24) |


