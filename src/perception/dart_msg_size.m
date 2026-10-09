function [nmax, len] = dart_msg_size()
%DART_MSG_SIZE Maximum detections per message and message length.
nmax = 96;   % SR pole forests give up to ~60 detections per frame
len = 4 + 13 * nmax;
end
