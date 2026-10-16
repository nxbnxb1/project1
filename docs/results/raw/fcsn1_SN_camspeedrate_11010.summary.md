# DART ablation summary

Sweep: camspeedrate = 11010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 30% [17, 48] | 0.88 (0.87) | 53.95 (31.51) | 6.82 (2.10) | 41 (33) | 0.77 (0.12) | 49.6 (39.4) | 21.7 (1.6) | 6.5 (2.6) | 1.67 (0.31) | 26% | 2.26 (0.80) |
| FR_SAFE | 30 | 73% [56, 86] | 27% [14, 44] | 0.93 (0.95) | 58.04 (42.61) | 6.99 (2.16) | 54 (43) | 1.01 (0.01) | 65.6 (51.3) | 21.9 (1.4) | 6.9 (2.8) | 1.69 (0.31) | 26% | 2.80 (1.04) |


