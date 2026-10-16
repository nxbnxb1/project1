# DART ablation summary

Sweep: camspeedrate = 11035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.43 (0.73) | 51.50 (21.68) | 7.14 (1.66) | 100 (74) | 1.78 (0.51) | 122.3 (89.4) | 22.6 (1.6) | 4.5 (1.7) | 1.81 (0.35) | 25% | 2.49 (0.73) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.41 (0.81) | 48.71 (18.97) | 7.09 (1.80) | 179 (76) | 3.46 (0.01) | 218.9 (92.9) | 22.3 (1.4) | 4.8 (1.9) | 1.76 (0.33) | 25% | 2.88 (0.75) |


