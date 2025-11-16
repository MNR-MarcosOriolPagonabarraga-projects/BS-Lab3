function rel_powers = calculate_relative_powers(Pxx, f, bands)
    % Function to calculate relative power for all bands from a PSD matrix
    band_names = fieldnames(bands);
    num_bands = length(band_names);
    num_channels = size(Pxx, 2);
    rel_powers = struct();
    
    df = f(2) - f(1); % Frequency resolution
    total_power = sum(Pxx, 1) * df;
    total_power(total_power == 0) = 1e-10;

    for b = 1:num_bands
        band_name = band_names{b};
        band_freqs = bands.(band_name);
        
        f_indices = find(f >= band_freqs(1) & f <= band_freqs(2));
        
        if isempty(f_indices)
            band_power = zeros(1, num_channels);
        else
            band_power = sum(Pxx(f_indices, :), 1) * df;
        end
        
        rel_powers.(band_name) = (band_power ./ total_power)';
    end
end
