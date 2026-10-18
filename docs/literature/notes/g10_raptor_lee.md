# Group 10 — RAPTOR (IEEE T-RO 2021) and Lee, Leok & McClamroch (IEEE CDC 2010), official versions

**Files read (every page)**
* `scratchpad/papers/g10_raptor/raptor2021.pdf` — IEEE Xplore PDF of the published article (18 pages, journal pages
  1992–2009), supplied by the user on 2026-10-18. Read from `pdftotext` output (reading order and layout); pages 6–9,
  11 and 14–15 (algorithms, Tables I–IV, Figs. 10–11, 14, 23–27) were also read from the rendered page images.
* `scratchpad/papers/g10_lee/lee2010.pdf` — IEEE Xplore PDF of the published proceedings paper (6 pages, pages
  5420–5425), supplied by the user on 2026-10-18. Read from `pdftotext` output; equations (8)–(16) checked on the page.

**Conventions.** "p." is the printed journal / proceedings page. Text in double quotes is verbatim (checked with
`verify_quotes.py`); equations are written outside quotes. These two files replace the earlier readings of the arXiv
versions (C2: arXiv:2007.03465v1; I1: arXiv:1003.2005), which are no longer cited.

---

### C2 — RAPTOR: Robust and Perception-Aware Trajectory Replanning for Quadrotor Fast Flight

Zhou, B., Pan, J., Gao, F., Shen, S., IEEE Transactions on Robotics 37(6), 1992–2009 (2021),
https://doi.org/10.1109/TRO.2021.3071527 (p.1992: received July 4, 2020; accepted March 19, 2021).
Status: USE (published version read in full).

**Problem and method.**
* Fast quadrotor replanning in unknown environments with a depth camera (Intel RealSense D435, p.2001); depth images are
  fused into an occupancy grid map and an ESDF (p.2001).
* Path-guided gradient-based optimization with topologically distinct guiding paths (Sections IV–V).
* Risk-aware trajectory refinement (Section VI, Algorithm 3, p.1999):
  * p.1998: "at some time tf , the trajectory pi (t) exits the known-free space and enters the unknown space. The
    position pf = pi (tf ), should be prioritized for observation"; "In the worst case an unknown obstacle can be right
    adjacent to it."
  * p.1999: "As is the worst case, an unknown obstacle may be revealed right behind pf and block the trajectory."
  * Worst-case safety criterion, eq. (6), p.1999: v_c^2/(2 a_max) <= d_cf - R_q, where p_c is the point from which p_f
    becomes reliably visible, v_c the speed there and d_cf the distance to p_f; "which means that if at pc the
    quadrotor sees an obstacle, it can decelerate to a stop before colliding with the obstacle right behind pf . Rq
    compensates the quadrotor size and disturbance."
  * If (6) fails, view and safety constraints (7)–(9) are added so that p_f is seen earlier and the reaction distance
    d_s = v_s^2/(2 a_max) + R_q is available (p.1999–2000).
* Yaw angle planning (Section VII): p.2000: "Quadrotors typically have limited sensor FOVs. To improve flight safety, we
  plan the trajectory of yaw angle to actively observe the environments."

**Related-work statements (p.1994).**
* "Many methods adopt the optimistic assumption [7], [14], [15], [26], which treats the unknown space as collision-free.
  This strategy improves the chance of reaching goals, but may not guarantee safety."
* "some other methods regard unknown space as unsafe and only allow motions within the known-free space [27] or sensor
  FOV [28], [29]." "Although these restrictions ensure safety, they lead to conservative motion."

**Experiments.**
* Real-world comparison of four planners, 3 trials per scene, v_max = 3 m/s, a_max = 2.5 m/s^2 (p.2002, Table II):
  success in scene 1 / scene 2 — A (optimistic, velocity-tracking yaw) 0/0, B (optimistic, active exploration yaw) 0/0,
  C (risk-aware, velocity-tracking yaw) 2/0, D (risk-aware, active exploration yaw) 3/3.
* Scene 2, obstacle behind a corner (p.2003): "In this scene, the quadrotor can only reach the goal safely with planner
  D. For the other three planners, the quadrotor collides with the obstacle behind the corner, due to either the poor
  visibility of the replanned trajectories (planners A and B), or the delay of perception caused by the velocity-tracking
  yaw (planner C)."
* p.2003: "The experiments demonstrate two critical factors to survive in high-speed flights: (a) having good visibility
  toward the unknown regions that will influence the flight and (b) looking toward the relevant direction to eliminate
  those unknown regions ... actively." (the sentence is interrupted by the caption of Fig. 17)
* Simulation benchmark against SLE (Table IV, p.2006) and against FASTER, EWOK, RE Traj. (Fig. 25, p.2005); indoor and
  forest flights with maximum speeds 2.90–3.41 m/s (p.2007).

**Citable statements.**
1. RAPTOR identifies the point where the planned trajectory leaves the known-free space, treats it as the place where an
   unknown obstacle may lie in the worst case, and checks that the quadrotor can still stop before it once it becomes
   visible (eq. 6); if not, it refines the trajectory so that the point is seen earlier, and plans the yaw to observe
   the unknown regions relevant to the flight (p.1998–2000).
2. In flight experiments, an obstacle hidden behind a corner was avoided only by the planner that enforced visibility of
   the unknown region and turned the camera toward it; the other planners collided (p.2003, Table II).

**Relation to our method.** The closest planning counterpart of the coverage condition: the same worst-case reasoning
(an obstacle right behind the boundary of observed space) and the same braking test. RAPTOR adapts the *motion*
(trajectory and yaw) so that the unknown region is observed early enough; the perception stream itself is not
scheduled, and latency is not modelled. Our scheduler keeps the motion and decides *when to run inference*. Its corner
experiment is the physical counterpart of Fig. 2b (detour into occluded space).

**Caveats.** Speeds of 2–3.4 m/s; stereo depth camera with a mapped ESDF, not monocular learned depth; success counts
over 3 trials per planner and scene.

---

### I1 — Geometric tracking control of a quadrotor UAV on SE(3)

Lee, T., Leok, M., McClamroch, N.H., Proc. 49th IEEE Conference on Decision and Control (CDC), pp. 5420–5425 (2010),
https://doi.org/10.1109/CDC.2010.5717652. Status: USE (published version read in full; used for the implementation of
the attitude loop).

**Content.**
* p.5420: "A nonlinear tracking controller is developed on the special Euclidean group SE(3) and it is shown to have
  desirable closed loop properties that are almost global."
* Structure (p.5421): "For a given translational command xd (t), we select the total thrust f , and the desired direction
  of the third body-fixed axis ~b3d to stabilize the translational dynamics." The desired attitude is
  R_d = [b2d x b3d, b2d, b3d] with b2d = (b3d x b1d)/||b3d x b1d||.
* Errors (p.5422): attitude error e_R = (1/2)(R_d^T R - R^T R_d)^vee (eq. 10); angular-velocity error
  e_Omega = Omega - R^T R_d Omega_d (eq. 11).
* Control (p.5422): f = -(-k_x e_x - k_v e_v - m g e3 + m xdd_d) . R e3 (eq. 15);
  M = -k_R e_R - k_Omega e_Omega + Omega x J Omega - J(hat(Omega) R^T R_d Omega_d - R^T R_d Omegadot_d) (eq. 16).
* p.5422: "we carefully design the magnitude of the total thrust f so that it is reduced when there is a large attitude
  tracking error."
* Stability (p.5423–5424): exponential stability of the complete dynamics for initial attitude error below 90 degrees
  (Proposition 2), almost global exponential attractiveness for initial attitude error below 180 degrees (Proposition
  3); proofs in the arXiv report [20] of the paper. Gains k_x, k_v, k_R, k_Omega are positive scalars.

**Citable statement.** The attitude loop of the simulation uses the thrust (15) and moment (16) of this controller.

**Relation to our implementation** (`src/plant/dart_attitude_controller.m`). Desired force F_d = m(a + g e3) with drag
feed-forward, tilt and thrust limits; b3d = F_d/||F_d|| and the yaw-defined b1 give R_d as in the paper; e_R as in
eq. (10); Omega_d = 0, so e_Omega = Omega and the feed-forward term of (16) vanishes; per-axis (diagonal) gains instead
of scalar gains; f = F_d . R e3 as in (15) (z-up instead of the paper's z-down convention). *(our inference)* The
stability propositions of the paper assume (15)–(16) with the full feed-forward terms and scalar gains, so they are not
claimed for this simplified form.
