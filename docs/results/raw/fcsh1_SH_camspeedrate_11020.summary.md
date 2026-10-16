# DART ablation summary

Sweep: camspeedrate = 11020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.31 (0.37) | 112.93 (53.15) | 4.18 (1.53) | 160 (104) | 1.57 (0.20) | 195.7 (128.9) | 23.7 (2.2) | 8.9 (1.6) | 2.22 (0.36) | 45% | 2.21 (0.37) |
| FR_SAFE | 15 | 53% [30, 75] | 33% [15, 58] | 0.50 (0.64) | 131.84 (62.17) | 3.09 (1.22) | 245 (102) | 2.01 (0.00) | 298.3 (126.3) | 24.4 (2.1) | 10.3 (1.5) | 2.37 (0.33) | 52% | 2.25 (0.52) |


