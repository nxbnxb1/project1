# DART ablation summary

Sweep: camspeedrate = 41050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.19 (0.83) | 45.85 (10.77) | 7.46 (1.16) | 75 (32) | 1.65 (0.37) | 360.3 (155.4) | 23.4 (1.5) | 6.9 (2.2) | 1.96 (0.34) | 27% | 2.52 (0.80) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.34 (0.67) | 49.64 (15.69) | 7.20 (1.54) | 142 (46) | 2.92 (0.05) | 682.6 (228.6) | 23.4 (1.9) | 7.5 (2.7) | 1.98 (0.43) | 30% | 2.58 (0.75) |


