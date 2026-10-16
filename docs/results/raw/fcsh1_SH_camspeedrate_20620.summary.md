# DART ablation summary

Sweep: camspeedrate = 20620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 40% [20, 64] | 0.43 (0.59) | 140.99 (21.11) | 3.17 (0.96) | 152 (73) | 1.48 (0.21) | 182.8 (86.7) | 22.7 (1.5) | 8.9 (1.3) | 2.06 (0.24) | 38% | 2.38 (0.65) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.58 (0.50) | 147.33 (41.50) | 3.02 (0.85) | 255 (128) | 2.00 (0.00) | 306.3 (152.2) | 23.2 (2.4) | 10.1 (1.5) | 2.14 (0.39) | 40% | 2.33 (0.49) |


