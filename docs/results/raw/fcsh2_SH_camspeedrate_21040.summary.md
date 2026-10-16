# DART ablation summary

Sweep: camspeedrate = 21040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.63 (0.37) | 80.63 (22.91) | 4.53 (1.11) | 223 (79) | 2.84 (0.41) | 266.3 (93.7) | 24.8 (1.8) | 13.2 (1.8) | 2.39 (0.29) | 46% | 2.43 (0.83) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.76 (0.46) | 83.36 (20.30) | 4.80 (1.17) | 316 (97) | 4.01 (0.01) | 379.2 (118.7) | 24.8 (1.0) | 14.3 (1.5) | 2.40 (0.17) | 46% | 2.21 (0.74) |


