# DART ablation summary

Sweep: camspeedrate = 20625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 0.97 (0.56) | 81.27 (27.41) | 4.51 (1.04) | 109 (68) | 1.30 (0.47) | 131.5 (81.2) | 19.2 (2.7) | 3.9 (1.5) | 1.40 (0.48) | 19% | 2.40 (1.17) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 0.97 (0.58) | 78.58 (23.21) | 4.57 (0.96) | 195 (58) | 2.51 (0.00) | 234.3 (68.9) | 19.1 (2.4) | 4.2 (1.7) | 1.37 (0.43) | 17% | 2.72 (0.89) |


