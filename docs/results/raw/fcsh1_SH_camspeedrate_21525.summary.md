# DART ablation summary

Sweep: camspeedrate = 21525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.25 (0.35) | 100.21 (30.22) | 4.85 (1.32) | 127 (91) | 1.93 (0.25) | 153.0 (108.7) | 24.2 (1.4) | 8.8 (1.9) | 2.28 (0.26) | 44% | 2.39 (0.66) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.31 (0.38) | 104.67 (33.14) | 4.38 (1.33) | 210 (112) | 2.51 (0.02) | 252.6 (134.2) | 24.8 (1.5) | 10.2 (2.1) | 2.40 (0.27) | 50% | 2.49 (0.75) |


