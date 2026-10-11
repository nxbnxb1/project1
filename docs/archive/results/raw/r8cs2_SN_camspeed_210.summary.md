# DART ablation summary

Sweep: camspeed = 210

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 13% [5, 30] | 1.33 (1.07) | 75.03 (39.63) | 5.49 (2.29) | 81 (44) | 1.36 (0.59) | 97.3 (53.5) | 19.6 (2.4) | 4.1 (1.2) | 1.41 (0.37) | 26% | 2.22 (0.98) |
| FR_SAFE_3 | 30 | 70% [52, 83] | 23% [12, 41] | 1.26 (1.26) | 56.97 (26.53) | 6.50 (2.09) | 157 (78) | 2.95 (0.01) | 188.8 (95.1) | 21.3 (1.6) | 4.7 (1.3) | 1.64 (0.30) | 30% | 2.91 (1.12) |


