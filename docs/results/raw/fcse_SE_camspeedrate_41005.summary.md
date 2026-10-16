# DART ablation summary

Sweep: camspeedrate = 41005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 2.94 (2.45) | 40.06 (35.35) | 6.63 (2.51) | 19 (18) | 0.46 (0.07) | 90.8 (84.5) | 21.5 (3.4) | 5.4 (4.3) | 1.66 (0.75) | 22% | 3.47 (2.48) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 2.56 (2.27) | 42.23 (36.45) | 6.62 (2.51) | 21 (18) | 0.52 (0.04) | 97.7 (83.5) | 21.4 (3.4) | 5.2 (4.3) | 1.62 (0.74) | 20% | 3.46 (2.63) |


