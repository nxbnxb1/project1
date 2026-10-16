# DART ablation summary

Sweep: camspeedrate = 20605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 57% [39, 73] | 40% [25, 58] | 0.49 (0.58) | 91.15 (41.90) | 4.26 (1.40) | 31 (21) | 0.40 (0.07) | 37.4 (25.0) | 18.4 (2.6) | 6.1 (2.6) | 1.28 (0.48) | 21% | 2.32 (0.82) |
| FR_SAFE | 30 | 63% [46, 78] | 30% [17, 48] | 0.67 (0.75) | 82.54 (27.55) | 4.39 (1.22) | 37 (18) | 0.51 (0.01) | 44.3 (20.8) | 18.8 (2.8) | 6.1 (2.6) | 1.32 (0.50) | 18% | 2.36 (0.97) |


