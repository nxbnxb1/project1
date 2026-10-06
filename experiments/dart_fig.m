function fig = dart_fig(w, h)
%DART_FIG Invisible figure of a given size in pixels (headless CI friendly).
fig = figure('Visible', 'off', 'Color', 'w', 'Position', [50 50 w h]);
end
