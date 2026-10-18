"""Reference list of the manuscript (Springer numbered style), one entry per key.

Rules (docs/literature/reading_list.md):
- only works read in full and actually used for a specific statement;
- the OFFICIAL published version is cited, never a preprint. Bibliographic data (venue, volume, pages, DOI) are taken
  from the Crossref record of the published version (checked 2026-10-18).
- `VERSION` records which text was read and why its content is that of the published version:
  'published'  the published version itself was read (publisher PDF, proceedings, or repository copy with the
               publisher's header);
  'accepted'   the accepted / camera-ready manuscript was read (arXiv comment or journal reference says
               accepted, to appear or published, or the version was posted after acceptance);
  'checked'    a pre-acceptance version was read and every quote of the notes was re-checked against the
               published version (docs/literature/official_versions.md).
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
                        r"Robot Learning (CoRL), PMLR \textbf{270}, 4826--4843 (2025)",
    'liu2016': r"Liu, S., Watterson, M., Tang, S., Kumar, V.: High speed navigation for quadrotors with limited "
               r"onboard sensing. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 1484--1491 (2016). "
               r"\url{https://doi.org/10.1109/ICRA.2016.7487284}",
    'hsiao2022': r"Hsiao, Y.-S., Hari, S.K.S., Filipiuk, M., Tsai, T., Sullivan, M.B., Reddi, V.J., Singh, V., "
                 r"Keckler, S.W.: Zhuyi: Perception processing rate estimation for safety in autonomous vehicles. "
                 r"In: Proc. 59th ACM/IEEE Design Autom. Conf. (DAC), pp. 289--294 (2022). "
                 r"\url{https://doi.org/10.1145/3489517.3530445}",
    'zhao2021': r"Zhao, H., Hari, S.K.S., Tsai, T., Sullivan, M.B., Keckler, S.W., Zhao, J.: Suraksha: A framework "
                r"to analyze the safety implications of perception design choices in AVs. In: Proc. IEEE 32nd Int. "
                r"Symp. Softw. Reliab. Eng. (ISSRE), pp. 434--445 (2021). "
                r"\url{https://doi.org/10.1109/ISSRE52982.2021.00052}",
    'boroujerdian2021': r"Boroujerdian, B., Ghosal, R., Cruz, J., Plancher, B., Reddi, V.J.: RoboRun: A robot "
                        r"runtime to exploit spatial heterogeneity. In: Proc. 58th ACM/IEEE Design Autom. Conf. (DAC), "
                        r"pp. 829--834 (2021). \url{https://doi.org/10.1109/DAC18074.2021.9586280}",
    'gog2022': r"Gog, I., Kalra, S., Schafhalter, P., Gonzalez, J.E., Stoica, I.: D3: A dynamic deadline-driven "
               r"approach for building autonomous vehicles. In: Proc. 17th Eur. Conf. Comput. Syst. (EuroSys), "
               r"pp. 453--471 (2022). \url{https://doi.org/10.1145/3492321.3519576}",
    'pant2021': r"Pant, Y.V., Abbas, H., Mohta, K., Quaye, R.A., Nghiem, T.X., Devietti, J., Mangharam, R.: Anytime "
                r"computation and control for autonomous systems. IEEE Trans. Control Syst. Technol. "
                r"\textbf{29}(2), 768--779 (2021). \url{https://doi.org/10.1109/TCST.2020.2979388}",
    'aldana2023': r"Aldana-L\'opez, R., Arag\"u\'es, R., Sag\"u\'es, C.: Latency vs precision: Stability preserving "
                  r"perception scheduling. Automatica \textbf{155}, 111123 (2023). "
                  r"\url{https://doi.org/10.1016/j.automatica.2023.111123}",
    'huang2020': r"Huang, C., Xu, S., Wang, Z., Lan, S., Li, W., Zhu, Q.: Opportunistic intermittent control with "
                 r"safety guarantees for autonomous systems. In: Proc. 57th ACM/IEEE Design Autom. Conf. (DAC), "
                 r"pp. 1--6 (2020). \url{https://doi.org/10.1109/DAC18072.2020.9218742}",
    # ------------------------------------------------------------- monocular depth
    'ranftl2020': r"Ranftl, R., Lasinger, K., Hafner, D., Schindler, K., Koltun, V.: Towards robust monocular depth "
                  r"estimation: Mixing datasets for zero-shot cross-dataset transfer. IEEE Trans. Pattern Anal. Mach. "
                  r"Intell. \textbf{44}(3), 1623--1637 (2022). \url{https://doi.org/10.1109/TPAMI.2020.3019967}",
    'yang2024a': r"Yang, L., Kang, B., Huang, Z., Xu, X., Feng, J., Zhao, H.: Depth Anything: Unleashing the power of "
                 r"large-scale unlabeled data. In: Proc. IEEE/CVF Conf. Comput. Vis. Pattern Recognit. (CVPR), "
                 r"pp. 10371--10381 (2024). \url{https://doi.org/10.1109/CVPR52733.2024.00987}",
    'yang2024b': r"Yang, L., Kang, B., Huang, Z., Zhao, Z., Xu, X., Feng, J., Zhao, H.: Depth Anything V2. In: Adv. "
                 r"Neural Inf. Process. Syst. (NeurIPS) \textbf{37}, 21875--21911 (2024). "
                 r"\url{https://doi.org/10.52202/079017-0688}",
    'wofk2019': r"Wofk, D., Ma, F., Yang, T.-J., Karaman, S., Sze, V.: FastDepth: Fast monocular depth estimation on "
                r"embedded systems. In: Proc. Int. Conf. Robot. Autom. (ICRA), pp. 6101--6108 (2019). "
                r"\url{https://doi.org/10.1109/ICRA.2019.8794182}",
    'simon2023': r"Simon, N., Majumdar, A.: MonoNav: MAV navigation via monocular depth estimation and "
                 r"reconstruction. In: Ang Jr, M.H., Khatib, O. (eds.) Experimental Robotics (ISER 2023). Springer "
                 r"Proc. Adv. Robot., pp. 415--426. Springer, Cham (2024). "
                 r"\url{https://doi.org/10.1007/978-3-031-63596-0_37}",
    # ------------------------------------------------------------- planning in unknown space, observed free space
    'zhou2019': r"Zhou, B., Gao, F., Wang, L., Liu, C., Shen, S.: Robust and efficient quadrotor trajectory "
                r"generation for fast autonomous flight. IEEE Robot. Autom. Lett. \textbf{4}(4), 3529--3536 (2019). "
                r"\url{https://doi.org/10.1109/LRA.2019.2927938}",
    'zhou2021': r"Zhou, B., Pan, J., Gao, F., Shen, S.: RAPTOR: Robust and perception-aware trajectory replanning "
                r"for quadrotor fast flight. IEEE Trans. Robot. \textbf{37}(6), 1992--2009 (2021). "
                r"\url{https://doi.org/10.1109/TRO.2021.3071527}",
    'tordesillas2021': r"Tordesillas, J., Lopez, B.T., Everett, M., How, J.P.: FASTER: Fast and safe trajectory "
                       r"planner for navigation in unknown environments. IEEE Trans. Robot. \textbf{38}(2), 922--938 "
                       r"(2022). \url{https://doi.org/10.1109/TRO.2021.3100142}",
    'florence2018': r"Florence, P.R., Carter, J., Ware, J., Tedrake, R.: NanoMap: Fast, uncertainty-aware proximity "
                    r"queries with lazy search over local 3D data. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), "
                    r"pp. 7631--7638 (2018). \url{https://doi.org/10.1109/ICRA.2018.8463195}",
    'falanga2018': r"Falanga, D., Foehn, P., Lu, P., Scaramuzza, D.: PAMPC: Perception-aware model predictive control "
                   r"for quadrotors. In: Proc. IEEE/RSJ Int. Conf. Intell. Robots Syst. (IROS), pp. 1--8 (2018). "
                   r"\url{https://doi.org/10.1109/IROS.2018.8593739}",
    'zhu2019': r"Zhu, H., Alonso-Mora, J.: Chance-constrained collision avoidance for MAVs in dynamic environments. "
               r"IEEE Robot. Autom. Lett. \textbf{4}(2), 776--783 (2019). "
               r"\url{https://doi.org/10.1109/LRA.2019.2893494}",
    'lin2020': r"Lin, J., Zhu, H., Alonso-Mora, J.: Robust vision-based obstacle avoidance for micro aerial vehicles "
               r"in dynamic environments. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 2682--2688 (2020). "
               r"\url{https://doi.org/10.1109/ICRA40945.2020.9197481}",
    # ------------------------------------------------------------- CBF, sampling, delay, uncertainty
    'ames2017': r"Ames, A.D., Xu, X., Grizzle, J.W., Tabuada, P.: Control barrier function based quadratic programs "
                r"for safety critical systems. IEEE Trans. Autom. Control \textbf{62}(8), 3861--3876 (2017). "
                r"\url{https://doi.org/10.1109/TAC.2016.2638961}",
    'ames2019': r"Ames, A.D., Coogan, S., Egerstedt, M., Notomista, G., Sreenath, K., Tabuada, P.: Control barrier "
                r"functions: Theory and applications. In: Proc. 18th Eur. Control Conf. (ECC), pp. 3420--3431 (2019). "
                r"\url{https://doi.org/10.23919/ECC.2019.8796030}",
    'xiao2019': r"Xiao, W., Belta, C.: Control barrier functions for systems with high relative degree. In: Proc. "
                r"IEEE 58th Conf. Decis. Control (CDC), pp. 474--479 (2019). "
                r"\url{https://doi.org/10.1109/CDC40024.2019.9029455}",
    'wang2017': r"Wang, L., Ames, A.D., Egerstedt, M.: Safety barrier certificates for collisions-free multirobot "
                r"systems. IEEE Trans. Robot. \textbf{33}(3), 661--674 (2017). "
                r"\url{https://doi.org/10.1109/TRO.2017.2659727}",
    'zeng2021': r"Zeng, J., Zhang, B., Sreenath, K.: Safety-critical model predictive control with discrete-time "
                r"control barrier function. In: Proc. Am. Control Conf. (ACC), pp. 3882--3889 (2021). "
                r"\url{https://doi.org/10.23919/ACC50511.2021.9483029}",
    'rosolia2020': r"Rosolia, U., Ames, A.D.: Multi-rate control design leveraging control barrier functions and "
                   r"model predictive control policies. IEEE Control Syst. Lett. \textbf{5}(3), 1007--1012 (2021). "
                   r"\url{https://doi.org/10.1109/LCSYS.2020.3008326}",
    'breeden2022': r"Breeden, J., Garg, K., Panagou, D.: Control barrier functions in sampled-data systems. IEEE "
                   r"Control Syst. Lett. \textbf{6}, 367--372 (2022). \url{https://doi.org/10.1109/LCSYS.2021.3076127}",
    'bahati2024': r"Bahati, G., Ong, P., Ames, A.D.: Sample-and-hold safety with control barrier functions. In: Proc. "
                  r"Am. Control Conf. (ACC), pp. 5169--5176 (2024). "
                  r"\url{https://doi.org/10.23919/ACC60939.2024.10645060}",
    'molnar2022': r"Molnar, T.G., Kiss, A.K., Ames, A.D., Orosz, G.: Safety-critical control with input delay in "
                  r"dynamic environment. IEEE Trans. Control Syst. Technol. \textbf{31}(4), 1507--1520 (2023). "
                  r"\url{https://doi.org/10.1109/TCST.2022.3227451}",
    'taylor2020': r"Taylor, A.J., Ong, P., Cort\'es, J., Ames, A.D.: Safety-critical event triggered control via "
                  r"input-to-state safe barrier functions. IEEE Control Syst. Lett. \textbf{5}(3), 749--754 (2021). "
                  r"\url{https://doi.org/10.1109/LCSYS.2020.3005101}",
    'yang2019': r"Yang, G., Belta, C., Tron, R.: Self-triggered control for safety critical systems using control "
                r"barrier functions. In: Proc. Am. Control Conf. (ACC), pp. 4454--4459 (2019). "
                r"\url{https://doi.org/10.23919/ACC.2019.8814657}",
    'dean2021': r"Dean, S., Taylor, A.J., Cosner, R.K., Recht, B., Ames, A.D.: Guaranteeing safety of learned "
                r"perception modules via measurement-robust control barrier functions. In: Proc. 2020 Conf. Robot "
                r"Learning (CoRL), PMLR \textbf{155}, 654--670 (2021)",
    'yang2023': r"Yang, S., Pappas, G.J., Mangharam, R., Lindemann, L.: Safe perception-based control under "
                r"stochastic sensor uncertainty using conformal prediction. In: Proc. 62nd IEEE Conf. Decis. Control "
                r"(CDC), pp. 6072--6078 (2023). \url{https://doi.org/10.1109/CDC49753.2023.10384075}",
    'yaghoubi2021': r"Yaghoubi, S., Fainekos, G., Yamaguchi, T., Prokhorov, D., Hoxha, B.: Risk-bounded control with "
                    r"Kalman filtering and stochastic barrier functions. In: Proc. 60th IEEE Conf. Decis. Control "
                    r"(CDC), pp. 5213--5219 (2021). \url{https://doi.org/10.1109/CDC45484.2021.9683756}",
    'misyats2025': r"Misyats, M., Harms, M., Nissov, M., Jacquet, M., Alexis, K.: Embedded safe reactive navigation for "
                   r"multirotors systems using control barrier functions. In: Proc. Int. Conf. Unmanned Aircr. Syst. "
                   r"(ICUAS), pp. 697--704 (2025). \url{https://doi.org/10.1109/ICUAS65942.2025.11007827}",
    'laine2020': r"Laine, F., Chiu, C.-Y., Tomlin, C.: Eyes-closed safety kernels: Safety of autonomous systems under "
                 r"loss of observability. In: Robotics: Science and Systems XVI (2020). "
                 r"\url{https://doi.org/10.15607/RSS.2020.XVI.096}",
    # ------------------------------------------------------------- hardware documentation
    'rpi_cm3': r"Raspberry Pi Ltd: Raspberry Pi Camera Module 3 (Standard, NoIR, Wide, NoIR Wide), product brief "
               r"(2024). \url{https://datasheets.raspberrypi.com/camera/camera-module-3-product-brief.pdf}. "
               r"Accessed 18 October 2026",
    'rpi_doc': r"Raspberry Pi Ltd: Camera (Raspberry Pi documentation, hardware specifications). "
               r"\url{https://www.raspberrypi.com/documentation/accessories/camera.html} (2026). "
               r"Accessed 18 October 2026",
    # ------------------------------------------------------------- estimation, solver
    'barshalom2002': r"Bar-Shalom, Y.: Update with out-of-sequence measurements in tracking: Exact solution. IEEE "
                     r"Trans. Aerosp. Electron. Syst. \textbf{38}(3), 769--777 (2002). "
                     r"\url{https://doi.org/10.1109/TAES.2002.1039398}",
    'garcia2021': r"Garc\'ia-Fern\'andez, \'A.F., Yi, W.: Continuous-discrete multiple target tracking with "
                  r"out-of-sequence measurements. IEEE Trans. Signal Process. \textbf{69}, 4699--4709 (2021). "
                  r"\url{https://doi.org/10.1109/TSP.2021.3100999}",
    'lee2010': r"Lee, T., Leok, M., McClamroch, N.H.: Geometric tracking control of a quadrotor UAV on SE(3). In: "
               r"Proc. 49th IEEE Conf. Decis. Control (CDC), pp. 5420--5425 (2010). "
               r"\url{https://doi.org/10.1109/CDC.2010.5717652}",
    'mehrotra1992': r"Mehrotra, S.: On the implementation of a primal--dual interior point method. SIAM J. Optim. "
                    r"\textbf{2}(4), 575--601 (1992). \url{https://doi.org/10.1137/0802028}",
}

# Text read for each entry and why it equals the published version (see the module docstring).
VERSION = {
    'falanga2019': 'accepted (authors\' copy, "Accepted January, 2019")',
    'loquercio2021': 'accepted (arXiv v1, journal ref Science Robotics)',
    'bhattacharya2024': 'checked (PMLR 270 PDF: all 7 note quotes found)',
    'liu2016': 'published (user-supplied IEEE PDF)',
    'hsiao2022': 'accepted (arXiv v1, camera-ready for DAC 2022)',
    'zhao2021': 'published (authors\' copy of the ISSRE paper)',
    'boroujerdian2021': 'accepted (arXiv v1, "will be published in DAC 2021")',
    'gog2022': 'published (user-supplied ACM PDF)',
    'pant2021': 'published (user-supplied IEEE PDF)',
    'aldana2023': 'accepted (arXiv v1, "accepted version of an already published manuscript")',
    'huang2020': 'accepted (arXiv v1, "Accepted by DAC 2020")',
    'ranftl2020': 'accepted (arXiv v3, "To appear in TPAMI (accepted August 2020)")',
    'yang2024a': 'checked (CVF open-access CVPR PDF: claims used are present; 3 quotes differ only in reference numbers or are in the supplement)',
    'yang2024b': 'checked (NeurIPS proceedings PDF: all 14 note quotes found)',
    'wofk2019': 'accepted (arXiv v1, "Accepted for presentation at ICRA 2019")',
    'simon2023': 'accepted (arXiv v1, version presented at ISER 2023)',
    'zhou2019': 'accepted (arXiv v2, "ACCEPTED JUNE, 2019")',
    'tordesillas2021': 'accepted (arXiv v2, "accepted for publication in IEEE T-RO")',
    'florence2018': 'accepted (arXiv v1, "To Appear at ICRA 2018")',
    'falanga2018': 'accepted (arXiv v2, journal ref IROS 2018)',
    'zhu2019': 'published (final published version, TU Delft repository)',
    'lin2020': 'accepted (arXiv v2, "to be published in ICRA 2020")',
    'ames2017': 'accepted (arXiv v2, Dec 2016, DOI of the TAC paper)',
    'ames2019': 'checked (ECC 2019 copy hosted by a co-author: claims used are present)',
    'xiao2019': 'checked (CDC 2019 PDF with the IEEE header: claims used are present; quotes differ only in definition numbers)',
    'wang2017': 'published (user-supplied IEEE PDF)',
    'zeng2021': 'accepted (arXiv v3, 23 Mar 2021, final ACC 2021 version)',
    'rosolia2020': 'accepted (arXiv v4, 6 Jul 2020, published in L-CSS)',
    'breeden2022': 'accepted (arXiv v2, "Published in IEEE Control Systems Letters")',
    'bahati2024': 'checked (ACC 2024 PDF with the conference header: claims used are present)',
    'molnar2022': 'accepted (arXiv v2, "Accepted to the IEEE TCST")',
    'taylor2020': 'checked (published L-CSS PDF from NSF PAR: claims used are present)',
    'yang2019': 'checked (ACC 2019 PDF with the conference header: claims used are present)',
    'dean2021': 'checked (PMLR 155 PDF: claims used are present)',
    'yang2023': 'accepted (arXiv v2, "accepted by IEEE CDC 2023")',
    'yaghoubi2021': 'accepted (arXiv v1, CDC 2021 paper)',
    'misyats2025': 'accepted (arXiv v1, "accepted for publication at ICUAS 2025")',
    'laine2020': 'checked (RSS proceedings PDF: claims used are present)',
    'rpi_cm3': 'published (manufacturer document)',
    'rpi_doc': 'published (manufacturer documentation page; full text supplied by the user)',
    'barshalom2002': 'published (user-supplied IEEE PDF)',
    'garcia2021': 'accepted (arXiv v2, journal ref IEEE TSP 69)',
    'zhou2021': 'published (user-supplied IEEE PDF)',
    'lee2010': 'published (user-supplied IEEE PDF)',
    'mehrotra1992': 'published (user-supplied SIAM PDF)',
}
assert set(VERSION) == set(REFS)
