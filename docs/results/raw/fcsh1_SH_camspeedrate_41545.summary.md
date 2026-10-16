# DART ablation summary

Sweep: camspeedrate = 41545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.83 (0.48) | 70.11 (13.17) | 5.46 (0.98) | 140 (41) | 2.11 (0.29) | 675.2 (201.8) | 26.2 (1.0) | 15.5 (1.2) | 2.63 (0.18) | 50% | 2.20 (0.39) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.84 (0.40) | 64.42 (10.62) | 5.81 (0.71) | 179 (42) | 2.91 (0.07) | 863.2 (207.6) | 26.3 (0.9) | 16.2 (1.3) | 2.64 (0.18) | 49% | 2.03 (0.41) |


