function cfg = dart_camera_preset(cfg, id)
%DART_CAMERA_PRESET Camera + depth-network input of the onboard pipeline.
%   Field-of-view and video-mode figures are from retailer specification
%   tables (the official Raspberry Pi pages were not reachable). The network
%   input keeps the sensor aspect ratio; the inference time scales with the
%   number of input pixels from 80 ms at 320 x 180 (same accelerator).
%   The camera is mounted pitched up by 'uptilt' (min(15 deg, vfov/2 - 10 deg)).
%   det_table: detection range (>= 90 % of frames) of spheres of the given
%   radius, measured with DART_EVAL_DETECTION_RANGE for each preset.
%
%   1  'v2'      Raspberry Pi Camera Module v2 (IMX219, 8 MP), 62.2 x 48.8 deg,
%                1640 x 1232 @ 41 fps -> 280 x 210 input
%   2  'cm3'     Raspberry Pi Camera Module 3 (IMX708, 12 MP), 66 x 41 deg,
%                1536 x 864 @ 120 fps -> 320 x 180 input
%   3  'cm3w'    Raspberry Pi Camera Module 3 Wide (IMX708), 102 x 67 deg,
%                1536 x 864 @ 120 fps -> 320 x 180 input        (default)
%   4  'cm3w_hr' Camera Module 3 Wide, 640 x 360 input: sharper, 4x the
%                inference time on the same accelerator
if ischar(id), id = find(strcmp(id, {'v2', 'cm3', 'cm3w', 'cm3w_hr'})); end
names = {'RPi Camera Module v2 (IMX219, 62.2x48.8 deg), 1640x1232@41fps -> 280x210', ...
    'RPi Camera Module 3 (IMX708, 66x41 deg), 1536x864@120fps -> 320x180', ...
    'RPi Camera Module 3 Wide (IMX708, 102x67 deg), 1536x864@120fps -> 320x180', ...
    'RPi Camera Module 3 Wide (IMX708, 102x67 deg), 1536x864@120fps -> 640x360'};
switch id
    case 1
        W = 280; H = 210; hfov = 62.2; fps = 41; ss = 2;
        tab = [0.5 20.0; 1.0 35.0; 2.0 40.0; 3.0 40.0];
    case 2
        W = 320; H = 180; hfov = 66; fps = 120; ss = 2;
        tab = [0.5 25.0; 1.0 35.0; 2.0 40.0; 3.0 40.0];
    case 3
        W = 320; H = 180; hfov = 102; fps = 120; ss = 2;
        tab = [0.5 10.0; 1.0 30.0; 2.0 35.0; 3.0 40.0];
    case 4
        W = 640; H = 360; hfov = 102; fps = 120; ss = 1;
        tab = [0.5 15.0; 1.0 35.0; 2.0 40.0; 3.0 40.0];
    otherwise
        error('dart:camera', 'Unknown camera preset %d', id);
end
cfg.cam.preset = id;
cfg.cam.model = names{id};
cfg.cam.W = W; cfg.cam.H = H; cfg.cam.ss = ss;
cfg.cam.hfov = hfov * pi / 180;
fpx = (W / 2) / tan(cfg.cam.hfov / 2);
vfov = 2 * atan((H / 2) / fpx);
cfg.cam.uptilt = min(15 * pi / 180, vfov / 2 - 10 * pi / 180);
u = cfg.cam.uptilt;
cfg.cam.R_BC = [cos(u) 0 -sin(u); 0 1 0; sin(u) 0 cos(u)] * [0 0 1; -1 0 0; 0 -1 0];
cfg.cam.det_table = tab;
px = W * H / (320 * 180);                      % relative number of input pixels
cfg.cam.min_px = round(12 * px);
cfg.seg.frag_px = round(16 * px);
cfg.lat.t_capture = 1 / fps;                   % readout of one frame of the video mode
cfg.lat.inf_mean = 0.080 * px;
cfg.lat.inf_min = 0.040 * px;
cfg.lat.inf_max = 0.300 * px;
cfg = dart_derive_limits(cfg);                 % the view limit depends on the vertical FOV
end
