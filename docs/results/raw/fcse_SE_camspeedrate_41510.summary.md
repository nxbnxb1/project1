# DART ablation summary

Sweep: camspeedrate = 41510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.79 (2.27) | 37.49 (37.79) | 7.93 (2.59) | 30 (36) | 0.76 (0.10) | 143.1 (172.5) | 22.5 (2.2) | 8.5 (6.2) | 1.85 (0.50) | 28% | 3.64 (2.98) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 3.21 (1.96) | 33.24 (19.25) | 7.89 (2.55) | 35 (20) | 1.02 (0.02) | 165.1 (96.1) | 22.6 (2.4) | 8.6 (6.2) | 1.87 (0.52) | 30% | 3.39 (2.63) |


