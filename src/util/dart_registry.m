function out = dart_registry(cmd, key, value)
%DART_REGISTRY Process-wide key/value store used to hand configuration
%   structs to the MATLAB System blocks of the Simulink model.
%
%   dart_registry('set', key, value)   store
%   v = dart_registry('get', key)      retrieve (error if missing)
%   dart_registry('clear')             remove everything
persistent store
if isempty(store)
    store = struct();
end
out = [];
switch cmd
    case 'set'
        store.(key) = value;
    case 'get'
        if ~isfield(store, key)
            error('dart:registry', 'Registry key "%s" is not set. Call dart_registry(''set'', ...) before simulating.', key);
        end
        out = store.(key);
    case 'has'
        out = isfield(store, key);
    case 'clear'
        store = struct();
    otherwise
        error('dart:registry', 'Unknown command %s', cmd);
end
end
