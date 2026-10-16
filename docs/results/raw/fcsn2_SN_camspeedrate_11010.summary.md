# DART ablation summary

Sweep: camspeedrate = 11010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 60% [42, 75] | 37% [22, 54] | 0.82 (1.11) | 56.98 (31.94) | 6.30 (2.42) | 41 (30) | 0.82 (0.15) | 49.8 (37.1) | 22.1 (1.4) | 7.1 (2.6) | 1.78 (0.34) | 28% | 2.25 (0.99) |
| FR_SAFE | 30 | 50% [33, 67] | 50% [33, 67] | 0.37 (0.66) | 51.44 (19.74) | 6.79 (1.97) | 43 (25) | 1.02 (0.02) | 52.4 (30.1) | 22.0 (1.6) | 6.6 (2.4) | 1.74 (0.33) | 27% | 2.49 (1.76) |


