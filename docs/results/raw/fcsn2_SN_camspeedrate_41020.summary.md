# DART ablation summary

Sweep: camspeedrate = 41020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.48 (1.11) | 50.29 (18.03) | 7.16 (1.59) | 68 (38) | 1.29 (0.27) | 326.0 (179.3) | 23.5 (1.8) | 9.2 (3.4) | 1.98 (0.41) | 29% | 2.57 (0.64) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.41 (0.77) | 47.25 (15.58) | 7.49 (1.48) | 90 (35) | 2.01 (0.03) | 430.8 (174.2) | 23.3 (1.7) | 8.8 (3.5) | 1.95 (0.39) | 28% | 2.48 (0.83) |


