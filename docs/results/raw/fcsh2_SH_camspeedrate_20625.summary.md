# DART ablation summary

Sweep: camspeedrate = 20625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.46 (0.49) | 115.02 (34.21) | 3.67 (0.95) | 153 (96) | 1.75 (0.39) | 182.1 (115.3) | 23.4 (2.0) | 12.3 (2.3) | 2.16 (0.33) | 34% | 2.09 (0.35) |
| FR_SAFE | 15 | 87% [62, 96] | 7% [1, 30] | 0.65 (0.42) | 131.45 (39.24) | 3.40 (1.02) | 314 (121) | 2.50 (0.00) | 375.8 (146.5) | 23.4 (1.5) | 13.7 (1.5) | 2.15 (0.26) | 34% | 2.45 (0.55) |


