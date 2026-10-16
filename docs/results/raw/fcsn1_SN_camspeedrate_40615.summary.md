# DART ablation summary

Sweep: camspeedrate = 40615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.27 (0.46) | 74.16 (30.74) | 4.96 (0.86) | 66 (51) | 0.82 (0.25) | 320.1 (245.4) | 19.3 (3.2) | 7.9 (4.1) | 1.38 (0.56) | 16% | 2.43 (0.82) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 1.27 (0.57) | 69.51 (21.46) | 5.02 (0.82) | 106 (34) | 1.50 (0.01) | 512.4 (164.0) | 19.2 (3.0) | 8.1 (3.8) | 1.37 (0.53) | 15% | 2.43 (0.67) |


