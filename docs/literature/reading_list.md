# Danh sách đọc cho literature review (DART-UAV)

Quy tắc làm việc:

* Chỉ trích dẫn một bài **sau khi đã đọc toàn văn**. Không dùng abstract/snippet để viết nội dung.
* Đọc xong mà không liên quan → loại khỏi danh sách trích dẫn (ghi lý do).
* Một mệnh đề có thể có nhiều trích dẫn nếu từng bài thực sự bổ sung ý nghĩa.
* Mỗi bài đã đọc có ghi chú chi tiết trong [`notes/`](notes/): bài toán, phương pháp, kết quả định lượng, giới hạn, quan hệ với DART, và các mệnh đề trích dẫn được kèm **số trang + trích nguyên văn**.
* Mọi trích dẫn nguyên văn trong `notes/` đã được đối chiếu tự động với toàn văn PDF bằng [`verify_quotes.py`](verify_quotes.py). Những chỗ không khớp tự động (công thức, chữ bị ngắt bởi chú thích hình hoặc chân trang) đã được kiểm tra bằng tay. Các chuỗi trong ngoặc kép ở phần "Relation to DART" là diễn giải, không phải trích dẫn.

Trạng thái: `đã đọc – dùng` · `đã đọc – dùng (hẹp)` · `đã đọc – loại` · `cần tải tay` · `chưa đọc`.

## Bài do bạn cung cấp PDF (paywalled) — đã đọc toàn văn

PDF không được đưa lên GitHub (bản quyền; `.gitignore` chặn `docs/literature/**/*.pdf`); chỉ ghi chú được lưu. Với N13–N15, ngoài agent, Claude đã tự đọc toàn văn trước khi sửa phần định vị tính mới.

| ID | Bài | Ghi chú |
|---|---|---|
| E5 | L. Wang, A. D. Ames, M. Egerstedt, *Safety Barrier Certificates for Collisions-Free Multirobot Systems*, IEEE T-RO 33(3):661–674, 2017 | [`notes/g8c_wang_mehrotra.md`](notes/g8c_wang_mehrotra.md) |
| M1 | S. Mehrotra, *On the Implementation of a Primal-Dual Interior Point Method*, SIAM J. Optim. 2(4), 1992 | như trên |
| H1 | Y. Bar-Shalom, *Update with Out-of-Sequence Measurements in Tracking: Exact Solution*, IEEE TAES 38(3):769–777, 2002 | [`notes/g8b_barshalom_liu.md`](notes/g8b_barshalom_liu.md) |
| A6 | S. Liu, M. Watterson, S. Tang, V. Kumar, *High Speed Navigation for Quadrotors with Limited Onboard Sensing*, ICRA 2016 | như trên |
| N13 | I. Gog et al., *D3: A Dynamic Deadline-Driven Approach for Building Autonomous Vehicles*, EuroSys 2022 | [`notes/g8a_d3_pant_shahsavari.md`](notes/g8a_d3_pant_shahsavari.md) |
| N14 | Y. V. Pant et al., *Anytime Computation and Control for Autonomous Systems*, IEEE TCST 29(2):768–779, 2021 | như trên |
| N15 | S. Shahsavari et al., *A Coordinated Approach to Control Mechanical and Computing Resources in Mobile Robots*, IEEE T-RO 41:347–363, 2025 | như trên |

## A. Độ trễ / tần số perception và an toàn

| ID | Bài | Toàn văn | Trạng thái | Vai trò (đã kiểm chứng từ toàn văn) |
|---|---|---|---|---|
| A1 | D. Falanga, S. Kim, D. Scaramuzza, *How Fast Is Too Fast? The Role of Perception Latency in High-Speed Sense and Avoid*, IEEE RA-L 4(2), 2019 | bản tác giả rpg.ifi.uzh.ch, 15/15 tr. (cả phụ lục) | đã đọc – dùng | Cận latency một lần, tất định (latency ≤ s/v − 2·sqrt(r/ū)); DART tổng quát hoá thành khoảng mở an toàn tính lúc chạy. Phụ lục: né ngang nhanh hơn phanh ở tốc độ cao → cận chỉ-phanh của DART là bảo thủ. |
| A2 | A. Loquercio et al., *Learning High-Speed Flight in the Wild*, Science Robotics 6(59), 2021 (arXiv:2110.05113) | 23/23 | đã đọc – dùng | Số liệu latency onboard (suy luận chiếm 38.9/41.6 ms trên Jetson TX2); mở rộng cận A1 với thời gian quay. Không có thích nghi tần số, bất định, bù trễ. |
| A3 | A. Bhattacharya et al., *Monocular Event-Based Vision for Obstacle Avoidance with a Quadrotor*, CoRL 2024 (arXiv:2411.03303) | 18/18 | đã đọc – dùng (hẹp) | Số liệu: suy luận depth học được onboard 73 ms, lớn hơn nhiều so với latency cảm biến. |
| A4 | H. Zhao et al., *Towards Safety-Aware Computing System Design in Autonomous Vehicles* (arXiv:1905.08453) | 14/14 | đã đọc – dùng | Tương tự gần nhất bên hệ thống tính toán: điểm an toàn theo thời gian đáp ứng so với cửa sổ quãng phanh; dùng để phân bổ CPU/GPU, không quyết định khi nào perception, không có bất định. Xe mặt đất. |
| A6 | S. Liu et al., *High Speed Navigation for Quadrotors with Limited Onboard Sensing*, ICRA 2016 | PDF người dùng, 8/8 | đã đọc – dùng | Coi vùng chưa biết là bị chiếm, "vật cản có thể hiện ra ngay sau g" (tr. 4); giới hạn tốc độ sao cho quãng bay trong thời gian xử lý + quãng phanh ≤ tầm cảm biến (Eq. 8) → cơ sở cho frontier; thời gian xử lý cố định 0.15 s, offline; có phần cứng. |
| A5 | A. Vyas et al., *TAPAS: Throughput-adaptive Perception for Autonomous Systems*, ESWEEK-CODES 2026 (arXiv:2607.17317) | 15/15 | đã đọc – dùng (đối chứng) | Thích nghi FPS theo độ phức tạp cảnh để tiết kiệm năng lượng, **tách** perception khỏi lập luận an toàn; đánh giá open-loop, không có chỉ số va chạm. |

## B. Monocular depth (module perception)

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| B1 | R. Ranftl et al., *Towards Robust Monocular Depth Estimation: Mixing Datasets for Zero-shot Cross-dataset Transfer* (MiDaS), IEEE TPAMI (arXiv:1907.01341) | 14/14 | đã đọc – dùng | Đầu ra là inverse depth chỉ đúng tới **thang đo và độ dịch** theo từng ảnh → cơ sở cho mô hình sai số scale + shift (`cfg.depth.sigma_shift`). |
| B2 | L. Yang et al., *Depth Anything*, CVPR 2024 (arXiv:2401.10891) | 18/18 | đã đọc – dùng | Inverse depth affine-invariant; kích thước ViT-S/B/L 24.8M/97.5M/335.3M; bản metric chuyển miền kém → coi thang đo là bất định. |
| B3 | L. Yang et al., *Depth Anything V2*, NeurIPS 2024 (arXiv:2406.09414) | 30/30 | đã đọc – dùng | Latency V100: 60 ms (Small) – 213 ms (Large) (đọc từ Fig. 1) → cơ sở cho giả thiết trễ hàng chục–hàng trăm ms; có bản fine-tune metric. |
| B4 | D. Wofk et al., *FastDepth*, ICRA 2019 (arXiv:1903.03273) | 8/8 | đã đọc – dùng | Số liệu Jetson TX2: 5.6–319 ms (GPU), 3.8–12.2 W tuỳ mạng; FastDepth rất nhanh (5.6 ms) → DART cần lập luận cho mô hình lớn / tính toán chia sẻ. |
| B5 | N. Simon, A. Majumdar, *MonoNav*, ISER 2023 (arXiv:2311.14100) | 13/13 | đã đọc – dùng | Hệ MAV gần nhất: ZoeDepth 0.11–0.16 s + trễ camera 0.12 s, 3–4 Hz; va chạm khi coi vùng chưa thám hiểm là trống; bảo thủ vì biên cố định. |

## C. Perception-aware planning, planner cục bộ, tránh vật cản có bất định

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| C1 | D. Falanga et al., *PAMPC*, IROS 2018 (arXiv:1804.04811) | 8/8 | đã đọc – dùng (hẹp) | Hướng ngược với DART: định hình chuyển động để VIO thấy tốt; không có vật cản, không có latency. |
| C2 | B. Zhou et al., *RAPTOR* (arXiv:2007.03465v1) | 16/16 | đã đọc – dùng | Kiểm tra quãng phanh tới biên vùng đã thấy (Eq. 6) → gần nhất với ràng buộc frontier; RAPTOR định hình quỹ đạo/yaw, không lập lịch perception, không latency/bất định. Có thử nghiệm thật. |
| C3 | J. Tordesillas et al., *FASTER*, IEEE T-RO (arXiv:2001.04420) | 17/17 | đã đọc – dùng | Luôn giữ quỹ đạo dừng an toàn trong vùng đã biết là trống; chứng minh với bản đồ không nhiễu. Ablation Safe-Trajectory (Table V) là mẫu cho ablation của DART. |
| C4 | B. Zhou et al., *Fast-Planner*, RA-L 2019 (arXiv:1907.01531) | 8/8 | đã đọc – dùng | Bối cảnh/baseline planner dựa trên bản đồ, tĩnh, không bất định/latency. |
| C5 | X. Zhou et al., *EGO-Planner*, RA-L 2020 (arXiv:2008.08835) | 8/8 | đã đọc – dùng | Bối cảnh/baseline; thiết kế cho môi trường tĩnh (vật cản < 0.5 m/s). |
| C6 | H. Zhu, J. Alonso-Mora, *Chance-Constrained Collision Avoidance for MAVs in Dynamic Environments*, RA-L 4(2):776–783, 2019 | bản xuất bản cuối, TU Delft repository, 10/10 | đã đọc – dùng | Cơ sở hình thức cho nửa không gian tiếp tuyến + phồng theo hiệp phương sai; track CV Kalman; không có latency, horizon cố định 1 s, không có safety filter. |
| C7 | J. Lin, H. Zhu, J. Alonso-Mora, *Robust Vision-based Obstacle Avoidance for MAVs in Dynamic Environments*, ICRA 2020 (arXiv:2002.04920) | 7/7 | đã đọc – dùng | Pipeline gần nhất: depth → ellipsoid có hiệp phương sai → track CV → chance-constrained MPC; perception mỗi frame 60 Hz (~8 ms) → baseline "luôn perception". |

## D. MPC horizon thích nghi

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| D1 | A. J. Krener, *Adaptive Horizon Model Predictive Control* (arXiv:1602.08619) | 6/6 | đã đọc – dùng (nền) | Định nghĩa AHMPC; horizon theo điều kiện Lyapunov/tập kết thúc, không theo rủi ro. |
| D2 | A. J. Krener, *Adaptive Horizon MPC and Al'brekht's Method* (arXiv:1904.00053) | 23/23 | đã đọc – dùng (nền) | Như D1. |
| D3 | E. Bøhn et al., *Reinforcement Learning of the Prediction Horizon in MPC*, IFAC 2021 (arXiv:2102.11122) | 6/6 | đã đọc – dùng | Horizon tốt nhất phụ thuộc độ bất định của thông tin vật cản tương lai. |
| D4 | L. Mümken et al., *Conflict-Predictive Variable Horizons in Multi-Drone Distributed MPC* (arXiv:2609.13270, đang review) | 15/15 | đã đọc – dùng (preprint) | Prior art trực tiếp nhất cho horizon theo rủi ro: horizon theo thời gian tới xung đột, horizon tối thiểu bao quãng phanh, có chứng minh khả thi. Không có perception/latency. |
| D5 | S. Gupta et al., *RL-based Variable Horizon MPC of Multi-Robot Systems* (arXiv:2308.07071) | 7/7 | đã đọc – dùng (hẹp) | Vấn đề xung đột nằm ngoài horizon khi horizon co lại. |
| D6 | K. Stachowicz, E. Theodorou, *Optimal-Horizon MPC with DDP* (arXiv:2111.09207) | 7/7 | **đã đọc – loại** | "Horizon" là thời gian kết thúc tự do của nhiệm vụ, không phải tầm nhìn theo rủi ro. |

## E. Control Barrier Function: nền tảng

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| E1 | A. D. Ames, X. Xu, J. W. Grizzle, P. Tabuada, *CBF Based QPs for Safety Critical Systems*, IEEE TAC 62(8), 2017 (arXiv:1609.06408) | 17/17 | đã đọc – dùng | Lý thuyết CBF/QP; barrier ACC theo phanh giả thiết **không có trễ phản ứng** (p.15). |
| E2 | A. D. Ames et al., *Control Barrier Functions: Theory and Applications*, ECC 2019 (arXiv:1903.11199) | 12/12 | đã đọc – dùng | Khung "safety filter" can thiệp tối thiểu. |
| E3 | W. Xiao, C. Belta, *CBFs for Systems with High Relative Degree*, CDC 2019 (arXiv:1903.04706) | 9/9 | đã đọc – dùng | HOCBF (tuỳ chọn trong DART), cho phép b(x,t) biến thiên theo thời gian; quãng phanh tối thiểu là cách xử lý xung đột với giới hạn phanh. |
| E4 | Q. Nguyen, K. Sreenath, *Exponential CBFs for Enforcing High Relative-Degree Constraints*, ACC 2016 | bản tác giả hybrid-robotics.berkeley.edu, 7/7 | đã đọc – dùng | HOCBF của DART (k1 = p1+p2, k0 = p1·p2) chính là ECBF bậc 2 với cực −p1, −p2. |
| E5 | L. Wang, A. D. Ames, M. Egerstedt, *Safety Barrier Certificates for Collisions-Free Multirobot Systems*, IEEE T-RO 33(3), 2017 | PDF người dùng, 14/14 | đã đọc – dùng | Barrier cho vật cản vận tốc hằng (tr. 664) **trùng dạng** với braking-CBF của DART (D_s/2+R_k → d(t)); hàng ràng buộc tuyến tính khớp eq. (7); chế độ phanh + bộ điều khiển phanh lai bảo đảm khả thi. DART thêm ḋ, ā_o, δ_a, αh tuyến tính, trạng thái ước lượng. |
| M1 | S. Mehrotra, *On the Implementation of a Primal-Dual Interior Point Method*, SIAM J. Optim. 2(4), 1992 | PDF người dùng, 27/27 | đã đọc – dùng (hẹp) | `dart_qp_solve.m` là predictor–corrector kiểu Mehrotra (σ = (μ_aff/μ)³, hiệu chỉnh bậc hai); khác: một bước chung primal/dual, hệ số 0.99 cố định, không có an toàn hàm thế. Bài viết cho LP, nêu mở rộng cho QP lồi là trực tiếp (tr. 7). |
| E5b | L. Wang, A. D. Ames, M. Egerstedt, *Safety Barrier Certificates for Heterogeneous Multi-Robot Systems*, ACC 2016 (arXiv:1609.00651) | 8/8 | đã đọc – dùng | Dạng chính xác của braking barrier h = sqrt(2(α_i+α_j)(‖Δp‖−D_s)) + (Δpᵀ/‖Δp‖)Δv (eq. 8); với α_j = 0 và D_s → d(t) ta suy ra h của DART (suy diễn của chúng ta). |
| E6 | J. Zeng, B. Zhang, K. Sreenath, *Safety-Critical MPC with Discrete-Time CBF*, ACC 2021 (arXiv:2007.11718) | 9/9 | đã đọc – dùng | Cơ sở hàng DCBF trong MPC; bài toán là NLP trừ khi barrier tuyến tính (ủng hộ nửa không gian tiếp tuyến). |
| E7 | U. Rosolia, A. D. Ames, *Multi-Rate Control Design Leveraging CBFs and MPC Policies*, IEEE L-CSS 5(3), 2020 (arXiv:2004.01761) | 6/6 | đã đọc – dùng | Kiến trúc MPC chậm + CBF nhanh có bảo đảm đa tần số; không có perception/latency. (Sửa tác giả: không có Singletary.) |
| I1 | T. Lee, M. Leok, N. H. McClamroch, *Control of Complex Maneuvers for a Quadrotor UAV using Geometric Methods on SE(3)* (arXiv:1003.2005) | 12/12 | đã đọc – dùng (cài đặt) | Tham chiếu cho vòng attitude; DART bỏ feed-forward, thêm giới hạn nghiêng/lực đẩy/bù cản → kết quả ổn định của I1 không áp dụng trực tiếp. |

## F. CBF với độ trễ, lấy mẫu, kích hoạt theo sự kiện, sai số perception

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| F1 | T. G. Molnar et al., *Safety-Critical Control with Input Delay in Dynamic Environment*, IEEE TCST (arXiv:2112.08445) | 14/14 | đã đọc – dùng | Dự đoán qua độ trễ + phồng sai số xấu nhất cố định (dạng cận cố định của d(t)); trễ đầu vào hằng, thông tin vật cản liên tục. |
| F2 | A. Singletary, Y. Chen, A. D. Ames, *CBFs for Sampled-Data Systems with Input Delays*, CDC 2020 (arXiv:2005.06418) | 6/6 | đã đọc – dùng | Lấy mẫu + trễ biết trước bên cơ cấu chấp hành; CBF danh định mất an toàn ở 20 Hz hoặc trễ 30 ms. |
| F3 | J. Breeden, K. Garg, D. Panagou, *CBFs in Sampled-Data Systems*, IEEE L-CSS 6, 2022 (arXiv:2103.03677) | 6/6 | đã đọc – dùng | Biên phải tăng theo khoảng giữa hai lần cập nhật — cùng cấu trúc với d(t). |
| F4 | A. J. Taylor, P. Ong, J. Cortés, A. D. Ames, *Safety-Critical Event Triggered Control via ISSf Barrier Functions*, L-CSS (arXiv:2003.06963) | 6/6 | đã đọc – dùng | Trigger ngây thơ có thể kích hoạt dày vô hạn → cần khoảng tối thiểu; trigger cần trạng thái liên tục → không dùng trực tiếp cho cảm biến. |
| F5 | S. Dean et al., *Guaranteeing Safety of Learned Perception Modules via Measurement-Robust CBFs*, CoRL 2020 (arXiv:2010.16001) | 17/17 | đã đọc – dùng | Sai số perception học được → biên CBF; không có latency, lấy mẫu, bộ lọc. |
| F6 | T. G. Molnar et al., *Input-to-State Safety with Input Delay in Longitudinal Vehicle Control*, IFAC TDS 2022 (arXiv:2205.14567) | 6/6 | đã đọc – dùng | Dự đoán qua độ trễ tốt hơn coi trễ là nhiễu → ủng hộ cập nhật tại thời điểm chụp. |
| F7 | S. Yang, G. J. Pappas, R. Mangharam, L. Lindemann, *Safe Perception-Based Control under Stochastic Sensor Uncertainty using Conformal Prediction*, CDC 2023 (arXiv:2304.00194) | 15/15 | đã đọc – dùng | **Gần nhất trong nhóm:** perception học + CBF bền vững + khoảng lấy mẫu suy ra từ cận sai số và tốc độ tối đa — nhưng khoảng đó **hằng**, latency 0, không có bộ nhớ/bộ lọc → baseline tần số cố định cho scheduler. |
| F8 | G. Yang, C. Belta, R. Tron, *Self-triggered Control for Safety Critical Systems using CBFs*, ACC 2019 (arXiv:1903.03692) | 7/7 | đã đọc – dùng | "Safe period" — tương đương hình thức gần nhất của khoảng mở an toàn tối đa; trigger cập nhật điều khiển với trạng thái chính xác. |
| F9 | F. Laine, C.-Y. Chiu, C. Tomlin, *Eyes-Closed Safety Kernels*, RSS 2020 (arXiv:2005.07144) | 9/9 | đã đọc – dùng (khái niệm) | An toàn khi không có quan sát thêm, kể cả vật cản ngoài tầm cảm biến (≈ frontier); offline, xấu nhất, tốn tính toán. |

## G. CBF với bất định ước lượng / vật cản bất định

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| G1 | H. Matias, D. Silvestre, *Safe Navigation under Uncertain Obstacle Dynamics using CBFs and Constrained Convex Generators* (arXiv:2601.07715) | 16/16 | đã đọc – dùng | Tập vật cản xấu nhất lớn dần giữa các mẫu chu kỳ cố định → TV-CBF (tương tự tập hợp của d(t)); an toàn tại thời điểm cập nhật là vấn đề mở (Remark 12). |
| G2 | K. Echigo et al., *Probabilistic CBFs for Systems with State Estimation Uncertainty using Sub-Gaussian Concentration* (arXiv:2604.08831) | 6/6 | đã đọc – dùng (hẹp) | CBF chance-constraint từ niềm tin EKF; CBF tất định vi phạm 100%, cận xấu nhất chỉ đạt 56% đích. |
| G3 | R. Lin, M. Egerstedt, *Stochastic CBFs under State Estimation: From Euclidean Space to Lie Groups* (arXiv:2601.16198) | 13/13 | đã đọc – dùng | Với CBF nửa không gian + Kalman, biên có dạng đóng β·sqrt(cᵀ(AΣAᵀ+Σε)c) → biện minh nửa không gian phồng theo hiệp phương sai của DART. |
| G4 | S. Yaghoubi et al., *Risk-Bounded Control with Kalman Filtering and Stochastic Barrier Functions* (arXiv:2112.14912) | 7/7 | đã đọc – dùng | Tiền lệ sớm: track Kalman → biên hằng ε; đo liên tục nên tập bất định ít thay đổi (khác chế độ của DART). |
| G5 | E. Daş et al., *Safe Navigation under State Uncertainty: Online Adaptation for Robust CBFs* (arXiv:2508.19159) | 9/9 | đã đọc – dùng | Biên robust-CBF điều khiển bởi hiệp phương sai VIO lúc chạy, có phần cứng; thích nghi *biên*, không quyết định *khi nào* cảm nhận. |
| G6 | B. Dai et al., *Differentiable Optimization Based Time-Varying CBFs for Dynamic Obstacle Avoidance* (arXiv:2309.17226) | 8/8 | đã đọc – dùng | TV-CBF với vật cản động theo dõi bằng EKF, dịch k-sigma + phồng theo tốc độ tiếp cận; gần thành phần 4–5 của DART, không latency. |
| G7 | Z. Jian et al., *Dynamic CBF-based MPC to Safety-Critical Obstacle-Avoidance of Mobile Robot* (arXiv:2209.08539) | 7/7 | đã đọc – dùng | MPC + hàng DCBF với vật cản Kalman, ellipse phồng theo hiệp phương sai dọc horizon → baseline gần nhất của thành phần MPC; không latency. |
| G8 | S. Han et al., *Risk-Aware Belief CBFs over Random Finite Sets* (arXiv:2607.15016) | 8/8 | đã đọc – dùng | Điều kiện an toàn qua một lần cập nhật (Prop. 1) nhưng việc **khôi phục trước lần cập nhật kế tiếp** bỏ ngỏ (Remark 4) — đúng khoảng trống mà scheduler của DART nhắm tới. |

## H. Ước lượng với phép đo trễ

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| H1 | Y. Bar-Shalom, *Update with Out-of-Sequence Measurements in Tracking: Exact Solution*, IEEE TAES 38(3), 2002 | PDF người dùng, 10/10 | đã đọc – dùng | Lời giải chính xác cho trễ một bước; vấn đề OOS chỉ khi track đã được cập nhật bằng phép đo muộn hơn → bỏ cập nhật xen giữa thì rút về đúng chuỗi của DART (suy diễn của chúng ta từ eq. 30–39). Điều kiện "chính xác": tuyến tính–Gauss, mốc thời gian đã biết, liên kết đúng, chưa có cập nhật muộn hơn. |
| H2 | M. Wickramasuriya et al., *Hardware- and Vision-in-the-Loop Validation of Deep Monocular Pose Estimation for Autonomous Maritime UAV Flight* (arXiv:2606.19176) | 6/6 | đã đọc – dùng | Mạng monocular trên Jetson Orin NX trễ 0.18–0.40 s; KF trễ cập nhật tại thời điểm chụp từ bộ đệm (giống thành phần 2 của DART); không tránh vật cản, không ablation bù trễ. |
| H3 | Á. F. García-Fernández, W. Yi, *Continuous-discrete multiple target tracking with out-of-sequence measurements*, IEEE TSP 69, 2021 (arXiv:2106.04898) | 14/14 | đã đọc – dùng (hẹp) | Cập nhật OOS chính xác qua retrodiction; chính xác trừ khi hai tập trễ rơi vào cùng khoảng → phiên bản hình thức của "chính xác khi chỉ một frame đang xử lý" (A4 của DART). |

## N. Prior art gần nhất về "khi nào cần perception" (định vị tính mới: [`novelty_positioning.md`](novelty_positioning.md))

| ID | Bài | Toàn văn | Trạng thái | Vai trò |
|---|---|---|---|---|
| N1 | Y.-S. Hsiao et al., *Zhuyi: Perception Processing Rate Estimation for Safety in Autonomous Vehicles*, DAC 2022 (arXiv:2205.03347) | 7/7 | đã đọc – dùng | **Prior art gần nhất**: tần số xử lý khung hình tối thiểu = 1/(độ trễ chịu được lớn nhất) từ điều kiện phanh gấp, tính liên tục, dùng làm kiểm tra an toàn. Tự nêu bất định perception và vật thể chưa phát hiện là hướng tương lai (tr. 6); chỉ kiểm chứng ở tần số cố định cho mọi camera (tr. 4). |
| N2 | ≡ A5 (TAPAS) | | đã đọc – dùng | Xem A5. |
| N3 | H. Zhao et al., *Suraksha: A Framework to Analyze the Safety Implications of Perception Design Choices in AVs*, ISSRE 2021 | bản tác giả, 12/12 | đã đọc – dùng | FPS camera là tham số perception nhạy với an toàn nhất; tần số cần thiết phụ thuộc kịch bản (phân tích offline). |
| N4 | H. Zhao et al., *Driving Scenario Perception-Aware Computing System Design in Autonomous Vehicles*, ICCD 2020 | bản tác giả, 8/8 | đã đọc – dùng (hẹp) | Độ trễ perception phụ thuộc cấu hình vật cản xung quanh. |
| N5 | ≡ A1 (Falanga et al. RA-L 2019) | | đã đọc – dùng | Xem A1. |
| N6 | B. Boroujerdian et al., *RoboRun: A Robot Runtime to Exploit Spatial Heterogeneity*, DAC 2021 (arXiv:2108.13354) | 7/7 | đã đọc – dùng | Hạn chót quyết định cho drone = (tầm nhìn − quãng phanh)/vận tốc (tr. 4 Eq. 1) — dạng tất định của frontier + phanh; dùng để co tính toán, không để kích hoạt perception; an toàn thực nghiệm; năng lượng tính toán < 0.05% năng lượng drone (tr. 5). |
| N7 | L. Liu, K. G. Shin, *MM-BEV: Enhancing Timeliness by Computing Where and When it Matters* (arXiv:2608.15437) | 12/12 | đã đọc – dùng | Dùng quãng phanh/TTC để quyết định tính ở đâu; chọn keyframe theo heuristic; open-loop. |
| N8 | ≡ F8 (self-triggered CBF) | | đã đọc – dùng | Xem F8. |
| N9 | A. Malik, *Compiling Spatial Certificates into Temporal Contracts for Latency-Aware Control* (CIPS, arXiv:2608.25228) | 6/6 | đã đọc – dùng | Biến chứng chỉ an toàn thành thời gian còn lại được chứng nhận, kích hoạt khi ≤ L + 2Δt, có định lý an toàn; biên đo hằng η = 0.5 m; bất định là hướng tương lai (tr. 6). Áp dụng cho cập nhật điều khiển, không cho perception. |
| N10 | R. Aldana-López, R. Aragüés, C. Sagüés, *Latency vs precision: stability preserving perception scheduling*, Automatica 155, 2023 (arXiv:2401.13585) | 16/16 | đã đọc – dùng | Lan truyền hiệp phương sai dọc các lịch perception ứng viên, predictor có xét trễ, một job đang xử lý; không có ràng buộc an toàn/vật cản. |
| N11 | C. Huang et al., *Opportunistic Intermittent Control with Safety Guarantees for Autonomous Systems*, DAC 2020 (arXiv:2005.03726) | 6/6 | đã đọc – dùng | Bỏ qua tính toán điều khiển có bảo đảm an toàn nhưng vẫn cảm nhận mỗi bước. |
| N13 | I. Gog et al., *D3: A Dynamic Deadline-Driven Approach for Building Autonomous Vehicles*, EuroSys 2022 | PDF người dùng, 19/19 | đã đọc – dùng | Chính sách hạn chót theo quãng phanh chọn mô hình detector (20–262 ms) lúc chạy; CARLA 50 km: va chạm 78 → 25 (tr. 465). Camera tuần hoàn 30 Hz, không bất định, chính sách chỉ là baseline (tr. 464). |
| N14 | Y. V. Pant et al., *Anytime Computation and Control for Autonomous Systems*, IEEE TCST 29(2), 2021 | PDF người dùng, 12/12 | đã đọc – dùng | MPC chọn chế độ (trễ, sai số) của bộ ước lượng thị giác mỗi bước, có chứng minh (Thm 5.1, 6.1) và 56 chuyến bay hexrotor; ảnh tuần hoàn, cận sai số cố định theo chế độ, chế độ cố định suốt horizon, không có vật cản. |
| N15 | S. Shahsavari et al., *A Coordinated Approach to Control Mechanical and Computing Resources in Mobile Robots*, IEEE T-RO 41, 2025 | PDF người dùng, 17/17 | đã đọc – dùng (hẹp) | Đồng quản lý tốc độ rover + DVFS CPU để tiết kiệm năng lượng (tới 36.34%); không có an toàn; năng lượng tính toán có thể chiếm ưu thế ở rover nhỏ chạy chậm (tr. 351). |
| N12 | Y. Xia et al., *Energy-Efficient Autonomous Driving with Adaptive Perception and Robust Decision* (EneAD, arXiv:2510.25205) | 14/14 | đã đọc – dùng | Bỏ khung theo lớp độ khó của cảnh, vòng kín nhưng không có cận an toàn. |

## Ứng viên tìm thấy nhưng **chưa đọc** (không được dùng cho tới khi đọc toàn văn)

* arXiv:2504.15850 — bộ lọc an toàn CBF onboard với cảm biến depth cho multirotor (PX4).
* arXiv:2312.15638 — Kishida, Kalman filter + worst-case CVaR trong CBF.
* arXiv:2304.08685 — an toàn sample-and-hold với CBF (phía cơ cấu chấp hành).
* Gräfe et al. 2022 (event-triggered distributed MPC cho UAV); Sun et al. 2019 (self-triggered MPC với horizon thích nghi); Page et al. 2006 (adaptive-horizon MPC cho quản lý cảm biến).
* NanoMap; Safety Score (IV 2020); RSS (Shalev-Shwartz et al. 2017); Safety Force Field (2019).
* Báo cáo kỹ thuật trực tuyến của Pant et al. (UPenn-ESE-04-19, 2019).
