function root = dart_setup()
%DART_SETUP Add all DART folders to the MATLAB/Octave path.
root = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(root, 'src')));
addpath(fullfile(root, 'sim'));
addpath(fullfile(root, 'simulink'));
addpath(fullfile(root, 'experiments'));
addpath(fullfile(root, 'tests'));
end
