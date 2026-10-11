# DART ablation summary

Sweep: camspeed = 410

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 13% [4, 38] | 0.96 (0.65) | 89.94 (25.45) | 4.60 (1.68) | 129 (57) | 1.63 (0.45) | 621.2 (281.2) | 23.3 (3.1) | 7.2 (1.1) | 2.16 (0.49) | 40% | 2.18 (0.49) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 1.16 (0.51) | 84.16 (27.09) | 5.27 (1.07) | 226 (73) | 2.69 (0.02) | 1085.0 (346.9) | 25.0 (1.2) | 7.5 (1.0) | 2.40 (0.23) | 46% | 2.43 (0.50) |


