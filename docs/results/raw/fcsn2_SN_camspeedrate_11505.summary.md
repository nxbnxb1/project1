# DART ablation summary

Sweep: camspeedrate = 11505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 30% [17, 48] | 70% [52, 83] | 0.10 (0.26) | 45.75 (18.77) | 7.62 (2.32) | 15 (10) | 0.51 (0.05) | 17.7 (12.5) | 21.6 (1.8) | 5.1 (2.1) | 1.60 (0.36) | 20% | 2.75 (2.42) |
| FR_SAFE | 30 | 37% [22, 54] | 63% [46, 78] | 0.16 (0.38) | 48.59 (22.55) | 8.26 (1.72) | 15 (10) | 0.53 (0.03) | 18.2 (12.0) | 21.9 (1.5) | 5.1 (2.3) | 1.61 (0.36) | 20% | 2.51 (1.48) |


