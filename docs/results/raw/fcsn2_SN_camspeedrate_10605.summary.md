# DART ablation summary

Sweep: camspeedrate = 10605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 47% [30, 64] | 47% [30, 64] | 0.69 (0.81) | 82.12 (43.12) | 4.12 (1.49) | 31 (23) | 0.41 (0.08) | 37.8 (27.6) | 18.5 (2.6) | 6.5 (2.6) | 1.29 (0.48) | 21% | 2.18 (1.16) |
| FR_SAFE | 30 | 50% [33, 67] | 47% [30, 64] | 0.55 (0.66) | 78.71 (20.89) | 4.54 (1.17) | 35 (20) | 0.51 (0.01) | 42.9 (23.5) | 18.3 (2.4) | 6.0 (2.3) | 1.24 (0.43) | 17% | 2.26 (1.05) |


