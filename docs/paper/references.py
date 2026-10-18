"""Reference list of the manuscript (Springer numbered style), one entry per key.

Only works read in full (docs/literature/reading_list.md: "đã đọc – dùng"); bibliographic data as recorded in the
reading notes (docs/literature/notes/). DOIs are given only where the notes record them; entries marked
'% TODO' need volume / pages / DOI checked against the publisher's record before submission.
build_refs.py writes the \\bibitem list in order of first citation.
"""

REFS = {
    # ------------------------------------------------------------- latency, perception rate and safety
    'falanga2019': r"Falanga, D., Kim, S., Scaramuzza, D.: How fast is too fast? The role of perception latency in "
                   r"high-speed sense and avoid. IEEE Robot. Autom. Lett. \textbf{4}(2), 1884--1891 (2019). "
                   r"\url{https://doi.org/10.1109/LRA.2019.2898117}",
    'loquercio2021': r"Loquercio, A., Kaufmann, E., Ranftl, R., M\"uller, M., Koltun, V., Scaramuzza, D.: Learning "
                     r"high-speed flight in the wild. Sci. Robot. \textbf{6}(59), eabg5810 (2021). "
                     r"\url{https://doi.org/10.1126/scirobotics.abg5810}",
    'bhattacharya2024': r"Bhattacharya, A., Cannici, M., Rao, N., Tao, Y., Kumar, V., Matni, N., Scaramuzza, D.: "
                        r"Monocular event-based vision for obstacle avoidance with a quadrotor. In: Proc. 8th Conf. "
                        r"Robot Learning (CoRL) (2024). arXiv:2411.03303",  # TODO PMLR volume / pages
    'zhao2019': r"Zhao, H., Zhang, Y., Meng, P., Shi, H., Li, L.E., Lou, T., Zhao, J.: Towards safety-aware "
                r"computing system design in autonomous vehicles. Preprint at "
                r"\url{https://arxiv.org/abs/1905.08453} (2019)",
    'vyas2026': r"Vyas, A., Kodumagulla, V., Taufique, Z., Liljeberg, P., Kanduri, A.: TAPAS: Throughput-adaptive "
                r"perception for autonomous systems. In: ACM/IEEE Int. Conf. Codesign Embedded Syst. "
                r"(ESWEEK-CODES), accepted (2026). arXiv:2607.17317",
    'liu2016': r"Liu, S., Watterson, M., Tang, S., Kumar, V.: High speed navigation for quadrotors with limited "
               r"onboard sensing. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 1484--1491 (2016)",  # TODO DOI
    'hsiao2022': r"Hsiao, Y.-S., Hari, S.K.S., Filipiuk, M., Tsai, T., Sullivan, M.B., Reddi, V.J., Singh, V., "
                 r"Keckler, S.W.: Zhuyi: Perception processing rate estimation for safety in autonomous vehicles. "
                 r"In: Proc. 59th ACM/IEEE Design Autom. Conf. (DAC), pp. 289--294 (2022)",  # TODO DOI
    'zhao2021': r"Zhao, H., Hari, S.K.S., Tsai, T., Sullivan, M.B., Keckler, S.W., Zhao, J.: Suraksha: A framework "
                r"to analyze the safety implications of perception design choices in AVs. In: Proc. IEEE Int. Symp. "
                r"Softw. Reliab. Eng. (ISSRE) (2021)",  # TODO pages / DOI
    'boroujerdian2021': r"Boroujerdian, B., Ghosal, R., Cruz, J., Plancher, B., Reddi, V.J.: RoboRun: A robot "
                        r"runtime to exploit spatial heterogeneity. In: Proc. ACM/IEEE Design Autom. Conf. (DAC) "
                        r"(2021). arXiv:2108.13354",  # TODO year (2021 / 2022) and pages
    'gog2022': r"Gog, I., Kalra, S., Schafhalter, P., Gonzalez, J.E., Stoica, I.: D3: A dynamic deadline-driven "
               r"approach for building autonomous vehicles. In: Proc. 17th Eur. Conf. Comput. Syst. (EuroSys), "
               r"pp. 453--471 (2022). \url{https://doi.org/10.1145/3492321.3519576}",
    'pant2021': r"Pant, Y.V., Abbas, H., Mohta, K., Quaye, R.A., Nghiem, T.X., Devietti, J., Mangharam, R.: Anytime "
                r"computation and control for autonomous systems. IEEE Trans. Control Syst. Technol. "
                r"\textbf{29}(2), 768--779 (2021). \url{https://doi.org/10.1109/TCST.2020.2979388}",
    'aldana2023': r"Aldana-L\'opez, R., Arag\"u\'es, R., Sag\"u\'es, C.: Latency vs precision: Stability preserving "
                  r"perception scheduling. Automatica \textbf{155}, 111123 (2023). "
                  r"\url{https://doi.org/10.1016/j.automatica.2023.111123}",
    'shahsavari2025': r"Shahsavari, S., Haghbayan, H., Miele, A., Immonen, E., Plosila, J.: A coordinated approach to "
                      r"control mechanical and computing resources in mobile robots. IEEE Trans. Robot. \textbf{41}, "
                      r"347--363 (2025). \url{https://doi.org/10.1109/TRO.2024.3492345}",
    'huang2020': r"Huang, C., Xu, S., Wang, Z., Lan, S., Li, W., Zhu, Q.: Opportunistic intermittent control with "
                 r"safety guarantees for autonomous systems. In: Proc. 57th ACM/IEEE Design Autom. Conf. (DAC) "
                 r"(2020). arXiv:2005.03726",  # TODO pages / DOI
    # ------------------------------------------------------------- monocular depth
    'ranftl2020': r"Ranftl, R., Lasinger, K., Hafner, D., Schindler, K., Koltun, V.: Towards robust monocular depth "
                  r"estimation: Mixing datasets for zero-shot cross-dataset transfer. IEEE Trans. Pattern Anal. Mach. "
                  r"Intell. (2020). arXiv:1907.01341",  # TODO volume / pages / DOI
    'yang2024a': r"Yang, L., Kang, B., Huang, Z., Xu, X., Feng, J., Zhao, H.: Depth Anything: Unleashing the power of "
                 r"large-scale unlabeled data. In: Proc. IEEE/CVF Conf. Comput. Vis. Pattern Recognit. (CVPR) "
                 r"(2024). arXiv:2401.10891",  # TODO pages
    'yang2024b': r"Yang, L., Kang, B., Huang, Z., Zhao, Z., Xu, X., Feng, J., Zhao, H.: Depth Anything V2. In: Adv. "
                 r"Neural Inf. Process. Syst. (NeurIPS) \textbf{37} (2024). arXiv:2406.09414",
    'wofk2019': r"Wofk, D., Ma, F., Yang, T.-J., Karaman, S., Sze, V.: FastDepth: Fast monocular depth estimation on "
                r"embedded systems. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA) (2019). arXiv:1903.03273",
    'simon2023': r"Simon, N., Majumdar, A.: MonoNav: MAV navigation via monocular depth estimation and "
                 r"reconstruction. In: Int. Symp. Exp. Robot. (ISER) (2023). arXiv:2311.14100",
    # ------------------------------------------------------------- planning in unknown space
    'zhou2019': r"Zhou, B., Gao, F., Wang, L., Liu, C., Shen, S.: Robust and efficient quadrotor trajectory "
                r"generation for fast autonomous flight. IEEE Robot. Autom. Lett. (2019). arXiv:1907.01531",
    'zhou2020ego': r"Zhou, X., Wang, Z., Ye, H., Xu, C., Gao, F.: EGO-Planner: An ESDF-free gradient-based local "
                   r"planner for quadrotors. IEEE Robot. Autom. Lett. (2020). arXiv:2008.08835",
    'zhou2020raptor': r"Zhou, B., Pan, J., Gao, F., Shen, S.: RAPTOR: Robust and perception-aware trajectory "
                      r"replanning for quadrotor fast flight. Preprint at \url{https://arxiv.org/abs/2007.03465} "
                      r"(2020)",
    'tordesillas2021': r"Tordesillas, J., Lopez, B.T., Everett, M., How, J.P.: FASTER: Fast and safe trajectory "
                       r"planner for navigation in unknown environments. IEEE Trans. Robot. (2021). arXiv:2001.04420",
    'falanga2018': r"Falanga, D., Foehn, P., Lu, P., Scaramuzza, D.: PAMPC: Perception-aware model predictive control "
                   r"for quadrotors. In: Proc. IEEE/RSJ Int. Conf. Intell. Robots Syst. (IROS) (2018). "
                   r"arXiv:1804.04811",
    'zhu2019': r"Zhu, H., Alonso-Mora, J.: Chance-constrained collision avoidance for MAVs in dynamic environments. "
               r"IEEE Robot. Autom. Lett. \textbf{4}(2), 776--783 (2019). "
               r"\url{https://doi.org/10.1109/LRA.2019.2893494}",
    'lin2020': r"Lin, J., Zhu, H., Alonso-Mora, J.: Robust vision-based obstacle avoidance for micro aerial vehicles "
               r"in dynamic environments. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA) (2020). arXiv:2002.04920",
    'krener2016': r"Krener, A.J.: Adaptive horizon model predictive control. Preprint at "
                  r"\url{https://arxiv.org/abs/1602.08619} (2016)",
    'bohn2021': r"B{\o}hn, E., Gros, S., Moe, S., Johansen, T.A.: Reinforcement learning of the prediction horizon "
                r"in model predictive control. IFAC-PapersOnLine \textbf{54}(6), 314--320 (2021)",
    # ------------------------------------------------------------- CBF, sampling, delay, uncertainty
    'ames2017': r"Ames, A.D., Xu, X., Grizzle, J.W., Tabuada, P.: Control barrier function based quadratic programs "
                r"for safety critical systems. IEEE Trans. Autom. Control \textbf{62}(8), 3861--3876 (2017). "
                r"\url{https://doi.org/10.1109/TAC.2016.2638961}",
    'ames2019': r"Ames, A.D., Coogan, S., Egerstedt, M., Notomista, G., Sreenath, K., Tabuada, P.: Control barrier "
                r"functions: Theory and applications. In: Proc. Eur. Control Conf. (ECC), pp. 3420--3431 (2019). "
                r"\url{https://doi.org/10.23919/ECC.2019.8796030}",
    'xiao2019': r"Xiao, W., Belta, C.: Control barrier functions for systems with high relative degree. In: Proc. "
                r"IEEE Conf. Decis. Control (CDC), pp. 474--479 (2019). "
                r"\url{https://doi.org/10.1109/CDC40024.2019.9029455}",
    'wang2017': r"Wang, L., Ames, A.D., Egerstedt, M.: Safety barrier certificates for collisions-free multirobot "
                r"systems. IEEE Trans. Robot. \textbf{33}(3), 661--674 (2017). "
                r"\url{https://doi.org/10.1109/TRO.2017.2659727}",
    'wang2016': r"Wang, L., Ames, A., Egerstedt, M.: Safety barrier certificates for heterogeneous multi-robot "
                r"systems. In: Proc. Am. Control Conf. (ACC), pp. 5213--5218 (2016). "
                r"\url{https://doi.org/10.1109/ACC.2016.7526486}",
    'zeng2021': r"Zeng, J., Zhang, B., Sreenath, K.: Safety-critical model predictive control with discrete-time "
                r"control barrier function. In: Proc. Am. Control Conf. (ACC), pp. 3882--3889 (2021). "
                r"\url{https://doi.org/10.23919/ACC50511.2021.9483029}",
    'rosolia2020': r"Rosolia, U., Ames, A.D.: Multi-rate control design leveraging control barrier functions and "
                   r"model predictive control policies. IEEE Control Syst. Lett. \textbf{5}(3), 1007--1012 (2020). "
                   r"\url{https://doi.org/10.1109/LCSYS.2020.3008326}",  # TODO year of the issue
    'breeden2022': r"Breeden, J., Garg, K., Panagou, D.: Control barrier functions in sampled-data systems. IEEE "
                   r"Control Syst. Lett. \textbf{6}, 367--372 (2022)",  # TODO DOI
    'singletary2020': r"Singletary, A., Chen, Y., Ames, A.D.: Control barrier functions for sampled-data systems with "
                      r"input delays. In: Proc. 59th IEEE Conf. Decis. Control (CDC), pp. 804--809 (2020)",
    'molnar2022': r"Molnar, T.G., Kiss, A.K., Ames, A.D., Orosz, G.: Safety-critical control with input delay in "
                  r"dynamic environment. IEEE Trans. Control Syst. Technol. (2022). arXiv:2112.08445",
    'taylor2020': r"Taylor, A.J., Ong, P., Cort\'es, J., Ames, A.D.: Safety-critical event triggered control via "
                  r"input-to-state safe barrier functions. IEEE Control Syst. Lett. (2020). "
                  r"\url{https://doi.org/10.1109/LCSYS.2020.3005101}",
    'yang2019': r"Yang, G., Belta, C., Tron, R.: Self-triggered control for safety critical systems using control "
                r"barrier functions. In: Proc. Am. Control Conf. (ACC), pp. 4454--4459 (2019)",
    'dean2021': r"Dean, S., Taylor, A.J., Cosner, R.K., Recht, B., Ames, A.D.: Guaranteeing safety of learned "
                r"perception modules via measurement-robust control barrier functions. In: Proc. Conf. Robot "
                r"Learning (CoRL), PMLR \textbf{155}, 654--670 (2021)",
    'yang2023': r"Yang, S., Pappas, G.J., Mangharam, R., Lindemann, L.: Safe perception-based control under "
                r"stochastic sensor uncertainty using conformal prediction. In: Proc. IEEE Conf. Decis. Control "
                r"(CDC) (2023). arXiv:2304.00194",
    'yaghoubi2021': r"Yaghoubi, S., Fainekos, G., Yamaguchi, T., Prokhorov, D., Hoxha, B.: Risk-bounded control with "
                    r"Kalman filtering and stochastic barrier functions. In: Proc. IEEE Conf. Decis. Control (CDC), "
                    r"pp. 5213--5219 (2021)",
    'jian2023': r"Jian, Z., Yan, Z., Lei, X., Lu, Z., Lan, B., Wang, X., Liang, B.: Dynamic control barrier "
                r"function-based model predictive control to safety-critical obstacle-avoidance of mobile robot. In: "
                r"Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 3679--3685 (2023)",
    'han2026': r"Han, S., Chen, G., Cai, Y., Torroba, I., Stenius, I., Jensfelt, P., Alonso-Mora, J., Tumova, J.: "
               r"Risk-aware belief control barrier functions over random finite sets. Preprint at "
               r"\url{https://arxiv.org/abs/2607.15016} (2026)",
    'laine2020': r"Laine, F., Chiu, C.-Y., Tomlin, C.: Eyes-closed safety kernels: Safety of autonomous systems under "
                 r"loss of observability. In: Robotics: Science and Systems (RSS) (2020). arXiv:2005.07144",
    # ------------------------------------------------------------- hardware documentation
    'rpi_cm3': r"Raspberry Pi Ltd: Raspberry Pi Camera Module 3 (Standard, NoIR, Wide, NoIR Wide), product brief "
               r"(2024). \url{https://datasheets.raspberrypi.com/camera/camera-module-3-product-brief.pdf}",
    # ------------------------------------------------------------- estimation, attitude, solver
    'barshalom2002': r"Bar-Shalom, Y.: Update with out-of-sequence measurements in tracking: Exact solution. IEEE "
                     r"Trans. Aerosp. Electron. Syst. \textbf{38}(3), 769--777 (2002). "
                     r"\url{https://doi.org/10.1109/TAES.2002.1039398}",
    'garcia2021': r"Garc\'ia-Fern\'andez, \'A.F., Yi, W.: Continuous-discrete multiple target tracking with "
                  r"out-of-sequence measurements. IEEE Trans. Signal Process. \textbf{69}, 4699--4709 (2021)",
    'lee2011': r"Lee, T., Leok, M., McClamroch, N.H.: Control of complex maneuvers for a quadrotor UAV using geometric "
               r"methods on SE(3). Preprint at \url{https://arxiv.org/abs/1003.2005} (2011)",
    'mehrotra1992': r"Mehrotra, S.: On the implementation of a primal--dual interior point method. SIAM J. Optim. "
                    r"\textbf{2}(4), 575--601 (1992)",
}
