# DART ablation summary

Sweep: camspeedrate = 11050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.13 (0.70) | 50.18 (20.68) | 7.33 (1.67) | 128 (95) | 2.43 (0.75) | 156.3 (116.1) | 22.6 (1.6) | 8.3 (3.5) | 1.80 (0.37) | 25% | 2.56 (0.71) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.38 (0.67) | 47.19 (14.40) | 7.46 (1.47) | 236 (72) | 5.01 (0.01) | 288.7 (87.0) | 22.8 (1.5) | 9.1 (3.1) | 1.84 (0.35) | 26% | 3.03 (0.78) |


