# DART ablation summary

Sweep: camspeedrate = 11525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.19 (0.80) | 47.22 (25.91) | 7.54 (2.46) | 87 (67) | 1.60 (0.38) | 106.0 (81.4) | 23.0 (1.3) | 4.2 (1.6) | 1.94 (0.25) | 28% | 2.46 (0.77) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 1.29 (1.11) | 42.02 (15.00) | 7.96 (2.33) | 98 (42) | 2.51 (0.01) | 119.5 (50.1) | 23.3 (1.9) | 4.2 (1.6) | 1.97 (0.33) | 29% | 2.78 (0.92) |


