# DART ablation summary

Sweep: camspeedrate = 41530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.83 (0.44) | 71.95 (16.08) | 5.49 (1.08) | 123 (59) | 1.91 (0.28) | 596.3 (288.3) | 26.0 (1.1) | 8.2 (1.0) | 2.58 (0.24) | 48% | 2.20 (0.48) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.80 (0.50) | 66.82 (13.89) | 5.35 (1.24) | 158 (56) | 2.69 (0.03) | 762.9 (275.2) | 26.3 (0.9) | 9.0 (0.6) | 2.64 (0.17) | 49% | 2.11 (0.45) |


