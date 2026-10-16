# DART ablation summary

Sweep: camspeedrate = 41010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.45 (1.03) | 55.10 (23.13) | 6.88 (1.80) | 44 (24) | 0.81 (0.09) | 208.3 (117.9) | 23.4 (1.7) | 9.4 (3.5) | 1.99 (0.40) | 30% | 2.14 (0.70) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 1.45 (0.98) | 57.52 (23.01) | 6.61 (2.03) | 55 (26) | 1.01 (0.02) | 262.4 (129.0) | 23.9 (2.1) | 10.4 (4.2) | 2.09 (0.48) | 32% | 2.23 (0.88) |


