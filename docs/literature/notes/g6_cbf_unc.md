# Notes — Group g6: CBFs under estimation uncertainty / uncertain obstacles; delayed-measurement estimation

PAPERS_DIR = /tmp/claude-0/-home-user-project1/e49c6cfe-c60c-5087-910d-afbdd70f407b/scratchpad/papers/g6_cbf_unc
Page numbers below are PDF page numbers (form-feed mapped from `pdftotext -layout`).
ID verification (export.arxiv.org API, 2026-10-06): all six given ids G1–G6 resolve to the expected paper.
G2 and G3 have longer printed titles than in the task list (noted in their entries); no id corrections needed.

---

### G1 — Safe Navigation under Uncertain Obstacle Dynamics using Control Barrier Functions and Constrained Convex Generators
Hugo Matias, Daniel Silvestre (NOVA-FCT / ISR-Lisbon); arXiv:2601.07715v2 [eess.SY], 4 Oct 2026 (v1 posted 12 Jan 2026); journal-style preprint (IEEE format); pages read: 16/16 (whole text incl. references and bios)
Status: USE (ID verified, no correction)

**Problem & setting:** A rigid-body agent (first-order control-affine ṗ = f(p)+G(p)z, or second-order strict-feedback) must avoid M obstacles whose motion follows *uncertain linear dynamics* ẋi = Fi xi + wi, with wi in a known compact convex set. Measurements yi,k = Ci xi,k + vi,k arrive at fixed sampling instants tk = kTs with bounded noise (p.4: "At each sampling instant tk = kTs , for k ∈ N and sampling period Ts ∈ R>0 , the agent obtains a measurement yi,k"). Goal: never collide (eq. 20, p.4). Deterministic set-membership setting, not stochastic.

**Method (key idea, key equations in words, assumptions):**
- Guaranteed (set-valued) estimation of each obstacle state with Constrained Convex Generators (CCGs; affine image of a product of convex sublevel sets subject to linear equalities, Def. 6, p.8). A finite-horizon explicit estimator (Thm 1, pp.8–9) keeps a fixed-size representation (horizon N, precomputable matrices, Alg. 2–3).
- Between samples, the obstacle estimate is propagated open-loop as a reachable set: Ô⁺i,k(t) = Ei[Φi(t−tk)X̂i,k ⊕ Γi(t−tk)W̃i] ⊕ Ō⁺i (eq. 25, p.5) — i.e. the obstacle set *grows with time since the last measurement*; Γ is the integral of Φ or an exponential over-bound (eqs. 27–28) when the input is not constant over the interval.
- Agent body handled by Minkowski-sum enlargement of the obstacles (eq. 23, p.5).
- CCG→CBF conversion: h(p,t) = min_η f(η) s.t. G̃(t)η + c̃(t) = p (eq. 92, p.11), where f is a LogSumExp smooth under-approximation of the max of generator functions (eq. 88, p.10). Theorem 2 (p.11): if f is C² and strictly convex and G̃(t) has full row rank, h is a (time-varying) CBF; proof via KKT system + Implicit Function Theorem. h is convex in p.
- Obstacle CBFs merged with LogSumExp smooth-min (eq. 33, p.5) with a tolerance bound (eq. 34); QP safety filter (eq. 44, p.6). Second-order agents via CBF backstepping (Prop. 2, eq. 47; eq. 53, p.7) with a smooth Gaussian-weighted-centroid controller (eqs. 55–56, p.7).
- Practical implementation: first-order Taylor approximation of h around the agent position at each sample (eq. 106, p.12), which is not safety-preserving in t, so a "robustified" half-space CBF hr is built from a bound on obstacle velocity along the linearization direction (eqs. 109–113, p.12).
- Assumptions: obstacle dynamics linear and known up to a bounded input; noise bounded; no sensing latency (measurement taken and used at tk); continuous application of the filter within each interval (sample-and-hold not treated, p.12); agent does not rotate (Remark 3, p.4); input bounds not handled (Remark 7, p.7).

**Experiments & key quantitative results (exact, with page):** Three 2-D simulations only (MATLAB), no Monte Carlo, no baselines.
- Ex.1 (static known obstacles, ellipsoidal/polytopic agent): "Ts = 0.1 s", "εβ = εγ = 0.1 and α(s) = ᾱs ... with ᾱ = 10"; "average computation time of 3 ms per obstacle per sampling step" (p.13). Collision-free "confirmed by the nonnegativity of the overall CBF values over time" (p.13).
- Ex.2 (two obstacles with uncertain constant velocity, single-integrator agent): "Gw = 0.5I and Gv = 0.2I", horizon "N = 5"; optimization "takes an average of 5 ms per obstacle per sampling step" (p.14). Estimates are looser during the first N steps (p.14).
- Ex.3 (second-order agent, obstacles with random acceleration): "ς = 0.1, σ̄ = 10", "ᾱ1 = 10", N = 5; "an average of 8 ms per obstacle per sampling step" (p.14).

**Limitations (stated by authors, with page) / limitations we observe:**
- Input bounds not handled; recursive feasibility "left for future work" (Remark 7, p.7).
- First-order (linearized) CBF "may not formally preserve safety" in t, requiring the robustified version (p.12).
- Sample-and-hold implementation not covered: "the additional discrepancy would need to be further robustified, as in [74]" (p.12).
- With the finite-horizon estimator, the global safety guarantee across sample boundaries can break (Remark 12, p.12).
- Nonlinear obstacle dynamics only sketched (Remark 9, p.9; future work p.14).
- Observed: fixed sampling period, measurements assumed instantaneous (no latency / out-of-sequence handling); no perception model (positions measured directly with bounded noise); 2-D toy examples only; no quantitative evaluation of conservatism vs. sampling period; no notion of choosing when to sense.

**Relation to DART:** Supports DART component 5 (time-varying inflation of the obstacle by uncertainty growth between measurements) and component 2 (estimation feeding the CBF), but in a *set-membership* (worst-case reachable-set) rather than Kalman-covariance form. The propagated flow Ô⁺(t) over [tk, tk+1) is the deterministic analogue of DART's d(t) from covariance growth, and Remark 12 is exactly the issue DART faces at the measurement reset (the new estimate must not contain the agent). Gap: fixed Ts, no inference latency (pose-at-capture / delayed update), no perception-rate decision or "safe open-loop time", no learned-depth error model, no MPC, no UAV/6-DOF evaluation. Where stronger than DART: hard (non-probabilistic) guarantees under bounded noise, arbitrary convex obstacle/agent shapes (CCGs) rather than spheres, formal CBF validity proof for the time-varying set.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Between samples, the guaranteed obstacle set is propagated forward through the dynamics, i.e. it grows with time since the last measurement -> p.1: "a CCG estimate of each obstacle is obtained using a finite-horizon guaranteed estimation scheme and propagated over the sampling interval to obtain a CCG-valued flow"
- Set-valued estimation is positioned as a non-probabilistic alternative to CVaR/stochastic approaches -> p.1: "Instead of relying on probabilistic assumptions, such as in Conditional Value-at-Risk (CVaR) approaches [4], set-valued estimation algorithms compute sets that are guaranteed to contain the true state"
- Authors claim novelty of combining CBFs with CCG/CZ guaranteed estimation -> p.2: "no existing work addresses the problem of integrating CBF-based control with guaranteed state estimation based on CCGs or related set representations such as CZs."
- MPC with set-valued obstacle constraints is non-convex/expensive (motivation for a CBF filter) -> p.2: "this approach leads to an MPC formulation with nonconvex constraints, an issue that becomes even more severe when the agent dynamics are nonlinear [29]."
- Safety across intervals requires that the agent lies inside the new safe set at each sample time -> p.6: "Global safety for all t ∈ R≥0 is then ensured if, at every sampling time tk , it holds that pk ∈ int(∩i∈I Ci,k (tk ))."
- Measurement updates must not produce an obstacle estimate that contains the agent -> p.12: "this discussion highlights the importance for obstacle estimates to never contain the agent position to preserve theoretical guarantees of global safety."
- Sample-and-hold control would need extra robustification -> p.12: "For a sample-and-hold implementation, however, the additional discrepancy would need to be further robustified, as in [74]."
- Per-obstacle computation cost is a few ms in MATLAB -> p.13: "with an average computation time of 3 ms per obstacle per sampling step."

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Safe navigation in uncertain crowded environments using risk adaptive CVaR barrier functions (2025) [4]
- Control barrier functions in sampled-data systems (2021) [74]
- Model predictive control with collision avoidance for unknown environment (2023) [30]
- Nonlinear MPC for collision avoidance and control of UAVs with dynamic obstacles (2020) [29]
- Composing control barrier functions for complex safety specifications (2023) [61]
- Explicit computation of guaranteed state estimates using constrained convex generators (2024) [28]

---
### G2 — Probabilistic Control Barrier Functions for Systems with State Estimation Uncertainty using Sub-Gaussian Concentration
Kazuya Echigo, David E. J. van Wijk, Pol Mestres, Ersin Daş, Joel W. Burdick, Aaron D. Ames (Caltech / JPL / Illinois Tech); arXiv:2604.08831v1 [eess.SY], 10 Apr 2026; 6-page conference-style preprint; pages read: 6/6
Status: USE (narrow; ID verified — printed title is longer than the task list's "Probabilistic Control Barrier Functions for Systems with State Estimation Uncertainty"; same paper)

**Problem & setting:** Discrete-time control-affine system x_{t+1} = f(x_t) + g(x_t)u_t + d_t (eq. 1, p.2) where the true state is unknown and only an estimate with covariance is available (e.g., from an EKF), plus Gaussian process disturbance. Goal: single-step probabilistic CBF condition P(h(x_{t+1}) ≤ γh(x_t)) ≥ 1−α (eq. 2, p.2; note h ≤ 0 is the safe set in this paper) enforced in a tractable QP. Assumption 1 (p.2): "The true state xt ∼ N (µxt , Σxt ) and disturbance dt ∼ N (µdt , Σdt ) are independent Gaussian random vectors with known moments."

**Method (key idea, key equations in words, assumptions):**
- Replace chance constraint by CVaR_α(Δh) ≤ 0 (eq. 5, p.2), estimate CVaR from n particles drawn from the estimator's Gaussian belief and the disturbance, propagated one step through the dynamics (eqs. 6–7, p.3).
- Theorem 1 (p.3): the barrier increment Δh is sub-Gaussian with parameter σ_Δh ≤ C sqrt(L²_{Φ,x} λmax(Σx) + L²_{Φ,d} λmax(Σd)) under Lipschitz f, g, h.
- Theorem 2 (pp.3–4): finite-sample, high-probability (1−δ) upper bound on CVaR from order statistics plus a DKW correction ε_n(δ) = sqrt(ln(2/δ)/(2n)) and a sub-Gaussian tail term C_tail; no bounded-support truncation needed. Remark 1: tail term decays as O((n ln n)^{-1/2}).
- Corollary 2 + eqs. (9)–(12) (pp.4–5): LP/QP reformulation (Rockafellar–Uryasev) so the probabilistic CBF filter is a QP when Δh is linear in u (Problem 1, eq. 13, p.5).
- Remark 3 (p.4): with α ≤ ε/H, finite-horizon safety probability ≥ q0 − ε with particle-confidence ≥ 1 − Hδ (eq. 8).
- Assumptions: Gaussian state belief with known covariance, Lipschitz and convex h (Assumption 2), state-independent disturbance; no measurement delay; estimator covariance taken as given.

**Experiments & key quantitative results (exact, with page):** Monte Carlo on a 2-D non-holonomic (Ackermann-derived) robot with a linear geofence h(x) = r_y, EKF with partial measurements of r_y and θ (p.5). "We perform a Monte Carlo analysis with 10, 000 trials" (p.5). Constants (footnote 6, p.5): "n = 500, η = 40◦ , α = 0.1, δ = 0.1, γ = 0.2, ∆t = 0.5 s", vm = 0.3 m/s. Table I (p.6): Deterministic CBF — Violation Rate "100%", Reached "86%"; Probabilistic CBF (DKW) — "0%", "56%"; Proposed (Sub-Gaussian) — "2.0%", "100%". Text p.5: "the 2.0% violation stays within the α = 0.1 bound (10%)". Fig. 2 (p.6): DKW "consistently overestimates the true risk".

**Limitations (stated by authors, with page) / limitations we observe:**
- p.6: "A current limitation is the double probability structure— the CVaR bound holds with probability 1−δ while the safety constraint holds with probability 1 − α".
- Remark 2 (p.4): Theorem 2 assumes i.i.d. samples, which "may be violated when the same particles are used for both optimization and evaluation".
- Observed: single toy example (one linear geofence, 2-D, Δt = 0.5 s); no obstacles, no perception, no latency; only one-step condition, so does not reason about uncertainty growth over a period without measurements; 500 particles per step may be heavy for a UAV MPC loop (no timing reported).

**Relation to DART:** Contrasting/alternative approach to DART component 5 (how to turn estimator covariance into a CBF safety margin). DART inflates the obstacle radius by a covariance-derived margin (deterministic tightening); this paper instead enforces a CVaR-based chance constraint with particles drawn from the EKF belief, with finite-sample guarantees. Useful to cite as the "principled probabilistic CBF under state-estimation uncertainty" line and as evidence that (i) ignoring estimation uncertainty in a CBF leads to violations and (ii) naive bounding (DKW) is over-conservative. Gap: no time-varying uncertainty growth between sparse measurements, no delay, no sensing-rate decision, no obstacles estimated by perception. Stronger than DART: explicit probability-of-safety certificate with finite-sample bounds.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- With unbounded (e.g., Gaussian estimator) noise, deterministic CBF guarantees fail -> p.1: "such deterministic guarantees fail: the system will almost surely violate the safety constraints in finite time [4]."
- CBFs have seldom treated model + state-estimation uncertainty jointly -> p.1: "conventional CBFs have rarely been applied to systems subject to both model and state estimation uncertainty"
- EKF-specialised stochastic CBFs use only first-moment information and can be conservative -> p.1: "those approaches only leverage the first moment of the uncertainty distribution and can be conservative when more distributional information is available."
- The covariance can come from an EKF -> p.2: "The state estimate µxt and uncertainty covariance Σxt may come from an estimator such as an Extended Kalman Filter (EKF)."
- Ignoring uncertainty vs. over-conservative bounding trade-off, quantified -> p.6 Table I: Deterministic CBF "100%" violation, DKW "0%" violation but "56%" reached, proposed "2.0%" / "100%".

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Probabilistic control barrier functions: Safety in probability for discrete-time stochastic systems (2025) [6]
- Robust safety under stochastic uncertainty with discrete-time control barrier functions (2023) [4]
- Belief control barrier functions for risk-aware control (2023) [17]
- Risk-aware control of discrete-time stochastic systems: Integrating Kalman filter and worst-case CVaR in control barrier functions (2024) [18]
- Risk-aware control for robots with non-Gaussian belief spaces (2024) [19]
- Control barrier functions for complete and incomplete information stochastic systems (2019) [5]

---
### G3 — Stochastic Control Barrier Functions under State Estimation: From Euclidean Space to Lie Groups
Ruoyu Lin, Magnus Egerstedt (UC Irvine); arXiv:2601.16198v2 [eess.SY], 23 Jan 2026 (v1 22 Jan 2026); journal-style preprint; pages read: 13/13
Status: USE (ID verified — printed title has the extra subtitle "From Euclidean Space to Lie Groups"; same paper)

**Problem & setting:** Discrete-time stochastic system on a manifold, x_{k+1} = F(x_k, u_k, ε_k), z_k = H(x_k, ϵ_k), Gaussian process and measurement noise (eq. 2, p.4); safety is required for the *true* state but the controller only has the filter's posterior. Because noise has unbounded support, forward invariance is impossible and finite-time exit probability P_exit(T, x0) (eq. 4, p.4) is studied.

**Method (key idea, key equations in words, assumptions):**
- SEA-SCBF (Def. III.2, p.5): require E[h(x_{k+1})|F_k] − β_k sqrt(Var[h(x_{k+1})|F_k]) ≥ α·E[h(x_k)|F_k], i.e. the predicted mean barrier value minus a (state-dependent) multiple of the predicted barrier std must exceed a decay of the current posterior barrier mean. Online control: QP (26), p.7.
- Theorem III.1 (p.6): offline-computable bound on finite-time exit probability, sum of a martingale (Doob) term for the posterior barrier innovation Δ_{k+1} and a sub-Gaussian term for the estimation error δ_k; trades off with threshold η chosen by line search (eq. 25, p.7). Assumes Δ and δ conditionally sub-Gaussian.
- Linear system + affine CBF h(p) = cᵀp − b with Kalman filter (Sec. IV-A, pp.7–8): constraint becomes cᵀB u_k ≥ m(µ_k) + ρ(Σ_k, Σ_ε), with ρ = β_k sqrt(cᵀ(AΣ_kAᵀ + Σ_ε)c) (eqs. 29–31, p.8) — a covariance-dependent margin along the half-space normal; QP. Proxies have closed forms via Riccati recursion (eqs. 32–33, p.8). β_k = β exp(−7Ỹ_k) makes the margin grow when the estimated barrier value is small (p.8).
- Extends expectation-based DTCBF (SEA-ED, eq. 36) and probabilistic CBF (SEA-PCBF, eq. 40, using ϕ^{-1}(δ) · std) to the estimation setting as baselines (pp.8–9).
- Lie-group version (Sec. V): invariant-EKF-style prediction/update on SE(3), second-order Taylor expansion with "curvature correction" trace terms (eqs. 45–47, p.11); applied to SE(2) robot and SE(3) rigid body through a slit.
- Assumptions: measurement every step, no delay; known obstacle geometry (except an "inaccurate facet" test); Gaussian noise; filter assumed consistent.

**Experiments & key quantitative results (exact, with page):**
- Linear 2-D validation (500 MC): theoretical bound on P_exit "is always higher than the T -step exit frequency per (4), which verifies Theorem III.1" (p.8); higher noise → higher exit probability (p.8).
- Motion planning in a corridor with 11 dodecahedron obstacles + 4 walls (136 affine CBFs composed with min), p_k ∈ R³, "εk ∼ N (0, 0.06² I), ϵk ∼ N (0, 0.2² I), α = 0.9, T = 240" (p.9). Table I (p.9, 500 MC trials): Accurate env — Safety Rate (%) SEA-SCBF "99.0", SEA-ED "69.0", SEA-PCBF "95.8"; Goal Reach (%) "100.0", "100.0", "12.6". Inaccurate env — Safety "95.6", "62.2", "75.8"; Goal Reach "100.0", "100.0", "9.6".
- SE(2) robot (500 MC): with the filter "all MC trajectories stay in the safe set" (p.12). SE(3) rigid body through slit (500 MC): "the barrier function values of all MC trajectories stay nonnegative for all time" (p.13).

**Limitations (stated by authors, with page) / limitations we observe:**
- Bound tightness: "characterizing the tightest possible bound is beyond the scope of this work" (p.7); the bound is shown with "the correct qualitative behavior without positioning it as a trajectory-level predictor of exact exit frequencies" (p.7).
- Mapping/obstacle uncertainty: "Although the mapping uncertainty is not the main focus of this paper" (p.10) — only an empirical "inaccurate facet" test.
- Observed: ego-state uncertainty only (obstacles known, static); measurement every time step (no sparse/delayed sensing); no latency; one-step condition; small-scale simulations, no hardware; proxies σ̄, τ̄ require model knowledge.

**Relation to DART:** Strong theoretical support for DART components 4–5. DART's obstacles are tangent half-spaces (affine in position) inflated by covariance; G3's linear/affine closed form (eqs. 29–31, p.8) is exactly "half-space constraint tightened by β·sqrt(nᵀ(AΣAᵀ+Σ_ε)n)", i.e. a covariance-projected margin along the normal, and shows adaptivity to uncertainty improves safety over expectation-only DTCBF (99.0 vs 69.0 % safety). Gap vs DART: uncertainty is in the ego state rather than in perception-estimated obstacles; measurements arrive every step (no inter-measurement covariance growth over a variable open-loop interval, no latency, no choice of when to sense); no UAV dynamics. Stronger than DART: a finite-time exit-probability certificate (Theorem III.1) and manifold (SE(3)) treatment; DART's inflation could cite this as a principled form and could borrow the bound for its own covariance-inflated CBF.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Worst-case bounded-disturbance robustification is over-conservative and uncertainty level varies with conditions -> p.1: "A common approach is to enforce safety under worst-case bounded deterministic disturbances, but this often results in overly conservative behavior."
- Fast UAVs in clutter motivate pose-aware safety filters -> p.1: "consider an unmanned aerial vehicle (UAV) maneuvering at high speed through a cluttered environment."
- Prior stochastic-CBF works assume ground-truth state -> p.2: "all the aforementioned works assume access to ground-truth states of dynamical systems without considering state estimation"
- With unbounded noise only finite-time safety is achievable -> p.4: "infinite-time safety (i.e., forward invariance) is impossible to achieve [13], [34], so we study the finite-time safety"
- Higher predicted uncertainty must be compensated by a larger barrier margin (the inflation principle) -> p.5: "actions that lead to a high predicted uncertainty must be compensated by a sufficiently large increase in the predicted barrier function value."
- Longer open-loop horizons / higher predictive uncertainty loosen certificates -> p.7: "long horizons and high predictive uncertainty inevitably loosen finite-time certificates."
- Uncertainty-adaptive margin improves safety over expectation-only DTCBF -> p.9 Table I: Safety Rate (%) "99.0" (SEA-SCBF) vs "69.0" (SEA-ED), accurate environment.

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Robust safety under stochastic uncertainty with discrete-time control barrier functions (2023) [17]
- Bounding stochastic safety: Leveraging Freedman's inequality with discrete-time control barrier functions (2024) [18]
- Probabilistic control barrier functions: Safety in probability for discrete-time stochastic systems (2025) [19]
- Almost-sure safety guarantees of stochastic zero-control barrier functions do not hold (2023) [13]
- Safety verification of stochastic systems: A set-erosion approach (2024) [21]
- A barrier function approach to finite-time stochastic system verification and control (2021) [16]

---
### G4 — Risk-Bounded Control with Kalman Filtering and Stochastic Barrier Functions
Shakiba Yaghoubi, Georgios Fainekos, Tomoya Yamaguchi, Danil Prokhorov, Bardh Hoxha (Arizona State Univ. / Toyota Research Institute of North America); arXiv:2112.14912v1 [eess.SY], 30 Dec 2021 (the arXiv copy prints no venue; G2 cites it as Proc. IEEE CDC 2021, pp. 5213–5219); pages read: 7/7
Status: USE (ID verified, no correction)
Note on extraction: the ε glyph is dropped by pdftotext (rendered as a control char); quotes below restore it as "ε".

**Problem & setting:** Continuous-time SDE dx = (f + g u)dt + G dw with partial noisy output dy = Cx dt + D dv (eqs. 1–2, p.2). Bound the finite-horizon risk p_u = Pr{x(τ) ∈ X_u for some τ ∈ [t, t+T]} (eq. 4, p.2) below p̄ while only the EKF estimate is available. Application: ego car lane change among 15 traffic participants whose states are estimated by an EKF from noisy position measurements (pp.5–6) — i.e. *obstacle* states estimated by a filter.

**Method (key idea, key equations in words, assumptions):**
- Lemma 3.1 (p.3): under uniform detectability and small noise/initial error (Assumption 3.1, Prop. 1 from Reif et al.), the EKF error satisfies Pr{sup_t ||x − x̂|| ≤ ε} ≥ 1 − p_e (eq. 11), via a Lyapunov supermartingale + Doob's inequality.
- Safety margin h_ε = sup{h(x) : ||x − x0|| ≤ ε, h(x0) ≤ 0} (eq. 13, p.3): the unsafe set is enlarged by the estimation-error bound mapped into barrier space; Lemma 3.2: if h(x̂) > h_ε then the true state is safe.
- Risk decomposition p_u ≤ (1 − p_e) p̂_u + p_e (eq. 14, p.4).
- Barrier candidate B = e^{−α h̄}, h̄ = h − h_ε (p.4). Theorem 1 (p.4): condition (17) on the generator of B evaluated at the estimate, including a term ||∂B/∂x K(t) C|| ε for the filter-innovation error and a trace term for measurement noise through the Kalman gain, plus conditions (18)–(20) on (a, b), gives p_u ≤ p̄. Constraint (17) is linear in u, a, b → QP (21).
- Slack-variable reformulation (22)–(25), p.5, returns "the least unsafe feasible control policy" when risk bound cannot be met.
- Assumptions: continuous measurements, EKF error bound valid (needs detectability, small noise), constant ε chosen from simulation data; no latency.

**Experiments & key quantitative results (exact, with page):** Single highway lane-change simulation (unicycle ego, 15 traffic participants modeled by an interaction SDE; G = 0.1 × I3; ego measures other agents' positions only) (p.5). Risk target "to 0.1 (T = 1, and h(xr , xo ) = ∥px − po∥² − ru², ru = 0.25)" (p.5). Parameters from simulation data: "the estimation error was less than 0.5 for over 99% of the data. Hence, we took pe = 0.01, and ε = 0.5" (p.6); "we set hε = ε²" (p.6). Result: "the upper bound to the risk ... is bounded to the desired value 0.1 almost everywhere except in 2 time instances" where the slack was used (p.6). No Monte Carlo statistics, no baselines.

**Limitations (stated by authors, with page) / limitations we observe:**
- QP "may become infeasible at some states when constraints on an admissible control input exist, or when multiple safety constraints ... exist" (p.1); handled by slack (p.5).
- Authors note the estimation sets barely change because measurements are continuous: "since in this scenario measurements yo are received continuously, and the traffic participants have a near linear behavior, the ellipsoidal sets related to the state estimates do not change much in size" (p.6).
- Observed: ε is a single global bound (from offline data), not a time-varying covariance; continuous-time measurements (no sampling, no delay); one qualitative simulation; future work only mentions robotic platforms (p.7).

**Relation to DART:** Closest early precedent for DART's idea of turning a *Kalman-filter estimate of obstacles* into an enlarged unsafe set inside a CBF-QP (DART components 2, 4, 5). Supports the "inflate by estimation-error bound" principle (eq. 13) with a probabilistic risk decomposition (eq. 14). Gap: the margin is a constant ε derived offline, whereas DART's d(t) grows with covariance between sparse, delayed perception updates; G4 explicitly notes that with continuous measurements the estimate sets "do not change much in size", which is exactly the regime DART does not live in. No latency, no sensing-rate decision, no learned perception, ground vehicle. Stronger than DART: explicit finite-horizon risk bound p_u ≤ p̄ with a proof, and a feasibility-preserving slack formulation.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Estimation-error bounds can be converted into a safety margin around the unsafe set -> p.1: "We use the estimation error bounds to compute a safety margin around the unsafe set of system states"
- Margin construction (enlargement in barrier space) -> p.3: "we first construct a safety margin around the zero level set of the function h such that outside this safety margin, estimation errors of up to size ε will not result in an unsafe behavior."
- Infinite-horizon SBF conditions (Clark 2019) are conservative; finite-time risk is more useful -> p.2: "the conditions are designed to zero out the probability of eventually entering an unsafe set as t → ∞ which is very conservative for many applications."
- Conditions remain linear in the input, so a real-time QP is possible -> p.1 (abstract): "these sufficient conditions are linear constraints on the control input, and, hence, they can be used in tractable optimization problems"
- With continuous measurements the uncertainty does not grow (contrast with sparse perception) -> p.6: "the ellipsoidal sets related to the state estimates do not change much in size."

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Control barrier functions for complete and incomplete information stochastic systems (2019) [7]
- Risk-bounded control using stochastic barrier functions (2020) [25]
- A barrier function approach to finite-time stochastic system verification and control (2019) [21]
- Stochastic stability of the continuous-time extended Kalman filter (2000) [19]
- Hybrid dynamic moving obstacle avoidance using a stochastic reachable set-based potential field (2017) [16]

---
### G5 — Safe Navigation under State Uncertainty: Online Adaptation for Robust Control Barrier Functions
Ersin Daş, Rahal Nanayakkara, Xiao Tan, Ryan M. Bena, Joel W. Burdick, Paulo Tabuada, Aaron D. Ames (Caltech / UCLA); arXiv:2508.19159v2 [eess.SY], 19 Jan 2026 (v1 26 Aug 2025); journal-style preprint; pages read: 9/9 (incl. appendix)
Status: USE (ID verified, no correction)

**Problem & setting:** Control-affine system with CBF evaluated on an estimate x̂ with bounded error ||x − x̂|| ≤ δ(x) (p.2); the bound δ is time-varying and supplied at runtime by a VIO filter covariance (p.8). Tracked ground robot (unicycle) following a sinusoidal reference on an elevated platform with two circular obstacles (pp.4–5, 7–8).

**Method (key idea, key equations in words, assumptions):**
- Robust CBF (R-CBF, Def. 3, p.3, from Nanayakkara et al.): CBF condition at x̂ tightened by γ1(x̂)||L_g h|| + γ2²(x̂)||L_g h||² (eq. 3). Theorem 1 (p.3): if δ ≤ γ1/L_k the original set is safe; otherwise an inflated set with inflation ϕ̄ = (σ_β − γ1)/(2γ2) is safe, where σ_β bounds the change of the feedback law over the error ball (eq. 6).
- Online adaptation (Sec. III-B, p.4): sample N points in the δ-ball around x̂, evaluate σ̂ = max ||k(x̃_i) − k(x̂)|| (eq. 9), choose (γ1, γ2) minimizing the set inflation max{σ̂ − γ1, 0}/(2γ2) (eq. 10) with derivative-free (grid) search; requires solving the R-CBF-QP for each sample.
- Multiple obstacles/boundaries unified into one smooth "Poisson safety function" h0 by solving ∆h0 = F with h0 = 0 on the safe-set boundary (eq. 11, p.4), precomputed on a grid and bilinearly interpolated.
- Dual-relative-degree fix for the unicycle: h = h0 − (1/µ)(1 − cos(θ − θs)) (eqs. 16–17, p.5) so angular velocity enters the constraint.
- Assumptions: bounded error with known (time-varying) bound; static known obstacles; no delay in measurements.

**Experiments & key quantitative results (exact, with page):**
- Simulation (p.5–6): bounded error set "E ≜ [−0.05, 0.05]×[−0.1, 0.1]×{0}" (p.6); "We sample N = 100 perturbed states, and perform a gradient-free grid search over γ̄1 , γ̄2 pairs arranged on a 400×400 mesh" (p.6); control loop "operates at 50 Hz" (p.6). Table I (p.6), Nominal Jopt / Jt[s]: COCP "0.0"/"16.1"; CBF-QP "22896.4"/"36.7"; R-CBF-QP (proposed) "237.1"/"10.7". Robust: R-COCP "0.0"/"21.0"; R-CBF-QP (proposed) "198.9"/"26.9"; fixed (γ1 = 1.4, γ2 = 0.3) "466.1"/"30.5"; tunable γ(h) "312.5"/"25.3".
- Hardware (pp.7–8): GVR-Bot (PackBot 510), Jetson AGX Orin, RealSense at 30 Hz, OpenVINS VIO; "The covariance estimates published by OpenVINS provide us with a runtime uncertainty bound. We use a 95% confidence interval." (p.8). Coarser 80×80 grid: "solving the R-CBF-QP with this grid takes approximately 13 ms per control step, within the 20 ms budget of the 50 Hz control loop" (p.8). Table II Jt [s] (p.7): R-CBF-QP (proposed) "16.6"; γ1,2 = 0 "26.0"; tunable γ(h) "26.3"; fixed (γ1 = 1.0, γ2 = 0.2) "35.8"; CBF-QP "34.2". The tunable R-CBF-QP "became unsafe in hardware under time-varying state estimation uncertainty" and the γ = 0 controller also violated safety (robot "falls from the platform and tips over at 24 sec", Fig. 5 caption, p.7).

**Limitations (stated by authors, with page) / limitations we observe:**
- Supremum in (8) cannot be computed explicitly; σ̂ is "a practical, sampling-based approximation" (p.4) — so the formal guarantee of Theorem 1 holds only approximately in implementation.
- Grid search is used "as proof-of-concept" (p.6).
- Observed: uncertainty is in the ego state, obstacles are static and known (Poisson function precomputed offline, p.5); only bounded-error (worst-case) model; uncertainty bound taken from a VIO covariance at 95% (not a guarantee); no latency handling; ground robot at low speed (v_ref = 0.25 m/s).

**Relation to DART:** Supports DART component 5 in spirit: a CBF filter whose robustness margin is driven at runtime by a filter covariance (OpenVINS, 95% CI) that varies over time, and evidence that a margin that ignores the *time-varying* uncertainty level can fail on hardware while a fixed worst-case margin is overly conservative (Table II). The intro explicitly states that VIO position uncertainty "grows between global positioning updates", which is the same mechanism (uncertainty growth between sparse corrections) that DART exploits for obstacle tracks. Gap: it adapts *how much margin* to use, never *when to sense*; ego-state uncertainty only, obstacles static/known; no perception latency, no learned depth, no UAV. Stronger than DART: hardware validation; state-dependent tuning of robustness to reduce conservatism; dual relative degree handling.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Uncertainty grows between corrective updates (VIO) and undermines CBF guarantees unless robustified -> p.1: "Under VIO, the uncertainty in the vehicle's location estimate grows between global positioning updates, and is an ever-present source of state estimation error"
- Measurement errors are hard for CBFs because conditions are evaluated on the estimate -> p.1: "robustness to measurement errors is notoriously challenging because CBF conditions are evaluated on the estimated state."
- Constant robustness parameters over-compensate -> p.1–2: "R-CBFs account for estimation errors through conditions with constant robustness parameters, which may lead to overcompensation for uncertainty"
- A runtime covariance (95% CI) can be used as the uncertainty bound feeding the CBF -> p.8: "The covariance estimates published by OpenVINS provide us with a runtime uncertainty bound. We use a 95% confidence interval."
- Margins not adapting to time-varying uncertainty can be unsafe on hardware -> p.8: "the tunable R-CBF-QP became unsafe in hardware under time-varying state estimation uncertainty."
- Onboard compute cost of the adaptive filter -> p.8: "approximately 13 ms per control step, within the 20 ms budget of the 50 Hz control loop."

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Safety under state uncertainty: Robustifying control barrier functions (2025) [13]
- Guaranteeing safety of learned perception modules via measurement-robust control barrier functions (2020) [8]
- Measurement-robust control barrier functions: Certainty in safety with uncertainty in state (2021) [9]
- Safe perception-based control under stochastic sensor uncertainty using conformal prediction (2023) [12]
- Safe and robust observer-controller synthesis using control barrier functions (2022) [11]
- Safe navigation and obstacle avoidance using differentiable optimization based control barrier functions (2023) [16]
- Robust control barrier functions using uncertainty estimation with application to mobile robots (2025) [3]

---
### G6 — Differentiable Optimization Based Time-Varying Control Barrier Functions for Dynamic Obstacle Avoidance
Bolun Dai, Rooholla Khorrambakht, Prashanth Krishnamurthy, Farshad Khorrami (NYU Tandon); arXiv:2309.17226v3 [cs.RO], 24 Jan 2024 (v1 29 Sep 2023); no venue printed on the arXiv copy; pages read: 8/8
Status: USE (ID verified, no correction)

**Problem & setting:** Collision avoidance with *moving* convex obstacles whose pose is measured with noise and predicted by an EKF, for a robot with velocity-level (integrator) control; validated in 2-D simulation and on a 7-DOF Franka FR3 arm with Vicon-tracked moving boards/boxes (pp.5–7).

**Method (key idea, key equations in words, assumptions):**
- diffOpt CBF: h = α*(x, ψ_B) − β, where α* is the minimum uniform scaling factor at which the robot and obstacle convex primitives touch (eqs. 3–4, p.2); gradients via the implicit function theorem (eq. 5).
- Time-varying CBF-QP (TVCBFQP): ∂h/∂x ẋ + ∂h/∂t ≥ −γh (eqs. 9–10, p.3); ∂h/∂t estimated by finite differences or as (∂h/∂ψ)(∂ψ/∂t) with ∂ψ/∂t from the state estimator (p.3). Remark 2: the static diffOpt CBF collides in the moving-obstacle example (p.3).
- Measurement noise (Sec. IV-C, p.3–4): EKF gives N(µ, Σ); Theorem 1: using the "most unsafe" obstacle configuration within Mahalanobis distance k guarantees safety for all configurations in that set (probability ≥ Prob_k). Heuristic: shift the obstacle position from µ_p along the barrier gradient direction to the k-Mahalanobis ellipsoid surface, p_D = µ_p + k h_r / sqrt(h_rᵀ Σ_p^{-1} h_r) (eq. 14, p.4) — i.e. a covariance-dependent margin along the relevant direction; authors note it is "moving the obstacle closer to the robot, which is different from enlarging the obstacle" (p.4).
- Actuation limits (Sec. IV-D, p.4–5): inflate the obstacle by a scale s_a = max{1, b a_v} where a_v is the obstacle–robot closing speed projected on the line of centres (eqs. 16–17) — a velocity-dependent margin replacing an MPC preview.
- Assumption 1 (p.4): rotational contribution to velocity negligible. Remark 1 (p.2): assumes a safe control exists within control authority.

**Experiments & key quantitative results (exact, with page):**
- Hyperparameters: "We set γ = 1.0 and β = 1.03 in all our experiments" (p.5).
- Moving-circles example with large noise "N (0, 0.5)" on x, y: robot "maintains safety when using the proposed method to consider sensor noise and is unsafe when measurement noise is not considered" (p.4).
- Moving rectangle vs MPC of [16] (T = 1.5 s, ∆t = 50 ms): MPC more conservative; "On average, the computation time for our proposed method is 0.29 ms, while it is 2.9 ms for the MPC-based method" (p.5). With v_o = [−8, 0, 0] m/s, b = 4.0: diffOpt TVCBFQP without noise/actuation handling and the circle-cover TVCBFQP "collides with the obstacle"; proposed (world-frame and egocentric) avoid collision (p.6).
- FR3 hardware: Vicon at the obstacle, quaternion EKF with constant-velocity model, control loop "100 Hz" (p.6); moving board (k = 3.0, b = 2.5) "takes 0.41 ms"; two boxes (k = 3.0, b = 1.0) "takes 1.7 ms" (p.6); CBF values stay positive (Fig. 8, p.8). AprilTags gave "similar performances" but occlusions (Remark 4, pp.6–7).

**Limitations (stated by authors, with page) / limitations we observe:**
- Probability statement is "only a lower bound", and the exact problem (12) is "computationally expensive to solve", hence a heuristic (p.4).
- k and b are tuned empirically: "One can tune the k value by starting with k = 1" (p.4); "One can start with b = 1 and tune its value based on empirical performances" (p.5).
- Embedding the TVCBF into MPC "creates a nonlinear-bilevel optimization problem that cannot be solved in real-time" (p.4).
- Future work: characterize avoidable obstacle motions and integrate with MPC (p.7).
- Observed: high-rate, low-latency obstacle measurements (Vicon); no delay compensation; k is fixed (does not grow with time since last measurement, beyond whatever the EKF covariance does); no formal guarantee for the velocity scaling; no UAV.

**Relation to DART:** Supports DART components 4–5 as a direct precedent for *time-varying CBF for moving obstacles tracked by a constant-velocity EKF*, with a *covariance-based (Mahalanobis k-sigma) margin* and a *closing-speed-based inflation* that substitutes for a predictive horizon — conceptually close to DART's covariance-inflated radius and braking-distance/closing-speed terms. Gap: no sensing latency, no capture-time update, no variable perception rate or scheduling, measurement every control step, empirical k and b with no link to braking distance; manipulator not UAV. Stronger than DART: general convex geometries (not spheres) and hardware results with moving obstacles; ∂h/∂t from the estimator's velocity explicitly included.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Static CBFs fail for moving obstacles; time-varying formulation needed -> p.3 (Remark 2): "if we replace the diffOpt TVCBF with the diffOpt CBF proposed in [13], it is observed that the robot will collide with the obstacle."
- Ignoring measurement noise in obstacle state leads to violations -> p.3: "If not considered, the measurement noise may lead to safety violations of the robotic system."
- Mahalanobis-k "most unsafe" configuration gives a probabilistic safety guarantee -> p.3: "using the obstacle configuration ψ̃ guarantees safety with probability Probk."
- Noisier measurements require larger margins -> p.4: "In general, the noisier the measurement, the larger k should be."
- Closing-speed-dependent inflation as a cheap alternative to MPC preview for actuation limits -> p.4: "we propose to inflate the obstacle based on the relative velocity of the robot (or robot segment) and the obstacle."
- TVCBF-QP is an order of magnitude cheaper than the MPC baseline -> p.5: "the computation time for our proposed method is 0.29 ms, while it is 2.9 ms for the MPC-based method."
- Sphere-only obstacle models make MPC baselines conservative -> p.1: "[16] models both the robot and the obstacle as spheres, which may generate overly conservative motions"

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Safe navigation and obstacle avoidance using differentiable optimization based control barrier functions (2023) [13]
- Avoiding dynamic obstacles with real-time motion planning using quadratic programming for varied locomotion modes (2022) [16]
- Dynamic control barrier function-based model predictive control to safety-critical obstacle-avoidance of mobile robot (2023) [17]
- Safe teleoperation of dynamic UAVs through control barrier functions (2018) [9]
- Duality-based convex optimization for real-time obstacle avoidance between polytopes with control barrier functions (2022) [11]

---
### H1 — Update with Out-of-Sequence Measurements in Tracking: Exact Solution
Y. Bar-Shalom; IEEE Transactions on Aerospace and Electronic Systems, vol. 38, no. 3, pp. 769–777, July 2002; DOI 10.1109/TAES.2002.1039398 (Crossref; the task list's "38(3), 2002" confirmed; some citing papers print pp. 769–778). An earlier conference version exists: Proc. SPIE 4048, Signal and Data Processing of Small Targets 2000, pp. 541–556, DOI 10.1117/12.392006. pages read: 0
Status: NEED-USER-DOWNLOAD
Searches (web search for an author-hosted / institutional PDF; SPIE and IEEE landing pages only; no author or lab copy found) turned up no open copy that is clearly the paper itself. IEEE Xplore is known to be blocked here. No content notes are given, per the brief. (H3 below cites the OOSM literature and gives an open, exact treatment of the same retrodiction-then-update idea. That is NOT a substitute for reading H1.)

---

### H2 — Hardware- and Vision-in-the-Loop Validation of Deep Monocular Pose Estimation for Autonomous Maritime UAV Flight
Maneesha Wickramasuriya, Beomyeol Yu, Jaden Shin, Mason Huslig, Taeyoung Lee, Murray Snyder (George Washington Univ.); arXiv:2606.19176v1 [cs.RO], 17 Jun 2026; 6-page conference-style paper (no venue printed); pages read: 6/6
Status: USE (added by search — chosen because it is the closest arXiv paper found that (a) runs a *learned monocular network* on an embedded GPU (Jetson Orin NX) inside a quadrotor control loop, (b) measures the resulting inference latency and its rate/latency trade-off, and (c) compensates it with a delayed Kalman filter that applies the update at the capture time from a state/IMU buffer, exactly DART's component 2 mechanism)

**Problem & setting:** Ship-relative 6-D pose of a quadrotor from a single RGB image using a transformer network (TNN-MO); images are rendered from a 3D Gaussian Splatting ship model using the Vicon pose ("vision-in-the-loop") and streamed over Wi-Fi to the onboard Jetson; the delayed network outputs are fused with 200 Hz IMU for geometric control (pp.1–3).

**Method (key idea, key equations in words, assumptions):**
- Delayed Kalman filter (DKF, from their earlier CEP 2024 paper [14]): state = attitude R ∈ SO(3), position, velocity, accelerometer bias; IMU propagation; "When a delayed TNN-MO pose measurement arrives, the filter applies the update at the corresponding past measurement time using a history buffer of stored states, covariances, and IMU data" (p.2–3), then re-propagates to the current time (p.3). No equations are given in this paper (method referenced to [11], [14]).
- Parallel staggered network instances raise throughput but increase average delay (p.3, Fig. 2, Table I); explicit waiting time enforces a constant rate (p.3).
- Assumptions: the network output is treated as a pose measurement with no stated covariance model; latency known per measurement via timestamps.

**Experiments & key quantitative results (exact, with page):**
- Latency: "non-negligible latency of 0.3 seconds" (p.2). Table I (p.4) TNN-MO on Jetson Orin NX, Avg. Frequency (Hz) / Avg. delay (s): Single w/o FC "5.5"/"0.18", w/ FC "4.7"/"0.21"; Two "9.0"/"0.22", "8.7"/"0.23"; Three "9.8"/"0.30", "9.0"/"0.33"; Four "11.1"/"0.36", "10.0"/"0.40". Text: "four parallel instances with the onboard FC produce approximately 10 Hz pose updates with an average delay of about 0.4 s" (p.3); communication latency "0.08–0.1 s" (p.3). Fig. 2 caption: staggered by "0.117 s ... (8.5 Hz), despite each taking 0.345 s" (p.3).
- Throughput drift: "a pipeline initially averaging 8.7 Hz may gradually decrease to 8.55 Hz over a two-hour run" (p.3); performance "sensitive to ambient temperature" (p.3).
- Worst-case test: "a 0.4 s inference delay (approximately 0.55 s total latency including transmission) at a 5 Hz inference rate" (p.4).
- Flight (7.5 m out-and-back at 1.0 m altitude), Table II (p.5): Estimation MAE position "0.0660" m, velocity "0.032" m/s, attitude "2.13" deg (RMSE 0.0907 m, 0.043 m/s, 2.30 deg); Control MAE position "0.0894" m, velocity "0.062" m/s, attitude "4.00" deg.
- Inconsistency as printed: the maximum supported delay is given as "τmax = 5.5 s" (p.4, Sec. III-C) and later as "τmax = 0.55 s" (p.4, Sec. IV-B c).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: future work is real maritime flights on a moving ship with sea-state/airwake disturbances (p.6); Jetson rate depends on GPU/CPU contention and temperature (p.3).
- Observed: single trajectory, single run reported, no Monte Carlo; *no ablation without delay compensation*, so the conclusion that the DKF "is essential" (p.6) is asserted, not measured; the network measurement covariance is not described; no obstacle avoidance or safety guarantees; perception rate is fixed (staggered pipeline), not adapted to risk.

**Relation to DART:** Direct support for DART component 2 (pose buffer + update at capture time) and for the premise that learned monocular perception on an onboard accelerator has latency of hundreds of ms and a limited, variable rate (Table I). Its throughput–latency trade-off (more instances → higher rate but larger delay, near GPU saturation) is a useful empirical motivation for DART's scheduler that treats perception rate as a decision variable with compute cost. Gap: estimation only (ego pose relative to a ship), no obstacles, no safety filter, no event/risk-triggered inference, constant commanded rate. Stronger than DART: real embedded hardware in closed-loop flight with a real network.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Embedded learned-perception pipelines introduce large latency and asynchronous updates -> p.2: "rendering, communication, and embedded inference introduce non-negligible latency of 0.3 seconds, the resulting vision measurements are time-delayed and asynchronous."
- Capture-time update from a buffer then re-propagation -> p.2–3: "the filter applies the update at the corresponding past measurement time using a history buffer of stored states, covariances, and IMU data."
- Rate is limited by system resources, not only network design -> p.3: "achievable update rates are constrained not only by network architecture but also by GPU utilization, CPU scheduling, memory bandwidth, and operating conditions"
- Throughput–latency trade-off of parallel inference -> p.3: "additional instances increase update frequency but also increase average delay."
- Numbers for a transformer monocular network on a Jetson Orin NX -> p.4 Table I: single instance "5.5" Hz / "0.18" s delay without FC; four instances with FC "10.0" Hz / "0.40" s.
- Authors' conclusion on delay compensation (asserted, not ablated) -> p.6: "explicit delay compensation via the DKF is essential for maintaining estimator consistency and closed-loop stability"

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Delayed Kalman filter for vision-based autonomous flight in ocean environments (2024) [14]
- Selective fusion of out-of-sequence measurements (2010) [8]
- Real-time kinematics GPS based telemetry system for airborne measurements of ship air wake (2019) [11] (cited as the DKF source)

---
### H3 — Continuous-discrete multiple target tracking with out-of-sequence measurements
Ángel F. García-Fernández, Wei Yi (Univ. Liverpool / UESTC); arXiv:2106.04898v2 [eess.SY], 1 Sep 2021; published in IEEE Transactions on Signal Processing, vol. 69, pp. 4699–4709, 2021 (journal ref from arXiv metadata); pages read: 14/14 (main text 1–11 fully; supplementary appendices A–C pp.12–14 read, derivations skimmed)
Status: USE (narrow; added by search — chosen as an open, peer-reviewed treatment of the *exact* Bayesian out-of-sequence update via retrodiction, that cites Bar-Shalom 2002 as the single-target linear-Gaussian optimum and states exactly when the update stays exact. This bears on DART's claim that its capture-time update is "exact when only one frame is in flight")

**Problem & setting:** Multi-target tracking in continuous time (targets appear and disappear as an M/M/∞ queue; Wiener-velocity SDE dynamics), with measurement scans arriving out of sequence because of transmission delays. Posterior over sets of trajectories as a Poisson multi-Bernoulli mixture (TPMBM).

**Method (key idea, key equations in words, assumptions):**
- OOS processing = retrodiction to the OOS timestamp τ, then the standard update, then marginalising out the τ-state (Fig. 1, p.2; Sec. IV).
- Retrodiction transition density (Prop. 3, eq. 15, p.5): for a trajectory alive at both neighbouring sampled times, the state at τ is obtained by Bayes' rule from the states at t_{k°−1} and t_{k°} (eq. 17). In the linear-Gaussian case this is a Kalman-type update with gain K_pp = Q1 F2ᵀ(F2 Q1 F2ᵀ + Q2)^{-1} (eqs. 36–37, p.8; App. B, eq. 45). Also covers targets that appeared or disappeared between samples and "OOS new trajectories" (eqs. 23–24).
- Theorem 4 (p.5): after retrodiction the density is still a PMBM; the update keeps PMBM form.
- Exactness condition (p.7): exact "unless we get more than one OOS set of measurements in the same time interval".
- Gaussian implementation with an L-scan window; OOS sets are processed only if inside the window (p.8).

**Experiments & key quantitative results (exact, with page):** 2-D simulation, λ = 0.12 s⁻¹, µ = 0.02 s⁻¹, q = 0.2 m²/s³; 19 targets in total, at most 10 alive at once; 120 measurements with exponential inter-arrival times (µ_m = 1 s⁻¹); "for every 5 of the 120 measurements, we draw a random number no from a Poisson distribution with parameter 1 and place this measurement no time steps afterwards" (p.9); Nmc = 100 (p.9). Table II (p.10), RMS trajectory-metric total error / time [s], L = 5: TPMBM "3.44"/"11.3"; (N)OOS-TPMBM "3.28"/"11.9"; OOS-TPMBM "3.10"/"12.3"; TPMB "3.84"/"2.5"; (N)OOS-TPMB "3.51"/"3.0"; OOS-TPMB "3.42"/"3.0". L = 3: TPMBM "3.54"/"11.0"; (N)OOS-TPMBM "3.37"/"11.8"; OOS-TPMBM "3.20"/"12.3"; TPMB "3.93"/"2.5"; (N)OOS-TPMB "3.61"/"3.0"; OOS-TPMB "3.52"/"3.0". "the best performing filter is the OOS-TPMBM with L = 5" (p.10); filters with OOS processing mainly reduce the false-target cost (Fig. 7 caption, p.10).

**Limitations (stated by authors, with page) / limitations we observe:**
- Approximate when more than one OOS set falls in the same interval (p.7).
- Only OOS sets inside the L-scan window are processed (p.8).
- They marginalise out the τ-state "as most of the measurements are expected to be in-sequence" (p.6), not the fully exact re-indexing alternative.
- Observed: simulation only; multi-target set-of-trajectories machinery is far heavier than DART needs; no robotics/control; latency is a transmission-delay model, not inference latency.

**Relation to DART:** Supports DART component 2 only at the level of *terminology and the exactness argument*. In DART a frame captured at t_c arrives at t_c + latency. If no other measurement was fused in between, the update is a *delayed but in-sequence* update: predict to t_c, update, re-predict. That is exact for a linear-Gaussian CV model, and it is the trivial case. True OOSM retrodiction (Bar-Shalom 2002 / this paper) is only needed when frames overtake each other or when newer information about the same track was already fused. H3's exactness condition ("unless … more than one OOS set … in the same time interval", p.7) is the formal analogue of DART's "exact when only one frame is in flight". DART should state this carefully and cite the OOSM literature for the multi-frame case. Gap: no control, no safety, no ego-pose uncertainty at capture time (DART forms the measurement with the buffered ego pose at capture time; ego-pose error at t_c is not modelled here).

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Delays make measurements arrive out of sequence; reprocessing everything should be avoided -> p.1: "Due to different time delays in transmission, a measurement scan may be received out-of-sequence (OOS)."
- Single-target linear-Gaussian optimal OOSM solutions exist (Bar-Shalom 2002 is [5]) -> p.1: "Optimal algorithms to process an OOS measurement for a single target in linear Gaussian systems were provided in [5]–[7]"
- OOSM = retrodiction then update -> p.1: "Processing an OOS measurements can be done with a retrodiction step, which obtains target information at the time stamp of the OOS measurement, and a measurement update."
- Exactness breaks when more than one delayed set falls in the same interval -> p.7: "The procedure provides the exact solution posterior at the in-sequence sampling times unless we get more than one OOS set of measurements in the same time interval"
- Processing OOS measurements improves accuracy at modest cost -> p.10 Table II (L = 5): total error "3.44" (discard OOS) vs "3.10" (optimal OOS); time "11.3" s vs "12.3" s.

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Update with out-of-sequence measurements in tracking: exact solution (2002) [5] (= H1)
- One-step solution for the multistep out-of-sequence-measurement problem in tracking (2004) [6]
- Optimal update with out-of-sequence measurements (2005) [7]
- On accumulated state densities with applications to out-of-sequence measurement processing (2011) [4]
- Out-of-sequence measurement processing for particle filter: Exact Bayesian solution (2012) [8]

---
### G7 — Dynamic Control Barrier Function-based Model Predictive Control to Safety-Critical Obstacle-Avoidance of Mobile Robot
Zhuozhu Jian, Zihong Yan, Xuanang Lei, Zihong Lu, Bin Lan, Xueqian Wang, Bin Liang (Tsinghua SIGS / ETH / HIT); arXiv:2209.08539v1 [cs.RO], 18 Sep 2022 (arXiv comment: "Submitted to IEEE International Conference on Robotics and Automation (ICRA) 2023"; G6 cites it as ICRA 2023, pp. 3679–3685); pages read: 7/7
Status: USE (added by search — chosen because it is a perception-driven pipeline in which obstacles are *estimated by a Kalman filter from sensor detections*, predicted over the MPC horizon with *covariance-grown, inflated* ellipses, and enforced with *discrete-time (dynamic) CBF rows inside MPC*. That is structurally the closest published analogue of DART component 4)

**Problem & setting:** Ground robot (differential drive) avoiding static and dynamic obstacles (pedestrians, e-bike, balls, a quadruped) using only an onboard LiDAR; MPC tracks a global PF-RRT* path (p.2, Fig. 2).

**Method (key idea, key equations in words, assumptions):**
- Perception: LiDAR → 2.5-D elevation grid map → obstacle cells (gradient/step thresholds, eqs. 10–12) → DBSCAN clusters → minimum bounding ellipses (MBE) → Hungarian data association (p.4).
- Obstacle KF on state [x, y, a, b, θ, ẋ, ẏ, ẍ, ÿ] (constant-acceleration for position, constant shape; eqs. 15–16, p.5). Heuristic MBE position-confidence indicator Ξ̂p = κ Ξη^γ from shape variability, used to scale the position measurement covariance R_p (eqs. 13–14, 17–18; fitted with [κ, γ] = [5.5, 1.3], "good estimate for obstacles with speed less than 1.5m/s and radius less than 0.9m", p.5).
- Prediction over the horizon by x_k = A x_{k−1}, P_k = A P_{k−1} Aᵀ + Q; the ellipse is enlarged by σ_min from an uncertainty radius r = r_p + r_η (from position and shape covariance) via the smallest ellipse bounding the Minkowski sum (eq. 19, p.5); "as k increases from 0 to N, the uncertainty of the obstacles increases, and the corresponding ellipse is expands accordingly" (p.5).
- D-CBF: h(X_k) = ||p(k) − x_ob(k)||² − l_i(k) − d_safe, with l_i the centre-to-boundary distance along the robot direction (eqs. 6–7, p.3); discrete-time CBF Δh ≥ −γh as MPC constraint (eqs. 5, 9f).
- Assumptions: no latency handling (perception 10–20 Hz, planning 10 Hz, p.5); safety argued "by definition" of a CBF on the extended state (p.2).

**Experiments & key quantitative results (exact, with page):**
- Real robot (Scout 2.0, RS-Helios 32-beam LiDAR, two Intel NUC i5): pedestrians ~"1.2m/s", electromobile "1.8m/s"; "predicted step N of the robot and the obstacle is set to 25"; "the safe distance dsafe is 1.3m"; "γ in CBF is set to be 0.15" (p.5). Qualitative only.
- Gazebo (Jackal + Velodyne), Table I (p.6), single scenario: Min dist(m) / Cons time(s) / Reac time(s) / Speed var: MPC "0(collided)" / "-" / "1.331" / "-"; MPC-CBF "0.273"/"22.07"/"0.357"/"0.1598"; MPC-KF "0.201"/"20.05"/"1.197"/"0.0061"; MPC-CBF-curvefit "0.074"/"23.27"/"0.421"/"0.1306"; Ours "0.828"/"21.52"/"0.353"/"0.0172".

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: Ξ̂p heuristic only validated for "speed less than 1.5m/s and radius less than 0.9m" (p.5).
- Observed: no Monte Carlo (one simulated run per method in Table I); no formal safety proof for the MPC with inflated predicted ellipses (inflation is heuristic, no probability level); no sensing latency or pose-at-capture handling; no reasoning about perception rate; 2-D ground robot.

**Relation to DART:** Direct precedent for DART component 4: MPC with discrete-time CBF rows against KF-tracked obstacles whose size is inflated by the *propagated* covariance along the prediction horizon. DART adds: a principled (probabilistic, sigma-based) inflation tied to the filter, *expected covariance reset at expected measurement times* in the horizon (G7 only grows uncertainty monotonically over the horizon), latency-aware capture-time updates, a braking-distance safety filter, and the perception scheduler. G7 is a natural baseline ("MPC-DCBF with KF-inflated obstacles, fixed perception rate"). Stronger than DART: real-world LiDAR implementation with real detection/association noise; elliptical shapes.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- KF-based obstacle prediction with uncertainty-driven inflation is used to enhance safety -> p.1: "Due to the uncertainty of the MBE, the semi-major and semi-minor axes of the parameterized ellipse are extended to ensure safety."
- Inflation grows along the prediction horizon with propagated covariance -> p.5: "as k increases from 0 to N, the uncertainty of the obstacles increases, and the corresponding ellipse is expands accordingly"
- Prior MPCC work assumed uniform future uncertainty -> p.1: "the uncertainty distribution of obstacles in the future time domain is assumed to be uniform in [11], which is improved in this paper"
- DT-CBF MPC without obstacle prediction fails to react early to dynamic obstacles -> p.6: "MPC-CBF (green) and MPC-CBF-curvefit (black) cannot avoid the dynamic obstacles in advance due to no prediction or inaccurate prediction of obstacles"
- Quantitative safety margin gain (single scenario) -> p.6 Table I: Min dist "0.828" m (Ours) vs "0.273" (MPC-CBF), "0.201" (MPC-KF), "0(collided)" (MPC).

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Model predictive contouring control for collision avoidance in unstructured dynamic environments (2019) [11]
- Safety-critical model predictive control with discrete-time control barrier function (2021) [22]
- Enhancing feasibility and safety of nonlinear model predictive control with discrete-time control barrier functions (2021) [23]
- Autonomous flights in dynamic environments with onboard vision (2021) [10]
- Robust vision-based obstacle avoidance for micro aerial vehicles in dynamic environments (2020) [9]

---

### G8 — Risk-Aware Belief Control Barrier Functions over Random Finite Sets
Shaohang Han, Gang Chen, Yixi Cai, Ignacio Torroba, Ivan Stenius, Patric Jensfelt, Javier Alonso-Mora, Jana Tumova (KTH / TU Delft); arXiv:2607.15016v1 [cs.RO], 16 Jul 2026; 8-page conference-style preprint (no venue printed; "Code will be released upon acceptance", p.5); pages read: 8/8
Status: USE (added by search — chosen because obstacles are *estimated from noisy depth/sonar point clouds by a filter*, the CBF is built on that belief with an explicit risk level, and the paper explicitly analyses the hybrid structure "continuous prediction between discrete measurement updates". It derives a condition for safety *across updates*, which is the same structural issue as DART's covariance growth/reset and its scheduling)

**Problem & setting:** Robot with known state (p.3: "The robot state is assumed known for simplicity") must keep an unknown, time-varying number of moving objects outside a failure set with probability ≥ 1 − τ (Problem 1, eq. 9, p.3). Objects are estimated by an SMC-PHD (random-finite-set) filter from range-bearing or point-cloud measurements arriving at discrete times.

**Method (key idea, key equations in words, assumptions):**
- Using the Poisson-point-process void probability, the chance constraint becomes ln(1/(1−τ)) − Λ(F(x), b) ≥ 0, where Λ is the particle weight inside the failure set (eqs. 10–12, p.3); equivalently a bound on the expected number of objects in the failure set (Remark 3).
- Belief CBF h_b = soft-min over the top-(L − k_τ) particle safety values s_i = h_o(x, õ_i) (eqs. 13–15, p.4); locally Lipschitz (Lemma 1); nonsmooth-CBF conditions with a tie-handling auxiliary variable ρ (eq. 20, p.5), giving a QP with n_u + 1 variables and |T| + 1 constraints.
- Hybrid belief dynamics: particles propagate continuously with object dynamics between updates; discrete jumps b⁺ = Δ_k(b⁻, Z_k) at measurement times (eq. 17, p.4). Theorem 1 (p.5): forward invariance during continuous prediction. Proposition 1 (p.5): if before the update the state is in the tightened set C_b^{τ−ϵ} and the update raises the failure-set mass by at most ln(1 + ϵ/(1−τ)) (eq. 21), the state stays in C_b^τ (κ → ∞).
- Remark 4 (p.5): staying safe over successive intervals also requires returning to C_b^{τ−ϵ} before the next update, which is "not explicitly enforced by the current controller", and is left to a time-varying CBF in future work.
- Slack relaxation with heavy penalty for feasibility (p.5–6).

**Experiments & key quantitative results (exact, with page):**
- FOV maintenance (unicycle, 4 constant-velocity objects, range-bearing at "10 Hz", L = 3000 particles), 100 simulations, Table I (p.6): min_t h_o^gt — Ours (τ−ϵ = 0.01) "0.51±0.12", Ours (τ−ϵ = 0.2) "0.24±0.12", Mean-CBF "−0.16±0.54", MAP-CBF "0.05±0.45"; # Unsafe "0", "5", "49", "31"; Avg. t_c (ms) "1.72±0.06", "1.78±0.06", "0.60±0.02", "0.61±0.02"; Max. t_c (ms) "6.84", "7.46", "3.90", "4.14".
- Obstacle avoidance (3-D single integrator, ray-cast point cloud at "10 Hz", L = 8000), 100 runs per case, Table II (p.7), Coll.(%) / Succ.(%): Case A — Ours (0.05) "1.0"/"94.0", Ours (0.15) "1.0"/"95.0", [30] "19.0"/"80.0"; Case B — "0.0"/"92.0", "0.0"/"93.0", [30] "24.0"/"76.0"; Case C (head-on L-shape) — Ours (0.05) "0.0", Ours (0.15) "1.0", [30] "64.0". Avg. t_c ≈ "2.66±0.13" ms (A, Ours 0.05), max "10.70" ms. Baseline [30] (composite CBF on soft-min point-cloud distance) "ignores obstacle velocities and thus incurs more collisions" (p.7).
- Hardware: BlueROV2 + 3D sonar "at 5 Hz", safe controller "at 50 Hz" (p.7); qualitative success where the baseline "becomes unsafe".
- Spikes in the BCBF value at discrete PHD updates are visible; with the tightened level the value "may become negative, yet the BCBF value evaluated at the original risk level (τ = 0.05) remains nonnegative throughout" (p.6).

**Limitations (stated by authors, with page) / limitations we observe:**
- Recovery to the tightened set between updates not enforced (Remark 4, p.5).
- Future work: account for "the mismatch between the estimated PPP belief and the true multi-object posterior", and "move the computation onboard" (p.8). Experiments ran on a laptop with RTX 4070 GPU (p.6).
- Robot state assumed known (p.3).
- Observed: no latency/delay modelling (measurements used at arrival), fixed sensor rates, single-integrator kinematic models; no relation between sensing rate and the size of update jumps.

**Relation to DART:** Strongly related to DART components 2, 4–5 and directly to its novelty. G8 formalises the "continuous prediction + discrete measurement update" hybrid belief and shows (i) safety during prediction via a belief CBF and (ii) a condition on how much an update may change the risk (Prop. 1), with a margin ϵ reserved for update jumps. It explicitly leaves open "returning to C_b^{τ−ϵ} before the next update" (Remark 4). DART's scheduler (safe open-loop time until the next perception result must arrive) and its time-varying inflation d(t) with expected covariance reset address *when* the next update must come, which is exactly this open issue. G8 does not choose the update times, and it does not handle latency or the perception compute budget. G8 is stronger than DART in its explicit risk-level guarantee, its multi-object/unknown-cardinality handling, its use of velocity information from a filter in the CBF, and its hardware demonstration.

**Citable statements** (each: claim in our words -> page + verbatim quote):
- Prior belief-CBFs assume a known, fixed number of objects -> p.1: "These BCBFs assume the environment has a known and fixed number of objects. In practice this is restrictive"
- Worst-case bounded-error CBFs (observer-based, measurement-robust) are conservative relative to stochastic treatment -> p.2: "both methods enforce safety against the worst-case error within the bound, which can be conservative compared to incorporating unbounded stochastic uncertainty [18]."
- Belief dynamics are hybrid (prediction + discrete updates), complicating invariance -> p.1: "the belief space dynamics are hybrid in nature, combining continuous prediction with discrete update, which makes the analysis of forward invariance difficult."
- Discrete updates can introduce risk the controller cannot compensate at that instant -> p.5: "This update may introduce particles into the failure set F. The resulting belief change cannot in general be fully compensated for by the control input at the update time."
- Open problem: guaranteeing recovery before the next update (DART's scheduling angle) -> p.5: "This recovery property is not explicitly enforced by the current controller. While it might be addressed by a time-varying CBF formulation [24], we leave it for future work."
- Point-estimate CBFs (mean/MAP) are unsafe when the belief is imperfect -> p.6: "they reduce the particle-based belief to a single estimate per object, discarding the spatial distribution of the particles. This leads to safety violations"
- Ignoring obstacle velocity in a point-cloud CBF causes collisions -> p.7 Table II, Case C: collision rate "64.0" % for [30] vs "0.0" % for Ours (0.05).

**Snowball candidates** (refs in its bibliography that look closely related; title + year only):
- Safe quadrotor navigation using composite control barrier functions (2025) [30]
- Risk-aware robot control in dynamic environments using belief control barrier functions (2025) [7]
- Sensor-based distributionally robust control for safe robot navigation in dynamic environments (2026) [14]
- Belief control barrier functions for risk-aware control (2023) [5]
- Continuous occupancy mapping in dynamic environments using particles (2024) [11]
- Guaranteeing safety of learned perception modules via measurement-robust control barrier functions (2021) [17]

---

### Additional candidates found during search (NOT read — no content claims; listed only for the lead to decide)
- arXiv:2304.00194 — "Safe Perception-Based Control under Stochastic Sensor Uncertainty using Conformal Prediction" (Yang, Pappas, Mangharam, Lindemann; CDC 2023 per arXiv comment). Its arXiv abstract mentions learned perception maps, measurement-robust CBFs, and a sampled-data controller using "idea from self-triggered control". This is potentially very close to DART's "when to perceive" novelty claim; recommend reading in full.
- arXiv:2504.15850 — "Embedded Safe Reactive Navigation for Multirotors Systems using Control Barrier Functions" (ICUAS 2025 per search snippet): onboard ToF-depth CBF safety filter in PX4; possible UAV baseline. Not read.
- arXiv:2312.15638 — Kishida, "Risk-Aware Control of Discrete-Time Stochastic Systems: Integrating Kalman Filter and Worst-case CVaR in Control Barrier Functions" (also G2 ref [18]). Not read.

---

## Group synthesis
- Across G2, G3, G4, G5, G6 and G8, the papers agree that a CBF evaluated on a filter estimate must be tightened by an uncertainty-dependent margin. Margins that ignore estimation uncertainty fail in practice, measured as: G2 Table I, deterministic CBF "100%" violation; G3 Table I, expectation-only "69.0" vs "99.0" % safety; G5 hardware, the γ = 0 and non-adaptive controllers violated safety; G6, the noise-unaware TVCBF collided; G8 Table I, Mean/MAP-CBF "49"/"31" unsafe runs.
- Fixed worst-case margins are repeatedly shown to be over-conservative. G2's DKW bound reaches only "56%" of goals; G5's fixed-gain R-CBF has the largest tracking metric in Table II ("35.8" s). This motivates margins that adapt to the current covariance, the kind of margin DART's d(t) provides.
- For affine (half-space) CBFs with Gaussian estimates, the tightening has a closed form: the normal-projected standard deviation β·sqrt(nᵀ(AΣAᵀ+Σ_ε)n) (G3 eqs. 29–31), and a k-Mahalanobis shift along the barrier gradient (G6 eq. 14). These give a principled basis for DART's covariance-inflated tangent half-spaces and CBF rows.
- Uncertainty growth *between* measurements appears explicitly only in G1 (reachable-set flow over [t_k, t_{k+1}), set-membership), G7 (covariance-grown ellipses over the MPC horizon, heuristic) and G8 (continuous belief prediction between discrete updates). G4 even notes that with continuous measurements the uncertainty sets "do not change much in size".
- Safety *across measurement updates* is a recognised open issue. G1 (Remark 12) requires the new estimate never to contain the agent. G8 (Prop. 1) reserves a risk margin ϵ for update jumps but leaves "recovery before the next update" to future work (Remark 4). No paper in this group chooses the measurement times to guarantee this.
- None of the CBF papers (G1–G8) models sensing *latency*: measurements are applied at arrival, at fixed rates (10–50 Hz) or continuously. On the estimation side, H2 shows that a learned monocular network on a Jetson has 0.18–0.40 s delay with a rate–latency trade-off (Table I), and compensates it with a buffer-based capture-time update. H3 gives the exactness condition for delayed/out-of-sequence updates. H1 (the classic exact OOSM solution) could not be obtained (NEED-USER-DOWNLOAD).
- The open gap DART can fill, based on what was read here: couple (a) the time-varying, covariance-driven CBF/MPC tightening that G3/G6/G7/G8 justify with (b) latency-aware capture-time estimation (H2/H3) and (c) an explicit choice of *when* the next perception result must arrive. Point (c) means making the update-recovery condition that G1 and G8 leave open a scheduling constraint (safe open-loop time), under a compute budget for learned depth. No paper in this group adapts the perception rate or triggers perception from risk.
- DART's comparative weaknesses relative to this group are: no formal probability-of-safety certificate (G2, G3, G4 and G8 have one), sphere-only geometry (G1 and G6 handle general convex shapes), and simulation-only evaluation (G5, G6, G7 and G8 include hardware). DART's claims should be positioned accordingly. Note also that "exact when only one frame is in flight" is the trivial delayed-in-sequence case; the harder case is multi-frame OOSM (H3 p.7).
