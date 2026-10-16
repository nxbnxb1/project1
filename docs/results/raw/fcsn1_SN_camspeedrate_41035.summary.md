# DART ablation summary

Sweep: camspeedrate = 41035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.26 (0.51) | 47.26 (15.09) | 7.40 (1.49) | 79 (44) | 1.57 (0.42) | 380.2 (215.8) | 23.4 (1.8) | 9.3 (4.0) | 1.96 (0.42) | 27% | 2.38 (0.70) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.23 (0.49) | 44.74 (11.85) | 7.73 (1.14) | 127 (34) | 2.84 (0.04) | 611.8 (160.9) | 23.0 (1.7) | 9.4 (3.6) | 1.87 (0.37) | 26% | 2.69 (1.04) |


