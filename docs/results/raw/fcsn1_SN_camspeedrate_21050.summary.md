# DART ablation summary

Sweep: camspeedrate = 21050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.12 (0.79) | 46.95 (14.07) | 7.15 (1.68) | 121 (76) | 2.50 (0.82) | 144.8 (91.9) | 22.4 (1.9) | 8.4 (3.7) | 1.80 (0.41) | 24% | 2.61 (0.69) |
| FR_SAFE | 30 | 87% [70, 95] | 7% [2, 21] | 1.25 (0.62) | 47.54 (17.73) | 6.99 (1.84) | 253 (107) | 5.01 (0.01) | 303.9 (128.2) | 22.6 (1.7) | 9.2 (3.6) | 1.83 (0.37) | 26% | 2.92 (0.90) |


