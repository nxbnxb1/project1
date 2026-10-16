# DART ablation summary

Sweep: camspeedrate = 40610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.43 (0.85) | 72.09 (22.25) | 4.69 (1.15) | 52 (30) | 0.65 (0.17) | 249.4 (143.5) | 20.0 (3.3) | 8.7 (4.0) | 1.52 (0.60) | 18% | 1.94 (0.55) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.46 (1.19) | 74.29 (25.89) | 4.86 (0.84) | 75 (26) | 1.01 (0.00) | 358.0 (124.0) | 19.5 (2.8) | 8.3 (3.4) | 1.42 (0.50) | 15% | 2.37 (0.81) |


