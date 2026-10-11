# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 80% [63, 90] | 17% [7, 34] | 0.74 (0.48) | 76.75 (27.26) | 5.15 (1.39) | 87 (43) | 1.22 (0.17) | 104.7 (51.9) | 26.1 (1.1) | 8.2 (1.0) | 2.63 (0.21) | 54% | 2.02 (0.52) |


