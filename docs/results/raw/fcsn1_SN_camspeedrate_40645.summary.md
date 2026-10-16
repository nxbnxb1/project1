# DART ablation summary

Sweep: camspeedrate = 40645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.08 (0.71) | 65.90 (13.24) | 5.12 (0.69) | 95 (53) | 1.35 (0.46) | 455.6 (259.4) | 19.2 (3.0) | 4.7 (2.3) | 1.36 (0.53) | 14% | 2.54 (0.76) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.13 (0.42) | 69.81 (19.50) | 5.05 (0.74) | 203 (56) | 2.91 (0.04) | 976.4 (271.6) | 19.1 (3.2) | 5.1 (2.5) | 1.35 (0.57) | 15% | 2.76 (0.89) |


