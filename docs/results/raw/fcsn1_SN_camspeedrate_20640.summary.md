# DART ablation summary

Sweep: camspeedrate = 20640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.08 (0.55) | 71.44 (21.08) | 4.96 (0.85) | 127 (88) | 1.62 (0.65) | 153.0 (105.7) | 18.5 (2.6) | 3.9 (1.9) | 1.25 (0.46) | 16% | 2.65 (0.61) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 1.23 (0.37) | 70.05 (19.73) | 4.93 (0.92) | 285 (81) | 4.01 (0.01) | 341.2 (95.1) | 19.0 (2.6) | 4.6 (2.0) | 1.33 (0.48) | 16% | 3.10 (0.84) |


