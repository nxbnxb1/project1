# DART ablation summary

Sweep: camspeedrate = 41005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 57% [39, 73] | 33% [19, 51] | 0.63 (0.91) | 52.45 (18.90) | 6.36 (2.09) | 24 (15) | 0.48 (0.04) | 114.5 (73.3) | 23.1 (2.0) | 8.3 (3.8) | 1.93 (0.45) | 27% | 1.99 (0.69) |
| FR_SAFE | 30 | 43% [27, 61] | 53% [36, 70] | 0.62 (1.11) | 61.60 (34.81) | 6.00 (2.09) | 24 (15) | 0.52 (0.02) | 116.0 (70.4) | 23.5 (2.5) | 9.1 (4.2) | 2.00 (0.56) | 31% | 2.04 (1.11) |


