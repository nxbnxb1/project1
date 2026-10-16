# DART ablation summary

Sweep: camspeedrate = 41040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.32 (0.55) | 47.67 (17.25) | 7.43 (1.43) | 82 (54) | 1.59 (0.41) | 392.2 (259.1) | 23.3 (1.9) | 9.3 (4.0) | 1.94 (0.43) | 27% | 2.59 (0.86) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.43 (0.55) | 46.25 (15.49) | 7.64 (1.39) | 134 (45) | 2.89 (0.05) | 644.9 (215.2) | 23.2 (1.7) | 9.6 (3.9) | 1.91 (0.38) | 26% | 2.75 (0.73) |


