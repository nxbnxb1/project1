# DART ablation summary

Sweep: camspeed = 310

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 100% [80, 100] | 0% [0, 20] | 1.63 (0.40) | 54.50 (27.34) | 7.26 (1.96) | 88 (64) | 1.53 (0.43) | 106.5 (78.5) | 22.1 (2.2) | 3.6 (1.4) | 1.73 (0.43) | 20% | 2.79 (0.88) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 0% [0, 20] | 1.64 (0.57) | 48.06 (16.98) | 7.26 (1.92) | 155 (71) | 2.95 (0.01) | 186.1 (82.7) | 22.4 (2.2) | 3.9 (1.3) | 1.78 (0.46) | 24% | 2.91 (1.08) |


