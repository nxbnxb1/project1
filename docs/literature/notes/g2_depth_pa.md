# Literature notes — Group g2: monocular depth networks; perception-aware planning in unknown environments

Reader notes (process):
- All six arXiv ids were checked against the arXiv API and match the expected titles. No id corrections were needed.
- Copies are in `scratchpad/papers/g2_depth_pa/` (`<id>.pdf`, `<id>.txt`, and `<id>.pg.txt`, which adds a PDF page marker at each form feed). Page numbers below are **PDF page numbers**.
- pdftotext reported "xref num 535 not found" for 2001.04420 (FASTER). The PDF was rebuilt and all 17 pages extracted. No content was missing.
- Figure-only pages were read through their captions. The one exception is the Depth Anything V2 Fig. 1 latency/parameter chart: I rendered it as an image and read the numbers directly, because pdftotext scrambled the bar labels.
- DOIs are not printed in the arXiv copies. I did not add DOIs from memory.

---

### B1 — Towards Robust Monocular Depth Estimation: Mixing Datasets for Zero-shot Cross-dataset Transfer
René Ranftl*, Katrin Lasinger*, David Hafner, Konrad Schindler, Vladlen Koltun. IEEE TPAMI (header: "VOL. XX, NO. XX, 2020"), arXiv:1907.01341v3 (25 Aug 2020). DOI not printed. Pages read: 14/14. Pp. 11–12 contain only figures (captions read), and the bibliography and biographies are on pp. 13–14.
Status: **USE**

**Problem & setting:** Train one monocular (single-image) depth network on several datasets whose ground truth differs in form: metric depth, depth up to scale (SfM), or disparity up to scale and shift (stereo with unknown calibration). The goal is good zero-shot transfer to datasets never seen in training.

**Method (key idea, key equations in words, assumptions):**
- The network predicts **disparity (inverse depth) up to an unknown scale and shift** (p5).
- Loss is the scale- and shift-invariant loss L_ssi (Eq. 1). Before the residual is computed, prediction and GT are aligned in one of two ways:
  - (a) by a least-squares fit of scale s and shift t, which has a closed form (Eqs. 2–4, p5);
  - (b) by robust estimators, using t = median and s = mean absolute deviation (Eqs. 5–6, p6).
- Robust variants (p6):
  - L_ssimae uses the absolute residual;
  - **L_ssitrim** drops the 20% largest residuals in each image (Eq. 7);
  - a multi-scale gradient-matching term L_reg is added with α = 0.5 (Eqs. 11–12).
- The paper contrasts this with Eigen's scale-invariant log loss: "only L_ssimse accounts for an unknown global disparity shift" (p6).
- Datasets are mixed using Pareto-optimal multi-task learning (Eq. 13, p6).
- The paper introduces a new 3D-movies dataset (pp. 3–5).
- Best encoder is ResNeXt-101-WSL (p8).
- Training: 384×384 crops, Adam (pp. 6–7).

**Experiments & key quantitative results (exact, with page):**
- Ablations:
  - Trimmed MAE plus L_reg gives the lowest validation error over all datasets (Fig. 3, p8).
  - A ResNet-50 encoder with random initialization "performs on average 35% worse than its pretrained counterpart" (p8).
  - Better encoders give "up to 15 % relative improvement" (p8).
- Final model (MIX 5, Pareto mixing), Table 11 (p13):
  - DIW WHDR 12.46; ETH3D AbsRel 0.129; Sintel AbsRel 0.327; KITTI δ>1.25 23.90; NYU δ>1.25 9.55; TUM δ>1.25 14.29.
  - "Ours – small" (ResNet-50): 12.48 / 0.155 / 0.330 / 21.81 / 15.73 / 17.00.
- Evaluation protocol: all errors are measured **after per-image scale-and-shift alignment** of the prediction to the GT, done in inverse-depth space (p7).
- **No runtime or latency figures are reported anywhere in the paper.**

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated failure modes (p10):
  - a learned bias that lower image regions are closer, which fails on rotated images;
  - mirrors and paintings are not recognized as reflectors;
  - "Strong edges can lead to hallucinated depth discontinuities. Thin structures can be missed";
  - background is blurred because of "imperfect ground truth in the far range".
- Frames are processed independently with no temporal information (p9).
- Our observations:
  - The output carries no uncertainty estimate.
  - Scale and shift are unrecoverable without external information.
  - No speed numbers are given.

**Relation to DART:**
- This paper defines the **output model of the relative-depth networks DART builds on**: per-frame, *affine* (scale + shift) ambiguity in *inverse depth*. That matters for DART's noise model.
- DART assumes a **per-frame scale error** only. A pure scale error in depth is equivalent to zero shift in disparity. If any disparity shift t remains after DART converts to metric, the depth error depends on range. Our derivation: z_est = 1/(s/z + t), so the relative error grows with z. That gives far obstacles a biased range, which a scale-only model does not capture.
- Suggested handling for the paper. Do one of the following:
  - (i) state that DART assumes a metric-fine-tuned network, or a scale-only alignment from an external cue, so that the residual is scale-dominated; or
  - (ii) extend the noise model to an affine-in-disparity error.
- The listed failure modes (thin structures, hallucinated edges, mirrors) support DART's outlier term.
- What it does not do: no robotics, no latency, no uncertainty, no temporal consistency.
- Where it is stronger than DART: it gives an empirical characterization of zero-shot depth error across six datasets.

**Citable statements:**
- MiDaS-family networks predict inverse depth only up to scale and shift → p5: "We propose to perform prediction in disparity space (inverse depth up to scale and shift)".
- Some training data carries an unknown global disparity shift, not just a scale → p5: "Shift ambiguity: some datasets provide disparity only up to an unknown scale and global disparity shift".
- Eigen's scale-invariant loss handles scale but not shift → p6: "Both (8) and L_ssimse account for the unknown scale of the predictions, but only L_ssimse accounts for an unknown global disparity shift."
- Reported accuracy depends on per-image affine alignment to GT → p7: "we align predictions and ground truth in scale and shift for each image before measuring errors."
- Robust training trims outliers instead of down-weighting them → p6: "trimming the 20% largest residuals in every image, irrespective of their magnitude".
- Frames are processed independently (no temporal model) → p9: "every frame was processed individually, i.e. no temporal information was used in any way."
- Typical errors that justify an outlier/missed-obstacle model → p10: "Strong edges can lead to hallucinated depth discontinuities. Thin structures can be missed".
- Far-range predictions degrade → p10: "Results tend to get blurred in background regions ... imperfect ground truth in the far range."

**Snowball candidates:**
- B. Zhou, P. Krähenbühl, V. Koltun, "Does computer vision matter for action?" (2019)
- C. Wang et al., "Web stereo video supervision for depth prediction from dynamic scenes" (2019)
- K. Xian et al., "Monocular relative depth perception with web stereo data supervision" (2018)
- C. Godard et al., "Digging into self-supervised monocular depth prediction" (2019)
- D. Eigen et al., "Depth map prediction from a single image using a multi-scale deep network" (2014)

---

### B2 — Depth Anything: Unleashing the Power of Large-Scale Unlabeled Data
Lihe Yang, Bingyi Kang, Zilong Huang, Xiaogang Xu, Jiashi Feng, Hengshuang Zhao. The arXiv copy does not print a venue. The expected venue is CVPR 2024, and Depth Anything V2 [89] cites it as "In CVPR, 2024". arXiv:2401.10891v2 (7 Apr 2024). DOI not printed. Pages read: 18/18. Pp. 10–15 are qualitative figure pages (captions read).
Status: **USE**

**Problem & setting:** Build a foundation model for zero-shot monocular *relative* depth by scaling the training data. The main lever is about 62M unlabeled images that receive pseudo-labels from a teacher model.

**Method (key idea, key equations in words, assumptions):**
- Teacher–student self-training:
  - The teacher is trained on 1.5M labeled images (Table 1, p3).
  - The teacher pseudo-labels 62M unlabeled images (Eq. 4).
  - The student is retrained with strong perturbations: color jitter, blur and CutMix (Eqs. 5–8, pp. 4).
- Labeled loss, following MiDaS (p3):
  - depth is converted to disparity, d = 1/t, and "normalized to 0∼1 on each depth map";
  - an **affine-invariant** MAE is computed with median/MAD alignment (Eqs. 1–3).
- Semantic feature-alignment loss to a frozen DINOv2 encoder, with tolerance margin α = 0.85 (Eq. 9, p5).
- Architecture: DINOv2 encoder with a DPT decoder (p5).
- Sky is set to disparity 0 (p3).
- **Metric depth** is obtained by fine-tuning the encoder inside the ZoeDepth framework on NYUv2 (indoor) or KITTI (outdoor) (p6, p9).

**Experiments & key quantitative results (exact, with page):**
- Model sizes (Table 2 caption, p5): "ViT-S (24.8M), ViT-B (97.5M), and ViT-L (335.3M)".
- Zero-shot relative depth, ViT-L (Table 2, p5):

  | Dataset | AbsRel | δ1 |
  |---|---|---|
  | KITTI | 0.076 | 0.947 |
  | NYUv2 | 0.043 | 0.981 |
  | Sintel | 0.458 | 0.760 |
  | DDAD | 0.230 | 0.789 |
  | ETH3D | 0.127 | 0.882 |
  | DIODE | 0.066 | 0.952 |

  ViT-S on KITTI: 0.080 / 0.936.
- In-domain metric depth (Tables 3–4, p6):
  - NYUv2: δ1 0.984, AbsRel 0.056, RMSE 0.206.
  - KITTI: δ1 0.982, AbsRel 0.046, RMSE 1.896.
- **Zero-shot metric** depth (Table 5, p7), AbsRel / δ1:

  | Dataset | AbsRel | δ1 |
  |---|---|---|
  | SUN RGB-D | 0.500 | 0.660 |
  | iBims-1 | 0.150 | 0.714 |
  | HyperSim | 0.363 | 0.361 |
  | Virtual KITTI 2 | 0.085 | 0.913 |
  | DIODE Outdoor | 0.794 | 0.288 |

  These are large metric errors outside the training domain.
- Zero-shot evaluation aligns scale and shift manually (p9).
- **No latency or FPS numbers are reported.** The paper states only that the small models have potential in compute-limited settings (p5).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated (p9):
  - the largest model is only ViT-L;
  - "the widely adopted 512×512 training resolution is not enough".
- Our observations:
  - The relative output still has per-image affine ambiguity.
  - Metric transfer is weak across domains (Table 5).
  - No uncertainty output.
  - No timing.
  - Frames are treated independently; no temporal model is described.

**Relation to DART:**
- It supports DART's perception premise. A widely used learned monocular depth network gives affine-invariant inverse depth, and its metric variants still show large zero-shot errors (Table 5). Treating metric scale as a per-frame uncertain quantity is therefore well motivated. As with B1, the actual ambiguity is scale **and shift** in disparity.
- Gives model-size options (24.8M–335.3M) that DART can cite for the "compute-limited" framing. **Latency figures must come from elsewhere** (B3 gives V100 numbers only).
- What it does not do: no robotics, no closed loop, no latency or uncertainty.
- Where it is stronger than DART: it quantifies cross-domain depth error at scale.

**Citable statements:**
- MiDaS-style models give relative, not metric, depth because the loss ignores scale and shift → p2: "MiDaS [46] utilizes an affine-invariant loss to ignore the potentially different depth scales and shifts ... Thus, MiDaS provides relative depth information."
- Depth Anything also trains on per-image normalized disparity with an affine-invariant loss → p3: "the depth value is first transformed into the disparity space by d = 1/t and then normalized to 0∼1 on each depth map".
- Prior metric-depth methods generalize worse than relative ones → p2: "in our practice, we observe such methods exhibit poorer generalization ability than MiDaS".
- Small variants are aimed at compute-limited use → p5: "The performance advantage of these small-scale models demonstrates their great potential in computationally-constrained scenarios."
- Model scales → p5: "ViT-S (24.8M), ViT-B (97.5M), and ViT-L (335.3M), respectively."
- Zero-shot numbers depend on GT alignment → p9: "in zero-shot evaluation, the scale and shift of our prediction are manually aligned with the ground truth."
- The authors mention aerial vehicles explicitly → p7: "models trained with MegaDepth data are specialized at estimating the distance of ultra-remote buildings ... very beneficial for aerial vehicles."

**Snowball candidates:**
- S. F. Bhat et al., "ZoeDepth: Zero-shot transfer by combining relative and metric depth" (2023)
- W. Yin et al., "Metric3D: Towards zero-shot metric 3D prediction from a single image" (2023)
- V. Guizilini et al., "Towards zero-shot scale-aware monocular depth estimation" (2023)
- R. Birkl et al., "MiDaS v3.1 – a model zoo for robust monocular relative depth estimation" (2023)
- D. Wofk et al., "FastDepth: Fast monocular depth estimation on embedded systems" (2019)

---

### B3 — Depth Anything V2
Lihe Yang, Bingyi Kang, Zilong Huang, Zhen Zhao, Xiaogang Xu, Jiashi Feng, Hengshuang Zhao. 38th Conference on Neural Information Processing Systems (NeurIPS 2024). arXiv:2406.09414v2 (20 Oct 2024). DOI not printed. Pages read: 30/30. The appendix text was read in full. Pp. 18–24 are figure pages (captions read), and pp. 25–30 are references.
Status: **USE**

**Problem & setting:** Produce finer and more robust monocular relative depth than V1, especially for thin structures and transparent or reflective surfaces, while keeping efficient discriminative models at several sizes. A metric-depth variant is obtained by fine-tuning.

**Method (key idea, key equations in words, assumptions):**
- Three-step pipeline (p6):
  - (1) train a DINOv2-G teacher (1.3B) on 595K **synthetic** images only;
  - (2) pseudo-label 62M real unlabeled images;
  - (3) train students (ViT-S/B/L/G) on the pseudo-labeled real images only.
- Losses (p6) are the MiDaS L_ssi and L_gm (weight ratio 1:2, p8), with the top 10% largest-loss regions ignored.
- Output is "**affine-invariant inverse depth**" (p6).
- Metric models (p9):
  - fine-tuned with ZoeDepth on NYU-D/KITTI (Table 4);
  - and released metric models fine-tuned on Hypersim (indoor) and Virtual KITTI (outdoor).
- Also introduces the DA-2K sparse relative-depth benchmark (pp. 7–8).

**Experiments & key quantitative results (exact, with page):**
- **Latency and size** (Fig. 1, p1; read from the rendered figure; labelled "latency (V100)"):

  | Model | Latency | Params | DA-2K acc. |
  |---|---|---|---|
  | Ours-Small | 60 ms | 25M | 95.3% |
  | Ours-Large | 213 ms | 335M | 97.1% |
  | Marigold(LCM) | 5.2 s | 948M | 86.8% |
  | DepthFM | 2.1 s | 891M | 85.8% |

  The input resolution behind these latencies is not stated. No embedded or edge timing is given.
- Model range "from 25M to 1.3B params" (p1). DINOv2-G is too heavy for most applications (p5).
- Zero-shot relative depth (Table 2, p8):
  - V2 ViT-S, KITTI: AbsRel 0.078, δ1 0.936.
  - V2 ViT-L, KITTI: AbsRel 0.074, δ1 0.946.
  - The authors say V2 is "merely comparable with V1" on these metrics (p8).
- DA-2K accuracy (Table 3, p8): V2 ViT-S 95.3, ViT-B 97.0, ViT-L 97.1, ViT-G 97.4; Marigold 86.8; Depth Anything V1 88.5.
- Metric fine-tune (Table 4, p9):

  | Dataset | Model | δ1 | AbsRel | RMSE |
  |---|---|---|---|---|
  | NYU-D | ViT-S | 0.961 | 0.073 | 0.261 |
  | NYU-D | ViT-L | 0.984 | 0.056 | 0.206 |
  | KITTI | ViT-S | 0.973 | 0.053 | 2.235 |
  | KITTI | ViT-L | 0.983 | 0.045 | 1.861 |

- Transparent Surface Challenge, zero-shot δ1 (Table 12, p13): MiDaS V3.1 0.259; DA V1 0.535; V2 0.836.

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - training on 62M images is computationally heavy, and the synthetic sets are not diverse enough (p17);
  - DINOv2-G is too resource-intensive for most applications (p5);
  - models fine-tuned on NYUv2/KITTI "fail to produce fine-grained depth prediction and are not robust to transparent objects" (p9);
  - sparse relative-depth accuracy "is still far from the precise dense depth required for scene reconstruction" (p8).
- Our observations:
  - Latency was measured only on a V100 server GPU at an unstated resolution.
  - No uncertainty output.
  - No temporal consistency or video handling is described.

**Relation to DART:**
- It supports DART's assumption that learned depth costs **tens to hundreds of ms per frame**: 60 ms (ViT-S) to 213 ms (ViT-L) on a V100. On a smaller onboard accelerator the latency would be expected to be higher. That expectation is our inference; the paper gives no onboard numbers.
- It also confirms affine-invariant inverse-depth output for the relative models, so the scale-only caveat from B1 applies here too.
- Metric variants exist (Hypersim/vKITTI fine-tunes), which could justify a scale-dominated error model if DART assumes a metric head. The paper reports metric accuracy only in-domain (Table 4).
- What it does not do: no closed-loop use, no latency–accuracy trade-off for robotics, no perception scheduling.

**Citable statements:**
- V2 inference cost on a datacenter GPU → p1 (Fig. 1): "Ours-Large 213ms | 335M", "Ours-Small 60ms | 25M", "latency (V100)".
- Model family spans 25M–1.3B parameters → p1: "We offer models of different scales (ranging from 25M to 1.3B params) to support extensive scenarios."
- The largest model is impractical for most deployments; the small model is popular for speed → p5: "most applications cannot accommodate the resource-intensive DINOv2-G model (1.3B) in terms of storage and inference efficiency."
- Same point → p5: "the smallest model in Depth Anything V1 is used most widely due to its real-time speed."
- Output remains relative (affine-invariant inverse depth) → p6: "Similarly, our models produce affine-invariant inverse depth".
- Metric depth requires a separate fine-tune → p9: "we fine-tune our powerful encoder on Hypersim [58] and Virtual KITTI [9] synthetic datasets, for indoor and outdoor metric depth estimation".
- Transparent and reflective surfaces matter for navigation → p13: "the precise depth of the challenging transparent and reflective surfaces, which is important in navigation applications".

**Snowball candidates:**
- D. Wofk et al., "FastDepth: Fast monocular depth estimation on embedded systems" (2019)
- M. Hu et al., "Metric3D v2: A versatile monocular geometric foundation model for zero-shot metric depth and surface normal estimation" (2024)
- L. Piccinelli et al., "UniDepth: Universal monocular metric depth estimation" (2024)
- B. Ke et al., "Repurposing diffusion-based image generators for monocular depth estimation" (Marigold) (2024)
- S. F. Bhat et al., "ZoeDepth" (2023)

---

### C1 — PAMPC: Perception-Aware Model Predictive Control for Quadrotors
Davide Falanga*, Philipp Foehn*, Peng Lu, Davide Scaramuzza. Accepted at IEEE/RSJ IROS 2018 (Madrid), as printed. arXiv:1804.04811v2 (10 Jul 2018). DOI not printed. Pages read: 8/8.
Status: **USE** for the related-work contrast only. It has no obstacle avoidance, so it is not a baseline for DART.

**Problem & setting:**
- One nonlinear MPC for a quadrotor that jointly optimizes action (trajectory tracking, input limits) and perception.
- Perception here means keeping a single static 3D point of interest (e.g., the centroid of the VIO features) near the image center, and minimizing its velocity on the image plane to reduce motion blur.

**Method (key idea, key equations in words, assumptions):**
- Perception state z = [s, ṡ]: the pinhole projection and its time derivative, written as functions of the quadrotor state and input (Eqs. 4–9, p4).
- Cost is quadratic in the state, perception and input errors (Eq. 10, p5).
- Constraints bound thrust, body rates and velocity (Eqs. 11–13, p5).
- The perception terms are **costs, not constraints** (p2).
- Solved as a real-time-iteration SQP: one iteration per control loop, multiple shooting, ACADO + qpOASES (p5).
- Assumption: the point of interest is static (p4).

**Experiments & key quantitative results (exact, with page):**
- Real flights with a 420 g quadrotor, Snapdragon Flight board, onboard VIO (p5).
- MPC settings (p5): dt = 0.1 s, horizon 2 s, 100 Hz.
- Circular flight at 1–3 m/s (p6); hover-to-hover (p6); darkness scenario with two light spots (p7).
- Results are shown in figures; there is no tabular visibility metric.
- Computation (p8): "our PAMPC requires on average 3.53 ms". The standard deviation rises "from 0.155 ms to 0.354 ms" under load, and the maximum stays "below 5 ms".

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - a single point of interest (p3, p8);
  - longer horizons raise computation "roughly O(N²)" (p8).
- Our observations:
  - No obstacles or collision constraints.
  - Perception latency and rate are not modelled.
  - No estimation uncertainty in the controller.
  - The perception objective serves VIO feature tracking, not obstacle detection.

**Relation to DART:**
- A canonical "perception-aware control" reference. It co-designs perception and control **in the opposite direction** from DART: PAMPC shapes the motion so that perception works better, while DART decides *when* to run perception so that control stays safe.
- PAMPC has no safety certificate, no obstacles and no latency model. It is useful for positioning DART's "co-design" novelty and to show that perception-aware MPC is real-time feasible onboard.
- Where it is stronger than DART: real onboard flight experiments.

**Citable statements:**
- Onboard vision is intermittent and motion-dependent → p1: "it can be intermittent and its accuracy is strongly affected by both the environment ... and motion of the robot".
- Perception is handled as a soft objective, not a constraint → p2: "we incorporate perception objectives into the optimization problem not as constraints, but rather as components to be optimized."
- Perception-aware MPC runs in real time onboard → p8: "our PAMPC requires on average 3.53 ms."
- Horizon and discretization used → p5: "we chose dt = 0.1 s with a time horizon of th = 2 s and ran one iteration step in each control loop with a frequency of 100 Hz."

**Snowball candidates:**
- B. Penin et al., "Vision-based minimum-time trajectory generation for a quadrotor UAV" (2017)
- G. Costante et al., "Exploiting photometric information for planning under uncertainty" (2018)
- C. Forster et al., "Appearance-based active, monocular, dense depth estimation for micro aerial vehicles" (2014)
- R. Spica et al., "Coupling active depth estimation and visual servoing via a large projection operator" (2017)

---

### C2 — RAPTOR: Robust and Perception-aware Trajectory Replanning for Quadrotor Fast Flight
Boyu Zhou, Jie Pan, Fei Gao, Shaojie Shen. arXiv:2007.03465v1 (6 Jul 2020), a preprint. The T-RO version may differ, and this copy does not print a venue. DOI not printed. Pages read: 16/16.
Status: **USE**

**Problem & setting:** Fast quadrotor replanning in unknown, cluttered environments. The methods it compares against either treat unknown space as free (unsafe) or as occupied (conservative). RAPTOR adds perception awareness so that hidden obstacles are seen early enough to avoid.

**Method (key idea, key equations in words, assumptions):**
- (1) **Path-guided optimization (PGO).**
  - A B-spline trajectory is first pulled toward a collision-free guiding path, which is a closed-form unconstrained QP (Eq. 1).
  - It is then refined with smoothness, ESDF collision and feasibility penalties (Eqs. 2–3, pp. 4–5).
  - Several topologically distinct guiding paths come from a UVD roadmap and are optimized in parallel (pp. 5–7).
- (2) **Risk-aware refinement** (pp. 7–8).
  - Find the frontier point p_f where the optimistic trajectory leaves known-free space.
  - Find the critical view position p_c, i.e. the point where p_f becomes visible with visibility level ψ ≥ ψ_min (Eq. 5).
  - Check the **worst-case criterion** v_c²/(2a_max) ≤ d_cf − R_q (Eq. 6). It assumes an unknown obstacle sits right behind p_f.
  - If the check fails, add soft view constraints (Eqs. 7–8) and a safe-reaction-distance constraint d_s = v_s²/(2a_max) + R_q (Eq. 9).
  - Resolve the iteration with an increasing speed estimate (Alg. 3).
- (3) **Yaw planning** (pp. 9–10): graph search over yaw angles that maximizes information gain over unknown voxels near the trajectory (Eqs. 15–16), followed by B-spline smoothing (Eq. 17).
- Assumptions: mapping from a depth camera (occupancy grid + ESDF); no perception latency or depth noise model in the planner.

**Experiments & key quantitative results (exact, with page):**
- Hardware: Intel RealSense D435; all modules run on an i7-8550U (p10).
- In simulation, rendered depth gets random noise (p10).
- Perception-strategy real tests (Table I, p10), 3 runs per planner per scene, max 3 m/s and 2.5 m/s². Successes as Scene 1 / Scene 2:
  - A (optimistic + velocity-tracking yaw): 0 / 0
  - B (optimistic + active-exploration yaw): 0 / 0
  - C (risk-aware + velocity-tracking yaw): 2 / 0
  - D (risk-aware + active-exploration yaw): 3 / 3
- Versus safe local exploration (SLE) [38] (Table II, p13):
  - The proposed method succeeds 10/10 at every density from 0.2 to 0.4 obs./m².
  - SLE drops to 9, 9 and 8 at 0.3, 0.35 and 0.4.
  - At 0.4, flight time is 23.639 s vs 27.903 s.
- Versus FASTER/EWOK/RE-Traj (Fig. 21, p12): the numbers are only in bar charts. The text says the method outperforms on distance, time and energy (p13).
- Indoor flight (p13): max 2.90 m/s, average 1.77 m/s.
- Forests (p14): max 3.19 / avg 2.29 m/s; max 3.41 / avg 2.14 m/s.

**Limitations (stated by authors, with page) / limitations we observe:**
- The paper has no explicit limitations section.
- Our observations:
  - The worst-case criterion is deterministic and geometric. It ignores map/depth uncertainty and perception latency.
  - It assumes a stereo/RGB-D depth sensor at its native rate.
  - An emergency stop is used as a fallback: "collision point is closer than 0.5m" (p10).
  - The method relies on soft penalties, so safety is not formally guaranteed.

**Relation to DART:**
- **Closest conceptual match to DART's "frontier" term.** Eq. 6 assumes an unknown obstacle may sit just beyond the boundary of what has been seen, and requires that braking distance plus margin fits before it. DART's scheduler uses the same worst-case idea to bound the safe open-loop time.
- The difference is in what each system adjusts:
  - RAPTOR reshapes the *trajectory and yaw* so the frontier is seen earlier.
  - DART decides *when the next (slow, delayed) depth inference must arrive*, and adds closing speed and covariance growth.
- Gaps relative to DART:
  - perception latency is not modelled;
  - there is no perception-rate or triggering decision;
  - no estimator covariance;
  - no learned monocular depth.
- Where it is stronger than DART: real indoor and forest flights, plus active yaw (DART has no gaze control).

**Citable statements:**
- Treating unknown space as free is unsafe → p3: "Many methods adopt the optimistic assumption ... which treats the unknown space as collision-free ... but may not guarantee safety."
- Treating unknown space as occupied is conservative → p3: "Although these restrictions ensure safety, they lead to conservative motion."
- Worst-case frontier assumption → p7: "As is the worst case, an unknown obstacle may be revealed right behind pf and block the trajectory."
- Braking-distance safety test at the frontier → p8: "v_c²/2a_max ≤ d_cf − R_q (6) which means that if at p_c the quadrotor sees an obstacle, it can decelerate to a stop".
- Reaction distance definition → p8: "d_s is the safe reaction distance ... d_s = v_s²/2a_max + R_q."
- Late perception causes crashes even with an emergency stop (Scene 2) → p11: "or the delay of perception caused by the velocity-tracking yaw (planner C)". Note: "delay" here means observing late because of where the camera points, **not** compute latency.
- Back-up trajectories give FASTER robustness at a computational cost → p13: "FASTER rarely fails in the tests, thanks to the back-up trajectories. However, ... its overhead is higher."

**Snowball candidates:**
- S. Liu et al., "High speed navigation for quadrotors with limited onboard sensing" (2016)
- B. T. Lopez, J. P. How, "Aggressive collision avoidance with limited field-of-view sensing" (2017)
- H. Oleynikova et al., "Safe local exploration for replanning in cluttered unknown environments for micro aerial vehicles" (2018)
- E. Heiden et al., "Planning high-speed safe trajectories in confidence-rich maps" (2017)
- C. Richter, N. Roy, "Learning to plan for visibility in navigation of unknown environments" (2016)
- Z. Zhang, D. Scaramuzza, "Perception-aware receding horizon navigation for MAVs" (2018)

---

### C3 — FASTER: Fast and Safe Trajectory Planner for Navigation in Unknown Environments
Jesus Tordesillas, Brett T. Lopez, Michael Everett, Jonathan P. How. "Accepted for publication in IEEE Transactions on Robotics", as printed. arXiv:2001.04420v2 (30 Aug 2021). DOI not printed. Pages read: 17/17.
Status: **USE**

**Problem & setting:** High-speed UAV planning in unknown environments. Planning only in known-free space F with a terminal stop is safe but slow. Planning in F ∪ U (U = unknown) is fast but unsafe. FASTER aims to get both.

**Method (key idea, key equations in words, assumptions):**
- Each replanning step solves two MIQPs over a convex decomposition: jerk-minimal cubic splines whose Bézier control points must lie in the chosen polyhedra, with binary interval allocation (Eq. 1, p5).
  - The **Whole Trajectory** A→E lies in F ∪ U and ends with a stop.
  - The **Safe Trajectory** R→F lies only in F and ends with a stop.
- The vehicle commits to A→R of the Whole Trajectory plus the Safe Trajectory (p4, Alg. 1).
- R is the last state before H (the entry point into U) that can still stop. This uses a per-axis double-integrator stopping-distance test, v²/(2|a_max|) (p7).
- **Planner computation latency** is handled as follows:
  - the start point A is offset by δt = α·(previous replanning time), with α ≈ 1.25 (pp. 5–6);
  - if either optimization is infeasible, if A→R enters U, or if replanning takes longer than δt, the previous committed trajectory continues (p7).
- **Theorem 1** (p8): under Assumption 1 (noise-free map, static world), every committed trajectory lies in free space (known or unknown), proved by induction.
- Mapping: a sliding occupancy grid with O and U inflated by the UAV radius (p4).
- Yaw: the camera points toward the place where the JPS path enters unknown space (p8).

**Experiments & key quantitative results (exact, with page):**
- Simulation: depth camera with 90° horizontal FOV; range 5 m in the corner environment and 10 m elsewhere (p8).
- Forest, 10 random maps (Table I, p8): FASTER 10 successes, average distance 77.6 m. Multi-Fidelity [4]: 10 successes, 84.5 m.
- Flight time (Table II, p8): 29.2 s vs 61.2 s, a 52.3% improvement (v_max = 5 m/s, a_max = 5 m/s², j_max = 8 m/s³).
- Bugtrap (Table III, p9): 55.2 m and 13.8 s vs 56.8 m and 37.6 s.
- Office (Table IV, p9): 43.9 m and 20.94 s vs 41.5 m and 29.73 s.
- Planning in F ∪ U vs F only, same step (p10): 6.02 m/s vs 5.06 m/s on segment A→R.
- **Safe Trajectory ablation** (Table V, p11), crash-free runs out of 5:

  | v_max | FASTER | No safe traj. |
  |---|---|---|
  | 4 m/s | 5/5 | 5/5 |
  | 6 m/s | 5/5 | 2/5 |
  | 8 m/s | 5/5 | 0/5 |

- Hardware (p12):
  - top speed 7.8 m/s with a RealSense D435;
  - mapping and planning run on an Intel NUC;
  - state comes from motion capture (p8).
- MIQP runtimes (p14): "the 75th percentile is always below 32 ms".

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - Assumption 1, a noise-free map and static world (p7);
  - future work is to add map uncertainty and dynamic obstacles (p15);
  - more polyhedra raise computation (p15);
  - the choice of R is heuristic (p15);
  - hardware state estimation used motion capture (p8, p15).
- Our observations:
  - The guarantee is purely geometric.
  - Perception latency (capture → map) and depth noise are not modelled.
  - Sensing is assumed to arrive at the camera's rate.

**Relation to DART:**
- **Reference design for safe-stop reasoning.** DART's safe open-loop time asks the same question: can the vehicle still stop before the boundary of what has been sensed? FASTER's answer is "always keep a stopping trajectory inside known-free space". DART instead bounds *how long it may go without a new perception result* and folds in braking distance, closing speed, covariance growth and the frontier.
- FASTER compensates *planner* latency (δt offset, fall back to the previous plan). DART compensates *perception* latency (capture-time pose, retrodicted Kalman update) and uses it to schedule inferences. The two latency treatments complement each other.
- Gaps relative to DART:
  - no measurement uncertainty or covariance (Assumption 1);
  - no dynamic obstacles;
  - no perception scheduling;
  - no learned monocular depth.
- Where it is stronger than DART: a formal recursive-feasibility theorem, hardware flights at 7.8 m/s, and a clear Safe-Trajectory ablation (Table V). That ablation is a useful template for DART's "no-scheduler / no-frontier" ablations.

**Citable statements:**
- Planning only in known-free space with a stop condition limits speed → p1: "approaches that ensure safety by enforcing a “stop” condition in the free-known space can severely limit the speed of the vehicle".
- Safety comes from always holding a back-up trajectory in known-free space → p1: "Safety is ensured by always having a safe back-up trajectory in the free-known space."
- Safety framed as recursive feasibility, as in MPC → p1: "Similar to the model predictive control literature, safety is guaranteed by ensuring a feasible solution exists indefinitely."
- The guarantee needs a perfect map and a static world → p7: "Assumption 1. The map M is noise-free and the world is static".
- Stopping-distance approximation used → p7: "approximated the system as a double integrator model in each axis and, hence, v²/(2|a_max|) is the minimum stopping distance."
- Compensating planner latency by offsetting the start point → p5–6: "This offset δt is computed by multiplying the total time of the previous replanning step by α ≥ 1 (typically α ≈ 1.25)."
- A back-up plan matters most at high speed → p10: "the Safe Trajectory is not strictly necessary when flying at low speeds (≤ 4 m/s), but it is crucial ... at high speeds (≥ 6 m/s)."
- The authors list map uncertainty as open → p15: "we plan to include the uncertainty associated with the map (due to estimation error and/or sensor noise) in the replanning function".

**Snowball candidates:**
- P. R. Florence et al., "NanoMap: Fast, uncertainty-aware proximity queries with lazy search over local 3D data" (2018)
- D. Dey et al., "Vision and learning for deliberative monocular cluttered flight" (2016)
- P. Florence, J. Carter, R. Tedrake, "Integrated perception and control at high speed: Evaluating collision avoidance maneuvers without maps" (2016)
- T. Schouwenaars, É. Féron, J. How, "Safe receding horizon path planning for autonomous vehicles" (2002)
- J. Tordesillas et al., "Real-time planning with multi-fidelity models for agile flights in unknown environments" (2019)
- M. Ryll et al., "Efficient trajectory planning for high speed flight in unknown environments" (2019)

---

## Group synthesis
- **Learned monocular depth is relative, not metric.** MiDaS (p5), Depth Anything (p3) and V2 (p6) all train and output inverse depth that is affine-invariant per image, and all three report accuracy only after per-image scale/shift alignment to the ground truth.
  - DART's **per-frame scale-only** error model is a simplification of a per-frame **affine error in disparity**. A leftover shift produces a range-dependent bias in depth.
  - DART should either assume a metric/aligned head explicitly or model the shift.
- **Metric variants exist but transfer poorly across domains.** Depth Anything's zero-shot metric results reach AbsRel 0.500 (SUN RGB-D) and 0.794 (DIODE Outdoor) (Table 5, p7). This supports treating metric scale as an uncertain per-frame quantity.
- **Inference is slow even on server hardware.**
  - V2 reports 60 ms (25M) to 213 ms (335M) on a V100 (Fig. 1, p1).
  - MiDaS and Depth Anything V1 report no timing at all.
  - None of the three gives embedded or accelerator latency or a latency–accuracy curve. DART's "tens to hundreds of ms" premise therefore needs an onboard source; FastDepth is a snowball lead.
- **No uncertainty and no temporal model.** None of the depth papers outputs per-pixel uncertainty or models temporal consistency; MiDaS processes "every frame ... individually" (p9). DART has to supply its own covariance model, which is a legitimate contribution.
- **Documented failure modes support an outlier term:** thin structures missed, hallucinated edges and mirrors (MiDaS p10), and transparent surfaces (V2 Table 12, p13).
- **Perception-aware planning shapes motion, not perception timing.**
  - PAMPC changes attitude and trajectory for VIO feature visibility and has no obstacles.
  - RAPTOR changes the trajectory and yaw to see frontiers earlier.
  - Both treat perception as arriving at the sensor's native rate with negligible latency.
- **Safe-stop reasoning is geometric and deterministic.**
  - RAPTOR: braking distance to the frontier point, v²/(2a_max) + R_q (p8).
  - FASTER: a back-up trajectory in known-free space, with a recursive-feasibility theorem that assumes a noise-free, static map (p7–8).
  - Neither includes measurement covariance or growth of uncertainty over time.
- **Latency handling is planner-side only.** FASTER offsets the replanning start by α·(previous solve time) and falls back to the previous committed plan (pp. 5–7). Capture-to-map perception latency appears in none of the six papers.
- **Open gap DART can fill.** None of the six decides *when* to perceive (rate/trigger), and none ties a slow, delayed, uncertain *learned* depth measurement to a safety certificate. DART's safe open-loop time combines braking, closing speed, covariance growth and a frontier term. The frontier term is closest to RAPTOR Eq. 6, and the safe-stop idea is closest to FASTER.
- **Where DART is weaker.** RAPTOR and FASTER fly real hardware: RAPTOR in forests at about 3.4 m/s maximum, FASTER at up to 7.8 m/s. FASTER also proves safety formally. DART's evaluation is MATLAB/Simulink simulation only, so its claims should be scoped accordingly.
