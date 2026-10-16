# DART ablation summary

Sweep: camspeedrate = 41035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.79 (0.44) | 77.71 (18.32) | 5.17 (0.92) | 156 (62) | 2.05 (0.34) | 750.0 (302.8) | 26.7 (0.6) | 9.0 (0.9) | 2.72 (0.12) | 49% | 2.18 (0.50) |
| FR_SAFE | 15 | 87% [62, 96] | 7% [1, 30] | 0.90 (0.35) | 74.21 (18.72) | 4.92 (1.05) | 207 (63) | 2.83 (0.03) | 995.9 (300.2) | 26.2 (2.3) | 9.3 (1.1) | 2.65 (0.38) | 50% | 2.10 (0.50) |


