# DART ablation summary

Sweep: camspeedrate = 41525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.97 (0.55) | 69.09 (27.62) | 5.53 (1.42) | 137 (72) | 1.83 (0.26) | 659.5 (346.0) | 26.4 (0.8) | 15.3 (1.5) | 2.67 (0.17) | 52% | 2.16 (0.57) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 1.04 (0.49) | 55.63 (8.42) | 6.22 (0.74) | 135 (20) | 2.43 (0.02) | 650.1 (94.5) | 26.7 (0.6) | 16.1 (0.8) | 2.72 (0.11) | 50% | 2.16 (0.37) |


