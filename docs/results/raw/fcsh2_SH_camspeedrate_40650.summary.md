# DART ablation summary

Sweep: camspeedrate = 40650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.58 (0.49) | 87.84 (20.39) | 4.34 (0.69) | 142 (73) | 2.05 (0.46) | 682.6 (350.5) | 25.3 (1.7) | 15.2 (2.3) | 2.43 (0.31) | 30% | 2.04 (0.57) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.80 (0.40) | 75.36 (15.26) | 4.85 (0.58) | 196 (72) | 2.91 (0.05) | 945.5 (350.7) | 24.9 (1.5) | 15.1 (2.0) | 2.34 (0.29) | 24% | 2.34 (0.70) |


