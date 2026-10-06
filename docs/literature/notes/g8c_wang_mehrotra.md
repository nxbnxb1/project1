# Notes g8c — methods papers (user-supplied PDFs): Wang et al. T-RO 2017 (E5) and Mehrotra 1992 (M1)

**Conventions**
* "p.N" is the PDF page. The printed journal page is in brackets: Wang journal page = 660 + N, Mehrotra journal page = 574 + N.
* Text in double quotes is verbatim. It was checked with `docs/literature/verify_quotes.py`.
* Equations are written outside quotes. Where the text extraction garbled them, I read them from page images in `PAPERS_DIR/img_g8c/`:
  * Wang pp.3, 4, 10;
  * Mehrotra pp.3, 4, 7, 10, 11, 14, 18, 20, 21, 24.
* Code was read at:
  * `src/control/dart_cbf_filter.m`
  * `src/util/dart_qp_solve.m`
  * `src/control/dart_mpc.m` (lines 140–170)
  * `src/config/dart_default_config.m`
  * `docs/method/DART_method_VI.tex` (lines 328–341, 413)
* Nothing under `/home/user/project1` was modified.

---

### E5 — Safety Barrier Certificates for Collisions-Free Multirobot Systems
L. Wang, A. D. Ames, M. Egerstedt; IEEE Transactions on Robotics, vol. 33, no. 3, pp. 661–674, June 2017; DOI 10.1109/TRO.2017.2659727; pages read: 14/14 (user-supplied PDF; includes the reference list and biographies)
Status: USE. This entry replaces the "NEED-USER-DOWNLOAD" entry E5 in `docs/literature/notes/g4_cbf.md`.

**Problem & setting:**
* N planar robots, each modelled as a double integrator (eq. 4, p.3), with ‖v_i‖∞ ≤ β_i and ‖u_i‖∞ ≤ α_i.
* Their nominal controllers are deliberately designed to collide. The safety layer must change them "as little as possible" by solving a QP.
* The paper addresses four things:
  * decentralising the QP;
  * reducing conservatism;
  * guaranteeing that the QP is feasible;
  * avoiding deadlock.
* The double-integrator model is motivated on p.3: "As the acceleration limitations play a crucial role when avoiding collisions".

**Method (key idea, key equations in words, assumptions):**
* **ZCBF background (Sec. II, pp.2–3)**
  * h is a ZCBF if sup_u [L_f h + L_g h u + κ(h)] ≥ 0 on D (Def. II.2).
  * Any Lipschitz u ∈ S(x) "renders the set C forward invariant. And C is asymptotically stable in D." The paper recalls this theorem from [26] (Xu et al. 2015) on p.3.
  * Class-K choice (eq. 3, p.3): κ(h) = γh³.
* **Braking-distance barrier (Sec. III, p.3)**
  * Δv̄ = (Δp_ijᵀ/‖Δp_ij‖) Δv_ij is the normal component of the relative velocity (Fig. 1). The paper notes that for moving agents "the relative velocity between two agents needs to be reduced to zero instead of the absolute velocity" (p.3).
  * With the maximum relative braking (α_i + α_j) for time T_b = −Δv̄(t0)/(α_i + α_j), the condition is eq. (5): ‖Δp_ij‖ − (Δv̄)²/(2(α_i + α_j)) ≥ D_s.
  * The condition is enforced only when the agents are closing: "this safety constraint only needs to be enforced when agents are moving closer to each other" (p.3).
  * Eq. (6), read from the page image of p.3:
    **h_ij(p,v) = √(2(α_i + α_j)(‖Δp_ij‖ − D_s)) + (Δp_ijᵀ/‖Δp_ij‖) Δv_ij**
* **Linear constraint (eq. 7, p.4, from the page image)**
  * −Δp_ijᵀ Δu_ij ≤ γh_ij³‖Δp_ij‖ − (Δv_ijᵀΔp_ij)²/‖Δp_ij‖² + ‖Δv_ij‖² + (α_i + α_j) Δv_ijᵀΔp_ij / √(2(α_i + α_j)(‖Δp_ij‖ − D_s)).
  * This is ḣ + γh³ ≥ 0 multiplied by ‖Δp‖. It is "a linear constraint in ui and uj" (p.4), written A_ij u ≤ b_ij.
* **Obstacles (p.4)**
  * "When bounded with circles, the obstacles can be treated as agents with no control inputs."
  * h̄_ik(p,v) = √(2α_i(‖Δp_ik‖ − (D_s/2 + R_k))) + (Δp_ikᵀ/‖Δp_ik‖) Δv_ik (page image p.4). The obstacle has radius R_k and centre p_k, and "obstacle k is assumed to be moving at a constant velocity" (p.4).
  * Only the robot's α_i appears, because the obstacle does not brake.
  * The paper gives no separate linear constraint for h̄_ik; it says only "similar to (6)".
* **Centralised QP (eq. 9, p.4):** min Σ‖u_i − û_i‖² subject to A_ij u ≤ b_ij and ‖u_i‖∞ ≤ α_i. The controller "only modifies its behavior when collisions are truly imminent" (p.4).
* **Reduced neighbourhood (eq. 10, Thm III.2, p.5):** the radius D_N^i depends on α_i, α_min, α_max, β_i, β_max and γ. Beyond it, no constraint is needed.
* **Decentralised (Sec. IV, p.6)**
  * b_ij is split in proportion α_i/(α_i + α_j), giving a per-agent QP (12) and Thm IV.1.
  * Interventions "have to happen earlier than the centralized case due to the lack of central coordination" (p.6).
  * "For more details about decentralized safety barrier certificates for heterogeneous multirobot systems, we refer the reader to [22]". [22] is E5b.
* **Relaxed ZCBF (Sec. V, pp.7–8)**
  * The condition becomes ḣ ≥ −k_r(t)κ(h) with k_r(t) ∈ [1, ∞) continuous. Thm V.1 shows forward invariance is kept.
  * k_r is a QP decision variable, penalised by c_K‖K_r − K̂_r‖² (eq. 13).
* **Guaranteed feasibility (Sec. VI, pp.8–9)**
  * The problem: "the admissible control space might become empty in extreme scenarios, where the QP-based controller becomes infeasible" (p.8).
  * The fix:
    * A more conservative "braking-mode" barrier ĥ_ij (eq. 15) brings each agent to zero *absolute* velocity. It uses the midpoints of the braking segments (Lemma VI.1).
    * A hybrid braking controller (17): u_i = u_i* if the QP (16) is feasible; else −α_i v_i/‖v_i‖ if v_i ≠ 0; else 0.
    * Thm VI.2: an agent that starts safe stays safe.
  * The cost: "the guaranteed feasible safety barrier certificates reduce the size of the admissible control space to ensure the existence of feasible control actions" (p.9).
* **Deadlock (Sec. VII, pp.10–12)**
  * An LP measures the width of the feasible set.
  * Deadlocks are classified into Types 1–3.
  * A consistent "traffic-rule" perturbation gives clockwise motion (Algorithm 1). Type 3 is not resolved.

**Experiments & key quantitative results (exact, with page):**
* Centralised simulation (pp.5–6): 20 double-integrator robots swap positions on a circle with a PD nominal controller. "The safety distance Ds = 10" (Fig. 3 caption, p.6; no units given). The results are qualitative.
* Table II (p.7), computation time per iteration (ms):

  | Certificate | N = 20 | N = 60 | N = 100 |
  |---|---|---|---|
  | Centralized with neighborhood | 11.8 | 28.8 | 238.3 |
  | Decentralized with neighborhood | 6.00 | 5.99 | 8.05 |

  * Hardware: "All the computations are performed on an Ubuntu laptop with a 2.60 GHz Intel Core i5 processor using the MATLAB quadprog solver." (p.7)
  * "The centralized barrier certificates can handle up to 60 robots with an update rate of more than 30 Hz." "the decentralized barrier certificates can handle more than 100 robots with an update rate of more than 100 Hz" (p.7)
* Two-agent comparison (Figs. 6–7, pp.9–10), D_s = 0.4. Total intervention time:
  * nominal: 4.5 s
  * relaxed: "the total time of intervention is 2.9 s"
  * feasible: 5.4 s (Fig. 7 caption, p.10)
* Table III (p.10):

  | Certificate | Guaranteed safety | Guaranteed feasibility | Admissible space |
  |---|---|---|---|
  | Nominal | ✓ | × | Standard |
  | Relaxed | ✓ | × | Enlarged |
  | Feasible | ✓ | ✓ | Shrunken |

* Hardware experiments (Sec. VIII, pp.12–13) on Khepera III robots:
  * eight robots swap positions in a confined workspace (Fig. 11);
  * five robots fly a leader–follower formation among static obstacles (Fig. 12);
  * "A diffeomorphism controller similar to [34] is used to approximate the unicycle dynamics of the robots with double integrator dynamics." (p.13)
  * Results are trajectories and snapshots only. No metrics are reported.

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated by the authors:
  * The admissible set may be empty as N grows (p.4).
  * Decentralised certificates are more conservative (pp.6–7).
  * The feasible certificate shrinks the admissible set (p.9).
  * Type 3 deadlocks are not resolved, and "livelock might still exist even if deadlock is resolved" (p.12).
* We observe:
  * True positions and velocities are assumed known. There is no estimation error, measurement noise, sensing latency or sampled-data/ZOH analysis; the guarantee is continuous-time.
  * The setting is 2-D only.
  * Obstacles have constant velocity and no acceleration bound.
  * h is undefined (square root of a negative number) when ‖Δp‖ < D_s, and its derivative is singular at ‖Δp‖ = D_s (the 1/√ term in eq. 7). The paper does not discuss this.
  * *Robustness* here is only the recalled ZCBF property that "the ZCBF will force the states back to the safe set C when violation occurs" (p.8, citing [26]). No new robustness result is proved.
  * Barriers are time-invariant: D_s is constant.

**Relation to DART:**
* **Exact comparison with DART's default braking CBF** (`dart_cbf_filter.m`, lines 67–79; method doc eq. `cbfb`).
  * Mapping, with DART's r = ĉ − p_q and v_r = v̂_o − v_q: Wang's Δp_ik = p_i − p_k = −r and Δv_ik = −v_r, so (Δp_ikᵀ/‖Δp_ik‖) Δv_ik = rᵀv_r/‖r‖ = −v_c.
  * Hence **Wang's obstacle barrier h̄_ik (p.4) is exactly DART's h_b = √(2a_b s) − v_c**, with α_i → a_b and (D_s/2 + R_k) → d(t) = ρ + d_s + β_s σ(t). Here ρ plays the role of R_k, d_s that of D_s/2, and β_s σ(t) is new.
  * This mapping is printed directly in the T-RO paper. DART no longer needs the "set α_j = 0" derivation that was required with E5b.
  * Dividing Wang's eq. (7) by ‖Δp‖, with u_k = 0, gives DART's row (our derivation, checked line by line against the code):
    * left side: r̂ᵀa;
    * class-K term: γh³‖Δp‖ → αh;
    * centripetal term ((‖Δv‖² − (ΔvᵀΔp)²/‖Δp‖²)/‖Δp‖) → ‖v_r⊥‖²/‖r‖ (code: `vperp2/nr`);
    * braking term (α_i ΔvᵀΔp/(‖Δp‖√…)) → −a_b v_c/√(2a_b s).
  * DART adds three terms: −a_b ḋ/√(2a_b s), −ā_o and −δ_a.
  * I found no sign or term error in the code relative to Wang.
* **Differences (all of them DART extensions or design choices, not taken from Wang):**

  | Item | Wang T-RO 2017 | DART |
  |---|---|---|
  | class-K | κ(h) = γh³ (eq. 3, p.3) | linear αh (`cfg.cbf.alpha = 3.0`) |
  | braking accel. | α_i = the robot's own ∞-norm accel. limit | design value a_b = `cfg.sched.a_b` = 4.0, shared with the scheduler |
  | clearance | constant D_s/2 + R_k | time-varying d(t); adds −a_b ḋ/√(2a_b s) |
  | obstacle motion | constant velocity | constant-velocity estimate; worst-case unmodelled acceleration ā_o and tracking error δ_a subtracted |
  | state | true state | estimated relative state; error covered by d(t) |
  | singularity / inside the set | not discussed | s clamped at s_min = 0.05 m; inside, the right side is capped at −a_b (push-out) |
  | infeasibility | braking-mode barrier + hybrid braking controller with a proved guarantee (Sec. VI) | soft slack, weight 1e4; no feasibility guarantee |
  | time base | continuous | sampled at f_c with zero-order hold (covered by neither paper) |
  | barrier type | time-invariant h(x) (Thm [26]) | h depends on t through d(t); Wang's theorem does not cover this as stated |

* **Observation (code and config, judged against Wang's Def. II.2 validity condition):**
  * On the boundary h_b = 0 with v_⊥ = 0 and ḋ ≥ 0, DART's row requires r̂ᵀa ≤ −(a_b + ā_o + δ_a) − a_b ḋ/v_c.
  * The defaults are a_b = 4.0, δ_a = 0.3, ā_o = 0 (0.3 in the dynamic scenario), and a per-axis box |a_x|, |a_y| ≤ 4.0, |a_z| ≤ 3.0 (`cfg.mpc.a_max`).
  * So the row **cannot be satisfied when r̂ is aligned with an axis**: 4.3 m/s² is needed but at most 4.0 is available. Head-on approaches along x are exactly the default geometry.
  * Consequences:
    * sup_u[ḣ + αh] ≥ 0 fails at the boundary, so h_b is not a valid ZCBF there in Wang's sense;
    * the slack takes over, and h ≥ 0 is not formally invariant.
  * Wang avoids this by using α_i equal to the actual limit, with no extra terms.
  * Suggested fix (for the caller to decide): choose a_b ≤ min-axis a_max − ā_o − δ_a, for example 3.7 (or 3.4 with ā_o = 0.3; 2.7 if r̂ can be vertical).
  * The method doc's remark «r̂ᵀa ≲ −a_b, khả thi khi a_b không vượt khả năng giảm tốc» omits the ā_o + δ_a + a_b ḋ/v_c margin.
* **What Wang does NOT do that DART does:**
  * estimation uncertainty and latency (d(t) growing with covariance);
  * a link between the barrier and *when to perceive*. In DART the scheduler keeps the same stopping inequality valid over an open-loop interval; h_b ≥ 0 is DART's stopping condition with T_open = 0.
  * 3-D UAV dynamics with an inner attitude loop (δ_a).
* **Where Wang is stronger than DART:**
  * formal feasibility guarantee (Sec. VI);
  * multi-agent decentralisation with a proof (Thm IV.1);
  * deadlock handling;
  * hardware experiments.
* **What is new in the T-RO paper compared with E5b** (ACC 2016 *heterogeneous* paper, arXiv:1609.00651, notes in `g4_cbf.md`). The T-RO paper does not call itself a journal version of E5b. It positions itself as extending [20] (Borrmann et al. 2015), [21] (CDC 2016) and [22] (= E5b): "The results in this paper extend and generalize these previous ideas by supporting a non-conservative decentralization of the certificates, guaranteeing that safe controllers do indeed exist by establishing feasibility, and providing approaches for deadlock avoidance." (p.2)
  * *Same in both:*
    * the braking barrier (T-RO eq. 6 = E5b eq. 8);
    * the class-K function γh³ (T-RO eq. 3; E5b eq. 4). **There is no different α.**
    * the α_i/(α_i + α_j) decentralisation;
    * the neighbour-disk idea.
  * *New in T-RO:*
    * (a) the explicit static/moving obstacle barrier h̄_ik (p.4);
    * (b) the neighbourhood radius with speed limits β and Thm III.2 (p.5);
    * (c) a formal decentralised safety theorem (Thm IV.1, p.6), complexity analysis (Table I) and timing (Table II, p.7);
    * (d) the relaxed ZCBF k_r(t) (Sec. V);
    * (e) guaranteed feasibility via the braking-mode barrier and hybrid braking controller (Sec. VI);
    * (f) deadlock detection and resolution (Sec. VII);
    * (g) new experiments: 8 Khepera robots swapping, and a 5-robot formation among obstacles. E5b used 3 Khepera robots and 1 Magellan.
  * *Robustness:* nothing new. T-RO only recalls asymptotic stability of C from [26] (pp.3, 8). It also claims ZCBFs give "both invariance and robust stabilization of the safe set" compared with reciprocal barriers (p.2).
  * *Only in E5b, not repeated in T-RO:*
    * Lemma 4.3: conservative estimates of unknown neighbour acceleration limits stay safe, with an online estimator;
    * heterogeneous γ per agent (Lemma 4.1).
* **Which version DART should cite:**

  | DART statement | Cite |
  |---|---|
  | Braking-distance barrier form; only the closing component is regulated | **T-RO** eqs. (5)–(6), p.3 (co-cite E5b eq. 8 if desired) |
  | Obstacle (non-braking, radius R_k, constant velocity) version = DART's h_b with D_s/2 + R_k → d(t) | **T-RO only**, p.4 (h̄_ik) |
  | Linear-in-u row with centripetal term | **T-RO** eq. (7), p.4 |
  | Minimally invasive QP filter | T-RO eq. (9), p.4 (the original CBF-QP is [14] Ames et al. 2014) |
  | ZCBF forward-invariance theorem | the original [26] Xu et al. 2015 (T-RO only recalls it) |
  | «other class-K choices, e.g. γh³» | T-RO eq. (3), p.3 (or E5b) |
  | Infeasibility of CBF-QPs; braking fallback | **T-RO** Sec. VI, pp.8–9 (contrast with DART's slack and MPC braking fallback) |
  | Soft/relaxed CBF | T-RO Sec. V (k_r relaxation; this differs from DART's slack) |
  | Conservative estimates of unknown parameters keep safety | **E5b** Lemma 4.3 only |
  | Real-time cost of CBF-QPs (MATLAB quadprog timings) | T-RO Table II, p.7 |

  * Recommended edit for `DART_method_VI.tex` line 337 (I made no edit): replace «(dạng barrier của \cite{wang2016hetero}, eq.~8, với vật cản không phanh và D_s→d(t))» with a citation of `wang2017` for the obstacle barrier h̄_ik (eq. 6 and p.664), with D_s/2 + R_k → d(t), plus «xem thêm \cite{wang2016hetero}». This needs a new `\bibitem{wang2017}`.

**Citable statements** (claim in our words → page + verbatim quote):
- The safety layer changes the nominal controller only when a collision is imminent. → p.4: "only modifies its behavior when collisions are truly imminent"
- For moving obstacles, braking must remove the relative closing velocity, not the absolute velocity. → p.3: "the relative velocity between two agents needs to be reduced to zero instead of the absolute velocity"
- The constraint is needed only while closing. → p.3: "this safety constraint only needs to be enforced when agents are moving closer to each other"
- Obstacles are agents without control. → p.4: "When bounded with circles, the obstacles can be treated as agents with no control inputs."
- The obstacle barrier assumes a constant-velocity obstacle. → p.4: "obstacle k is assumed to be moving at a constant velocity"
- The braking-barrier condition is linear in the input, so a QP results. → p.4: "the safety barrier constraint can in fact be written as a linear constraint in ui and uj"
- CBF-QPs can become infeasible. → p.8: "the admissible control space might become empty in extreme scenarios, where the QP-based controller becomes infeasible"
- Braking to rest is an always-feasible fallback. → p.9: "The braking mode constitutes an always feasible solution for the agents to safely decelerate to zero velocity"
- The feasibility guarantee costs conservatism. → p.9: "the guaranteed feasible safety barrier certificates reduce the size of the admissible control space to ensure the existence of feasible control actions"
- ZCBF robustness: states return to the safe set after a violation. → p.8: "the ZCBF will force the states back to the safe set C when violation occurs"
- Decentralisation acts earlier. → p.6: "have to happen earlier than the centralized case due to the lack of central coordination"
- Real-time cost (MATLAB quadprog). → p.7: "the decentralized barrier certificates can handle more than 100 robots with an update rate of more than 100 Hz"
- Contribution relative to the earlier papers. → p.2: "supporting a non-conservative decentralization of the certificates, guaranteeing that safe controllers do indeed exist by establishing feasibility"

**Snowball candidates:**
- Borrmann, Wang, Ames, Egerstedt — Control barrier certificates for safe swarm behavior (IFAC ADHS 2015) [20]
- Wang, Ames, Egerstedt — Multi-objective compositions for collision-free connectivity maintenance in teams of mobile robots (CDC 2016) [21]
- Xu, Tabuada, Grizzle, Ames — Robustness of control barrier functions for safety critical control (IFAC ADHS 2015) [26] (the source of the invariance and robustness theorem)
- Ames, Grizzle, Tabuada — Control barrier function based quadratic programs with application to adaptive cruise control (CDC 2014) [14]
- Morris, Powell, Ames — Sufficient conditions for the Lipschitz continuity of QP-based multi-objective control of humanoid robots (CDC 2013) [30]
- Ögren, Leonard — A convergent dynamic window approach to obstacle avoidance (T-RO 2005) [28] (braking to zero velocity for static obstacles)

---

### M1 — On the Implementation of a Primal-Dual Interior Point Method
Sanjay Mehrotra; SIAM J. Optimization, vol. 2, no. 4, pp. 575–601, November 1992; DOI not printed in the PDF (not filled in from memory); pages read: 27/27
* Tables 5.1, 7.1, 8.1, 8.3 and 9.1 were skimmed.
* Table 8.2 (pp.20–21) is image-only and was skimmed from page images.
* The Appendix (pp.25–26) was read.

Status: USE. This is a narrow methods citation for DART's QP solver only and plays no role in the novelty claim.

**Problem & setting:**
* An implementation paper for primal–dual interior-point methods for **linear programming**: (P) min cᵀx subject to Ax = b, x ≥ 0, and its dual (p.1).
* Keywords include "predictor-corrector methods" (p.1).
* Tested on netlib LPs in FORTRAN on a SUN 4/110 (p.18).

**Method (key idea, key equations in words, assumptions):**
* **Procedure AIPM (Exhibit 2.1, pp.3–4, from page images)**
  * Step 1 computes the tangent direction (p_x1, p_π1, p_s1), "the first derivative of primal-dual affine scaling trajectory". This is the affine-scaling predictor and works from infeasible points (residuals ξ_x, ξ_s).
  * Step 2 computes the centering parameter μ^k (Heuristic CENPAR).
  * Step 3 computes, *with the same normal-equation matrix (AD²Aᵀ)*, the combined second-derivative and centering direction: v_i = −2((p_x1)_i(p_s1)_i − μ^k)/s_i^k. "Step 3 combines the computation of a second derivative with that of a centering direction. This saves a forward and a back solve." (p.10)
  * Steps 4–5: step sizes ε_x, ε_s along the second-order Taylor polynomials, separately for primal and dual (Procedure SFSOP, eqs. 4.7–4.8). The search direction is p = ε p1 − 0.5 ε² p2.
  * Step 6: adaptive step factors f_x, f_s (Procedure GTSF).
  * Step 8: accept the step only if the potential function (3.5) decreases; otherwise try three extra trial points.
* **Predictor–corrector as a special case:** "The predictor-corrector method results if we take ... at each iteration" (p.10; the elided text is ε = 1, from the page image). This points to Mehrotra [24], [25] for that variant.
* **Separate primal and dual steps:** "We find that taking different steps in primal and dual spaces generally results in superior performance." (p.10)
* **CENPAR (Exhibit 5.1, p.11, from the page image)**
  * ε_x1 and ε_s1 are the full steps to the boundary along the tangent, capped at 1, computed separately for primal and dual.
  * mdg = (x − ε_x1 p_x1)ᵀ(s − ε_s1 p_s1).
  * **μ^k = (xᵀs/n)·(mdg/xᵀs)^ν**, with ν = 3 in the reported runs (p.18). That is, σ = (μ_aff/μ)³.
  * Steps 4–5: an "error factor" ef; if ef > 1.1 then μ^k ← μ^k / min(ε_x1, ε_s1). This adds centering when infeasibility is shrinking the steps.
  * Table 5.1 (p.13) shows "only a moderate variation in the number of iterations for values of" ν between 2 and 4 (p.12).
* **Step length (Exhibit 6.1, p.14):**
  * The step factor is chosen so that the blocking variable's complementarity product is about (x − p_x)ᵀ(s − p_s)/(n·γ_a), with γ_f = .9 and γ_a = 10 (p.18).
  * The paper rejects fixed factors: "The step factor in the case of primal-dual methods has typically been .995 or .9995"; that practice "limits the asymptotic rate of convergence of the algorithm", and "during the earlier phase of the algorithm it is overly aggressive" (p.12).
* **Starting point (Sec. 7, p.15):** least-squares estimates (7.1), shifted to be positive (7.2–7.3).
* **QP scope:** "The expressions are given in the context of linear programming problems. Extensions to convex quadratic programming are straightforward." (p.7) The QP extension is not developed or tested.
* **Theory:** only the potential-function safeguard is analysed (Appendix: a reduction of .25 per iteration on feasible problems). The heuristics themselves are empirical: "several different heuristics are proposed and their use justified solely on the basis of empirical evidence" (p.6).

**Experiments & key quantitative results (exact, with page):**
* Parameters (p.18, from the page image): ε_exit = 10⁻⁸ on the relative duality gap (8.1), ν = 3, γ_f = .9, γ_a = 10, κ_x = 100·max{s_i⁰}, κ_s = 100·max{x_i⁰}.
* Accuracy: "All the problems were accurately solved to eight digits." (p.18)
* Iterations (abstract, p.1, and pp.2, 23):
  * "approximately 40 percent fewer iterations than the implementation proposed in Lustig, Marsten, and Shanno";
  * about 50% fewer than dual affine scaling;
  * 35% fewer than second-order dual affine scaling;
  * 55% fewer than Gill, Murray and Saunders;
  * 20% fewer than Domich et al.
* The source of the gain: "the contribution due to the use of second derivative is most significant" (p.1).
* Table 9.1 (p.24), total CPU seconds on the SUN 4/110:

  | Solver | Total CPU (s) |
  |---|---|
  | AIPM | 766.20 |
  | OB1 | 1,507.29 |
  | MINOS 5.3 | 2,011.4 |

  The text summarises this as about 2× faster than OB1 and 2.5× faster than MINOS (p.23).
* Examples from Table 8.3 (p.22), AIPM iterations: afiro 7, 25fv47 24.
* The potential-function safeguard was never needed beyond trial points: "additional vectors were never computed and explicit line searches were never performed" (p.5).

**Limitations (stated by authors, with page) / limitations we observe:**
* Stated by the author:
  * The heuristics are justified empirically (p.6).
  * The starting point depends on column scaling and on redundant constraints (p.16).
  * Larger step factors caused instability on problems with unbounded optimal sets (brandy, scfxm1–3, p.14).
  * Warm starting needs more study: "the possibility of solving weighted least squares problems to generate initial points" (p.16).
* We observe:
  * The paper covers LP only. The QP claim is one sentence (p.7).
  * In the paper, predictor–corrector (ε = 1) is a special case; the main algorithm is a Taylor-polynomial step with adaptive ε.

**Relation to DART** (`src/util/dart_qp_solve.m`, used by `dart_mpc.m` and `dart_cbf_filter.m`):
* **Is it a Mehrotra-type predictor–corrector? Yes, in the ε = 1 (predictor–corrector) form.** Checked line by line:
  * *Affine-scaling predictor* (lines 66–68): rc = s∘λ, which is the Newton step with σ = 0, from an infeasible start. This matches AIPM Step 1. I verified the reduced system (H + AᵀDA)dz = −r_d − Aᵀ(D r_p − rc/s), with dλ = D(A dz + r_p) − rc/s and ds = −(rc + s∘dλ)/λ; it is the correct Newton step for the inequality-form QP KKT system.
  * *Centering* (lines 69–71): a_aff is the full step to the boundary, capped at 1; μ_aff = (s + a ds)ᵀ(λ + a dλ)/m; **σ = (μ_aff/μ)³**. This equals CENPAR Step 3 with ν = 3.
  * *Corrector with the second-order term* (lines 73–75): rc = s∘λ + ds_aff∘dλ_aff − σμ, solved with the same Cholesky factor. This matches AIPM Step 3 with ε = 1, since (p_x1)_i(p_s1)_i = Δx_aff∘Δs_aff under the paper's sign convention x̂ = x − f p.
* **Discrepancies with the paper's algorithm** (none is a bug in the PC logic; they matter for how the method is described):
  1. *Problem class.* DART solves an inequality-form convex QP: min ½zᵀHz + fᵀz with Az + s = b, s ≥ 0, and bounds as extra rows. The paper treats standard-form LP and only asserts that the QP extension is straightforward (p.7).
  2. *Algorithm variant.* DART always takes ε = 1, so it has no SFSOP or Taylor-polynomial step search. The paper's headline AIPM uses adaptive ε_x and ε_s.
  3. *Single step length.* DART uses one step length for (z, s, λ); the paper uses separate primal and dual steps (p.10) and separate ε_x1, ε_s1 inside CENPAR. For QP a common step is the usual choice, because H couples the primal and dual residuals; this is my remark, not from the paper.
  4. *Centering heuristic only partly reproduced.* DART omits CENPAR Steps 4–5 (the ef > 1.1 → μ/min(ε) boost for infeasible iterates).
  5. *Fixed step factor.* DART uses a = min(1, 0.99·α_max), so a ≤ 0.99 always and a full step is never taken. The paper's GTSF rule is adaptive, and it explicitly criticises fixed factors (p.12).
  6. *Starting point.* DART uses s = max(b − Az₀, 1), λ = 1, with z₀ supplied by the caller (the previous MPC solution). The paper uses the least-squares start (7.1)–(7.3).
     * Note: the method doc's "có warm start" is a primal-only warm start; s and λ are re-initialised on every solve.
  7. *No globalisation.* DART has no potential-function test (AIPM Step 8), only an iteration cap (60 in the CBF filter, 50 in the MPC). No convergence guarantee carries over; neither does the paper prove one for the heuristic PC step.
  8. *Termination.* DART stops when ‖r_p‖∞ ≤ tol(1 + ‖b‖∞), ‖r_d‖∞ ≤ tol(1 + ‖f‖∞) and **absolute** μ ≤ tol. The paper uses the relative duality gap (8.1) ≤ 10⁻⁸.
  9. *Implementation safeguards not in the paper:*
     * D = min(λ/s, 1e12). When the cap is active, ds = −(sD/λ)(A dz + r_p), so the Newton step no longer removes the primal residual of that nearly active row. This is minor and only happens near convergence.
     * Escalating diagonal regularisation when Cholesky fails, and reg = 1e-10 added to H.
  10. *Code/doc mismatches:*
      * The header says `1 max iterations (best iterate returned)`, but the code returns the *last* iterate.
      * `dart_cbf_filter.m` (line 114) accepts z whenever it is finite and ignores `qi.status`. In an infeasible-start IPM, a status-1 iterate may violate the rows. `dart_mpc.m` (lines 157–161) does check the residuals. The risk is low, because the slacks make the CBF QP always feasible and it is tiny.
* **Is citing [M1] for a convex-QP solver appropriate?** Yes, if phrased as "Mehrotra-type". [M1] is the standard origin of the predictor–corrector with the cubic centering heuristic, and it states that the QP extension is straightforward (p.7). It should not imply that [M1] treats QPs, or that DART reproduces AIPM (adaptive steps, potential safeguard, starting point).
  * Suggested EN wording: «The QPs are solved by a dependency-free primal–dual interior-point method with an infeasible start and a Mehrotra-type predictor–corrector step [M1], applied to the KKT system of the inequality-constrained convex QP: an affine-scaling predictor, the centering parameter σ = (μ_aff/μ)³ of [M1], and a corrector that includes the second-order term Δs_aff∘Δλ_aff, reusing one Cholesky factorization per iteration. [M1] develops the method for linear programming and notes that the extension to convex QP is straightforward; we use a single primal–dual step with a fixed fraction-to-boundary factor of 0.99 and no potential-function safeguard.»
  * Suggested VI wording for `DART_method_VI.tex` line 413: «QP được giải bằng phương pháp điểm trong primal–dual khởi tạo không khả thi với bước predictor–corrector kiểu Mehrotra \cite{mehrotra1992} (predictor affine-scaling, $\sigma=(\mu_{\text{aff}}/\mu)^3$, corrector có số hạng bậc hai), áp dụng cho hệ KKT của QP lồi dạng bất đẳng thức; \cite{mehrotra1992} trình bày cho LP và nêu rằng mở rộng cho QP lồi là trực tiếp. Warm start chỉ cho biến primal.»
  * For a QP-specific reference, the snowball candidate Monteiro, Adler & Resende (1990) covers convex QP. I have not read it.

**Citable statements** (claim in our words → page + verbatim quote):
- The method works from infeasible points. → p.1: "Computations in this approach do not require that primal and dual solutions be feasible."
- It uses second-order (Taylor) information about the primal–dual trajectory. → p.1: "It uses a Taylor polynomial of second order to approximate a primal-dual trajectory."
- The centering parameter is chosen adaptively. → p.1: "An adaptive heuristic for estimating the centering parameter is given."
- The predictor direction is the affine-scaling tangent. → p.3: "find the first derivative of primal-dual affine scaling trajectory"
- One factorization serves both directions. → p.10: "This saves a forward and a back solve."
- Predictor–corrector is the ε = 1 case. → p.10: "The predictor-corrector method results if we take ... at each iteration"
- The extension to convex QP is claimed to be straightforward. → p.7: "Extensions to convex quadratic programming are straightforward."
- Most of the gain comes from the second-order term. → p.1: "the contribution due to the use of second derivative is most significant"
- Fixed step factors limit asymptotic convergence. → p.12: "it limits the asymptotic rate of convergence of the algorithm"
- The heuristics are empirical. → p.6: "their use justified solely on the basis of empirical evidence"

**Snowball candidates:**
- Monteiro, Adler, Resende — A polynomial-time primal-dual affine scaling algorithm for linear and convex quadratic programming and its power series extension (Math. Oper. Res., 1990) [28]
- Mehrotra — On an implementation of primal-dual predictor-corrector algorithms (Asilomar workshop, 1990) [25]
- Lustig, Marsten, Shanno — Computational experience with a primal-dual interior point method for linear programming (TR, 1989) [18]
- Lustig — Feasibility issues in a primal-dual interior-method for linear programming (Math. Prog., 1991) [17]

---

## Group synthesis
- **The T-RO paper (E5) is the right primary citation for DART's default barrier.** Its explicit obstacle barrier h̄_ik (p.4) uses the robot's braking only, an obstacle radius and a constant-velocity obstacle. It equals DART's h_b = √(2a_b s) − v_c under (D_s/2 + R_k) → d(t). E5b remains the citation for heterogeneous gains and conservative parameter estimates.
- **The DART linear row matches Wang's eq. (7)** (divided by ‖Δp‖, with u_k = 0) term by term: centripetal and braking terms. DART's additions are linear α, ḋ, ā_o and δ_a. I found no derivation or sign error in `dart_cbf_filter.m`.
- **The journal version adds** an explicit obstacle barrier, relaxed ZCBFs, guaranteed feasibility (braking-mode barrier + hybrid braking controller), deadlock resolution, timing tables and more hardware experiments. **It does not change** the class-K function (still γh³) or add robustness to estimation error or latency.
- **Neither E5 nor E5b handles** estimation error, sensing latency, sampled-data control, time-varying clearance or perception scheduling. This is exactly the gap DART's d(t) and safety-driven scheduler occupy. DART's time-varying h(t) needs a time-varying-CBF justification that Wang's Thm [26] does not give as stated.
- **Wang's feasibility guarantee (Sec. VI) has no counterpart in DART**, which uses a soft slack. With the default parameters (a_b = 4.0 = a_max,x/y, δ_a = 0.3), DART's row is infeasible on the boundary for axis-aligned approaches. Either lower a_b to at most a_max − ā_o − δ_a, or state that h ≥ 0 holds only approximately (slack).
- **DART's QP solver is a genuine Mehrotra-type predictor–corrector** (affine predictor, σ = (μ_aff/μ)³, second-order corrector, one factorization) in the ε = 1 form. It differs from Mehrotra's AIPM in five ways: a single step length, a fixed 0.99 step factor, no error-factor centering boost, a different starting point, and no potential-function safeguard.
- **Citing Mehrotra 1992 for a convex-QP solver is acceptable** if phrased as «Mehrotra-type predictor–corrector [M1] applied to the QP KKT system». The paper is LP-only but explicitly says the QP extension is straightforward (p.7).
- **Minor code/doc items to fix:**
  - the solver's `best iterate returned` comment (it returns the last iterate);
  - the CBF filter ignores solver status;
  - the method doc's "warm start" is primal-only.
