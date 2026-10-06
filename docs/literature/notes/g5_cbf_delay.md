# Notes — Group 5: CBFs with delay, sampled data, event/self-triggering, learned-perception errors

Reader: subagent g5. All papers obtained from arXiv as PDF, converted with `pdftotext -layout`, and read in full
(including appendices) from the page-tagged text in
`/tmp/claude-0/-home-user-project1/e49c6cfe-c60c-5087-910d-afbdd70f407b/scratchpad/papers/g5_cbf_delay/`.
Page numbers = PDF page numbers (form-feed mapping). Quotes are verbatim from the extracted text (math symbols
may be simplified, e.g. subscripts flattened; hyphenation at line breaks joined). Every arXiv id was checked
against the arXiv API title before download; none needed correcting (F6 title/authors confirmed, see F6).

Sign convention reminder: F3 uses safe set {h <= 0}; all other papers use {h >= 0}.

---

### F1 — Safety-Critical Control with Input Delay in Dynamic Environment
Tamas G. Molnar, Adam K. Kiss, Aaron D. Ames, Gábor Orosz; arXiv:2112.08445v2 (4 Dec 2022); arXiv comment:
"Accepted to the IEEE Transactions on Control Systems Technology (TCST)" (the PDF itself prints no venue);
pages read: 14/14 (incl. Appendices I–II and references).
Status: USE

**Problem & setting:** Continuous-time control-affine system with a constant input delay τ, whose safety
depends on an independently evolving, uncertain environment state e(t) (e.g., a moving obstacle). Goal: provable
forward invariance despite delay and imperfect knowledge/prediction of the environment.

**Method (key idea, key equations in words, assumptions):**
- Environmental CBF (ECBF) H(x,e): CBF condition augmented with the term ∇_e H · ė (Def. 2, Thm 2, p3–p4),
  proved by treating (x,e) as an augmented system.
- Robustness to environment estimation error: if ‖e−ê‖ ≤ ε_e and ‖ė−ė̂‖ ≤ ε_ė (known bounds, eq. 17, p4),
  subtract a Lipschitz-based margin C(ε_e, ε_ė, u) (eq. 20–21, p4); the margin contains ‖u‖ → SOCP, not QP.
- Input delay via predictor feedback: predicted state x_p = Ψ(τ, x, u_t) obtained by forward-integrating the model
  over the delay using the stored input history (eq. 30, p6); enforce the CBF condition at x_p (Def. 3, Thm 3, p6).
  Requires Assumption 1 (the initial input history keeps the system safe over [0, τ], p6).
- Combined (Thm 4, p7): predict both system and environment over the delay (e_p = Γ(τ, e)); robustify against the
  environment prediction error with bounds (eq. 44, p7). For the ACC example the bounds come from an acceleration
  bound ā: ε_ė = āτ, ε_e = āτ²/2 (p8).
- Assumes constant, known delay; worst-case (deterministic) bounds on errors.

**Experiments & key quantitative results (exact, with page):**
- ACC example (Fig. 2, p5): naive controller with measured ŝ1 = s1 + 1 m and v̂1 = v1 + 1 m/s violates safety;
  robustified controller with ε_s = 1.4 m and ε_v = 1.4 m/s stays safe (p5).
- ACC with delay τ = 1 s (Fig. 3, p8): delay-free design violates safety; predictor feedback with constant-speed
  prediction of the lead vehicle violates safety once it brakes; robustified with a_min = a_max = 2.5 m/s² is safe
  (p8). "The price of robustness is slight conservatism" (p8).
- Segway avoiding a moving obstacle (r = 0.2 m, v_obs = 0.5 m/s, p9): with τ = 0.1 s the delay-free design collides
  (Fig. 6, p9–p10); predictor + robust ECBF with obstacle speed underestimated by Δv = 0.05 m/s and bounds
  ε_ė = 0.055 m/s, ε_e = τ ε_ė = 0.0055 m avoids it (Fig. 7, p10). Simulation only ("high-fidelity", p8).

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated: needs known uncertainty bounds, worst-case → conservative (p4, p7); prediction errors grow with delay (p7);
  constant-delay theorems ("could be extended to varying delays", p6); future work on analysis of prediction errors,
  state+input delays (p10).
- Observed: delay is on the INPUT (actuation) channel; measurement/perception latency is not modelled separately
  (the Segway text lumps "sensory, feedback and actuation latencies" into one input delay, p9). Environment state
  is assumed continuously available (estimated) — no sampling/intermittent measurements, no scheduling of
  perception. No probabilistic (covariance) uncertainty; no learned perception.

**Relation to DART:** Closest theory to DART's delay handling and to the "obstacle moves during the latency
window" problem. Supports DART components 2 and 5: propagating the obstacle/environment over a latency interval
and inflating the barrier by the resulting prediction-error bound (their ε_e = āτ²/2 is the deterministic analogue
of DART's covariance-growth inflation d(t)). Gap: F1 assumes continuous (if uncertain) environment information and a
fixed delay on the actuator; DART has *intermittent, variable-latency measurements* of obstacles formed at capture
time and must decide *when* to request the next one. F1 says nothing about perception rate or triggering.
Where F1 is stronger: formal continuous-time invariance proofs (Thms 2–4) and explicit treatment of the input
history; DART's discrete-time CBF rows in MPC + simulation evidence are weaker formally.

**Citable statements** (claim in our words -> page + verbatim quote):
- Delay + moving environment is a distinct safety hazard -> p2: "Delays significantly impact safety in dynamic
  environments, since by the time the control system responds, the environment may change and safety may be
  compromised."
- Typical delay magnitudes -> p2: "it is milliseconds in robotic systems [19], a few tenths of a second in
  automated vehicles [20]"
- Robust ECBF requires known error bounds (worst-case) -> p4: "the approach proposed below is limited to setups
  with known uncertainty bounds, since safety is guaranteed by considering the worst-case scenario."
- Error bounds for perception are usually available as over-approximations -> p4: "conservative over-approximations
  of uncertainty bounds are usually available in practice for many perception, measurement or state estimation
  algorithms"
- Prediction error grows with delay -> p7: "longer prediction (larger delay) typically yields larger prediction
  error x̂p − xp."
- Robustification is conservative -> p7: "the additional terms may lead to conservative behavior where the system
  evolves far away from the safe set boundary."
- Constant-delay theory -> p6: "While the upcoming theorems are stated for constant delay, they could be extended
  to varying delays by using the appropriate predictor."
- Ignoring a 0.1 s delay breaks safety in their Segway case -> p9: "the delay leads to safety violation: the Segway
  collides with the obstacle"

**Snowball candidates:**
- I. Abel, M. Krstić, M. Janković, "Safety-critical control of systems with time-varying input delay" (2021)
- I. Abel, M. Janković, M. Krstić, "Constrained control of input delayed systems with partially compensated input delays" (2020)
- M. Jankovic, "Control barrier functions for constrained control of linear systems with input delay" (2018)
- T. G. Molnár et al., "Safety-critical control of compartmental epidemiological models with measurement delays" (2021)
- A. K. Kiss et al., "Control barrier functionals: Safety-critical control for time delay systems" (2022)
- I. Tezuka, H. Nakamura, "Time-varying obstacle avoidance by using high-gain observer and input-to-state constraint safe CBF" (2020)
- H. Zhu, J. Alonso-Mora, "Chance-constrained collision avoidance for MAVs in dynamic environments" (2019)

---

### F2 — Control Barrier Functions for Sampled-Data Systems with Input Delays
Andrew Singletary, Yuxiao Chen, Aaron D. Ames; arXiv:2005.06418v1 (13 May 2020), arXiv comment "submitted to CDC
2020" (F1 and F3 cite it as 59th IEEE CDC 2020, pp. 804–809); pages read: 6/6.
Status: USE

**Problem & setting:** Continuous plant, zero-order-hold (ZOH) digital controller with period Δt, state uncertainty
(EKF estimate), and a known input delay equal to an integer multiple n of Δt. Safe set handled implicitly with the
backup-controller method (control-invariant set defined by forward-integrating a backup policy).

**Method:**
- Implicit control-invariant set S_I via backup controller flow (eq. 3, 6, p2); for ZOH, the CBF condition is
  enforced robustly over the reachable set R(x0, Δt) within one sample (eq. 9–10, p3; Prop. 1, p3).
- State uncertainty handled through incremental stability (pre-feedback found by an LMI, eq. 11, p4) so the
  uncertainty set can simply be translated along the nominal backup flow (Thm 1, p4) — avoids set integration.
- Input delay (Section IV, p4–p5): store the last n inputs, forward-integrate to the state at which the new input
  will act, x_{(i+n)Δt} = φ^{ū_H}_{nΔt}(x_{iΔt}) (eq. 18), and impose the (unchanged, still affine) CBF constraint
  there (Algorithm 1, Thm 2, Cor. 1, p5). Assumes accurate model (Thm 2) or prediction accurate up to the
  uncertainty set (Cor. 1).

**Experiments & key quantitative results:** ROS-based high-fidelity Segway simulation, EKF state estimate, safe set
‖p‖ ≤ 0.5 m (p5). Fig. 1 (p6) + text: "At 40 Hz, the Segway is able to stay within the set with the nominal
controller, but it is unable to maintain invariance at 20 Hz, or in the presence of an input delay of 30 ms." The
robust barrier maintains safety "over the entire robustness margin" (p6). No tabulated numbers beyond this.

**Limitations:** Stated: robust reachable-set condition "adds conservatism" (Remark 3, p3); future work on
discrete-time CBFs in a nonlinear program (p6). Observed: delay must be a known constant multiple of the period;
uncertainty set is static/known; no environment dynamics/obstacles discovered online; no perception model; the
sampling rate is fixed, not chosen.

**Relation to DART:** Supports DART's delay compensation idea of "propagate to the time the decision takes effect"
and its pose-buffer bookkeeping (DART does the analogous thing on the *measurement* side: update at capture time,
then propagate). It also gives a citable empirical datum that lowering the loop rate (40→20 Hz) or adding 30 ms
delay breaks a nominal CBF. Gap: actuation-side only, fixed rate, no learned perception, no decision about when to
sample. Stronger than DART: formal invariance for ZOH + known delay with an affine constraint.

**Citable statements:**
- Delay rounded to multiple of the period -> p4: "Suppose that the system has a time delay equal to some integer n
  multiple of the controller period ∆t."
- Rounding error can be absorbed into uncertainty -> p4: "rounding of the time-delay can always be made robust with
  an addition to the state uncertainty."
- Delay compensation = open-loop control over the delay -> p5: "one is effectively performing open-loop control
  over the time-horizon of the input delay."
- Nominal CBF fails at lower rate or with delay -> p6: "unable to maintain invariance at 20 Hz, or in the presence
  of an input delay of 30 ms."
- Controller only sees an EKF estimate -> p5: "The true state of the system is not known to the controller, only
  the state estimate from an extended Kalman filter."

**Snowball candidates:**
- T. Gurriet, P. Nilsson, A. Singletary, A. D. Ames, "Realizable set invariance conditions for cyber-physical systems" (2019)
- A. Singletary, T. Gurriet, P. Nilsson, A. Ames, "Safety-critical rapid aerial exploration of unknown environments" (2020)
- T. Gurriet, M. Mote, A. D. Ames, E. Feron, "An online approach to active set invariance" (2018)

---

### F3 — Control Barrier Functions in Sampled-Data Systems
Joseph Breeden, Kunal Garg, Dimitra Panagou; arXiv:2103.03677v2 (16 Jun 2021); journal ref (arXiv): IEEE Control
Systems Letters, vol. 6, pp. 367–372, 2022; pages read: 6/6.
Status: USE

**Problem & setting:** Continuous plant, piecewise-constant (ZOH) control with fixed time step T; state measured
only at sample times t_k = kT. Find a margin function φ(T, x) so that enforcing L_f h + L_g h u_k ≤ φ(T, x_k) at
the samples guarantees invariance between samples ("ZOH-CBF condition", Problem 1, p2).

**Method:** Defines two conservatism metrics: controller margin ν (how much the CBF right-hand side is tightened)
and physical margin δ (how much the safe set effectively shrinks) (Defs 1–2, p2). Proposes:
(i) Lipschitz-based local/global margins using the bound ‖x(kT+τ) − x_k‖ ≤ τΔ (Lemma 3, Thm 1, Cor. 1, p3);
(ii) a margin from the sup of the CBF-condition difference over the reachable set (Thm 2, Cor. 2, p3);
(iii) a margin derived from a discrete-time CBF condition plus a second-derivative (ḧ) bound η (Thm 3, Cor. 3, p4),
proved half as conservative as (i) (Thm 4, p4) and whose physical margin scales quadratically in T.
All conditions are control-affine → QP.

**Experiments & key quantitative results:** Unicycle obstacle avoidance and spacecraft pointing, T = 0.1
(p4–p5). Table I (p5) global controller margins at T = 0.1, unicycle / spacecraft: ν0g = 1.316(10)^50 / 14.20;
ν1g = 570.3 / 2.946; ν2g = 0.6908 / 0.8815; ν3g = 0.1319 / 0.1194. Table II (p5): δ3g,inf = 0.013 (both systems) at
T = 0.1 vs δ1g,inf = 0.54 (unicycle) / 2.0 (spacecraft). Online margin computation times "approximately 0.028,
0.026, and 0.018 seconds" (unicycle) and "0.058, 0.071, and 0.045 seconds" (spacecraft) in MATLAB R2019b (p5).
Narrow 0.3-unit corridor: only φl3/φg3 pass (p6, Fig. 7).

**Limitations:** Stated: local methods need online maximisations that "could limit the applications" in higher
dimensions (p5); future work on higher-order approximations (p6). Observed: fixed, known T; exact state at samples
(no measurement noise, no estimation, no delay); no environment model; T is a parameter, not a decision variable —
although the margin formulas are explicit functions of T and could in principle be inverted to pick T.

**Relation to DART:** Provides the formal argument for why a CBF enforced only at discrete instants must be
tightened by a term growing with the inter-sample time — the same structure as DART's inflation d(t) that grows
with time since the last perception result, and DART's discrete-time CBF rows in the MPC. Gap: F3 tightens for
*actuation sampling* with perfect state; DART's open-loop interval is a *perception* interval with uncertain,
delayed obstacle measurements, and DART chooses the interval adaptively. Stronger than DART: rigorous, provably
less-conservative margins and an explicit physical-margin metric DART could adopt to report conservatism.

**Citable statements:**
- Continuous-time CBF controllers are unsafe when executed in discrete steps -> p1: "One can easily construct
  counter-examples showing that the control laws developed from the CBF condition in [1], [3], [6] are no longer
  safe when the controller is executed in discrete steps."
- Discrete-time CBFs do not guarantee inter-sample safety -> p1: "a controller implemented under discrete-time CBFs
  may not satisfy the continuous safety condition between time steps [8]."
- Sampling effectively shrinks the safe set -> p2: "Intuitively, δ quantifies the effective shrinkage of the safe
  set due to the error introduced by discrete sampling."
- Inter-sample state drift bound -> p3 (Lemma 3): "||x(kT + τ) − xk|| ≤ τ∆"
- Second-order margin scales quadratically with step -> p4: "δ3l, δ3g vary quadratically with T, while δ0g, δ1l, δ1g
  vary only linearly with T."

**Snowball candidates:**
- J. Usevitch, D. Panagou, "Adversarially resilient control barrier functions in sampled-data systems" (2021)
- W. Shaw Cortez et al., "Control barrier functions for mechanical systems: Theory and application to robotic grasping" (2021)
- G. Yang, C. Belta, R. Tron, "Continuous-time signal temporal logic planning with control barrier functions" (2020)

---

### F4 — Safety-Critical Event Triggered Control via Input-to-State Safe Barrier Functions
Andrew J. Taylor*, Pio Ong*, Jorge Cortés, Aaron D. Ames (*equal contribution); arXiv:2003.06963v1 (16 Mar 2020),
arXiv comment "submitted to L-CSS + CDC 2020", DOI 10.1109/LCSYS.2020.3005101; pages read: 6/6.
Status: USE

**Problem & setting:** Event-triggered implementation of a safe state-feedback controller: state sampled at event
times t_i, input held constant between events; the sampling error e(t) = x(t_i) − x(t) is treated as a measurement
error (eq. 3–6, p2). Goal: a trigger law that keeps the safe set invariant AND has a minimum inter-event time
(MIET).

**Method:**
- Uses Input-to-State Safe Barrier Functions (ISSf-BF): ḣ ≥ −α(h) − ι(‖e‖) (Def. 5, p3).
- Shows that the naive transcription of event-triggered stabilisation (trigger when ι(‖e‖) = σ|α(h)|) can have NO
  MIET: counter-example (eq. 19–21, Lemma 1, p3–p4) — near the boundary the error dynamics do not vanish, so
  inter-event times → 0.
- Fix: "strong ISSf barrier property" with a constant d > 0 (Def. 6, p5); trigger law (23) gives safety and MIET
  τ = σd / (L_ι F) (Thm 1, p5), with F a bound on ‖f‖. If h lacks the property, shift h_b = h + b → MIET exists for
  a slightly enlarged set C_b (Thm 2, Cor. 1, p5–p6).

**Experiments & key quantitative results:** Only the 2-D counter-example system (19). Fig. 2 (p6): both triggers
keep the state safe, but "The interevent times of the trigger law (21) approach 0 while the trigger law (23)
satisfies the theoretical bound." No other numbers reported.

**Limitations:** Stated: trade-off — larger enlargement b gives larger MIET (p6); future work on adaptive b and
co-design (p6). Observed: the trigger law (23) is evaluated on e(t) and h(x(t)), i.e. it needs the *current state
continuously* to decide when to update; only the actuation update is saved. This makes it inapplicable as-is to
triggering an expensive SENSOR (DART), where the state/obstacle is unknown between perception results. No delay,
no noise, no estimator.

**Relation to DART:** The canonical "event-triggered + barrier" result and the source of two points DART should
cite: (a) safety-triggering differs from stability-triggering — triggers can accumulate near the boundary, so a
minimum inter-trigger time must be engineered (DART's scheduler needs an analogous lower bound tied to inference
latency/accelerator throughput); (b) ISSf as the language for "inter-sample error degrades safety gracefully".
Gap: actuation-side, continuous monitoring assumed; DART triggers *perception* without continuous monitoring, so it
is necessarily self-triggered/predictive. Stronger than DART: formal MIET guarantee.

**Citable statements:**
- Event-triggering decides when resources incl. sensors are used -> p1: "Event-triggered control provides a
  framework that allows the prescription of, in a principled way, when certain resources (such as actuators,
  sensors, access to communication through a network or with neighboring agents, or even a human) should be
  utilized"
- Safety triggers can fire in rapid succession -> p1: "in the context of safety the dynamics of the system, and thus
  the error dynamics, are not required to vanish as the quantity dictating the triggering of events vanishes. This
  can lead to events occurring in rapid succession."
- Naive safety trigger lacks MIET -> p3 (Lemma 1): "The system (20) with the trigger law defined as in (21) does not
  possess an MIET."
- Trade-off safety margin vs MIET -> p6: "the larger the set is made (via a larger choice of b), the larger the MIET
  will be."

**Snowball candidates:**
- G. Yang, C. Belta, R. Tron, "Self-triggered control for safety critical systems using control barrier functions" (2019) [read as F8]
- W. P. M. H. Heemels, K. H. Johansson, P. Tabuada, "An introduction to event-triggered and self-triggered control" (2012)
- P. Tabuada, "Event-triggered real-time scheduling of stabilizing control tasks" (2007)
- P. Ong, J. Cortés, "Event-triggered control design with performance barrier" (2018)
- S. Kolathaya, A. D. Ames, "Input-to-state safety with control barrier functions" (2018/2019)

---

### F5 — Guaranteeing Safety of Learned Perception Modules via Measurement-Robust Control Barrier Functions
Sarah Dean, Andrew J. Taylor, Ryan K. Cosner, Benjamin Recht, Aaron D. Ames; arXiv:2010.16001v1 (30 Oct 2020); the
PDF does not print the venue (F1 cites it as CoRL, PMLR vol. 155, 2021, pp. 654–670); pages read: 17/17 (main
paper p1–p10 and Appendices A–E p11–p17).
Status: USE

**Problem & setting:** State observed only through a complex measurement y = p(x) (e.g., an image) and a learned
inverse map q̂ giving x̂ = x + e(x); deterministic error with e(x) ∈ E(y), ‖e‖ ≤ ε(y) (eq. 7–8, p3–p4).

**Method:**
- Measurement-Robust CBF (MR-CBF): CBF condition evaluated at x̂ minus a(y) + b(y)‖u‖ (Def. 3, p4).
- Thm 2 (p5): with Lipschitz constants of L_f h, L_g h, α∘h, choosing a = ε(L_Lfh + L_α∘h), b = ε L_Lgh guarantees
  safety of the true state; resulting controller is an SOCP (MR-OP, p5; conversion in App. B, p12), with a slack
  version that is locally Lipschitz (App. C, p12–p14).
- Tolerable perception error (eq. 16–17, Thm 3, p5–p6) and a data-density condition for training a
  non-parametric perception map (Def. 4, Cor. 1, p6–p7; probabilistic motivation via Nadaraya-Watson in App. D).

**Experiments & key quantitative results:** Simulated Segway (ROS), pitch-angle safe set (eq. 22, p7).
(i) Synthetic worst-case offset ε = 0.2 on pitch: standard CBF-QP unsafe, MR-OP safe (Fig. 1, p7).
(ii) Learned perception: virtual camera, "15 Hz video feed" (p8); kernel ridge regression on "800 labelled images"
with labels corrupted by Gaussian noise of standard deviation 0.1 (p8); MR-OP with ε = 0.2 safe, CBF-QP unsafe;
"The state estimates for each trajectory had a maximum error of 0.183 and 0.201 respectively." (Fig. 2, p8).

**Limitations:** Stated: pointwise error bounds are not what ML usually provides (p6); extending the probabilistic
bound from pointwise to a compact set "is nontrivial" (p15); future work on noise, data acquisition, Lipschitz
properties and "non-invertible observation models such as dynamic estimators (Kalman filters)" (p8). Observed:
perception is assumed instantaneous and continuous (15 Hz video but analysis is continuous-time, no latency, no
sampling); memoryless estimator (no filtering); deterministic bounded error; Lipschitz constants estimated by
gridding (p7) — conservative and hard to scale.

**Relation to DART:** Foundational reference for "learned perception error enters the CBF as an inflation term"
(DART component 5 and the covariance-inflated radii in component 4). DART's affine/scale depth error → sphere
centre/radius covariance is a concrete instance of E(y). Gap: no latency, no rate, no temporal propagation of the
perception error between frames, no triggering; DART's contribution is precisely the *time dimension* (error growth
between infrequent, delayed frames and choosing when to refresh). Stronger than DART: formal guarantee linking
perception error bound to safety and to training-data density.

**Citable statements:**
- Learned-perception error modelled as bounded state error -> p4: "we assume that while e(x) is not known for a
  particular value of x, it is known that e(x) ∈ E(y) for a measurement dependent, compact pointwise set E(y)."
- Smaller error recovers the nominal CBF -> p5: "as ε(y) becomes smaller, the level of robustness required by an
  MR-CBF approaches that of a regular CBF"
- MR-CBF filter is an SOCP -> p5: "This problem is in fact a second-order cone program (SOCP)"
- ML gives mean, not worst-case, errors -> p6: "providing pointwise bounds on errors as in (18) is often not the
  focus of machine learning analyses, which favor a mean-error perspective."
- Filters/estimators left as future work -> p8: "strategies for non-invertible observation models such as dynamic
  estimators (Kalman filters)."

**Snowball candidates:**
- R. K. Cosner et al., "Measurement-robust control barrier functions: Certainty in safety with uncertainty in state" (2021)
- S. Dean, N. Matni, B. Recht, V. Ye, "Robust guarantees for perception-based control" (2019/2020)
- F. Laine, C.-Y. Chiu, C. Tomlin, "Eyes-closed safety kernels" (2020) [read as F9]
- R. Takano, M. Yamakita, "Robust constrained stabilization control using CLF and CBF in the presence of measurement noises" (2018)

---

### F6 — Input-to-State Safety with Input Delay in Longitudinal Vehicle Control
Tamas G. Molnar, Anil Alan, Adam K. Kiss, Aaron D. Ames, Gábor Orosz; arXiv:2205.14567v2 (18 Nov 2022); arXiv
comment "Accepted to the 17th IFAC Workshop on Time Delay Systems" (venue not printed in PDF); pages read: 6/6
(incl. Appendix A proof).
Status: USE (title verified: the task's short title "Input-to-State Safety with Input Delay" is completed by
"in Longitudinal Vehicle Control"; authors as listed here; arXiv id correct — no ID change).

**Problem & setting:** Time-varying control-affine system with both input delay τ and bounded input disturbance
d(t) (eq. 2, 27); application: connected automated truck following a connected lead vehicle with powertrain delay.

**Method:** Combines predictor feedback (CBF evaluated at predicted state x_p = x(t+τ), Def. 2, Thm 2, p3) with
tunable input-to-state-safe CBFs (TISSf-CBF): ḣ ≥ −α(h) + σ(h)‖L_g h‖² (Def. 3–4, Thm 3–4, p4–p5) giving
invariance of an enlarged set S_δ whose size depends on the disturbance bound δ (eq. 22–26, p4). Prediction
errors (unknown future lead acceleration, unknown disturbance) are absorbed as an effective disturbance
d̂ = d + û(t−τ) − u(t−τ) (Remark 1, p5). Proof in App. A (p6).

**Experiments & key quantitative results:** Table 1 (p4): τ = 0.5 s, A = 0.4 1/s, B = 0.5 1/s, D_st = 5 m,
κ = 0.5 1/s, v_max = 20 m/s, D_sf = 3 m, T = 2 s, σ0 = 1, λ = 0.3 1/m, unmodelled lag ξ = 0.25 s. Fig. 1 (p1, p4):
emergency braking — no-predictor controller unsafe, predictor controller safe. Fig. 3 (p5): with disturbance,
delay-as-disturbance design "yields small safety violations with large control effort", predictor design "uses
significantly smaller control input while keeping the system safe" (p5). Results qualitative (plots), MATLAB code
linked (p5).

**Limitations:** Stated: ISSf permits (small) safety violations (Remark 2, p5); future work: state delays,
disturbance observers (p6). Observed: constant known delay on input; scalar 1-D longitudinal case; no sampling,
no perception, no obstacle discovery.

**Relation to DART:** Supports the design choice of *compensating* latency by prediction rather than treating it as
a disturbance (DART's capture-time update + forward propagation vs. a naive "inflate for worst-case delay"
baseline) — useful for the ablation narrative. Also gives the ISSf view of residual prediction error, matching
DART's covariance-based inflation. Gap: actuator delay only, no perception, no rate decision.

**Citable statements:**
- Delay and disturbance combined were not handled before -> p1: "their combined effect has not yet been addressed
  in safety-critical control — only Seiler et al. (2022) approached this problem by treating the delay as part of
  the disturbance."
- Prediction errors become an effective disturbance -> p5: "The discrepancy contributes to the disturbance and
  yields the effective disturbance"
- Predicting beats treating delay as disturbance -> p5: "Control effort and safety violations can be significantly
  decreased by predictors that estimate xp(t) better than x(t)"
- ISSf allows bounded violations -> p5: "Input-to-state safety allows for safety violations, but they can be made
  arbitrarily small with large enough σ(h) and control effort."

**Snowball candidates:**
- A. Alan, A. J. Taylor, C. R. He, G. Orosz, A. D. Ames, "Safe controller synthesis with tunable input-to-state safe control barrier functions" (2022)
- P. Seiler, M. Jankovic, E. Hellstrom, "Control barrier functions with unmodeled dynamics using integral quadratic constraints" (2022)
- M. Jankovic, "Robust control barrier functions for constrained stabilization of nonlinear systems" (2018)

---

## Search for sensor-side (perception) triggering with CBF guarantees — screening log

arXiv API queries run (titles screened, then abstracts of plausible hits):
`abs:"self-triggered" AND abs:"control barrier"`; `abs:"event-triggered" AND abs:"control barrier"` (40 results);
`... AND abs:sensing`; `abs:"control barrier" AND abs:"sensor scheduling"`; `... "measurement scheduling"`;
`... "intermittent"`; `... "perception" AND "trigger"`; `abs:"barrier" AND "self-triggered" AND "measurement"`;
`abs:"barrier" AND "event-triggered" AND "estimation"`; `abs:"safety" AND abs:"when to sense"`;
`abs:"event-triggered sensing"`; `abs:"control barrier" AND "active perception"`; `... "sampling rate"`; and others.
Finding: no arXiv paper found that triggers a learned perception module/sensor based on a CBF-derived risk with
latency. Closest hits chosen:
- **F7 (2304.00194)** — learned perception map + MR-CBF + self-triggered sampling of the perception estimate: the
  only hit that couples learned-perception error, CBFs and a trigger time.
- **F8 (1903.03692)** — self-triggered CBF: computes a "safe period" up to which the system can run open-loop on
  the last measurement; in self-triggered control the next measurement is only needed at that time. This is the
  closest formal analogue of DART's "maximum safe open-loop time".
- **F9 (2005.07144)** — not a CBF/triggering paper, but the closest treatment of "how long/where can I stay safe
  WITHOUT new observations of an obstacle", including obstacles beyond sensing range (DART's frontier term). Chosen
  for the scheduler's open-loop-safety concept; marked accordingly.
Screened and not chosen (reason from abstract): 2304.08685 Bahati/Ong/Ames "Sample-and-Hold Safety with CBFs"
(time-/event-triggered *actuation* sample-and-hold; good snowball for actuator side); 2302.12435 Kishida (execution
decisions for control updates, CLF-CBF); 2209.13053 / 2203.12089 / 2306.01871 / 2203.13147 Sabouni et al.
(event/self-triggered CBF-QPs for CAVs to reduce QP infeasibility / V2V communication, not sensing);
2103.15874 and 2408.16144 (triggering *model learning* updates); 1804.04345 Kim et al. (when agents must
communicate for safety — communication, not perception); 2402.16449 (LiDAR+D-CBF obstacle avoidance, no triggering
in abstract).

---

### F7 — Safe Perception-Based Control under Stochastic Sensor Uncertainty using Conformal Prediction
Shuo Yang, George J. Pappas, Rahul Mangharam, Lars Lindemann; arXiv:2304.00194v2 (25 Aug 2023); arXiv comment
"accepted by IEEE CDC 2023" (venue not printed in PDF); pages read: 15/15 (incl. Appendix proofs p13–p15).
Status: USE (chosen: only screened paper combining learned perception error, CBF, and a trigger/sampling-time rule)

**Problem & setting:** Continuous-time control-affine system with bounded dynamics ‖F(x,u)‖ ≤ F̄ (p3); state seen
only via high-dimensional noisy measurements y = p(x, δ) with unknown noise distribution; a learned perception map
x̂ = q̂(y) (MLP in the case study). Goal: Prob(x(t) ∈ C, ∀t ∈ T) ≥ 1 − α (Problem 1, p4).

**Method:**
- Conformal prediction on a calibration set over an ε-net of the workspace gives a high-probability bound on the
  perception error: Prob(e(x,t) ≤ sup_j Ē_xj + (L_p L_q̂ + 1)ε) ≥ 1 − α (Prop. 1, p6).
- Sampled-data controller: at trigger time t_i solve a QP with the MR-CBF constraint (eq. 5–8, p6–p7), hold input.
- Trigger rule (eq. 9, p7): t_{i+1} = t_i + (Δ − sup_j Ē_xj − (L_p L_q̂ + 1)ε)/F̄ — the time until the true state can
  have drifted a distance Δ from the last perceived state, given the perception-error bound and max speed F̄.
  MR-CBF margins a = (L_Lfh + L_β∘h)Δ, b = L_Lgh Δ (Thm 1, p7). Per-interval guarantee ≥ 1 − α (Thm 1); over
  [0, T): ≥ (1 − α)^m with m intervals (Prop. 2, p7).
- Observation: because Δ, the error bound and F̄ are constants, the inter-trigger time from (9) is a constant —
  effectively a principled *periodic* rate, not state-dependent triggering.

**Experiments & key quantitative results:** F1/10th car, 2-D LiDAR with 64 rays, exponential noise with λ = 2/3
(p8); training set 4 × 10^5 points, calibration 1.25 × 10^4 (p8); hallway CBF h = min{p_x, 1.5 − p_x} (p8).
α = 0.25, computed ϵ′ = 0.34, chosen Δ = 0.35; runtime 75% quantile score 0.32 < ϵ′ (p9). Over 100 traces of
T = 30 s: "the safety rate of sampled-data measurement robust CBF is 93%, which is significantly higher than vanilla
non-robust CBF case (16%)." (p9; Fig. 5 caption p10).

**Limitations:** Stated: memoryless perception map — "the perception map only depends on current observation, which
might limit its accuracy" (p9); velocities/Kalman filtering left for future work (Remark 1, p4); Lipschitz-based
bound may be conservative (Remark 2, p6). Observed: no perception latency (measurement used instantly at t_i);
known static map (walls) rather than discovered obstacles; constant trigger interval; the (1 − α)^m bound degrades
with the number of samples, so the horizon-level guarantee weakens as perception gets more frequent — an odd
incentive the paper does not discuss; requires a simulator-oracle for calibration data at fixed states (p5).

**Relation to DART:** Closest prior work to DART's perception–safety coupling: it derives a sampling interval for a
*learned perception module* from (perception error bound, motion bound, CBF margin). DART goes beyond it in exactly
the dimensions F7 omits: (i) inference latency and capture-time updates; (ii) temporal filtering (KF with
constant-velocity/stationary models) so error grows as a covariance rather than a fixed bound; (iii) a
*state/scene-dependent* trigger (braking distance, closing speed, frontier) instead of a constant interval;
(iv) unknown obstacles and sensing-range limits; (v) compute/energy accounting. F7 is stronger on distribution-free
probabilistic calibration of perception error (conformal prediction), which DART could adopt to justify its depth
error model. F7 is a natural "fixed-rate, error-bound-derived" baseline for DART's scheduler.

**Citable statements:**
- Self-triggering used to avoid stochastic calculus -> p1: "Our controller uses idea from self-triggered control and
  enables us to avoid using stochastic calculus."
- Trigger interval trades robustness for update frequency -> p7: "Naturally, larger ∆ lead to less frequent control
  updates, but will require more robustness and reduce the set of permissible control inputs in KCBF (y)."
- Bounded-dynamics assumption used for the trigger -> p3: "We assume that the dynamics in (1) are bounded, i.e., that
  there exists an upper bound F̄ such that ∥F (x, u)∥ ≤ F̄"
- Empirical safety rates -> p9: "the safety rate of sampled-data measurement robust CBF is 93%, which is
  significantly higher than vanilla non-robust CBF case (16%)."
- Memoryless perception limitation -> p9: "the perception map only depends on current observation, which might
  limit its accuracy in some cases."

**Snowball candidates:**
- R. K. Cosner et al., "Measurement-robust control barrier functions: Certainty in safety with uncertainty in state" (2021)
- R. K. Cosner et al., "Self-supervised online learning for safety-critical control using stereo vision" (2022)
- G. Chou, N. Ozay, D. Berenson, "Safe output feedback motion planning from images via learned perception modules and contraction theory" (2022)
- D. R. Agrawal, D. Panagou, "Safe and robust observer-controller synthesis using control barrier functions" (2022)
- L. Lindemann et al., "Safe planning in dynamic environments using conformal prediction" (2022)
- A. Dixit et al., "Adaptive conformal prediction for motion planning among dynamic agents" (2022)
- L. Cothren, G. Bianchin, S. Dean, E. Dall'Anese, "Perception-based sampled-data optimization of dynamical systems" (2022)

---

### F8 — Self-triggered Control for Safety Critical Systems using Control Barrier Functions
Guang Yang, Calin Belta, Roberto Tron; arXiv:1903.03692v1 (8 Mar 2019) (PDF prints no venue; F4 cites it as American
Control Conference (ACC) 2019, pp. 4454–4459); pages read: 7/7.
Status: USE (chosen: formal "safe period" = maximum open-loop time before the next measurement/update)

**Problem & setting:** Continuous-time control-affine system with CLF (stability) and ECBF (safety, higher relative
degree) constraints implemented with ZOH; choose the next update instant so that constraints hold between updates
without fixed-rate sampling.

**Method:** At t_k solve the CLF-CBF QP (eq. 12, p3). Bound trajectory deviation under the held input with a
Lipschitz/comparison argument, r(t) = r0 e^{L(t−t_k)} − (1/L)‖f + g u_k‖ (Prop. 1, eq. 15, p3), use it to lower-bound
the ECBF constraint ζ(t) along the interval (eq. 17, p4), and define the "safe period" τ_CBF as the root of that
lower bound (Def. 4, p3; eq. 18, p4: min over constraints). A CLF update period τ_CLF from a second-order upper
bound on V (eq. 20–21, p4). Next update t_{k+1} = t_k + min(τ_CBF, τ_CLF) (Algorithm 1, p5). Non-Zeno near the
equilibrium (Prop. 2, p4). No explicit integration of dynamics required.

**Experiments & key quantitative results:** Double integrator with box constraints on position and velocity
(Table I, p6: x0 = [6, 5]^T, bounds ±10, ε = 0.8, L = 1, K_b = [105 20.5], u ∈ [−20, 20], periodic baseline t_p =
0.75). QP solve "around 0.0019s" (p6). Self-triggered updates densify near the unsafe region (p6); "the CLF update
period converges to 0.3166s" (p6); periodic controller: "the position x1 violates x1,min constraint for t ∈ [3, 4]"
(p6).

**Limitations:** Stated: lower/upper bounds "might not be trivial" for general nonlinear systems; relies on an
accurate model; future work on quadcopters and disturbances (p6). Observed: exact state at update times (no
measurement noise/estimation, no latency); only a linear toy example; static constraints, no environment dynamics;
the Lipschitz exponential bound can be very conservative for longer horizons.

**Relation to DART:** The safe period τ_CBF is the closest formal analogue of DART's "maximum safe open-loop time"
(DART component 3): both compute, at the last information instant, the time after which constraint satisfaction
can no longer be certified, and schedule the next update then. F8 shows the self-triggered pattern (decide the next
sampling instant from the current measurement), which is the right paradigm for sensing because it needs no
continuous monitoring (contrast F4). Gap: F8 triggers *control updates* with a perfectly known state; DART triggers
*perception* whose result arrives after a latency, with estimation covariance growth, moving/unseen obstacles, and
energy cost. DART must also subtract inference latency from the safe period (request must be issued τ_inf earlier),
which F8 does not consider. Stronger than DART: formal guarantee of constraint satisfaction over the period and a
non-Zeno result.

**Citable statements:**
- Self-triggered = choose next update from current measurement -> p1: "it determines the next controller update
  time instance based on current sensor measurements and mission requirements."
- Fixed-rate updates are both unsafe and wasteful -> p1: "First, given a fixed update period, there is no guarantee
  that the safety constraints will hold." and "there are unnecessary computations and control updates due to
  fixed-time sampling."
- Definition of safe period -> p3: "if there exists a τCBF such that x(tk + τCBF) ∈ Int(C) under a constant control
  input uk, then [tk, tk + τCBF] is the safe time window for the system at tk"
- Updates densify near the boundary -> p6: "the update interval for self-triggered controller becomes a lot faster
  as the system approaches to the unsafe region"
- Periodic baseline violates constraints -> p6: "In the periodic controller case, the position x1 violates x1,min
  constraint for t ∈ [3, 4]."

**Snowball candidates:**
- A. Anta, P. Tabuada, "To sample or not to sample: Self-triggered control for nonlinear systems" (2010)
- M. Mazo, P. Tabuada, "Input-to-state stability of self-triggered control systems" (2009)

---

### F9 — Eyes-Closed Safety Kernels: Safety of Autonomous Systems Under Loss of Observability
Forrest Laine, Chih-Yuan Chiu, Claire Tomlin (as printed in the PDF; arXiv metadata spells "Chiu-Yuan Chiu");
arXiv:2005.07144v2 (16 May 2020); arXiv comment "Accepted at Robotics: Science and Systems 2020" (not printed in
PDF); pages read: 9/9.
Status: USE (conceptual support only — NOT a CBF and NOT a triggering method; chosen for open-loop safety without
observations and the sensing-range construction)

**Problem & setting:** Ego ("internal") system and an obstacle ("external") system with independent dynamics; the
ego may lose observations of the obstacle at arbitrary times (impersistent observation model, eq. 7, p3). Find all
configurations from which the ego can stay safe for t_f seconds even if it never observes the obstacle again.

**Method:** Formulated as an open-loop zero-sum Stackelberg game (eq. 10, p3); solved offline by two Hamilton–Jacobi
PDEs: forward reachable set of the obstacle from its last known state (Thm 1, eq. 12–16, p4), then the backward
avoid tube of the ego w.r.t. that growing set (Thm 2, eq. 20–25, p4–p5). The super-zero-level set is the
"Eyes-Closed Safety Kernel" E (eq. 26, p5). Online: stay inside E; when observations are lost, apply the stored
optimal evasive policy (eq. 27, p5); lookup is "on the order of miliseconds" (p8). Unseen obstacles beyond sensing
range handled by computing the reachable set from S_sense = {‖·‖ ≥ r_sense} (eq. 32, p7).

**Experiments & key quantitative results:** Two Dubins cars (ego u1 ∈ [0,4], u2 ∈ [−1,1]; obstacle u3 ∈ [0,3],
u4 ∈ [−0.75,0.75], p6), t_f = 5.0 s, Level Set Toolbox (p6); results are visualisations of the sets (Figs 2–5,
p6–p7); no performance statistics.

**Limitations:** Stated: guarantees only valid for t_f after observations are lost (p5); assumes loss of observation
is detected instantly (p5) and does not address detection (p2); grid-based HJ cost "scales exponentially with the
dimension of the state space" (p7); discretisation artefacts (p7). Observed: worst-case adversarial obstacle →
very conservative; no notion of measurement noise/latency; no decision to *request* observations.

**Relation to DART:** Conceptual ancestor of DART's scheduler: DART's "safe open-loop time" asks the dual question
(how long can I go without a new perception result, given the obstacle's reachable/uncertainty growth and my
braking capability), and DART's "frontier" term mirrors F9's reachable set from beyond the sensing radius. Gap: F9
is offline HJ (low-dimensional, exponential cost), worst-case, and treats loss of observation as an exogenous
failure rather than a controllable, energy-saving choice; DART computes an online closed-form/cheap bound and uses
it to *schedule* perception, with covariance (probabilistic) growth and latency. Stronger than DART: exact
(game-theoretic) characterisation of the open-loop-safe set for the modelled dynamics.

**Citable statements:**
- Motivation: data-driven perception may fail -> p1: "Inspired by the fragility of data-driven perception systems
  used by autonomous vehicles, we formulate the problem that arises when a sensing modality fails or is found to be
  untrustworthy during autonomous operation."
- Plan assuming observations can be lost at any instant -> p2: "avoidance trajectories are generated assuming that
  observations will potentially be lost at any instant."
- Guarantee horizon is finite -> p5: "the guarantees provided on safety are only valid for tf seconds after
  observations are lost."
- Obstacles beyond sensing range -> p7: "in dynamic environments, there are often situations in which no obstacles
  might be detected, such as when an obstacle is beyond the sensing range of the ego vehicle."
- Persistent observation enlarges the safe set -> p8: "The set of all safe initial configurations in the
  persistently observed case is a strict super-set of the eyes-closed safety kernel defined here."

**Snowball candidates:**
- D. Falanga, S. Kim, D. Scaramuzza, "How fast is too fast? The role of perception latency in high-speed sense and avoid" (2019)
- D. Fridovich-Keil, S. L. Herbert, J. F. Fisac, S. Deglurkar, C. J. Tomlin, "Planning, fast and slow" (2018)
- S. Vaskov et al., "Towards provably not-at-fault control of autonomous robots in arbitrary dynamic environments" (2019)
- D. M. Saxena, V. Kurtz, M. Hebert, "Learning robust failure response for autonomous vision based flight" (2017)

---

## Group synthesis

- **Delay is handled by prediction, and it works better than robustifying.** F1, F2 and F6 all compensate a known
  input delay by forward-propagating the state (and in F1 the environment) to the time the action takes effect;
  F6 shows this beats treating delay as disturbance (p5), and F1/F2 show that ignoring 0.1 s / 30 ms delays breaks
  safety (F1 p9; F2 p6). All assume a *constant* delay on the *actuation* channel (F1 p6; F2 p4; F6 eq. 27).
- **Uncertain environment/perception enters as a Lipschitz-scaled margin.** F1 (environment bounds ε_e, ε_ė), F5
  (MR-CBF with perception error ε(y)), F7 (conformal bound + motion drift Δ) all tighten the CBF by
  (Lipschitz constant × error bound), often with a ‖u‖ term that turns the QP into an SOCP (F1 p5; F5 p5).
- **Sampling between information updates shrinks the safe set in proportion to the hold time.** F3 formalises the
  controller/physical margins and shows first-order margins grow linearly and second-order margins quadratically
  with the step (F3 p4); F2 and F8 give alternative reachability/Lipschitz bounds over the hold interval.
- **Triggering for safety is subtle.** F4 proves naive safety triggers can lose a minimum inter-event time and need
  an explicit margin (F4 p3–p6); F8 shows self-triggered "safe periods" densify updates near the boundary
  (F8 p6). Event-triggered schemes (F4) need continuous state monitoring, so they do not transfer to triggering an
  expensive sensor; self-triggered schemes (F7, F8) do.
- **Closest prior art to DART's scheduler is F7 (+F8):** F7 derives a sampling interval for a learned perception
  module from an error bound and a speed bound — but the interval is constant, latency is zero, the estimator is
  memoryless and the map is known (F7 p7–p9).
- **Open gap DART can fill (supported by what was read):** none of the nine papers (a) schedules a *perception*
  module with non-negligible, variable *inference latency* (all treat perception as instantaneous or the delay as
  constant on the actuator); (b) lets the inter-sample interval depend on scene risk (closing speed, braking
  distance, unseen-obstacle frontier) — F7's interval is constant, F8's depends only on the ego state and static
  constraints; (c) propagates a *filtered* (Kalman) obstacle covariance between frames and feeds it into a
  time-varying CBF inflation (F5 and F7 list Kalman filtering as future work: F5 p8, F7 p4); (d) accounts for
  perception compute/energy as the resource being saved; (e) targets a quadrotor with monocular learned depth.
- **Where these papers are stronger than DART and what DART should borrow:** formal invariance proofs (F1–F4, F8),
  an MIET/non-Zeno argument for the trigger (F4, F8), distribution-free calibration of perception error via
  conformal prediction (F7), and the controller/physical-margin metrics to quantify conservatism (F3). Claims of a
  safety *guarantee* in DART should be scoped accordingly (DART's evidence is Monte-Carlo simulation).
- **Natural baselines suggested by this group:** fixed-rate perception with error-bound-derived period (F7-style);
  delay-ignorant CBF vs. predictor-compensated CBF (F1/F6-style ablation); worst-case open-loop inflation without
  filtering (F1 ε_e = āτ²/2 style) vs. DART's covariance growth.
