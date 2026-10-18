# Editorial Manager — text to paste (IJIRA submission)

Generated from `docs/paper/en/manuscript.tex`; copy each block into the matching field of the submission form. Public copy: author data withheld (kept in docs/paper/private/).

## Article title
When to run depth inference? Observed-free-space perception scheduling for low-cost quadrotors with delayed monocular depth

## Short (running) title
Observed-free-space perception scheduling

## Author
[withheld in the public copy]

## Abstract (246 words)
Low-cost quadrotors often obtain obstacle information from one camera and a monocular depth network, the most computationally expensive stage of the control loop, with a latency of about 0.1 s. Running it at a fixed rate spends computation even when the space ahead has already been observed. We propose a coverage-triggered scheduler: an inference is triggered only when the planned path, extended by the distance needed to stop after the next result arrives, is no longer contained in the free space observed by the most recent frames. The scheduler has a hard rate cap and is integrated with a perception-range speed limit, a memory of vertical cylinders updated by a Kalman filter at the capture time, a 20 Hz model predictive controller and a 100 Hz control barrier function filter. Under stated assumptions, the coverage condition ensures that skipping an inference does not remove the ability to stop within observed free space; its consequences are tested in 36 000 paired simulated flights (three scenario families, ten rate caps, three commanded speeds, four camera configurations). At the same rate cap, the scheduler uses 50–72 % of the inferences of fixed-rate perception in the nominal and everyday scenarios, with no statistically significant difference in collision rate; its frame rate increases with obstacle density; and at an equal low computational budget, failed missions in the nominal scenarios decrease from 35 to 16 of 720. A wide-angle camera is a precondition for these savings to come without loss of safety.

## Keywords
Perception scheduling, Monocular depth estimation, Quadrotor, Obstacle avoidance, Model predictive control, Control barrier function

## Funding
No funding was received for conducting this study.

## Competing interests
The author has no competing interests to declare that are relevant to the content of this article.

## Author contributions
[withheld in the public copy]

## Ethics approval and consent
Not applicable: the study is a simulation study without human or animal participants.

## Data availability
The per-run results of the 36 000 simulated flights and the scripts that produce the tables and figures are available in the GitHub repository https://github.com/nxbnxb1/project1.

## Code availability
The MATLAB/Simulink source code and the GitHub Actions workflows used to run the experiments are available in the same repository, https://github.com/nxbnxb1/project1.

## Use of AI tools (stated in Section 5 of the manuscript)
Parts of the simulation code, the analysis scripts and the first draft of this manuscript were prepared with the assistance of an AI coding assistant based on a large language model (Claude, Anthropic). The author specified the method and the experiments, reviewed and tested the code, checked the reported numbers against the stored simulation logs and the cited statements against the full texts of the cited works, and takes full responsibility for the content.
