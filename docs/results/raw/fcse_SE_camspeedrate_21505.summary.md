# DART ablation summary

Sweep: camspeedrate = 21505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 70% [52, 83] | 30% [17, 48] | 1.26 (1.59) | 35.69 (35.42) | 7.47 (2.12) | 14 (15) | 0.46 (0.05) | 16.6 (18.1) | 20.8 (2.2) | 4.8 (3.6) | 1.45 (0.52) | 19% | 3.58 (2.35) |
| FR_SAFE | 30 | 73% [56, 86] | 27% [14, 44] | 1.32 (1.30) | 28.96 (15.10) | 7.44 (2.23) | 16 (11) | 0.53 (0.02) | 18.8 (13.1) | 20.5 (2.5) | 5.0 (4.0) | 1.40 (0.54) | 17% | 3.39 (2.50) |


