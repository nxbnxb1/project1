# DART ablation summary

Sweep: camspeedrate = 20610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 40% [20, 64] | 0.37 (0.41) | 155.02 (51.35) | 2.91 (1.08) | 113 (61) | 0.84 (0.13) | 134.3 (73.6) | 22.5 (2.1) | 11.0 (1.9) | 2.04 (0.35) | 38% | 1.85 (0.35) |
| FR_SAFE | 15 | 47% [25, 70] | 47% [25, 70] | 0.27 (0.43) | 113.79 (35.12) | 3.14 (1.11) | 116 (62) | 1.01 (0.03) | 138.8 (74.8) | 22.7 (1.9) | 11.0 (2.0) | 2.06 (0.29) | 36% | 2.42 (0.88) |


