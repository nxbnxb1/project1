# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 10% [2, 40] | 0.76 (0.46) | 96.55 (51.84) | 4.20 (1.72) | 82 (48) | 0.90 (0.06) | 97.8 (57.9) | 25.9 (2.0) | 15.8 (1.5) | 2.62 (0.32) | 51% | 1.90 (0.36) |
| FR_SAFE | 10 | 70% [40, 89] | 30% [11, 60] | 0.58 (0.47) | 113.34 (41.37) | 4.23 (2.02) | 87 (56) | 1.02 (0.02) | 103.2 (66.1) | 26.0 (1.4) | 15.7 (2.9) | 2.62 (0.26) | 51% | 2.32 (0.96) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.65 (0.46) | 110.55 (32.10) | 3.88 (0.88) | 99 (40) | 1.01 (0.00) | 117.3 (48.7) | 25.8 (2.1) | 15.7 (1.9) | 2.62 (0.35) | 56% | 2.21 (0.55) |


