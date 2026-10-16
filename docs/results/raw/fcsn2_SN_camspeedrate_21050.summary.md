# DART ablation summary

Sweep: camspeedrate = 21050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.13 (0.70) | 48.40 (14.01) | 7.11 (1.42) | 129 (70) | 2.65 (0.78) | 155.5 (83.0) | 23.0 (1.4) | 8.9 (3.0) | 1.90 (0.32) | 26% | 2.57 (0.75) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.30 (0.68) | 48.85 (15.78) | 7.09 (1.57) | 242 (79) | 5.01 (0.01) | 290.2 (95.4) | 22.8 (1.8) | 9.3 (3.3) | 1.86 (0.39) | 27% | 2.80 (0.99) |


