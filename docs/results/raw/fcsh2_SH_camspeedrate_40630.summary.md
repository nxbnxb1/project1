# DART ablation summary

Sweep: camspeedrate = 40630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.75 (0.45) | 77.68 (10.18) | 4.77 (0.44) | 125 (50) | 1.82 (0.45) | 606.9 (244.3) | 24.9 (1.5) | 11.4 (1.6) | 2.36 (0.28) | 24% | 2.22 (0.55) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.65 (0.39) | 92.56 (22.83) | 4.34 (0.61) | 222 (92) | 2.69 (0.03) | 1062.4 (441.1) | 24.8 (1.7) | 12.1 (1.5) | 2.35 (0.31) | 29% | 2.27 (0.62) |


