# Literature notes — Group g1: perception latency / rate and safety; embedded depth

Papers dir: `scratchpad/papers/g1_latency/` (PDFs + `pdftotext -layout` .txt + page-marked `.pg.txt`).
Page numbers below are PDF page numbers (counted from form feeds), not journal page numbers.
All seven papers were obtained and read in full. Every arXiv ID was checked against the arXiv API and
matched the expected title, so no ID needed correcting. A5's listed ID 2607.17317 is correct.

---

### A1 — How Fast is Too Fast? The Role of Perception Latency in High-Speed Sense and Avoid
Davide Falanga, Suseong Kim, Davide Scaramuzza; IEEE Robotics and Automation Letters, "Preprint version. Accepted January, 2019" (header, p1).
Source: author-hosted copy https://rpg.ifi.uzh.ch/docs/RAL19_Falanga.pdf. I checked that it is the paper itself: the title, authors and RA-L header match, and the 7-page supplementary material is appended as PDF pp. 9–15.
DOI 10.1109/LRA.2019.2898117 comes from the task list. The preprint only says "DOI: see top of this page". Citing papers give RA-L vol. 4, no. 2, pp. 1884–1891, 2019 (A2 ref [4], A5 ref [6]).
Pages read: 15/15 (main text + supplementary).
Status: USE

**Problem & setting:** The paper asks for the maximum speed at which a robot can still avoid a static obstacle, given its perception latency τ, sensing range s and bounded lateral acceleration ū2. The setting is planar with one obstacle. The robot keeps its longitudinal speed constant because it wants to reach the goal fast, so it can only evade laterally (p2–3).

**Method (key idea, equations in words, assumptions):**
- Robot model: each axis is a double integrator with bounded input (Eqs. 1–2, p3). This is justified by feedback linearization (p2) and, for quadrotors, by differential flatness (p6).
- Obstacle model: a square of width 2ro, expanded by the robot half-size rv (p3).
- Latency τ: the time from the obstacle entering the sensing area until the avoidance maneuver starts, counted as sensor latency plus algorithm latency (p3).
- Time to contact is tc = s / v̂1 (Eq. 3, p3).
- Avoidance: a time-optimal bang–bang lateral maneuver that ends with zero lateral speed takes ts = 2·sqrt(r/ū2) (Eqs. 5–6, p3–4).
- Safety condition: s/v̂1 − τ ≥ 2·sqrt(r/ū2) (Eq. 7, p4).
- This gives the maximum tolerable latency τ̄ = s/v̂1 − 2·sqrt(r/ū2) (Eq. 8) and the maximum speed v̄1 = s / (τ + 2·sqrt(r/ū2)) (Eq. 9, p4).
- Camera latency models:
  - Monocular frame camera: between tf + tT + tE and 2tf, assuming 2 frames are needed for detection (p5; S4-B, p11).
  - Stereo camera: bounded using datasheet values (p5–6).
  - Event camera: latency τE depends on distance and speed (Eq. S.5, p12).
- Multiple obstacles are handled by applying the analysis to each obstacle in turn, under conservative assumptions (S3, p10).
- Assumptions: linear model, holonomic 2D maneuvers, ideal sensing (p2).

**Experiments & key quantitative results (exact, with page):**
- Case-study bounds:
  - Monocular frame camera at 50 Hz: τM = 0.040 s (upper) and 0.026 s (lower) (p5).
  - Stereo: τS = 0.070 s (Bumblebee XB3) and 0.017 s (RealSense R200) (p5–6).
- Table I (p7), maximum speed in m/s for ū2 = 10 / 25 / 50 / 200 m/s²:
  - Mono frame, s = 2.0 m, τ = 0.040 s → 3.40 / 5.17 / 7.02 / 12.30.
  - Mono frame, s = 6.0 m, τ = 0.026 s → 6.97 / 10.74 / 14.76 / 40.41.
  - Stereo, s = 8.0 m, τ = 0.017 s → 14.17 / 22.03 / 30.57 / 57.50.
  - Mono event, s = 8.0 m, ū2 = 200 → 62.06 (with τ = 0.006 s).
- At ū2 = 200 m/s², event cameras allow a maximum speed "between 7% and 12% larger" than stereo (p6).
- Sensitivity analysis (S2, p9): with s = 2.5 m, τ = 0.05 s and ū2 = 50 m/s², v̄1 = 10 m/s.
- Hardware experiment (p8): a ball thrown at 5–9 m/s; sensing range 2 m; tc = 0.22–0.40 s; ts = 0.17–0.25 s.
  - Detection ran on an onboard Intel UpBoard.
  - The avoidance command came from a ground station using motion capture (S8-A, p13–14).
- Measured event-detection latency (supp. Table I, p14):
  - s = 1 m: µ = 0.0037 s, σ = 0.0030 s.
  - s = 2 m: µ = 0.0688 s, σ = 0.0474 s.
  - s = 3 m: µ = 0.1832 s, σ = 0.0766 s.

**Limitations (stated / observed):**
- Stated by the authors:
  - Only static obstacles; dynamic obstacles are discussed only qualitatively (p13, S7-B).
  - The detector was tuned for speed over accuracy, and obstacles of unknown size or shape are out of scope (p7).
  - The gap between theory and data grows with sensing range, which they attribute to sensor noise and low resolution (p14–15).
- Observed by us:
  - It is a one-shot analysis: one detection triggers an open-loop maneuver. Sampling period and rate appear only inside τ.
  - There is no estimation uncertainty, no repeated measurements and no closed-loop controller.
  - Constant longitudinal speed means no braking, whereas DART uses braking distance.
  - Minor inconsistencies in the text:
    - p3 defines r = 2(rv + ro), but p6 gives r = 0.75 m for rv = 0.25 m and ro = 0.50 m.
    - The stereo upper bound is attributed to Bumblebee XB3 on p6 but to ZED Mini in S5-B (p11).

**Relation to DART:**
- This is the basic theory behind DART's scheduler. Eq. 7 is a deterministic deadline: obstacle information must arrive within s/v − t_avoid.
- DART's "safe open-loop time" generalises this in four ways:
  - It is evaluated repeatedly at runtime rather than once at design time.
  - It uses braking distance.
  - It adds covariance growth and a frontier term for unseen obstacles beyond the range s. That term plays the role of Falanga's s/v.
  - It is used to decide *when* to trigger inference, rather than to fix a maximum speed at design time.
- What A1 does NOT do: runtime scheduling or event-triggering, uncertainty, latency compensation, an MPC/CBF safety filter, or separate treatment of latency vs. rate with multiple frames in flight.
- Where A1 is stronger:
  - Closed-form bound with hardware validation.
  - S1 (p9) shows lateral evasion needs less time than braking at high speed. DART's braking-based bound is therefore conservative at high speed, and we should say so.

**Citable statements:**
- Perception latency spans tens to hundreds of ms → p1: "the perception latency can vary from tens up to hundreds of milli-seconds [2]–[7]."
- Latency and low sampling rate limit agility → p1: "the relatively high latency and low sampling frequency limit the aggressiveness of the control strategies that can be implemented."
- Tolerable latency depends on speed, range and actuation → p1 (abstract): "the maximum latency that the robot can tolerate to guarantee safety is related to the desired speed, the range of its sensing pipeline, and the actuation limitations"
- Latency is defined end-to-end → p3: "we consider as latency the sum of the sensor's and the sensing algorithm's latency."
- The analysis assumes ideal sensing → p2: "we assume that there is no uncertainty in the obstacle detection, no illumination issues, no artifacts in the measurements"
- Latency matters more at higher speed → p4: "the importance of low latency increases as the navigation speed increases."
- Maximum speed is most sensitive to sensing range → p9: "As one can see, v̄1 is very sensitive to the sensing range"
- Lateral evasion beats braking at high speed → p9: "The results show that the lateral avoidance maneuver requires less time at high speed"
- Static obstacles only → p13: "In this work, we only considered the case of navigation through static obstacles."

**Snowball candidates:**
- Sermanet et al., "Speed-range dilemmas for vision-based navigation in unstructured terrain" (2007)
- Handa et al., "Real-time camera tracking: When is high frame-rate best?" (2012)
- Behnke et al., "Predicting away robot control latency" (2004)
- Vincze, "Dynamics and system performance of visual servoing" (2000)
- Richter, Vega-Brown, Roy, "Bayesian learning for safe high-speed navigation in unknown environments" (2015)
- Richter & Roy, "Safe visual navigation via deep learning and novelty detection" (2017)
- Barry, Florence, Tedrake, "High-speed autonomous obstacle avoidance with pushbroom stereo" (2018)
- Mueggler et al., "Towards evasive maneuvers with quadrotors using dynamic vision sensors" (2015)

---

### A2 — Learning High-Speed Flight in the Wild
Antonio Loquercio, Elia Kaufmann, René Ranftl, Matthias Müller, Vladlen Koltun, Davide Scaramuzza; Science Robotics Vol. 6, Issue 59, abg5810 (2021), accepted version.
arXiv:2110.05113v1 (11 Oct 2021); DOI 10.1126/scirobotics.abg5810.
Pages read: 23/23. The main text (pp. 1–16) and the supplementary material (pp. 17–23) were both read in full.
The text layer of p14 has a draft and the final layout overlaid, so it extracts garbled. I re-extracted it, and its content (trajectory selection, training environments, DAgger, ablation) is also stated clearly on pp. 13 and 15.
Status: USE

**Problem & setting:** High-speed (3–10 m/s) quadrotor flight through unknown cluttered environments using only onboard sensing and compute. The authors argue that sense–map–plan pipelines add latency and compound errors (p1, p3).

**Method:**
- Policy: one end-to-end network.
  - Inputs: a depth image (SGM stereo in simulation, RealSense D435 on hardware; 640×480), velocity, attitude and a desired direction.
  - Outputs: M = 3 trajectories (10 waypoints over 1 s), each with a predicted collision cost (pp. 11–13).
- Training: privileged imitation of a Metropolis–Hastings sampling expert that has the full point cloud.
  - Relaxed winner-takes-all loss (Eq. 5) and DAgger.
  - Training is in simulation only (Flightmare); deployment to the real world is zero-shot.
- Execution: the selected trajectory is projected onto order-5 polynomials and tracked by MPC.
- Latency study: extends Falanga's bound by adding the rotation time, giving vmax = s / (ts + tp + trot + sqrt(2·robs/(sin φ·cmax))) (Eq. 11, p20).
  - ts is the sensing latency (taken as the inverse frame rate), tp the processing latency, trot the time to roll by angle φ.

**Experiments & key quantitative results:**
- Real world (pp. 3–5): 56 experiments in total.
  - Natural environments (31 experiments): no crash at 3 and 5 m/s; 8/10 successes at 7 m/s; 60% success at 10 m/s.
  - Narrow gap: a Skydio R1 at about 2.7 m/s failed in all 3 trials; their policy had 6 experiments at 3 and 5 m/s with no crash.
- Simulation:
  - Average success rate 70% at 10 m/s (p5).
  - Forest at 10 m/s: 60% success, while no baseline completes a single run (p7).
- Processing latency, Table 1 (p9):
  - FastPlanner: 65.2 ms.
  - Reactive: 19.1 ms.
  - Theirs on desktop: 10.3 ms on CPU, 2.6 ms with GPU inference.
  - Theirs onboard (Jetson TX2): network inference 38.9 ms; total 41.6 ms, "about 24 Hz" (p7/p9).
  - Onboard, the policy runs at 24.7 Hz and the MPC at 100 Hz. Depth arrives at 30 Hz (p19).
- Latency/noise study (p9–11, Table S3 p20): pole of diameter 1.5 m placed 6 m away; s = 6 m; ts = 66 ms (15 Hz rendering); trot = 125.2 ms.
  - Theoretical vmax: FastPlanner 12.0 m/s, Reactive 13.2 m/s, theirs 13.5 m/s.
  - With ground-truth depth: theirs has no failure up to 7 m/s and 60% success at 10 m/s.
  - With stereo depth: theirs drops only 10% at 10 m/s. FastPlanner completely fails from 5 m/s; Reactive drops 30% at 7 m/s.
- Noise in state and control makes theirs 5–10% worse at higher speeds (S1, p17).

**Limitations:**
- Stated by the authors (p11): low success at ≥ 10 m/s in the real world; the expert itself often fails at those speeds; sim-to-real mismatch (aerodynamics, motor delays, battery voltage); perception latency.
- Stated about the bound (p20): it "does not account for the fact that the quadrotor platform already performs some lateral acceleration during the rotation phase".
- Observed by us:
  - No formal safety guarantee; collision risk is a learned prediction.
  - Fixed perception rate.
  - Stereo depth rather than monocular.
  - Latency is reduced by design but not compensated, and uncertainty is not represented.

**Relation to DART:**
- Supports DART's motivation: processing latency limits safe speed, and onboard learned inference dominates the pipeline (38.9 of 41.6 ms). Its use of a Falanga-style vmax to compare pipelines with different latencies is a template DART can reuse.
- Gap (what A2 does not do): perception-rate adaptation or triggering, capture-time delay compensation, uncertainty-inflated constraints or a CBF, and safety guarantees. It also relies on metric stereo depth, which does not have the affine/scale error of monocular depth.
- Where A2 is stronger: real-world flight up to 10 m/s in complex environments, and end-to-end robustness to depth noise.

**Citable statements:**
- Modular pipelines add latency → p11: "the communication between modules introduces latency, errors compound across modules"
- Learned inference dominates onboard latency → p7: "the network's forward pass requires 38.9 ms. Onboard, the total time to pass from the sensor reading to a plan is 41.6 ms"
- Falanga's point-mass bound neglects rotational dynamics → p9: "They modeled the robot as a point-mass, which is a limited approximation for a quadrotor as it neglects the platform's rotational dynamics."
- Filtering for robustness raises effective latency → p7: "Two to three observations of an obstacle can be required to add it to the map, which increases the effective latency of the system."
- Faster or more frequent perception improves estimates → p11: "Faster sensors can provide more information about the environment in a smaller amount of time and, therefore, can be used to provide more frequent updates"
- Baselines react too late → p7: "the baselines only adapt their motion when very close to obstacles, which is often too late to avoid collision"

**Snowball candidates:**
- Florence, Carter, Tedrake, "Integrated perception and control at high speed: Evaluating collision avoidance maneuvers without maps" (2020)
- Zhou et al., "Robust and efficient quadrotor trajectory generation for fast autonomous flight" (2019)
- Ryll et al., "Efficient trajectory planning for high speed flight in unknown environments" (2019)
- Tordesillas et al., "FASTER: Fast and safe trajectory planner for flights in unknown environments" (2019)
- Zhou et al., "RAPTOR: Robust and perception-aware trajectory replanning for quadrotor fast flight" (2020)
- Falanga, Kleber, Scaramuzza, "Dynamic obstacle avoidance for quadrotors with event cameras" (2020)
- Zhang & Scaramuzza, "Perception-aware receding horizon navigation for MAVs" (2018)

---

### A3 — Monocular Event-Based Vision for Obstacle Avoidance with a Quadrotor
Anish Bhattacharya, Marco Cannici, Nishanth Rao, Yuezhan Tao, Vijay Kumar, Nikolai Matni, Davide Scaramuzza; 8th Conference on Robot Learning (CoRL 2024), Munich (as printed, p1).
arXiv:2411.03303v1 (5 Nov 2024); ID verified.
Pages read: 18/18 (main pp. 1–11 + supplementary pp. 12–18).
Status: USE (peripheral: one related-work sentence plus a latency data point)

**Problem & setting:** Avoiding static obstacles (tree-like objects) using only a monocular event camera on a quadrotor. The policy is pre-trained in simulation and then fine-tuned with real perception data.

**Method:**
- Events are batched in windows of ∆t = 1/FPScam (33 ms) and turned into binary event masks (Eq. 1, p5).
- A U-Net + ConvLSTM network D(θ) predicts depth as a pretext task, using an inverse-depth-weighted L2 loss.
- A velocity network V(ϕ) outputs a lateral velocity command.
- Real-world fine-tuning uses data from a handheld rig with an event camera and a D435 depth camera (p5).
- For hardware tests, V(ϕ) is replaced by a pretrained ViTLSTM (p7).

**Experiments & key quantitative results:**
- Simulation (p6): about 60% success on 10 m trajectories; zero collisions on 15% of 60 m trials. Joint training of depth and velocity beats independent training and no depth supervision.
- Real world: indoor 18 + 20 trials (p8); outdoor 11/13 (85%) at 1–5 m/s (p8). Success increases with speed (p7–8).
- Inference time, Table S1 (p14):
  - Falcon250 platform (CPU-only i7-10710U): D 67 ms + V 6 ms = 73 ms.
  - Simulation PC: 255 + 3 = 258 ms.
- Theoretical vmax using A2's formula (p14): 13.5 → 15.83 m/s or 15.76 m/s (event pre-processing 650 µs or 2.25 ms). Worst-case latency 2.25 + 73 = 75.25 ms, vs. A2's 66 + 10.3 = 76.3 ms.
- Tuning the event-camera biases doubles indoor success (p17).

**Limitations:**
- Stated by the authors (p8): event and frame sensor latency are not compared directly because inference latency dominates; each new scene needs real fine-tuning data.
- Stated by the authors (p7): predicted depth "can be amorphous".
- Observed by us: no uncertainty model, no delay compensation, no safety layer, fixed 33 ms batches, speed ≤ 5 m/s; indoor odometry comes from motion capture.

**Relation to DART:**
- Supports the premise that learned-perception *inference* latency (73 ms onboard) dominates sensor latency, so the bottleneck is compute and scheduling, not the sensor.
- It is another learned-depth → avoidance pipeline with no safety reasoning about rate or latency.
- What A3 does NOT do that DART does: uncertainty-aware constraints, capture-time updates, triggered inference.
- Where A3 is stronger: real hardware, the event modality, and flying in the dark.

**Citable statements:**
- Inference latency dwarfs sensor latency → p8: "the processing latency of model inference, which is currently magnitudes larger than the event camera's sensor latency."
- Onboard learned perception takes tens of ms → p13: "in an end-to-end event-based perception-to-control framework, with total onboard inference time of 73ms."
- Learned depth predictions are imperfect → p7: "the depth images formed by D(θ) can be amorphous, with close depth on the relevant obstacles but noisy backgrounds"

**Snowball candidates:**
- Bhattacharya et al., "Vision transformers for end-to-end vision-based quadrotor obstacle avoidance" (2024)
- Hidalgo-Carrió, Gehrig, Scaramuzza, "Learning monocular dense depth from events" (2020)
- Sanket et al., "EVDodgeNet: Deep dynamic obstacle dodging with event cameras" (2020)
- Paredes-Vallés et al., "Fully neuromorphic vision and control for autonomous drone flight" (2024)

---

### A4 — Towards Safety-Aware Computing System Design in Autonomous Vehicles
Hengyu Zhao, Yubo Zhang, Pingfan Meng, Hui Shi, Li Erran Li, Tiancheng Lou, Jishen Zhao (UC San Diego; Pony.ai).
arXiv:1905.08453v2 (22 May 2019); no venue is printed.
Pages read: 14/14 (including Appendix A).
Status: USE (conceptual analogue from AV computing systems; mainly a contrast)

**Problem & setting:** Which metric should guide the design of the computing system in a Level-4 autonomous car so that driving is nominally safe? The paper is based on a field study of an industrial Level-4 fleet with LiDAR-centric perception.

**Method:**
- Field study: "over 200 hours and 2000 miles" over three months (p4).
- Safety score (Eq. 1, p6): σ[α(θ²−t²)+β(θ−t)] if t < θ, and η[α(θ²−t²)+β(θ−t)] otherwise.
  - t is the instantaneous response time: a sum of latency-accumulation functions wi(ti) over the safety-critical modules (Eq. 2).
  - θ is the response-time window, derived from the RSS minimum distance dmin = αt² + βt + γ (Eq. 8, p13). θ solves d = αθ² + βθ + γ (Eq. 10, p14).
- Latency model: regression on a hierarchy of obstacle-count maps (Eq. 3, p7), scaled by a resource ratio (Eq. 4, p8).
- Resource management:
  - Offline: exhaustive search over CPU/GPU allocation and module priority for each cluster of obstacle distributions (Alg. 1, p8).
  - Online: hardware counters detect h = 100 consecutive LiDAR timeouts, then the system matches the current cluster and switches plan (p9).

**Experiments & key quantitative results:**
- Perception takes "the majority (74%)" of response time (p4).
- Latency accumulates once LiDAR perception exceeds the 100 ms sampling interval (p5).
- Resource management guided by the safety score picks different plans than tail, average or maximum latency would (Fig. 10, p9–10).
- Latency-model average MSE: 1.7 × 10⁻⁴ (p10).
- Safety score is "1.3× and 4.6× higher than CPU+GPU and CPU" (p10–11).
- Response time is reduced by 2.4× and 35%, and LiDAR perception latency by 2.6× and 45% (p11).
- The hardware additions use less than 1% of total energy (p11).

**Limitations:**
- Stated by the authors: the score gives no safe/unsafe threshold (p7); σ and η are user-chosen (p6); the paper "only scratched the surface" (p11).
- Observed by us:
  - Proprietary data and in-house simulators.
  - The score is a design metric, not a formal guarantee.
  - Perception uncertainty is ignored.
  - Perception always runs at the sensor rate; only the processor allocation changes.
  - Car-following (RSS) geometry, not UAV dynamics.

**Relation to DART:**
- This is the closest computing-systems analogue to DART's scheduler: safety is judged from response time relative to a kinematic window θ derived from braking or RSS distance. DART's safe open-loop time plays the role of θ.
- Differences in how DART uses it:
  - DART computes it online for a quadrotor.
  - DART includes covariance growth and a frontier term.
  - DART uses it to decide *whether/when to run inference*. A4 uses θ to decide *which processor runs perception*.
- Contrast: A4 reduces latency; DART reduces the number of inferences while keeping safety.
- Where A4 is stronger: real fleet data and near-accident cases.

**Citable statements:**
- Standard latency metrics are inadequate for safety → p1 (abstract): "traditional computing system performance metrics, such as tail latency, average latency, maximum latency, and timeout, cannot fully satisfy the safety requirement"
- Safety depends on instantaneous response time → p6: "AV safety is determined by instantaneous response time (Figure 5), instead of statistical patterns adopted in traditional performance metrics."
- The deadline is tied to the sensing interval → p5: "the computing system has limited time (typically within one or several sensor sampling intervals) to interpret an obstacle"
- Perception dominates response time → p4: "the majority (74%) of computing system response time is consumed by perception."
- Missing the sampling interval cascades → p5: "the perception, if not completed within the sampling interval, will further delay the processing of subsequent frames."
- Nonlinearity: below the window, extra speed-up buys little safety → p7: "When t < θ , further optimizing the instantaneous response time does not significantly improve the level of safety."

**Snowball candidates:**
- Shalev-Shwartz et al., "On a formal model of safe and scalable self-driving cars" (RSS) (2017)
- Nistér et al., "The safety force field" (2019)
- Lin et al., "The architectural implications of autonomous driving: Constraints and acceleration" (2018)
- Zhu et al., "Optimization of task allocation and priority assignment in hard real-time distributed systems" (2012)

---

### A5 — TAPAS: Throughput-adaptive Perception for Autonomous Systems
Aman Vyas, Vasista Kodumagulla, Zain Taufique, Pasi Liljeberg, Anil Kanduri (University of Turku); "Accepted at ACM/IEEE International Conference on Codesign of Embedded Systems (ESWEEK-CODES), 2026" (p1).
arXiv:2607.17317v1 [cs.LG], 19 Jul 2026. The listed ID was **verified correct**: the arXiv API title and the PDF metadata both match.
Pages read: 15/15.
Status: USE (contrast: perception-rate adaptation that is explicitly *not* safety-driven)

**Problem & setting:** How many frames per second perception needs changes with scene complexity. A fixed FPS target with a static mapping of models to compute clusters on a heterogeneous multi-core processor (CPU/GPU/DLA) either under-provisions or wastes energy (p1).

**Method:**
- Throughput estimator:
  - Computes Shannon spatial entropy of the object-detection class map (Eq. 2, p6).
  - Discretises it into Nh entropy levels mapped to Nt FPS levels (Eqs. 3–4).
  - Evaluation setting: Nh = Nt = 3, Hbase = 1.5, CGh = 1.0, Tbase = 10 FPS, CGt = 5 FPS (p9), i.e. targets of 5 / 10 / 15 FPS.
- Mapper: a GRU agent trained with PPO assigns each perception model to a cluster.
  - Its reward comes from a "Reward Reasoning Model" (an LLM-based reward grounded on measured throughput and energy) (pp. 6–8).
- At runtime, the mapping is changed only when |Tv_new − Tv_curr| > ∆ (Alg. 2, pp. 8–9).
- Objective (Eq. 1, p6): throughput deficit plus energy.

**Experiments & key quantitative results:**
- Setup: Jetson Orin NX; trained on KITTI sequences 0, 1, 8, 9, 10; tested on 2–7 and on unseen nuScenes. Variable throughput is emulated "by skipping an appropriate number of frames" (p9).
- Headline results: 93–100% throughput-met rate with up to 76% energy saving on KITTI; 97% with 64% lower energy on nuScenes (p1, p14).
- TAPAS uses 0.10–0.51 normalized energy while meeting 93–100% throughput (p12).
- Energy reduction is up to 87%, 72% and 58% vs. EE, OmniBoost and Band (p13).
- The GRU policy costs 2.3 ms and 45 mJ (p10).
- When GPU unavailability rises from 0 to 25%, the met rate in the hardest region drops from 100% to 86% (p12).
- A fixed 15 FPS target "incurs 1.5-3x energy overhead in simpler regions" (p4).

**Limitations:**
- Stated by the authors:
  - Switching models could change detection quality and therefore the entropy estimate (p3).
  - Heavy model mixes degrade to 95% and 93% (p12).
  - Future work: DVFS and model approximation (p14).
- Observed by us:
  - The FPS target is a heuristic based on detected-object count/entropy. It is not linked to ego speed, distance to obstacles, braking or uncertainty.
  - The evaluation is open-loop on recorded datasets; there is no closed-loop vehicle and no collision or safety metric.
  - "Throughput met rate" is a computing metric.

**Relation to DART:**
- This is the most relevant "adaptive perception rate" work on the systems side, and a clean contrast with DART:
  - TAPAS chooses the rate from scene complexity and explicitly hands safety to downstream modules.
  - DART derives the required perception time from safety (braking distance, covariance growth, frontier) and couples it to the MPC/CBF.
- What TAPAS lacks: any safety link, uncertainty, latency compensation, or closed-loop evaluation.
- Where TAPAS is stronger: measured energy on a real embedded SoC, and multi-DNN mapping across heterogeneous clusters.
- Possible combination: DART's safety deadline could serve as the throughput target fed to a TAPAS-like mapper.

**Citable statements:**
- Fixed-FPS perception wastes or under-provisions → p1 (abstract): "existing perception strategies assume a fixed FPS and static model-to-cluster mapping, resulting in either over/under provision of throughput requirements or unnecessary energy consumption"
- Conservative high FPS wastes compute → p1: "Setting a conservatively higher FPS target offers robust navigation in dense scenes. However, this approach delivers unnecessarily higher FPS in sparse environments"
- Rate adaptation is decoupled from safety → p2: "This separation decouples perception from safety-critical reasoning"
- Typical perception rate → p3: "Typical perception module in AS operates at an average of 10 Hz (10 FPS) [4]."
- Over-provisioning cost → p4: "it incurs 1.5-3x energy overhead in simpler regions (1–3)."

**Snowball candidates:**
- **High priority:** Hsiao et al., "Zhuyi: perception processing rate estimation for safety in autonomous vehicles" (2022). Its title suggests safety-driven estimation of the perception rate — read next.
- Zhao et al., "Driving scenario perception-aware computing system design in autonomous vehicles" (2020)
- Zhao et al., "Suraksha: A framework to analyze the safety implications of perception design choices in AVs" (2021)
- Boroujerdian et al., "Roborun: A robot runtime to exploit spatial heterogeneity" (2022)
- Mohamed et al., "Energy-efficient mobile robot control via run-time monitoring of environmental complexity and computing workload" (2021)
- Shahsavari et al., "A coordinated approach to control mechanical and computing resources in mobile robots" (2025)
- Jambotkar, Guo, Jia, "Adaptive optimization of autonomous vehicle computational resources for performance and energy improvement" (2021)
- Behroozi et al., "SlimSLAM: An adaptive runtime for visual-inertial SLAM" (2024)

---

### B4 — FastDepth: Fast Monocular Depth Estimation on Embedded Systems
Diana Wofk*, Fangchang Ma*, Tien-Ju Yang, Sertac Karaman, Vivienne Sze (MIT).
arXiv:1903.03273v1 (8 Mar 2019). The arXiv copy does not print a venue; the task list says ICRA 2019.
Pages read: 8/8.
Status: USE (component evidence: latency, accuracy and power of embedded monocular depth)

**Problem & setting:** Monocular depth networks are too slow for embedded platforms such as one a micro aerial vehicle can carry. The goal is low latency on a Jetson TX2 with near state-of-the-art accuracy (p1).

**Method:**
- Encoder: MobileNet.
- Decoder ("NNConv5"): five layers of 5×5 convolution followed by nearest-neighbour upsampling; depthwise-separable convolutions; additive skip connections.
- NetAdapt pruning and TVM compilation (pp. 2–3).
- Input 224×224; trained and tested on NYU Depth v2 at batch size 1, FP32 (p4).

**Experiments & key quantitative results:**
- Table I (p4), on TX2:
  - FastDepth: 0.37 GMACs, RMSE 0.604, δ1 0.771, CPU 37 ms, GPU 5.6 ms.
  - Laina UpProj: 42.7 GMACs, RMSE 0.573, δ1 0.811, CPU 3928 ms, GPU 319 ms.
  - Eigen [11]: CPU 307 ms, GPU 23 ms.
  - Xian [37]: CPU 4429 ms, GPU 283 ms.
- Table II (p4), runtime / frame rate / power:
  - GPU max-N: 5.6 ms, 178 fps, 12.2 W (3.4 W idle).
  - GPU max-Q: 8.2 ms, 120 fps, 6.5 W (1.9 W idle).
  - CPU max-N: 37 ms, 27 fps, 10.5 W (3.4 W idle).
  - CPU max-Q: 64 ms, 15 fps, 3.8 W (1.9 W idle).
- "65 times" speed-up over the ResNet-50 UpProj baseline (p4).
- Pruning, Table VII (p6): MACs 0.74G → 0.37G; CPU 66 → 37 ms; GPU 8.2 → 5.6 ms; δ1 0.775 → 0.771.

**Limitations:**
- Stated by the authors: slightly lower accuracy than the state of the art; depthwise layers are slow in standard frameworks, so TVM is needed (pp. 5–6); "the error is highest at boundaries and at distant objects" (p4).
- Observed by us:
  - Indoor NYU data only.
  - No uncertainty output.
  - No closed-loop robot test.
  - Cross-domain scale was not tested.
  - The pruning prose on p6 says "1.8 times reduction in GPU runtime", but Table VII shows 1.8× is the CPU reduction (typo in the paper).

**Relation to DART:**
- Supports DART's perception premise: learned monocular depth on an embedded accelerator, with explicit trade-offs between latency, accuracy and power.
- Gives citable numbers showing that depth-network latency on a TX2 spans about 5.6–319 ms on GPU and 37–4429 ms on CPU depending on the architecture, and that active power is several watts. This motivates saving energy by running fewer inferences.
- Supports modelling depth error that grows with distance.
- Honest caveat: FastDepth itself is fast (5.6 ms GPU). DART's assumed tens-to-hundreds of ms corresponds to heavier/more accurate networks, CPU or low-power modes, or shared compute.
- What B4 does NOT do: anything closed-loop, scheduling, or uncertainty.

**Citable statements:**
- Accurate monocular depth networks are too slow for embedded use → p1: "state-of-the-art single-view depth estimation algorithms are based on fairly complex deep neural networks that are too slow for real-time inference on an embedded platform"
- Latency vs. accuracy is the core trade-off → p1: "a key challenge is balancing the computation and runtime cost with the accuracy of the algorithm."
- Compute is shared with other tasks → p2: "the CPU/GPU is not dedicated to the depth estimation task alone."
- Error grows at distance and at edges → p4: "the error is highest at boundaries and at distant objects."
- Speed and power → p1: "FastDepth, runs at 178 fps on an NVIDIA Jetson TX2 GPU and at 27 fps when using only the TX2 CPU, with active power consumption under 10 W."

**Snowball candidates:**
- Mancini et al., "Fast robust monocular depth estimation for obstacle detection with fully convolutional networks" (2016)
- Laina et al., "Deeper depth prediction with fully convolutional residual networks" (2016)
- Ma & Karaman, "Sparse-to-dense: depth prediction from sparse depth samples and a single image" (2018)
- Yang et al., "NetAdapt: Platform-aware neural network adaptation for mobile applications" (2018)

---

### B5 — MonoNav: MAV Navigation via Monocular Depth Estimation and Reconstruction
Nathaniel Simon, Anirudha Majumdar (Princeton).
arXiv:2311.14100v1 (23 Nov 2023); "As seen at ISER 2023" (p1 footnote).
Pages read: 13/13.
Status: USE (closest system-level prior: learned metric monocular depth → map → planning on a MAV)

**Problem & setting:** Can a micro aerial vehicle (≤ 100 g; here a 37 g Crazyflie) with only a monocular camera, optical-flow odometry and offboard compute build a metric 3D map good enough for classical planning (pp. 1–3)?

**Method:**
- Images are undistorted and warped to the intrinsics of the camera the depth model was trained with (p4).
- ZoeDepth (ZoeD_N) produces metric depth per frame.
- Depth is fused into a TSDF map (Open3D VoxelBlockGrid) using optical-flow poses (p4).
- Planning uses a library of Dubins-car motion primitives. The chosen primitive minimises distance to the goal subject to keeping a clearance ≥ c from occupied voxels (Eq. 2, p4).
- If no primitive is feasible, the vehicle stops and lands (p5).

**Experiments & key quantitative results:**
- Depth accuracy vs. Kinect Azure over 77 frames (Table 1, p6): δ1 0.62, δ2 0.85, δ3 0.95, REL 0.48, RMSE 1.05 m, log10 0.11, point-cloud distance 0.41 m.
- Timing (p6):
  - Camera lag 0.12 s; ZoeDepth 0.11–0.16 s per frame; fusion 0.02 s; primitive selection 0.01 s.
  - Depth and integration run at 3–4 Hz; replanning at 1 Hz.
  - Compute is offboard on an RTX 4090 (p5).
- Navigation at V = 0.5 m/s: 15 runs in 10 settings, with 1 crash and 1 premature termination (p7).
- Against NoMaD, 15 trials each in 5 environments (Table 2, p9):
  - % to goal: 47.4% (MonoNav) vs. 61.0% (NoMaD).
  - Collision rate: 0.13 vs. 0.53.

**Limitations:**
- Stated by the authors:
  - Results depend on reconstruction quality: analog-camera noise blobs and overexposed pixels become phantom obstacles (p11).
  - Sensitive to state-estimation error (p11).
  - Narrow field of view, so the depth used for planning was "seen 1.5 meters or 3 planning cycles ago" (p11).
  - Unexplored space is treated as free, which caused a crash (p7, p11).
  - Fusion and planning slow down as voxels accumulate (p6).
- Observed by us:
  - Very low speed (0.5 m/s).
  - The paper does not say how the 0.12 s camera lag is handled when associating poses with images.
  - The only uncertainty handling is the fixed margin c.
  - Fixed rates.

**Relation to DART:**
- Its perception front end is closest to DART's: pre-trained metric monocular depth with 0.11–0.16 s inference plus 0.12 s lag at 3–4 Hz, and RMSE 1.05 m. This gives real-world numbers for DART's latency, rate and error regime.
- DART targets exactly the gaps MonoNav reports:
  - Unexplored treated as free → DART's frontier term.
  - Noise causing over-conservatism with a fixed margin c → DART's covariance-calibrated inflation.
  - Lag and stale data → DART's capture-time pose buffer and safe open-loop time.
- MonoNav's "stop and land if nothing is safe" is a fallback similar to DART's braking-distance CBF.
- Where MonoNav is stronger: real hardware on a 37 g MAV, whereas DART is simulation only.

**Citable statements:**
- Learned monocular depth is slow and laggy in practice → p6: "The camera has a measured lag of 0.12 s, per-frame depth estimation with ZoeDepth takes 0.11-0.16 s"
- Low perception and planning rates → p6: "Camera readings, depth estimation, and integration occur at 3-4 Hz and replanning occurs at 1 Hz."
- Unseen space treated as free is unsafe → p11: "MonoNav does not distinguish between explored and unexplored regions; unexplored regions are considered unoccupied."
- Uncalibrated noise leads to conservatism → p8: "Noise in the state and depth estimates translates to noise in the point cloud, so MonoNav is typically over-conservative"
- Map-based monocular navigation reduces collisions → p11: "MonoNav is able to reduce collision rates by a factor of 4"
- Sensitivity to state estimation → p11: "reconstruction quality (and utility) is sensitive to errors in state estimation."

**Snowball candidates:**
- Bhat et al., "ZoeDepth: Zero-shot transfer by combining relative and metric depth" (2023)
- Sridhar et al., "NoMaD: Goal masked diffusion policies for navigation and exploration" (2023)
- Ranftl et al., "Towards robust monocular depth estimation: Mixing datasets for zero-shot cross-dataset transfer" (2020)
- Kang et al., "Generalization through simulation: Integrating simulated and real data into deep RL for vision-based autonomous flight" (2019)

---

## Group synthesis
- **Latency vs. safe speed is well established, but only as a one-shot, deterministic bound.**
  - A1 derives τ̄ = s/v − 2·sqrt(r/ū) and v̄ = s/(τ + 2·sqrt(r/ū)), assuming ideal sensing, static obstacles and constant forward speed.
  - A2 adds rotation time and uses the bound to rank pipelines by processing latency (vmax 12.0 / 13.2 / 13.5 m/s).
  - A3 reuses A2's formula.
  - None of them turns the bound into a *runtime* rule for when to perceive next.
- **Learned perception inference, not the sensor, is the latency bottleneck on small platforms:**
  - A2: 38.9 of 41.6 ms onboard on a TX2.
  - A3: 73 ms onboard, "magnitudes larger" than event-camera latency.
  - B5: 0.11–0.16 s inference plus 0.12 s camera lag, at 3–4 Hz.
  - B4: 5.6–319 ms on GPU and 37–4429 ms on CPU across depth networks on a TX2, at several watts.
- **Monocular metric depth error is large and depends on distance** (B5: RMSE 1.05 m, δ1 0.62; B4: error is highest at boundaries and distant objects).
  - The UAV systems here handle it with fixed margins (B5's c) or implicitly through learning (A2, A3). None propagates calibrated uncertainty into constraints.
- **Treating unseen space as free causes failures** (B5 crash; A2's real-world failures at 7 m/s when objects entered the field of view late).
  - This supports a frontier or sensing-range term in the safety condition, as in A1's s/v.
- **Computing-systems work recognises that safety depends on instantaneous response time relative to a kinematic window** (A4: θ derived from RSS; "traditional ... metrics ... cannot fully satisfy the safety requirement").
  - But A4 uses this to allocate processors, not to decide when to perceive, and ignores estimation uncertainty.
- **Adaptive perception *rate* exists (A5), but it is driven by scene complexity and energy and is explicitly decoupled from safety.**
  - It is evaluated open-loop on datasets with a throughput-met metric, not collisions.
  - Its own references point to the closest prior that is *safety-driven* (Zhuyi, DAC 2022, "perception processing rate estimation for safety"). It must be read before claiming novelty.
- **Open gap DART can fill** (as far as this group shows):
  - Making *when to perceive* a runtime decision tied to a safety certificate.
  - Computing that decision from braking distance, closing speed, covariance growth since the last capture-time update, and a frontier term.
  - Closing the loop with an uncertainty-inflated MPC/CBF.
  - Quantifying how many inferences and how much energy are saved at equal safety, which neither A4 nor A5 measures in closed loop.
- **Honest caveats for positioning:**
  - A1's supplementary material shows lateral evasion is faster than braking at high speed, so a braking-only safe time is conservative.
  - A1, A2, A3 and B5 all have hardware results; DART is simulation-only.
  - FastDepth shows a light network can run at 5.6 ms on an embedded GPU. DART's latency regime should be justified with heavier metric-depth models (e.g. B5's ZoeDepth) or with low-power/shared-compute settings.
