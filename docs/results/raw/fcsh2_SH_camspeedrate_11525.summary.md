# DART ablation summary

Sweep: camspeedrate = 11525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.44 (0.53) | 94.80 (21.28) | 4.76 (1.55) | 130 (85) | 1.92 (0.25) | 160.4 (104.6) | 24.4 (2.1) | 8.5 (1.7) | 2.33 (0.38) | 49% | 1.97 (0.47) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.84 (0.45) | 86.62 (25.48) | 4.74 (1.03) | 207 (72) | 2.51 (0.01) | 253.3 (88.3) | 24.9 (0.9) | 9.7 (0.8) | 2.42 (0.15) | 50% | 2.25 (0.69) |


