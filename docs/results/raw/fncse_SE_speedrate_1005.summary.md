# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 90% [74, 97] | 7% [2, 21] | 2.69 (1.89) | 42.30 (45.20) | 6.49 (2.25) | 20 (22) | 0.46 (0.03) | 23.9 (25.3) | 21.8 (3.7) | 5.1 (3.9) | 1.71 (0.81) | 28% | 3.33 (2.54) |


