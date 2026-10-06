function [nmax, len] = dart_msg_size()
%DART_MSG_SIZE Maximum detections per message and message length.
nmax = 24;
len = 4 + 13 * nmax;
end
