# DART ablation summary

Sweep: camspeedrate = 41550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.80 (2.58) | 29.79 (16.37) | 8.38 (2.41) | 52 (47) | 1.53 (0.49) | 250.9 (224.3) | 23.2 (1.8) | 5.8 (3.7) | 2.00 (0.41) | 27% | 3.69 (2.90) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.32 (2.53) | 31.88 (20.75) | 8.17 (2.44) | 93 (61) | 2.93 (0.07) | 448.2 (290.1) | 23.4 (2.0) | 6.4 (4.1) | 2.04 (0.43) | 28% | 3.59 (2.62) |


