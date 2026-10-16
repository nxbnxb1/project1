# DART ablation summary

Sweep: camspeedrate = 41040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 0.85 (0.58) | 70.99 (19.94) | 5.30 (1.23) | 139 (77) | 2.07 (0.36) | 669.6 (373.4) | 26.4 (1.0) | 9.0 (1.1) | 2.67 (0.22) | 50% | 2.11 (0.49) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.96 (0.49) | 63.17 (17.87) | 5.86 (1.01) | 173 (63) | 2.88 (0.05) | 831.3 (300.4) | 26.7 (0.9) | 9.6 (0.7) | 2.71 (0.18) | 49% | 2.38 (0.45) |


