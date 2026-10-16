# DART ablation summary

Sweep: camspeedrate = 41505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 63% [46, 78] | 30% [17, 48] | 0.73 (0.96) | 63.61 (37.36) | 5.95 (2.18) | 29 (19) | 0.47 (0.03) | 137.4 (93.1) | 23.1 (2.1) | 8.7 (4.1) | 1.95 (0.48) | 31% | 1.99 (0.66) |
| FR_SAFE | 30 | 57% [39, 73] | 40% [25, 58] | 0.76 (1.10) | 61.62 (32.01) | 6.25 (2.14) | 27 (18) | 0.52 (0.03) | 130.1 (87.2) | 22.4 (2.3) | 7.8 (3.7) | 1.80 (0.49) | 24% | 1.97 (0.98) |


