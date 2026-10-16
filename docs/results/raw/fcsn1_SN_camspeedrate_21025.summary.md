# DART ablation summary

Sweep: camspeedrate = 21025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.16 (0.68) | 49.14 (21.99) | 7.06 (1.90) | 80 (56) | 1.50 (0.41) | 95.2 (67.2) | 22.1 (1.3) | 4.5 (1.9) | 1.74 (0.31) | 24% | 2.77 (0.80) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.05 (0.70) | 51.27 (21.23) | 7.08 (1.90) | 122 (55) | 2.51 (0.01) | 145.8 (64.8) | 22.3 (1.6) | 4.3 (1.6) | 1.76 (0.36) | 26% | 2.86 (0.97) |


