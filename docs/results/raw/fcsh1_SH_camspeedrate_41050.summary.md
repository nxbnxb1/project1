# DART ablation summary

Sweep: camspeedrate = 41050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.64 (0.42) | 80.70 (19.28) | 4.87 (0.99) | 176 (67) | 2.17 (0.35) | 842.4 (321.3) | 26.2 (1.6) | 10.7 (1.3) | 2.65 (0.26) | 48% | 2.16 (0.67) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.87 (0.35) | 72.29 (15.55) | 5.25 (0.90) | 203 (55) | 2.91 (0.04) | 973.8 (258.1) | 26.5 (0.8) | 11.5 (0.7) | 2.70 (0.15) | 50% | 2.27 (0.52) |


