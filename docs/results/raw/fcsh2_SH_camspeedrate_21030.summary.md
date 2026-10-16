# DART ablation summary

Sweep: camspeedrate = 21030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.33 (0.38) | 99.02 (31.62) | 4.78 (1.42) | 181 (114) | 2.18 (0.45) | 215.7 (138.3) | 23.8 (1.6) | 11.2 (1.8) | 2.21 (0.30) | 42% | 2.28 (0.56) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.74 (0.50) | 88.37 (27.08) | 4.61 (1.13) | 248 (90) | 2.95 (0.01) | 297.0 (108.7) | 24.8 (1.6) | 13.7 (1.4) | 2.40 (0.26) | 45% | 2.17 (0.55) |


