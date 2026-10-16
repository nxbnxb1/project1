# DART ablation summary

Sweep: camspeedrate = 21530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 60% [36, 80] | 0.31 (0.47) | 85.05 (34.73) | 5.01 (1.43) | 137 (94) | 2.27 (0.31) | 163.8 (114.1) | 24.9 (1.4) | 11.3 (2.0) | 2.39 (0.28) | 47% | 2.00 (0.61) |
| FR_SAFE | 15 | 47% [25, 70] | 47% [25, 70] | 0.34 (0.46) | 88.14 (35.20) | 4.75 (1.89) | 197 (114) | 2.95 (0.01) | 236.1 (136.0) | 25.1 (2.0) | 12.8 (2.4) | 2.45 (0.34) | 47% | 2.18 (0.69) |


