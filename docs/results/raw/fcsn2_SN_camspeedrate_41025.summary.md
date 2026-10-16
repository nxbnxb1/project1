# DART ablation summary

Sweep: camspeedrate = 41025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.35 (0.71) | 47.17 (12.17) | 7.26 (1.41) | 68 (33) | 1.45 (0.37) | 324.5 (158.6) | 23.3 (1.7) | 9.4 (3.4) | 1.95 (0.38) | 27% | 2.31 (0.67) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.19 (0.61) | 49.29 (15.49) | 7.12 (1.48) | 117 (40) | 2.44 (0.02) | 562.5 (194.1) | 23.7 (1.9) | 10.0 (3.7) | 2.04 (0.44) | 30% | 2.51 (1.10) |


