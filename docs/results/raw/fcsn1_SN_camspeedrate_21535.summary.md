# DART ablation summary

Sweep: camspeedrate = 21535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 20% [10, 37] | 0.98 (0.76) | 49.86 (20.20) | 7.01 (1.88) | 101 (71) | 1.94 (0.57) | 120.9 (85.4) | 22.6 (1.6) | 8.3 (3.5) | 1.83 (0.38) | 28% | 2.74 (0.84) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.00 (0.57) | 49.80 (16.80) | 7.16 (1.64) | 168 (59) | 3.46 (0.01) | 202.1 (71.5) | 22.4 (1.6) | 8.6 (3.4) | 1.80 (0.35) | 26% | 2.82 (1.07) |


