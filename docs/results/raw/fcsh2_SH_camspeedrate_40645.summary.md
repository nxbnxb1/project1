# DART ablation summary

Sweep: camspeedrate = 40645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.71 (0.46) | 85.26 (16.80) | 4.28 (0.66) | 170 (77) | 2.03 (0.43) | 817.7 (368.3) | 25.3 (1.7) | 11.3 (1.5) | 2.44 (0.31) | 31% | 2.18 (0.60) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.90 (0.33) | 79.10 (12.61) | 4.56 (0.53) | 230 (37) | 2.91 (0.04) | 1105.0 (176.9) | 25.6 (1.1) | 12.0 (1.0) | 2.48 (0.22) | 29% | 2.37 (0.38) |


