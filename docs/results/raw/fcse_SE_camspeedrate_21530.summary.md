# DART ablation summary

Sweep: camspeedrate = 21530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 2.56 (2.00) | 30.48 (16.97) | 7.30 (2.14) | 49 (57) | 1.37 (0.75) | 59.3 (68.5) | 21.2 (2.2) | 3.9 (2.7) | 1.57 (0.53) | 22% | 3.60 (2.26) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.59 (1.67) | 32.86 (18.06) | 7.39 (1.97) | 98 (52) | 2.96 (0.01) | 117.1 (61.7) | 21.7 (2.6) | 4.5 (3.1) | 1.67 (0.61) | 22% | 3.73 (2.46) |


