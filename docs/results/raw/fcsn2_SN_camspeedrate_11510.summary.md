# DART ablation summary

Sweep: camspeedrate = 11510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 40% [25, 58] | 60% [42, 75] | 0.49 (1.13) | 49.22 (23.91) | 8.32 (2.56) | 28 (21) | 0.91 (0.13) | 33.6 (25.3) | 23.2 (1.5) | 6.5 (2.4) | 1.94 (0.27) | 27% | 2.49 (1.22) |
| FR_SAFE | 30 | 57% [39, 73] | 43% [27, 61] | 0.71 (1.14) | 59.17 (40.95) | 7.60 (2.95) | 42 (39) | 1.03 (0.06) | 51.5 (48.9) | 23.0 (1.3) | 6.7 (2.7) | 1.94 (0.26) | 29% | 2.39 (0.89) |


