# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.88 (0.34) | 57.03 (7.66) | 5.95 (0.62) | 131 (52) | 2.24 (0.69) | 157.8 (63.4) | 26.6 (0.6) | 11.7 (0.9) | 2.71 (0.12) | 45% | 2.04 (0.37) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.74 (0.35) | 60.67 (19.79) | 5.78 (1.04) | 210 (68) | 3.46 (0.01) | 253.0 (82.6) | 26.9 (0.6) | 13.1 (0.9) | 2.75 (0.13) | 47% | 2.16 (0.45) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.92 (0.37) | 59.62 (11.70) | 5.90 (0.85) | 148 (28) | 2.50 (0.17) | 177.9 (33.4) | 26.3 (1.0) | 12.5 (0.8) | 2.65 (0.18) | 47% | 2.36 (0.56) |


