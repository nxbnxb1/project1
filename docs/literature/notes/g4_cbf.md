# Notes — Group g4: CBF foundations, CBF + MPC, quadrotor geometric control

Reader notes:
* PDFs and text extractions are in `scratchpad/papers/g4_cbf/` (`<id>.pdf`, `<id>.txt`, `<id>.pg.txt` with `=== PAGE n ===` markers).
* Page numbers are PDF pages. For all arXiv PDFs here the printed page numbers (where printed) match the PDF pages.
* Verbatim quotes come from `pdftotext -layout`. Two-column text was re-joined across line breaks within one column. Mathematical glyphs were
  normalised from the extraction artefacts (e.g. `6=` → `≠`, `k·k` → `‖·‖`, `∆` → `Δ`). No words were changed.
* All arXiv IDs were checked against the arXiv API `<title>`; all matched. The E7 author list in the task was wrong (see E7).
* Crossref was used only to look up DOIs and published venues, not as a source for content.

---

### E1 — Control Barrier Function Based Quadratic Programs for Safety Critical Systems
A. D. Ames, X. Xu, J. W. Grizzle, P. Tabuada; arXiv:1609.06408v2 [math.OC], 5 Dec 2016 (published IEEE TAC 62(8):3861–3876, 2017, DOI 10.1109/TAC.2016.2638961 per Crossref); pages read: 17/17 (references skimmed)
Status: USE

**Problem & setting:** The paper studies continuous-time control-affine systems ẋ = f(x) + g(x)u. The goal is to enforce safety, expressed as forward invariance of C = {h ≥ 0}, together with a performance objective expressed by a CLF. It is illustrated on automotive adaptive cruise control (ACC) and lane keeping (LK).

**Method (key idea, key equations in words, assumptions):**
* It defines two classes of barrier functions:
  * reciprocal barrier functions B (blow up on ∂C; condition Ḃ ≤ α(1/B));
  * zeroing barrier functions h (vanish on ∂C; condition L_f h ≥ −α(h) with α extended class-K; eq. 18, p.5).
* Both are extended to control barrier functions:
  * RCBF, eqs. 23–24, p.6;
  * ZCBF, sup_u[L_f h + L_g h u + α(h)] ≥ 0, eq. 25, p.7.
* Corollaries 1–2 (p.7): any locally Lipschitz controller inside the CBF admissible set renders C (or Int C) forward invariant.
* Existence of a ZBF is necessary and sufficient for invariance of compact sets (Props. 1 and 3, pp.5–6).
* A ZBF also makes C asymptotically stable (Prop. 2, p.5), which gives robustness.
* A CLF–CBF QP (p.8, eqs. 33–34) relaxes the CLF row with δ (soft) and keeps the CBF row hard. Theorem 3 (p.8) gives local Lipschitz continuity of the QP solution when L_g B ≠ 0. The proof uses a closed-form Gram-matrix solution (pp.8–9).
* Higher relative degree: Prop. 4 (p.7) builds an RCBF B_r = 1/h + H∘L_f^{r−1}h. It only covers the case U = R^m.
* Force-constrained ("force-based") barriers for ACC (appendix, pp.15–16) are built from worst-case maximal braking of the lead and following cars. The LK barrier (eq. 53, p.12) is a braking-distance form: h_F = (y_max − sgn(ẏ)y) − ½ẏ²/a_max.

**Experiments & key quantitative results (exact, with page):** Simulation only. Real-time hardware is referenced to other work.
* ACC initial condition (v_f(0), v_l(0), D(0)) = (18, 10, 150) and v_d = 22 m/s (p.11).
* Time headway τ_d = 1.8 (footnote 6, p.10).
* Table I (p.14): M = 1650 kg, a_f = a'_f = 0.25, γ = 1, c = 10, p_sc = 10², y_max = 0.9 m, a_max = 0.3×9.81 m/s².
* Without force constraints the commanded acceleration violates the comfort limits (Fig. 2, p.11). With force-based RCBFs (ACC-QP2) the headway and force constraints are satisfied (Figs. 4–5, pp.13–14).
* LK: "the absolute value of the lateral displacement is always bounded by 0.9m, and the lateral acceleration is always bounded by 0.3g" (p.14).
* RCBF vs ZCBF: "Our limited experience is that the ZCBFs generate a smoother input trajectory" (pp.13–14).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: when inputs are bounded, the higher-relative-degree construction "may no longer be valid. Designing CBFs in this case remains an open question" (p.7).
* Stated: Lipschitz continuity of the QP with an extra input-bound constraint "is not currently assured" (p.9).
* Stated: the force-based barriers were derived for ACC and LK specifically, "leaving as an open problem how to do characterize and compute such functions for general classes of control systems" (pp.14–15).
* Stated: the ACC barrier derivation assumes no reaction delay (p.15).
* We observe:
  * the results are continuous-time, with full and exact state;
  * there is no sampling or ZOH analysis, no measurement latency and no estimation error;
  * the only robustness handle is the asymptotic stability of C;
  * evaluation is in simulation only.

**Relation to DART:**
* Supports: the theoretical base of DART's CBF safety filter (component 5). It provides the zeroing CBF condition ḣ ≥ −α(h), the forward-invariance corollary and the "safety hard / performance soft" QP philosophy.
* Supports: the idea of designing the barrier from a maximal-braking manoeuvre so that it respects input bounds (ACC appendix; LK eq. 53). This is the same physical idea as DART's braking-distance CBF and stopping inequality.
* Gap:
  * E1's braking barrier explicitly assumes "no reaction delays". DART's scheduler adds an open-loop interval (latency, perception period) to the same stopping inequality.
  * E1 has no estimation uncertainty. DART inflates the barrier with covariance growth d(t).
  * E1 has no perception scheduling.
* Stronger than DART: rigorous necessity/sufficiency results and a Lipschitz-continuity proof of the QP controller. DART's filter adds a box constraint and a slack, for which E1 itself says continuity is not assured.

**Citable statements:**
- The ZCBF condition is minimally restrictive. A set is forward invariant iff it admits a ZBF (compact case). → p.6: "Propositions 1 and 3 together show that a set C is forward invariant if, and only if, it admits a ZBF."
- In the CLF–CBF QP, safety is hard and performance is relaxed. → p.2: "relaxation is used to make the stability objective a soft constraint on the QP, while safety is maintained as a hard constraint."
- QP-based safety controllers run in real time at 200 Hz–1 kHz. → p.8: "executed in real-time to achieve bipedal walking [22], [21] on a human-sized robot and on scale cars [53], with sample rates of 200 Hz to 1 kHz."
- Higher-relative-degree CBFs under input bounds were an open problem. → p.7: "if U ≠ R^m, i.e., there are constraints on the input u, then the construction shown above for higher relative degree h may no longer be valid."
- Braking-based barrier construction assumes zero reaction delay (the gap DART addresses). → p.15: "Supposing there are no reaction delays, it follows that T_l = v_l/(a_l g), T_f = v_f/(a_f g)."
- The force-based barrier encodes "can always brake in time". → p.11: "within the set C_F, the ACC-equipped car can always brake to maintain a desired headway using an allowed amount of deceleration."
- Barrier-based safety is proposed for robotic obstacle avoidance. → p.15: "naturally applicable to robotic systems, e.g., in the context of self-collision avoidance, obstacle avoidance".

**Snowball candidates:**
- Ames, Grizzle, Tabuada — Control barrier function based quadratic programs with application to adaptive cruise control (2014)
- Xu, Tabuada, Grizzle, Ames — Robustness of control barrier functions for safety critical control (2015)
- Mehra et al. — Adaptive cruise control: Experimental validation of advanced controllers on scale-model cars (2015)
- Xu, Grizzle, Tabuada, Ames — Correctness guarantees for the composition of lane keeping and adaptive cruise control (2016/2018)
- Romdlony, Jayawardhana — Uniting control Lyapunov and control barrier functions (2014)
- Wieland, Allgöwer — Constructive safety using control barrier functions (2007)
- Hsu, Xu, Ames — Control barrier function based quadratic programs with application to bipedal robotic walking (2015)

---

### E2 — Control Barrier Functions: Theory and Applications
A. D. Ames, S. Coogan, M. Egerstedt, G. Notomista, K. Sreenath, P. Tabuada; arXiv:1903.11199v1 [cs.SY], 27 Mar 2019 (published ECC 2019, pp. 3420–3431, DOI 10.23919/ECC.2019.8796030 per Crossref); pages read: 12/12 (references skimmed)
Status: USE

**Problem & setting:** A tutorial and survey of CBF theory and applications: history from Nagumo to barrier certificates to modern CBFs, CBF-QPs, CBFs under actuation limits, exponential CBFs for high relative degree, and robotic applications (walking, ACC/LK on a Khepera robot, Segway, long-duration multi-robot autonomy).

**Method (key idea, key equations in words, assumptions):**
* CBF definition (Def. 2, eq. 7, p.4): sup_u[L_f h + L_g h u] ≥ −α(h), with α extended class-K∞.
* Theorem 2 (p.4): any Lipschitz controller in K_cbf renders C safe and makes C asymptotically stable. It requires ∂h/∂x ≠ 0 on ∂C.
* Theorem 3 (p.4): necessity for compact C.
* Minimally invasive safety filter: CBF-QP min ½‖u − k(x)‖² subject to the CBF row (p.4). It has a closed-form min-norm solution when there are no input constraints.
* CLF–CBF QP with relaxation δ (p.4).
* Sec. III (p.5): when the allowable set A cannot be made invariant (input limits or high relative degree), a CBF is built from a nominal "evading maneuver" β as h(x) = inf_{τ≥0} ρ(φ_β(τ,x)) (eq. 12, Theorem 4). An SOS-based alternative is Prop. 5.
* Sec. IV (pp.6–7): exponential CBFs via input–output linearisation and pole placement (summary of E4).
* Sec. V: application barriers, including a lane-keeping braking-type CBF h_lk = d_max − sign(v_lat) y_lat − ½ v_lat²/a_max (p.9), the ASIF safety filter on a Segway (pp.9–10), and pairwise collision avoidance h_s = ‖p_i − p_j‖² − Δ² (p.11).

**Experiments & key quantitative results (exact, with page):**
* Segway ASIF: the safe set came from Hamilton–Jacobi reachability "over a 75x75x75 grid" (p.9). The CLF-QP ran "on a BeagleBone Black with an average computation time of 0.4 ms" (pp.9–10). Input bounds were "u ∈ [−15, 15]V" (p.9).
* Khepera ACC/LK experiment and Robotarium persistent coverage (6 robots, 2 moving obstacles): qualitative results only (Figs. 3, 6, pp.9–11).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: computing h by forward simulation of β "requires computing the gradient of h ... this approach becomes computationally challenging as the dimension of the system grows" (p.5).
* Stated: SOS conditions are bilinear in the decision variables (p.5).
* We observe:
  * it is a survey, with few quantitative comparisons;
  * all results are continuous-time with perfect state;
  * robustness is argued only through asymptotic stability of C (Remark 6);
  * there is no treatment of sensing delay or estimation.

**Relation to DART:**
* Supports the framing of DART's CBF layer as a minimally invasive safety filter ("ASIF") on the MPC's acceleration command (component 5).
* Supports the braking-distance CBF as a closed-form instance of the "nominal evading maneuver" construction h = inf ρ(φ_β): β = maximal braking (Sec. III; "a rapid deceleration maneuver", p.5). This is our interpretation, not a claim made in E2 about DART-type barriers.
* Supports DART's robustness argument for Kalman-update jumps: if noise pushes the state outside C, a CBF controller drives it back (Remark 6). This is qualitative only.
* Gap: no perception, latency, estimation-aware inflation or event-triggered sensing.
* Stronger than DART: it covers multiple hardware implementations.

**Citable statements:**
- Modern CBF condition and minimal restrictiveness. → p.2: "for α an (extended) class K function. Importantly, this condition is necessary and sufficient (for compact sets) and thus is minimally restrictive."
- The safety filter modifies a nominal controller minimally. → p.4: "we wish to do so in a minimally invasive fashion, i.e., modify an existing controller in a minimal way so as to guarantee safety."
- Robustness via attractivity of C. → p.4: "While a system will not formally leave the safe set C, noise and modeling errors might force the system to leave this set." (continues: "controllers in K_cbf(x) will drive the system back to the set C.")
- A barrier can be built from a backup/evading maneuver such as rapid deceleration. → p.5: "β might be a swerving maneuver or a rapid deceleration maneuver."
- Relative degree one is restrictive for robots. → p.6: "this is a restrictive assumption that is typically not held for most safety constraints for robotic systems."
- Safety filter terminology. → p.9: "The result will be a safety filter, or an Active Set Invariance Filter (ASIF)".
- Real-time feasibility on embedded hardware. → p.10: "an average computation time of 0.4 ms".

**Snowball candidates:**
- Wu, Sreenath — Safety-critical control of a planar quadrotor (2016)
- Wang, Ames, Egerstedt — Safe certificate-based maneuvers for teams of quadrotors using differential flatness (2017)
- Gurriet et al. — Towards a framework for realizable safety critical control through active set invariance (2018)
- Squires, Pierpaoli, Egerstedt — Constructive barrier certificates with applications to fixed-wing aircraft collision avoidance (2018)
- Glotfelter, Cortés, Egerstedt — Nonsmooth barrier functions with applications to multi-robot systems (2017)
- Borrmann, Wang, Ames, Egerstedt — Control barrier certificates for safe swarm behavior (2015)
- Wang, Han, Egerstedt — Permissive barrier certificates for safe stabilization using sum-of-squares (2018)

---

### E3 — Control Barrier Functions for Systems with High Relative Degree
W. Xiao, C. Belta; arXiv:1903.04706v2 [cs.SY], 13 Mar 2019 (published IEEE CDC 2019, pp. 474–479, DOI 10.1109/CDC40024.2019.9029455 per Crossref); pages read: 9/9
Status: USE

**Problem & setting:** It extends CBFs to constraints of arbitrary relative degree m (high-order CBFs, HOCBF), including time-varying constraints b(x,t). It is illustrated on adaptive cruise control with speed/acceleration limits.

**Method (key idea, key equations in words, assumptions):**
* Defines ψ_0 = b and ψ_i = ψ̇_{i−1} + α_i(ψ_{i−1}) for i = 1..m with class-K α_i (eq. 11, p.3), and sets C_i = {ψ_{i−1} ≥ 0} (eq. 12).
* HOCBF condition (eq. 14, p.3): L_f^m b + L_g L_f^{m−1} b u + ∂^m b/∂t^m + O(b) + α_m(ψ_{m−1}) ≥ 0.
* Theorem 5 (p.3): if x(t0) ∈ ∩C_i(t0), any Lipschitz controller in K_hocbf renders ∩C_i(t) forward invariant.
* Remark 4 (pp.3–4): with linear α_i the HOCBF reduces exactly to the exponential CBF of Nguyen & Sreenath (E4).
* Analysis (Sec. III-E, p.4): the choice of α_i (square-root / linear / quadratic) changes the feasible control region.
* Conflicts with input limits are handled by penalties p_i on the α_i (eq. 23, p.5).
* Implementation: time is discretised and a QP is solved at each step, with the input held constant over the interval (p.2; eq. 39, p.6).

**Experiments & key quantitative results (exact, with page):** MATLAB (quadprog, ode45) simulation of ACC (p.7).
* Table I (p.7): v_i(t0) = 20 m/s, z(t0) = 100 m, δ = 10 m, v_ip = 13.89 m/s, m_i = 1650 kg, Δt = 0.1 s, c_a = c_d = 0.4, v_max = 30 m/s, p_acc = 1.
* "the HOCBF constraint does not conflict with the braking limitation when p = 1 and p = 0.02 for linear and quadratic class K functions, respectively" (p.7).
* With p = 2 for Form 1, the values of b are "0.0193, 0.0413, 15.6669 at t = 15s and 2.8964 × 10^−7, 4.4685 × 10^−4, 12.9729 at t = 20s for square root, linear and quadratic class K functions, respectively" (pp.7–8).
* With square root and p = 1, the problem is over-constrained (Fig. 4 caption, p.8).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: when ψ_i(x(t0)) < 0 cannot be avoided by the choice of α_i, "we would need a feasibility enforcement method, which is beyond the scope of this paper" (p.3).
* Stated: the HOCBF constraint "may conflict with u_min ... the optimal control problem becomes infeasible" (p.5).
* Stated: results "are heavily dependent on the choice of the class K functions" (p.1).
* We observe:
  * the guarantees are continuous-time, but the implementation holds u constant over Δt without inter-sample analysis;
  * the state is perfect;
  * there is a single 1-D example.

**Relation to DART:**
* Supports DART's optional HOCBF (h = ‖r‖² − d², k1 = p1 + p2, k0 = p1·p2) and its altitude rows. These are the linear-class-K / exponential special case (Remark 4, eq. 16).
* E3's time-varying definition b(x,t), with its explicit ∂^m b/∂t^m term, formally covers DART's correction for a time-varying inflation d(t) (the ḋ, d̈ terms).
* E3 supports DART's choice of a braking-distance barrier as the default: it names the minimum braking distance as the known way to reconcile the barrier with braking limits.
* Gap: no estimation uncertainty, no delay and no perception. The ZOH implementation is not analysed.
* Stronger than DART: a general class-K family and an analysis of how α choice affects the feasible region.

**Citable statements:**
- HOCBFs generalise exponential CBFs. → p.4: "The time-invariant HOCBF is the generalization of exponential CBF."
- HOCBFs can handle time-varying constraints, relevant for the time-varying inflation d(t). → p.3: "The general, time-varying HOCBF introduced in Def. 8, can be used for general, time-varying constraints".
- Minimum braking distance is the standard way to make the barrier compatible with braking limits. → p.5: "this conflict is addressed by considering the minimum braking distance, which results in another complex safety constraint."
- Sampled implementation holds the QP input constant between steps (no inter-sample guarantee given). → p.2: "is applied at the current time step and held constant for the whole interval."
- Feasibility under input limits is not guaranteed. → p.5: "If this happens, the optimal control problem becomes infeasible."

**Snowball candidates:**
- Lindemann, Dimarogonas — Control barrier functions for signal temporal logic tasks (2018)
- Xiao, Belta, Cassandras — Decentralized merging control in traffic networks: A control barrier function approach (2019)
- Wu, Sreenath — Safety-critical and constrained geometric control synthesis using CLF and CBF for systems evolving on manifolds (2015)
- Glotfelter, Cortés, Egerstedt — Nonsmooth barrier functions with applications to multi-robot systems (2017)

---

### E4 — Exponential Control Barrier Functions for Enforcing High Relative-Degree Safety-Critical Constraints
Q. Nguyen, K. Sreenath; American Control Conference (ACC) 2016, Boston, pp. 322–328 (venue/pages from the lab's bib entry; DOI 10.1109/ACC.2016.7524935 per Crossref); read from the author-hosted copy https://hybrid-robotics.berkeley.edu/publications/ACC2016_Exponential_CBF.pdf (7-page PDF, the paper itself; affiliations printed as Carnegie Mellon). No arXiv version was found by title search. Pages read: 7/7
Status: USE (obtained via author-hosted copy)

**Problem & setting:** Enforcing state constraints B(x) ≥ 0 of arbitrary relative degree r_b for nonlinear control-affine systems inside a CLF-QP.

**Method (key idea, key equations in words, assumptions):**
* "Virtual input–output linearisation" (VIOL): set B^{(r_b)} = μ_b, so η_b = [B, Ḃ, …, B^{(r_b−1)}] obeys a chain of integrators (eqs. 33–35, p.4).
* Pole placement μ_b ≥ −K_b η_b (eq. 36) gives B(x(t)) ≥ C_b e^{A_b t} η_b(x0) ≥ 0 (Def. 1, eq. 20, p.3).
* Recursive outputs y_i = ẏ_{i−1} + p_i y_{i−1} (eq. 41) and sets C_i (eq. 40). Theorem 1 and Prop. 1 (p.4): invariance of C_{r_b} plus x0 ∈ all C_i and p_i > 0 implies invariance of C_0.
* Theorem 2 (p.4): choose K_b so that A_b is Hurwitz and "total negative" (real negative poles), with −λ_i(A_b) ≥ −ẏ_{i−1}(x0)/y_{i−1}(x0).
* Relative degree 1 reduces to a ZCBF with linear α (Remark 3, p.3).
* Relative degree 2 position constraints reduce to the CBF on (d/dt + γ_b)∘g (Remark 7, p.5).
* ECBF-CLF-QP (eq. 42, p.5).

**Experiments & key quantitative results (exact, with page):** Simulation only.
* Serial cart-spring system, relative degree 6: the nominal CLF-QP violates the constraint "with max(x3) = 3.27(m) > x3max = 3.15(m)". The ECBF-CLF-QP with poles p_b = −0.12 × [10 11 12 13 14 15] handles different constraints (p.5).
* Two-link pendulum with elastic actuators, relative degree 4: poles p_b = −[5 5.5 6 10] (p.6).
* Fig. 3 caption (p.6): "varying the safety constraint while keeping the poles fixed keeps the peak forces and speed of system response the same."

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: "The choice of pole location depends on initial conditions as stated in Corollary 2, requiring careful choice of these poles" (p.6).
* Stated: the design "is dependent on the system model and could be sensitive to model uncertainty" (p.6).
* We observe: no input bounds in the guarantee, no sampling, no estimation or delay, and simulation only.

**Relation to DART:**
* Supports DART's optional HOCBF obstacle rows and altitude rows (2·r'a ≤ … + k1·ḣ + k0·h with k1 = p1 + p2, k0 = p1·p2). These are exactly a relative-degree-2 ECBF with real negative poles −p1, −p2.
* E4's Theorem 2 condition on the initial state (x0 must lie in all C_i) is the formal reason the HOCBF can be infeasible or overly conservative right after a large Kalman update. That is our inference.
* Contrast: DART's default braking-distance CBF avoids pole placement by being relative-degree 1 in acceleration.
* Gap: no robustness to estimation error, no latency and no perception.

**Citable statements:**
- ECBF design reduces to linear pole placement. → p.1: "The design is based on the properties of linear control theory and therefore conventional methods such as pole placement control can be used to design ECBF constraints."
- Backstepping-based high-order CBFs were hard to apply beyond relative degree 2. → p.1: "achieving a backstepping based CBF design for higher relative degree systems (greater than 2) is challenging and has not been practically demonstrated."
- Pole choice depends on initial conditions. → p.6: "The choice of pole location depends on initial conditions as stated in Corollary 2, requiring careful choice of these poles."
- Sensitivity to model uncertainty. → p.6: "dependent on the system model and could be sensitive to model uncertainty."

**Snowball candidates:**
- Nguyen, Sreenath — Optimal robust control for constrained nonlinear hybrid systems with application to bipedal locomotion (2016)
- Wu, Sreenath — Safety-critical and constrained geometric control synthesis using CLF and CBF for systems evolving on manifolds (2015)
- Gillula, Hoffmann, Huang, Vitus, Tomlin — Applications of hybrid reachability analysis to robotic aerial vehicles (2011)
- Xu, Tabuada, Grizzle, Ames — Robustness of control barrier functions for safety critical control (2015)

---

### E5 — Safety Barrier Certificates for Collisions-Free Multirobot Systems
L. Wang, A. D. Ames, M. Egerstedt; IEEE Transactions on Robotics 33(3):661–674, 2017; DOI 10.1109/TRO.2017.2659727; pages read: 0
Status: NEED-USER-DOWNLOAD

* There is no arXiv version: title search returns only the related heterogeneous paper E5b.
* The Caltech Authors record (resolver.caltech.edu/CaltechAUTHORS:20170215-165434009) is "metadata-only" with restricted files.
* An author copy is listed at http://ames.caltech.edu/wang2017safety.pdf, but the host is blocked by this sandbox's egress allowlist ("Host not in allowlist"). magnus.ece.gatech.edu is also unreachable (proxy 502). The Wayback Machine was unreachable (429 / connection reset).
* No content notes are written for E5.
* **Note for DART:** the DART method document (`docs/method/DART_method_VI.tex`, line ~336) attributes the braking-distance barrier form to `wang2017` (this T-RO paper). I could NOT verify how the T-RO paper defines it.
* The identical form is verified in E5b below (same authors, arXiv:1609.00651, eq. 8, p.3). Either cite E5b for the exact form or have the user download the T-RO paper and check its definition, for example whether it keeps the shared (α_i + α_j) braking or uses a symmetric variant.

---

### E5b — Safety Barrier Certificates for Heterogeneous Multi-Robot Systems
L. Wang, A. Ames, M. Egerstedt; arXiv:1609.00651v1 [cs.RO], 2 Sep 2016 (published ACC 2016, pp. 5213–5218, DOI 10.1109/ACC.2016.7526486 per Crossref); pages read: 8/8
Status: USE (key source for DART's braking-distance CBF form)

**Problem & setting:**
* Collision avoidance for teams of double-integrator robots (ṗ_i = v_i, v̇_i = u_i, eq. 5, p.2).
* The robots are heterogeneous: different acceleration limits α_i (agile or cumbersome) and different barrier gains γ (aggressive / neutral / conservative).
* A nominal goal-to-goal controller is minimally modified by a QP.
* Neighbours' acceleration limits may be unknown.

**Method (key idea, key equations in words, assumptions):**
* ZCBF with cubic class-K: α(h) = γh³, constraint L_f h + L_g h u + γh³ ≥ 0 (eq. 4, p.2).
* **Braking-distance barrier (exact definition, p.3):**
  * The pairwise requirement is that robots keep distance D_s "in dangerous scenarios while the maximum braking force is being applied". With maximum relative braking acceleration (α_i + α_j), this gives ‖Δp_ij‖ − (Δv̄)²/(2(α_i + α_j)) ≥ D_s (eq. 7).
  * Δv̄ = (Δp_ijᵀ/‖Δp_ij‖) Δv_ij is the normal component of the relative velocity, with Δp_ij = p_i − p_j and Δv_ij = v_i − v_j.
  * The approaching case (Δv̄ < 0) and the separating case (no constraint) are combined into −(Δp_ijᵀ/‖Δp_ij‖) Δv_ij ≤ √(2(α_i + α_j)(‖Δp_ij‖ − D_s)) (eq. 6).
  * The ZCBF candidate is **h_ij = √(2(α_i + α_j)(‖Δp_ij‖ − D_s)) + (Δp_ijᵀ/‖Δp_ij‖) Δv_ij** (eq. 8). The safe set C is the product over pairs (eq. 9).
  * Note that (Δp_ijᵀ Δv_ij)/‖Δp_ij‖ = d‖Δp_ij‖/dt = −(closing speed).
  * The tangential relative velocity is unregulated (p.3).
* The resulting constraint is linear in u (eq. 11, p.3). It includes the centripetal term ‖Δv‖² − (Δvᵀ Δp)²/‖Δp‖² and the term (α_i + α_j) Δvᵀ Δp / √(2(α_i + α_j)(‖Δp‖ − D_s)).
* Centralised QP min Σ‖u_i − û_i‖² subject to A_ij u ≤ b_ij and ‖u_i‖∞ ≤ α_i (eq. 12, p.3).
* Decentralisation strategies A/B/C split the constraint in proportion to α_i/(α_i + α_j) (eqs. 13–15, p.4).
* Lemma 4.1 (p.5): different γ per agent remain safe.
* Lemma 4.3 (p.6): conservative under-estimates of neighbours' α keep safety. An online estimator raises the estimate (p.6).
* A neighbour-disk radius bounds which pairs need constraints (eq. 17, p.5).

**Experiments & key quantitative results (exact, with page):**
* MATLAB simulation of 6 agents: small agile agents "α_s = 1.2 m/s², safety radius is 0.2 m" and a large agent "α_l = 0.6 m/s², safety radius is 0.4 m". Speed limits are 0.6 m/s (p.7, Fig. 5 caption).
* Experiment: three Khepera III robots (α_K = 2.0 m/s², 13 cm diameter) and one Magellan Pro (α_M = 0.5 m/s², 41 cm), tracked by OptiTrack (p.7).
* Unicycle robots were "approximated with double integrated dynamics using Lyapunov based approach" (p.7).
* Results are qualitative: collision-free swaps (Figs. 5–6).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: deadlock, where "safety is guaranteed but desired tasks can not be completed" (p.8).
* Stated: in crowded situations "several safety barrier constraints might conflict with each other, rendering the optimization-based controller infeasible" (p.8).
* We observe:
  * positions and velocities are assumed known exactly at each instant;
  * there is no sensing latency and no sampled-data analysis;
  * h is singular at ‖Δp‖ = D_s (the √ derivative). DART guards this with s_min;
  * the setting is 2-D ground robots.

**Relation to DART:**
* **This is the verified source of DART's default barrier** h = √(2 a_b s) − v_c with s = ‖r‖ − d and v_c = −r̂ᵀ v_r.
* Our derivation, not claimed by E5b: for a non-braking obstacle set α_j = 0 and α_i = a_b, and replace D_s by DART's d(t). Then E5b's eq. 8 becomes exactly DART's h, because (Δpᵀ Δv)/‖Δp‖ = −v_c.
* DART's linear constraint (`dart_cbf_filter.m`) has the same structure as E5b's eq. 11: the centripetal ‖v_⊥‖²/‖r‖ term and the a_b·v_c/√(2 a_b s) term.
* Differences:
  * DART uses linear α (αh) rather than γh³;
  * DART adds −a_b·ḋ/√(2a_b s) for the time-varying inflation d(t), plus the obstacle-acceleration bound ā_o and δ_a;
  * DART applies the barrier to *estimated* relative states, whereas E5b uses true states;
  * DART's UAV carries all braking responsibility; E5b shares it as (α_i + α_j) between agents.
* Supports component 5 directly. It also supports the scheduler's stopping inequality: E5b eq. 7 is the T_open = 0 case of DART's stopping condition.
* Gap:
  * no estimation uncertainty or latency, so no d(t);
  * no link to perception rate. DART's scheduler preserves the same inequality over an open-loop interval.
* Stronger than DART: a multi-agent decentralised guarantee, robustness to unknown neighbour acceleration limits via conservative estimates, and hardware experiments.

**Citable statements:**
- The barrier encodes keeping D_s while maximum braking is applied. → p.3: "ensure that agents will always keep safety distance Ds away from each other in dangerous scenarios while the maximum braking force is being applied"
- Exact barrier form. → p.3, eq. (8): "h_ij = √(2(α_i + α_j)(‖Δp_ij‖ − D_s)) + (Δp_ijᵀ/‖Δp_ij‖) Δv_ij ≥ 0" (rendered from the equation)
- Only the normal (closing) component of relative velocity is constrained. → p.3: "The safety constraint (6) is derived by regulating the normal component of the relative velocity Δv̄, while the tangent component is unregulated."
- No constraint is needed when separating. → p.3: "when they are moving away from each other Δv̄ ≥ 0), no constraint is enforced because safety is not endangered."
- Class-K choice. → p.2: "In this paper, we will choose α(h(x)) = γ h³(x) for defining our ZCBF candidate"
- Conservative parameter estimates preserve safety (an analogue of DART's conservative inflation). → p.6: "It is intuitive to guess that agents are safe if conservative estimates of neigboring agents' acceleration limits are used." (proved as Lemma 4.3)
- Infeasibility in crowded scenes. → p.8: "several safety barrier constraints might conflict with each other, rendering the optimization-based controller infeasible."

**Snowball candidates:**
- Borrmann, Wang, Ames, Egerstedt — Control barrier certificates for safe swarm behavior (2015)
- Wang, Ames, Egerstedt — Safety barrier certificates for collisions-free multirobot systems (T-RO 2017) [= E5, needs download]
- Wang, Ames, Egerstedt — Safe certificate-based maneuvers for teams of quadrotors using differential flatness (2017) [cited in E2; quadrotor relevance]
- Van den Berg, Guy, Lin, Manocha — Reciprocal n-body collision avoidance (2011)
- Tomlin, Pappas, Sastry — Conflict resolution for air traffic management (1998)

---

### E6 — Safety-Critical Model Predictive Control with Discrete-Time Control Barrier Function
J. Zeng, B. Zhang, K. Sreenath; arXiv:2007.11718v3 [eess.SY], 23 Mar 2021 (published ACC 2021, pp. 3882–3889, DOI 10.23919/ACC50511.2021.9483029 per Crossref); pages read: 9/9 (incl. appendix)
Status: USE

**Problem & setting:**
* Problem: MPC with Euclidean distance constraints (MPC-DC) does not react to obstacles until the predicted reachable set touches them, unless the horizon is long.
* Proposal: put discrete-time CBF (DCBF) constraints at every horizon step (MPC-CBF).
* Setting: discrete-time x_{t+1} = f(x_t, u_t).

**Method (key idea, key equations in words, assumptions):**
* DCBF condition Δh(x_k, u_k) ≥ −γh(x_k) with 0 < γ ≤ 1, i.e. h(x_{k+1}) ≥ (1 − γ)h(x_k) (eq. 6, p.3).
* MPC-CBF imposes Δh(x_{t+k|t}, u_{t+k|t}) ≥ −γh(x_{t+k|t}) for k = 0..N−1 (eq. 10f, p.3). The terminal cost acts as a CLF.
* With quadratic or quartic h the problem is an NLP, solved with IPOPT (p.4, p.6).
* Relations:
  * N = 1 is close to DCLF-DCBF (Sec. III-D, p.5);
  * γ → 1 recovers MPC-DC (Sec. III-E, p.5).
* Feasibility is analysed qualitatively as a non-empty intersection of the reachable set R_k with S_cbf,k (p.4).
* Smaller γ is safer but less feasible (Remark 3, p.4).

**Experiments & key quantitative results (exact, with page):**
* 2-D double integrator, Δt = 0.2 s (p.6).
  * Q = 10·I4, R = I2, P = 100·I4; state bounds ±5, input bounds ±1 (p.6).
  * Obstacle at (−2, −2.25) with r = 1.5 m, h = (x − x_obs)² + (y − y_obs)² − r_obs² (eq. 17, p.6).
* Table I (p.7), columns status / N / γ / time mean±std (s) / min dist / cost:

  | Controller | Status | N | γ | Time (s) | Min dist | Cost |
  |---|---|---|---|---|---|---|
  | MPC-CBF | solved | 5 | 0.1 | 0.028±0.012 | 1.483 | 7.620 |
  | MPC-CBF | solved | 5 | 0.2 | 0.028±0.011 | 0.791 | 7.464 |
  | MPC-CBF | solved | 5 | 0.3 | 0.028±0.011 | 0.441 | 8.314 |
  | MPC-CBF | solved | 5 | 0.4 | 0.028±0.011 | 0.288 | 8.292 |
  | MPC-CBF | solved | 5 | 0.5 | 0.028±0.010 | 0.110 | 8.813 |
  | MPC-DC | infeas. | 5 | – | NaN | NaN | NaN |
  | MPC-DC | solved | 7 | – | 0.033±0.013 | 0.000 | 9.102 |
  | MPC-DC | solved | 15 | – | 0.048±0.016 | 0.000 | 8.537 |
  | MPC-DC | solved | 30 | – | 0.062±0.031 | 0.000 | 8.528 |

* "MPC-CBF with N = 5 and γ = 0.25 starts to turn to avoid the obstacle with a similar behavior as MPC-DC with N = 7" (p.7).
* Car racing: "MPC-CBF with a horizon N = 12 updates at 10 Hz. The system dynamics is simulated at 1000 Hz" (p.8). A quartic CBF h = (s − s^i)⁴/(2l1)⁴ + (e_y − e_y^i)⁴/(2l2)⁴ − 1 (eq. 21, p.7). The model is a data-driven linearised model (appendix, p.9).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: "a rigorous proof of nonlinear MPC stability as well as MPC-CBF still remains an open challenge" (p.4).
* Stated: "Recursive feasibility is generally not guaranteed" (p.4).
* Stated: "for a given fixed γ, we generally only have pointwise feasibility and a persistently feasible formulation is still an open problem" (p.5).
* Stated: how to choose γ automatically is open (p.5).
* Stated: the DCBF constraints are "generally non-convex unless the CBFs are linear", so the problem is an NLP (p.4).
* Stated assumptions: a full state measurement or estimate (p.2) and "perfect estimation" of the other cars (p.8).
* We observe:
  * obstacles are known and exact;
  * there is no uncertainty inflation, no delay and no inter-sample analysis between MPC updates;
  * evaluation is in simulation only.

**Relation to DART:**
* Supports DART's MPC component (4). DART's per-step DCBF rows g(p_j) ≥ (1 − γ)·g(p_{j−1}) − s are E6's eq. 10f applied to a tangent half-space g.
* E6 is the natural baseline for "MPC with DCBF obstacle constraints". Its Table I gives the motivating evidence that DCBF rows act earlier than distance constraints for a given short horizon. This supports DART's adaptive (shorter) horizon with DCBF rows.
* Contrast: E6 keeps a non-convex h and solves an NLP. DART linearises obstacles to tangent half-spaces, keeping the same plane for p_j and p_{j−1}, to get a QP. E6 itself notes that the problem is convex only if the CBF is linear.
* Gap:
  * no estimation uncertainty (DART inflates radii by covariance and resets expected covariance at expected measurement times);
  * no perception latency or rate;
  * no recursive feasibility (DART adds a stopping terminal set; its effect should be evaluated in DART, not taken from E6).
* Stronger than DART: E6 retains the exact (non-convexified) constraint geometry.

**Citable statements:**
- Distance-constrained MPC reacts late. → p.1: "the robot will not take actions to avoid the obstacles until it is close to them."
- DCBF condition and decay rate. → p.3: "h(x_{k+1}) ≥ (1 − γ)h(x_k), i.e., the lower bound of control barrier function h(x) decreases exponentially with the rate 1 − γ."
- DCBF-MPC is an NLP unless the CBF is linear (motivates DART's half-space linearisation). → p.4: "The discrete-time control barrier functions constraints in (10f) are generally non-convex unless the CBFs are linear."
- Persistent feasibility is open. → p.5: "a persistently feasible formulation is still an open problem and is part of future work."
- Long horizons alone do not produce early avoidance. → p.7: "even with an extremely large horizon N, e.g. N = 30, the system only has noticeable obstacle avoidance behavior when it is close to obstacles."
- Assumes perfect state/obstacle knowledge. → p.2: "Assume that a full measurement or estimate of the state xt is available at the current time step t." and p.8: "we assume that we have perfect estimation about (st, eyt) and (sit, eiyt)."

**Snowball candidates:**
- Agrawal, Sreenath — Discrete control barrier functions for safety-critical control of discrete systems with application to bipedal robot navigation (2017)
- Son, Nguyen — Safety-critical control for non-affine nonlinear systems with application on autonomous vehicle (2019)
- Rosolia, Singletary, Ames — Unified multi-rate control: from low level actuation to high level planning (arXiv 2012.06558, 2020)
- Grandia, Taylor, Singletary, Hutter, Ames — Nonlinear model predictive control of robotic systems with control Lyapunov functions (2020)
- Zhang, Liniger, Borrelli — Optimization-based collision avoidance (2020)
- Wills, Heath — Barrier function based model predictive control (2004)

---

### E7 — Multi-Rate Control Design Leveraging Control Barrier Functions and Model Predictive Control Policies
Ugo Rosolia, Aaron D. Ames (as printed); arXiv:2004.01761v4 [eess.SY], 6 Jul 2020 (published IEEE Control Systems Letters 5(3):1007–1012, DOI 10.1109/LCSYS.2020.3008326 per Crossref); pages read: 6/6
Status: USE — **author correction:** the task listed "U. Rosolia, A. Singletary, A. D. Ames". The paper at arXiv:2004.01761 (title matches) lists only Rosolia and Ames. Singletary is a co-author of the follow-up "Unified multi-rate control: from low level actuation to high level planning" (arXiv:2012.06558, cited as ref. [7] in E6), which was not read.

**Problem & setting:**
* A hierarchical multi-rate architecture: a low-rate high-level MPC planner on a simplified linear model, plus a high-rate low-level CLF–CBF QP on the full nonlinear control-affine model.
* The system is modelled as piecewise-continuous with resets at the planner updates t_k (eqs. 1–5, pp.1–2).

**Method (key idea, key equations in words, assumptions):**
* Four properties: low-level safety, low-level tracking, high-level safety, high-level tracking (Properties 1–4, p.2).
* Theorem 1 (p.3): if all four hold, state and input constraints are satisfied for all t (proof by induction over planner intervals).
* The low level is a CLF–CBF QP (eq. 18, p.3) with two CBFs:
  * h_x keeps x in the safe set S_x;
  * h_e keeps the tracking error e = x − x̄ in S_e;
  * a CLF on ‖x − x̄‖ reduces the tracking error.
* The planner resets x̄⁺ = x⁺, so e⁺ = 0 at each t_k (eq. 20, p.4). This gives a discrete-time uncertain linear model with disturbance in Δ(S̄_e) (eqs. 21–23).
* The high level is a robust tube MPC with tightened constraints X_d ∩ S_x ⊖ E_k (eq. 25, p.4).
* Key assumptions:
  * Assumption 2: the QP is feasible for all z in I (p.4);
  * Assumption 3: a robust positive invariant terminal set;
  * the reset map is affine (Assumption 1).

**Experiments & key quantitative results (exact, with page):** Segway simulation (p.5).
* Planner: Q = diag(0, 10⁻³, 10⁻³, 10⁻²), R = 1, |v| ≤ 20. S_e = {eᵀQ_e e ≤ 1} with Q_e = diag(1/0.2², 1/0.1², 1/0.05², 1/0.01²).
* Unconstrained case: the high-level MPC runs at 2 Hz with N = 10. It "performs similarly to the high frequency nonlinear MPC (discretized at 100Hz with prediction horizon N100Hz = 500), while being implemented with a 2Hz model update rate" (p.5). The linear MPC overshoots and the 20 Hz NMPC oscillates (p.5).
* Fig. 4 (p.6): "the high level input is updated at 2Hz, whereas the low level input is updated at 1000Hz."
* Constrained case: |θ| ≤ 0.78 with the MPC at 10 Hz. Without the low-level controller, "the constraint tightening from (25) is not sufficient to guarantee constraint satisfaction" (p.6).
* Compute: "the computational cost associated with the proposed strategy is ∼ 0.1s. Whereas, the computational cost associated with linear MPCs discretized at 10Hz, 20Hz and 100Hz is ∼ 0.1s, ∼ 0.25s and ∼ 1s, respectively" (p.6).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: "guarantees from Theorem 1 hold when the control action u(t) is updated continuously. However, in practice the control action is updated at a high frequency, for instance at 1kHz in our simulations" (p.3).
* Stated: the set I needed for QP feasibility "may be hard to compute" (p.4).
* We observe:
  * full, exact state at each planner reset (x̄⁺ = x⁺);
  * no perception, sensing latency or estimation;
  * high-level and low-level rates are fixed, not adapted;
  * single simulation example.

**Relation to DART:**
* The closest structural analogue in this group to DART's control stack. DART has a low-rate MPC (20 Hz QP) whose first command is held and filtered by a high-rate CBF layer (100 Hz). E7 gives a formal argument for such multi-rate MPC + CBF architectures.
* Supports components 4–5 (architecture).
* Gap — the key one for DART's novelty:
  * E7's rates are fixed design choices and the planner resets to the *true* state;
  * there is no third, slower and variable-rate perception layer with latency;
  * there is no mechanism deciding *when* the next state/obstacle information must arrive.
  * DART adds a perception layer whose rate is scheduled from the same safety certificate (braking-distance inequality plus covariance growth).
* Stronger than DART: formal recursive-feasibility/constraint-satisfaction proof (under strong assumptions) and a tube-MPC treatment of planner–tracker mismatch.

**Citable statements:**
- Prior hierarchies update both levels at the same rate. E7 lets the planner run slower. → p.1: "In the aforementioned papers, the low level and high level control actions are updated at the same frequency."
- Guarantees assume continuous low-level updates. → p.3: "guarantees from Theorem 1 hold when the control action u(t) is updated continuously."
- The planner is reset to the true state each update (full state knowledge). → p.4: "the above reset maps set the planning state x̄ equal to the true state x, and consequently the error state e = 0 after each kth discontinuous transition."
- A low-rate planner plus high-rate CBF matches a high-rate NMPC at lower cost. → p.5: "performs similarly to the high frequency nonlinear MPC (discretized at 100Hz with prediction horizon N100Hz = 500), while being implemented with a 2Hz model update rate"
- The high-rate safety layer is needed: tightening alone fails. → p.6: "when the low level controller is not used, the constraint tightening from (25) is not sufficient to guarantee constraint satisfaction"

**Snowball candidates:**
- Rosolia, Singletary, Ames — Unified multi-rate control: from low level actuation to high level planning (2020)
- Herbert et al. — FaSTrack: A modular framework for fast and guaranteed safe motion planning (2017)
- Wabersich, Zeilinger — Linear model predictive safety certification for learning-based control (2018)
- Singh, Chen, Herbert, Tomlin, Pavone — Robust tracking with model mismatch for fast and safe planning: an SOS optimization approach (2018)
- Köhler, Soloperto, Müller, Allgöwer — A computationally efficient robust model predictive control framework for uncertain nonlinear systems (2020)
- Gurriet et al. — Towards a framework for realizable safety critical control through active set invariance (2018)

---

### I1 — Control of Complex Maneuvers for a Quadrotor UAV using Geometric Methods on SE(3)
T. Lee, M. Leok, N. H. McClamroch; arXiv:1003.2005v4 [math.OC], 9 Sep 2011 (no venue printed; Crossref lists a related CDC 2010 paper with a *different* title, "Geometric tracking control of a quadrotor UAV on SE(3)", DOI 10.1109/CDC.2010.5717652 — not read); pages read: 12/12 (incl. appendices with proofs)
Status: USE (implementation reference for DART's inner attitude loop; not related to DART's novelty)

**Problem & setting:** Almost-global tracking control of a quadrotor on SE(3) without Euler angles or quaternions. Three flight modes (attitude, position, velocity tracking) can be concatenated into aggressive manoeuvres.

**Method (key idea, key equations in words, assumptions):**
* Model (p.3), z-down convention:
  * ẋ = v (eq. 2);
  * m v̇ = m g e3 − f R e3 (eq. 3);
  * Ṙ = R Ω̂ (eq. 4);
  * J Ω̇ + Ω × JΩ = M (eq. 5).
* Thrust of each propeller is assumed directly controlled (p.2).
* Attitude errors (p.3):
  * Ψ = ½ tr(I − R_dᵀR) (eq. 6);
  * e_R = ½(R_dᵀR − RᵀR_d)^∨ (eq. 8);
  * e_Ω = Ω − RᵀR_d Ω_d (eq. 9).
* Attitude controller (eq. 11, p.4): M = −k_R e_R − k_Ω e_Ω + Ω × JΩ − J(Ω̂RᵀR_dΩ_d − RᵀR_dΩ̇_d). Prop. 1: exponential stability for Ψ(0) < 2 with the e_Ω bound in eq. 13.
* Position mode:
  * f = (k_x e_x + k_v e_v + m g e3 − m ẍ_d)·R e3 (eq. 19);
  * M as eq. 11 with R_c, Ω_c (eq. 20);
  * R_c = [b1c; b3c × b1c; b3c] (eq. 22);
  * b3c = −(−k_x e_x − k_v e_v − m g e3 + m ẍ_d)/‖·‖ (eq. 23, p.5);
  * b1c is the normalised projection of a desired heading b1d onto the plane normal to b3c (eq. 38, p.6).
* Prop. 3 (p.5): exponential stability if Ψ(R(0), R_c(0)) < 1, i.e. less than 90°. Prop. 4: almost-global exponential attractiveness for Ψ < 2. Both assume a non-zero desired force (eq. 24) and bounded commanded acceleration (eq. 25).

**Experiments & key quantitative results (exact, with page):**
* Parameters (p.7): "J = [0.0820, 0.0845, 0.1377] kg − m², m = 4.34 kg", "d = 0.315 m, c_τf = 8.004 × 10^−3 m"; gains "k_x = 16m, k_v = 5.6m, k_R = 8.81, k_Ω = 2.54".
* Case I, recovery from upside down: initial attitude error "178°", Ψ(0) = 1.995; Ψ "becomes less than 1 at t = 0.88 seconds" (p.7).
* Case II: a five-mode sequence including 720° and 360° flips (pp.7–8).
* Simulation only.

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated: "topological obstructions prevent one from constructing a smooth controller on SO(3) that has an equilibrium solution that is global asymptotically stable" (p.4). Hence the results are "almost global".
* Stated: exponential stability requires an initial attitude error below 90° (p.5, p.8).
* We observe:
  * no actuator saturation;
  * no rotor dynamics in the analysis (an extension is mentioned, p.2);
  * no disturbances;
  * simulation only.

**Relation to DART (equation mapping from `src/plant/dart_attitude_controller.m`):**
* DART uses a z-up convention: F_d = m(a_des + g e3), b3 = F_d/‖F_d‖, f = F_dᵀ R e3. This is the analogue of I1 eqs. 19 and 23 with the sign convention flipped. The MPC/CBF acceleration command a_des replaces I1's PD position terms −(k_x e_x + k_v e_v)/m + ẍ_d.
* DART's e_R = ½(R_dᵀR − RᵀR_d)^∨ is I1 eq. 8 / eq. 21.
* DART's e_Ω = Ω, i.e. I1 eq. 9 with Ω_d = 0 (quasi-static).
* DART's τ = −k_R e_R − k_Ω e_Ω + Ω × JΩ is I1 eq. 11 / eq. 20 *without* the feed-forward term −J(Ω̂RᵀR_cΩ_c − RᵀR_cΩ̇_c). DART also uses per-axis gains.
* DART builds b1 from yaw via b2 = b3 × b1c (normalised) and b1 = b2 × b3. This gives the same projection of the heading onto the plane normal to b3 as I1 eq. 38.
* DART adds a tilt limit, a minimum vertical force, a thrust cap and drag compensation. None of these are in I1, and they fall outside I1's assumptions. I1's Props. 3–4 therefore do **not** directly certify DART's inner loop: it uses Ω_d = 0 and saturations. DART should cite I1 as "Lee-style geometric attitude control (simplified)" and not claim I1's guarantees.
* Not related to DART's novelty (perception–control co-design).

**Citable statements:**
- The geometric controller avoids Euler/quaternion singularities and ambiguities. → p.2: "It is coordinate-free. Therefore, it completely avoids singularities, complexities, discontinuities, or ambiguities that arise when using local coordinates or quaternions."
- Attitude error definition. → p.3, eq. (8): "e_R = ½(R_dᵀR − RᵀR_d)^∨."
- Stability region. → p.8: "the quadrotor exhibits exponential stability when the initial attitude error is less than 90°, and it yields almost global exponentially attractiveness when the initial attitude error is less than 180°."

**Snowball candidates:**
- Lee, Leok, McClamroch — Geometric tracking control of a quadrotor UAV on SE(3) (CDC 2010) [related conference paper]
- Mayhew, Sanfelice, Teel — Robust global asymptotic attitude stabilization of a rigid body by quaternion-based hybrid feedback (2009)
- Bhat, Bernstein — A topological obstruction to continuous global stabilization of rotational motion and the unwinding phenomenon (2000)
- Pounds, Mahony, Corke — Modeling and control of a large quadrotor robot (2010)
- Gillula et al. — Applications of hybrid reachability analysis to robotic aerial vehicles (2011)

---

## Group synthesis

- **CBF foundations are settled and directly support DART's safety filter.**
  - The zeroing-CBF condition ḣ ≥ −α(h) is necessary and sufficient for forward invariance of compact safe sets (E1 pp.5–6; E2 p.2, p.4).
  - It yields a QP that minimally modifies a nominal command, with safety as a hard constraint (E1 p.2; E2 p.4, p.9 "ASIF").
  - DART's CBF-QP on the MPC acceleration command is a standard instance of this.
- **Braking-based barriers are the established way to respect input limits.**
  - E1 (ACC appendix p.15; LK eq. 53 p.12), E2 (h_lk p.9; evading-maneuver construction eq. 12 p.5) and E3 (p.5) all use maximal-braking reasoning.
  - E5b gives the exact √ form h = √(2(α_i + α_j)(‖Δp‖ − D_s)) + Δpᵀ Δv/‖Δp‖ (eq. 8, p.3). This reduces to DART's h = √(2a_b s) − v_c for a non-braking obstacle.
  - The T-RO version (E5), which DART currently cites, could not be obtained.
- **High-relative-degree tools cover DART's optional HOCBF and altitude rows.**
  - ECBF (E4) and HOCBF (E3) give the linear-pole form with k1 = p1 + p2 and k0 = p1·p2.
  - E3's time-varying b(x,t) formally admits DART's time-varying inflation d(t).
  - Both note feasibility issues: E4's pole conditions depend on initial conditions (E4 p.6), and HOCBF rows can conflict with input limits (E3 p.5).
- **CBF inside MPC (E6):**
  - DCBF rows h(x_{k+1}) ≥ (1 − γ)h(x_k) make a short-horizon MPC avoid obstacles earlier than distance constraints (Table I, p.7).
  - The problem is an NLP unless the barrier is linear (p.4).
  - Recursive feasibility is open (pp.4–5).
  - DART's tangent-half-space DCBF rows inside a QP are a convexified variant of this.
- **Multi-rate MPC + CBF (E7):** a formal argument exists for a low-rate planner plus a high-rate CBF tracker (Theorem 1, p.3). It assumes continuous low-level updates (Remark 1, p.3), QP feasibility (Assumption 2, p.4) and planner resets to the *true* state (p.4).
- **Every paper read in this group assumes exact, current state information at control time.** Evidence:
  - E1: "no reaction delays" (p.15);
  - E6: full measurement or estimate (p.2) and "perfect estimation" (p.8);
  - E7: x̄⁺ = x⁺ (p.4);
  - E5b: true relative states.
  - Robustness is argued only via attractivity of C (E1 p.5; E2 p.4) or via conservative parameter estimates (E5b Lemma 4.3, p.6).
- **Sampled-data issues are acknowledged but not analysed.** E3 holds the QP input constant over Δt (p.2), and E7 notes its guarantees need continuous updates (p.3). No paper analyses the effect of measurement latency.
- **Open gap DART can fill (as far as this group shows):**
  - None of these papers decides *when to perceive*. None couples the sensing/perception rate or latency to the barrier certificate.
  - None inflates the barrier with estimate-covariance growth between measurements.
  - DART's contribution is to use one physical certificate (the braking-distance inequality of E5b/E1-type barriers) in two ways: enforced at the control rate by the CBF, and preserved over a latency-plus-open-loop interval by the perception scheduler.
  - DART should also be honest about what it does not inherit:
    - the E1/E2 guarantees are continuous-time with exact state;
    - E7's multi-rate proof assumes true-state resets;
    - I1's stability results do not cover DART's simplified, saturated inner loop.
