# DART ablation summary

Sweep: camspeedrate = 21040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.34 (0.41) | 93.45 (38.43) | 4.80 (1.37) | 207 (154) | 2.88 (0.55) | 248.2 (182.5) | 24.5 (0.9) | 6.9 (1.2) | 2.33 (0.18) | 45% | 2.39 (0.89) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.66 (0.47) | 96.96 (38.32) | 4.47 (1.14) | 344 (184) | 4.01 (0.01) | 412.7 (218.3) | 25.1 (1.3) | 7.7 (0.7) | 2.47 (0.21) | 48% | 2.30 (0.50) |


