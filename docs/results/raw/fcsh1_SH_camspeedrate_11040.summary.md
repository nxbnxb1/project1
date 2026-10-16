# DART ablation summary

Sweep: camspeedrate = 11040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.56 (0.48) | 90.26 (25.62) | 4.71 (1.55) | 195 (119) | 2.72 (0.51) | 239.0 (146.9) | 24.2 (1.4) | 14.2 (1.9) | 2.28 (0.23) | 46% | 2.21 (0.56) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.61 (0.39) | 90.91 (33.27) | 4.49 (1.33) | 340 (145) | 4.01 (0.01) | 415.9 (179.2) | 24.5 (2.8) | 16.4 (1.7) | 2.37 (0.44) | 47% | 2.20 (0.46) |


