# DART ablation summary

Sweep: camspeedrate = 11045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.48 (0.43) | 104.37 (44.32) | 4.59 (1.51) | 262 (190) | 2.97 (0.65) | 320.7 (233.1) | 24.7 (1.2) | 7.4 (1.0) | 2.37 (0.20) | 43% | 2.17 (0.57) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.49 (0.53) | 93.94 (31.06) | 4.55 (1.32) | 321 (157) | 4.36 (0.01) | 392.7 (191.2) | 24.9 (1.4) | 8.5 (1.1) | 2.43 (0.24) | 48% | 2.28 (0.47) |


