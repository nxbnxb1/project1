# DART ablation summary

Sweep: camspeedrate = 11015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 0.99 (0.76) | 57.88 (35.80) | 6.69 (2.09) | 63 (51) | 1.00 (0.20) | 76.1 (60.8) | 22.3 (1.5) | 7.6 (3.3) | 1.79 (0.37) | 26% | 2.38 (0.73) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 1.12 (0.76) | 53.00 (24.33) | 6.67 (2.10) | 80 (38) | 1.50 (0.01) | 96.7 (45.8) | 22.5 (1.7) | 8.0 (3.1) | 1.83 (0.38) | 29% | 2.40 (0.62) |


