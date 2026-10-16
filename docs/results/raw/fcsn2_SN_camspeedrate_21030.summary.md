# DART ablation summary

Sweep: camspeedrate = 21030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 17% [7, 34] | 1.17 (1.14) | 48.69 (19.84) | 6.70 (2.20) | 101 (89) | 1.82 (0.57) | 121.8 (106.2) | 22.3 (1.5) | 6.2 (2.2) | 1.79 (0.33) | 27% | 2.37 (0.75) |
| FR_SAFE | 30 | 90% [74, 97] | 7% [2, 21] | 1.20 (0.87) | 47.39 (12.15) | 7.12 (1.40) | 139 (48) | 2.96 (0.02) | 167.0 (58.4) | 22.6 (1.3) | 6.5 (2.1) | 1.83 (0.31) | 26% | 2.60 (1.02) |


