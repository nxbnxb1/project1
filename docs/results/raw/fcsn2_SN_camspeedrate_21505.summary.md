# DART ablation summary

Sweep: camspeedrate = 21505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 20% [10, 37] | 77% [59, 88] | 0.19 (0.49) | 34.27 (2.75) | 8.44 (2.00) | 10 (11) | 0.52 (0.06) | 12.9 (14.0) | 20.5 (1.5) | 2.3 (0.9) | 1.35 (0.25) | 11% | 3.03 (2.27) |
| FR_SAFE | 30 | 23% [12, 41] | 77% [59, 88] | 0.25 (0.91) | 34.37 (2.61) | 8.65 (0.82) | 10 (6) | 0.55 (0.05) | 12.0 (7.5) | 21.3 (1.5) | 2.4 (0.9) | 1.49 (0.29) | 13% | 2.32 (1.18) |


