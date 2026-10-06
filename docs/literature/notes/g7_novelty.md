# Group 7 — Novelty / closest prior art for DART (when/how often to perceive, safety-driven perception scheduling, perception–control co-design)

Agent notes. PAPERS_DIR = `scratchpad/papers/g7_novelty/` (PDFs, `pdftotext` outputs `*.raw`/`*.txt`, page-marked `*.rpg`; all arXiv search results in `search/q01.xml … q95.xml`; de-duplicated hit list in `search/all_unique.tsv`, 544 unique arXiv entries).

Page numbers below are PDF page numbers (form-feed index of `pdftotext`). Quotes are verbatim from the extracted text (whitespace normalised; line-break hyphens removed by `pdftotext`, e.g. "unitrate" = "unit-rate").

---

## 1. Search log (what was queried)

* arXiv API (`export.arxiv.org/api/query`), 95 queries in total + ~15 title/author look-ups, `max_results` 30–40. Families of queries (abs:/ti:/all:, AND/OR):
  adaptive perception rate; "perception rate"; "processing rate" AND perception AND safety; "perception scheduling"; "perception" AND "scheduler" AND safety/risk; event-triggered / self-triggered AND perception/sensing/vision/estimation; "when to sense"/"when to perceive"/"when to look"/"when to observe"; "sensing frequency"; "sampling rate" AND perception AND safety; "inference frequency"; "frame rate" AND adaptive AND obstacle/drone/driving; "frame skipping"; risk-aware sensing/perception rate; "latency-aware" planning/control; "compute-aware"/"computation-aware" planning/MPC; "anytime perception"; "co-design" AND perception AND control AND latency/compute; energy-efficient perception drone/UAV; "resource-aware" perception; "intermittent" sensing AND "control barrier"; self-/event-triggered "control barrier"; "adaptive sampling" AND "control barrier"; "minimum attention" control; "costly measurements"/"sensing cost"/"observation cost"; "measurement scheduling"; "age of information" AND safety AND perception; "perception latency" AND planning/control/safety/quadrotor; "sense and avoid" AND latency; "time-to-collision" AND inference/perception AND schedule; "dynamic deadline"; "deadline" AND perception AND planning; "safety-aware" scheduling/computing; "criticality-aware"; title look-ups for known works (Zhuyi, Suraksha, ICCD-2020, D3, Pylot, RoboRun, "How fast is too fast", "The role of compute", TAPAS, snowball titles).
* Google Scholar HTML (5 queries, spaced ≥8 s): Suraksha; D3; "perception rate" safety drone; event-triggered perception obstacle avoidance; safety-aware frame-rate adaptation; risk-aware perception scheduling UAV.
* Author/lab pages: cseweb.ucsd.edu/~jzhao (Suraksha ISSRE'21, ICCD'20 PDFs), rpg.ifi.uzh.ch (Falanga RA-L'19 PDF).
* Coordinator-requested must-reads (from TAPAS bibliography): Zhuyi (DAC'22), Suraksha (ISSRE'21), Zhao et al. ICCD'20 — all three obtained and read in full (N1, N3, N4).

## 2. Screening table (title + abstract only; used ONLY to decide what to read)

Decision codes: READ-Nx = read in full (notes below); FOLLOW-UP = relevant, not read here (candidate for another pass); BG = background/peripheral; EXCL = off-topic for DART; NUD = full text not obtainable here (NEED-USER-DOWNLOAD).

| id | title (abridged) | year | decision (from title+abstract) |
|---|---|---|---|
| 2205.03347 | Zhuyi: Perception Processing Rate Estimation for Safety in Autonomous Vehicles | 2022 | READ-N1 — minimum safe per-camera frame-processing rate from kinematics; closest to DART scheduler |
| 2607.17317 | TAPAS: Throughput-adaptive Perception for Autonomous Systems | 2026 | READ-N2 — scene-complexity-driven FPS targets + accelerator mapping |
| (author PDF) | Suraksha: A Framework to Analyze the Safety Implications of Perception Design Choices in AVs (ISSRE) | 2021 | READ-N3 — safety sensitivity to camera FPS / delay (coordinator must-read) |
| (author PDF) | Driving Scenario Perception-Aware Computing System Design in Autonomous Vehicles (ICCD) | 2020 | READ-N4 — perception-latency model vs obstacle density (coordinator must-read) |
| (lab PDF) | How Fast is Too Fast? The Role of Perception Latency in High-Speed Sense and Avoid (RA-L) | 2019 | READ-N5 — max tolerable latency vs speed / sensing range / agility, quadrotor |
| 2108.13354 | RoboRun: A Robot Runtime to Exploit Spatial Heterogeneity | 2021 | READ-N6 — safety time budget from visibility and stopping distance; drone runtime |
| 2608.15437 | MM-BEV: Enhancing Timeliness by Computing Where and When it Matters | 2026 | READ-N7 — braking-distance/TTC criticality drives perception compute + keyframe schedule |
| 1903.03692 | Self-triggered Control for Safety Critical Systems using Control Barrier Functions | 2019 | READ-N8 — "safe period" for ZOH control from CBF bound |
| 2608.25228 | Compiling Spatial Certificates into Temporal Contracts for Latency-Aware Control (CIPS) | 2026 | READ-N9 — certified remaining safe time, latency-aware trigger |
| 2401.13585 | Latency vs precision: stability preserving perception scheduling | 2024 (Automatica 2023) | READ-N10 — scheduling perception modes (latency/noise) with stability |
| 2005.03726 | Opportunistic Intermittent Control with Safety Guarantees for Autonomous Systems | 2020 | READ-N11 — skip control computation with safety guarantee (snowball from N6) |
| 2510.25205 | Energy-Efficient Autonomous Driving with Adaptive Perception and Robust Decision (EneAD) | 2025 | READ-N12 — scenario-dependent perception framerate (frame skipping) in closed-loop driving |
| D3 (EuroSys'22, DOI 10.1145/3492321.3519576) | D3: A Dynamic Deadline-Driven Approach for Building Autonomous Vehicles (Gog et al.) | 2022 | NUD — (title) dynamic deadlines for AV pipelines; ACM PDF returned 403, no author copy found (`people.eecs.berkeley.edu/~gogionel/...` 404) |
| — (TCST 29(2):768–779) | Anytime computation and control for autonomous systems (Pant et al.) | 2021 | NUD — per N10 p2: 'a control-estimator co-design … in a periodic setting' with latency–estimator-quality model inside MPC; not on arXiv by title search |
| — (T-RO 41:347–363) | A coordinated approach to control mechanical and computing resources in mobile robots (Shahsavari et al.) | 2025 | NUD — (title) compute/motion co-control; cited by N2 as ref [12] |
| — (IROS 2021 pp. 7594–7600) | Adaptive optimization of autonomous vehicle computational resources for performance and energy improvement (Jambotkar et al.) | 2021 | NUD / FOLLOW-UP — cited by N2 [36] as simulation-based context-driven adaptation |
| — (ICRA 2016) | High speed navigation for quadrotors with limited onboard sensing (Liu et al.) | 2016 | NUD / FOLLOW-UP — title only (cited by N6 [9] as source of stopping-distance reasoning); possibly relevant to DART frontier term |
| — (IV 2020, author PDF exists) | Safety Score: A Quantitative Approach to Guiding Safety-Aware AV Computing System Design | 2020 | BG — not read (latency-based safety metric; superseded by N1/N3 per N1 p6) |
| 1905.08453 | Towards Safety-Aware Computing System Design in Autonomous Vehicles | 2019 | BG — preprint of ICCD/IV line (N4 is its follow-up); not read |
| 2207.06390 | Dynamic Selection of Perception Models for Robotic Control | 2022 | FOLLOW-UP — which perception model (latency/variance) to invoke in multi-step control |
| 2108.01235 | Interpretable Trade-offs Between Robot Task Accuracy and Compute Efficiency | 2021 | FOLLOW-UP — fast vs slow model invocation incl. safe navigation |
| 2406.01163 | When to Sense and Control? A Time-adaptive Approach for Continuous-Time RL | 2024 | FOLLOW-UP — RL policy also picks hold/measurement duration; no safety constraint in abstract |
| 2607.08119 | Cost of Sensing in Optimal Control | 2026 | FOLLOW-UP — optimal sensing intervals (LTI, PMP); no safety |
| 1703.05088 | Event-Triggered Intermittent Sampling for Nonlinear MPC | 2017 | FOLLOW-UP — reduces sensing cost; stabilisation only |
| 2304.08685 | Sample-and-Hold Safety with Control Barrier Functions | 2023 | FOLLOW-UP — sampling-frequency requirements/triggers for CBF safety (likely in CBF groups) |
| 2302.12435 | Greedy Synthesis of Event- and Self-Triggered Controls with CLBF | 2023 | FOLLOW-UP (same family as N8) |
| 2209.13053 / 2203.12089 / 2306.01871 / 2310.00534 | Event/self-triggered CBF control of connected automated vehicles | 2022–23 | BG — trigger control updates, not perception |
| 2108.12702 | Performance-Barrier-Based Event-Triggered Control | 2021 | BG |
| 2106.04508 | Energy-Efficient Adaptive System Reconfiguration for Dynamic Deadlines in Autonomous Driving | 2021 | FOLLOW-UP — velocity-dependent deadlines → DVFS/scheduling |
| 1906.10513 | The Role of Compute in Autonomous Aerial Vehicles | 2019 | BG — compute ↔ velocity/mission energy for MAVs |
| 2204.10898 / 2111.03792 | Roofline Model for UAVs (bottleneck analysis of onboard compute) | 2021–22 | BG — safe velocity vs compute throughput (design time) |
| 1905.06388 | MAVBench | 2019 | BG |
| 2109.04285 | Energy-Efficient Mobile Robot Control via Run-time Monitoring of Environmental Complexity and Computing Workload | 2021 | FOLLOW-UP — joint CPU-DVFS + motor control; energy, not safety bound |
| 2503.10296 | CODEI: Task-Driven Co-Design of Perception and Decision Making | 2025 | BG — design-time sensor/algorithm selection (ILP) |
| 2306.15748 / 2202.11330 | CARMA / EcoFusion: context-aware energy-efficient sensor fusion | 2023 / 2022 | BG — reconfigure fusion for energy; not rate/safety-driven |
| 2603.13176 | Perceive What Matters: Relevance-Driven Scheduling for Multimodal Streaming Perception | 2026 | BG — HRC module scheduling, not safety |
| 2002.07987 | Urgency of Information for Context-Aware Timely Status Updates in Remote Control | 2020 | BG — threshold-type status-update scheduling (communications) |
| 2607.20967 | Update the Unseen Only: Minimizing AoI for Collaborative Perception | 2026 | EXCL (V2X comms) |
| 2209.05487 | Understanding Time Variations of DNN Inference in Autonomous Driving | 2022 | BG (latency variability; g1 topic) |
| 2208.12181 | Anytime-Lidar: Deadline-aware 3D Object Detection | 2022 | BG — anytime perception under deadlines, not safety-derived |
| 2104.07830 | Pylot: latency–accuracy trade-offs in AVs | 2021 | BG (D3 platform) |
| 2509.13816 | Agile in the Face of Delay: Asynchronous End-to-End Learning for Aerial Navigation | 2025 | FOLLOW-UP for latency group (perception-delay conditioning) |
| 2407.16740 | PLM-Net: Perception Latency Mitigation Network | 2024 | BG (g1 topic) |
| 2401.13596 | PLATE: A perception-latency aware estimator | 2024 | FOLLOW-UP — same group as N10; picks perception configurations online |
| 2401.13602 | Perception-latency aware distributed target tracking | 2024 | BG |
| 2003.08301 | From Sensor to Processing Networks: Optimal Estimation with Computation and Communication Latency | 2020 | FOLLOW-UP — estimation with latency/accuracy trade-off (DART comp. 2) |
| 2607.11204 | Stop to Decide: Latency-Aware Proprioceptive Navigation Primitives | 2026 | BG — critical evaluation rate for quadruped stair detection |
| 2608.00322 | Belief-Space Perception Routing under Coupled Sensor Faults and Compute Contention | 2026 | BG (title only) |
| 2605.00005 | Cloud Is Closer Than It Appears (distributed real-time inference) | 2026 | EXCL (offloading) |
| 2307.09880 | A3D: Adaptive, Accurate, and Autonomous Navigation for Edge-Assisted Drones | 2023 | BG — offloading/resolution adaptation; not safety-triggered |
| 2603.09194 | WESPR: Wind-adaptive Energy-Efficient Safe Perception & Planning (quadrotors) | 2026 | EXCL — wind-field prediction, not perception rate |
| 1804.04811 / 2411.11982 / 2210.01841 / 1705.02408 | Perception-aware MPC/planning (PAMPC, HPA-MPC, learned perception-aware flight, GPU perception-aware planning) | 2017–24 | EXCL — "perception-aware" = viewpoint/visibility, not rate |
| 2309.14272 | Perception-and-Energy-aware Motion Planning for UAV under Heteroscedastic Uncertainty | 2023 | BG |
| 2505.17438 | HEPP: Hyper-efficient Perception and Planning for High-speed UAV Obstacle Avoidance | 2025 | BG |
| 2409.11962 | Reactive Collision Avoidance for Safe Agile Navigation | 2024 | BG |
| 2403.01428 | Localization matters too: How localization error affects UAV flight | 2024 | BG |
| 2511.01403 | Risk Aware Safe Control with Multi-Modal Sensing for Dynamic Obstacle Avoidance | 2025 | BG (CBF/uncertainty groups) |
| 2304.00194 / 2511.08741 / 2412.03792 | Safe perception-based control under sensor uncertainty (conformal / ATOM-CBF / conformal tube MPC) | 2023–25 | BG (g6 topic) |
| 2402.09382 | Safe Distributed Control of Multi-Robot Systems with Communication Delays | 2024 | BG (g5 topic) |
| 2512.18109 | Timing-Aware Two-Player Stochastic Games with Self-Triggered Control | 2025 | BG |
| 2005.12697 / 2307.02620 / 1208.3291 | Observation-cost-sensitive RL / when to look at a noisy Markov chain if measurements are costly | 2012–23 | BG — costly observation, no physical safety |
| 2505.16741 / 2507.20835 / 1108.2783 / 1911.10135 | Minimum-attention control | 2011–25 | BG — minimise control updates, not perception |
| 2012.14925 | Infinite-Horizon LQG with Costly Measurements | 2020 | BG |
| 1704.02075 | On Sensing, Agility, and Computation Requirements for a Data-gathering Agile Robotic Vehicle | 2017 | BG |
| 2112.10303 | Towards Computational Awareness in Autonomous Robots | 2021 | BG |
| 2603.18238 / 2510.11448 | ReDAG-RT (ROS 2 rate-priority scheduling) / faster AD middleware | 2025–26 | EXCL (RT middleware, not safety-derived rates) |
| 2606.25509 / 2607.15621 / 2604.24086 / 2511.20720 | fast–slow / asynchronous / early-exit VLA/LLM driving | 2025–26 | EXCL |
| 2209.09674 | Testing rare downstream safety violations via adaptive sampling of perception error models | 2022 | EXCL (testing) |
| 1704.07475 / 2107.14580 | Self-triggered communication / coverage control | 2017–21 | EXCL |
| Scholar hit (IEEE IoT-J 2026, Zhang, Yuan, Cao) | Event-Triggered NMPC for Energy-Aware UAV Obstacle Avoidance | 2026 | BG — title only (event-triggered NMPC, i.e. control triggering); not obtained, no open copy searched |
| all other unique arXiv hits (~470 of 544 in `search/all_unique.tsv`) | e.g. particle-physics "self-triggered" detectors, LLM serving, V2X MAC, VQA, video coding | — | EXCL by title (off-topic) |

## 3. Per-paper notes (full text read)

### N1 — Zhuyi: Perception Processing Rate Estimation for Safety in Autonomous Vehicles
Yu-Shun Hsiao, Siva Kumar Sastry Hari, Michał Filipiuk, Timothy Tsai, Michael B. Sullivan, Vijay Janapa Reddi, Vasu Singh, Stephen W. Keckler (Harvard, NVIDIA); DAC 2022 (pp. 289–294 per TAPAS ref [5]; PDF prints "© 2022 IEEE"); arXiv 2205.03347v1 (6 May 2022); pages read: 7/7 (p7 = references)
Status: USE (closest prior art to DART's safety-driven perception scheduler)

**Problem & setting:** Multi-camera automated car (NVIDIA AV stack + DRIVE Sim, 5 cameras). Compute demand of high-quality perception can exceed the in-vehicle SoC (p1, Fig. 1). Goal: estimate, continuously, the minimum per-camera frame-processing rate (FPR) that keeps the ego collision-free; use it as an online safety check and for work prioritisation.

**Method:** For each actor, find the maximum tolerable processing latency l such that, after a reaction time t_r = l + α (α = actor-confirmation delay modelled as K·(l − l0)), the ego can hard-brake (deceleration a_b = max(C3, C4·a0)) without violating (Eq. 1) d_e1 + d_e2 ≤ C1·s_n and (Eq. 2) C2·v_an ≥ v_en ≥ 0 at some future t_n; search by decreasing l from 1 s in 33 ms steps with a Newton-like update of t_n (Eq. 3) (p2). Uses predicted actor trajectories; multiple hypotheses aggregated by max/average/percentile (Eq. 4, p3). Per-camera FPR = 1/min over actors in the FOV of tolerable latency (Eq. 5, p3). Ego acceleration held constant during t_r (p2). Constants C1 = C2 = 0.9, C3 = 4.9 m/s², C4 = 1.1, K = 5 (p4). Deterministic: no state-estimation covariance, no unseen objects.

**Experiments & key quantitative results:** Nine highway/urban scenarios (cut-out, cut-in, vehicle following, etc.), ego 20–70 mph (Table 1, p4). Validation: run the AV at fixed FPR 1…30 and compare Zhuyi's estimate to the empirically found minimum required FPR (MRF) — "Results show that estimated FPR values are higher than MRF for all the scenarios" (p4). Table 1 (p4): e.g. Cut-out fast (40 mph) MRF 6, max(F_c1+F_c2+F_c3) = 32, fraction 0.36; Vehicle following (70 mph) MRF <1, fraction 0.36; Front & right activity 1 fraction 0.03. "The results show only 36% of the resources originally provisioned for perception are required at any point in all our experiments" (p5); "For some scenarios, only 3% of the resources are needed" (p5). Front camera of Cut-out fast: "the front camera processing requires 167 ms in some time-steps" (p5); side cameras ≥500 ms. Sensitivity (p6): streets FPR ≤ 2; highways "a maximum of only 5 FPR is sufficient for safe operation" for s_n = 100 m. Cost: "For processors offering 10+ GOPS, the Zhuyi model should execute within 2ms" (p6). Post-deployment run inside the NVIDIA stack produced latency estimates from perceived world model + predictions (Fig. 7, p5).

**Limitations (stated / observed):** Stated future work (p6): "extending the Zhuyi model to consider perception uncertainty", "accounting for occlusions in the world model, and incorporating yet-to-be-detected objects". Observed: (i) the rate is not actually varied per camera at runtime in the experiments — "As our framework only allows the same FPR settings for all the cameras in one experiment" (p4); the '36%' is a computed provisioning fraction, not a closed-loop run at adaptive rates; (ii) no formal guarantee (conservatism by constants, "which include margins for conservative estimation", p4); (iii) braking is the only safety manoeuvre; planner/controller is not modified or co-designed; (iv) cars on lanes (2-D, longitudinal/lateral), no UAV, no learned-depth noise model; (v) no energy measurement.

**Relation to DART:** Directly anticipates DART's core idea: a kinematics/braking-based maximum tolerable time without new perception → minimum perception rate, evaluated online per sensor. DART's scheduler differs/extends in: covariance growth of the obstacle estimate between updates (Zhuyi lists uncertainty as future work); a frontier term for objects beyond sensing range (Zhuyi lists "yet-to-be-detected objects" as future work); event-triggering of a single onboard learned-depth inference with its own latency instead of per-camera rate provisioning; coupling to the controller (MPC horizon/covariance resets, CBF inflation); closed-loop runs where the rate actually changes. Zhuyi is stronger than DART in: realistic industrial AV stack and multi-camera prioritisation, multi-hypothesis trajectory prediction, and per-actor prioritisation. DART must cite Zhuyi as the closest prior work and should not claim 'first safety-derived perception rate'.

**Citable statements:**
- Safety-derived minimum frame-processing rate has been proposed for AVs → p1 "quantifies the minimum safe FPR continuously in a driving scenario"
- Rate = inverse of tolerable latency → p1 "The reciprocal of the maximum tolerable latency is the minimum frame processing rate or FPR requirement for a camera sensor"
- Online use as safety monitor → p3 "check that the operating frame processing rate is meeting the minimum required rate for safe operation"
- Uncertainty and unseen objects not modelled (gap DART fills) → p6 "extending the Zhuyi model to consider perception uncertainty"; p6 "accounting for occlusions in the world model, and incorporating yet-to-be-detected objects"
- Large provisioning savings possible → p5 "The results show only 36% of the resources originally provisioned for perception are required at any point in all our experiments"
- Not evaluated with per-camera adaptive rates → p4 "As our framework only allows the same FPR settings for all the cameras in one experiment"

**Snowball candidates:** RoboRun (2021) [read as N6]; Suraksha (2021) [N3]; Driving Scenario Perception-Aware Computing System Design (ICCD 2020) [N4]; Safety Score (IV 2020); Domain-specific Approximation for Object Detection (IEEE Micro 2018); On a Formal Model of Safe and Scalable Self-driving Cars (RSS, 2017); The Safety Force Field (2019).

### N2 — TAPAS: Throughput-adaptive Perception for Autonomous Systems
Aman Vyas, Vasista Kodumagulla, Zain Taufique, Pasi Liljeberg, Anil Kanduri (Univ. Turku); "Accepted at ACM/IEEE … (ESWEEK-CODES), 2026" (p1); arXiv 2607.17317v1 (19 Jul 2026); pages read: 15/15
Status: USE (contrast: adaptive FPS for energy, explicitly not safety-derived)

**Problem & setting:** Perception pipeline (detection, segmentation, VO, "obstacle avoidance" DNNs) on a heterogeneous SoC (Jetson Orin NX: CPU/GPU/DLA). Claim: "existing perception strategies assume a fixed FPS" and static model-to-cluster mapping (p1).

**Method:** (i) Throughput estimator: per-frame Shannon spatial entropy of the detector's class map → discretised FPS target (Eqs. 2–4, p6); entropy "quantifies scene complexity based on the number of detected objects" (p6); in evaluation 3 levels 5/10/15 FPS (p3, p9). (ii) GRU-based PPO agent with a "Reward Reasoning Model" (LLM-based, Qwen2) maps workloads to clusters to meet the FPS target at minimum energy (pp. 6–8); re-mapping triggered when the FPS target changes by more than Δ (Alg. 2, p8–9). Variable throughput is emulated: "We emulate variable throughput by skipping an appropriate number of frames" (p9). Perception is decoupled from safety by design: "This separation decouples perception from safety-critical reasoning" (p2).

**Experiments & key quantitative results:** Offline KITTI test sequences and nuScenes (OOD) on Jetson Orin NX; baselines EE, OmniBoost, Band. Abstract (p1): "TAPAS achieves 93-100% throughput met rate while saving energy by 76%"; nuScenes "maintains 97% throughput met rate with 64% lower energy". Policy overhead "requiring only 2.3 ms latency and 45 mJ energy" (p10). Versus Band: "33–44% energy savings over Band (15 FPS) while maintaining 93–100% throughput met rate" (p13).

**Limitations:** No closed-loop control, no collision/safety metric; FPS target is a heuristic function of detected-object entropy, not of ego speed, distance, braking capability or latency; dataset replay only. Authors note that algorithmic knobs "can compromise the safety of the AS in dynamic environments due to reduced perception quality" (p3) — they avoid them, but give no safety argument for the FPS choice itself.

**Relation to DART:** Contrast/related work for 'adaptive perception rate for energy on edge accelerators'. DART's distinguishing features vs TAPAS: rate (triggering) derived from a physical safety bound (braking, closing speed, covariance growth, frontier), evaluated in closed loop with collision outcomes. TAPAS is stronger on real hardware energy measurement and multi-DNN accelerator mapping (DART only simulates accelerator energy). Not a baseline DART can run directly, but its 'scene-complexity → FPS' heuristic could be an ablation baseline (rate from obstacle count instead of risk).

**Citable statements:**
- Fixed-FPS perception is the norm in AS pipelines → p1 "existing perception strategies assume a fixed FPS"
- Adaptive FPS gives large energy savings on Jetson-class hardware → p1 "TAPAS achieves 93-100% throughput met rate while saving energy by 76%"
- Scene-complexity FPS targets are not tied to safety reasoning → p2 "This separation decouples perception from safety-critical reasoning"
- Adaptive rates emulated by frame skipping → p9 "We emulate variable throughput by skipping an appropriate number of frames"

**Snowball candidates:** Energy-efficient mobile robot control via run-time monitoring of environmental complexity and computing workload (IROS 2021); A coordinated approach to control mechanical and computing resources in mobile robots (T-RO 2025); Adaptive optimization of AV computational resources for performance and energy improvement (IROS 2021); SlimSLAM: an adaptive runtime for VI-SLAM (ASPLOS 2024); Context-aware multi-model object detection for diversely heterogeneous compute systems (DATE 2024); Continuous, real-time object detection on mobile devices without offloading (ICDCS 2020).

### N3 — Suraksha: A Framework to Analyze the Safety Implications of Perception Design Choices in AVs
Hengyu Zhao, Siva Kumar Sastry Hari, Timothy Tsai, Michael B. Sullivan, Stephen W. Keckler, Jishen Zhao (UCSD, NVIDIA); ISSRE 2021 (venue from author page cseweb.ucsd.edu/~jzhao and Zhuyi ref [17]; PDF has no venue line; Google Scholar also lists a differently titled version, 'Suraksha: A quantitative AV safety evaluation framework…', not read); non-arXiv author-hosted copy `files/suraksha-issre2021.pdf`; pages read: 12/12
Status: USE (background evidence that perception rate is the most safety-sensitive knob and is scenario dependent; design-time only)

**Problem & setting:** Industrial Level-2 AV stack (NVIDIA DRIVE, one front camera + one radar) in DRIVE Sim; design-time sweep of component parameters to quantify safety sensitivity. Motivating question (p1): "should the perception task provision lower camera frame per second (FPS) with a high accuracy obstacle perception model or higher camera FPS with a faster but slightly less accurate perception module?"

**Method:** Automated generation of AV versions (one parameter at a time; also pairs) × NCAP-inspired scenarios (vehicle following, cut-in, cut-out, jaywalking) labelled easy/moderate/hard by average braking deceleration (Eq. 1, p4). Parameters: camera FPS {"1, 2, 3, 5, 6, 10, 15, 30 (default)"} (Table II, p6), GPU frequency, INT8/FP16, model version; plus direct world-model corruption: positive/negative/random noise, perception delay of D frames every F frames, world-model loss (Eqs. 4–6, p6). Safety metric: minimum distance (collision if <3 m), plus L1 norms of trajectories/actuation; sensitivity = relative change between neighbouring settings (Eq. 3, p4).

**Experiments & key quantitative results:** Vehicle following: FPS "3 is tolerable for the easier scenario but at least 5 FPS" … "is required to remain safe for the harder scenario" (p7). "Camera FPS is the most safety sensitive parameter among" the studied SW/HW parameters (p8). Delay tolerance in hard scenarios: "significant delay of 50, 30, 10, and 30 frames, respectively," every 100 frames for following, cut-in, cut-out, jaywalking (p8). Abstract (p1): "tested AV system tolerates up to 10% perception noise and delay even in harder driving scenarios". "Finding 4: Limiting a perception parameter to its critical setting" (FPS = 10 for cut-out) reduces resource demand by 3× but removes tolerance to other degradations (p10). Simulations run twice ("run the experiments twice to analyze the effects", p6).

**Limitations:** Offline, design-time grid search (Zhuyi p6 notes it "could easily become infeasible in multi-camera setting"); one camera; non-deterministic simulator with two runs; no runtime adaptation, no formal bound, no estimation model.

**Relation to DART:** Supports DART's premise that (a) required perception rate is strongly scenario dependent and (b) fixed worst-case rates over-provision compute; also provides AV-domain numbers for tolerable rates/delays. Does NOT schedule perception at runtime — DART's scheduler is a runtime version of what Suraksha measures offline. Weaker than DART in that it gives no mechanism; stronger in using an industrial stack.

**Citable statements:**
- Reduced camera processing rate can be traded for power → p1 "small per-frame inaccuracies and reduced camera processing rate can be traded off for power savings or diversity"
- Required FPS depends on scenario difficulty → p7 "3 is tolerable for the easier scenario but at least 5 FPS"
- FPS is the most safety-sensitive perception knob → p8 "Camera FPS is the most safety sensitive parameter among"
- Fixing the rate at its critical value removes margins for other degradations → p10 "Finding 4: Limiting a perception parameter to its critical setting"

**Snowball candidates:** The Architectural Implications of Autonomous Driving: Constraints and Acceleration (ASPLOS 2018); AV-FUZZER (ISSRE 2020); Safety Score (IV 2020); Towards Safety-Aware Computing System Design in AVs (arXiv 2019).

### N4 — Driving Scenario Perception-Aware Computing System Design in Autonomous Vehicles
Hengyu Zhao, Yubo Zhang, Pingfan Meng, Hui Shi, Li Erran Li, Tiancheng Lou, Jishen Zhao (UCSD, Pony.ai); ICCD 2020 (author page: 38th ICCD, 'Best Paper in Track'; pp. 88–95 per TAPAS ref [7]); author-hosted copy `files/zhao-iccd-2020.pdf`; pages read: 8/8
Status: USE (peripheral: perception latency depends on scene; resource management triggered by timeouts — not safety-derived scheduling)

**Problem & setting:** Level-4 AV fleet field study (Pony.ai): "Our field study yields over 200 hours and 2000 miles of traces" (p3). LiDAR perception dominates latency: "the majority (74%) of computing system latency is consumed by perception" (p3).

**Method:** Regression latency model of each LiDAR-perception module vs a hierarchical obstacle-count map (Eq. 1–2, p4–5); offline exhaustive search of CPU/GPU allocation + priority plans per obstacle-distribution cluster; online: hardware counters detect continuous perception timeouts (h = 100), then match the current obstacle-distribution feature to a cluster and switch plans (Eq. 3–4, Fig. 6, pp. 5–6).

**Experiments & key quantitative results:** Latency model "provides high accuracy with an average MSE as low as 1.7 ×" 10⁻⁴ (p7). Trace-driven architecture simulation: "Resource Management reduces the latency averaged throughout our field study data by 2.4× and 35%, respectively; LiDAR perception latency is reduced by 2.6× and 45% on average" (p7) (vs CPU-only and CPU+GPU); hardware overhead <1% of system energy (p7).

**Limitations:** Safety is argued only qualitatively; the AV-simulator collision evaluation is mentioned (p6) but no collision results are reported in the paper; no adaptation of perception rate; trace-based simulation.

**Relation to DART:** Background only. Two useful observations: perception latency is state/scene dependent (DART treats latency as variable), and the 'time from entering sensing range' argument: the system "has limited time (typically within one or several sensor sampling intervals) to interpret an obstacle in the traffic after it enters the sensor-detectable region" (p3) — qualitative precursor of DART's frontier term. Does not do what DART does (no safety bound, no triggering, no control coupling).

**Citable statements:**
- Perception dominates AV compute latency and depends on surrounding obstacles → p1 "We observe that the perception module consumes the longest latency, and it is highly sensitive to surrounding obstacles"
- Limited reaction window after an obstacle enters sensing range → p3 "has limited time (typically within one or several sensor sampling intervals) to interpret an obstacle in the traffic after it enters the sensor-detectable region"
- Perception delay caused real emergencies → p3 "we encountered several safety emergencies, when the AV needed to perform a hardbrake due to the delay of LiDAR perception"

**Snowball candidates:** The Architectural Implications of Autonomous Driving (ASPLOS 2018); Probabilistic analysis of dynamic scenes and collision risk assessment to improve driving safety (2011); Model-based probabilistic collision detection in autonomous driving (2009).

### N5 — How Fast is Too Fast? The Role of Perception Latency in High-Speed Sense and Avoid
Davide Falanga, Suseong Kim, Davide Scaramuzza (UZH/ETH); IEEE RA-L (printed "PREPRINT VERSION. ACCEPTED JANUARY, 2019"; vol. 4 no. 2 pp. 1884–1891 per N2/N10 refs); lab-hosted copy rpg.ifi.uzh.ch/docs/RAL19_Falanga.pdf (not on arXiv); pages read: main paper 8/8 in full; supplementary material pp. 9–15 skimmed (S1–S3 read, S4–S8 sensor derivations skimmed)
Status: USE

**Problem & setting:** Robot (quadrotor case study) modelled as decoupled double integrators with bounded inputs, flying at constant longitudinal speed towards static obstacles that enter a sensing range s; it "therefore cannot change its longitudinal velocity to avoid obstacles" (p1). Latency τ is defined "as the interval between the time the obstacle enters the sensing area and the moment the robot's initiates the avoidance maneuver" (p3).

**Method:** Time to contact t_c = s/v̂1; time-optimal bang-bang lateral avoidance time t_s = 2·sqrt(r/ū2); safety iff s/v̂1 − τ ≥ 2·sqrt(r/ū2) (Eq. 7, p4) ⇒ maximum tolerable latency τ̄ = s/v̂1 − 2·sqrt(r/ū2) (Eq. 8) and maximum speed v̄1 = s/(τ + 2·sqrt(r/ū2)) (Eq. 9, p4). Applied to monocular/stereo/event cameras with derived sensing ranges and latencies (pp. 5–6, suppl.). Ideal assumptions: "we assume that there is no uncertainty" in obstacle detection, illumination, measurements or dynamics (p2). Braking is considered only in suppl. S1 and discarded: "we consider only the case where the robot does not brake to prevent the collision, but rather executes a lateral avoidance maneuver" (p9).

**Experiments & key quantitative results:** Table I (p7), e.g. monocular frame camera s = 2.0 m, τ = 0.026 s: max speed 3.48 / 5.37 / 7.38 / 13.47 m/s for ū2 = 10 / 25 / 50 / 200 m/s² (r = 0.75 m); stereo s = 8.0 m, τ = 0.017 s: 14.17 / 22.03 / 30.57 / 57.50 m/s. Sensitivity (suppl. p9): v̄1 "is very sensitive to the sensing range". Real experiment: event-camera quadrotor dodging a ball; "The ball was thrown with a speed spanning between" 5 and 9 m/s, t_c 0.22–0.40 s, avoidance time 0.17–0.25 s, sensing range 2 m (p8).

**Limitations:** Design-time analysis (no runtime rate adaptation); single static obstacle (multi-obstacle only heuristically, suppl. S3); perfect detection, perfect model; no state-estimation uncertainty; latency is a fixed parameter; no controller with formal safety filter.

**Relation to DART:** Foundational for DART's safe-open-loop-time reasoning: tolerable latency is a function of speed, sensing range and actuation limits. DART's braking-distance/closing-speed bound plays the role of Eq. 8 but (i) is evaluated online, (ii) includes estimation covariance growth, (iii) includes a frontier (sensing-range) term for unseen obstacles — the s/v̂1 term of Eq. 8 is essentially that frontier argument, so DART's frontier term should be credited to this line of reasoning (and to RoboRun N6). Falanga is stronger in having real high-speed hardware experiments and closed-form analysis.

**Citable statements:**
- Tolerable latency depends on speed, sensing range and agility → p1 "We show how the maximum latency that the robot can tolerate to guarantee safety is related to the desired speed, the range of its sensing pipeline, and the actuation limitations of the platform"
- Perception latency in robots spans tens to hundreds of ms → p1 "can vary from tens up to hundreds of milli-seconds"
- Higher speed makes latency more critical → p4 "the importance of low latency increases as the navigation speed increases"
- Analysis ignores detection uncertainty (gap) → p2 "we assume that there is no uncertainty"

**Snowball candidates:** Speed-range dilemmas for vision-based navigation in unstructured terrain (2007); Real-time camera tracking: When is high frame-rate best? (ECCV 2012); Predicting away robot control latency (2004); Dynamics and system performance of visual servoing (ICRA 2000); Bayesian learning for safe high-speed navigation in unknown environments (ISRR 2015).

### N6 — RoboRun: A Robot Runtime to Exploit Spatial Heterogeneity
Behzad Boroujerdian, Radhika Ghosal, Jonathan Cruz, Brian Plancher, Vijay Janapa Reddi (UT Austin, Harvard); DAC (2021 per Zhuyi ref [1]; TAPAS ref [8] says 2022); arXiv 2108.13354v1 (30 Aug 2021); pages read: 7/7
Status: USE (very close in spirit: safety deadline from visibility + stopping distance governs perception compute)

**Problem & setting:** MAV navigation pipeline (point cloud → OctoMap → RRT* → smoothing → PID) in AirSim/Unreal hardware-in-the-loop; static worst-case compute settings make the drone slow. Key definitions: "decision deadline is the maximum latency that can be tolerated while ensuring a collision-free flight" and "Thus for safety, decision latency must always be less than the decision deadline" (p2).

**Method:** Governor computes a time budget (Eq. 1, p4): budget = (d − d_stop(v))/v with d = space visibility and d_stop(v) "the distance the MAV needs to stop when traveling at velocity v" (empirical quadratic fit, Eq. 2, "2% MSE"); Algorithm 1 accumulates budgets over upcoming waypoints because "Equation (1) assumes a fixed velocity and visibility for the duration of the time budget" (p4). A solver picks per-stage precision (voxel size) and volume knobs so that modelled latency fits the budget, subject to gap/obstacle-distance constraints (Eq. 3–4, p4). Rate is adapted implicitly: "A compute subsystem that adjusts to such heterogeneity can modulate its decision rate and improve performance" (p1).

**Experiments & key quantitative results:** 27 generated environments (p4–5): "RoboRun improves velocity by 5X (from 0.4 m/s to 2.5 m/s)", mission time "by as much as 4.5X (from 2093 (s) to 465 (s))", energy "by 4X (from 1000 kJ to 257 kJ)" (p5); CPU utilisation −36%. "compute consumes less than 0.05% of the overall MAV's energy" (p5) — energy gain comes from faster flight, not from compute savings. End-to-end latency "with a median latency reduction of 11X" (p6); "Both designs pay a fixed 210 (ms) point cloud latency, and RoboRun pays an extra 50 (ms) runtime latency" (p6).

**Limitations:** Safety only empirical: "the maximum velocity is chosen experimentally such that at least 80% of flights are collision-free" (p4); deterministic budget (no estimation uncertainty, no dynamic obstacles); adapts how much to compute, not when to trigger perception; stopping distance fitted in simulation.

**Relation to DART:** Strong precedent for DART's scheduler terms: visibility (≈ DART frontier/sensing range) minus stopping distance, divided by speed, = tolerable time without a new decision. Differences: DART (a) triggers the perception inference itself (event-triggered) rather than shrinking its precision, (b) adds covariance growth and closing speed of tracked (possibly moving) obstacles, (c) couples to a CBF/MPC with uncertainty inflation, (d) explicitly targets learned-depth inference latency/energy on an accelerator. RoboRun is stronger on full-stack HIL drone missions and per-stage latency models. DART should cite RoboRun for the 'deadline = (visibility − stopping distance)/speed' construction.

**Citable statements:**
- Safety-derived decision deadline for drones → p2 "decision deadline is the maximum latency that can be tolerated while ensuring a collision-free flight"
- Deadline built from stopping distance and visibility → p4 "the distance the MAV needs to stop when traveling at velocity v"
- Safety established only empirically → p4 "the maximum velocity is chosen experimentally such that at least 80% of flights are collision-free"
- Compute energy is negligible vs flight energy on large MAVs → p5 "compute consumes less than 0.05% of the overall MAV's energy" (caveat for DART's energy claims)

**Snowball candidates:** Opportunistic intermittent control with safety guarantees for autonomous systems (DAC 2020) [read as N11]; High speed navigation for quadrotors with limited onboard sensing (ICRA 2016); Balancing actuation and computing energy in motion planning (ICRA 2020); MAVBench (MICRO 2018); Analysis of deadline assignment methods in distributed real-time systems (2004).

### N7 — MM-BEV: Enhancing Timeliness by Computing Where and When it Matters
Liangkai Liu, Kang G. Shin (Texas Tech, U. Michigan); arXiv 2608.15437v1 (15 Aug 2026), venue not printed; pages read: 12/12
Status: USE (related: braking-distance/TTC criticality for perception compute; perception-only evaluation)

**Problem & setting:** Real-time LiDAR+camera BEV detection (BEVFusion) on limited GPU; sensors asynchronous; most objects irrelevant to the planner's next action.

**Method:** "decomposes perception into a mandatory part" — "safety-critical objects within the ego's braking distance and short time-to-collision (TTC)" — and an optional part (p1). Geometry-critical = inside forward braking cone with d_max(v) = max(d_min, v²/(2a_brake)) (Eqs. 3–4, p5); safety-critical = TTC below class thresholds "1.5 s for vulnerable road users (pedestrians, cyclists) and 2.5 s for motorized objects" (p6). Temporal ROIs from motion-extrapolated previous detections; ROI-aware camera crop/LiDAR voxelisation; ego-motion compensation of LiDAR sweeps; coordinator adapts sweep count/resolution from speed, density and TTC; periodic or dynamics-triggered keyframes ("a full-scene pass that refreshes the detection cache and bounds the worst-case staleness of the temporal prior", p7); asynchronous scheduler that "skips stale frames to keep end-to-end (e2e) latency low" (p1).

**Experiments & key quantitative results:** nuScenes replay in ROS (p8): "reduces inference latency by 1.96× and e2e latency by 2.93×" (p1); "only 11.0% of all annotations are mandatory" (p4); "Geometry-critical recall is preserved exactly" (p9) — by construction; safety-critical recall 94.9 → 94.7% (Table II, p9). Husky + Jetson AGX Orin: adaptive keyframe interval K̄ = 2.83, mean per-frame latency 43.2 ms, "a 2.11× reduction over the dense baseline" (p10).

**Limitations:** Open-loop perception evaluation ("We evaluate MM-BEV end-to-end on the nuScenes dataset replayed through ROS", p8; robot run measures latency only); keyframe interval from speed/cluster shift, not from a safety bound; no control or collision outcomes; new objects outside ROIs only caught at keyframes (acknowledged risk of "stale context", p7).

**Relation to DART:** Shares the ingredient 'braking distance + TTC define what perception is safety-critical', and a 'bounded staleness' keyframe idea, but applies it to where to compute within a frame (and keyframe frequency heuristically), not to a certified inter-perception interval. DART's scheduler gives an explicit maximum open-loop time and closes the loop with control. MM-BEV is stronger on real perception pipeline engineering and real-robot latency measurement.

**Citable statements:**
- Braking-distance/TTC-based criticality used to prioritise perception compute → p1 "safety-critical objects within the ego's braking distance and short time-to-collision (TTC)"
- Most detected objects are not safety-critical → p4 "only 11.0% of all annotations are mandatory"
- Keyframes bound staleness of ROI-based perception → p7 "a full-scene pass that refreshes the detection cache and bounds the worst-case staleness of the temporal prior"

**Snowball candidates:** RT-BEV: Enhancing real-time BEV perception for AVs (RTSS 2024); Prophet: predictable real-time perception pipeline for AVs (RTSS 2022); FLEX: adaptive task batch scheduling with elastic fusion (RTSS 2024); Towards streaming perception (ECCV 2020); Worst-case latency analysis of message synchronization in ROS (RTSS 2023).

### N8 — Self-triggered Control for Safety Critical Systems using Control Barrier Functions
Guang Yang, Calin Belta, Roberto Tron (Boston University); ACC 2019 pp. 4454–4459 (per N9 ref [11]); arXiv 1903.03692v1 (8 Mar 2019); pages read: 7/7
Status: USE (formal analogue of 'safe open-loop time', for control updates)

**Problem & setting:** CLF-CBF QP controller implemented with zero-order hold on a digital platform; with periodic updates "the system could violate the safety constraints in between two sampled time instances" (p1).

**Method:** "Central to our approach is the novel notion of safe period, which enforces a strong safety guarantee for implementing ZOH control" (p1). A Lipschitz bound on the trajectory ball r̄(t) (Prop. 1, p3) yields a lower bound on the ECBF constraint ζ(t) (Eq. 17, p4); τ_CBF = root of the bound (min over constraints, Eq. 18); τ_CLF from a descent-lemma bound (Eqs. 20–21); next update t_{k+1} = t_k + min(τ_CBF, τ_CLF) (Alg. 1, p5); no Zeno near equilibrium (Prop. 2). "we do not require an explicit integration of the dynamics" (p3). Perfect state knowledge at each update.

**Experiments & key quantitative results:** Double integrator with box constraints (p5–6): self-triggered controller stays safe; periodic (t_p = 0.75 s) "violates x1,min constraint for t ∈ [3, 4]" (p6); "the update interval for self-triggered controller becomes a lot faster as the system approaches to the unsafe region" (p6); "the CLF update period converges to 0.3166s" (p6); QP time "around 0.0019s" (p6).

**Limitations:** Stated: "the CLF-CBF controller relies on an accurate system model to work well" and "the effect of external disturbances will also be studied" (p6). Observed: no measurement noise, no perception latency, no unknown obstacles; only a toy double-integrator example.

**Relation to DART:** Gives the control-theoretic template for DART's trigger: compute, from current state and a bound on future evolution, the longest interval for which the safety constraint provably holds, and schedule the next update there. DART applies the idea to perception (new measurements) rather than control updates, and adds latency, covariance growth and an unseen-obstacle frontier. DART should cite it (and N9) to show the triggering principle is established and claim novelty only for the perception/uncertainty/frontier instantiation.

**Citable statements:**
- Periodic sampling can violate CBF safety between samples → p1 "the system could violate the safety constraints in between two sampled time instances"
- Safe-period-based self-triggering → p1 "Central to our approach is the novel notion of safe period, which enforces a strong safety guarantee for implementing ZOH control"
- Trigger interval shrinks near the unsafe set (same qualitative behaviour expected of DART's scheduler) → p6 "the update interval for self-triggered controller becomes a lot faster as the system approaches to the unsafe region"

**Snowball candidates:** To sample or not to sample: Self-triggered control for nonlinear systems (TAC 2010); Input-to-state stability of self-triggered control systems (CDC 2009); The self triggered task model for real-time control systems (RTSS WiP 2003); Robustness of control barrier functions for safety critical control (2016).

### N9 — Compiling Spatial Certificates into Temporal Contracts for Latency-Aware Control (CIPS)
Avinash Malik (Univ. Auckland); arXiv 2608.25228v1 (25 Aug 2026), venue not printed; pages read: 6/6
Status: USE (closest formal treatment of 'remaining safe time vs computation latency')

**Problem & setting:** Sampled-data CPS where regenerating a control law/certificate takes latency L_reg; schedulers need to know whether the current certificate stays valid long enough.

**Method:** Offline "compiling heterogeneous spatial safety certificates into normalized" unit-rate temporal contracts (p1): Φ_I(x) = ∫_{h_min}^{h(x)} ds/α(s) where ḣ ≥ −α(h) (Thm 3.1, p2); contract axiom Φ(x(t0+s)) ≥ Φ(x(t0)) − s (Axiom 2, p2), so Φ is a certified lower bound on remaining safe time. Runtime engine (Alg. 1, p3) samples every Δt; ρ_trigger = L_reg + 2Δt is "The threshold to trigger regeneration" (p3); fallback when Φ ≤ Δt; Theorem 5.1/5.2 (p4) prove safety under bounded latency; the design is "exposing a deterministic, O(1) temporal budget to a generic sampled-data scheduler" (p1); liveness not guaranteed: "it does not guarantee regeneration liveness" (p3).

**Experiments & key quantitative results:** ACC leader–follower benchmark with a_b = 6 m/s², d_min = 3 m, "a measurement uncertainty margin η = 0.5 m" (p4), d_robust = 5.55 m incl. a braking/latency buffer. Tables III–IV (p5): e.g. L_reg = 50 ms, Δt = 5 ms: periodic 454 regenerations (all unnecessary, E_lat 9.2%), Boolean/Spatial-ETC 1 violation each (min margin −12.45 / −8.05 m), LA-ETC and CIPS 0 violations (min margin 0.44 m). Overhead: "60.5× reduction in micro-architectural evaluation overhead compared to latency-aware event-triggered control (LA-ETC)" (p1); 2 µs vs 121 µs (Table V, p5). Boolean/spatial triggers fail: "Both suffer systemic safety violations because they lack temporal latency awareness" (p5).

**Limitations:** Stated future work: "Adapting contracts to handle probabilistic safety bounds under process noise and environmental uncertainty" (p6). Observed: deterministic 1-D example; uncertainty only as a constant margin η; trigger is for controller regeneration, not perception; no unseen obstacles; single-author preprint, small benchmark.

**Relation to DART:** Very close to DART's 'safe open-loop time with latency': both compute a certified remaining time and trigger work when it falls below (latency + sampling margin). CIPS shows (as DART should) that a purely spatial trigger without latency awareness fails. Gaps DART fills: perception (new information) rather than control regeneration; stochastic covariance growth and time-varying inflation d(t) (CIPS lists probabilistic bounds as future work); frontier for unseen obstacles; 3-D quadrotor closed loop with learned-depth noise. DART must cite CIPS and should compare its trigger condition with Φ ≤ L_reg + 2Δt.

**Citable statements:**
- Remaining safe time as a schedulable budget → p1 "exposing a deterministic, O(1) temporal budget to a generic sampled-data scheduler"
- Latency-unaware (spatial/Boolean) triggers cause violations → p5 "Both suffer systemic safety violations because they lack temporal latency awareness"
- Uncertainty treatment is open → p6 "Adapting contracts to handle probabilistic safety bounds under process noise and environmental uncertainty"

**Snowball candidates:** Safety of sampled-data systems with CBFs via approximate discrete time models (CDC 2022); Towards a framework for realizable safety critical control through active set invariance (ICCPS 2018); Real-time status: How often should one update? (INFOCOM 2012); The simplex architecture for safe online control system upgrades (ACC 1998); Event-triggered real-time scheduling of stabilizing control tasks (TAC 2007).

### N10 — Latency vs precision: stability preserving perception scheduling
Rodrigo Aldana-López, Rosario Aragüés, Carlos Sagüés (Univ. Zaragoza); Automatica vol. 155, 111123, 2023, doi 10.1016/j.automatica.2023.111123 (printed p1); arXiv 2401.13585v1 (24 Jan 2024); pages read: 16/16 (Appendix proofs C.1–C.9 read quickly)
Status: USE (perception scheduling with latency–noise trade-off, estimation and stability; no safety constraints)

**Problem & setting:** Linear stochastic robot model, ZOH control, D perception modes with latency Δ_p and noise Σ_p; "There is a compromise between perception latency, precision for the overall robotic system, and computational resource usage" (p1). A measurement of the state at capture time τ_k becomes available at τ_k + Δ_{p_k} and "we set τk+1 = τk + ∆pk" (p3), i.e. one perception job in flight; "The perception latencies chosen through time dictate the sampling instants for perception and control" (p2).

**Method:** Mean dynamics become a switched system x̄[k+1] = Λ(Δ_{p_k}) x̄[k] (Eq. 3, p4); stabilising state-dependent schedule selection from admissible sets of finite schedules (Def. 5, Alg. 1 'SP2', Thm 8, p5); exact admissibility check via global solution of a non-convex program (Thm 9, Algs. 3–5, pp. 6–8); cost = attention/CPU penalty + expected quadratic state cost incl. tr(QP(t)) under a schedule (Eq. 2, A.6); "Problem 3 is NP-hard" (p8); dynamic programming over schedule sets with look-ahead (Alg. 6, p9) propagates mean and covariance P(t) along each candidate schedule (line 7). Kalman-type predictor with latency (Prop. 23, p11). Only asymptotic stability of E{x}: "it is more practical to ensure convergence of E{x(t)} towards the origin" (p3).

**Experiments & key quantitative results:** Double integrator (Δ = 0.01/0.1 s): "the admissibility value was obtained to be R = 1.142" (p10); SP2 lowers sample-path cost vs static schedules (Fig. 2, histograms; no table). 3-D particle robot with Δ1 = 1/30 s, Δ2 = 4/30 s and Σ(Δ) = (b/Δ)I: cost lower than static schedules and "the average CPU load LOAD is reduced with respect to the worst case value of 90%" (p11) (numbers only in histograms).

**Limitations:** Stated: "These results motivate future research on this problem with other noise models for the perception method or imperfect timing in the perception latency" (p11). Observed: no obstacles/safety constraints, stability in expectation only; linear model; schedule chooses among fixed modes (rate is implied by latency), not 'skip perception'; simulation only.

**Relation to DART:** Supports DART component 2 (measurement defined at capture time, available after latency; one frame in flight) and component 4 (propagating covariance along a perception schedule inside a look-ahead optimisation — analogous to DART's expected covariance resets in MPC). It contrasts with DART's objective: N10 trades precision vs latency for stability/cost, DART trades perception frequency vs a safety bound. N10 is stronger in formal stability analysis and complexity results.

**Citable statements:**
- Latency–precision–compute trade-off in robot perception → p1 "There is a compromise between perception latency, precision for the overall robotic system, and computational resource usage"
- Perception latency sets the sampling instants → p2 "The perception latencies chosen through time dictate the sampling instants for perception and control"
- Optimal perception scheduling is computationally hard → p8 "Problem 3 is NP-hard"

**Snowball candidates:** Anytime computation and control for autonomous systems (TCST 2021); From sensor to processing networks: optimal estimation with computation and communication latency (IFAC 2020); Attention vs. precision: latency scheduling for uncertainty resilient control systems (CDC 2020); Latency-reliability tradeoffs for state estimation (TAC 2021); Recent developments on the stability of systems with aperiodic sampling (Automatica 2017).

### N11 — Opportunistic Intermittent Control with Safety Guarantees for Autonomous Systems
Chao Huang, Shichao Xu, Zhilu Wang, Shuyue Lan, Wenchao Li, Qi Zhu (Northwestern, BU); DAC 2020 (per N6 ref [7]); arXiv 2005.03726v1 (7 May 2020); pages read: 6/6
Status: USE (related: safety-certified skipping of computation; skips control, not perception)

**Problem & setting:** Discrete LTI system with bounded disturbance ("w is a bounded perturbation", p2) and an existing safe controller κ (robust MPC); goal: "opportunistically skip certain control computation and actuation to save actuation energy and computational resources without compromising system safety" (p1).

**Method:** Robust control invariant set X_I and strengthened safe set X′ = B(X_I, 0) ∩ X_I; inside X′ the system "will stay within XI (and thus controllable and safe) for the next time step, regardless of the skipping choice at the current step" (p2); outside, κ must run (Thm 1, p3). Skip decisions by MIP (model-based) or double-DQN (learned) (pp. 3–4). The state is still sensed every step (Alg. 1 line 4: "Monitor the current state x(t) via sensor inputs", p3).

**Experiments & key quantitative results:** ACC in SUMO, 500 random cases (p5): bang-bang skipping −16.28% fuel; "the average fuel consumption of our DRL-based opportunistic intermittent-control is reduced by 23.83%"; "the average number of steps that skip the RMPC computation is 79.4" out of 100, ≈60% computation-time saving (p5).

**Limitations:** Stated: "Future work includes addressing more complex control systems beyond LTI" (p6). Observed: one-step look-ahead certificate; full-state measurement every step; 1-D ACC only.

**Relation to DART:** Shows that safety-certified skipping of *control* computation with a set-based monitor is established; DART's contribution is skipping *perception* (no new measurements) over multi-step open-loop horizons, which requires uncertainty growth and unseen-obstacle reasoning absent here.

**Citable statements:**
- Safety-guaranteed skipping of computation exists for control → p1 "opportunistically skip certain control computation and actuation to save actuation energy and computational resources without compromising system safety"
- Sensing still every step (gap) → p3 "Monitor the current state x(t) via sensor inputs"

**Snowball candidates:** From iteration to system failure: fitness of periodic weakly-hard systems (ECRTS 2019); Formal verification of weakly-hard systems (HSCC 2019); Formal analysis of timing effects on closed-loop properties of control software (RTSS 2014).

### N12 — Energy-Efficient Autonomous Driving with Adaptive Perception and Robust Decision (EneAD)
Yuyang Xia, Zibo Liang, Liwei Deng, Yan Zhao, Han Su, Kai Zheng (UESTC, Aalborg); arXiv 2510.25205v1 (29 Oct 2025), venue not printed; pages read: 14/14
Status: USE (adaptive perception framerate in closed-loop driving, scenario-classification driven, not safety-derived)

**Problem & setting:** Perception energy limits EV range; "We argue that such high framerates are not always necessary in all scenarios" (p2). CARLA closed-loop lane-change/velocity RL driving with vehicles only: "For simplification, we do not consider pedestrians, traffic cones, or other obstacles" (p3).

**Method:** Knobs = perception model (SparseBEV … BEVFusion-e), framerate as frames to skip "{0, 1, 2, 3, 4, 5, 6, 7, 8, 9} frames" at 20 fps capture (p6), and interpolation of skipped frames (linear / trajectory prediction). Multi-objective Bayesian optimisation with meta-surrogate finds per-difficulty-level configurations meeting an NDS accuracy target (Alg. 1, p7). A Swin-T image classifier assigns perception-difficulty level; "the classification model is based solely on image data" (p4); with MC-dropout, "a scenario with a large uncertainty will be treated as the one with the highest difficulty" (p2). Robust RL decision with a behaviour-cloning-like regulariser (Eq. 6, p8).

**Experiments & key quantitative results:** "EneAD can reduce perception consumption by 1.9× to 3.5× and thus improve driving range by 3.9% to 8.5%" (p1); "None of the methods cause any collision in the test phase" (p10); TTC-R 2.13% vs 3.45% for RBP-DQN (Table IV, p12). Tuned configurations (Table III, p12): difficulty levels 1–4 → SparseBev/SparseFusion/SparseFusion/BevFusion-e with 5/2/0/0 skipped frames. Uncertain classifications: "35.6% of the uncertain results are overestimated, 52.1% are underestimated, and 12.3% are correct" (p11); "the system switches configurations an average of 2.3 times per kilometer" (p12). Energy computed from FLOPs (p3), not measured.

**Limitations:** Rate chosen by appearance-based difficulty (weather/lighting/density) and an accuracy target, not by ego speed/distance/braking; no guarantee; no pedestrians/static obstacles; energy from FLOP counts.

**Relation to DART:** Closest closed-loop example of 'skip perception frames to save energy' with a downstream controller, but the skip rate is set per scene class offline, not by a safety bound computed online; uncertainty is classifier uncertainty, not state-estimate covariance. A useful baseline idea for DART (fixed skip per difficulty class).

**Citable statements:**
- High perception framerates are not always needed → p2 "We argue that such high framerates are not always necessary in all scenarios"
- Frame-skipping knob for energy saving → p6 "{0, 1, 2, 3, 4, 5, 6, 7, 8, 9} frames"
- Energy savings with maintained safety (in their benchmark) → p1 "EneAD can reduce perception consumption by 1.9× to 3.5× and thus improve driving range by 3.9% to 8.5%"

**Snowball candidates:** EcoFusion: Energy-aware adaptive sensor fusion (DAC 2022); SAGE: split-architecture methodology for efficient end-to-end AV control (TECS 2021); Are we ready for vision-centric driving streaming perception? the ASAP benchmark (CVPR 2023); NoScope (VLDB 2017).

---

## 4. Novelty positioning (strictly from the 12 papers read above)

**Component 1 — Delay-aware capture-time update (pose buffer; KF update at capture time; one frame in flight).**
* Already done in what I read: N10 models each measurement as taken at τ_k and available at τ_k + Δ, with the next capture at completion (one job in flight), and a latency-aware Kalman predictor (p3, p11). N7 ego-motion-compensates multi-sweep LiDAR to a common reference time and processes only the freshest bundle (pp. 6–8). N9 builds latency L_reg into the trigger margin (p3). N5/N6 treat latency only as a scalar budget.
* Not done in this group: capture-time updates for obstacles extracted from a learned monocular depth network with per-frame affine/scale error on a UAV. Candidly, delay-compensated/out-of-sequence filtering is a standard technique (outside this group's scope; see latency group g1); DART should present component 1 as an enabling engineering choice, not as a novelty claim.

**Component 2 — Safety-driven perception scheduler (safe open-loop time from braking distance, closing speed, covariance growth, frontier; trigger inference only when needed).**
* Already done:
  - Safety-derived minimum perception rate from braking kinematics, per sensor, online: **N1 Zhuyi** (p1 Eq. 1–5 pp. 2–3; online safety check p3). This is the closest prior art and pre-empts the generic claim 'derive the perception rate from safety'.
  - Safety deadline = (visibility − stopping distance)/speed for a drone, used to adapt perception/planning compute: **N6 RoboRun** (p4 Eq. 1). Its visibility term is the deterministic counterpart of DART's frontier term.
  - Closed-form tolerable latency from sensing range, speed and agility: **N5** (p4 Eq. 8).
  - Formal 'remaining safe time' and trigger-before-expiry logic: **N8** safe period τ_CBF (p1, p3–5) and **N9** persistence Φ with trigger Φ ≤ L_reg + 2Δt and a safety theorem (pp. 2–4).
  - Safety-certified skipping of computation (control, not perception): **N11** (p2–3).
  - Adaptive perception FPS/frame skipping for energy (not safety-derived): **N2** (p6, p9), **N12** (p6, Table III p12), **N7** (keyframe interval, p10).
* What appears NOT done in the papers read: (a) a perception trigger whose safe open-loop time explicitly includes **growth of the estimation covariance** of tracked obstacles (N1 p6 and N9 p6 list uncertainty as future work; N5 p2 assumes none; N6 deterministic); (b) a **frontier term for not-yet-detected obstacles** inside a runtime trigger (N1 p6 lists "yet-to-be-detected objects" as future work; N6 uses visibility in a compute deadline but not to trigger perception; N5 is design-time); (c) **event-triggered execution of the perception inference itself** in closed loop with the measured savings in inferences/energy and the collision outcome (N1 validated at fixed FPR, p4; N2/N7 open-loop; N12 rate per scene class; N11 skips control while sensing every step); (d) a quadrotor with **learned monocular depth** as the sensor. Honest summary: the principle (safety-derived perception rate; remaining-safe-time triggering) is established; DART's novelty is the uncertainty- and frontier-aware, latency-aware instantiation for triggering learned-depth inference on a UAV, evaluated in closed loop.
* Explicit comparison with Zhuyi (requested): Zhuyi computes, per actor, the largest latency l such that braking after t_r = l + α keeps distance/velocity constraints with conservatism constants (p2), then FPR = 1/min_l over actors in a camera's FOV (p3, Eq. 5). DART's scheduler is the same type of kinematic 'how long may I go without fresh perception' bound, but: (i) DART adds covariance growth (Zhuyi: none; future work p6); (ii) DART adds a sensing-range frontier for unseen obstacles (Zhuyi: future work p6); (iii) DART triggers inference events and accounts for the triggered inference's own latency, whereas Zhuyi outputs a rate requirement and was validated only by fixed-rate sweeps (p4); (iv) DART couples the bound with its controller (CBF inflation, MPC covariance resets); Zhuyi leaves planning unchanged. Zhuyi is ahead of DART on multi-camera prioritisation, multi-hypothesis prediction and an industrial stack. DART should present itself as 'Zhuyi-style safety-derived perception timing, extended to uncertainty, unseen space and closed-loop triggering on a compute-limited UAV', not as the first safety-derived perception rate.

**Component 3 — Adaptive-horizon MPC (condensed QP, tangent half-spaces, DT-CBF rows, covariance-inflated radii, expected covariance reset at expected measurement times).**
* Already done (partially): N10 propagates mean and covariance along candidate perception schedules inside a look-ahead dynamic program and optimises a cost containing tr(QP(t)) (Alg. 6, p9) — i.e. 'expected covariance under a perception schedule' is used in planning, though for an LQ cost without obstacles. N6 accumulates time budgets over upcoming waypoints (Alg. 1, p4). N11 uses a finite-horizon MIP over skip decisions (Eq. 6, p4).
* Not found in what I read: an MPC whose horizon adapts to the perception schedule and whose obstacle constraints use radii inflated by covariance that resets at the expected next measurement time. This group did not search the MPC literature exhaustively, so I can only say it is not covered by these 12 papers.

**Component 4 — Braking-distance CBF safety filter with time-varying inflation d(t) from covariance growth.**
* Already done (related): N9's certificate uses a braking + reaction-latency buffer and a constant measurement margin η = 0.5 m (p4); N1's safety constraint is hard-braking distance with conservative constants (p2, p4); N7 uses braking distance d_max = max(d_min, v²/2a) for criticality (p5); N8 provides ZOH/sampled-data CBF safety via safe periods (p3–5).
* Not found in what I read: barrier inflation that grows with the estimate covariance between perception events and is tied to the same model used by the perception trigger. Uncertainty-aware CBFs exist in other groups' literature (g4/g6), so the novelty is the coupling with the scheduler, not the CBF itself.

**Overall (candid):** No single read paper combines all of DART's pieces, but every individual idea has a clear precursor: safety-derived perception rate (N1), visibility/stopping-distance deadlines on drones (N6, N5), safe-period / remaining-time triggering with latency (N8, N9), safety-certified skipping (N11), covariance propagation along perception schedules (N10), energy-driven adaptive FPS (N2, N12, N7). DART's defensible contribution is the integration: one uncertainty model (covariance growth) and one sensing-range frontier feeding both (i) the event trigger for latency-bearing learned-depth inference and (ii) the controller's MPC/CBF constraints, evaluated in closed loop on a UAV. DART is weaker than several of these works on real hardware (N5, N6 HIL, N7, N2) and on formal proofs (N8, N9, N10); reviewers will likely ask for a formal statement of the scheduler's guarantee (cf. N9 Thm 5.1–5.2) and for comparison with a Zhuyi-style rate rule and a fixed-skip/scene-complexity rule (N2, N12) as baselines.

## 5. Group synthesis
* A safety-derived *minimum perception rate* has been published (N1, DAC 2022): per-actor tolerable latency from hard-braking kinematics → per-camera FPR; it is the closest prior art to DART's scheduler and must be cited and compared.
* Tolerable perception latency as a function of speed, sensing range/visibility and stopping capability is well established for drones (N5 closed form; N6 runtime deadline = (visibility − stopping distance)/speed), but treated deterministically.
* Formal 'remaining safe time' triggering exists for control updates (N8 safe period; N9 temporal persistence with latency-aware trigger and safety theorem) and for safety-certified skipping of control (N11); none of these skip *perception*.
* Adaptive perception rate for energy is active (N2 entropy→FPS; N12 difficulty class→frame skip; N7 keyframe interval), but rates come from scene complexity/appearance, not from a safety bound, and evaluations are mostly open-loop perception (N2, N7) or without formal guarantees (N12).
* Empirical AV studies show the required rate is scenario dependent and FPS is the most safety-sensitive perception knob (N3), and that perception latency depends on obstacle configuration (N4).
* Estimation-aware perception scheduling (latency/noise modes, covariance propagation, stability) exists (N10) but without obstacles or safety constraints.
* Open gap DART can fill (evidence: N1 p6, N9 p6, N5 p2): runtime perception triggering whose safe open-loop time includes estimation-covariance growth and a frontier for yet-unseen obstacles, accounts for inference latency, and is co-designed with an uncertainty-inflated MPC/CBF — demonstrated in closed loop for a compute-limited UAV with learned monocular depth.
* Weak points to anticipate: simulation-only (vs. hardware in N2, N5, N6-HIL, N7); compute energy may be a small share of MAV energy (N6 p5 "less than 0.05%"), so DART should argue savings in accelerator availability/thermal/battery terms carefully; formal guarantee of the trigger should be stated (cf. N8, N9).
* Not obtained (NEED-USER-DOWNLOAD if wanted): Gog et al., "D3: A Dynamic Deadline-Driven Approach for Building Autonomous Vehicles", EuroSys 2022, DOI 10.1145/3492321.3519576; Pant et al., "Anytime computation and control for autonomous systems", IEEE TCST 29(2):768–779, 2021; Shahsavari et al., "A coordinated approach to control mechanical and computing resources in mobile robots", IEEE T-RO 41:347–363, 2025; Liu et al., "High speed navigation for quadrotors with limited onboard sensing", ICRA 2016.
