# DART ablation summary

Sweep: camspeedrate = 11535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 17% [7, 34] | 1.30 (0.93) | 41.81 (15.22) | 7.97 (2.35) | 89 (64) | 2.04 (0.57) | 108.6 (79.0) | 23.1 (1.5) | 8.2 (3.3) | 1.94 (0.27) | 27% | 2.52 (0.85) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.27 (0.82) | 42.15 (15.14) | 8.08 (1.97) | 150 (53) | 3.46 (0.01) | 182.3 (63.8) | 23.3 (1.3) | 8.4 (2.9) | 1.98 (0.23) | 27% | 2.90 (1.00) |


