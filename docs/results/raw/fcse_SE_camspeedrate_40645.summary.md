# DART ablation summary

Sweep: camspeedrate = 40645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.25 (0.97) | 44.55 (14.58) | 5.11 (0.83) | 58 (58) | 1.13 (0.77) | 280.6 (278.7) | 18.9 (5.0) | 4.5 (3.4) | 1.35 (0.88) | 13% | 3.16 (2.59) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.52 (1.30) | 44.43 (19.88) | 5.14 (0.81) | 129 (58) | 2.91 (0.06) | 622.4 (277.2) | 19.4 (5.0) | 5.0 (3.4) | 1.44 (0.90) | 11% | 3.60 (2.57) |


