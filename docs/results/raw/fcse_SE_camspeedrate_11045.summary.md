# DART ablation summary

Sweep: camspeedrate = 11045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.80 (1.86) | 37.81 (23.97) | 7.23 (2.28) | 87 (100) | 1.74 (1.06) | 107.0 (123.5) | 21.6 (2.3) | 7.3 (4.9) | 1.66 (0.57) | 21% | 3.97 (2.82) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.89 (1.95) | 34.02 (22.09) | 7.32 (2.25) | 155 (112) | 4.37 (0.03) | 189.0 (136.0) | 21.8 (2.6) | 8.1 (5.4) | 1.70 (0.61) | 23% | 4.02 (2.58) |


