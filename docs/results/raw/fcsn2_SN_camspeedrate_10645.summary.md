# DART ablation summary

Sweep: camspeedrate = 10645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.27 (0.44) | 71.65 (21.23) | 4.88 (0.86) | 140 (89) | 1.81 (0.70) | 171.4 (109.9) | 18.9 (2.3) | 5.3 (2.0) | 1.33 (0.41) | 13% | 2.55 (0.90) |
| FR_SAFE | 30 | 90% [74, 97] | 7% [2, 21] | 1.07 (0.55) | 69.31 (16.21) | 4.91 (0.86) | 293 (85) | 4.36 (0.01) | 360.6 (105.9) | 18.9 (2.4) | 5.9 (2.0) | 1.33 (0.41) | 15% | 2.79 (1.20) |


