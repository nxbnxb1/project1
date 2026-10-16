# DART ablation summary

Sweep: camspeedrate = 21030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 2.49 (1.62) | 33.82 (18.56) | 7.18 (2.08) | 55 (56) | 1.35 (0.72) | 66.0 (66.6) | 21.7 (2.8) | 5.0 (3.7) | 1.66 (0.64) | 19% | 3.41 (2.35) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.58 (1.74) | 31.21 (14.71) | 7.35 (1.91) | 95 (43) | 2.96 (0.01) | 113.6 (51.0) | 22.0 (2.8) | 5.6 (4.1) | 1.72 (0.65) | 22% | 3.82 (2.44) |


