function ok = run_all_tests(pattern)
%RUN_ALL_TESTS Minimal test runner that works in MATLAB and GNU Octave.
%   ok = RUN_ALL_TESTS() runs every tests/test_*.m function. Errors if any
%   test fails (non-zero exit status in CI).
if nargin < 1, pattern = 'test_*.m'; end
here = fileparts(mfilename('fullpath'));
run(fullfile(fileparts(here), 'dart_setup.m'));
files = dir(fullfile(here, pattern));
nfail = 0;
fprintf('Running %d tests\n', numel(files));
for i = 1:numel(files)
    [~, name] = fileparts(files(i).name);
    t0 = tic;
    try
        feval(name);
        fprintf('  PASS  %-36s %6.1f s\n', name, toc(t0));
    catch err
        nfail = nfail + 1;
        fprintf('  FAIL  %-36s %6.1f s\n        %s\n', name, toc(t0), err.message);
        for k = 1:min(numel(err.stack), 4)
            fprintf('        at %s:%d\n', err.stack(k).name, err.stack(k).line);
        end
    end
end
ok = nfail == 0;
fprintf('%d passed, %d failed\n', numel(files) - nfail, nfail);
if ~ok
    error('dart:tests', '%d test(s) failed', nfail);
end
end
