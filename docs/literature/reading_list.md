# Danh sách đọc cho literature review (DART-UAV)

Quy tắc làm việc:

* Chỉ trích dẫn một bài **sau khi đã đọc toàn văn**. Không dùng abstract/snippet để viết nội dung.
* Đọc xong mà không liên quan → loại khỏi danh sách trích dẫn (ghi lý do).
* Một mệnh đề có thể có nhiều trích dẫn nếu từng bài thực sự bổ sung ý nghĩa.
* Cột "Vai trò dự kiến" chỉ là **giả thuyết dựa trên tên bài**, chưa phải nội dung đã kiểm chứng.

Trạng thái: `chưa đọc` · `đã đọc – dùng` · `đã đọc – loại` · `cần tải tay` (không có bản arXiv/không truy cập được).

## A. Độ trễ / tần số perception và an toàn (định vị tính mới trực tiếp)

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| A1 | D. Falanga, S. Kim, D. Scaramuzza, *How Fast Is Too Fast? The Role of Perception Latency in High-Speed Sense and Avoid*, IEEE RA-L 4(2), 2019, doi:10.1109/LRA.2019.2898117 | IEEE / EPFL Infoscience (không có arXiv) | Quan hệ latency–tầm cảm biến–tốc độ an toàn | cần tải tay |
| A2 | A. Loquercio et al., *Learning High-Speed Flight in the Wild*, Science Robotics 2021 | arXiv:2110.05113 | Bay nhanh dựa trên depth, độ trễ end-to-end | chưa đọc |
| A3 | *Monocular Event-Based Vision for Obstacle Avoidance with a Quadrotor* | arXiv:2411.03303 | Tần số suy luận và khả năng phanh kịp | chưa đọc |
| A4 | *Towards Safety-Aware Computing System Design in Autonomous Vehicles* | arXiv:1905.08453 | Latency tính toán và an toàn | chưa đọc |
| A5 | *TAPAS: Throughput-adaptive Perception for Autonomous Systems* | arXiv:2607.17317 | Tần số perception thích nghi theo cảnh (gần nhất với scheduler) | chưa đọc |

## B. Monocular depth (module perception)

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| B1 | R. Ranftl et al., *Towards Robust Monocular Depth Estimation: Mixing Datasets for Zero-shot Cross-dataset Transfer* (MiDaS), TPAMI | arXiv:1907.01341 | Đầu ra affine-invariant (cơ sở cho hiệu chỉnh R2) | chưa đọc |
| B2 | L. Yang et al., *Depth Anything: Unleashing the Power of Large-Scale Unlabeled Data*, CVPR 2024 | arXiv:2401.10891 | Mô hình depth nền tảng | chưa đọc |
| B3 | L. Yang et al., *Depth Anything V2*, NeurIPS 2024 | arXiv:2406.09414 | Kích thước mô hình / tốc độ | chưa đọc |
| B4 | D. Wofk et al., *FastDepth: Fast Monocular Depth Estimation on Embedded Systems*, ICRA 2019 | arXiv:1903.03273 | Latency/công suất trên phần cứng nhúng | chưa đọc |
| B5 | N. Simon, A. Majumdar, *MonoNav: MAV Navigation via Monocular Depth Estimation and Reconstruction* | arXiv:2311.14100 | Điều hướng MAV bằng monocular depth | chưa đọc |

## C. Perception-aware planning, điều hướng trong vùng chưa biết, tránh vật cản có bất định

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| C1 | D. Falanga et al., *PAMPC: Perception-Aware Model Predictive Control for Quadrotors*, IROS 2018 | arXiv:1804.04811 | Định nghĩa "perception-aware MPC" | chưa đọc |
| C2 | B. Zhou et al., *RAPTOR: Robust and Perception-aware Trajectory Replanning for Quadrotor Fast Flight*, T-RO | arXiv:2007.03465 | Vật cản chưa biết, quan sát chủ động | chưa đọc |
| C3 | J. Tordesillas et al., *FASTER: Fast and Safe Trajectory Planner for Navigation in Unknown Environments*, T-RO 2022 | arXiv:2001.04420 | An toàn với không gian chưa biết (liên quan frontier) | chưa đọc |
| C4 | B. Zhou et al., *Robust and Efficient Quadrotor Trajectory Generation for Fast Autonomous Flight* (Fast-Planner), RA-L | arXiv:1907.01531 | Planner baseline | chưa đọc |
| C5 | X. Zhou et al., *EGO-Planner: An ESDF-free Gradient-based Local Planner for Quadrotors*, RA-L | arXiv:2008.08835 | Planner baseline | chưa đọc |
| C6 | H. Zhu, J. Alonso-Mora, *Chance-Constrained Collision Avoidance for MAVs in Dynamic Environments*, RA-L 4(2), 2019, doi:10.1109/LRA.2019.2893494 | TU Delft repository / IEEE | MPC xét xác suất va chạm (so sánh với inflation) | cần tải tay |
| C7 | J. Lin, H. Zhu, J. Alonso-Mora, *Robust Vision-based Obstacle Avoidance for Micro Aerial Vehicles in Dynamic Environments*, ICRA 2020 | arXiv:2002.04920 | Vision + vật cản động + MPC | chưa đọc |

## D. MPC horizon thích nghi

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| D1 | A. J. Krener, *Adaptive Horizon Model Predictive Control* | arXiv:1602.08619 | Horizon thay đổi theo trạng thái | chưa đọc |
| D2 | A. J. Krener, *Adaptive Horizon Model Predictive Control and Al'brekht's Method* | arXiv:1904.00053 | như trên | chưa đọc |
| D3 | E. Bøhn et al., *Reinforcement Learning of the Prediction Horizon in Model Predictive Control*, IFAC 2021 | arXiv:2102.11122 | Horizon học được | chưa đọc |

## E. Control Barrier Function: nền tảng

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| E1 | A. D. Ames et al., *Control Barrier Function Based Quadratic Programs for Safety Critical Systems*, TAC 2017 | arXiv:1609.06408 | Định nghĩa CBF, CBF-QP | chưa đọc |
| E2 | A. D. Ames et al., *Control Barrier Functions: Theory and Applications*, ECC 2019 | arXiv:1903.11199 | Tổng quan CBF | chưa đọc |
| E3 | W. Xiao, C. Belta, *Control Barrier Functions for Systems with High Relative Degree*, CDC 2019 | arXiv:1903.04706 | HOCBF | chưa đọc |
| E4 | Q. Nguyen, K. Sreenath, *Exponential Control Barrier Functions for Enforcing High Relative-Degree Safety-Critical Constraints*, ACC 2016 | IEEE (không có arXiv) | ECBF | cần tải tay |
| E5 | L. Wang, A. D. Ames, M. Egerstedt, *Safety Barrier Certificates for Collisions-Free Multirobot Systems*, T-RO 33(3), 2017 | IEEE | Barrier có giới hạn gia tốc (cơ sở braking-CBF) | cần tải tay |
| E5b | L. Wang, A. D. Ames, M. Egerstedt, *Safety Barrier Certificates for Heterogeneous Multi-Robot Systems* | arXiv:1609.00651 | như trên (bản hội nghị) | chưa đọc |
| E6 | J. Zeng, B. Zhang, K. Sreenath, *Safety-Critical Model Predictive Control with Discrete-Time Control Barrier Function*, ACC 2021 | arXiv:2007.11718 | DCBF trong MPC | chưa đọc |
| E7 | U. Rosolia, A. Singletary, A. D. Ames, *Multi-Rate Control Design Leveraging Control Barrier Functions and Model Predictive Control Policies* | arXiv:2004.01761 | Kiến trúc đa tần số MPC + CBF | chưa đọc |

## F. CBF với độ trễ, lấy mẫu, kích hoạt theo sự kiện, sai số perception

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| F1 | T. G. Molnar et al., *Safety-Critical Control with Input Delay in Dynamic Environment*, TCST 2023 | arXiv:2112.08445 | CBF + dự đoán môi trường qua độ trễ | chưa đọc |
| F2 | A. Singletary, Y. Chen, A. D. Ames, *Control Barrier Functions for Sampled-Data Systems with Input Delays* | arXiv:2005.06418 | CBF lấy mẫu + trễ | chưa đọc |
| F3 | J. Breeden, K. Garg, D. Panagou, *Control Barrier Functions in Sampled-Data Systems* | arXiv:2103.03677 | CBF lấy mẫu | chưa đọc |
| F4 | A. J. Taylor, P. Ong, J. Cortés, A. D. Ames, *Safety-Critical Event Triggered Control via Input-to-State Safe Barrier Functions*, L-CSS 2021 | arXiv:2003.06963 | Kích hoạt theo sự kiện có đảm bảo an toàn | chưa đọc |
| F5 | S. Dean et al., *Guaranteeing Safety of Learned Perception Modules via Measurement-Robust Control Barrier Functions*, CoRL 2020 | arXiv:2010.16001 | CBF bền vững với sai số perception học | chưa đọc |
| F6 | *Input-to-State Safety with Input Delay* | arXiv:2205.14567 | ISSf + trễ | chưa đọc |

## G. CBF với bất định ước lượng / vật cản bất định

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| G1 | *Safe Navigation under Uncertain Obstacle Dynamics using Control Barrier Functions and Constrained Convex Generators* | arXiv:2601.07715 | Đo lấy mẫu + tập ước lượng vật cản | chưa đọc |
| G2 | *Probabilistic Control Barrier Functions for Systems with State Estimation Uncertainty* | arXiv:2604.08831 | CBF dùng hiệp phương sai ước lượng | chưa đọc |
| G3 | *Stochastic Control Barrier Functions under State Estimation* | arXiv:2601.16198 | như trên | chưa đọc |
| G4 | *Risk-Bounded Control with Kalman Filtering and Stochastic Barrier Functions* | arXiv:2112.14912 | KF + barrier ngẫu nhiên | chưa đọc |
| G5 | *Safe Navigation under State Uncertainty: Online Adaptation for Robust Control Barrier Functions* | arXiv:2508.19159 | Giảm bảo thủ của robust CBF | chưa đọc |
| G6 | *Differentiable Optimization Based Time-Varying Control Barrier Functions for Dynamic Obstacle Avoidance* | arXiv:2309.17226 | Tập an toàn biến thiên theo thời gian | chưa đọc |

## H. Ước lượng với phép đo trễ

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| H1 | Y. Bar-Shalom, *Update with Out-of-Sequence Measurements in Tracking: Exact Solution*, IEEE TAES 38(3), 2002 | IEEE | Cập nhật phép đo trễ chính xác | cần tải tay |

## I. Mô hình và điều khiển quadrotor

| ID | Bài | Toàn văn | Vai trò dự kiến | Trạng thái |
|---|---|---|---|---|
| I1 | T. Lee, M. Leok, N. H. McClamroch, *Control of Complex Maneuvers for a Quadrotor UAV using Geometric Methods on SE(3)* (bản mở rộng của bài CDC 2010) | arXiv:1003.2005 | Bộ điều khiển attitude SO(3) dùng trong plant | chưa đọc |
