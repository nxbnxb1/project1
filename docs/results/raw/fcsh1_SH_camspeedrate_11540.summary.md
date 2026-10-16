# DART ablation summary

Sweep: camspeedrate = 11540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.36 (0.46) | 95.29 (31.62) | 5.03 (1.77) | 193 (148) | 2.83 (0.47) | 235.2 (179.7) | 24.2 (1.9) | 12.7 (1.5) | 2.29 (0.30) | 49% | 2.36 (0.76) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.68 (0.38) | 94.34 (33.01) | 4.46 (1.24) | 356 (140) | 4.01 (0.01) | 434.1 (170.3) | 24.8 (0.9) | 13.7 (1.2) | 2.40 (0.15) | 52% | 2.40 (0.64) |


