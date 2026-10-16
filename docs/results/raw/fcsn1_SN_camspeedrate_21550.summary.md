# DART ablation summary

Sweep: camspeedrate = 21550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.35 (0.82) | 48.75 (23.77) | 7.18 (1.80) | 142 (134) | 2.55 (0.83) | 169.2 (159.7) | 22.6 (1.6) | 7.8 (3.4) | 1.81 (0.37) | 24% | 2.56 (0.76) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.19 (0.68) | 45.22 (11.00) | 7.68 (1.14) | 221 (58) | 5.01 (0.01) | 264.9 (68.8) | 22.7 (1.4) | 8.2 (3.1) | 1.82 (0.34) | 25% | 2.85 (0.86) |


