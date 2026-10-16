# DART ablation summary

Sweep: camspeedrate = 20630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 2.23 (1.48) | 52.79 (31.79) | 4.80 (1.28) | 87 (116) | 1.12 (0.80) | 104.0 (139.0) | 18.5 (4.3) | 5.1 (3.7) | 1.28 (0.77) | 14% | 3.65 (2.50) |
| FR_SAFE | 30 | 87% [70, 95] | 3% [1, 17] | 2.33 (1.39) | 47.36 (25.46) | 4.68 (1.54) | 155 (88) | 2.95 (0.01) | 185.8 (104.6) | 19.3 (5.1) | 6.2 (4.6) | 1.43 (0.91) | 17% | 4.03 (2.66) |


