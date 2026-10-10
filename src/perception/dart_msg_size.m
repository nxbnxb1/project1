function [nmax, len, grid] = dart_msg_size()
%DART_MSG_SIZE Maximum detections per message, message length and the size
%   [rows cols] of the coarse free-space depth grid carried by the message.
nmax = 96;
grid = [18 32];                      % coarse depth grid (DART_DEPTH_GRID)
len = 4 + 13 * nmax + grid(1) * grid(2);
end
