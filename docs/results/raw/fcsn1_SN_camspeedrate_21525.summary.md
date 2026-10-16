# DART ablation summary

Sweep: camspeedrate = 21525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.34 (0.78) | 52.52 (26.43) | 7.12 (1.80) | 83 (66) | 1.51 (0.44) | 99.0 (78.3) | 22.0 (1.2) | 7.4 (3.1) | 1.73 (0.30) | 25% | 2.58 (0.63) |
| FR_SAFE | 30 | 83% [66, 93] | 13% [5, 30] | 0.98 (0.72) | 49.64 (22.62) | 7.00 (2.10) | 128 (68) | 2.51 (0.02) | 153.5 (81.7) | 22.7 (1.6) | 8.0 (3.5) | 1.85 (0.38) | 28% | 2.72 (0.95) |


