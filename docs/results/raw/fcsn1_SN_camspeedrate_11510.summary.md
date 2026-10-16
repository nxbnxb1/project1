# DART ablation summary

Sweep: camspeedrate = 11510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 53% [36, 70] | 47% [30, 64] | 0.69 (0.89) | 45.89 (20.03) | 7.99 (2.48) | 32 (19) | 0.86 (0.10) | 38.6 (22.8) | 23.7 (1.6) | 6.8 (2.7) | 2.03 (0.34) | 31% | 2.59 (1.74) |
| FR_SAFE | 30 | 70% [52, 83] | 30% [17, 48] | 0.72 (0.90) | 39.13 (12.84) | 8.25 (2.09) | 40 (15) | 1.01 (0.01) | 48.2 (19.2) | 23.2 (1.5) | 6.6 (2.6) | 1.95 (0.29) | 28% | 2.64 (1.14) |


