# DART ablation summary

Sweep: camspeedrate = 21525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.39 (0.54) | 102.09 (25.96) | 4.27 (1.50) | 168 (84) | 2.00 (0.24) | 201.5 (101.5) | 23.9 (1.6) | 11.3 (2.5) | 2.25 (0.28) | 47% | 2.20 (0.52) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.33 (0.40) | 117.83 (54.67) | 4.53 (1.52) | 208 (143) | 2.51 (0.01) | 248.8 (172.6) | 24.4 (1.8) | 12.7 (1.4) | 2.34 (0.29) | 48% | 2.28 (0.84) |


