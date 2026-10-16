# DART ablation summary

Sweep: camspeedrate = 11035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.53 (0.42) | 108.37 (34.90) | 4.56 (1.50) | 223 (157) | 2.43 (0.52) | 274.3 (191.1) | 23.6 (1.8) | 12.2 (1.3) | 2.19 (0.27) | 43% | 2.04 (0.45) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.55 (0.52) | 85.53 (29.19) | 4.51 (1.10) | 283 (97) | 3.45 (0.00) | 346.0 (118.8) | 25.3 (1.0) | 15.3 (0.8) | 2.49 (0.16) | 50% | 2.15 (0.44) |


