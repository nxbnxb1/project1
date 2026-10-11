# DART ablation summary

Sweep: speed = 10

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 0% [0, 20] | 1.30 (0.61) | 98.49 (40.49) | 4.51 (1.53) | 142 (39) | 1.59 (0.54) | 171.4 (46.7) | 22.6 (3.2) | 7.6 (1.2) | 2.03 (0.51) | 40% | 2.59 (0.74) |
| COV_NOCLUT | 15 | 80% [55, 93] | 7% [1, 30] | 1.09 (0.45) | 83.55 (21.17) | 4.73 (1.24) | 158 (45) | 1.84 (0.46) | 189.8 (54.2) | 24.0 (2.6) | 8.3 (1.2) | 2.27 (0.41) | 47% | 2.53 (0.79) |


