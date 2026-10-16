# DART ablation summary

Sweep: camspeedrate = 40615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.92 (0.39) | 110.03 (43.42) | 3.76 (0.92) | 131 (65) | 1.20 (0.15) | 630.2 (306.6) | 25.5 (0.7) | 11.3 (1.0) | 2.50 (0.15) | 37% | 2.22 (0.47) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.75 (0.41) | 109.02 (25.03) | 3.75 (0.69) | 163 (37) | 1.50 (0.00) | 787.7 (181.2) | 25.2 (1.1) | 11.5 (0.8) | 2.46 (0.19) | 36% | 2.26 (0.34) |


