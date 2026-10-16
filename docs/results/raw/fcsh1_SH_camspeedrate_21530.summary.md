# DART ablation summary

Sweep: camspeedrate = 21530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.45 (0.45) | 96.54 (28.88) | 4.65 (1.58) | 197 (94) | 2.21 (0.25) | 236.3 (111.9) | 24.3 (1.4) | 8.9 (1.5) | 2.31 (0.25) | 45% | 2.20 (0.37) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.30 (0.34) | 106.32 (38.64) | 4.95 (1.58) | 226 (148) | 2.95 (0.01) | 270.6 (178.4) | 25.4 (1.2) | 10.0 (1.5) | 2.47 (0.25) | 47% | 2.20 (0.48) |


