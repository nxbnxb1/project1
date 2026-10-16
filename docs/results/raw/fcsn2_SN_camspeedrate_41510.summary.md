# DART ablation summary

Sweep: camspeedrate = 41510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.11 (0.84) | 57.27 (25.38) | 6.95 (2.56) | 47 (25) | 0.87 (0.07) | 224.6 (122.3) | 24.9 (1.5) | 10.1 (4.0) | 2.29 (0.34) | 38% | 2.01 (0.85) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.14 (1.03) | 52.16 (26.19) | 7.26 (2.33) | 50 (26) | 1.01 (0.01) | 238.2 (129.9) | 24.7 (1.4) | 9.6 (3.7) | 2.25 (0.33) | 36% | 2.29 (1.22) |


