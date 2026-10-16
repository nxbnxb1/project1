# DART ablation summary

Sweep: camspeedrate = 11030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.27 (0.80) | 55.52 (24.57) | 6.82 (1.97) | 100 (69) | 1.63 (0.47) | 121.3 (82.8) | 22.3 (1.5) | 5.8 (2.1) | 1.79 (0.34) | 26% | 2.69 (0.92) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.59 (0.80) | 49.76 (18.58) | 7.31 (1.64) | 144 (57) | 2.96 (0.01) | 175.5 (68.6) | 22.4 (1.4) | 5.9 (2.3) | 1.77 (0.35) | 25% | 2.80 (0.93) |


