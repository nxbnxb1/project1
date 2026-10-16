# DART ablation summary

Sweep: camspeedrate = 20620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.09 (0.61) | 82.81 (34.42) | 4.55 (1.11) | 97 (72) | 1.06 (0.38) | 117.2 (86.0) | 18.9 (2.3) | 4.5 (1.6) | 1.34 (0.42) | 16% | 2.28 (0.58) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 1.06 (0.57) | 75.87 (29.23) | 4.54 (1.29) | 152 (58) | 2.01 (0.00) | 182.2 (69.4) | 19.1 (2.6) | 4.9 (2.0) | 1.37 (0.47) | 18% | 2.84 (1.12) |


