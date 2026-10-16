# DART ablation summary

Sweep: camspeedrate = 21040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 3% [1, 17] | 1.18 (0.64) | 53.57 (19.38) | 6.69 (1.91) | 132 (84) | 2.27 (0.67) | 158.8 (100.8) | 22.4 (2.1) | 8.1 (2.7) | 1.82 (0.38) | 26% | 2.50 (0.76) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.30 (0.93) | 50.80 (21.87) | 7.01 (1.64) | 197 (91) | 4.01 (0.01) | 236.6 (109.8) | 23.1 (1.6) | 8.6 (2.9) | 1.92 (0.38) | 28% | 2.92 (0.96) |


