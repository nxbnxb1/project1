# DART ablation summary

Sweep: camspeedrate = 21025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 0.98 (1.15) | 54.20 (24.37) | 6.91 (1.68) | 77 (58) | 1.61 (0.44) | 93.0 (69.0) | 22.7 (1.7) | 8.3 (2.9) | 1.85 (0.37) | 26% | 2.42 (0.85) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.20 (1.01) | 50.40 (18.01) | 7.09 (1.65) | 114 (54) | 2.52 (0.03) | 136.0 (63.8) | 22.5 (1.6) | 8.1 (2.5) | 1.83 (0.34) | 26% | 2.68 (1.33) |


