# DART ablation summary

Sweep: camspeedrate = 41505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 3.02 (2.37) | 44.84 (45.45) | 6.59 (2.59) | 22 (24) | 0.46 (0.07) | 104.1 (116.9) | 21.8 (3.7) | 5.7 (4.8) | 1.69 (0.80) | 23% | 3.40 (2.44) |
| FR_SAFE | 30 | 80% [63, 90] | 20% [10, 37] | 2.62 (2.23) | 35.08 (25.79) | 6.71 (2.37) | 18 (13) | 0.52 (0.04) | 85.5 (62.6) | 21.4 (3.3) | 5.3 (4.5) | 1.61 (0.73) | 19% | 3.48 (2.66) |


