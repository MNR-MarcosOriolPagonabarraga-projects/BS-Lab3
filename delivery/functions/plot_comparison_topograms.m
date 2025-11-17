function plot_comparison_topograms(data_to_plot, stages, band_name, method_title, save_path)

    if nargin < 5
        save_path = '';
    end

    num_stages = length(stages);
    band_str_title = strrep(band_name, '_', ' '); 
    max_val = max(data_to_plot(:));
    limits = [0, max_val]; 

    % Create figure
    if isempty(save_path)
        h_fig = figure('Name', sprintf('%s - %s', method_title, band_str_title), ...
               'Color', 'w', ...
               'Units', 'normalized', ...
               'Position', [0.1 0.3 0.8 0.35]);
    else
        h_fig = figure('Name', sprintf('%s - %s', method_title, band_str_title), ...
               'Color', 'w', ...
               'Units', 'normalized', ...
               'Position', [0.1 0.3 0.8 0.35], ...
               'Visible', 'off');
    end
    set(h_fig, 'Color', 'w');

    % Use tiledlayout with compact spacing
    t = tiledlayout(1, num_stages);
    t.TileSpacing = 'compact';
    t.Padding     = 'compact';


    % Global title
    sgtitle(t, sprintf('%s %s Power (Max=%.3f)', method_title, band_str_title ,max_val), ...
            'FontWeight', 'bold', 'Color', '#292929', 'FontSize', 45);

    % Subplots
    for i = 1:num_stages
        ax = nexttile;
        set(ax, 'Color', 'w');
        draw_topogram(data_to_plot(:, i), limits, ax);
        title(ax, stages{i}, 'Color', '#292929', 'FontSize', 30);
    end

    % Save
    if ~isempty(save_path)
        set(h_fig, 'PaperPositionMode', 'auto');
        print(h_fig, save_path, '-dpng', '-r300');
        close(h_fig);
    end
end
