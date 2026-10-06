function dart_save_fig(fig, file)
%DART_SAVE_FIG Save a figure as PNG in MATLAB and Octave, then close it.
try
    if exist('exportgraphics', 'file') == 2
        exportgraphics(fig, file, 'Resolution', 130);
    else
        print(fig, file, '-dpng', '-r110');
    end
catch err
    warning('dart:plot', 'Could not save %s: %s', file, err.message);
end
close(fig);
end
