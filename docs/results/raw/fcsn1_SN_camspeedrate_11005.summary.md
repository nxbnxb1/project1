# DART ablation summary

Sweep: camspeedrate = 11005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 37% [22, 54] | 60% [42, 75] | 0.40 (0.69) | 49.12 (25.45) | 8.16 (1.98) | 16 (11) | 0.49 (0.03) | 19.2 (13.2) | 21.7 (1.3) | 4.9 (1.8) | 1.59 (0.31) | 21% | 2.73 (1.13) |
| FR_SAFE | 30 | 40% [25, 58] | 57% [39, 73] | 0.37 (0.96) | 44.53 (20.26) | 7.78 (2.30) | 17 (10) | 0.53 (0.06) | 20.2 (12.5) | 21.1 (1.9) | 5.4 (3.2) | 1.49 (0.40) | 17% | 2.75 (0.99) |


