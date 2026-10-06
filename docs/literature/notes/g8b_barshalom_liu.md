# Group 8b — user-supplied PDFs: H1 (Bar-Shalom 2002, OOSM) and A6 (Liu et al. ICRA 2016)

Agent notes. The PDFs were supplied by the user (paywalled, IEEE Xplore copies) and were read from
`scratchpad/papers/g8_user/` (`<name>.pdf`, `<name>.txt` layout, `<name>.raw.txt`). Page images I rendered to check
equations and tables are in `scratchpad/papers/g8_user/img_g8b/`: Bar-Shalom PDF pp. 3 and 8, and Liu PDF pp. 4 and 6.
"p." means the **PDF page**, taken from the form-feed index of `pdftotext`. The printed journal or proceedings page is given in
brackets where it helps. Quotes are verbatim, with whitespace normalised. Math symbols that `pdftotext` garbled
(τ printed as "¿", κ printed as "·", "−" printed as "¡") were transcribed from the rendered page images.

---

### H1 — Update with Out-of-Sequence Measurements in Tracking: Exact Solution
Yaakov Bar-Shalom; IEEE Transactions on Aerospace and Electronic Systems, vol. 38, no. 3, pp. 769–778, July 2002
(technical content is on pp. 769–777; p. 778 is the author biography); DOI 10.1109/TAES.2002.1039398 (taken from the
g6 notes, because the DOI is not printed on the PDF); IEEE Log No. T-AES/38/3/06426; pages read: 10/10 (PDF p.1 = journal p.769 … PDF p.10 = p.778).
Status: USE (narrow. It is the authoritative reference for the exactness claim in DART's delay-aware update. It contains no control or perception material.)

**Problem & setting:**
- Centralized multisensor tracking. Measurements carry time stamps, and different transmission delays make them arrive at the
  fusion centre out of time order (OOSM). p.1: "This can be easily seen to lead to situations where measurements from the same target arrive out of sequence."
- The filter keeps only sufficient statistics, so a late measurement has to be fused into a track that has *already been updated*
  past its time stamp. p.1: "when a delayed measurement arrives, e.g. with time stamp τ, after the state of the target has been already updated to time t > τ".
- The scope is one-step lag only. p.1: "The OOSM is assumed to be within the last sampling interval." p.2, eq. (2): t_{k−1} < τ < t_k.
  The measurement z(k) at t_k has already been fused. τ is arbitrary inside the interval, so the process noise must be evaluated
  "over an arbitrary fraction of the sampling interval" (p.2).

**Method (key idea, key equations in words, assumptions):**
- *Model and assumptions (p.2, eqs. 1–4)*:
  - Linear model x(k)=F(k,k−1)x(k−1)+v(k,k−1) and z(k)=H(k)x(k)+w(k).
  - Noises are zero-mean, white, "and mutually uncorrelated".
  - F must be invertible, because the backward model is used (eq. 6).
  - "Exact" means the conditional mean under Gaussianity, or the LMMSE estimate otherwise. Data association is perfect:
    footnote 3, p.2: "(conditional mean if all the pertaining random variables are Gaussian, or the LMMSE …) is assumed without any degradation due to data association."
- *Key insight (p.1–3)*: when retrodicting from t_k back to τ, the process noise v(k,κ) over [τ,t_k] is no longer independent
  of the current estimate, because x̂(k|k) already contains z(k), which depends on v(k,κ). p.1: "However, in the retrodiction to τ from t, this independence does not hold anymore."
  - Its conditional mean is non-zero. Eq. (19), p.3: v̂(k,κ|k) = Q(k,κ)H(k)′S(k)⁻¹ν(k), where ν(k) is the innovation of the
    *intervening* measurement z(k). Footnote 4, p.3: "Both techniques of [3] and [5, 4] assumed this term as zero."
- *Optimal algorithm (Section V, eqs. 30–39, p.4)*:
  - Retrodiction (30): x̂(κ|k)=F(κ,k)[x̂(k|k) − Q(k,κ)H(k)′S(k)⁻¹ν(k)].
  - Retrodiction-noise covariance P_vv (31) and state–noise cross-covariance P_xv (32). These use P(k|k−1), H(k), S(k) and Q(k,κ).
  - Retrodicted covariance P(κ|k) (34) and retrodicted measurement covariance S(κ) (35).
  - Cross-covariance P_xz(k,κ|k)=[P(k|k)−P_xv]F(κ,k)′H(κ)′ (36) and gain W=P_xz S(κ)⁻¹ (37).
  - The update is applied to the *current* estimate x̂(k|k) (38–39). There is no re-filtering.
- *What must be stored (one-step lag)*: from eqs. (30)–(39), the following must be kept from the last update at t_k:
  x̂(k|k), P(k|k), P(k|k−1), H(k), S(k) and the innovation ν(k), plus the model terms F(κ,k), Q(k,κ), H(κ), R(κ).
  In words, p.8: "If the time of the OOSM is within the last sampling interval, one has to store the last innovation to carry out the optimal retrodiction to the time of the OOSM."
- *Approximate algorithms (Section VI)*. p.4: "Both suboptimal techniques summarized below assume the retrodicted noise to be zero."
  - **Algorithm B** (Hilton et al. 1993; Blackman & Popoli 1999):
    - Sets x̂_B(κ|k)=F(κ,k)x̂(k|k) (40) and P_vv^B=Q(k,κ) (41).
    - It still uses the full P_xv (42), so it needs P(k|k−1), H(k) and S(k) but *not* ν(k).
    - p.4: "The only differences between algorithm B and the optimal algorithm are (40) and (41), which are simplified versions of (30) and (31), respectively."
  - **Algorithm C** (Bar-Shalom & Li 1995):
    - Ignores the process noise in the retrodiction entirely: P^C(κ|k)=F(κ,k)P(k|k)F(κ,k)′ (51) and P_xz^C=P(k|k)F′H′ (53).
    - It needs only x̂(k|k) and P(k|k). p.5: "The only difference between algorithm C and algorithm B is (51), which replaces (44)."
  - Section VII (p.5, eqs. 57–63) gives the exact a-priori matrix MSE of B and C. p.5: "in neither case are these expressions guaranteed to be an accurate measure of their errors because they ignore the term (19)."
- *Multi-lag (l-step) OOSM (p.8)*: no equations are given. The paper only outlines the method.
  - p.8: "For older OOSM one will therefore need all the intervening measurements (or innovations) to the present time. The generalization is conceptually straightforward, even though quite lengthier."
  - p.8 (eq. 79, t_{k−l−1}<τ<t_{k−l}): "the procedure is to use a smoothing algorithm back to t_{k−l}, then the above algorithm to retrodict to τ".
  - p.8: "Preliminary results on algorithm B for this l-step lag OOSM problem can be found in [6]."
- *Cost*: the paper gives **no FLOP counts or timings**. Cost is discussed only qualitatively, in terms of storage and complexity:
  - p.7–8: "The optimal algorithm for updating the state estimate with an (earlier) OOSM requires more than the current (latest) state estimate."
  - p.8: "This amounts to a (non-standard version) smoothing, which always requires reprocessing the measurements."
  - p.8: the alternative "reordering" in chronological sequence, "in addition to requiring extra storage, has also additional complexity".
  - p.8: "algorithm B seems to be a very reasonable compromise between simplicity and optimality."
  - p.9: "algorithm C, which is quite a bit simpler than B, is also … suitable for practical use".

**Experiments & key quantitative results (exact, with page):**
- *Example 1 (pp.5–6): scalar random walk.*
  - Setup: Q=1, R=1, maneuvering index λ=2, P(k−1|k−1)=1, which gives P(k|k−1)=2, S(k)=3 and P(k|k)=0.667. The OOSM is at
    t_κ=(t_{k−1}+t_k)/2, with Q(k,κ)=0.5 (p.6).
  - Table I (p.6), columns Optimal / B / C:
    - P(κ|k): 0.750 / 0.833 / 0.667.
    - W: 0.286 / 0.273 / 0.400.
    - P(k|κ): 0.524 / 0.530 / 0.400.
    - Actual MSE M̄(k|κ): 0.524 / 0.530 / 0.560.
  - p.6: "The chronological processing of the measurements (i.e., sequential: k − 1, κ, k) yields the final updated state variance at k as 0.524, which is the same as the result of the optimal processor for the OOSM."
  - p.6, on C: "this algorithm is optimistic in this case (rather than always pessimistic, as incorrectly stated in [3])."
- *Table II (p.6): same model, swept over Q.*
  - At Q=1: P=0.5238, M̄=0.5238, P^B=M̄^B=0.5303, P^C=0.4000, M̄^C=0.5600.
  - At Q=0.05 (λ=0.4472): 0.3469 for all of them except P^C=0.3387 and M̄^C=0.3470.
  - p.6: "For maneuvering index below 0.5 algorithm B is indistinguishable from the optimum".
- *Example 2 (pp.6–7): white-noise-acceleration (nearly-CV) model with position-only measurements.*
  - This is the same model class as DART's CV tracks. T=1, process covariance given by eq. (71), R=1, and an OOSM at t_κ=1.5
    is processed after k=2. Table III (p.7) uses q=4, 1, 0.5 (λ=2, 1, 0.7).
  - p.7: "Algorithm B is practically indistinguishable from the optimum (M̄B ≈ M̄) and algorithm C is nearly as good".
- *Example 3 (pp.7–8): position + Doppler velocity measurements (GMTI).*
  - Table IV (p.8, uncorrelated noise, eq. 77), velocity variance (2,2) for optimal / P^C / M̄^C:
    - q=4: 0.0950 / 0.0490 / 0.5607.
    - q=1: 0.0850 / 0.0474 / 0.1825.
  - p.7: "algorithm C is much too optimistic in velocity, while algorithm B is very close to the optimum."

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - The exact equations cover only the one-step lag case (p.1, eq. 2). Multi-lag is only sketched (p.8).
  - The optimal method needs stored innovations/measurements and, for multi-lag, smoothing (p.8).
  - Strict chronological reprocessing is "possible, however, only if there is no data association problem (DAP)" (p.8).
  - Data association is assumed perfect (footnote 3, p.2).
- Observed:
  - The method is linear-Gaussian and single-model. There is no IMM or model bank, and no nonlinear measurement model.
  - There is no notion of sensor-platform (ego) pose uncertainty at the measurement time.
  - The examples are synthetic (1-D or 2-D state), and no runtime figures are given.

**Exactness check for DART (this was the main question):**
1. *H1's problem is not DART's (nominal) problem.* An OOSM in H1 is defined by the track having been *updated* with a later
   measurement z(k), t_k > τ, before z(τ) arrives (p.1, quoted above; eq. 2). Every non-standard term in the exact solution comes from
   that intervening update: eq. (19) is proportional to its innovation ν(k), and (21)–(22) contain H(k)′S(k)⁻¹H(k).
   - In DART, with at most one frame in flight, nothing about the track has been fused between t_upd and the arrival of z(t_c).
     The track has only been *predicted* past t_c. So z(t_c) is delayed but in-sequence: it is "lag-0", below H1's one-step case.
2. *Our algebra on H1's equations (not stated in H1):* remove the z(k) update, so that P(k|k)=P(k|k−1) and there is no ν(k).
   - Then (19) gives v̂=0, (21) gives P_vv=Q(k,κ), and (22) gives P_xv=Q(k,κ).
   - (24) becomes P(κ|k)=F(κ,k)[P(k|k−1)−Q(k,κ)]F(κ,k)′=P(κ|k−1), using eq. (5), x(k)=F(k,κ)x(κ)+v(k,κ).
   - (36) becomes P_xz=F(k,κ)P(κ|k−1)H(κ)′.
   - (38)–(39) then reduce to x̂(k|κ)=F(k,κ)x̂(κ|κ) and P(k|κ)=F(k,κ)P(κ|κ)F(k,κ)′+Q(k,κ).
   - This is exactly the sequence "predict the stored posterior t_upd→t_c, apply a standard KF update at t_c, predict t_c→now".
     DART's capture-time update is therefore the special case of H1's exact solution with no intervening update. It agrees with
     H1's own statement that chronological processing is the optimum (Table I remark, p.6, quoted above).
   - In that case algorithm B coincides with the optimum, because its two simplifications (40)–(41) become exact.
   - Algorithm C does *not* coincide. Its (51) would give F(κ,k)P(k|k−1)F(κ,k)′ = P(κ|k−1) + F(κ,k)Q(k,κ)F(κ,k)′, which double-counts process noise.
   - Practical consequence for DART: the exact approach must restart from the *stored posterior at t_upd*, as DART does. It must not
     back-propagate the current predicted track while ignoring process noise.
3. *Conditions DART should state for "exact"* (from H1's assumptions, plus our inference):
   - (a) A linear-Gaussian model, with exact in the conditional-mean sense; otherwise it is only LMMSE (footnote 3, p.2).
   - (b) A known capture time stamp, with F and Q evaluated over the arbitrary interval (p.2).
   - (c) White measurement noise that is uncorrelated with the process noise (eq. 4, p.2).
   - (d) Correct data association (footnote 3, p.2).
   - (e) Our inference: no update of the same track whose time stamp is later than t_c has already been applied.
4. *Caveats we observe (not from H1):*
   - "At most one frame in flight" is *sufficient but not necessary*. Several frames in flight that complete in capture order are
     still in-sequence and exact. Conversely, any other update of the track before z(t_c) arrives would turn z(t_c) into a true
     OOSM. Examples are another sensor or a pseudo-measurement.
   - If DART ever lets frames overtake each other, H1's one-step exact solution applies, at the storage cost listed above.
     Alternatively DART could re-filter chronologically from a stored older posterior, which is H1's "reprocessing" option (p.8).
     Algorithm B is the cheap, consistent fallback, and p.8 says it "can be used without modification even if the time delay is more than a sampling interval".
   - "Exact" applies per model and per track. H1 does not address the two-model bank, the per-frame scale error of monocular depth
     (common to all obstacles in a frame, and possibly correlated over time, which breaks the whiteness/independence of eq. 4), or
     error in the buffered ego pose at t_c.

**Relation to DART:**
- *Supports component 2 (delay-aware estimation).* H1 is the canonical citation for "a delayed measurement fused after later
  information is an OOSM, and its exact update needs retrodiction with correlated process noise". It is also the citation for why
  DART's single-frame-in-flight design avoids that machinery.
- *What H1 does not do:* control, safety, perception scheduling, learned perception, ego-motion, or choosing *when* to measure.
- *Where H1 is stronger than DART:* it handles the truly out-of-sequence case exactly (one-step lag), and it quantifies the
  consistency of the approximations (Section VII). DART's estimator would need H1-style machinery if more than one frame were allowed in flight.

**Citable statements:**
- Delayed measurements arriving after the track was updated past their time stamp is the OOSM ("negative-time update") problem
  -> p.1: "when a delayed measurement arrives, e.g. with time stamp τ, after the state of the target has been already updated to time t > τ"
- The exact solution covers a lag within one sampling interval -> p.1: "The OOSM is assumed to be within the last sampling interval."
- Naive retrodiction is inexact because the process noise is correlated with the updated estimate -> p.1: "However, in the retrodiction to τ from t, this independence does not hold anymore."
- Standard fixed-lag smoothers do not apply directly when the time stamp is arbitrary -> p.1: "The standard discrete-time smoothing algorithms cannot be used because the 'time stamp' τ of the measurement is, in general, arbitrary."
- Chronological (in-sequence) processing equals the optimal OOSM result -> p.6: "The chronological processing of the measurements (i.e., sequential: k − 1, κ, k) yields the final updated state variance at k as 0.524, which is the same as the result of the optimal processor"
- Optimal one-lag OOSM processing needs the last innovation stored -> p.8: "one has to store the last innovation to carry out the optimal retrodiction to the time of the OOSM."
- Multi-lag needs all intervening data and smoothing -> p.8: "For older OOSM one will therefore need all the intervening measurements (or innovations) to the present time."
- Value of old measurements decays because of process noise (supports bounding latency) -> p.8: "because of the process noise the informational content of a measurement diminishes rapidly with its age–old data are irrelevant."
- Algorithm B is a cheap, consistent approximation that also works for longer delays -> p.8: "it can be used without modification even if the time delay is more than a sampling interval."
- The retrodiction covariances are data-independent (a priori) -> p.3: "all the above conditional covariances are independent of the conditioning Z^k, i.e., they are equal to their unconditional (a priori) expected values."

**Snowball candidates:**
- Hilton, Martin, Blair, "Tracking with time-delayed data in multisensor systems" (1993) [algorithm B]
- Mallick, Coraluppi, Carthel, "Advances in asynchronous and decentralized estimation" (2001) [l-step lag]
- Bar-Shalom, Li, Kirubarajan, *Estimation with Applications to Tracking and Navigation* (2001) [CWNA model, discretisation over arbitrary intervals]
- Bar-Shalom, Li, *Multitarget-Multisensor Tracking: Principles and Techniques* (1995) [algorithm C]
- Wang, Kirubarajan, Li, Bar-Shalom, "Precision large scale air traffic surveillance using an IMM estimator with assignment" (1999)

---

### A6 — High Speed Navigation For Quadrotors With Limited Onboard Sensing
Sikang Liu, Michael Watterson, Sarah Tang, Vijay Kumar (GRASP Lab, UPenn); 2016 IEEE International Conference on Robotics
and Automation (ICRA), Stockholm, Sweden, May 16-21, 2016, pp. 1484–1491; DOI not printed on the PDF (not verified here);
pages read: 8/8 (PDF p.1 = p.1484 … PDF p.8 = p.1491, the references).
Status: USE (relevant to DART's frontier term and to the relation between speed, sensing range and processing latency. It is a background/contrast paper, not a direct baseline.)

**Problem & setting:**
- Goal-directed fast flight through *unknown*, unstructured environments, using the raw onboard depth sensor and limited compute.
  p.1: "We define fast navigation as finding a high-speed trajectory for the MAV under dynamic constraints, limited sensor range, and limited computational capabilities."
- It criticises earlier planners that assume perception is instantaneous. p.1: "they assume the obstacle detection problem is solved and the robot can instantaneously query the properties of any obstacle within in a given sensing radius".

**Method (key idea, key equations in words, assumptions):**
- *Dual-horizon paradigm (after Watterson & Kumar [10], pp.2, 5)*: each planning epoch τ produces a short-range trajectory Φ and a
  stopping trajectory Υ. If the next pair is not found in time, the stop trajectory is executed.
  - p.2, Fig. 2: "If Φτ+1, Υτ+1 are not found, it will execute Υτ (denoted by the red line) to stop."
  - p.2: when the short-range planner fails, "we can execute a stopping policy, denoted Υτ, to safely stop the quadrotor before it collides with an obstacle and switch to a long range planner."
  - The long-range planner is not described in the paper.
- *Map (p.3)*: a uniform-resolution occupancy grid / voxel map built from **only the latest measurement**. Cells are occupied,
  free or unknown, and travel is allowed only through free cells.
  - p.3: "Rather than accumulating consecutive sensor measurements to form a global map, we only use the latest sensor measurement to create a local map."
  - p.3: "While this restriction is conservative, it will guarantee the vehicle's safety."
  - A collision-cost field φ(p) depends on the distance to the nearest obstacle (eq. 2, p.3) and is used as an A* edge cost (eq. 3, p.4).
- *Frontiers (pp.3–4)*: candidate goals are the frontier groups between free and unexplored space. In 3D the voxel map is sliced
  into 2D maps.
- *Stopping policy and frontier reasoning (p.4)*. This is the core link to DART's frontier term:
  - p.4: "there could be an obstacle close to the frontier point g that is not seen in the current map."
  - p.4: "In the worst scenario, an obstacle could be revealed to be right behind g. Thus, for guaranteed collision avoidance, we would have to set the desired velocity at g to be zero."
  - Stopping at every iteration is "too conservative" (p.4). Instead the path is shortened by d_s = R_robot + v_max²/(2a_max)
    (eq. 4, p.4) to an intermediate point g′. p.4: "When robot reaches g′ with any vf ≤ vmax, it will be able to decelerate to a halt at a position g″ before g along a straight line."
- *Corridor and trajectory (p.5)*:
  - Convex segmentation by ray-tracing known-free intervals (Algorithm 1). Unknown voxels are excluded (line 7: φ(vj) ≠ φunknown).
  - Minimum-jerk QP inside the corridor (eqs. 5–7), with iterative time allocation.
  - FOV constraint, p.5: "We impose the additional inequality constraint that the velocity of the end of the trajectory is within the cone of the sensor's view."
- *Safety / speed bound with processing latency (p.6)*:
  - p.6: "unknown space is treated as obstacles, so in the event that everything the robot cannot see is obstacles, it can still stop."
  - p.6: "Under the assumption that the robot must stop within distance d, can decelerate at amax and takes δt seconds to process the sensor data, it can travel up to velocity v."
  - Eq. (8), p.6 (checked on the page image): v = a_max(√(δt² + 2d/a_max) − δt). By our algebra this is the positive root of
    v·δt + v²/(2a_max) = d, i.e. distance flown during processing latency plus braking distance equals the sensing distance.
  - p.6: "With this relation, we limit our velocity based on our sensor range."
- *Assumptions (from the text)*:
  - Metric RGB-D depth (Primesense), with sensing noise only mentioned in passing (p.4: "In anticipation of real world noise").
  - Odometry from motion capture (p.7).
  - A constant processing time δt=0.15 s (pp.6–7) and constant yaw (p.2).
  - Moving obstacles, measurement uncertainty and latency variability are not discussed anywhere (grep of the full text confirms
    no mention of "static", "moving", "uncertain", "latency" or "delay").

**Experiments & key quantitative results (exact, with page):**
- Simulation, Gazebo corridor with a wall at the end (p.6):
  - p.6: "With a sensor range of 4.5m, maximum acceleration of 5m/s2, and prediction time δt = 0.15s, the quadrotor reaches a maximum velocity of 4m/s."
  - p.6: "This is very close to the theoretical maximum velocity we can achieve according to Eq. 8, which in this case is 5.6m/s."
  - *Our arithmetic check:* Eq. (8) with the printed d=4.5 m, a_max=5 m/s² and δt=0.15 s gives 6.0 m/s, not 5.6 m/s.
    The paper does not say which d it used (5.6 m/s would correspond to d≈4.0 m, e.g. range minus a margin). This is our inference, not stated.
- Simulation, cluttered environment (p.6): "the algorithm is able to adjust the speed of the robot to around 1m/s to accommodate the high density of the obstacles."
- Density benchmark (pp.6–7): "We create a total of 11 environments with varying obstacle densities" (p.6).
  - Fig. 14, p.7: "We fill a 40m × 10m × 4m space with cylinders. From top to bottom, the number of pillars in the space are 5, 25, 50."
  - Fig. 15 (p.7) plots flight time against obstacle density for v_max = 1.5, 2.0 and 2.5 m/s (a=5.0), and for a = 2.5 and 5.0 m/s² (v=2.0).
    The values are given only graphically, so we extract none.
  - Stated trends (p.6): "As expected, the flight time increases with the increasing obstacle density." and "maximum accelerations in a reasonable range result in similar flight times."
- Hardware (p.7):
  - Platform: AscTec Pelican with a "3.4 GHz dual-core i7 Intel NUC", a Primesense RGB-D sensor, a mass of 1.5 kg and a thrust-to-weight ratio of 2.4.
  - p.7: "The range of depth sensor is 4.5m, and δt is set to be 0.15s."
  - Wall-stop test, p.7: "The maximum velocity is 3m/s, with a maximum acceleration of 5m/s2. With these values, it theoretically takes 0.9m to stop, which is within the sensor range of 4.5m."
    By our check, 0.9 m = v²/(2a). It excludes the δt term of Eq. (8).
  - Two-pillar test, p.7: "The maximum speed in this experiment is 1m/s."
- No planning or perception computation times are reported anywhere in the paper.

**Limitations (stated by authors, with page) / limitations we observe:**
- Stated:
  - The trajectory is suboptimal and time allocation is non-convex. p.6: "this optimization cannot be guaranteed to converge to a globally optimum solution."
  - Safety rests on "several conservative assumptions" (p.6).
  - Stopping at every frontier is "too conservative" (p.4).
- Observed:
  - The safety "guarantee" is argued informally (Section IV-B). It has no proof and no treatment of tracking error, sensing noise,
    localization error, latency jitter or moving obstacles.
  - δt is a fixed constant, used offline to cap v_max.
  - d_s in eq. (4) has no latency term, whereas eq. (8) has one.
  - The printed 5.6 m/s does not match eq. (8) with the printed values (see above).
  - Localization uses motion capture.
  - The conclusion claims "outdoor test flights" (p.8: "We validate this algorithm in simulated environments, and outdoor test flights."),
    but the hardware experiments described are indoors with Qualisys (p.7).
  - The long-range planner, which is needed for the completeness claim, is not described.

**Relation to DART:**
- *Supports DART's frontier term (component 3) and braking-distance reasoning (components 3 and 5).*
  - Liu et al. use exactly DART's worst-case assumption, that an unseen obstacle may lie immediately beyond what has been
    sensed (p.4). They bound speed by "latency travel + braking distance ≤ sensing distance" (eq. 8, p.6).
  - DART's safe-open-loop-time computation is the *dynamic, inverted* form of eq. (8). Liu et al. fix δt=0.15 s and d=4.5 m to get
    one v_max offline. DART instead takes the current velocity, closing speed and covariance and solves online for how long it may
    wait until the next perception result. It then uses that as the trigger.
- *Gap that DART fills:*
  - Liu et al. do not decide *when* to perceive. The sensor processing time is a fixed constant, and perception runs every epoch.
  - There is no estimation uncertainty (no covariance growth or inflation).
  - There are no moving obstacles or closing speed.
  - There is no learned monocular depth (they use metric RGB-D).
  - There is no CBF or formal safety filter.
  - There is no study of latency or rate sweeps.
- *Where Liu et al. are stronger than DART:*
  - Hardware flight with a full raw-sensor-to-trajectory pipeline.
  - Arbitrary obstacle geometry (voxels, not spheres).
  - Goal-directed frontier exploration, with a long-range planner for completeness.
  - A structural safety mechanism: an always-available committed stopping trajectory, which covers planner or compute failure
    without needing a deadline.
  - A *more conservative* treatment of unknown space: everything unseen, including occluded and out-of-FOV regions, is treated as
    occupied, and the terminal velocity is constrained to the sensor cone. If DART's frontier term considers only range (R_max) in
    the direction of travel, DART should either state that it does not cover occlusion and FOV edges, or add them.

**Citable statements:**
- Earlier fast-flight planners assumed perception is instantaneous -> p.1: "previous planning algorithms abstract away the obstacle detection problem by assuming the instantaneous availability of geometric information about the environment."
- Worst case at the sensing frontier: an obstacle just beyond what is seen -> p.4: "In the worst scenario, an obstacle could be revealed to be right behind g."
- Guaranteed safety at the frontier would force zero velocity there, which is too conservative -> p.4: "for guaranteed collision avoidance, we would have to set the desired velocity at g to be zero."
- Unknown space is treated as occupied for safety -> p.6: "unknown space is treated as obstacles, so in the event that everything the robot cannot see is obstacles, it can still stop."
- Max speed is bounded by stopping distance, deceleration and sensor-processing time -> p.6: "the robot must stop within distance d, can decelerate at amax and takes δt seconds to process the sensor data, it can travel up to velocity v." (eq. 8)
- Speed is limited by sensing range -> p.6: "With this relation, we limit our velocity based on our sensor range."
- Achievable speed depends on available computation time -> p.2: "the speed of our robot's trajectories depends on the available computation time."
- Reported numbers (4.5 m range, 5 m/s², 0.15 s, 4 m/s reached vs 5.6 m/s theoretical) -> p.6: "the quadrotor reaches a maximum velocity of 4m/s."
- A committed stopping trajectory is executed if replanning fails -> p.2 (Fig. 2): "If Φτ+1, Υτ+1 are not found, it will execute Υτ (denoted by the red line) to stop."
- FOV-aware terminal-velocity constraint -> p.5: "the velocity of the end of the trajectory is within the cone of the sensor's view."

**Snowball candidates:**
- Watterson, Kumar, "Safe receding horizon control for aggressive MAV flight with limited range sensing" (IROS 2015) [the paradigm A6 builds on]
- Karaman, Frazzoli, "High-speed flight in an ergodic forest" (ICRA 2012)
- Pivtoraiko, Mellinger, Kumar, "Incremental micro-UAV motion replanning for exploring unknown environments" (ICRA 2013)
- Bellingham, Richards, How, "Receding horizon control of autonomous aerial vehicles" (ACC 2002)
- Israelsen et al., "Automatic collision avoidance for manually tele-operated unmanned aerial vehicles" (ICRA 2014)
- Yamauchi, "Frontier-based exploration using multiple robots" (1998)

---

## Group synthesis (H1 + A6 only)
- **DART's capture-time update is in-sequence, not OOSM, as long as no later update of the same track was fused first.**
  H1's OOSM problem and every one of its correction terms (eq. 19 and the S(k)⁻¹ terms of eqs. 21–22) come from an *intervening
  measurement update*. Our reduction of H1's eqs. (30)–(39) with that update removed gives exactly "predict the stored posterior to
  t_c, update, re-predict".
  - Wording to use: "exact (equal to chronological Kalman filtering / the conditional mean under linear-Gaussian assumptions)
    provided no update with a later time stamp has been applied", citing H1 (p.1, p.6 Table I remark). The word "exact" needs
    these conditions attached.
- **"At most one frame in flight" is a sufficient, conservative condition.** Several frames completing in capture order are also
  exact. Any other source updating the track during the latency window would break exactness (our inference).
- **If DART allows frames to overtake each other:**
  - H1 gives the exact one-step-lag update, which costs storing ν(k), S(k), P(k|k−1) and H(k).
  - For multi-lag, H1 only sketches the method (smoothing back plus retrodiction) and gives no equations (p.8).
  - Algorithm B is the cheap, consistent alternative (p.8). Algorithm C is cheapest but can be optimistic, especially in velocity (pp.6–7).
  - H1 gives no runtime or FLOP numbers, so any claim about cost must come from our own implementation.
- **Exactness in DART is per track and per model.** H1 assumes white, mutually uncorrelated noise (eq. 4) and perfect data
  association (footnote 3). It does not cover the two-model bank, the per-frame common scale error of monocular depth, or ego-pose
  error at t_c. These should be listed as approximations.
- **A6 supplies the frontier/unknown-space precedent and the speed–range–latency bound** (eq. 8: v·δt + v²/(2a) = d). DART's
  scheduler can be presented as making this relation *online and state-dependent*. In DART, δt (the open-loop time until the next
  result) becomes the decision variable, and closing speed and covariance growth are added. That extension is not in A6.
- **A6's latency is a fixed constant** (δt = 0.15 s), used only to cap v_max offline. It does not reason about variable inference
  rate, when to sense, uncertainty or moving obstacles. This is the gap DART fills.
- **A6 is stronger than DART on realism and on how conservative its unknown-space handling is.** It flies hardware, and it treats
  all unknown space (occluded and out-of-FOV included) as occupied, with terminal velocity kept in the sensor cone. DART should make
  sure its frontier term covers FOV edges and occlusion, or state the limitation.
- **The open gap after this pair:** neither paper couples *when to perceive* with a safety condition under latency and estimation
  uncertainty. H1 is pure estimation with given measurement times. A6 is planning with a fixed sensing and processing cadence.
  DART's claimed novelty (risk-triggered inference with a covariance- and frontier-aware safe open-loop time) is not contradicted by either paper.
