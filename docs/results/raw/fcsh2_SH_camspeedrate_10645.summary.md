# DART ablation summary

Sweep: camspeedrate = 10645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.64 (0.44) | 107.60 (27.17) | 3.77 (0.88) | 262 (129) | 2.74 (0.52) | 320.9 (156.4) | 23.5 (1.6) | 13.0 (2.1) | 2.16 (0.28) | 33% | 2.54 (0.93) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.71 (0.45) | 127.17 (72.10) | 3.96 (1.13) | 462 (337) | 4.35 (0.00) | 565.5 (412.4) | 23.5 (1.5) | 14.4 (1.7) | 2.13 (0.25) | 30% | 2.38 (0.58) |


