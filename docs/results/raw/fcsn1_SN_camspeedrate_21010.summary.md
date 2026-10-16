# DART ablation summary

Sweep: camspeedrate = 21010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 50% [33, 67] | 50% [33, 67] | 0.48 (0.63) | 56.17 (33.03) | 7.27 (2.05) | 34 (30) | 0.80 (0.16) | 40.8 (35.6) | 22.0 (1.9) | 3.4 (1.7) | 1.69 (0.42) | 24% | 2.43 (1.07) |
| FR_SAFE | 30 | 67% [49, 81] | 30% [17, 48] | 0.88 (0.89) | 50.12 (18.91) | 6.84 (2.12) | 43 (24) | 1.03 (0.05) | 52.2 (28.1) | 21.6 (1.7) | 3.4 (1.4) | 1.66 (0.35) | 25% | 2.49 (0.93) |


