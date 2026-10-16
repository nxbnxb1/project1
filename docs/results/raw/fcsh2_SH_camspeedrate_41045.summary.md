# DART ablation summary

Sweep: camspeedrate = 41045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.66 (0.47) | 64.92 (10.41) | 5.48 (0.73) | 118 (39) | 2.08 (0.32) | 567.0 (191.4) | 26.5 (0.9) | 11.6 (1.3) | 2.68 (0.18) | 48% | 2.00 (0.56) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 1.00 (0.53) | 66.98 (22.63) | 5.85 (1.16) | 184 (77) | 2.91 (0.05) | 882.9 (366.5) | 26.6 (0.8) | 11.9 (1.3) | 2.69 (0.16) | 48% | 2.17 (0.42) |


