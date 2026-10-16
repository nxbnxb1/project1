# DART ablation summary

Sweep: camspeedrate = 41540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.85 (0.55) | 66.31 (18.82) | 5.48 (0.93) | 142 (62) | 2.09 (0.39) | 683.7 (301.7) | 26.7 (0.9) | 16.3 (1.7) | 2.72 (0.18) | 49% | 2.24 (0.54) |
| FR_SAFE | 15 | 93% [70, 99] | 0% [0, 20] | 0.89 (0.28) | 66.71 (15.56) | 5.51 (1.15) | 209 (75) | 2.90 (0.04) | 1003.3 (358.6) | 26.6 (0.9) | 16.5 (1.5) | 2.69 (0.19) | 55% | 2.36 (0.52) |


