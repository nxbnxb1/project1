# DART ablation summary

Sweep: camspeedrate = 20620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.37 (0.44) | 140.98 (31.76) | 3.35 (0.97) | 149 (97) | 1.41 (0.31) | 179.2 (118.6) | 22.6 (1.8) | 6.3 (1.4) | 2.03 (0.32) | 32% | 1.98 (0.52) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.59 (0.53) | 121.53 (37.07) | 3.71 (0.94) | 210 (98) | 2.01 (0.01) | 251.4 (116.9) | 23.5 (2.2) | 7.3 (1.1) | 2.16 (0.38) | 31% | 2.57 (0.74) |


