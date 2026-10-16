# DART ablation summary

Sweep: camspeedrate = 11015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 20% [10, 37] | 0.99 (0.95) | 63.81 (34.92) | 6.39 (2.13) | 63 (50) | 1.08 (0.21) | 77.2 (60.8) | 22.5 (1.8) | 4.5 (1.4) | 1.84 (0.37) | 27% | 2.53 (1.10) |
| FR_SAFE | 30 | 83% [66, 93] | 10% [3, 26] | 1.24 (0.79) | 60.18 (24.24) | 5.95 (2.29) | 92 (38) | 1.50 (0.01) | 113.0 (46.5) | 22.0 (1.7) | 4.3 (1.5) | 1.77 (0.34) | 27% | 2.80 (1.79) |


