# DART ablation summary

Sweep: camspeedrate = 21025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 53% [30, 75] | 0.24 (0.34) | 110.97 (38.23) | 4.05 (1.42) | 180 (98) | 2.05 (0.27) | 216.6 (116.0) | 24.6 (2.0) | 13.2 (2.1) | 2.39 (0.32) | 48% | 2.28 (0.65) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.47 (0.47) | 121.16 (45.72) | 3.73 (1.02) | 258 (129) | 2.50 (0.00) | 309.6 (152.0) | 24.7 (1.1) | 13.5 (1.3) | 2.42 (0.18) | 51% | 2.39 (0.67) |


