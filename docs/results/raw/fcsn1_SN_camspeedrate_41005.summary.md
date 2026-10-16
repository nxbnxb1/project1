# DART ablation summary

Sweep: camspeedrate = 41005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 23% [12, 41] | 1.05 (1.10) | 58.87 (38.30) | 6.33 (2.07) | 28 (20) | 0.48 (0.04) | 136.5 (97.2) | 22.7 (2.3) | 4.5 (2.3) | 1.87 (0.50) | 26% | 2.17 (0.75) |
| FR_SAFE | 30 | 63% [46, 78] | 37% [22, 54] | 0.69 (0.91) | 58.85 (29.61) | 6.85 (1.78) | 23 (15) | 0.52 (0.04) | 111.5 (73.4) | 22.2 (1.9) | 4.1 (1.8) | 1.73 (0.42) | 21% | 2.29 (0.76) |


