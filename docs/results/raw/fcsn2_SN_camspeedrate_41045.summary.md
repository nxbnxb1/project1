# DART ablation summary

Sweep: camspeedrate = 41045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.32 (0.67) | 45.21 (9.32) | 7.51 (1.13) | 75 (30) | 1.62 (0.38) | 359.4 (144.1) | 23.3 (1.5) | 9.2 (3.0) | 1.94 (0.35) | 27% | 2.41 (0.70) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.48 (1.01) | 45.26 (11.39) | 7.60 (1.26) | 132 (34) | 2.92 (0.05) | 633.3 (158.5) | 23.2 (1.5) | 9.5 (3.3) | 1.92 (0.36) | 26% | 2.72 (1.01) |


