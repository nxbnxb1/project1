# DART ablation summary

Sweep: camspeedrate = 11510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 33% [19, 51] | 1.91 (1.97) | 21.97 (2.76) | 7.88 (2.71) | 20 (15) | 0.76 (0.15) | 24.4 (18.6) | 22.1 (2.2) | 6.1 (4.9) | 1.76 (0.50) | 24% | 3.81 (2.50) |
| FR_SAFE | 30 | 73% [56, 86] | 27% [14, 44] | 2.09 (1.80) | 27.43 (21.80) | 7.70 (2.98) | 34 (27) | 1.02 (0.02) | 41.3 (33.3) | 22.2 (2.1) | 6.3 (5.1) | 1.77 (0.50) | 25% | 3.75 (2.64) |


