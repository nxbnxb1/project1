# DART ablation summary

Sweep: camspeedrate = 11540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.55 (0.82) | 46.57 (22.21) | 7.77 (2.46) | 120 (90) | 2.30 (0.65) | 146.0 (109.2) | 23.5 (1.5) | 8.5 (3.7) | 2.02 (0.30) | 27% | 2.82 (0.89) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 1.41 (0.80) | 47.99 (23.05) | 7.66 (2.35) | 203 (109) | 4.01 (0.01) | 248.5 (132.8) | 23.3 (1.8) | 8.6 (3.1) | 2.00 (0.31) | 29% | 2.67 (0.83) |


