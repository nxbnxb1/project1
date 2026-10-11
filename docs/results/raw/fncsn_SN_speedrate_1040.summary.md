# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.44 (0.70) | 41.83 (9.89) | 8.00 (1.20) | 97 (41) | 2.25 (0.55) | 116.8 (49.5) | 23.0 (1.7) | 9.6 (3.6) | 1.86 (0.38) | 25% | 2.67 (1.00) |


