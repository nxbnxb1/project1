# Literature notes — group g3: quadrotor local planners, uncertainty-aware MPC for dynamic obstacles, adaptive-horizon MPC

Reader: subagent g3. Papers dir: `scratchpad/papers/g3_planners/` (PDFs + `pdftotext -layout` txt; `*_p.txt` = same text with `=== PAGE n ===` markers).
Page numbers below are **PDF page numbers** (for C6 the PDF has 2 repository cover pages, so PDF p.3 = printed p.776; both are given).
Every quote was machine-checked against the PDF text (whitespace/hyphenation/ligatures normalised) unless marked "(read from page image)".

## Retrieval and search log
- arXiv IDs verified against the API `<title>`: 1907.01531 (C4), 2008.08835 (C5), 2002.04920 (C7), 1602.08619 (D1), 1904.00053 (D2), 2102.11122 (D3). All matched; no ID corrections.
- C6 is not on arXiv (title search `ti:"Chance-Constrained Collision Avoidance"` and `au:"Hai Zhu" AND au:Alonso-Mora` returned only other papers). OpenAlex listed a green-OA copy; downloaded the **final published version** from the TU Delft repository (record uuid:4c2e8664-4eb7-45ff-9e7e-a57ae643a371, file "Chance_Constrained_Collision_Avoidance_for_MAVs_in_Dynamic_Environments.pdf"; PDF metadata: "IEEE Robotics and Automation Letters;2019;4;2;10.1109/LRA.2019.2893494"). Tables I–III in it are vector graphics that pdftotext does not extract, so I rendered PDF pages 6 and 9 and read the table values from the images.
- D4+ search (arXiv API, titles and abstracts only, for screening): queries combined `variable horizon` / `adaptive horizon` / `adaptive prediction horizon` / `prediction horizon` / `horizon adaptation` / `dynamic horizon` / `time-varying horizon` with `collision` / `obstacle avoidance` / `MPC` / `risk`, plus `ti:horizon AND abs:"collision avoidance"`.
  - **Chosen D4 = 2609.13270** (Conflict-Predictive Variable Horizons in Multi-Drone DMPC). It is the only hit where the horizon depends on context/risk: the horizon is sized to the predicted time-to-conflict, for drone collision avoidance, using a braking-distance safety radius.
  - **Chosen D5 = 2308.07071** (RL-based Variable Horizon MPC of Multi-Robot Systems, VODCA). The horizon is learned per robot and per step for multi-robot collision avoidance with static and dynamic obstacles. It covers how collision constraints stay consistent when the horizon shrinks.
  - **Chosen D6 = 2111.09207** (Optimal-Horizon MPC with DDP). The abstract says the horizon is "determined online" and shows an obstacle-avoidance MPC. After the full read it is **EXCLUDED** (see below).
  - Screened out from title and abstract: 2607.15733 (manipulator task-space receding horizon; horizon not adapted online); 2305.19448 (adaptive-horizon multi-stage MPC stability, no collision avoidance); 2410.08807 (robust variable-horizon MPC for target interception); 2609.34574 (variable-horizon MPC for UAV landing on a moving platform); 2010.08198 (bipedal VH-MPC); 1702.00290 (adaptive-horizon MPC in a V-formation attack game); 2204.09596 (risk-averse receding-horizon obstacle avoidance with a fixed horizon, a snowball candidate for risk-aware MPC but not variable-horizon); 2511.02114 (MPC with multiple constraint horizons; varies constraints along the horizon, not the horizon itself); 2308.00914 (MPPI uncertainty-aware UAV planning, fixed horizon).

---

### C4 — Robust and Efficient Quadrotor Trajectory Generation for Fast Autonomous Flight
Boyu Zhou, Fei Gao, Luqi Wang, Chuhao Liu, Shaojie Shen; header: "THIS PAPER HAS BEEN ACCEPTED FOR PUBLICATION AT THE IEEE ROBOTICS AND AUTOMATION LETTERS (RA-L)"; arXiv:1907.01531v2 (3 Jul 2019); pages read: 8/8
Status: USE (context and baseline for the quadrotor local-planner family; it does not model uncertainty or latency)

**Problem & setting:** Online trajectory generation for fast quadrotor flight in unknown, cluttered, **static** 3-D environments with limited onboard compute (p.1). It uses a voxel map with a Euclidean distance field (EDF), built from LiDAR in the onboard experiment.

**Method (key idea, key equations in words, assumptions):**
- **Front end.** Kinodynamic hybrid-state A* over discretised control inputs (double integrator, n = 2). Cost J(T) = ∫‖u‖² dt + ρT. The heuristic is a closed-form Pontryagin minimum-time/control trajectory, and an "analytic expansion" can end the search early (p.2–3).
- **Back end.** Uniform cubic B-spline optimisation with cost λ1·fs + λ2·fc + λ3·(fv + fa) (Eq. 9, p.4):
  - elastic-band smoothness term;
  - collision penalty (d − dthr)² on control points, using EDF distance;
  - soft velocity and acceleration limits on derivative control points (convex-hull property).
- **Time adjustment.** Iterative knot-span stretching of a non-uniform B-spline makes velocity and acceleration feasible without conservative limits (Alg. 2, p.5–6).
- **Re-planning.** Receding-horizon local planning inside the known space only. Re-planning is triggered by (i) collision of the current trajectory with newly seen obstacles and (ii) fixed time intervals (p.6). The EDF is updated incrementally inside the sensing range (p.6).

**Experiments & key quantitative results (exact, with page):**
- **Path search (Table I, p.7; 40×40×5 m map, 100 obstacles, vmax 3 m/s, amax 2 m/s²).**
  - Comparison method [23]: mean computation 0.0592 s, success 100.0%.
  - Proposed at 0.2 m resolution: mean 0.0018 s, success 100.0%.
  - Proposed at 1.0 m resolution: mean 0.0017 s, success 77.8%.
- **Optimisation (Table II, p.7).** Integral of jerk², mean 35.932 (proposed) vs 43.913 (previous [13]). Computation 0.001 s vs 0.010 s.
- **Onboard flight (p.7).** The map was pruned to a 5 m sphere around the drone. The Fig. 9 caption reads "maximum and average speed of flight 1-3 reach up to 1.7m/s and 1.3m/s2 respectively" (units as printed).
- **Aggressive replanning test (p.8).** vmax 2.5 m/s, amax 1.5 m/s², with motion capture and a pre-built map (p.6).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: no optimality or completeness guarantee for the search (p.3). The convex-hull safety condition is "safe in most cases" and may fail in very cluttered scenes (p.5). Dynamic environments are left to future work (p.8).
- Observed:
  - static-world map; no obstacle motion or state-estimation uncertainty in the planner;
  - perception is assumed to keep the map current; there is no notion of perception latency or rate;
  - the aggressive test removes sensing uncertainty with motion capture (p.6).

**Relation to DART:**
- **What it represents.** The deterministic, map-based (EDF) gradient planner family that DART's MPC/CBF stack would be compared against or positioned beside.
- **Gaps relative to DART.**
  - no obstacle-level tracks with covariance;
  - no delay-aware estimation;
  - no reasoning about when the next perception result must arrive;
  - no safety filter.
- **Mechanism to cite.** Its re-planning trigger (new collision or a periodic timer) is an event-plus-periodic trigger on the *planner*. DART triggers *perception* from a safety-derived open-loop time.
- **Where it is stronger than DART.** It handles arbitrary static clutter geometry (not just spheres), is open-source, and is flight-proven onboard.

**Citable statements:**
- Prior planners lack success guarantees under limited compute → p.1: "no existing works guarantee to generate safe and kinodynamic feasible trajectory at a high success rate"
- The search front end is heuristic → p.3: "Theoretically, we can not guarantee the optimality and completeness of the path searching."
- Safety of the B-spline is conditional → p.5: "the trajectory is safe in most cases. This may be invalid in extreme cases, for instance, the environment is very cluttered."
- Re-planning is event- or timer-triggered → p.6: "Firstly, it is triggered if the current trajectory collides with newly emergent obstacles" / "Secondly, the planner is called at fixed intervals of time."
- Planning is limited to known space → p.6: "trajectories are generated only within the known space"
- The aggressive test removed sensing uncertainty → p.6: "To eliminate uncertainties introduced by onboard sensings, accurate pose feedback is provided by the motion capture system OptiTrack"
- Search speed → p.7: "Our method is faster with one order of magnitude and tends to generate a path with a shorter duration."
- Dynamic environments are future work → p.8: "In the future, we plan to challenge our quadrotor system in extreme situations such as large-scale or dynamic environments."

**Snowball candidates:** Usenko et al., "Real-time trajectory replanning for MAVs using uniform B-splines and a 3D circular buffer" (2017); Liu et al., "Search-based motion planning for quadrotors using linear quadratic minimum time control" (2017); Gao, Lin, Shen, "Gradient-based online safe trajectory generation for quadrotor flight in complex environments" (2017); Ding et al., "An efficient B-spline-based kinodynamic replanning framework for quadrotors" (2019); Oleynikova et al., "Continuous-time trajectory optimization for online UAV replanning" (2016).

---

### C5 — EGO-Planner: An ESDF-free Gradient-based Local Planner for Quadrotors
Xin Zhou, Zhepei Wang, Hongkai Ye, Chao Xu, Fei Gao; header: "IEEE ROBOTICS AND AUTOMATION LETTERS. PREPRINT VERSION. ACCEPTED OCTOBER, 2020"; arXiv:2008.08835v2 (7 Dec 2020); pages read: 8/8
Status: USE (context and baseline for quadrotor local planners; static environments)

**Problem & setting:** Gradient-based local planners spend most of their time building an ESDF (Euclidean signed distance field) that the trajectory barely uses. The goal is a lightweight planner for resource-limited quadrotors with a depth camera (p.1).

**Method (key idea, key equations in words, assumptions):**
- **Collision term without an ESDF.** For each colliding B-spline segment, an A* path Γ gives anchor points p on obstacle surfaces and repulsive directions v. The distance is d_ij = (Q_i − p_ij)·v_ij (Eq. 1, p.3), and a twice-differentiable penalty with clearance s_f is applied (Eq. 5, p.4). Obstacle information is added only when the trajectory hits a new obstacle (p.3).
- **Other cost terms.** Smoothness penalises acceleration and jerk control points. Feasibility uses piecewise penalties on velocity, acceleration and jerk control points (p.4).
- **Solver.** L-BFGS (p.4–5).
- **Refinement.** When limits are exceeded, the time span is uniformly re-allocated by the exceed ratio r_e (Eq. 14–15). An anisotropic (axial/radial) curve fit preserves the safe shape (Eq. 16–18, p.5).
- **Assumptions.** Static map from depth images; uniform B-spline with about 25 control points over a planning horizon of about 7 m (p.5).

**Experiments & key quantitative results (exact, with page):**
- **Solver comparison (Table I, p.6).** L-BFGS: success 0.89, average time 0.37 ms.
- **ESDF vs ESDF-free (Table II, p.6).**
  - EGO: total 0.37 ms, success 0.89.
  - EI (ESDF-based, collision-free initialisation): total 5.55 ms, of which ESDF 5.07 ms, success 0.89.
  - ENI (ESDF-based, no collision-free initialisation): success 0.69.
- **Planner comparison (Table III, p.7).**
  - EGO-Planner: t = 24.38 s, length 42.24, energy 196.64, tplan 0.81 ms.
  - Fast-Planner: 30.76 s, 45.18, 135.21, tESDF 4.01 ms, tplan 3.29 ms.
  - EWOK: 31.00 s, 59.05, 246.12, tESDF 6.43 ms, tplan 1.39 ms.
- **Real-world flights.** Intel RealSense D435 depth camera; 3.56 m/s indoors (p.7); "above 3m/s" in a forest (p.7).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: local minima from A*; conservative trajectories from unified time re-allocation; designed for static environments, tolerating only slow movers below 0.5 m/s (p.8).
- Observed: no estimation uncertainty, no obstacle tracking, no perception latency or rate considerations. Depth runs at camera rate into a map, and the evaluation reports no safety margin statistics.

**Relation to DART:**
- **What it represents.** A strong lightweight baseline for depth-camera quadrotor navigation in static clutter.
- **Analogous idea.** "Extract only the obstacle information the trajectory needs" saves *planning* computation, much as DART saves *inference* computation. The mechanisms differ.
- **Gaps relative to DART.** EGO cannot handle fast dynamic obstacles (its own <0.5 m/s statement), has no latency compensation, no covariance-aware margins, and no rule for when to perceive.
- **Where it is stronger than DART.** Arbitrary obstacle geometry, sub-millisecond planning, extensive real flights.

**Citable statements:**
- ESDF construction dominates gradient-planner cost → p.1: "the ESDF computation takes up to about 70% of total processing time for conducting local planning"
- That cost blocks resource-limited platforms → p.1: "building ESDF has become the bottleneck of gradient-based planners, preventing the method from being applied to resource-limited platforms."
- Mechanism → p.1: "we model the collision cost by comparing the trajectory inside obstacles with a guiding collision-free path"
- Even a reduced ESDF dominates → p.6: "the ESDF updating still takes up a majority of the computation time."
- Static-world scope → p.8: "The planner is designed for static environments and can tackle slowly moving obstacles (below 0.5m/s) without any modification."
- Stated flaws → p.8: "the local minimum introduced by A* search and the conservative trajectories introduced by unified time re-allocation"

**Snowball candidates:** Zhou et al., "RAPTOR: Robust and perception-aware trajectory replanning for quadrotor fast flight" (2020); Han et al., "FIESTA: Fast incremental Euclidean distance fields for online motion planning of aerial robots" (2019); Oleynikova et al., "Voxblox: Incremental 3D Euclidean signed distance fields for on-board MAV planning" (2017); Gao et al., "Teach-repeat-replan: A complete and robust system for aggressive flight in complex environments" (2020).

---

### C6 — Chance-Constrained Collision Avoidance for MAVs in Dynamic Environments
Hai Zhu, Javier Alonso-Mora; IEEE Robotics and Automation Letters, vol. 4, no. 2, April 2019, pp. 776–783 (as printed); DOI 10.1109/LRA.2019.2893494; not on arXiv; obtained from the TU Delft repository ("Final published version"); pages read: 10/10 (2 repository cover pages + 8 article pages)
Status: USE

**Problem & setting:**
- Probabilistic collision avoidance for MAVs among other robots and moving obstacles (humans). It accounts for uncertainty in localisation, sensing and motion (PDF p.3 / printed 776).
- Robot: sphere. Obstacles: ellipsoids. All uncertainties are Gaussian.

**Method (key idea, key equations in words, assumptions):**
- **Robot model.** Stochastic nonlinear discrete-time model with Gaussian initial state from a UKF and Gaussian process noise (Eq. 1, PDF p.4).
- **Obstacle model.** Constant-velocity model with Gaussian acceleration noise; positions and uncertainties are predicted with a linear Kalman filter (PDF p.4 / 777).
- **Chance constraints.** Each stage requires Pr(no collision) ≥ 1 − δ (Eq. 4–6, PDF p.5).
- **Linearisation.** The spherical collision region is enlarged to a half-space tangent at the mean relative position. This gives an upper bound on collision probability and the deterministic constraint a_ij^T(p̂_i − p̂_j) − b_ij ≥ erf⁻¹(1 − 2δ)·√(2 a_ij^T(Σ_i + Σ_j) a_ij) (Eq. 8–9, PDF p.6 / 779). Ellipsoids are first mapped to a unit sphere (Eq. 11–12).
- **Covariance propagation.** EKF-type, Γ_{k+1} = F Γ_k F^T + Q, evaluated along the previous loop's trajectory to avoid extra decision variables (Remark 3, PDF p.5).
- **Cost and multi-robot coordination.** Terminal goal cost, input cost, potential-field cost. Three coordination schemes: constant velocity without communication; sequential planning; distributed planning with communication (PDF p.7 / 780).
- **Joint vs per-stage risk.** The per-stage bound implies a whole-trajectory bound of Nδ_o, which is conservative. Lemma 3 shows consistency with a discounted chance constraint when γ < 0.5 (PDF p.8 / 781).
- **Infeasibility.** The MAV decelerates (PDF p.8).

**Experiments & key quantitative results (exact, with page):**
- **Collision-probability methods (Table I, PDF p.6 / 779; read from page image).**

  | Method | Collision probability | Time (ms) | Feasible |
  |---|---|---|---|
  | Numerical integral | 0.011 | 258.665 | Yes |
  | Bounding volume [5] | 1 | 0.011 | No |
  | Center point [12] | 3.6E-18 | 0.016 | Yes |
  | Cube approx. [11] | 0.100 | 0.044 | No |
  | Ours | 0.017 | 0.011 | Yes |

- **Setup (PDF p.8 / 781).**
  - Parrot Bebop 2, radius 0.3 m.
  - OptiTrack pose plus added Gaussian noise Σ = diag(0.06 m, 0.06 m, 0.06 m, 0.4 deg, 0.4 deg)².
  - δ_r = δ_o = 0.03; Δt = 0.05 s; N = 20 (1 s horizon); Forces Pro solver.
- **Two-quadrotor swap, 50 runs per noise level (Table II, PDF p.9 / 782; read from page image).**

  | Method | Success at ¼Σ / Σ / 4Σ | At 4Σ: d_min, l, T |
  |---|---|---|
  | Ours | 100% / 100% / 100% | 0.86, 7.21, 3.06 |
  | Bounding volume [5] | 100% / 100% / 100% | 1.10, 8.18, 3.13 |
  | Deterministic MPC [3] | 68% / 64% / 36% | — |

- **Humans experiment (PDF p.8).**
  - Minimum separation 0.3 m to the humans.
  - Mean NMPC solve 14.3 ms; whole framework 71.3 ms.
  - 2.8% of solutions infeasible; longest infeasible period 9 steps (0.45 s).
- **Six-drone simulation (Table III, PDF p.9; read from page image).**

  | Strategy | Min distance (m) | Avg. computation (ms) |
  |---|---|---|
  | Constant velocity (CV) | 0.56 | 15.2 |
  | Sequential planning (SP) | 0.70 | 115.3 |
  | Distributed with communication (DC) | 0.70 | 16.2 |

- **Scaling (PDF p.9).** CCMPC step 14.3 / 14.4 / 16.2 / 24.7 ms for 2 / 4 / 6 / 16 robots.

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - guarantees hold only under the constant-velocity and simplified-propagation assumptions (PDF p.7);
  - tighter joint bounds are future work (PDF p.8);
  - the 97% level is insufficient with the CV model (PDF p.9);
  - local method, so deadlocks are possible (PDF p.10).
- Observed:
  - obstacle and robot states come from motion capture plus synthetic noise, so there is no real perception pipeline, no measurement latency, no field of view and no sensing-rate question;
  - measurements are implicitly available every control step;
  - the horizon is fixed at 1 s "based on the experience" (PDF p.8);
  - per-stage probabilistic safety only, with no hard safety filter; infeasibility leads to deceleration.

**Relation to DART:**
- **Supports DART components 4–5.** C6 is the formal origin of "tangent half-space + covariance-scaled margin" obstacle constraints. DART's covariance-inflated tangent half-spaces are close to Eq. (9)/(12); citing C6 gives DART's inflation a chance-constraint interpretation (inflation by erf⁻¹(1 − 2δ)·√(2aᵀΣa) along the normal).
- **Supports DART's obstacle model.** Constant-velocity tracks with Kalman prediction and covariance growth match DART's CV track model.
- **Gaps relative to DART.**
  - It never asks when measurements arrive: no latency, no capture-time updates, no scheduling.
  - The horizon is fixed.
  - Robustness is probabilistic per stage, with no CBF filter.
- **Where it is stronger than DART.** Hardware experiments with humans; multi-robot coordination; an explicit probability semantics (DART should state which confidence level its inflation corresponds to).

**Citable statements:**
- Formulation → PDF p.3 (776): "formulates a chance constrained nonlinear model predictive control problem (CCNMPC)"
- Bounding volumes are conservative → PDF p.4 (777): "bounding volumes can be conservative and lead to infeasible solutions in cluttered environments"
- Obstacle model → PDF p.4 (777): "For dynamic obstacles, as in [17], we assume a constant velocity model with Gaussian noise"
- Cheap covariance propagation → PDF p.5 (778): "we propagate the robot uncertainties based on its last-loop trajectory and control inputs."
- Tighter bound → PDF p.7 (780): "Our method thus provides a tighter bound."
- Conditions of the guarantee → PDF p.7 (780): "under a constant velocity assumption for moving obstacles (Section III-B) and a simplified propagation model"
- Infeasibility fallback → PDF p.8 (781): "In those rare situations, our approach is to command the MAVs to decelerate."
- Open problem → PDF p.8 (781): "Future works should look at obtaining tighter bounds on the joint probability of collision over the whole trajectory."
- Synthetic perception noise → PDF p.8 (781): "We then add Gaussian noise to the data to simulate the localization uncertainties."
- Deterministic MPC fails under noise → PDF p.8 (781): "Under measurements noise of Σ, the purely deterministic approach succeeded in 64% of the trials."
- Runtime → PDF p.8 (781): "The mean computation time of the NMPC solver is 14.3 ms and that of the total framework is 71.3 ms."
- Infeasibility statistics → PDF p.8 (781): "the percentage of infeasible solutions was 2.8% and the longest infeasible period was 9 time steps (corresponding to 0.45 s)."
- CV-model limit → PDF p.9 (782): "This indicates that the 97% confidence level is not enough when the constant velocity model is employed and should be increased."

**Snowball candidates:** Kamel et al., "Robust collision avoidance for multiple micro aerial vehicles using nonlinear model predictive control" (2017); Du Toit & Burdick, "Probabilistic collision checking with chance constraints" (2011); Blackmore, Ono, Williams, "Chance-constrained optimal path planning with obstacles" (2011); Nägeli et al., "Real-time motion planning for aerial videography with dynamic obstacle avoidance and viewpoint optimization" (2017); Yan, Goulart, Cannon, "Stochastic model predictive control with discounted probabilistic constraints" (2018); Hewing, Liniger, Zeilinger, "Cautious NMPC with Gaussian process dynamics for miniature race cars" (2018); Park, Park, Manocha, "Fast and bounded probabilistic collision detection for high-DOF trajectory planning in dynamic environments" (2018).

---

### C7 — Robust Vision-based Obstacle Avoidance for Micro Aerial Vehicles in Dynamic Environments
Jiahao Lin*, Hai Zhu*, Javier Alonso-Mora (*equal contribution); arXiv:2002.04920v2 (13 Feb 2020). The arXiv PDF does not print a venue; the task brief gives ICRA 2020. Pages read: 7/7
Status: USE (closest prior pipeline to DART in this group)

**Problem & setting:** Onboard, vision-based avoidance of moving obstacles (walking humans) for a quadrotor with a stereo depth camera. It accounts for MAV state-estimation uncertainty and obstacle-sensing uncertainty (p.1–2).

**Method (key idea, key equations in words, assumptions):**
- **Detection.** Obstacles are detected from depth images and a U-depth map as boxes, enlarged to ellipsoids with semi-axes √3/2·(l, w, h) (Eq. 1–3, 7; p.2–3).
- **Measurement covariance.** An "empirically determined" detection covariance in the body frame is rotated into the world frame and added to the MAV pose covariance (Eq. 4, p.3).
- **Tracking.** Association by Gaussian likelihood; a Kalman filter estimates position, velocity and size. Prediction is constant velocity, with position covariance growing as Σ_{k+1} = Σ_k + Σ_{v,k}·Δt² (Eq. 6, p.3). Size uncertainty is ignored in avoidance.
- **CC-MPC (built on C6).**
  - goal terminal cost, input cost, logistic obstacle potential;
  - yaw cost aligning the camera with the direction of motion;
  - chance constraints converted as in C6 (Eq. 16);
  - field-of-view and depth-range constraints as five half-spaces (Eq. 17–18);
  - EKF-type MAV covariance propagated along the previous loop's trajectory (Eq. 19, p.4–5).

**Experiments & key quantitative results (exact, with page):**
- **Platform (p.5).**
  - Bebop 2 + Jetson TX2 + RealSense D435i (87°×58° field of view, 5 m depth range);
  - visual-inertial odometry (S-MSCKF) at 15 Hz;
  - depth at 60 Hz, with detection and tracking running at frame rate;
  - ACADO solver, sampling time 60 ms, prediction horizon 1.5 s;
  - MAV radius 0.4 m, δ = 0.03, the two closest obstacles fed to the MPC.
- **Tracking accuracy (Table I, p.5; humans at about 1.2 m/s).** Average position error 0.28 m and 0.25 m; average velocity error 0.47 m/s and 0.41 m/s.
- **Scenario 1 (lab, 5 runs; p.5–6).** Minimum separation 0.4 m in all instances; maximum speed about 1.6 m/s. 75th-percentile runtimes: detection and tracking below 8 ms, MPC below 22 ms.
- **Scenario 2 (corridor; p.6).** Maximum speed about 2.4 m/s.
- **Conclusion (p.6).** Mean detection and tracking 8 ms; mean MPC 16 ms.

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - velocity estimates "may be very noisy", so Σ_{o,v} is bounded heuristically (p.5);
  - size uncertainty is not used (p.3);
  - quantitative evaluation is small (5 lab runs, motion-capture ground truth; p.5).
- Observed:
  - perception is fast (about 8 ms) and runs every frame (60 Hz), so the regime DART targets (learned monocular depth, low and variable rate, tens to hundreds of ms of latency) never arises;
  - no capture-time or delay compensation;
  - no measurement scheduling;
  - a fixed 1.5 s horizon;
  - probabilistic per-stage safety only;
  - stereo depth, so no scale or affine error.

**Relation to DART:**
- **What it covers.** C7 is the nearest end-to-end antecedent: depth → obstacle ellipsoids with covariance → constant-velocity Kalman tracks with covariance growth → uncertainty-aware MPC with field-of-view constraints. It supports DART components 1, 2 (the CV model and covariance growth) and 4.
- **What DART adds.**
  - capture-time (delay-aware) Kalman updates;
  - a stationary/CV two-model bank;
  - a safety-derived perception trigger (safe open-loop time, frontier term);
  - an adaptive horizon tied to expected measurement times;
  - a CBF braking filter.
- **Natural baseline.** "Perceive every frame + CC-MPC" in the style of C7.
- **Where it is stronger than DART.** Real onboard hardware with humans; explicit field-of-view constraints and yaw control.

**Citable statements:**
- Prior map-based planners assume a static world → p.2: "a common limitation of them is that they all assume the environments to be static without moving obstacles."
- Uncertainty is usually ignored → p.2: "obstacle sensing uncertainty and MAV state estimation uncertainty are generally neglected."
- Depth error grows with range → p.3: "For a stereo depth camera, the range measurements error generally increases quadratically with the measured depth [24]."
- Heuristic measurement covariance → p.3: "we adopt an empirically determined detection uncertainty covariance"
- Size uncertainty ignored → p.3: "its uncertainty is not considered in collision avoidance."
- Field-of-view constraint → p.4: "the MAV planned trajectory should be within its current limited field of view (FOV) and limited depth sensing range."
- Perception runs at full frame rate → p.5: "The camera depth images are received at 60 Hz and the obstacle detection and tracking is running at frame rate."
- MPC settings → p.5: "a sampling time of 60 ms is used and the prediction horizon is set to 1.5 s."
- Obstacle-estimate quality → p.5: "the average position estimation error is around 0.3 m and that of velocity can be up to 0.5 m/s"
- Velocity uncertainty problem → p.5: "the obstacle’s velocity estimation may be very noisy and has a very large uncertainty covariance."
- Runtimes → p.6: "the obstacle detection and tracking has a mean computation time of 8 ms and that of the MPC is 16 ms."

**Snowball candidates:** Falanga, Kim, Scaramuzza, "How fast is too fast? The role of perception latency in high-speed sense and avoid" (2019) — **highly relevant to DART (perception latency)**; Oleynikova, Honegger, Pollefeys, "Reactive avoidance using embedded stereo vision for MAV flight" (2015); Florence et al., "NanoMap: Fast, uncertainty-aware proximity queries with lazy search over local 3D data" (2018); Lopez & How, "Aggressive 3-D collision avoidance for high-speed navigation" (2017); Zhu & Alonso-Mora, "B-UAVC: Buffered uncertainty-aware Voronoi cells for probabilistic multi-robot collision avoidance" (2019); Tordesillas et al., "FASTER: Fast and safe trajectory planner for flights in unknown environments" (2019).

---

### D1 — Adaptive Horizon Model Predictive Control
Arthur J Krener; arXiv:1602.08619v1 [math.OC] (27 Feb 2016); no venue printed on the arXiv copy (D3 and D5 cite an IFAC-PapersOnLine 51(13), 2018 paper with the same title, which may be the published version; not verified); pages read: 6/6
Status: USE (background only: defines "adaptive horizon MPC"; no obstacles, no uncertainty)

**Problem & setting:** Stabilise a constrained nonlinear discrete-time system to an operating point using MPC with horizons as short as possible (p.1).

**Method (key idea, key equations in words, assumptions):**
- **Ideal AHMPC.** Use the minimum horizon N(x) needed to reach the terminal set X_f. V(x) = V⁰_{N(x)}(x) is then a Lyapunov function (Lemmas 1–2, Propositions 1–4, p.2–4). N(x) is not computable in general.
- **Practical AHMPC.**
  - Requires a terminal cost V_f and a terminal feedback κ_f, e.g. from LQR, on an unknown X_f.
  - After solving with horizon N, the optimal trajectory is extended L steps with κ_f and Lyapunov decrease conditions (18–19) are checked.
  - If they hold, the controller advances and next uses N − 1.
  - If they fail, it increases N by 1 when time permits; otherwise it applies the last input and increases N at the next step (p.4–5).

**Experiments & key quantitative results (exact, with page):** Double pendulum, Euler step 0.1 s, initial N = 5, L = 5, α(|x|) = 0.1|x|² (p.5). Results are qualitative (Figures 1–2): the horizon "goes down and up several times before settling at N = 0" (p.5). No numeric performance table.

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: convergence is proven only under ideal conditions (exact model, exact state, exact optimisation) (p.5); N(x) is generally impossible to compute (p.3).
- Observed: one toy example; no state constraints from obstacles; no estimation or perception uncertainty; the horizon is driven solely by distance to the terminal set (stabilisation).

**Relation to DART:**
- **Why cite it.** It is the canonical reference for the term and concept that DART's "adaptive-horizon MPC" component builds on.
- **Contrast.** AHMPC shrinks the horizon as the state approaches a terminal set and grows it when the terminal Lyapunov check fails. DART's horizon is driven by risk/perception timing (expected measurement times, safe open-loop time).
- **Gaps relative to DART.** Nothing on obstacles, uncertainty, latency or sensing.
- **Where it is stronger than DART.** A formal Lyapunov stability argument for a varying horizon.

**Citable statements:**
- Goal of AHMPC → p.1: "Its goal is to achieve stabilization with horizons as small as possible so that MPC can be used on faster or more complicated dynamic processes."
- Intuition → p.2: "One would expect when the current state x is far from the operating point, a relatively long horizon N is needed"
- Practical rule → p.4: "so we increase N by 1 and we solve the optimal control problem over the new horizon."
- Behaviour → p.5: "Notice that the horizon goes down and up several times before settling at N = 0."
- Scope of the proof → p.5: "We have only proven the convergence of AHMPC under ideal conditions"
- Benefit → p.5: "the AHMPC horizon length decreases as the process is stabilized" (sentence continues "thereby lessening the on-line computational" and ends with "burden" at the top of p.6)

**Snowball candidates:** Rawlings & Mayne, *Model Predictive Control: Theory and Design* (2009); Al'brekht, "On the optimal stabilization of nonlinear systems" (1961).

---

### D2 — Adaptive Horizon Model Predictive Control and Al’brekht’s Method
Arthur J Krener; arXiv:1904.00053v1 [math.OC] (29 Mar 2019; dated "April 2, 2019" on the title page); pages read: 23/23 (text in full; Figures 1–10 are plots captioned only, not viewed as images)
Status: USE (background only, as D1)

**Problem & setting:** As D1 (stabilisation to an operating point), with better terminal ingredients so the horizon can be shorter (p.1–2).

**Method (key idea, key equations in words, assumptions):**
- **AHMPC loop.** After a horizon-N solve, the trajectory is extended M steps with κ_f. Control constraints, state constraints, mixed constraints and Lyapunov conditions (11–15) are checked on the extension. If they hold, advance and use N − 1; otherwise increase N by L (p.6–7).
- **Terminal ingredients from Al'brekht's method.** Taylor polynomials of the infinite-horizon optimal cost and feedback are computed by solving linear equations degree by degree (p.8–11). The resulting terminal cost may be indefinite, so it is made nonnegative by "completing the squares" (a sum-of-squares construction; Theorem, p.11–14).
- **Open issue.** Non-convex NLP local minima; AHMPC detects but does not fix non-stabilising local solutions (p.7–8).

**Experiments & key quantitative results (exact, with page):**
- **Setup (p.14–15).** Damped double pendulum, Euler step 0.1 s, |u|∞ ≤ 5, x(0) = (0.9π, 0.9π, 0, 0), initial N = 50, M = 5, α(s) = s²/10. On failure, N is increased by 5 and the problem re-solved, up to three tries.
- **Computing the terminal polynomials (p.11).** Degree-6 cost and degree-5 feedback in 0.12 s.
- **Noise-free (p.15, p.19).** Both terminal choices stabilise in about 80 steps (8 s). Maximum horizon N = 65 with degree-5 feedback vs N = 75 with LQR.
- **Noisy, covariance 0.0004·I (p.19).**
  - Degree 10/5: stabilises; the horizon reaches zero after 64 steps, then jumps to 15 before returning to zero.
  - LQR: fails.
  - d = 3: maximum horizon 80 noise-free; fails with noise.

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: how to re-initialise the solver when local minima are detected is "an open research question" (p.8); the extent of the terminal set is unknown (p.6).
- Observed: no obstacles, no estimation/perception model, single toy system; the noise result shows the horizon reacting to disturbances, but nothing quantifies it beyond one run.

**Relation to DART:**
- **Same role as D1.** Background for adaptive-horizon MPC whose horizon is driven by stability or terminal-set verification.
- **One analogy.** Disturbances push the horizon up (p.19), loosely like DART lengthening or shortening its horizon with uncertainty. The mechanism is different, though: DART's horizon is tied to perception timing and risk, not to Lyapunov checks.
- **Gaps relative to DART.** No collision avoidance, no covariance or latency.

**Citable statements:**
- Definition → p.1: "Adaptive Horizon Model Predictive Control (AHMPC) is a scheme for varying the horizon length of Model Predictive Control (MPC) as needed."
- Prior variable-horizon work targets terminal constraints → p.2: "In these papers the horizon is changed so that a terminal constraint is satisfied by the predicted state at the end of horizon."
- Rule → p.7: "We keep increasing N by L until these conditions are satisfied on the extension of the trajectory."
- Noise raises the horizon → p.19: "But then the noise causes the horizon to jump to 15 before it settles back to zero. The LQR terminal cost and feedback failed to stabilize the pendula."
- Summary → p.21: "In this way it seeks the shortest horizons consistent with stabilization."

**Snowball candidates:** Droge & Egerstedt, "Adaptive time horizon optimization in model predictive control" (2011); Giselsson, "Adaptive nonlinear model predictive control with suboptimality and stability guarantees" (2010); Pannek & Worthmann, "Reducing the prediction horizon in NMPC: An algorithm based approach" (2011); Page et al., "Adaptive horizon model predictive control based sensor management for multi-target tracking" (2006) — **possibly relevant to DART (sensor management + adaptive horizon)**; Michalska & Mayne, "Robust receding horizon control of constrained nonlinear systems" (1993); Grüne et al., "Analysis of unconstrained nonlinear MPC schemes with time varying control horizon" (2010).

---

### D3 — Reinforcement Learning of the Prediction Horizon in Model Predictive Control
Eivind Bøhn, Sebastien Gros, Signe Moe, Tor Arne Johansen; arXiv:2102.11122v1 [eess.SY] (22 Feb 2021); the arXiv copy does not print a venue (D4 and D5 cite it as IFAC-PapersOnLine 54(6), 314–320, 2021); pages read: 6/6
Status: USE (related work on adaptive horizons, including a collision-avoidance task where obstacle information gets more uncertain with prediction range)

**Problem & setting:** The horizon trades performance against computation, and the right horizon varies over the state space. The paper learns the horizon as a function of the state with RL (p.1).

**Method (key idea, key equations in words, assumptions):**
- **Policy.** Soft Actor-Critic; output scaled from [−1, 1] to [1, N_max] and rounded (Eq. 8, p.3).
- **Cost.** R = R_P (MPC stage cost) + λ_C(t_max − t)·R_C (constraint violation, episode ends) + λ_N·R_N(a) with R_N(a) = a, i.e. computation is assumed linear in the horizon (Eq. 9, p.3–4).
- **Terminal cost.** An MPC value function is learned jointly (quadratic polynomial, 32-step bootstrapping) and used as terminal cost (p.4).
- **Settings.** N_max = 50 (p.4).

**Experiments & key quantitative results (exact, with page):**
- **Tasks (p.4).**
  - (i) Cart-pole with position tracking, step 0.04 s.
  - (ii) "Collision avoidance": a unicycle (step 0.1 s) tracks a path with random obstacles. Obstacle positions given to the MPC are drawn in a cone, so their uncertainty grows with distance. Soft constraints at 150% of the obstacle radius.
- **Results (p.5).** RL beats the second-best policy by "about 4% and 8%" on pendulum and collision avoidance respectively. The best fixed horizon for collision avoidance is 10 steps; the 5-step horizon cannot get around all obstacles. Training converges after about 15 thousand steps (about 10 and 25 minutes of data).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: stability and guarantees are not investigated (p.5); "at least for simple systems" (p.5).
- Observed:
  - toy 2-D tasks with soft obstacle constraints;
  - the uncertainty model is a synthetic cone, not a perception model;
  - no latency;
  - no safety guarantee (episodes end on collision during learning);
  - results come from 10 fixed test episodes.

**Relation to DART:**
- **What it gives DART.** Evidence that the best horizon depends on how far into the future obstacle information stays trustworthy ("longer horizons considers increasingly uncertain information"). This supports DART's idea of tying the horizon to information quality and expected measurement times.
- **How DART differs.** DART uses a model-based, interpretable rule plus a CBF safety filter instead of a learned black-box horizon policy.
- **Gaps relative to DART.** No perception scheduling, latency or guarantees.
- **Where it is stronger than DART.** It optimises the horizon directly for a closed-loop performance-plus-computation objective.

**Citable statements:**
- The right horizon varies with state → p.1: "The performance sensitivity to the prediction horizon length varies over the state space"
- Contribution → p.1: "In this paper we propose to learn the optimal prediction horizon as a function of the state using reinforcement learning (RL)."
- Uncertainty grows with prediction range → p.4: "the position of the obstacles grows more uncertain the longer the prediction horizon is. This means longer horizons considers increasingly uncertain information"
- Results → p.5: "improving on the second best achieving policy by about 4% and 8% for the inverted pendulum and collision avoidance systems, respectively."
- Long horizons are sensitive to uncertain predictions → p.5: "its planned routes are more sensitive to the uncertainty in the projected locations."
- No guarantees → p.5: "An important further work is to investigate how this affects the stability properties of the MPC framework, and if any guarantees can be given."

**Snowball candidates:** Gardezi & Hasan, "Machine learning based adaptive prediction horizon in finite control set model predictive control" (2018); Scokaert & Mayne, "Min-max feedback model predictive control for constrained linear systems" (1998); Bøhn et al., "Optimization of the model predictive control meta-parameters through reinforcement learning" (2021); Zanon & Gros, "Safe reinforcement learning using robust MPC" (2020).

---

### D4 — Conflict-Predictive Variable Horizons in Multi-Drone Distributed Model Predictive Control
Linda Mümken, Michael Schwung, Stefan Lier, Andreas Schwung; arXiv:2609.13270v1 [cs.RO] (7 Sep 2026). The arXiv comment says it was submitted to IEEE Trans. Systems, Man, and Cybernetics, status "under review", so it is **not peer-reviewed**. Pages read: 15/15
Why chosen: from the arXiv search; the only screened paper whose horizon depends on **predicted risk/context** (time to conflict) for **drone collision avoidance**, with guarantees.
Status: USE (most direct prior art for a risk-dependent horizon; treat as a preprint)

**Problem & setting:**
- Distributed MPC for multi-drone collision avoidance. A fixed horizon is either too short (late reaction) or too costly; per-step cost grows superlinearly with the horizon (p.1).
- Each drone observes time-stamped neighbour positions by onboard sensing or broadcast (p.3).

**Method (key idea, key equations in words, assumptions):**
- **Safety radius.** Adaptive and braking-distance based: r_i = r_min + α‖v_i‖²/(2U_max) (Eq. 2, p.4).
- **Neighbour prediction.** Least-squares constant-velocity flight line from the last L positions, with speed floor ν·V_max (Eq. 4–6, p.4).
- **Confidence funnel.** Radius ψ(τ) = r_f + (r_max − r_f)·exp(−σ(τ)/c_d), which narrows with prediction time (Eq. 7).
- **Conflict test.** Closed-form closest-approach time τ*_ij and gap g_ij; a conflict exists if g_ij ≤ ψ(τ*_ij) (Eq. 8–10, p.5).
- **Horizon policy.** H_i = clip(max_j ⌈τ*_ij/Δt⌉, H_min, H_max), and H_min if there is no conflict (Eq. 12). This is the minimal covering horizon (Proposition III.5).
- **Guarantees.**
  - H_min must satisfy the feasibility bound H_min^feas = ⌈(1/Δt)·√(2 r_min α / U_max)⌉ (Eq. 13, p.6).
  - Feasibility and asymptotic stability hold for **any** horizon sequence inside [H_min, H_max] (Theorem IV.7, p.8). The argument uses a horizon-independent Lyapunov function and a horizon-uniform bound on the finite-horizon residual.
  - The guarantees are independent of prediction accuracy (Corollary IV.9, p.9).
  - Extension to linearised and nonlinear quadrotors via a cascaded inner loop, giving practical stability for the nonlinear model (Section V, p.9–11).
- **Assumption that safety rests on.** Per-step solver feasibility (Assumption IV.5).

**Experiments & key quantitative results (exact, with page):**
- **Setup (p.11).**
  - Antipodal swaps with N ∈ {2, 4, 8} drones in 5³ and 20³ m³ volumes.
  - r_min = 0.4 m, α = 0.25, V_max = 3.0 m/s, U_max = 3.0 m/s², Δt = 0.1 s.
  - H ∈ [4, 10]; H_min^feas = 3.
  - L = 50, c_d = 0.3, ν = 0.5.
  - 20 seeds, 500 s budget, 360 runs.
- **Computation (p.12).**
  - Prediction costs 0.04–0.7 ms per step.
  - Mean selected horizon 4.1–4.5.
  - Per-step solver cost 4.5× to 8.6× below the long horizon.
  - Total time 2.0× to 2.7× below the long horizon wherever the long horizon finishes.
- **Completion (p.12).** In the 8-drone open scenario the long horizon exceeds the budget in all 20 seeds, while the variable horizon finishes in 290 s on average.
- **Open 4-drone case vs short fixed horizon (p.12).** 38 vs 98 s total; 220 vs 248 steps; mean solver time 172 vs 393 ms. In tight scenarios the variable horizon costs up to 2.7× more than the short one.
- **Safety (p.12–13).**
  - Variable horizon: never below the 0.8 m contact boundary in its 120 runs.
  - Short fixed horizon: breaches in 2 of 20 runs in the 8-drone open scenario (worst 0.776 m).
- **Worst-case closest approach, open 4-drone (Table II, p.13).** 0.81 / 0.86 / 1.07 m (short / variable / long).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - the linear predictor degrades against strongly manoeuvring neighbours;
  - at the densest crossing the horizon collapses to H_min and drones pass closer to the boundary;
  - the nonlinear extension excludes aggressive flight;
  - simulation only, with timings meaningful only as ratios (p.14);
  - the guarantees depend on per-step feasibility (p.13).
- Observed:
  - "safety" means the separation constraint is satisfied by a feasible DMPC; there is no estimation noise, no measurement latency, and neighbour positions come from shared or observed histories without a perception model;
  - neighbours are cooperative drones running the same controller, not unknown obstacles;
  - not peer-reviewed yet.

**Relation to DART:**
- **Most direct support** for DART's claim that the horizon should follow risk/context rather than stability alone. It also shares two DART ingredients: a braking-distance-based safety radius, and a minimum horizon justified by braking (H_min^feas "keeps every window long enough for a braking maneuver").
- **Positioning point.** D4 decouples safety from the horizon-selection signal. DART's CBF safety filter can make the same kind of argument, and DART should say whether its guarantee is independent of the horizon policy.
- **What D4 does not do.**
  - no perception model, estimation covariance, or delayed/irregular measurements;
  - its horizon is driven by geometric time to conflict, not by the expected arrival of the next perception result;
  - it does not decide **when to sense**.
- **Related-work pointer.** D4's discussion of event- and self-triggered MPC (which trigger *recomputation* of control) helps position DART's trigger, which acts on *perception*.
- **Where it is stronger than DART.** Formal feasibility and stability proof for a time-varying horizon; multi-agent scale.

**Citable statements:**
- Fixed-horizon trade-off → p.1: "a short horizon is inexpensive but reacts late to approaching neighbors, whereas a long one anticipates conflicts at a per-step cost that grows superlinearly with its length."
- Policy → p.1: "The horizon is then the smallest admissible value whose planning window covers the farthest predicted conflict."
- Decoupling → p.1: "A misprediction therefore blunts anticipation and costs efficiency, never safety."
- Event-triggered MPC contrast → p.2: "In these methods, the trigger determines when to recompute and which subsystem performs the computation."
- Forecast accuracy is safety-critical in chance-constrained MPC (note: "safety-critical" is hyphen-broken across a line in the PDF; checked by eye) → p.2: "In all of these, forecast accuracy is safety-critical, since an inaccurate forecast enters the avoidance constraint directly"
- Braking-distance radius → p.4: "whose radius scales with the braking distance [5]"
- Minimum horizon covers braking → p.8: "keeps every window long enough for a braking maneuver (13)."
- Guarantees are conditional → p.13: "The guarantees are conditional on per-step solver feasibility (Assumption IV.5)"
- Mean horizon stays low → p.12: "its mean selected horizon lies between 4.1 and 4.5 across the scenarios, over the band [4, 10]."
- Cost result → p.12: "The variable horizon undercuts the long fixed horizon by 2.0× to 2.7× in every scenario in which the latter finishes."
- Safety result → p.12: "in the eight-drone open scenario, 2 of 20 runs breach the boundary, dipping to 0.776 m at worst."
- Simulation-only caveat → p.14: "the evaluation is in simulation, and its wall-clock timings are informative as ratios within a scenario rather than as absolute figures"

**Snowball candidates:** Gräfe, Eickhoff, Trimpe, "Event-triggered and distributed model predictive control for guaranteed collision avoidance in UAV swarms" (2022) — **relevant to DART's triggering positioning**; Ma et al., "Event-triggered distributed MPC with variable prediction horizon" (2021); Sun et al., "Robust self-triggered MPC with adaptive prediction horizon for perturbed nonlinear systems" (2019); Richards & How, "Robust variable horizon model predictive control for vehicle maneuvering" (2006); Yoshikawa et al., "Dynamic obstacle avoidance for multi-rotor UAV using chance-constraints based on obstacle velocity" (2023); Zeng, Li, Sreenath, "Enhancing feasibility and safety of nonlinear model predictive control with discrete-time control barrier functions" (2021); Mümken et al., "Distributed model predictive control with adaptive safety zones for multi-fleet drone operations" (2026, arXiv 2606.20651).

---

### D5 — RL-based Variable Horizon Model Predictive Control of Multi-Robot Systems using Versatile On-Demand Collision Avoidance
Shreyash Gupta, Abhinav Kumar, Niladri S. Tripathy, Suril V. Shah; arXiv:2308.07071v1 [cs.RO] (14 Aug 2023); no venue printed; pages read: 7/7
Why chosen: from the arXiv search; a variable (learned, state-dependent) horizon for collision avoidance with static and dynamic obstacles, which addresses keeping collision constraints consistent when the horizon changes. D4 cites it as [13].
Status: USE (marginal: related work on variable-horizon MPC with collision constraints; toy dynamics, no guarantees)

**Problem & setting:** 2-D single-integrator robots; other robots act as dynamic obstacles, plus static obstacles. Two problems: (1) on-demand collision avoidance that stays valid when each robot's horizon changes; (2) learning per-robot horizons (p.2).

**Method (key idea, key equations in words, assumptions):**
- **Condensed MPC.** Stacked F and Φ matrices whose dimensions change with N_i^k (Eq. 4–5, p.2). Quadratic tracking and input cost (Eq. 6).
- **VODCA collision handling.**
  - Collisions are detected on the previous step's predictions over N_min = min(N_i^{k−1}, N_j^{k−1}) (Eq. 7–8).
  - Each detected collision gives a linearised half-plane constraint bᵀx ≥ c at the predicted collision step k_c (Eq. 9–12).
  - If k_c is at or beyond the new (shorter) horizon, the constraint is placed on the last predicted state (Eq. 13, p.3).
- **Horizon learning.**
  - SAC outputs one horizon per robot, N ≤ 49 (Eq. 20–21, p.4).
  - Reward = progress − λ_h·N − collision penalty + termination bonus − variance of the horizons across robots (Eq. 22–27, p.5).

**Experiments & key quantitative results (exact, with page):**
- **Parameters (Table I, p.5).** h = 0.2 s, r_min = 1.5 m, input bounds ±1.5 m/s, K = 350, λ_h = 0.001.
- **2-robot set-point task (p.5–6).** RL takes a shorter path than FH30 and activates fewer collision constraints.
- **14-robot exchange with 3 static obstacles (p.6).** RL path cost is 7.07% better than the best fixed horizon (FH20). Task time is comparable, but **computation time is higher with RL**.
- **4-robot case (p.6–7).** Only RL completes it; fixed horizons hit local minima or collisions (Fig. 6).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: RL computation time is higher (p.6); hardware is future work (p.7).
- Observed:
  - single-integrator 2-D robots; neighbours' predictions are assumed known;
  - no uncertainty or sensing;
  - no safety guarantee (constraint placement when k_c > N is heuristic);
  - few scenarios and no statistics over seeds.

**Relation to DART:**
- **Design point it raises.** When the horizon shrinks, a predicted conflict can fall outside the new horizon. D5 handles this by moving the constraint to the last step; DART's adaptive horizon needs an answer too, e.g. the CBF filter or terminal braking constraints.
- **Further evidence.** A state-dependent horizon can improve collision-avoidance outcomes.
- **Gaps relative to DART.** No perception, latency, uncertainty, guarantees or quadrotor dynamics.

**Citable statements:**
- Computational motivation → p.1: "Increasing the prediction horizon beyond a limit drastically increases the computation cost."
- Variable horizons weaken on-demand avoidance → p.2: "However, in the presence of variable prediction horizon, its preview capability may get compromised."
- Collision definition in reward → p.5: "we are considering that a robot has collided when it comes in the vicinity of 0.5rmin with any other robot or obstacle."
- Result → p.6: "RL was best performing with an improvement of 7.07% over the best performing fixed horizon, FH20."
- Cost of the method → p.6: "the computation time was higher in RL, which can be reduced using a better computing device."

**Snowball candidates:** Luis & Schoellig, "Trajectory generation for multiagent point-to-point transitions via distributed model predictive control" (2019); Gupta et al., "Segregation of multiple robots using model predictive control with asynchronous path smoothing" (2022).

---

### D6 — Optimal-Horizon Model-Predictive Control with Differential Dynamic Programming
Kyle Stachowicz, Evangelos A. Theodorou; arXiv:2111.09207v1 [cs.RO] (17 Nov 2021); arXiv comment: "Submitted to ICRA 2022"; pages read: 7/7
Why chosen: the abstract says the horizon "is determined online" and includes an obstacle-avoidance MPC demo.
Status: **EXCLUDE.** Here the "horizon" is the **free final time** (time to finish the task), chosen by minimising a time-penalised cost with DDP. It is not a risk- or context-dependent look-ahead. The obstacle example is a qualitative illustration (Fig. 5) with no uncertainty, latency or safety metrics. Background only; not suitable as a DART reference for adaptive horizons.

**Problem & setting / Method:**
- Solves min over T and u of Σℓ + Φ with a free number of steps T (Eq. 1, p.1).
- In the LTI case, a time-invariant value function lets every candidate horizon be evaluated from one Riccati sweep (Observation 1, p.2).
- In the nonlinear case, DDP value-function expansions select T = T̄ − argmin_t Ṽ^{t:T̄}(x₀), with a cubic error bound (Eq. 5, Theorem 1, p.3–4).
- The MPC version shrinks the horizon each step until it ends (Alg. 2, p.5).

**Key results:**
- Table II (p.6): cart-pole 9 ms / 35 iterations vs 213 s (Sun et al.) and 6.415 s (IPOPT); quadrotor 101 ms.
- Point-mass MPC obstacle demo: "The MPC step takes on average 5 milliseconds to recompute for each stage when warm-started" (p.6).

**Citable statement (background only):**
- Horizon as decision variable → p.1: "trajectory optimization problems in which the horizon is determined online rather than fixed a priori."

---

## Group synthesis
- **Quadrotor local planners (C4, C5)** are fast, deterministic and map-based (EDF or ESDF-free). Neither models estimation uncertainty or obstacle motion: C4 leaves dynamic environments to future work (p.8), and C5 states it is "designed for static environments" with movers below 0.5 m/s (p.8). Both assume perception keeps the map current, and neither reasons about perception latency or rate.
- **Uncertainty-aware MPC for dynamic obstacles (C6, C7).** Their method is a standard template:
  - constant-velocity Kalman tracks with growing covariance;
  - obstacle constraints linearised as tangent half-spaces;
  - a covariance-dependent margin erf⁻¹(1 − 2δ)·√(2aᵀΣa).

  This directly underpins DART's covariance-inflated half-space constraints and gives them a chance-constraint reading.
- **C7 is the closest system to DART.** It runs onboard depth → ellipsoid obstacles with covariance → CC-MPC with field-of-view constraints. But perception runs **every frame at 60 Hz with about 8 ms detection**, so latency and sensing-rate questions never arise. Its measurement covariance is "empirically determined".
- **None of C4–C7 compensates measurement delay** (no capture-time updates) or decides when to sense. All assume fresh measurements at (or near) every control step. In C6, perception is even simulated with motion capture plus noise.
- **Adaptive-horizon MPC (D1, D2) originates as a stabilisation tool.** The horizon shrinks toward a terminal set and grows when Lyapunov/terminal checks fail. There are no obstacles or uncertainty, so these papers define the term but not DART's use of it.
- **Learned horizons (D3, D5).** The best horizon depends on context, and in D3 explicitly on how uncertain future obstacle information is. But they give no guarantees and use toy 2-D dynamics; D5 even increases computation.
- **D4 (2026 preprint) is the nearest prior art for a risk-dependent horizon.** The horizon is sized to predicted time to conflict, uses a braking-distance safety radius, and keeps a minimum horizon that covers braking. Its guarantees hold for any horizon in a certified band, independent of prediction accuracy. Still, it has no perception or estimation model, no latency, and no notion of scheduling sensing.
- **Gap DART can fill, from what was read.** No paper here couples (i) when the next perception result must arrive (perception triggering under learned-depth latency) with (ii) the MPC horizon and the obstacle covariance growth until that arrival, and (iii) a safety filter whose margin grows with covariance over the open-loop interval.
  - The closest pieces exist separately: covariance growth and inflation (C6, C7); a risk/time-to-conflict horizon with braking-based minimum (D4); event-triggered *control recomputation* (cited in D4 as [14]–[16], not read here).
- **Positioning cautions.**
  - DART should state the confidence level its inflation corresponds to (C6/C7 use δ = 0.03).
  - It should say whether its safety argument is independent of the horizon policy, which is D4's selling point.
  - It should acknowledge that C6, C7 and C4/C5 are hardware-validated while DART is simulation-only.
- **Snowball priority for DART:**
  - Falanga et al. 2019, "How fast is too fast? The role of perception latency in high-speed sense and avoid" (cited by C7);
  - Gräfe et al. 2022, event-triggered DMPC for guaranteed collision avoidance;
  - Sun et al. 2019, self-triggered MPC with adaptive prediction horizon;
  - Page et al. 2006, AHMPC-based sensor management;
  - Zeng et al. 2021, NMPC with discrete-time CBFs.
