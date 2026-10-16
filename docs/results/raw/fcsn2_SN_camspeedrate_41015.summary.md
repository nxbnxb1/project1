# DART ablation summary

Sweep: camspeedrate = 41015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.56 (0.88) | 49.09 (16.51) | 7.24 (1.41) | 50 (26) | 1.03 (0.18) | 242.2 (125.4) | 23.5 (1.7) | 9.6 (3.3) | 1.98 (0.39) | 27% | 2.18 (0.72) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.28 (1.06) | 51.42 (19.97) | 6.97 (1.62) | 75 (31) | 1.50 (0.01) | 357.8 (147.3) | 23.6 (1.9) | 10.1 (3.9) | 2.00 (0.41) | 30% | 2.33 (0.79) |


