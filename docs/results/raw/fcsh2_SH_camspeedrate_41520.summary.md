# DART ablation summary

Sweep: camspeedrate = 41520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.65 (0.35) | 71.50 (15.43) | 5.40 (0.94) | 103 (39) | 1.56 (0.23) | 498.7 (192.3) | 26.5 (0.7) | 15.8 (1.2) | 2.69 (0.13) | 52% | 2.28 (0.56) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.93 (0.36) | 65.94 (11.01) | 5.61 (0.87) | 132 (22) | 2.00 (0.01) | 636.1 (106.4) | 26.6 (1.1) | 16.5 (1.5) | 2.71 (0.21) | 54% | 2.10 (0.33) |


