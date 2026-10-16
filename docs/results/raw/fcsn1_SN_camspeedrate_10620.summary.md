# DART ablation summary

Sweep: camspeedrate = 10620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 20% [10, 37] | 0.98 (0.86) | 68.60 (17.71) | 4.43 (1.28) | 89 (65) | 1.08 (0.40) | 108.3 (79.0) | 18.7 (2.5) | 7.2 (3.4) | 1.32 (0.46) | 17% | 2.55 (0.70) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.10 (0.63) | 78.41 (24.89) | 4.60 (0.98) | 154 (50) | 2.01 (0.00) | 188.2 (59.9) | 18.8 (2.6) | 7.7 (3.2) | 1.32 (0.47) | 18% | 3.02 (0.93) |


