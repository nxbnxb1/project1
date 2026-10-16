# DART ablation summary

Sweep: camspeedrate = 41045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.79 (2.07) | 31.08 (12.29) | 7.44 (1.74) | 45 (40) | 1.34 (0.64) | 218.3 (191.7) | 22.1 (2.9) | 4.6 (3.1) | 1.74 (0.66) | 24% | 3.35 (2.74) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.24 (1.97) | 31.53 (12.62) | 7.53 (1.67) | 92 (36) | 2.92 (0.07) | 442.1 (176.4) | 22.1 (2.8) | 5.2 (3.3) | 1.76 (0.65) | 25% | 3.57 (2.67) |


