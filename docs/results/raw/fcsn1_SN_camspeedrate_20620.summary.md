# DART ablation summary

Sweep: camspeedrate = 20620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.02 (0.61) | 83.20 (36.69) | 4.50 (1.24) | 100 (76) | 1.08 (0.38) | 119.7 (90.8) | 18.7 (2.8) | 7.6 (3.4) | 1.30 (0.50) | 18% | 2.38 (0.75) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 1.18 (0.57) | 70.93 (19.12) | 4.65 (1.07) | 142 (42) | 2.01 (0.01) | 169.7 (50.4) | 19.1 (2.8) | 7.9 (3.5) | 1.38 (0.51) | 19% | 2.95 (0.76) |


