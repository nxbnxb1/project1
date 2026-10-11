# DART ablation summary

Sweep: speed = 6

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 0% [0, 20] | 1.49 (0.54) | 67.20 (18.34) | 4.78 (1.43) | 102 (53) | 1.30 (0.44) | 123.2 (63.5) | 18.1 (2.4) | 3.4 (1.4) | 1.20 (0.43) | 14% | 2.43 (0.98) |
| COV_NOCLUT | 15 | 93% [70, 99] | 0% [0, 20] | 1.54 (0.68) | 81.23 (35.12) | 4.53 (1.47) | 98 (60) | 1.18 (0.48) | 118.7 (72.2) | 17.7 (2.7) | 3.2 (1.3) | 1.15 (0.46) | 14% | 2.41 (1.05) |


