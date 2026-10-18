# Group 9b — Limited-FOV collision avoidance (Roelofsen et al.) and an embedded CBF safety filter for multirotors (arXiv:2504.15850)

**Files read (every page)**
* `scratchpad/papers/g9_dl/roelofsen_icra2017.pdf` (6 pages), using `.txt` (layout) and `.raw.txt`.
* `scratchpad/papers/g9_dl/cbf_multirotor_2504.15850.pdf` (8 pages), using `.txt` (layout) and `.raw.txt`.
* Every page of both PDFs was also rendered at 80 dpi and inspected. Higher-resolution crops were used for:
  * Roelofsen Fig. 6 (p.6, 200 dpi);
  * Misyats et al. Table I + Fig. 5 (p.5), Fig. 7 (p.6), Table II and Fig. 9 (p.7) (150 dpi).
* The images are in `scratchpad/img_g9b/`.

**Conventions**
* **Page numbers.** *p.N* is the PDF page index: count the form feeds in the `pdftotext` output, with the first page = 1. Neither PDF prints proceedings page numbers.
* **Quotes.** Text in double quotes is verbatim, with whitespace normalised. Quotes were checked with `docs/literature/verify_quotes.py`.
* **Equations.** They are written outside quotes and were read from the rendered page images.
* **Inferences.** My own inferences and arithmetic are marked *(our inference)*.
* **IDs.** FV1 and FV2 are provisional, group-local IDs. The final reading-list IDs are still to be assigned.

---

### FV1 — Collision Avoidance with Limited Field of View Sensing: A Velocity Obstacle Approach

**Bibliographic data, as printed in the PDF**
* **Authors:** Steven Roelofsen (1,2), Denis Gillet (2), Alcherio Martinoli (1).
* **Affiliations (p.1):**
  * (1) Distributed Intelligent Systems and Algorithms Laboratory, School of Architecture, Civil and Environmental Engineering, École Polytechnique Fédérale de Lausanne;
  * (2) Coordination and Interaction System Group, School of Engineering, École Polytechnique Fédérale de Lausanne.
* **Not printed:** venue, year, DOI, page numbers.
  * The ICRA 2017 attribution comes only from our earlier search results.
  * The PDF metadata (not the printed text) gives creation date 2017-02-25.
* **Funding (p.1):** Honeywell, with coordination by the EPFL Transportation Center.
* **Project/video URL (p.4, footnote):** http://disal.epfl.ch/research/UAVCollisionAvoidance.
* **Pages read:** 6/6, including the references.

**Status:** USE (narrow).
* It gives the formal argument that limited-FOV sensing requires restricting the velocity to a set derived from the FOV (claim a). It also shows that this guarantee disappears for a FOV half-angle below 90°, which covers all our cameras.
* However, the setting is planar, reciprocal, multi-robot velocity-obstacle avoidance with the FOV emulated from motion capture. It has no static obstacles, no depth perception and no CBF.

**Problem & setting:**
* The authors study collision avoidance between robots under a limited FOV, within the velocity-obstacle (VO) paradigm. p.1: "In this paper, we present our approach to perform collision avoidance within the VO paradigm when the robots are only able to detect other robots in a limited FOV."
* The gap they identify:
  * p.1: "While many collision avoidance algorithms take into account actuation constraints, only a few consider sensing limitations."
  * p.1: "assuming that each robot is able to sense every other robot. The effect of a robot’s Field Of View (FOV) on maneuvering is not well studied."
* **Robots.** N disc-shaped robots in the plane.
  * Each has a speed limit ‖v_H‖ ≤ v_H^max and a maximum speed change Δv_H^max per time step Δt (actuation set U_H, eq. 1, p.1).
  * Each has a turn-rate limit θ̇_H^max.
  * p.1: "The robot is also assumed to be able to come to a full stop."
* **Sensor model** (eq. 2, p.1, read from the page image).
  * The sensor sees a circular sector: F_H = {p : ‖p − p_H‖ < r_s, |∠(d_H, p − p_H)| ≤ α_s}.
  * α_s is the FOV half-angle, assumed to lie between π/2 and π (p.2; read on the page image).
  * Perception is idealised. p.2: "A robot H is able to estimate the position, velocity, and radius of a detected robot B if it is in the sensor’s range and FOV of robot H."
* **Why state-of-the-art VO fails.** p.2: "State of the art VO-based algorithm will fail to avoid in some situation. This is because the sensor’s limited FOV is in contradiction with the assumption that every robot has at least a noisy estimate of other robots’ states."
* **Contributions (p.1):**
  * show the consequences of ignoring the FOV;
  * formulate conditions for safe manoeuvring;
  * present SAVO. p.1: "we present our Sensor-Aware Velocity Obstacle (SAVO) algorithm that guarantees no collision under limited FOV constraints."

**Method:**
* **Key idea.** p.2: "The main concept of collision avoidance under FOV sensing constraints is to limit the motion of the robots in order to guarantee that they cannot collide with each other because of their intrinsic blind zones."
* **Sensor-constraint set** (eq. 3, p.2, from the page image).
  * Definition: S_H = {v : |∠(v, d_H)| ≤ α_s − π/2}. The velocity must lie within (α_s − 90°) of the sensor heading.
  * Lemma 1, p.2: a robot with v_A ∈ S_A "will not go towards the position of another robot B that robot A is unable to detect".
  * Proposition 1, p.2: "Two robots A and B that do not detect each other are guaranteed to be collision free if and only if" both velocities are in their sensor-constraint sets.
  * The *only if* part is proved by constructing a collision whenever v_A ∉ S_A (p.2).
  * The paper also derives S_H directly from the VO framework. The worst case is that the unseen robot is stopped anywhere outside the FOV, which makes the unsafe set I a half-plane condition (eq. 5, p.2).
* **No guarantee for narrow FOV.** Remark 2, p.2: "The angle αs has to be larger than π/2 for the sensor-constraint set to exist. If αs < π/2, then no guarantee about collision can be given." The risk for that case is referred to [11] (Zhang, Leng, Govindaraju, Robotica 2016).
* **Velocity obstacle with estimation error** (eq. 6, p.3).
  * VO^τ_{H|B} = {v : ∃t ∈ [0, τ], t·v ∈ D(p_B − p_H, r_B + r_H + σ_r) ⊕ Σ_p}.
  * p.3: "with Σp a set of possible position error and σr the error on the estimated radius."
* **Braking/horizon conditions** (eq. 7, p.3).
  * τ > (v_max/Δv_max)·Δt.
  * v_max < √(Δv_max·r_s/Δt).
  * p.3: "the maximum velocity should remain low enough in order for the robot to come at a full stop in less than half its sensor range."
* **Conservative collision set** (eqs. 8–9, p.3).
  * The other robot's actuation set is augmented with velocity uncertainty and with zero velocity: U⁰_B = Conv({U_B ⊕ Σ_v, (0,0)}).
  * The collision set is C^τ_{H|B} = VO^τ_{H|B} ⊕ U⁰_B.
  * p.3: "we take the conservative approach to build the set of velocities that will lead to a collision with robot B".
* **Velocity selection** (eqs. 10–11, p.3).
  * The admissible set is CA^τ_H = {v ∉ ∪_B C^τ_{H|B}, v ∈ S_H ∩ U_H}.
  * The robot picks the velocity on ∂CA closest to v_pref. If CA is empty, it commands zero velocity as a last-resort manoeuvre.
* **Safety proof.** Proposition 2 (p.3) states that N robots using eq. 11 do not collide. The empty-set case relies on eq. 7. p.3: "In which case all robots have, according to the conditions of Equation 7, enough time to come to a full stop before colliding with the other robots."
* **Heading control** (eqs. 12–13, pp.3–4).
  * p.3: "we propose to steer the sensor heading based on the robot’s velocity outputted by the collision avoidance algorithm."
  * The control law is u = −k_a ∠(d_H, v_H). In deadlock (CA = ∅) the robot instead spins at θ̇^max.
  * The gain is k_a = θ̇^max/(α_s − π/2).
  * p.3: "The control of the robot’s heading, and thus the sensor’s FOV, is essentially what allows SAVO to reach any point in the plane".
* **Reciprocity** (eq. 14, p.4).
  * p.4: "it is not always possible for a robot to know if it is seen by an other robot, especially when the sensors are noisy."
  * The robot applies the half-step velocity (v_new + v_prev)/2 if that velocity is collision-free.
* **Implementation** (p.4).
  * p.4: "the sets are implemented as convex polytopes".
  * p.4: "This method is thus well suited for robots with a small sensor range or that navigate in sparsely populated environments."

**Quantitative results:**
* **Simulation parameters** (p.4, text):
  * r = 0.4 m, r_s = 2.5 m, α_s = 110°;
  * Δv_max = 0.12 m/s, v_max = 4 m/s, θ̇_max = 0.5 rad/s;
  * τ = 1 s, time step Δt = 0.05 s;
  * identical for SAVO and the FOV-unaware VO baseline.
* **Derived quantities (our inference).**
  * α_s is the half-angle, so the simulated FOV is 220° and S_H is the cone within ±20° of the heading.
  * k_a = 0.5/0.349 ≈ 1.43 s⁻¹.
  * With these printed values, eq. 7 would require τ > 1.67 s and v_max < √6 ≈ 2.45 m/s. The printed τ = 1 s and v_max = 4 m/s do not satisfy eq. 7 as printed. Preferred speeds in simulation are not printed.
* **Simulation scenario 1** (Fig. 2, p.4; text p.5).
  * Two robots start back-to-back. The FOV-unaware VO collides (top plot).
  * Under SAVO, the faster robot waits until it has turned. p.5: "the faster robot stays at the same position until it has turned enough for the sensor to see a clear path towards the destination".
* **Simulation scenario 2** (Fig. 3, p.5).
  * Four robots; the FOV-unaware VO collides and SAVO does not. p.5: "With the SAVO algorithm, the two slow robots will stop instead and remain safe".
  * The results are trajectory plots only. The paper gives no run counts or statistics for the simulations.
* **Experiments** (pp.5–6).
  * **Platform:** two AscTec Hummingbird quadrotors (Fig. 4, p.5), each with an ARM-based CPU running Linux and ROS.
  * **Arena:** a room of 11.8 m × 9.8 m × 5 m with motion capture. p.5: "Each quadrotor receives the pose of both quadrotors through WiFi at 100 Hz."
  * **Sensing is emulated.** p.5: "The sensor range and FOV is emulated before the MCS data is used in the SAVO algorithm."
  * **Parameters:** Δv_max = 0.3 m/s and preferred speed s_pref = 0.6 m/s (p.5). All other parameters are as in simulation.
  * **Scenarios:**
    * head-on: start at [3.5, 0] m and [−3.5, 0] m, goals swapped;
    * crossing: [−3.5, 2] → [3.5, −2] m and [3.5, 2] → [−3.5, −2] m.
  * **Outcome.** p.6: "Each scenario was run at least 19 times and at no moment did the distance between the robots drop below 0.8 m, the distance at which they would collide."
  * **Minimum distances** (Fig. 6, p.6). Read from the 200-dpi render, so the values are approximate:
    * head-on: whiskers ≈ 1.05–1.52 m, median ≈ 1.25 m;
    * cross: whiskers ≈ 1.13–1.68 m, median ≈ 1.47 m.
* **Computation.** No computation time or controller rate is printed for SAVO. The paper only states the complexity, O(n²) in the number of observed robots (p.4).

**Limitations stated by the authors:**
* p.5: "Those scenarios are to demonstrate that the algorithm is able to run on a real platform rather than to show the consequences of a limited FOV."
* p.6: "This is a consequence of the conservative approach required by the limited FOV of the robots."
* p.4: "This has the drawback to be more computationally heavy and in principle scale with" O(n²).
* pp.5–6, on the braking overshoot:
  * p.5: "This is an overshoot of the braking maneuver and is inherent to the propulsion method of the" quadrotor.
  * p.6: "It can be accounted for by increasing the radius of the quadrotors in the SAVO algorithm."
* p.6: "As future work, the relation between reciprocity and FOV should be investigated".
* p.6: "Other future work would extend this work to the third dimension for aerial applications. Finally, the possibility of deadlocks and means to mitigate them should be investigated."
* Remark 2, p.2 (repeated from Method): "If αs < π/2, then no guarantee about collision can be given."

**Citable statements:**
1. Phần lớn thuật toán tránh va chạm giả định mỗi robot cảm nhận được mọi robot khác; ảnh hưởng của FOV lên điều động ít được nghiên cứu.
   * p.1: "assuming that each robot is able to sense every other robot. The effect of a robot’s Field Of View (FOV) on maneuvering is not well studied."
2. Nguyên tắc tránh va chạm khi FOV hạn chế là giới hạn chuyển động của robot để vùng mù không thể dẫn tới va chạm.
   * p.2: "The main concept of collision avoidance under FOV sensing constraints is to limit the motion of the robots in order to guarantee that they cannot collide with each other because of their intrinsic blind zones."
3. Bảo đảm này chỉ tồn tại khi nửa góc FOV lớn hơn 90° (FOV > 180°). Với FOV hẹp hơn (như mọi camera 62–102° của ta), không thể đưa ra bảo đảm không va chạm theo cách này.
   * p.2: "The angle αs has to be larger than π/2 for the sensor-constraint set to exist. If αs < π/2, then no guarantee about collision can be given."
4. Thuật toán tránh va chạm không tính tới FOV có thể dẫn robot vào va chạm ngay trong lúc né tránh: thao tác né gắt khiến robot lao vào vật nó không thấy.
   * p.5: "In case where the algorithm is not respecting the constraints imposed by the sensor, the slow robots will perform an aggressive maneuver towards each other to avoid the faster robots. That maneuver will lead them to collide"
5. Tốc độ tối đa phải đủ thấp để robot dừng hẳn trong (một nửa) tầm cảm biến.
   * p.3: "the maximum velocity should remain low enough in order for the robot to come at a full stop in less than half its sensor range."
6. Quadrotor tịnh tiến linh hoạt hơn quay yaw, nên ràng buộc FOV đặc biệt quan trọng với quadrotor.
   * p.5: "quadrotors typically are more agile at translational compared to yaw rotation, making it an ideal case study for the SAVO algorithm."
7. Hướng cảm biến được lái theo vận tốc do bộ tránh va chạm xuất ra.
   * p.3: "we propose to steer the sensor heading based on the robot’s velocity outputted by the collision avoidance algorithm."
8. Thực nghiệm với hai quadrotor (≥ 19 lần mỗi kịch bản) không có va chạm. Tuy nhiên FOV được giả lập từ motion capture, và kết quả bảo thủ do FOV hạn chế.
   * p.6: "Each scenario was run at least 19 times and at no moment did the distance between the robots drop below 0.8 m"
   * p.5: "The sensor range and FOV is emulated before the MCS data is used in the SAVO algorithm."

**Relation to our method:**
* **Introduction / Related work (claim a).** This is the cleanest formal statement that a limited FOV forces a restriction of motion to a FOV-derived velocity set (S_H). It also states that ignoring this restriction causes collisions (Figs. 2–3).
* **Method.**
  * Our blind-motion CBF rows play the role of S_H in a relaxed form (our inference). We cap the speed away from the camera viewing direction (1.5 m/s) and the speed beyond the FOV edges (1 m/s). S_H instead forbids any velocity outside a cone.
  * For our cameras the half-angle is 31°, 33° or 51°, all below 90°. By eq. 3 / Remark 2, S_H is then empty and their guarantee does not apply. This is why we need obstacle memory plus soft speed caps rather than a hard sensor-constraint set (our inference).
  * Their VO inflates the radius by an estimation error σ_r and a position-error set Σ_p (eq. 6). This parallels our covariance-inflated radius d = ρ + d_s + β·σ (our inference).
  * Their eq. 7 (stop within half the sensor range) is the same physical idea as our scheduler horizon v·τ + v²/(2a_b) + d_s and our braking CBF (our inference).
  * Their heading control (steer the sensor towards the commanded velocity) is related to keeping the motion inside the observed region. We do not control yaw explicitly, as far as the method summary goes (our inference).
* **Discussion.** Their scenario 2 parallels our observation that collisions happen during detours, when obstacles beside the vehicle leave the FOV (our inference). In both cases the avoidance manoeuvre carries the vehicle into a region it does not see. Their agents are moving robots; ours are static cylinders.
* **Differences.**
  * Their agents are mutually moving robots with idealised state estimates; ours are static obstacles perceived through learned monocular depth with about 0.1 s latency.
  * They work in a planar VO formulation; we use MPC plus a CBF filter.
  * Their FOV is 220° in simulation and is emulated from motion capture.
  * They do not study perception rate or latency.

**Caveats:**
* **Venue.** The PDF prints no venue, year or DOI. Cite it as ICRA 2017 only after checking the publisher record; this was not done here, because no web search was allowed.
* **Sensor assumption.** The guarantee requires a FOV half-angle above 90°. Their simulation FOV of 220° is far wider than any camera we use.
* **Weak quantitative evidence.**
  * The simulations are single illustrative trajectories.
  * The hardware runs are 2 scenarios × ≥ 19 runs with 2 vehicles, at 0.6 m/s preferred speed, with emulated sensing and motion capture.
  * The printed simulation v_max and τ do not satisfy their own eq. 7 (our arithmetic).
* **Scope.** The algorithm is planar, multi-robot and reciprocal. It is not about static-obstacle avoidance with onboard depth sensing.

---

### FV2 — Embedded Safe Reactive Navigation for Multirotors Systems using Control Barrier Functions

**Bibliographic data, as printed in the PDF**
* **Title:** printed with "Multirotors Systems" (sic).
* **Authors:** Nazar Misyats (1,2), Marvin Harms (2), Morten Nissov (2), Martin Jacquet (2), Kostas Alexis (2).
* **Affiliations (p.1):**
  * (1) École normale supérieure de Rennes, France;
  * (2) Autonomous Robots Lab, Norwegian University of Science and Technology (NTNU), Trondheim, Norway.
* **arXiv:** arXiv:2504.15850v1 [cs.RO], 22 Apr 2025 (arXiv stamp on p.1).
* **Not printed:** venue (the ICUAS 2025 attribution is from a search snippet only), DOI.
* **Code (p.1):** https://github.com/ntnu-arl/PX4-CBF.
* **Funding (p.1):** EC Horizon Europe DIGIFOREST (EC 101070405) and SPEAR (EC 101119774); Research Council of Norway Award NO-321435.
* **Pages read:** 8/8, including the references.

**Status:** USE.
* It is a CBF safety filter running fully onboard a real small multirotor with depth (ToF) sensing. The paper prints:
  * the hardware: ModalAI VOXL2 mini;
  * the sensing rate: 15 Hz;
  * the controller rate: 100 Hz;
  * the solve times.
* It adds a FoV CBF that keeps the velocity inside the sensor frustum, which is a direct precedent for our blind-motion rows.
* It supports claims (a) and (b). It supports claim (c) only weakly: there is one unquantified statement that a measurement rate of 10 Hz or higher is adequate (p.5).

**Problem & setting:**
* **Mapless, reactive, instantaneous sensing.** p.3: "we do not assume any knowledge of a consistent global map nor online reconstruction of such a map from sequential observations. Instead, the method relies entirely on instantaneous measurements of an on-board range sensor".
* **Motivation against map-based avoidance.** p.1: map-based approaches "can be computationally demanding and particularly sensitive to localization errors, map drift, and tracking imperfections".
* **Open problem.** p.1: "However, the application of these reactive methods using data from exteroceptive sensors remains an open challenge."
* **Target platform.** p.1: "this paper contributes a safe control architecture designed to be embedded on commonly used flight controller boards and specifically PX4".
* **Model.** Translational double integrator with acceleration input (eq. 5, p.3). p.3: "the nonlinear attitude dynamics can be controlled by an inner-loop controller. We therefore approximate the translation dynamics as a linear system of the form".
* **Sensor assumption.** p.3: "The density of measurements and the Field-of-View (FoV) of the sensor are assumed to be sufficient for capturing the relevant geometry of the environment in terms of obstacle avoidance".
* **Safety specification.** The distance to each measured obstacle point must stay at least ε: ‖_B p_i‖ ≥ ε (p.3).
* **FOV impossibility statement.** p.3: "It should be emphasized that completely safe, mapless navigation with a sensor with a FoV under 180◦ cannot be achieved considering arbitrary motions."
  * Fig. 3 caption, p.3: the vehicle "will approach the obstacles (red) located just outside the FoV if the angles" between the velocity and the FoV edges are less than π/2.

**Method:**
* **Architecture** (Fig. 4, p.4).
  * The filter sits between the PX4 velocity controller and the acceleration/yaw-to-attitude block.
  * p.4: "The filter receives the nominal acceleration setpoint asp from the velocity controller and a set of n measured obstacle positions".
* **Obstacle CBF** (eqs. 6–8, pp.3–4, from the page images).
  * Each range point is a sphere centre. p.3: "range observations which are treated as the centroids of spherical obstacles".
  * Distance constraint: ν_{i,0} = ‖p_i − p‖² − ε².
  * Exponential CBF (ECBF): ν_{i,1} = ν̇_{i,0} − p₀ν_{i,0} = −2vᵀ(p_i − p) − p₀ν_{i,0}, with pole p₀ < 0.
  * Composite soft-min: h = −(γ/κ) ln Σ_i exp[−κ·s(ν_{i,1}/γ)], with s = tanh.
  * Lie derivatives: eqs. 9–12.
  * Class-K function (eq. 13): α(h) = α·h if h ≥ 0, else h/(1/α + |h|).
  * Composition is from Molnar & Ames [23]. The ECBF construction is from Nguyen & Sreenath [22]. Its initial-condition requirement is assumed. p.2: "the above theorem poses requirements on the initial conditions, where we assume these are satisfied for the remainder of this work."
* **FoV CBF** (eqs. 14–16, p.4).
  * Exact version: c_j = _B e_jᵀ R_BI v, where e_j is the inward normal of a frustum plane. It has mixed relative degree.
  * Approximation in the yaw-aligned frame V: h_fj = _V e_jᵀ R_VI v ≥ 0, i.e. the velocity lies inside the horizontal frustum wedge. p.4: "This approximation holds for small roll and pitch angles encountered in non-agile maneuvers".
  * The derivative is ḣ_fj = e_jᵀ R_VI a + e_jᵀ Ṙ_VI v. The second term is neglected (L_f h_fj = 0) because yaw rates are small.
  * p.4: "We therefore only consider two horizontal constraints in the remainder of this work."
* **QP** (eq. 17, p.4).
  * Objective: min (a − a_sp)ᵀH(a − a_sp) + Σ ρδ_fi.
  * The obstacle CBF is a hard constraint.
  * The two FoV CBFs are softened with slacks δ_fi ≥ 0. p.4: "This avoids feasibility issues in the QP due to imperfect acceleration tracking, noisy observations, and state estimates."
* **Obstacle measurement pipeline** (pp.4–5).
  * p.4: "the initial point cloud is sparsified (down to, e.g., 100 points)". This is done by taking the minimum range within angular bins.
  * The points are sent as 20-point uORB chunks. They are kept in a circular buffer, removing older points as new messages arrive.
  * The filter is computed in the body frame (Algorithm 1, p.5).
* **Solvers** (p.5).
  * qpOASES, modified to compile for PX4 micro-controllers.
  * Without FoV constraints, the closed-form solution a* = a_sp + max{0, η}·L_g hᵀ (eqs. 18–19), citing [28].
* **Chattering mitigation** (eq. 20, p.5).
  * A first-order low-pass filter is applied before and after the QP: ȧ_filt = (a − a_filt)/τ.
  * p.5: "This is particularly important when the FoV constraints are present due to their intersection in the hover state, making the set of safe accelerations non-smooth."
* **Tuning recipe** (p.6).
  * Step 1 is to tune the low-level controllers first: p.6: "targeting a rise time of 100 ms-200 ms for the roll and pitch axis".
  * α and p₀ act as the acceleration and velocity gains of the filter.

**Quantitative results:**
* **System setup** (p.6, text).
  * p.6: "makes use of a ModalAI VOXL2 mini compute unit, which serves the role of both the onboard computer and flight controller".
  * Monocular VIO: ROVIO.
  * Depth sensor: pmd flexx 2 wide ToF. p.6: "The ToF range measurements are clamped at 5 m."
  * p.6: "A maximum of 100 obstacles are obtained from the sparsified range measurement at a rate of 15 Hz."
  * Implementation in C++ in PX4.
  * The FOV of the ToF sensor is not printed.
* **Timing** (p.6).
  * p.6: "It takes in average 50 µs with 25 obstacles and 400 µs with 200 obstacles." This covers the analytic QP plus CBF composition, which scales linearly with the number of obstacles.
  * p.6: "The solving of the FoV-constrained QP problem takes, on average, 2 ms with spikes up to 2.5 ms".
  * p.6: "which does not induce any significant delay in the position controller running at 100 Hz."
* **Sensing rate** (p.5).
  * p.5: "The measurements are assumed to arrive at a sufficiently high frequency to prevent significant noise in the CBF constraint. Our evaluation indicates that a rate of 10 Hz or higher is adequate."
  * The paper shows no data for this rate evaluation.
* **Parameter ranges** (Table I, p.5, checked on the 150-dpi render):

  | Parameter | Range | Effect when increasing |
  |---|---|---|
  | ε | > 0 | Larger avoidance radius |
  | κ | [10, 100] | Less smooth approximation |
  | γ | [10, 100] | Reacts to farther obstacles |
  | α | [1, 3] | Increase filter sensitivity |
  | p₀ | [−3, −1] | Damped response |
  | α_f | [2, 8] | Aggressive FoV response |
  | τ | [0.01, 0.1] | Stronger accel smoothing |

* **Parameters used** (Table II, p.7, render): ε = 0.7, κ = 70, γ = 40, α = 2, p₀ = −2.5, α_f = 6, τ = 0.5.
  * τ = 0.5 lies outside the Table I range (our observation).
* **Fig. 5** (p.5) shows simulated filter responses past circular obstacles for p₀ ∈ {−3, −1, −0.5} and κ ∈ {10, 15, 30}.
* **Experiment 1** (p.7; Figs. 6–7, p.6). A joystick operator tries to crash the drone in a university hallway.
  * p.7: "The safety filter deflects the quadrotor above and around obstacles and brings it to a full stop in front of a wall."
  * p.7: "It can be seen that the CBF are almost entirely positive, indicating the UAV remains within the safe set and avoids collisions."
  * Fig. 7, read from the render (approximate):
    * the run lasts about 27 s;
    * h dips slightly below 0 near t ≈ 10 s and at the end;
    * h₁ dips to about −0.1 around t ≈ 16 s.
* **Experiment 2** (p.7; Figs. 8–9).
  * p.7: "the robot is set to track an aggressive ellipse trajectory, achieving velocities of up to 2.75 m/s and accelerations of 4 m/s2".
  * A panel is inserted at about t = 20 s, during the third round (Fig. 9 caption).
  * p.7: "the composite CBF remains positive, while one of the FoV CBFs shows slight negative values repeatedly."
  * Fig. 9, read from the render (approximate): h₂ reaches about −0.3 near t ≈ 4 s and goes slightly negative near t ≈ 26 s and t ≈ 36 s.
* **What is not reported (our observation from the full text):**
  * number of trials;
  * collision counts;
  * minimum-distance statistics;
  * baselines;
  * flight speed in Experiment 1.

**Limitations stated by the authors:**
* p.7: "One Limitation of the current architecture is the absence of obstacle information outside the sensor frustum, which can result in suddenly appearing or disappearing obstacles. This may cause non-smooth and jerky behavior of the safety filter in close proximity to the environment."
* p.7: "This is a common issue of mapless methods and can be resolved using appropriate sensors with a large FoV."
* p.7 (sentence begins with the words One further, which the text extraction places before the Fig. 8 caption): "limitation of the approach is its sensitivity to erroneous obstacle measurements."
* p.7: "other sensor modalities, such as stereo depth, tend to be noisy and prone to outliers. Since the used CBF formulation is sensitive to outliers, the obstacle measurements should be filtered appropriately."
* p.7: "the additional FoV constraints deteriorate tracking performance since lateral accelerations are constrained by the corresponding CBFs."
* p.7: "the larger yaw rates at significant velocities at the vertex of the ellipse can cause a skidding motion, which can cause a violation of the field of view constraints."
* p.7: "The values drop below the zero line only for a few instances. This can be explained by the sudden appearance of unseen obstacles, observation noise, and tracking errors present during acceleration tracking."
* p.3, on conservatism: "While this choice is conservative, it reduces the risk of colliding with unseen obstacles."
* p.8: "Future work should investigate creating short-term memory at constraint level to alleviate the non-smooth behavior due to disappearing obstacles"

**Citable statements:**
1. Điều hướng không bản đồ hoàn toàn an toàn với cảm biến có FOV dưới 180° là không thể nếu cho phép chuyển động tùy ý.
   * p.3: "completely safe, mapless navigation with a sensor with a FoV under 180◦ cannot be achieved considering arbitrary motions."
2. Một cách giải quyết là buộc vận tốc hiện tại nằm trong frustum của cảm biến. Cách này bảo thủ nhưng giảm rủi ro va vào vật cản chưa thấy.
   * p.3: "we additionally require the current velocity to be contained within the sensor frustrum. While this choice is conservative, it reduces the risk of colliding with unseen obstacles."
3. Bộ lọc an toàn CBF đã chạy hoàn toàn onboard trên multirotor nhỏ: VOXL2 mini (vừa là máy tính vừa là flight controller), cảm biến ToF, tối đa 100 điểm ở 15 Hz, bộ điều khiển vị trí 100 Hz.
   * p.6: "makes use of a ModalAI VOXL2 mini compute unit, which serves the role of both the onboard computer and flight controller"
   * p.6: "A maximum of 100 obstacles are obtained from the sparsified range measurement at a rate of 15 Hz."
4. Chi phí tính toán nhỏ: 50–400 µs (dạng giải tích, 25–200 vật cản), 2 ms (QP có ràng buộc FOV), không gây trễ đáng kể cho vòng 100 Hz.
   * p.6: "It takes in average 50 µs with 25 obstacles and 400 µs with 200 obstacles."
   * p.6: "takes, on average, 2 ms with spikes up to 2.5 ms"
5. Theo đánh giá của tác giả, tần số đo ≥ 10 Hz là đủ cho bộ lọc CBF (không có số liệu kèm theo).
   * p.5: "Our evaluation indicates that a rate of 10 Hz or higher is adequate."
6. Thiếu thông tin vật cản ngoài frustum khiến vật cản xuất hiện/biến mất đột ngột và bộ lọc phản ứng giật. Đây là vấn đề chung của phương pháp không bản đồ; các tác giả đề xuất bộ nhớ ngắn hạn làm hướng tương lai.
   * p.7: "the absence of obstacle information outside the sensor frustum, which can result in suddenly appearing or disappearing obstacles"
   * p.8: "Future work should investigate creating short-term memory at constraint level"
7. Ràng buộc FOV làm giảm chất lượng bám quỹ đạo vì gia tốc ngang bị giới hạn.
   * p.7: "the additional FoV constraints deteriorate tracking performance since lateral accelerations are constrained by the corresponding CBFs."
8. CBF dựa trên điểm đo nhạy với ngoại lai; depth stereo nhiễu nên phép đo cần được lọc.
   * p.7: "Since the used CBF formulation is sensitive to outliers, the obstacle measurements should be filtered appropriately."
9. Ngay cả trên phần cứng thật, giá trị CBF vẫn âm trong vài thời điểm do vật cản chưa thấy xuất hiện đột ngột, nhiễu quan sát và sai số bám gia tốc.
   * p.7: "This can be explained by the sudden appearance of unseen obstacles, observation noise, and tracking errors present during acceleration tracking."

**Relation to our method:**
* **Related work / Method (claim b).** This is the closest hardware precedent for an onboard CBF safety filter fed by depth sensing on a small multirotor. It shows 15 Hz sensing feeding a filter inside a 100 Hz position loop on a VOXL2 mini. That is comparable to our 100 Hz CBF layer fed by event-triggered perception (our inference). We can cite it to argue that a 100 Hz CBF filter is computationally realistic on such hardware: 2 ms for the QP with FoV constraints.
* **Blind-motion rows (claim a).**
  * Their FoV CBF h_fj = e_jᵀR_VI v ≥ 0, softened with a slack, keeps the velocity inside the frustum. Our blind-motion rows generalise this: we allow a bounded speed outside the FOV (1 m/s beyond the edges) and a bounded speed away from the viewing direction (1.5 m/s). Their formulation corresponds to a 0 m/s cap on the out-of-FOV component (our inference).
  * Both formulations use a velocity-level constraint, which has relative degree 1 in the acceleration, and both use a slack.
  * Their statement that a FoV below 180° cannot guarantee mapless safety, together with Roelofsen's Remark 2, justifies why we add memory instead of relying on the frustum alone.
* **Obstacle memory.** Our memory of static cylinders, with a Kalman update and forgetting, implements what they list as future work, p.8: "short-term memory at constraint level". Our covariance-inflated radius β·σ addresses their stated sensitivity to noisy depth or outliers. Learned monocular depth is likely noisier than their ToF sensor (our inference).
* **Discussion of the narrow-FOV result.** They state (p.7) that the missing out-of-frustum information "can be resolved using appropriate sensors with a large FoV". Our 62/66° vs 102° comparison quantifies this effect in closed loop: 4–5× more collisions with the narrow cameras (our inference: their paper gives no such numbers).
* **Differences.**
  * **Obstacle CBF form.** Theirs is an ECBF on squared distance with no acceleration-limit or braking-distance term. Ours is the braking-distance CBF √(2a_b(|r| − d)) − closing speed (our inference from eqs. 6–7).
  * **Obstacle representation.** Theirs is raw ToF points, with no memory; ours is fitted cylinders.
  * **Sensing.** Theirs is fixed 15 Hz with no latency model. Ours is triggered inference with about 0.1 s latency and a frame-rate cap.
  * **Nominal controller.** Theirs is the PX4 position/velocity loop; ours is a 20 Hz MPC.
  * **Validation.** Theirs is real hardware with ToF; ours is a simulation study.
* **Claim (c).** The paper offers only the unquantified sentence "a rate of 10 Hz or higher is adequate" (p.5). It does not study the effect of rate or latency, so it should not be cited as evidence beyond that sentence.

**Caveats:**
* **Status.** This is an arXiv v1 preprint. The venue (ICUAS 2025, from a search snippet) is not printed and no DOI is printed. Verify the venue before citing it as a conference paper.
* **Experimental evidence.** The evidence is two qualitative hardware experiments, with no trial counts, collision statistics or baselines. The 10 Hz adequacy claim has no supporting data in the paper.
* **Reporting gaps.**
  * The ToF sensor's FOV and the sensor latency are not printed.
  * Table II's τ = 0.5 lies outside Table I's recommended range of [0.01, 0.1].
* **FoV CBF approximations.** The FoV CBF assumes small roll/pitch and neglects the yaw-rate term. It is violated in Experiment 2 because of skidding at high yaw rates. Only the horizontal FoV planes are constrained.
* **Sensing differs from ours.** ToF depth is described as reliable ("thanks to the reliability of the ToF sensor", p.7). Our learned monocular depth is a different and noisier sensing regime.
