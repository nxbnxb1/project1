# DART ablation summary

Sweep: camspeedrate = 21010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 1.97 (1.74) | 30.48 (18.33) | 6.74 (2.71) | 26 (20) | 0.69 (0.19) | 30.7 (23.4) | 21.5 (2.7) | 6.5 (4.8) | 1.63 (0.64) | 21% | 3.52 (2.61) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 2.43 (1.84) | 29.90 (22.03) | 7.10 (2.45) | 39 (54) | 1.03 (0.03) | 47.3 (66.0) | 21.8 (2.9) | 6.5 (5.1) | 1.69 (0.67) | 22% | 3.63 (2.37) |


