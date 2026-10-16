# DART ablation summary

Sweep: camspeedrate = 11540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.76 (1.56) | 35.98 (26.35) | 7.78 (2.62) | 84 (101) | 1.82 (0.89) | 103.3 (125.7) | 22.6 (2.0) | 3.9 (2.8) | 1.86 (0.47) | 24% | 3.76 (2.61) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.81 (1.82) | 32.74 (21.65) | 7.78 (2.54) | 130 (86) | 4.01 (0.01) | 159.9 (105.8) | 22.5 (1.7) | 3.9 (2.7) | 1.84 (0.43) | 24% | 3.73 (2.58) |


