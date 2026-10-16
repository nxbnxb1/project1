# DART ablation summary

Sweep: camspeedrate = 10625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.12 (0.70) | 77.05 (27.91) | 4.60 (1.10) | 101 (75) | 1.24 (0.52) | 123.8 (93.0) | 19.0 (2.7) | 5.4 (2.4) | 1.37 (0.50) | 20% | 2.55 (0.76) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 1.29 (0.49) | 70.97 (20.56) | 4.84 (1.02) | 182 (56) | 2.51 (0.00) | 223.5 (67.7) | 18.6 (2.3) | 5.4 (2.0) | 1.28 (0.41) | 15% | 2.66 (1.01) |


