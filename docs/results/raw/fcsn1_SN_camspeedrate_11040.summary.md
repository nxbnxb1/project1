# DART ablation summary

Sweep: camspeedrate = 11040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.28 (0.67) | 53.64 (25.42) | 6.79 (2.01) | 123 (102) | 2.09 (0.71) | 150.2 (123.9) | 21.7 (1.7) | 7.7 (2.8) | 1.68 (0.33) | 23% | 2.65 (0.90) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.21 (0.56) | 55.95 (36.36) | 7.07 (1.98) | 226 (142) | 4.01 (0.01) | 276.3 (174.1) | 22.9 (1.5) | 9.2 (3.6) | 1.87 (0.36) | 27% | 2.87 (0.90) |


