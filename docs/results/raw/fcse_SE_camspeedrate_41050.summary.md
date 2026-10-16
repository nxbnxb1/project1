# DART ablation summary

Sweep: camspeedrate = 41050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.88 (2.03) | 32.33 (16.65) | 7.46 (1.79) | 48 (48) | 1.34 (0.64) | 231.7 (229.5) | 22.1 (2.9) | 4.5 (3.0) | 1.74 (0.67) | 24% | 3.37 (2.71) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.98 (1.75) | 32.52 (14.06) | 7.44 (1.75) | 95 (41) | 2.92 (0.07) | 456.9 (196.6) | 22.1 (2.7) | 4.6 (3.0) | 1.75 (0.63) | 24% | 3.67 (2.52) |


