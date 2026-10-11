# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 90% [74, 97] | 10% [3, 26] | 0.90 (0.45) | 56.84 (14.04) | 6.20 (1.04) | 143 (61) | 2.61 (0.68) | 171.1 (73.6) | 26.7 (0.8) | 17.0 (1.4) | 2.71 (0.17) | 52% | 2.16 (0.51) |


