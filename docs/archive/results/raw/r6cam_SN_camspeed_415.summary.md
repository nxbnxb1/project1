# DART ablation summary

Sweep: camspeed = 415

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 0% [0, 20] | 2.28 (1.56) | 45.14 (17.83) | 7.95 (2.60) | 80 (45) | 1.55 (0.34) | 381.5 (220.5) | 23.5 (2.6) | 5.6 (2.1) | 2.07 (0.43) | 30% | 3.14 (1.41) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 7% [1, 30] | 1.77 (1.11) | 47.12 (16.96) | 8.05 (1.99) | 125 (44) | 2.70 (0.03) | 602.5 (217.7) | 23.4 (1.8) | 5.5 (1.5) | 2.05 (0.30) | 33% | 3.05 (1.29) |


