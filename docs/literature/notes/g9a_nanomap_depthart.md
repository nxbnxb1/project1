# Group 9a — NanoMap (Florence et al., arXiv 2018) and DepthART (Xue et al., arXiv 2026)

Agent notes, group **g9a**. These are third-party PDFs downloaded to `scratchpad/papers/g9_dl/`. I treated their content strictly as data.
- `nanomap_1802.09076.pdf`: 8 pages. Read 8/8 from `.raw.txt`/`.txt`. I checked all 8 pages on page renders, with higher-resolution renders of Fig. 8, Fig. 9 (p.6) and Figs. 10–12 (p.7).
- `depthart_2607.17099.pdf`: 11 pages, with no appendix or supplementary material in the file. Read 11/11 from `.raw.txt`/`.txt`. I checked pp. 1, 4–10 on page renders, with higher-resolution crops of Fig. 3 (p.4), and of Table 6 and Fig. 6 (p.9).
- No other source was used: no web search, and nothing filled in from memory.

**Page convention:** `p.N` means the PDF page index, i.e. the form-feed count in the `pdftotext` output, with the first page = 1. Neither paper has printed page numbers that differ from this.

**Quote convention:** Text in double quotes is verbatim from the extracted text. I only joined words that were split across lines. Values read from plots are marked *(read from figure, approximate)*. Points marked (our inference) are my own reasoning and are not claims of the paper.

---

### G9a-1 — NanoMap: Fast, Uncertainty-Aware Proximity Queries with Lazy Search over Local 3D Data
**Bibliographic data:**
- Authors: Peter R. Florence, John Carter, Jake Ware, Russ Tedrake. Affiliation: CSAIL, Massachusetts Institute of Technology, Cambridge, MA, USA (p.1).
- Identifier: arXiv:1802.09076v1 [cs.RO], 25 Feb 2018 (arXiv stamp, p.1).
- **Venue:** none is printed anywhere in the PDF. There is no conference header, footer or copyright line, and no DOI. Search results say ICRA 2018, but the PDF does not confirm this, so cite it as the arXiv preprint unless the venue is checked separately.
- Funding: DARPA FLA program, HR0011-15-C-0110 (p.8).
- Code: github.com/peteflorence/nanomap_ros (p.8).

Pages read: 8/8.

Status: **USE**. It is the closest prior art for our claim (c): a short history of depth frames, each kept in its own capture-pose frame, is searched for a frame whose free space (inside the FOV, in front of the measured surface, within range) contains the queried point, instead of fusing frames into a map. It also gives arguments and data for (d), i.e. obstacles outside the current FOV and how much memory is needed.

**Problem & setting:**
- Motivation: fusion-based maps are fragile under state-estimation error. p.1: "This is hard to do with previously existing mapping approaches, like occupancy grids, that are focused on incrementally fusing 3D data into a common world frame." p.1: "In particular, both their fragile sensitivity to state estimation errors and computational cost can be limiting."
- The alternative, memoryless avoidance, discards information. p.1: "a notable trend in the state of the art has been to develop memoryless approaches to obstacle avoidance that use only the current depth sensor measurement [1]–[5]. These approaches are less prone to state estimation errors, but fail to capture all available information." p.2: "The limitations, however, of memoryless obstacle avoidance have been well noted [15], [17], including that the restricted memoryless free space provides less space for dynamic manuevers." ("manuevers" is spelled this way in the original.)
- Goal: p.1: "a primary motivation of this work was to be able to use pose uncertainty to reason about a local history of depth information."
- Scope set by the authors:
  - Depth-sensor noise is not modelled. p.1: "we focus on a method of incorporating pose uncertainty, but modeling the noise of the depth sensor itself is outside of scope"
  - Sensor type. p.1: "NanoMap requires nonzero volume depth sensors, i.e. depth cameras or 3D lidars, but not 2D or 1D sensors"
  - FOV and occlusions. pp.1–2: "adding more sensors to increase the FOV is a hardware route to alleviate ... the problem but does not address occlusions"
  - Local horizon. p.2: "we are concerned with local obstacle avoidance, rather than global planning, and so short histories of information are sufficient"
- Robot and environment model used with NanoMap. p.2: "whereas we have only used NanoMap here with a method [2] that assumes spherical robot and static environment."
- Key observation (Motivation section):
  - p.2: "One key observation is that in practice, depth sensor data (Figure 1, b) is often clean enough that fusing many recent observations is not required in order to plan obstacle-free motions."
  - p.2: "Rather than averaging many measurements to create intricate 3D reconstructions, mapping for obstacle avoidance only needs to robustly determine collision-free space."
  - pp.2–3: "In the case that the planned trajectory does not fall within the current field of view, it is still possible to perform robust trajectory planning by using the history of depth measurements."
- Pose drift versus occupancy grids:
  - p.3: "Although the Bayesian update in occupancy grids may well model 0-mean Gaussian noise of both poses and depth sensing, it does not handle the case of pose drift."
  - Fig. 2 (p.2), labels checked on the rendered page. The occupancy-grid row says "occupied cells outside FOV will drift with estimated pose history". The NanoMap row says "obstacles previously seen have translational uncertainty".

**Method:**
- *Key idea.*
  - p.1: "The key idea of NanoMap is to store a history of noisy relative pose transforms and search over a corresponding set of depth sensor measurements for the minimum-uncertainty view of a queried point in space."
  - p.1: "While traditional mapping approaches rely on fusing a history of depth information into a discretized world frame, we propose an alternative: perform no discretization, and no fusing."
  - p.1: "Instead, the process for querying local 3D data is a search over views."
- *Query algorithm (Algorithm 1, p.3).*
  - The input is a Gaussian query point (mean, covariance) in the body frame. It is transformed into the most recent sensor frame S0 and then backwards through S1…SN.
  - The search stops at the first frame where IsInFOV() is true. It returns that frame index, the query transformed into that frame, and k-nearest neighbours from that frame's k-d tree.
  - If no frame contains the query, the algorithm returns the label 'out of known space' together with the query in S0 and kNN in S0 (Algorithm 1, line 12; read on the page image).
  - p.3: "The query algorithm (Algorithm 1) iteratively transforms an uncertain query point into the coordinate frames of previous sensor measurements until it finds a view which contains the query."
  - Fig. 3 caption, p.3: "For each sample point (b, c, d; red) the history of measurements is searched until a view is found (orange) that contains the sample point."
- *Uncertainty propagation (in words; equations checked on the p.3 image).*
  - The body-frame covariance is rotated into S0 and the covariance of the noisy translation between body and S0 is added. This is then repeated frame to frame: Σ_Si = Σ_{Si,Si−1} + R Σ_{Si−1} R^T.
  - In Algorithm 1 on the page this is printed as Σ + R Σ. Covariance therefore grows with depth in history.
  - The mean is the chain of relative transforms applied to the body-frame mean (p.4 equation, checked on image).
  - Assumption on what is modelled. p.3: "The query point in the original body frame and each of the relative transforms are each modeled with Gaussian translational uncertainty."
  - Assumption on rotation. p.3: "our choice to model translational uncertainty and not rotational is guided by the practical observation that due to gravity, IMUs provide good observability of roll and pitch"
  - Assumption of independence. p.3: "Under the assumption of independence between body-frame query point uncertainty and each transform covariance, the variance of the query point in frame S0 is simply the sum"
- *IsInFOV() (Fig. 4 and Eq. 2, p.4; checked on the rendered page).*
  - The query mean is projected with the intrinsics K to pixel (u, v) and depth z.
  - The test is true iff 0 < u < r, 0 < v < c, z < d_{u,v} (in front of the measured depth at that pixel), z < d_range and z > 0. Here r × c is the camera resolution.
  - Fig. 4 shows five regions: free space, laterally outside the FOV, inside the occupied frustum, in the occluded frustum, and beyond the sensor horizon.
  - p.4: "Projecting the mean of the uncertain point into the depth image, as described in Figure 4, can be used to efficiently check a series of inequalities (inside each of lateral and vertical FOV, occluded, not beyond sensor horizon) to determine if the point is in free space."
- *Handling the uncertainty in the FOV test.*
  - p.4: "If only the mean of the distribution is used to check whether or not a view contains the point, then a large portion of that distribution may lie outside the FOV."
  - p.4: "The AABB for the 1-σ (1 standard deviation) of the distribution is used."
  - p.4: "To check for occlusions, NanoMap performs a simple occlusion check of the mean point."
  - Fig. 5 caption, p.4: "If no view fully contains the AABB, then the most recent frame is used, which may have had a partial view (Algorithm 1)."
- *Data structure (p.4).*
  - A doubly-linked chain of edge–vertex pairs. Each edge is a relative transform; each vertex holds the organised point cloud (for IsInFOV) and a k-d tree (for kNN).
  - p.4: "a doubly-linked list of edge-vertex pairs is a good fit for these requirements, efficiently supporting O(1) addition/removal at ends, and O(1) for each step of IsInFOV()"
  - Pose corrections (e.g. loop closures) only rewrite the affected relative transforms. p.4: "Upon receiving a series of updated world-frame poses, NanoMap only updates a transform edge"
- *Parameters (Table I, p.5; checked on image).*
  - Inputs: 6-DOF poses at 100 Hz; pose corrections at 1–100 Hz; organised point clouds at 30–60 Hz.
  - Max sensor range 10–20 m.
  - Depth camera 320x240, 60 deg V, 90 deg H FOV.
  - History length N = 150–300 point clouds.
  - Covariance between sensor poses 0.005–0.02 m.
- *Downstream planner (p.5).* p.5: "This motion planner was as described previously [2], with the following modifications: (a) a full 3D motion primitive library of 125 primitives, (b) a collision-chance-constrained (maximum allowed collision probability of 0.001) rather than mixed-objective described previously"

**Quantitative results:**
- *Simulation setup (p.5).*
  - Unity urban environment. p.5: "The simulated depth camera was 30 Hz, 20 m range, and 46 deg FOVvertical."
  - Scenario: start at 5 m altitude, goal 200 m away, desired top speed 15 m/s, a wall with an overhang at 100 m. p.5: "The vehicle must aggressively decelerate, such that its velocity is outside of its current FOV."
  - Noise is added to the x/y accelerations only. p.5: "Since quadrotors can measure altitude directly with downward-facing lidars and barometers, we did not model noise in z."
- *Fig. 8 (p.6; read on 200-dpi render).* Pose-uncertainty modelling on vs off; 1200 trials; vehicle radius 0.4 m. Crash %:

  | σ_drift,5 s (m) | not modelled (red) | modelled (blue) |
  |---|---|---|
  | 0 | 3% | 3% |
  | 0.4 | 2% | 3% |
  | 0.7 | 8% | 2% |
  | 1.5 | 10% | 2% |
  | 3.6 | 28% | 3% |
  | 7.3 | 29% | 10% |

  - The axis label says 3.6, but the text says 3.8 m (see Caveats).
  - Text, p.5: "incorporating the uncertainty enables the vehicle to still stay safe 97-98% of the time, whereas the drift deteriorates the safety of the group that doesn’t incorporate pose uncertainty"
  - Text, p.5: "The ability to stay safe diminishes at massive levels of drift (7.3 m in 5 seconds), where the pose-uncertainty-modeled group only stays safe 90% of the time, but still more than the unmodeled group."
  - Text, p.5: "These experiments show (Figure 8) that incorporating pose uncertainty can have a substantial effect, in particular when the drift is on the order of 10 cm per second."
- *Fig. 9 (p.6; read on render).* Pose corrections ignored (green) vs used (orange); 1000 trials. Crash %:

  | Correction size (m) | ignored | used |
  |---|---|---|
  | 0.5 | 18% | 4% |
  | 1.0 | 19% | 3% |
  | 2.0 | 51% | 0% |
  | 5.0 | 66% | 2% |
  | 10.0 | 60% | 4% |

  - Text, p.6: "With pose corrections of 2 m or more, these jumps cause crashes more than 50%."
- *Fig. 10 (p.7; read from figure, approximate).* Benchmark data: p.6: "we used a data log of a quadrotor with a simulated 320 × 240 depth image with 20 m range traversing an approximately 200 m × 200 m urban environment". NanoMap history = 150. Time to insert one measurement plus n queries:
  - OctoMap ≈ 47 ms, Voxblox ≈ 44–45 ms and Ewok ≈ 14–15 ms (all 0.6 m voxels), roughly flat up to about 10^4 queries.
  - NanoMap best case ≈ 1 ms at 1 query, ≈ 2–3 ms at 10^3, ≈ 7 ms at about 6×10^3.
  - NanoMap worst case ≈ 7 ms at 10^3, ≈ 25 ms at about 6×10^3, and off the chart near 10^4.
  - p.6: "In the range of queries of our motion planner (2,500 queries), NanoMap is the fastest, even in the worst-case."
  - p.6: "our planner on average has approximately 75% best-case queries"
  - **The CPU used for the benchmark is not stated.**
- *Fig. 11 (p.7; approximate, log scale).* Updating 1 / 100 / 1000 poses:

  | Package | 1 pose | 100 poses | 1000 poses |
  |---|---|---|---|
  | NanoMap | ≈ 0.05 ms | ≈ 2 ms | ≈ 11 ms |
  | Ewok | ≈ 14 ms | ≈ 80 ms | ≈ 1.3 s |
  | Voxblox | ≈ 45 ms | ≈ 1.4 s | ≈ 13 s |
  | OctoMap | ≈ 47 ms | ≈ 4.8 s | ≈ 45 s |

  - p.7: "NanoMap is two to four orders of magnitude faster than the others"
- *Recency of the frame that answers a query (p.7, Fig. 12).*
  - p.7: "with 74.4% of queries falling within the current FOV, and a cumulative 92.3% of queries satisfied with the last 40 measurements"
  - Setup, Fig. 12 caption: "This data is from a 13 second flight traveling approximately 50 m in low clutter with a 30 Hz depth sensor, 10 m range, and 45 deg FOVvertical."
  - p.7: "During aggressive obstacle avoidance maneuvers (between ∼ 9 to 11 seconds into flight), there is expectedly more of a need to use memory."
  - Fig. 12 also shows that about 20% of queries are 'not in history' while hovering at the start, and fewer during the dodging phase *(read from figure, approximate)*.
- *Hardware (p.7).*
  - Sensors: Intel RealSense r200 outdoors and ASUS Xtion indoors.
  - p.7: "Notable other vehicle hardware includes: a dual-core Intel NUC i7, a 450 mm Flamewheel DJI frame, and monocular Point Grey Flea3 camera and ADIS 16448 IMU for visual-inertial state estimation."
  - p.7: "We have flown at up to 10 m/s in forested canopy environments with the Intel r200 (empirically, we observe 20+ m range in high-texture environments), and 8 m/s in indoor warehouse environments with the ASUS Xtion"
  - No onboard timing of NanoMap itself is reported for the hardware runs.
- *Latency of a learned depth network:* not applicable. There is no neural network in this paper.

**Limitations stated by the authors:**
- Depth-sensor noise is not modelled (p.1, quoted above). Occlusions are not addressed by adding more FOV (pp.1–2, quoted above).
- Only spherical robots and static environments (p.2, quoted above).
- Only translational uncertainty is modelled, not rotational (p.3, quoted above). The FOV test uses a 1-σ AABB and an occlusion check of the mean only (p.4, quoted above).
- Variable query time. p.6: "NanoMap has variable query time, based on how deep in history the query searches"
- Computational trade-off. p.6: "For small amounts of queries, this tips the computational advantage to NanoMap, whereas for large amounts of queries, the fusion-based packages have an advantage."
- The design should be sized for the worst case. p.6: "it is important to specify the system to worst-case timing, since as shown in Figure 12, more memory is used during critical dodging maneuvers."
- Very large drift still causes crashes: 90% safe at 7.3 m drift (p.5, quoted above).
- A memoryless 2D lidar is of limited use. p.7: "A Hokuyo 2D lidar sensor also aided obstacle perception for many of these flights, but it was used in a memoryless fashion, and due to its 0-deg vertical FOV was not useful during aggressive high-attitude maneuvers."

**Citable statements:**
1. Thay vì hợp nhất các khung độ sâu vào một bản đồ chung, có thể lưu lịch sử khung độ sâu kèm biến đổi tư thế tương đối và tra cứu khung nhìn phù hợp cho từng điểm truy vấn. — p.1: "The key idea of NanoMap is to store a history of noisy relative pose transforms and search over a corresponding set of depth sensor measurements for the minimum-uncertainty view of a queried point in space."
2. Bản đồ hợp nhất (occupancy grid) nhạy với sai số ước lượng trạng thái và tốn tính toán. — p.1: "In particular, both their fragile sensitivity to state estimation errors and computational cost can be limiting."
3. Phương pháp không có bộ nhớ (chỉ dùng khung độ sâu hiện tại) ít bị ảnh hưởng bởi sai số tư thế nhưng bỏ sót thông tin và thu hẹp không gian tự do cho thao tác động. — p.1: "These approaches are less prone to state estimation errors, but fail to capture all available information." p.2: "including that the restricted memoryless free space provides less space for dynamic manuevers"
4. Để tránh va chạm chỉ cần xác định chắc chắn vùng không gian tự do, không cần tái tạo 3D chi tiết. — p.2: "Rather than averaging many measurements to create intricate 3D reconstructions, mapping for obstacle avoidance only needs to robustly determine collision-free space."
5. Khi quỹ đạo dự kiến ra ngoài trường nhìn hiện tại, vẫn có thể lập kế hoạch bằng lịch sử các khung độ sâu gần đây. — pp.2–3: "In the case that the planned trajectory does not fall within the current field of view, it is still possible to perform robust trajectory planning by using the history of depth measurements."
6. Một điểm thuộc không gian tự do đã quan sát của một khung khi nó nằm trong FOV, trước bề mặt đo được (không bị che khuất) và trong tầm cảm biến. — p.4: "Projecting the mean of the uncertain point into the depth image, as described in Figure 4, can be used to efficiently check a series of inequalities (inside each of lateral and vertical FOV, occluded, not beyond sensor horizon) to determine if the point is in free space."
7. Phần lớn truy vấn va chạm được trả lời bởi khung hiện tại hoặc vài chục khung gần nhất. — p.7: "with 74.4% of queries falling within the current FOV, and a cumulative 92.3% of queries satisfied with the last 40 measurements"
8. Trong các thao tác né tránh gấp, quỹ đạo rời khỏi FOV hiện tại nên cần dùng nhiều bộ nhớ hơn. — p.7: "During aggressive obstacle avoidance maneuvers (between ∼ 9 to 11 seconds into flight), there is expectedly more of a need to use memory." p.6: "more memory is used during critical dodging maneuvers"
9. Với occupancy grid, vật cản đã thấy nhưng nằm ngoài FOV sẽ trôi theo tư thế ước lượng; cập nhật Bayes không xử lý được trôi tư thế. — Fig. 2, p.2: "occupied cells outside FOV will drift with estimated pose history"; p.3: "Although the Bayesian update in occupancy grids may well model 0-mean Gaussian noise of both poses and depth sensing, it does not handle the case of pose drift."
10. Mô hình hóa bất định tư thế theo từng khung giúp giữ an toàn khi trôi cỡ 1% (khoảng 10 cm/s); mô phỏng: 97–98% an toàn so với 8–28% va chạm khi không mô hình hóa (Fig. 8). — p.5: "incorporating the uncertainty enables the vehicle to still stay safe 97-98% of the time, whereas the drift deteriorates the safety of the group that doesn’t incorporate pose uncertainty"
11. NanoMap mô hình hóa bất định tư thế nhưng không mô hình hóa nhiễu của chính cảm biến độ sâu (khác biệt với mô hình lỗi độ sâu đơn mắt của chúng tôi). — p.1: "we focus on a method of incorporating pose uncertainty, but modeling the noise of the depth sensor itself is outside of scope"

**Relation to our method:**
- *Where to cite:*
  - Related work: history of depth frames instead of a fused map (statements 1–3, 9).
  - Method: justify the free-space-by-projection test of our coverage scheduler (statements 4–6).
  - Discussion: memory and obstacles leaving the FOV (statements 7–8), and pose uncertainty (statement 10).
- *Same:*
  - Both keep the last few depth frames, each registered with the pose at capture time, and do not fuse them into a world map.
  - Both decide whether a point of the planned path lies in observed free space by projecting it into each stored frame. The point must be inside the FOV, in front of the measured depth and within range; space outside the FOV or behind surfaces does not count as free. This is the same partition as Fig. 4 of NanoMap.
  - Both are motivated by a quadrotor whose planned motion can leave the current FOV.
- *Different:*
  - (i) Purpose. NanoMap answers collision and nearest-obstacle queries for a chance-constrained motion-primitive planner. Our coverage test decides **when to trigger a new depth inference**, i.e. perception scheduling. Collision avoidance in our method uses a separate cylinder-landmark memory, MPC and a CBF. (our inference: NanoMap has no perception scheduling, so it is prior art for the free-space test but not for the trigger.)
  - (ii) History size and data. NanoMap: N = 150–300 full organised point clouds with k-d trees from 30–60 Hz RGB-D/stereo sensors (Table I). Ours: K = 8 coarse 18×32 grids from a monocular network with about 0.1 s latency. At about 10 Hz our window is on the order of 0.8 s, versus 5 s (150 frames at 30 Hz) in NanoMap (our inference).
  - (iii) Uncertainty. NanoMap propagates translational pose covariance along the chain and uses a 1-σ AABB. It explicitly does **not** model depth-sensor noise. Our error model is the opposite: monocular depth with per-frame scale, inverse-depth shift, a correlated field and pixel noise. The pose-uncertainty side of our frame registration is not described in our method summary (our inference: NanoMap is the natural citation if we add or omit per-frame pose covariance).
  - (iv) Sensor assumption. NanoMap's premise that depth data are clean enough to avoid fusion (p.2) was stated for active/stereo depth sensors. It may not hold for learned monocular depth with scale and shift errors (our inference). In the paper we should cite it as a motivation for the frame-history idea, not as evidence about monocular depth quality.
- *On claim (d):*
  - NanoMap shows that queries during dodging manoeuvres reach deeper into history (Fig. 12), and that a memoryless 2D sensor was not useful in aggressive manoeuvres (p.7).
  - Our residual collisions come from the obstacle memory dropping parts of obstacles that were already seen (tracks forgotten after 3 unmatched frames, or when out of view and > 10 m away). A raw-frame history like NanoMap's keeps all seen geometry for the whole window, regardless of association success. This contrast is worth noting in the Discussion as a possible remedy (our inference).

**Caveats:**
- Preprint as printed (arXiv v1, 25 Feb 2018). The PDF does not print a venue; do not cite it as ICRA from this PDF.
- **Hidden text on p.4:**
  - `pdftotext` extracts a block from an older draft that is **not visible** on the rendered page. It has a heading 'IV. DEPTH-POSE-GRAPH PLANNING', a 'depth-pose-graph' definition and duplicate Eq. (2) variants with 'R_range'. It apparently sits inside the embedded Fig. 4 graphic.
  - None of that text is quoted here, and it must not be cited.
  - The visible Eq. (2) uses z < d_{u,v} and z < d_range (checked on the image).
- Inconsistent numbers:
  - The text gives σ_drift = 3.8 m, but the Fig. 8 axis says 3.6.
  - Vertical FOV appears as 46 deg (sim, p.5), 45 deg (Fig. 12) and 60 deg V (Table I example).
  - Section numbering: the text refers to 'Section IV-A.2' for IsInFOV.
- All robustness numbers come from simulation (one scenario, Unity). Hardware results are qualitative (top speeds and video). The benchmark CPU is not stated.
- Equations (covariance recursion, mean chain, Eq. 2) are garbled in the text extraction. I read them on the rendered pp.3–4 and only paraphrase them above.

---

### G9a-2 — DepthART: Scaling Foundation Monocular Depth to Tiny Models
**Bibliographic data:**
- Authors and affiliations (p.1):
  - Feng Xue (University of Trento)
  - Wu Chen, Mingshuai Zhao, Guofeng Zhong, Anlong Ming (corresponding author), Zhaowen Lin, Haiyang Zhang (Beijing University of Posts and Telecommunications)
  - Haozhe Wang (The Hong Kong University of Science and Technology)
  - Dianqiao Lei (Tsinghua University)
  - Nicu Sebe (University of Trento)
- Identifier: arXiv:2607.17099v1 [cs.CV], 19 Jul 2026 (arXiv stamp, p.1). 11 pages.
- **Venue: none.** The PDF uses the unfilled ACM template. The running header is 'Conference acronym ’XX, June 03–05, 2018, Woodstock, NY'. The reference format reads, p.2: "Proceedings of Make sure to enter the correct conference title from your rights confirmation email". The DOI is the placeholder https://doi.org/XXXXXXX.XXXXXXX, so **no real DOI**.
- Code and project page: xuefeng-cvr.github.io/DepthART (p.2).

Pages read: 11/11 (no appendix).

Status: **USE (narrow)**. It is a computer-vision model paper, not robotics, and has no closed loop. It is useful only as recent measured evidence for claim (a): on-device latency of monocular depth networks on Jetson-class hardware, with precision, power mode and resolution stated. It also gives indirect support for claim (b): relative depth is evaluated after per-image scale-and-shift fitting, and per-image scale/shift corrections stay variable even after metric fine-tuning.

**Problem & setting:**
- Foundation monocular depth estimation (MDE) gains have not reached tiny models. p.1: "Recent geometric foundation models (e.g., Metric3D, Depth Anything and UniDepth) have substantially improved monocular depth estimation (MDE) in both cross-scene generalization and metric-scale prediction, yet these gains have not translated to tiny models." p.2: "However, these foundation capabilities have not become standard for tiny models that must run in real time on resource-limited devices."
- Two bottlenecks. p.1: "We first identify two capacity-driven bottlenecks in tiny models: (i) overfitting to dataset-specific distribution bias and (ii) unstable metric adaptation under camera shift, where full fine-tuning easily damages transferable geometry."
- Camera dependence of tiny models. p.2: "Tiny models often rely on implicitly encoded camera cues. As a result, full fine-tuning on a single metric dataset may improve in-domain accuracy, but it transfers poorly across cameras and more easily damages previously learned scene geometry."
- Lightweight MDE baselines are single-domain. p.3: "lightweight MDE methods, including FastDepth[51], DANet[40], GuideDepth[36], and LMDepth[23], are still trained and evaluated within a single domain, but with more efficient structure design. Therefore, they generally lag behind foundation models."
- Robots are listed only as one application among others. p.2: "serves as a core geometric primitive for downstream multimedia systems, such as image/video synthesis [16, 65, 67, 68], world models [3, 33], mobile robots [25, 61], and augmented reality [21]"

**Method:**
- *Architecture.* p.3: "DepthART adopts a compact Mamba-style encoder, i.e., TinyViM [24], paired with a widely used DPT decoder [31], forming a lightweight trunk." The three sizes have 6.0M / 11.4M / 32.6M parameters (Table 1, p.6).
- *Stage 1: bias-resistant distillation.*
  - p.3: "In the first stage, we distill DepthART from a large foundation MDE model, e.g., Depth Anything v2, to inherit robust cross-scene affine-invariant depth generalization."
  - BRDS (Eqs. 1–3, p.4): Stable Diffusion v1.5 VAE latents are reduced with PCA to J = 8 dimensions and binned per dimension with B = 10 bins. Each grid cell is uniformly subsampled to max(1, ⌈|D_c|/γ⌉) images. The result is a 1.7M-image pool drawn from a 44M corpus (Fig. 2 caption, p.3; p.5: "resulting in a 1.7M image training set").
  - Loss (Eq. 4, p.4): MSE plus 0.5 × edge loss, where the MSE is computed after per-image scale/shift alignment. p.4: "measures the error between the teacher pseudo-depth and the student prediction after per-image scale/shift alignment". Robustness detail, p.4: "ignores the top-10% highest-error pixels in each image, preventing a few noisy pixels from dominating the distillation signal".
- *Stage 2: camera-conditioned metric fine-tuning (CamFT).*
  - p.3: "In the second stage, we freeze the distilled encoder and perform camera-conditioned fine-tuning (see Sec. 3.3) on a single metric dataset, i.e., NYUD v2 or KITTI."
  - Pyramid camera prompts are built from the intrinsics with a ray field and Fourier encoding, at strides 4, 8, 16 and 32 (p.5).
  - Camera adapter (Eq. 6): residual cross-attention, 1 layer and 1 head.
  - Multi-query scale head (Eq. 7): Q = 8 learnable queries, a 2-layer 4-head decoder and an MLP with sigmoid, averaged over the queries.
  - Metric output (Eq. 5; checked on the p.4 image): metric depth = d_max · (s ⊙ relative depth), with relative depth rescaled to [0, 1]. d_max = 10 for NYUD v2 and 80 for KITTI (p.7).
  - Scale only. p.4: "We deliberately use a scale-only formulation in this work. This choice is not meant to imply that shift correction is universally unnecessary." p.4: "Rather, in the tiny regime, we find it preferable to keep metric calibration simple and stable, so that adaptation does not interfere excessively with the transferred relative-depth prior."
  - Reason for the multi-query head. p.5: "Estimating a single global scale from a tiny backbone is usually unstable, as the prediction may be affected by spurious textures or local outliers."
  - Fine-tuning loss (Eq. 8): SiLog loss plus an edge loss.
- *Assumptions.*
  - Known intrinsics (p.10, quoted under Limitations).
  - Only small camera variations during training. p.7: "We further apply mild intrinsics perturbation during CamFT by randomly rescaling images to [0.9, 1.1] and cropping [0.8, 1.0] of the resized area, which serves as regularization for small camera variations rather than severe intrinsics noise or missing metadata."
  - The paper does **not** say whether the relative output and the scale/shift alignment are in depth or inverse-depth (disparity) space. The words disparity and inverse depth do not appear in the paper.

**Quantitative results:**
- *Latency: desktop (Table 1 p.6, Table 6(a) p.9).*
  - Conditions. p.6: "DepthART is trained on an A800, while all desktop latency is measured on an RTX A6000 with batch size 1 under strict FP32 execution with TF32 disabled." Table 1 caption, p.6: "should thus be interpreted as deployment-oriented throughput rather than a strict same-resolution speed benchmark".
  - Definitions. p.9: "M-Lat. and E2E denote model-only and end-to-end latency, respectively. Mem. denotes peak CUDA-allocated memory." **What E2E includes (pre-processing, resize, host–device copies, post-processing) is not defined.** The framework for the A6000 numbers is not stated explicitly.
  - Table 6(a), checked on the 170-dpi render, in ms:

    | Model | Resolution | M-Lat. | E2E |
    |---|---|---|---|
    | DepthART-S | 224² | 2.88 | 3.72 |
    | DepthART-B | 224² | 3.36 | 4.19 |
    | DepthART-L | 224² | 5.23 | 6.08 |
    | DepthART-S | 448² | 4.09 | 6.98 |
    | DepthART-B | 448² | 4.91 | 7.75 |
    | DepthART-L | 448² | 8.07 | 10.93 |
    | Depth Anything v2-S | 518² | 13.06 | 21.70 |
    | Depth Anything v2-B | 518² | 33.04 | 40.77 |
    | Depth Anything v2-L | 518² | 102.46 | 145.71 |
    | MiDaS v3.1-LeViT | 224² | 3.42 | 10.10 |
    | MiDaS v3.1-Swin2-T | 256² | 7.31 | 13.66 |

  - Table 1 (p.6) also lists Metric3D v2 ViT-S at 74.99 ms and ViT-L at 452.54 ms native latency.
- *Latency: embedded (Table 6(b), p.9).*
  - Conditions. Jetson Orin NX 8GB, "FP32 with TF32 enabled, MAXN" (table header, read on the image), relative depth.
  - **Batch size and framework are not stated for the Orin.** Fig. 6's PyTorch-FP32 MAXN markers match the Table 6(b) M-Lat. values (e.g. S at 224² ≈ 9.8 ms), so Table 6(b) is probably PyTorch (our inference).
  - Values in ms:

    | Model | Resolution | M-Lat. | E2E | Peak mem. (MB) |
    |---|---|---|---|---|
    | Depth Anything v2-S | 512² | 126.40 | 127.15 | 124.71 |
    | DepthART-S | 448² | 29.48 | 40.40 | 59.29 |
    | DepthART-B | 448² | 35.35 | 46.09 | — |
    | DepthART-L | 448² | 61.22 | 67.10 | — |
    | Depth Anything v2-S | 228² | 18.94 | 21.65 | — |
    | DepthART-S | 224² | 9.80 | 12.43 | — |
    | DepthART-B | 224² | 11.59 | 14.20 | — |
    | DepthART-L | 224² | 18.02 | 20.63 | — |

  - p.9: "On the Orin NX, the relative-depth S/B/L models reach 102/86/55 FPS at 224² and 34/28/16 FPS at 448² in FP32 with TF32 enabled, with end-to-end latencies of 12.43–20.63 ms and 40.40–67.10 ms, respectively."
- *Fig. 6 (p.9; model-only latency on the Orin NX across power modes; read from the 300-dpi crop, approximate ±2 ms below 50 ms and ±5 ms above).* Values for S / B / L:

  | Task, resolution | TensorRT FP32 10W | TensorRT FP32 MAXN | TensorRT FP16 10W | TensorRT FP16 MAXN | PyTorch FP32 MAXN |
  |---|---|---|---|---|---|
  | Relative, 224² | ≈ 13 / 15.5 / 25 | ≈ 6 / 7.7 / 12 | ≈ 8 / 9.6 / 15 | ≈ 4 / 4.7 / 7.7 | ≈ 9.8 / 11.6 / 18 |
  | Relative, 448² | ≈ 41 / 48 / 78 | ≈ 20 / 24 / 46 | ≈ 24 / 29 / 48 | ≈ 11 / 13.5 / 22 | ≈ 29.5 / 35 / 61 |
  | Metric (CamFT), 448² | ≈ 187 / 196 / 226 | ≈ 93 / 100 / 125 | ≈ 49 / 55 / 75 | ≈ 22 / 24 / 34 | ≈ 84 / 91 / 125 |

  - Caption, p.9: "TensorRT FP32 and TensorRT FP16 results are shown across the 10W, 15W, 20W, and MAXN modes, while PyTorch FP32 results are reported at MAXN only. FP32 execution enables TF32 acceleration."
  - Text, p.9: "TensorRT consistently reduces latency across model scales and resolutions, with FP16 providing the highest throughput, while higher power modes yield further acceleration."
- *Jetson Nano 4GB.* p.9: "Although incomplete Jetson Nano 4GB measurements are omitted from the table, DepthART-S still exceeds 15 FPS for 224² relative-depth inference in strict FP32 on it." No latency table, framework or E2E figure is given.
- *Accuracy: zero-shot affine-invariant depth (Table 1, p.6).* DepthART-S has AbsRel/δ1 = 0.059/0.964 on NYUD v2 and 0.082/0.930 on KITTI. Depth Anything v2-S has 0.053/0.973 and 0.078/0.936.
- *Accuracy: metric depth without re-scaling (Table 2, p.6).*
  - DepthART-S fine-tuned on NYUD v2 (δ1 / RMSE): 0.924/0.340 in domain; 0.713/0.693 on iBims-1; 0.809/0.379 on SUN RGB-D; 0.292/1.687 on DIODE Indoor.
  - DepthART-S fine-tuned on KITTI: 0.943/3.12 in domain; 0.811/7.140 on DDAD; 0.228/6.518 on ETH3D Outdoor; 0.216/9.862 on DIODE Outdoor.
- *Scale/shift variability (Fig. 3, p.4; values checked on the 300-dpi crop).*
  - Affine-invariant RMSE on NYUD v2 (in domain): 0.27 pre-trained, 0.234 after full fine-tuning, 0.237 after CamFT.
  - On iBims-1 (zero-shot): 0.333, 0.421 and 0.354.
  - Per-image alignment deviation on iBims-1, scale/shift: 0.387/0.712 with full fine-tuning and 0.361/0.542 with CamFT. Text, p.4: "Fig. 3(b) shows increased variability in the per-image scale and shift alignment parameters on iBims-1 after full fine-tuning (std : 0.387/0.712), reflecting unstable scale transfer."
- *Ablations (Tables 3–5, p.8).*
  - BRDS vs Random at 1.7M, NYUD δ1: 0.964 vs 0.957.
  - Freezing plus CamAdp plus MQSH vs full fine-tuning, iBims-1 δ1: 0.713 vs 0.572.
  - The cross-attention adapter is best (Table 5).

**Limitations stated by the authors:**
- p.10: "(1) CamFT still follows the Depth Anything fine-tuning setting. Large-scale metric-depth training, e.g., in the spirit of UniDepth/Metric3D, is a key step to further strengthen metric-scale reliability. (2) CamFT assumes known camera intrinsics."
- p.10: "We will explore intrinsics estimation, e.g., GeoCalib [47], to reduce this reliance and enable metric depth without metadata."
- Forgetting. p.4: "Due to limited capacity, fully fine-tuning tiny models on a single metric dataset might easily overwrite the transferable depth cues learned via distillation, causing catastrophic forgetting."
- Comparison scope. p.6: "We exclude diffusion-based methods because they are typically much slower, and self-supervised methods because they follow a different paradigm." UniDepth and Metric3D are not direct baselines for metric depth (p.6).
- Nano results are incomplete (p.9, quoted above).

**Citable statements:**
1. Các mô hình độ sâu đơn mắt nền tảng chưa được chuyển thành mô hình nhỏ chạy thời gian thực trên thiết bị hạn chế tài nguyên. — p.2: "However, these foundation capabilities have not become standard for tiny models that must run in real time on resource-limited devices."
2. Trên Jetson Orin NX 8GB (FP32 với TF32, chế độ MAXN), mạng độ sâu tương đối nhỏ cần khoảng 12–21 ms (224²) đến 40–67 ms (448²) đầu-cuối; Depth Anything v2-S ở 512² cần khoảng 126 ms (Table 6(b)). — p.9: "On the Orin NX, the relative-depth S/B/L models reach 102/86/55 FPS at 224² and 34/28/16 FPS at 448² in FP32 with TF32 enabled, with end-to-end latencies of 12.43–20.63 ms and 40.40–67.10 ms, respectively."
3. Độ trễ trên phần cứng nhúng phụ thuộc mạnh vào runtime/độ chính xác (PyTorch FP32, TensorRT FP32/FP16) và chế độ công suất; theo Fig. 6 độ trễ chỉ-mô-hình trải từ khoảng 4 ms đến khoảng 226 ms tùy cấu hình (đọc từ hình, xấp xỉ). — p.9: "TensorRT consistently reduces latency across model scales and resolutions, with FP16 providing the highest throughput, while higher power modes yield further acceleration."
4. Trên Jetson Nano 4GB, ngay cả mô hình nhỏ nhất (6M tham số) chỉ đạt trên 15 FPS ở 224² FP32, tức là cỡ vài chục ms mỗi khung (our inference: < ~67 ms). — p.9: "DepthART-S still exceeds 15 FPS for 224² relative-depth inference in strict FP32 on it"
5. Độ sâu tương đối (affine-invariant) chỉ được đánh giá sau khi khớp tỷ lệ và độ dịch riêng cho từng ảnh bằng bình phương tối thiểu. — p.1: "Affine-invariant depth is evaluated by per-image least-squares scale-and-shift fitting over valid pixels"
6. Ngay cả sau tinh chỉnh metric, tham số hiệu chỉnh tỷ lệ và độ dịch theo từng ảnh vẫn biến thiên đáng kể trên dữ liệu ngoài miền, nghĩa là tỷ lệ metric không ổn định. — p.4: "Fig. 3(b) shows increased variability in the per-image scale and shift alignment parameters on iBims-1 after full fine-tuning (std : 0.387/0.712), reflecting unstable scale transfer."
7. Ước lượng một hệ số tỷ lệ toàn cục từ mạng nhỏ thường không ổn định. — p.5: "Estimating a single global scale from a tiny backbone is usually unstable, as the prediction may be affected by spurious textures or local outliers."
8. Độ sâu metric từ mô hình nhỏ chuyển miền kém: tinh chỉnh trên NYUD v2 đạt δ1 = 0.924 trong miền nhưng chỉ 0.292 trên DIODE Indoor, không hậu xử lý tỷ lệ (Table 2). — Table 2 caption, p.6: "Models are fine-tuned on NYUD v2 or KITTI with metric supervision and directly tested on unseen datasets."

**Relation to our method:**
- *Where to cite:*
  - Introduction and Method (latency assumption): statements 2–4, as evidence that onboard depth inference costs tens of ms even for tiny networks on Jetson-class boards, and around 100+ ms for a small foundation model (Depth Anything v2-S at 512²) or in low-power modes.
  - Method (error model) and Related work: statements 5–8, for the per-frame scale/shift ambiguity and instability.
- *Same:* a learned monocular network for depth, evaluated per image with scale and shift alignment. This matches our per-frame scale plus shift error model in spirit.
- *Different:*
  - Our input is 320×180 = 57,600 px. This is close in pixel count to 224² = 50,176 and far below 448² (our inference).
  - Our assumed 80 ms inference plus 20 ms capture/transfer sits:
    - above DepthART-S/B/L on the Orin NX at 224² (≈ 10–21 ms), and
    - in the range of DepthART-L at 448² in PyTorch, metric CamFT models on the Orin at MAXN (≈ 84–125 ms, Fig. 6), Depth Anything v2-S at 512² (≈ 126 ms), and lower-power modes (our inference).
  - So the 80 ms assumption is consistent with these measurements for a 'low-cost' board weaker than an Orin NX, or for a non-TensorRT/FP32 deployment. It is not a measurement of our setting (our inference).
  - DepthART's metric head is scale-only; our error model includes an inverse-depth shift. DepthART's Fig. 3(b) shows that shift variability exists, but the paper does not say whether its shift is in depth or inverse depth. So it supports 'per-frame shift errors exist', not specifically 'inverse-depth shift' (our inference).
  - No closed loop, no robot, no timing of the camera pipeline.
- *Metric-head cost (our inference from Fig. 6):* on the Orin NX at 448², metric (CamFT) inference is about 3× slower than relative inference for the same backbone (S: ≈ 84 vs ≈ 29.5 ms in PyTorch FP32 at MAXN). This is relevant if our pipeline needs metric output. The authors do not comment on it; they only say the adapter is 'intentionally small to preserve real-time inference' (p.5).

**Caveats:**
- **Very recent, unreviewed preprint** (arXiv v1, 19 Jul 2026). The ACM template placeholders (venue 'Conference acronym ’XX … 2018, Woodstock, NY', DOI XXXXXXX) mean no venue may be cited. Cite it as an arXiv preprint.
- What E2E latency includes is never defined. The Orin batch size and the framework of Table 6(b) are not stated.
- Resolutions differ between compared models: DA-v2-S at 228² vs DepthART at 224² on the Orin; native resolutions in Table 1. The authors themselves warn against reading Table 1 as a same-resolution benchmark.
- Jetson Nano numbers are 'incomplete' and only given as '> 15 FPS'.
- *Fig. 6 values are read from a plot (approximate).*
  - In the Metric-448 panel, TensorRT FP32 at MAXN (≈ 93/100 ms for S/B) appears slower than PyTorch FP32 (≈ 84/91 ms). This sits uneasily with the text's 'TensorRT consistently reduces latency'. Check the plot before citing exact metric-depth timings.
- Superscripts were flattened in the text extraction ('2242' means 224², '4482' means 448²). Tables and equations were verified on rendered pages.
- The paper says nothing about robotics, closed loops or temporal consistency. Do not use it for claims (c) or (d).
