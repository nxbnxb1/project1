# DART ablation summary

Sweep: speed = 10

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 0% [0, 20] | 1.99 (1.11) | 45.54 (12.39) | 7.34 (1.92) | 79 (42) | 1.50 (0.45) | 95.7 (50.8) | 22.0 (1.9) | 4.0 (1.5) | 1.70 (0.39) | 20% | 2.77 (0.64) |
| COV_NOCLUT | 15 | 100% [80, 100] | 0% [0, 20] | 2.16 (0.73) | 48.98 (19.57) | 7.52 (1.59) | 80 (41) | 1.59 (0.44) | 96.6 (47.9) | 21.9 (1.9) | 3.9 (1.4) | 1.68 (0.38) | 24% | 2.58 (0.72) |


