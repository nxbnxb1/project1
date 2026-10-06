function rs = dart_rng_create(seed)
%DART_RNG_CREATE Independent random stream (MATLAB) or seeded global stream (Octave).
%   Each simulation module owns its own stream so that the MATLAB engine and
%   the Simulink model draw identical noise sequences.
if exist('RandStream') ~= 0 %#ok<EXIST>
    rs = RandStream('mt19937ar', 'Seed', seed);
else
    rand('state', seed); randn('state', seed); %#ok<RAND>
    rs = struct('seed', seed);
end
end
