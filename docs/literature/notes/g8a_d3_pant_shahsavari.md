# Group 8a — User-supplied prior art (D3, Pant et al. TCST'21, Shahsavari et al. T-RO'25)

Agent notes. Source PDFs were supplied by the user (paywalled), in `scratchpad/papers/g8_user/` (not copied elsewhere). Text read from the `pdftotext` `.raw.txt` files, which I tagged with PDF page numbers in `scratchpad/work_g8a/*.pg.txt`. Tables and figures that came out as images were read from page renders in `papers/g8_user/img_g8a/`: Pant pp. 7 and 11 (Algorithm 1, Tables I–V), D3 pp. 12–13 (Figs. 10, 11, 13) and Shahsavari pp. 9 and 15 (Eq. 6, Table II).

**Page convention:** "p." always means the PDF page. The printed journal page numbers are: D3 = PDF + 452 (pp. 453–471); Pant = PDF + 767 (pp. 768–779); Shahsavari = PDF + 346 (pp. 347–363). Quotes are verbatim; I only joined words split across lines.

---

### N13 — D3: A Dynamic Deadline-Driven Approach for Building Autonomous Vehicles
Ionel Gog, Sukrit Kalra, Peter Schafhalter, Joseph E. Gonzalez, Ion Stoica (UC Berkeley); EuroSys '22, April 5–8, 2022, Rennes; ACM, 19 pages; DOI 10.1145/3492321.3519576 (p1). Pages read: 19/19. I read pp. 15–17 (references) and pp. 18–19 (artifact appendix) quickly.
Status: USE. This is prior art for the claim "safety-driven runtime adaptation of perception compute, evaluated in closed loop with collisions". It is a systems paper; the safety policy is only a baseline.

**Problem & setting:** AV software pipelines (perception → prediction → planning → control) built on ROS-style data-driven or WCET-periodic execution cannot express deadlines that change with the environment. The authors call this C1, "Environment-dependent deadlines", and C2, "Environment-dependent runtimes" (p1). The goal is to maximize accuracy under deadlines that change at runtime.

**Method (key idea, assumptions):**
- *Execution model.* The application is an operator graph plus a deadline policy π_DP. π_DP "receives the environment’s state (e.g., distance to obstacles) and computes an end-to-end deadline 𝒟 that ensures safety and prevents unnecessary emergency maneuvers". It then splits 𝒟 into per-operator deadlines 𝒟_i "based on the accuracy and pre-computed runtime profiles" (p4).
- *Meeting deadlines.* Operators meet 𝒟_i proactively in several ways: anytime algorithms; switching to the most accurate implementation that fits in 𝒟_i; running several versions in parallel; skipping execution and amending the previous result; or eager execution on partial input (p8).
- *Missed deadlines.* A miss is handled as an exception: a deadline exception handler (DEH) with Abort/Continue policies releases output quickly, for example "the previous computed plan offset from the AV’s current location" (p6). π_DP can also trigger "a safety backup mode that performs simple maneuvers (e.g., braking or pulling over)" (p4).
- *ERDOS.* The Rust/Python system has timestamp deadlines and frequency deadlines (p7), intermediate results and speculative execution (p8), and transactional, time-versioned state (p9).
- *Safety reasoning appears twice.*
  - Motivating example (p3): the stopping sight distance (distance travelled during the detector's response time plus braking distance) decides between EDet2 (fast; detects the pedestrian at 40 m) and EDet6 (slow; detects at 72 m). "an AV driving at 7m/s requires 7.66m to stop with EDet2 and 11.14m with EDet6"; at 17 m/s EDet2 needs 43.43 m but detects only at 40 m, so EDet6 must be used (p3).
  - Evaluated policy (pp. 12–13): reaction time = "the sum of time to receive 8 sensor readings … and the end-to-end runtime of the current configuration". The policy uses the reaction time and the driving speed "to estimate the AV’s stopping distance. It then adjusts the end-to-end deadline depending on how close to other agents the AV will be at the end of its stopping distance."
- The authors present this policy as a baseline. They do not give it as an equation (pp. 12–13).

**Experiments & key quantitative results (exact):**
- Hardware: "2× Xeon Gold 6226 CPUs, 128GB of RAM, and 2× Titan-RTX GPUs" (p10). Perception options are EDet2–EDet6: "accuracy varies from 39.6 mAP (EDet2) to 51.7 mAP (EDet6), and the runtime varies from 20ms to 262ms" (p11).
- Apollo data: "the p99 response time latency of perception is 3.3× higher than the mean" (p4).
- Systems benchmarks (p11–12):
  - Inter-worker messaging is "2.0× better than ROS, and 3.2× better than ROS2, and 2.5× better than Flink when sending 1MB messages" (p11).
  - Policy mechanism overhead: "The median and 90th percentile response times increase by 0.9ms and 2.3ms respectively" (p12).
  - DEH is invoked "0.1ms after a deadline is missed"; "Pylot without DEH has a 0.6% end-to-end deadline miss ratio, whereas with DEH it always meets the end-to-end deadline" (p12).
- Closed-loop CARLA, 50 km (Fig. 11, p13). Only the detector is adapted: "we adapt the detector in response to shorter deadlines, but keep all the other components fixed" (p13). Collision counts:

  | Execution model | Collisions |
  |---|---|
  | Periodic | 78 |
  | Data-Driven | 36 |
  | D3 (Static Deadlines) | 34 |
  | D3 (dynamic) | 25 |

  "reduces collisions by 68% over a periodic execution, and by 26% over the best configuration with static deadlines" (p13). Static deadlines compared: 125–500 ms (p13).
- Scenario study (Fig. 13, p13; read from the image). The vehicle drives at a fixed speed. Collision speed in m/s; 0 = no collision.

  | Configuration | Person Behind Truck @ 11 / 12 / 13 m/s | Traffic Jam @ 8 / 10 / 12 m/s |
  |---|---|---|
  | D3 | 0 / 0 / 8.7 | 0 / 0 / 6.8 |
  | 500 ms | 0 / 6.9 / 10 | 0 / 0 / 9.4 |
  | 400 ms | 0 / 6.6 / 9.7 | 0 / 0 / 5.8 |
  | 250 ms | 0 / 4.3 / 7.7 | 0 / 6.1 / 9.9 |
  | 200 ms | 0 / 0 / 7.4 | 0 / 7.7 / 11 |
  | 125 ms | 0 / 5.2 / 8.8 | 2.9 / 9.5 / 0 |

  So D3 also collides at the highest speed in both scenarios.

**Limitations (stated / observed):**
- Stated:
  - The policy is out of scope: "The focus of our work is not the design of policies, but to provide the mechanisms to implement such policies" (p12); "the development of such a policy raises interesting research challenges orthogonal to this work" (p7).
  - Results depend on hardware: "executing the experiments on different hardware could significantly affect the results" (p18).
- Observed:
  - The safety policy is described informally. There is no guarantee, no estimation uncertainty and no covariance.
  - Unseen space is not modelled. In the occlusion scenario the deadline is reduced only "once the person is visible" (p14).
  - Perception frequency is not adapted. Sensors run at fixed rates (30 Hz camera in Fig. 1, p2) and the knob is detector choice / deadline.
  - Speed is fixed in the scenario study (p13) and the planner is not co-designed with the safety policy.
  - Collision results are from CARLA only. The real AV is used for motivation (p3) and demos (p11 footnote).
  - Saved inferences or energy are not reported.

**Answers to the coordinator's questions:**
- **(a) Runtime perception deadline/accuracy from a safety condition:** YES for deadline/accuracy, NO for when / how often.
  - π_DP sets the end-to-end deadline from stopping distance and proximity to agents (pp. 12–13). That deadline picks the detector, i.e. the runtime–accuracy point (p12: "ERDOS chooses the model with the highest runtime that fits within the allocated deadline").
  - The perception rate itself is not decided. The sensors stay periodic.
- **(b) Uncertainty growth between perception results:** NO.
- **(c) Unseen objects beyond sensing range:** NO.
  - Detection range does depend on the model (EDet6 detects at 72 m vs 40 m for EDet2, p3), but it is not modelled as a frontier.
  - The occlusion scenario is handled reactively, after visibility (p14).
- **(d) Controller co-designed with the compute choice:** NO for speed/plan.
  - The planner is anytime and can absorb deadline changes (p12).
  - A braking/pull-over backup mode exists conceptually (p4).
  - Speed is held fixed in the experiments (p13).
- **(e) Platform & evaluation:** Car, CARLA simulator, Pylot stack. Closed loop: YES. Hardware for collision runs: NO (workstation-in-the-loop simulation; real AV only for motivation and demos). Collisions measured: YES (counts, collision speed).

**Relation to DART:**
- *Supports.* D3 is a direct precedent, in closed loop with collision outcomes, for DART's central intuition: perception compute should adapt at runtime to a stopping-distance-based safety budget that includes the processing latency. DART's scheduler should cite it next to Zhuyi [N1] and RoboRun [N6].
- *Contrasts / gap DART fills:*
  1. D3 changes how much to compute per frame (model/deadline). DART changes whether and when to run the next inference (event-triggered, skipping frames).
  2. No covariance growth, no frontier for unseen obstacles.
  3. No coupling of the safety budget to controller constraints. D3 keeps speed fixed and uses no CBF/MPC inflation.
  4. Car in CARLA, not a UAV with learned monocular depth.
  5. No count of saved inferences or energy.
- *Where D3 is stronger than DART:*
  - Large-scale closed-loop evaluation (50 km, many scenarios), using a real AV stack and real learned detectors.
  - It models the accuracy/detection-range trade-off of the perception model (slow model sees farther, p3), which DART does not model (one fixed depth network).
  - A full systems implementation (deadline enforcement, exception handling).

**Citable statements:**
- A deadline policy computes a safety-ensuring perception/pipeline deadline from obstacle distance at runtime → p4 "πDP receives the environment’s state (e.g., distance to obstacles) and computes an end-to-end deadline 𝒟 that ensures safety"
- Detector choice must depend on speed and distance (stopping sight distance) → p3 "the AV must ensure safety by dynamically choosing between the two detectors based on its speed and the distance to the pedestrian"
- The evaluated policy uses stopping distance including the pipeline runtime → p13 "driving speed to estimate the AV’s stopping distance. It then adjusts the end-to-end deadline depending on how close to other agents the AV will be at the end of its stopping distance"
- Closed-loop collision reduction from dynamic deadlines → p13 "reduces collisions by 68% over a periodic execution, and by 26% over the best configuration with static deadlines"
- Policy design is left open (the gap DART addresses) → p12 "The focus of our work is not the design of policies, but to provide the mechanisms to implement such policies"
- Only the detector is adapted; other components are fixed → p13 "we adapt the detector in response to shorter deadlines, but keep all the other components fixed"
- Learned-perception latency spans tens to hundreds of ms (supports DART's latency premise) → p11 "the runtime varies from 20ms to 262ms"
- Perception latency has a heavy tail → p4 "the p99 response time latency of perception is 3.3× higher than the mean"
- Reaction to an occluded pedestrian happens only after it becomes visible → p14 "our policy reduces the end-to-end deadline once the person is visible"

**Snowball candidates:**
- Pylot: A Modular Platform for Exploring Latency-Accuracy Tradeoffs in Autonomous Vehicles (ICRA 2021)
- Anytime Stereo Image Depth Estimation on Mobile Devices (ICRA 2019) — anytime learned depth; directly relevant to DART's depth network
- Physical-State-Aware Dynamic Slack Management for Mixed-Criticality Systems (RTAS 2018)
- Towards Streaming Perception (ECCV 2020)
- Timing of Autonomous Driving Software: Problem Analysis and Prospects for Future Solutions (RTAS 2020)
- The Architectural Implications of Autonomous Driving: Constraints and Acceleration (ASPLOS 2018)
- SafeMC: A System for the Design and Evaluation of Mode-Change Protocols (RTAS 2018)

---

### N14 — Anytime Computation and Control for Autonomous Systems
Yash Vardhan Pant, Houssam Abbas, Kartik Mohta, Rhudii A. Quaye, Truong X. Nghiem, Joseph Devietti, Rahul Mangharam (UPenn et al.); IEEE TCST vol. 29, no. 2, pp. 768–779, March 2021; DOI 10.1109/TCST.2020.2979388 (p1). Pages read: 12/12. Algorithm 1 (p7) and Tables I–V (p11) were read from page images. The online technical report [26], which holds the constraint-tightening details and proofs, was NOT read.
Status: USE. This is direct prior art for runtime co-design of a predictive controller with the perception operating mode (latency, accuracy). It is on a multirotor, with guarantees and real flights.

**Problem & setting:**
- Perception-based state estimators (visual odometry, CV object detection) have a latency/accuracy trade-off. Running them to completion causes control delay and wastes energy on computationally limited robots (p1).
- Platform: hexrotor, downward camera, SVO visual odometry on an Odroid-U3.
- The task is trajectory tracking under state/input constraints. The state constraint set X captures "limits on the state to define the region in which the hexrotor can fly and the velocity limits on it" (p4). The motivating example of an unsafe state is "a no-fly zone" (p1). There are no obstacles.

**Method (key idea, equations in words, assumptions):**
- *Contracts.* A contract (δ, ε) is a requested estimation deadline δ plus an error bound ε (worst-case norm, or covariance Σ in the stochastic version) (p4). The estimator is profiled offline into an "error-delay curve" of discrete modes, Δ (p4).
- *Timing.*
  - Frames are captured periodically: "A new frame is captured by the camera every T > 0 seconds, which results in periodic measurements at instants ts,k = kT" (p5).
  - Control is applied at t_a,k = t_s,k + δ_k + τ_k (p5).
  - Discrete dynamics: x_{k+1} = A x_k + B1(δ_k) u_{k−1} + B2(δ_k) u_k + w_k, so "the input matrices B1(δk) and B2(δk) depend on the delay δk" (Eq. 2, p5).
  - The contract for step k+1 is decided at step k ("already decided in the previous time step", p5).
- *RAMPC (robust adaptive MPC).*
  - Cost: Σ ℓ(x, u) + α π(δ), where π(δ) is the profiled compute power (pp. 5–6).
  - For tractability "the mode is fixed throughout the N-step horizon" (p6). One tightened nominal MPC is solved per mode, with constraints Z_j(ε_k, ε) — Z "shrunk" by an amount depending on ε (tightening details in TR [26]). The minimum-cost mode and its first input are applied (Eq. 4, Algorithm 1, pp. 6–7).
  - Theorem 5.1: if the first problem is feasible, the system "robustly satisfies the state constraint x ∈ X and the control input constraint u ∈ U, and all subsequent iterations of the algorithm are feasible" (p6).
- *SAMPC (stochastic version).*
  - Contracts are (δ, Σ). Chance constraints P([x_k, u_k] ∈ X × U) ≥ 1 − ζ (Eq. 5).
  - Theorem 6.1 gives constraint satisfaction with probability ≥ 1 − ζ and recursive feasibility (pp. 6–7).
- *Assumptions:*
  - LTI dynamics, linearized around hover (p4); "limited to linear time-invariant (LTI) systems" (p3).
  - Bounded process noise.
  - The estimator always honours its contract (p12).
  - Delay stays below the sampling period: settings are cut off where "the delay approaching the sampling period of the controller" (p9, Fig. 8 caption).

**Experiments & key quantitative results (exact):**
- Hardware: hexrotor with Odroid-U3, SVO, Vicon ground truth. Control runs "in real-time at a high rate (20 Hz)" (p7), with sampling time h = 50 ms (p10).
- SVO modes (Table I, p11; read from the image):

  | Mode | #C | δ [ms] | ε [m] | σ(e_x) | σ(e_y) | σ(e_z) | π(δ) [mW] |
  |---|---|---|---|---|---|---|---|
  | 0 | 50 | 24 | 0.054 | 0.021 | 0.033 | 0.038 | 778 |
  | 1 | 100 | 30 | 0.049 | 0.019 | 0.027 | 0.033 | 862 |
  | 2 | 150 | 34 | 0.041 | 0.019 | 0.024 | 0.030 | 870 |
  | 3 | 200 | 38 | 0.035 | 0.018 | 0.022 | 0.024 | 951 |

- Two trajectories: hourglass, about 14 s; spiral, 17 s (p9). Compared against a fixed-mode robust MPC baseline; SAMPC uses ζ = 0.82 (p10). "This leads to a total of 56 flights" (p10).
- Headline: "the best case control performance of our methods results in about a 10% improvement compared to that of the baseline … SVO using about 5%–6% less computation energy compared to the baseline" (p10).
- Mode fractions (Tables II–V, p11):
  - For α = 1 the controller stays in mode 0: 1.000 in Tables II and III, 0.995 in Table IV, 0.971 in Table V.
  - For α = 0, mode 3 is used 0.570 (II), 0.621 (III), 0.589 (IV) and 0.584 (V) of the time.
- No collision metric. The performance metric is the tracking cost J_true (Eq. 8, p10).

**Limitations (stated / observed):**
- Stated:
  - "the framework applies only to the environment that the profiling has been carried out in" (p9).
  - LTI only (p3).
  - "A focus of ongoing research is to overcome the necessity of the contracts always being met by the estimator" (p12).
- Observed:
  - Perception runs every period T. The knob is per-frame latency/accuracy, never whether to perceive. The latency is shorter than one period (24–38 ms vs 50 ms), so there are no multi-period open-loop gaps.
  - The error bound per contract is a static offline profile. It does not grow with time since the last measurement and is not a filter covariance.
  - Safety means box/polytope state constraints. There are no obstacles, no collision avoidance and no unknown space.
  - Energy is reported for SVO computation only, not for the whole vehicle.

**Answers to the coordinator's questions:**
- **(a) Deciding perception at runtime from a safety condition:** PARTLY.
  - At every step the MPC chooses the estimator's (δ, ε) contract. Feasibility under tightened (robust or chance) state constraints acts as the safety filter. Among feasible modes, the one with minimum tracking + energy cost is chosen (Algorithm 1, p7).
  - The paper says the controller "can decide when an estimate is needed fast (but usually with higher error), and when a more accurate estimate is needed (but with greater delay)" (p4).
  - It does NOT decide when or how often to run perception; sampling is periodic (p5).
- **(b) Estimation-uncertainty growth between perception results:** NO.
  - Estimation error enters through a per-mode bound or covariance, and the constraints are tightened by it.
  - Growth between perception results is not modelled, because perception happens every period.
  - The horizon-indexed tightening Z_j is standard tube/robust MPC; details are in TR [26], which I did not read.
- **(c) Unseen objects:** NO. There are no obstacles at all.
- **(d) Controller co-designed with the perception/compute choice:** YES, this is the core contribution. The same MPC optimizes the control input and the perception mode, and the delay δ enters the prediction model through B1(δ) and B2(δ).
- **(e) Platform & evaluation:** Real hexrotor (a UAV), onboard Odroid, real closed-loop flights (56). Collisions: none measured; no obstacles. Formal guarantees: Theorems 5.1 and 6.1.

**Relation to DART:**
- *Supports / pre-empts.* This is the clearest prior art for "perception–control co-design at runtime on a multirotor": a predictive controller picks the perception operating mode, with the mode's latency inside the prediction model and the mode's estimation error tightening the constraints.
  - DART's MPC with covariance-inflated constraints and expected covariance reset is conceptually the same family. It is a chance/robust MPC whose constraint margin depends on the chosen perception schedule.
  - DART must cite Pant et al. and must not present "co-designing the controller with the perception choice" as new in itself.
- *Contrast / gap that remains for DART:*
  1. DART's decision variable is the length of the open-loop interval (when the next learned-depth inference runs), with uncertainty growing over that interval. Pant fixes the sampling period and chooses per-frame latency/accuracy.
  2. DART handles obstacle avoidance: tracked obstacles, braking distance, closing speed and a frontier term for unseen space. Pant handles only state-box constraints.
  3. DART's uncertainty is an online Kalman covariance that depends on time since the last measurement. Pant uses offline-profiled per-mode error bounds.
  4. DART has latencies longer than the control period (tens–hundreds of ms) and a pose buffer with capture-time updates. In Pant, δ is shorter than T.
  5. DART uses learned monocular depth and a CBF safety filter. Pant uses classical VO (SVO) and no CBF.
- *Where Pant is stronger than DART:*
  - Formal recursive feasibility and constraint satisfaction (Thms 5.1, 6.1).
  - Real flight experiments.
  - Explicit energy accounting per mode (Table I).
  - A clean contract interface usable with off-the-shelf estimators.

**Citable statements:**
- The controller selects the perception mode at runtime → p1 "a robust predictive control algorithm that at run-time decides a contract, or operation mode, for the estimator in addition to controlling the dynamical system"
- Fast-but-inaccurate vs slow-but-accurate estimates chosen by the controller → p4 "it can decide when an estimate is needed fast (but usually with higher error), and when a more accurate estimate is needed (but with greater delay)"
- Estimation delay enters the discrete dynamics → p5 "the input matrices B1(δk) and B2(δk) depend on the delay δk"
- Perception sampling is periodic, not triggered (the gap DART fills) → p5 "A new frame is captured by the camera every T > 0 seconds, which results in periodic measurements at instants ts,k = kT"
- Guarantee: robust constraint satisfaction and recursive feasibility → p6 "robustly satisfies the state constraint x ∈ X and the control input constraint u ∈ U, and all subsequent iterations of the algorithm are feasible"
- The mode is held constant over the MPC horizon (contrast with DART's expected covariance resets) → p6 "the mode is fixed throughout the N-step horizon"
- Quantified benefit on a hexrotor → p10 "about a 10% improvement compared to that of the baseline … about 5%–6% less computation energy"
- Profile validity is limited to the profiled environment → p9 "the framework applies only to the environment that the profiling has been carried out in"
- Latency is kept below the control period → p9 "No value of #C is used above this as it results in the delay approaching the sampling period of the controller."

**Snowball candidates:**
- Co-design of anytime computation and robust control (RTSS 2015)
- Technical report: Anytime computation and control for autonomous systems (UPenn-ESE-04-19, 2019)
- On resource overbooking in an unmanned aerial vehicle (ICCPS 2012)
- Sequence-based anytime control (TAC 2013)
- Anytime control algorithms for embedded real-time systems (HSCC 2008)
- Formal analysis of timing effects on closed-loop properties of control software (RTSS 2014)
- PAMPC: Perception-aware model predictive control for quadrotors (IROS 2018)
- Robust model predictive control with imperfect information (ACC 2005)

---

### N15 — A Coordinated Approach to Control Mechanical and Computing Resources in Mobile Robots
Sajad Shahsavari, Hashem Haghbayan, Antonio Miele, Eero Immonen, Juha Plosila (Univ. Turku, Politecnico di Milano, Turku UAS); IEEE T-RO vol. 41, pp. 347–363, 2025 (published 6 Nov 2024); DOI 10.1109/TRO.2024.3492345 (p1). Pages read: 17/17. Table II (p15) was read from the image; the author biographies (p17) were skimmed.
Status: USE (peripheral). It is NOT a competitor to DART's safety/perception-scheduling novelty. I keep it as background for (i) runtime co-management of robot speed with compute resources and (ii) DART's energy argument. Had the energy argument not needed it, it would be EXCLUDE.

**Problem & setting:**
- The robot's energy is split between mechanical (motor) and computational parts (CPU DVFS). Optimizing them separately is sub-optimal (p1).
- Platform: ground rover with a brushless DC motor; Jetson TX2 (only the quad-core A57 cluster is controlled, 11 DVFS steps from 499 MHz to 2.0 GHz); DAVIS-346 event camera (pp. 3–4).
- Speeds 0.25–5.0 m/s in 0.25 m/s steps, 20 configurations (p3). The knowledge matrix has 220 speed/frequency configurations (p15).
- Workload: three event-vision applications (image reconstruction, corner detection, corner detection with filtering) (p4). They are annotated with throughput QoS requirements in batches per second (p3).

**Method:**
- Physics-based mechanical power model, P_m = F v with acceleration, rolling and drag terms (Eqs. 1–2, p8).
- Additive CPU power model (Eq. 3, p8).
- Energy per distance E_d(v, f) = (P_m(v) + P_c(f)) / v (Eq. 4, p8).
- Performance metric PLPT: the 75th percentile of per-batch execution time. It is predicted for a new (f, s) as PLPT_new = (f_new/f_curr)·(s_new/s_curr)^β·PLPT_curr (Eq. 6, p9). I checked the equation on a page image: the frequency ratio has no exponent as printed, even though PLPT falls with frequency in Fig. 14. This looks like a typo in the paper; it is not relevant to DART.
- Knowledge matrix: an exponential-moving-average update with an adaptive decay γ (Eqs. 7–8, p10).
- Decision: argmin over (s, f) of E_d s.t. PLPT ≤ PLPT_ref = κ/QOS_ref (Eqs. 9–10, p10).
- OODA loop with 1 s period (p7). Models are retrained online when the error exceeds a threshold (Algorithm 1, p10).

**Experiments & key quantitative results (exact):**
- 500 m track with low, moderate, high and variable complexity (Fig. 11). Event statistics (μ, σ): (12.23k, 2.31k), (16.64k, 4.07k), (30.10k, 7.50k) (p11). QoS 30 batch/s (p14).
- Energy:
  - "our proposed approach outperforms HC with respect to the overall energy consumption by 36.34%" (100 m track) and "8.22% in 2500 m track" (p13).
  - "SO yields 16.43% and 17.50% higher energy consumption than our method in 100 m and 2500 m tracks" (p13).
  - "Averaged over all track lengths and environment complexities, we improve the energy consumption of AS-MF, SO, and HC by 23.94%, 17.43%, and 18.45%, respectively" (p13).
- Throughput violations: SO/HC "up to 4%"; the proposed method "lower than 1%"; AS-MF 0% (p14).
- Settling time (Table II, p15), in seconds:

  | Complexity | HC | Ours |
  |---|---|---|
  | Low | 141 | 11 |
  | Moderate | 103 | 5 |
  | High | 94 | 6 |

  "approximately 16 times faster than HC" (p15).
- Controller loop: 42.12 ms on average (p15).
- Motivating optimum P*: 4 m/s and 1.8 GHz (p5).

**Limitations (stated / observed):**
- Stated:
  - Future work on GPU and task-migration knobs (p3).
  - Scalability: "such an approach may become unpractical when considering complex robotic systems" (p16).
  - Generalization to other tasks/constraints is claimed but not shown (p16).
- Observed:
  - No safety or collision constraint. The robot drives straight tracks, and obstacles only influence event counts.
  - The QoS throughput target is set by the designer. It is not derived from speed or stopping distance, although the introduction motivates that link (p1).
  - Ground rover only; no estimation uncertainty.

**Answers to the coordinator's questions:**
- **(a) When/how often to perceive from a safety condition:** NO.
  - The batch input rate R is fixed (30). Applications skip batches when slower (race-to-idle, p3).
  - The controller sets CPU frequency and speed to meet a fixed throughput QoS at minimum energy. That is an energy/QoS objective, not a safety one.
- **(b) Uncertainty growth:** NO.
- **(c) Unseen objects:** NO.
- **(d) Controller co-design:** YES for speed and compute resource, NO for safety.
  - The controller lowers speed when compute cannot keep up: "a lower speed is selected to be able to process all the incoming information" (p14).
  - This is a co-design of motion speed with perception throughput, but its purpose is energy.
- **(e) Platform & evaluation:** Real ground rover (Jetson TX2, event camera), closed loop over energy/QoS on straight tracks of 100–2500 m. No obstacles avoided; collisions not measured.

**Relation to DART:**
- Peripheral. It supports the idea that the right speed depends on available compute and perception load (p2: "in the case of limited computing resources, the rover needs to tune the speed to keep the QoS requirement low enough"). It also supports the claim that computing energy is not negligible on small robots (p5).
- It does not touch DART's safety scheduler, uncertainty, frontier or CBF/MPC.
- It is stronger than DART in real-hardware energy measurement.
- Caution: its claim that compute energy can dominate is for a ground rover at low speed. It does not transfer to multirotors, where hover power is large; RoboRun [N6] reports compute < 0.05 % of MAV energy.

**Citable statements:**
- QoS (perception accuracy) requirements rise with speed (motivation for speed–compute coupling) → p1 "is required to be higher at higher rover speeds"
- Limited compute should lower speed → p2 "in the case of limited computing resources, the rover needs to tune the speed to keep the QoS requirement low enough"
- Computing energy can dominate on small ground robots → p5 "the computational energy cannot be neglected, and in various scenarios, especially at low engine speed, it is predominant"
- Joint (not separate) management lowers energy → p13 "we improve the energy consumption of AS-MF, SO, and HC by 23.94%, 17.43%, and 18.45%, respectively"
- Perception QoS is a designer-set throughput, not safety-derived → p3 "The applications are annotated with a QoS requirement, expressed in terms of a throughput (batches per second) to be guaranteed"

**Snowball candidates:**
- Energy-efficient mobile robot control via run-time monitoring of environmental complexity and computing workload (IROS 2021) — already a FOLLOW-UP in g7 (arXiv 2109.04285)
- Latency vs precision: Stability preserving perception scheduling (Automatica 2023) — already read as N10
- Least-energy path planning with building accurate power consumption model of rotary unmanned aerial vehicle (TVT 2020)
- Network offloading policies for cloud robotics: a learning-based approach (Auton. Robots 2021)
- Hierarchical power management for asymmetric multi-core in dark silicon era (DAC 2013)

---

## Group synthesis

- **Safety-driven runtime adaptation of perception compute exists outside Zhuyi.** D3 (EuroSys'22) adapts the perception deadline, and with it the detector choice, from stopping distance including pipeline runtime and proximity to other agents (pp. 3, 12–13).
  - It shows this in closed loop with collision outcomes: 78 → 25 collisions over 50 km in CARLA (p13).
  - Its policy is explicitly a simple baseline (p12).
- **Runtime co-design of the controller with the perception operating mode exists, with guarantees, on a multirotor.**
  - In Pant et al. (TCST'21), an MPC chooses the estimator's (latency, accuracy) contract each step. The delay is inside the prediction model and the mode's error bound or covariance tightens the constraints.
  - They prove robust/chance constraint satisfaction with recursive feasibility (pp. 5–7) and validate on 56 real hexrotor flights (p10).
- **Co-managing speed with compute resources at runtime exists** for energy rather than safety, on a real ground robot: Shahsavari et al. (T-RO'25), pp. 10–14.
- **What none of the three does:**
  - None decides *whether / when* to run the next perception inference. Sensing is periodic in all three (D3 p2; Pant p5; Shahsavari p3).
  - None models estimation-uncertainty growth during an open-loop interval without perception.
  - None reasons about unseen space or a sensing-range frontier. D3 reacts to an occluded pedestrian only after it is visible (p14).
  - None counts saved inferences together with collision outcomes. Pant reports energy and tracking cost; D3 reports collisions but not compute savings.
  - None uses CBFs, and none targets learned monocular depth on a UAV. Pant's UAV uses classical VO with δ < T.
- **Measured costs.** Learned perception latency on a workstation GPU ranges 20–262 ms (D3 p11), with heavy tails (p99 = 3.3× mean, p4). This supports DART's latency premise. Per-mode compute power for VO on an Odroid is 778–951 mW (Pant p11).
- **Open gap DART can claim (after these three):** event-triggered timing of a latency-bearing learned-depth inference, with a trigger computed from braking distance, closing speed, covariance growth since the last capture and a frontier term. The same time-varying uncertainty model drives the constraint inflation of the obstacle-avoidance MPC/CBF, evaluated in closed loop on a UAV for both collisions and inferences saved.

---

## Impact on DART novelty (vs `docs/literature/novelty_positioning.md`)

**Overall verdict.** The three papers do not pre-empt DART's core scheduler claims. Those are (a) covariance growth in the safe open-loop time, (b) a frontier for unseen obstacles, and (c) event-triggering *whether/when* to run inference. Two phrasings in the current assessment are, however, too broad and must be narrowed:
1. "Co-designed with uncertainty-inflated MPC/CBF" as a generic idea. Pant et al. [N14] already co-design a predictive controller with the perception mode, inflate (tighten) constraints by the perception mode's estimation error, and do so on a multirotor with proofs and real flights.
2. "Closed-loop triggering … measuring collisions" as a gap left by Zhuyi. D3 [N13] already shows runtime safety-driven perception adaptation (deadline/model choice) in closed loop with collision counts.

**Component by component:**

1. **Capture-time update (pose buffer, one frame in flight).**
   - *Assessment:* "standard technique". **Unchanged.**
   - *Evidence:*
     - Pant models the delayed actuation explicitly: x̂_k := x̂(t_s,k) and dynamics with B1(δ), B2(δ) (p5, Eq. 2). This is one more precedent for delay-aware formulations.
     - D3 and Shahsavari: not applicable.

2. **Safety-driven perception scheduler.** **Core unchanged, but cite D3 and Pant and narrow item (c).**
   - *Basic principle:* "safety-derived perception rate/deadline already exists". Strengthened. D3 joins Zhuyi [N1] and RoboRun [N6]: "πDP receives the environment’s state (e.g., distance to obstacles) and computes an end-to-end deadline 𝒟 that ensures safety" (p4); stopping distance in the policy (p13).
   - *(a) Covariance growth inside the open-loop interval:* **not pre-empted.**
     - D3 has no uncertainty model.
     - Pant's ε/Σ is a fixed per-mode profile (Table I, p11), with sampling every T (p5).
     - Shahsavari has none.
   - *(b) Frontier for unseen obstacles:* **not pre-empted.**
     - D3's occlusion scenario is handled reactively, "once the person is visible" (p14).
     - Pant and Shahsavari have no obstacles.
   - *(c) Closed-loop triggering, measuring saved inferences and collisions:* **partly pre-empted. Rephrase.**
     - D3 already runs closed-loop runtime perception adaptation with collision outcomes (Fig. 11, p13).
     - What remains new is that the knob is *whether/when to infer*: skipping inferences, so the open-loop gap is variable and can exceed one frame. D3 adapts the model/deadline with 30 Hz sensing (p2, p13).
     - Also new: reporting inference counts together with collisions. D3 reports collisions only; Pant reports energy and tracking cost only.
   - *(d) UAV + learned monocular depth:* **mostly unchanged.**
     - "UAV" alone is not new for perception–control co-design: Pant flies a hexrotor (p9).
     - "Learned depth for obstacle avoidance on a UAV" remains, since Pant uses SVO (p8).
   - *Note:* Pant's "decide when an estimate is needed fast … and when a more accurate estimate is needed" (p4) uses the word *when*, but it means per-frame mode selection, not timing of perception. Make this distinction explicit in DART's related work.

3. **Adaptive-horizon MPC + expected covariance reset.**
   - *Assessment:* weak contribution. **Unchanged, and now with one more neighbour.**
   - *Evidence:*
     - Pant uses a fixed horizon N and holds the perception mode constant over the horizon: "the mode is fixed throughout the N-step horizon" (p6). So Pant does not do expected covariance resets at scheduled measurement times. That specific mechanism remains DART's.
     - The broader idea of an MPC whose constraint tightening depends on the chosen perception mode is Pant's (pp. 6–7), alongside C6/C7 and N10 already in the table.
   - *Suggested experiment (optional):* Pant suggests a clean comparator. Solve one MPC per candidate trigger interval and pick min cost + α·(inference cost), as in Algorithm 1 (p7). This could be a "Pant-style" variant of the scheduler.

4. **Braking-CBF with time-varying inflation d(t).**
   - *Assessment:* "CBF itself not new; novelty is coupling with the scheduler". **Unchanged.**
   - *Evidence:*
     - None of the three uses CBFs.
     - Pant's tightening Z_j(ε) by perception error (p6) is an MPC-side analogue of "inflate by perception uncertainty". It should be cited with C6/C7/F1 as precedent for uncertainty-based margins.
     - Pant's margin depends on the chosen mode, not on time since the last measurement. DART's d(t) grows between measurements, which keeps the coupling claim intact.

**Section 1 bullet "triggering by remaining safe time exists for control updates, not for perception".**
- Still true after these papers: none triggers perception.
- Rewrite it to acknowledge D3 and Pant. Runtime *per-frame* adaptation of perception compute driven by safety or control exists: D3 = deadline/model from stopping distance; Pant = latency/accuracy mode chosen by MPC under constraint guarantees. Event-triggered *timing* of perception inference does not appear in these works.

**Section 1 "suggested wording".**
- Extend it to something like: "Zhuyi/D3/RoboRun-style safety-derived perception budgets, and Pant-style runtime co-design of predictive control with perception modes, extended to (i) event-triggered timing of a latency-bearing learned-depth inference, (ii) estimation-covariance growth over the open-loop interval and a frontier for unseen obstacles, shared by (iii) the trigger and the uncertainty-inflated MPC/CBF, on a compute-limited UAV."
- Do not claim "first perception–control co-design" or "first runtime perception adaptation evaluated by collisions".

**Section 3 weaknesses.**
- Add Pant [N14] to the list of works with hardware experiments (56 hexrotor flights, p10) and with formal guarantees (Thms 5.1/6.1, pp. 6–7). DART still has neither.
- Add D3 [N13] as having a much larger closed-loop evaluation (50 km, p13).

**Energy argument.**
- Shahsavari shows computing energy "can be predominant" on a small ground rover at low speed (p5). Pant shows only 5–6 % compute-energy savings, measured on the estimator alone (p10).
- Combined with RoboRun's < 0.05 % for MAVs, this confirms the current advice. DART should argue accelerator availability and headroom, not vehicle energy.
