# DART ablation summary

Sweep: camspeedrate = 11530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.41 (0.49) | 86.12 (34.00) | 4.78 (1.08) | 166 (89) | 2.17 (0.34) | 203.2 (108.1) | 24.9 (1.5) | 12.5 (1.9) | 2.42 (0.26) | 48% | 2.05 (0.46) |
| FR_SAFE | 15 | 53% [30, 75] | 33% [15, 58] | 0.55 (0.49) | 89.76 (20.62) | 4.56 (2.06) | 225 (96) | 2.95 (0.01) | 274.4 (116.2) | 24.9 (2.1) | 13.1 (2.8) | 2.42 (0.35) | 50% | 1.99 (0.57) |


