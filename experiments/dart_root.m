function r = dart_root()
%DART_ROOT Repository root folder.
r = fileparts(fileparts(mfilename('fullpath')));
end
