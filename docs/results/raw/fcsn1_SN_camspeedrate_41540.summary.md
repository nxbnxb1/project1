# DART ablation summary

Sweep: camspeedrate = 41540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.39 (0.66) | 39.16 (9.91) | 8.76 (1.50) | 71 (27) | 1.78 (0.25) | 342.6 (130.2) | 24.4 (0.9) | 6.6 (2.4) | 2.20 (0.20) | 32% | 2.45 (0.84) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.43 (0.50) | 41.23 (12.48) | 8.44 (1.66) | 119 (37) | 2.89 (0.05) | 575.3 (174.3) | 24.7 (1.2) | 7.4 (2.8) | 2.25 (0.25) | 34% | 2.79 (0.89) |


